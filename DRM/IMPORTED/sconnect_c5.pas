{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit SCONNECT_C5;
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
  SysUtils,
  MConnect,
  ScktComp,
  WinSock,
  WinINet,
  SConnect;
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
type __TDataBlockInterpreter__ = class(TDataBlockInterpreter);
type
_T0 = function : Boolean of object;

_T1 = procedure  of object;

_T2 = function (const p0 : IDispatch): OleVariant of object;

_T3 = function (const p0 : string): OleVariant of object;

_T4 = function (const p0 : OleVariant): Integer of object;

{_T5 = function (p0 : Integer): IDispatch of object;}

{_T6 = procedure (p0 : Integer;
const p1 : IDispatch) of object;}

_T7 = procedure (p0 : Integer) of object;

_T8 = function (const p0 : IDispatch): Boolean of object;

{_T9 = function (p0 : Integer;
const p1 : IDataBlock): Boolean of object;}

{_T10 = procedure (p0 : ISendDataBlock;
p1 : string) of object;}

_T11 = function (p0 : string): OleVariant of object;

{_T12 = procedure (const p0 : IDataBlock) of object;}

{_T13 = function (out p0 : TVarFlags;
const p1 : IDataBlock): OleVariant of object;}

{_T14 = procedure (const p0 : OleVariant;
const p1 : IDataBlock) of object;}

_T15 = procedure (p0 : TDataBlockInterpreter;
p1 : Integer) of object;

_T16 = _T1;

_T17 = _T1;

_T18 = _T1;

{_T19 = function : ITransport of object;}

_T20 = procedure (p0 : Exception) of object;

{_T21 = procedure (p0 : THandle;
p1 : ITransport) of object;}

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
function __TDataBlockInterpreter__InternalCreateObject__Wrapper(__Instance : TDataBlockInterpreter;
const p0 : IDispatch): OleVariant;
var
__p0 : ^TGUID;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := __TDataBlockInterpreter__(__Instance).InternalCreateObject(__p0^);
end;

function __TDataBlockInterpreter__CanCreateObject__Wrapper(__Instance : TDataBlockInterpreter;
const p0 : IDispatch): Boolean;
var
__p0 : ^TGUID;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := __TDataBlockInterpreter__(__Instance).CanCreateObject(__p0^);
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
function __DC__GetTSocketTransport__Host(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TSocketTransport(Instance).Host;
end;

procedure __DC__SetTSocketTransport__Host(Instance : TObject; Params : PVariantArgList);
begin
TSocketTransport(Instance).Host:=OleVariant(Params^[0]);
end;

function __DC__GetTSocketTransport__Address(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TSocketTransport(Instance).Address;
end;

procedure __DC__SetTSocketTransport__Address(Instance : TObject; Params : PVariantArgList);
begin
TSocketTransport(Instance).Address:=OleVariant(Params^[0]);
end;

function __DC__GetTSocketTransport__Port(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TSocketTransport(Instance).Port;
end;

procedure __DC__SetTSocketTransport__Port(Instance : TObject; Params : PVariantArgList);
begin
TSocketTransport(Instance).Port:=OleVariant(Params^[0]);
end;

function __DC__GetTSocketTransport__Socket(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TSocketTransport(Instance).Socket);
end;

procedure __DC__SetTSocketTransport__Socket(Instance : TObject; Params : PVariantArgList);
begin
TSocketTransport(Instance).Socket:=TCustomWinSocket(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTSocketTransport__InterceptGUID(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TSocketTransport(Instance).InterceptGUID;
end;

procedure __DC__SetTSocketTransport__InterceptGUID(Instance : TObject; Params : PVariantArgList);
begin
TSocketTransport(Instance).InterceptGUID:=OleVariant(Params^[0]);
end;

function __DC__GetTTransportThread__Semaphore(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTransportThread(Instance).Semaphore;
end;

procedure __RegisterProps;
begin
RegisterProperty(TSocketTransport,'Host',__DC__GetTSocketTransport__Host,__DC__SetTSocketTransport__Host);
RegisterProperty(TSocketTransport,'Address',__DC__GetTSocketTransport__Address,__DC__SetTSocketTransport__Address);
RegisterProperty(TSocketTransport,'Port',__DC__GetTSocketTransport__Port,__DC__SetTSocketTransport__Port);
RegisterProperty(TSocketTransport,'Socket',__DC__GetTSocketTransport__Socket,__DC__SetTSocketTransport__Socket);
RegisterProperty(TSocketTransport,'InterceptGUID',__DC__GetTSocketTransport__InterceptGUID,__DC__SetTSocketTransport__InterceptGUID);
RegisterProperty(TTransportThread,'Semaphore',__DC__GetTTransportThread__Semaphore,nil);
end;

const __ConstNames0 : array[0..13] of string = (
'CallSig'
,'ResultSig'
,'asError'
,'asInvoke'
,'asGetID'
,'asCreateObject'
,'asFreeObject'
,'asGetServers'
,'asGetGUID'
,'asGetAppServers'
,'asMask'
,'vfByRef'
,'vfVariant'
,'THREAD_SENDSTREAM'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,CallSig));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,ResultSig));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,asError));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,asInvoke));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,asGetID));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,asCreateObject));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,asFreeObject));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,asGetServers));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,asGetGUID));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,asGetAppServers));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,asMask));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,vfByRef));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,vfVariant));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,THREAD_SENDSTREAM));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..9] of TClass = (
EInterpreterError,
ESocketConnectionError,
TDataBlock,
TDataBlockInterpreter,
TDataDispatch,
TSocketConnection,
TSocketTransport,
TStreamedConnection,
TTransportThread,
TWebConnection
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
'LoadWinSock2'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T0),[TypeInfo(Boolean)],Addr(LoadWinSock2),cRegister);

