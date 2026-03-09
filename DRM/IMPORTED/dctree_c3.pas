{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit dcTree_C3;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  dccommon,
  consts,
  Registry,
  StdCtrls,
  extctrls,
  TypInfo,
  shellapi,
  clipbrd,
  dcvcllib,
  dcapi,
  rerrdlg,
  dcVarPropEd,
  buttons,
  oleconst,
  activex,
  dcscript,
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  dcsystem,
  ComCtrls,
  dsgnintf,
  CommCtrl,
  dcgen,
  menus,
  dialogs,
  dcdtree,
  dcconsts,
  dcdreamlib,
  DcTree;
function ConvertTNodeRecToVariant(var R : TNodeRec) : OleVariant;
function ConvertVariantToTNodeRec(const V : OleVariant) : TNodeRec;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TNodeRec__Wrapper = class(TDCRecordWrapper)
private
fR : TNodeRec;
public
function GetRecordPtr : pointer; override;
published
procedure setObjId(const val : Integer);
function getObjId : Integer;
property ObjId : Integer read getObjId write setObjId;
procedure setRootId(const val : Integer);
function getRootId : Integer;
property RootId : Integer read getRootId write setRootId;
procedure setDestId(const val : Integer);
function getDestId : Integer;
property DestId : Integer read getDestId write setDestId;
procedure setCaption(const val : AnsiString);
function getCaption : AnsiString;
property Caption : AnsiString read getCaption write setCaption;
procedure setImageIndex(const val : Integer);
function getImageIndex : Integer;
property ImageIndex : Integer read getImageIndex write setImageIndex;
procedure setSelectedIndex(const val : Integer);
function getSelectedIndex : Integer;
property SelectedIndex : Integer read getSelectedIndex write setSelectedIndex;
procedure setStateIndex(const val : Integer);
function getStateIndex : Integer;
property StateIndex : Integer read getStateIndex write setStateIndex;
procedure setOverlayIndex(const val : Integer);
function getOverlayIndex : Integer;
property OverlayIndex : Integer read getOverlayIndex write setOverlayIndex;
procedure setTreeSource(const val : TTreeSource);
function getTreeSource : TTreeSource;
property TreeSource : TTreeSource read getTreeSource write setTreeSource;
procedure setInsertType(const val : TNodeAttachMode);
function getInsertType : TNodeAttachMode;
property InsertType : TNodeAttachMode read getInsertType write setInsertType;
procedure setFontColor(const val : TColor);
function getFontColor : TColor;
property FontColor : TColor read getFontColor write setFontColor;
end;
type
_T0 = procedure (p0 : Integer;
p1 : TTreeSource) of object;

_T1 = procedure (p0 : TTreeSource) of object;

_T2 = procedure (p0 : TObject;
p1 : Integer;
p2 : Integer) of object;

_T3 = procedure  of object;

_T4 = _T3;

_T5 = _T3;

_T6 = _T3;

_T7 = _T3;

_T8 = _T3;

_T9 = _T3;

_T10 = procedure (p0 : TTreeSource;
p1 : Integer) of object;

_T11 = _T2;

_T12 = procedure (p0 : TObject;
p1 : Integer;
p2 : Integer;
p3 : TDragState;
var p4 : Boolean) of object;

_T13 = function : TTreeSource of object;

_T14 = _T3;

_T15 = procedure (p0 : TTreeNode) of object;

_T16 = function : Boolean of object;

_T17 = procedure (p0 : TListItem;
p1 : TNodeAttachMode) of object;

_T18 = procedure (p0 : Integer) of object;

_T19 = _T3;

_T20 = _T3;

_T21 = function : Integer of object;

_T22 = procedure (const p0 : IDispatch;
p1 : Boolean) of object;

_T23 = function (p0 : Integer): TTreeNode of object;

_T24 = function (p0 : TTreeNode): TTreeSource of object;

_T25 = _T24;

_T26 = _T15;

_T27 = _T15;

function __TNodeRec__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TNodeRec__Wrapper.setObjId(const val : Integer);
begin
TNodeRec(GetRecordPtr^).ObjId := val;
end;
function __TNodeRec__Wrapper.getObjId : Integer;
begin
result := TNodeRec(GetRecordPtr^).ObjId;
end;
procedure __TNodeRec__Wrapper.setRootId(const val : Integer);
begin
TNodeRec(GetRecordPtr^).RootId := val;
end;
function __TNodeRec__Wrapper.getRootId : Integer;
begin
result := TNodeRec(GetRecordPtr^).RootId;
end;
procedure __TNodeRec__Wrapper.setDestId(const val : Integer);
begin
TNodeRec(GetRecordPtr^).DestId := val;
end;
function __TNodeRec__Wrapper.getDestId : Integer;
begin
result := TNodeRec(GetRecordPtr^).DestId;
end;
procedure __TNodeRec__Wrapper.setCaption(const val : AnsiString);
begin
TNodeRec(GetRecordPtr^).Caption := val;
end;
function __TNodeRec__Wrapper.getCaption : AnsiString;
begin
result := TNodeRec(GetRecordPtr^).Caption;
end;
procedure __TNodeRec__Wrapper.setImageIndex(const val : Integer);
begin
TNodeRec(GetRecordPtr^).ImageIndex := val;
end;
function __TNodeRec__Wrapper.getImageIndex : Integer;
begin
result := TNodeRec(GetRecordPtr^).ImageIndex;
end;
procedure __TNodeRec__Wrapper.setSelectedIndex(const val : Integer);
begin
TNodeRec(GetRecordPtr^).SelectedIndex := val;
end;
function __TNodeRec__Wrapper.getSelectedIndex : Integer;
begin
result := TNodeRec(GetRecordPtr^).SelectedIndex;
end;
procedure __TNodeRec__Wrapper.setStateIndex(const val : Integer);
begin
TNodeRec(GetRecordPtr^).StateIndex := val;
end;
function __TNodeRec__Wrapper.getStateIndex : Integer;
begin
result := TNodeRec(GetRecordPtr^).StateIndex;
end;
procedure __TNodeRec__Wrapper.setOverlayIndex(const val : Integer);
begin
TNodeRec(GetRecordPtr^).OverlayIndex := val;
end;
function __TNodeRec__Wrapper.getOverlayIndex : Integer;
begin
result := TNodeRec(GetRecordPtr^).OverlayIndex;
end;
procedure __TNodeRec__Wrapper.setTreeSource(const val : TTreeSource);
begin
TNodeRec(GetRecordPtr^).TreeSource := val;
end;
function __TNodeRec__Wrapper.getTreeSource : TTreeSource;
begin
result := TNodeRec(GetRecordPtr^).TreeSource;
end;
procedure __TNodeRec__Wrapper.setInsertType(const val : TNodeAttachMode);
begin
TNodeRec(GetRecordPtr^).InsertType := val;
end;
function __TNodeRec__Wrapper.getInsertType : TNodeAttachMode;
begin
result := TNodeRec(GetRecordPtr^).InsertType;
end;
procedure __TNodeRec__Wrapper.setFontColor(const val : TColor);
begin
TNodeRec(GetRecordPtr^).FontColor := val;
end;
function __TNodeRec__Wrapper.getFontColor : TColor;
begin
result := TNodeRec(GetRecordPtr^).FontColor;
end;
procedure __TDCTreeNode__AssignNodeRec__Wrapper(__Instance : TDCTreeNode;
const p0 : IDispatch;
p1 : Boolean);
var
__p0 : ^TNodeRec;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TDCTreeNode(__Instance).AssignNodeRec(__p0^,p1);
end;


type __TNodeRec__Wrapper__ = class(__TNodeRec__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TNodeRec__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTNodeRecToVariant(var R : TNodeRec) : OleVariant;
var
__rw : __TNodeRec__Wrapper__;
begin
__rw := __TNodeRec__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTNodeRec(const V : OleVariant) : TNodeRec;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TNodeRec((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTCustomDCListView__Source(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCListView(Instance).Source);
end;

procedure __DC__SetTCustomDCListView__Source(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCListView(Instance).Source:=TTreeSource(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCListView__InspectorControls(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCListView(Instance).InspectorControls);
end;

function __DC__GetTCustomDCListView__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCListView(Instance).Items);
end;

function __DC__GetTCustomDCListView__Options(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TListViewOptions;
begin
tmp := TCustomDCListView(Instance).Options;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTCustomDCListView__Options(Instance : TObject; Params : PVariantArgList);
var
  tmp : TListViewOptions;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TCustomDCListView(Instance).Options:=tmp;
end;

function __DC__GetTCustomDCListView__SmallImages(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCListView(Instance).SmallImages);
end;

procedure __DC__SetTCustomDCListView__SmallImages(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCListView(Instance).SmallImages:=TImageList(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCListView__LargeImages(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCListView(Instance).LargeImages);
end;

procedure __DC__SetTCustomDCListView__LargeImages(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCListView(Instance).LargeImages:=TImageList(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCListView__StateImages(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCListView(Instance).StateImages);
end;

procedure __DC__SetTCustomDCListView__StateImages(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCListView(Instance).StateImages:=TImageList(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDcTreeView__InspectorControl(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDcTreeView(Instance).InspectorControl);
end;

function __DC__GetTCustomDcTreeView__InspectorControls(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDcTreeView(Instance).InspectorControls);
end;

function __DC__GetTCustomDcTreeView__Source(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDcTreeView(Instance).Source);
end;

procedure __DC__SetTCustomDcTreeView__Source(Instance : TObject; Params : PVariantArgList);
begin
TCustomDcTreeView(Instance).Source:=TTreeSource(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDcTreeView__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDcTreeView(Instance).Items);
end;

function __DC__GetTCustomDcTreeView__Root(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDcTreeView(Instance).Root;
end;

procedure __DC__SetTCustomDcTreeView__Root(Instance : TObject; Params : PVariantArgList);
begin
TCustomDcTreeView(Instance).Root:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDcTreeView__Options(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TtreeViewOptions;
begin
tmp := TCustomDcTreeView(Instance).Options;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTCustomDcTreeView__Options(Instance : TObject; Params : PVariantArgList);
var
  tmp : TtreeViewOptions;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TCustomDcTreeView(Instance).Options:=tmp;
end;

function __DC__GetTCustomDcTreeView__Images(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDcTreeView(Instance).Images);
end;

procedure __DC__SetTCustomDcTreeView__Images(Instance : TObject; Params : PVariantArgList);
begin
TCustomDcTreeView(Instance).Images:=TImageList(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDcTreeView__StateImages(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDcTreeView(Instance).StateImages);
end;

procedure __DC__SetTCustomDcTreeView__StateImages(Instance : TObject; Params : PVariantArgList);
begin
TCustomDcTreeView(Instance).StateImages:=TImageList(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTDCListItem__ObjId(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDCListItem(Instance).ObjId;
end;

procedure __DC__SetTDCListItem__ObjId(Instance : TObject; Params : PVariantArgList);
begin
TDCListItem(Instance).ObjId:=OleVariant(Params^[0]);
end;

function __DC__GetTDCListItems__Root(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDCListItems(Instance).Root;
end;

procedure __DC__SetTDCListItems__Root(Instance : TObject; Params : PVariantArgList);
begin
TDCListItems(Instance).Root:=OleVariant(Params^[0]);
end;

function __DC__GetTDCListItems__Source(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCListItems(Instance).Source);
end;

procedure __DC__SetTDCListItems__Source(Instance : TObject; Params : PVariantArgList);
begin
TDCListItems(Instance).Source:=TTreeSource(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTDCTreeView__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCTreeView(Instance).Items);
end;

procedure __RegisterProps;
begin
RegisterProperty(TCustomDCListView,'Source',__DC__GetTCustomDCListView__Source,__DC__SetTCustomDCListView__Source);
RegisterProperty(TCustomDCListView,'InspectorControls',__DC__GetTCustomDCListView__InspectorControls,nil);
RegisterProperty(TCustomDCListView,'Items',__DC__GetTCustomDCListView__Items,nil);
RegisterProperty(TCustomDCListView,'Options',__DC__GetTCustomDCListView__Options,__DC__SetTCustomDCListView__Options);
RegisterProperty(TCustomDCListView,'SmallImages',__DC__GetTCustomDCListView__SmallImages,__DC__SetTCustomDCListView__SmallImages);
RegisterProperty(TCustomDCListView,'LargeImages',__DC__GetTCustomDCListView__LargeImages,__DC__SetTCustomDCListView__LargeImages);
RegisterProperty(TCustomDCListView,'StateImages',__DC__GetTCustomDCListView__StateImages,__DC__SetTCustomDCListView__StateImages);
RegisterProperty(TCustomDcTreeView,'InspectorControl',__DC__GetTCustomDcTreeView__InspectorControl,nil);
RegisterProperty(TCustomDcTreeView,'InspectorControls',__DC__GetTCustomDcTreeView__InspectorControls,nil);
RegisterProperty(TCustomDcTreeView,'Source',__DC__GetTCustomDcTreeView__Source,__DC__SetTCustomDcTreeView__Source);
RegisterProperty(TCustomDcTreeView,'Items',__DC__GetTCustomDcTreeView__Items,nil);
RegisterProperty(TCustomDcTreeView,'Root',__DC__GetTCustomDcTreeView__Root,__DC__SetTCustomDcTreeView__Root);
RegisterProperty(TCustomDcTreeView,'Options',__DC__GetTCustomDcTreeView__Options,__DC__SetTCustomDcTreeView__Options);
RegisterProperty(TCustomDcTreeView,'Images',__DC__GetTCustomDcTreeView__Images,__DC__SetTCustomDcTreeView__Images);
RegisterProperty(TCustomDcTreeView,'StateImages',__DC__GetTCustomDcTreeView__StateImages,__DC__SetTCustomDcTreeView__StateImages);
RegisterProperty(TDCListItem,'ObjId',__DC__GetTDCListItem__ObjId,__DC__SetTDCListItem__ObjId);
RegisterProperty(TDCListItems,'Root',__DC__GetTDCListItems__Root,__DC__SetTDCListItems__Root);
RegisterProperty(TDCListItems,'Source',__DC__GetTDCListItems__Source,__DC__SetTDCListItems__Source);
RegisterProperty(TDCTreeView,'Items',__DC__GetTDCTreeView__Items,nil);
end;

const __ConstNames0 : array[0..21] of string = (
'TSIMAGECHANGED'
,'toProcessInsKey'
,'toProcessDelKey'
,'toCanEdit'
,'toCanNavigate'
,'toProcessEnterKey'
,'toProcessDblClick'
,'toTrackInsert'
,'toSmartPopup'
,'toConfirmDelete'
,'toCheckChild'
,'toFreeOnCollapse'
,'loProcessDelKey'
,'loProcessInsKey'
,'loCanEdit'
,'loCanNavigate'
,'loProcessDblClick'
,'loSmartPopup'
,'loTrackInsert'
,'loProcessEnterKey'
,'loShowSubItems'
,'loConfirmDelete'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,TSIMAGECHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,toProcessInsKey));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,toProcessDelKey));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,toCanEdit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,toCanNavigate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,toProcessEnterKey));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,toProcessDblClick));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,toTrackInsert));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,toSmartPopup));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,toConfirmDelete));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,toCheckChild));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,toFreeOnCollapse));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,loProcessDelKey));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,loProcessInsKey));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,loCanEdit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,loCanNavigate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,loProcessDblClick));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,loSmartPopup));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,loTrackInsert));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,loProcessEnterKey));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,loShowSubItems));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,loConfirmDelete));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..9] of TClass = (
TCustomDCListView,
TCustomDcTreeView,
TDCListItem,
TDCListItems,
TDCListView,
TDCTreeNode,
TDCTreeNodes,
TDCTreeView,
TItemList,
TNodeList
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
'NotifyTreeObjDeleted'
,'NotifyTreeRefresh'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T0),[
TypeInfo(Integer),
TypeInfo(TTreeSource)],Addr(NotifyTreeObjDeleted),cRegister);

RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T1),[
TypeInfo(TTreeSource)],Addr(NotifyTreeRefresh),cRegister);

RegRegisterMethod(TCustomDCListView,'DefaultDragDrop',TypeInfo(_T2),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TCustomDCListView.DefaultDragDrop));

RegRegisterMethod(TCustomDCListView,'DeleteSelectedItems',TypeInfo(_T3),NoParams,Addr(TCustomDCListView.DeleteSelectedItems));

RegRegisterMethod(TCustomDCListView,'BeginUpdate',TypeInfo(_T4),NoParams,Addr(TCustomDCListView.BeginUpdate));

RegRegisterMethod(TCustomDCListView,'EndUpdate',TypeInfo(_T5),NoParams,Addr(TCustomDCListView.EndUpdate));

RegRegisterMethod(TCustomDCListView,'Clear',TypeInfo(_T6),NoParams,Addr(TCustomDCListView.Clear));

RegRegisterMethod(TCustomDCListView,'InvalidateSelection',TypeInfo(_T7),NoParams,Addr(TCustomDCListView.InvalidateSelection));

RegRegisterMethod(TCustomDCListView,'RefreshList',TypeInfo(_T8),NoParams,Addr(TCustomDCListView.RefreshList));

RegRegisterMethod(TCustomDCListView,'SourceAssigned',TypeInfo(_T9),NoParams,Addr(TCustomDCListView.SourceAssigned));

