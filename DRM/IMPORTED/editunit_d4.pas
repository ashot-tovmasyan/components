{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit editunit_D4;
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
  ExtCtrls,
  ComCtrls,
  StdCtrls,
  dcmemo,
  Menus,
  dccommon,
  dcstring,
  dcconsts,
  dcdreamlib,
  EditUnit;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
_T0 = function (p0 : TCustomMemoSource;
p1 : TShowSourceParams): TEditForm of object;

_T1 = function (p0 : TCustomMemoSource): Boolean of object;

_T2 = procedure (p0 : TCustomMemoSource) of object;

_T3 = function : TCustomMemoSource of object;

_T4 = procedure (p0 : TStatusBar;
p1 : TDCMemo;
p2 : TMemoStates) of object;

_T5 = procedure (p0 : TObject) of object;

_T6 = _T5;

_T7 = procedure (p0 : TObject;
var p1 : Word;
p2 : TShiftState) of object;

_T8 = procedure (p0 : TObject;
p1 : TMemoStates) of object;

_T9 = procedure (p0 : TObject;
var p1 : TCloseAction) of object;

_T10 = _T5;

procedure __RegisterProps;
begin
end;

function __DC__GetEditUnit__EditForm(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(EditUnit.EditForm);
end;

procedure __DC__SetEditUnit__EditForm(Instance : TObject; Params : PVariantArgList);
begin
TObject(EditUnit.EditForm):=(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetEditUnit__MaxToFullScreen(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := EditUnit.MaxToFullScreen;
end;

procedure __DC__SetEditUnit__MaxToFullScreen(Instance : TObject; Params : PVariantArgList);
begin
EditUnit.MaxToFullScreen:=OleVariant(Params^[0]);
end;

var __RegisteredVars : TList;
procedure __RegisterVars;
begin
__RegisteredVars := TList.Create;
__RegisteredVars.Add(RegisterVar('EditForm',__DC__GetEditUnit__EditForm,__DC__SetEditUnit__EditForm));
__RegisteredVars.Add(RegisterVar('MaxToFullScreen',__DC__GetEditUnit__MaxToFullScreen,__DC__SetEditUnit__MaxToFullScreen));
end;

procedure __UnregisterVars;
begin
__RegisteredVars.Free;
end;

const __ConstNames0 : array[0..2] of string = (
'spCenterOnLine'
,'spMakeTop'
,'spCreateNew'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,spCenterOnLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,spMakeTop));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,spCreateNew));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..0] of TClass = (
TEditForm
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
'ShowMemoSource'
,'SourceIsFocused'
,'HideMemoSource'
,'GetActiveSource'
,'UpdateStatusBar'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T0),[
TypeInfo(TCustomMemoSource),
TypeInfo(TShowSourceParams),TypeInfo(TEditForm)],Addr(ShowMemoSource),cRegister);

RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T1),[
TypeInfo(TCustomMemoSource),TypeInfo(Boolean)],Addr(SourceIsFocused),cRegister);

RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T2),[
TypeInfo(TCustomMemoSource)],Addr(HideMemoSource),cRegister);

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T3),[TypeInfo(TCustomMemoSource)],Addr(GetActiveSource),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T4),[
TypeInfo(TStatusBar),
TypeInfo(TDCMemo),
TypeInfo(TMemoStates)],Addr(UpdateStatusBar),cRegister);

RegRegisterMethod(TEditForm,'FormCreate',TypeInfo(_T5),[
TypeInfo(TObject)],Addr(TEditForm.FormCreate));

RegRegisterMethod(TEditForm,'FormDestroy',TypeInfo(_T6),[
TypeInfo(TObject)],Addr(TEditForm.FormDestroy));

RegRegisterMethod(TEditForm,'FormKeyDown',TypeInfo(_T7),[
TypeInfo(TObject),
TypeInfo(Word),
TypeInfo(TShiftState)],Addr(TEditForm.FormKeyDown));

RegRegisterMethod(TEditForm,'MemoStateChange',TypeInfo(_T8),[
TypeInfo(TObject),
TypeInfo(TMemoStates)],Addr(TEditForm.MemoStateChange));

RegRegisterMethod(TEditForm,'FormClose',TypeInfo(_T9),[
TypeInfo(TObject),
TypeInfo(TCloseAction)],Addr(TEditForm.FormClose));

RegRegisterMethod(TEditForm,'TabControlChange',TypeInfo(_T10),[
TypeInfo(TObject)],Addr(TEditForm.TabControlChange));

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
