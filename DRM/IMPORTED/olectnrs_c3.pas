{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit OLECTNRS_C3;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  dcscript,
  dcsystem,
  dcdreamlib,
  Windows,
  Messages,
  CommCtrl,
  ActiveX,
  OleDlg,
  SysUtils,
  Classes,
  Controls,
  Forms,
  Menus,
  Graphics,
  ComObj,
  OleCtnrs;
function ConvertTCreateInfoToVariant(var R : TCreateInfo) : OleVariant;
function ConvertVariantToTCreateInfo(const V : OleVariant) : TCreateInfo;
function ConvertTVerbInfoToVariant(var R : TVerbInfo) : OleVariant;
function ConvertVariantToTVerbInfo(const V : OleVariant) : TVerbInfo;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TCreateInfo__Wrapper = class(TDCRecordWrapper)
private
fR : TCreateInfo;
public
function GetRecordPtr : pointer; override;
published
procedure setCreateType(const val : TCreateType);
function getCreateType : TCreateType;
property CreateType : TCreateType read getCreateType write setCreateType;
procedure setShowAsIcon(const val : Boolean);
function getShowAsIcon : Boolean;
property ShowAsIcon : Boolean read getShowAsIcon write setShowAsIcon;
procedure setIconMetaPict(const val : HGlobal);
function getIconMetaPict : HGlobal;
property IconMetaPict : HGlobal read getIconMetaPict write setIconMetaPict;
procedure setFileName(const val : WideString);
function getFileName : WideString;
property FileName : WideString read getFileName write setFileName;
end;
type __TVerbInfo__Wrapper = class(TDCRecordWrapper)
private
fR : TVerbInfo;
public
function GetRecordPtr : pointer; override;
published
procedure setVerb(const val : SmallInt);
function getVerb : SmallInt;
property Verb : SmallInt read getVerb write setVerb;
procedure setFlags(const val : Word);
function getFlags : Word;
property Flags : Word read getFlags write setFlags;
end;
type
_T0 = procedure (p0 : HGlobal) of object;

_T1 = procedure  of object;

_T2 = function : Boolean of object;

_T3 = _T1;

_T4 = _T1;

_T5 = procedure (const p0 : string;
p1 : Boolean) of object;

_T6 = _T5;

_T7 = _T5;

_T8 = procedure (const p0 : IDispatch) of object;

_T9 = _T1;

_T10 = procedure (p0 : Integer) of object;

_T11 = function : HGlobal of object;

_T12 = _T2;

_T13 = procedure (const p0 : string) of object;

_T14 = procedure (p0 : TStream) of object;

_T15 = _T2;

_T16 = _T1;

_T17 = _T2;

_T18 = _T1;

_T19 = _T13;

_T20 = _T13;

_T21 = _T14;

_T22 = _T1;

_T23 = _T1;

_T24 = procedure (p0 : TCustomForm) of object;

function __TCreateInfo__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCreateInfo__Wrapper.setCreateType(const val : TCreateType);
begin
TCreateInfo(GetRecordPtr^).CreateType := val;
end;
function __TCreateInfo__Wrapper.getCreateType : TCreateType;
begin
result := TCreateInfo(GetRecordPtr^).CreateType;
end;
procedure __TCreateInfo__Wrapper.setShowAsIcon(const val : Boolean);
begin
TCreateInfo(GetRecordPtr^).ShowAsIcon := val;
end;
function __TCreateInfo__Wrapper.getShowAsIcon : Boolean;
begin
result := TCreateInfo(GetRecordPtr^).ShowAsIcon;
end;
procedure __TCreateInfo__Wrapper.setIconMetaPict(const val : HGlobal);
begin
TCreateInfo(GetRecordPtr^).IconMetaPict := val;
end;
function __TCreateInfo__Wrapper.getIconMetaPict : HGlobal;
begin
result := TCreateInfo(GetRecordPtr^).IconMetaPict;
end;
procedure __TCreateInfo__Wrapper.setFileName(const val : WideString);
begin
TCreateInfo(GetRecordPtr^).FileName := val;
end;
function __TCreateInfo__Wrapper.getFileName : WideString;
begin
result := TCreateInfo(GetRecordPtr^).FileName;
end;
function __TVerbInfo__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TVerbInfo__Wrapper.setVerb(const val : SmallInt);
begin
TVerbInfo(GetRecordPtr^).Verb := val;
end;
function __TVerbInfo__Wrapper.getVerb : SmallInt;
begin
result := TVerbInfo(GetRecordPtr^).Verb;
end;
procedure __TVerbInfo__Wrapper.setFlags(const val : Word);
begin
TVerbInfo(GetRecordPtr^).Flags := val;
end;
function __TVerbInfo__Wrapper.getFlags : Word;
begin
result := TVerbInfo(GetRecordPtr^).Flags;
end;
function _TCreateInfo_ : IDispatch;
begin
  result := __TCreateInfo__Wrapper.Create;
end;
function _TVerbInfo_ : IDispatch;
begin
  result := __TVerbInfo__Wrapper.Create;
end;
procedure __TOleContainer__CreateObjectFromInfo__Wrapper(__Instance : TOleContainer;
const p0 : IDispatch);
var
__p0 : ^TCreateInfo;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TOleContainer(__Instance).CreateObjectFromInfo(__p0^);
end;


type __TCreateInfo__Wrapper__ = class(__TCreateInfo__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCreateInfo__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCreateInfoToVariant(var R : TCreateInfo) : OleVariant;
var
__rw : __TCreateInfo__Wrapper__;
begin
__rw := __TCreateInfo__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCreateInfo(const V : OleVariant) : TCreateInfo;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCreateInfo((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TVerbInfo__Wrapper__ = class(__TVerbInfo__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TVerbInfo__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTVerbInfoToVariant(var R : TVerbInfo) : OleVariant;
var
__rw : __TVerbInfo__Wrapper__;
begin
__rw := __TVerbInfo__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTVerbInfo(const V : OleVariant) : TVerbInfo;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TVerbInfo((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTOleContainer__CanPaste(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TOleContainer(Instance).CanPaste;
end;

function __DC__GetTOleContainer__Linked(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TOleContainer(Instance).Linked;
end;

function __DC__GetTOleContainer__Modified(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TOleContainer(Instance).Modified;
end;

procedure __DC__SetTOleContainer__Modified(Instance : TObject; Params : PVariantArgList);
begin
TOleContainer(Instance).Modified:=OleVariant(Params^[0]);
end;

function __DC__GetTOleContainer__NewInserted(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TOleContainer(Instance).NewInserted;
end;

function __DC__GetTOleContainer__ObjectVerbs(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TOleContainer(Instance).ObjectVerbs);
end;

function __DC__GetTOleContainer__OleClassName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TOleContainer(Instance).OleClassName;
end;

function __DC__GetTOleContainer__OleObject(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TOleContainer(Instance).OleObject;
end;

function __DC__GetTOleContainer__PrimaryVerb(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TOleContainer(Instance).PrimaryVerb;
end;

function __DC__GetTOleContainer__SourceDoc(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TOleContainer(Instance).SourceDoc;
end;

function __DC__GetTOleContainer__State(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TOleContainer(Instance).State;
end;

procedure __RegisterProps;
begin
RegisterProperty(TOleContainer,'CanPaste',__DC__GetTOleContainer__CanPaste,nil);
RegisterProperty(TOleContainer,'Linked',__DC__GetTOleContainer__Linked,nil);
RegisterProperty(TOleContainer,'Modified',__DC__GetTOleContainer__Modified,__DC__SetTOleContainer__Modified);
RegisterProperty(TOleContainer,'NewInserted',__DC__GetTOleContainer__NewInserted,nil);
RegisterProperty(TOleContainer,'ObjectVerbs',__DC__GetTOleContainer__ObjectVerbs,nil);
RegisterProperty(TOleContainer,'OleClassName',__DC__GetTOleContainer__OleClassName,nil);
RegisterProperty(TOleContainer,'OleObject',__DC__GetTOleContainer__OleObject,nil);
RegisterProperty(TOleContainer,'PrimaryVerb',__DC__GetTOleContainer__PrimaryVerb,nil);
RegisterProperty(TOleContainer,'SourceDoc',__DC__GetTOleContainer__SourceDoc,nil);
RegisterProperty(TOleContainer,'State',__DC__GetTOleContainer__State,nil);
end;

const __ConstNames0 : array[0..25] of string = (
'ovShow'
,'ovOpen'
,'ovHide'
,'ovUIActivate'
,'ovInPlaceActivate'
,'ovDiscardUndoState'
,'ovPrimary'
,'aaManual'
,'aaGetFocus'
,'aaDoubleClick'
,'smClip'
,'smCenter'
,'smScale'
,'smStretch'
,'smAutoSize'
,'osEmpty'
,'osLoaded'
,'osRunning'
,'osOpen'
,'osInPlaceActive'
,'osUIActive'
,'ctNewObject'
,'ctFromFile'
,'ctLinkToFile'
,'ctFromData'
,'ctLinkFromData'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,ovShow));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,ovOpen));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,ovHide));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,ovUIActivate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,ovInPlaceActivate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,ovDiscardUndoState));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,ovPrimary));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,aaManual));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,aaGetFocus));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,aaDoubleClick));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,smClip));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,smCenter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,smScale));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,smStretch));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,smAutoSize));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,osEmpty));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,osLoaded));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,osRunning));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,osOpen));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,osInPlaceActive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,osUIActive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,ctNewObject));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,ctFromFile));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,ctLinkToFile));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,ctFromData));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,ctLinkFromData));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..1] of TClass = (
TOleContainer,
TOleForm
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..2] of string = (
'TCreateInfo'
,'TVerbInfo'
,'DestroyMetaPict'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TCreateInfo_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(_TVerbInfo_)));
RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T0),[
TypeInfo(HGlobal)],Addr(DestroyMetaPict),cRegister);

