{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit STDCTRLS_D6;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  Types,
  activex,
  dcscript,
  dcsystem,
  dcdreamlib,
  Messages,
  Windows,
  SysUtils,
  Controls,
  Forms,
  Classes,
  Menus,
  Graphics,
  StdCtrls;
function ConvertTMessageToVariant(var R : TMessage) : OleVariant;
function ConvertVariantToTMessage(const V : OleVariant) : TMessage;
function ConvertTPointToVariant(var R : TPoint) : OleVariant;
function ConvertVariantToTPoint(const V : OleVariant) : TPoint;
function ConvertTRectToVariant(var R : TRect) : OleVariant;
function ConvertVariantToTRect(const V : OleVariant) : TRect;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TPoint__Wrapper = class(TDCRecordWrapper)
private
fR : TPoint;
public
function GetRecordPtr : pointer; override;
published
procedure setX(const val : Longint);
function getX : Longint;
property X : Longint read getX write setX;
procedure setY(const val : Longint);
function getY : Longint;
property Y : Longint read getY write setY;
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
type __TRect__Wrapper = class(TDCRecordWrapper)
private
fR : TRect;
public
function GetRecordPtr : pointer; override;
published
procedure setLeft(const val : Longint);
function getLeft : Longint;
property Left : Longint read getLeft write setLeft;
procedure setTop(const val : Longint);
function getTop : Longint;
property Top : Longint read getTop write setTop;
procedure setRight(const val : Longint);
function getRight : Longint;
property Right : Longint read getRight write setRight;
procedure setBottom(const val : Longint);
function getBottom : Longint;
property Bottom : Longint read getBottom write setBottom;
end;
type __TCustomCombo__ = class(TCustomCombo);
type __TCustomComboBox__ = class(TCustomComboBox);
type __TCustomLabel__ = class(TCustomLabel);
type __TCustomListBox__ = class(TCustomListBox);
type __TCustomMemo__ = class(TCustomMemo);
type
_T0 = procedure (p0 : Boolean) of object;

_T1 = function : Boolean of object;

_T2 = _T0;

_T3 = procedure  of object;

_T4 = _T3;

_T5 = procedure (const p0 : IDispatch;
p1 : HWnd;
p2 : Pointer) of object;

{_T6 = function : TCustomComboBoxStringsClass of object;}

_T7 = function : Integer of object;

_T8 = procedure (p0 : Integer) of object;

_T9 = _T7;

_T10 = _T3;

_T11 = _T3;

_T12 = _T3;

_T13 = _T3;

_T14 = procedure (const p0 : Integer) of object;

_T15 = procedure (const p0 : TStrings) of object;

_T16 = procedure (p0 : Integer;
const p1 : IDispatch;
p2 : TOwnerDrawState) of object;

_T17 = procedure (p0 : Integer;
var p1 : Integer) of object;

_T18 = procedure (p0 : TComboBoxStyle) of object;

_T19 = _T3;

_T20 = _T8;

_T21 = _T7;

_T22 = _T7;

_T23 = function : string of object;

_T24 = _T8;

_T25 = _T8;

_T26 = _T3;

_T27 = _T3;

_T28 = _T3;

_T29 = _T3;

_T30 = _T3;

_T31 = _T3;

_T32 = _T3;

{_T33 = function (p0 : PChar;
p1 : Integer): Integer of object;}

_T34 = _T3;

{_T35 = procedure (p0 : PChar) of object;}

_T36 = _T3;

_T37 = procedure (const p0 : IDispatch;
p1 : Longint) of object;

_T38 = _T23;

_T39 = _T16;

_T40 = _T17;

_T41 = function (p0 : Integer): Longint of object;

_T42 = procedure (p0 : Integer;
p1 : Longint) of object;

_T43 = _T41;

_T44 = _T42;

_T45 = _T3;

_T46 = _T8;

_T47 = function (const p0 : IDispatch;
p1 : Boolean): Integer of object;

_T48 = function (p0 : Integer): IDispatch of object;

_T49 = function : IDispatch of object;

_T50 = procedure (const p0 : IDispatch) of object;

_T51 = _T3;

_T52 = procedure (p0 : TScrollCode;
var p1 : Integer) of object;

_T53 = procedure (p0 : Integer;
p1 : Integer;
p2 : Integer) of object;

function __TPoint__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TPoint__Wrapper.setX(const val : Longint);
begin
TPoint(GetRecordPtr^).X := val;
end;
function __TPoint__Wrapper.getX : Longint;
begin
result := TPoint(GetRecordPtr^).X;
end;
procedure __TPoint__Wrapper.setY(const val : Longint);
begin
TPoint(GetRecordPtr^).Y := val;
end;
function __TPoint__Wrapper.getY : Longint;
begin
result := TPoint(GetRecordPtr^).Y;
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
function __TRect__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TRect__Wrapper.setLeft(const val : Longint);
begin
TRect(GetRecordPtr^).Left := val;
end;
function __TRect__Wrapper.getLeft : Longint;
begin
result := TRect(GetRecordPtr^).Left;
end;
procedure __TRect__Wrapper.setTop(const val : Longint);
begin
TRect(GetRecordPtr^).Top := val;
end;
function __TRect__Wrapper.getTop : Longint;
begin
result := TRect(GetRecordPtr^).Top;
end;
procedure __TRect__Wrapper.setRight(const val : Longint);
begin
TRect(GetRecordPtr^).Right := val;
end;
function __TRect__Wrapper.getRight : Longint;
begin
result := TRect(GetRecordPtr^).Right;
end;
procedure __TRect__Wrapper.setBottom(const val : Longint);
begin
TRect(GetRecordPtr^).Bottom := val;
end;
function __TRect__Wrapper.getBottom : Longint;
begin
result := TRect(GetRecordPtr^).Bottom;
end;
procedure __TCustomCombo__ComboWndProc__Wrapper(__Instance : TCustomCombo;
const p0 : IDispatch;
p1 : HWnd;
p2 : Pointer);
var
__p0 : ^TMessage;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
__TCustomCombo__(__Instance).ComboWndProc(__p0^,p1,p2);
end;

procedure __TCustomComboBox__DrawItem__Wrapper(__Instance : TCustomComboBox;
p0 : Integer;
const p1 : IDispatch;
p2 : TOwnerDrawState);
var
__p1 : ^TRect;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
__TCustomComboBox__(__Instance).DrawItem(p0,__p1^,p2);
end;

procedure __TCustomLabel__DoDrawText__Wrapper(__Instance : TCustomLabel;
const p0 : IDispatch;
p1 : Longint);
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
__TCustomLabel__(__Instance).DoDrawText(__p0^,p1);
end;

procedure __TCustomListBox__DrawItem__Wrapper(__Instance : TCustomListBox;
p0 : Integer;
const p1 : IDispatch;
p2 : TOwnerDrawState);
var
__p1 : ^TRect;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
__TCustomListBox__(__Instance).DrawItem(p0,__p1^,p2);
end;

function __TCustomListBox__ItemAtPos__Wrapper(__Instance : TCustomListBox;
const p0 : IDispatch;
p1 : Boolean): Integer;
var
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := TCustomListBox(__Instance).ItemAtPos(__p0^,p1);
end;

function __TCustomListBox__ItemRect__Wrapper(__Instance : TCustomListBox;
p0 : Integer): IDispatch;
var
__result : TRect;
__wrapper : __TRect__Wrapper;
begin
__result := TCustomListBox(__Instance).ItemRect(p0);
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function __TCustomMemo__GetCaretPos__Wrapper(__Instance : TCustomMemo): IDispatch;
var
__result : TPoint;
__wrapper : __TPoint__Wrapper;
begin
__result := __TCustomMemo__(__Instance).GetCaretPos;
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

procedure __TCustomMemo__SetCaretPos__Wrapper(__Instance : TCustomMemo;
const p0 : IDispatch);
var
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
__TCustomMemo__(__Instance).SetCaretPos(__p0^);
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

type __TPoint__Wrapper__ = class(__TPoint__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TPoint__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTPointToVariant(var R : TPoint) : OleVariant;
var
__rw : __TPoint__Wrapper__;
begin
__rw := __TPoint__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTPoint(const V : OleVariant) : TPoint;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TPoint((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TRect__Wrapper__ = class(__TRect__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TRect__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTRectToVariant(var R : TRect) : OleVariant;
var
__rw : __TRect__Wrapper__;
begin
__rw := __TRect__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTRect(const V : OleVariant) : TRect;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TRect((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTCustomCombo__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomCombo(Instance).Canvas);
end;

function __DC__GetTCustomCombo__DroppedDown(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomCombo(Instance).DroppedDown;
end;

procedure __DC__SetTCustomCombo__DroppedDown(Instance : TObject; Params : PVariantArgList);
begin
TCustomCombo(Instance).DroppedDown:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomCombo__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomCombo(Instance).Items);
end;

procedure __DC__SetTCustomCombo__Items(Instance : TObject; Params : PVariantArgList);
begin
TCustomCombo(Instance).Items:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomCombo__SelLength(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomCombo(Instance).SelLength;
end;

procedure __DC__SetTCustomCombo__SelLength(Instance : TObject; Params : PVariantArgList);
begin
TCustomCombo(Instance).SelLength:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomCombo__SelStart(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomCombo(Instance).SelStart;
end;

procedure __DC__SetTCustomCombo__SelStart(Instance : TObject; Params : PVariantArgList);
begin
TCustomCombo(Instance).SelStart:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomCombo__TabStop(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomCombo(Instance).TabStop;
end;

procedure __DC__SetTCustomCombo__TabStop(Instance : TObject; Params : PVariantArgList);
begin
TCustomCombo(Instance).TabStop:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomComboBox__AutoComplete(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomComboBox(Instance).AutoComplete;
end;

procedure __DC__SetTCustomComboBox__AutoComplete(Instance : TObject; Params : PVariantArgList);
begin
TCustomComboBox(Instance).AutoComplete:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomComboBox__AutoDropDown(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomComboBox(Instance).AutoDropDown;
end;

procedure __DC__SetTCustomComboBox__AutoDropDown(Instance : TObject; Params : PVariantArgList);
begin
TCustomComboBox(Instance).AutoDropDown:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomComboBox__CharCase(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomComboBox(Instance).CharCase;
end;

procedure __DC__SetTCustomComboBox__CharCase(Instance : TObject; Params : PVariantArgList);
begin
TCustomComboBox(Instance).CharCase:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomComboBox__SelText(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomComboBox(Instance).SelText;
end;

procedure __DC__SetTCustomComboBox__SelText(Instance : TObject; Params : PVariantArgList);
begin
TCustomComboBox(Instance).SelText:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomEdit__CanUndo(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomEdit(Instance).CanUndo;
end;

function __DC__GetTCustomEdit__Modified(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomEdit(Instance).Modified;
end;

procedure __DC__SetTCustomEdit__Modified(Instance : TObject; Params : PVariantArgList);
begin
TCustomEdit(Instance).Modified:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomEdit__SelLength(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomEdit(Instance).SelLength;
end;

procedure __DC__SetTCustomEdit__SelLength(Instance : TObject; Params : PVariantArgList);
begin
TCustomEdit(Instance).SelLength:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomEdit__SelStart(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomEdit(Instance).SelStart;
end;

procedure __DC__SetTCustomEdit__SelStart(Instance : TObject; Params : PVariantArgList);
begin
TCustomEdit(Instance).SelStart:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomEdit__SelText(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomEdit(Instance).SelText;
end;

procedure __DC__SetTCustomEdit__SelText(Instance : TObject; Params : PVariantArgList);
begin
TCustomEdit(Instance).SelText:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomEdit__Text(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomEdit(Instance).Text;
end;

procedure __DC__SetTCustomEdit__Text(Instance : TObject; Params : PVariantArgList);
begin
TCustomEdit(Instance).Text:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomLabel__Caption(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomLabel(Instance).Caption;
end;

procedure __DC__SetTCustomLabel__Caption(Instance : TObject; Params : PVariantArgList);
begin
TCustomLabel(Instance).Caption:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomLabel__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomLabel(Instance).Canvas);
end;

function __DC__GetTCustomListBox__AutoComplete(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomListBox(Instance).AutoComplete;
end;

procedure __DC__SetTCustomListBox__AutoComplete(Instance : TObject; Params : PVariantArgList);
begin
TCustomListBox(Instance).AutoComplete:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomListBox__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomListBox(Instance).Canvas);
end;

function __DC__GetTCustomListBox__Count(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomListBox(Instance).Count;
end;

procedure __DC__SetTCustomListBox__Count(Instance : TObject; Params : PVariantArgList);
begin
TCustomListBox(Instance).Count:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomListBox__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomListBox(Instance).Items);
end;

procedure __DC__SetTCustomListBox__Items(Instance : TObject; Params : PVariantArgList);
begin
TCustomListBox(Instance).Items:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomListBox__Selected(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomListBox(Instance).Selected[OleVariant(Params^[0])];
end;

procedure __DC__SetTCustomListBox__Selected(Instance : TObject; Params : PVariantArgList);
begin
TCustomListBox(Instance).Selected[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomListBox__ScrollWidth(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomListBox(Instance).ScrollWidth;
end;

procedure __DC__SetTCustomListBox__ScrollWidth(Instance : TObject; Params : PVariantArgList);
begin
TCustomListBox(Instance).ScrollWidth:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomListBox__TopIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomListBox(Instance).TopIndex;
end;

procedure __DC__SetTCustomListBox__TopIndex(Instance : TObject; Params : PVariantArgList);
begin
TCustomListBox(Instance).TopIndex:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemo__CaretPos(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TPoint__Wrapper;
begin
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := TCustomMemo(Instance).CaretPos;
result := IUnknown(__wrapper) as IDispatch;
end;

procedure __DC__SetTCustomMemo__CaretPos(Instance : TObject; Params : PVariantArgList);
var
__idisp:IDispatch;
__iwrapper:IDCRecordWrapper;
begin
__idisp:=DCVarToInterface(OleVariant(Params^[0]));
if __idisp=nil then exit;
__idisp.QueryInterface(IDCRecordWrapper, __iwrapper);
TCustomMemo(Instance).CaretPos:=TPoint(__iwrapper.GetRecordPtr^);
end;

function __DC__GetTCustomMemo__Lines(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomMemo(Instance).Lines);
end;

procedure __DC__SetTCustomMemo__Lines(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemo(Instance).Lines:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

procedure __RegisterProps;
begin
RegisterProperty(TCustomCombo,'Canvas',__DC__GetTCustomCombo__Canvas,nil);
RegisterProperty(TCustomCombo,'DroppedDown',__DC__GetTCustomCombo__DroppedDown,__DC__SetTCustomCombo__DroppedDown);
RegisterProperty(TCustomCombo,'Items',__DC__GetTCustomCombo__Items,__DC__SetTCustomCombo__Items);
RegisterProperty(TCustomCombo,'SelLength',__DC__GetTCustomCombo__SelLength,__DC__SetTCustomCombo__SelLength);
RegisterProperty(TCustomCombo,'SelStart',__DC__GetTCustomCombo__SelStart,__DC__SetTCustomCombo__SelStart);
RegisterProperty(TCustomCombo,'TabStop',__DC__GetTCustomCombo__TabStop,__DC__SetTCustomCombo__TabStop);
RegisterProperty(TCustomComboBox,'AutoComplete',__DC__GetTCustomComboBox__AutoComplete,__DC__SetTCustomComboBox__AutoComplete);
RegisterProperty(TCustomComboBox,'AutoDropDown',__DC__GetTCustomComboBox__AutoDropDown,__DC__SetTCustomComboBox__AutoDropDown);
RegisterProperty(TCustomComboBox,'CharCase',__DC__GetTCustomComboBox__CharCase,__DC__SetTCustomComboBox__CharCase);
RegisterProperty(TCustomComboBox,'SelText',__DC__GetTCustomComboBox__SelText,__DC__SetTCustomComboBox__SelText);
RegisterProperty(TCustomEdit,'CanUndo',__DC__GetTCustomEdit__CanUndo,nil);
RegisterProperty(TCustomEdit,'Modified',__DC__GetTCustomEdit__Modified,__DC__SetTCustomEdit__Modified);
RegisterProperty(TCustomEdit,'SelLength',__DC__GetTCustomEdit__SelLength,__DC__SetTCustomEdit__SelLength);
RegisterProperty(TCustomEdit,'SelStart',__DC__GetTCustomEdit__SelStart,__DC__SetTCustomEdit__SelStart);
RegisterProperty(TCustomEdit,'SelText',__DC__GetTCustomEdit__SelText,__DC__SetTCustomEdit__SelText);
RegisterProperty(TCustomEdit,'Text',__DC__GetTCustomEdit__Text,__DC__SetTCustomEdit__Text);
RegisterProperty(TCustomLabel,'Caption',__DC__GetTCustomLabel__Caption,__DC__SetTCustomLabel__Caption);
RegisterProperty(TCustomLabel,'Canvas',__DC__GetTCustomLabel__Canvas,nil);
RegisterProperty(TCustomListBox,'AutoComplete',__DC__GetTCustomListBox__AutoComplete,__DC__SetTCustomListBox__AutoComplete);
RegisterProperty(TCustomListBox,'Canvas',__DC__GetTCustomListBox__Canvas,nil);
RegisterProperty(TCustomListBox,'Count',__DC__GetTCustomListBox__Count,__DC__SetTCustomListBox__Count);
RegisterProperty(TCustomListBox,'Items',__DC__GetTCustomListBox__Items,__DC__SetTCustomListBox__Items);
RegisterIndexedProperty(TCustomListBox,'Selected',1,False,__DC__GetTCustomListBox__Selected,__DC__SetTCustomListBox__Selected);
RegisterProperty(TCustomListBox,'ScrollWidth',__DC__GetTCustomListBox__ScrollWidth,__DC__SetTCustomListBox__ScrollWidth);
RegisterProperty(TCustomListBox,'TopIndex',__DC__GetTCustomListBox__TopIndex,__DC__SetTCustomListBox__TopIndex);
RegisterProperty(TCustomMemo,'CaretPos',__DC__GetTCustomMemo__CaretPos,__DC__SetTCustomMemo__CaretPos);
RegisterProperty(TCustomMemo,'Lines',__DC__GetTCustomMemo__Lines,__DC__SetTCustomMemo__Lines);
end;

const __ConstNames0 : array[0..34] of string = (
'tlTop'
,'tlCenter'
,'tlBottom'
,'ecNormal'
,'ecUpperCase'
,'ecLowerCase'
,'ssNone'
,'ssHorizontal'
,'ssVertical'
,'ssBoth'
,'csDropDown'
,'csSimple'
,'csDropDownList'
,'csOwnerDrawFixed'
,'csOwnerDrawVariable'
,'cbUnchecked'
,'cbChecked'
,'cbGrayed'
,'lbStandard'
,'lbOwnerDrawFixed'
,'lbOwnerDrawVariable'
,'lbVirtual'
,'lbVirtualOwnerDraw'
,'scLineUp'
,'scLineDown'
,'scPageUp'
,'scPageDown'
,'scPosition'
,'scTrack'
,'scTop'
,'scBottom'
,'scEndScroll'
,'sbsNone'
,'sbsSingle'
,'sbsSunken'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,tlTop));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,tlCenter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,tlBottom));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,ecNormal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,ecUpperCase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,ecLowerCase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,ssNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,ssHorizontal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,ssVertical));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,ssBoth));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,csDropDown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,csSimple));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,csDropDownList));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,csOwnerDrawFixed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,csOwnerDrawVariable));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,cbUnchecked));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,cbChecked));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,cbGrayed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,lbStandard));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,lbOwnerDrawFixed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,lbOwnerDrawVariable));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,lbVirtual));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,lbVirtualOwnerDraw));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,scLineUp));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,scLineDown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,scPageUp));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,scPageDown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,scPosition));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,scTrack));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,scTop));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,scBottom));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,scEndScroll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,sbsNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,sbsSingle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,sbsSunken));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..22] of TClass = (
TButton,
TButtonActionLink,
TButtonControl,
TCheckBox,
TComboBox,
TCustomCheckBox,
TCustomCombo,
TCustomComboBox,
TCustomComboBoxStrings,
TCustomEdit,
TCustomGroupBox,
TCustomLabel,
TCustomListBox,
TCustomMemo,
TCustomStaticText,
TEdit,
TGroupBox,
TLabel,
TListBox,
TMemo,
TRadioButton,
TScrollBar,
TStaticText
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
procedure _mreg_0;
begin
RegRegisterMethod(TButton,'SetButtonStyle',TypeInfo(_T0),[
TypeInfo(Boolean)], pointer(204));

RegRegisterMethod(TButtonControl,'GetChecked',TypeInfo(_T1),[TypeInfo(Boolean)], pointer(196));

RegRegisterMethod(TButtonControl,'SetChecked',TypeInfo(_T2),[
TypeInfo(Boolean)], pointer(200));

RegRegisterMethod(TCustomCheckBox,'Toggle',TypeInfo(_T3),NoParams, pointer(204));

RegRegisterMethod(TCustomCombo,'AdjustDropDown',TypeInfo(_T4),NoParams, pointer(236));

RegRegisterMethod(TCustomCombo,'ComboWndProc',TypeInfo(_T5),[
TypeInfo(IDispatch),
TypeInfo(HWnd),
TypeInfoPointer], pointer(240));

RegRegisterMethod(TCustomCombo,'GetItemHt',TypeInfo(_T7),[TypeInfo(Integer)], pointer(248));

RegRegisterMethod(TCustomCombo,'SetItemHeight',TypeInfo(_T8),[
TypeInfo(Integer)], pointer(252));

RegRegisterMethod(TCustomCombo,'GetItemCount',TypeInfo(_T9),[TypeInfo(Integer)], pointer(256));

RegRegisterMethod(TCustomCombo,'Change',TypeInfo(_T10),NoParams, pointer(MinVMTOffset - 76));

RegRegisterMethod(TCustomCombo,'Select',TypeInfo(_T11),NoParams, pointer(MinVMTOffset - 77));

RegRegisterMethod(TCustomCombo,'DropDown',TypeInfo(_T12),NoParams, pointer(MinVMTOffset - 78));

RegRegisterMethod(TCustomCombo,'CloseUp',TypeInfo(_T13),NoParams, pointer(MinVMTOffset - 79));

RegRegisterMethod(TCustomCombo,'SetDropDownCount',TypeInfo(_T14),[
TypeInfo(Integer)], pointer(260));

RegRegisterMethod(TCustomCombo,'SetItems',TypeInfo(_T15),[
TypeInfo(TStrings)], pointer(264));

RegRegisterMethod(TCustomComboBox,'DrawItem',TypeInfo(_T16),[
TypeInfo(Integer),
TypeInfo(IDispatch),
TypeInfo(TOwnerDrawState)], pointer(268));

RegRegisterMethod(TCustomComboBox,'MeasureItem',TypeInfo(_T17),[
TypeInfo(Integer),
TypeInfo(Integer)], pointer(272));

RegRegisterMethod(TCustomComboBox,'SetStyle',TypeInfo(_T18),[
TypeInfo(TComboBoxStyle)], pointer(276));

RegRegisterMethod(TCustomEdit,'Change',TypeInfo(_T19),NoParams, pointer(MinVMTOffset - 76));

RegRegisterMethod(TCustomEdit,'DoSetMaxLength',TypeInfo(_T20),[
TypeInfo(Integer)], pointer(196));

RegRegisterMethod(TCustomEdit,'GetSelLength',TypeInfo(_T21),[TypeInfo(Integer)], pointer(200));

RegRegisterMethod(TCustomEdit,'GetSelStart',TypeInfo(_T22),[TypeInfo(Integer)], pointer(204));

RegRegisterMethod(TCustomEdit,'GetSelText',TypeInfo(_T23),[TypeInfo(string)], pointer(208));

RegRegisterMethod(TCustomEdit,'SetSelLength',TypeInfo(_T24),[
TypeInfo(Integer)], pointer(212));

RegRegisterMethod(TCustomEdit,'SetSelStart',TypeInfo(_T25),[
TypeInfo(Integer)], pointer(216));

RegRegisterMethod(TCustomEdit,'Clear',TypeInfo(_T26),NoParams, pointer(220));

RegRegisterMethod(TCustomEdit,'ClearSelection',TypeInfo(_T27),NoParams,Addr(TCustomEdit.ClearSelection));

RegRegisterMethod(TCustomEdit,'CopyToClipboard',TypeInfo(_T28),NoParams,Addr(TCustomEdit.CopyToClipboard));

RegRegisterMethod(TCustomEdit,'CutToClipboard',TypeInfo(_T29),NoParams,Addr(TCustomEdit.CutToClipboard));

RegRegisterMethod(TCustomEdit,'PasteFromClipboard',TypeInfo(_T30),NoParams,Addr(TCustomEdit.PasteFromClipboard));

RegRegisterMethod(TCustomEdit,'Undo',TypeInfo(_T31),NoParams,Addr(TCustomEdit.Undo));

RegRegisterMethod(TCustomEdit,'ClearUndo',TypeInfo(_T32),NoParams,Addr(TCustomEdit.ClearUndo));

RegRegisterMethod(TCustomEdit,'SelectAll',TypeInfo(_T34),NoParams,Addr(TCustomEdit.SelectAll));

RegRegisterMethod(TCustomLabel,'AdjustBounds',TypeInfo(_T36),NoParams, pointer(MinVMTOffset - 56));

RegRegisterMethod(TCustomLabel,'DoDrawText',TypeInfo(_T37),[
TypeInfo(IDispatch),
TypeInfo(Longint)], pointer(MinVMTOffset - 57));

RegRegisterMethod(TCustomLabel,'GetLabelText',TypeInfo(_T38),[TypeInfo(string)], pointer(144));

RegRegisterMethod(TCustomListBox,'DrawItem',TypeInfo(_T39),[
TypeInfo(Integer),
TypeInfo(IDispatch),
TypeInfo(TOwnerDrawState)], pointer(244));

RegRegisterMethod(TCustomListBox,'MeasureItem',TypeInfo(_T40),[
TypeInfo(Integer),
TypeInfo(Integer)], pointer(248));

RegRegisterMethod(TCustomListBox,'InternalGetItemData',TypeInfo(_T41),[
TypeInfo(Integer),TypeInfo(Longint)], pointer(MinVMTOffset - 76));

RegRegisterMethod(TCustomListBox,'InternalSetItemData',TypeInfo(_T42),[
TypeInfo(Integer),
TypeInfo(Longint)], pointer(MinVMTOffset - 77));

RegRegisterMethod(TCustomListBox,'GetItemData',TypeInfo(_T43),[
TypeInfo(Integer),TypeInfo(Longint)], pointer(MinVMTOffset - 78));

RegRegisterMethod(TCustomListBox,'SetItemData',TypeInfo(_T44),[
TypeInfo(Integer),
TypeInfo(Longint)], pointer(MinVMTOffset - 79));

RegRegisterMethod(TCustomListBox,'ResetContent',TypeInfo(_T45),NoParams, pointer(MinVMTOffset - 80));

RegRegisterMethod(TCustomListBox,'DeleteString',TypeInfo(_T46),[
TypeInfo(Integer)], pointer(MinVMTOffset - 81));

RegRegisterMethod(TCustomListBox,'ItemAtPos',TypeInfo(_T47),[
TypeInfo(IDispatch),
TypeInfo(Boolean),TypeInfo(Integer)],Addr(__TCustomListBox__ItemAtPos__Wrapper));

RegRegisterMethod(TCustomListBox,'ItemRect',TypeInfo(_T48),[
TypeInfo(Integer),TypeInfo(IDispatch)],Addr(__TCustomListBox__ItemRect__Wrapper));

RegRegisterMethod(TCustomMemo,'GetCaretPos',TypeInfo(_T49),[TypeInfo(IDispatch)], pointer(228));

RegRegisterMethod(TCustomMemo,'SetCaretPos',TypeInfo(_T50),[
TypeInfo(IDispatch)], pointer(232));

RegRegisterMethod(TScrollBar,'Change',TypeInfo(_T51),NoParams, pointer(MinVMTOffset - 76));

RegRegisterMethod(TScrollBar,'Scroll',TypeInfo(_T52),[
TypeInfo(TScrollCode),
TypeInfo(Integer)], pointer(MinVMTOffset - 77));

RegRegisterMethod(TScrollBar,'SetParams',TypeInfo(_T53),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TScrollBar.SetParams));

