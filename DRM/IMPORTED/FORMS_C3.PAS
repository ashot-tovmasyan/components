{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit FORMS_C3;
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
  Graphics,
  Menus,
  Controls,
  Imm,
  Forms;
function ConvertTCMHintShowToVariant(var R : TCMHintShow) : OleVariant;
function ConvertVariantToTCMHintShow(const V : OleVariant) : TCMHintShow;
function ConvertTCursorRecToVariant(var R : TCursorRec) : OleVariant;
function ConvertVariantToTCursorRec(const V : OleVariant) : TCursorRec;
function ConvertTHintInfoToVariant(var R : THintInfo) : OleVariant;
function ConvertVariantToTHintInfo(const V : OleVariant) : THintInfo;
function ConvertTMessageToVariant(var R : TMessage) : OleVariant;
function ConvertVariantToTMessage(const V : OleVariant) : TMessage;
function ConvertTPointToVariant(var R : TPoint) : OleVariant;
function ConvertVariantToTPoint(const V : OleVariant) : TPoint;
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
procedure setx(const val : Longint);
function getx : Longint;
property x : Longint read getx write setx;
procedure sety(const val : Longint);
function gety : Longint;
property y : Longint read gety write sety;
end;
type __TCMHintShow__Wrapper = class(TDCRecordWrapper)
private
fR : TCMHintShow;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setReserved(const val : Integer);
function getReserved : Integer;
property Reserved : Integer read getReserved write setReserved;
procedure setResult(const val : Integer);
function getResult : Integer;
property Result : Integer read getResult write setResult;
end;
type __TCursorRec__Wrapper = class(TDCRecordWrapper)
private
fR : TCursorRec;
public
function GetRecordPtr : pointer; override;
published
procedure setIndex(const val : Integer);
function getIndex : Integer;
property Index : Integer read getIndex write setIndex;
end;
type __THintInfo__Wrapper = class(TDCRecordWrapper)
private
fR : THintInfo;
public
function GetRecordPtr : pointer; override;
published
procedure setHintControl(const val : TControl);
function getHintControl : TControl;
property HintControl : TControl read getHintControl write setHintControl;
procedure setHintMaxWidth(const val : Integer);
function getHintMaxWidth : Integer;
property HintMaxWidth : Integer read getHintMaxWidth write setHintMaxWidth;
procedure setHintColor(const val : TColor);
function getHintColor : TColor;
property HintColor : TColor read getHintColor write setHintColor;
procedure setReshowTimeout(const val : Integer);
function getReshowTimeout : Integer;
property ReshowTimeout : Integer read getReshowTimeout write setReshowTimeout;
procedure setHideTimeout(const val : Integer);
function getHideTimeout : Integer;
property HideTimeout : Integer read getHideTimeout write setHideTimeout;
procedure setHintStr(const val : AnsiString);
function getHintStr : AnsiString;
property HintStr : AnsiString read getHintStr write setHintStr;
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
type
_T0 = function (p0 : TControl): TCustomForm of object;

_T1 = _T0;

_T2 = function (p0 : HWND): Pointer of object;

_T3 = procedure (p0 : Pointer) of object;

{_T4 = function (p0 : TWndMethod): Pointer of object;}

_T5 = _T3;

_T6 = function (p0 : Word;
const p1 : string): Boolean of object;

_T7 = function (p0 : HWND): Boolean of object;

_T8 = procedure (p0 : HWND;
p1 : Word) of object;

_T9 = procedure (p0 : Boolean) of object;

{_T10 = function (p0 : TWndMethod): HWND of object;}

_T11 = procedure (p0 : HWND) of object;

_T12 = procedure  of object;

_T13 = _T12;

_T14 = function (p0 : Word): TShiftState of object;

_T15 = function (p0 : Longint): TShiftState of object;

_T16 = function : Boolean of object;

_T17 = _T12;

_T18 = procedure (p0 : TControl) of object;

_T19 = _T12;

{_T20 = procedure (p0 : TComponentClass;
var p1) of object;}

_T21 = _T12;

_T22 = procedure (p0 : TObject) of object;

_T23 = _T12;

_T24 = function (p0 : Integer;
p1 : Longint): Boolean of object;

_T25 = function (p0 : THelpContext): Boolean of object;

_T26 = function (const p0 : string): Boolean of object;

_T27 = _T12;

_T28 = procedure (p0 : TControl;
const p1 : IDispatch) of object;

{_T29 = procedure (p0 : TWindowHook) of object;}

_T30 = _T12;

{_T31 = function (p0 : PChar;
p1 : PChar;
p2 : Longint): Integer of object;}

_T32 = _T12;

_T33 = _T12;

_T34 = _T12;

_T35 = _T12;

_T36 = _T12;

_T37 = _T12;

_T38 = _T12;

_T39 = procedure (p0 : Exception) of object;

_T40 = _T12;

{_T41 = procedure (p0 : TWindowHook) of object;}

_T42 = _T12;

_T43 = _T12;

_T44 = _T12;

_T45 = _T12;

_T46 = _T12;

_T47 = _T12;

_T48 = _T12;

_T49 = procedure (p0 : TComponent;
p1 : Integer) of object;

_T50 = _T12;

_T51 = _T16;

_T52 = procedure (p0 : TWinControl;
p1 : Boolean) of object;

_T53 = procedure (p0 : TWinControl) of object;

_T54 = function : TBitmap of object;

_T55 = _T12;

_T56 = _T12;

_T57 = _T12;

_T58 = _T18;

_T59 = function (p0 : TWinControl): Boolean of object;

_T60 = _T12;

_T61 = function : Integer of object;

_T62 = function (p0 : TControl;
const p1 : IDispatch): Boolean of object;

_T63 = _T49;

_T64 = _T62;

_T65 = _T12;

_T66 = procedure (p0 : TComponent;
p1 : TOperation) of object;

_T67 = _T12;

_T68 = procedure (p0 : TComponent;
const p1 : string;
const p2 : string) of object;

_T69 = _T12;

_T70 = _T12;

_T71 = _T12;

_T72 = _T12;

_T73 = _T12;

_T74 = _T12;

_T75 = _T12;

_T76 = _T12;

_T77 = _T18;

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
function __TCMHintShow__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCMHintShow__Wrapper.setMsg(const val : Cardinal);
begin
TCMHintShow(GetRecordPtr^).Msg := val;
end;
function __TCMHintShow__Wrapper.getMsg : Cardinal;
begin
result := TCMHintShow(GetRecordPtr^).Msg;
end;
procedure __TCMHintShow__Wrapper.setReserved(const val : Integer);
begin
TCMHintShow(GetRecordPtr^).Reserved := val;
end;
function __TCMHintShow__Wrapper.getReserved : Integer;
begin
result := TCMHintShow(GetRecordPtr^).Reserved;
end;
procedure __TCMHintShow__Wrapper.setResult(const val : Integer);
begin
TCMHintShow(GetRecordPtr^).Result := val;
end;
function __TCMHintShow__Wrapper.getResult : Integer;
begin
result := TCMHintShow(GetRecordPtr^).Result;
end;
function __TCursorRec__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCursorRec__Wrapper.setIndex(const val : Integer);
begin
TCursorRec(GetRecordPtr^).Index := val;
end;
function __TCursorRec__Wrapper.getIndex : Integer;
begin
result := TCursorRec(GetRecordPtr^).Index;
end;
function __THintInfo__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __THintInfo__Wrapper.setHintControl(const val : TControl);
begin
THintInfo(GetRecordPtr^).HintControl := val;
end;
function __THintInfo__Wrapper.getHintControl : TControl;
begin
result := THintInfo(GetRecordPtr^).HintControl;
end;
procedure __THintInfo__Wrapper.setHintMaxWidth(const val : Integer);
begin
THintInfo(GetRecordPtr^).HintMaxWidth := val;
end;
function __THintInfo__Wrapper.getHintMaxWidth : Integer;
begin
result := THintInfo(GetRecordPtr^).HintMaxWidth;
end;
procedure __THintInfo__Wrapper.setHintColor(const val : TColor);
begin
THintInfo(GetRecordPtr^).HintColor := val;
end;
function __THintInfo__Wrapper.getHintColor : TColor;
begin
result := THintInfo(GetRecordPtr^).HintColor;
end;
procedure __THintInfo__Wrapper.setReshowTimeout(const val : Integer);
begin
THintInfo(GetRecordPtr^).ReshowTimeout := val;
end;
function __THintInfo__Wrapper.getReshowTimeout : Integer;
begin
result := THintInfo(GetRecordPtr^).ReshowTimeout;
end;
procedure __THintInfo__Wrapper.setHideTimeout(const val : Integer);
begin
THintInfo(GetRecordPtr^).HideTimeout := val;
end;
function __THintInfo__Wrapper.getHideTimeout : Integer;
begin
result := THintInfo(GetRecordPtr^).HideTimeout;
end;
procedure __THintInfo__Wrapper.setHintStr(const val : AnsiString);
begin
THintInfo(GetRecordPtr^).HintStr := val;
end;
function __THintInfo__Wrapper.getHintStr : AnsiString;
begin
result := THintInfo(GetRecordPtr^).HintStr;
end;
function _TCMHintShow_ : IDispatch;
begin
  result := __TCMHintShow__Wrapper.Create;
end;
function _TCursorRec_ : IDispatch;
begin
  result := __TCursorRec__Wrapper.Create;
end;
function _THintInfo_ : IDispatch;
begin
  result := __THintInfo__Wrapper.Create;
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
procedure __TApplication__HintMouseMessage__Wrapper(__Instance : TApplication;
p0 : TControl;
const p1 : IDispatch);
var
__p1 : ^TMessage;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
TApplication(__Instance).HintMouseMessage(p0,__p1^);
end;

function __TCustomForm__WantChildKey__Wrapper(__Instance : TCustomForm;
p0 : TControl;
const p1 : IDispatch): Boolean;
var
__p1 : ^TMessage;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
result := TCustomForm(__Instance).WantChildKey(p0,__p1^);
end;

function __TDesigner__IsDesignMsg__Wrapper(__Instance : TDesigner;
p0 : TControl;
const p1 : IDispatch): Boolean;
var
__p1 : ^TMessage;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
result := TDesigner(__Instance).IsDesignMsg(p0,__p1^);
end;


type __TCMHintShow__Wrapper__ = class(__TCMHintShow__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCMHintShow__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCMHintShowToVariant(var R : TCMHintShow) : OleVariant;
var
__rw : __TCMHintShow__Wrapper__;
begin
__rw := __TCMHintShow__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCMHintShow(const V : OleVariant) : TCMHintShow;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCMHintShow((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCursorRec__Wrapper__ = class(__TCursorRec__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCursorRec__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCursorRecToVariant(var R : TCursorRec) : OleVariant;
var
__rw : __TCursorRec__Wrapper__;
begin
__rw := __TCursorRec__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCursorRec(const V : OleVariant) : TCursorRec;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCursorRec((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __THintInfo__Wrapper__ = class(__THintInfo__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __THintInfo__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTHintInfoToVariant(var R : THintInfo) : OleVariant;
var
__rw : __THintInfo__Wrapper__;
begin
__rw := __THintInfo__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTHintInfo(const V : OleVariant) : THintInfo;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := THintInfo((_idisp as IDCRecordWrapper).GetRecordPtr^);
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
function __DC__GetTApplication__Active(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TApplication(Instance).Active;
end;

function __DC__GetTApplication__AllowTesting(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TApplication(Instance).AllowTesting;
end;

procedure __DC__SetTApplication__AllowTesting(Instance : TObject; Params : PVariantArgList);
begin
TApplication(Instance).AllowTesting:=OleVariant(Params^[0]);
end;

function __DC__GetTApplication__CurrentHelpFile(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TApplication(Instance).CurrentHelpFile;
end;

function __DC__GetTApplication__DialogHandle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TApplication(Instance).DialogHandle;
end;

procedure __DC__SetTApplication__DialogHandle(Instance : TObject; Params : PVariantArgList);
begin
TApplication(Instance).DialogHandle:=OleVariant(Params^[0]);
end;

function __DC__GetTApplication__ExeName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TApplication(Instance).ExeName;
end;

function __DC__GetTApplication__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TApplication(Instance).Handle;
end;

procedure __DC__SetTApplication__Handle(Instance : TObject; Params : PVariantArgList);
begin
TApplication(Instance).Handle:=OleVariant(Params^[0]);
end;

function __DC__GetTApplication__HelpFile(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TApplication(Instance).HelpFile;
end;

procedure __DC__SetTApplication__HelpFile(Instance : TObject; Params : PVariantArgList);
begin
TApplication(Instance).HelpFile:=OleVariant(Params^[0]);
end;

function __DC__GetTApplication__Hint(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TApplication(Instance).Hint;
end;

procedure __DC__SetTApplication__Hint(Instance : TObject; Params : PVariantArgList);
begin
TApplication(Instance).Hint:=OleVariant(Params^[0]);
end;

function __DC__GetTApplication__HintColor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TApplication(Instance).HintColor;
end;

procedure __DC__SetTApplication__HintColor(Instance : TObject; Params : PVariantArgList);
begin
TApplication(Instance).HintColor:=OleVariant(Params^[0]);
end;

function __DC__GetTApplication__HintPause(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TApplication(Instance).HintPause;
end;

procedure __DC__SetTApplication__HintPause(Instance : TObject; Params : PVariantArgList);
begin
TApplication(Instance).HintPause:=OleVariant(Params^[0]);
end;

function __DC__GetTApplication__HintShortPause(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TApplication(Instance).HintShortPause;
end;

procedure __DC__SetTApplication__HintShortPause(Instance : TObject; Params : PVariantArgList);
begin
TApplication(Instance).HintShortPause:=OleVariant(Params^[0]);
end;

function __DC__GetTApplication__HintHidePause(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TApplication(Instance).HintHidePause;
end;

procedure __DC__SetTApplication__HintHidePause(Instance : TObject; Params : PVariantArgList);
begin
TApplication(Instance).HintHidePause:=OleVariant(Params^[0]);
end;

function __DC__GetTApplication__Icon(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TApplication(Instance).Icon);
end;

procedure __DC__SetTApplication__Icon(Instance : TObject; Params : PVariantArgList);
begin
TApplication(Instance).Icon:=TIcon(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTApplication__MainForm(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TApplication(Instance).MainForm);
end;

function __DC__GetTApplication__ShowHint(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TApplication(Instance).ShowHint;
end;

procedure __DC__SetTApplication__ShowHint(Instance : TObject; Params : PVariantArgList);
begin
TApplication(Instance).ShowHint:=OleVariant(Params^[0]);
end;

function __DC__GetTApplication__ShowMainForm(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TApplication(Instance).ShowMainForm;
end;

procedure __DC__SetTApplication__ShowMainForm(Instance : TObject; Params : PVariantArgList);
begin
TApplication(Instance).ShowMainForm:=OleVariant(Params^[0]);
end;

function __DC__GetTApplication__Terminated(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TApplication(Instance).Terminated;
end;

function __DC__GetTApplication__Title(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TApplication(Instance).Title;
end;

procedure __DC__SetTApplication__Title(Instance : TObject; Params : PVariantArgList);
begin
TApplication(Instance).Title:=OleVariant(Params^[0]);
end;

function __DC__GetTApplication__UpdateFormatSettings(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TApplication(Instance).UpdateFormatSettings;
end;

procedure __DC__SetTApplication__UpdateFormatSettings(Instance : TObject; Params : PVariantArgList);
begin
TApplication(Instance).UpdateFormatSettings:=OleVariant(Params^[0]);
end;

function __DC__GetTApplication__UpdateMetricSettings(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TApplication(Instance).UpdateMetricSettings;
end;

procedure __DC__SetTApplication__UpdateMetricSettings(Instance : TObject; Params : PVariantArgList);
begin
TApplication(Instance).UpdateMetricSettings:=OleVariant(Params^[0]);
end;

function __DC__GetTControlScrollBar__Kind(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TControlScrollBar(Instance).Kind;
end;

function __DC__GetTControlScrollBar__ScrollPos(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TControlScrollBar(Instance).ScrollPos;
end;

function __DC__GetTCustomActiveForm__Visible(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomActiveForm(Instance).Visible;
end;

procedure __DC__SetTCustomActiveForm__Visible(Instance : TObject; Params : PVariantArgList);
begin
TCustomActiveForm(Instance).Visible:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomForm__Active(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomForm(Instance).Active;
end;

function __DC__GetTCustomForm__ActiveControl(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomForm(Instance).ActiveControl);
end;

procedure __DC__SetTCustomForm__ActiveControl(Instance : TObject; Params : PVariantArgList);
begin
TCustomForm(Instance).ActiveControl:=TWinControl(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomForm__ActiveOleControl(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomForm(Instance).ActiveOleControl);
end;

procedure __DC__SetTCustomForm__ActiveOleControl(Instance : TObject; Params : PVariantArgList);
begin
TCustomForm(Instance).ActiveOleControl:=TWinControl(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomForm__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomForm(Instance).Canvas);
end;

function __DC__GetTCustomForm__Caption(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomForm(Instance).Caption;
end;

procedure __DC__SetTCustomForm__Caption(Instance : TObject; Params : PVariantArgList);
begin
TCustomForm(Instance).Caption:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomForm__Color(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomForm(Instance).Color;
end;

procedure __DC__SetTCustomForm__Color(Instance : TObject; Params : PVariantArgList);
begin
TCustomForm(Instance).Color:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomForm__Designer(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomForm(Instance).Designer);
end;

procedure __DC__SetTCustomForm__Designer(Instance : TObject; Params : PVariantArgList);
begin
TCustomForm(Instance).Designer:=TDesigner(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomForm__DropTarget(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomForm(Instance).DropTarget;
end;

procedure __DC__SetTCustomForm__DropTarget(Instance : TObject; Params : PVariantArgList);
begin
TCustomForm(Instance).DropTarget:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomForm__Font(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomForm(Instance).Font);
end;

procedure __DC__SetTCustomForm__Font(Instance : TObject; Params : PVariantArgList);
begin
TCustomForm(Instance).Font:=TFont(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomForm__HelpFile(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomForm(Instance).HelpFile;
end;

procedure __DC__SetTCustomForm__HelpFile(Instance : TObject; Params : PVariantArgList);
begin
TCustomForm(Instance).HelpFile:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomForm__KeyPreview(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomForm(Instance).KeyPreview;
end;

procedure __DC__SetTCustomForm__KeyPreview(Instance : TObject; Params : PVariantArgList);
begin
TCustomForm(Instance).KeyPreview:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomForm__Menu(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomForm(Instance).Menu);
end;

procedure __DC__SetTCustomForm__Menu(Instance : TObject; Params : PVariantArgList);
begin
TCustomForm(Instance).Menu:=TMainMenu(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomForm__ModalResult(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomForm(Instance).ModalResult;
end;

procedure __DC__SetTCustomForm__ModalResult(Instance : TObject; Params : PVariantArgList);
begin
TCustomForm(Instance).ModalResult:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomForm__WindowState(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomForm(Instance).WindowState;
end;

procedure __DC__SetTCustomForm__WindowState(Instance : TObject; Params : PVariantArgList);
begin
TCustomForm(Instance).WindowState:=OleVariant(Params^[0]);
end;

function __DC__GetTDataModule__DesignOffset(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TPoint__Wrapper;
begin
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := TDataModule(Instance).DesignOffset;
result := IUnknown(__wrapper) as IDispatch;
end;

procedure __DC__SetTDataModule__DesignOffset(Instance : TObject; Params : PVariantArgList);
var
__idisp:IDispatch;
__iwrapper:IDCRecordWrapper;
begin
__idisp:=DCVarToInterface(OleVariant(Params^[0]));
if __idisp=nil then exit;
__idisp.QueryInterface(IDCRecordWrapper, __iwrapper);
TDataModule(Instance).DesignOffset:=TPoint(__iwrapper.GetRecordPtr^);
end;

function __DC__GetTDataModule__DesignSize(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TPoint__Wrapper;
begin
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := TDataModule(Instance).DesignSize;
result := IUnknown(__wrapper) as IDispatch;
end;

procedure __DC__SetTDataModule__DesignSize(Instance : TObject; Params : PVariantArgList);
var
__idisp:IDispatch;
__iwrapper:IDCRecordWrapper;
begin
__idisp:=DCVarToInterface(OleVariant(Params^[0]));
if __idisp=nil then exit;
__idisp.QueryInterface(IDCRecordWrapper, __iwrapper);
TDataModule(Instance).DesignSize:=TPoint(__iwrapper.GetRecordPtr^);
end;

function __DC__GetTDesigner__IsControl(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDesigner(Instance).IsControl;
end;

procedure __DC__SetTDesigner__IsControl(Instance : TObject; Params : PVariantArgList);
begin
TDesigner(Instance).IsControl:=OleVariant(Params^[0]);
end;

function __DC__GetTDesigner__Form(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDesigner(Instance).Form);
end;

procedure __DC__SetTDesigner__Form(Instance : TObject; Params : PVariantArgList);
begin
TDesigner(Instance).Form:=TCustomForm(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTForm__ActiveMDIChild(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TForm(Instance).ActiveMDIChild);
end;

function __DC__GetTForm__ClientHandle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TForm(Instance).ClientHandle;
end;

function __DC__GetTForm__MDIChildCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TForm(Instance).MDIChildCount;
end;

function __DC__GetTForm__MDIChildren(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TForm(Instance).MDIChildren[OleVariant(Params^[0])]);
end;

function __DC__GetTForm__TileMode(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TForm(Instance).TileMode;
end;

procedure __DC__SetTForm__TileMode(Instance : TObject; Params : PVariantArgList);
begin
TForm(Instance).TileMode:=OleVariant(Params^[0]);
end;

function __DC__GetTScreen__ActiveControl(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TScreen(Instance).ActiveControl);
end;

function __DC__GetTScreen__ActiveCustomForm(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TScreen(Instance).ActiveCustomForm);
end;

function __DC__GetTScreen__ActiveForm(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TScreen(Instance).ActiveForm);
end;

function __DC__GetTScreen__CustomFormCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TScreen(Instance).CustomFormCount;
end;

function __DC__GetTScreen__CustomForms(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TScreen(Instance).CustomForms[OleVariant(Params^[0])]);
end;

function __DC__GetTScreen__Cursor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TScreen(Instance).Cursor;
end;

procedure __DC__SetTScreen__Cursor(Instance : TObject; Params : PVariantArgList);
begin
TScreen(Instance).Cursor:=OleVariant(Params^[0]);
end;

function __DC__GetTScreen__Cursors(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TScreen(Instance).Cursors[OleVariant(Params^[0])];
end;

procedure __DC__SetTScreen__Cursors(Instance : TObject; Params : PVariantArgList);
begin
TScreen(Instance).Cursors[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTScreen__DataModules(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TScreen(Instance).DataModules[OleVariant(Params^[0])]);
end;

function __DC__GetTScreen__DataModuleCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TScreen(Instance).DataModuleCount;
end;

function __DC__GetTScreen__IconFont(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TScreen(Instance).IconFont);
end;

procedure __DC__SetTScreen__IconFont(Instance : TObject; Params : PVariantArgList);
begin
TScreen(Instance).IconFont:=TFont(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTScreen__Fonts(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TScreen(Instance).Fonts);
end;

function __DC__GetTScreen__FormCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TScreen(Instance).FormCount;
end;

function __DC__GetTScreen__Forms(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TScreen(Instance).Forms[OleVariant(Params^[0])]);
end;

function __DC__GetTScreen__Imes(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TScreen(Instance).Imes);
end;

function __DC__GetTScreen__DefaultIme(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TScreen(Instance).DefaultIme;
end;

function __DC__GetTScreen__DefaultKbLayout(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TScreen(Instance).DefaultKbLayout;
end;

function __DC__GetTScreen__Height(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TScreen(Instance).Height;
end;

function __DC__GetTScreen__PixelsPerInch(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TScreen(Instance).PixelsPerInch;
end;

function __DC__GetTScreen__Width(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TScreen(Instance).Width;
end;

procedure __RegisterProps;
begin
RegisterProperty(TApplication,'Active',__DC__GetTApplication__Active,nil);
RegisterProperty(TApplication,'AllowTesting',__DC__GetTApplication__AllowTesting,__DC__SetTApplication__AllowTesting);
RegisterProperty(TApplication,'CurrentHelpFile',__DC__GetTApplication__CurrentHelpFile,nil);
RegisterProperty(TApplication,'DialogHandle',__DC__GetTApplication__DialogHandle,__DC__SetTApplication__DialogHandle);
RegisterProperty(TApplication,'ExeName',__DC__GetTApplication__ExeName,nil);
RegisterProperty(TApplication,'Handle',__DC__GetTApplication__Handle,__DC__SetTApplication__Handle);
RegisterProperty(TApplication,'HelpFile',__DC__GetTApplication__HelpFile,__DC__SetTApplication__HelpFile);
RegisterProperty(TApplication,'Hint',__DC__GetTApplication__Hint,__DC__SetTApplication__Hint);
RegisterProperty(TApplication,'HintColor',__DC__GetTApplication__HintColor,__DC__SetTApplication__HintColor);
RegisterProperty(TApplication,'HintPause',__DC__GetTApplication__HintPause,__DC__SetTApplication__HintPause);
RegisterProperty(TApplication,'HintShortPause',__DC__GetTApplication__HintShortPause,__DC__SetTApplication__HintShortPause);
RegisterProperty(TApplication,'HintHidePause',__DC__GetTApplication__HintHidePause,__DC__SetTApplication__HintHidePause);
RegisterProperty(TApplication,'Icon',__DC__GetTApplication__Icon,__DC__SetTApplication__Icon);
RegisterProperty(TApplication,'MainForm',__DC__GetTApplication__MainForm,nil);
RegisterProperty(TApplication,'ShowHint',__DC__GetTApplication__ShowHint,__DC__SetTApplication__ShowHint);
RegisterProperty(TApplication,'ShowMainForm',__DC__GetTApplication__ShowMainForm,__DC__SetTApplication__ShowMainForm);
RegisterProperty(TApplication,'Terminated',__DC__GetTApplication__Terminated,nil);
RegisterProperty(TApplication,'Title',__DC__GetTApplication__Title,__DC__SetTApplication__Title);
RegisterProperty(TApplication,'UpdateFormatSettings',__DC__GetTApplication__UpdateFormatSettings,__DC__SetTApplication__UpdateFormatSettings);
RegisterProperty(TApplication,'UpdateMetricSettings',__DC__GetTApplication__UpdateMetricSettings,__DC__SetTApplication__UpdateMetricSettings);
RegisterProperty(TControlScrollBar,'Kind',__DC__GetTControlScrollBar__Kind,nil);
RegisterProperty(TControlScrollBar,'ScrollPos',__DC__GetTControlScrollBar__ScrollPos,nil);
RegisterProperty(TCustomActiveForm,'Visible',__DC__GetTCustomActiveForm__Visible,__DC__SetTCustomActiveForm__Visible);
RegisterProperty(TCustomForm,'Active',__DC__GetTCustomForm__Active,nil);
RegisterProperty(TCustomForm,'ActiveControl',__DC__GetTCustomForm__ActiveControl,__DC__SetTCustomForm__ActiveControl);
RegisterProperty(TCustomForm,'ActiveOleControl',__DC__GetTCustomForm__ActiveOleControl,__DC__SetTCustomForm__ActiveOleControl);
RegisterProperty(TCustomForm,'Canvas',__DC__GetTCustomForm__Canvas,nil);
RegisterProperty(TCustomForm,'Caption',__DC__GetTCustomForm__Caption,__DC__SetTCustomForm__Caption);
RegisterProperty(TCustomForm,'Color',__DC__GetTCustomForm__Color,__DC__SetTCustomForm__Color);
RegisterProperty(TCustomForm,'Designer',__DC__GetTCustomForm__Designer,__DC__SetTCustomForm__Designer);
RegisterProperty(TCustomForm,'DropTarget',__DC__GetTCustomForm__DropTarget,__DC__SetTCustomForm__DropTarget);
RegisterProperty(TCustomForm,'Font',__DC__GetTCustomForm__Font,__DC__SetTCustomForm__Font);
RegisterProperty(TCustomForm,'HelpFile',__DC__GetTCustomForm__HelpFile,__DC__SetTCustomForm__HelpFile);
RegisterProperty(TCustomForm,'KeyPreview',__DC__GetTCustomForm__KeyPreview,__DC__SetTCustomForm__KeyPreview);
RegisterProperty(TCustomForm,'Menu',__DC__GetTCustomForm__Menu,__DC__SetTCustomForm__Menu);
RegisterProperty(TCustomForm,'ModalResult',__DC__GetTCustomForm__ModalResult,__DC__SetTCustomForm__ModalResult);
RegisterProperty(TCustomForm,'WindowState',__DC__GetTCustomForm__WindowState,__DC__SetTCustomForm__WindowState);
RegisterProperty(TDataModule,'DesignOffset',__DC__GetTDataModule__DesignOffset,__DC__SetTDataModule__DesignOffset);
RegisterProperty(TDataModule,'DesignSize',__DC__GetTDataModule__DesignSize,__DC__SetTDataModule__DesignSize);
RegisterProperty(TDesigner,'IsControl',__DC__GetTDesigner__IsControl,__DC__SetTDesigner__IsControl);
RegisterProperty(TDesigner,'Form',__DC__GetTDesigner__Form,__DC__SetTDesigner__Form);
RegisterProperty(TForm,'ActiveMDIChild',__DC__GetTForm__ActiveMDIChild,nil);
RegisterProperty(TForm,'ClientHandle',__DC__GetTForm__ClientHandle,nil);
RegisterProperty(TForm,'MDIChildCount',__DC__GetTForm__MDIChildCount,nil);
RegisterIndexedProperty(TForm,'MDIChildren',1,False,__DC__GetTForm__MDIChildren,nil);
RegisterProperty(TForm,'TileMode',__DC__GetTForm__TileMode,__DC__SetTForm__TileMode);
RegisterProperty(TScreen,'ActiveControl',__DC__GetTScreen__ActiveControl,nil);
RegisterProperty(TScreen,'ActiveCustomForm',__DC__GetTScreen__ActiveCustomForm,nil);
RegisterProperty(TScreen,'ActiveForm',__DC__GetTScreen__ActiveForm,nil);
RegisterProperty(TScreen,'CustomFormCount',__DC__GetTScreen__CustomFormCount,nil);
RegisterIndexedProperty(TScreen,'CustomForms',1,False,__DC__GetTScreen__CustomForms,nil);
RegisterProperty(TScreen,'Cursor',__DC__GetTScreen__Cursor,__DC__SetTScreen__Cursor);
RegisterIndexedProperty(TScreen,'Cursors',1,False,__DC__GetTScreen__Cursors,__DC__SetTScreen__Cursors);
RegisterIndexedProperty(TScreen,'DataModules',1,False,__DC__GetTScreen__DataModules,nil);
RegisterProperty(TScreen,'DataModuleCount',__DC__GetTScreen__DataModuleCount,nil);
RegisterProperty(TScreen,'IconFont',__DC__GetTScreen__IconFont,__DC__SetTScreen__IconFont);
RegisterProperty(TScreen,'Fonts',__DC__GetTScreen__Fonts,nil);
RegisterProperty(TScreen,'FormCount',__DC__GetTScreen__FormCount,nil);
RegisterIndexedProperty(TScreen,'Forms',1,False,__DC__GetTScreen__Forms,nil);
RegisterProperty(TScreen,'Imes',__DC__GetTScreen__Imes,nil);
RegisterProperty(TScreen,'DefaultIme',__DC__GetTScreen__DefaultIme,nil);
RegisterProperty(TScreen,'DefaultKbLayout',__DC__GetTScreen__DefaultKbLayout,nil);
RegisterProperty(TScreen,'Height',__DC__GetTScreen__Height,nil);
RegisterProperty(TScreen,'PixelsPerInch',__DC__GetTScreen__PixelsPerInch,nil);
RegisterProperty(TScreen,'Width',__DC__GetTScreen__Width,nil);
end;

function __DC__GetForms__Application(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(Forms.Application);
end;

procedure __DC__SetForms__Application(Instance : TObject; Params : PVariantArgList);
begin
TObject(Forms.Application):=(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetForms__Screen(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(Forms.Screen);
end;

procedure __DC__SetForms__Screen(Instance : TObject; Params : PVariantArgList);
begin
TObject(Forms.Screen):=(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetForms__Ctl3DBtnWndProc(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(Forms.Ctl3DBtnWndProc);
end;

procedure __DC__SetForms__Ctl3DBtnWndProc(Instance : TObject; Params : PVariantArgList);
begin
Forms.Ctl3DBtnWndProc:=VarToPointer(OleVariant(Params^[0]));
end;

var __RegisteredVars : TList;
procedure __RegisterVars;
begin
__RegisteredVars := TList.Create;
__RegisteredVars.Add(RegisterVar('Application',__DC__GetForms__Application,__DC__SetForms__Application));
__RegisteredVars.Add(RegisterVar('Screen',__DC__GetForms__Screen,__DC__SetForms__Screen));
__RegisteredVars.Add(RegisterVar('Ctl3DBtnWndProc',__DC__GetForms__Ctl3DBtnWndProc,__DC__SetForms__Ctl3DBtnWndProc));
end;

procedure __UnregisterVars;
begin
__RegisteredVars.Free;
end;

const __ConstNames0 : array[0..47] of string = (
'sbHorizontal'
,'sbVertical'
,'bsNone'
,'bsSingle'
,'bsSizeable'
,'bsDialog'
,'bsToolWindow'
,'bsSizeToolWin'
,'wsNormal'
,'wsMinimized'
,'wsMaximized'
,'fsNormal'
,'fsMDIChild'
,'fsMDIForm'
,'fsStayOnTop'
,'biSystemMenu'
,'biMinimize'
,'biMaximize'
,'biHelp'
,'poDesigned'
,'poDefault'
,'poDefaultPosOnly'
,'poDefaultSizeOnly'
,'poScreenCenter'
,'poNone'
,'poProportional'
,'poPrintToFit'
,'saIgnore'
,'saRestore'
,'saMinimize'
,'saMaximize'
,'tbHorizontal'
,'tbVertical'
,'caNone'
,'caHide'
,'caFree'
,'caMinimize'
,'fsCreating'
,'fsVisible'
,'fsShowing'
,'fsModal'
,'fsCreatedMDIChild'
,'afbNone'
,'afbSingle'
,'afbSunken'
,'afbRaised'
,'tmShow'
,'tmHide'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,sbHorizontal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,sbVertical));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,bsNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,bsSingle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,bsSizeable));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,bsDialog));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,bsToolWindow));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,bsSizeToolWin));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,wsNormal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,wsMinimized));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,wsMaximized));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,fsNormal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,fsMDIChild));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,fsMDIForm));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,fsStayOnTop));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,biSystemMenu));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,biMinimize));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,biMaximize));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,biHelp));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,poDesigned));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,poDefault));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,poDefaultPosOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,poDefaultSizeOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,poScreenCenter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,poNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,poProportional));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,poPrintToFit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,saIgnore));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,saRestore));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,saMinimize));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,saMaximize));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,tbHorizontal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,tbVertical));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,caNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,caHide));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,caFree));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,caMinimize));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,fsCreating));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,fsVisible));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,fsShowing));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,fsModal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,fsCreatedMDIChild));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,afbNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,afbSingle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,afbSunken));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,afbRaised));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,tmShow));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,tmHide));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..9] of TClass = (
TApplication,
TControlScrollBar,
TCustomActiveForm,
TCustomForm,
TDataModule,
TDesigner,
TForm,
TScreen,
TScrollBox,
TScrollingWinControl
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..17] of string = (
'TCMHintShow'
,'TCursorRec'
,'THintInfo'
,'GetParentForm'
,'ValidParentForm'
,'DisableTaskWindows'
,'EnableTaskWindows'
,'FreeObjectInstance'
,'IsAccel'
,'Subclass3DWnd'
,'Subclass3DDlg'
,'SetAutoSubClass'
,'DeallocateHWnd'
,'DoneCtl3D'
,'InitCtl3D'
,'KeysToShiftState'
,'KeyDataToShiftState'
,'ForegroundTask'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TCMHintShow_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(_TCursorRec_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[2],Addr(_THintInfo_)));
RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T0),[
TypeInfo(TControl),TypeInfo(TCustomForm)],Addr(GetParentForm),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T1),[
TypeInfo(TControl),TypeInfo(TCustomForm)],Addr(ValidParentForm),cRegister);

