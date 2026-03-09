{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit dbInsp_C3;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  activex,
  dcscript,
  sysutils,
  Windows,
  messages,
  Classes,
  Controls,
  Forms,
  typinfo,
  dsgnintf,
  dcpedit,
  stdctrls,
  db,
  dbctrls,
  oinspect,
  dcedit,
  dcdbctl,
  dbconsts,
  dialogs,
  glyphed,
  maskpr,
  dcstrled,
  dcgen,
  graphics,
  dcsystem,
  dcdreamlib,
  dcconsts,
  dbtables,
  dbinsp;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
_T0 = procedure (p0 : TField) of object;

function __DC__GetTCustomDSInspector__ConfirmDelete(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDSInspector(Instance).ConfirmDelete;
end;

procedure __DC__SetTCustomDSInspector__ConfirmDelete(Instance : TObject; Params : PVariantArgList);
begin
TCustomDSInspector(Instance).ConfirmDelete:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDSInspector__DataSource(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDSInspector(Instance).DataSource);
end;

procedure __DC__SetTCustomDSInspector__DataSource(Instance : TObject; Params : PVariantArgList);
begin
TCustomDSInspector(Instance).DataSource:=TDataSource(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDSInspector__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDSInspector(Instance).Items);
end;

procedure __DC__SetTCustomDSInspector__Items(Instance : TObject; Params : PVariantArgList);
begin
TCustomDSInspector(Instance).Items:=TDCInspectorItems(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDSInspector__UseFieldNames(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDSInspector(Instance).UseFieldNames;
end;

procedure __DC__SetTCustomDSInspector__UseFieldNames(Instance : TObject; Params : PVariantArgList);
begin
TCustomDSInspector(Instance).UseFieldNames:=OleVariant(Params^[0]);
end;

function __DC__GetTDCInspectorItems__Inspector(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCInspectorItems(Instance).Inspector);
end;

function __DC__GetTDCInspectorItems__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCInspectorItems(Instance).Items[OleVariant(Params^[0])]);
end;

procedure __DC__SetTDCInspectorItems__Items(Instance : TObject; Params : PVariantArgList);
begin
TDCInspectorItems(Instance).Items[OleVariant(Params^[1])]:=TInspectorItem(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTFieldEditor__Field(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TFieldEditor(Instance).Field);
end;

function __DC__GetTInspectorItem__Field(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TInspectorItem(Instance).Field);
end;

procedure __DC__SetTInspectorItem__Field(Instance : TObject; Params : PVariantArgList);
begin
TInspectorItem(Instance).Field:=TField(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTInspectorItem__Inspector(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TInspectorItem(Instance).Inspector);
end;

procedure __RegisterProps;
begin
RegisterProperty(TCustomDSInspector,'ConfirmDelete',__DC__GetTCustomDSInspector__ConfirmDelete,__DC__SetTCustomDSInspector__ConfirmDelete);
RegisterProperty(TCustomDSInspector,'DataSource',__DC__GetTCustomDSInspector__DataSource,__DC__SetTCustomDSInspector__DataSource);
RegisterProperty(TCustomDSInspector,'Items',__DC__GetTCustomDSInspector__Items,__DC__SetTCustomDSInspector__Items);
RegisterProperty(TCustomDSInspector,'UseFieldNames',__DC__GetTCustomDSInspector__UseFieldNames,__DC__SetTCustomDSInspector__UseFieldNames);
RegisterProperty(TDCInspectorItems,'Inspector',__DC__GetTDCInspectorItems__Inspector,nil);
RegisterIndexedProperty(TDCInspectorItems,'Items',1,True,__DC__GetTDCInspectorItems__Items,__DC__SetTDCInspectorItems__Items);
RegisterProperty(TFieldEditor,'Field',__DC__GetTFieldEditor__Field,nil);
RegisterProperty(TInspectorItem,'Field',__DC__GetTInspectorItem__Field,__DC__SetTInspectorItem__Field);
RegisterProperty(TInspectorItem,'Inspector',__DC__GetTInspectorItem__Inspector,nil);
end;

const __ConstNames0 : array[0..2] of string = (
'ibsAuto'
,'ibsEllipsis'
,'ibsNone'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,ibsAuto));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,ibsEllipsis));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,ibsNone));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..5] of TClass = (
TCustomDSInspector,
TDataSetInspector,
TDataSetInspectorEdit,
TDCInspectorItems,
TFieldEditor,
TInspectorItem
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
RegRegisterMethod(TInspectorItem,'SetField',TypeInfo(_T0),[
TypeInfo(TField)], pointer(32));

end;
initialization
_mreg_0;
{RegisterEvent(TypeInfo(TGetEditorClassProc),[
TypeInfo(TDCDsgnProperty),
TypeInfo(TControlClass)]);}

{RegisterEvent(TypeInfo(TGetPopupClassProc),[
TypeInfo(TDCDsgnProperty),
TypeInfo(TWinControlClass)]);}

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
end.
