{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit REGISTRY_C4;
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
  Classes,
  SysUtils,
  IniFiles,
  Registry;
function ConvertTRegDataInfoToVariant(var R : TRegDataInfo) : OleVariant;
function ConvertVariantToTRegDataInfo(const V : OleVariant) : TRegDataInfo;
function ConvertTRegKeyInfoToVariant(var R : TRegKeyInfo) : OleVariant;
function ConvertVariantToTRegKeyInfo(const V : OleVariant) : TRegKeyInfo;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TRegDataInfo__Wrapper = class(TDCRecordWrapper)
private
fR : TRegDataInfo;
public
function GetRecordPtr : pointer; override;
published
procedure setRegData(const val : TRegDataType);
function getRegData : TRegDataType;
property RegData : TRegDataType read getRegData write setRegData;
procedure setDataSize(const val : Integer);
function getDataSize : Integer;
property DataSize : Integer read getDataSize write setDataSize;
end;
type __TRegKeyInfo__Wrapper = class(TDCRecordWrapper)
private
fR : TRegKeyInfo;
public
function GetRecordPtr : pointer; override;
published
procedure setNumSubKeys(const val : Integer);
function getNumSubKeys : Integer;
property NumSubKeys : Integer read getNumSubKeys write setNumSubKeys;
procedure setMaxSubKeyLen(const val : Integer);
function getMaxSubKeyLen : Integer;
property MaxSubKeyLen : Integer read getMaxSubKeyLen write setMaxSubKeyLen;
procedure setNumValues(const val : Integer);
function getNumValues : Integer;
property NumValues : Integer read getNumValues write setNumValues;
procedure setMaxValueLen(const val : Integer);
function getMaxValueLen : Integer;
property MaxValueLen : Integer read getMaxValueLen write setMaxValueLen;
procedure setMaxDataLen(const val : Integer);
function getMaxDataLen : Integer;
property MaxDataLen : Integer read getMaxDataLen write setMaxDataLen;
end;
type
_T0 = procedure (const p0 : string) of object;

_T1 = function (const p0 : string;
const p1 : string;
const p2 : string): string of object;

_T2 = function (const p0 : string;
const p1 : string;
p2 : Longint): Longint of object;

_T3 = procedure (const p0 : string;
const p1 : string;
p2 : Longint) of object;

_T4 = procedure (const p0 : string;
const p1 : string;
const p2 : string) of object;

_T5 = function (const p0 : string;
const p1 : string;
p2 : Boolean): Boolean of object;

_T6 = procedure (const p0 : string;
const p1 : string;
p2 : Boolean) of object;

_T7 = procedure (const p0 : string;
p1 : TStrings) of object;

_T8 = procedure (p0 : TStrings) of object;

_T9 = _T7;

_T10 = _T0;

_T11 = procedure (const p0 : string;
const p1 : string) of object;

_T12 = procedure  of object;

_T13 = _T12;

_T14 = function (const p0 : string): Boolean of object;

_T15 = _T14;

_T16 = _T14;

_T17 = function (const p0 : string;
const p1 : IDispatch): Boolean of object;

_T18 = function (const p0 : string): Integer of object;

_T19 = function (const p0 : string): TRegDataType of object;

_T20 = function (const p0 : IDispatch): Boolean of object;

_T21 = _T8;

_T22 = _T8;

_T23 = function : Boolean of object;

_T24 = _T14;

_T25 = function (const p0 : string;
const p1 : string): Boolean of object;

_T26 = _T6;

_T27 = function (const p0 : string;
p1 : Boolean): Boolean of object;

_T28 = _T14;

_T29 = function (const p0 : string): Currency of object;

_T30 = function (const p0 : string;
var p1 : string;
p2 : Integer): Integer of object;

_T31 = _T14;

_T32 = function (const p0 : string): TDateTime of object;

_T33 = _T32;

_T34 = function (const p0 : string): Double of object;

_T35 = _T18;

_T36 = function (const p0 : string): string of object;

_T37 = _T32;

_T38 = _T14;

_T39 = _T11;

_T40 = function (const p0 : string;
const p1 : string;
const p2 : string): Boolean of object;

_T41 = _T25;

_T42 = _T25;

_T43 = _T14;

_T44 = _T14;

_T45 = procedure (const p0 : string;
p1 : Currency) of object;

_T46 = procedure (const p0 : string;
var p1 : string;
p2 : Integer) of object;

_T47 = procedure (const p0 : string;
p1 : Boolean) of object;

_T48 = procedure (const p0 : string;
p1 : TDateTime) of object;

_T49 = _T48;

_T50 = procedure (const p0 : string;
p1 : Double) of object;

_T51 = procedure (const p0 : string;
p1 : Integer) of object;

_T52 = _T11;

_T53 = _T11;

_T54 = _T48;

_T55 = _T0;

function __TRegDataInfo__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TRegDataInfo__Wrapper.setRegData(const val : TRegDataType);
begin
TRegDataInfo(GetRecordPtr^).RegData := val;
end;
function __TRegDataInfo__Wrapper.getRegData : TRegDataType;
begin
result := TRegDataInfo(GetRecordPtr^).RegData;
end;
procedure __TRegDataInfo__Wrapper.setDataSize(const val : Integer);
begin
TRegDataInfo(GetRecordPtr^).DataSize := val;
end;
function __TRegDataInfo__Wrapper.getDataSize : Integer;
begin
result := TRegDataInfo(GetRecordPtr^).DataSize;
end;
function __TRegKeyInfo__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TRegKeyInfo__Wrapper.setNumSubKeys(const val : Integer);
begin
TRegKeyInfo(GetRecordPtr^).NumSubKeys := val;
end;
function __TRegKeyInfo__Wrapper.getNumSubKeys : Integer;
begin
result := TRegKeyInfo(GetRecordPtr^).NumSubKeys;
end;
procedure __TRegKeyInfo__Wrapper.setMaxSubKeyLen(const val : Integer);
begin
TRegKeyInfo(GetRecordPtr^).MaxSubKeyLen := val;
end;
function __TRegKeyInfo__Wrapper.getMaxSubKeyLen : Integer;
begin
result := TRegKeyInfo(GetRecordPtr^).MaxSubKeyLen;
end;
procedure __TRegKeyInfo__Wrapper.setNumValues(const val : Integer);
begin
TRegKeyInfo(GetRecordPtr^).NumValues := val;
end;
function __TRegKeyInfo__Wrapper.getNumValues : Integer;
begin
result := TRegKeyInfo(GetRecordPtr^).NumValues;
end;
procedure __TRegKeyInfo__Wrapper.setMaxValueLen(const val : Integer);
begin
TRegKeyInfo(GetRecordPtr^).MaxValueLen := val;
end;
function __TRegKeyInfo__Wrapper.getMaxValueLen : Integer;
begin
result := TRegKeyInfo(GetRecordPtr^).MaxValueLen;
end;
procedure __TRegKeyInfo__Wrapper.setMaxDataLen(const val : Integer);
begin
TRegKeyInfo(GetRecordPtr^).MaxDataLen := val;
end;
function __TRegKeyInfo__Wrapper.getMaxDataLen : Integer;
begin
result := TRegKeyInfo(GetRecordPtr^).MaxDataLen;
end;
function _TRegDataInfo_ : IDispatch;
begin
  result := __TRegDataInfo__Wrapper.Create;
end;
function _TRegKeyInfo_ : IDispatch;
begin
  result := __TRegKeyInfo__Wrapper.Create;
end;
function __TRegistry__GetDataInfo__Wrapper(__Instance : TRegistry;
const p0 : string;
const p1 : IDispatch): Boolean;
var
__p1 : ^TRegDataInfo;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
result := TRegistry(__Instance).GetDataInfo(p0,__p1^);
end;

function __TRegistry__GetKeyInfo__Wrapper(__Instance : TRegistry;
const p0 : IDispatch): Boolean;
var
__p0 : ^TRegKeyInfo;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := TRegistry(__Instance).GetKeyInfo(__p0^);
end;


type __TRegDataInfo__Wrapper__ = class(__TRegDataInfo__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TRegDataInfo__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTRegDataInfoToVariant(var R : TRegDataInfo) : OleVariant;
var
__rw : __TRegDataInfo__Wrapper__;
begin
__rw := __TRegDataInfo__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTRegDataInfo(const V : OleVariant) : TRegDataInfo;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TRegDataInfo((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TRegKeyInfo__Wrapper__ = class(__TRegKeyInfo__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TRegKeyInfo__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTRegKeyInfoToVariant(var R : TRegKeyInfo) : OleVariant;
var
__rw : __TRegKeyInfo__Wrapper__;
begin
__rw := __TRegKeyInfo__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTRegKeyInfo(const V : OleVariant) : TRegKeyInfo;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TRegKeyInfo((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTRegIniFile__FileName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TRegIniFile(Instance).FileName;
end;

function __DC__GetTRegistry__CurrentKey(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TRegistry(Instance).CurrentKey;
end;

function __DC__GetTRegistry__CurrentPath(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TRegistry(Instance).CurrentPath;
end;

function __DC__GetTRegistry__LazyWrite(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TRegistry(Instance).LazyWrite;
end;

procedure __DC__SetTRegistry__LazyWrite(Instance : TObject; Params : PVariantArgList);
begin
TRegistry(Instance).LazyWrite:=OleVariant(Params^[0]);
end;

function __DC__GetTRegistry__RootKey(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TRegistry(Instance).RootKey;
end;

procedure __DC__SetTRegistry__RootKey(Instance : TObject; Params : PVariantArgList);
begin
TRegistry(Instance).RootKey:=OleVariant(Params^[0]);
end;

function __DC__GetTRegistryIniFile__RegIniFile(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TRegistryIniFile(Instance).RegIniFile);
end;

procedure __RegisterProps;
begin
RegisterProperty(TRegIniFile,'FileName',__DC__GetTRegIniFile__FileName,nil);
RegisterProperty(TRegistry,'CurrentKey',__DC__GetTRegistry__CurrentKey,nil);
RegisterProperty(TRegistry,'CurrentPath',__DC__GetTRegistry__CurrentPath,nil);
RegisterProperty(TRegistry,'LazyWrite',__DC__GetTRegistry__LazyWrite,__DC__SetTRegistry__LazyWrite);
RegisterProperty(TRegistry,'RootKey',__DC__GetTRegistry__RootKey,__DC__SetTRegistry__RootKey);
RegisterProperty(TRegistryIniFile,'RegIniFile',__DC__GetTRegistryIniFile__RegIniFile,nil);
end;

const __ConstNames0 : array[0..4] of string = (
'rdUnknown'
,'rdString'
,'rdExpandString'
,'rdInteger'
,'rdBinary'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,rdUnknown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,rdString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,rdExpandString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,rdInteger));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,rdBinary));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..3] of TClass = (
ERegistryException,
TRegIniFile,
TRegistry,
TRegistryIniFile
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
'TRegDataInfo'
,'TRegKeyInfo'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TRegDataInfo_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(_TRegKeyInfo_)));
RegisterProc(TRegIniFile,'Create',mtConstructor,TypeInfo(_T0),[
TypeInfo(string)],Addr(TRegIniFile.Create),cRegister);

RegRegisterMethod(TRegIniFile,'ReadString',TypeInfo(_T1),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(string),TypeInfo(string)],Addr(TRegIniFile.ReadString));

RegRegisterMethod(TRegIniFile,'ReadInteger',TypeInfo(_T2),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Longint),TypeInfo(Longint)],Addr(TRegIniFile.ReadInteger));

RegRegisterMethod(TRegIniFile,'WriteInteger',TypeInfo(_T3),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Longint)],Addr(TRegIniFile.WriteInteger));

RegRegisterMethod(TRegIniFile,'WriteString',TypeInfo(_T4),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(string)],Addr(TRegIniFile.WriteString));