RegisterProc(nil,MethodNames[5],mtProc,TypeInfo(_T2),[
TypeInfo(HWND),TypeInfoPointer],Addr(DisableTaskWindows),cRegister);

RegisterProc(nil,MethodNames[6],mtProc,TypeInfo(_T3),[
TypeInfoPointer],Addr(EnableTaskWindows),cRegister);

RegisterProc(nil,MethodNames[7],mtProc,TypeInfo(_T5),[
TypeInfoPointer],Addr(FreeObjectInstance),cRegister);

RegisterProc(nil,MethodNames[8],mtProc,TypeInfo(_T6),[
TypeInfo(Word),
TypeInfo(string),TypeInfo(Boolean)],Addr(IsAccel),cRegister);

RegisterProc(nil,MethodNames[9],mtProc,TypeInfo(_T7),[
TypeInfo(HWND),TypeInfo(Boolean)],Addr(Subclass3DWnd),cRegister);

RegisterProc(nil,MethodNames[10],mtProc,TypeInfo(_T8),[
TypeInfo(HWND),
TypeInfo(Word)],Addr(Subclass3DDlg),cRegister);

RegisterProc(nil,MethodNames[11],mtProc,TypeInfo(_T9),[
TypeInfo(Boolean)],Addr(SetAutoSubClass),cRegister);

