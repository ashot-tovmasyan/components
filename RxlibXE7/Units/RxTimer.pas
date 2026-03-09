{*******************************************************}
{                                                       }
{         Delphi VCL Extensions (RX)                    }
{                                                       }
{         Copyright (c) 1996 AO ROSNO                   }
{         Copyright (c) 1997, 1998 Master-Bank          }
{                                                       }
{*******************************************************}

unit RxTimer;

interface

{$I RX.INC}

uses {$IFDEF WIN32} Windows, {$ELSE} WinTypes, WinProcs, {$ENDIF}
  Messages, SysUtils, Classes, Controls;

type

{ TRxTimer }

  TRxTimer = class(TComponent)
  private
    FEnabled: Boolean;
    FInterval: Cardinal;
    FOnTimer: TNotifyEvent;
    FWindowHandle: HWND;
{$IFDEF WIN32}
    FSyncEvent: Boolean;
    FThreaded: Boolean;
    FTimerThread: TThread;
    FThreadPriority: TThreadPriority;
    FResetRequest: Boolean;
    procedure SetThreaded(Value: Boolean);
    procedure SetThreadPriority(Value: TThreadPriority);
{$ENDIF}
    procedure SetEnabled(Value: Boolean);
    procedure SetInterval(Value: Cardinal);
    procedure SetOnTimer(Value: TNotifyEvent);
    procedure UpdateTimer;
    procedure WndProc(var Msg: TMessage);
  protected
    procedure Timer; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Reset(TimerDisable: Boolean);
{$IFDEF WIN32}
    procedure Synchronize(Method: TThreadMethod);
{$ENDIF}
  published
    property Enabled: Boolean read FEnabled write SetEnabled default True;
    property Interval: Cardinal read FInterval write SetInterval default 1000;
{$IFDEF WIN32}
    property SyncEvent: Boolean read FSyncEvent write FSyncEvent default True;
    property Threaded: Boolean read FThreaded write SetThreaded default True;
    property ThreadPriority: TThreadPriority read FThreadPriority write
      SetThreadPriority default tpNormal;
{$ENDIF}
    property OnTimer: TNotifyEvent read FOnTimer write SetOnTimer;
  end;

implementation

uses Forms, Consts, VCLUtils, SyncObjs;

{$IFDEF WIN32}

{ TTimerThread }

type
  TTimerThread = class(TThread)
  private
    FOwner: TRxTimer;
    FException: Exception;
    FEnabled: Boolean;
    FInterval: Cardinal;
    FRestart: Boolean;
    FChange: TCriticalSection;
    FChanged: TEvent;
    procedure HandleException;
  protected
    procedure Execute; override;
  public
    constructor Create(Timer: TRxTimer; CreateSuspended: Boolean);
    destructor Destroy; override;
    procedure Terminate;
    procedure Change(AEnabled: Boolean; AInterval: Cardinal; ARestart: Boolean);
  end;

constructor TTimerThread.Create(Timer: TRxTimer; CreateSuspended: Boolean);
begin
  FOwner := Timer;
  FChange := TCriticalSection.Create;
  FChanged := TEvent.Create(Nil, true, false, '');
  Change(False, Timer.Interval, False);
  inherited Create(CreateSuspended);
end;

destructor TTimerThread.Destroy;
begin
  inherited;
  FChange.Free;
  FChanged.Free;
end;

procedure TTimerThread.Terminate;
begin
  inherited;
  FChanged.SetEvent;
end;

procedure TTimerThread.HandleException;
begin
  if not (FException is EAbort) then begin
    if Assigned(Application.OnException) then
      Application.OnException(Self, FException)
    else
      Application.ShowException(FException);
  end;
end;

procedure TTimerThread.Change(AEnabled: Boolean; AInterval: Cardinal; ARestart: Boolean);
begin
  FChange.Enter;
  try
    if (FEnabled = AEnabled) and (FInterval = AInterval) and (FRestart = ARestart) then
      Exit;
    FEnabled := AEnabled;
    FInterval := AInterval;
    FRestart := ARestart;
  finally
    FChange.Leave;
  end;
  FChanged.SetEvent;
end;

procedure TTimerThread.Execute;

  function ThreadClosed: Boolean;
  begin
    Result := Terminated or Application.Terminated;
  end;

var
  TimerChanged: Boolean;
  TimerInterval: Cardinal;
  WaitInterval: Cardinal;
  WaitStartTick: Cardinal;
  WaitedInterval: Cardinal;
  Interval: Cardinal;
