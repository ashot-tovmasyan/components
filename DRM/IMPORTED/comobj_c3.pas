{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit COMOBJ_C3;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  classes,
  dcscript,
  dcsystem,
  dcdreamlib,
  Windows,
  ActiveX,
  SysUtils,
  ComObj;
function ConvertTCallDescToVariant(var R : TCallDesc) : OleVariant;
function ConvertVariantToTCallDesc(const V : OleVariant) : TCallDesc;
function ConvertTDispDescToVariant(var R : TDispDesc) : OleVariant;
function ConvertVariantToTDispDesc(const V : OleVariant) : TDispDesc;
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
procedure setD1(const val : Integer);
function getD1 : Integer;
property D1 : Integer read getD1 write setD1;
procedure setD2(const val : Word);
function getD2 : Word;
property D2 : Word read getD2 write setD2;
procedure setD3(const val : Word);
function getD3 : Word;
property D3 : Word read getD3 write setD3;
end;
type __TCallDesc__Wrapper = class(TDCRecordWrapper)
private
fR : TCallDesc;
public
function GetRecordPtr : pointer; override;
published
procedure setCallType(const val : Byte);
function getCallType : Byte;
property CallType : Byte read getCallType write setCallType;
procedure setArgCount(const val : Byte);
function getArgCount : Byte;
property ArgCount : Byte read getArgCount write setArgCount;
procedure setNamedArgCount(const val : Byte);
function getNamedArgCount : Byte;
property NamedArgCount : Byte read getNamedArgCount write setNamedArgCount;
end;
type __TDispDesc__Wrapper = class(TDCRecordWrapper)
private
fR : TDispDesc;
public
function GetRecordPtr : pointer; override;
published
procedure setDispID(const val : Integer);
function getDispID : Integer;
property DispID : Integer read getDispID write setDispID;
procedure setResType(const val : Byte);
function getResType : Byte;
property ResType : Byte read getResType write setResType;
end;
type __TAutoObject__ = class(TAutoObject);
type
{_T0 = procedure (const p0 : IDispatch;
p1 : PCallDesc;
p2 : PDispIDList;
p3 : Pointer;
p4 : PVariant) of object;}

_T1 = procedure (p0 : Integer;
const p1 : TExcepInfo) of object;

_T2 = function (p0 : TObject;
p1 : Pointer;
const p2 : IDispatch;
const p3 : WideString;
const p4 : WideString): HResult of object;

{_T5 = function (const p0 : string): IDispatch of object;}

{_T6 = function (const p0 : string): IDispatch of object;}

_T7 = procedure (p0 : HResult) of object;

_T8 = _T7;

_T9 = function (const p0 : string): IDispatch of object;

_T10 = function (const p0 : IDispatch): string of object;

_T11 = _T9;

_T12 = _T10;

_T13 = procedure (const p0 : string;
const p1 : string;
const p2 : string) of object;

_T14 = procedure (const p0 : string) of object;

{_T15 = function (const p0 : string): POleStr of object;}

_T16 = _T14;

{_T17 = procedure (p0 : IPropertyBag;
p1 : IErrorLog;
const p2 : string;
var p3 : Variant) of object;}

{_T18 = procedure (p0 : IPropertyBag;
const p1 : string;
const p2 : Variant) of object;}

_T19 = function : TComClassManager of object;

_T20 = procedure (const p0 : string;
p1 : Integer;
const p2 : string;
const p3 : string;
p4 : Integer) of object;

_T21 = procedure (const p0 : string;
p1 : Integer;
p2 : Integer) of object;

_T23 = function (const p0 : IDispatch;
p1 : Pointer;
p2 : Integer;
p3 : Integer;
p4 : Pointer): HResult of object;

_T24 = function (p0 : Integer;
p1 : Integer;
out p2): HResult of object;

_T25 = function (out p0 : Integer): HResult of object;

_T26 = function (p0 : Integer;
const p1 : IDispatch;
p2 : Integer;
p3 : Word;
var p4 : Word;
p5 : Pointer;
p6 : Pointer;
p7 : Pointer): HResult of object;

{_T29 = procedure (p0 : TComServerObject;
p1 : TFactoryProc) of object;}

{_T30 = function (p0 : TClass): TComObjectFactory of object;}

_T31 = function (const p0 : IDispatch): TComObjectFactory of object;

_T32 = procedure  of object;

{_T33 = procedure (const p0 : IUnknown) of object;}

{_T34 = procedure (p0 : TComObjectFactory;
const p1 : IUnknown) of object;}

_T35 = _T32;

_T36 = function : Integer of object;

_T37 = function (const p0 : IDispatch;
out p1): HResult of object;

_T38 = _T36;

_T39 = function : string of object;

_T40 = function : WideString of object;

_T41 = function : Boolean of object;

_T42 = function (const p0 : WideString): Boolean of object;

{_T44 = function (const p0 : IUnknown): TComObject of object;}

_T45 = _T32;

_T46 = procedure (p0 : Boolean) of object;

_T47 = function (p0 : Boolean): Integer of object;

_T48 = _T47;

_T49 = _T39;

_T50 = _T39;

_T51 = _T39;

_T52 = _T39;

{_T53 = function : ITypeLib of object;}

{_T55 = function (p0 : Integer): ITypeInfo of object;}

function __TGUID__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TGUID__Wrapper.setD1(const val : Integer);
begin
TGUID(GetRecordPtr^).D1 := val;
end;
function __TGUID__Wrapper.getD1 : Integer;
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
function __TCallDesc__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCallDesc__Wrapper.setCallType(const val : Byte);
begin
TCallDesc(GetRecordPtr^).CallType := val;
end;
function __TCallDesc__Wrapper.getCallType : Byte;
begin
result := TCallDesc(GetRecordPtr^).CallType;
end;
procedure __TCallDesc__Wrapper.setArgCount(const val : Byte);
begin
TCallDesc(GetRecordPtr^).ArgCount := val;
end;
function __TCallDesc__Wrapper.getArgCount : Byte;
begin
result := TCallDesc(GetRecordPtr^).ArgCount;
end;
procedure __TCallDesc__Wrapper.setNamedArgCount(const val : Byte);
begin
TCallDesc(GetRecordPtr^).NamedArgCount := val;
end;
function __TCallDesc__Wrapper.getNamedArgCount : Byte;
begin
result := TCallDesc(GetRecordPtr^).NamedArgCount;
end;
function __TDispDesc__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TDispDesc__Wrapper.setDispID(const val : Integer);
begin
TDispDesc(GetRecordPtr^).DispID := val;
end;
function __TDispDesc__Wrapper.getDispID : Integer;
begin
result := TDispDesc(GetRecordPtr^).DispID;
end;
procedure __TDispDesc__Wrapper.setResType(const val : Byte);
begin
TDispDesc(GetRecordPtr^).ResType := val;
end;
function __TDispDesc__Wrapper.getResType : Byte;
begin
result := TDispDesc(GetRecordPtr^).ResType;
end;
function _TCallDesc_ : IDispatch;
begin
  result := __TCallDesc__Wrapper.Create;
end;
function _TDispDesc_ : IDispatch;
begin
  result := __TDispDesc__Wrapper.Create;
end;
function ____HandleSafeCallException__Wrapper(p0 : TObject;
p1 : Pointer;
const p2 : IDispatch;
const p3 : WideString;
const p4 : WideString): HResult;
var
__p2 : ^TGUID;
__i2 : IDispatch;
begin
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
result := HandleSafeCallException(p0,p1,__p2^,p3,p4);
end;

function ____StringToGUID__Wrapper(const p0 : string): IDispatch;
var
__result : TGUID;
__wrapper : __TGUID__Wrapper;
begin
__result := StringToGUID(p0);
__wrapper := __TGUID__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function ____GUIDToString__Wrapper(const p0 : IDispatch): string;
var
__p0 : ^TGUID;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := GUIDToString(__p0^);
end;

function ____ProgIDToClassID__Wrapper(const p0 : string): IDispatch;
var
__result : TGUID;
__wrapper : __TGUID__Wrapper;
begin
__result := ProgIDToClassID(p0);
__wrapper := __TGUID__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function ____ClassIDToProgID__Wrapper(const p0 : IDispatch): string;
var
__p0 : ^TGUID;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := ClassIDToProgID(__p0^);
end;

function __TAutoObject__GetIDsOfNames__Wrapper(__Instance : TAutoObject;
const p0 : IDispatch;
p1 : Pointer;
p2 : Integer;
p3 : Integer;
p4 : Pointer): HResult;
var
__p0 : ^TGUID;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := __TAutoObject__(__Instance).GetIDsOfNames(__p0^,p1,p2,p3,p4);
end;

function __TAutoObject__Invoke__Wrapper(__Instance : TAutoObject;
p0 : Integer;
const p1 : IDispatch;
p2 : Integer;
p3 : Word;
var p4 : Word;
p5 : Pointer;
p6 : Pointer;
p7 : Pointer): HResult;
var
__p1 : ^TGUID;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
result := __TAutoObject__(__Instance).Invoke(p0,__p1^,p2,p3,p4,p5,p6,p7);
end;

function __TComClassManager__GetFactoryFromClassID__Wrapper(__Instance : TComClassManager;
const p0 : IDispatch): TComObjectFactory;
var
__p0 : ^TGUID;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := TComClassManager(__Instance).GetFactoryFromClassID(__p0^);
end;

function __TComObject__ObjQueryInterface__Wrapper(__Instance : TComObject;
const p0 : IDispatch;
out p1): HResult;
var
__p0 : ^TGUID;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := TComObject(__Instance).ObjQueryInterface(__p0^,p1);
end;


type __TCallDesc__Wrapper__ = class(__TCallDesc__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCallDesc__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCallDescToVariant(var R : TCallDesc) : OleVariant;
var
__rw : __TCallDesc__Wrapper__;
begin
__rw := __TCallDesc__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCallDesc(const V : OleVariant) : TCallDesc;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCallDesc((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TDispDesc__Wrapper__ = class(__TDispDesc__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TDispDesc__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTDispDescToVariant(var R : TDispDesc) : OleVariant;
var
__rw : __TDispDesc__Wrapper__;
begin
__rw := __TDispDesc__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTDispDesc(const V : OleVariant) : TDispDesc;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TDispDesc((_idisp as IDCRecordWrapper).GetRecordPtr^);
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
function __DC__GetEOleException__HelpFile(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := EOleException(Instance).HelpFile;
end;

procedure __DC__SetEOleException__HelpFile(Instance : TObject; Params : PVariantArgList);
begin
EOleException(Instance).HelpFile:=OleVariant(Params^[0]);
end;

function __DC__GetEOleException__Source(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := EOleException(Instance).Source;
end;

procedure __DC__SetEOleException__Source(Instance : TObject; Params : PVariantArgList);
begin
EOleException(Instance).Source:=OleVariant(Params^[0]);
end;

function __DC__GetEOleSysError__ErrorCode(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := EOleSysError(Instance).ErrorCode;
end;

procedure __DC__SetEOleSysError__ErrorCode(Instance : TObject; Params : PVariantArgList);
begin
EOleSysError(Instance).ErrorCode:=OleVariant(Params^[0]);
end;

function __DC__GetTAutoIntfObject__DispIID(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TGUID__Wrapper;
begin
__wrapper := __TGUID__Wrapper.Create;
__wrapper.fR := TAutoIntfObject(Instance).DispIID;
result := IUnknown(__wrapper) as IDispatch;
end;

function __DC__GetTComObject__Factory(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TComObject(Instance).Factory);
end;

function __DC__GetTComObject__RefCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TComObject(Instance).RefCount;
end;

function __DC__GetTComObjectFactory__ClassID(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TGUID__Wrapper;
begin
__wrapper := __TGUID__Wrapper.Create;
__wrapper.fR := TComObjectFactory(Instance).ClassID;
result := IUnknown(__wrapper) as IDispatch;
end;

function __DC__GetTComObjectFactory__ClassName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TComObjectFactory(Instance).ClassName;
end;

function __DC__GetTComObjectFactory__ComServer(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TComObjectFactory(Instance).ComServer);
end;

function __DC__GetTComObjectFactory__Description(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TComObjectFactory(Instance).Description;
end;

function __DC__GetTComObjectFactory__ErrorIID(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TGUID__Wrapper;
begin
__wrapper := __TGUID__Wrapper.Create;
__wrapper.fR := TComObjectFactory(Instance).ErrorIID;
result := IUnknown(__wrapper) as IDispatch;
end;

procedure __DC__SetTComObjectFactory__ErrorIID(Instance : TObject; Params : PVariantArgList);
var
__idisp:IDispatch;
__iwrapper:IDCRecordWrapper;
begin
__idisp:=DCVarToInterface(OleVariant(Params^[0]));
if __idisp=nil then exit;
__idisp.QueryInterface(IDCRecordWrapper, __iwrapper);
TComObjectFactory(Instance).ErrorIID:=TGUID(__iwrapper.GetRecordPtr^);
end;

function __DC__GetTComObjectFactory__LicString(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TComObjectFactory(Instance).LicString;
end;

procedure __DC__SetTComObjectFactory__LicString(Instance : TObject; Params : PVariantArgList);
begin
TComObjectFactory(Instance).LicString:=OleVariant(Params^[0]);
end;

function __DC__GetTComObjectFactory__ProgID(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TComObjectFactory(Instance).ProgID;
end;

function __DC__GetTComObjectFactory__Instancing(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TComObjectFactory(Instance).Instancing;
end;

function __DC__GetTComObjectFactory__ShowErrors(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TComObjectFactory(Instance).ShowErrors;
end;

procedure __DC__SetTComObjectFactory__ShowErrors(Instance : TObject; Params : PVariantArgList);
begin
TComObjectFactory(Instance).ShowErrors:=OleVariant(Params^[0]);
end;

function __DC__GetTComObjectFactory__SupportsLicensing(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TComObjectFactory(Instance).SupportsLicensing;
end;

procedure __DC__SetTComObjectFactory__SupportsLicensing(Instance : TObject; Params : PVariantArgList);
begin
TComObjectFactory(Instance).SupportsLicensing:=OleVariant(Params^[0]);
end;

function __DC__GetTComServerObject__HelpFileName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TComServerObject(Instance).HelpFileName;
end;

function __DC__GetTComServerObject__ServerFileName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TComServerObject(Instance).ServerFileName;
end;

function __DC__GetTComServerObject__ServerKey(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TComServerObject(Instance).ServerKey;
end;

function __DC__GetTComServerObject__ServerName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TComServerObject(Instance).ServerName;
end;

procedure __RegisterProps;
begin
RegisterProperty(EOleException,'HelpFile',__DC__GetEOleException__HelpFile,__DC__SetEOleException__HelpFile);
RegisterProperty(EOleException,'Source',__DC__GetEOleException__Source,__DC__SetEOleException__Source);
RegisterProperty(EOleSysError,'ErrorCode',__DC__GetEOleSysError__ErrorCode,__DC__SetEOleSysError__ErrorCode);
RegisterProperty(TAutoIntfObject,'DispIID',__DC__GetTAutoIntfObject__DispIID,nil);
RegisterProperty(TComObject,'Factory',__DC__GetTComObject__Factory,nil);
RegisterProperty(TComObject,'RefCount',__DC__GetTComObject__RefCount,nil);
RegisterProperty(TComObjectFactory,'ClassID',__DC__GetTComObjectFactory__ClassID,nil);
RegisterProperty(TComObjectFactory,'ClassName',__DC__GetTComObjectFactory__ClassName,nil);
RegisterProperty(TComObjectFactory,'ComServer',__DC__GetTComObjectFactory__ComServer,nil);
RegisterProperty(TComObjectFactory,'Description',__DC__GetTComObjectFactory__Description,nil);
RegisterProperty(TComObjectFactory,'ErrorIID',__DC__GetTComObjectFactory__ErrorIID,__DC__SetTComObjectFactory__ErrorIID);
RegisterProperty(TComObjectFactory,'LicString',__DC__GetTComObjectFactory__LicString,__DC__SetTComObjectFactory__LicString);
RegisterProperty(TComObjectFactory,'ProgID',__DC__GetTComObjectFactory__ProgID,nil);
RegisterProperty(TComObjectFactory,'Instancing',__DC__GetTComObjectFactory__Instancing,nil);
RegisterProperty(TComObjectFactory,'ShowErrors',__DC__GetTComObjectFactory__ShowErrors,__DC__SetTComObjectFactory__ShowErrors);
RegisterProperty(TComObjectFactory,'SupportsLicensing',__DC__GetTComObjectFactory__SupportsLicensing,__DC__SetTComObjectFactory__SupportsLicensing);
RegisterProperty(TComServerObject,'HelpFileName',__DC__GetTComServerObject__HelpFileName,nil);
RegisterProperty(TComServerObject,'ServerFileName',__DC__GetTComServerObject__ServerFileName,nil);
RegisterProperty(TComServerObject,'ServerKey',__DC__GetTComServerObject__ServerKey,nil);
RegisterProperty(TComServerObject,'ServerName',__DC__GetTComServerObject__ServerName,nil);
end;

const __ConstNames0 : array[0..2] of string = (
'ciInternal'
,'ciSingleInstance'
,'ciMultiInstance'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,ciInternal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,ciSingleInstance));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,ciMultiInstance));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..11] of TClass = (
EOleError,
EOleException,
EOleSysError,
TAutoIntfObject,
TAutoObject,
TAutoObjectFactory,
TComClassManager,
TComObject,
TComObjectFactory,
TComServerObject,
TTypedComObject,
TTypedComObjectFactory
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..13] of string = (
'TCallDesc'
,'TDispDesc'
,'DispatchInvokeError'
,'HandleSafeCallException'
,'OleError'
,'OleCheck'
,'StringToGUID'
,'GUIDToString'
,'ProgIDToClassID'
,'ClassIDToProgID'
,'CreateRegKey'
,'DeleteRegKey'
,'RegisterComServer'
,'ComClassManager'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TCallDesc_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(_TDispDesc_)));
RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T1),[
TypeInfo(Integer),
TypeInfo(TExcepInfo)],Addr(DispatchInvokeError),cRegister);

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T2),[
TypeInfo(TObject),
TypeInfoPointer,
TypeInfo(IDispatch),
TypeInfo(WideString),
TypeInfo(WideString),TypeInfo(HResult)],Addr(____HandleSafeCallException__Wrapper),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T7),[
TypeInfo(HResult)],Addr(OleError),cRegister);

RegisterProc(nil,MethodNames[5],mtProc,TypeInfo(_T8),[
TypeInfo(HResult)],Addr(OleCheck),cRegister);

RegisterProc(nil,MethodNames[6],mtProc,TypeInfo(_T9),[
TypeInfo(string),TypeInfo(IDispatch)],Addr(____StringToGUID__Wrapper),cRegister);

RegisterProc(nil,MethodNames[7],mtProc,TypeInfo(_T10),[
TypeInfo(IDispatch),TypeInfo(string)],Addr(____GUIDToString__Wrapper),cRegister);

RegisterProc(nil,MethodNames[8],mtProc,TypeInfo(_T11),[
TypeInfo(string),TypeInfo(IDispatch)],Addr(____ProgIDToClassID__Wrapper),cRegister);

RegisterProc(nil,MethodNames[9],mtProc,TypeInfo(_T12),[
TypeInfo(IDispatch),TypeInfo(string)],Addr(____ClassIDToProgID__Wrapper),cRegister);

RegisterProc(nil,MethodNames[10],mtProc,TypeInfo(_T13),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(string)],Addr(CreateRegKey),cRegister);

RegisterProc(nil,MethodNames[11],mtProc,TypeInfo(_T14),[
TypeInfo(string)],Addr(DeleteRegKey),cRegister);

RegisterProc(nil,MethodNames[12],mtProc,TypeInfo(_T16),[
TypeInfo(string)],Addr(RegisterComServer),cRegister);

RegisterProc(nil,MethodNames[13],mtProc,TypeInfo(_T19),[TypeInfo(TComClassManager)],Addr(ComClassManager),cRegister);

RegisterProc(EOleException,'Create',mtConstructor,TypeInfo(_T20),[
TypeInfo(string),
TypeInfo(Integer),
TypeInfo(string),
TypeInfo(string),
TypeInfo(Integer)],Addr(EOleException.Create),cRegister);

RegisterProc(EOleSysError,'Create',mtConstructor,TypeInfo(_T21),[
TypeInfo(string),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(EOleSysError.Create),cRegister);

RegisterProc(TAutoObject,'GetIDsOfNames',mtMethod,TypeInfo(_T23),[
TypeInfo(IDispatch),
TypeInfoPointer,
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfoPointer,TypeInfo(HResult)], pointer(16),cRegister);

RegisterProc(TAutoObject,'GetTypeInfo',mtMethod,TypeInfo(_T24),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfoUntyped,TypeInfo(HResult)], pointer(20),cStdCall);

RegisterProc(TAutoObject,'GetTypeInfoCount',mtMethod,TypeInfo(_T25),[
TypeInfo(Integer),TypeInfo(HResult)], pointer(24),cStdCall);

RegisterProc(TAutoObject,'Invoke',mtMethod,TypeInfo(_T26),[
TypeInfo(Integer),
TypeInfo(IDispatch),
TypeInfo(Integer),
TypeInfo(Word),
TypeInfo(Word),
TypeInfoPointer,
TypeInfoPointer,
TypeInfoPointer,TypeInfo(HResult)], pointer(28),cRegister);

RegRegisterMethod(TComClassManager,'GetFactoryFromClassID',TypeInfo(_T31),[
TypeInfo(IDispatch),TypeInfo(TComObjectFactory)],Addr(__TComClassManager__GetFactoryFromClassID__Wrapper));

RegisterProc(TComObject,'Create',mtConstructor,TypeInfo(_T32),NoParams,Addr(TComObject.Create),cRegister);

RegRegisterMethod(TComObject,'Initialize',TypeInfo(_T35),NoParams, pointer(0));

RegisterProc(TComObject,'ObjAddRef',mtMethod,TypeInfo(_T36),[TypeInfo(Integer)], pointer(4),cStdCall);

RegisterProc(TComObject,'ObjQueryInterface',mtMethod,TypeInfo(_T37),[
TypeInfo(IDispatch),
TypeInfoUntyped,TypeInfo(HResult)], pointer(8),cRegister);

RegisterProc(TComObject,'ObjRelease',mtMethod,TypeInfo(_T38),[TypeInfo(Integer)], pointer(12),cStdCall);

RegRegisterMethod(TComObjectFactory,'GetProgID',TypeInfo(_T39),[TypeInfo(string)], pointer(0));

RegRegisterMethod(TComObjectFactory,'GetLicenseString',TypeInfo(_T40),[TypeInfo(WideString)], pointer(4));

RegRegisterMethod(TComObjectFactory,'HasMachineLicense',TypeInfo(_T41),[TypeInfo(Boolean)], pointer(8));

RegRegisterMethod(TComObjectFactory,'ValidateUserLicense',TypeInfo(_T42),[
TypeInfo(WideString),TypeInfo(Boolean)], pointer(12));

RegRegisterMethod(TComObjectFactory,'RegisterClassObject',TypeInfo(_T45),NoParams,Addr(TComObjectFactory.RegisterClassObject));

RegRegisterMethod(TComObjectFactory,'UpdateRegistry',TypeInfo(_T46),[
TypeInfo(Boolean)], pointer(20));

RegRegisterMethod(TComServerObject,'CountObject',TypeInfo(_T47),[
TypeInfo(Boolean),TypeInfo(Integer)], pointer(0));

RegRegisterMethod(TComServerObject,'CountFactory',TypeInfo(_T48),[
TypeInfo(Boolean),TypeInfo(Integer)], pointer(4));

RegRegisterMethod(TComServerObject,'GetHelpFileName',TypeInfo(_T49),[TypeInfo(string)], pointer(8));

RegRegisterMethod(TComServerObject,'GetServerFileName',TypeInfo(_T50),[TypeInfo(string)], pointer(12));

RegRegisterMethod(TComServerObject,'GetServerKey',TypeInfo(_T51),[TypeInfo(string)], pointer(16));

RegRegisterMethod(TComServerObject,'GetServerName',TypeInfo(_T52),[TypeInfo(string)], pointer(20));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'DispatchInvoke',mtProc,TypeInfo(_T0),[
TypeInfo(IDispatch),
TypeInfoPointer,
TypeInfo(PDispIDList),
TypeInfoPointer,
TypeInfoPointer],Addr(DispatchInvoke),cRegister)}

{RegisterProc(nil,'CreateOleObject',mtProc,TypeInfo(_T5),[
TypeInfo(string),TypeInfo(IDispatch)],Addr(CreateOleObject),cRegister)}

{RegisterProc(nil,'GetActiveOleObject',mtProc,TypeInfo(_T6),[
TypeInfo(string),TypeInfo(IDispatch)],Addr(GetActiveOleObject),cRegister)}

{RegisterProc(nil,'StringToLPOLESTR',mtProc,TypeInfo(_T15),[
TypeInfo(string),TypeInfo(POleStr)],Addr(StringToLPOLESTR),cRegister)}

{RegisterProc(nil,'ReadPropFromBag',mtProc,TypeInfo(_T17),[
TypeInfo(IPropertyBag),
TypeInfo(IErrorLog),
TypeInfo(string),
TypeInfo(Variant)],Addr(ReadPropFromBag),cRegister)}

{RegisterProc(nil,'PutPropInBag',mtProc,TypeInfo(_T18),[
TypeInfo(IPropertyBag),
TypeInfo(string),
TypeInfo(Variant)],Addr(PutPropInBag),cRegister)}

{RegRegisterMethod(TComClassManager,'ForEachFactory',TypeInfo(_T29),[
TypeInfo(TComServerObject),
TypeInfo(TFactoryProc)],Addr(TComClassManager.ForEachFactory))}

{RegRegisterMethod(TComClassManager,'GetFactoryFromClass',TypeInfo(_T30),[
TypeInfo(TClass),TypeInfo(TComObjectFactory)],Addr(TComClassManager.GetFactoryFromClass))}

{RegisterProc(TComObject,'CreateAggregated',mtConstructor,TypeInfo(_T33),[
TypeInfo(IUnknown)],Addr(TComObject.CreateAggregated),cRegister)}

{RegisterProc(TComObject,'CreateFromFactory',mtConstructor,TypeInfo(_T34),[
TypeInfo(TComObjectFactory),
TypeInfo(IUnknown)],Addr(TComObject.CreateFromFactory),cRegister)}

{RegRegisterMethod(TComObjectFactory,'CreateComObject',TypeInfo(_T44),[
TypeInfo(IUnknown),TypeInfo(TComObject)], pointer(16))}

{RegRegisterMethod(TComServerObject,'GetTypeLib',TypeInfo(_T53),[TypeInfo(ITypeLib)], pointer(24))}

{RegRegisterMethod(TTypedComObjectFactory,'GetInterfaceTypeInfo',TypeInfo(_T55),[
TypeInfo(Integer),TypeInfo(ITypeInfo)],Addr(TTypedComObjectFactory.GetInterfaceTypeInfo))}

RegisterEvent(TypeInfo(TFactoryProc),[
TypeInfo(TComObjectFactory)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