RegisterProc(nil,MethodNames[12],mtProc,TypeInfo(_T11),[
TypeInfo(HWND)],Addr(DeallocateHWnd),cRegister);

RegisterProc(nil,MethodNames[13],mtProc,TypeInfo(_T12),NoParams,Addr(DoneCtl3D),cRegister);

RegisterProc(nil,MethodNames[14],mtProc,TypeInfo(_T13),NoParams,Addr(InitCtl3D),cRegister);

RegisterProc(nil,MethodNames[15],mtProc,TypeInfo(_T14),[
TypeInfo(Word),TypeInfo(TShiftState)],Addr(KeysToShiftState),cRegister);

RegisterProc(nil,MethodNames[16],mtProc,TypeInfo(_T15),[
TypeInfo(Longint),TypeInfo(TShiftState)],Addr(KeyDataToShiftState),cRegister);

RegisterProc(nil,MethodNames[17],mtProc,TypeInfo(_T16),[TypeInfo(Boolean)],Addr(ForegroundTask),cRegister);

RegRegisterMethod(TApplication,'BringToFront',TypeInfo(_T17),NoParams,Addr(TApplication.BringToFront));

RegRegisterMethod(TApplication,'ControlDestroyed',TypeInfo(_T18),[
TypeInfo(TControl)],Addr(TApplication.ControlDestroyed));

