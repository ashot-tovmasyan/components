{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit dcdbtree_D5;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  activex,
  dcscript,
  Windows,
  dbconsts,
  SysUtils,
  Classes,
  Dialogs,
  Messages,
  Forms,
  Controls,
  comctrls,
  dcgen,
  dcConsts,
  dcsystem,
  Db,
  DbCtrls,
  dctree,
  dcdreamlib,
  Dctsrc,
  dctslite,
  treemod,
  newfield,
  dbgrids,
  dctreeed,
  typinfo,
  imglist,
  dbtables,
  DcDbTree;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
_T0 = procedure (p0 : TDataset) of object;

_T1 = procedure (p0 : TPersistent) of object;

_T2 = _T1;

_T3 = _T1;

_T4 = _T1;

_T5 = function (p0 : TDataset;
p1 : Pointer): Boolean of object;

_T6 = procedure (p0 : Integer;
p1 : Integer;
p2 : TBookMarkStr) of object;

_T7 = function : string of object;

_T8 = function : Boolean of object;

_T9 = procedure  of object;

_T10 = _T9;

function __DC__GetTDCDataSetSource__DisplayText(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDCDataSetSource(Instance).DisplayText;
end;

procedure __DC__SetTDCDataSetSource__DisplayText(Instance : TObject; Params : PVariantArgList);
begin
TDCDataSetSource(Instance).DisplayText:=OleVariant(Params^[0]);
end;

function __DC__GetTDCDataSetSource__RootIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDCDataSetSource(Instance).RootIndex;
end;

procedure __DC__SetTDCDataSetSource__RootIndex(Instance : TObject; Params : PVariantArgList);
begin
TDCDataSetSource(Instance).RootIndex:=OleVariant(Params^[0]);
end;

function __DC__GetTDCDataSetSource__ObjectIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDCDataSetSource(Instance).ObjectIndex;
end;

procedure __DC__SetTDCDataSetSource__ObjectIndex(Instance : TObject; Params : PVariantArgList);
begin
TDCDataSetSource(Instance).ObjectIndex:=OleVariant(Params^[0]);
end;

function __DC__GetTDCDataSetSource__BookMarkList(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCDataSetSource(Instance).BookMarkList);
end;

function __DC__GetTDCParamSource__Params(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCParamSource(Instance).Params);
end;

procedure __DC__SetTDCParamSource__Params(Instance : TObject; Params : PVariantArgList);
begin
TDCParamSource(Instance).Params:=TParams(VarToObject(OleVariant(Params^[0])));
end;

procedure __RegisterProps;
begin
RegisterProperty(TDCDataSetSource,'DisplayText',__DC__GetTDCDataSetSource__DisplayText,__DC__SetTDCDataSetSource__DisplayText);
RegisterProperty(TDCDataSetSource,'RootIndex',__DC__GetTDCDataSetSource__RootIndex,__DC__SetTDCDataSetSource__RootIndex);
RegisterProperty(TDCDataSetSource,'ObjectIndex',__DC__GetTDCDataSetSource__ObjectIndex,__DC__SetTDCDataSetSource__ObjectIndex);
RegisterProperty(TDCDataSetSource,'BookMarkList',__DC__GetTDCDataSetSource__BookMarkList,nil);
RegisterProperty(TDCParamSource,'Params',__DC__GetTDCParamSource__Params,__DC__SetTDCParamSource__Params);
end;

procedure __RegisterConsts0;
begin
end;

procedure __UnregisterConsts0;
begin
end;

const ClassList : array[0..7] of TClass = (
TBookList,
TBookRec,
TDCDataSetSource,
TDCDBListView,
TDCDBTreeView,
TDCFieldSource,
TDCGridSource,
TDCParamSource
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..5] of string = (
'EditDatasetFields'
,'AddFields'
,'AddAllColumns'
,'RestoreDefault'
,'EditFields'
,'ValidBookmark'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T0),[
TypeInfo(TDataset)],Addr(EditDatasetFields),cRegister);

RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T1),[
TypeInfo(TPersistent)],Addr(AddFields),cRegister);

RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T2),[
TypeInfo(TPersistent)],Addr(AddAllColumns),cRegister);

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T3),[
TypeInfo(TPersistent)],Addr(RestoreDefault),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T4),[
TypeInfo(TPersistent)],Addr(EditFields),cRegister);

RegisterProc(nil,MethodNames[5],mtProc,TypeInfo(_T5),[
TypeInfo(TDataset),
TypeInfoPointer,TypeInfo(Boolean)],Addr(ValidBookmark),cRegister);

RegisterProc(TBookRec,'Create',mtConstructor,TypeInfo(_T6),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TBookMarkStr)],Addr(TBookRec.Create),cRegister);

RegRegisterMethod(TDCDataSetSource,'GetDisplayText',TypeInfo(_T7),[TypeInfo(string)], pointer(188));

RegRegisterMethod(TDCDataSetSource,'ValidFields',TypeInfo(_T8),[TypeInfo(Boolean)],Addr(TDCDataSetSource.ValidFields));

RegRegisterMethod(TDCFieldSource,'BeginDesign',TypeInfo(_T9),NoParams,Addr(TDCFieldSource.BeginDesign));

RegRegisterMethod(TDCFieldSource,'EndDesign',TypeInfo(_T10),NoParams,Addr(TDCFieldSource.EndDesign));

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