RegRegisterMethod(TRegIniFile,'ReadBool',TypeInfo(_T5),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Boolean),TypeInfo(Boolean)],Addr(TRegIniFile.ReadBool));

RegRegisterMethod(TRegIniFile,'WriteBool',TypeInfo(_T6),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Boolean)],Addr(TRegIniFile.WriteBool));

RegRegisterMethod(TRegIniFile,'ReadSection',TypeInfo(_T7),[
TypeInfo(string),
TypeInfo(TStrings)],Addr(TRegIniFile.ReadSection));

RegRegisterMethod(TRegIniFile,'ReadSections',TypeInfo(_T8),[
TypeInfo(TStrings)],Addr(TRegIniFile.ReadSections));

RegRegisterMethod(TRegIniFile,'ReadSectionValues',TypeInfo(_T9),[
TypeInfo(string),
TypeInfo(TStrings)],Addr(TRegIniFile.ReadSectionValues));

RegRegisterMethod(TRegIniFile,'EraseSection',TypeInfo(_T10),[
TypeInfo(string)],Addr(TRegIniFile.EraseSection));

RegRegisterMethod(TRegIniFile,'DeleteKey',TypeInfo(_T11),[
TypeInfo(string),
TypeInfo(string)],Addr(TRegIniFile.DeleteKey));