RegRegisterMethod(TApplication,'CancelHint',TypeInfo(_T19),NoParams,Addr(TApplication.CancelHint));

RegRegisterMethod(TApplication,'CreateHandle',TypeInfo(_T21),NoParams,Addr(TApplication.CreateHandle));

RegRegisterMethod(TApplication,'HandleException',TypeInfo(_T22),[
TypeInfo(TObject)],Addr(TApplication.HandleException));

RegRegisterMethod(TApplication,'HandleMessage',TypeInfo(_T23),NoParams,Addr(TApplication.HandleMessage));

RegRegisterMethod(TApplication,'HelpCommand',TypeInfo(_T24),[
TypeInfo(Integer),
TypeInfo(Longint),TypeInfo(Boolean)],Addr(TApplication.HelpCommand));

RegRegisterMethod(TApplication,'HelpContext',TypeInfo(_T25),[
TypeInfo(THelpContext),TypeInfo(Boolean)],Addr(TApplication.HelpContext));

RegRegisterMethod(TApplication,'HelpJump',TypeInfo(_T26),[
TypeInfo(string),TypeInfo(Boolean)],Addr(TApplication.HelpJump));

RegRegisterMethod(TApplication,'HideHint',TypeInfo(_T27),NoParams,Addr(TApplication.HideHint));

