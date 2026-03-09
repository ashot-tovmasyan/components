{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit MENUS_C3;
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
  SysUtils,
  Classes,
  Messages,
  Menus;
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
_T0 = function (p0 : Word;
p1 : TShiftState): TShortCut of object;

_T1 = procedure (p0 : TShortCut;
var p1 : Word;
var p2 : TShiftState) of object;

_T2 = function (p0 : TShortCut): string of object;

_T3 = function (p0 : string): TShortCut of object;

_T4 = function (p0 : TComponent;
const p1 : string;
p2 : Array of TMenuItem): TMainMenu of object;

_T5 = function (p0 : TComponent;
const p1 : string;
p2 : TPopupAlignment;
p3 : Boolean;
p4 : Array of TMenuItem): TPopupMenu of object;

_T6 = function (const p0 : string;
p1 : Word;
const p2 : string;
p3 : Array of TMenuItem): TMenuItem of object;

{_T7 = function (const p0 : string;
p1 : TShortCut;
p2 : Boolean;
p3 : Boolean;
p4 : TNotifyEvent;
p5 : Word;
const p6 : string): TMenuItem of object;}

_T8 = function : TMenuItem of object;

_T9 = function (const p0 : string): string of object;

_T10 = procedure (p0 : TMainMenu) of object;

_T11 = _T10;

_T12 = procedure (p0 : HMENU;
p1 : Array of Integer;
var p2 : Array of Longint) of object;

_T13 = procedure (var p0 : HAccel;
var p1 : Integer;
p2 : Array of Integer) of object;

_T14 = procedure (p0 : HMENU) of object;

_T15 = procedure (p0 : TObject;
p1 : Boolean) of object;

_T16 = function : HMENU of object;

_T17 = function (p0 : Word): Boolean of object;

_T18 = function (p0 : HMENU): Boolean of object;

_T19 = function (p0 : Integer;
p1 : TFindItemKind): TMenuItem of object;

_T20 = function (p0 : Integer;
p1 : Boolean): THelpContext of object;

_T21 = function (const p0 : IDispatch): Boolean of object;

_T22 = procedure (p0 : Boolean) of object;

_T23 = procedure (p0 : Integer;
p1 : TMenuItem) of object;

_T24 = procedure (p0 : Integer) of object;

_T25 = procedure  of object;

_T26 = function (p0 : TMenuItem): Integer of object;

_T27 = procedure (p0 : TMenuItem) of object;

_T28 = _T27;

_T29 = procedure (p0 : Integer;
p1 : Integer) of object;

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
function __TMenu__IsShortCut__Wrapper(__Instance : TMenu;
const p0 : IDispatch): Boolean;
var
__p0 : ^TWMKey;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := TMenu(__Instance).IsShortCut(__p0^);
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
function __DC__GetTMenu__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMenu(Instance).Handle;
end;

function __DC__GetTMenu__WindowHandle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMenu(Instance).WindowHandle;
end;

procedure __DC__SetTMenu__WindowHandle(Instance : TObject; Params : PVariantArgList);
begin
TMenu(Instance).WindowHandle:=OleVariant(Params^[0]);
end;

function __DC__GetTMenuItem__Command(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMenuItem(Instance).Command;
end;

function __DC__GetTMenuItem__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMenuItem(Instance).Handle;
end;

function __DC__GetTMenuItem__Count(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMenuItem(Instance).Count;
end;

function __DC__GetTMenuItem__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TMenuItem(Instance).Items[OleVariant(Params^[0])]);
end;

function __DC__GetTMenuItem__MenuIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMenuItem(Instance).MenuIndex;
end;

procedure __DC__SetTMenuItem__MenuIndex(Instance : TObject; Params : PVariantArgList);
begin
TMenuItem(Instance).MenuIndex:=OleVariant(Params^[0]);
end;

function __DC__GetTMenuItem__Parent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TMenuItem(Instance).Parent);
end;

function __DC__GetTPopupMenu__PopupComponent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TPopupMenu(Instance).PopupComponent);
end;