begin
  TimerInterval := 0;
  WaitedInterval := 0;
  TimerChanged := True;
  while not ThreadClosed do begin
    // Read current settings if it is changed or yet not initialized
    if TimerChanged then begin
      FChange.Enter;
      try
        if FEnabled then
          TimerInterval := FInterval
        else
          TimerInterval := INFINITE;
        // Check restart
        if FRestart then begin
          WaitedInterval := 0;
          FRestart := False;
        end;
        // Settings updated
        FChanged.ResetEvent;
      finally
        FChange.Leave;
      end;
      // TimerChanged := False; // It always updates in code below
    end;
    // Calculate the remaining waiting time
    WaitInterval := TimerInterval;
    if WaitInterval <> INFINITE then
      if WaitedInterval < WaitInterval then
        Dec(WaitInterval, WaitedInterval)
      else
        WaitInterval := 0;
    // Fix tick count to save waited period if waiting will be aborted
    WaitStartTick := GetTickCount;
    if (WaitInterval = 0) or
      (WaitForSingleObject(FChanged.Handle, WaitInterval) = WAIT_TIMEOUT) then
    begin
      if ThreadClosed then
        Break;
      WaitedInterval := 0;
      if FOwner.SyncEvent then
        Synchronize(FOwner.Timer)
      else
        try
          FOwner.Timer;
        except
          on E: Exception do begin
            FException := E;
            try
              HandleException;
            except
            end;
            FException := Nil;
          end;
        end;
      // Check that in FOwner.Timer setting was changed.
      TimerChanged := (WaitForSingleObject(FChanged.Handle, 0) = WAIT_OBJECT_0);
    end else begin
      // Settings changed asynchronously. Update already waited period.
      // The condition (WaitInterval <> INFINITE) lets ignore wait period in
      // Disabled state. This behavior differs from the previously used
      // thread suspend/resume where resumed thread always include
      // suspended time in wait interval.
      if WaitInterval <> INFINITE then begin
        Interval := GetTickCount;
        if Interval >= WaitStartTick then
          Dec(Interval, WaitStartTick)
        else
          // Cardinal overflow
          Inc(Interval, High(Cardinal) - WaitStartTick + 1);
        Inc(WaitedInterval, Interval);
      end;
      TimerChanged := True;
    end;
  end;
end;

{$ENDIF}

{ TRxTimer }

constructor TRxTimer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FEnabled := True;
  FInterval := 1000;
{$IFDEF WIN32}
  FSyncEvent := True;
  FThreaded := True;
  FThreadPriority := tpNormal;
  FTimerThread := TTimerThread.Create(Self, False);
{$ELSE}
  FWindowHandle := AllocateHWnd(WndProc);
{$ENDIF}
end;

destructor TRxTimer.Destroy;
begin
{$IFDEF WIN32}
  TTimerThread(FTimerThread).Terminate;
{$ENDIF}
  Destroying;
  FEnabled := False;
  FOnTimer := nil;
{$IFDEF WIN32}
  FTimerThread.Free;
  if FWindowHandle <> 0 then begin
{$ENDIF}
    KillTimer(FWindowHandle, 1);
    DeallocateHWnd(FWindowHandle);
{$IFDEF WIN32}
  end;
{$ENDIF}
  inherited Destroy;
end;

procedure TRxTimer.WndProc(var Msg: TMessage);
begin
  with Msg do
    if Msg = WM_TIMER then
      try
        Timer;
      except
        Application.HandleException(Self);
      end
    else Result := DefWindowProc(FWindowHandle, Msg, wParam, lParam);
end;

procedure TRxTimer.UpdateTimer;
var
  TimerEnabled: Boolean;
begin
  TimerEnabled := (FInterval <> 0) and FEnabled and Assigned(FOnTimer);
{$IFDEF WIN32}
  if FThreaded then begin
    if FWindowHandle <> 0 then begin
      KillTimer(FWindowHandle, 1);
      DeallocateHWnd(FWindowHandle);
      FWindowHandle := 0;
    end;
    TTimerThread(FTimerThread).Change(TimerEnabled, FInterval, FResetRequest);
    if TimerEnabled then
      FTimerThread.Priority := FThreadPriority;
  end
  else begin
    TTimerThread(FTimerThread).Change(False, FInterval, True);
    if FWindowHandle = 0 then FWindowHandle := AllocateHWnd(WndProc)
    else KillTimer(FWindowHandle, 1);
    if TimerEnabled and (SetTimer(FWindowHandle, 1, FInterval, nil) = 0) then
      raise EOutOfResources.Create(ResStr(SNoTimers));
  end;
{$ELSE}
  KillTimer(FWindowHandle, 1);
  if TimerEnabled and (SetTimer(FWindowHandle, 1, FInterval, nil) = 0) then
    raise EOutOfResources.Create(ResStr(SNoTimers));
{$ENDIF}
end;

procedure TRxTimer.SetEnabled(Value: Boolean);
begin
  if Value <> FEnabled then begin
    FEnabled := Value;
    UpdateTimer;
  end;
end;

procedure TRxTimer.SetInterval(Value: Cardinal);
begin
  if Value <> FInterval then begin
    FInterval := Value;
    UpdateTimer;
  end;
end;

{$IFDEF WIN32}

procedure TRxTimer.SetThreaded(Value: Boolean);
begin
  if Value <> FThreaded then begin
    FThreaded := Value;
    UpdateTimer;
  end;
end;

procedure TRxTimer.SetThreadPriority(Value: TThreadPriority);
begin
  if Value <> FThreadPriority then begin
    FThreadPriority := Value;
    if FThreaded then UpdateTimer;
  end;
end;

procedure TRxTimer.Synchronize(Method: TThreadMethod);
begin
  if (FTimerThread <> nil) and (GetCurrentThreadID <> MainThreadID) then
    TTimerThread(FTimerThread).Synchronize(Method)
  else
    Method;
end;

{$ENDIF}

procedure TRxTimer.Reset(TimerDisable: Boolean);
begin
{$IFDEF WIN32}
  FResetRequest := True;
  try
{$ENDIF}
    if TimerDisable then
      FEnabled := False;
    UpdateTimer;
{$IFDEF WIN32}
  finally
    FResetRequest := False;
  end;
{$ENDIF}
end;

procedure TRxTimer.SetOnTimer(Value: TNotifyEvent);
begin
  if Assigned(FOnTimer) <> Assigned(Value) then begin
    FOnTimer := Value;
    UpdateTimer;
  end else FOnTimer := Value;
end;

procedure TRxTimer.Timer;
begin
  if FEnabled and not (csDestroying in ComponentState) and
    Assigned(FOnTimer) then FOnTimer(Self);
end;

end.