RegRegisterMethod(TApplication,'HintMouseMessage',TypeInfo(_T28),[
TypeInfo(TControl),
TypeInfo(IDispatch)],Addr(__TApplication__HintMouseMessage__Wrapper));

RegRegisterMethod(TApplication,'Initialize',TypeInfo(_T30),NoParams,Addr(TApplication.Initialize));

RegRegisterMethod(TApplication,'Minimize',TypeInfo(_T32),NoParams,Addr(TApplication.Minimize));

RegRegisterMethod(TApplication,'NormalizeAllTopMosts',TypeInfo(_T33),NoParams,Addr(TApplication.NormalizeAllTopMosts));

RegRegisterMethod(TApplication,'NormalizeTopMosts',TypeInfo(_T34),NoParams,Addr(TApplication.NormalizeTopMosts));

RegRegisterMethod(TApplication,'ProcessMessages',TypeInfo(_T35),NoParams,Addr(TApplication.ProcessMessages));

RegRegisterMethod(TApplication,'Restore',TypeInfo(_T36),NoParams,Addr(TApplication.Restore));

RegRegisterMethod(TApplication,'RestoreTopMosts',TypeInfo(_T37),NoParams,Addr(TApplication.RestoreTopMosts));

RegRegisterMethod(TApplication,'Run',TypeInfo(_T38),NoParams,Addr(TApplication.Run));