RegisterProc(TDataBlock,'Create',mtConstructor,TypeInfo(_T1),NoParams,Addr(TDataBlock.Create),cRegister);

RegRegisterMethod(TDataBlockInterpreter,'InternalCreateObject',TypeInfo(_T2),[
TypeInfo(IDispatch),TypeInfo(OleVariant)], pointer(0));

RegRegisterMethod(TDataBlockInterpreter,'CreateObject',TypeInfo(_T3),[
TypeInfo(string),TypeInfo(OleVariant)], pointer(4));

RegRegisterMethod(TDataBlockInterpreter,'StoreObject',TypeInfo(_T4),[
TypeInfo(OleVariant),TypeInfo(Integer)], pointer(8));

RegRegisterMethod(TDataBlockInterpreter,'ReleaseObject',TypeInfo(_T7),[
TypeInfo(Integer)], pointer(20));

RegRegisterMethod(TDataBlockInterpreter,'CanCreateObject',TypeInfo(_T8),[
TypeInfo(IDispatch),TypeInfo(Boolean)], pointer(24));

RegRegisterMethod(TDataBlockInterpreter,'CallCreateObject',TypeInfo(_T11),[
TypeInfo(string),TypeInfo(OleVariant)],Addr(TDataBlockInterpreter.CallCreateObject));

RegisterProc(TDataDispatch,'Create',mtConstructor,TypeInfo(_T15),[
TypeInfo(TDataBlockInterpreter),
TypeInfo(Integer)],Addr(TDataDispatch.Create),cRegister);

RegisterProc(TSocketTransport,'Create',mtConstructor,TypeInfo(_T16),NoParams,Addr(TSocketTransport.Create),cRegister);

RegRegisterMethod(TStreamedConnection,'InternalOpen',TypeInfo(_T17),NoParams, pointer(100));

RegRegisterMethod(TStreamedConnection,'InternalClose',TypeInfo(_T18),NoParams, pointer(104));

RegRegisterMethod(TStreamedConnection,'DoError',TypeInfo(_T20),[
TypeInfo(Exception)], pointer(112));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegRegisterMethod(TDataBlockInterpreter,'LockObject',TypeInfo(_T5),[
TypeInfo(Integer),TypeInfo(IDispatch)], pointer(12))}

{RegRegisterMethod(TDataBlockInterpreter,'UnlockObject',TypeInfo(_T6),[
TypeInfo(Integer),
TypeInfo(IDispatch)], pointer(16))}

{RegRegisterMethod(TDataBlockInterpreter,'DoCustomAction',TypeInfo(_T9),[
TypeInfo(Integer),
TypeInfo(IDataBlock),TypeInfo(Boolean)], pointer(28))}

{RegisterProc(TDataBlockInterpreter,'Create',mtConstructor,TypeInfo(_T10),[
TypeInfo(ISendDataBlock),
TypeInfo(string)],Addr(TDataBlockInterpreter.Create),cRegister)}

{RegRegisterMethod(TDataBlockInterpreter,'InterpretData',TypeInfo(_T12),[
TypeInfo(IDataBlock)],Addr(TDataBlockInterpreter.InterpretData))}

{RegRegisterMethod(TDataBlockInterpreter,'ReadVariant',TypeInfo(_T13),[
TypeInfo(TVarFlags),
TypeInfo(IDataBlock),TypeInfo(OleVariant)],Addr(TDataBlockInterpreter.ReadVariant))}

{RegRegisterMethod(TDataBlockInterpreter,'WriteVariant',TypeInfo(_T14),[
TypeInfo(OleVariant),
TypeInfo(IDataBlock)],Addr(TDataBlockInterpreter.WriteVariant))}

{RegRegisterMethod(TStreamedConnection,'CreateTransport',TypeInfo(_T19),[TypeInfo(ITransport)], pointer(108))}

{RegisterProc(TTransportThread,'Create',mtConstructor,TypeInfo(_T21),[
TypeInfo(THandle),
TypeInfo(ITransport)], pointer(8),cRegister)}

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