RegRegisterMethod(TCustomDCListView,'SetSourceWithRoot',TypeInfo(_T10),[
TypeInfo(TTreeSource),
TypeInfo(Integer)],Addr(TCustomDCListView.SetSourceWithRoot));

RegRegisterMethod(TCustomDcTreeView,'DefaultDragDrop',TypeInfo(_T11),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TCustomDcTreeView.DefaultDragDrop));

RegRegisterMethod(TCustomDcTreeView,'DefaultDragOver',TypeInfo(_T12),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TDragState),
TypeInfo(Boolean)],Addr(TCustomDcTreeView.DefaultDragOver));

RegRegisterMethod(TCustomDcTreeView,'RootSource',TypeInfo(_T13),[TypeInfo(TTreeSource)],Addr(TCustomDcTreeView.RootSource));

RegRegisterMethod(TCustomDcTreeView,'RefreshTree',TypeInfo(_T14),NoParams,Addr(TCustomDcTreeView.RefreshTree));

RegRegisterMethod(TCustomDcTreeView,'RefreshNode',TypeInfo(_T15),[
TypeInfo(TTreeNode)],Addr(TCustomDcTreeView.RefreshNode));

RegRegisterMethod(TCustomDcTreeView,'CanDeleteSelection',TypeInfo(_T16),[TypeInfo(Boolean)],Addr(TCustomDcTreeView.CanDeleteSelection));

