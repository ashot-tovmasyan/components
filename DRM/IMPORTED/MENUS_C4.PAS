{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit MENUS_C4;
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
  Graphics,
  ImgList,
  ActnList,
  Menus;
function ConvertTRectToVariant(var R : TRect) : OleVariant;
function ConvertVariantToTRect(const V : OleVariant) : TRect;
function ConvertTWMKeyToVariant(var R : TWMKey) : OleVariant;
function ConvertVariantToTWMKey(const V : OleVariant) : TWMKey;
function ConvertTWMMenuCharToVariant(var R : TWMMenuChar) : OleVariant;
function ConvertVariantToTWMMenuChar(const V : OleVariant) : TWMMenuChar;
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
type __TWMMenuChar__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMenuChar;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUser(const val : Char);
function getUser : Char;
property User : Char read getUser write setUser;
procedure setUnused(const val : Byte);
function getUnused : Byte;
property Unused : Byte read getUnused write setUnused;
procedure setMenuFlag(const val : Word);
function getMenuFlag : Word;
property MenuFlag : Word read getMenuFlag write setMenuFlag;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TRect__Wrapper = class(TDCRecordWrapper)
private
fR : TRect;
public
function GetRecordPtr : pointer; override;
published
procedure setLeft(const val : Integer);
function getLeft : Integer;
property Left : Integer read getLeft write setLeft;
procedure setTop(const val : Integer);
function getTop : Integer;
property Top : Integer read getTop write setTop;
procedure setRight(const val : Integer);
function getRight : Integer;
property Right : Integer read getRight write setRight;
procedure setBottom(const val : Integer);
function getBottom : Integer;
property Bottom : Integer read getBottom write setBottom;
end;
type __TMenuItem__ = class(TMenuItem);
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
p3 : Array of TMenuItem;
p4 : Boolean): TMenuItem of object;

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

_T15 = procedure (p0 : TMenuItem;
p1 : Boolean) of object;

_T16 = function : HMENU of object;

_T17 = procedure (p0 : TObject;
p1 : TMenuItem;
p2 : Boolean) of object;

_T18 = function (p0 : Word): Boolean of object;

_T19 = function (p0 : HMENU): Boolean of object;

_T20 = function (p0 : Integer;
p1 : TFindItemKind): TMenuItem of object;

_T21 = function (p0 : Integer;
p1 : Boolean): THelpContext of object;

_T22 = function : Boolean of object;

_T23 = function (const p0 : IDispatch): Boolean of object;

_T24 = procedure  of object;

_T25 = procedure (const p0 : IDispatch) of object;

_T26 = procedure (p0 : TObject;
p1 : Boolean) of object;

_T27 = procedure (p0 : TCanvas;
const p1 : IDispatch;
p2 : Boolean) of object;

{_T28 = function : TMenuActionLinkClass of object;}

_T29 = procedure (p0 : Boolean) of object;

_T30 = _T24;

_T31 = procedure (p0 : Integer;
p1 : TMenuItem) of object;

_T32 = procedure (p0 : Integer) of object;

_T33 = _T24;

_T34 = function (p0 : TMenuItem): Integer of object;

_T35 = function : TMenu of object;

_T36 = procedure (p0 : TMenuItem) of object;

_T37 = _T36;

