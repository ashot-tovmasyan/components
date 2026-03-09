{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit INIFILES_D6;
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
  SysUtils,
  Classes,
  IniFiles;
function ConvertTHashItemToVariant(var R : THashItem) : OleVariant;
function ConvertVariantToTHashItem(const V : OleVariant) : THashItem;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __THashItem__Wrapper = class(TDCRecordWrapper)
private
fR : THashItem;
public
function GetRecordPtr : pointer; override;
published
procedure setKey(const val : AnsiString);
function getKey : AnsiString;
property Key : AnsiString read getKey write setKey;
procedure setValue(const val : Integer);
function getValue : Integer;
property Value : Integer read getValue write setValue;
end;
type
_T0 = procedure (const p0 : string) of object;

_T1 = function (const p0 : string): Boolean of object;

_T2 = function (const p0 : string;
const p1 : string;
const p2 : string): string of object;

_T3 = procedure (const p0 : string;
const p1 : string;
const p2 : string) of object;

_T4 = function (const p0 : string;
const p1 : string;
p2 : Longint): Longint of object;

_T5 = procedure (const p0 : string;
const p1 : string;
p2 : Longint) of object;

_T6 = function (const p0 : string;
const p1 : string;
p2 : Boolean): Boolean of object;

_T7 = procedure (const p0 : string;
const p1 : string;
p2 : Boolean) of object;

_T8 = function (const p0 : string;
const p1 : string;
p2 : TStream): Integer of object;

_T9 = function (const p0 : string;
const p1 : string;
p2 : TDateTime): TDateTime of object;

_T10 = _T9;

_T11 = function (const p0 : string;
const p1 : string;
p2 : Double): Double of object;

_T12 = _T9;

_T13 = procedure (const p0 : string;
const p1 : string;
p2 : TStream) of object;

_T14 = procedure (const p0 : string;
const p1 : string;
p2 : TDateTime) of object;

_T15 = _T14;

_T16 = procedure (const p0 : string;
const p1 : string;
p2 : Double) of object;

_T17 = _T14;

_T18 = procedure (const p0 : string;
p1 : TStrings) of object;

_T19 = procedure (p0 : TStrings) of object;

_T20 = _T18;

_T21 = _T0;

_T22 = procedure (const p0 : string;
const p1 : string) of object;

_T23 = procedure  of object;

_T24 = function (const p0 : string;
const p1 : string): Boolean of object;

_T25 = _T0;

_T26 = _T23;

_T27 = _T19;

_T28 = procedure (const p0 : string;
p1 : Boolean) of object;

_T29 = _T19;

_T30 = function (const p0 : string): Cardinal of object;

_T31 = procedure (p0 : Integer) of object;

_T32 = procedure (const p0 : string;
p1 : Integer) of object;

_T33 = _T23;

_T34 = _T0;

_T35 = function (const p0 : string;
p1 : Integer): Boolean of object;

_T36 = function (const p0 : string): Integer of object;

function __THashItem__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __THashItem__Wrapper.setKey(const val : AnsiString);
begin
THashItem(GetRecordPtr^).Key := val;
end;
function __THashItem__Wrapper.getKey : AnsiString;
begin
result := THashItem(GetRecordPtr^).Key;
end;
procedure __THashItem__Wrapper.setValue(const val : Integer);
begin
THashItem(GetRecordPtr^).Value := val;
end;
function __THashItem__Wrapper.getValue : Integer;
begin
result := THashItem(GetRecordPtr^).Value;
end;
function _THashItem_ : IDispatch;
begin
  result := __THashItem__Wrapper.Create;
end;

type __THashItem__Wrapper__ = class(__THashItem__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __THashItem__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTHashItemToVariant(var R : THashItem) : OleVariant;
var
__rw : __THashItem__Wrapper__;
begin
__rw := __THashItem__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTHashItem(const V : OleVariant) : THashItem;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := THashItem((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTCustomIniFile__FileName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomIniFile(Instance).FileName;
end;

function __DC__GetTMemIniFile__CaseSensitive(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMemIniFile(Instance).CaseSensitive;
end;

procedure __DC__SetTMemIniFile__CaseSensitive(Instance : TObject; Params : PVariantArgList);
begin
TMemIniFile(Instance).CaseSensitive:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
RegisterProperty(TCustomIniFile,'FileName',__DC__GetTCustomIniFile__FileName,nil);
RegisterProperty(TMemIniFile,'CaseSensitive',__DC__GetTMemIniFile__CaseSensitive,__DC__SetTMemIniFile__CaseSensitive);
end;

procedure __RegisterConsts0;
begin
end;

procedure __UnregisterConsts0;
begin
end;

const ClassList : array[0..5] of TClass = (
EIniFileException,
TCustomIniFile,
THashedStringList,
TIniFile,
TMemIniFile,
TStringHash
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
'THashItem'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_THashItem_)));
RegisterProc(TCustomIniFile,'Create',mtConstructor,TypeInfo(_T0),[
TypeInfo(string)],Addr(TCustomIniFile.Create),cRegister);

RegRegisterMethod(TCustomIniFile,'SectionExists',TypeInfo(_T1),[
TypeInfo(string),TypeInfo(Boolean)],Addr(TCustomIniFile.SectionExists));

RegRegisterMethod(TCustomIniFile,'ReadString',TypeInfo(_T2),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(string),TypeInfo(string)], pointer(0));

RegRegisterMethod(TCustomIniFile,'WriteString',TypeInfo(_T3),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(string)], pointer(4));

RegRegisterMethod(TCustomIniFile,'ReadInteger',TypeInfo(_T4),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Longint),TypeInfo(Longint)], pointer(8));