RegisterProc(TRegistry,'Create',mtConstructor,TypeInfo(_T12),NoParams,Addr(TRegistry.Create),cRegister);

RegRegisterMethod(TRegistry,'CloseKey',TypeInfo(_T13),NoParams,Addr(TRegistry.CloseKey));

RegRegisterMethod(TRegistry,'CreateKey',TypeInfo(_T14),[
TypeInfo(string),TypeInfo(Boolean)],Addr(TRegistry.CreateKey));

RegRegisterMethod(TRegistry,'DeleteKey',TypeInfo(_T15),[
TypeInfo(string),TypeInfo(Boolean)],Addr(TRegistry.DeleteKey));

RegRegisterMethod(TRegistry,'DeleteValue',TypeInfo(_T16),[
TypeInfo(string),TypeInfo(Boolean)],Addr(TRegistry.DeleteValue));

RegRegisterMethod(TRegistry,'GetDataInfo',TypeInfo(_T17),[
TypeInfo(string),
TypeInfo(IDispatch),TypeInfo(Boolean)],Addr(__TRegistry__GetDataInfo__Wrapper));

RegRegisterMethod(TRegistry,'GetDataSize',TypeInfo(_T18),[
TypeInfo(string),TypeInfo(Integer)],Addr(TRegistry.GetDataSize));