procedure __DC__SetTPopupMenu__PopupComponent(Instance : TObject; Params : PVariantArgList);
begin
TPopupMenu(Instance).PopupComponent:=TComponent(VarToObject(OleVariant(Params^[0])));
end;

procedure __RegisterProps;
begin
RegisterProperty(TMenu,'Handle',__DC__GetTMenu__Handle,nil);
RegisterProperty(TMenu,'WindowHandle',__DC__GetTMenu__WindowHandle,__DC__SetTMenu__WindowHandle);
RegisterProperty(TMenuItem,'Command',__DC__GetTMenuItem__Command,nil);
RegisterProperty(TMenuItem,'Handle',__DC__GetTMenuItem__Handle,nil);
RegisterProperty(TMenuItem,'Count',__DC__GetTMenuItem__Count,nil);
RegisterIndexedProperty(TMenuItem,'Items',1,True,__DC__GetTMenuItem__Items,nil);
RegisterProperty(TMenuItem,'MenuIndex',__DC__GetTMenuItem__MenuIndex,__DC__SetTMenuItem__MenuIndex);
RegisterProperty(TMenuItem,'Parent',__DC__GetTMenuItem__Parent,nil);
RegisterProperty(TPopupMenu,'PopupComponent',__DC__GetTPopupMenu__PopupComponent,__DC__SetTPopupMenu__PopupComponent);
end;

const __ConstNames0 : array[0..12] of string = (
'scShift'
,'scCtrl'
,'scAlt'
,'scNone'
,'mbNone'
,'mbBreak'
,'mbBarBreak'
,'fkCommand'
,'fkHandle'
,'fkShortCut'
,'paLeft'
,'paRight'
,'paCenter'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,scShift));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,scCtrl));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,scAlt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,scNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,mbNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,mbBreak));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,mbBarBreak));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,fkCommand));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,fkHandle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,fkShortCut));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,paLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,paRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,paCenter));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..4] of TClass = (
EMenuError,
TMainMenu,
TMenu,
TMenuItem,
TPopupMenu
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..8] of string = (
'ShortCut'
,'ShortCutToKey'
,'ShortCutToText'
,'TextToShortCut'
,'NewMenu'
,'NewPopupMenu'
,'NewSubMenu'
,'NewLine'
,'StripHotKey'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T0),[
TypeInfo(Word),
TypeInfo(TShiftState),TypeInfo(TShortCut)],Addr(ShortCut),cRegister);

RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T1),[
TypeInfo(TShortCut),
TypeInfo(Word),
TypeInfo(TShiftState)],Addr(ShortCutToKey),cRegister);

RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T2),[
TypeInfo(TShortCut),TypeInfo(string)],Addr(ShortCutToText),cRegister);

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T3),[
TypeInfo(string),TypeInfo(TShortCut)],Addr(TextToShortCut),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T4),[
TypeInfo(TComponent),
TypeInfo(string),
ArrayInfo(TypeInfo(TMenuItem)),TypeInfo(TMainMenu)],Addr(NewMenu),cRegister);

RegisterProc(nil,MethodNames[5],mtProc,TypeInfo(_T5),[
TypeInfo(TComponent),
TypeInfo(string),
TypeInfo(TPopupAlignment),
TypeInfo(Boolean),
ArrayInfo(TypeInfo(TMenuItem)),TypeInfo(TPopupMenu)],Addr(NewPopupMenu),cRegister);

RegisterProc(nil,MethodNames[6],mtProc,TypeInfo(_T6),[
TypeInfo(string),
TypeInfo(Word),
TypeInfo(string),
ArrayInfo(TypeInfo(TMenuItem)),TypeInfo(TMenuItem)],Addr(NewSubMenu),cRegister);

RegisterProc(nil,MethodNames[7],mtProc,TypeInfo(_T8),[TypeInfo(TMenuItem)],Addr(NewLine),cRegister);

RegisterProc(nil,MethodNames[8],mtProc,TypeInfo(_T9),[
TypeInfo(string),TypeInfo(string)],Addr(StripHotKey),cRegister);

RegRegisterMethod(TMainMenu,'Merge',TypeInfo(_T10),[
TypeInfo(TMainMenu)],Addr(TMainMenu.Merge));

