{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit MCONNECT_C5;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  dcscript,
  dcsystem,
  dcdreamlib,
  Messages,
  Windows,
  SysUtils,
  Classes,
  Midas,
  DBClient,
  ActiveX,
  ComObj,
  MConnect;
function ConvertTGUIDToVariant(var R : TGUID) : OleVariant;
function ConvertVariantToTGUID(const V : OleVariant) : TGUID;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TGUID__Wrapper = class(TDCRecordWrapper)
private
fR : TGUID;
public
function GetRecordPtr : pointer; override;
published
procedure setD1(const val : LongWord);
function getD1 : LongWord;
property D1 : LongWord read getD1 write setD1;
procedure setD2(const val : Word);
function getD2 : Word;
property D2 : Word read getD2 write setD2;
procedure setD3(const val : Word);
function getD3 : Word;
property D3 : Word read getD3 write setD3;
end;
type
_T0 = procedure (p0 : TStringList;
const p1 : string) of object;

_T1 = procedure (p0 : string;
p1 : Boolean) of object;

_T2 = function (const p0 : IDispatch): string of object;

_T3 = function (const p0): string of object;

_T4 = function (const p0 : string): Integer of object;

{_T5 = procedure (const p0 : IAppServerDisp) of object;}

_T6 = function : Variant of object;

_T7 = procedure (p0 : Variant) of object;

function __TGUID__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TGUID__Wrapper.setD1(const val : LongWord);
begin
TGUID(GetRecordPtr^).D1 := val;
end;
function __TGUID__Wrapper.getD1 : LongWord;
begin
result := TGUID(GetRecordPtr^).D1;
end;
procedure __TGUID__Wrapper.setD2(const val : Word);
begin
TGUID(GetRecordPtr^).D2 := val;
end;
function __TGUID__Wrapper.getD2 : Word;
begin
result := TGUID(GetRecordPtr^).D2;
end;
procedure __TGUID__Wrapper.setD3(const val : Word);
begin
TGUID(GetRecordPtr^).D3 := val;
end;
function __TGUID__Wrapper.getD3 : Word;
begin
result := TGUID(GetRecordPtr^).D3;
end;
function __TCustomObjectBroker__GetComputerForGUID__Wrapper(__Instance : TCustomObjectBroker;
const p0 : IDispatch): string;
var
__p0 : ^TGUID;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := TCustomObjectBroker(__Instance).GetComputerForGUID(__p0^);
end;


type __TGUID__Wrapper__ = class(__TGUID__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TGUID__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTGUIDToVariant(var R : TGUID) : OleVariant;
var
__rw : __TGUID__Wrapper__;
begin
__rw := __TGUID__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTGUID(const V : OleVariant) : TGUID;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TGUID((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTDispatchConnection__AppServer(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDispatchConnection(Instance).AppServer;
end;

procedure __RegisterProps;
begin
RegisterProperty(TDispatchConnection,'AppServer',__DC__GetTDispatchConnection__AppServer,nil);
end;

procedure __RegisterConsts0;
begin
end;

procedure __UnregisterConsts0;
begin
end;

const ClassList : array[0..5] of TClass = (
TCOMConnection,
TCustomObjectBroker,
TDCOMConnection,
TDispatchAppServer,
TDispatchConnection,
TOLEnterpriseConnection
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..0] of string = (
'GetMIDASAppServerList'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T0),[
TypeInfo(TStringList),
TypeInfo(string)],Addr(GetMIDASAppServerList),cRegister);

RegRegisterMethod(TCustomObjectBroker,'SetConnectStatus',TypeInfo(_T1),[
TypeInfo(string),
TypeInfo(Boolean)], pointer(48));

RegRegisterMethod(TCustomObjectBroker,'GetComputerForGUID',TypeInfo(_T2),[
TypeInfo(IDispatch),TypeInfo(string)], pointer(52));

RegRegisterMethod(TCustomObjectBroker,'GetComputerForProgID',TypeInfo(_T3),[
TypeInfoUntyped,TypeInfo(string)], pointer(56));

RegRegisterMethod(TCustomObjectBroker,'GetPortForComputer',TypeInfo(_T4),[
TypeInfo(string),TypeInfo(Integer)], pointer(60));

RegRegisterMethod(TDispatchConnection,'GetAppServer',TypeInfo(_T6),[TypeInfo(Variant)], pointer(92));

RegRegisterMethod(TDispatchConnection,'SetAppServer',TypeInfo(_T7),[
TypeInfo(Variant)], pointer(96));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(TDispatchAppServer,'Create',mtConstructor,TypeInfo(_T5),[
TypeInfo(IAppServerDisp)],Addr(TDispatchAppServer.Create),cRegister)}

RegisterEvent(TypeInfo(TGetUsernameEvent),[
TypeInfo(TObject),
TypeInfo(string)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