_T38 = procedure (p0 : Integer;
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
function __TWMMenuChar__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMenuChar__Wrapper.setMsg(const val : Cardinal);
begin
TWMMenuChar(GetRecordPtr^).Msg := val;
end;
function __TWMMenuChar__Wrapper.getMsg : Cardinal;
begin
result := TWMMenuChar(GetRecordPtr^).Msg;
end;
procedure __TWMMenuChar__Wrapper.setUser(const val : Char);
begin
TWMMenuChar(GetRecordPtr^).User := val;
end;
function __TWMMenuChar__Wrapper.getUser : Char;
begin
result := TWMMenuChar(GetRecordPtr^).User;
end;
procedure __TWMMenuChar__Wrapper.setUnused(const val : Byte);
begin
TWMMenuChar(GetRecordPtr^).Unused := val;
end;
function __TWMMenuChar__Wrapper.getUnused : Byte;
begin
result := TWMMenuChar(GetRecordPtr^).Unused;
end;
procedure __TWMMenuChar__Wrapper.setMenuFlag(const val : Word);
begin
TWMMenuChar(GetRecordPtr^).MenuFlag := val;
end;
function __TWMMenuChar__Wrapper.getMenuFlag : Word;
begin
result := TWMMenuChar(GetRecordPtr^).MenuFlag;
end;
procedure __TWMMenuChar__Wrapper.setResult(const val : Longint);
begin
TWMMenuChar(GetRecordPtr^).Result := val;
end;
function __TWMMenuChar__Wrapper.getResult : Longint;
begin
result := TWMMenuChar(GetRecordPtr^).Result;
end;
function __TRect__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TRect__Wrapper.setLeft(const val : Integer);
begin
TRect(GetRecordPtr^).Left := val;
end;
function __TRect__Wrapper.getLeft : Integer;
begin
result := TRect(GetRecordPtr^).Left;
end;
procedure __TRect__Wrapper.setTop(const val : Integer);
begin
TRect(GetRecordPtr^).Top := val;
end;
function __TRect__Wrapper.getTop : Integer;
begin
result := TRect(GetRecordPtr^).Top;
end;
procedure __TRect__Wrapper.setRight(const val : Integer);
begin
TRect(GetRecordPtr^).Right := val;
end;
function __TRect__Wrapper.getRight : Integer;
begin
result := TRect(GetRecordPtr^).Right;
end;
procedure __TRect__Wrapper.setBottom(const val : Integer);
begin
TRect(GetRecordPtr^).Bottom := val;
end;
function __TRect__Wrapper.getBottom : Integer;
begin
result := TRect(GetRecordPtr^).Bottom;
end;
function ____NewSubMenu__Wrapper(const p0 : string;
p1 : Word;
const p2 : string;
p3 : Array of TMenuItem;
p4 : Boolean): TMenuItem;
begin
result := NewSubMenu(p0,p1,p2,p3,p4);
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

procedure __TMenu__ProcessMenuChar__Wrapper(__Instance : TMenu;
const p0 : IDispatch);
var
__p0 : ^TWMMenuChar;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TMenu(__Instance).ProcessMenuChar(__p0^);
end;

procedure __TMenuItem__DrawItem__Wrapper(__Instance : TMenuItem;
p0 : TCanvas;
const p1 : IDispatch;
p2 : Boolean);
var
__p1 : ^TRect;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
__TMenuItem__(__Instance).DrawItem(p0,__p1^,p2);
end;


type __TRect__Wrapper__ = class(__TRect__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TRect__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTRectToVariant(var R : TRect) : OleVariant;
var
__rw : __TRect__Wrapper__;
begin
__rw := __TRect__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTRect(const V : OleVariant) : TRect;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TRect((_idisp as IDCRecordWrapper).GetRecordPtr^);
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

type __TWMMenuChar__Wrapper__ = class(__TWMMenuChar__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMenuChar__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMenuCharToVariant(var R : TWMMenuChar) : OleVariant;
var
__rw : __TWMMenuChar__Wrapper__;
begin
__rw := __TWMMenuChar__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMenuChar(const V : OleVariant) : TWMMenuChar;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMenuChar((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTMenu__Images(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TMenu(Instance).Images);
end;

procedure __DC__SetTMenu__Images(Instance : TObject; Params : PVariantArgList);
begin
TMenu(Instance).Images:=TCustomImageList(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTMenu__BiDiMode(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMenu(Instance).BiDiMode;
end;

procedure __DC__SetTMenu__BiDiMode(Instance : TObject; Params : PVariantArgList);
begin
TMenu(Instance).BiDiMode:=OleVariant(Params^[0]);
end;

function __DC__GetTMenu__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMenu(Instance).Handle;
end;

function __DC__GetTMenu__OwnerDraw(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMenu(Instance).OwnerDraw;
end;

procedure __DC__SetTMenu__OwnerDraw(Instance : TObject; Params : PVariantArgList);
begin
TMenu(Instance).OwnerDraw:=OleVariant(Params^[0]);
end;

function __DC__GetTMenu__ParentBiDiMode(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMenu(Instance).ParentBiDiMode;
end;

procedure __DC__SetTMenu__ParentBiDiMode(Instance : TObject; Params : PVariantArgList);
begin
TMenu(Instance).ParentBiDiMode:=OleVariant(Params^[0]);
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

function __DC__GetTPopupMenu__TrackButton(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPopupMenu(Instance).TrackButton;
end;

procedure __DC__SetTPopupMenu__TrackButton(Instance : TObject; Params : PVariantArgList);
begin
TPopupMenu(Instance).TrackButton:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
RegisterProperty(TMenu,'Images',__DC__GetTMenu__Images,__DC__SetTMenu__Images);
RegisterProperty(TMenu,'BiDiMode',__DC__GetTMenu__BiDiMode,__DC__SetTMenu__BiDiMode);
RegisterProperty(TMenu,'Handle',__DC__GetTMenu__Handle,nil);
RegisterProperty(TMenu,'OwnerDraw',__DC__GetTMenu__OwnerDraw,__DC__SetTMenu__OwnerDraw);
RegisterProperty(TMenu,'ParentBiDiMode',__DC__GetTMenu__ParentBiDiMode,__DC__SetTMenu__ParentBiDiMode);
RegisterProperty(TMenu,'WindowHandle',__DC__GetTMenu__WindowHandle,__DC__SetTMenu__WindowHandle);
RegisterProperty(TMenuItem,'Command',__DC__GetTMenuItem__Command,nil);
RegisterProperty(TMenuItem,'Handle',__DC__GetTMenuItem__Handle,nil);
RegisterProperty(TMenuItem,'Count',__DC__GetTMenuItem__Count,nil);
RegisterIndexedProperty(TMenuItem,'Items',1,True,__DC__GetTMenuItem__Items,nil);
RegisterProperty(TMenuItem,'MenuIndex',__DC__GetTMenuItem__MenuIndex,__DC__SetTMenuItem__MenuIndex);
RegisterProperty(TMenuItem,'Parent',__DC__GetTMenuItem__Parent,nil);
RegisterProperty(TPopupMenu,'PopupComponent',__DC__GetTPopupMenu__PopupComponent,__DC__SetTPopupMenu__PopupComponent);
RegisterProperty(TPopupMenu,'TrackButton',__DC__GetTPopupMenu__TrackButton,__DC__SetTPopupMenu__TrackButton);
end;

const __ConstNames0 : array[0..10] of string = (
'mbNone'
,'mbBreak'
,'mbBarBreak'
,'fkCommand'
,'fkHandle'
,'fkShortCut'
,'paLeft'
,'paRight'
,'paCenter'
,'tbRightButton'
,'tbLeftButton'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,mbNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,mbBreak));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,mbBarBreak));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,fkCommand));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,fkHandle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,fkShortCut));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,paLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,paRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,paCenter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,tbRightButton));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,tbLeftButton));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..5] of TClass = (
EMenuError,
TMainMenu,
TMenu,
TMenuActionLink,
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
ArrayInfo(TypeInfo(TMenuItem)),
TypeInfo(Boolean),TypeInfo(TMenuItem)],Addr(____NewSubMenu__Wrapper),cRegister);

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

