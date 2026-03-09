{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit DBGRIDS_D6;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  Types,
  activex,
  dcscript,
  dcsystem,
  dcdreamlib,
  Variants,
  Windows,
  SysUtils,
  Messages,
  Classes,
  Controls,
  Forms,
  StdCtrls,
  Graphics,
  Grids,
  DBCtrls,
  Db,
  Menus,
  ImgList,
  DBGrids;
function ConvertTRectToVariant(var R : TRect) : OleVariant;
function ConvertVariantToTRect(const V : OleVariant) : TRect;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TRect__Wrapper = class(TDCRecordWrapper)
private
fR : TRect;
public
function GetRecordPtr : pointer; override;
published
procedure setLeft(const val : Longint);
function getLeft : Longint;
property Left : Longint read getLeft write setLeft;
procedure setTop(const val : Longint);
function getTop : Longint;
property Top : Longint read getTop write setTop;
procedure setRight(const val : Longint);
function getRight : Longint;
property Right : Longint read getRight write setRight;
procedure setBottom(const val : Longint);
function getBottom : Longint;
property Bottom : Longint read getBottom write setBottom;
end;
type __TCustomDBGrid__ = class(TCustomDBGrid);
type
_T0 = procedure (p0 : TCustomDBGrid) of object;

_T1 = procedure  of object;

_T2 = _T1;

_T3 = function (const p0 : TBookmarkStr;
var p1 : Integer): Boolean of object;

_T4 = function (const p0 : TBookmarkStr): Integer of object;

_T5 = function : Boolean of object;

_T6 = procedure (p0 : TAlignment) of object;

_T7 = procedure (p0 : TField) of object;

_T8 = procedure (p0 : TImeMode) of object;

_T9 = procedure (p0 : TImeName) of object;

_T10 = procedure (p0 : Boolean) of object;

_T11 = procedure (p0 : Integer) of object;

_T12 = function : TColumnTitle of object;

_T13 = function : TAlignment of object;

_T14 = function : TColor of object;

_T15 = function : TFont of object;

_T16 = function : TImeMode of object;

_T17 = function : TImeName of object;

_T18 = _T5;

_T19 = function : Integer of object;

_T20 = _T19;

_T21 = _T1;

_T22 = procedure (const p0 : string) of object;

_T23 = procedure (p0 : TColumn) of object;

_T24 = _T13;

_T25 = _T14;

_T26 = _T15;

_T27 = function : string of object;

_T28 = _T1;

_T29 = _T23;

_T30 = _T1;

_T31 = _T1;

_T32 = function : TDBGridColumns of object;

_T33 = function : TGridDataLink of object;

_T34 = _T1;

_T35 = procedure (const p0 : IDispatch;
p1 : TField;
p2 : TGridDrawState) of object;

_T36 = procedure (const p0 : IDispatch;
p1 : Integer;
p2 : TColumn;
p3 : TGridDrawState) of object;

_T37 = _T1;

_T38 = function (p0 : Integer;
p1 : Integer;
const p2 : string;
p3 : TGridDrawState): Boolean of object;

_T39 = _T1;

_T40 = _T10;

_T41 = _T11;

_T42 = _T1;

_T43 = _T23;

_T44 = _T35;

_T45 = _T36;

_T46 = procedure (p0 : TColumn;
p1 : Integer) of object;

_T47 = function (p0 : Integer): Boolean of object;

{_T48 = procedure (p0 : TCustomDBGrid;
p1 : TColumnClass) of object;}

_T49 = function : TColumn of object;

_T50 = _T22;

_T51 = procedure (p0 : TStream) of object;

_T52 = _T1;

_T53 = _T1;

_T54 = _T22;

_T55 = _T51;

_T56 = _T47;

_T57 = _T0;

_T58 = function (const p0 : string): Boolean of object;

_T59 = _T1;

_T60 = _T1;

_T61 = _T1;

function __TRect__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TRect__Wrapper.setLeft(const val : Longint);
begin
TRect(GetRecordPtr^).Left := val;
end;
function __TRect__Wrapper.getLeft : Longint;
begin
result := TRect(GetRecordPtr^).Left;
end;
procedure __TRect__Wrapper.setTop(const val : Longint);
begin
TRect(GetRecordPtr^).Top := val;
end;
function __TRect__Wrapper.getTop : Longint;
begin
result := TRect(GetRecordPtr^).Top;
end;
procedure __TRect__Wrapper.setRight(const val : Longint);
begin
TRect(GetRecordPtr^).Right := val;
end;
function __TRect__Wrapper.getRight : Longint;
begin
result := TRect(GetRecordPtr^).Right;
end;
procedure __TRect__Wrapper.setBottom(const val : Longint);
begin
TRect(GetRecordPtr^).Bottom := val;
end;
function __TRect__Wrapper.getBottom : Longint;
begin
result := TRect(GetRecordPtr^).Bottom;
end;
procedure __TCustomDBGrid__DrawDataCell__Wrapper(__Instance : TCustomDBGrid;
const p0 : IDispatch;
p1 : TField;
p2 : TGridDrawState);
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
__TCustomDBGrid__(__Instance).DrawDataCell(__p0^,p1,p2);
end;

procedure __TCustomDBGrid__DrawColumnCell__Wrapper(__Instance : TCustomDBGrid;
const p0 : IDispatch;
p1 : Integer;
p2 : TColumn;
p3 : TGridDrawState);
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
__TCustomDBGrid__(__Instance).DrawColumnCell(__p0^,p1,p2,p3);
end;

procedure __TCustomDBGrid__DefaultDrawDataCell__Wrapper(__Instance : TCustomDBGrid;
const p0 : IDispatch;
p1 : TField;
p2 : TGridDrawState);
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TCustomDBGrid(__Instance).DefaultDrawDataCell(__p0^,p1,p2);
end;

procedure __TCustomDBGrid__DefaultDrawColumnCell__Wrapper(__Instance : TCustomDBGrid;
const p0 : IDispatch;
p1 : Integer;
p2 : TColumn;
p3 : TGridDrawState);
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TCustomDBGrid(__Instance).DefaultDrawColumnCell(__p0^,p1,p2,p3);
end;

procedure __TCustomDBGrid__ShowPopupEditor__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
1:
begin
TCustomDBGrid(__Instance).ShowPopupEditor(TColumn(VarToObject(OleVariant(pargs^[0]))));
end;
2:
begin
TCustomDBGrid(__Instance).ShowPopupEditor(TColumn(VarToObject(OleVariant(pargs^[1]))),OleVariant(pargs^[0]));
end;
end
end;


type __TRect__Wrapper__ = class(__TRect__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TRect__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTRectToVariant(var R : TRect) : OleVariant;
var
__rw : __TRect__Wrapper__;
begin
__rw := __TRect__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTRect(const V : OleVariant) : TRect;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TRect((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTBookmarkList__Count(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBookmarkList(Instance).Count;
end;

function __DC__GetTBookmarkList__CurrentRowSelected(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBookmarkList(Instance).CurrentRowSelected;
end;

procedure __DC__SetTBookmarkList__CurrentRowSelected(Instance : TObject; Params : PVariantArgList);
begin
TBookmarkList(Instance).CurrentRowSelected:=OleVariant(Params^[0]);
end;

function __DC__GetTBookmarkList__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBookmarkList(Instance).Items[OleVariant(Params^[0])];
end;

function __DC__GetTColumn__Grid(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TColumn(Instance).Grid);
end;

function __DC__GetTColumn__AssignedValues(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TColumnValues;
begin
tmp := TColumn(Instance).AssignedValues;
result := VarFromSet(tmp, sizeof(tmp));
end;

function __DC__GetTColumn__Expandable(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TColumn(Instance).Expandable;
end;

function __DC__GetTColumn__Field(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TColumn(Instance).Field);
end;

procedure __DC__SetTColumn__Field(Instance : TObject; Params : PVariantArgList);
begin
TColumn(Instance).Field:=TField(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTColumn__ParentColumn(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TColumn(Instance).ParentColumn);
end;

function __DC__GetTColumn__Showing(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TColumn(Instance).Showing;
end;

function __DC__GetTColumnTitle__Column(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TColumnTitle(Instance).Column);
end;

function __DC__GetTCustomDBGrid__EditorMode(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDBGrid(Instance).EditorMode;
end;

procedure __DC__SetTCustomDBGrid__EditorMode(Instance : TObject; Params : PVariantArgList);
begin
TCustomDBGrid(Instance).EditorMode:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDBGrid__FieldCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDBGrid(Instance).FieldCount;
end;

function __DC__GetTCustomDBGrid__Fields(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDBGrid(Instance).Fields[OleVariant(Params^[0])]);
end;

function __DC__GetTCustomDBGrid__SelectedField(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDBGrid(Instance).SelectedField);
end;

procedure __DC__SetTCustomDBGrid__SelectedField(Instance : TObject; Params : PVariantArgList);
begin
TCustomDBGrid(Instance).SelectedField:=TField(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDBGrid__SelectedIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDBGrid(Instance).SelectedIndex;
end;

procedure __DC__SetTCustomDBGrid__SelectedIndex(Instance : TObject; Params : PVariantArgList);
begin
TCustomDBGrid(Instance).SelectedIndex:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDBGrid__DataSource(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDBGrid(Instance).DataSource);
end;

procedure __DC__SetTCustomDBGrid__DataSource(Instance : TObject; Params : PVariantArgList);
begin
TCustomDBGrid(Instance).DataSource:=TDataSource(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTDBGrid__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDBGrid(Instance).Canvas);
end;

function __DC__GetTDBGrid__SelectedRows(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDBGrid(Instance).SelectedRows);
end;

function __DC__GetTDBGridColumns__State(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDBGridColumns(Instance).State;
end;

procedure __DC__SetTDBGridColumns__State(Instance : TObject; Params : PVariantArgList);
begin
TDBGridColumns(Instance).State:=OleVariant(Params^[0]);
end;

function __DC__GetTDBGridColumns__Grid(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDBGridColumns(Instance).Grid);
end;

function __DC__GetTDBGridColumns__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDBGridColumns(Instance).Items[OleVariant(Params^[0])]);
end;

procedure __DC__SetTDBGridColumns__Items(Instance : TObject; Params : PVariantArgList);
begin
TDBGridColumns(Instance).Items[OleVariant(Params^[1])]:=TColumn(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTGridDataLink__DefaultFields(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TGridDataLink(Instance).DefaultFields;
end;

function __DC__GetTGridDataLink__FieldCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TGridDataLink(Instance).FieldCount;
end;

function __DC__GetTGridDataLink__Fields(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TGridDataLink(Instance).Fields[OleVariant(Params^[0])]);
end;

function __DC__GetTGridDataLink__SparseMap(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TGridDataLink(Instance).SparseMap;
end;

procedure __DC__SetTGridDataLink__SparseMap(Instance : TObject; Params : PVariantArgList);
begin
TGridDataLink(Instance).SparseMap:=OleVariant(Params^[0]);
end;

function __DC__GetTGridDataLink__Grid(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TGridDataLink(Instance).Grid);
end;

procedure __RegisterProps;
begin
RegisterProperty(TBookmarkList,'Count',__DC__GetTBookmarkList__Count,nil);
RegisterProperty(TBookmarkList,'CurrentRowSelected',__DC__GetTBookmarkList__CurrentRowSelected,__DC__SetTBookmarkList__CurrentRowSelected);
RegisterIndexedProperty(TBookmarkList,'Items',1,True,__DC__GetTBookmarkList__Items,nil);
RegisterProperty(TColumn,'Grid',__DC__GetTColumn__Grid,nil);
RegisterProperty(TColumn,'AssignedValues',__DC__GetTColumn__AssignedValues,nil);
RegisterProperty(TColumn,'Expandable',__DC__GetTColumn__Expandable,nil);
RegisterProperty(TColumn,'Field',__DC__GetTColumn__Field,__DC__SetTColumn__Field);
RegisterProperty(TColumn,'ParentColumn',__DC__GetTColumn__ParentColumn,nil);
RegisterProperty(TColumn,'Showing',__DC__GetTColumn__Showing,nil);
RegisterProperty(TColumnTitle,'Column',__DC__GetTColumnTitle__Column,nil);
RegisterProperty(TCustomDBGrid,'EditorMode',__DC__GetTCustomDBGrid__EditorMode,__DC__SetTCustomDBGrid__EditorMode);
RegisterProperty(TCustomDBGrid,'FieldCount',__DC__GetTCustomDBGrid__FieldCount,nil);
RegisterIndexedProperty(TCustomDBGrid,'Fields',1,False,__DC__GetTCustomDBGrid__Fields,nil);
RegisterProperty(TCustomDBGrid,'SelectedField',__DC__GetTCustomDBGrid__SelectedField,__DC__SetTCustomDBGrid__SelectedField);
RegisterProperty(TCustomDBGrid,'SelectedIndex',__DC__GetTCustomDBGrid__SelectedIndex,__DC__SetTCustomDBGrid__SelectedIndex);
RegisterProperty(TCustomDBGrid,'DataSource',__DC__GetTCustomDBGrid__DataSource,__DC__SetTCustomDBGrid__DataSource);
RegisterProperty(TDBGrid,'Canvas',__DC__GetTDBGrid__Canvas,nil);
RegisterProperty(TDBGrid,'SelectedRows',__DC__GetTDBGrid__SelectedRows,nil);
RegisterProperty(TDBGridColumns,'State',__DC__GetTDBGridColumns__State,__DC__SetTDBGridColumns__State);
RegisterProperty(TDBGridColumns,'Grid',__DC__GetTDBGridColumns__Grid,nil);
RegisterIndexedProperty(TDBGridColumns,'Items',1,True,__DC__GetTDBGridColumns__Items,__DC__SetTDBGridColumns__Items);
RegisterProperty(TGridDataLink,'DefaultFields',__DC__GetTGridDataLink__DefaultFields,nil);
RegisterProperty(TGridDataLink,'FieldCount',__DC__GetTGridDataLink__FieldCount,nil);
RegisterIndexedProperty(TGridDataLink,'Fields',1,False,__DC__GetTGridDataLink__Fields,nil);
RegisterProperty(TGridDataLink,'SparseMap',__DC__GetTGridDataLink__SparseMap,__DC__SetTGridDataLink__SparseMap);
RegisterProperty(TGridDataLink,'Grid',__DC__GetTGridDataLink__Grid,nil);
end;

const __ConstNames0 : array[0..31] of string = (
'cvColor'
,'cvWidth'
,'cvFont'
,'cvAlignment'
,'cvReadOnly'
,'cvTitleColor'
,'cvTitleCaption'
,'cvTitleAlignment'
,'cvTitleFont'
,'cvImeMode'
,'cvImeName'
,'ColumnTitleValues'
,'cm_DeferLayout'
,'cbsAuto'
,'cbsEllipsis'
,'cbsNone'
,'csDefault'
,'csCustomized'
,'dgEditing'
,'dgAlwaysShowEditor'
,'dgTitles'
,'dgIndicator'
,'dgColumnResize'
,'dgColLines'
,'dgRowLines'
,'dgTabs'
,'dgRowSelect'
,'dgAlwaysShowSelection'
,'dgConfirmDelete'
,'dgCancelOnExit'
,'dgMultiSelect'
,'IndicatorWidth'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,cvColor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,cvWidth));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,cvFont));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,cvAlignment));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,cvReadOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,cvTitleColor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,cvTitleCaption));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,cvTitleAlignment));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,cvTitleFont));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,cvImeMode));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,cvImeName));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,VarFromSet(ColumnTitleValues, sizeof(ColumnTitleValues))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,cm_DeferLayout));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,cbsAuto));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,cbsEllipsis));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,cbsNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,csDefault));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,csCustomized));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,dgEditing));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,dgAlwaysShowEditor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,dgTitles));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,dgIndicator));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,dgColumnResize));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,dgColLines));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,dgRowLines));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,dgTabs));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,dgRowSelect));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,dgAlwaysShowSelection));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,dgConfirmDelete));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,dgCancelOnExit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,dgMultiSelect));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,IndicatorWidth));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..6] of TClass = (
TBookmarkList,
TColumn,
TColumnTitle,
TCustomDBGrid,
TDBGrid,
TDBGridColumns,
TGridDataLink
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
RegisterProc(TBookmarkList,'Create',mtConstructor,TypeInfo(_T0),[
TypeInfo(TCustomDBGrid)],Addr(TBookmarkList.Create),cRegister);

RegRegisterMethod(TBookmarkList,'Clear',TypeInfo(_T1),NoParams,Addr(TBookmarkList.Clear));

RegRegisterMethod(TBookmarkList,'Delete',TypeInfo(_T2),NoParams,Addr(TBookmarkList.Delete));

RegRegisterMethod(TBookmarkList,'Find',TypeInfo(_T3),[
TypeInfo(TBookmarkStr),
TypeInfo(Integer),TypeInfo(Boolean)],Addr(TBookmarkList.Find));

RegRegisterMethod(TBookmarkList,'IndexOf',TypeInfo(_T4),[
TypeInfo(TBookmarkStr),TypeInfo(Integer)],Addr(TBookmarkList.IndexOf));

RegRegisterMethod(TBookmarkList,'Refresh',TypeInfo(_T5),[TypeInfo(Boolean)],Addr(TBookmarkList.Refresh));

RegRegisterMethod(TColumn,'SetAlignment',TypeInfo(_T6),[
TypeInfo(TAlignment)], pointer(32));

RegRegisterMethod(TColumn,'SetField',TypeInfo(_T7),[
TypeInfo(TField)], pointer(36));

RegRegisterMethod(TColumn,'SetImeMode',TypeInfo(_T8),[
TypeInfo(TImeMode)], pointer(40));

RegRegisterMethod(TColumn,'SetImeName',TypeInfo(_T9),[
TypeInfo(TImeName)], pointer(44));

RegRegisterMethod(TColumn,'SetReadOnly',TypeInfo(_T10),[
TypeInfo(Boolean)], pointer(48));

RegRegisterMethod(TColumn,'SetWidth',TypeInfo(_T11),[
TypeInfo(Integer)], pointer(52));

RegRegisterMethod(TColumn,'CreateTitle',TypeInfo(_T12),[TypeInfo(TColumnTitle)], pointer(56));

RegRegisterMethod(TColumn,'DefaultAlignment',TypeInfo(_T13),[TypeInfo(TAlignment)],Addr(TColumn.DefaultAlignment));

RegRegisterMethod(TColumn,'DefaultColor',TypeInfo(_T14),[TypeInfo(TColor)],Addr(TColumn.DefaultColor));

RegRegisterMethod(TColumn,'DefaultFont',TypeInfo(_T15),[TypeInfo(TFont)],Addr(TColumn.DefaultFont));

RegRegisterMethod(TColumn,'DefaultImeMode',TypeInfo(_T16),[TypeInfo(TImeMode)],Addr(TColumn.DefaultImeMode));

RegRegisterMethod(TColumn,'DefaultImeName',TypeInfo(_T17),[TypeInfo(TImeName)],Addr(TColumn.DefaultImeName));

RegRegisterMethod(TColumn,'DefaultReadOnly',TypeInfo(_T18),[TypeInfo(Boolean)],Addr(TColumn.DefaultReadOnly));

RegRegisterMethod(TColumn,'DefaultWidth',TypeInfo(_T19),[TypeInfo(Integer)],Addr(TColumn.DefaultWidth));

RegRegisterMethod(TColumn,'Depth',TypeInfo(_T20),[TypeInfo(Integer)],Addr(TColumn.Depth));

RegRegisterMethod(TColumn,'RestoreDefaults',TypeInfo(_T21),NoParams, pointer(60));

RegRegisterMethod(TColumnTitle,'SetCaption',TypeInfo(_T22),[
TypeInfo(string)], pointer(12));

RegisterProc(TColumnTitle,'Create',mtConstructor,TypeInfo(_T23),[
TypeInfo(TColumn)],Addr(TColumnTitle.Create),cRegister);

RegRegisterMethod(TColumnTitle,'DefaultAlignment',TypeInfo(_T24),[TypeInfo(TAlignment)],Addr(TColumnTitle.DefaultAlignment));

RegRegisterMethod(TColumnTitle,'DefaultColor',TypeInfo(_T25),[TypeInfo(TColor)],Addr(TColumnTitle.DefaultColor));

RegRegisterMethod(TColumnTitle,'DefaultFont',TypeInfo(_T26),[TypeInfo(TFont)],Addr(TColumnTitle.DefaultFont));

RegRegisterMethod(TColumnTitle,'DefaultCaption',TypeInfo(_T27),[TypeInfo(string)],Addr(TColumnTitle.DefaultCaption));

RegRegisterMethod(TColumnTitle,'RestoreDefaults',TypeInfo(_T28),NoParams, pointer(16));

RegRegisterMethod(TCustomDBGrid,'CellClick',TypeInfo(_T29),[
TypeInfo(TColumn)], pointer(MinVMTOffset - 98));

RegRegisterMethod(TCustomDBGrid,'ColEnter',TypeInfo(_T30),NoParams, pointer(MinVMTOffset - 99));

RegRegisterMethod(TCustomDBGrid,'ColExit',TypeInfo(_T31),NoParams, pointer(MinVMTOffset - 100));

RegRegisterMethod(TCustomDBGrid,'CreateColumns',TypeInfo(_T32),[TypeInfo(TDBGridColumns)], pointer(MinVMTOffset - 101));

RegRegisterMethod(TCustomDBGrid,'CreateDataLink',TypeInfo(_T33),[TypeInfo(TGridDataLink)], pointer(MinVMTOffset - 102));

RegRegisterMethod(TCustomDBGrid,'DefineFieldMap',TypeInfo(_T34),NoParams, pointer(228));

RegRegisterMethod(TCustomDBGrid,'DrawDataCell',TypeInfo(_T35),[
TypeInfo(IDispatch),
TypeInfo(TField),
TypeInfo(TGridDrawState)], pointer(MinVMTOffset - 103));

RegRegisterMethod(TCustomDBGrid,'DrawColumnCell',TypeInfo(_T36),[
TypeInfo(IDispatch),
TypeInfo(Integer),
TypeInfo(TColumn),
TypeInfo(TGridDrawState)], pointer(MinVMTOffset - 104));

RegRegisterMethod(TCustomDBGrid,'EditButtonClick',TypeInfo(_T37),NoParams, pointer(MinVMTOffset - 105));

RegRegisterMethod(TCustomDBGrid,'HighlightCell',TypeInfo(_T38),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(string),
TypeInfo(TGridDrawState),TypeInfo(Boolean)], pointer(232));

