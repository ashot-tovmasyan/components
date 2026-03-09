{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit DcimgEd_D6;
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
  dcsystem,
  ComCtrls,
  Buttons,
  ExtCtrls,
  StdCtrls,
  ExtDlgs,
  dcdsgnstuff,
  dcpedit,
  dcgen,
  dccommon,
  dcdreamlib,
  dcedit,
  commctrl,
  dcconsts,
  consts,
  DcTree,
  dctsrc,
  imglist,
  Menus,
  dctslite,
  dcdtree,
  DcimgEd;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
_T0 = function (p0 : TCustomImageList;
var p1 : Integer): Boolean of object;

_T1 = procedure (p0 : TObject) of object;

_T2 = _T1;

_T3 = _T1;

_T4 = _T1;

_T5 = procedure (p0 : TObject;
p1 : TMouseButton;
p2 : TShiftState;
p3 : Integer;
p4 : Integer) of object;

_T6 = procedure (p0 : TObject;
var p1 : Word;
p2 : TShiftState) of object;

_T7 = _T1;

_T8 = _T1;

_T9 = _T1;

_T10 = procedure (p0 : TObject;
p1 : TListItem;
p2 : TItemChange) of object;

_T11 = _T1;

_T12 = _T1;

_T13 = _T1;

_T14 = _T1;

_T15 = _T1;

_T16 = function : TCustomImageList of object;

_T17 = function : TCustomTreeView of object;

_T18 = function : TCustomListView of object;

procedure __RegisterProps;
begin
end;

function __DC__GetDcimgEd__FrmImageEdit(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(DcimgEd.FrmImageEdit);
end;

procedure __DC__SetDcimgEd__FrmImageEdit(Instance : TObject; Params : PVariantArgList);
begin
TObject(DcimgEd.FrmImageEdit):=(VarToObject(OleVariant(Params^[0])));
end;

var __RegisteredVars : TList;
procedure __RegisterVars;
begin
__RegisteredVars := TList.Create;
__RegisteredVars.Add(RegisterVar('FrmImageEdit',__DC__GetDcimgEd__FrmImageEdit,__DC__SetDcimgEd__FrmImageEdit));
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

const ClassList : array[0..7] of TClass = (
TFrmImageEdit,
TImageListEdit,
TListImageIndexEdit,
TListImageStateEdit,
TMListView,
TMTreeView,
TTreeImageIndexEdit,
TTreeImageStateEdit
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
'EdiTCustomImageList'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T0),[
TypeInfo(TCustomImageList),
TypeInfo(Integer),TypeInfo(Boolean)],Addr(EdiTCustomImageList),cRegister);

RegRegisterMethod(TFrmImageEdit,'FormCreate',TypeInfo(_T1),[
TypeInfo(TObject)],Addr(TFrmImageEdit.FormCreate));

RegRegisterMethod(TFrmImageEdit,'ClearButtonClick',TypeInfo(_T2),[
TypeInfo(TObject)],Addr(TFrmImageEdit.ClearButtonClick));

RegRegisterMethod(TFrmImageEdit,'ButtonAddClick',TypeInfo(_T3),[
TypeInfo(TObject)],Addr(TFrmImageEdit.ButtonAddClick));

RegRegisterMethod(TFrmImageEdit,'ButtonDeleteClick',TypeInfo(_T4),[
TypeInfo(TObject)],Addr(TFrmImageEdit.ButtonDeleteClick));

RegRegisterMethod(TFrmImageEdit,'PropImageMouseDown',TypeInfo(_T5),[
TypeInfo(TObject),
TypeInfo(TMouseButton),
TypeInfo(TShiftState),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TFrmImageEdit.PropImageMouseDown));

RegRegisterMethod(TFrmImageEdit,'FormKeyDown',TypeInfo(_T6),[
TypeInfo(TObject),
TypeInfo(Word),
TypeInfo(TShiftState)],Addr(TFrmImageEdit.FormKeyDown));

RegRegisterMethod(TFrmImageEdit,'BtnOkClick',TypeInfo(_T7),[
TypeInfo(TObject)],Addr(TFrmImageEdit.BtnOkClick));

RegRegisterMethod(TFrmImageEdit,'PropCropChange',TypeInfo(_T8),[
TypeInfo(TObject)],Addr(TFrmImageEdit.PropCropChange));

RegRegisterMethod(TFrmImageEdit,'FormDestroy',TypeInfo(_T9),[
TypeInfo(TObject)],Addr(TFrmImageEdit.FormDestroy));

RegRegisterMethod(TFrmImageEdit,'ImageViewChange',TypeInfo(_T10),[
TypeInfo(TObject),
TypeInfo(TListItem),
TypeInfo(TItemChange)],Addr(TFrmImageEdit.ImageViewChange));

RegRegisterMethod(TFrmImageEdit,'ImageViewDblClick',TypeInfo(_T11),[
TypeInfo(TObject)],Addr(TFrmImageEdit.ImageViewDblClick));

RegRegisterMethod(TFrmImageEdit,'Save1Click',TypeInfo(_T12),[
TypeInfo(TObject)],Addr(TFrmImageEdit.Save1Click));

RegRegisterMethod(TFrmImageEdit,'BtnApplyClick',TypeInfo(_T13),[
TypeInfo(TObject)],Addr(TFrmImageEdit.BtnApplyClick));

RegRegisterMethod(TFrmImageEdit,'ImageViewClick',TypeInfo(_T14),[
TypeInfo(TObject)],Addr(TFrmImageEdit.ImageViewClick));

RegRegisterMethod(TFrmImageEdit,'FormShow',TypeInfo(_T15),[
TypeInfo(TObject)],Addr(TFrmImageEdit.FormShow));

RegRegisterMethod(TTreeImageIndexEdit,'GetImage',TypeInfo(_T16),[TypeInfo(TCustomImageList)], pointer(60));

RegRegisterMethod(TTreeImageIndexEdit,'GetTreeView',TypeInfo(_T17),[TypeInfo(TCustomTreeView)],Addr(TTreeImageIndexEdit.GetTreeView));

RegRegisterMethod(TTreeImageIndexEdit,'GetListView',TypeInfo(_T18),[TypeInfo(TCustomListView)],Addr(TTreeImageIndexEdit.GetListView));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
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
