{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit oinspect_D5;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  dcscript,
  dcsystem,
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Grids,
  typinfo,
  dsgnintf,
  stdctrls,
  menus,
  extctrls,
  consts,
  dcconsts,
  dcedit,
  dcpedit,
  dcgen,
  dccommon,
  dcstrled,
  dchook,
  dcdreamlib,
  dccontrols,
  olectrls,
  olectnrs,
  activex,
  comobj,
  axctrls,
  stdvcl,
  glyphed,
  oinspect;
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
procedure setLeft(const val : Integer);
function getLeft : Integer;
property Left : Integer read getLeft write setLeft;
procedure setTop(const val : Integer);
function getTop : Integer;
property Top : Integer read getTop write setTop;
procedure setRight(const val : Integer);
function getRight : Integer;
property Right : Integer read getRight write setRight;
procedure setBottom(const val : Integer);
function getBottom : Integer;
property Bottom : Integer read getBottom write setBottom;
end;
type
_T0 = function : TInspectorList of object;

_T1 = function : TInspectorOptions of object;

{_T2 = procedure (p0 : TControlClass) of object;}

_T4 = function (p0 : TPropertyEditor): TAxPropEditor of object;

_T5 = function (const p0 : TDCDsgnProp;
const p1 : TDCDsgnProp): Integer of object;

_T6 = _T5;

_T7 = function (p0 : TObject): Boolean of object;

_T8 = procedure  of object;

{_T9 = function : TInplaceEditClass of object;}

_T10 = procedure (const p0 : TDCDsgnProp;
p1 : string) of object;

_T11 = procedure (p0 : TCustomDCEdit;
const p1 : TDCDsgnProp) of object;

{_T12 = function (const p0 : TDCDsgnProp): TControlClass of object;}

{_T13 = function (const p0 : TDCDsgnProp): TWinControlClass of object;}

_T14 = function (const p0 : TDCDsgnProp): string of object;

_T15 = _T8;

{_T16 = procedure (p0 : TComponentList;
p1 : TTypeKinds;
p2 : TFormDesigner;
p3 : TGetPropEditProc) of object;}

_T17 = function : Boolean of object;

_T18 = _T17;

_T19 = function (p0 : Word;
p1 : TShiftState): Boolean of object;

_T20 = function : string of object;

_T21 = _T8;

_T22 = procedure (p0 : TList) of object;

_T23 = _T22;

_T24 = _T22;

_T25 = procedure (p0 : TPersistent) of object;

_T26 = _T25;

_T27 = _T8;

_T28 = _T8;

_T29 = _T8;

_T30 = _T8;

_T31 = _T8;

_T32 = procedure (p0 : string) of object;

_T33 = _T32;

_T34 = _T8;

_T35 = procedure (const p0 : string) of object;

_T36 = _T35;

_T37 = procedure (p0 : Integer) of object;

_T38 = _T8;

_T39 = _T8;

_T40 = procedure (const p0 : IDispatch) of object;

function __TRect__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TRect__Wrapper.setLeft(const val : Integer);
begin
TRect(GetRecordPtr^).Left := val;
end;
function __TRect__Wrapper.getLeft : Integer;
begin
result := TRect(GetRecordPtr^).Left;
end;
procedure __TRect__Wrapper.setTop(const val : Integer);
begin
TRect(GetRecordPtr^).Top := val;
end;
function __TRect__Wrapper.getTop : Integer;
begin
result := TRect(GetRecordPtr^).Top;
end;
procedure __TRect__Wrapper.setRight(const val : Integer);
begin
TRect(GetRecordPtr^).Right := val;
end;
function __TRect__Wrapper.getRight : Integer;
begin
result := TRect(GetRecordPtr^).Right;
end;
procedure __TRect__Wrapper.setBottom(const val : Integer);
begin
TRect(GetRecordPtr^).Bottom := val;
end;
function __TRect__Wrapper.getBottom : Integer;
begin
result := TRect(GetRecordPtr^).Bottom;
end;
procedure __TOInplaceEdit__Move__Wrapper(__Instance : TOInplaceEdit;
const p0 : IDispatch);
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TOInplaceEdit(__Instance).Move(__p0^);
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
function __DC__GetTCustomObjectInspector__InfoRec(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomObjectInspector(Instance).InfoRec[OleVariant(Params^[0])]);
end;

function __DC__GetTCustomObjectInspector__CurrentControl(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomObjectInspector(Instance).CurrentControl);
end;

procedure __DC__SetTCustomObjectInspector__CurrentControl(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).CurrentControl:=TPersistent(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomObjectInspector__CurrentControls(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomObjectInspector(Instance).CurrentControls);
end;

procedure __DC__SetTCustomObjectInspector__CurrentControls(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).CurrentControls:=TList(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomObjectInspector__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomObjectInspector(Instance).Canvas);
end;

function __DC__GetTCustomObjectInspector__ActiveProperty(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomObjectInspector(Instance).ActiveProperty;
end;

procedure __DC__SetTCustomObjectInspector__ActiveProperty(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).ActiveProperty:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomObjectInspector__ActivePropDesc(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomObjectInspector(Instance).ActivePropDesc;
end;

function __DC__GetTCustomObjectInspector__Filter(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TTypeKinds;
begin
tmp := TCustomObjectInspector(Instance).Filter;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTCustomObjectInspector__Filter(Instance : TObject; Params : PVariantArgList);
var
  tmp : TTypeKinds;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TCustomObjectInspector(Instance).Filter:=tmp;
end;

function __DC__GetTCustomObjectInspector__ExpandMode(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomObjectInspector(Instance).ExpandMode;
end;

procedure __DC__SetTCustomObjectInspector__ExpandMode(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).ExpandMode:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomObjectInspector__Style(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomObjectInspector(Instance).Style;
end;

procedure __DC__SetTCustomObjectInspector__Style(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).Style:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomObjectInspector__Aliases(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomObjectInspector(Instance).Aliases);
end;

procedure __DC__SetTCustomObjectInspector__Aliases(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).Aliases:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomObjectInspector__Descriptions(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomObjectInspector(Instance).Descriptions);
end;

procedure __DC__SetTCustomObjectInspector__Descriptions(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).Descriptions:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomObjectInspector__Options(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TOIOptions;
begin
tmp := TCustomObjectInspector(Instance).Options;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTCustomObjectInspector__Options(Instance : TObject; Params : PVariantArgList);
var
  tmp : TOIOptions;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TCustomObjectInspector(Instance).Options:=tmp;
end;

function __DC__GetTCustomObjectInspector__SplitterSize(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomObjectInspector(Instance).SplitterSize;
end;

procedure __DC__SetTCustomObjectInspector__SplitterSize(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).SplitterSize:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomObjectInspector__OtherGroupName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomObjectInspector(Instance).OtherGroupName;
end;

procedure __DC__SetTCustomObjectInspector__OtherGroupName(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).OtherGroupName:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomObjectInspector__GroupFont(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomObjectInspector(Instance).GroupFont);
end;

procedure __DC__SetTCustomObjectInspector__GroupFont(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).GroupFont:=TFont(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomObjectInspector__ShowHints(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomObjectInspector(Instance).ShowHints;
end;

procedure __DC__SetTCustomObjectInspector__ShowHints(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).ShowHints:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomObjectInspector__Colors(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomObjectInspector(Instance).Colors);
end;

procedure __DC__SetTCustomObjectInspector__Colors(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).Colors:=TOIColors(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomObjectInspector__CustomSort(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomObjectInspector(Instance).CustomSort;
end;

procedure __DC__SetTCustomObjectInspector__CustomSort(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).CustomSort:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomObjectInspector__FixedColWidth(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomObjectInspector(Instance).FixedColWidth;
end;

procedure __DC__SetTCustomObjectInspector__FixedColWidth(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).FixedColWidth:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomObjectInspector__LineStyle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomObjectInspector(Instance).LineStyle;
end;

procedure __DC__SetTCustomObjectInspector__LineStyle(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).LineStyle:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomObjectInspector__ReadOnly(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomObjectInspector(Instance).ReadOnly;
end;

procedure __DC__SetTCustomObjectInspector__ReadOnly(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).ReadOnly:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomObjectInspector__EditRow(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomObjectInspector(Instance).EditRow;
end;

procedure __DC__SetTCustomObjectInspector__EditRow(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).EditRow:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomObjectInspector__GroupCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomObjectInspector(Instance).GroupCount;
end;

function __DC__GetTCustomObjectInspector__SmartRefresh(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomObjectInspector(Instance).SmartRefresh;
end;

procedure __DC__SetTCustomObjectInspector__SmartRefresh(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).SmartRefresh:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomObjectInspector__TrackDestroy(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomObjectInspector(Instance).TrackDestroy;
end;

procedure __DC__SetTCustomObjectInspector__TrackDestroy(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).TrackDestroy:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomObjectInspector__PropOrder(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomObjectInspector(Instance).PropOrder);
end;

procedure __DC__SetTCustomObjectInspector__PropOrder(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).PropOrder:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomObjectInspector__ReadOnlyProps(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomObjectInspector(Instance).ReadOnlyProps);
end;

procedure __DC__SetTCustomObjectInspector__ReadOnlyProps(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).ReadOnlyProps:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomObjectInspector__HiddenProps(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomObjectInspector(Instance).HiddenProps);
end;

procedure __DC__SetTCustomObjectInspector__HiddenProps(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).HiddenProps:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomObjectInspector__DisplayedProps(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomObjectInspector(Instance).DisplayedProps);
end;

procedure __DC__SetTCustomObjectInspector__DisplayedProps(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).DisplayedProps:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomObjectInspector__UseOtherGroup(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomObjectInspector(Instance).UseOtherGroup;
end;

procedure __DC__SetTCustomObjectInspector__UseOtherGroup(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).UseOtherGroup:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomObjectInspector__UseGlobalOptions(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomObjectInspector(Instance).UseGlobalOptions;
end;

procedure __DC__SetTCustomObjectInspector__UseGlobalOptions(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).UseGlobalOptions:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomObjectInspector__AutoSizeNames(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomObjectInspector(Instance).AutoSizeNames;
end;

procedure __DC__SetTCustomObjectInspector__AutoSizeNames(Instance : TObject; Params : PVariantArgList);
begin
TCustomObjectInspector(Instance).AutoSizeNames:=OleVariant(Params^[0]);
end;

function __DC__GetTInspectorList__Inspectors(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TInspectorList(Instance).Inspectors[OleVariant(Params^[0])]);
end;

procedure __RegisterProps;
begin
RegisterIndexedProperty(TCustomObjectInspector,'InfoRec',1,False,__DC__GetTCustomObjectInspector__InfoRec,nil);
RegisterProperty(TCustomObjectInspector,'CurrentControl',__DC__GetTCustomObjectInspector__CurrentControl,__DC__SetTCustomObjectInspector__CurrentControl);
RegisterProperty(TCustomObjectInspector,'CurrentControls',__DC__GetTCustomObjectInspector__CurrentControls,__DC__SetTCustomObjectInspector__CurrentControls);
RegisterProperty(TCustomObjectInspector,'Canvas',__DC__GetTCustomObjectInspector__Canvas,nil);
RegisterProperty(TCustomObjectInspector,'ActiveProperty',__DC__GetTCustomObjectInspector__ActiveProperty,__DC__SetTCustomObjectInspector__ActiveProperty);
RegisterProperty(TCustomObjectInspector,'ActivePropDesc',__DC__GetTCustomObjectInspector__ActivePropDesc,nil);
RegisterProperty(TCustomObjectInspector,'Filter',__DC__GetTCustomObjectInspector__Filter,__DC__SetTCustomObjectInspector__Filter);
RegisterProperty(TCustomObjectInspector,'ExpandMode',__DC__GetTCustomObjectInspector__ExpandMode,__DC__SetTCustomObjectInspector__ExpandMode);
RegisterProperty(TCustomObjectInspector,'Style',__DC__GetTCustomObjectInspector__Style,__DC__SetTCustomObjectInspector__Style);
RegisterProperty(TCustomObjectInspector,'Aliases',__DC__GetTCustomObjectInspector__Aliases,__DC__SetTCustomObjectInspector__Aliases);
RegisterProperty(TCustomObjectInspector,'Descriptions',__DC__GetTCustomObjectInspector__Descriptions,__DC__SetTCustomObjectInspector__Descriptions);
RegisterProperty(TCustomObjectInspector,'Options',__DC__GetTCustomObjectInspector__Options,__DC__SetTCustomObjectInspector__Options);
RegisterProperty(TCustomObjectInspector,'SplitterSize',__DC__GetTCustomObjectInspector__SplitterSize,__DC__SetTCustomObjectInspector__SplitterSize);
RegisterProperty(TCustomObjectInspector,'OtherGroupName',__DC__GetTCustomObjectInspector__OtherGroupName,__DC__SetTCustomObjectInspector__OtherGroupName);
RegisterProperty(TCustomObjectInspector,'GroupFont',__DC__GetTCustomObjectInspector__GroupFont,__DC__SetTCustomObjectInspector__GroupFont);
RegisterProperty(TCustomObjectInspector,'ShowHints',__DC__GetTCustomObjectInspector__ShowHints,__DC__SetTCustomObjectInspector__ShowHints);
RegisterProperty(TCustomObjectInspector,'Colors',__DC__GetTCustomObjectInspector__Colors,__DC__SetTCustomObjectInspector__Colors);
RegisterProperty(TCustomObjectInspector,'CustomSort',__DC__GetTCustomObjectInspector__CustomSort,__DC__SetTCustomObjectInspector__CustomSort);
RegisterProperty(TCustomObjectInspector,'FixedColWidth',__DC__GetTCustomObjectInspector__FixedColWidth,__DC__SetTCustomObjectInspector__FixedColWidth);
RegisterProperty(TCustomObjectInspector,'LineStyle',__DC__GetTCustomObjectInspector__LineStyle,__DC__SetTCustomObjectInspector__LineStyle);
RegisterProperty(TCustomObjectInspector,'ReadOnly',__DC__GetTCustomObjectInspector__ReadOnly,__DC__SetTCustomObjectInspector__ReadOnly);
RegisterProperty(TCustomObjectInspector,'EditRow',__DC__GetTCustomObjectInspector__EditRow,__DC__SetTCustomObjectInspector__EditRow);
RegisterProperty(TCustomObjectInspector,'GroupCount',__DC__GetTCustomObjectInspector__GroupCount,nil);
RegisterProperty(TCustomObjectInspector,'SmartRefresh',__DC__GetTCustomObjectInspector__SmartRefresh,__DC__SetTCustomObjectInspector__SmartRefresh);
RegisterProperty(TCustomObjectInspector,'TrackDestroy',__DC__GetTCustomObjectInspector__TrackDestroy,__DC__SetTCustomObjectInspector__TrackDestroy);
RegisterProperty(TCustomObjectInspector,'PropOrder',__DC__GetTCustomObjectInspector__PropOrder,__DC__SetTCustomObjectInspector__PropOrder);
RegisterProperty(TCustomObjectInspector,'ReadOnlyProps',__DC__GetTCustomObjectInspector__ReadOnlyProps,__DC__SetTCustomObjectInspector__ReadOnlyProps);
RegisterProperty(TCustomObjectInspector,'HiddenProps',__DC__GetTCustomObjectInspector__HiddenProps,__DC__SetTCustomObjectInspector__HiddenProps);
RegisterProperty(TCustomObjectInspector,'DisplayedProps',__DC__GetTCustomObjectInspector__DisplayedProps,__DC__SetTCustomObjectInspector__DisplayedProps);
RegisterProperty(TCustomObjectInspector,'UseOtherGroup',__DC__GetTCustomObjectInspector__UseOtherGroup,__DC__SetTCustomObjectInspector__UseOtherGroup);
RegisterProperty(TCustomObjectInspector,'UseGlobalOptions',__DC__GetTCustomObjectInspector__UseGlobalOptions,__DC__SetTCustomObjectInspector__UseGlobalOptions);
RegisterProperty(TCustomObjectInspector,'AutoSizeNames',__DC__GetTCustomObjectInspector__AutoSizeNames,__DC__SetTCustomObjectInspector__AutoSizeNames);
RegisterIndexedProperty(TInspectorList,'Inspectors',1,True,__DC__GetTInspectorList__Inspectors,nil);
end;

const __ConstNames0 : array[0..29] of string = (
'oiHorzLine'
,'oiVertLine'
,'oiJoinControls'
,'oiSunkenEditor'
,'oiVertLine3D'
,'oiUseAliases'
,'oiUseGroups'
,'oiEditBorder'
,'oiSmartPopup'
,'oiUnSorted'
,'oiEnterMoveDown'
,'oiTabMoveDown'
,'oiShowActiveX'
,'oiShowAxHelp'
,'oiGroupsDown'
,'Default'
,'AutoExpand'
,'AlwaysExpand'
,'AutoCollapse'
,'SolidLine'
,'DottedLine'
,'isDelphi'
,'isVB'
,'isCustom'
,'ssNoSub'
,'ssExpanded'
,'ssCollapsed'
,'pbsNone'
,'pbsSingle'
,'pbsSunken'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,oiHorzLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,oiVertLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,oiJoinControls));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,oiSunkenEditor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,oiVertLine3D));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,oiUseAliases));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,oiUseGroups));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,oiEditBorder));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,oiSmartPopup));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,oiUnSorted));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,oiEnterMoveDown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,oiTabMoveDown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,oiShowActiveX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,oiShowAxHelp));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,oiGroupsDown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,Default));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,AutoExpand));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,AlwaysExpand));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,AutoCollapse));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,SolidLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,DottedLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,isDelphi));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,isVB));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,isCustom));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,ssNoSub));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,ssExpanded));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,ssCollapsed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,pbsNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,pbsSingle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,pbsSunken));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..9] of TClass = (
TAxPropEditor,
TCustomAxInspector,
TCustomObjectInspector,
TInfoRec,
TInspectorList,
TInspectorOptions,
TObjectInspector,
TOIColors,
TOInplaceEdit,
TPropertyHelp
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..2] of string = (
'InspectorList'
,'GlobalInspectorOptions'
,'PSCAxPropEditor'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T0),[TypeInfo(TInspectorList)],Addr(InspectorList),cRegister);

RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T1),[TypeInfo(TInspectorOptions)],Addr(GlobalInspectorOptions),cRegister);

RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T4),[
TypeInfo(TPropertyEditor),TypeInfo(TAxPropEditor)],Addr(PSCAxPropEditor),cRegister);

RegRegisterMethod(TCustomAxInspector,'ComparePropEditorsByPropName',TypeInfo(_T5),[
TypeInfo(TDCDsgnProp),
TypeInfo(TDCDsgnProp),TypeInfo(Integer)], pointer(268));

RegRegisterMethod(TCustomAxInspector,'ComparePropEditors',TypeInfo(_T6),[
TypeInfo(TDCDsgnProp),
TypeInfo(TDCDsgnProp),TypeInfo(Integer)], pointer(272));

RegRegisterMethod(TCustomAxInspector,'IsOCX',TypeInfo(_T7),[
TypeInfo(TObject),TypeInfo(Boolean)], pointer(276));

RegRegisterMethod(TCustomObjectInspector,'ShowAxHelp',TypeInfo(_T8),NoParams, pointer(212));

RegRegisterMethod(TCustomObjectInspector,'ChangeValue',TypeInfo(_T10),[
TypeInfo(TDCDsgnProp),
TypeInfo(string)], pointer(220));

RegRegisterMethod(TCustomObjectInspector,'UpdateEditorState',TypeInfo(_T11),[
TypeInfo(TCustomDCEdit),
TypeInfo(TDCDsgnProp)], pointer(224));