RegRegisterMethod(TMenu,'DoChange',TypeInfo(_T15),[
TypeInfo(TMenuItem),
TypeInfo(Boolean)], pointer(48));

RegRegisterMethod(TMenu,'GetHandle',TypeInfo(_T16),[TypeInfo(HMENU)], pointer(52));

RegRegisterMethod(TMenu,'MenuChanged',TypeInfo(_T17),[
TypeInfo(TObject),
TypeInfo(TMenuItem),
TypeInfo(Boolean)], pointer(56));

RegRegisterMethod(TMenu,'DispatchCommand',TypeInfo(_T18),[
TypeInfo(Word),TypeInfo(Boolean)],Addr(TMenu.DispatchCommand));

RegRegisterMethod(TMenu,'DispatchPopup',TypeInfo(_T19),[
TypeInfo(HMENU),TypeInfo(Boolean)],Addr(TMenu.DispatchPopup));

RegRegisterMethod(TMenu,'FindItem',TypeInfo(_T20),[
TypeInfo(Integer),
TypeInfo(TFindItemKind),TypeInfo(TMenuItem)],Addr(TMenu.FindItem));

RegRegisterMethod(TMenu,'GetHelpContext',TypeInfo(_T21),[
TypeInfo(Integer),
TypeInfo(Boolean),TypeInfo(THelpContext)],Addr(TMenu.GetHelpContext));