RegRegisterMethod(TCustomDBGrid,'LayoutChanged',TypeInfo(_T39),NoParams, pointer(236));

RegRegisterMethod(TCustomDBGrid,'LinkActive',TypeInfo(_T40),[
TypeInfo(Boolean)], pointer(240));

RegRegisterMethod(TCustomDBGrid,'Scroll',TypeInfo(_T41),[
TypeInfo(Integer)], pointer(244));

RegRegisterMethod(TCustomDBGrid,'SetColumnAttributes',TypeInfo(_T42),NoParams, pointer(248));

RegRegisterMethod(TCustomDBGrid,'TitleClick',TypeInfo(_T43),[
TypeInfo(TColumn)], pointer(MinVMTOffset - 106));

RegRegisterMethod(TCustomDBGrid,'DefaultDrawDataCell',TypeInfo(_T44),[
TypeInfo(IDispatch),
TypeInfo(TField),
TypeInfo(TGridDrawState)],Addr(__TCustomDBGrid__DefaultDrawDataCell__Wrapper));

RegRegisterMethod(TCustomDBGrid,'DefaultDrawColumnCell',TypeInfo(_T45),[
TypeInfo(IDispatch),
TypeInfo(Integer),
TypeInfo(TColumn),
TypeInfo(TGridDrawState)],Addr(__TCustomDBGrid__DefaultDrawColumnCell__Wrapper));