RegRegisterMethod(TCustomObjectInspector,'GetRealName',TypeInfo(_T14),[
TypeInfo(TDCDsgnProp),TypeInfo(string)], pointer(236));

RegRegisterMethod(TCustomObjectInspector,'ComponentChanged',TypeInfo(_T15),NoParams, pointer(240));

RegRegisterMethod(TCustomObjectInspector,'IsEmpty',TypeInfo(_T17),[TypeInfo(Boolean)], pointer(248));

RegRegisterMethod(TCustomObjectInspector,'CanHaveSubNodes',TypeInfo(_T18),[TypeInfo(Boolean)], pointer(252));

RegRegisterMethod(TCustomObjectInspector,'IsInspectorKey',TypeInfo(_T19),[
TypeInfo(Word),
TypeInfo(TShiftState),TypeInfo(Boolean)], pointer(256));

RegRegisterMethod(TCustomObjectInspector,'GetActivePropDesc',TypeInfo(_T20),[TypeInfo(string)], pointer(260));

RegRegisterMethod(TCustomObjectInspector,'UpdateEditorValue',TypeInfo(_T21),NoParams, pointer(264));

RegRegisterMethod(TCustomObjectInspector,'SetControls',TypeInfo(_T22),[
TypeInfo(TList)],Addr(TCustomObjectInspector.SetControls));

