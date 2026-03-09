{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit STDCTRLS_D3;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  activex,
  dcscript,
  dcsystem,
  dcdreamlib,
  Messages,
  Windows,
  SysUtils,
  Classes,
  Controls,
  Forms,
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
procedure setLeft(const val : Integer);
function getLeft : Integer;
property Left : Integer read getLeft write setLeft;
procedure setTop(const val : Integer);
function getTop : Integer;
property Top : Integer read getTop write setTop;
procedure setRight(const val : Integer);
function getRight : Integer;
property Right : Integer read getRight write setRight;
procedure setBottom(const val : Integer);
function getBottom : Integer;
property Bottom : Integer read getBottom write setBottom;
end;
type __TPoint__Wrapper = class(TDCRecordWrapper)
private
fR : TPoint;
public
function GetRecordPtr : pointer; override;
published
procedure setx(const val : Longint);
function getx : Longint;
property x : Longint read getx write setx;
procedure sety(const val : Longint);
function gety : Longint;
property y : Longint read gety write sety;
end;
type __TCustomComboBox__ = class(TCustomComboBox);
type __TCustomListBox__ = class(TCustomListBox);
type
_T0 = procedure (p0 : Boolean) of object;

_T1 = procedure  of object;

_T2 = procedure (const p0 : IDispatch;
p1 : HWnd;
p2 : Pointer) of object;

_T3 = procedure (p0 : Integer;
const p1 : IDispatch;
p2 : TOwnerDrawState) of object;

_T4 = procedure (p0 : Integer;
var p1 : Integer) of object;

_T5 = _T1;

_T6 = _T1;

_T7 = procedure (p0 : TComboBoxStyle) of object;

_T8 = _T1;

_T9 = _T1;

_T10 = _T1;

_T11 = procedure (p0 : Integer) of object;

_T12 = function : Integer of object;

_T13 = _T12;

_T14 = function : string of object;

_T15 = _T11;

_T16 = _T11;

_T17 = _T1;

_T18 = _T1;

_T19 = _T1;

_T20 = _T1;

_T21 = _T1;

{_T22 = function (p0 : PChar;
p1 : Integer): Integer of object;}

_T23 = _T1;

{_T24 = procedure (p0 : PChar) of object;}

_T25 = _T14;

_T26 = _T0;

_T27 = _T3;

_T28 = _T4;

_T29 = function (p0 : Integer): Longint of object;

_T30 = procedure (p0 : Integer;
p1 : Longint) of object;

_T31 = _T1;

_T32 = _T11;

_T33 = _T1;

_T34 = function (const p0 : IDispatch;
p1 : Boolean): Integer of object;

_T35 = function (p0 : Integer): IDispatch of object;

_T36 = _T1;

_T37 = procedure (p0 : TScrollCode;
var p1 : Integer) of object;

_T38 = procedure (p0 : Integer;
p1 : Integer;
p2 : Integer) of object;

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
procedure __TRect__Wrapper.setLeft(const val : Integer);
begin
TRect(GetRecordPtr^).Left := val;
end;
function __TRect__Wrapper.getLeft : Integer;
begin
result := TRect(GetRecordPtr^).Left;
end;
procedure __TRect__Wrapper.setTop(const val : Integer);
begin
TRect(GetRecordPtr^).Top := val;
end;
function __TRect__Wrapper.getTop : Integer;
begin
result := TRect(GetRecordPtr^).Top;
end;
procedure __TRect__Wrapper.setRight(const val : Integer);
begin
TRect(GetRecordPtr^).Right := val;
end;
function __TRect__Wrapper.getRight : Integer;
begin
result := TRect(GetRecordPtr^).Right;
end;
procedure __TRect__Wrapper.setBottom(const val : Integer);
begin
TRect(GetRecordPtr^).Bottom := val;
end;
function __TRect__Wrapper.getBottom : Integer;
begin
result := TRect(GetRecordPtr^).Bottom;
end;
function __TPoint__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TPoint__Wrapper.setx(const val : Longint);
begin
TPoint(GetRecordPtr^).x := val;
end;
function __TPoint__Wrapper.getx : Longint;
begin
result := TPoint(GetRecordPtr^).x;
end;
procedure __TPoint__Wrapper.sety(const val : Longint);
begin
TPoint(GetRecordPtr^).y := val;
end;
function __TPoint__Wrapper.gety : Longint;
begin
result := TPoint(GetRecordPtr^).y;
end;
procedure __TCustomComboBox__ComboWndProc__Wrapper(__Instance : TCustomComboBox;
const p0 : IDispatch;
p1 : HWnd;
p2 : Pointer);
var
__p0 : ^TMessage;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
__TCustomComboBox__(__Instance).ComboWndProc(__p0^,p1,p2);
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
function __DC__GetTCustomComboBox__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomComboBox(Instance).Canvas);
end;

