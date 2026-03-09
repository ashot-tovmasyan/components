{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit OUTLINE_D4;
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
  Messages,
  Forms,
  Classes,
  Graphics,
  Menus,
  StdCtrls,
  Grids,
  Controls,
  SysUtils,
  Outline;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
_T0 = procedure (p0 : Longint) of object;

_T1 = _T0;

_T2 = function (p0 : Longint;
const p1 : string): Longint of object;

_T3 = _T2;

_T4 = function (p0 : Longint;
const p1 : string;
const p2 : Pointer): Longint of object;

_T5 = _T4;

_T6 = _T2;

_T7 = _T4;

_T8 = _T0;

_T9 = function (p0 : Pointer): Longint of object;

_T10 = function (p0 : Integer;
p1 : Integer): Longint of object;

_T11 = function (p0 : TOutlineNode): Integer of object;

_T12 = function (const p0 : string): Longint of object;

_T13 = function (p0 : Longint): TOutlineNode of object;

_T14 = procedure  of object;

_T15 = _T14;

_T16 = procedure (const p0 : string) of object;

_T17 = procedure (p0 : TStream) of object;

_T18 = _T16;

_T19 = _T17;

_T20 = _T14;

_T21 = _T14;

_T22 = procedure (p0 : Boolean) of object;

_T23 = _T14;

_T24 = procedure (p0 : TCustomOutline) of object;

_T25 = procedure (p0 : TChangeRange) of object;

_T26 = _T14;

_T27 = _T14;

_T28 = _T14;

_T29 = function : Integer of object;

_T30 = function : Longint of object;

_T31 = _T30;

_T32 = function (p0 : Longint): Longint of object;

_T33 = _T32;

_T34 = procedure (p0 : Longint;
p1 : TAttachMode) of object;

function __DC__GetTCustomOutline__ItemCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomOutline(Instance).ItemCount;
end;

function __DC__GetTCustomOutline__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomOutline(Instance).Items[OleVariant(Params^[0])]);
end;

function __DC__GetTCustomOutline__SelectedItem(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomOutline(Instance).SelectedItem;
end;

procedure __DC__SetTCustomOutline__SelectedItem(Instance : TObject; Params : PVariantArgList);
begin
TCustomOutline(Instance).SelectedItem:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomOutline__Row(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomOutline(Instance).Row;
end;

procedure __DC__SetTCustomOutline__Row(Instance : TObject; Params : PVariantArgList);
begin
TCustomOutline(Instance).Row:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomOutline__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomOutline(Instance).Canvas);
end;

function __DC__GetTOutlineNode__Parent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TOutlineNode(Instance).Parent);
end;

