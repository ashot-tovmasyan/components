{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit OBJBRKR_C5;
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
  MConnect,
  Classes,
  SysUtils,
  ObjBrkr;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
_T0 = procedure (p0 : TComponent) of object;

_T1 = function : string of object;

_T2 = _T1;

_T3 = function (const p0 : string): TServerItem of object;

_T4 = procedure (p0 : TStream) of object;

_T5 = _T4;

function __DC__GetTServerCollection__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TServerCollection(Instance).Items[OleVariant(Params^[0])]);
end;

procedure __DC__SetTServerCollection__Items(Instance : TObject; Params : PVariantArgList);
begin
TServerCollection(Instance).Items[OleVariant(Params^[1])]:=TServerItem(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTServerItem__HasFailed(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TServerItem(Instance).HasFailed;
end;

procedure __DC__SetTServerItem__HasFailed(Instance : TObject; Params : PVariantArgList);
begin
TServerItem(Instance).HasFailed:=OleVariant(Params^[0]);
end;

function __DC__GetTSimpleObjectBroker__ServerData(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TSimpleObjectBroker(Instance).ServerData;
end;

procedure __DC__SetTSimpleObjectBroker__ServerData(Instance : TObject; Params : PVariantArgList);
begin
TSimpleObjectBroker(Instance).ServerData:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
RegisterIndexedProperty(TServerCollection,'Items',1,True,__DC__GetTServerCollection__Items,__DC__SetTServerCollection__Items);
RegisterProperty(TServerItem,'HasFailed',__DC__GetTServerItem__HasFailed,__DC__SetTServerItem__HasFailed);
RegisterProperty(TSimpleObjectBroker,'ServerData',__DC__GetTSimpleObjectBroker__ServerData,__DC__SetTSimpleObjectBroker__ServerData);
end;

procedure __RegisterConsts0;
begin
end;

procedure __UnregisterConsts0;
begin
end;

const ClassList : array[0..3] of TClass = (
EBrokerException,
TServerCollection,
TServerItem,
TSimpleObjectBroker
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
RegisterProc(TServerCollection,'Create',mtConstructor,TypeInfo(_T0),[
TypeInfo(TComponent)],Addr(TServerCollection.Create),cRegister);

RegRegisterMethod(TServerCollection,'GetBalancedName',TypeInfo(_T1),[TypeInfo(string)],Addr(TServerCollection.GetBalancedName));

RegRegisterMethod(TServerCollection,'GetNextName',TypeInfo(_T2),[TypeInfo(string)],Addr(TServerCollection.GetNextName));

RegRegisterMethod(TServerCollection,'FindServer',TypeInfo(_T3),[
TypeInfo(string),TypeInfo(TServerItem)],Addr(TServerCollection.FindServer));

RegRegisterMethod(TSimpleObjectBroker,'SaveToStream',TypeInfo(_T4),[
TypeInfo(TStream)],Addr(TSimpleObjectBroker.SaveToStream));

RegRegisterMethod(TSimpleObjectBroker,'LoadFromStream',TypeInfo(_T5),[
TypeInfo(TStream)],Addr(TSimpleObjectBroker.LoadFromStream));

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
