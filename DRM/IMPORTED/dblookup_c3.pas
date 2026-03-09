{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit DBLOOKUP_C3;
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
  StdCtrls,
  DB,
  Controls,
  Messages,
  SysUtils,
  Forms,
  Graphics,
  Menus,
  Buttons,
  DBGrids,
  DBTables,
  Grids,
  DBCtrls,
  DBLookup;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
_T0 = procedure  of object;

_T1 = _T0;

_T2 = function : Boolean of object;

_T3 = _T0;

function __DC__GetTDBLookupCombo__Value(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDBLookupCombo(Instance).Value;
end;

procedure __DC__SetTDBLookupCombo__Value(Instance : TObject; Params : PVariantArgList);
begin
TDBLookupCombo(Instance).Value:=OleVariant(Params^[0]);
end;

function __DC__GetTDBLookupCombo__DisplayValue(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDBLookupCombo(Instance).DisplayValue;
end;

procedure __DC__SetTDBLookupCombo__DisplayValue(Instance : TObject; Params : PVariantArgList);
begin
TDBLookupCombo(Instance).DisplayValue:=OleVariant(Params^[0]);
end;

function __DC__GetTDBLookupList__Value(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDBLookupList(Instance).Value;
end;

procedure __DC__SetTDBLookupList__Value(Instance : TObject; Params : PVariantArgList);
begin
TDBLookupList(Instance).Value:=OleVariant(Params^[0]);
end;

function __DC__GetTDBLookupList__DisplayValue(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDBLookupList(Instance).DisplayValue;
end;

procedure __DC__SetTDBLookupList__DisplayValue(Instance : TObject; Params : PVariantArgList);
begin
TDBLookupList(Instance).DisplayValue:=OleVariant(Params^[0]);
end;

function __DC__GetTPopupGrid__RowCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPopupGrid(Instance).RowCount;
end;

procedure __DC__SetTPopupGrid__RowCount(Instance : TObject; Params : PVariantArgList);
begin
TPopupGrid(Instance).RowCount:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
RegisterProperty(TDBLookupCombo,'Value',__DC__GetTDBLookupCombo__Value,__DC__SetTDBLookupCombo__Value);
RegisterProperty(TDBLookupCombo,'DisplayValue',__DC__GetTDBLookupCombo__DisplayValue,__DC__SetTDBLookupCombo__DisplayValue);
RegisterProperty(TDBLookupList,'Value',__DC__GetTDBLookupList__Value,__DC__SetTDBLookupList__Value);
RegisterProperty(TDBLookupList,'DisplayValue',__DC__GetTDBLookupList__DisplayValue,__DC__SetTDBLookupList__DisplayValue);
RegisterProperty(TPopupGrid,'RowCount',__DC__GetTPopupGrid__RowCount,__DC__SetTPopupGrid__RowCount);
end;

const __ConstNames0 : array[0..4] of string = (
'csDropDown'
,'csDropDownList'
,'loColLines'
,'loRowLines'
,'loTitles'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,csDropDown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,csDropDownList));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,loColLines));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,loRowLines));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,loTitles));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..3] of TClass = (
TComboButton,
TDBLookupCombo,
TDBLookupList,
TPopupGrid
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
RegRegisterMethod(TDBLookupCombo,'DropDown',TypeInfo(_T0),NoParams, pointer(MinVMTOffset - 37));

RegRegisterMethod(TDBLookupCombo,'CloseUp',TypeInfo(_T1),NoParams, pointer(MinVMTOffset - 38));

RegRegisterMethod(TDBLookupList,'CanEdit',TypeInfo(_T2),[TypeInfo(Boolean)], pointer(172));

RegRegisterMethod(TDBLookupList,'ListClick',TypeInfo(_T3),NoParams, pointer(MinVMTOffset - 59));

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