RegRegisterMethod(TApplication,'ShowException',TypeInfo(_T39),[
TypeInfo(Exception)],Addr(TApplication.ShowException));

RegRegisterMethod(TApplication,'Terminate',TypeInfo(_T40),NoParams,Addr(TApplication.Terminate));

RegRegisterMethod(TCustomForm,'Activate',TypeInfo(_T42),NoParams, pointer(MinVMTOffset - 36));

RegRegisterMethod(TCustomForm,'ActiveChanged',TypeInfo(_T43),NoParams, pointer(MinVMTOffset - 37));

RegRegisterMethod(TCustomForm,'Deactivate',TypeInfo(_T44),NoParams, pointer(MinVMTOffset - 38));

RegRegisterMethod(TCustomForm,'DoHide',TypeInfo(_T45),NoParams, pointer(MinVMTOffset - 39));

RegRegisterMethod(TCustomForm,'DoShow',TypeInfo(_T46),NoParams, pointer(MinVMTOffset - 40));

RegRegisterMethod(TCustomForm,'Paint',TypeInfo(_T47),NoParams, pointer(MinVMTOffset - 41));

RegRegisterMethod(TCustomForm,'Resize',TypeInfo(_T48),NoParams, pointer(MinVMTOffset - 42));

RegisterProc(TCustomForm,'CreateNew',mtConstructor,TypeInfo(_T49),[
TypeInfo(TComponent),
TypeInfo(Integer)],Addr(TCustomForm.CreateNew),cRegister);