RegRegisterMethod(TCustomObjectInspector,'AddControls',TypeInfo(_T23),[
TypeInfo(TList)],Addr(TCustomObjectInspector.AddControls));

RegRegisterMethod(TCustomObjectInspector,'DelControls',TypeInfo(_T24),[
TypeInfo(TList)],Addr(TCustomObjectInspector.DelControls));

RegRegisterMethod(TCustomObjectInspector,'AddControl',TypeInfo(_T25),[
TypeInfo(TPersistent)],Addr(TCustomObjectInspector.AddControl));

RegRegisterMethod(TCustomObjectInspector,'DelControl',TypeInfo(_T26),[
TypeInfo(TPersistent)],Addr(TCustomObjectInspector.DelControl));

RegRegisterMethod(TCustomObjectInspector,'BeginUpdate',TypeInfo(_T27),NoParams,Addr(TCustomObjectInspector.BeginUpdate));

RegRegisterMethod(TCustomObjectInspector,'EndUpdate',TypeInfo(_T28),NoParams,Addr(TCustomObjectInspector.EndUpdate));

RegRegisterMethod(TCustomObjectInspector,'ExpandAll',TypeInfo(_T29),NoParams,Addr(TCustomObjectInspector.ExpandAll));

RegRegisterMethod(TCustomObjectInspector,'CollapseAll',TypeInfo(_T30),NoParams,Addr(TCustomObjectInspector.CollapseAll));