RegRegisterMethod(TRegistry,'GetDataType',TypeInfo(_T19),[
TypeInfo(string),TypeInfo(TRegDataType)],Addr(TRegistry.GetDataType));

RegRegisterMethod(TRegistry,'GetKeyInfo',TypeInfo(_T20),[
TypeInfo(IDispatch),TypeInfo(Boolean)],Addr(__TRegistry__GetKeyInfo__Wrapper));

RegRegisterMethod(TRegistry,'GetKeyNames',TypeInfo(_T21),[
TypeInfo(TStrings)],Addr(TRegistry.GetKeyNames));

RegRegisterMethod(TRegistry,'GetValueNames',TypeInfo(_T22),[
TypeInfo(TStrings)],Addr(TRegistry.GetValueNames));

RegRegisterMethod(TRegistry,'HasSubKeys',TypeInfo(_T23),[TypeInfo(Boolean)],Addr(TRegistry.HasSubKeys));

RegRegisterMethod(TRegistry,'KeyExists',TypeInfo(_T24),[
TypeInfo(string),TypeInfo(Boolean)],Addr(TRegistry.KeyExists));

RegRegisterMethod(TRegistry,'LoadKey',TypeInfo(_T25),[
TypeInfo(string),
TypeInfo(string),TypeInfo(Boolean)],Addr(TRegistry.LoadKey));

RegRegisterMethod(TRegistry,'MoveKey',TypeInfo(_T26),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Boolean)],Addr(TRegistry.MoveKey));

RegRegisterMethod(TRegistry,'OpenKey',TypeInfo(_T27),[
TypeInfo(string),
TypeInfo(Boolean),TypeInfo(Boolean)],Addr(TRegistry.OpenKey));

RegRegisterMethod(TRegistry,'OpenKeyReadOnly',TypeInfo(_T28),[
TypeInfo(string),TypeInfo(Boolean)],Addr(TRegistry.OpenKeyReadOnly));

RegRegisterMethod(TRegistry,'ReadCurrency',TypeInfo(_T29),[
TypeInfo(string),TypeInfo(Currency)],Addr(TRegistry.ReadCurrency));

RegRegisterMethod(TRegistry,'ReadBinaryData',TypeInfo(_T30),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Integer)],Addr(TRegistry.ReadBinaryData));

RegRegisterMethod(TRegistry,'ReadBool',TypeInfo(_T31),[
TypeInfo(string),TypeInfo(Boolean)],Addr(TRegistry.ReadBool));

RegRegisterMethod(TRegistry,'ReadDate',TypeInfo(_T32),[
TypeInfo(string),TypeInfo(TDateTime)],Addr(TRegistry.ReadDate));