RegRegisterMethod(TCustomForm,'Close',TypeInfo(_T50),NoParams,Addr(TCustomForm.Close));

RegRegisterMethod(TCustomForm,'CloseQuery',TypeInfo(_T51),[TypeInfo(Boolean)],Addr(TCustomForm.CloseQuery));

RegRegisterMethod(TCustomForm,'DefocusControl',TypeInfo(_T52),[
TypeInfo(TWinControl),
TypeInfo(Boolean)],Addr(TCustomForm.DefocusControl));

RegRegisterMethod(TCustomForm,'FocusControl',TypeInfo(_T53),[
TypeInfo(TWinControl)],Addr(TCustomForm.FocusControl));

RegRegisterMethod(TCustomForm,'GetFormImage',TypeInfo(_T54),[TypeInfo(TBitmap)],Addr(TCustomForm.GetFormImage));

RegRegisterMethod(TCustomForm,'Hide',TypeInfo(_T55),NoParams,Addr(TCustomForm.Hide));

RegRegisterMethod(TCustomForm,'Print',TypeInfo(_T56),NoParams,Addr(TCustomForm.Print));

RegRegisterMethod(TCustomForm,'Release',TypeInfo(_T57),NoParams,Addr(TCustomForm.Release));

RegRegisterMethod(TCustomForm,'SendCancelMode',TypeInfo(_T58),[
TypeInfo(TControl)],Addr(TCustomForm.SendCancelMode));