RegRegisterMethod(TCustomIniFile,'WriteInteger',TypeInfo(_T5),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Longint)], pointer(12));

RegRegisterMethod(TCustomIniFile,'ReadBool',TypeInfo(_T6),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Boolean),TypeInfo(Boolean)], pointer(16));

RegRegisterMethod(TCustomIniFile,'WriteBool',TypeInfo(_T7),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Boolean)], pointer(20));

RegRegisterMethod(TCustomIniFile,'ReadBinaryStream',TypeInfo(_T8),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TStream),TypeInfo(Integer)], pointer(24));

RegRegisterMethod(TCustomIniFile,'ReadDate',TypeInfo(_T9),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TDateTime),TypeInfo(TDateTime)], pointer(28));

RegRegisterMethod(TCustomIniFile,'ReadDateTime',TypeInfo(_T10),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TDateTime),TypeInfo(TDateTime)], pointer(32));

RegRegisterMethod(TCustomIniFile,'ReadFloat',TypeInfo(_T11),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Double),TypeInfo(Double)], pointer(36));

RegRegisterMethod(TCustomIniFile,'ReadTime',TypeInfo(_T12),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TDateTime),TypeInfo(TDateTime)], pointer(40));

RegRegisterMethod(TCustomIniFile,'WriteBinaryStream',TypeInfo(_T13),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TStream)], pointer(44));

RegRegisterMethod(TCustomIniFile,'WriteDate',TypeInfo(_T14),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TDateTime)], pointer(48));

RegRegisterMethod(TCustomIniFile,'WriteDateTime',TypeInfo(_T15),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TDateTime)], pointer(52));

RegRegisterMethod(TCustomIniFile,'WriteFloat',TypeInfo(_T16),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Double)], pointer(56));

RegRegisterMethod(TCustomIniFile,'WriteTime',TypeInfo(_T17),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TDateTime)], pointer(60));

RegRegisterMethod(TCustomIniFile,'ReadSection',TypeInfo(_T18),[
TypeInfo(string),
TypeInfo(TStrings)], pointer(64));

RegRegisterMethod(TCustomIniFile,'ReadSections',TypeInfo(_T19),[
TypeInfo(TStrings)], pointer(68));

RegRegisterMethod(TCustomIniFile,'ReadSectionValues',TypeInfo(_T20),[
TypeInfo(string),
TypeInfo(TStrings)], pointer(72));

RegRegisterMethod(TCustomIniFile,'EraseSection',TypeInfo(_T21),[
TypeInfo(string)], pointer(76));

RegRegisterMethod(TCustomIniFile,'DeleteKey',TypeInfo(_T22),[
TypeInfo(string),
TypeInfo(string)], pointer(80));

RegRegisterMethod(TCustomIniFile,'UpdateFile',TypeInfo(_T23),NoParams, pointer(84));

RegRegisterMethod(TCustomIniFile,'ValueExists',TypeInfo(_T24),[
TypeInfo(string),
TypeInfo(string),TypeInfo(Boolean)],Addr(TCustomIniFile.ValueExists));

RegisterProc(TMemIniFile,'Create',mtConstructor,TypeInfo(_T25),[
TypeInfo(string)],Addr(TMemIniFile.Create),cRegister);

RegRegisterMethod(TMemIniFile,'Clear',TypeInfo(_T26),NoParams,Addr(TMemIniFile.Clear));

RegRegisterMethod(TMemIniFile,'GetStrings',TypeInfo(_T27),[
TypeInfo(TStrings)],Addr(TMemIniFile.GetStrings));

RegRegisterMethod(TMemIniFile,'Rename',TypeInfo(_T28),[
TypeInfo(string),
TypeInfo(Boolean)],Addr(TMemIniFile.Rename));

RegRegisterMethod(TMemIniFile,'SetStrings',TypeInfo(_T29),[
TypeInfo(TStrings)],Addr(TMemIniFile.SetStrings));

RegRegisterMethod(TStringHash,'HashOf',TypeInfo(_T30),[
TypeInfo(string),TypeInfo(Cardinal)], pointer(0));

RegisterProc(TStringHash,'Create',mtConstructor,TypeInfo(_T31),[
TypeInfo(Integer)],Addr(TStringHash.Create),cRegister);

RegRegisterMethod(TStringHash,'Add',TypeInfo(_T32),[
TypeInfo(string),
TypeInfo(Integer)],Addr(TStringHash.Add));

RegRegisterMethod(TStringHash,'Clear',TypeInfo(_T33),NoParams,Addr(TStringHash.Clear));

RegRegisterMethod(TStringHash,'Remove',TypeInfo(_T34),[
TypeInfo(string)],Addr(TStringHash.Remove));

RegRegisterMethod(TStringHash,'Modify',TypeInfo(_T35),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Boolean)],Addr(TStringHash.Modify));

RegRegisterMethod(TStringHash,'ValueOf',TypeInfo(_T36),[
TypeInfo(string),TypeInfo(Integer)],Addr(TStringHash.ValueOf));

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
