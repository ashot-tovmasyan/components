{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit dcstrled_C3;
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
  dsgnintf,
  ExtCtrls,
  dcdreamlib,
  dcedit,
  Buttons,
  dccommon,
  dcgen,
  dcconsts,
  consts,
  comctrls,
  checklst,
  dcstrled;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
_T0 = function (p0 : TStrings;
const p1 : string): Boolean of object;

_T1 = procedure (p0 : TObject) of object;

_T2 = _T1;

_T3 = _T1;

_T4 = procedure (p0 : TObject;
var p1 : Word;
p2 : TShiftState) of object;

_T5 = _T1;

_T6 = _T1;

_T7 = _T1;

_T8 = _T1;

_T9 = _T1;

_T10 = procedure  of object;

_T11 = _T10;

function __DC__GetTStringsEditForm__EditObject(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TStringsEditForm(Instance).EditObject);
end;

procedure __DC__SetTStringsEditForm__EditObject(Instance : TObject; Params : PVariantArgList);
begin
TStringsEditForm(Instance).EditObject:=TComponent(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTStringsEditForm__NeedCodeEditor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStringsEditForm(Instance).NeedCodeEditor;
end;

procedure __RegisterProps;
begin
RegisterProperty(TStringsEditForm,'EditObject',__DC__GetTStringsEditForm__EditObject,__DC__SetTStringsEditForm__EditObject);
RegisterProperty(TStringsEditForm,'NeedCodeEditor',__DC__GetTStringsEditForm__NeedCodeEditor,nil);
end;

function __DC__Getdcstrled__StringsEditForm(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(dcstrled.StringsEditForm);
end;

procedure __DC__Setdcstrled__StringsEditForm(Instance : TObject; Params : PVariantArgList);
begin
TObject(dcstrled.StringsEditForm):=(VarToObject(OleVariant(Params^[0])));
end;

var __RegisteredVars : TList;
procedure __RegisterVars;
begin
__RegisteredVars := TList.Create;
__RegisteredVars.Add(RegisterVar('StringsEditForm',__DC__Getdcstrled__StringsEditForm,__DC__Setdcstrled__StringsEditForm));
end;

procedure __UnregisterVars;
begin
__RegisteredVars.Free;
end;

const __ConstNames0 : array[0..2] of string = (
'SStringsEditForm'
,'SFontName'
,'SFontSize'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,SStringsEditForm));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,SFontName));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,SFontSize));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..3] of TClass = (
TCaptionPropertyEdit,
THintPropertyEdit,
TStringListEdit,
TStringsEditForm
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
'EditStrings'
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
TypeInfo(string),TypeInfo(Boolean)],Addr(EditStrings),cRegister);

RegRegisterMethod(TStringsEditForm,'Memo1Change',TypeInfo(_T1),[
TypeInfo(TObject)],Addr(TStringsEditForm.Memo1Change));

RegRegisterMethod(TStringsEditForm,'ButtonLoadClick',TypeInfo(_T2),[
TypeInfo(TObject)],Addr(TStringsEditForm.ButtonLoadClick));

RegRegisterMethod(TStringsEditForm,'ButtonSaveClick',TypeInfo(_T3),[
TypeInfo(TObject)],Addr(TStringsEditForm.ButtonSaveClick));

RegRegisterMethod(TStringsEditForm,'FormKeyDown',TypeInfo(_T4),[
TypeInfo(TObject),
TypeInfo(Word),
TypeInfo(TShiftState)],Addr(TStringsEditForm.FormKeyDown));

RegRegisterMethod(TStringsEditForm,'FormShow',TypeInfo(_T5),[
TypeInfo(TObject)],Addr(TStringsEditForm.FormShow));

RegRegisterMethod(TStringsEditForm,'FormCreate',TypeInfo(_T6),[
TypeInfo(TObject)],Addr(TStringsEditForm.FormCreate));

RegRegisterMethod(TStringsEditForm,'CodeButtonClick',TypeInfo(_T7),[
TypeInfo(TObject)],Addr(TStringsEditForm.CodeButtonClick));

RegRegisterMethod(TStringsEditForm,'ComboBox1Change',TypeInfo(_T8),[
TypeInfo(TObject)],Addr(TStringsEditForm.ComboBox1Change));

RegRegisterMethod(TStringsEditForm,'ComboBox2Change',TypeInfo(_T9),[
TypeInfo(TObject)],Addr(TStringsEditForm.ComboBox2Change));

RegRegisterMethod(TStringsEditForm,'EditInCodeEditor',TypeInfo(_T10),NoParams,Addr(TStringsEditForm.EditInCodeEditor));

RegRegisterMethod(TStringsEditForm,'ShowNumberOfLines',TypeInfo(_T11),NoParams,Addr(TStringsEditForm.ShowNumberOfLines));

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