RegRegisterMethod(TCustomObjectInspector,'ReScan',TypeInfo(_T31),NoParams,Addr(TCustomObjectInspector.ReScan));

RegRegisterMethod(TCustomObjectInspector,'SetFocusToProperty',TypeInfo(_T32),[
TypeInfo(string)],Addr(TCustomObjectInspector.SetFocusToProperty));

RegRegisterMethod(TCustomObjectInspector,'SetFocusToRealProperty',TypeInfo(_T33),[
TypeInfo(string)],Addr(TCustomObjectInspector.SetFocusToRealProperty));

RegRegisterMethod(TCustomObjectInspector,'UpdateValues',TypeInfo(_T34),NoParams,Addr(TCustomObjectInspector.UpdateValues));

RegRegisterMethod(TCustomObjectInspector,'ExpandGroupByName',TypeInfo(_T35),[
TypeInfo(string)],Addr(TCustomObjectInspector.ExpandGroupByName));

RegRegisterMethod(TCustomObjectInspector,'CollapseGroupByName',TypeInfo(_T36),[
TypeInfo(string)],Addr(TCustomObjectInspector.CollapseGroupByName));

RegRegisterMethod(TCustomObjectInspector,'SetEditorToRow',TypeInfo(_T37),[
TypeInfo(Integer)],Addr(TCustomObjectInspector.SetEditorToRow));

