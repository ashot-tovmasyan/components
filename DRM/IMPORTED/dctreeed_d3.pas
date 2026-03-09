{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit dctreeed_D3;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  activex,
  dcscript,
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ComCtrls,
  StdCtrls,
  ExtCtrls,
  dsgnintf,
  Buttons,
  CommCtrl,
  dcgen,
  dccommon,
  menus,
  dcsystem,
  dcdtree,
  dcTree,
  dctsrc,
  dctslite,
  dcconsts,
  dcstdctl,
  treemod,
  dcdreamlib,
  dctreeed;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
_T0 = function (p0 : TComponent;
const p1 : String): TTreeEditForm of object;

{_T1 = function (p0 : TComponent;
const p1 : String;
p2 : TTreeSourceClass): TTreeEditForm of object;}

_T2 = function (p0 : TPersistent;
const p1 : String;
var p2 : Boolean): TTreeEditForm of object;

_T3 = procedure (const p0 : String) of object;

_T4 = procedure (p0 : TTreeEditForm;
p1 : TTreeSource) of object;

_T5 = procedure  of object;

_T6 = procedure (p0 : TObject) of object;

_T7 = _T6;

_T8 = _T6;

_T9 = procedure (p0 : TObject;
var p1 : TCloseAction) of object;

_T10 = procedure (p0 : TObject;
p1 : TTreeNode) of object;

_T11 = _T6;

_T12 = _T6;

_T13 = _T6;

_T14 = _T6;

_T15 = _T6;

_T16 = procedure (p0 : TObject;
p1 : TListItem;
p2 : TItemChange) of object;

_T17 = _T6;

_T18 = _T6;

_T19 = _T6;

_T20 = _T6;

_T21 = procedure (p0 : TObject;
p1 : TListItem) of object;

_T22 = _T5;

function __DC__GetTTreeEditForm__ActiveSource(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TTreeEditForm(Instance).ActiveSource);
end;

procedure __DC__SetTTreeEditForm__ActiveSource(Instance : TObject; Params : PVariantArgList);
begin
TTreeEditForm(Instance).ActiveSource:=TTreeSource(VarToObject(OleVariant(Params^[0])));
end;

procedure __RegisterProps;
begin
RegisterProperty(TTreeEditForm,'ActiveSource',__DC__GetTTreeEditForm__ActiveSource,__DC__SetTTreeEditForm__ActiveSource);
end;

function __DC__Getdctreeed__TreeEditForm(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(dctreeed.TreeEditForm);
end;

procedure __DC__Setdctreeed__TreeEditForm(Instance : TObject; Params : PVariantArgList);
begin
TObject(dctreeed.TreeEditForm):=(VarToObject(OleVariant(Params^[0])));
end;

var __RegisteredVars : TList;
procedure __RegisterVars;
begin
__RegisteredVars := TList.Create;
__RegisteredVars.Add(RegisterVar('TreeEditForm',__DC__Getdctreeed__TreeEditForm,__DC__Setdctreeed__TreeEditForm));
end;

procedure __UnregisterVars;
begin
__RegisteredVars.Free;
end;

procedure __RegisterConsts0;
begin
end;

procedure __UnregisterConsts0;
begin
end;

const ClassList : array[0..3] of TClass = (
TCollectEdit,
TMenuEdit,
TTreeEditForm,
TWindowList
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..4] of string = (
'EditObject'
,'GetTreeForm'
,'EditResource'
,'SetSource'
,'ShowWindowList'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T0),[
TypeInfo(TComponent),
TypeInfo(String),TypeInfo(TTreeEditForm)],Addr(EditObject),cRegister);

RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T2),[
TypeInfo(TPersistent),
TypeInfo(String),
TypeInfo(Boolean),TypeInfo(TTreeEditForm)],Addr(GetTreeForm),cRegister);

RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T3),[
TypeInfo(String)],Addr(EditResource),cRegister);

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T4),[
TypeInfo(TTreeEditForm),
TypeInfo(TTreeSource)],Addr(SetSource),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T5),NoParams,Addr(ShowWindowList),cRegister);

RegRegisterMethod(TTreeEditForm,'ToolButtonNewItemClick',TypeInfo(_T6),[
TypeInfo(TObject)],Addr(TTreeEditForm.ToolButtonNewItemClick));

RegRegisterMethod(TTreeEditForm,'ToolButtonNewSubItemClick',TypeInfo(_T7),[
TypeInfo(TObject)],Addr(TTreeEditForm.ToolButtonNewSubItemClick));

RegRegisterMethod(TTreeEditForm,'ToolButtonDeleteClick',TypeInfo(_T8),[
TypeInfo(TObject)],Addr(TTreeEditForm.ToolButtonDeleteClick));

RegRegisterMethod(TTreeEditForm,'FormClose',TypeInfo(_T9),[
TypeInfo(TObject),
TypeInfo(TCloseAction)],Addr(TTreeEditForm.FormClose));

RegRegisterMethod(TTreeEditForm,'TreeViewChange',TypeInfo(_T10),[
TypeInfo(TObject),
TypeInfo(TTreeNode)],Addr(TTreeEditForm.TreeViewChange));

RegRegisterMethod(TTreeEditForm,'FormCreate',TypeInfo(_T11),[
TypeInfo(TObject)],Addr(TTreeEditForm.FormCreate));

RegRegisterMethod(TTreeEditForm,'FormDestroy',TypeInfo(_T12),[
TypeInfo(TObject)],Addr(TTreeEditForm.FormDestroy));

RegRegisterMethod(TTreeEditForm,'FormShow',TypeInfo(_T13),[
TypeInfo(TObject)],Addr(TTreeEditForm.FormShow));

RegRegisterMethod(TTreeEditForm,'miStayonTopClick',TypeInfo(_T14),[
TypeInfo(TObject)],Addr(TTreeEditForm.miStayonTopClick));

RegRegisterMethod(TTreeEditForm,'RefrButClick',TypeInfo(_T15),[
TypeInfo(TObject)],Addr(TTreeEditForm.RefrButClick));

RegRegisterMethod(TTreeEditForm,'DCListViewChange',TypeInfo(_T16),[
TypeInfo(TObject),
TypeInfo(TListItem),
TypeInfo(TItemChange)],Addr(TTreeEditForm.DCListViewChange));

RegRegisterMethod(TTreeEditForm,'UpButClick',TypeInfo(_T17),[
TypeInfo(TObject)],Addr(TTreeEditForm.UpButClick));

RegRegisterMethod(TTreeEditForm,'PopupMenu2Popup',TypeInfo(_T18),[
TypeInfo(TObject)],Addr(TTreeEditForm.PopupMenu2Popup));

RegRegisterMethod(TTreeEditForm,'ListStyle1Click',TypeInfo(_T19),[
TypeInfo(TObject)],Addr(TTreeEditForm.ListStyle1Click));

RegRegisterMethod(TTreeEditForm,'InspButClick',TypeInfo(_T20),[
TypeInfo(TObject)],Addr(TTreeEditForm.InspButClick));

RegRegisterMethod(TTreeEditForm,'DCListViewSelectionChanged',TypeInfo(_T21),[
TypeInfo(TObject),
TypeInfo(TListItem)],Addr(TTreeEditForm.DCListViewSelectionChanged));

RegRegisterMethod(TWindowList,'Execute',TypeInfo(_T22),NoParams,Addr(TWindowList.Execute));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'EditObjectEx',mtProc,TypeInfo(_T1),[
TypeInfo(TComponent),
TypeInfo(String),
TypeInfo(TTreeSourceClass),TypeInfo(TTreeEditForm)],Addr(EditObjectEx),cRegister)}

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;
__RegisterVars;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnRegisterVars;
__UnregisterProcs;
end.
