{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit INIFILES_D3;
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

_T1 = function (const p0 : string;
const p1 : string;
const p2 : string): string of object;

_T2 = procedure (const p0 : string;
const p1 : string;
const p2 : string) of object;

_T3 = function (const p0 : string;
const p1 : string;
p2 : Longint): Longint of object;

_T4 = procedure (const p0 : string;
const p1 : string;
p2 : Longint) of object;

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

function __DC__GetTIniFile__FileName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TIniFile(Instance).FileName;
end;

procedure __RegisterProps;
begin
RegisterProperty(TIniFile,'FileName',__DC__GetTIniFile__FileName,nil);
end;

procedure __RegisterConsts0;
begin
end;

procedure __UnregisterConsts0;
begin
end;

const ClassList : array[0..0] of TClass = (
TIniFile
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
RegisterProc(TIniFile,'Create',mtConstructor,TypeInfo(_T0),[
TypeInfo(string)],Addr(TIniFile.Create),cRegister);

RegRegisterMethod(TIniFile,'ReadString',TypeInfo(_T1),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(string),TypeInfo(string)],Addr(TIniFile.ReadString));

RegRegisterMethod(TIniFile,'WriteString',TypeInfo(_T2),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(string)],Addr(TIniFile.WriteString));

RegRegisterMethod(TIniFile,'ReadInteger',TypeInfo(_T3),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Longint),TypeInfo(Longint)],Addr(TIniFile.ReadInteger));

RegRegisterMethod(TIniFile,'WriteInteger',TypeInfo(_T4),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Longint)],Addr(TIniFile.WriteInteger));

RegRegisterMethod(TIniFile,'ReadBool',TypeInfo(_T5),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Boolean),TypeInfo(Boolean)],Addr(TIniFile.ReadBool));

RegRegisterMethod(TIniFile,'WriteBool',TypeInfo(_T6),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Boolean)],Addr(TIniFile.WriteBool));

RegRegisterMethod(TIniFile,'ReadSection',TypeInfo(_T7),[
TypeInfo(string),
TypeInfo(TStrings)],Addr(TIniFile.ReadSection));

RegRegisterMethod(TIniFile,'ReadSections',TypeInfo(_T8),[
TypeInfo(TStrings)],Addr(TIniFile.ReadSections));

RegRegisterMethod(TIniFile,'ReadSectionValues',TypeInfo(_T9),[
TypeInfo(string),
TypeInfo(TStrings)],Addr(TIniFile.ReadSectionValues));

RegRegisterMethod(TIniFile,'EraseSection',TypeInfo(_T10),[
TypeInfo(string)],Addr(TIniFile.EraseSection));

RegRegisterMethod(TIniFile,'DeleteKey',TypeInfo(_T11),[
TypeInfo(string),
TypeInfo(string)],Addr(TIniFile.DeleteKey));

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