RegisterProc(TCustomDBGrid,'ShowPopupEditor',mtScriptMethod,TypeInfo(_T46),[
TypeInfo(TColumn),
TypeInfo(Integer)],Addr(__TCustomDBGrid__ShowPopupEditor__Wrapper),cRegister);

RegRegisterMethod(TCustomDBGrid,'ValidFieldIndex',TypeInfo(_T47),[
TypeInfo(Integer),TypeInfo(Boolean)],Addr(TCustomDBGrid.ValidFieldIndex));

RegRegisterMethod(TDBGridColumns,'Add',TypeInfo(_T49),[TypeInfo(TColumn)],Addr(TDBGridColumns.Add));

RegRegisterMethod(TDBGridColumns,'LoadFromFile',TypeInfo(_T50),[
TypeInfo(string)],Addr(TDBGridColumns.LoadFromFile));

RegRegisterMethod(TDBGridColumns,'LoadFromStream',TypeInfo(_T51),[
TypeInfo(TStream)],Addr(TDBGridColumns.LoadFromStream));

RegRegisterMethod(TDBGridColumns,'RestoreDefaults',TypeInfo(_T52),NoParams,Addr(TDBGridColumns.RestoreDefaults));

RegRegisterMethod(TDBGridColumns,'RebuildColumns',TypeInfo(_T53),NoParams,Addr(TDBGridColumns.RebuildColumns));

