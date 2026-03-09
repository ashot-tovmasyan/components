{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit CLIPBRD_D3;
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
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
_T0 = function : TClipboard of object;

_T1 = function (p0 : TClipboard): TClipboard of object;

_T2 = procedure  of object;

_T3 = _T2;

_T4 = function (p0 : TComponent;
p1 : TComponent): TComponent of object;

_T5 = function (p0 : Word): THandle of object;

{_T6 = function (p0 : PChar;
p1 : Integer): Integer of object;}

_T7 = function (p0 : Word): Boolean of object;

_T8 = _T2;

_T9 = procedure (p0 : TComponent) of object;

_T10 = procedure (p0 : Word;
p1 : THandle) of object;

{_T11 = procedure (p0 : PChar) of object;}

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

RegRegisterMethod(TClipboard,'Clear',TypeInfo(_T2),NoParams,Addr(TClipboard.Clear));

RegRegisterMethod(TClipboard,'Close',TypeInfo(_T3),NoParams,Addr(TClipboard.Close));

RegRegisterMethod(TClipboard,'GetComponent',TypeInfo(_T4),[
TypeInfo(TComponent),
TypeInfo(TComponent),TypeInfo(TComponent)],Addr(TClipboard.GetComponent));

RegRegisterMethod(TClipboard,'GetAsHandle',TypeInfo(_T5),[
TypeInfo(Word),TypeInfo(THandle)],Addr(TClipboard.GetAsHandle));

RegRegisterMethod(TClipboard,'HasFormat',TypeInfo(_T7),[
TypeInfo(Word),TypeInfo(Boolean)],Addr(TClipboard.HasFormat));

RegRegisterMethod(TClipboard,'Open',TypeInfo(_T8),NoParams,Addr(TClipboard.Open));

RegRegisterMethod(TClipboard,'SetComponent',TypeInfo(_T9),[
TypeInfo(TComponent)],Addr(TClipboard.SetComponent));

RegRegisterMethod(TClipboard,'SetAsHandle',TypeInfo(_T10),[
TypeInfo(Word),
TypeInfo(THandle)],Addr(TClipboard.SetAsHandle));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegRegisterMethod(TClipboard,'GetTextBuf',TypeInfo(_T6),[
TypeInfoPChar,
TypeInfo(Integer),TypeInfo(Integer)],Addr(TClipboard.GetTextBuf))}

{RegRegisterMethod(TClipboard,'SetTextBuf',TypeInfo(_T11),[
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