RegisterProc(TOIColors,'Create',mtConstructor,TypeInfo(_T38),NoParams,Addr(TOIColors.Create),cRegister);

RegRegisterMethod(TOInplaceEdit,'Hide',TypeInfo(_T39),NoParams,Addr(TOInplaceEdit.Hide));

RegRegisterMethod(TOInplaceEdit,'Move',TypeInfo(_T40),[
TypeInfo(IDispatch)],Addr(__TOInplaceEdit__Move__Wrapper));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'AddNonInspectorEditClass',mtProc,TypeInfo(_T2),[
TypeInfo(TControlClass)],Addr(AddNonInspectorEditClass),cRegister)}

{RegRegisterMethod(TCustomObjectInspector,'GetInplaceEditClass',TypeInfo(_T9),[TypeInfo(TInplaceEditClass)], pointer(216))}

{RegRegisterMethod(TCustomObjectInspector,'GetEditorClass',TypeInfo(_T12),[
TypeInfo(TDCDsgnProp),TypeInfo(TControlClass)], pointer(228))}

{RegRegisterMethod(TCustomObjectInspector,'GetPopupClass',TypeInfo(_T13),[
TypeInfo(TDCDsgnProp),TypeInfo(TWinControlClass)], pointer(232))}

{RegRegisterMethod(TCustomObjectInspector,'GetAllPropertyEditors',TypeInfo(_T16),[
TypeInfo(TComponentList),
TypeInfo(TTypeKinds),
TypeInfo(TFormDesigner),
TypeInfo(TGetPropEditProc)], pointer(244))}