RegRegisterMethod(TOleContainer,'Changed',TypeInfo(_T1),NoParams, pointer(MinVMTOffset - 36));

RegRegisterMethod(TOleContainer,'ChangeIconDialog',TypeInfo(_T2),[TypeInfo(Boolean)],Addr(TOleContainer.ChangeIconDialog));

RegRegisterMethod(TOleContainer,'Close',TypeInfo(_T3),NoParams,Addr(TOleContainer.Close));

RegRegisterMethod(TOleContainer,'Copy',TypeInfo(_T4),NoParams,Addr(TOleContainer.Copy));

RegRegisterMethod(TOleContainer,'CreateLinkToFile',TypeInfo(_T5),[
TypeInfo(string),
TypeInfo(Boolean)],Addr(TOleContainer.CreateLinkToFile));

RegRegisterMethod(TOleContainer,'CreateObject',TypeInfo(_T6),[
TypeInfo(string),
TypeInfo(Boolean)],Addr(TOleContainer.CreateObject));

RegRegisterMethod(TOleContainer,'CreateObjectFromFile',TypeInfo(_T7),[
TypeInfo(string),
TypeInfo(Boolean)],Addr(TOleContainer.CreateObjectFromFile));

RegRegisterMethod(TOleContainer,'CreateObjectFromInfo',TypeInfo(_T8),[
TypeInfo(IDispatch)],Addr(__TOleContainer__CreateObjectFromInfo__Wrapper));

