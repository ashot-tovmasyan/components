{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit INIFILES_C4;
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
  SysUtils,
  Classes,
  IniFiles;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
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
p2 : TDateTime): TDateTime of object;

_T9 = _T8;

_T10 = function (const p0 : string;
const p1 : string;
p2 : Double): Double of object;

_T11 = _T8;

_T12 = procedure (const p0 : string;
const p1 : string;
p2 : TDateTime) of object;

_T13 = _T12;

_T14 = procedure (const p0 : string;
const p1 : string;
p2 : Double) of object;

_T15 = _T12;

_T16 = procedure (const p0 : string;
p1 : TStrings) of object;

_T17 = procedure (p0 : TStrings) of object;

_T18 = _T16;

_T19 = _T0;

_T20 = procedure (const p0 : string;
const p1 : string) of object;

_T21 = procedure  of object;

_T22 = function (const p0 : string;
const p1 : string): Boolean of object;

_T23 = _T0;

_T24 = _T21;

_T25 = _T17;

_T26 = procedure (const p0 : string;
p1 : Boolean) of object;

_T27 = _T17;

function __DC__GetTCustomIniFile__FileName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomIniFile(Instance).FileName;
end;

procedure __RegisterProps;
begin
RegisterProperty(TCustomIniFile,'FileName',__DC__GetTCustomIniFile__FileName,nil);
end;

procedure __RegisterConsts0;
begin
end;

procedure __UnregisterConsts0;
begin
end;

const ClassList : array[0..2] of TClass = (
TCustomIniFile,
TIniFile,
TMemIniFile
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

RegRegisterMethod(TCustomIniFile,'ReadDate',TypeInfo(_T8),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TDateTime),TypeInfo(TDateTime)], pointer(24));

RegRegisterMethod(TCustomIniFile,'ReadDateTime',TypeInfo(_T9),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TDateTime),TypeInfo(TDateTime)], pointer(28));

RegRegisterMethod(TCustomIniFile,'ReadFloat',TypeInfo(_T10),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Double),TypeInfo(Double)], pointer(32));

RegRegisterMethod(TCustomIniFile,'ReadTime',TypeInfo(_T11),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TDateTime),TypeInfo(TDateTime)], pointer(36));

RegRegisterMethod(TCustomIniFile,'WriteDate',TypeInfo(_T12),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TDateTime)], pointer(40));

RegRegisterMethod(TCustomIniFile,'WriteDateTime',TypeInfo(_T13),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TDateTime)], pointer(44));

RegRegisterMethod(TCustomIniFile,'WriteFloat',TypeInfo(_T14),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Double)], pointer(48));

RegRegisterMethod(TCustomIniFile,'WriteTime',TypeInfo(_T15),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TDateTime)], pointer(52));

RegRegisterMethod(TCustomIniFile,'ReadSection',TypeInfo(_T16),[
TypeInfo(string),
TypeInfo(TStrings)], pointer(56));

RegRegisterMethod(TCustomIniFile,'ReadSections',TypeInfo(_T17),[
TypeInfo(TStrings)], pointer(60));

RegRegisterMethod(TCustomIniFile,'ReadSectionValues',TypeInfo(_T18),[
TypeInfo(string),
TypeInfo(TStrings)], pointer(64));

RegRegisterMethod(TCustomIniFile,'EraseSection',TypeInfo(_T19),[
TypeInfo(string)], pointer(68));

RegRegisterMethod(TCustomIniFile,'DeleteKey',TypeInfo(_T20),[
TypeInfo(string),
TypeInfo(string)], pointer(72));

RegRegisterMethod(TCustomIniFile,'UpdateFile',TypeInfo(_T21),NoParams, pointer(76));

RegRegisterMethod(TCustomIniFile,'ValueExists',TypeInfo(_T22),[
TypeInfo(string),
TypeInfo(string),TypeInfo(Boolean)],Addr(TCustomIniFile.ValueExists));

RegisterProc(TMemIniFile,'Create',mtConstructor,TypeInfo(_T23),[
TypeInfo(string)],Addr(TMemIniFile.Create),cRegister);

RegRegisterMethod(TMemIniFile,'Clear',TypeInfo(_T24),NoParams,Addr(TMemIniFile.Clear));

RegRegisterMethod(TMemIniFile,'GetStrings',TypeInfo(_T25),[
TypeInfo(TStrings)],Addr(TMemIniFile.GetStrings));

RegRegisterMethod(TMemIniFile,'Rename',TypeInfo(_T26),[
TypeInfo(string),
TypeInfo(Boolean)],Addr(TMemIniFile.Rename));

RegRegisterMethod(TMemIniFile,'SetStrings',TypeInfo(_T27),[
TypeInfo(TStrings)],Addr(TMemIniFile.SetStrings));

end;
initialization
_mreg_0;
__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
end.
