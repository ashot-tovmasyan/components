{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit dcdbctl_D4;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  activex,
  dcscript,
  dcconsts,
  dcsystem,
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  dcedit,
  grids,
  db,
  dbctrls,
  dbgrids,
  typinfo,
  comctrls,
  dcdreamlib,
  dbtables,
  dcdbctl;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
_T0 = procedure  of object;

_T1 = procedure (p0 : TObject) of object;

function __DC__GetTCustomDBDateEdit__DataSource(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDBDateEdit(Instance).DataSource);
end;

procedure __DC__SetTCustomDBDateEdit__DataSource(Instance : TObject; Params : PVariantArgList);
begin
TCustomDBDateEdit(Instance).DataSource:=TDataSource(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDBDateEdit__DataField(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDBDateEdit(Instance).DataField;
end;

procedure __DC__SetTCustomDBDateEdit__DataField(Instance : TObject; Params : PVariantArgList);
begin
TCustomDBDateEdit(Instance).DataField:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCDBEdit__DataField(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCDBEdit(Instance).DataField;
end;

procedure __DC__SetTCustomDCDBEdit__DataField(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCDBEdit(Instance).DataField:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCDBEdit__DataSource(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCDBEdit(Instance).DataSource);
end;

procedure __DC__SetTCustomDCDBEdit__DataSource(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCDBEdit(Instance).DataSource:=TDataSource(VarToObject(OleVariant(Params^[0])));
end;

procedure __RegisterProps;
begin
RegisterProperty(TCustomDBDateEdit,'DataSource',__DC__GetTCustomDBDateEdit__DataSource,__DC__SetTCustomDBDateEdit__DataSource);
RegisterProperty(TCustomDBDateEdit,'DataField',__DC__GetTCustomDBDateEdit__DataField,__DC__SetTCustomDBDateEdit__DataField);
RegisterProperty(TCustomDCDBEdit,'DataField',__DC__GetTCustomDCDBEdit__DataField,__DC__SetTCustomDCDBEdit__DataField);
RegisterProperty(TCustomDCDBEdit,'DataSource',__DC__GetTCustomDCDBEdit__DataSource,__DC__SetTCustomDCDBEdit__DataSource);
end;

procedure __RegisterConsts0;
begin
end;

procedure __UnregisterConsts0;
begin
end;

const ClassList : array[0..9] of TClass = (
TCustomDBDateEdit,
TCustomDCDBEdit,
TDataSourceLink,
TDCDBDateEdit,
TDCDBEdit,
TDCDBLookup,
TDCSimpleDBEdit,
TFieldDataSource,
TLookupFieldDataSource,
TPopupDBGrid
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
'Register'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T0),NoParams,Addr(Register),cRegister);

RegRegisterMethod(TFieldDataSource,'DataChange',TypeInfo(_T1),[
TypeInfo(TObject)], pointer(56));

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
