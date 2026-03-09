{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit dcedit_C3;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  Menus,
  activex,
  dcscript,
  Windows,
  Messages,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Buttons,
  StdCtrls,
  extctrls,
  comctrls,
  commctrl,
  extdlgs,
  mask,
  shellapi,
  dcsystem,
  SysUtils,
  Classes,
  typinfo,
  dccommon,
  dcdreamlib,
  dccontrols,
  dcconsts,
  dcedit;
function ConvertTMessageToVariant(var R : TMessage) : OleVariant;
function ConvertVariantToTMessage(const V : OleVariant) : TMessage;
function ConvertTPaintToMsgToVariant(var R : TPaintToMsg) : OleVariant;
function ConvertVariantToTPaintToMsg(const V : OleVariant) : TPaintToMsg;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TPaintToMsg__Wrapper = class(TDCRecordWrapper)
private
fR : TPaintToMsg;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setCanvas(const val : TCanvas);
function getCanvas : TCanvas;
property Canvas : TCanvas read getCanvas write setCanvas;
procedure setX(const val : SmallInt);
function getX : SmallInt;
property X : SmallInt read getX write setX;
procedure setY(const val : SmallInt);
function getY : SmallInt;
property Y : SmallInt read getY write setY;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TMessage__Wrapper = class(TDCRecordWrapper)
private
fR : TMessage;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setWParam(const val : Longint);
function getWParam : Longint;
property WParam : Longint read getWParam write setWParam;
procedure setLParam(const val : Longint);
function getLParam : Longint;
property LParam : Longint read getLParam write setLParam;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
procedure setWParamLo(const val : Word);
function getWParamLo : Word;
property WParamLo : Word read getWParamLo write setWParamLo;
procedure setWParamHi(const val : Word);
function getWParamHi : Word;
property WParamHi : Word read getWParamHi write setWParamHi;
procedure setLParamLo(const val : Word);
function getLParamLo : Word;
property LParamLo : Word read getLParamLo write setLParamLo;
procedure setLParamHi(const val : Word);
function getLParamHi : Word;
property LParamHi : Word read getLParamHi write setLParamHi;
procedure setResultLo(const val : Word);
function getResultLo : Word;
property ResultLo : Word read getResultLo write setResultLo;
procedure setResultHi(const val : Word);
function getResultHi : Word;
property ResultHi : Word read getResultHi write setResultHi;
end;
type __TCustomDCEdit__ = class(TCustomDCEdit);
type
_T0 = procedure  of object;

{_T1 = function (p0 : TWinControl;
p1 : TStrings;
p2 : Integer;
p3 : Integer;
p4 : Array of TLeftRightAlign;
p5 : TFont;
p6 : TPopupListBoxCallback;
p7 : Integer): TDCPopupListBox of object;}

_T2 = _T0;

_T3 = function : Integer of object;

_T4 = _T0;

_T5 = _T0;

_T6 = function : string of object;

_T7 = procedure (const p0 : string) of object;

_T8 = procedure (const p0 : IDispatch) of object;

_T9 = _T0;

_T10 = _T0;

_T11 = function : Boolean of object;

_T12 = _T11;

{_T13 = procedure (var p0 : TControlClass) of object;}

_T14 = _T0;

{_T15 = function : TControlClass of object;}

{_T16 = function : TWinControlClass of object;}

_T17 = _T0;

_T18 = _T11;

_T19 = _T0;

_T20 = _T0;

_T21 = _T0;

_T22 = procedure (p0 : Boolean) of object;

_T23 = _T0;

_T24 = procedure (p0 : TObject) of object;

_T25 = _T6;

_T26 = _T7;

_T27 = procedure (p0 : Integer;
p1 : Integer) of object;

_T28 = function : TGraphic of object;

_T29 = procedure (p0 : TCanvas;
p1 : Integer;
p2 : Integer) of object;

_T30 = _T7;

_T31 = _T6;

_T32 = _T22;

_T33 = _T0;

function __TPaintToMsg__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TPaintToMsg__Wrapper.setMsg(const val : Cardinal);
begin
TPaintToMsg(GetRecordPtr^).Msg := val;
end;
function __TPaintToMsg__Wrapper.getMsg : Cardinal;
begin
result := TPaintToMsg(GetRecordPtr^).Msg;
end;
procedure __TPaintToMsg__Wrapper.setCanvas(const val : TCanvas);
begin
TPaintToMsg(GetRecordPtr^).Canvas := val;
end;
function __TPaintToMsg__Wrapper.getCanvas : TCanvas;
begin
result := TPaintToMsg(GetRecordPtr^).Canvas;
end;
procedure __TPaintToMsg__Wrapper.setX(const val : SmallInt);
begin
TPaintToMsg(GetRecordPtr^).X := val;
end;
function __TPaintToMsg__Wrapper.getX : SmallInt;
begin
result := TPaintToMsg(GetRecordPtr^).X;
end;
procedure __TPaintToMsg__Wrapper.setY(const val : SmallInt);
begin
TPaintToMsg(GetRecordPtr^).Y := val;
end;
function __TPaintToMsg__Wrapper.getY : SmallInt;
begin
result := TPaintToMsg(GetRecordPtr^).Y;
end;
procedure __TPaintToMsg__Wrapper.setResult(const val : Longint);
begin
TPaintToMsg(GetRecordPtr^).Result := val;
end;
function __TPaintToMsg__Wrapper.getResult : Longint;
begin
result := TPaintToMsg(GetRecordPtr^).Result;
end;
function _TPaintToMsg_ : IDispatch;
begin
  result := __TPaintToMsg__Wrapper.Create;
end;
function __TMessage__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TMessage__Wrapper.setMsg(const val : Cardinal);
begin
TMessage(GetRecordPtr^).Msg := val;
end;
function __TMessage__Wrapper.getMsg : Cardinal;
begin
result := TMessage(GetRecordPtr^).Msg;
end;
procedure __TMessage__Wrapper.setWParam(const val : Longint);
begin
TMessage(GetRecordPtr^).WParam := val;
end;
function __TMessage__Wrapper.getWParam : Longint;
begin
result := TMessage(GetRecordPtr^).WParam;
end;
procedure __TMessage__Wrapper.setLParam(const val : Longint);
begin
TMessage(GetRecordPtr^).LParam := val;
end;
function __TMessage__Wrapper.getLParam : Longint;
begin
result := TMessage(GetRecordPtr^).LParam;
end;
procedure __TMessage__Wrapper.setResult(const val : Longint);
begin
TMessage(GetRecordPtr^).Result := val;
end;
function __TMessage__Wrapper.getResult : Longint;
begin
result := TMessage(GetRecordPtr^).Result;
end;
procedure __TMessage__Wrapper.setWParamLo(const val : Word);
begin
TMessage(GetRecordPtr^).WParamLo := val;
end;
function __TMessage__Wrapper.getWParamLo : Word;
begin
result := TMessage(GetRecordPtr^).WParamLo;
end;
procedure __TMessage__Wrapper.setWParamHi(const val : Word);
begin
TMessage(GetRecordPtr^).WParamHi := val;
end;
function __TMessage__Wrapper.getWParamHi : Word;
begin
result := TMessage(GetRecordPtr^).WParamHi;
end;
procedure __TMessage__Wrapper.setLParamLo(const val : Word);
begin
TMessage(GetRecordPtr^).LParamLo := val;
end;
function __TMessage__Wrapper.getLParamLo : Word;
begin
result := TMessage(GetRecordPtr^).LParamLo;
end;
procedure __TMessage__Wrapper.setLParamHi(const val : Word);
begin
TMessage(GetRecordPtr^).LParamHi := val;
end;
function __TMessage__Wrapper.getLParamHi : Word;
begin
result := TMessage(GetRecordPtr^).LParamHi;
end;
procedure __TMessage__Wrapper.setResultLo(const val : Word);
begin
TMessage(GetRecordPtr^).ResultLo := val;
end;
function __TMessage__Wrapper.getResultLo : Word;
begin
result := TMessage(GetRecordPtr^).ResultLo;
end;
procedure __TMessage__Wrapper.setResultHi(const val : Word);
begin
TMessage(GetRecordPtr^).ResultHi := val;
end;
function __TMessage__Wrapper.getResultHi : Word;
begin
result := TMessage(GetRecordPtr^).ResultHi;
end;
procedure __TCustomDCEdit__EditWndProc__Wrapper(__Instance : TCustomDCEdit;
const p0 : IDispatch);
var
__p0 : ^TMessage;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
__TCustomDCEdit__(__Instance).EditWndProc(__p0^);
end;


type __TMessage__Wrapper__ = class(__TMessage__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TMessage__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTMessageToVariant(var R : TMessage) : OleVariant;
var
__rw : __TMessage__Wrapper__;
begin
__rw := __TMessage__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTMessage(const V : OleVariant) : TMessage;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TMessage((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TPaintToMsg__Wrapper__ = class(__TPaintToMsg__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TPaintToMsg__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTPaintToMsgToVariant(var R : TPaintToMsg) : OleVariant;
var
__rw : __TPaintToMsg__Wrapper__;
begin
__rw := __TPaintToMsg__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTPaintToMsg(const V : OleVariant) : TPaintToMsg;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TPaintToMsg((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTButtonParams__Button(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TButtonParams(Instance).Button);
end;

procedure __DC__SetTButtonParams__Button(Instance : TObject; Params : PVariantArgList);
begin
TButtonParams(Instance).Button:=TEditButton(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCheckEdit__Cute(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCheckEdit(Instance).Cute;
end;

procedure __DC__SetTCheckEdit__Cute(Instance : TObject; Params : PVariantArgList);
begin
TCheckEdit(Instance).Cute:=OleVariant(Params^[0]);
end;

function __DC__GetTCheckEdit__Scaled(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCheckEdit(Instance).Scaled;
end;

procedure __DC__SetTCheckEdit__Scaled(Instance : TObject; Params : PVariantArgList);
begin
TCheckEdit(Instance).Scaled:=OleVariant(Params^[0]);
end;

function __DC__GetTCheckEdit__Invert(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCheckEdit(Instance).Invert;
end;

procedure __DC__SetTCheckEdit__Invert(Instance : TObject; Params : PVariantArgList);
begin
TCheckEdit(Instance).Invert:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCEdit__DropWindow(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCEdit(Instance).DropWindow);
end;

procedure __DC__SetTCustomDCEdit__DropWindow(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCEdit(Instance).DropWindow:=TWinControl(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCEdit__DroppedDown(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCEdit(Instance).DroppedDown;
end;

procedure __DC__SetTCustomDCEdit__DroppedDown(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCEdit(Instance).DroppedDown:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCEdit__Flat(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCEdit(Instance).Flat;
end;

procedure __DC__SetTCustomDCEdit__Flat(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCEdit(Instance).Flat:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCEdit__DreamBorderStyle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCEdit(Instance).DreamBorderStyle;
end;

procedure __DC__SetTCustomDCEdit__DreamBorderStyle(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCEdit(Instance).DreamBorderStyle:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCEdit__UseDreamBorder(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCEdit(Instance).UseDreamBorder;
end;

procedure __DC__SetTCustomDCEdit__UseDreamBorder(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCEdit(Instance).UseDreamBorder:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCEdit__LineColor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCEdit(Instance).LineColor;
end;

procedure __DC__SetTCustomDCEdit__LineColor(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCEdit(Instance).LineColor:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCEdit__Modified(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCEdit(Instance).Modified;
end;

procedure __DC__SetTCustomDCEdit__Modified(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCEdit(Instance).Modified:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCEdit__ReadOnly(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCEdit(Instance).ReadOnly;
end;

procedure __DC__SetTCustomDCEdit__ReadOnly(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCEdit(Instance).ReadOnly:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCEdit__Text(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCEdit(Instance).Text;
end;

procedure __DC__SetTCustomDCEdit__Text(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCEdit(Instance).Text:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCEdit__DisplayFocused(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCEdit(Instance).DisplayFocused;
end;

procedure __DC__SetTCustomDCEdit__DisplayFocused(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCEdit(Instance).DisplayFocused:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCEdit__Button1(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCEdit(Instance).Button1);
end;

procedure __DC__SetTCustomDCEdit__Button1(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCEdit(Instance).Button1:=TButtonParams(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCEdit__Button2(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCEdit(Instance).Button2);
end;

procedure __DC__SetTCustomDCEdit__Button2(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCEdit(Instance).Button2:=TButtonParams(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCEdit__Caption(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCEdit(Instance).Caption;
end;

procedure __DC__SetTCustomDCEdit__Caption(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCEdit(Instance).Caption:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCEdit__HideCaret(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCEdit(Instance).HideCaret;
end;

procedure __DC__SetTCustomDCEdit__HideCaret(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCEdit(Instance).HideCaret:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCEdit__NumButtons(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCEdit(Instance).NumButtons;
end;

procedure __DC__SetTCustomDCEdit__NumButtons(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCEdit(Instance).NumButtons:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCEdit__PopupWindowClass(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCEdit(Instance).PopupWindowClass;
end;

procedure __DC__SetTCustomDCEdit__PopupWindowClass(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCEdit(Instance).PopupWindowClass:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCEdit__PopupWindow(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCEdit(Instance).PopupWindow);
end;

function __DC__GetTCustomDCEdit__EditSourceClass(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCEdit(Instance).EditSourceClass;
end;

procedure __DC__SetTCustomDCEdit__EditSourceClass(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCEdit(Instance).EditSourceClass:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCEdit__EditSource(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCEdit(Instance).EditSource);
end;

function __DC__GetTCustomDCEdit__EditClass(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCEdit(Instance).EditClass;
end;

procedure __DC__SetTCustomDCEdit__EditClass(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCEdit(Instance).EditClass:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCEdit__Edit(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCEdit(Instance).Edit);
end;

function __DC__GetTCustomDCEdit__BorderStyle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCEdit(Instance).BorderStyle;
end;

procedure __DC__SetTCustomDCEdit__BorderStyle(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCEdit(Instance).BorderStyle:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCEdit__DropOnClick(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCEdit(Instance).DropOnClick;
end;

procedure __DC__SetTCustomDCEdit__DropOnClick(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCEdit(Instance).DropOnClick:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCEdit__TabStop(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCEdit(Instance).TabStop;
end;

procedure __DC__SetTCustomDCEdit__TabStop(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCEdit(Instance).TabStop:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCEdit__Ctl3D(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCEdit(Instance).Ctl3D;
end;

procedure __DC__SetTCustomDCEdit__Ctl3D(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCEdit(Instance).Ctl3D:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCEdit__PopupMenu(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCEdit(Instance).PopupMenu);
end;

procedure __DC__SetTCustomDCEdit__PopupMenu(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCEdit(Instance).PopupMenu:=TPopupMenu(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomFileDirEdit__AcceptFiles(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomFileDirEdit(Instance).AcceptFiles;
end;

procedure __DC__SetTCustomFileDirEdit__AcceptFiles(Instance : TObject; Params : PVariantArgList);
begin
TCustomFileDirEdit(Instance).AcceptFiles:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomFileDirEdit__InitialDir(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomFileDirEdit(Instance).InitialDir;
end;

procedure __DC__SetTCustomFileDirEdit__InitialDir(Instance : TObject; Params : PVariantArgList);
begin
TCustomFileDirEdit(Instance).InitialDir:=OleVariant(Params^[0]);
end;

function __DC__GetTDCListBox__Columns(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCListBox(Instance).Columns);
end;

function __DC__GetTDCListBox__CustomDraw(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDCListBox(Instance).CustomDraw;
end;

procedure __DC__SetTDCListBox__CustomDraw(Instance : TObject; Params : PVariantArgList);
begin
TDCListBox(Instance).CustomDraw:=OleVariant(Params^[0]);
end;

function __DC__GetTDCListBoxColumns__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCListBoxColumns(Instance).Items[OleVariant(Params^[0])]);
end;

procedure __DC__SetTDCListBoxColumns__Items(Instance : TObject; Params : PVariantArgList);
begin
TDCListBoxColumns(Instance).Items[OleVariant(Params^[1])]:=TDCListBoxColumn(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTDCPopupListBox__MaxSize(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDCPopupListBox(Instance).MaxSize;
end;

procedure __DC__SetTDCPopupListBox__MaxSize(Instance : TObject; Params : PVariantArgList);
begin
TDCPopupListBox(Instance).MaxSize:=OleVariant(Params^[0]);
end;

function __DC__GetTGraphicEdit__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TGraphicEdit(Instance).Canvas);
end;

function __DC__GetTPopupListBox__DisplayNames(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPopupListBox(Instance).DisplayNames;
end;

procedure __DC__SetTPopupListBox__DisplayNames(Instance : TObject; Params : PVariantArgList);
begin
TPopupListBox(Instance).DisplayNames:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
RegisterProperty(TButtonParams,'Button',__DC__GetTButtonParams__Button,__DC__SetTButtonParams__Button);
RegisterProperty(TCheckEdit,'Cute',__DC__GetTCheckEdit__Cute,__DC__SetTCheckEdit__Cute);
RegisterProperty(TCheckEdit,'Scaled',__DC__GetTCheckEdit__Scaled,__DC__SetTCheckEdit__Scaled);
RegisterProperty(TCheckEdit,'Invert',__DC__GetTCheckEdit__Invert,__DC__SetTCheckEdit__Invert);
RegisterProperty(TCustomDCEdit,'DropWindow',__DC__GetTCustomDCEdit__DropWindow,__DC__SetTCustomDCEdit__DropWindow);
RegisterProperty(TCustomDCEdit,'DroppedDown',__DC__GetTCustomDCEdit__DroppedDown,__DC__SetTCustomDCEdit__DroppedDown);
RegisterProperty(TCustomDCEdit,'Flat',__DC__GetTCustomDCEdit__Flat,__DC__SetTCustomDCEdit__Flat);
RegisterProperty(TCustomDCEdit,'DreamBorderStyle',__DC__GetTCustomDCEdit__DreamBorderStyle,__DC__SetTCustomDCEdit__DreamBorderStyle);
RegisterProperty(TCustomDCEdit,'UseDreamBorder',__DC__GetTCustomDCEdit__UseDreamBorder,__DC__SetTCustomDCEdit__UseDreamBorder);
RegisterProperty(TCustomDCEdit,'LineColor',__DC__GetTCustomDCEdit__LineColor,__DC__SetTCustomDCEdit__LineColor);
RegisterProperty(TCustomDCEdit,'Modified',__DC__GetTCustomDCEdit__Modified,__DC__SetTCustomDCEdit__Modified);
RegisterProperty(TCustomDCEdit,'ReadOnly',__DC__GetTCustomDCEdit__ReadOnly,__DC__SetTCustomDCEdit__ReadOnly);
RegisterProperty(TCustomDCEdit,'Text',__DC__GetTCustomDCEdit__Text,__DC__SetTCustomDCEdit__Text);
RegisterProperty(TCustomDCEdit,'DisplayFocused',__DC__GetTCustomDCEdit__DisplayFocused,__DC__SetTCustomDCEdit__DisplayFocused);
RegisterProperty(TCustomDCEdit,'Button1',__DC__GetTCustomDCEdit__Button1,__DC__SetTCustomDCEdit__Button1);
RegisterProperty(TCustomDCEdit,'Button2',__DC__GetTCustomDCEdit__Button2,__DC__SetTCustomDCEdit__Button2);
RegisterProperty(TCustomDCEdit,'Caption',__DC__GetTCustomDCEdit__Caption,__DC__SetTCustomDCEdit__Caption);
RegisterProperty(TCustomDCEdit,'HideCaret',__DC__GetTCustomDCEdit__HideCaret,__DC__SetTCustomDCEdit__HideCaret);
RegisterProperty(TCustomDCEdit,'NumButtons',__DC__GetTCustomDCEdit__NumButtons,__DC__SetTCustomDCEdit__NumButtons);
RegisterProperty(TCustomDCEdit,'PopupWindowClass',__DC__GetTCustomDCEdit__PopupWindowClass,__DC__SetTCustomDCEdit__PopupWindowClass);
RegisterProperty(TCustomDCEdit,'PopupWindow',__DC__GetTCustomDCEdit__PopupWindow,nil);
RegisterProperty(TCustomDCEdit,'EditSourceClass',__DC__GetTCustomDCEdit__EditSourceClass,__DC__SetTCustomDCEdit__EditSourceClass);
RegisterProperty(TCustomDCEdit,'EditSource',__DC__GetTCustomDCEdit__EditSource,nil);
RegisterProperty(TCustomDCEdit,'EditClass',__DC__GetTCustomDCEdit__EditClass,__DC__SetTCustomDCEdit__EditClass);
RegisterProperty(TCustomDCEdit,'Edit',__DC__GetTCustomDCEdit__Edit,nil);
RegisterProperty(TCustomDCEdit,'BorderStyle',__DC__GetTCustomDCEdit__BorderStyle,__DC__SetTCustomDCEdit__BorderStyle);
RegisterProperty(TCustomDCEdit,'DropOnClick',__DC__GetTCustomDCEdit__DropOnClick,__DC__SetTCustomDCEdit__DropOnClick);
RegisterProperty(TCustomDCEdit,'TabStop',__DC__GetTCustomDCEdit__TabStop,__DC__SetTCustomDCEdit__TabStop);
RegisterProperty(TCustomDCEdit,'Ctl3D',__DC__GetTCustomDCEdit__Ctl3D,__DC__SetTCustomDCEdit__Ctl3D);
RegisterProperty(TCustomDCEdit,'PopupMenu',__DC__GetTCustomDCEdit__PopupMenu,__DC__SetTCustomDCEdit__PopupMenu);
RegisterProperty(TCustomFileDirEdit,'AcceptFiles',__DC__GetTCustomFileDirEdit__AcceptFiles,__DC__SetTCustomFileDirEdit__AcceptFiles);
RegisterProperty(TCustomFileDirEdit,'InitialDir',__DC__GetTCustomFileDirEdit__InitialDir,__DC__SetTCustomFileDirEdit__InitialDir);
RegisterProperty(TDCListBox,'Columns',__DC__GetTDCListBox__Columns,nil);
RegisterProperty(TDCListBox,'CustomDraw',__DC__GetTDCListBox__CustomDraw,__DC__SetTDCListBox__CustomDraw);
RegisterIndexedProperty(TDCListBoxColumns,'Items',1,False,__DC__GetTDCListBoxColumns__Items,__DC__SetTDCListBoxColumns__Items);
RegisterProperty(TDCPopupListBox,'MaxSize',__DC__GetTDCPopupListBox__MaxSize,__DC__SetTDCPopupListBox__MaxSize);
RegisterProperty(TGraphicEdit,'Canvas',__DC__GetTGraphicEdit__Canvas,nil);
RegisterProperty(TPopupListBox,'DisplayNames',__DC__GetTPopupListBox__DisplayNames,__DC__SetTPopupListBox__DisplayNames);
end;

const __ConstNames0 : array[0..21] of string = (
'bkCustom'
,'bkDropDown'
,'bkDots'
,'dbsSunkenBorder'
,'dbsRaisedBorder'
,'dbsSunkenLine'
,'dbsRaisedLine'
,'dbsLine'
,'dbsLineBorder'
,'dbsSunkenSingle'
,'dbsRaisedSingle'
,'dbsNone'
,'bkAuto'
,'bkEllipsis'
,'bkNone'
,'selNext'
,'selPrior'
,'CM_PAINTTO'
,'fdOpen'
,'fdSave'
,'fdOpenpicture'
,'fdSavePicture'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,bkCustom));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,bkDropDown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,bkDots));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,dbsSunkenBorder));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,dbsRaisedBorder));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,dbsSunkenLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,dbsRaisedLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,dbsLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,dbsLineBorder));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,dbsSunkenSingle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,dbsRaisedSingle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,dbsNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,bkAuto));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,bkEllipsis));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,bkNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,selNext));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,selPrior));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,CM_PAINTTO));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,fdOpen));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,fdSave));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,fdOpenpicture));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,fdSavePicture));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..31] of TClass = (
TBrushStyleEdit,
TButtonParams,
TCheckEdit,
TColorEdit,
TCustomDCEdit,
TCustomDCPropEditor,
TCustomFileDirEdit,
TDCBrushStyleEdit,
TDCColorEdit,
TDCDateEdit,
TDCDirectoryEdit,
TDCDtEdit,
TDCEdit,
TDCFileNameEdit,
TDCListBox,
TDCListBoxColumn,
TDCListBoxColumns,
TDCMaskEdit,
TDCPenStyleEdit,
TDCPopupListBox,
TDCSimpleEdit,
TDCTimeEdit,
TDummyEditSource,
TEditButton,
TGraphEdit,
TGraphicEdit,
TPenStyleEdit,
TPopupBrushBox,
TPopupColorBox,
TPopupListBox,
TPopupPenBox,
TRadioEdit
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..2] of string = (
'TPaintToMsg'
,'UnRegisterBooleanEditor'
,'Register'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TPaintToMsg_)));
RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T0),NoParams,Addr(UnRegisterBooleanEditor),cRegister);

RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T2),NoParams,Addr(Register),cRegister);

RegRegisterMethod(TCheckEdit,'GetWinStyle',TypeInfo(_T3),[TypeInfo(Integer)], pointer(132));

RegRegisterMethod(TCustomDCEdit,'RestoreSavedText',TypeInfo(_T4),NoParams, pointer(132));

RegRegisterMethod(TCustomDCEdit,'CheckReadOnly',TypeInfo(_T5),NoParams, pointer(136));

RegRegisterMethod(TCustomDCEdit,'GetText',TypeInfo(_T6),[TypeInfo(string)], pointer(140));

RegRegisterMethod(TCustomDCEdit,'SetText',TypeInfo(_T7),[
TypeInfo(string)], pointer(144));

RegRegisterMethod(TCustomDCEdit,'EditWndProc',TypeInfo(_T8),[
TypeInfo(IDispatch)], pointer(148));

RegRegisterMethod(TCustomDCEdit,'SetDropValue',TypeInfo(_T9),NoParams, pointer(152));

RegRegisterMethod(TCustomDCEdit,'GetDropValue',TypeInfo(_T10),NoParams, pointer(156));

RegRegisterMethod(TCustomDCEdit,'GetModified',TypeInfo(_T11),[TypeInfo(Boolean)], pointer(160));

RegRegisterMethod(TCustomDCEdit,'GetReadOnly',TypeInfo(_T12),[TypeInfo(Boolean)], pointer(164));

RegRegisterMethod(TCustomDCEdit,'DoTerm',TypeInfo(_T14),NoParams, pointer(172));

RegRegisterMethod(TCustomDCEdit,'Change',TypeInfo(_T17),NoParams, pointer(184));

RegRegisterMethod(TCustomDCEdit,'Focused',TypeInfo(_T18),[TypeInfo(Boolean)],Addr(TCustomDCEdit.Focused));

RegRegisterMethod(TCustomDCEdit,'Deselect',TypeInfo(_T19),NoParams,Addr(TCustomDCEdit.Deselect));

RegRegisterMethod(TCustomDCEdit,'SelectAll',TypeInfo(_T20),NoParams,Addr(TCustomDCEdit.SelectAll));

RegRegisterMethod(TCustomDCEdit,'Drop',TypeInfo(_T21),NoParams, pointer(188));

RegRegisterMethod(TCustomDCEdit,'CloseDropped',TypeInfo(_T22),[
TypeInfo(Boolean)], pointer(192));

RegRegisterMethod(TCustomDCEdit,'Term',TypeInfo(_T23),NoParams,Addr(TCustomDCEdit.Term));

RegRegisterMethod(TCustomFileDirEdit,'Button1Click',TypeInfo(_T24),[
TypeInfo(TObject)], pointer(196));

RegRegisterMethod(TDCDtEdit,'GetText',TypeInfo(_T25),[TypeInfo(string)], pointer(128));

RegRegisterMethod(TDCDtEdit,'SetText',TypeInfo(_T26),[
TypeInfo(string)], pointer(132));

RegRegisterMethod(TDCPopupListBox,'Popup',TypeInfo(_T27),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TDCPopupListBox.Popup));

RegRegisterMethod(TGraphEdit,'GetGraphic',TypeInfo(_T28),[TypeInfo(TGraphic)], pointer(144));

RegRegisterMethod(TGraphicEdit,'PaintToCanvas',TypeInfo(_T29),[
TypeInfo(TCanvas),
TypeInfo(Integer),
TypeInfo(Integer)], pointer(132));

RegRegisterMethod(TGraphicEdit,'SetText',TypeInfo(_T30),[
TypeInfo(string)], pointer(136));

RegRegisterMethod(TGraphicEdit,'GetText',TypeInfo(_T31),[TypeInfo(string)], pointer(140));

RegRegisterMethod(TPopupListBox,'Close',TypeInfo(_T32),[
TypeInfo(Boolean)], pointer(136));

RegRegisterMethod(TPopupListBox,'BuildList',TypeInfo(_T33),NoParams, pointer(140));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'PopupListbox',mtProc,TypeInfo(_T1),[
TypeInfo(TWinControl),
TypeInfo(TStrings),
TypeInfo(Integer),
TypeInfo(Integer),
ArrayInfo(TypeInfo(TLeftRightAlign)),
TypeInfo(TFont),
TypeInfo(TPopupListBoxCallback),
TypeInfo(Integer),TypeInfo(TDCPopupListBox)],Addr(PopupListbox),cRegister)}

{RegRegisterMethod(TCustomDCEdit,'ValidateEditorClass',TypeInfo(_T13),[
TypeInfo(TControlClass)], pointer(168))}

{RegRegisterMethod(TCustomDCEdit,'GetDefaultEditorClass',TypeInfo(_T15),[TypeInfo(TControlClass)], pointer(176))}

{RegRegisterMethod(TCustomDCEdit,'GetDefaultPopupClass',TypeInfo(_T16),[TypeInfo(TWinControlClass)], pointer(180))}

RegisterEvent(TypeInfo(TButtonSizeChangeProc),NoParams);

RegisterEvent(TypeInfo(TPopupListBoxCallback),[
TypeInfo(TObject),
TypeInfo(Integer)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