end;
initialization
_mreg_0;
{RegRegisterMethod(TCustomCombo,'GetItemsClass',TypeInfo(_T6),[TypeInfo(TCustomComboBoxStringsClass)], pointer(244))}

{RegRegisterMethod(TCustomEdit,'GetSelTextBuf',TypeInfo(_T33),[
TypeInfoPChar,
TypeInfo(Integer),TypeInfo(Integer)], pointer(224))}

{RegRegisterMethod(TCustomEdit,'SetSelTextBuf',TypeInfo(_T35),[
TypeInfoPChar],Addr(TCustomEdit.SetSelTextBuf))}

{RegisterEvent(TypeInfo(TDrawItemEvent),[
TypeInfo(TWinControl),
TypeInfo(Integer),
TypeInfo(IDispatch),
TypeInfo(TOwnerDrawState)]);}

RegisterEvent(TypeInfo(TLBFindDataEvent),[
TypeInfo(TWinControl),
TypeInfo(string),TypeInfo(Integer)]);

RegisterEvent(TypeInfo(TLBGetDataEvent),[
TypeInfo(TWinControl),
TypeInfo(Integer),
TypeInfo(string)]);

RegisterEvent(TypeInfo(TLBGetDataObjectEvent),[
TypeInfo(TWinControl),
TypeInfo(Integer),
TypeInfo(TObject)]);

RegisterEvent(TypeInfo(TMeasureItemEvent),[
TypeInfo(TWinControl),
TypeInfo(Integer),
TypeInfo(Integer)]);

RegisterEvent(TypeInfo(TScrollEvent),[
TypeInfo(TObject),
TypeInfo(TScrollCode),
TypeInfo(Integer)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
end.