RegRegisterMethod(TDCListItem,'MoveTo',TypeInfo(_T17),[
TypeInfo(TListItem),
TypeInfo(TNodeAttachMode)],Addr(TDCListItem.MoveTo));

RegRegisterMethod(TDCListItems,'RefreshList',TypeInfo(_T18),[
TypeInfo(Integer)],Addr(TDCListItems.RefreshList));

RegRegisterMethod(TDCListItems,'GetPrevLevel',TypeInfo(_T19),NoParams,Addr(TDCListItems.GetPrevLevel));

RegRegisterMethod(TDCListItems,'GetNextLevel',TypeInfo(_T20),NoParams,Addr(TDCListItems.GetNextLevel));

RegRegisterMethod(TDCTreeNode,'GetObjId',TypeInfo(_T21),[TypeInfo(Integer)],Addr(TDCTreeNode.GetObjId));

RegRegisterMethod(TDCTreeNode,'AssignNodeRec',TypeInfo(_T22),[
TypeInfo(IDispatch),
TypeInfo(Boolean)],Addr(__TDCTreeNode__AssignNodeRec__Wrapper));

RegRegisterMethod(TDCTreeNodes,'FindObject',TypeInfo(_T23),[
TypeInfo(Integer),TypeInfo(TTreeNode)],Addr(TDCTreeNodes.FindObject));

RegRegisterMethod(TDCTreeNodes,'GetParentSource',TypeInfo(_T24),[
TypeInfo(TTreeNode),TypeInfo(TTreeSource)],Addr(TDCTreeNodes.GetParentSource));

RegRegisterMethod(TDCTreeNodes,'GetSelfSource',TypeInfo(_T25),[
TypeInfo(TTreeNode),TypeInfo(TTreeSource)],Addr(TDCTreeNodes.GetSelfSource));

RegRegisterMethod(TDCTreeNodes,'MoveItemUp',TypeInfo(_T26),[
TypeInfo(TTreeNode)],Addr(TDCTreeNodes.MoveItemUp));

RegRegisterMethod(TDCTreeNodes,'MoveItemDown',TypeInfo(_T27),[
TypeInfo(TTreeNode)],Addr(TDCTreeNodes.MoveItemDown));

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
