{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit CLIPBRD_D6;
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
  Windows,
  Messages,
  Classes,
  Graphics,
  Clipbrd;
function ConvertTMessageToVariant(var R : TMessage) : OleVariant;
function ConvertVariantToTMessage(const V : OleVariant) : TMessage;
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
type __TClipboard__ = class(TClipboard);
type
_T0 = function : TClipboard of object;

_T1 = function (p0 : TClipboard): TClipboard of object;

_T2 = procedure (const p0 : IDispatch) of object;

_T3 = procedure  of object;

_T4 = _T3;

_T5 = function (p0 : TComponent;
p1 : TComponent): TComponent of object;

_T6 = function (p0 : Word): THandle of object;

{_T7 = function (p0 : PChar;
p1 : Integer): Integer of object;}

_T8 = function (p0 : Word): Boolean of object;

_T9 = _T3;

_T10 = procedure (p0 : TComponent) of object;

_T11 = procedure (p0 : Word;
p1 : THandle) of object;

{_T12 = procedure (p0 : PChar) of object;}

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
procedure __TClipboard__WndProc__Wrapper(__Instance : TClipboard;
const p0 : IDispatch);
var
__p0 : ^TMessage;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
__TClipboard__(__Instance).WndProc(__p0^);
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
function __DC__GetTClipboard__AsText(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TClipboard(Instance).AsText;
end;

procedure __DC__SetTClipboard__AsText(Instance : TObject; Params : PVariantArgList);
begin
TClipboard(Instance).AsText:=OleVariant(Params^[0]);
end;

function __DC__GetTClipboard__FormatCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TClipboard(Instance).FormatCount;
end;

function __DC__GetTClipboard__Formats(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TClipboard(Instance).Formats[OleVariant(Params^[0])];
end;

procedure __RegisterProps;
begin
RegisterProperty(TClipboard,'AsText',__DC__GetTClipboard__AsText,__DC__SetTClipboard__AsText);
RegisterProperty(TClipboard,'FormatCount',__DC__GetTClipboard__FormatCount,nil);
RegisterIndexedProperty(TClipboard,'Formats',1,False,__DC__GetTClipboard__Formats,nil);
end;

function __DC__GetClipbrd__CF_PICTURE(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := Clipbrd.CF_PICTURE;
end;

procedure __DC__SetClipbrd__CF_PICTURE(Instance : TObject; Params : PVariantArgList);
begin
Clipbrd.CF_PICTURE:=OleVariant(Params^[0]);
end;

function __DC__GetClipbrd__CF_COMPONENT(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := Clipbrd.CF_COMPONENT;
end;

procedure __DC__SetClipbrd__CF_COMPONENT(Instance : TObject; Params : PVariantArgList);
begin
Clipbrd.CF_COMPONENT:=OleVariant(Params^[0]);
end;

var __RegisteredVars : TList;
procedure __RegisterVars;
begin
__RegisteredVars := TList.Create;
__RegisteredVars.Add(RegisterVar('CF_PICTURE',__DC__GetClipbrd__CF_PICTURE,__DC__SetClipbrd__CF_PICTURE));
__RegisteredVars.Add(RegisterVar('CF_COMPONENT',__DC__GetClipbrd__CF_COMPONENT,__DC__SetClipbrd__CF_COMPONENT));
end;

procedure __UnregisterVars;
begin
__RegisteredVars.Free;
end;

procedure __RegisterConsts0;
begin
end;

procedure __UnregisterConsts0;
begin
end;

const ClassList : array[0..0] of TClass = (
TClipboard
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..1] of string = (
'Clipboard'
,'SetClipboard'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T0),[TypeInfo(TClipboard)],Addr(Clipboard),cRegister);

RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T1),[
TypeInfo(TClipboard),TypeInfo(TClipboard)],Addr(SetClipboard),cRegister);

RegRegisterMethod(TClipboard,'WndProc',TypeInfo(_T2),[
TypeInfo(IDispatch)], pointer(12));

RegRegisterMethod(TClipboard,'Clear',TypeInfo(_T3),NoParams, pointer(16));

RegRegisterMethod(TClipboard,'Close',TypeInfo(_T4),NoParams, pointer(20));

RegRegisterMethod(TClipboard,'GetComponent',TypeInfo(_T5),[
TypeInfo(TComponent),
TypeInfo(TComponent),TypeInfo(TComponent)],Addr(TClipboard.GetComponent));

RegRegisterMethod(TClipboard,'GetAsHandle',TypeInfo(_T6),[
TypeInfo(Word),TypeInfo(THandle)],Addr(TClipboard.GetAsHandle));

RegRegisterMethod(TClipboard,'HasFormat',TypeInfo(_T8),[
TypeInfo(Word),TypeInfo(Boolean)],Addr(TClipboard.HasFormat));

RegRegisterMethod(TClipboard,'Open',TypeInfo(_T9),NoParams, pointer(24));

RegRegisterMethod(TClipboard,'SetComponent',TypeInfo(_T10),[
TypeInfo(TComponent)],Addr(TClipboard.SetComponent));

RegRegisterMethod(TClipboard,'SetAsHandle',TypeInfo(_T11),[
TypeInfo(Word),
TypeInfo(THandle)],Addr(TClipboard.SetAsHandle));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegRegisterMethod(TClipboard,'GetTextBuf',TypeInfo(_T7),[
TypeInfoPChar,
TypeInfo(Integer),TypeInfo(Integer)],Addr(TClipboard.GetTextBuf))}

{RegRegisterMethod(TClipboard,'SetTextBuf',TypeInfo(_T12),[
TypeInfoPChar],Addr(TClipboard.SetTextBuf))}

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
