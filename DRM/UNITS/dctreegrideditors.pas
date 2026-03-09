{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit DCTreeGridEditors;
{$I dc.inc}
Interface

Uses
  Windows, Messages, Graphics, SysUtils, Forms, Classes, Controls, StdCtrls,
  CommCtrl, TypInfo, DCGraphFunc, DCDateTimeEdit, DCnTree, DCTreeGrid;

Type
  TDCCustomTreeViewEditor = Class( TCustomControl )
  private
    FInitialNodeText : String;
    FModified        : Boolean;

    Procedure ParentSendMessage( AMsg : Cardinal );

    Procedure DMSetRect( Var AMsg : TDMSetRect ); message DM_SETRECT;
    Procedure DMSetParent( Var AMsg : TDMSetParent ); message DM_SETPARENT;

    Procedure DMSetText( Var AMsg : TDMSetText ); message DM_SETTEXT;
    Procedure DMShowEditor( Var AMsg : TDMShowEditor ); message DM_SHOWEDITOR;
    Procedure DMHideEditor( Var AMsg : TMessage ); message DM_HIDEEDITOR;
    Procedure DMGetModified( Var AMsg : TMessage ); message DM_GETMODIFIED;
    Procedure DMSaveChanges( Var AMsg : TMessage ); message DM_SAVECHANGES;
    Procedure DMCancelChanges( Var AMsg : TMessage ); message DM_CANCELCHANGES;

    Procedure WMKillFocus( Var AMsg : TMessage ); message WM_KILLFOCUS;
    Procedure WMKeyDown( Var AMsg : TMessage ); message WM_KEYDOWN;

    Procedure SetNodeText( Const AValue : String );
  protected
    FNodeText : String;

    Function  GetNewNodeText : String; virtual;
    Procedure DoSetText( Var AText : String ); virtual;
    Function  GetNodeText : String; virtual;
    Function  EditorFocused : Boolean; virtual;
    Procedure InitEditor( Const ShowEditorRec : TShowEditorRec ); virtual;
    Function  GetModified : Boolean; virtual;

    Procedure SetNodeTextSilently( Const ANewNodeText : String );
  public
    Constructor Create( AOwner : TComponent ); override;

    Property NodeText : String read GetNodeText write SetNodeText;
    Property InitialNodeText : String read FInitialNodeText;

    Property Modified : Boolean read GetModified write FModified;
  end;

{------------------------------------------------------------------}

  TDCTreeViewCheckBox = Class( TDCCustomTreeViewEditor )
  private
    FState : TCheckBoxState;

    Procedure WMEraseBkgnd( Var AMsg : TWMEraseBkgnd ); message WM_EraseBkgnd;
    Procedure WMKeyPress( Var AMsg : TMessage ); message WM_CHAR;

    Procedure DMDraw( Var AMsg : TDMDraw ); message DM_DRAW;
    Procedure DM_GETALWAYSEDIT(Var Message:TMessage);message DM_GETALWAYSEDIT;

    Procedure SetState( AValue : TCheckBoxState );
  protected
    Procedure Click; override;
    Procedure Paint; override;
    Procedure DoSetText( Var AText : String ); override;
    Procedure InitEditor( Const ShowEditorRec : TShowEditorRec ); override;

    Function  ConvertState( Const AText : String ) : TCheckBoxState;
    Procedure DrawCheckBoxOn( ACanvas : TCanvas; Const ARect : TRect; AChecked : TCheckBoxState );

    Procedure InvertState;
  public
    Property State : TCheckBoxState read FState write SetState;
  end;

{------------------------------------------------------------------}

  TDCCustomTreeViewDateTimeEditor = Class( TDCCustomTreeViewEditor )
  private
    FEditor : TDCDateTimeEditor;

    Procedure WMSetFocus( Var AMsg : TWMSetFocus ); message WM_SetFocus;

    Procedure ControlLoseFocus( ASender : TObject );
    Procedure ControlChanged( ASender : TObject );
    Procedure CalendarKeyPressed( Sender : TObject; Var Key : Char );

    Function GetKind : TDCDateTimeEditorKind;
    Procedure SetKind( AValue : TDCDateTimeEditorKind );
    Function GetDate : TDateTime;
    Function GetDateTime : TDateTime;
    Function GetSelectedColor : TColor;
    Function GetSelectedFontColor : TColor;
    Function GetShowMonthsPopup : Boolean;
    Function GetTime : TDateTime;
    Procedure SetDate( Const AValue : TDateTime );
    Procedure SetDateTime( Const AValue : TDateTime );
    Procedure SetSelectedColor( AValue : TColor );
    Procedure SetSelectedFontColor( AValue : TColor );
    Procedure SetShowMonthsPopup( AValue : Boolean );
    Procedure SetTime( Const AValue : TDateTime );
  protected
    Procedure DoSetText( Var AText : String ); override;
    Function  GetNodeText : String; override;
    Function  EditorFocused : Boolean; override;
    Procedure InitEditor( Const ShowEditorRec : TShowEditorRec ); override;

    Property Editor : TDCDateTimeEditor read FEditor;
  public
    Constructor Create( AOwner : TComponent ); override;
    Destructor Destroy; override;

    Property Kind            : TDCDateTimeEditorKind Read GetKind Write SetKind;
    Property ShowMonthsPopup : Boolean               Read GetShowMonthsPopup Write SetShowMonthsPopup;

    Property SelectedFontColor : TColor Read GetSelectedFontColor Write SetSelectedFontColor;
    Property SelectedColor     : TColor Read GetSelectedColor Write SetSelectedColor;

    Property Date     : TDateTime Read GetDate Write SetDate;
    Property Time     : TDateTime Read GetTime Write SetTime;
    Property DateTime : TDateTime Read GetDateTime Write SetDateTime;
  end;

{------------------------------------------------------------------}

  TDCTreeViewDateEditor = Class( TDCCustomTreeViewDateTimeEditor )
  public
    Constructor Create( AOwner : TComponent ); override;
  end;

{------------------------------------------------------------------}

  TDCTreeViewTimeEditor = Class( TDCCustomTreeViewDateTimeEditor )
  public
    Constructor Create( AOwner : TComponent ); override;
  end;

{------------------------------------------------------------------}

  TDCTreeViewDateTimeEditor = Class( TDCCustomTreeViewDateTimeEditor )
  public
    Constructor Create( AOwner : TComponent ); override;
  end;

{------------------------------------------------------------------}

  TDCCustomTreeViewBtnEditor = Class( TDCCustomTreeViewEditor )
  private
    FEditor          : TEdit;
    FPopupWindow     : TWinControl;
    FOldPopupWndProc : Integer;
    FPopupAlign      : TDCPopupAlign;
    FPopupJustClosed : Boolean;

    FButtonPressed   : Boolean;

    Procedure WMWindowPosChanged( Var AMsg : TWMWindowPosChanged ); message WM_WINDOWPOSCHANGED;
    Procedure WMLButtonDown( Var AMsg : TWMLButtonDown ); message WM_LBUTTONDOWN;
    Procedure WMMouseMove( Var AMsg : TWMMouseMove ); message WM_MOUSEMOVE;
    Procedure WMLButtonUp( Var AMsg : TWMLButtonUp ); message WM_LBUTTONUP;

    Procedure CMVisibleChanged( Var AMsg : TMessage ); message CM_VISIBLECHANGED;

    Function  AppHook( Var AMsg : TMessage ) : Boolean;

    Procedure PopupWindowHook( Var AMsg : TMessage );
    Procedure SetPopupWindowHook;
    Procedure RemovePopupWindowHook;

    Procedure SetButtonPressed( AValue : Boolean );
  protected
    Procedure Paint; override;

    Function  ButtonWidth : Integer;
    Procedure DrawButton;
    Function  IsCursorOverButton( X, Y : Integer ) : Boolean;

    Function GetDrawingRect : TRect;

    Function ProcessKey( Var AMsg : TMessage ) : Boolean; virtual;

    Procedure DoSetText( Var AText : String ); override;
    Function  GetNodeText : String; override;
    Function  EditorFocused : Boolean; override;
    Procedure InitEditor( Const ShowEditorRec : TShowEditorRec ); override;
    Function  GetModified : Boolean; override;

    Procedure UpdateEditor;

    Procedure ShowPopup;
    Procedure PopupLostFocus( ACancel : Boolean );
    Procedure HidePopup;

    Function  DoShowPopup : Boolean; virtual;
    Procedure ValidatePopupValue; virtual; abstract;
    Procedure CancelPopupValue; virtual;
    Function  GetPopupWindowClass : TWinControlClass; virtual; abstract;
    Function  PopupNeedFocus : Boolean; virtual;
    Function  QueryKeyboardPopupClose : Boolean; virtual;

    Property Editor : TEdit read FEditor;
    Property PopupWindow : TWinControl read FPopupWindow;
    Property ButtonPressed : Boolean read FButtonPressed write SetButtonPressed;
  public
    Constructor Create( AOwner : TComponent ); override;
  end;

{------------------------------------------------------------------}

  TDCMemoTreeViewEditor = Class( TDCCustomTreeViewBtnEditor )
  private
    procedure DMSetEditorData(var AMsg: TMessage); message DM_SETEDITORDATA;
  protected
    Function  DoShowPopup : Boolean; override;
    Procedure ValidatePopupValue; override;
    Function GetPopupWindowClass : TWinControlClass; override;
    Function PopupNeedFocus : Boolean; override;
    Function QueryKeyboardPopupClose : Boolean; override;
  end;

{------------------------------------------------------------------}

  TDCPickListTreeViewEditor = class(TDCCustomTreeViewBtnEditor)
  private
    procedure DMSetEditorData(var AMsg: TMessage); message DM_SETEDITORDATA;
    function GetItems: TStrings;
    procedure SetItems(const Value: TStrings);
  protected
    function DoShowPopup: Boolean; override;
    procedure ValidatePopupValue; override;
    function GetPopupWindowClass: TWinControlClass; override;
    procedure DoSetText(var AText: string); override;
  public
    property Items : TStrings read GetItems write SetItems;
  end;

{------------------------------------------------------------------}

  TDCPickListEditorProps = class(TEditorProps)
  private
    FItems: TStrings;
    procedure SetItems(Value: TStrings);
  public
    constructor Create(AColumn: TDCTreeColumn); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property Items: TStrings read FItems write SetItems;
  end;

{------------------------------------------------------------------}

  TDCMemoEditorProps = class(TEditorProps)
  private
    FWordWrap: Boolean;
    FScrollBars: TScrollStyle;
  public
    constructor Create(AColumn: TDCTreeColumn); override;
    procedure Assign(Source: TPersistent); override;
  published
    property WordWrap: Boolean read FWordWrap write FWordWrap;
    property ScrollBars: TScrollStyle read FScrollBars write FScrollBars;
  end;

{------------------------------------------------------------------}

  TDCTreeViewImageEditor = class(TDCCustomTreeViewBtnEditor)
  private
    procedure DMSetEditorData(var AMsg: TMessage); message DM_SETEDITORDATA;
    procedure DMDraw(var AMsg: TDMDraw); message DM_DRAW;
    procedure InternalDraw(ACanvas: TCanvas; ARect: TRect;
      AColumn: TDCTreeColumn; const AText: string);
  protected
    procedure Paint; override;
    function DoShowPopup: Boolean; override;
    procedure ValidatePopupValue; override;
    function GetPopupWindowClass: TWinControlClass; override;
    procedure DoSetText(var AText: string); override;
  public
    Constructor Create( AOwner : TComponent ); override;
  end;

{------------------------------------------------------------------}

  TDCImageEditorProps = class(TEditorProps)
  private
    FImages: TImageList;
    FComp: TComponent;
    procedure SetImages(val: TImageList);
  public
    constructor Create(AColumn: TDCTreeColumn); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property Images: TImageList read FImages write SetImages;
  end;

{------------------------------------------------------------------}

Implementation

Const
  sDCMinPopupWidth = 110;
  sDCMinPopupHeight = 40;

{------------------------------------------------------------------}

Type
  TDCNewEdit = Class( TEdit )
  protected
    Procedure WndProc( Var AMsg : TMessage ); override;
  end;

{------------------------------------------------------------------}

  TDCMemoPopup = Class( TCustomMemo )
  private
    Procedure WMGetDlgCode( Var AMsg : TWMGetDlgCode ); message WM_GETDLGCODE;
  protected
    Procedure CreateParams( Var Params : TCreateParams ); override;
  public
    Constructor Create( AOwner : TComponent ); override;
  end;

{------------------------------------------------------------------}

  TDCPickListPopup = class(TListBox)
  private
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMMouseMove(var Message: TWMMouseMove); message WM_MOUSEMOVE;
    procedure WMLButtonUp(var AMsg: TWMLButtonUp); message WM_LBUTTONUP;
  protected
    Procedure CreateParams( Var Params : TCreateParams ); override;
  public
    Constructor Create( AOwner : TComponent ); override;
  end;

{------------------------------------------------------------------}

  TDCImagePopup = class(TDCPickListPopup)
  private
    FImages: TImageList;
    procedure DrawItem(Index: Integer; Rect: TRect;
      State: TOwnerDrawState); override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

{------------------------------------------------------------------}

  TComponent1 = class(TComponent)
  private
    FImageProps: TDCImageEditorProps;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  end;

{------------------------------------------------------------------}

{$IFNDEF CLX}
Var
  DCActiveBtnEditor : TDCCustomTreeViewBtnEditor = Nil;
  MouseHook : HHook;

{------------------------------------------------------------------}

Procedure DCRemoveBtnEditorHooks;
begin
  If GetCapture <> 0 Then
    SendMessage( GetCapture, WM_CANCELMODE, 0, 0 );

  UnhookWindowsHookEx( MouseHook );
  DCActiveBtnEditor := Nil;
end;

{------------------------------------------------------------------}

Function DCCallBtnEditorMouseProcHook( nCode : Integer; wParam : Longint; Var mhs : TMouseHookStruct ) : LongInt; stdcall;
Var
  PopupRect : TRect;
begin
  If DCActiveBtnEditor <> Nil Then
  begin
    GetWindowRect( DCActiveBtnEditor.PopupWindow.Handle, PopupRect );
    If ( ( wParam = WM_LBUTTONDOWN ) Or ( wParam = WM_NCLBUTTONDOWN ) ) And
      Not PtInRect( PopupRect, mhs.pt ) Then
    begin
      GetWindowRect( DCActiveBtnEditor.Handle, PopupRect );
      DCActiveBtnEditor.FPopupJustClosed := PtInRect( PopupRect, mhs.pt );
      DCActiveBtnEditor.PopupLostFocus( True );
    end;
  end;
  Result := CallNextHookEx( MouseHook, nCode, wParam, Integer( @mhs ) );
end;
{$ENDIF}

{------------------------------------------------------------------}

{ TDCCustomTreeViewEditor }

Constructor TDCCustomTreeViewEditor.Create( AOwner : TComponent );
begin
  Inherited;
  ControlStyle := ControlStyle - [csDoubleClicks];
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewEditor.DMCancelChanges( Var AMsg : TMessage );
begin
  NodeText := InitialNodeText;
  Modified := False;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewEditor.DMGetModified( Var AMsg : TMessage );
begin
  AMsg.Result := Integer( Modified );
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewEditor.DMHideEditor( Var AMsg : TMessage );
begin
  Hide;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewEditor.DMSaveChanges( Var AMsg : TMessage );
begin
  String( Pointer( AMsg.wParam )^ ) := GetNewNodeText;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewEditor.DMSetParent( Var AMsg : TDMSetParent );
begin
  Parent := TWinControl( AMsg.Parent );
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewEditor.DMSetRect( Var AMsg : TDMSetRect );
begin
  With AMsg.ARect^ Do
    SetBounds( Left, Top, Right - Left, Bottom - Top );
  {if AMsg.Bordered then
    BorderStyle := bsSindle
  else
    BorderStyle := bsNone;}
  AMsg.Result := Integer( True );
end;

Procedure TDCCustomTreeViewEditor.DMSetText( Var AMsg : TDMSetText );
begin
  NodeText := AMsg.Text;
  FInitialNodeText := AMsg.Text;
  Modified := False;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewEditor.DMShowEditor( Var AMsg : TDMShowEditor );
begin
  InitEditor( AMsg.ShowEditorRec^ );
  Show;
  SetFocus;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewEditor.DoSetText( Var AText : String );
begin
end;

{------------------------------------------------------------------}

Function TDCCustomTreeViewEditor.EditorFocused : Boolean;
begin
  Result := Focused;
end;

{------------------------------------------------------------------}

Function TDCCustomTreeViewEditor.GetModified : Boolean;
begin
  Result := FModified;
end;

{------------------------------------------------------------------}

Function TDCCustomTreeViewEditor.GetNewNodeText : String;
begin
  Result := NodeText;
end;

{------------------------------------------------------------------}

Function TDCCustomTreeViewEditor.GetNodeText : String;
begin
  Result := FNodeText;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewEditor.InitEditor( Const ShowEditorRec : TShowEditorRec );
begin
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewEditor.ParentSendMessage( AMsg : Cardinal );
begin
  SendMessage( Parent.Handle, AMsg, 0, 0 );
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewEditor.SetNodeText( Const AValue : String );
Var
  NewNodeText : String;
begin
  NewNodeText := AValue;
  DoSetText( NewNodeText );
  SetNodeTextSilently( NewNodeText );
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewEditor.SetNodeTextSilently( Const ANewNodeText  : String );
begin
  FNodeText := ANewNodeText;
  Modified := True;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewEditor.WMKeyDown( Var AMsg  : TMessage );
begin
  Case AMsg.wParam Of
    VK_ESCAPE  : ParentSendMessage( DM_CANCELCHANGES );
    VK_RETURN  : ParentSendMessage( DM_SAVECHANGES );
    Else
      Inherited;
  End;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewEditor.WMKillFocus( Var AMsg : TMessage );
begin
  If Not EditorFocused Then
    ParentSendMessage( DM_KILLFOCUS );
  Inherited;
end;

{------------------------------------------------------------------}

{ TDCCustomTreeViewCheckBox }

Procedure TDCTreeViewCheckBox.Click;
begin
  InvertState;
end;

{------------------------------------------------------------------}

{$IFNDEF D4}
var
  BooleanIdents: array [Boolean] of string = ('False', 'True');
{$ENDIF}

Function TDCTreeViewCheckBox.ConvertState( Const AText : String ) : TCheckBoxState;
begin
  If AnsiCompareText( AText, BooleanIdents[True] ) = 0 Then
    Result := cbChecked
  Else
    Result := cbUnchecked;
end;

{------------------------------------------------------------------}

Procedure TDCTreeViewCheckBox.DMDraw( Var AMsg: TDMDraw );
begin
  With AMsg Do
  begin
    With DrawRec^ Do
      DrawCheckBoxOn( Canvas, DrawRect^, ConvertState( Text ) );
    Result := Integer( True );
  end;
end;

{------------------------------------------------------------------}

Procedure TDCTreeViewCheckBox.DM_GETALWAYSEDIT(Var Message:TMessage);
Begin
  Message.Result:=1;
End;

{------------------------------------------------------------------}

Procedure TDCTreeViewCheckBox.DoSetText( Var AText : String );
begin
  FState := ConvertState( AText );
end;

{------------------------------------------------------------------}

Procedure TDCTreeViewCheckBox.DrawCheckBoxOn( ACanvas : TCanvas; Const ARect : TRect;
  AChecked : TCheckBoxState );
Var
  Value        : Integer;
  CheckBoxRect : TRect;
begin
  With ARect Do
  begin
    CheckBoxRect.Left := 0;
    CheckBoxRect.Top := 0;
    CheckBoxRect.Right := Right - Left;
    CheckBoxRect.Bottom := Bottom - Top;
  end;

  Value := DCDefaultCheckWidth;
  If Value < CheckBoxRect.Right Then
    CheckBoxRect.Right := Value;

  Value := DCDefaultCheckHeight;
  If Value < CheckBoxRect.Bottom Then
    CheckBoxRect.Bottom := Value;

  With CheckBoxRect Do
    If Right > Bottom Then
      Right := Bottom
    Else
      Bottom := Right;

  OffsetRect( CheckBoxRect, ( ARect.Left + ARect.Right - CheckBoxRect.Right ) Div 2,
             ( ARect.Top + ARect.Bottom - CheckBoxRect.Bottom ) Div 2 );
  DCFillExcludeRect( ACanvas, ARect, CheckBoxRect );
  DCDrawCheckBox( ACanvas, CheckBoxRect, AChecked, True, False, False );
end;

{------------------------------------------------------------------}

Procedure TDCTreeViewCheckBox.InitEditor( Const ShowEditorRec : TShowEditorRec );
begin
  Canvas.Brush.Color := ShowEditorRec.SelectedColor;
  Canvas.Font := ShowEditorRec.CellFont;
end;

{------------------------------------------------------------------}

Procedure TDCTreeViewCheckBox.InvertState;
begin
  If State = cbUnchecked Then
    State := cbChecked
  Else
    State := cbUnchecked;
end;

{------------------------------------------------------------------}

Procedure TDCTreeViewCheckBox.Paint;
begin
  DrawCheckBoxOn( Canvas, Rect( 0, 0, Width, Height ), State );
end;

{------------------------------------------------------------------}

Procedure TDCTreeViewCheckBox.SetState( AValue : TCheckBoxState );
begin
  If FState = AValue Then
    Exit;
  FState := AValue;
  SetNodeTextSilently( BooleanIdents[FState = cbChecked] );
  Modified := True;
  Invalidate;
end;

{------------------------------------------------------------------}

Procedure TDCTreeViewCheckBox.WMEraseBkgnd( Var AMsg : TWMEraseBkgnd );
begin
  AMsg.Result := 1;
end;

{------------------------------------------------------------------}

Procedure TDCTreeViewCheckBox.WMKeyPress( Var AMsg : TMessage );
begin
  If AMsg.wParam = VK_SPACE Then
    InvertState;
end;

{------------------------------------------------------------------}

{ TDCCustomTreeViewDateTimeEditor }

Procedure TDCCustomTreeViewDateTimeEditor.CalendarKeyPressed( Sender : TObject; Var Key : Char );
begin
  Case Key Of
    #27 : ParentSendMessage( DM_CANCELCHANGES );
    #13 : ParentSendMessage( DM_SAVECHANGES );
  End;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewDateTimeEditor.ControlChanged( ASender : TObject );
begin
  Modified := True;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewDateTimeEditor.ControlLoseFocus( ASender : TObject );
begin
  If Not Editor.IsFocused And Not Focused Then
    ParentSendMessage( DM_KILLFOCUS );
end;

{------------------------------------------------------------------}

Constructor TDCCustomTreeViewDateTimeEditor.Create( AOwner : TComponent );
begin
  Inherited;
  FEditor := TDCDateTimeEditor.Create( Self );
  With FEditor Do
  begin
    Align := alClient;
    Parent := Self;
    Ctl3D := False;
    OnFocusLost := ControlLoseFocus;
    OnChange := ControlChanged;
    OnKeyPress := CalendarKeyPressed;
  end;
end;

{------------------------------------------------------------------}

Destructor TDCCustomTreeViewDateTimeEditor.Destroy;
begin
  FEditor.Free;
  Inherited;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewDateTimeEditor.DoSetText( Var AText : String );
begin
  try
    Case Kind Of
      dekDate : Editor.DateTime := StrToDate( AText );
      dekTime : Editor.DateTime := StrToTime( AText );
      Else      Editor.DateTime := StrToDateTime( AText );
    End;
  except
    Editor.DateTime := Now;
  end;
  Editor.Modified := False;
  AText := DateTimeToStr( Editor.DateTime );
end;

{------------------------------------------------------------------}

Function TDCCustomTreeViewDateTimeEditor.EditorFocused : Boolean;
begin
  Result := Editor.IsFocused;
end;

{------------------------------------------------------------------}

Function TDCCustomTreeViewDateTimeEditor.GetDate : TDateTime;
begin
  Result := Editor.Date;
end;

{------------------------------------------------------------------}

Function TDCCustomTreeViewDateTimeEditor.GetDateTime : TDateTime;
begin
  Result := Editor.DateTime;
end;

{------------------------------------------------------------------}

Function TDCCustomTreeViewDateTimeEditor.GetKind : TDCDateTimeEditorKind;
begin
  Result := Editor.Kind;
end;

{------------------------------------------------------------------}

Function TDCCustomTreeViewDateTimeEditor.GetNodeText : String;
begin
  Case Kind Of
    dekDate  : Result := DateToStr( Editor.Date );
    dekTime  : Result := TimeToStr( Editor.Time );
    Else      Result := DateTimeToStr( Editor.DateTime );
  End;
end;

{------------------------------------------------------------------}

Function TDCCustomTreeViewDateTimeEditor.GetSelectedColor : TColor;
begin
  Result := Editor.SelectedColor;
end;

{------------------------------------------------------------------}

Function TDCCustomTreeViewDateTimeEditor.GetSelectedFontColor : TColor;
begin
  Result := Editor.SelectedFontColor;
end;

{------------------------------------------------------------------}

Function TDCCustomTreeViewDateTimeEditor.GetShowMonthsPopup : Boolean;
begin
  Result := Editor.ShowMonthsPopup;
end;

{------------------------------------------------------------------}

Function TDCCustomTreeViewDateTimeEditor.GetTime : TDateTime;
begin
  Result := Editor.Time;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewDateTimeEditor.InitEditor( Const ShowEditorRec : TShowEditorRec );
begin
  With ShowEditorRec Do
  Begin
    Editor.Color := Color;
    Editor.Font := CellFont;
    Editor.SelectedFontColor := SelectedTextColor;
    Editor.SelectedColor := SelectedColor;
  End;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewDateTimeEditor.SetDate( Const AValue : TDateTime );
begin
  Editor.Date := AValue;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewDateTimeEditor.SetDateTime( Const AValue : TDateTime );
begin
  Editor.DateTime := AValue;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewDateTimeEditor.SetKind( AValue : TDCDateTimeEditorKind );
begin
  Editor.Kind := AValue;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewDateTimeEditor.SetSelectedColor( AValue : TColor );
begin
  Editor.SelectedColor := AValue;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewDateTimeEditor.SetSelectedFontColor( AValue : TColor );
begin
  Editor.SelectedFontColor := AValue;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewDateTimeEditor.SetShowMonthsPopup( AValue : Boolean );
begin
  Editor.ShowMonthsPopup := AValue;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewDateTimeEditor.SetTime( Const AValue : TDateTime );
begin
  Editor.Time := AValue;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewDateTimeEditor.WMSetFocus( Var AMsg : TWMSetFocus );
begin
  Inherited;
  Editor.SetFocus;
end;

{------------------------------------------------------------------}

{ TDCTreeViewDateEditor }

Constructor TDCTreeViewDateEditor.Create( AOwner : TComponent );
begin
  Inherited;
  Kind := dekDate;
end;

{------------------------------------------------------------------}

{ TDCTreeViewTimeEditor }

Constructor TDCTreeViewTimeEditor.Create( AOwner : TComponent );
begin
  Inherited;
  Kind := dekTime;
end;

{------------------------------------------------------------------}

{ TDCTreeViewDateTimeEditor }

Constructor TDCTreeViewDateTimeEditor.Create( AOwner : TComponent );
begin
  Inherited;
  Kind := dekDateTime;
end;

{------------------------------------------------------------------}

{ TDCCustomTreeViewBtnEditor }

Function TDCCustomTreeViewBtnEditor.AppHook( Var AMsg : TMessage ) : Boolean;
begin
  With AMsg Do
    Case Msg Of
      WM_ACTIVATEAPP  : PopupLostFocus( True );
    End;
  Result := False;
end;

{------------------------------------------------------------------}

Function TDCCustomTreeViewBtnEditor.ButtonWidth : Integer;
begin
  Result := GetSystemMetrics( SM_CXHTHUMB ) + 4;
  If Result > Height - 2 Then
    Result := Height - 2;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewBtnEditor.CancelPopupValue;
begin
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewBtnEditor.CMVisibleChanged( Var AMsg : TMessage );
begin
  Inherited;
  If {$IFDEF D4}Boolean( AMsg.wParam ){$ELSE}Visible{$ENDIF} Then
  begin
    PostMessage( Editor.Handle, WM_Activate, WA_ACTIVE, 0 );
    FButtonPressed := False;
    UpdateEditor;
  end;
  HidePopup;
end;

{------------------------------------------------------------------}

Constructor TDCCustomTreeViewBtnEditor.Create( AOwner : TComponent );
begin
  Inherited;
  FEditor := TDCNewEdit.Create( Self );
  Editor.BorderStyle := bsNone;
  Editor.Parent := Self;
  UpdateEditor;

  FPopupWindow := GetPopupWindowClass.Create( Self );
  With FPopupWindow Do
  begin
    Visible := False;
    Parent := Self;
  end;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewBtnEditor.DoSetText( Var AText : String );
begin
  Editor.Text := AText;
end;

{------------------------------------------------------------------}

Function TDCCustomTreeViewBtnEditor.DoShowPopup : Boolean;
begin
  Result := True;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewBtnEditor.DrawButton;
Const
  KindByEnabled : Array[Boolean] Of Integer = ( DFCS_INACTIVE, 0 );
  PushedFlag : Array[Boolean] Of Integer = ( 0, DFCS_PUSHED );
Var
  ButtonRect : TRect;
begin
  With ButtonRect Do
  begin
    Right := ClientWidth - 2;
    Left := Right - ButtonWidth + 2;
    Top := 2;
    Bottom := ClientHeight - 2;
  end;

  DrawFrameControl( Canvas.Handle, ButtonRect, DFC_SCROLL, DFCS_SCROLLDOWN Or
    KindByEnabled[Enabled] Or PushedFlag[ButtonPressed] )
end;

{------------------------------------------------------------------}

Function TDCCustomTreeViewBtnEditor.EditorFocused : Boolean;
begin
  Result := Focused Or Editor.Focused Or PopupWindow.Visible And PopupWindow.Focused;
end;

{------------------------------------------------------------------}

Function TDCCustomTreeViewBtnEditor.GetDrawingRect : TRect;
begin
  Result := ClientRect;
  InflateRect( Result, -2, -2 );
  Result.Right := Result.Right - ButtonWidth + 2;
end;

{------------------------------------------------------------------}

Function TDCCustomTreeViewBtnEditor.GetModified : Boolean;
begin
  Result := Editor.Modified Or Inherited GetModified;
end;

{------------------------------------------------------------------}

Function TDCCustomTreeViewBtnEditor.GetNodeText : String;
begin
  Result := Editor.Text;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewBtnEditor.HidePopup;
begin
  If FPopupWindow.Visible Then
    PopupLostFocus( True );
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewBtnEditor.InitEditor( Const ShowEditorRec : TShowEditorRec );
begin
  Editor.Color := ShowEditorRec.Color;
  Editor.Font := ShowEditorRec.CellFont;
end;

{------------------------------------------------------------------}

Function TDCCustomTreeViewBtnEditor.IsCursorOverButton( X, Y : Integer ) : Boolean;
Var
  Pos : TPoint;
  ButtonRect : TRect;
begin
  With ButtonRect Do
  begin
    Top := 1;
    Bottom := Height - 2;
    Right := Width - 1;
    Left := Right - ButtonWidth;
  end;
  Pos.X := X;
  Pos.Y := Y;
  Result := PtInRect( ButtonRect, Pos );
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewBtnEditor.Paint;
Var
  DrawingRect : TRect;
begin
  Inherited;
  With Canvas Do
  begin
    DrawingRect := ClientRect;
    DrawEdge( Canvas.Handle, DrawingRect, BDR_SUNKENOUTER Or BDR_SUNKENINNER, BF_RECT );
  end;
  DrawButton;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewBtnEditor.PopupLostFocus( ACancel : Boolean );
begin
  Invalidate;
  If Not ACancel Then
  begin
    ValidatePopupValue;
    Modified := True;
  end
  Else
    CancelPopupValue;
  If FPopupWindow.Visible Then
  begin
    DCRemoveBtnEditorHooks;
    Application.UnhookMainWindow( AppHook );
  end;
  RemovePopupWindowHook;

  FPopupWindow.Hide;
  SetWindowPos( FPopupWindow.Handle, 0, 0, 0, 0, 0, SWP_HIDEWINDOW Or SWP_NOMOVE Or SWP_NOSIZE );

  If PopupNeedFocus Then
  begin
    If Editor.Visible Then
      Editor.SetFocus
    Else
      SetFocus;
  end;
end;

{------------------------------------------------------------------}

Function TDCCustomTreeViewBtnEditor.PopupNeedFocus : Boolean;
begin
  Result := False;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewBtnEditor.PopupWindowHook( Var AMsg : TMessage );
Var
  ParentForm : TCustomForm;
begin
  With AMsg Do
  begin
    Case Msg Of
      WM_NCACTIVATE :
          begin
            ParentForm := GetParentForm( Parent );
            If Assigned( ParentForm ) Then
              SendMessage( ParentForm.Handle, WM_NCACTIVATE, 1, 0 );
          end;
      WM_KeyDown:
          Case wParam Of
            VK_Escape : PopupLostFocus( True );
            VK_Return:
              If QueryKeyboardPopupClose Then
                PopupLostFocus( False );
          End;
      WM_WindowPosChanging:
          If GetWindowLong( PopupWindow.Handle, GWL_STYLE ) And WS_ThickFrame <> 0 Then
            With pWindowPos( lParam )^ Do
              If Flags And SWP_NOSIZE = 0 Then
              begin
                If cx < sDCMinPopupWidth Then
                  cx := sDCMinPopupWidth;
                If cy < sDCMinPopupHeight Then
                  cy := sDCMinPopupHeight;
              end;
{      WM_KillFocus :
          If THandle( wParam ) <> PopupWindow.Handle Then
          begin
//            PopupLostFocus( True );
            Exit;
          end;}
    End;
    Result := CallWindowProc( Pointer( FOldPopupWndProc ), PopupWindow.Handle, Msg, wParam, lParam );
    Case Msg Of
      WM_NCHITTEST:
          Case Result Of
            HTTOP:
                If FPopupAlign In [paLeftTop, paRightTop] Then
                  Result := HTNOWHERE;
            HTBOTTOM:
                If FPopupAlign In [paLeftBottom, paRightBottom] Then
                  Result := HTNOWHERE;
            HTLEFT:
                If FPopupAlign In [paLeftTop, paLeftBottom] Then
                  Result := HTNOWHERE;
            HTRIGHT:
                If FPopupAlign In [paRightTop, paRightBottom] Then
                  Result := HTNOWHERE;

            HTTOPLEFT:
                Case FPopupAlign Of
                  paLeftTop     : Result := HTNOWHERE;
                  paLeftBottom  : Result := HTBOTTOM;
                  paRightTop    : Result := HTRIGHT;
                End;
            HTTOPRIGHT:
                Case FPopupAlign Of
                  paLeftTop      : Result := HTRIGHT;
                  paRightTop     : Result := HTNOWHERE;
                  paRightBottom  : Result := HTTOP;
                End;
            HTBOTTOMLEFT:
                Case FPopupAlign Of
                  paLeftTop      : Result := HTBOTTOM;
                  paLeftBottom   : Result := HTNOWHERE;
                  paRightBottom  : Result := HTLEFT;
                End;
            HTBOTTOMRIGHT:
                Case FPopupAlign Of
                  paLeftBottom   : Result := HTRIGHT;
                  paRightTop     : Result := HTBOTTOM;
                  paRightBottom  : Result := HTNOWHERE;
                End;
          End;
      WM_MOUSEACTIVATE:
          Result := MA_NOACTIVATE;
    End;
  end;
end;

{------------------------------------------------------------------}

Function TDCCustomTreeViewBtnEditor.ProcessKey( Var AMsg : TMessage ) : Boolean;
begin
  Result := PopupWindow.Visible;
  If Result Then
  begin
    If AMsg.Msg = WM_Char Then
      Case AMsg.wParam Of
        VK_Escape  : PopupLostFocus( True );
        VK_Return  : PopupLostFocus( False );
        Else         PopupWindow.Dispatch( AMsg );
      End
    Else
      PopupWindow.Dispatch( AMsg );
  end
  Else
    With AMsg Do
    begin
      If Msg = WM_Char Then
        Case Char(TWMKey(AMsg).CharCode) Of
          #27:
              begin
                ParentSendMessage( DM_CANCELCHANGES );
                ProcessKey := True;
              end;
          #13:
              begin
                ParentSendMessage( DM_SAVECHANGES );
                ProcessKey := True;
              end;
        End;
      If ( Msg = WM_SysKeyDown ) And ( wParam = VK_Down ) Then
      begin
        ShowPopup;
        ProcessKey := True;
      end;
    end;
end;

{------------------------------------------------------------------}

Function TDCCustomTreeViewBtnEditor.QueryKeyboardPopupClose : Boolean;
begin
  Result := True;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewBtnEditor.RemovePopupWindowHook;
begin
  SetWindowLong( PopupWindow.Handle, GWL_WNDPROC, FOldPopupWndProc );
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewBtnEditor.SetButtonPressed( AValue : Boolean );
begin
  If FButtonPressed = AValue Then
    Exit;
  FButtonPressed := AValue;
  DrawButton;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewBtnEditor.SetPopupWindowHook;
begin
  FOldPopupWndProc := GetWindowLong( PopupWindow.Handle, GWL_WNDPROC );
  SetWindowLong( PopupWindow.Handle, GWL_WNDPROC, Longint( MakeObjectInstance( PopupWindowHook ) ) );
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewBtnEditor.ShowPopup;
begin
  If PopupWindow.Visible Then
  begin
    PopupLostFocus( True );
    Exit;
  end;

  If Not DoShowPopup Then
    Exit;
  FPopupAlign := DCIntelligentPopup( Self, PopupWindow, True );
  SetPopupWindowHook;
  If Not PopupNeedFocus Then
    Windows.SetParent( PopupWindow.Handle, 0 );
  PopupWindow.Show;
  If PopupNeedFocus Then
    PopupWindow.SetFocus;

  If DCActiveBtnEditor <> Nil Then
    DCRemoveBtnEditorHooks;

  DCActiveBtnEditor := Self;
  MouseHook := SetWindowsHookEx( WH_MOUSE, @DCCallBtnEditorMouseProcHook, 0, GetCurrentThreadId );
  Application.HookMainWindow( AppHook );
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewBtnEditor.UpdateEditor;
begin
  Editor.Top := 2;
  Editor.Left := 2;
  Editor.Width := Width - 3 - ButtonWidth;
  Editor.Height := Height - 4;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewBtnEditor.WMLButtonDown( Var AMsg : TWMLButtonDown );
begin
  ButtonPressed := IsCursorOverButton( AMsg.XPos, AMsg.YPos );
  Inherited;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewBtnEditor.WMLButtonUp( Var AMsg : TWMLButtonUp );
begin
  If IsCursorOverButton( AMsg.XPos, AMsg.YPos ) And Not FPopupJustClosed Then
    ShowPopup;
  FPopupJustClosed := False;
  ButtonPressed := False;
  Inherited;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewBtnEditor.WMMouseMove( Var AMsg : TWMMouseMove );
begin
  If MouseCapture Then
    ButtonPressed := IsCursorOverButton( AMsg.XPos, AMsg.YPos );
  Inherited;
end;

{------------------------------------------------------------------}

Procedure TDCCustomTreeViewBtnEditor.WMWindowPosChanged( Var AMsg : TWMWindowPosChanged );
begin
  Inherited;
  If AMsg.WindowPos^.Flags And SWP_NoSize = 0 Then
    UpdateEditor;
end;

{------------------------------------------------------------------}

{ TDCMemoPopup }

Constructor TDCMemoPopup.Create( AOwner : TComponent );
begin
  Inherited;
  ControlStyle := ControlStyle + [csNoDesignVisible];
end;

{------------------------------------------------------------------}

Procedure TDCMemoPopup.CreateParams( Var Params : TCreateParams );
begin
  Inherited CreateParams( Params );
  With Params Do
  begin
    Style := Style Or ( WS_POPUP Or WS_ThickFrame );
    ExStyle := WS_EX_TOOLWINDOW;
    WindowClass.Style := WindowClass.Style Or CS_SAVEBITS;
  end;
end;

{------------------------------------------------------------------}

Procedure TDCMemoPopup.WMGetDlgCode( Var AMsg : TWMGetDlgCode );
begin
  Inherited;
  AMsg.Result := AMsg.Result Or DLGC_WANTTAB;
end;

{------------------------------------------------------------------}

{ TDCMemoTreeViewEditor }

procedure TDCMemoTreeViewEditor.DMSetEditorData(var AMsg: TMessage);
begin
  with TDCMemoPopup(PopupWindow) do
  begin
    ScrollBars := TDCMemoEditorProps(AMsg.WParam).FScrollBars;
    WordWrap := TDCMemoEditorProps(AMsg.WParam).FWordWrap;
  end;
end;

Function TDCMemoTreeViewEditor.DoShowPopup : Boolean;
begin
  Result := True;
  With TDCMemoPopup( PopupWindow ) Do
  begin
    Color := Editor.Color;
    Font := Editor.Font;
    Lines.Text := Editor.Text;
  end;
end;

{------------------------------------------------------------------}

Function TDCMemoTreeViewEditor.GetPopupWindowClass : TWinControlClass;
begin
  Result := TDCMemoPopup;
end;

{------------------------------------------------------------------}

Function TDCMemoTreeViewEditor.PopupNeedFocus : Boolean;
begin
  Result := True;
end;

{------------------------------------------------------------------}

Function TDCMemoTreeViewEditor.QueryKeyboardPopupClose : Boolean;
begin
  Result := GetKeyState( VK_CONTROL ) < 0;
end;

{------------------------------------------------------------------}

Procedure TDCMemoTreeViewEditor.ValidatePopupValue;
begin
  Editor.Text := TDCMemoPopup( PopupWindow ).Lines.Text;
end;

{------------------------------------------------------------------}

{ TDCNewEdit }

Procedure TDCNewEdit.WndProc( Var AMsg : TMessage );
begin
  With AMsg, TDCCustomTreeViewBtnEditor( Owner ) Do
  begin
    If ( Msg = WM_KillFocus ) And Not EditorFocused Then
      ParentSendMessage( DM_KILLFOCUS );
    If ( Msg < WM_KeyFirst ) Or ( Msg > WM_KeyLast ) Or Not ProcessKey( AMsg ) Then
      Inherited;
  end;
end;

{------------------------------------------------------------------}

{ TDCPickListTreeViewEditor }

procedure TDCPickListTreeViewEditor.DMSetEditorData(var AMsg: TMessage);
begin
  Items := TDCPickListEditorProps(AMsg.WParam).Items;
end;

{------------------------------------------------------------------}

procedure TDCPickListTreeViewEditor.DoSetText(var AText: string);
begin
  inherited;
  with TDCPickListPopup(PopupWindow) do
    ItemIndex := Items.IndexOf(AText);
end;

{------------------------------------------------------------------}

function TDCPickListTreeViewEditor.DoShowPopup: Boolean;
begin
  Result := True;
  with TDCPickListPopup(PopupWindow) do
  begin
    Color := Editor.Color;
    Font := Editor.Font;
  end;
end;

{------------------------------------------------------------------}

function TDCPickListTreeViewEditor.GetItems: TStrings;
begin
  result := TDCPickListPopup(PopupWindow).Items;
end;

{------------------------------------------------------------------}

function TDCPickListTreeViewEditor.GetPopupWindowClass: TWinControlClass;
begin
  Result := TDCPickListPopup;
end;

{------------------------------------------------------------------}

procedure TDCPickListTreeViewEditor.SetItems(const Value: TStrings);
begin
  TDCPickListPopup(PopupWindow).Items.Assign(Value);
end;

{------------------------------------------------------------------}

procedure TDCPickListTreeViewEditor.ValidatePopupValue;
begin
  with TDCPickListPopup(PopupWindow) do
    if ItemIndex >= 0 then
      Editor.Text := Items[ItemIndex];
end;

{------------------------------------------------------------------}

{ TDCPickListPopup }

constructor TDCPickListPopup.Create(AOwner: TComponent);
begin
  inherited;
  ControlStyle := ControlStyle + [csNoDesignVisible];
end;

{------------------------------------------------------------------}

procedure TDCPickListPopup.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style or (WS_CHILD or WS_ThickFrame);
    ExStyle := WS_EX_TOOLWINDOW;
    WindowClass.Style := WindowClass.Style or CS_SAVEBITS;
  end;
end;

{------------------------------------------------------------------}

procedure TDCPickListPopup.WMLButtonDown(var Message: TWMLButtonDown);
var
  ItemNo: integer;
begin
  with Message do
  begin
    ItemNo := ItemAtPos(SmallPointToPoint(Message.Pos), True);
    if ItemNo <> -1 then
      Perform(LB_SETCURSEL, ItemNo, 0);
  end;
end;

{------------------------------------------------------------------}

procedure TDCPickListPopup.WMLButtonUp(var AMsg: TWMLButtonUp);
begin
  inherited;
  TDCPickListTreeViewEditor(Owner).PopupLostFocus(False);
end;

{------------------------------------------------------------------}

procedure TDCPickListPopup.WMMouseMove(var Message: TWMMouseMove);
var
  ItemNo: integer;
  pt: TPoint;
  oldItem: integer;
begin
  with Message do
    if (word(GetAsyncKeyState(VK_LBUTTON)) and $8000) <> 0 then
    begin
      pt := SmallPointToPoint(Message.Pos);
      ItemNo := ItemAtPos(pt, True);
      OldItem := Perform(LB_GETCURSEL, 0, 0);
      if ItemNo = -1 then
      begin
        if pt.Y > ClientHeight then
          if OldItem < Items.Count - 1 then
            ItemNo := OldItem + 1;
        if pt.Y < 0 then
          if OldItem > 0 then
            ItemNo := OldItem - 1;
      end;
      if (ItemNo <> -1) and (ItemNo <> OldItem) then
        Perform(LB_SETCURSEL, ItemNo, 0);
    end;
end;

{------------------------------------------------------------------}

{ TDCPickListEditorProps }

constructor TDCPickListEditorProps.Create(AColumn: TDCTreeColumn);
begin
  inherited;
  FItems := TStringList.Create;
end;

{------------------------------------------------------------------}

destructor TDCPickListEditorProps.Destroy;
begin
  FItems.Free;
  inherited;
end;

{------------------------------------------------------------------}

procedure TDCPickListEditorProps.Assign(Source: TPersistent);
begin
  if Source is TDCPickListEditorProps then
    with TDCPickListEditorProps(Source) do
      Self.FItems.Assign(FItems)
  else
    inherited;
end;

{------------------------------------------------------------------}

procedure TDCPickListEditorProps.SetItems(Value: TStrings);
begin
  FItems.Assign(Value);
  UpdateColumn;
end;

{------------------------------------------------------------------}

{ TDCMemoEditorProps }

procedure TDCMemoEditorProps.Assign(Source: TPersistent);
begin
  if Source is TDCMemoEditorProps then
    with TDCMemoEditorProps(Source) do
    begin
      Self.FWordWrap := FWordWrap;
      Self.FScrollBars := FScrollBars;
    end
  else
    inherited;
end;

{------------------------------------------------------------------}

constructor TDCMemoEditorProps.Create(AColumn: TDCTreeColumn);
begin
  inherited;
  FWordWrap := True;
  FScrollBars := ssBoth;
end;

{------------------------------------------------------------------}

{ TDCTreeViewImageEditor }

procedure TDCTreeViewImageEditor.DMSetEditorData(var AMsg: TMessage);
var
  i: integer;
begin
  with TDCImagePopup(PopupWindow) do
  begin
    FImages := TDCImageEditorProps(AMsg.WParam).FImages;
    if FImages = nil then
      Exit;
    Items.BeginUpdate;
    Items.Clear;
    for i := 0 to FImages.Count - 1 do
      Items.Add(IntToStr(i));
    Items.EndUpdate;
  end;
end;

{------------------------------------------------------------------}

procedure TDCTreeViewImageEditor.InternalDraw(ACanvas: TCanvas;
  ARect: TRect; AColumn: TDCTreeColumn; const AText: string);
var
  imglist: TImageList;
  t, dx, dy: integer;
begin
  if AColumn.EditorProps is TDCImageEditorProps then
  begin
    imglist := TDCImageEditorProps(AColumn.EditorProps).Images;
    if imglist <> nil then
      with imglist, ARect do
      begin
        Inc(Left);
        t := (Bottom - Top - Height) div 2;
        if t < 0 then
          t := 0;
        dx := Right - Left;
        if dx > Width then
          dx := Width;
        dy := Bottom - Top - t;
        if dy > Height then
          dy := Height; 
        ImageList_DrawEx(Handle, StrToIntDef(AText, -1), ACanvas.Handle,
          Left, Top + t, dx, dy, CLR_NONE, CLR_NONE, ILD_NORMAL);
      end;
  end;
end;

{------------------------------------------------------------------}

procedure TDCTreeViewImageEditor.DMDraw(var AMsg: TDMDraw);
begin
  with AMsg do
  begin
    Canvas.FillRect(DrawRec.DrawRect^);
    InternalDraw(Canvas, DrawRec.DrawRect^,
      TDCTreeColumn(TDCTreeGrid(Owner as TDCCustomTreeGrid).CurrentDrawColumn),
      DrawRec.Text);
    Result := 1;
  end;
end;

{------------------------------------------------------------------}

procedure TDCTreeViewImageEditor.Paint;
var
  r: TRect;
begin
  inherited;
  r := GetDrawingRect;
  Canvas.Pen.Style := psClear;
  with r do
  begin
    Canvas.Rectangle(Left, Top, Right, Bottom);
    Dec(Left);
  end;
  InternalDraw(Canvas, r,
    TDCTreeColumn(TDCTreeGrid(Owner as TDCCustomTreeGrid).CurrentColumn),
    NodeText);
end;

{------------------------------------------------------------------}

function TDCTreeViewImageEditor.GetPopupWindowClass: TWinControlClass;
begin
  Result := TDCImagePopup;
end;

{------------------------------------------------------------------}

procedure TDCTreeViewImageEditor.ValidatePopupValue;
begin
  with TDCImagePopup(PopupWindow) do
    if ItemIndex >= 0 then
      Editor.Text := Items[ItemIndex];
end;

{------------------------------------------------------------------}

function TDCTreeViewImageEditor.DoShowPopup: Boolean;
begin
  Result := True;
  with TDCImagePopup(PopupWindow) do
    ItemHeight := FImages.Height + 2;
end;

{------------------------------------------------------------------}

procedure TDCTreeViewImageEditor.DoSetText(var AText: string);
begin
  inherited;
  with TDCImagePopup(PopupWindow) do
    ItemIndex := Items.IndexOf(AText);
end;

{------------------------------------------------------------------}

constructor TDCTreeViewImageEditor.Create(AOwner: TComponent);
begin
  Inherited;
  Editor.Visible := False;
end;

{------------------------------------------------------------------}

{ TDCImageEditorProps }

procedure TDCImageEditorProps.Assign(Source: TPersistent);
begin
  if Source is TDCImageEditorProps then
    with TDCImageEditorProps(Source) do
      Self.Images := Images
  else
    inherited;
end;

{------------------------------------------------------------------}

procedure TDCImageEditorProps.SetImages(val: TImageList);
begin
  if val <> fImages then
  begin
    FImages := val;
    if FImages <> nil then
      FImages.FreeNotification(FComp);
    UpdateColumn;
  end;
end;

{------------------------------------------------------------------}

constructor TDCImageEditorProps.Create(AColumn: TDCTreeColumn);
begin
  inherited;
  FImages := nil;
  FComp := TComponent1.Create(nil);
  TComponent1(FComp).FImageProps := Self;
end;

{------------------------------------------------------------------}

destructor TDCImageEditorProps.Destroy;
begin
  FComp.Free;
  inherited;
end;

{------------------------------------------------------------------}

{ TDCImagePopup }

constructor TDCImagePopup.Create(AOwner: TComponent);
begin
  inherited;
  Style := lbOwnerDrawFixed;
end;

{------------------------------------------------------------------}

procedure TDCImagePopup.DrawItem(Index: Integer; Rect: TRect;
  State: TOwnerDrawState);
begin
  Canvas.FillRect(Rect);
  FImages.Draw(Canvas, Rect.Left + 1, Rect.Top + 1, Index);
end;

{------------------------------------------------------------------}

{ TComponent1 }

procedure TComponent1.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FImageProps.Images) then
    FImageProps.Images := nil;
end;

{------------------------------------------------------------------}

end.
