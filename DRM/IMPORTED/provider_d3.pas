{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit PROVIDER_D3;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  dcscript,
  dcsystem,
  dcdreamlib,
  Windows,
  ActiveX,
  SysUtils,
  ComObj,
  Classes,
  StdVcl,
  Provider;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
{_T0 = function : IProvider of object;}

_T1 = function : OleVariant of object;

_T2 = _T1;

_T3 = function (p0 : Integer;
out p1 : Integer): OleVariant of object;

_T4 = function (p0 : OleVariant;
p1 : Integer;
out p2 : Integer): OleVariant of object;

_T5 = function (p0 : OleVariant): OleVariant of object;

_T6 = procedure (p0 : WordBool) of object;

_T7 = procedure (p0 : OleVariant) of object;

_T8 = procedure (p0 : TCustomProvider) of object;

procedure __RegisterProps;
begin
end;

procedure __RegisterConsts0;
begin
end;

procedure __UnregisterConsts0;
begin
end;

const ClassList : array[0..1] of TClass = (
TCustomProvider,
TProviderObject
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
RegRegisterMethod(TCustomProvider,'Get_Data',TypeInfo(_T1),[TypeInfo(OleVariant)], pointer(44));

RegRegisterMethod(TCustomProvider,'GetMetaData',TypeInfo(_T2),[TypeInfo(OleVariant)], pointer(48));

RegRegisterMethod(TCustomProvider,'GetRecords',TypeInfo(_T3),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(OleVariant)], pointer(52));

RegRegisterMethod(TCustomProvider,'ApplyUpdates',TypeInfo(_T4),[
TypeInfo(OleVariant),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(OleVariant)], pointer(56));

RegRegisterMethod(TCustomProvider,'DataRequest',TypeInfo(_T5),[
TypeInfo(OleVariant),TypeInfo(OleVariant)], pointer(60));

RegRegisterMethod(TCustomProvider,'Reset',TypeInfo(_T6),[
TypeInfo(WordBool)], pointer(64));

RegRegisterMethod(TCustomProvider,'SetParams',TypeInfo(_T7),[
TypeInfo(OleVariant)], pointer(68));

RegisterProc(TProviderObject,'Create',mtConstructor,TypeInfo(_T8),[
TypeInfo(TCustomProvider)],Addr(TProviderObject.Create),cRegister);

end;
initialization
_mreg_0;
{RegRegisterMethod(TCustomProvider,'GetProvider',TypeInfo(_T0),[TypeInfo(IProvider)], pointer(40))}

RegisterEvent(TypeInfo(TDataRequestEvent),[
TypeInfo(TObject),
TypeInfo(OleVariant),TypeInfo(OleVariant)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
end.