RegRegisterMethod(TRegistry,'ReadDateTime',TypeInfo(_T33),[
TypeInfo(string),TypeInfo(TDateTime)],Addr(TRegistry.ReadDateTime));

RegRegisterMethod(TRegistry,'ReadFloat',TypeInfo(_T34),[
TypeInfo(string),TypeInfo(Double)],Addr(TRegistry.ReadFloat));

RegRegisterMethod(TRegistry,'ReadInteger',TypeInfo(_T35),[
TypeInfo(string),TypeInfo(Integer)],Addr(TRegistry.ReadInteger));

RegRegisterMethod(TRegistry,'ReadString',TypeInfo(_T36),[
TypeInfo(string),TypeInfo(string)],Addr(TRegistry.ReadString));

RegRegisterMethod(TRegistry,'ReadTime',TypeInfo(_T37),[
TypeInfo(string),TypeInfo(TDateTime)],Addr(TRegistry.ReadTime));

RegRegisterMethod(TRegistry,'RegistryConnect',TypeInfo(_T38),[
TypeInfo(string),TypeInfo(Boolean)],Addr(TRegistry.RegistryConnect));

RegRegisterMethod(TRegistry,'RenameValue',TypeInfo(_T39),[
TypeInfo(string),
TypeInfo(string)],Addr(TRegistry.RenameValue));

RegRegisterMethod(TRegistry,'ReplaceKey',TypeInfo(_T40),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(string),TypeInfo(Boolean)],Addr(TRegistry.ReplaceKey));

RegRegisterMethod(TRegistry,'RestoreKey',TypeInfo(_T41),[
TypeInfo(string),
TypeInfo(string),TypeInfo(Boolean)],Addr(TRegistry.RestoreKey));

RegRegisterMethod(TRegistry,'SaveKey',TypeInfo(_T42),[
TypeInfo(string),
TypeInfo(string),TypeInfo(Boolean)],Addr(TRegistry.SaveKey));

RegRegisterMethod(TRegistry,'UnLoadKey',TypeInfo(_T43),[
TypeInfo(string),TypeInfo(Boolean)],Addr(TRegistry.UnLoadKey));

RegRegisterMethod(TRegistry,'ValueExists',TypeInfo(_T44),[
TypeInfo(string),TypeInfo(Boolean)],Addr(TRegistry.ValueExists));

RegRegisterMethod(TRegistry,'WriteCurrency',TypeInfo(_T45),[
TypeInfo(string),
TypeInfo(Currency)],Addr(TRegistry.WriteCurrency));

RegRegisterMethod(TRegistry,'WriteBinaryData',TypeInfo(_T46),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Integer)],Addr(TRegistry.WriteBinaryData));

RegRegisterMethod(TRegistry,'WriteBool',TypeInfo(_T47),[
TypeInfo(string),
TypeInfo(Boolean)],Addr(TRegistry.WriteBool));

RegRegisterMethod(TRegistry,'WriteDate',TypeInfo(_T48),[
TypeInfo(string),
TypeInfo(TDateTime)],Addr(TRegistry.WriteDate));

RegRegisterMethod(TRegistry,'WriteDateTime',TypeInfo(_T49),[
TypeInfo(string),
TypeInfo(TDateTime)],Addr(TRegistry.WriteDateTime));

RegRegisterMethod(TRegistry,'WriteFloat',TypeInfo(_T50),[
TypeInfo(string),
TypeInfo(Double)],Addr(TRegistry.WriteFloat));

RegRegisterMethod(TRegistry,'WriteInteger',TypeInfo(_T51),[
TypeInfo(string),
TypeInfo(Integer)],Addr(TRegistry.WriteInteger));

RegRegisterMethod(TRegistry,'WriteString',TypeInfo(_T52),[
TypeInfo(string),
TypeInfo(string)],Addr(TRegistry.WriteString));

RegRegisterMethod(TRegistry,'WriteExpandString',TypeInfo(_T53),[
TypeInfo(string),
TypeInfo(string)],Addr(TRegistry.WriteExpandString));

RegRegisterMethod(TRegistry,'WriteTime',TypeInfo(_T54),[
TypeInfo(string),
TypeInfo(TDateTime)],Addr(TRegistry.WriteTime));

RegisterProc(TRegistryIniFile,'Create',mtConstructor,TypeInfo(_T55),[
TypeInfo(string)],Addr(TRegistryIniFile.Create),cRegister);

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