RegRegisterMethod(TDBGridColumns,'SaveToFile',TypeInfo(_T54),[
TypeInfo(string)],Addr(TDBGridColumns.SaveToFile));

RegRegisterMethod(TDBGridColumns,'SaveToStream',TypeInfo(_T55),[
TypeInfo(TStream)],Addr(TDBGridColumns.SaveToStream));

RegRegisterMethod(TGridDataLink,'IsAggRow',TypeInfo(_T56),[
TypeInfo(Integer),TypeInfo(Boolean)], pointer(84));

RegisterProc(TGridDataLink,'Create',mtConstructor,TypeInfo(_T57),[
TypeInfo(TCustomDBGrid)],Addr(TGridDataLink.Create),cRegister);

RegRegisterMethod(TGridDataLink,'AddMapping',TypeInfo(_T58),[
TypeInfo(string),TypeInfo(Boolean)],Addr(TGridDataLink.AddMapping));

RegRegisterMethod(TGridDataLink,'ClearMapping',TypeInfo(_T59),NoParams,Addr(TGridDataLink.ClearMapping));

RegRegisterMethod(TGridDataLink,'Modified',TypeInfo(_T60),NoParams,Addr(TGridDataLink.Modified));

RegRegisterMethod(TGridDataLink,'Reset',TypeInfo(_T61),NoParams,Addr(TGridDataLink.Reset));

end;
initialization
_mreg_0;
{RegisterProc(TDBGridColumns,'Create',mtConstructor,TypeInfo(_T48),[
TypeInfo(TCustomDBGrid),
TypeInfo(TColumnClass)],Addr(TDBGridColumns.Create),cRegister)}

RegisterEvent(TypeInfo(TDBGridClickEvent),[
TypeInfo(TColumn)]);

{RegisterEvent(TypeInfo(TDrawColumnCellEvent),[
TypeInfo(TObject),
TypeInfo(IDispatch),
TypeInfo(Integer),
TypeInfo(TColumn),
TypeInfo(TGridDrawState)]);}

{RegisterEvent(TypeInfo(TDrawDataCellEvent),[
TypeInfo(TObject),
TypeInfo(IDispatch),
TypeInfo(TField),
TypeInfo(TGridDrawState)]);}

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
end.