RegRegisterMethod(TMainMenu,'Unmerge',TypeInfo(_T11),[
TypeInfo(TMainMenu)],Addr(TMainMenu.Unmerge));

RegRegisterMethod(TMainMenu,'PopulateOle2Menu',TypeInfo(_T12),[
TypeInfo(HMENU),
ArrayInfo(TypeInfo(Integer)),
ArrayInfo(TypeInfo(Longint))],Addr(TMainMenu.PopulateOle2Menu));

RegRegisterMethod(TMainMenu,'GetOle2AcceleratorTable',TypeInfo(_T13),[
TypeInfo(HAccel),
TypeInfo(Integer),
ArrayInfo(TypeInfo(Integer))],Addr(TMainMenu.GetOle2AcceleratorTable));

RegRegisterMethod(TMainMenu,'SetOle2MenuHandle',TypeInfo(_T14),[
TypeInfo(HMENU)],Addr(TMainMenu.SetOle2MenuHandle));

RegRegisterMethod(TMenu,'MenuChanged',TypeInfo(_T15),[
TypeInfo(TObject),
TypeInfo(Boolean)], pointer(44));

RegRegisterMethod(TMenu,'GetHandle',TypeInfo(_T16),[TypeInfo(HMENU)], pointer(48));

RegRegisterMethod(TMenu,'DispatchCommand',TypeInfo(_T17),[
TypeInfo(Word),TypeInfo(Boolean)],Addr(TMenu.DispatchCommand));

RegRegisterMethod(TMenu,'DispatchPopup',TypeInfo(_T18),[
TypeInfo(HMENU),TypeInfo(Boolean)],Addr(TMenu.DispatchPopup));

RegRegisterMethod(TMenu,'FindItem',TypeInfo(_T19),[
TypeInfo(Integer),
TypeInfo(TFindItemKind),TypeInfo(TMenuItem)],Addr(TMenu.FindItem));

RegRegisterMethod(TMenu,'GetHelpContext',TypeInfo(_T20),[
TypeInfo(Integer),
TypeInfo(Boolean),TypeInfo(THelpContext)],Addr(TMenu.GetHelpContext));

RegRegisterMethod(TMenu,'IsShortCut',TypeInfo(_T21),[
TypeInfo(IDispatch),TypeInfo(Boolean)],Addr(__TMenu__IsShortCut__Wrapper));

RegRegisterMethod(TMenuItem,'MenuChanged',TypeInfo(_T22),[
TypeInfo(Boolean)], pointer(44));

RegRegisterMethod(TMenuItem,'Insert',TypeInfo(_T23),[
TypeInfo(Integer),
TypeInfo(TMenuItem)],Addr(TMenuItem.Insert));

RegRegisterMethod(TMenuItem,'Delete',TypeInfo(_T24),[
TypeInfo(Integer)],Addr(TMenuItem.Delete));

RegRegisterMethod(TMenuItem,'Click',TypeInfo(_T25),NoParams, pointer(48));

RegRegisterMethod(TMenuItem,'IndexOf',TypeInfo(_T26),[
TypeInfo(TMenuItem),TypeInfo(Integer)],Addr(TMenuItem.IndexOf));

RegRegisterMethod(TMenuItem,'Add',TypeInfo(_T27),[
TypeInfo(TMenuItem)],Addr(TMenuItem.Add));

RegRegisterMethod(TMenuItem,'Remove',TypeInfo(_T28),[
TypeInfo(TMenuItem)],Addr(TMenuItem.Remove));

RegRegisterMethod(TPopupMenu,'Popup',TypeInfo(_T29),[
TypeInfo(Integer),
TypeInfo(Integer)], pointer(52));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'NewItem',mtProc,TypeInfo(_T7),[
TypeInfo(string),
TypeInfo(TShortCut),
TypeInfo(Boolean),
TypeInfo(Boolean),
TypeInfo(TNotifyEvent),
TypeInfo(Word),
TypeInfo(string),TypeInfo(TMenuItem)],Addr(NewItem),cRegister)}

RegisterEvent(TypeInfo(TMenuChangeEvent),[
TypeInfo(TObject),
TypeInfo(Boolean)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