RegRegisterMethod(TMenu,'IsRightToLeft',TypeInfo(_T22),[TypeInfo(Boolean)],Addr(TMenu.IsRightToLeft));

RegRegisterMethod(TMenu,'IsShortCut',TypeInfo(_T23),[
TypeInfo(IDispatch),TypeInfo(Boolean)], pointer(MinVMTOffset - 15));

RegRegisterMethod(TMenu,'ParentBiDiModeChanged',TypeInfo(_T24),NoParams,Addr(TMenu.ParentBiDiModeChanged));

RegRegisterMethod(TMenu,'ProcessMenuChar',TypeInfo(_T25),[
TypeInfo(IDispatch)],Addr(__TMenu__ProcessMenuChar__Wrapper));

RegRegisterMethod(TMenuItem,'ActionChange',TypeInfo(_T26),[
TypeInfo(TObject),
TypeInfo(Boolean)], pointer(MinVMTOffset - 15));

RegRegisterMethod(TMenuItem,'DrawItem',TypeInfo(_T27),[
TypeInfo(TCanvas),
TypeInfo(IDispatch),
TypeInfo(Boolean)], pointer(48));

RegRegisterMethod(TMenuItem,'MenuChanged',TypeInfo(_T29),[
TypeInfo(Boolean)], pointer(52));

RegRegisterMethod(TMenuItem,'InitiateAction',TypeInfo(_T30),NoParams, pointer(56));

RegRegisterMethod(TMenuItem,'Insert',TypeInfo(_T31),[
TypeInfo(Integer),
TypeInfo(TMenuItem)],Addr(TMenuItem.Insert));

RegRegisterMethod(TMenuItem,'Delete',TypeInfo(_T32),[
TypeInfo(Integer)],Addr(TMenuItem.Delete));

RegRegisterMethod(TMenuItem,'Click',TypeInfo(_T33),NoParams, pointer(60));

RegRegisterMethod(TMenuItem,'IndexOf',TypeInfo(_T34),[
TypeInfo(TMenuItem),TypeInfo(Integer)],Addr(TMenuItem.IndexOf));

RegRegisterMethod(TMenuItem,'GetParentMenu',TypeInfo(_T35),[TypeInfo(TMenu)],Addr(TMenuItem.GetParentMenu));

RegRegisterMethod(TMenuItem,'Add',TypeInfo(_T36),[
TypeInfo(TMenuItem)],Addr(TMenuItem.Add));

RegRegisterMethod(TMenuItem,'Remove',TypeInfo(_T37),[
TypeInfo(TMenuItem)],Addr(TMenuItem.Remove));

RegRegisterMethod(TPopupMenu,'Popup',TypeInfo(_T38),[
TypeInfo(Integer),
TypeInfo(Integer)], pointer(60));

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

{RegRegisterMethod(TMenuItem,'GetActionLinkClass',TypeInfo(_T28),[TypeInfo(TMenuActionLinkClass)], pointer(MinVMTOffset - 16))}

RegisterEvent(TypeInfo(TMenuChangeEvent),[
TypeInfo(TObject),
TypeInfo(TMenuItem),
TypeInfo(Boolean)]);

{RegisterEvent(TypeInfo(TMenuDrawItemEvent),[
TypeInfo(TObject),
TypeInfo(TCanvas),
TypeInfo(IDispatch),
TypeInfo(Boolean)]);}

RegisterEvent(TypeInfo(TMenuMeasureItemEvent),[
TypeInfo(TObject),
TypeInfo(TCanvas),
TypeInfo(Integer),
TypeInfo(Integer)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