function __DC__GetTCustomComboBox__DroppedDown(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomComboBox(Instance).DroppedDown;
end;

procedure __DC__SetTCustomComboBox__DroppedDown(Instance : TObject; Params : PVariantArgList);
begin
TCustomComboBox(Instance).DroppedDown:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomComboBox__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomComboBox(Instance).Items);
end;

procedure __DC__SetTCustomComboBox__Items(Instance : TObject; Params : PVariantArgList);
begin
TCustomComboBox(Instance).Items:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomComboBox__ItemIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomComboBox(Instance).ItemIndex;
end;

procedure __DC__SetTCustomComboBox__ItemIndex(Instance : TObject; Params : PVariantArgList);
begin
TCustomComboBox(Instance).ItemIndex:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomComboBox__SelLength(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomComboBox(Instance).SelLength;
end;

procedure __DC__SetTCustomComboBox__SelLength(Instance : TObject; Params : PVariantArgList);
begin
TCustomComboBox(Instance).SelLength:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomComboBox__SelStart(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomComboBox(Instance).SelStart;
end;

procedure __DC__SetTCustomComboBox__SelStart(Instance : TObject; Params : PVariantArgList);
begin
TCustomComboBox(Instance).SelStart:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomComboBox__SelText(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomComboBox(Instance).SelText;
end;

procedure __DC__SetTCustomComboBox__SelText(Instance : TObject; Params : PVariantArgList);
begin
TCustomComboBox(Instance).SelText:=OleVariant(Params^[0]);
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

function __DC__GetTCustomLabel__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomLabel(Instance).Canvas);
end;

function __DC__GetTCustomListBox__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomListBox(Instance).Canvas);
end;

function __DC__GetTCustomListBox__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomListBox(Instance).Items);
end;

procedure __DC__SetTCustomListBox__Items(Instance : TObject; Params : PVariantArgList);
begin
TCustomListBox(Instance).Items:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomListBox__ItemIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomListBox(Instance).ItemIndex;
end;

procedure __DC__SetTCustomListBox__ItemIndex(Instance : TObject; Params : PVariantArgList);
begin
TCustomListBox(Instance).ItemIndex:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomListBox__SelCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomListBox(Instance).SelCount;
end;