function __DC__GetTOutlineNode__Expanded(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TOutlineNode(Instance).Expanded;
end;

procedure __DC__SetTOutlineNode__Expanded(Instance : TObject; Params : PVariantArgList);
begin
TOutlineNode(Instance).Expanded:=OleVariant(Params^[0]);
end;

function __DC__GetTOutlineNode__Text(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TOutlineNode(Instance).Text;
end;

procedure __DC__SetTOutlineNode__Text(Instance : TObject; Params : PVariantArgList);
begin
TOutlineNode(Instance).Text:=OleVariant(Params^[0]);
end;

function __DC__GetTOutlineNode__Data(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(TOutlineNode(Instance).Data);
end;

procedure __DC__SetTOutlineNode__Data(Instance : TObject; Params : PVariantArgList);
begin
TOutlineNode(Instance).Data:=VarToPointer(OleVariant(Params^[0]));
end;

function __DC__GetTOutlineNode__Index(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TOutlineNode(Instance).Index;
end;

function __DC__GetTOutlineNode__Level(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TOutlineNode(Instance).Level;
end;

procedure __DC__SetTOutlineNode__Level(Instance : TObject; Params : PVariantArgList);
begin
TOutlineNode(Instance).Level:=OleVariant(Params^[0]);
end;

function __DC__GetTOutlineNode__HasItems(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TOutlineNode(Instance).HasItems;
end;

function __DC__GetTOutlineNode__IsVisible(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TOutlineNode(Instance).IsVisible;
end;

function __DC__GetTOutlineNode__TopItem(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TOutlineNode(Instance).TopItem;
end;

function __DC__GetTOutlineNode__FullPath(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TOutlineNode(Instance).FullPath;
end;

procedure __RegisterProps;
begin
RegisterProperty(TCustomOutline,'ItemCount',__DC__GetTCustomOutline__ItemCount,nil);
RegisterIndexedProperty(TCustomOutline,'Items',1,True,__DC__GetTCustomOutline__Items,nil);
RegisterProperty(TCustomOutline,'SelectedItem',__DC__GetTCustomOutline__SelectedItem,__DC__SetTCustomOutline__SelectedItem);
RegisterProperty(TCustomOutline,'Row',__DC__GetTCustomOutline__Row,__DC__SetTCustomOutline__Row);
RegisterProperty(TCustomOutline,'Canvas',__DC__GetTCustomOutline__Canvas,nil);
RegisterProperty(TOutlineNode,'Parent',__DC__GetTOutlineNode__Parent,nil);
RegisterProperty(TOutlineNode,'Expanded',__DC__GetTOutlineNode__Expanded,__DC__SetTOutlineNode__Expanded);
RegisterProperty(TOutlineNode,'Text',__DC__GetTOutlineNode__Text,__DC__SetTOutlineNode__Text);
RegisterProperty(TOutlineNode,'Data',__DC__GetTOutlineNode__Data,__DC__SetTOutlineNode__Data);
RegisterProperty(TOutlineNode,'Index',__DC__GetTOutlineNode__Index,nil);
RegisterProperty(TOutlineNode,'Level',__DC__GetTOutlineNode__Level,__DC__SetTOutlineNode__Level);
RegisterProperty(TOutlineNode,'HasItems',__DC__GetTOutlineNode__HasItems,nil);
RegisterProperty(TOutlineNode,'IsVisible',__DC__GetTOutlineNode__IsVisible,nil);
RegisterProperty(TOutlineNode,'TopItem',__DC__GetTOutlineNode__TopItem,nil);
RegisterProperty(TOutlineNode,'FullPath',__DC__GetTOutlineNode__FullPath,nil);
end;

const __ConstNames0 : array[0..22] of string = (
'ocLess'
,'ocSame'
,'ocGreater'
,'ocInvalid'
,'oaAdd'
,'oaAddChild'
,'oaInsert'
,'osText'
,'osPlusMinusText'
,'osPictureText'
,'osPlusMinusPictureText'
,'osTreeText'
,'osTreePictureText'
,'obPlus'
,'obMinus'
,'obOpen'
,'obClose'
,'obLeaf'
,'otStandard'
,'otOwnerDraw'
,'ooDrawTreeRoot'
,'ooDrawFocusRect'
,'ooStretchBitmaps'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,ocLess));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,ocSame));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,ocGreater));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,ocInvalid));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,oaAdd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,oaAddChild));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,oaInsert));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,osText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,osPlusMinusText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,osPictureText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,osPlusMinusPictureText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,osTreeText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,osTreePictureText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,obPlus));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,obMinus));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,obOpen));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,obClose));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,obLeaf));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,otStandard));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,otOwnerDraw));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,ooDrawTreeRoot));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,ooDrawFocusRect));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,ooStretchBitmaps));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..4] of TClass = (
EOutlineError,
OutlineError,
TCustomOutline,
TOutline,
TOutlineNode
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
RegRegisterMethod(TCustomOutline,'Expand',TypeInfo(_T0),[
TypeInfo(Longint)], pointer(MinVMTOffset - 92));

RegRegisterMethod(TCustomOutline,'Collapse',TypeInfo(_T1),[
TypeInfo(Longint)], pointer(MinVMTOffset - 93));

RegRegisterMethod(TCustomOutline,'Add',TypeInfo(_T2),[
TypeInfo(Longint),
TypeInfo(string),TypeInfo(Longint)],Addr(TCustomOutline.Add));

RegRegisterMethod(TCustomOutline,'AddChild',TypeInfo(_T3),[
TypeInfo(Longint),
TypeInfo(string),TypeInfo(Longint)],Addr(TCustomOutline.AddChild));

RegRegisterMethod(TCustomOutline,'AddChildObject',TypeInfo(_T4),[
TypeInfo(Longint),
TypeInfo(string),
TypeInfoPointer,TypeInfo(Longint)],Addr(TCustomOutline.AddChildObject));

RegRegisterMethod(TCustomOutline,'AddObject',TypeInfo(_T5),[
TypeInfo(Longint),
TypeInfo(string),
TypeInfoPointer,TypeInfo(Longint)],Addr(TCustomOutline.AddObject));

RegRegisterMethod(TCustomOutline,'Insert',TypeInfo(_T6),[
TypeInfo(Longint),
TypeInfo(string),TypeInfo(Longint)],Addr(TCustomOutline.Insert));

RegRegisterMethod(TCustomOutline,'InsertObject',TypeInfo(_T7),[
TypeInfo(Longint),
TypeInfo(string),
TypeInfoPointer,TypeInfo(Longint)],Addr(TCustomOutline.InsertObject));

RegRegisterMethod(TCustomOutline,'Delete',TypeInfo(_T8),[
TypeInfo(Longint)],Addr(TCustomOutline.Delete));

RegRegisterMethod(TCustomOutline,'GetDataItem',TypeInfo(_T9),[
TypeInfoPointer,TypeInfo(Longint)],Addr(TCustomOutline.GetDataItem));

RegRegisterMethod(TCustomOutline,'GetItem',TypeInfo(_T10),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Longint)],Addr(TCustomOutline.GetItem));

