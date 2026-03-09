{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit treemod_D4;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  activex,
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
  StdCtrls,
  dcgen,
  dccommon,
  dcdreamlib,
  ComCtrls,
  DcTree,
  dctslite,
  Buttons,
  ExtCtrls,
  dcconsts,
  consts,
  dcDTree,
  treemod;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
_T0 = function (p0 : TStrings;
const p1 : string;
p2 : Integer;
p3 : TStrEditOptions): Boolean of object;

_T1 = procedure (p0 : TStrings;
const p1 : string) of object;

_T2 = procedure (p0 : TComponent) of object;

_T3 = procedure (p0 : TWinControl) of object;

_T4 = function (p0 : TComponentSource;
const p1 : string;
p2 : Integer): Integer of object;

_T5 = procedure (p0 : TObject) of object;

_T6 = _T5;

_T7 = _T5;

_T8 = _T5;

function __DC__GetTStrEditForm__Multiselect(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStrEditForm(Instance).Multiselect;
end;

procedure __DC__SetTStrEditForm__Multiselect(Instance : TObject; Params : PVariantArgList);
begin
TStrEditForm(Instance).Multiselect:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
RegisterProperty(TStrEditForm,'Multiselect',__DC__GetTStrEditForm__Multiselect,__DC__SetTStrEditForm__Multiselect);
end;

function __DC__Gettreemod__StrEditForm(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(treemod.StrEditForm);
end;

procedure __DC__Settreemod__StrEditForm(Instance : TObject; Params : PVariantArgList);
begin
TObject(treemod.StrEditForm):=(VarToObject(OleVariant(Params^[0])));
end;

var __RegisteredVars : TList;
procedure __RegisterVars;
begin
__RegisteredVars := TList.Create;
__RegisteredVars.Add(RegisterVar('StrEditForm',__DC__Gettreemod__StrEditForm,__DC__Settreemod__StrEditForm));
end;

procedure __UnregisterVars;
begin
__RegisteredVars.Free;
end;

const __ConstNames0 : array[0..1] of string = (
'uoSelectAll'
,'uoTrackDblClick'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,uoSelectAll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,uoTrackDblClick));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..0] of TClass = (
TStrEditForm
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
'FilterStringsForm'
,'EditStrings'
,'ChangeCreationOrder'
,'ChangeTabOrder'
,'EditSourceModal'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T0),[
TypeInfo(TStrings),
TypeInfo(string),
TypeInfo(Integer),
TypeInfo(TStrEditOptions),TypeInfo(Boolean)],Addr(FilterStringsForm),cRegister);

RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T1),[
TypeInfo(TStrings),
TypeInfo(string)],Addr(EditStrings),cRegister);

RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T2),[
TypeInfo(TComponent)],Addr(ChangeCreationOrder),cRegister);

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T3),[
TypeInfo(TWinControl)],Addr(ChangeTabOrder),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T4),[
TypeInfo(TComponentSource),
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Integer)],Addr(EditSourceModal),cRegister);

RegRegisterMethod(TStrEditForm,'DCTreeViewDblClick',TypeInfo(_T5),[
TypeInfo(TObject)],Addr(TStrEditForm.DCTreeViewDblClick));

RegRegisterMethod(TStrEditForm,'SpeedUpClick',TypeInfo(_T6),[
TypeInfo(TObject)],Addr(TStrEditForm.SpeedUpClick));

RegRegisterMethod(TStrEditForm,'SpeedDownClick',TypeInfo(_T7),[
TypeInfo(TObject)],Addr(TStrEditForm.SpeedDownClick));

RegRegisterMethod(TStrEditForm,'FormCreate',TypeInfo(_T8),[
TypeInfo(TObject)],Addr(TStrEditForm.FormCreate));

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