function __DC__GetTCustomListBox__Selected(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomListBox(Instance).Selected[OleVariant(Params^[0])];
end;

procedure __DC__SetTCustomListBox__Selected(Instance : TObject; Params : PVariantArgList);
begin
TCustomListBox(Instance).Selected[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomListBox__TopIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomListBox(Instance).TopIndex;
end;

procedure __DC__SetTCustomListBox__TopIndex(Instance : TObject; Params : PVariantArgList);
begin
TCustomListBox(Instance).TopIndex:=OleVariant(Params^[0]);
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
RegisterProperty(TCustomComboBox,'Canvas',__DC__GetTCustomComboBox__Canvas,nil);
RegisterProperty(TCustomComboBox,'DroppedDown',__DC__GetTCustomComboBox__DroppedDown,__DC__SetTCustomComboBox__DroppedDown);
RegisterProperty(TCustomComboBox,'Items',__DC__GetTCustomComboBox__Items,__DC__SetTCustomComboBox__Items);
RegisterProperty(TCustomComboBox,'ItemIndex',__DC__GetTCustomComboBox__ItemIndex,__DC__SetTCustomComboBox__ItemIndex);
RegisterProperty(TCustomComboBox,'SelLength',__DC__GetTCustomComboBox__SelLength,__DC__SetTCustomComboBox__SelLength);
RegisterProperty(TCustomComboBox,'SelStart',__DC__GetTCustomComboBox__SelStart,__DC__SetTCustomComboBox__SelStart);
RegisterProperty(TCustomComboBox,'SelText',__DC__GetTCustomComboBox__SelText,__DC__SetTCustomComboBox__SelText);
RegisterProperty(TCustomEdit,'Modified',__DC__GetTCustomEdit__Modified,__DC__SetTCustomEdit__Modified);
RegisterProperty(TCustomEdit,'SelLength',__DC__GetTCustomEdit__SelLength,__DC__SetTCustomEdit__SelLength);
RegisterProperty(TCustomEdit,'SelStart',__DC__GetTCustomEdit__SelStart,__DC__SetTCustomEdit__SelStart);
RegisterProperty(TCustomEdit,'SelText',__DC__GetTCustomEdit__SelText,__DC__SetTCustomEdit__SelText);
RegisterProperty(TCustomEdit,'Text',__DC__GetTCustomEdit__Text,__DC__SetTCustomEdit__Text);
RegisterProperty(TCustomLabel,'Canvas',__DC__GetTCustomLabel__Canvas,nil);
RegisterProperty(TCustomListBox,'Canvas',__DC__GetTCustomListBox__Canvas,nil);
RegisterProperty(TCustomListBox,'Items',__DC__GetTCustomListBox__Items,__DC__SetTCustomListBox__Items);
RegisterProperty(TCustomListBox,'ItemIndex',__DC__GetTCustomListBox__ItemIndex,__DC__SetTCustomListBox__ItemIndex);
RegisterProperty(TCustomListBox,'SelCount',__DC__GetTCustomListBox__SelCount,nil);
RegisterIndexedProperty(TCustomListBox,'Selected',1,False,__DC__GetTCustomListBox__Selected,__DC__SetTCustomListBox__Selected);
RegisterProperty(TCustomListBox,'TopIndex',__DC__GetTCustomListBox__TopIndex,__DC__SetTCustomListBox__TopIndex);
RegisterProperty(TCustomMemo,'Lines',__DC__GetTCustomMemo__Lines,__DC__SetTCustomMemo__Lines);
end;

const __ConstNames0 : array[0..37] of string = (
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
,'odSelected'
,'odGrayed'
,'odDisabled'
,'odChecked'
,'odFocused'
,'cbUnchecked'
,'cbChecked'
,'cbGrayed'
,'lbStandard'
,'lbOwnerDrawFixed'
,'lbOwnerDrawVariable'
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
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,odSelected));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,odGrayed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,odDisabled));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,odChecked));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,odFocused));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,cbUnchecked));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,cbChecked));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,cbGrayed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,lbStandard));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,lbOwnerDrawFixed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,lbOwnerDrawVariable));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,scLineUp));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,scLineDown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,scPageUp));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,scPageDown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,scPosition));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,scTrack));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,scTop));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,scBottom));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,scEndScroll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,sbsNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,sbsSingle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,sbsSunken));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..19] of TClass = (
TButton,
TButtonControl,
TCheckBox,
TComboBox,
TCustomCheckBox,
TCustomComboBox,
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
TypeInfo(Boolean)], pointer(124));

RegRegisterMethod(TCustomCheckBox,'Toggle',TypeInfo(_T1),NoParams, pointer(124));

RegRegisterMethod(TCustomComboBox,'ComboWndProc',TypeInfo(_T2),[
TypeInfo(IDispatch),
TypeInfo(HWnd),
TypeInfoPointer], pointer(124));

RegRegisterMethod(TCustomComboBox,'DrawItem',TypeInfo(_T3),[
TypeInfo(Integer),
TypeInfo(IDispatch),
TypeInfo(TOwnerDrawState)], pointer(128));

RegRegisterMethod(TCustomComboBox,'MeasureItem',TypeInfo(_T4),[
TypeInfo(Integer),
TypeInfo(Integer)], pointer(132));

RegRegisterMethod(TCustomComboBox,'Change',TypeInfo(_T5),NoParams, pointer(MinVMTOffset - 36));

RegRegisterMethod(TCustomComboBox,'DropDown',TypeInfo(_T6),NoParams, pointer(MinVMTOffset - 37));

RegRegisterMethod(TCustomComboBox,'SetStyle',TypeInfo(_T7),[
TypeInfo(TComboBoxStyle)], pointer(136));

RegRegisterMethod(TCustomComboBox,'Clear',TypeInfo(_T8),NoParams,Addr(TCustomComboBox.Clear));

RegRegisterMethod(TCustomComboBox,'SelectAll',TypeInfo(_T9),NoParams,Addr(TCustomComboBox.SelectAll));

RegRegisterMethod(TCustomEdit,'Change',TypeInfo(_T10),NoParams, pointer(MinVMTOffset - 36));

RegRegisterMethod(TCustomEdit,'DoSetMaxLength',TypeInfo(_T11),[
TypeInfo(Integer)], pointer(124));

RegRegisterMethod(TCustomEdit,'GetSelLength',TypeInfo(_T12),[TypeInfo(Integer)], pointer(128));

RegRegisterMethod(TCustomEdit,'GetSelStart',TypeInfo(_T13),[TypeInfo(Integer)], pointer(132));

