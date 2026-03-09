{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit dctsrc_D3;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  activex,
  dcscript,
  windows,
  graphics,
  classes,
  sysutils,
  controls,
  forms,
  messages,
  menus,
  dialogs,
  comctrls,
  commctrl,
  dsgnintf,
  typinfo,
  dcsystem,
  dcgen,
  dccommon,
  dcconsts,
  dcstdctl,
  dctslite,
  dcdreamlib,
  dchook,
  dctsrc;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
_T0 = function (p0 : TCollectionItem): string of object;

_T1 = procedure (p0 : TCustomImageList;
p1 : Integer) of object;

_T2 = procedure (p0 : TBitmap;
p1 : Boolean) of object;

{_T3 = procedure (p0 : TDCMultiSource;
p1 : TCollectionItemClass) of object;}

_T4 = function : TDCMultiItem of object;

_T5 = function : string of object;

_T6 = function : Integer of object;

_T7 = _T6;

_T8 = _T6;

_T9 = procedure (p0 : TPersistent) of object;

_T10 = procedure (p0 : Integer) of object;

function __DC__GetTCustomCompViewSource__Root(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomCompViewSource(Instance).Root);
end;

procedure __DC__SetTCustomCompViewSource__Root(Instance : TObject; Params : PVariantArgList);
begin
TCustomCompViewSource(Instance).Root:=TComponent(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomCompViewSource__Options(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TCompViewOptions;
begin
tmp := TCustomCompViewSource(Instance).Options;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTCustomCompViewSource__Options(Instance : TObject; Params : PVariantArgList);
var
  tmp : TCompViewOptions;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TCustomCompViewSource(Instance).Options:=tmp;
end;

function __DC__GetTCustomDCCollectSource__Collection(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCCollectSource(Instance).Collection);
end;

procedure __DC__SetTCustomDCCollectSource__Collection(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCCollectSource(Instance).Collection:=TCollection(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCTreeViewSource__TreeView(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCTreeViewSource(Instance).TreeView);
end;

procedure __DC__SetTCustomDCTreeViewSource__TreeView(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCTreeViewSource(Instance).TreeView:=TCustomTreeView(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTDCMultiItems__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCMultiItems(Instance).Items[OleVariant(Params^[0])]);
end;

procedure __DC__SetTDCMultiItems__Items(Instance : TObject; Params : PVariantArgList);
begin
TDCMultiItems(Instance).Items[OleVariant(Params^[1])]:=TDCMultiItem(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTDCTreeData__Link(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCTreeData(Instance).Link);
end;

procedure __DC__SetTDCTreeData__Link(Instance : TObject; Params : PVariantArgList);
begin
TDCTreeData(Instance).Link:=TPersistent(VarToObject(OleVariant(Params^[0])));
end;

procedure __RegisterProps;
begin
RegisterProperty(TCustomCompViewSource,'Root',__DC__GetTCustomCompViewSource__Root,__DC__SetTCustomCompViewSource__Root);
RegisterProperty(TCustomCompViewSource,'Options',__DC__GetTCustomCompViewSource__Options,__DC__SetTCustomCompViewSource__Options);
RegisterProperty(TCustomDCCollectSource,'Collection',__DC__GetTCustomDCCollectSource__Collection,__DC__SetTCustomDCCollectSource__Collection);
RegisterProperty(TCustomDCTreeViewSource,'TreeView',__DC__GetTCustomDCTreeViewSource__TreeView,__DC__SetTCustomDCTreeViewSource__TreeView);
RegisterIndexedProperty(TDCMultiItems,'Items',1,False,__DC__GetTDCMultiItems__Items,__DC__SetTDCMultiItems__Items);
RegisterProperty(TDCTreeData,'Link',__DC__GetTDCTreeData__Link,__DC__SetTDCTreeData__Link);
end;

const __ConstNames0 : array[0..6] of string = (
'voHideEmpty'
,'voShowRoot'
,'voShowClassname'
,'voCanEdit'
,'ioCrop'
,'ioStretch'
,'ioCenter'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,voHideEmpty));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,voShowRoot));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,voShowClassname));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,voCanEdit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,ioCrop));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,ioStretch));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,ioCenter));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..22] of TClass = (
TCustomCompViewSource,
TCustomDCCollectSource,
TCustomDCTreeViewSource,
TDCCollectSource,
TDCCompViewSource,
TDCDefaultEditSource,
TDCFormSource,
TDCImageInfo,
TDCImgListSource,
TDCListViewSource,
TDCMenuSource,
TDCMultiItem,
TDCMultiItems,
TDCMultiSource,
TDCResViewSource,
TDCTreeData,
TDCTreeViewSource,
TFakeTreeSource,
TInfoList,
TListData,
TMenuNameEditor,
TTreeDataList,
TTreeNodeData
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
RegRegisterMethod(TCustomDCCollectSource,'GetItemName',TypeInfo(_T0),[
TypeInfo(TCollectionItem),TypeInfo(string)], pointer(184));

RegisterProc(TDCImageInfo,'CreateInfo',mtConstructor,TypeInfo(_T1),[
TypeInfo(TCustomImageList),
TypeInfo(Integer)],Addr(TDCImageInfo.CreateInfo),cRegister);

RegRegisterMethod(TDCImageInfo,'AddBitmap',TypeInfo(_T2),[
TypeInfo(TBitmap),
TypeInfo(Boolean)],Addr(TDCImageInfo.AddBitmap));

RegRegisterMethod(TDCMultiItems,'Add',TypeInfo(_T4),[TypeInfo(TDCMultiItem)],Addr(TDCMultiItems.Add));

RegRegisterMethod(TDCTreeData,'GetCaption',TypeInfo(_T5),[TypeInfo(string)], pointer(12));

RegRegisterMethod(TDCTreeData,'GetImageIndex',TypeInfo(_T6),[TypeInfo(Integer)], pointer(16));

RegRegisterMethod(TDCTreeData,'GetSelectedIndex',TypeInfo(_T7),[TypeInfo(Integer)], pointer(20));

RegRegisterMethod(TDCTreeData,'GetStateIndex',TypeInfo(_T8),[TypeInfo(Integer)], pointer(24));

RegisterProc(TDCTreeData,'Create',mtConstructor,TypeInfo(_T9),[
TypeInfo(TPersistent)],Addr(TDCTreeData.Create),cRegister);

RegRegisterMethod(TFakeTreeSource,'ObjectDeleted',TypeInfo(_T10),[
TypeInfo(Integer)],Addr(TFakeTreeSource.ObjectDeleted));

end;
initialization
_mreg_0;
{RegisterProc(TDCMultiItems,'Create',mtConstructor,TypeInfo(_T3),[
TypeInfo(TDCMultiSource),
TypeInfo(TCollectionItemClass)],Addr(TDCMultiItems.Create),cRegister)}

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
end.
