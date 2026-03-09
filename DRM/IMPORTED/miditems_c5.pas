{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit MIDITEMS_C5;
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
  Classes,
  HTTPApp,
  Db,
  DbClient,
  Midas,
  XMLBrokr,
  WebComp,
  PagItems,
  MidProd,
  MidItems;
function ConvertTGUIDToVariant(var R : TGUID) : OleVariant;
function ConvertVariantToTGUID(const V : OleVariant) : TGUID;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TGUID__Wrapper = class(TDCRecordWrapper)
private
fR : TGUID;
public
function GetRecordPtr : pointer; override;
published
procedure setD1(const val : LongWord);
function getD1 : LongWord;
property D1 : LongWord read getD1 write setD1;
procedure setD2(const val : Word);
function getD2 : Word;
property D2 : Word read getD2 write setD2;
procedure setD3(const val : Word);
function getD3 : Word;
property D3 : Word read getD3 write setD3;
end;
type __TXMLDataSet__ = class(TXMLDataSet);
type
_T0 = function (p0 : TDataSet;
const p1 : string;
const p2 : string;
var p3 : TStrings;
var p4 : TStrings): Boolean of object;

_T1 = procedure (var p0 : string;
const p1 : string;
p2 : Integer) of object;

_T2 = procedure (var p0 : string;
const p1 : string;
const p2 : string) of object;

_T3 = procedure (var p0 : string;
p1 : string) of object;

_T4 = procedure (var p0 : string;
const p1 : string;
p2 : Boolean) of object;

_T5 = _T2;

_T6 = function (p0 : TWebDataDisplay): string of object;

_T7 = function (p0 : TWebDataDisplay;
p1 : string): string of object;

{_T8 = procedure (p0 : Array of TWebButtonClass;
p1 : TWebComponentList) of object;}

{_T9 = function (p0 : TComponent;
p1 : TComponent;
p2 : TClass): Boolean of object;}

{_T10 = procedure (p0 : TComponent;
p1 : TXMLBroker;
p2 : IAddScriptElements) of object;}

_T11 = function (p0 : TComponent): TCustomWebDispatcher of object;

_T12 = function (p0 : TComponent): TCustomContentProducer of object;

{_T13 = procedure (p0 : IAddScriptElements) of object;}

_T14 = procedure (p0 : TComponent) of object;

_T15 = procedure  of object;

_T16 = _T15;

_T17 = function (p0 : TWebContentOptions): string of object;

_T18 = procedure (p0 : TStrings) of object;

_T19 = _T17;

{_T20 = procedure (p0 : IAddScriptElements) of object;}

_T21 = function : string of object;

_T22 = procedure (p0 : TLayout) of object;

_T23 = _T21;

_T24 = _T14;

_T25 = _T14;

_T26 = _T21;

_T27 = _T21;

_T28 = _T17;

_T29 = function (p0 : TWebContentOptions;
p1 : TLayout): string of object;

_T30 = _T21;

_T31 = function : TLayoutAttributes of object;

_T32 = function : TObject of object;

{_T33 = procedure (p0 : IAddScriptElements) of object;}

_T34 = _T29;

{_T35 = function (p0 : TComponent;
p1 : TClass): Boolean of object;}

_T36 = _T31;

_T37 = _T29;

_T38 = _T21;

_T39 = _T17;

_T40 = _T21;

_T41 = _T21;

_T42 = procedure (p0 : string) of object;

_T43 = _T17;

_T44 = _T21;

_T45 = _T31;

_T46 = function : Boolean of object;

_T47 = _T46;

_T48 = _T15;

_T49 = _T21;

_T50 = function (const p0 : string): string of object;

_T51 = procedure (p0 : TField) of object;

{_T52 = function (p0 : IMidasWebDataSet): TField of object;}

_T53 = _T21;

{_T54 = function (p0 : TComponent;
p1 : TClass): Boolean of object;}

_T55 = _T29;

{_T56 = procedure (p0 : IAddScriptElements) of object;}

_T57 = _T31;

{_T58 = procedure (p0 : IAddScriptElements) of object;}

_T59 = function (p0 : TStrings;
p1 : TStrings;
p2 : TWebContentOptions): string of object;

_T60 = procedure (var p0 : string) of object;

_T61 = function (p0 : TStrings;
p1 : TStrings): Integer of object;

_T62 = _T60;

_T63 = _T61;

_T64 = _T21;

_T65 = _T60;

_T66 = _T60;

_T67 = _T15;

_T68 = procedure (const p0 : TXMLBroker) of object;

_T69 = function : TXMLBroker of object;

_T70 = procedure (p0 : TComponent;
p1 : TOperation) of object;

_T71 = _T14;

_T72 = _T15;

_T73 = function (const p0 : IDispatch;
out p1): HResult of object;

_T74 = _T15;

_T75 = _T21;

_T76 = _T14;

_T77 = _T15;

_T78 = function : TComponent of object;

_T79 = _T15;

_T80 = _T70;

_T81 = _T14;

_T82 = procedure (p0 : TObject) of object;

_T83 = _T46;

_T84 = _T18;

_T85 = _T15;

_T86 = _T15;

_T87 = _T14;

function __TGUID__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TGUID__Wrapper.setD1(const val : LongWord);
begin
TGUID(GetRecordPtr^).D1 := val;
end;
function __TGUID__Wrapper.getD1 : LongWord;
begin
result := TGUID(GetRecordPtr^).D1;
end;
procedure __TGUID__Wrapper.setD2(const val : Word);
begin
TGUID(GetRecordPtr^).D2 := val;
end;
function __TGUID__Wrapper.getD2 : Word;
begin
result := TGUID(GetRecordPtr^).D2;
end;
procedure __TGUID__Wrapper.setD3(const val : Word);
begin
TGUID(GetRecordPtr^).D3 := val;
end;
function __TGUID__Wrapper.getD3 : Word;
begin
result := TGUID(GetRecordPtr^).D3;
end;
function __TXMLDataSet__QueryInterface__Wrapper(__Instance : TXMLDataSet;
const p0 : IDispatch;
out p1): HResult;
var
__p0 : ^TGUID;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := __TXMLDataSet__(__Instance).QueryInterface(__p0^,p1);
end;


type __TGUID__Wrapper__ = class(__TGUID__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TGUID__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTGUIDToVariant(var R : TGUID) : OleVariant;
var
__rw : __TGUID__Wrapper__;
begin
__rw := __TGUID__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTGUID(const V : OleVariant) : TGUID;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TGUID((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTCaptionAttributes__Parent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCaptionAttributes(Instance).Parent);
end;

function __DC__GetTCustomDataGrid__DisplayRows(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDataGrid(Instance).DisplayRows;
end;

procedure __DC__SetTCustomDataGrid__DisplayRows(Instance : TObject; Params : PVariantArgList);
begin
TCustomDataGrid(Instance).DisplayRows:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDataGrid__TableAttributes(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDataGrid(Instance).TableAttributes);
end;

procedure __DC__SetTCustomDataGrid__TableAttributes(Instance : TObject; Params : PVariantArgList);
begin
TCustomDataGrid(Instance).TableAttributes:=TGridAttributes(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDataGrid__HeadingAttributes(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDataGrid(Instance).HeadingAttributes);
end;

procedure __DC__SetTCustomDataGrid__HeadingAttributes(Instance : TObject; Params : PVariantArgList);
begin
TCustomDataGrid(Instance).HeadingAttributes:=TGridRowAttributes(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDataGrid__RowAttributes(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDataGrid(Instance).RowAttributes);
end;

procedure __DC__SetTCustomDataGrid__RowAttributes(Instance : TObject; Params : PVariantArgList);
begin
TCustomDataGrid(Instance).RowAttributes:=TGridRowAttributes(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDataNavigator__Custom(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDataNavigator(Instance).Custom;
end;

procedure __DC__SetTCustomDataNavigator__Custom(Instance : TObject; Params : PVariantArgList);
begin
TCustomDataNavigator(Instance).Custom:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDataNavigator__Style(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDataNavigator(Instance).Style;
end;

procedure __DC__SetTCustomDataNavigator__Style(Instance : TObject; Params : PVariantArgList);
begin
TCustomDataNavigator(Instance).Style:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDataNavigator__StyleRule(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDataNavigator(Instance).StyleRule;
end;

procedure __DC__SetTCustomDataNavigator__StyleRule(Instance : TObject; Params : PVariantArgList);
begin
TCustomDataNavigator(Instance).StyleRule:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomFieldGroup__Custom(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomFieldGroup(Instance).Custom;
end;

procedure __DC__SetTCustomFieldGroup__Custom(Instance : TObject; Params : PVariantArgList);
begin
TCustomFieldGroup(Instance).Custom:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomFieldGroup__Style(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomFieldGroup(Instance).Style;
end;

procedure __DC__SetTCustomFieldGroup__Style(Instance : TObject; Params : PVariantArgList);
begin
TCustomFieldGroup(Instance).Style:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomFieldGroup__StyleRule(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomFieldGroup(Instance).StyleRule;
end;

procedure __DC__SetTCustomFieldGroup__StyleRule(Instance : TObject; Params : PVariantArgList);
begin
TCustomFieldGroup(Instance).StyleRule:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomLayoutGroup__DisplayColumns(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomLayoutGroup(Instance).DisplayColumns;
end;

procedure __DC__SetTCustomLayoutGroup__DisplayColumns(Instance : TObject; Params : PVariantArgList);
begin
TCustomLayoutGroup(Instance).DisplayColumns:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomLayoutGroup__Style(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomLayoutGroup(Instance).Style;
end;

procedure __DC__SetTCustomLayoutGroup__Style(Instance : TObject; Params : PVariantArgList);
begin
TCustomLayoutGroup(Instance).Style:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomLayoutGroup__Custom(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomLayoutGroup(Instance).Custom;
end;

procedure __DC__SetTCustomLayoutGroup__Custom(Instance : TObject; Params : PVariantArgList);
begin
TCustomLayoutGroup(Instance).Custom:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomLayoutGroup__StyleRule(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomLayoutGroup(Instance).StyleRule;
end;

procedure __DC__SetTCustomLayoutGroup__StyleRule(Instance : TObject; Params : PVariantArgList);
begin
TCustomLayoutGroup(Instance).StyleRule:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomQueryButtons__Style(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomQueryButtons(Instance).Style;
end;

procedure __DC__SetTCustomQueryButtons__Style(Instance : TObject; Params : PVariantArgList);
begin
TCustomQueryButtons(Instance).Style:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomQueryButtons__Custom(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomQueryButtons(Instance).Custom;
end;

procedure __DC__SetTCustomQueryButtons__Custom(Instance : TObject; Params : PVariantArgList);
begin
TCustomQueryButtons(Instance).Custom:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomQueryButtons__StyleRule(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomQueryButtons(Instance).StyleRule;
end;

procedure __DC__SetTCustomQueryButtons__StyleRule(Instance : TObject; Params : PVariantArgList);
begin
TCustomQueryButtons(Instance).StyleRule:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomQueryForm__Action(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomQueryForm(Instance).Action;
end;

procedure __DC__SetTCustomQueryForm__Action(Instance : TObject; Params : PVariantArgList);
begin
TCustomQueryForm(Instance).Action:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomQueryForm__Method(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomQueryForm(Instance).Method;
end;

procedure __DC__SetTCustomQueryForm__Method(Instance : TObject; Params : PVariantArgList);
begin
TCustomQueryForm(Instance).Method:=OleVariant(Params^[0]);
end;

function __DC__GetTFormLayout__ColumnCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFormLayout(Instance).ColumnCount;
end;

procedure __DC__SetTFormLayout__ColumnCount(Instance : TObject; Params : PVariantArgList);
begin
TFormLayout(Instance).ColumnCount:=OleVariant(Params^[0]);
end;

function __DC__GetTFormLayout__BreakButtons(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFormLayout(Instance).BreakButtons;
end;

procedure __DC__SetTFormLayout__BreakButtons(Instance : TObject; Params : PVariantArgList);
begin
TFormLayout(Instance).BreakButtons:=OleVariant(Params^[0]);
end;

function __DC__GetTFormLayout__TableHeader(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFormLayout(Instance).TableHeader;
end;

procedure __DC__SetTFormLayout__TableHeader(Instance : TObject; Params : PVariantArgList);
begin
TFormLayout(Instance).TableHeader:=OleVariant(Params^[0]);
end;

function __DC__GetTGridAttributes__Parent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TGridAttributes(Instance).Parent);
end;

function __DC__GetTGridRowAttributes__Parent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TGridRowAttributes(Instance).Parent);
end;

function __DC__GetTWebButton__Caption(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebButton(Instance).Caption;
end;

procedure __DC__SetTWebButton__Caption(Instance : TObject; Params : PVariantArgList);
begin
TWebButton(Instance).Caption:=OleVariant(Params^[0]);
end;

function __DC__GetTWebButton__Style(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebButton(Instance).Style;
end;

procedure __DC__SetTWebButton__Style(Instance : TObject; Params : PVariantArgList);
begin
TWebButton(Instance).Style:=OleVariant(Params^[0]);
end;

function __DC__GetTWebButton__Custom(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebButton(Instance).Custom;
end;

procedure __DC__SetTWebButton__Custom(Instance : TObject; Params : PVariantArgList);
begin
TWebButton(Instance).Custom:=OleVariant(Params^[0]);
end;

function __DC__GetTWebButton__StyleRule(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebButton(Instance).StyleRule;
end;

procedure __DC__SetTWebButton__StyleRule(Instance : TObject; Params : PVariantArgList);
begin
TWebButton(Instance).StyleRule:=OleVariant(Params^[0]);
end;

function __DC__GetTWebControlGroup__WebFieldControls(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TWebControlGroup(Instance).WebFieldControls);
end;

function __DC__GetTWebDataDisplay__Caption(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebDataDisplay(Instance).Caption;
end;

procedure __DC__SetTWebDataDisplay__Caption(Instance : TObject; Params : PVariantArgList);
begin
TWebDataDisplay(Instance).Caption:=OleVariant(Params^[0]);
end;

function __DC__GetTWebDataDisplay__TabIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebDataDisplay(Instance).TabIndex;
end;

procedure __DC__SetTWebDataDisplay__TabIndex(Instance : TObject; Params : PVariantArgList);
begin
TWebDataDisplay(Instance).TabIndex:=OleVariant(Params^[0]);
end;

function __DC__GetTWebDataDisplay__Custom(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebDataDisplay(Instance).Custom;
end;

procedure __DC__SetTWebDataDisplay__Custom(Instance : TObject; Params : PVariantArgList);
begin
TWebDataDisplay(Instance).Custom:=OleVariant(Params^[0]);
end;

function __DC__GetTWebDataDisplay__Style(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebDataDisplay(Instance).Style;
end;

procedure __DC__SetTWebDataDisplay__Style(Instance : TObject; Params : PVariantArgList);
begin
TWebDataDisplay(Instance).Style:=OleVariant(Params^[0]);
end;

function __DC__GetTWebDataDisplay__StyleRule(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebDataDisplay(Instance).StyleRule;
end;

procedure __DC__SetTWebDataDisplay__StyleRule(Instance : TObject; Params : PVariantArgList);
begin
TWebDataDisplay(Instance).StyleRule:=OleVariant(Params^[0]);
end;

function __DC__GetTWebDataDisplay__CaptionAttributes(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TWebDataDisplay(Instance).CaptionAttributes);
end;

procedure __DC__SetTWebDataDisplay__CaptionAttributes(Instance : TObject; Params : PVariantArgList);
begin
TWebDataDisplay(Instance).CaptionAttributes:=TCaptionAttributes(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTWebDataInput__FieldName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebDataInput(Instance).FieldName;
end;

procedure __DC__SetTWebDataInput__FieldName(Instance : TObject; Params : PVariantArgList);
begin
TWebDataInput(Instance).FieldName:=OleVariant(Params^[0]);
end;

function __DC__GetTWebForm__WebComponents(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TWebForm(Instance).WebComponents);
end;

function __DC__GetTWebForm__Style(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebForm(Instance).Style;
end;

procedure __DC__SetTWebForm__Style(Instance : TObject; Params : PVariantArgList);
begin
TWebForm(Instance).Style:=OleVariant(Params^[0]);
end;

function __DC__GetTWebForm__Custom(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebForm(Instance).Custom;
end;

procedure __DC__SetTWebForm__Custom(Instance : TObject; Params : PVariantArgList);
begin
TWebForm(Instance).Custom:=OleVariant(Params^[0]);
end;

function __DC__GetTWebForm__StyleRule(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebForm(Instance).StyleRule;
end;

procedure __DC__SetTWebForm__StyleRule(Instance : TObject; Params : PVariantArgList);
begin
TWebForm(Instance).StyleRule:=OleVariant(Params^[0]);
end;

function __DC__GetTWebListInput__Values(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TWebListInput(Instance).Values);
end;

procedure __DC__SetTWebListInput__Values(Instance : TObject; Params : PVariantArgList);
begin
TWebListInput(Instance).Values:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTWebListInput__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TWebListInput(Instance).Items);
end;

procedure __DC__SetTWebListInput__Items(Instance : TObject; Params : PVariantArgList);
begin
TWebListInput(Instance).Items:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTWebListInput__DataSet(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TWebListInput(Instance).DataSet);
end;

procedure __DC__SetTWebListInput__DataSet(Instance : TObject; Params : PVariantArgList);
begin
TWebListInput(Instance).DataSet:=TDataSet(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTWebListInput__ValuesField(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebListInput(Instance).ValuesField;
end;

procedure __DC__SetTWebListInput__ValuesField(Instance : TObject; Params : PVariantArgList);
begin
TWebListInput(Instance).ValuesField:=OleVariant(Params^[0]);
end;

function __DC__GetTWebListInput__ItemsField(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebListInput(Instance).ItemsField;
end;

procedure __DC__SetTWebListInput__ItemsField(Instance : TObject; Params : PVariantArgList);
begin
TWebListInput(Instance).ItemsField:=OleVariant(Params^[0]);
end;

function __DC__GetTWebRadioGroupInput__ReadOnly(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebRadioGroupInput(Instance).ReadOnly;
end;

procedure __DC__SetTWebRadioGroupInput__ReadOnly(Instance : TObject; Params : PVariantArgList);
begin
TWebRadioGroupInput(Instance).ReadOnly:=OleVariant(Params^[0]);
end;

function __DC__GetTWebRadioGroupInput__DisplayWidth(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebRadioGroupInput(Instance).DisplayWidth;
end;

procedure __DC__SetTWebRadioGroupInput__DisplayWidth(Instance : TObject; Params : PVariantArgList);
begin
TWebRadioGroupInput(Instance).DisplayWidth:=OleVariant(Params^[0]);
end;

function __DC__GetTWebRadioGroupInput__DisplayColumns(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebRadioGroupInput(Instance).DisplayColumns;
end;

procedure __DC__SetTWebRadioGroupInput__DisplayColumns(Instance : TObject; Params : PVariantArgList);
begin
TWebRadioGroupInput(Instance).DisplayColumns:=OleVariant(Params^[0]);
end;

function __DC__GetTWebSelectOptionsInput__DisplayRows(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebSelectOptionsInput(Instance).DisplayRows;
end;

procedure __DC__SetTWebSelectOptionsInput__DisplayRows(Instance : TObject; Params : PVariantArgList);
begin
TWebSelectOptionsInput(Instance).DisplayRows:=OleVariant(Params^[0]);
end;

function __DC__GetTWebStatus__DisplayWidth(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebStatus(Instance).DisplayWidth;
end;

procedure __DC__SetTWebStatus__DisplayWidth(Instance : TObject; Params : PVariantArgList);
begin
TWebStatus(Instance).DisplayWidth:=OleVariant(Params^[0]);
end;

function __DC__GetTWebStatus__Caption(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebStatus(Instance).Caption;
end;

procedure __DC__SetTWebStatus__Caption(Instance : TObject; Params : PVariantArgList);
begin
TWebStatus(Instance).Caption:=OleVariant(Params^[0]);
end;

function __DC__GetTWebStatus__CaptionAttributes(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TWebStatus(Instance).CaptionAttributes);
end;

procedure __DC__SetTWebStatus__CaptionAttributes(Instance : TObject; Params : PVariantArgList);
begin
TWebStatus(Instance).CaptionAttributes:=TCaptionAttributes(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTWebStatus__CaptionPosition(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebStatus(Instance).CaptionPosition;
end;

procedure __DC__SetTWebStatus__CaptionPosition(Instance : TObject; Params : PVariantArgList);
begin
TWebStatus(Instance).CaptionPosition:=OleVariant(Params^[0]);
end;

function __DC__GetTWebTextAreaInput__ReadOnly(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebTextAreaInput(Instance).ReadOnly;
end;

procedure __DC__SetTWebTextAreaInput__ReadOnly(Instance : TObject; Params : PVariantArgList);
begin
TWebTextAreaInput(Instance).ReadOnly:=OleVariant(Params^[0]);
end;

function __DC__GetTWebTextAreaInput__Wrap(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebTextAreaInput(Instance).Wrap;
end;

procedure __DC__SetTWebTextAreaInput__Wrap(Instance : TObject; Params : PVariantArgList);
begin
TWebTextAreaInput(Instance).Wrap:=OleVariant(Params^[0]);
end;

function __DC__GetTWebTextAreaInput__DisplayWidth(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebTextAreaInput(Instance).DisplayWidth;
end;

procedure __DC__SetTWebTextAreaInput__DisplayWidth(Instance : TObject; Params : PVariantArgList);
begin
TWebTextAreaInput(Instance).DisplayWidth:=OleVariant(Params^[0]);
end;

function __DC__GetTWebTextAreaInput__DisplayRows(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebTextAreaInput(Instance).DisplayRows;
end;

procedure __DC__SetTWebTextAreaInput__DisplayRows(Instance : TObject; Params : PVariantArgList);
begin
TWebTextAreaInput(Instance).DisplayRows:=OleVariant(Params^[0]);
end;

function __DC__GetTWebTextInput__DisplayWidth(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebTextInput(Instance).DisplayWidth;
end;

procedure __DC__SetTWebTextInput__DisplayWidth(Instance : TObject; Params : PVariantArgList);
begin
TWebTextInput(Instance).DisplayWidth:=OleVariant(Params^[0]);
end;

function __DC__GetTWebTextInput__ReadOnly(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebTextInput(Instance).ReadOnly;
end;

procedure __DC__SetTWebTextInput__ReadOnly(Instance : TObject; Params : PVariantArgList);
begin
TWebTextInput(Instance).ReadOnly:=OleVariant(Params^[0]);
end;

function __DC__GetTWebTextInput__Style(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebTextInput(Instance).Style;
end;

procedure __DC__SetTWebTextInput__Style(Instance : TObject; Params : PVariantArgList);
begin
TWebTextInput(Instance).Style:=OleVariant(Params^[0]);
end;

function __DC__GetTWebTextInput__Custom(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebTextInput(Instance).Custom;
end;

procedure __DC__SetTWebTextInput__Custom(Instance : TObject; Params : PVariantArgList);
begin
TWebTextInput(Instance).Custom:=OleVariant(Params^[0]);
end;

function __DC__GetTWebTextInput__StyleRule(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWebTextInput(Instance).StyleRule;
end;

procedure __DC__SetTWebTextInput__StyleRule(Instance : TObject; Params : PVariantArgList);
begin
TWebTextInput(Instance).StyleRule:=OleVariant(Params^[0]);
end;

function __DC__GetTXMLButton__XMLBroker(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TXMLButton(Instance).XMLBroker);
end;

procedure __DC__SetTXMLButton__XMLBroker(Instance : TObject; Params : PVariantArgList);
begin
TXMLButton(Instance).XMLBroker:=TXMLBroker(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTXMLButton__XMLUseParent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TXMLButton(Instance).XMLUseParent;
end;

procedure __DC__SetTXMLButton__XMLUseParent(Instance : TObject; Params : PVariantArgList);
begin
TXMLButton(Instance).XMLUseParent:=OleVariant(Params^[0]);
end;

function __DC__GetTXMLData__Parent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TXMLData(Instance).Parent);
end;

function __DC__GetTXMLData__XMLBroker(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TXMLData(Instance).XMLBroker);
end;

procedure __DC__SetTXMLData__XMLBroker(Instance : TObject; Params : PVariantArgList);
begin
TXMLData(Instance).XMLBroker:=TXMLBroker(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTXMLDataSet__DataSetPath(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TXMLDataSet(Instance).DataSetPath);
end;

function __DC__GetTXMLDataSet__DataSetField(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TXMLDataSet(Instance).DataSetField;
end;

procedure __DC__SetTXMLDataSet__DataSetField(Instance : TObject; Params : PVariantArgList);
begin
TXMLDataSet(Instance).DataSetField:=OleVariant(Params^[0]);
end;

function __DC__GetTXMLDisplay__Parent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TXMLDisplay(Instance).Parent);
end;

function __DC__GetTXMLDisplay__DisplayComponent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TXMLDisplay(Instance).DisplayComponent);
end;

procedure __DC__SetTXMLDisplay__DisplayComponent(Instance : TObject; Params : PVariantArgList);
begin
TXMLDisplay(Instance).DisplayComponent:=TComponent(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTXMLDisplayGroup__VisibleFields(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TXMLDisplayGroup(Instance).VisibleFields);
end;

function __DC__GetTXMLDisplayReferenceButton__XMLComponent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TXMLDisplayReferenceButton(Instance).XMLComponent);
end;

procedure __DC__SetTXMLDisplayReferenceButton__XMLComponent(Instance : TObject; Params : PVariantArgList);
begin
TXMLDisplayReferenceButton(Instance).XMLComponent:=TComponent(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTXMLDisplayReferenceButton__XMLUseParent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TXMLDisplayReferenceButton(Instance).XMLUseParent;
end;

procedure __DC__SetTXMLDisplayReferenceButton__XMLUseParent(Instance : TObject; Params : PVariantArgList);
begin
TXMLDisplayReferenceButton(Instance).XMLUseParent:=OleVariant(Params^[0]);
end;

function __DC__GetTXMLDisplayReferenceGroup__XMLComponent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TXMLDisplayReferenceGroup(Instance).XMLComponent);
end;

procedure __DC__SetTXMLDisplayReferenceGroup__XMLComponent(Instance : TObject; Params : PVariantArgList);
begin
TXMLDisplayReferenceGroup(Instance).XMLComponent:=TComponent(VarToObject(OleVariant(Params^[0])));
end;

procedure __RegisterProps;
begin
RegisterProperty(TCaptionAttributes,'Parent',__DC__GetTCaptionAttributes__Parent,nil);
RegisterProperty(TCustomDataGrid,'DisplayRows',__DC__GetTCustomDataGrid__DisplayRows,__DC__SetTCustomDataGrid__DisplayRows);
RegisterProperty(TCustomDataGrid,'TableAttributes',__DC__GetTCustomDataGrid__TableAttributes,__DC__SetTCustomDataGrid__TableAttributes);
RegisterProperty(TCustomDataGrid,'HeadingAttributes',__DC__GetTCustomDataGrid__HeadingAttributes,__DC__SetTCustomDataGrid__HeadingAttributes);
RegisterProperty(TCustomDataGrid,'RowAttributes',__DC__GetTCustomDataGrid__RowAttributes,__DC__SetTCustomDataGrid__RowAttributes);
RegisterProperty(TCustomDataNavigator,'Custom',__DC__GetTCustomDataNavigator__Custom,__DC__SetTCustomDataNavigator__Custom);
RegisterProperty(TCustomDataNavigator,'Style',__DC__GetTCustomDataNavigator__Style,__DC__SetTCustomDataNavigator__Style);
RegisterProperty(TCustomDataNavigator,'StyleRule',__DC__GetTCustomDataNavigator__StyleRule,__DC__SetTCustomDataNavigator__StyleRule);
RegisterProperty(TCustomFieldGroup,'Custom',__DC__GetTCustomFieldGroup__Custom,__DC__SetTCustomFieldGroup__Custom);
RegisterProperty(TCustomFieldGroup,'Style',__DC__GetTCustomFieldGroup__Style,__DC__SetTCustomFieldGroup__Style);
RegisterProperty(TCustomFieldGroup,'StyleRule',__DC__GetTCustomFieldGroup__StyleRule,__DC__SetTCustomFieldGroup__StyleRule);
RegisterProperty(TCustomLayoutGroup,'DisplayColumns',__DC__GetTCustomLayoutGroup__DisplayColumns,__DC__SetTCustomLayoutGroup__DisplayColumns);
RegisterProperty(TCustomLayoutGroup,'Style',__DC__GetTCustomLayoutGroup__Style,__DC__SetTCustomLayoutGroup__Style);
RegisterProperty(TCustomLayoutGroup,'Custom',__DC__GetTCustomLayoutGroup__Custom,__DC__SetTCustomLayoutGroup__Custom);
RegisterProperty(TCustomLayoutGroup,'StyleRule',__DC__GetTCustomLayoutGroup__StyleRule,__DC__SetTCustomLayoutGroup__StyleRule);
RegisterProperty(TCustomQueryButtons,'Style',__DC__GetTCustomQueryButtons__Style,__DC__SetTCustomQueryButtons__Style);
RegisterProperty(TCustomQueryButtons,'Custom',__DC__GetTCustomQueryButtons__Custom,__DC__SetTCustomQueryButtons__Custom);
RegisterProperty(TCustomQueryButtons,'StyleRule',__DC__GetTCustomQueryButtons__StyleRule,__DC__SetTCustomQueryButtons__StyleRule);
RegisterProperty(TCustomQueryForm,'Action',__DC__GetTCustomQueryForm__Action,__DC__SetTCustomQueryForm__Action);
RegisterProperty(TCustomQueryForm,'Method',__DC__GetTCustomQueryForm__Method,__DC__SetTCustomQueryForm__Method);
RegisterProperty(TFormLayout,'ColumnCount',__DC__GetTFormLayout__ColumnCount,__DC__SetTFormLayout__ColumnCount);
RegisterProperty(TFormLayout,'BreakButtons',__DC__GetTFormLayout__BreakButtons,__DC__SetTFormLayout__BreakButtons);
RegisterProperty(TFormLayout,'TableHeader',__DC__GetTFormLayout__TableHeader,__DC__SetTFormLayout__TableHeader);
RegisterProperty(TGridAttributes,'Parent',__DC__GetTGridAttributes__Parent,nil);
RegisterProperty(TGridRowAttributes,'Parent',__DC__GetTGridRowAttributes__Parent,nil);
RegisterProperty(TWebButton,'Caption',__DC__GetTWebButton__Caption,__DC__SetTWebButton__Caption);
RegisterProperty(TWebButton,'Style',__DC__GetTWebButton__Style,__DC__SetTWebButton__Style);
RegisterProperty(TWebButton,'Custom',__DC__GetTWebButton__Custom,__DC__SetTWebButton__Custom);
RegisterProperty(TWebButton,'StyleRule',__DC__GetTWebButton__StyleRule,__DC__SetTWebButton__StyleRule);
RegisterProperty(TWebControlGroup,'WebFieldControls',__DC__GetTWebControlGroup__WebFieldControls,nil);
RegisterProperty(TWebDataDisplay,'Caption',__DC__GetTWebDataDisplay__Caption,__DC__SetTWebDataDisplay__Caption);
RegisterProperty(TWebDataDisplay,'TabIndex',__DC__GetTWebDataDisplay__TabIndex,__DC__SetTWebDataDisplay__TabIndex);
RegisterProperty(TWebDataDisplay,'Custom',__DC__GetTWebDataDisplay__Custom,__DC__SetTWebDataDisplay__Custom);
RegisterProperty(TWebDataDisplay,'Style',__DC__GetTWebDataDisplay__Style,__DC__SetTWebDataDisplay__Style);
RegisterProperty(TWebDataDisplay,'StyleRule',__DC__GetTWebDataDisplay__StyleRule,__DC__SetTWebDataDisplay__StyleRule);
RegisterProperty(TWebDataDisplay,'CaptionAttributes',__DC__GetTWebDataDisplay__CaptionAttributes,__DC__SetTWebDataDisplay__CaptionAttributes);
RegisterProperty(TWebDataInput,'FieldName',__DC__GetTWebDataInput__FieldName,__DC__SetTWebDataInput__FieldName);
RegisterProperty(TWebForm,'WebComponents',__DC__GetTWebForm__WebComponents,nil);
RegisterProperty(TWebForm,'Style',__DC__GetTWebForm__Style,__DC__SetTWebForm__Style);
RegisterProperty(TWebForm,'Custom',__DC__GetTWebForm__Custom,__DC__SetTWebForm__Custom);
RegisterProperty(TWebForm,'StyleRule',__DC__GetTWebForm__StyleRule,__DC__SetTWebForm__StyleRule);
RegisterProperty(TWebListInput,'Values',__DC__GetTWebListInput__Values,__DC__SetTWebListInput__Values);
RegisterProperty(TWebListInput,'Items',__DC__GetTWebListInput__Items,__DC__SetTWebListInput__Items);
RegisterProperty(TWebListInput,'DataSet',__DC__GetTWebListInput__DataSet,__DC__SetTWebListInput__DataSet);
RegisterProperty(TWebListInput,'ValuesField',__DC__GetTWebListInput__ValuesField,__DC__SetTWebListInput__ValuesField);
RegisterProperty(TWebListInput,'ItemsField',__DC__GetTWebListInput__ItemsField,__DC__SetTWebListInput__ItemsField);
RegisterProperty(TWebRadioGroupInput,'ReadOnly',__DC__GetTWebRadioGroupInput__ReadOnly,__DC__SetTWebRadioGroupInput__ReadOnly);
RegisterProperty(TWebRadioGroupInput,'DisplayWidth',__DC__GetTWebRadioGroupInput__DisplayWidth,__DC__SetTWebRadioGroupInput__DisplayWidth);
RegisterProperty(TWebRadioGroupInput,'DisplayColumns',__DC__GetTWebRadioGroupInput__DisplayColumns,__DC__SetTWebRadioGroupInput__DisplayColumns);
RegisterProperty(TWebSelectOptionsInput,'DisplayRows',__DC__GetTWebSelectOptionsInput__DisplayRows,__DC__SetTWebSelectOptionsInput__DisplayRows);
RegisterProperty(TWebStatus,'DisplayWidth',__DC__GetTWebStatus__DisplayWidth,__DC__SetTWebStatus__DisplayWidth);
RegisterProperty(TWebStatus,'Caption',__DC__GetTWebStatus__Caption,__DC__SetTWebStatus__Caption);
RegisterProperty(TWebStatus,'CaptionAttributes',__DC__GetTWebStatus__CaptionAttributes,__DC__SetTWebStatus__CaptionAttributes);
RegisterProperty(TWebStatus,'CaptionPosition',__DC__GetTWebStatus__CaptionPosition,__DC__SetTWebStatus__CaptionPosition);
RegisterProperty(TWebTextAreaInput,'ReadOnly',__DC__GetTWebTextAreaInput__ReadOnly,__DC__SetTWebTextAreaInput__ReadOnly);
RegisterProperty(TWebTextAreaInput,'Wrap',__DC__GetTWebTextAreaInput__Wrap,__DC__SetTWebTextAreaInput__Wrap);
RegisterProperty(TWebTextAreaInput,'DisplayWidth',__DC__GetTWebTextAreaInput__DisplayWidth,__DC__SetTWebTextAreaInput__DisplayWidth);
RegisterProperty(TWebTextAreaInput,'DisplayRows',__DC__GetTWebTextAreaInput__DisplayRows,__DC__SetTWebTextAreaInput__DisplayRows);
RegisterProperty(TWebTextInput,'DisplayWidth',__DC__GetTWebTextInput__DisplayWidth,__DC__SetTWebTextInput__DisplayWidth);
RegisterProperty(TWebTextInput,'ReadOnly',__DC__GetTWebTextInput__ReadOnly,__DC__SetTWebTextInput__ReadOnly);
RegisterProperty(TWebTextInput,'Style',__DC__GetTWebTextInput__Style,__DC__SetTWebTextInput__Style);
RegisterProperty(TWebTextInput,'Custom',__DC__GetTWebTextInput__Custom,__DC__SetTWebTextInput__Custom);
RegisterProperty(TWebTextInput,'StyleRule',__DC__GetTWebTextInput__StyleRule,__DC__SetTWebTextInput__StyleRule);
RegisterProperty(TXMLButton,'XMLBroker',__DC__GetTXMLButton__XMLBroker,__DC__SetTXMLButton__XMLBroker);
RegisterProperty(TXMLButton,'XMLUseParent',__DC__GetTXMLButton__XMLUseParent,__DC__SetTXMLButton__XMLUseParent);
RegisterProperty(TXMLData,'Parent',__DC__GetTXMLData__Parent,nil);
RegisterProperty(TXMLData,'XMLBroker',__DC__GetTXMLData__XMLBroker,__DC__SetTXMLData__XMLBroker);
RegisterProperty(TXMLDataSet,'DataSetPath',__DC__GetTXMLDataSet__DataSetPath,nil);
RegisterProperty(TXMLDataSet,'DataSetField',__DC__GetTXMLDataSet__DataSetField,__DC__SetTXMLDataSet__DataSetField);
RegisterProperty(TXMLDisplay,'Parent',__DC__GetTXMLDisplay__Parent,nil);
RegisterProperty(TXMLDisplay,'DisplayComponent',__DC__GetTXMLDisplay__DisplayComponent,__DC__SetTXMLDisplay__DisplayComponent);
RegisterProperty(TXMLDisplayGroup,'VisibleFields',__DC__GetTXMLDisplayGroup__VisibleFields,nil);
RegisterProperty(TXMLDisplayReferenceButton,'XMLComponent',__DC__GetTXMLDisplayReferenceButton__XMLComponent,__DC__SetTXMLDisplayReferenceButton__XMLComponent);
RegisterProperty(TXMLDisplayReferenceButton,'XMLUseParent',__DC__GetTXMLDisplayReferenceButton__XMLUseParent,__DC__SetTXMLDisplayReferenceButton__XMLUseParent);
RegisterProperty(TXMLDisplayReferenceGroup,'XMLComponent',__DC__GetTXMLDisplayReferenceGroup__XMLComponent,__DC__SetTXMLDisplayReferenceGroup__XMLComponent);
end;

const __ConstNames0 : array[0..11] of string = (
'fmPost'
,'fmGet'
,'capLeft'
,'capRight'
,'capAbove'
,'capBelow'
,'wrOff'
,'wrPhysical'
,'wrVirtual'
,'lsUnknown'
,'lsFields'
,'lsButtons'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,fmPost));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,fmGet));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,capLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,capRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,capAbove));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,capBelow));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,wrOff));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,wrPhysical));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,wrVirtual));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,lsUnknown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,lsFields));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,lsButtons));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..66] of TClass = (
TApplyUpdatesButton,
TCaptionAttributes,
TCustomDataGrid,
TCustomDataNavigator,
TCustomFieldGroup,
TCustomLayoutGroup,
TCustomQueryButtons,
TCustomQueryForm,
TDataForm,
TDataGrid,
TDataNavigator,
TDataSetButton,
TDeleteButton,
TFieldGroup,
TFieldRadioGroup,
TFieldSelectOptions,
TFieldStatus,
TFieldText,
TFieldTextArea,
TFirstButton,
TFormLayout,
TGridAttributes,
TGridRowAttributes,
TInsertButton,
TLastButton,
TLayoutGroup,
TNextButton,
TNextPageButton,
TPostButton,
TPriorButton,
TPriorPageButton,
TQueryButton,
TQueryButtons,
TQueryFieldGroup,
TQueryForm,
TQueryRadioGroup,
TQuerySelectOptions,
TQueryText,
TQueryTextArea,
TResetQueryButton,
TSelectOptionsColumn,
TStatusColumn,
TSubmitQueryButton,
TTextAreaColumn,
TTextColumn,
TUndoButton,
TWebButton,
TWebControlGroup,
TWebDataDisplay,
TWebDataInput,
TWebForm,
TWebListInput,
TWebRadioGroupInput,
TWebSelectOptionsInput,
TWebStatus,
TWebTextAreaInput,
TWebTextInput,
TXMLButton,
TXMLData,
TXMLDataParent,
TXMLDataSet,
TXMLDataSetParent,
TXMLDisplay,
TXMLDisplayGroup,
TXMLDisplayParent,
TXMLDisplayReferenceButton,
TXMLDisplayReferenceGroup
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..9] of string = (
'GetItemValuesFromDataSet'
,'AddIntAttrib'
,'AddStringAttrib'
,'AddCustomAttrib'
,'AddBoolAttrib'
,'AddQuotedAttrib'
,'FormatColumnHeading'
,'FormatColumnData'
,'FindDispatcher'
,'FindProducer'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T0),[
TypeInfo(TDataSet),
TypeInfo(string),
TypeInfo(string),
TypeInfo(TStrings),
TypeInfo(TStrings),TypeInfo(Boolean)],Addr(GetItemValuesFromDataSet),cRegister);

RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T1),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Integer)],Addr(AddIntAttrib),cRegister);

RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T2),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(string)],Addr(AddStringAttrib),cRegister);

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T3),[
TypeInfo(string),
TypeInfo(string)],Addr(AddCustomAttrib),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T4),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Boolean)],Addr(AddBoolAttrib),cRegister);

RegisterProc(nil,MethodNames[5],mtProc,TypeInfo(_T5),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(string)],Addr(AddQuotedAttrib),cRegister);

RegisterProc(nil,MethodNames[6],mtProc,TypeInfo(_T6),[
TypeInfo(TWebDataDisplay),TypeInfo(string)],Addr(FormatColumnHeading),cRegister);

RegisterProc(nil,MethodNames[7],mtProc,TypeInfo(_T7),[
TypeInfo(TWebDataDisplay),
TypeInfo(string),TypeInfo(string)],Addr(FormatColumnData),cRegister);

RegisterProc(nil,MethodNames[8],mtProc,TypeInfo(_T11),[
TypeInfo(TComponent),TypeInfo(TCustomWebDispatcher)],Addr(FindDispatcher),cRegister);

RegisterProc(nil,MethodNames[9],mtProc,TypeInfo(_T12),[
TypeInfo(TComponent),TypeInfo(TCustomContentProducer)],Addr(FindProducer),cRegister);

RegisterProc(TCaptionAttributes,'Create',mtConstructor,TypeInfo(_T14),[
TypeInfo(TComponent)],Addr(TCaptionAttributes.Create),cRegister);

RegRegisterMethod(TCustomDataNavigator,'GetDefaultButtons',TypeInfo(_T15),NoParams, pointer(68));

RegRegisterMethod(TCustomQueryButtons,'GetDefaultButtons',TypeInfo(_T16),NoParams, pointer(68));

RegRegisterMethod(TCustomQueryForm,'GetHTMLFormTag',TypeInfo(_T17),[
TypeInfo(TWebContentOptions),TypeInfo(string)], pointer(64));

RegRegisterMethod(TCustomQueryForm,'AssignStrings',TypeInfo(_T18),[
TypeInfo(TStrings)],Addr(TCustomQueryForm.AssignStrings));

RegRegisterMethod(TDataForm,'GetHTMLFormTag',TypeInfo(_T19),[
TypeInfo(TWebContentOptions),TypeInfo(string)], pointer(64));

RegRegisterMethod(TDataSetButton,'GetMethodName',TypeInfo(_T21),[TypeInfo(string)], pointer(64));

RegisterProc(TFormLayout,'Create',mtConstructor,TypeInfo(_T22),[
TypeInfo(TLayout)],Addr(TFormLayout.Create),cRegister);

RegRegisterMethod(TFormLayout,'EndLayout',TypeInfo(_T23),[TypeInfo(string)],Addr(TFormLayout.EndLayout));

RegisterProc(TGridAttributes,'Create',mtConstructor,TypeInfo(_T24),[
TypeInfo(TComponent)],Addr(TGridAttributes.Create),cRegister);

RegisterProc(TGridRowAttributes,'Create',mtConstructor,TypeInfo(_T25),[
TypeInfo(TComponent)],Addr(TGridRowAttributes.Create),cRegister);

RegRegisterMethod(TQueryButton,'GetInputType',TypeInfo(_T26),[TypeInfo(string)], pointer(60));

RegRegisterMethod(TQueryButton,'GetHTMLControlName',TypeInfo(_T27),[TypeInfo(string)], pointer(64));

RegRegisterMethod(TQueryButton,'EventContent',TypeInfo(_T28),[
TypeInfo(TWebContentOptions),TypeInfo(string)], pointer(68));

RegRegisterMethod(TWebButton,'ImplContent',TypeInfo(_T29),[
TypeInfo(TWebContentOptions),
TypeInfo(TLayout),TypeInfo(string)], pointer(48));

RegRegisterMethod(TWebButton,'GetCaption',TypeInfo(_T30),[TypeInfo(string)], pointer(52));

RegRegisterMethod(TWebButton,'GetLayoutAttributes',TypeInfo(_T31),[TypeInfo(TLayoutAttributes)], pointer(56));

RegRegisterMethod(TWebControlGroup,'ImplGetSubComponents',TypeInfo(_T32),[TypeInfo(TObject)], pointer(48));

RegRegisterMethod(TWebControlGroup,'ImplContent',TypeInfo(_T34),[
TypeInfo(TWebContentOptions),
TypeInfo(TLayout),TypeInfo(string)], pointer(56));

RegRegisterMethod(TWebControlGroup,'GetLayoutAttributes',TypeInfo(_T36),[TypeInfo(TLayoutAttributes)], pointer(64));

RegRegisterMethod(TWebDataDisplay,'ImplContent',TypeInfo(_T37),[
TypeInfo(TWebContentOptions),
TypeInfo(TLayout),TypeInfo(string)], pointer(48));

RegRegisterMethod(TWebDataDisplay,'ImplGetHTMLControlName',TypeInfo(_T38),[TypeInfo(string)], pointer(52));

RegRegisterMethod(TWebDataDisplay,'ControlContent',TypeInfo(_T39),[
TypeInfo(TWebContentOptions),TypeInfo(string)], pointer(56));

RegRegisterMethod(TWebDataDisplay,'LabelContent',TypeInfo(_T40),[TypeInfo(string)], pointer(60));

RegRegisterMethod(TWebDataDisplay,'GetCaption',TypeInfo(_T41),[TypeInfo(string)], pointer(64));

RegRegisterMethod(TWebDataDisplay,'SetCaption',TypeInfo(_T42),[
TypeInfo(string)], pointer(68));

RegRegisterMethod(TWebDataDisplay,'EventContent',TypeInfo(_T43),[
TypeInfo(TWebContentOptions),TypeInfo(string)], pointer(72));

RegRegisterMethod(TWebDataDisplay,'FormatCaption',TypeInfo(_T44),[TypeInfo(string)], pointer(76));

RegRegisterMethod(TWebDataDisplay,'GetLayoutAttributes',TypeInfo(_T45),[TypeInfo(TLayoutAttributes)], pointer(80));

RegisterProc(TWebDataDisplay,'IsColumn',mtClassMethod,TypeInfo(_T46),[TypeInfo(Boolean)], pointer(84),cRegister);

RegisterProc(TWebDataDisplay,'IsQueryField',mtClassMethod,TypeInfo(_T47),[TypeInfo(Boolean)], pointer(88),cRegister);

RegRegisterMethod(TWebDataInput,'ImplRestoreDefaults',TypeInfo(_T48),NoParams, pointer(92));

RegRegisterMethod(TWebDataInput,'ImplGetFieldName',TypeInfo(_T49),[TypeInfo(string)], pointer(96));

RegRegisterMethod(TWebDataInput,'ImplGetRowSetFieldAttributes',TypeInfo(_T50),[
TypeInfo(string),TypeInfo(string)], pointer(100));

RegRegisterMethod(TWebDataInput,'RestoreFieldDefaults',TypeInfo(_T51),[
TypeInfo(TField)], pointer(104));

RegRegisterMethod(TWebDataInput,'GetParamName',TypeInfo(_T53),[TypeInfo(string)], pointer(112));

RegRegisterMethod(TWebForm,'ImplContent',TypeInfo(_T55),[
TypeInfo(TWebContentOptions),
TypeInfo(TLayout),TypeInfo(string)], pointer(52));

RegRegisterMethod(TWebForm,'GetLayoutAttributes',TypeInfo(_T57),[TypeInfo(TLayoutAttributes)], pointer(60));

RegRegisterMethod(TWebListInput,'FormatInputs',TypeInfo(_T59),[
TypeInfo(TStrings),
TypeInfo(TStrings),
TypeInfo(TWebContentOptions),TypeInfo(string)], pointer(120));

RegRegisterMethod(TWebRadioGroupInput,'AddAttributes',TypeInfo(_T60),[
TypeInfo(string)], pointer(124));

RegRegisterMethod(TWebRadioGroupInput,'GetCheckIndex',TypeInfo(_T61),[
TypeInfo(TStrings),
TypeInfo(TStrings),TypeInfo(Integer)], pointer(128));

RegRegisterMethod(TWebSelectOptionsInput,'AddAttributes',TypeInfo(_T62),[
TypeInfo(string)], pointer(124));

RegRegisterMethod(TWebSelectOptionsInput,'GetSelectIndex',TypeInfo(_T63),[
TypeInfo(TStrings),
TypeInfo(TStrings),TypeInfo(Integer)], pointer(128));

RegisterProc(TWebStatus,'Identifier',mtClassMethod,TypeInfo(_T64),[TypeInfo(string)],Addr(TWebStatus.Identifier),cRegister);

RegRegisterMethod(TWebTextAreaInput,'AddAttributes',TypeInfo(_T65),[
TypeInfo(string)], pointer(116));

RegRegisterMethod(TWebTextInput,'AddAttributes',TypeInfo(_T66),[
TypeInfo(string)], pointer(116));

RegRegisterMethod(TXMLData,'ChangedXMLBroker',TypeInfo(_T67),NoParams, pointer(0));

RegRegisterMethod(TXMLData,'SetXMLBroker',TypeInfo(_T68),[
TypeInfo(TXMLBroker)], pointer(4));

RegRegisterMethod(TXMLData,'GetXMLBroker',TypeInfo(_T69),[TypeInfo(TXMLBroker)], pointer(8));

RegRegisterMethod(TXMLData,'Notification',TypeInfo(_T70),[
TypeInfo(TComponent),
TypeInfo(TOperation)], pointer(12));

RegisterProc(TXMLData,'Create',mtConstructor,TypeInfo(_T71),[
TypeInfo(TComponent)],Addr(TXMLData.Create),cRegister);

RegRegisterMethod(TXMLDataParent,'ChangedUseParent',TypeInfo(_T72),NoParams, pointer(16));

RegisterProc(TXMLDataSet,'QueryInterface',mtMethod,TypeInfo(_T73),[
TypeInfo(IDispatch),
TypeInfoUntyped,TypeInfo(HResult)], pointer(16),cRegister);

RegRegisterMethod(TXMLDataSet,'ChangedDataSetField',TypeInfo(_T74),NoParams, pointer(20));

RegRegisterMethod(TXMLDataSet,'GetDataSetField',TypeInfo(_T75),[TypeInfo(string)], pointer(24));

RegisterProc(TXMLDataSet,'Create',mtConstructor,TypeInfo(_T76),[
TypeInfo(TComponent)],Addr(TXMLDataSet.Create),cRegister);

RegRegisterMethod(TXMLDataSetParent,'ChangedUseParent',TypeInfo(_T77),NoParams, pointer(28));

RegRegisterMethod(TXMLDisplay,'GetDisplayComponent',TypeInfo(_T78),[TypeInfo(TComponent)], pointer(0));

RegRegisterMethod(TXMLDisplay,'ChangedDisplayComponent',TypeInfo(_T79),NoParams, pointer(4));

RegRegisterMethod(TXMLDisplay,'Notification',TypeInfo(_T80),[
TypeInfo(TComponent),
TypeInfo(TOperation)], pointer(8));

RegisterProc(TXMLDisplay,'Create',mtConstructor,TypeInfo(_T81),[
TypeInfo(TComponent)],Addr(TXMLDisplay.Create),cRegister);

RegRegisterMethod(TXMLDisplayGroup,'XMLDataChange',TypeInfo(_T82),[
TypeInfo(TObject)], pointer(68));

RegRegisterMethod(TXMLDisplayGroup,'ImplIsMultipleRecordView',TypeInfo(_T83),[TypeInfo(Boolean)], pointer(72));

RegRegisterMethod(TXMLDisplayGroup,'GetFieldsList',TypeInfo(_T84),[
TypeInfo(TStrings)], pointer(76));

RegRegisterMethod(TXMLDisplayGroup,'CreateDefaultFields',TypeInfo(_T85),NoParams, pointer(80));

RegRegisterMethod(TXMLDisplayParent,'ChangedUseParent',TypeInfo(_T86),NoParams, pointer(12));

RegisterProc(TXMLDisplayParent,'Create',mtConstructor,TypeInfo(_T87),[
TypeInfo(TComponent)],Addr(TXMLDisplayParent.Create),cRegister);

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'CreateDefaultButtonClasses',mtProc,TypeInfo(_T8),[
ArrayInfo(TypeInfo(TWebButtonClass)),
TypeInfo(TWebComponentList)],Addr(CreateDefaultButtonClasses),cRegister)}

{RegisterProc(nil,'CanAddClassHelper',mtProc,TypeInfo(_T9),[
TypeInfo(TComponent),
TypeInfo(TComponent),
TypeInfo(TClass),TypeInfo(Boolean)],Addr(CanAddClassHelper),cRegister)}

{RegisterProc(nil,'DeclareSubmitForm',mtProc,TypeInfo(_T10),[
TypeInfo(TComponent),
TypeInfo(TXMLBroker),
TypeInfo(IAddScriptElements)],Addr(DeclareSubmitForm),cRegister)}

{RegRegisterMethod(TApplyUpdatesButton,'ImplAddElements',TypeInfo(_T13),[
TypeInfo(IAddScriptElements)], pointer(60))}

{RegRegisterMethod(TDataSetButton,'ImplAddElements',TypeInfo(_T20),[
TypeInfo(IAddScriptElements)], pointer(60))}

{RegRegisterMethod(TWebControlGroup,'ImplAddElements',TypeInfo(_T33),[
TypeInfo(IAddScriptElements)], pointer(52))}

{RegRegisterMethod(TWebControlGroup,'ImplCanAddClass',TypeInfo(_T35),[
TypeInfo(TComponent),
TypeInfo(TClass),TypeInfo(Boolean)], pointer(60))}

{RegRegisterMethod(TWebDataInput,'FindAssociatedField',TypeInfo(_T52),[
TypeInfo(IMidasWebDataSet),TypeInfo(TField)], pointer(108))}

{RegRegisterMethod(TWebForm,'ImplCanAddClass',TypeInfo(_T54),[
TypeInfo(TComponent),
TypeInfo(TClass),TypeInfo(Boolean)], pointer(48))}

{RegRegisterMethod(TWebForm,'ImplAddElements',TypeInfo(_T56),[
TypeInfo(IAddScriptElements)], pointer(56))}

{RegRegisterMethod(TWebListInput,'ImplAddElements',TypeInfo(_T58),[
TypeInfo(IAddScriptElements)], pointer(116))}

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