RegRegisterMethod(TOleContainer,'DestroyObject',TypeInfo(_T9),NoParams,Addr(TOleContainer.DestroyObject));

RegRegisterMethod(TOleContainer,'DoVerb',TypeInfo(_T10),[
TypeInfo(Integer)],Addr(TOleContainer.DoVerb));

RegRegisterMethod(TOleContainer,'GetIconMetaPict',TypeInfo(_T11),[TypeInfo(HGlobal)],Addr(TOleContainer.GetIconMetaPict));

RegRegisterMethod(TOleContainer,'InsertObjectDialog',TypeInfo(_T12),[TypeInfo(Boolean)],Addr(TOleContainer.InsertObjectDialog));

RegRegisterMethod(TOleContainer,'LoadFromFile',TypeInfo(_T13),[
TypeInfo(string)],Addr(TOleContainer.LoadFromFile));

RegRegisterMethod(TOleContainer,'LoadFromStream',TypeInfo(_T14),[
TypeInfo(TStream)],Addr(TOleContainer.LoadFromStream));

RegRegisterMethod(TOleContainer,'ObjectPropertiesDialog',TypeInfo(_T15),[TypeInfo(Boolean)],Addr(TOleContainer.ObjectPropertiesDialog));

RegRegisterMethod(TOleContainer,'Paste',TypeInfo(_T16),NoParams,Addr(TOleContainer.Paste));

RegRegisterMethod(TOleContainer,'PasteSpecialDialog',TypeInfo(_T17),[TypeInfo(Boolean)],Addr(TOleContainer.PasteSpecialDialog));

RegRegisterMethod(TOleContainer,'Run',TypeInfo(_T18),NoParams,Addr(TOleContainer.Run));

RegRegisterMethod(TOleContainer,'SaveAsDocument',TypeInfo(_T19),[
TypeInfo(string)],Addr(TOleContainer.SaveAsDocument));

RegRegisterMethod(TOleContainer,'SaveToFile',TypeInfo(_T20),[
TypeInfo(string)],Addr(TOleContainer.SaveToFile));

RegRegisterMethod(TOleContainer,'SaveToStream',TypeInfo(_T21),[
TypeInfo(TStream)],Addr(TOleContainer.SaveToStream));

RegRegisterMethod(TOleContainer,'UpdateObject',TypeInfo(_T22),NoParams,Addr(TOleContainer.UpdateObject));

RegRegisterMethod(TOleContainer,'UpdateVerbs',TypeInfo(_T23),NoParams,Addr(TOleContainer.UpdateVerbs));

RegisterProc(TOleForm,'Create',mtConstructor,TypeInfo(_T24),[
TypeInfo(TCustomForm)],Addr(TOleForm.Create),cRegister);

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterEvent(TypeInfo(TObjectMoveEvent),[
TypeInfo(TOleContainer),
TypeInfo(IDispatch)]);}

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
