{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit DCDateTimeEdit;

{$I dc.inc}
interface

Uses
  Classes, Controls, Windows, Graphics, SysUtils, Messages, Forms,
  ComCtrls, CommCtrl, {--}ComStrs,{--}
  FontMan, DCdreamLib;

{$WARNINGS OFF}

Const
  CP_MakeParentFocused = WM_User + 100;

Type
  TDCPopupAlign = ( paLeftTop, paLeftBottom, paRightTop, paRightBottom );

  TDCCustomDateTimeEditor = class;
  TDCSimpleExpression = class
  private
    FEditor          : TDCCustomDateTimeEditor;
    FExpressionWidth : Integer;
    FKeyBuffer       : String;
    FMaxBufferLength : Integer;
    FMaxValue        : Integer;

    Procedure DrawText_WinNT( ACanvas : TCanvas; Var AStartX : Integer; Const AText : String );
    Procedure DrawText_Win9x( ACanvas : TCanvas; Var AStartX : Integer; Const AText : String );
  protected
    Procedure DrawExpression( ACanvas : TCanvas; Var AStartX : Integer; ASelected : Boolean ); virtual; abstract;
    Function  Height : Integer;
    Function  CanBeSelected : Boolean; dynamic;
    Procedure SetNewValue( AValue : Word ); virtual;

    Procedure DrawText( ACanvas : TCanvas; Var AStartX : Integer; Const AText : String );
    Procedure Enter; dynamic;

    Property Editor          : TDCCustomDateTimeEditor Read FEditor;
    Property ExpressionWidth : Integer                 Read FExpressionWidth Write FExpressionWidth;
    Property MaxBufferLength : Integer                 Read FMaxBufferLength Write FMaxBufferLength;
    Property MaxValue        : Integer                 Read FMaxValue Write FMaxValue;
  public
    Constructor Create( AEditor : TDCCustomDateTimeEditor ); virtual;

    Procedure ResetSettings; virtual; abstract;
    Function GetRealWidth( AFontHandle : THandle; ASelected : Boolean ) : Integer; virtual;

    Procedure KeyPressed( AKey : Char );
    Function ScrollValueUp : Boolean; virtual;
    Function ScrollValueDown : Boolean; virtual;
  end;

{------------------------------------------------------------------}

  TDCStringExpression = class( TDCSimpleExpression )
  private
    FText : String;

    Procedure SetText( Const AValue : String );
  protected
    Procedure DrawExpression( ACanvas : TCanvas; Var AStartX : Integer; ASelected : Boolean ); override;
    Function  CanBeSelected : Boolean; override;
  public
    Procedure ResetSettings; override;

    Property Text : String Read FText Write SetText;
  end;

{------------------------------------------------------------------}

  TDCTwoDigitExpression = class( TDCSimpleExpression )
  private
    FLeadingZero : Boolean;
  protected
    Function  GetValue : Integer; virtual; abstract;
    Procedure DrawExpression( ACanvas : TCanvas; Var AStartX : Integer; ASelected : Boolean ); override;
  public
    Constructor Create( AEditor : TDCCustomDateTimeEditor; ALeadingZero : Boolean ); {$IFDEF D4}reintroduce;{$ENDIF} virtual;

    Procedure ResetSettings; override;
  end;

{------------------------------------------------------------------}

  TDCDayExpression = class( TDCTwoDigitExpression )
  protected
    Function  GetValue : Integer; override;
    Procedure SetNewValue( AValue : Word ); override;
    Procedure Enter; override;
  public
    Function ScrollValueUp : Boolean; override;
    Function ScrollValueDown : Boolean; override;
  end;

{------------------------------------------------------------------}

  TDCMonthExpression = class( TDCSimpleExpression )
  private
    FFormatLength : Integer;
  protected
    Procedure DrawExpression( ACanvas : TCanvas; Var AStartX : Integer; ASelected : Boolean ); override;
    Procedure SetNewValue( AValue : Word ); override;
  public
    Constructor Create( AEditor : TDCCustomDateTimeEditor; AFormatLength : Integer ); {$IFDEF D4}reintroduce;{$ENDIF} virtual;

    Procedure ResetSettings; override;

    Function ScrollValueUp : Boolean; override;
    Function ScrollValueDown : Boolean; override;
  end;

{------------------------------------------------------------------}

  TDCYearExpression = class( TDCSimpleExpression )
  private
    FShowShortYear : Boolean;
  protected
    Procedure DrawExpression( ACanvas : TCanvas; Var AStartX : Integer; ASelected : Boolean ); override;
    Procedure SetNewValue( AValue : Word ); override;
  public
    Constructor Create( AEditor : TDCCustomDateTimeEditor; AShowShortYear : Boolean ); {$IFDEF D4}reintroduce;{$ENDIF} virtual;

    Procedure ResetSettings; override;

    Function GetRealWidth( AFontHandle : THandle; ASelected : Boolean ) : Integer; override;

    Function ScrollValueUp : Boolean; override;
    Function ScrollValueDown : Boolean; override;
  end;

{------------------------------------------------------------------}

  TDCHourExpression = class( TDCTwoDigitExpression )
  protected
    Function GetValue : Integer; override;
    Procedure SetNewValue( AValue : Word ); override;
  public
    Constructor Create( AEditor : TDCCustomDateTimeEditor; ALeadingZero : Boolean ); override;

    Function ScrollValueUp : Boolean; override;
    Function ScrollValueDown : Boolean; override;
  end;

{------------------------------------------------------------------}

  TDCSixtyExpression = class( TDCTwoDigitExpression )
  public
    Constructor Create( AEditor : TDCCustomDateTimeEditor; ALeadingZero : Boolean ); override;
  end;

{------------------------------------------------------------------}

  TDCMinuteExpression = class( TDCSixtyExpression )
  protected
    Function GetValue : Integer; override;
    Procedure SetNewValue( AValue : Word ); override;
  public
    Function ScrollValueUp : Boolean; override;
    Function ScrollValueDown : Boolean; override;
  end;

{------------------------------------------------------------------}

  TDCSecondExpression = class( TDCSixtyExpression )
  protected
    Function GetValue : Integer; override;
    Procedure SetNewValue( AValue : Word ); override;
  public
    Function ScrollValueUp : Boolean; override;
    Function ScrollValueDown : Boolean; override;
  end;

{------------------------------------------------------------------}

  TDCMilliSecondExpression = class( TDCSixtyExpression )
  protected
    Function  GetValue : Integer; override;
    Procedure SetNewValue( AValue : Word ); override;
  public
    Function ScrollValueUp : Boolean; override;
    Function ScrollValueDown : Boolean; override;
  end;

{------------------------------------------------------------------}

  TDCOnLeavePopup = Procedure( ACancel : Boolean ) of object;

  TDCCalendarPopup = class( TWinControl{TMonthCalendar} )
  private
    FCanceled     : Boolean;
    FOnLeavePopup : TDCOnLeavePopup;
    FDateTime     : TDateTime;

    Procedure WMMouseActivate( Var AMsg : TMessage ); message WM_MOUSEACTIVATE;
    Procedure WMNCActivate( Var AMsg : TMessage ); message WM_NCACTIVATE;
//    Procedure WMSETFOCUS( Var AMsg : TMessage ); message WM_SETFOCUS;
//    Procedure WMKillFocus( Var AMsg : TMessage ); message WM_KILLFOCUS;
    Procedure WMCommand( Var AMsg : TWMCommand ); message WM_Command;

    Procedure CNNotify( Var AMsg : TWMNotify ); message CN_NOTIFY;

{--}
    Function  GetDate: TDateTime;
    Procedure SetDate( AValue : TDateTime );
    Procedure SetDateTime( AValue : TDateTime );
{--}
  protected
    Procedure CreateParams( Var Params : TCreateParams ); override;
    Procedure DoLeavePopup( ACancel : Boolean ); dynamic;

    Procedure KeyPress( Var Key : Char ); override;

{--}
    Procedure CreateHandle; override;
    Function  MsgSetDateTime( AValue : TSystemTime ) : Boolean;
    Procedure CheckSize;
{--}
  public
    Constructor Create( AOwner : TComponent ); override;

{--}
    Property Date : TDateTime Read GetDate Write SetDate;
{--}

    Property Canceled     : Boolean         Read FCanceled Write FCanceled;
    Property OnLeavePopup : TDCOnLeavePopup Read FOnLeavePopup Write FOnLeavePopup;
  end;

{------------------------------------------------------------------}

  TDCDateTimeEditorKind = ( dekDate, dekTime, dekDateTime );
  TDCDaysNumber = Array[ 1 .. 12 ] Of Byte;

  TDCCustomDateTimeEditor = class( TCustomControl )
  private
    FExpressionParts : TList;
    FTextMask        : TBitmap;
    FTextMaskRect    : TRect;

    FDay             : Word;
    FMonth           : Word;
    FDaysNumber      : TDCDaysNumber;
    FYear            : Word;
    FHour            : Word;
    FMin             : Word;
    FSec             : Word;
    FMSec            : Word;
    FModified        : Boolean;

    FSelectedExpression : Integer;
    FTopExpression      : Integer;
    FSelectedFontColor  : TColor;
    FSelectedColor      : TColor;
    FShowMonthsPopup    : Boolean;
    FPressedButton      : Integer;
    FScrollTimer        : UINT;
    FCalendarPopup      : TDCCalendarPopup;
    FOmitAction         : Boolean;

    FBorderStyle     : TBorderStyle;
    FKind            : TDCDateTimeEditorKind;

    FOnFocusLost : TNotifyEvent;
    FOnChange    : TNotifyEvent;

    Procedure WMEraseBkgnd( Var AMsg : TWMEraseBkgnd ); message WM_EraseBkgnd;
    Procedure WMGetDlgCode( Var AMsg : TWMGetDlgCode ); message WM_GetDlgCode;
    Procedure WMKillFocus( Var AMsg : TMessage ); message WM_KILLFOCUS;
    Procedure WMLButtonDown( Var AMsg : TWMLButtonDown ); message WM_LBUTTONDOWN;
    Procedure WMLButtonUp( Var AMsg : TWMLButtonUp ); message WM_LBUTTONUP;
    Procedure WMTimer( Var AMsg : TWMTimer); message WM_TIMER;
    Procedure WMWindowPosChanging( Var AMsg : TWMWindowPosChanging ); message WM_WINDOWPOSCHANGING;

    Procedure CMColorChanged( Var AMsg : TMessage ); message CM_COLORCHANGED;
    Procedure CMFontChanged( Var AMsg : TMessage ); message CM_FONTCHANGED;
    Procedure CMVisibleChanged( Var AMsg : TMessage ); message CM_VISIBLECHANGED;

    Procedure CPMakeParentFocused( Var AMsg : TMessage ); message CP_MakeParentFocused;

    Procedure PopupLostFocus( ACancel : Boolean );
    Function  AppHook( Var AMsg : TMessage ) : Boolean;

    Procedure SetKind( AValue : TDCDateTimeEditorKind );
    Procedure SetBorderStyle( AValue : TBorderStyle );

    Function  GetTime : TDateTime;
    Function  GetDate : TDateTime;
    Function  GetDateTime : TDateTime;
    Procedure SetTime( Const AValue : TDateTime );
    Procedure SetDate( Const AValue : TDateTime );
    Procedure SetDateTime( Const AValue : TDateTime );
    Procedure SetSelectedExpression( AValue : Integer );
    Procedure SetSelectedColor( AValue : TColor );
    Procedure SetSelectedFontColor( AValue : TColor );
    Function  GetMaxDay : Word;
    Procedure SetTopExpression( AValue : Integer );
    Procedure SetShowMonthsPopup( AValue : Boolean );
    Procedure SetPressedButton( AValue : Integer );
  protected
    Procedure CreateParams( Var Params : TCreateParams ); override;
    Procedure Paint; override;
    Procedure KeyDown( Var Key : Word; Shift : TShiftState ); override;
    Procedure KeyPress( Var Key : Char ); override;
    Procedure MouseMove( Shift : TShiftState; X, Y : Integer ); override;
    Procedure CreateHandle; override;

    Procedure InvalidateWorkArea;
    Procedure PaintWorkArea;
    Procedure InitTextMask;

    Function  ButtonWidth : Integer;
    Procedure DrawButton;
    Function  IsCursorOverButton( X, Y : Integer ) : Integer;
    Procedure CreateScrollTimer;
    Procedure KillScrollTimer;
    Procedure ShowMonthPopup; 
    Procedure UpdatePopup;
    Procedure HidePopup;

    Procedure DoFocusLost; dynamic;
    Procedure DoChanged; dynamic;

    Procedure ValidateYear;
    Procedure ValidateMonth;
    Procedure ContentsChanged;

    Procedure ClearExpressionParts;
    Procedure ResetViewSettings;

    Function  GetSelectedExpression : TDCSimpleExpression;
    Function  GetNearestExpression( X, Y : Integer; AExisting : Boolean ) : Integer;
    Procedure SearchValidExpression( Var ANewItem : Integer; ADirection : Integer );
    Procedure ScrollExpressionRight;
    Procedure ScrollExpressionLeft;
    Procedure IncreaseExpressionValue;
    Procedure SubtractExpressionValue;
    Procedure SelectedFirstExpression;
    Procedure SelectedLastExpression;
    Function  LastVisibleExpression : Integer;
    Procedure MakeExpressionVisible( AItem : Integer );

    Property Day        : Word          Read FDay        Write FDay;
    Property Month      : Word          Read FMonth      Write FMonth;
    Property MaxDay     : Word          Read GetMaxDay;
    Property Year       : Word          Read FYear       Write FYear;
    Property Hour       : Word          Read FHour       Write FHour;
    Property Min        : Word          Read FMin        Write FMin;
    Property Sec        : Word          Read FSec        Write FSec;
    Property MSec       : Word          Read FMSec       Write FMSec;

    Property SelectedExpression : Integer Read FSelectedExpression Write SetSelectedExpression;
    Property TopExpression      : Integer Read FTopExpression Write SetTopExpression;
    Property PressedButton      : Integer Read FPressedButton Write SetPressedButton;
  public
    Constructor Create( AOwner : TComponent ); override;
    Destructor Destroy; override;

    Function IsFocused : Boolean;
    Procedure CanvasChanged;

    Property Kind        : TDCDateTimeEditorKind Read FKind Write SetKind;
    Property BorderStyle : TBorderStyle          Read FBorderStyle Write SetBorderStyle Default bsSingle;
    Property OnFocusLost : TNotifyEvent          Read FOnFocusLost Write FOnFocusLost;
    Property OnChange    : TNotifyEvent          Read FOnChange    Write FOnChange;

    Property SelectedFontColor : TColor  Read FSelectedFontColor Write SetSelectedFontColor default clHighlightText;
    Property SelectedColor     : TColor  Read FSelectedColor Write SetSelectedColor default clHighlight;
    Property ShowMonthsPopup   : Boolean Read FShowMonthsPopup Write SetShowMonthsPopup default True;

    Property Date     : TDateTime Read GetDate Write SetDate;
    Property Time     : TDateTime Read GetTime Write SetTime;
    Property DateTime : TDateTime Read GetDateTime Write SetDateTime;
    Property Modified : Boolean   Read FModified Write FModified;
  end;

{------------------------------------------------------------------}

  TDCDateTimeEditor = class( TDCCustomDateTimeEditor )
  published
    property Align;
{$IFDEF D4}
    property Anchors;
{$ENDIF}
    Property Ctl3D;
    Property Color default clWindow;
    property Enabled;
    property Font;
    property ParentColor default False;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop Default True;
    property Visible;

    Property BorderStyle;

    Property Kind;
    Property ShowMonthsPopup;

    Property SelectedFontColor;
    Property SelectedColor;

    Property Date;
    Property Time;
    Property DateTime;

    Property OnChange;
    Property OnFocusLost;

    property OnClick;
{$IFDEF D5}
    property OnContextPopup;
    property OnEndDock;
{$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
{$IFDEF D4}
    property OnStartDock;
{$ENDIF}
    property OnStartDrag;
  end;

{------------------------------------------------------------------}

Function DCIntelligentPopup( AControl, APopup : TWinControl; ACanChangeZoom : Boolean ) : TDCPopupAlign;

Function DCGetMaxOneDigitWidth( AFontHandle : THandle; AStart, AFinish : Integer ) : Word;
Function DCGetMaxTwoDigitWidth( AFontHandle : THandle; AStart, AFinish : Integer ) : Word;
Function DCGetMaxStringWidth( AFontHandle : THandle; Const ANames : array of string ): Word;

{------------------------------------------------------------------}

{$WARNINGS ON}

implementation

Const
  sDCDateTimeDivider = ' ';

  ROP_DstCopy = $00AA0029;
  sDCDefaultWidth  = 145;
  sDCDefaultHeight = 22;

{$IFNDEF CLX}
Var
  DCActiveDateTimeEdit : TDCCustomDateTimeEditor = Nil;
  WHook                : HHook;

{------------------------------------------------------------------}

Procedure DCRemoveCalendarHooks;
begin
  If GetCapture <> 0 Then
    SendMessage( GetCapture, WM_CANCELMODE, 0, 0 );

  UnhookWindowsHookEx( WHook );
  DCActiveDateTimeEdit := Nil;
end;

{------------------------------------------------------------------}

Function DCCallCalendarWndProcHook( nCode : Integer; wParam : Longint; Var mhs : TMouseHookStruct ) : LongInt; stdcall;
Var
  CalendarRect, EditorRect : TRect;
begin
  If DCActiveDateTimeEdit <> Nil Then
  begin
    GetWindowRect( DCActiveDateTimeEdit.FCalendarPopup.Handle, CalendarRect );
    GetWindowRect( DCActiveDateTimeEdit.Handle, EditorRect );
    If ( ( ( wParam = WM_LBUTTONDOWN ) Or ( wParam = WM_LBUTTONUP ) Or
           ( wParam = WM_NCLBUTTONDOWN ) Or ( wParam = WM_NCLBUTTONUP ) ) ) And
       Not ( PtInRect( CalendarRect, mhs.pt ) Or PtInRect( EditorRect, mhs.pt ) ) Then
      DCActiveDateTimeEdit.PopupLostFocus( True );
  end;
  Result := CallNextHookEx( WHook, nCode, wParam, Longint( @mhs ) );
end;
{$ENDIF}

{------------------------------------------------------------------}

Function DCIntelligentPopup( AControl, APopup : TWinControl; ACanChangeZoom : Boolean ) : TDCPopupAlign;
Const
  ResizeFlag : Array[ Boolean ] Of Integer = ( SWP_NOSIZE, 0 );
Var
  PopupRect                 : TRect;
  ControlTop                : TPoint;
  ScreenWidth, ScreenHeight : Integer;
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
  Procedure _GetNormalPos;
  begin
    With PopupRect Do
    begin
      Left := 0;//AControl.Left;
      Top := 0;//AControl.Top;
      TopLeft := AControl.ClientToScreen( TopLeft );
      ControlTop.X := Left;
      ControlTop.Y := Top;
      Inc( Top, AControl.Height );
      If AControl.Width > APopup.Width Then
        Right := Left + AControl.Width
      Else
        Right := Left + APopup.Width;
      Bottom := Top + APopup.Height;
    end;
  end;
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
begin
  APopup.HandleNeeded;
  _GetNormalPos;
  Result :=  paLeftTop;
  ScreenWidth := Screen.Width;
  ScreenHeight := Screen.Height;
  With PopupRect Do
  begin
    If Bottom > ScreenHeight Then
      If ( ControlTop.Y - APopup.Height >= 0 ) Or
         ( ControlTop.Y < ScreenHeight - PopupRect.Top ) Then
      begin
        Top := ControlTop.Y - APopup.Height;
        If Top < 0 Then
          Top := 0;
        Bottom := ControlTop.Y;
        Result := paLeftBottom;
      end
      Else
        Bottom := ScreenHeight;

    Inc( ControlTop.X, AControl.Width );
    If Right > ScreenWidth Then
      If ( ControlTop.X - APopup.Width >= 0 ) Or
         ( ControlTop.X < ScreenWidth - ControlTop.X ) Then
      begin
        Left := ControlTop.X - APopup.Width;
        If Left < 0 Then
          Left := 0;
        Right := ControlTop.X;
        If Result = paLeftTop Then
          Result := paRightTop
        Else
          Result := paRightBottom;
      end
      Else
        Right := ScreenHeight;

    SetWindowPos( APopup.Handle, 0, Left, Top, Right - Left, Bottom - Top, SWP_NOACTIVATE Or
                  SWP_NOOWNERZORDER Or SWP_NOREDRAW Or ResizeFlag[ ACanChangeZoom ] );
  end;
end;

{------------------------------------------------------------------}

Function DCGetNumberValue( AValue : Integer; ALeadingZero : Boolean ) : String;
begin
  Result := IntToStr( AValue );
  If ALeadingZero And ( AValue < 10 ) Then
    Result := '0' + Result;
end;

{------------------------------------------------------------------}

Function DCGetMaxTwoDigitWidth( AFontHandle : THandle; AStart, AFinish : Integer ) : Word;
Var
  CurWidth : Integer;
  Text     : String[3];
begin
  Text[1] := '1';
  Text[3] := #0;
  Result := 0;
  For AStart := AStart To AFinish Do
  begin
    Text[2] := Chr( Ord( '0' ) + AStart );
    CurWidth := GetWidth( AFontHandle, @Text[1], 2 );
    If CurWidth > Result Then
      Result := CurWidth;
  end;
end;

{------------------------------------------------------------------}

Function DCGetMaxOneDigitWidth( AFontHandle : THandle; AStart, AFinish : Integer ) : Word;
Var
  CurWidth : Integer;
  Text     : String[2];
begin
  Text[2] := #0;
  Result := 0;
  For AStart := AStart To AFinish Do
  begin
    Text[1] := Chr( Ord( '0' ) + AStart );
    CurWidth := GetWidth( AFontHandle, @Text[1], 1 );
    If CurWidth > Result Then
      Result := CurWidth;
  end;
end;

{------------------------------------------------------------------}

Function DCGetMaxStringWidth( AFontHandle : THandle; Const ANames : array of string ): Word;
Var
  I, CurWidth : Word;
begin
  Result := 0;
  For I := Low( ANames ) To High( ANames ) Do
  begin
    CurWidth := GetWidth( AFontHandle, PChar( ANames[I] ), Length( ANames[I] ) );
    If CurWidth > Result Then
      Result := CurWidth;
  end;
end;

{------------------------------------------------------------------}

{$IFNDEF D5}
Procedure ReplaceTime( Var ADateTime : TDateTime; Const ANewTime : TDateTime );
begin
  ADateTime := Trunc( ADateTime );
  If ADateTime >= 0 Then
    ADateTime := ADateTime + Abs( Frac( ANewTime ) )
  Else
    ADateTime := ADateTime - Abs( Frac( ANewTime ) );
end;
{$ENDIF}

{------------------------------------------------------------------}

{--}
Function IsBlankSysTime( Const ST : TSystemTime ) : Boolean;
Type
  TFast = Array[ 0 .. 3 ] Of DWORD;
begin
  Result := ( TFast(ST)[0] Or TFast(ST)[1] Or TFast(ST)[2] Or TFast(ST)[3] ) = 0;
end;
{--}

{------------------------------------------------------------------}

{ TDCSimpleExpression }

Function TDCSimpleExpression.CanBeSelected : Boolean;
begin
  Result := True;
end;

{------------------------------------------------------------------}

Constructor TDCSimpleExpression.Create( AEditor : TDCCustomDateTimeEditor );
begin
  Inherited Create;
  FEditor := AEditor;
  FExpressionWidth := 0;
end;

{------------------------------------------------------------------}

Procedure TDCSimpleExpression.DrawText( ACanvas : TCanvas; Var AStartX : Integer;
  Const AText : String );
begin
  If Win32Platform = VER_PLATFORM_WIN32_NT Then
    DrawText_WinNT( ACanvas, AStartX, AText )
  Else
    DrawText_Win9x( ACanvas, AStartX, AText );
end;

{------------------------------------------------------------------}

Procedure TDCSimpleExpression.DrawText_Win9x( ACanvas : TCanvas; Var AStartX : Integer;
  Const AText : String );
Var
  DrawingLeft, TextWidth : Integer;
begin
  DrawingLeft := AStartX;
  TextWidth := GetWidth( ACanvas.Font.Handle, PChar( AText ), Length( AText ) );
  If TextWidth > ExpressionWidth Then
    Inc( AStartX, TextWidth )
  Else
    Inc( AStartX, ExpressionWidth );
  ACanvas.TextOut( ( AStartX + DrawingLeft - TextWidth ) Div 2, 0, AText );
end;

{------------------------------------------------------------------}

Procedure TDCSimpleExpression.DrawText_WinNT( ACanvas : TCanvas; Var AStartX : Integer;
  Const AText : String );
Var
  TextImage             : TBitmap;
  DrawingRect           : TRect;
  TextLength, TextWidth : Integer;
  OldStartX, MaskWidth  : Integer;
begin
  TextLength := Length( AText );
  If TextLength = 0 Then
    Exit;

  OldStartX := AStartX;
  DrawingRect.Top := 0;
  DrawingRect.Bottom := Height;
  DrawingRect.Left := AStartX;

  TextWidth := GetWidth( ACanvas.Font.Handle, PChar( AText ), TextLength );
  If TextWidth > ExpressionWidth Then
    Inc( AStartX, TextWidth )
  Else
    Inc( AStartX, ExpressionWidth );
  DrawingRect.Right := AStartX;

  If Not Assigned( Editor.FTextMask ) Then
  begin
    ExtTextOut( ACanvas.Handle, ( AStartX + DrawingRect.Left - TextWidth ) Div 2, DrawingRect.Top, ETO_OPAQUE, @DrawingRect, PChar( AText ), TextLength, Nil );
    Exit;
  end;

  TextImage := TBitmap.Create;
  try
    MaskWidth := Editor.FTextMask.Width;
    Inc( DrawingRect.Right, MaskWidth );
    OffsetRect( DrawingRect, -DrawingRect.Left, 0 );
    With TextImage Do
    begin
      Canvas.Font := ACanvas.Font;
      Canvas.Brush.Color := ACanvas.Brush.Color;
      Width := DrawingRect.Right - DrawingRect.Left;
      Height := DrawingRect.Bottom;
      ExtTextOut( Canvas.Handle, ( AStartX - OldStartX - TextWidth ) Div 2, 0, ETO_OPAQUE, @DrawingRect, PChar( AText ), TextLength, Nil );
    end;

    MaskBlt( ACanvas.Handle, OldStartX, 0, MaskWidth, DrawingRect.Bottom, TextImage.Canvas.Handle, 0, 0, Editor.FTextMask.Handle, 0, 0, MakeRop4( ROP_DstCopy, SrcCopy ) );
    Inc( OldStartX, MaskWidth );
    Dec( DrawingRect.Right, MaskWidth );
    BitBlt( ACanvas.Handle, OldStartX, 0, DrawingRect.Right, DrawingRect.Bottom, TextImage.Canvas.Handle, MaskWidth, 0, SrcCopy );
  finally
    TextImage.Free;
  end;
end;

{------------------------------------------------------------------}

Procedure TDCSimpleExpression.Enter;
begin
  FKeyBuffer := '';
end;

{------------------------------------------------------------------}

Function TDCSimpleExpression.GetRealWidth( AFontHandle : THandle; ASelected : Boolean ) : Integer;
begin
  Result := ExpressionWidth; 
end;

{------------------------------------------------------------------}

Function TDCSimpleExpression.Height : Integer;
begin
  Result := Editor.FTextMaskRect.Bottom;
end;

{------------------------------------------------------------------}

Procedure TDCSimpleExpression.KeyPressed( AKey : Char );
Var
  Value : Word;
begin
  FKeyBuffer := FKeyBuffer + AKey;
  If ( MaxBufferLength > 0 ) And ( Length( FKeyBuffer ) > MaxBufferLength ) Then
    FKeyBuffer := AKey;
    
  Value := StrToInt( FKeyBuffer );
  If ( Value > MaxValue ) And ( MaxValue > 9 ) Then
  begin
    Delete( FKeyBuffer, 1, 1 );
    Value := StrToInt( FKeyBuffer );
  end;
  SetNewValue( Value );
end;

{------------------------------------------------------------------}

Function TDCSimpleExpression.ScrollValueDown : Boolean;
begin
  Result := False;
end;

{------------------------------------------------------------------}

Function TDCSimpleExpression.ScrollValueUp : Boolean;
begin
  Result := False;
end;

{------------------------------------------------------------------}

Procedure TDCSimpleExpression.SetNewValue( AValue : Word );
begin
end;

{------------------------------------------------------------------}

{ TDCStringExpression }

Function TDCStringExpression.CanBeSelected : Boolean;
begin
  Result := False;
end;

{------------------------------------------------------------------}

Procedure TDCStringExpression.DrawExpression( ACanvas : TCanvas; Var AStartX : Integer; ASelected : Boolean );
begin
  DrawText( ACanvas, AStartX, Text );
end;

{------------------------------------------------------------------}

Procedure TDCStringExpression.ResetSettings;
begin
  ExpressionWidth := GetWidth( Editor.Font.Handle, PChar( Text ), Length( Text ) );
end;

{------------------------------------------------------------------}

Procedure TDCStringExpression.SetText( Const AValue : String );
begin
  FText := AValue;
  ResetSettings;
end;

{------------------------------------------------------------------}

{ TDCTwoDigitExpression }

Constructor TDCTwoDigitExpression.Create( AEditor : TDCCustomDateTimeEditor; ALeadingZero : Boolean );
begin
  Inherited Create( AEditor );
  FLeadingZero := ALeadingZero;
  MaxBufferLength := 2;
end;

{------------------------------------------------------------------}

Procedure TDCTwoDigitExpression.DrawExpression( ACanvas : TCanvas; Var AStartX : Integer; ASelected : Boolean );
begin
  DrawText( ACanvas, AStartX, DCGetNumberValue( GetValue, FLeadingZero ) );
end;

{------------------------------------------------------------------}

Procedure TDCTwoDigitExpression.ResetSettings;
Var
  MaxWidth : Integer;
  Text     : String[3];
begin
  With Editor.Font Do
    If FLeadingZero Then
    begin
      Text := '0'#0;
      ExpressionWidth := DCGetMaxOneDigitWidth( Handle, 1, 9 ) + GetWidth( Handle, @Text[1], 1 );
      MaxWidth := DCGetMaxTwoDigitWidth( Handle, 0, 2 );
      If MaxWidth > ExpressionWidth Then
        ExpressionWidth := MaxWidth;
    end
      Else
    begin
      ExpressionWidth := DCGetMaxOneDigitWidth( Handle, 1, 9 );
      MaxWidth := DCGetMaxTwoDigitWidth( Handle, 0, 2 );
      If MaxWidth > ExpressionWidth Then
        ExpressionWidth := MaxWidth;
    end;
end;

{------------------------------------------------------------------}

{ TDCMonthExpression }

Constructor TDCMonthExpression.Create( AEditor : TDCCustomDateTimeEditor; AFormatLength : Integer );
begin
  Inherited Create( AEditor );
  FFormatLength := AFormatLength;
  MaxBufferLength := 2;
  MaxValue := 12;
end;

{------------------------------------------------------------------}

Procedure TDCMonthExpression.DrawExpression( ACanvas : TCanvas; Var AStartX : Integer; ASelected : Boolean );
Var
  Text : String;
begin
  Case FFormatLength Of
    1  : Text := DCGetNumberValue( Editor.Month, False );
    2  : Text := DCGetNumberValue( Editor.Month, True );
    3  : Text := ShortMonthNames[ Editor.Month ];
    Else Text := LongMonthNames[ Editor.Month ];
  End;

  DrawText( ACanvas, AStartX, Text );
end;

{------------------------------------------------------------------}

Procedure TDCMonthExpression.ResetSettings;
Var
  Text     : String[2]; 
  MaxWidth : Integer;
begin
  With Editor.Font Do
    Case FFormatLength Of
      1  : begin
             ExpressionWidth := DCGetMaxOneDigitWidth( Handle, 1, 9 );
             MaxWidth := DCGetMaxTwoDigitWidth( Handle, 0, 2 );
             If MaxWidth > ExpressionWidth Then
               ExpressionWidth := MaxWidth;
           end;
      2  : begin
             Text := '0'#0;
             ExpressionWidth := DCGetMaxOneDigitWidth( Handle, 1, 9 ) + GetWidth( Handle, @Text[1], 1 );
             MaxWidth := DCGetMaxTwoDigitWidth( Handle, 0, 2 );
             If MaxWidth > ExpressionWidth Then
               ExpressionWidth := MaxWidth;
           end;
      3  : ExpressionWidth := DCGetMaxStringWidth( Handle, ShortMonthNames );
      Else ExpressionWidth := DCGetMaxStringWidth( Handle, LongMonthNames );
    End;
end;

{------------------------------------------------------------------}

Function TDCMonthExpression.ScrollValueDown : Boolean;
begin
  If Editor.FMonth > 1 Then
    Dec( Editor.FMonth )
  Else
    Editor.FMonth := 12;
  Editor.ValidateMonth;
  Result := True;
end;

{------------------------------------------------------------------}

Function TDCMonthExpression.ScrollValueUp : Boolean;
begin
  If Editor.FMonth < 12 Then
    Inc( Editor.FMonth )
  Else
    Editor.FMonth := 1;
  Editor.ValidateMonth;
  Result := True;
end;

{------------------------------------------------------------------}

Procedure TDCMonthExpression.SetNewValue( AValue : Word );
begin
  If AValue = 0 Then
    Exit;
  Editor.FMonth := AValue;
  Editor.ContentsChanged;
end;

{------------------------------------------------------------------}

{ TDCYearExpression }

Constructor TDCYearExpression.Create( AEditor : TDCCustomDateTimeEditor; AShowShortYear : Boolean );
begin
  Inherited Create( AEditor );
  FShowShortYear := AShowShortYear;
  MaxBufferLength := 4;
end;

{------------------------------------------------------------------}

Procedure TDCYearExpression.DrawExpression( ACanvas : TCanvas; Var AStartX : Integer; ASelected : Boolean );
Var
  Y    : Integer;
  Text : String;
begin
  Y := Editor.Year;
  If Not ASelected And FShowShortYear Then
    Text := DCGetNumberValue( Y Mod 100, True )
  Else
    Text := IntToStr( Y );

  DrawText( ACanvas, AStartX, Text );
end;

{------------------------------------------------------------------}

Function TDCYearExpression.GetRealWidth( AFontHandle : THandle; ASelected : Boolean ) : Integer;
Var
  Text : String;
begin
  If ASelected Or FShowShortYear Then
  begin
    Text := IntToStr( Editor.Year );
    Result := GetWidth( AFontHandle, PChar( Text ), Length( Text ) );
  end
  Else
    Result := Inherited GetRealWidth( AFontHandle, ASelected );
end;

{------------------------------------------------------------------}

Procedure TDCYearExpression.ResetSettings;
begin
  With Editor.Font Do
  begin
    ExpressionWidth := DCGetMaxOneDigitWidth( Handle, 0, 9 );
    If FShowShortYear Then
      ExpressionWidth := ExpressionWidth * 2
    Else
      ExpressionWidth := ExpressionWidth * 3 + DCGetMaxOneDigitWidth( Handle, 1, 3 );
  end;
end;

{------------------------------------------------------------------}

Function TDCYearExpression.ScrollValueDown : Boolean;
begin
  If Editor.FYear > 0 Then
    Dec( Editor.FYear );
  Editor.ValidateYear;
  Result := True;
end;

{------------------------------------------------------------------}

Function TDCYearExpression.ScrollValueUp : Boolean;
begin
  Inc( Editor.FYear );
  Editor.ValidateYear;
  Result := True;
end;

{------------------------------------------------------------------}

Procedure TDCYearExpression.SetNewValue( AValue : Word );
begin
  Editor.FYear := AValue;
  Editor.ContentsChanged;
end;

{------------------------------------------------------------------}

{ TDCDayExpression }

Procedure TDCDayExpression.Enter;
begin
  Inherited;
  MaxValue := Editor.MaxDay;
end;

{------------------------------------------------------------------}

Function TDCDayExpression.GetValue : Integer;
begin
  Result := Editor.FDay;
end;

{------------------------------------------------------------------}

Function TDCDayExpression.ScrollValueDown : Boolean;
begin
  If Editor.FDay > 1 Then
    Dec( Editor.FDay )
  Else
    Editor.FDay := Editor.MaxDay;
  Result := True;
end;

{------------------------------------------------------------------}

Function TDCDayExpression.ScrollValueUp : Boolean;
begin
  If Editor.FDay < Editor.MaxDay Then
    Inc( Editor.FDay )
  Else
    Editor.FDay := 1;
  Result := True;
end;

{------------------------------------------------------------------}

Procedure TDCDayExpression.SetNewValue( AValue : Word );
begin
  Editor.FDay := AValue;
  Editor.ContentsChanged;
end;

{------------------------------------------------------------------}

{ TDCHourExpression }

Constructor TDCHourExpression.Create( AEditor : TDCCustomDateTimeEditor; ALeadingZero : Boolean );
begin
  Inherited;
  MaxValue := 23;
end;

{------------------------------------------------------------------}

Function TDCHourExpression.GetValue: Integer;
begin
  Result := Editor.FHour;
end;

{------------------------------------------------------------------}

Function TDCHourExpression.ScrollValueDown : Boolean;
begin
  If Editor.FHour > 0 Then
    Dec( Editor.FHour )
  Else
    Editor.FHour := 23;
  Result := True;
end;

{------------------------------------------------------------------}

Function TDCHourExpression.ScrollValueUp : Boolean;
begin
  If Editor.FHour < 23 Then
    Inc( Editor.FHour )
  Else
    Editor.FHour := 0;
  Result := True;
end;

{------------------------------------------------------------------}

Procedure TDCHourExpression.SetNewValue( AValue : Word );
begin
  Editor.FHour := AValue;
  Editor.ContentsChanged;
end;

{------------------------------------------------------------------}

{ TDCMinuteExpression }

Function TDCMinuteExpression.GetValue : Integer;
begin
  Result := Editor.FMin;
end;

{------------------------------------------------------------------}

Function TDCMinuteExpression.ScrollValueDown : Boolean;
begin
  If Editor.FMin > 0 Then
    Dec( Editor.FMin )
  Else
    Editor.FMin := 59;
  Result := True;
end;

{------------------------------------------------------------------}

Function TDCMinuteExpression.ScrollValueUp : Boolean;
begin
  If Editor.FMin < 59 Then
    Inc( Editor.FMin )
  Else
    Editor.FMin := 0;
  Result := True;
end;

{------------------------------------------------------------------}

Procedure TDCMinuteExpression.SetNewValue( AValue : Word );
begin
  Editor.FMin := AValue;
  Editor.ContentsChanged;
end;

{------------------------------------------------------------------}

{ TDCSecondExpression }

Function TDCSecondExpression.GetValue : Integer;
begin
  Result := Editor.FSec;
end;

{------------------------------------------------------------------}

Function TDCSecondExpression.ScrollValueDown : Boolean;
begin
  If Editor.FSec > 0 Then
    Dec( Editor.FSec )
  Else
    Editor.FSec := 59;
  Result := True;
end;

{------------------------------------------------------------------}

Function TDCSecondExpression.ScrollValueUp : Boolean;
begin
  If Editor.FSec < 59 Then
    Inc( Editor.FSec )
  Else
    Editor.FSec := 0;
  Result := True;
end;

{------------------------------------------------------------------}

Procedure TDCSecondExpression.SetNewValue( AValue : Word );
begin
  Editor.FSec := AValue;
  Editor.ContentsChanged;
end;

{------------------------------------------------------------------}

{ TDCMilliSecondExpression }

Function TDCMilliSecondExpression.GetValue : Integer;
begin
  Result := Editor.MSec;
end;

{------------------------------------------------------------------}

Function TDCMilliSecondExpression.ScrollValueDown: Boolean;
begin
  If Editor.FMSec > 0 Then
    Dec( Editor.FMSec )
  Else
    Editor.FMSec := 59;
  Result := True;
end;

{------------------------------------------------------------------}

Function TDCMilliSecondExpression.ScrollValueUp: Boolean;
begin
  If Editor.FMSec < 59 Then
    Inc( Editor.FMSec )
  Else
    Editor.FMSec := 0;
  Result := True;
end;

{------------------------------------------------------------------}

Procedure TDCMilliSecondExpression.SetNewValue( AValue : Word );
begin
  Editor.FMSec := AValue;
  Editor.ContentsChanged;
end;

{------------------------------------------------------------------}

{ TDCSixtyExpression }

Constructor TDCSixtyExpression.Create( AEditor : TDCCustomDateTimeEditor; ALeadingZero : Boolean );
begin
  Inherited;
  MaxValue := 59;
end;

{------------------------------------------------------------------}

{ TDCCalendarPopup }

{--}
Procedure TDCCalendarPopup.CheckSize;
Var
  Bounds : TRect;
begin
  If Not HandleAllocated Then
    Exit;
  Perform( MCM_GETMINREQRECT, 0, Longint(@Bounds) );
  With Bounds Do
  begin
    Width := Right - Left;
    Height := Bottom - Top;
  end;
end;
{--}

{------------------------------------------------------------------}

Procedure TDCCalendarPopup.CNNotify( Var AMsg : TWMNotify );
Var
  ST : PSystemTime; 
begin
  Inherited;
  With AMsg Do
    Case NMHdr^.Code Of
      MCN_SELECT,
      MCN_SELCHANGE :
          begin
{--}
            ST := @PNMSelChange(NMHdr).stSelStart;
            If Not IsBlankSysTime( ST^ ) Then
              FDateTime := SystemTimeToDateTime( ST^ );
{--}
            If NMHdr^.Code = MCN_SELECT Then
              DoLeavePopup( False );
          end;  
    end;
end;

{------------------------------------------------------------------}

Constructor TDCCalendarPopup.Create( AOwner : TComponent );
begin
{--}
  CheckCommonControl( ICC_DATE_CLASSES );
{--}
  Inherited;
  Visible := False;
  Parent := TWinControl( AOwner );
  ControlStyle := ControlStyle + [csNoDesignVisible];
{--}
  FDateTime := Now;
{--}
end;

{------------------------------------------------------------------}

{--}
Procedure TDCCalendarPopup.CreateHandle;
begin
  Inherited;
  CheckSize;
end;
{--}

{------------------------------------------------------------------}

Procedure TDCCalendarPopup.CreateParams( Var Params : TCreateParams );
begin
  Inherited;
{--}
  CreateSubClass( Params, MONTHCAL_CLASS );
{--}
  With Params Do
  begin
    Style := WS_POPUP or WS_BORDER or WS_CLIPCHILDREN;
{--}
    WindowClass.Style := WindowClass.style And Not ( CS_HREDRAW Or CS_VREDRAW ) Or CS_DBLCLKS;
{--}
  end;
end;

{------------------------------------------------------------------}

Procedure TDCCalendarPopup.DoLeavePopup( ACancel : Boolean );
begin
  If Assigned( FOnLeavePopup ) Then
    FOnLeavePopup( ACancel );
end;

{------------------------------------------------------------------}

{--}
Function TDCCalendarPopup.GetDate : TDateTime;
begin
  Result := TDate( FDateTime );
end;
{--}

{------------------------------------------------------------------}

Procedure TDCCalendarPopup.KeyPress( Var Key : Char );
begin
  Inherited;
  Case Key Of
    #13 : DoLeavePopup( False );
    #27 : DoLeavePopup( True );
  End;
end;

{------------------------------------------------------------------}

{--}
Function TDCCalendarPopup.MsgSetDateTime( AValue : TSystemTime ) : Boolean;
begin
  Result := True;
  If HandleAllocated Then
    Result := MonthCal_SetCurSel( Handle, AValue );
end;

{------------------------------------------------------------------}

Procedure TDCCalendarPopup.SetDate( AValue : TDateTime );
begin
  ReplaceTime( TDateTime(AValue), FDateTime );
  SetDateTime( AValue );
end;

{------------------------------------------------------------------}

Procedure TDCCalendarPopup.SetDateTime( AValue : TDateTime );
Var
  ST : TSystemTime;
begin
  DateTimeToSystemTime( AValue, ST );
  begin
    If HandleAllocated Then
      MsgSetDateTime( ST );
    FDateTime := AValue;
  end;
end;
{--}

{------------------------------------------------------------------}

Procedure TDCCalendarPopup.WMCommand( Var AMsg : TWMCommand );
begin
  Inherited;
  If AMsg.NotifyCode = EN_KillFocus Then
    PostMessage( Parent.Handle, CP_MakeParentFocused, 0, 0 );
end;

{------------------------------------------------------------------}

Procedure TDCCalendarPopup.WMMouseActivate( Var AMsg : TMessage );
begin
  AMsg.Result := MA_NOACTIVATE;
end;

{------------------------------------------------------------------}

Procedure TDCCalendarPopup.WMNCActivate( Var AMsg: TMessage);
Var
  ParentForm : TCustomForm;
begin
  Inherited;
  ParentForm := GetParentForm( Parent );
  If Assigned( ParentForm ) Then
    SendMessage( ParentForm.Handle, WM_NCACTIVATE, 1, 0 );
end;

{------------------------------------------------------------------}

{ TDCCustomDateTimeEditor }

Function TDCCustomDateTimeEditor.AppHook( Var AMsg : TMessage ) : Boolean;
begin
  If AMsg.Msg = WM_ACTIVATEAPP Then
    PopupLostFocus( True );
  Result := False;
end;

{------------------------------------------------------------------}

Function TDCCustomDateTimeEditor.ButtonWidth : Integer;
begin
  Result := GetSystemMetrics( SM_CXHTHUMB ) + 4;
  If Result > ClientHeight Then
    Result := ClientHeight;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.CanvasChanged;
Var
  I : Integer;
begin
  For I := FExpressionParts.Count - 1 DownTo 0 Do
    TDCSimpleExpression( FExpressionParts[ I ] ).ResetSettings;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.ClearExpressionParts;
Var
  I : Integer;
begin
  FSelectedExpression := -1;
  For I := FExpressionParts.Count - 1 DownTo 0 Do
    TDCSimpleExpression( FExpressionParts[ I ] ).Free;
  FExpressionParts.Clear;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.CMColorChanged( var AMsg : TMessage );
begin
  CanvasChanged;
  InitTextMask;
  Inherited;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.CMFontChanged( Var AMsg : TMessage );
begin
  CanvasChanged;
  InitTextMask;
  Inherited;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.CMVisibleChanged( Var AMsg : TMessage );
begin
  Inherited;
  PopupLostFocus( False );
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.ContentsChanged;
begin
  Modified := True;
  InvalidateWorkArea;
  DoChanged;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.CPMakeParentFocused(var AMsg: TMessage);
begin
  Inherited;
  FOmitAction := True;
  SetFocus;
end;

{------------------------------------------------------------------}

Constructor TDCCustomDateTimeEditor.Create( AOwner : TComponent );
begin
  Inherited;
  FBorderStyle := bsSingle;
  FSelectedColor := clHighlight;
  FSelectedFontColor := clHighlightText;
  ParentColor := False;
  Color := clWindow;
  FKind := dekDateTime;
  FShowMonthsPopup := True;
  FExpressionParts := TList.Create;
  ResetViewSettings;
  FPressedButton := -1;
//  FTextMask := TBitmap.Create;

  ControlStyle := ControlStyle - [csDoubleClicks];
   
  FCalendarPopup := TDCCalendarPopup.Create( Self );
  FCalendarPopup.OnLeavePopup := PopupLostFocus;

  FDaysNumber[1] := 31;
  FDaysNumber[2] := 28;
  FDaysNumber[3] := 31;
  FDaysNumber[4] := 30;
  FDaysNumber[5] := 31;
  FDaysNumber[6] := 30;
  FDaysNumber[7] := 31;
  FDaysNumber[8] := 31;
  FDaysNumber[9] := 30;
  FDaysNumber[10] := 31;
  FDaysNumber[11] := 30;
  FDaysNumber[12] := 31;

  SetBounds( Left, Top, sDCDefaultWidth, sDCDefaultHeight );
  DateTime := Now; 
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.CreateHandle;
begin
  Inherited;
  InitTextMask;
  CanvasChanged;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.CreateParams( Var Params : TCreateParams );
begin
  Inherited CreateParams( Params );
  With Params Do
  begin
    Style := Params.Style Or WS_TABSTOP;
    WindowClass.Style := Params.WindowClass.Style Or CS_DBLCLKS;

    If FBorderStyle = bsSingle Then
      If NewStyleControls And Ctl3D Then
      begin
        Style := Style and not WS_BORDER;
        ExStyle := ExStyle or WS_EX_CLIENTEDGE;
      end
      Else
        Style := Style or WS_BORDER;
  end;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.CreateScrollTimer;
begin
  If ( Not ShowMonthsPopup Or ( Kind = dekTime ) ) And ( FScrollTimer = 0 ) Then
    FScrollTimer := SetTimer( Handle, 1, 100, Nil );
end;

{------------------------------------------------------------------}

Destructor TDCCustomDateTimeEditor.Destroy;
begin
  ClearExpressionParts;
  FExpressionParts.Free;
  FCalendarPopup.OnLeavePopup := Nil;
  FCalendarPopup.Free;
  FreeObject( FTextMask ,FTextMask );
  Inherited;
end;

{------------------------------------------------------------------}

procedure TDCCustomDateTimeEditor.DoChanged;
begin
  If Assigned( FOnChange ) Then
    FOnChange( Self );
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.DoFocusLost;
begin
  If Assigned( FOnFocusLost ) Then
    FOnFocusLost( Self );
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.DrawButton;
Const
  FlatArray : Array[ Boolean ] Of Integer = ( DFCS_FLAT, 0 );
  KindByEnabled : Array[ Boolean ] Of Integer = ( DFCS_INACTIVE, 0 );
  PushedFlag : Array[ Boolean ] Of Integer = ( 0, DFCS_PUSHED );
Var
  ButtonRect : TRect;
  BtnHeight  : Integer;
begin
  With ButtonRect Do
  begin
    Right := ClientWidth;
    Left := Right - ButtonWidth;
    Top := 0;
    Bottom := ClientHeight;
  end;

  If ShowMonthsPopup And ( Kind <> dekTime ) Then
    DrawFrameControl( Canvas.Handle, ButtonRect, DFC_SCROLL, DFCS_SCROLLDOWN {Or FlatArray[ Ctl3D ]} Or
                      KindByEnabled[ Enabled ] Or PushedFlag[ PressedButton = 0 ] )
  Else
  begin
    BtnHeight := ButtonRect.Bottom Shr 1;
    Dec( ButtonRect.Bottom, BtnHeight );
    DrawFrameControl( Canvas.Handle, ButtonRect, DFC_SCROLL, DFCS_SCROLLUP {Or FlatArray[ Ctl3D ]}
                      Or KindByEnabled[ Enabled ] Or PushedFlag[ PressedButton = 0 ] );
    OffsetRect( ButtonRect, 0, BtnHeight );
    DrawFrameControl( Canvas.Handle, ButtonRect, DFC_SCROLL, DFCS_SCROLLDOWN {Or FlatArray[ Ctl3D ]} Or
                      KindByEnabled[ Enabled ] Or PushedFlag[ PressedButton = 1 ] );
  end;
end;

{------------------------------------------------------------------}

Function TDCCustomDateTimeEditor.GetDate : TDateTime;
begin
  Result := EncodeDate( FYear, FMonth, FDay );
end;                 

{------------------------------------------------------------------}

Function TDCCustomDateTimeEditor.GetDateTime : TDateTime;
begin
  Result := Date;
  ReplaceTime( Result, Time );
end;

{------------------------------------------------------------------}

Function TDCCustomDateTimeEditor.GetMaxDay : Word;
begin
  Result := FDaysNumber[ FMonth ]; 
end;

{------------------------------------------------------------------}

Function TDCCustomDateTimeEditor.GetNearestExpression( X, Y : Integer; AExisting : Boolean ) : Integer;
Var
  I, Shift : Integer;
begin
  Result := -1;
  If FTextMaskRect.Bottom < Y Then
    Exit;
  Shift := 0;
  For I := 0 To FExpressionParts.Count - 1 Do
    With TDCSimpleExpression( FExpressionParts[I] ) Do
    begin
      If CanBeSelected Then
        Result := I;
      Shift := Shift + ExpressionWidth;
      If Shift > X Then
        Exit;
    end;
  If AExisting Then
    Result := -1;
end;

{------------------------------------------------------------------}

Function TDCCustomDateTimeEditor.GetSelectedExpression : TDCSimpleExpression;
begin
  Result := TDCSimpleExpression( FExpressionParts[ SelectedExpression ] );
end;

{------------------------------------------------------------------}

Function TDCCustomDateTimeEditor.GetTime : TDateTime;
begin
  Result := EncodeTime( FHour, FMin, FSec, FMSec );
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.HidePopup;
begin
  If FCalendarPopup.Visible Then
    PopupLostFocus( True );
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.IncreaseExpressionValue;
begin
  If ( SelectedExpression >= 0 ) And GetSelectedExpression.ScrollValueUp Then
    ContentsChanged;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.InitTextMask;
Var
  FontInfo : PFontInfo;
  Triangle : Array[ 0 .. 4 ] Of TPoint;
begin
  FTextMaskRect.Left := 0;
  FTextMaskRect.Top := 0;
  FontInfo := GetFontInfo( Font.Handle );
  FTextMaskRect.Bottom := FontInfo^.FontHeight;
  FTextMaskRect.Right := FontInfo^.OverHang;

  If ( Win32Platform <> VER_PLATFORM_WIN32_NT ) Or ( FTextMaskRect.Right <= 1 ) Then
  begin
    FreeObject( FTextMask ,FTextMask );
    Exit;
  end;

  If Not Assigned( FTextMask ) Then
    FTextMask := TBitmap.Create;
  Triangle[0].X := FTextMaskRect.Left;
  Triangle[0].Y := FTextMaskRect.Bottom;
  Triangle[1].X := FTextMaskRect.Right;
  Triangle[1].Y := FTextMaskRect.Top;
  Triangle[2] := FTextMaskRect.BottomRight;
  Triangle[3] := Triangle[0];
  With FTextMask, Canvas Do
  begin
    Monochrome := True;
    Brush.Color := clWhite;
    Pen.Color := clWhite;
    Width := FTextMaskRect.Right;
    Height := FTextMaskRect.Bottom;
    FillRect( FTextMaskRect );
    Brush.Color := clBlack;
    Pen.Color := clBlack;
    Polygon( Triangle );
    Mask( clBlack );
    Transparent := True;
  end;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.InvalidateWorkArea;
Var
  InvalidatingRect : TRect;
begin
  If Not HandleAllocated Then
    Exit;
  InvalidatingRect := ClientRect;
  Dec( InvalidatingRect.Right, ButtonWidth );
  InvalidateRect( Handle, @InvalidatingRect, False );
end;

{------------------------------------------------------------------}

Function TDCCustomDateTimeEditor.IsCursorOverButton( X, Y : Integer ) : Integer;
Var
  Pos        : TPoint;
  ButtonRect : TRect;
begin
  ButtonRect := ClientRect;
  ButtonRect.Left := ButtonRect.Right - ButtonWidth;
  Pos.X := X;
  Pos.Y := Y;
  If PtInRect( ButtonRect, Pos ) Then
  begin
    If ShowMonthsPopup And ( Kind <> dekTime ) Or ( Y < ButtonRect.Bottom Div 2 ) Then
      Result := 0
    Else
      Result := 1;
    Exit;
  end;
  Result := -1;
end;

{------------------------------------------------------------------}

Function TDCCustomDateTimeEditor.IsFocused : Boolean;
begin
  Result := Focused Or FCalendarPopup.Focused;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.KeyDown( Var Key : Word; Shift : TShiftState );
begin
  If FCalendarPopup.Visible Then
    Case Key Of
      VK_RETURN :
          begin
            PopupLostFocus( False );
            FOmitAction := True;
          end;
      VK_ESCAPE :
          begin
            PopupLostFocus( True );
            FOmitAction := True;
          end;
    End;

{  If ( Key = VK_Down ) And ( ssAlt In Shift ) Then
    ShowMonthPopup;}

  If Shift <> [] Then
  begin
    Inherited;
    Exit;
  end;
  Case Key Of
    VK_UP,
    VK_Add      : IncreaseExpressionValue;
    VK_DOWN,
    VK_SUBTRACT : SubtractExpressionValue;
    VK_HOME     : SelectedFirstExpression;
    VK_END      : SelectedLastExpression;
    VK_LEFT     : ScrollExpressionLeft;
    VK_RIGHT    : ScrollExpressionRight;
    Else          Inherited;
  End;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.KeyPress( Var Key : Char );
begin
  If ( Key In [ '0' .. '9' ] ) And ( SelectedExpression >= 0 ) Then
    GetSelectedExpression.KeyPressed( Key );
  If Not FOmitAction Then
    Inherited;
  FOmitAction := False;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.KillScrollTimer;
begin
  If FScrollTimer <> 0 Then
  begin
    Windows.KillTimer( Handle, FScrollTimer );
    FScrollTimer := 0;
  end;
end;

{------------------------------------------------------------------}

Function TDCCustomDateTimeEditor.LastVisibleExpression : Integer;
Var
  I, Start, MaxWidth : Integer;
begin
  Start := 0;
  MaxWidth := ClientWidth - ButtonWidth;
  For I := TopExpression To FExpressionParts.Count - 1 Do
  begin
    Inc( Start, TDCSimpleExpression( FExpressionParts[I] ).GetRealWidth( Font.Handle, I = SelectedExpression ) );
    If Start > MaxWidth Then
    begin
      Result := I;
      If Result <> TopExpression Then
        Dec( Result );
      Exit;
    end;
  end;
  Result := FExpressionParts.Count - 1;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.MakeExpressionVisible( AItem : Integer );
Var
  MaxLength : Integer;
begin
  If Not HandleAllocated Then
    Exit;
  If ( AItem < TopExpression ) And ( AItem >= 0 ) Then
    FTopExpression := AItem
  Else
  begin
    If AItem <= LastVisibleExpression Then
      Exit;
    MaxLength := ClientWidth - ButtonWidth - TDCSimpleExpression( FExpressionParts[AItem] ).GetRealWidth( Font.Handle, AItem = SelectedExpression );
    Repeat
      Dec( MaxLength, TDCSimpleExpression( FExpressionParts[ AItem - 1 ] ).GetRealWidth( Font.Handle, ( AItem - 1 ) = SelectedExpression ) );
      If MaxLength > 0 Then
        Dec( AItem )
      Else
        break;
    Until False;
    FTopExpression := AItem;
  end;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.MouseMove( Shift : TShiftState; X, Y : Integer );
begin
  Inherited MouseMove( Shift, X, Y );

  If ShowMonthsPopup And ( Kind <> dekTime ) Then
    Exit;
    
  If Not MouseCapture Then
    KillScrollTimer
  Else
    If ( Y >= 0 ) And ( Y < ClientHeight ) And
       ( X >= 0 ) And ( X < ClientWidth - ButtonWidth ) Then
      KillScrollTimer
    Else
      CreateScrollTimer;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.Paint;
Var
  ButtonStart : Integer;
begin
  ButtonStart := ClientWidth - ButtonWidth;
  With Canvas.ClipRect Do
  begin
    If Left < ButtonStart Then
      PaintWorkArea;
    If Right > ButtonStart Then
      DrawButton;
  end;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.PaintWorkArea;
Var
  I, Start, RightBound : Integer;
  ControlImage         : TBitmap;
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
  Procedure _FillDrawBottomCorner;
  begin
    With TBitmap.Create Do
      try
        Canvas.Brush.Color := Self.Color;
        Width := FTextMask.Width;
        Height := FTextMask.Height;
        MaskBlt( ControlImage.Canvas.Handle, Start, 0, FTextMask.Width, FTextMask.Height, Canvas.Handle, 0, 0, FTextMask.Handle, 0, 0, MakeRop4( ROP_DstCopy, SrcCopy ) );
      finally
        Free;
      end;
    Inc( Start, FTextMaskRect.Right );
  end;
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
begin
  Start := 0;
  RightBound := ClientWidth - ButtonWidth;

  ControlImage := TBitmap.Create;
  With ControlImage.Canvas Do
  begin
    Brush.Color := Self.Color;
    Font := Self.Font;
  end;
  ControlImage.Width := RightBound;
  If FTextMaskRect.Bottom > ClientHeight Then
    ControlImage.Height := ClientHeight
  Else
    ControlImage.Height := FTextMaskRect.Bottom;

  For I := TopExpression To FExpressionParts.Count - 1 Do
  begin
    If I = SelectedExpression Then
      With ControlImage.Canvas Do
      begin
        Brush.Color := SelectedColor;
        Font.Color := SelectedFontColor;
      end;
    TDCSimpleExpression( FExpressionParts[I] ).DrawExpression( ControlImage.Canvas, Start, I = SelectedExpression );
    If I = SelectedExpression Then
      With ControlImage.Canvas Do
      begin
        Brush.Color := Self.Color;
        Font.Color := Self.Font.Color;
      end;
    If Start > RightBound Then
      break;
  end;

  If ( Win32Platform = VER_PLATFORM_WIN32_NT ) And ( Start < RightBound ) And
     Assigned( FTextMask ) Then
    _FillDrawBottomCorner;

  Canvas.Draw( 0, 0, ControlImage );
  If FTextMaskRect.Bottom < ClientHeight Then
  begin
    Canvas.Brush.Color := Self.Color;
    Canvas.FillRect( Rect( 0, FTextMaskRect.Bottom, RightBound, ClientHeight ) );
  end;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.PopupLostFocus( ACancel : Boolean );
begin
  If Not ACancel Then
  begin
    Date := FCalendarPopup.Date;
    ContentsChanged;
  end;
  {$IFNDEF CLX}
  If FCalendarPopup.Visible Then
  begin
    DCRemoveCalendarHooks;
    Application.UnhookMainWindow( AppHook );
  end;
  {$ENDIF}
  FCalendarPopup.Hide;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.ResetViewSettings;
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
  Procedure _AddTextDivider( Const AText : String );
  Var
    NewPart : TDCStringExpression;
  begin
    NewPart := TDCStringExpression.Create( Self );
    NewPart.Text := AText;
    FExpressionParts.Add( NewPart );
  end;
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
  Function _CreateString( ALetter : Char; ALen : Integer ) : String;
  begin
    Result := ALetter;
    For ALen := ALen DownTo 2 Do
      Result := Result + ALetter;
  end;
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
  Procedure _AddDatePart( ALetter : Char; ALen : Integer; ADateExression : Boolean );
  begin
    If ALen = 0 Then
      Exit;
    If ADateExression And ( ALetter = DateSeparator ) Or
       Not ADateExression And ( ALetter = TimeSeparator ) Then
    begin
      _AddTextDivider( _CreateString( ALetter, ALen ) );
      Exit;
    end;
    ALetter := AnsiLowerCase( ALetter )[1];
    Case ALetter Of
      'd' : FExpressionParts.Add( TDCDayExpression.Create( Self, ALen > 1 ) );
      'm' : If ADateExression Then
              FExpressionParts.Add( TDCMonthExpression.Create( Self, ALen ) )
            Else
              FExpressionParts.Add( TDCMinuteExpression.Create( Self, ALen > 1 ) );
      'y' : FExpressionParts.Add( TDCYearExpression.Create( Self, ALen <= 2 ) );
      'h' : FExpressionParts.Add( TDCHourExpression.Create( Self, ALen > 1 ) );
      's' : FExpressionParts.Add( TDCSecondExpression.Create( Self, ALen > 1 ) );
//      't' : FExpressionParts.Add( TDCMilliSecondExpression.Create( Self, ALen > 1 ) );
    End;
  end;
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
  Procedure _ParserExression( Const AFormatString : String; ADateExression : Boolean );
  Var
    Letter      : Char;
    TextStarted : Boolean;
    Len, I, Pos : Integer;
  begin
    Len := Length( AFormatString );
    If Len = 0 Then
      Exit;
    Letter := AFormatString[1];
    Pos := 1;
    TextStarted := Letter = '''';
    For I := 2 To Len Do
      If TextStarted Then
      begin
        If AFormatString[I] = '''' Then
        begin
          _AddTextDivider( Copy( ShortDateFormat, Pos + 1, I - Pos - 1 ) );
          TextStarted := False;
          Pos := I + 1;
        end;
      end
      Else
        If AFormatString[I] <> Letter Then
        begin
          _AddDatePart( Letter, I - Pos, ADateExression );
          Pos := I;
          Letter := AFormatString[I];
          TextStarted := Letter = '''';
        end;
    _AddDatePart( Letter, Len - Pos + 1, ADateExression );
  end;
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
Var
  SaveSelectedItem : Integer;
begin
  SaveSelectedItem := SelectedExpression;
  ClearExpressionParts;
  If Kind <> dekTime Then
    _ParserExression( ShortDateFormat, True );
  If Kind = dekDateTime Then
    _AddTextDivider( sDCDateTimeDivider );
  If Kind <> dekDate Then
    _ParserExression( LongTimeFormat, False );
  SelectedExpression := SaveSelectedItem;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.ScrollExpressionLeft;
Var
  NewItem : Integer;
begin
  If SelectedExpression = 0 Then
    NewItem := FExpressionParts.Count - 1
  Else
    NewItem := SelectedExpression - 1;

  SearchValidExpression( NewItem, -1 );
  If NewItem = -1 Then
  begin
    SelectedLastExpression;
    Exit;
  end;
  SelectedExpression := NewItem;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.ScrollExpressionRight;
Var
  NewItem : Integer;
begin
  If SelectedExpression < FExpressionParts.Count - 1 Then
    NewItem := SelectedExpression + 1
  Else
    NewItem := 0;

  SearchValidExpression( NewItem, 1 );
  If NewItem = -1 Then
  begin
    SelectedFirstExpression;
    Exit;
  end;
  SelectedExpression := NewItem;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.SearchValidExpression( Var ANewItem : Integer; ADirection : Integer );
Var
  MaxValue : Integer;
begin
  MaxValue := FExpressionParts.Count - 1;
  If ( ANewItem < 0 ) Or ( ANewItem >= MaxValue ) Then
    Exit;
  While ( ANewItem > 0 ) And ( ANewItem < MaxValue ) And
        Not TDCSimpleExpression( FExpressionParts[ ANewItem ] ).CanBeSelected Do
    Inc( ANewItem, ADirection );
  If Not TDCSimpleExpression( FExpressionParts[ ANewItem ] ).CanBeSelected Then
    ANewItem := -1;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.SelectedFirstExpression;
Var
  NewItem : Integer;
begin
  NewItem := 0;
  SearchValidExpression( NewItem, 1 );
  SelectedExpression := NewItem;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.SelectedLastExpression;
Var
  NewItem : Integer;
begin
  NewItem := FExpressionParts.Count - 1;
  SearchValidExpression( NewItem, -1 );
  SelectedExpression := NewItem;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.SetBorderStyle( AValue : TBorderStyle );
begin
  If FBorderStyle <> AValue Then
  begin
    FBorderStyle := AValue;
    RecreateWnd;
  end;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.SetDate( Const AValue: TDateTime);
begin
  DecodeDate( AValue, FYear, FMonth, FDay );
  ValidateYear;
  InvalidateWorkArea;  
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.SetDateTime( Const AValue : TDateTime );
begin
  Time := AValue;
  Date := AValue;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.SetKind( AValue : TDCDateTimeEditorKind );
begin
  If FKind = AValue Then
    Exit;
  FKind := AValue;
  ResetViewSettings;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.SetPressedButton( AValue : Integer );
begin
  If FPressedButton = AValue Then
    Exit;
  FPressedButton := AValue;
  DrawButton;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.SetSelectedColor( AValue : TColor );
begin
  If FSelectedColor <> AValue Then
    Exit;
  FSelectedColor := AValue;
  InvalidateWorkArea;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.SetSelectedExpression( AValue : Integer );
Var
  MaxValue : Integer;
begin
  If FSelectedExpression = AValue Then
    Exit;
  If AValue < -1 Then
    AValue := -1;
  MaxValue := FExpressionParts.Count - 1;
  If AValue > MaxValue Then
    AValue := MaxValue;

  If ( AValue >= 0 ) And Not TDCSimpleExpression( FExpressionParts[ AValue ] ).CanBeSelected Then
    Exit;
  FSelectedExpression := AValue;

  MakeExpressionVisible( FSelectedExpression );
  If FSelectedExpression >= 0 Then
    GetSelectedExpression.Enter;
  InvalidateWorkArea;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.SetSelectedFontColor( AValue : TColor );
begin
  If FSelectedFontColor = AValue Then
    Exit;
  FSelectedFontColor := AValue;
  InvalidateWorkArea;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.SetShowMonthsPopup( AValue : Boolean );
begin
  If FShowMonthsPopup = AValue Then
    Exit;
  FShowMonthsPopup := AValue;
  DrawButton;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.SetTime( Const AValue : TDateTime );
begin
  DecodeTime( AValue, FHour, FMin, FSec, FMSec );
  InvalidateWorkArea;  
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.SetTopExpression( AValue : Integer );
begin
  If FTopExpression = AValue Then
    Exit;
  FTopExpression := AValue;
  InvalidateWorkArea;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.ShowMonthPopup;
begin
  If FCalendarPopup.Visible Then
  begin
    PopupLostFocus( True );
    Exit;
  end;

  UpdatePopup;
  With FCalendarPopup Do
  begin
    Date := Self.Date;
    Show;
  end;
  {$IFNDEF CLX}
  If DCActiveDateTimeEdit <> Nil Then
    DCRemoveCalendarHooks;
  DCActiveDateTimeEdit := Self; 
  WHook := SetWindowsHookEx( WH_MOUSE, @DCCallCalendarWndProcHook, 0, GetCurrentThreadId );
  Application.HookMainWindow( AppHook );
  {$ENDIF}
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.SubtractExpressionValue;
begin
  If ( SelectedExpression >= 0 ) And ( GetSelectedExpression.ScrollValueDown ) Then
    ContentsChanged;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.UpdatePopup;
begin
  DCIntelligentPopup( Self, FCalendarPopup, False );   
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.ValidateMonth;
begin
  If FDay > MaxDay Then
    FDay := MaxDay;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.ValidateYear;
begin
  If IsLeapYear( Year ) Then
    FDaysNumber[2] := 29
  Else
    FDaysNumber[2] := 28;
  If FMonth = 2 Then
    ValidateMonth;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.WMEraseBkgnd( Var AMsg : TWMEraseBkgnd );
begin
  AMsg.Result := 1;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.WMGetDlgCode( Var AMsg : TWMGetDlgCode );
begin
  AMsg.Result := DLGC_WANTARROWS;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.WMKillFocus( Var AMsg : TMessage );
begin
  Inherited;
  If FOmitAction Or ( AMsg.wParam = Integer( FCalendarPopup.Handle ) ) Then
  begin
    FOmitAction := False;
    Exit;
  end;
  HidePopup;
  DoFocusLost;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.WMLButtonDown( Var AMsg : TWMLButtonDown );
Var
  NewItem : Integer;
begin
  Inherited;
  If Not ( csDesigning in ComponentState ) And ( Not Focused ) And CanFocus Then
    SetFocus;

  PressedButton := IsCursorOverButton( AMsg.XPos, AMsg.YPos );
  If PressedButton <> -1 Then
  begin
    If ShowMonthsPopup And ( Kind <> dekTime ) Then
      ShowMonthPopup
    Else
    begin
      CreateScrollTimer;
      Case PressedButton Of
        0  : IncreaseExpressionValue;
        1  : SubtractExpressionValue;
      End;
    end;
    Exit;
  end;

  HidePopup;

  NewItem := GetNearestExpression( AMsg.XPos, AMsg.YPos, True );
  If NewItem >= 0 Then
    SelectedExpression := NewItem;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.WMLButtonUp( Var AMsg : TWMLButtonUp );
begin
  Inherited;
  KillScrollTimer;
  PressedButton := -1;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.WMTimer( Var AMsg : TWMTimer );
Var
  P : TPoint;
begin
  If AMsg.TimerID <> 1 Then
  begin
    Inherited;
    Exit;
  end;
  If Not MouseCapture Then
  begin
    KillScrollTimer;
    Exit;
  end;
  GetCursorPos( P );
  P := ScreenToClient( P );
  PressedButton := IsCursorOverButton( P.X, P.Y ); 
  Case PressedButton Of
    0  : IncreaseExpressionValue;
    1  : SubtractExpressionValue;
    Else KillScrollTimer;
  End;
end;

{------------------------------------------------------------------}

Procedure TDCCustomDateTimeEditor.WMWindowPosChanging( Var AMsg : TWMWindowPosChanging );
begin
  Inherited;
  With AMsg.WindowPos^ Do
    If ( Flags And SWP_NOSIZE = 0 ) And FCalendarPopup.Visible Then
      UpdatePopup;
end;

{------------------------------------------------------------------}

end.