RegisterEvent(TypeInfo(TChangedProc),[
TypeInfo(TObject)]);

RegisterEvent(TypeInfo(TChangeValueProc),[
TypeInfo(TObject),
TypeInfo(TDCDsgnProperty),
TypeInfo(string)]);

{RegisterEvent(TypeInfo(TDrawCellProc),[
TypeInfo(TObject),
TypeInfo(TDCDsgnProperty),
TypeInfo(Integer),
TypeInfo(IDispatch),
TypeInfo(Boolean)]);}

RegisterEvent(TypeInfo(TEditClickProc),[
TypeInfo(TObject),
TypeInfo(TDCDsgnProperty),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TGetCellParamsProc),[
TypeInfo(TObject),
TypeInfo(TDCDsgnProperty),
TypeInfo(Integer),
TypeInfo(TFont)]);

RegisterEvent(TypeInfo(TGetDisplayNameProc),[
TypeInfo(TObject),
TypeInfo(TDCDsgnProperty),
TypeInfo(string),
TypeInfo(string)]);

RegisterEvent(TypeInfo(TOICompareEvent),[
TypeInfo(TObject),
TypeInfo(TDCDsgnProperty),
TypeInfo(TDCDsgnProperty),
TypeInfo(Integer)]);

RegisterEvent(TypeInfo(TOnEditProc),[
TypeInfo(TObject),
TypeInfo(TDCDsgnProperty),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TOnShowProc),[
TypeInfo(TObject),
TypeInfo(TDCDsgnProperty),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TSplitterNotifyProc),[
TypeInfo(TObject),
TypeInfo(Integer)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