RegRegisterMethod(TCustomOutline,'GetNodeDisplayWidth',TypeInfo(_T11),[
TypeInfo(TOutlineNode),TypeInfo(Integer)],Addr(TCustomOutline.GetNodeDisplayWidth));

RegRegisterMethod(TCustomOutline,'GetTextItem',TypeInfo(_T12),[
TypeInfo(string),TypeInfo(Longint)],Addr(TCustomOutline.GetTextItem));

RegRegisterMethod(TCustomOutline,'GetVisibleNode',TypeInfo(_T13),[
TypeInfo(Longint),TypeInfo(TOutlineNode)],Addr(TCustomOutline.GetVisibleNode));

RegRegisterMethod(TCustomOutline,'FullExpand',TypeInfo(_T14),NoParams,Addr(TCustomOutline.FullExpand));

RegRegisterMethod(TCustomOutline,'FullCollapse',TypeInfo(_T15),NoParams,Addr(TCustomOutline.FullCollapse));

RegRegisterMethod(TCustomOutline,'LoadFromFile',TypeInfo(_T16),[
TypeInfo(string)],Addr(TCustomOutline.LoadFromFile));

RegRegisterMethod(TCustomOutline,'LoadFromStream',TypeInfo(_T17),[
TypeInfo(TStream)],Addr(TCustomOutline.LoadFromStream));

RegRegisterMethod(TCustomOutline,'SaveToFile',TypeInfo(_T18),[
TypeInfo(string)],Addr(TCustomOutline.SaveToFile));

RegRegisterMethod(TCustomOutline,'SaveToStream',TypeInfo(_T19),[
TypeInfo(TStream)],Addr(TCustomOutline.SaveToStream));

RegRegisterMethod(TCustomOutline,'BeginUpdate',TypeInfo(_T20),NoParams,Addr(TCustomOutline.BeginUpdate));

RegRegisterMethod(TCustomOutline,'EndUpdate',TypeInfo(_T21),NoParams,Addr(TCustomOutline.EndUpdate));

RegRegisterMethod(TCustomOutline,'SetUpdateState',TypeInfo(_T22),[
TypeInfo(Boolean)],Addr(TCustomOutline.SetUpdateState));

RegRegisterMethod(TCustomOutline,'Clear',TypeInfo(_T23),NoParams,Addr(TCustomOutline.Clear));

RegisterProc(TOutlineNode,'Create',mtConstructor,TypeInfo(_T24),[
TypeInfo(TCustomOutline)],Addr(TOutlineNode.Create),cRegister);

RegRegisterMethod(TOutlineNode,'ChangeLevelBy',TypeInfo(_T25),[
TypeInfo(TChangeRange)],Addr(TOutlineNode.ChangeLevelBy));

RegRegisterMethod(TOutlineNode,'Collapse',TypeInfo(_T26),NoParams,Addr(TOutlineNode.Collapse));

RegRegisterMethod(TOutlineNode,'Expand',TypeInfo(_T27),NoParams,Addr(TOutlineNode.Expand));

RegRegisterMethod(TOutlineNode,'FullExpand',TypeInfo(_T28),NoParams,Addr(TOutlineNode.FullExpand));

RegRegisterMethod(TOutlineNode,'GetDisplayWidth',TypeInfo(_T29),[TypeInfo(Integer)],Addr(TOutlineNode.GetDisplayWidth));

RegRegisterMethod(TOutlineNode,'getFirstChild',TypeInfo(_T30),[TypeInfo(Longint)],Addr(TOutlineNode.getFirstChild));

RegRegisterMethod(TOutlineNode,'GetLastChild',TypeInfo(_T31),[TypeInfo(Longint)],Addr(TOutlineNode.GetLastChild));

RegRegisterMethod(TOutlineNode,'GetNextChild',TypeInfo(_T32),[
TypeInfo(Longint),TypeInfo(Longint)],Addr(TOutlineNode.GetNextChild));

RegRegisterMethod(TOutlineNode,'GetPrevChild',TypeInfo(_T33),[
TypeInfo(Longint),TypeInfo(Longint)],Addr(TOutlineNode.GetPrevChild));

RegRegisterMethod(TOutlineNode,'MoveTo',TypeInfo(_T34),[
TypeInfo(Longint),
TypeInfo(TAttachMode)],Addr(TOutlineNode.MoveTo));

end;
initialization
_mreg_0;
RegisterEvent(TypeInfo(EOutlineChange),[
TypeInfo(TObject),
TypeInfo(Longint)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
end.
