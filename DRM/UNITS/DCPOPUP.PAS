{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit dcPopup;

interface
{$I dc.inc}
uses
  Windows, Forms, Controls, StdCtrls, ExtCtrls, Messages, Classes, Buttons;

type

{*** TDCPopupWindow *************************************************}

  TCloseUpEvent = procedure (Sender: TObject; Accept: Boolean) of object;

  TDCPopupWindow = class({$IFDEF D3}TCustomForm{$ELSE}TForm{$ENDIF})
  private
    FCloseUp: TCloseUpEvent;
    FBottomPanel: TPanel;
    FCloseBtn: TSpeedButton;
    FSizeGrip: TImage;
    FControl: TControl;

    InSizing: Boolean;
    StartW, StartH: integer;

    procedure CancelBtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure FSizeGripMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FSizeGripMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure FSizeGripMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    function AppHook(var Msg: TMessage): Boolean;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure PopupKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PopupMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CloseUp(Accept: Boolean); virtual;

    property OnCloseUp: TCloseUpEvent read FCloseUp write FCloseUp;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure PopupShow(Origin: TPoint);
    procedure PopupHide(Result: TModalResult);
    property Control: TControl read FControl write FControl;
  end;

{*** Global function ************************************************}

function SizeablePopup(AControl: TControl; AParent: TWinControl;
  X, Y: integer; Sizeable: Boolean {$IFDEF D4}= True{$ENDIF}): Boolean;

implementation

uses Graphics;

{$R *.res}

type
  T_Control = class(TControl)
  end;

const LineHeight = 14; TheMinWidth = 50; TheMinHeight = 40;

{*** Global function ************************************************}

function SizeablePopup(AControl: TControl; AParent: TWinControl;
  X, Y: integer; Sizeable: Boolean {$IFDEF D4}= True{$ENDIF}): Boolean;
var dcSP: TDCPopupWindow;
    SaveParent: TWinControl;
    SaveVisible: Boolean;
    {$IFDEF D4}
    SaveAutoSize: Boolean;
    {$ENDIF}
    SaveAlign: TAlign;
    SaveLeft, SaveTop, SaveWidth, SaveHeight: integer;
    SaveOnDblClick: TNotifyEvent;
begin
  SaveParent := nil;
  SaveVisible := False;
  {$IFDEF D4}
  SaveAutoSize := False;
  {$ENDIF}
  SaveAlign := alNone;
  SaveLeft := 0;
  SaveTop := 0;
  SaveWidth := 0;
  SaveHeight := 0;
  SaveOnDblClick := nil;
  dcSP := TDCPopupWindow.Create(nil);
  with dcSP do
  try
    Control := AControl;
    if Assigned(Control) then
    with T_Control(Control) do
    begin
      SaveParent := Parent;
      SaveVisible := Visible;
      {$IFDEF D4}
      SaveAutoSize := AutoSize;
      {$ENDIF}
      SaveAlign := Align;
      SaveLeft := Left;
      SaveTop := Top;
      SaveWidth := Width;
      SaveHeight := Height;
      SaveOnDblClick := OnDblClick;

      dcSP.ClientWidth := Width;
      dcSP.ClientHeight := Height;
      dcSP.FBottomPanel.Visible := Sizeable;
      if Sizeable then
        dcSP.ClientHeight := dcSP.ClientHeight + dcSP.FBottomPanel.Height;
      Visible := False;
      {$IFDEF D4}
      AutoSize := False;
      {$ENDIF}
      Align := alClient;
      OnDblClick := OKBtnClick;
      Parent := dcSP;
      Visible := True;
    end
    else
      SetBounds(Left, Top, TheMinWidth, TheMinHeight);
    try
      PopupShow(AParent.ClientToScreen(Point(X, Y)));
      Result := ModalResult = mrOK;
    finally
      if Assigned(Control) then
      with Control do
      begin
        {$IFDEF D4}
        AutoSize := SaveAutoSize;
        {$ENDIF}
        Align := SaveAlign;
        SetBounds(SaveLeft, SaveTop, SaveWidth, SaveHeight);
        OnDblClick := SaveOnDblClick;
        Parent := SaveParent;
        Visible := SaveVisible;
      end;
      Control := nil;
    end;
  finally
    Free;
  end;
end;

{*** Hooks **********************************************************}

var WHook: HHook;
    dcPW: TDCPopupWindow;

function CallWndProcHook(nCode: integer; wParam: Longint;
  var mhs: TMouseHookStruct): longint; stdcall;
var rp: TRect;
    Wnd: HWND;
    Found: Boolean;
begin
  Found := True;
  with dcPW do
    if Visible then
    begin
      GetWindowRect(Handle, rp);
      if (((wParam = WM_LBUTTONDOWN) or (wParam = WM_LBUTTONUP)
        or (wParam = WM_NCLBUTTONDOWN) or (wParam = WM_NCLBUTTONUP))) and
        not PtInRect(rp, mhs.pt) then
        begin
          Wnd := WindowFromPoint(mhs.pt);
          Found := False;
          while Wnd <> 0 do
          begin
            if Handle = Wnd then
            begin
              Found := True;
              break;
            end;
            Wnd := GetParent(Wnd);
          end;
          if not Found then
            PopupHide(mrCancel);
        end;
    end;
  if Found then
    Result := CallNextHookEx(WHook, nCode, wParam, Longint(@mhs))
  else
    Result := 1;
end;

{*** TDCPopupWindow *************************************************}

function TDCPopupWindow.AppHook(var Msg: TMessage): Boolean;
begin
  Result := Msg.Msg = CM_DEACTIVATE;
  if Result then
    PopupHide(mrCancel);
  inherited;
end;

constructor TDCPopupWindow.Create(AOwner: TComponent);
begin
  inherited CreateNew(AOwner{$IFDEF CPB1}, 0{$ENDIF});
  AutoScroll := False;
  KeyPreview := True;
  Visible := False;
  OnKeyDown := PopupKeyDown;
  OnMouseUp := PopupMouseUp;
  InSizing := False;
  FControl := nil;
  FBottomPanel := TPanel.Create(Self);
  with FBottomPanel do
  begin
    Parent := Self;
    Height := LineHeight + 5;
    Align := alBottom;
    BevelOuter := bvLowered;
    {$IFDEF D3}
    FullRepaint := False;
    {$ENDIF}
    Caption := '';
  end;
  FCloseBtn := TSpeedButton.Create(Self);
  with FCloseBtn do
  begin
    Parent := FBottomPanel;
    Width := LineHeight + 3;
    Align := alLeft;
    {$IFDEF D3}
    Flat := True;
    {$ENDIF}
    Glyph.Handle := LoadBitmap(HInstance,PChar(101)); //!
    OnClick := CancelBtnClick;
  end;
  FSizeGrip := TImage.Create(Self);
  with FSizeGrip do
  begin
    Parent := FBottomPanel;
    Width := LineHeight + 3;
    Align := alRight;
    Picture.Bitmap.Handle := LoadBitmap(0,PChar({$IFDEF D3}OBM_SIZE{$ELSE}32766{$ENDIF}));
    Cursor := crSizeNWSE;
    OnMouseDown := FSizeGripMouseDown;
    OnMouseMove := FSizeGripMousemove;
    OnMouseUp := FSizeGripMouseUp;
  end;
end;

procedure TDCPopupWindow.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do begin
    Style := WS_POPUP or WS_BORDER or WS_CLIPCHILDREN;
    ExStyle := WS_EX_TOOLWINDOW;
    WindowClass.Style := WindowClass.Style or CS_SAVEBITS;
  end;
end;

procedure TDCPopupWindow.PopupKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_RETURN: PopupHide(mrOK);
      VK_ESCAPE: PopupHide(mrCancel);
    end;
end;

procedure TDCPopupWindow.PopupMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    CloseUp(PtInRect(Self.ClientRect, Point(X, Y)));
end;

procedure TDCPopupWindow.CloseUp(Accept: Boolean);
begin
  if Assigned(FCloseUp) then
    FCloseUp(Self, Accept);
end;

procedure TDCPopupWindow.PopupHide(Result: TModalResult);
begin
  if Visible then
  begin
    if TControl(FControl) is TWinControl then
      SendMessage(TWinControl(FControl).Handle, WM_KILLFOCUS, 0, 0);
    Application.UnhookMainWindow(AppHook);
    UnhookWindowsHookEx(WHook);
    ModalResult := Result;
  end;
end;

procedure TDCPopupWindow.PopupShow(Origin: TPoint);
var
  rcWork: TRect;
begin
  if not Visible then
  begin
    dcPW := Self;
    WHook := SetWindowsHookEx(WH_MOUSE, @CallWndProcHook, 0, GetCurrentThreadId);
    Application.HookMainWindow(AppHook);
    with Origin, rcWork do
    begin
      SystemParametersInfo(SPI_GETWORKAREA, 0, @rcWork, 0);
      if X < Left then X := Left;
      if Y < Top then Y := Top;
      if X > Right - Width then X := Right - Width;
      if Y > Bottom - Height then Y := Bottom - Height;
    end;
    SetBounds(Origin.x, Origin.Y, Width, Height);
    ShowModal;
  end;
end;

destructor TDCPopupWindow.Destroy;
begin
  DeleteObject(FCloseBtn.Glyph.Handle);
  FCloseBtn.Free;
  FSizeGrip.Free;
  FBottomPanel.Free;
  inherited;
end;

procedure TDCPopupWindow.CancelBtnClick(Sender: TObject);
begin
  PopupHide(mrCancel);
end;

procedure TDCPopupWindow.OKBtnClick(Sender: TObject);
begin
  PopupHide(mrOK);
end;

procedure TDCPopupWindow.FSizeGripMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var p: TPoint;
begin
  InSizing := True;
  p := FSizeGrip.ClientToScreen(Point(X, Y));
  StartW := Width - p.x;
  StartH := Height - p.y;
end;

procedure TDCPopupWindow.FSizeGripMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var p: TPoint; w, h: integer;
begin
  if InSizing then
  begin
    p := FSizeGrip.ClientToScreen(Point(X, Y));
    w := StartW + p.x;
    if w < TheMinWidth then w := TheMinWidth;
    h := StartH + p.y;
    if h < TheMinHeight then h := TheMinHeight;
    SetBounds(Left, Top, w, h);
  end;
end;

procedure TDCPopupWindow.FSizeGripMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  InSizing := False;
end;

end.
