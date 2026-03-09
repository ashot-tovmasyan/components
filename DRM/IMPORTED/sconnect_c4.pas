{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit SCONNECT_C4;
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
  SConnect;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
_T0 = procedure (p0 : TStringList) of object;

_T1 = function : Boolean of object;

_T2 = procedure  of object;

{_T3 = function (p0 : Integer;
const p1 : IDataBlock): Boolean of object;}

{_T4 = procedure (p0 : ISendDataBlock) of object;}

_T5 = function (p0 : string): OleVariant of object;

{_T6 = procedure (const p0 : IDataBlock) of object;}

{_T7 = function (out p0 : TVarFlags;
const p1 : IDataBlock): OleVariant of object;}

{_T8 = procedure (const p0 : OleVariant;
const p1 : IDataBlock) of object;}

_T9 = procedure (p0 : TDataBlockInterpreter;
p1 : Integer) of object;

{_T10 = function : ITransport of object;}

_T11 = procedure (p0 : Exception) of object;

_T12 = function : OleVariant of object;

{_T13 = procedure (p0 : THandle;
p1 : ITransport) of object;}

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

const __ConstNames0 : array[0..12] of string = (
'CallSig'
,'ResultSig'
,'asError'
,'asInvoke'
,'asGetID'
,'asCreateObject'
,'asFreeObject'
,'asGetServers'
,'asGetGUID'
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
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,asMask));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,vfByRef));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,vfVariant));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,THREAD_SENDSTREAM));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..8] of TClass = (
EInterpreterError,
ESocketConnectionError,
TDataBlock,
TDataBlockInterpreter,
TDataDispatch,
TSocketConnection,
TSocketTransport,
TStreamedConnection,
TTransportThread
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
'GetDataBrokerList'
,'LoadWinSock2'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T0),[
TypeInfo(TStringList)],Addr(GetDataBrokerList),cRegister);

RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T1),[TypeInfo(Boolean)],Addr(LoadWinSock2),cRegister);

RegisterProc(TDataBlock,'Create',mtConstructor,TypeInfo(_T2),NoParams,Addr(TDataBlock.Create),cRegister);

RegRegisterMethod(TDataBlockInterpreter,'CreateObject',TypeInfo(_T5),[
TypeInfo(string),TypeInfo(OleVariant)],Addr(TDataBlockInterpreter.CreateObject));

RegisterProc(TDataDispatch,'Create',mtConstructor,TypeInfo(_T9),[
TypeInfo(TDataBlockInterpreter),
TypeInfo(Integer)],Addr(TDataDispatch.Create),cRegister);

RegRegisterMethod(TStreamedConnection,'DoError',TypeInfo(_T11),[
TypeInfo(Exception)], pointer(92));

RegRegisterMethod(TStreamedConnection,'GetServerList',TypeInfo(_T12),[TypeInfo(OleVariant)], pointer(96));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegRegisterMethod(TDataBlockInterpreter,'DoCustomAction',TypeInfo(_T3),[
TypeInfo(Integer),
TypeInfo(IDataBlock),TypeInfo(Boolean)], pointer(0))}

{RegisterProc(TDataBlockInterpreter,'Create',mtConstructor,TypeInfo(_T4),[
TypeInfo(ISendDataBlock)],Addr(TDataBlockInterpreter.Create),cRegister)}

{RegRegisterMethod(TDataBlockInterpreter,'InterpretData',TypeInfo(_T6),[
TypeInfo(IDataBlock)],Addr(TDataBlockInterpreter.InterpretData))}

{RegRegisterMethod(TDataBlockInterpreter,'ReadVariant',TypeInfo(_T7),[
TypeInfo(TVarFlags),
TypeInfo(IDataBlock),TypeInfo(OleVariant)],Addr(TDataBlockInterpreter.ReadVariant))}

{RegRegisterMethod(TDataBlockInterpreter,'WriteVariant',TypeInfo(_T8),[
TypeInfo(OleVariant),
TypeInfo(IDataBlock)],Addr(TDataBlockInterpreter.WriteVariant))}

{RegRegisterMethod(TStreamedConnection,'CreateTransport',TypeInfo(_T10),[TypeInfo(ITransport)], pointer(88))}

{RegisterProc(TTransportThread,'Create',mtConstructor,TypeInfo(_T13),[
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