RegRegisterMethod(TCustomEdit,'GetSelText',TypeInfo(_T14),[TypeInfo(string)], pointer(136));

RegRegisterMethod(TCustomEdit,'SetSelLength',TypeInfo(_T15),[
TypeInfo(Integer)], pointer(140));

RegRegisterMethod(TCustomEdit,'SetSelStart',TypeInfo(_T16),[
TypeInfo(Integer)], pointer(144));

RegRegisterMethod(TCustomEdit,'Clear',TypeInfo(_T17),NoParams, pointer(148));

RegRegisterMethod(TCustomEdit,'ClearSelection',TypeInfo(_T18),NoParams,Addr(TCustomEdit.ClearSelection));

RegRegisterMethod(TCustomEdit,'CopyToClipboard',TypeInfo(_T19),NoParams,Addr(TCustomEdit.CopyToClipboard));

RegRegisterMethod(TCustomEdit,'CutToClipboard',TypeInfo(_T20),NoParams,Addr(TCustomEdit.CutToClipboard));

RegRegisterMethod(TCustomEdit,'PasteFromClipboard',TypeInfo(_T21),NoParams,Addr(TCustomEdit.PasteFromClipboard));

RegRegisterMethod(TCustomEdit,'SelectAll',TypeInfo(_T23),NoParams,Addr(TCustomEdit.SelectAll));

RegRegisterMethod(TCustomLabel,'GetLabelText',TypeInfo(_T25),[TypeInfo(string)], pointer(88));

RegRegisterMethod(TCustomLabel,'SetAutoSize',TypeInfo(_T26),[
TypeInfo(Boolean)], pointer(92));

RegRegisterMethod(TCustomListBox,'DrawItem',TypeInfo(_T27),[
TypeInfo(Integer),
TypeInfo(IDispatch),
TypeInfo(TOwnerDrawState)], pointer(124));

RegRegisterMethod(TCustomListBox,'MeasureItem',TypeInfo(_T28),[
TypeInfo(Integer),
TypeInfo(Integer)], pointer(128));

RegRegisterMethod(TCustomListBox,'GetItemData',TypeInfo(_T29),[
TypeInfo(Integer),TypeInfo(Longint)], pointer(MinVMTOffset - 36));

RegRegisterMethod(TCustomListBox,'SetItemData',TypeInfo(_T30),[
TypeInfo(Integer),
TypeInfo(Longint)], pointer(MinVMTOffset - 37));

RegRegisterMethod(TCustomListBox,'ResetContent',TypeInfo(_T31),NoParams, pointer(MinVMTOffset - 38));

RegRegisterMethod(TCustomListBox,'DeleteString',TypeInfo(_T32),[
TypeInfo(Integer)], pointer(MinVMTOffset - 39));

RegRegisterMethod(TCustomListBox,'Clear',TypeInfo(_T33),NoParams,Addr(TCustomListBox.Clear));

RegRegisterMethod(TCustomListBox,'ItemAtPos',TypeInfo(_T34),[
TypeInfo(IDispatch),
TypeInfo(Boolean),TypeInfo(Integer)],Addr(__TCustomListBox__ItemAtPos__Wrapper));

RegRegisterMethod(TCustomListBox,'ItemRect',TypeInfo(_T35),[
TypeInfo(Integer),TypeInfo(IDispatch)],Addr(__TCustomListBox__ItemRect__Wrapper));

RegRegisterMethod(TScrollBar,'Change',TypeInfo(_T36),NoParams, pointer(MinVMTOffset - 36));

RegRegisterMethod(TScrollBar,'Scroll',TypeInfo(_T37),[
TypeInfo(TScrollCode),
TypeInfo(Integer)], pointer(MinVMTOffset - 37));

RegRegisterMethod(TScrollBar,'SetParams',TypeInfo(_T38),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TScrollBar.SetParams));

end;
initialization
_mreg_0;
{RegRegisterMethod(TCustomEdit,'GetSelTextBuf',TypeInfo(_T22),[
TypeInfoPChar,
TypeInfo(Integer),TypeInfo(Integer)], pointer(152))}

{RegRegisterMethod(TCustomEdit,'SetSelTextBuf',TypeInfo(_T24),[
TypeInfoPChar],Addr(TCustomEdit.SetSelTextBuf))}

{RegisterEvent(TypeInfo(TDrawItemEvent),[
TypeInfo(TWinControl),
TypeInfo(Integer),
TypeInfo(IDispatch),
TypeInfo(TOwnerDrawState)]);}

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
