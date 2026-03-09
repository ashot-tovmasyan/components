{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit ACTNLIST_D5;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  Windows,
  activex,
  dcscript,
  dcsystem,
  dcdreamlib,
  Classes,
  Messages,
  ImgList,
  ActnList;
function ConvertTWMKeyToVariant(var R : TWMKey) : OleVariant;
function ConvertVariantToTWMKey(const V : OleVariant) : TWMKey;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TWMKey__Wrapper = class(TDCRecordWrapper)
private
fR : TWMKey;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setCharCode(const val : Word);
function getCharCode : Word;
property CharCode : Word read getCharCode write setCharCode;
procedure setUnused(const val : Word);
function getUnused : Word;
property Unused : Word read getUnused write setUnused;
procedure setKeyData(const val : Longint);
function getKeyData : Longint;
property KeyData : Longint read getKeyData write setKeyData;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type
{_T0 = procedure (const p0 : string;
const p1 : Array of TBasicActionClass;
p2 : TComponentClass) of object;}

{_T1 = procedure (const p0 : Array of TBasicActionClass) of object;}

{_T2 = procedure (p0 : TEnumActionProc;
p1 : Pointer) of object;}

{_T3 = function (p0 : TComponent;
p1 : TBasicActionClass): TBasicAction of object;}

_T4 = function : Boolean of object;

_T5 = _T4;

_T6 = _T4;

_T7 = _T4;

_T8 = _T4;

_T9 = _T4;

_T10 = _T4;

_T11 = _T4;

_T12 = procedure (const p0 : string) of object;

_T13 = procedure (p0 : Boolean) of object;

_T14 = _T13;

_T15 = procedure (p0 : THelpContext) of object;

_T16 = _T12;

_T17 = procedure (p0 : Integer) of object;

_T18 = procedure (p0 : TShortCut) of object;

_T19 = _T13;

_T20 = function (var p0 : string): Boolean of object;

_T21 = procedure  of object;

_T22 = function (const p0 : IDispatch): Boolean of object;

function __TWMKey__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMKey__Wrapper.setMsg(const val : Cardinal);
begin
TWMKey(GetRecordPtr^).Msg := val;
end;
function __TWMKey__Wrapper.getMsg : Cardinal;
begin
result := TWMKey(GetRecordPtr^).Msg;
end;
procedure __TWMKey__Wrapper.setCharCode(const val : Word);
begin
TWMKey(GetRecordPtr^).CharCode := val;
end;
function __TWMKey__Wrapper.getCharCode : Word;
begin
result := TWMKey(GetRecordPtr^).CharCode;
end;
procedure __TWMKey__Wrapper.setUnused(const val : Word);
begin
TWMKey(GetRecordPtr^).Unused := val;
end;
function __TWMKey__Wrapper.getUnused : Word;
begin
result := TWMKey(GetRecordPtr^).Unused;
end;
procedure __TWMKey__Wrapper.setKeyData(const val : Longint);
begin
TWMKey(GetRecordPtr^).KeyData := val;
end;
function __TWMKey__Wrapper.getKeyData : Longint;
begin
result := TWMKey(GetRecordPtr^).KeyData;
end;
procedure __TWMKey__Wrapper.setResult(const val : Longint);
begin
TWMKey(GetRecordPtr^).Result := val;
end;
function __TWMKey__Wrapper.getResult : Longint;
begin
result := TWMKey(GetRecordPtr^).Result;
end;
function __TCustomActionList__IsShortCut__Wrapper(__Instance : TCustomActionList;
const p0 : IDispatch): Boolean;
var
__p0 : ^TWMKey;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := TCustomActionList(__Instance).IsShortCut(__p0^);
end;


type __TWMKey__Wrapper__ = class(__TWMKey__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMKey__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMKeyToVariant(var R : TWMKey) : OleVariant;
var
__rw : __TWMKey__Wrapper__;
begin
__rw := __TWMKey__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMKey(const V : OleVariant) : TWMKey;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMKey((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTContainedAction__ActionList(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TContainedAction(Instance).ActionList);
end;

procedure __DC__SetTContainedAction__ActionList(Instance : TObject; Params : PVariantArgList);
begin
TContainedAction(Instance).ActionList:=TCustomActionList(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTContainedAction__Index(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TContainedAction(Instance).Index;
end;

procedure __DC__SetTContainedAction__Index(Instance : TObject; Params : PVariantArgList);
begin
TContainedAction(Instance).Index:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomAction__Caption(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomAction(Instance).Caption;
end;

procedure __DC__SetTCustomAction__Caption(Instance : TObject; Params : PVariantArgList);
begin
TCustomAction(Instance).Caption:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomAction__Checked(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomAction(Instance).Checked;
end;

procedure __DC__SetTCustomAction__Checked(Instance : TObject; Params : PVariantArgList);
begin
TCustomAction(Instance).Checked:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomAction__DisableIfNoHandler(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomAction(Instance).DisableIfNoHandler;
end;

procedure __DC__SetTCustomAction__DisableIfNoHandler(Instance : TObject; Params : PVariantArgList);
begin
TCustomAction(Instance).DisableIfNoHandler:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomAction__Enabled(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomAction(Instance).Enabled;
end;

procedure __DC__SetTCustomAction__Enabled(Instance : TObject; Params : PVariantArgList);
begin
TCustomAction(Instance).Enabled:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomAction__HelpContext(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomAction(Instance).HelpContext;
end;

procedure __DC__SetTCustomAction__HelpContext(Instance : TObject; Params : PVariantArgList);
begin
TCustomAction(Instance).HelpContext:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomAction__Hint(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomAction(Instance).Hint;
end;

procedure __DC__SetTCustomAction__Hint(Instance : TObject; Params : PVariantArgList);
begin
TCustomAction(Instance).Hint:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomAction__ImageIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomAction(Instance).ImageIndex;
end;

procedure __DC__SetTCustomAction__ImageIndex(Instance : TObject; Params : PVariantArgList);
begin
TCustomAction(Instance).ImageIndex:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomAction__ShortCut(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomAction(Instance).ShortCut;
end;

procedure __DC__SetTCustomAction__ShortCut(Instance : TObject; Params : PVariantArgList);
begin
TCustomAction(Instance).ShortCut:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomAction__Visible(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomAction(Instance).Visible;
end;

procedure __DC__SetTCustomAction__Visible(Instance : TObject; Params : PVariantArgList);
begin
TCustomAction(Instance).Visible:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomActionList__Actions(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomActionList(Instance).Actions[OleVariant(Params^[0])]);
end;

procedure __DC__SetTCustomActionList__Actions(Instance : TObject; Params : PVariantArgList);
begin
TCustomActionList(Instance).Actions[OleVariant(Params^[1])]:=TContainedAction(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomActionList__ActionCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomActionList(Instance).ActionCount;
end;

function __DC__GetTCustomActionList__Images(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomActionList(Instance).Images);
end;

procedure __DC__SetTCustomActionList__Images(Instance : TObject; Params : PVariantArgList);
begin
TCustomActionList(Instance).Images:=TCustomImageList(VarToObject(OleVariant(Params^[0])));
end;

procedure __RegisterProps;
begin
RegisterProperty(TContainedAction,'ActionList',__DC__GetTContainedAction__ActionList,__DC__SetTContainedAction__ActionList);
RegisterProperty(TContainedAction,'Index',__DC__GetTContainedAction__Index,__DC__SetTContainedAction__Index);
RegisterProperty(TCustomAction,'Caption',__DC__GetTCustomAction__Caption,__DC__SetTCustomAction__Caption);
RegisterProperty(TCustomAction,'Checked',__DC__GetTCustomAction__Checked,__DC__SetTCustomAction__Checked);
RegisterProperty(TCustomAction,'DisableIfNoHandler',__DC__GetTCustomAction__DisableIfNoHandler,__DC__SetTCustomAction__DisableIfNoHandler);
RegisterProperty(TCustomAction,'Enabled',__DC__GetTCustomAction__Enabled,__DC__SetTCustomAction__Enabled);
RegisterProperty(TCustomAction,'HelpContext',__DC__GetTCustomAction__HelpContext,__DC__SetTCustomAction__HelpContext);
RegisterProperty(TCustomAction,'Hint',__DC__GetTCustomAction__Hint,__DC__SetTCustomAction__Hint);
RegisterProperty(TCustomAction,'ImageIndex',__DC__GetTCustomAction__ImageIndex,__DC__SetTCustomAction__ImageIndex);
RegisterProperty(TCustomAction,'ShortCut',__DC__GetTCustomAction__ShortCut,__DC__SetTCustomAction__ShortCut);
RegisterProperty(TCustomAction,'Visible',__DC__GetTCustomAction__Visible,__DC__SetTCustomAction__Visible);
RegisterIndexedProperty(TCustomActionList,'Actions',1,True,__DC__GetTCustomActionList__Actions,__DC__SetTCustomActionList__Actions);
RegisterProperty(TCustomActionList,'ActionCount',__DC__GetTCustomActionList__ActionCount,nil);
RegisterProperty(TCustomActionList,'Images',__DC__GetTCustomActionList__Images,__DC__SetTCustomActionList__Images);
end;

procedure __RegisterConsts0;
begin
end;

procedure __UnregisterConsts0;
begin
end;

const ClassList : array[0..5] of TClass = (
TAction,
TActionLink,
TActionList,
TContainedAction,
TCustomAction,
TCustomActionList
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
RegRegisterMethod(TActionLink,'IsCaptionLinked',TypeInfo(_T4),[TypeInfo(Boolean)], pointer(32));

RegRegisterMethod(TActionLink,'IsCheckedLinked',TypeInfo(_T5),[TypeInfo(Boolean)], pointer(36));

RegRegisterMethod(TActionLink,'IsEnabledLinked',TypeInfo(_T6),[TypeInfo(Boolean)], pointer(40));

RegRegisterMethod(TActionLink,'IsHelpContextLinked',TypeInfo(_T7),[TypeInfo(Boolean)], pointer(44));

RegRegisterMethod(TActionLink,'IsHintLinked',TypeInfo(_T8),[TypeInfo(Boolean)], pointer(48));

RegRegisterMethod(TActionLink,'IsImageIndexLinked',TypeInfo(_T9),[TypeInfo(Boolean)], pointer(52));

RegRegisterMethod(TActionLink,'IsShortCutLinked',TypeInfo(_T10),[TypeInfo(Boolean)], pointer(56));

RegRegisterMethod(TActionLink,'IsVisibleLinked',TypeInfo(_T11),[TypeInfo(Boolean)], pointer(60));

RegRegisterMethod(TActionLink,'SetCaption',TypeInfo(_T12),[
TypeInfo(string)], pointer(64));

RegRegisterMethod(TActionLink,'SetChecked',TypeInfo(_T13),[
TypeInfo(Boolean)], pointer(68));

RegRegisterMethod(TActionLink,'SetEnabled',TypeInfo(_T14),[
TypeInfo(Boolean)], pointer(72));

RegRegisterMethod(TActionLink,'SetHelpContext',TypeInfo(_T15),[
TypeInfo(THelpContext)], pointer(76));

RegRegisterMethod(TActionLink,'SetHint',TypeInfo(_T16),[
TypeInfo(string)], pointer(80));

RegRegisterMethod(TActionLink,'SetImageIndex',TypeInfo(_T17),[
TypeInfo(Integer)], pointer(84));

RegRegisterMethod(TActionLink,'SetShortCut',TypeInfo(_T18),[
TypeInfo(TShortCut)], pointer(88));

RegRegisterMethod(TActionLink,'SetVisible',TypeInfo(_T19),[
TypeInfo(Boolean)], pointer(92));

RegRegisterMethod(TCustomAction,'DoHint',TypeInfo(_T20),[
TypeInfo(string),TypeInfo(Boolean)], pointer(MinVMTOffset - 16));

RegRegisterMethod(TCustomActionList,'Change',TypeInfo(_T21),NoParams, pointer(48));

RegRegisterMethod(TCustomActionList,'IsShortCut',TypeInfo(_T22),[
TypeInfo(IDispatch),TypeInfo(Boolean)],Addr(__TCustomActionList__IsShortCut__Wrapper));

end;
initialization
_mreg_0;
{RegisterProc(nil,'RegisterActions',mtProc,TypeInfo(_T0),[
TypeInfo(string),
ArrayInfo(TypeInfo(TBasicActionClass)),
TypeInfo(TComponentClass)],Addr(RegisterActions),cRegister)}

{RegisterProc(nil,'UnRegisterActions',mtProc,TypeInfo(_T1),[
ArrayInfo(TypeInfo(TBasicActionClass))],Addr(UnRegisterActions),cRegister)}

{RegisterProc(nil,'EnumRegisteredActions',mtProc,TypeInfo(_T2),[
TypeInfo(TEnumActionProc),
TypeInfoPointer],Addr(EnumRegisteredActions),cRegister)}

{RegisterProc(nil,'CreateAction',mtProc,TypeInfo(_T3),[
TypeInfo(TComponent),
TypeInfo(TBasicActionClass),TypeInfo(TBasicAction)],Addr(CreateAction),cRegister)}

RegisterEvent(TypeInfo(TActionEvent),[
TypeInfo(TBasicAction),
TypeInfo(Boolean)]);

{RegisterEvent(TypeInfo(TEnumActionProc),[
TypeInfo(string),
TypeInfo(TBasicActionClass),
TypeInfoPointer]);}

RegisterEvent(TypeInfo(THintEvent),[
TypeInfo(string),
TypeInfo(Boolean)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
end.