RegRegisterMethod(TCustomForm,'SetFocusedControl',TypeInfo(_T59),[
TypeInfo(TWinControl),TypeInfo(Boolean)],Addr(TCustomForm.SetFocusedControl));

RegRegisterMethod(TCustomForm,'Show',TypeInfo(_T60),NoParams,Addr(TCustomForm.Show));

RegRegisterMethod(TCustomForm,'ShowModal',TypeInfo(_T61),[TypeInfo(Integer)],Addr(TCustomForm.ShowModal));

RegRegisterMethod(TCustomForm,'WantChildKey',TypeInfo(_T62),[
TypeInfo(TControl),
TypeInfo(IDispatch),TypeInfo(Boolean)], pointer(128));

RegisterProc(TDataModule,'CreateNew',mtConstructor,TypeInfo(_T63),[
TypeInfo(TComponent),
TypeInfo(Integer)],Addr(TDataModule.CreateNew),cRegister);

RegRegisterMethod(TDesigner,'IsDesignMsg',TypeInfo(_T64),[
TypeInfo(TControl),
TypeInfo(IDispatch),TypeInfo(Boolean)], pointer(0));

RegRegisterMethod(TDesigner,'Modified',TypeInfo(_T65),NoParams, pointer(4));

RegRegisterMethod(TDesigner,'Notification',TypeInfo(_T66),[
TypeInfo(TComponent),
TypeInfo(TOperation)], pointer(8));

RegRegisterMethod(TDesigner,'PaintGrid',TypeInfo(_T67),NoParams, pointer(12));

RegRegisterMethod(TDesigner,'ValidateRename',TypeInfo(_T68),[
TypeInfo(TComponent),
TypeInfo(string),
TypeInfo(string)], pointer(16));

RegRegisterMethod(TForm,'ArrangeIcons',TypeInfo(_T69),NoParams,Addr(TForm.ArrangeIcons));

RegRegisterMethod(TForm,'Cascade',TypeInfo(_T70),NoParams,Addr(TForm.Cascade));

RegRegisterMethod(TForm,'Next',TypeInfo(_T71),NoParams,Addr(TForm.Next));

RegRegisterMethod(TForm,'Previous',TypeInfo(_T72),NoParams,Addr(TForm.Previous));

RegRegisterMethod(TForm,'Tile',TypeInfo(_T73),NoParams,Addr(TForm.Tile));

RegRegisterMethod(TScrollBox,'Resize',TypeInfo(_T74),NoParams, pointer(MinVMTOffset - 36));

RegRegisterMethod(TScrollingWinControl,'DisableAutoRange',TypeInfo(_T75),NoParams,Addr(TScrollingWinControl.DisableAutoRange));

RegRegisterMethod(TScrollingWinControl,'EnableAutoRange',TypeInfo(_T76),NoParams,Addr(TScrollingWinControl.EnableAutoRange));

RegRegisterMethod(TScrollingWinControl,'ScrollInView',TypeInfo(_T77),[
TypeInfo(TControl)],Addr(TScrollingWinControl.ScrollInView));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'MakeObjectInstance',mtProc,TypeInfo(_T4),[
TypeInfo(TWndMethod),TypeInfoPointer],Addr(MakeObjectInstance),cRegister)}

{RegisterProc(nil,'AllocateHWnd',mtProc,TypeInfo(_T10),[
TypeInfo(TWndMethod),TypeInfo(HWND)],Addr(AllocateHWnd),cRegister)}

{RegRegisterMethod(TApplication,'CreateForm',TypeInfo(_T20),[
TypeInfo(TComponentClass),
TypeInfoUntyped],Addr(TApplication.CreateForm))}

{RegRegisterMethod(TApplication,'HookMainWindow',TypeInfo(_T29),[
TypeInfo(TWindowHook)],Addr(TApplication.HookMainWindow))}

{RegRegisterMethod(TApplication,'MessageBox',TypeInfo(_T31),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(Longint),TypeInfo(Integer)],Addr(TApplication.MessageBox))}

{RegRegisterMethod(TApplication,'UnhookMainWindow',TypeInfo(_T41),[
TypeInfo(TWindowHook)],Addr(TApplication.UnhookMainWindow))}

RegisterEvent(TypeInfo(TCloseEvent),[
TypeInfo(TObject),
TypeInfo(TCloseAction)]);

RegisterEvent(TypeInfo(TCloseQueryEvent),[
TypeInfo(TObject),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TExceptionEvent),[
TypeInfo(TObject),
TypeInfo(Exception)]);

RegisterEvent(TypeInfo(TIdleEvent),[
TypeInfo(TObject),
TypeInfo(Boolean)]);

{RegisterEvent(TypeInfo(TMessageEvent),[
TypeInfo(IDispatch),
TypeInfo(Boolean)]);}

{RegisterEvent(TypeInfo(TShowHintEvent),[
TypeInfo(string),
TypeInfo(Boolean),
TypeInfo(IDispatch)]);}

{RegisterEvent(TypeInfo(TWindowHook),[
TypeInfo(IDispatch),TypeInfo(Boolean)]);}

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;
__RegisterVars;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnRegisterVars;
__UnregisterProcs;
end.
