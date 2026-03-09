{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit dcgen_C3;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  dcscript,
  dcsystem,
  dccommon,
  consts,
  Registry,
  SysUtils,
  Windows,
  Controls,
  Messages,
  Forms,
  Classes,
  StdCtrls,
  extctrls,
  dsgnintf,
  TypInfo,
  shellapi,
  comctrls,
  dialogs,
  graphics,
  clipbrd,
  menus,
  dcvcllib,
  dcdreamlib,
  dcapi,
  rerrdlg,
  dcVarPropEd,
  commctrl,
  buttons,
  dcconsts,
  activex,
  oleconst,
  DCGen;
function ConvertTGUIDToVariant(var R : TGUID) : OleVariant;
function ConvertVariantToTGUID(const V : OleVariant) : TGUID;
function ConvertTNodeRecToVariant(var R : TNodeRec) : OleVariant;
function ConvertVariantToTNodeRec(const V : OleVariant) : TNodeRec;
function ConvertTSizeToVariant(var R : TSize) : OleVariant;
function ConvertVariantToTSize(const V : OleVariant) : TSize;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TNodeRec__Wrapper = class(TDCRecordWrapper)
private
fR : TNodeRec;
public
function GetRecordPtr : pointer; override;
published
procedure setObjId(const val : Integer);
function getObjId : Integer;
property ObjId : Integer read getObjId write setObjId;
procedure setRootId(const val : Integer);
function getRootId : Integer;
property RootId : Integer read getRootId write setRootId;
procedure setDestId(const val : Integer);
function getDestId : Integer;
property DestId : Integer read getDestId write setDestId;
procedure setCaption(const val : AnsiString);
function getCaption : AnsiString;
property Caption : AnsiString read getCaption write setCaption;
procedure setImageIndex(const val : Integer);
function getImageIndex : Integer;
property ImageIndex : Integer read getImageIndex write setImageIndex;
procedure setSelectedIndex(const val : Integer);
function getSelectedIndex : Integer;
property SelectedIndex : Integer read getSelectedIndex write setSelectedIndex;
procedure setStateIndex(const val : Integer);
function getStateIndex : Integer;
property StateIndex : Integer read getStateIndex write setStateIndex;
procedure setOverlayIndex(const val : Integer);
function getOverlayIndex : Integer;
property OverlayIndex : Integer read getOverlayIndex write setOverlayIndex;
procedure setTreeSource(const val : TTreeSource);
function getTreeSource : TTreeSource;
property TreeSource : TTreeSource read getTreeSource write setTreeSource;
procedure setInsertType(const val : TNodeAttachMode);
function getInsertType : TNodeAttachMode;
property InsertType : TNodeAttachMode read getInsertType write setInsertType;
procedure setFontColor(const val : TColor);
function getFontColor : TColor;
property FontColor : TColor read getFontColor write setFontColor;
end;
type __TSize__Wrapper = class(TDCRecordWrapper)
private
fR : TSize;
public
function GetRecordPtr : pointer; override;
published
procedure setcx(const val : Longint);
function getcx : Longint;
property cx : Longint read getcx write setcx;
procedure setcy(const val : Longint);
function getcy : Longint;
property cy : Longint read getcy write setcy;
end;
type __TGUID__Wrapper = class(TDCRecordWrapper)
private
fR : TGUID;
public
function GetRecordPtr : pointer; override;
published
procedure setD1(const val : Integer);
function getD1 : Integer;
property D1 : Integer read getD1 write setD1;
procedure setD2(const val : Word);
function getD2 : Word;
property D2 : Word read getD2 write setD2;
procedure setD3(const val : Word);
function getD3 : Word;
property D3 : Word read getD3 write setD3;
end;
type
_T0 = function (p0 : TStrings): Boolean of object;

_T1 = function (const p0 : string): Boolean of object;

_T2 = _T1;

_T3 = function (p0 : TPersistent;
const p1 : string;
var p2 : TDCDsgnProp): TDCDsgnProp of object;

_T4 = procedure (p0 : TWinControl) of object;

_T5 = _T4;

_T6 = function (p0 : POleVariant;
p1 : POleVariant): Integer of object;

_T7 = procedure (const p0 : Variant) of object;

{_T8 = procedure (p0 : TPersistent;
p1 : TPropChangeProc) of object;}

{_T9 = procedure (p0 : TPersistent;
p1 : TPropChangeProc) of object;}

_T10 = function (const p0 : string;
p1 : HFONT;
var p2 : Integer;
var p3 : Integer;
var p4 : Integer): IDispatch of object;

_T11 = function (p0 : Char;
p1 : HFONT;
var p2 : Integer;
var p3 : Integer;
var p4 : Integer): IDispatch of object;

_T12 = function (p0 : Char;
p1 : HFONT): Integer of object;

_T13 = _T12;

_T14 = function : Integer of object;

_T15 = function (const p0 : string;
var p1 : string): Boolean of object;

_T16 = function (p0 : THandle): TWinControl of object;

_T17 = procedure (p0 : TMemo) of object;

_T18 = function : TNotifierListEx of object;

_T19 = procedure (p0 : TListItem;
p1 : TListItem;
p2 : TNodeAttachMode) of object;

_T20 = procedure  of object;

_T21 = _T20;

_T22 = _T20;

_T23 = _T20;

_T24 = _T20;

_T25 = _T20;

_T26 = _T20;

{_T27 = function (const p0 : IUnknown): ITypeInfo of object;}

_T28 = procedure (p0 : TCustomForm) of object;

_T29 = procedure (p0 : TBitmap;
const p1 : string) of object;

_T30 = procedure (p0 : TBitmap) of object;

{_T31 = procedure (p0 : TBitmap;
p1 : TClass) of object;}

{_T32 = function (var p0 : THandle;
p1 : TClass;
const p2 : string): string of object;}

{_T33 = function (var p0 : THandle;
p1 : TClass;
const p2 : string): string of object;}

_T34 = procedure (p0 : TPersistent;
const p1 : string) of object;

_T35 = function (p0 : TColor): DWORD of object;

{_T36 = procedure (p0 : TClass;
p1 : TTreeSourceClass;
const p2 : string) of object;}

{_T37 = procedure (p0 : TClass;
p1 : TTreeSourceClass;
const p2 : string) of object;}

{_T38 = function (p0 : TClass;
const p1 : string): TTreeSourceClass of object;}

{_T39 = procedure (const p0 : string;
p1 : TPersistentClass;
const p2 : string) of object;}

{_T40 = procedure (const p0 : string;
p1 : TPersistentClass;
p2 : TActionProc) of object;}

{_T41 = function (p0 : TClass): THandle of object;}

_T42 = procedure (p0 : string;
p1 : Boolean) of object;

_T43 = procedure (p0 : TComponent;
p1 : TList) of object;

_T44 = procedure (p0 : TCustomForm;
p1 : Integer) of object;

_T45 = procedure (p0 : TComponent) of object;

_T46 = _T45;

_T47 = function : Boolean of object;

_T48 = function : TDataModule of object;

_T49 = function : TList of object;

_T50 = function (p0 : TCustomForm): TDataModule of object;

_T51 = function (p0 : TDataModule): TCustomForm of object;

_T52 = function (p0 : TPageControl): TTabSheet of object;

_T53 = procedure (p0 : TPageControl;
p1 : Boolean) of object;

_T54 = procedure (p0 : TPageControl;
const p1 : Array of string;
p2 : Boolean) of object;

_T55 = procedure (p0 : TPageControl) of object;

_T56 = procedure (p0 : TTabControl;
const p1 : string) of object;

_T57 = procedure (p0 : TCustomImageList;
const p1 : string) of object;

_T58 = function (p0 : TCustomImageList;
const p1 : string;
p2 : THandle): Integer of object;

_T59 = function (p0 : TCustomImageList;
const p1 : string): Boolean of object;

_T60 = function (p0 : TCustomImageList;
const p1 : string;
p2 : THandle): Boolean of object;

_T61 = function (p0 : TMenuItem;
p1 : Tmenu): Boolean of object;

_T62 = function (p0 : TControl): TPopupMenu of object;

_T63 = procedure (p0 : TPopupMenu;
p1 : TPopupMenu) of object;

_T64 = procedure (p0 : TPopupMenu;
p1 : TPopupMenu;
p2 : TDCDsgnComp) of object;

_T65 = function : TFormStyle of object;

_T66 = procedure (p0 : TForm) of object;

_T67 = function (p0 : TForm): Boolean of object;

_T68 = function (p0 : TFormDesigner;
p1 : Integer): string of object;

_T69 = procedure (p0 : TComponentList;
p1 : TList) of object;

_T70 = procedure (p0 : TList;
p1 : TComponentList) of object;

_T71 = procedure (p0 : TPersistent) of object;

_T72 = function (p0 : TPersistent): TDesigner of object;

_T73 = function (p0 : TPersistent): TFormDesigner of object;

_T74 = function : TDesignerList of object;

_T75 = function (const p0 : TFormDesigner): Boolean of object;

_T76 = function (const p0 : string): string of object;

_T77 = _T76;

_T78 = function (const p0 : TDCDsgnProp): TPropertyEditor of object;

{_T79 = procedure (p0 : TGetStrProc) of object;}

{_T80 = procedure (p0 : TDCEnumShortCutProc;
p1 : Pointer) of object;}

{_T81 = procedure (p0 : Integer;
p1 : TDCEnumShortCutProc;
p2 : Pointer) of object;}

{_T82 = procedure (const p0 : Array of Integer;
p1 : Integer;
p2 : TDCEnumShortCutProc;
p3 : Pointer) of object;}

{_T83 = procedure (p0 : Integer;
p1 : TDCEnumShortCutProc;
p2 : Pointer) of object;}

_T84 = procedure (p0 : TFont) of object;

_T85 = function (p0 : TColor): TColor of object;

_T86 = procedure (const p0 : TFormDesigner;
p1 : TCustomForm) of object;

_T87 = function (const p0 : TFormDesigner): TCustomForm of object;

_T88 = function (p0 : TPersistent;
p1 : Integer): TCollectionItem of object;

_T89 = function (p0 : TPersistent;
p1 : Integer): string of object;

_T90 = procedure (p0 : TPersistent;
p1 : Integer) of object;

_T91 = function (p0 : TPersistent): Integer of object;

{_T92 = procedure (const p0 : string;
p1 : TPersistentClass;
p2 : TActionProc) of object;}

{_T93 = procedure (const p0 : string;
p1 : TPersistentClass;
const p2 : string) of object;}

_T94 = procedure (p0 : TObject;
p1 : Exception) of object;

_T95 = _T20;

_T96 = _T20;

_T97 = _T20;

_T98 = function (const p0 : IDispatch): TAxControlInfo of object;

_T99 = procedure (p0 : TStrings) of object;

_T100 = _T20;

_T101 = function (const p0 : IDispatch): Boolean of object;

_T102 = procedure (p0 : TAxControlInfo) of object;

_T103 = _T102;

_T104 = _T47;

_T105 = _T47;

_T106 = _T47;

_T107 = _T47;

_T108 = _T47;

_T109 = function : TComponent of object;

_T110 = _T47;

_T111 = _T20;

_T112 = function (p0 : TPersistent): Boolean of object;

_T113 = function (p0 : TComponent;
const p1 : string): Boolean of object;

_T114 = function (p0 : TList;
const p1 : string): Boolean of object;

_T115 = _T113;

_T116 = _T114;

_T117 = _T112;

_T118 = _T71;

_T119 = procedure (p0 : Integer;
p1 : Integer;
p2 : Integer) of object;

_T120 = procedure (p0 : Integer) of object;

_T121 = _T71;

_T122 = _T120;

_T123 = function : TCustomImageList of object;

_T124 = _T123;

_T125 = _T123;

_T126 = procedure (p0 : TCustomImageList) of object;

_T127 = _T126;

_T128 = _T126;

_T129 = _T14;

_T130 = function : TPersistent of object;

{_T131 = procedure (p0 : Integer;
p1 : TIteratorProc) of object;}

_T132 = procedure (p0 : Integer;
const p1 : string) of object;

_T133 = procedure (p0 : Integer;
const p1 : string;
p2 : TNodeAttachMode) of object;

_T134 = _T20;

_T135 = _T120;

_T136 = function (p0 : Integer;
p1 : Integer;
p2 : TNodeAttachMode): Boolean of object;

_T137 = procedure (p0 : Integer;
p1 : Integer;
p2 : TNodeAttachMode) of object;

_T138 = _T20;

_T139 = _T20;

_T140 = function (p0 : Integer): TPersistent of object;

_T141 = function (p0 : Integer;
p1 : TActionCode): Boolean of object;

_T142 = function (p0 : Integer): string of object;

_T143 = _T14;

_T144 = _T142;

_T145 = function (p0 : Integer;
p1 : Integer): string of object;

_T146 = _T142;

_T147 = _T47;

_T148 = _T120;

_T149 = function : TSortType of object;

_T150 = function (p0 : Integer): Boolean of object;

_T151 = function (p0 : Integer): Integer of object;

function __TNodeRec__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TNodeRec__Wrapper.setObjId(const val : Integer);
begin
TNodeRec(GetRecordPtr^).ObjId := val;
end;
function __TNodeRec__Wrapper.getObjId : Integer;
begin
result := TNodeRec(GetRecordPtr^).ObjId;
end;
procedure __TNodeRec__Wrapper.setRootId(const val : Integer);
begin
TNodeRec(GetRecordPtr^).RootId := val;
end;
function __TNodeRec__Wrapper.getRootId : Integer;
begin
result := TNodeRec(GetRecordPtr^).RootId;
end;
procedure __TNodeRec__Wrapper.setDestId(const val : Integer);
begin
TNodeRec(GetRecordPtr^).DestId := val;
end;
function __TNodeRec__Wrapper.getDestId : Integer;
begin
result := TNodeRec(GetRecordPtr^).DestId;
end;
procedure __TNodeRec__Wrapper.setCaption(const val : AnsiString);
begin
TNodeRec(GetRecordPtr^).Caption := val;
end;
function __TNodeRec__Wrapper.getCaption : AnsiString;
begin
result := TNodeRec(GetRecordPtr^).Caption;
end;
procedure __TNodeRec__Wrapper.setImageIndex(const val : Integer);
begin
TNodeRec(GetRecordPtr^).ImageIndex := val;
end;
function __TNodeRec__Wrapper.getImageIndex : Integer;
begin
result := TNodeRec(GetRecordPtr^).ImageIndex;
end;
procedure __TNodeRec__Wrapper.setSelectedIndex(const val : Integer);
begin
TNodeRec(GetRecordPtr^).SelectedIndex := val;
end;
function __TNodeRec__Wrapper.getSelectedIndex : Integer;
begin
result := TNodeRec(GetRecordPtr^).SelectedIndex;
end;
procedure __TNodeRec__Wrapper.setStateIndex(const val : Integer);
begin
TNodeRec(GetRecordPtr^).StateIndex := val;
end;
function __TNodeRec__Wrapper.getStateIndex : Integer;
begin
result := TNodeRec(GetRecordPtr^).StateIndex;
end;
procedure __TNodeRec__Wrapper.setOverlayIndex(const val : Integer);
begin
TNodeRec(GetRecordPtr^).OverlayIndex := val;
end;
function __TNodeRec__Wrapper.getOverlayIndex : Integer;
begin
result := TNodeRec(GetRecordPtr^).OverlayIndex;
end;
procedure __TNodeRec__Wrapper.setTreeSource(const val : TTreeSource);
begin
TNodeRec(GetRecordPtr^).TreeSource := val;
end;
function __TNodeRec__Wrapper.getTreeSource : TTreeSource;
begin
result := TNodeRec(GetRecordPtr^).TreeSource;
end;
procedure __TNodeRec__Wrapper.setInsertType(const val : TNodeAttachMode);
begin
TNodeRec(GetRecordPtr^).InsertType := val;
end;
function __TNodeRec__Wrapper.getInsertType : TNodeAttachMode;
begin
result := TNodeRec(GetRecordPtr^).InsertType;
end;
procedure __TNodeRec__Wrapper.setFontColor(const val : TColor);
begin
TNodeRec(GetRecordPtr^).FontColor := val;
end;
function __TNodeRec__Wrapper.getFontColor : TColor;
begin
result := TNodeRec(GetRecordPtr^).FontColor;
end;
function _TNodeRec_ : IDispatch;
begin
  result := __TNodeRec__Wrapper.Create;
end;
function __TSize__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TSize__Wrapper.setcx(const val : Longint);
begin
TSize(GetRecordPtr^).cx := val;
end;
function __TSize__Wrapper.getcx : Longint;
begin
result := TSize(GetRecordPtr^).cx;
end;
procedure __TSize__Wrapper.setcy(const val : Longint);
begin
TSize(GetRecordPtr^).cy := val;
end;
function __TSize__Wrapper.getcy : Longint;
begin
result := TSize(GetRecordPtr^).cy;
end;
function __TGUID__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TGUID__Wrapper.setD1(const val : Integer);
begin
TGUID(GetRecordPtr^).D1 := val;
end;
function __TGUID__Wrapper.getD1 : Integer;
begin
result := TGUID(GetRecordPtr^).D1;
end;
procedure __TGUID__Wrapper.setD2(const val : Word);
begin
TGUID(GetRecordPtr^).D2 := val;
end;
function __TGUID__Wrapper.getD2 : Word;
begin
result := TGUID(GetRecordPtr^).D2;
end;
procedure __TGUID__Wrapper.setD3(const val : Word);
begin
TGUID(GetRecordPtr^).D3 := val;
end;
function __TGUID__Wrapper.getD3 : Word;
begin
result := TGUID(GetRecordPtr^).D3;
end;
function ____GetStringSize__Wrapper(const p0 : string;
p1 : HFONT;
var p2 : Integer;
var p3 : Integer;
var p4 : Integer): IDispatch;
var
__result : TSize;
__wrapper : __TSize__Wrapper;
begin
__result := GetStringSize(p0,p1,p2,p3,p4);
__wrapper := __TSize__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function ____GetSymbolSize__Wrapper(p0 : Char;
p1 : HFONT;
var p2 : Integer;
var p3 : Integer;
var p4 : Integer): IDispatch;
var
__result : TSize;
__wrapper : __TSize__Wrapper;
begin
__result := GetSymbolSize(p0,p1,p2,p3,p4);
__wrapper := __TSize__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function __TAxControlCollection__ItemByGUID__Wrapper(__Instance : TAxControlCollection;
const p0 : IDispatch): TAxControlInfo;
var
__p0 : ^TGUID;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := TAxControlCollection(__Instance).ItemByGUID(__p0^);
end;

function __TDCApplication__ActiveXRegistered__Wrapper(__Instance : TDCApplication;
const p0 : IDispatch): Boolean;
var
__p0 : ^TGUID;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := TDCApplication(__Instance).ActiveXRegistered(__p0^);
end;


type __TGUID__Wrapper__ = class(__TGUID__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TGUID__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTGUIDToVariant(var R : TGUID) : OleVariant;
var
__rw : __TGUID__Wrapper__;
begin
__rw := __TGUID__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTGUID(const V : OleVariant) : TGUID;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TGUID((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TNodeRec__Wrapper__ = class(__TNodeRec__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TNodeRec__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTNodeRecToVariant(var R : TNodeRec) : OleVariant;
var
__rw : __TNodeRec__Wrapper__;
begin
__rw := __TNodeRec__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTNodeRec(const V : OleVariant) : TNodeRec;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TNodeRec((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TSize__Wrapper__ = class(__TSize__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TSize__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTSizeToVariant(var R : TSize) : OleVariant;
var
__rw : __TSize__Wrapper__;
begin
__rw := __TSize__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTSize(const V : OleVariant) : TSize;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TSize((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTActionListItem__ActionName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TActionListItem(Instance).ActionName;
end;

procedure __DC__SetTActionListItem__ActionName(Instance : TObject; Params : PVariantArgList);
begin
TActionListItem(Instance).ActionName:=OleVariant(Params^[0]);
end;

function __DC__GetTActionListItem__PropName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TActionListItem(Instance).PropName;
end;

procedure __DC__SetTActionListItem__PropName(Instance : TObject; Params : PVariantArgList);
begin
TActionListItem(Instance).PropName:=OleVariant(Params^[0]);
end;

function __DC__GetTActionListItem__CallType(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TActionListItem(Instance).CallType;
end;

procedure __DC__SetTActionListItem__CallType(Instance : TObject; Params : PVariantArgList);
begin
TActionListItem(Instance).CallType:=OleVariant(Params^[0]);
end;

function __DC__GetTDCApplication__ActionList(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCApplication(Instance).ActionList);
end;

function __DC__GetTDCApplication__GUIDS(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCApplication(Instance).GUIDS);
end;

function __DC__GetTDesignerList__Designers(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDesignerList(Instance).Designers[OleVariant(Params^[0])]);
end;

function __DC__GetTFDesigner__LimitControl(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TFDesigner(Instance).LimitControl);
end;

procedure __DC__SetTFDesigner__LimitControl(Instance : TObject; Params : PVariantArgList);
begin
TFDesigner(Instance).LimitControl:=TWinControl(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTFDesigner__OwnerControl(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TFDesigner(Instance).OwnerControl);
end;

procedure __DC__SetTFDesigner__OwnerControl(Instance : TObject; Params : PVariantArgList);
begin
TFDesigner(Instance).OwnerControl:=TComponent(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTFDesigner__Selection(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TFDesigner(Instance).Selection);
end;

procedure __RegisterProps;
begin
RegisterProperty(TActionListItem,'ActionName',__DC__GetTActionListItem__ActionName,__DC__SetTActionListItem__ActionName);
RegisterProperty(TActionListItem,'PropName',__DC__GetTActionListItem__PropName,__DC__SetTActionListItem__PropName);
RegisterProperty(TActionListItem,'CallType',__DC__GetTActionListItem__CallType,__DC__SetTActionListItem__CallType);
RegisterProperty(TDCApplication,'ActionList',__DC__GetTDCApplication__ActionList,nil);
RegisterProperty(TDCApplication,'GUIDS',__DC__GetTDCApplication__GUIDS,nil);
RegisterIndexedProperty(TDesignerList,'Designers',1,True,__DC__GetTDesignerList__Designers,nil);
RegisterProperty(TFDesigner,'LimitControl',__DC__GetTFDesigner__LimitControl,__DC__SetTFDesigner__LimitControl);
RegisterProperty(TFDesigner,'OwnerControl',__DC__GetTFDesigner__OwnerControl,__DC__SetTFDesigner__OwnerControl);
RegisterProperty(TFDesigner,'Selection',__DC__GetTFDesigner__Selection,nil);
end;

function __DC__GetDCGen__ToolFormsOnTop(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := DCGen.ToolFormsOnTop;
end;

procedure __DC__SetDCGen__ToolFormsOnTop(Instance : TObject; Params : PVariantArgList);
begin
DCGen.ToolFormsOnTop:=OleVariant(Params^[0]);
end;

function __DC__GetDCGen__HideEventsInInspector(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := DCGen.HideEventsInInspector;
end;

procedure __DC__SetDCGen__HideEventsInInspector(Instance : TObject; Params : PVariantArgList);
begin
DCGen.HideEventsInInspector:=OleVariant(Params^[0]);
end;

function __DC__GetDCGen__App(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(DCGen.App);
end;

procedure __DC__SetDCGen__App(Instance : TObject; Params : PVariantArgList);
begin
TObject(DCGen.App):=(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetDCGen__DCRegisteringStdProps(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := DCGen.DCRegisteringStdProps;
end;

procedure __DC__SetDCGen__DCRegisteringStdProps(Instance : TObject; Params : PVariantArgList);
begin
DCGen.DCRegisteringStdProps:=OleVariant(Params^[0]);
end;

var __RegisteredVars : TList;
procedure __RegisterVars;
begin
__RegisteredVars := TList.Create;
__RegisteredVars.Add(RegisterVar('ToolFormsOnTop',__DC__GetDCGen__ToolFormsOnTop,__DC__SetDCGen__ToolFormsOnTop));
__RegisteredVars.Add(RegisterVar('HideEventsInInspector',__DC__GetDCGen__HideEventsInInspector,__DC__SetDCGen__HideEventsInInspector));
__RegisteredVars.Add(RegisterVar('App',__DC__GetDCGen__App,__DC__SetDCGen__App));
__RegisteredVars.Add(RegisterVar('DCRegisteringStdProps',__DC__GetDCGen__DCRegisteringStdProps,__DC__SetDCGen__DCRegisteringStdProps));
end;

procedure __UnregisterVars;
begin
__RegisteredVars.Free;
end;

const __ConstNames0 : array[0..41] of string = (
'TSOBJECTCHANGED'
,'TSREFRESH'
,'TSDELETE'
,'TSSELCHANGED'
,'TSSELEXPANDED'
,'TSINSERT'
,'TSMOVETO'
,'acCanHaveChild'
,'acCanClear'
,'acCanDelete'
,'acCanAdd'
,'acCanAddChild'
,'acShowModal'
,'acMultiSelect'
,'acShowLines'
,'acShowToolBar'
,'acCanDrag'
,'acCanEdit'
,'acShowPopup'
,'acShowSourceinPopup'
,'acSelectInspector'
,'acRefreshDelete'
,'acShowTreeview'
,'acShowListView'
,'acUser'
,'SVerbCfgPackagesActivex'
,'SVerbCfgPackages'
,'ctPropName'
,'ctActionProc'
,'foCopy'
,'foDelete'
,'foMove'
,'foRename'
,'ffAllowUndo'
,'ffFilesOnly'
,'ffNoConfirmation'
,'ffNoConfirmMkDir'
,'ffNoErrorUI'
,'ffRenameCollision'
,'ffSilent'
,'ffSimpleProgress'
,'rtBitmap'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,TSOBJECTCHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,TSREFRESH));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,TSDELETE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,TSSELCHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,TSSELEXPANDED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,TSINSERT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,TSMOVETO));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,acCanHaveChild));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,acCanClear));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,acCanDelete));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,acCanAdd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,acCanAddChild));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,acShowModal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,acMultiSelect));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,acShowLines));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,acShowToolBar));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,acCanDrag));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,acCanEdit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,acShowPopup));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,acShowSourceinPopup));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,acSelectInspector));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,acRefreshDelete));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,acShowTreeview));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,acShowListView));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,acUser));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,SVerbCfgPackagesActivex));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,SVerbCfgPackages));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,ctPropName));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,ctActionProc));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,foCopy));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,foDelete));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,foMove));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,foRename));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,ffAllowUndo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,ffFilesOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,ffNoConfirmation));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,ffNoConfirmMkDir));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,ffNoErrorUI));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,ffRenameCollision));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,ffSilent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,ffSimpleProgress));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,rtBitmap));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..21] of TClass = (
IDCFDesigner,
TActionEditor,
TActionListItem,
TActionsList,
TAppExceptionObject,
TAxControlCollection,
TAxControlInfo,
TDCApplication,
TDCDsgnComp,
TDCDsgnProp,
TDCDsgnProperty,
TDCFileOperation,
TDesignerList,
TDirectoryProperty,
TDispatchCompEditor,
TFDesigner,
TFontSizePropEdit,
TMonoFontProperty,
TMonoSpaceFontNamesProperty,
TNotifierListEx,
TTreeSource,
TWrapperInfo
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..71] of string = (
'TNodeRec'
,'CopyFileList'
,'DeleteFolder'
,'DirectoryExists'
,'GetPropertyEditor'
,'BeginControlUpdate'
,'FinishControlUpdate'
,'CompareVariants'
,'ShowMessageEx'
,'GetStringSize'
,'GetSymbolSize'
,'GetSymbolWidth'
,'GetSymbolHeight'
,'GetWheelScrollLines'
,'QueryComputer'
,'GetVCLControlFromHWND'
,'CorrectMemoText'
,'GetTreeNotifiers'
,'MoveListItem'
,'FreePropEditors'
,'ShowObjectInspector'
,'HideObjectInspector'
,'ShowComponentPalette'
,'HideComponentPalette'
,'ShowAlignPalette'
,'HideAlignPalette'
,'UpdateLabelsEnabled'
,'LoadBitmapFromResource'
,'LoadUnknownGlyph'
,'CallPropertyEditor'
,'GetRGBColor'
,'CorrectFormFiles'
,'GetUsedModules'
,'ShowFormEx'
,'UpdateDisabledControls'
,'ClearComponent'
,'DesignerCanPaste'
,'CreateDataModule'
,'DataModuleWrappers'
,'DataModuleByWrapper'
,'GetDataModuleWrapper'
,'CreateNewTabSheet'
,'SetAllTabsVisible'
,'SetTabsVisible'
,'CorrectActiveTab'
,'DeleteTab'
,'ImageListSaveToFile'
,'AddBitmapFromResource'
,'AddIconFromAnyResource'
,'AddIconFromResource'
,'IsChildMenu'
,'GetControlPopupMenu'
,'CopyPopupMenu'
,'MakeComponentPopup'
,'ToolsFormStyle'
,'SetMainForm'
,'IsFormModal'
,'DelphiTypeToString'
,'CompListToList'
,'ListToCompList'
,'DesignerModified'
,'GetDesigner'
,'GetFormDesigner'
,'DesignerList'
,'IsFDesigner'
,'DCEnsureLongPathIsOk'
,'DCEnsureLongPathsAreOk'
,'DCDsgnPropToPropEdit'
,'DCChangeFontWithDlg'
,'DCChangeColorWithDlg'
,'DCSetDesignerForm'
,'DCGetDesignerForm'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TNodeRec_)));
RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T0),[
TypeInfo(TStrings),TypeInfo(Boolean)],Addr(CopyFileList),cRegister);

RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T1),[
TypeInfo(string),TypeInfo(Boolean)],Addr(DeleteFolder),cRegister);

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T2),[
TypeInfo(string),TypeInfo(Boolean)],Addr(DirectoryExists),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T3),[
TypeInfo(TPersistent),
TypeInfo(string),
TypeInfo(TDCDsgnProp),TypeInfo(TDCDsgnProp)],Addr(GetPropertyEditor),cRegister);

RegisterProc(nil,MethodNames[5],mtProc,TypeInfo(_T4),[
TypeInfo(TWinControl)],Addr(BeginControlUpdate),cRegister);

RegisterProc(nil,MethodNames[6],mtProc,TypeInfo(_T5),[
TypeInfo(TWinControl)],Addr(FinishControlUpdate),cRegister);

RegisterProc(nil,MethodNames[7],mtProc,TypeInfo(_T6),[
TypeInfoPointer,
TypeInfoPointer,TypeInfo(Integer)],Addr(CompareVariants),cRegister);

RegisterProc(nil,MethodNames[8],mtProc,TypeInfo(_T7),[
TypeInfo(Variant)],Addr(ShowMessageEx),cRegister);

RegisterProc(nil,MethodNames[9],mtProc,TypeInfo(_T10),[
TypeInfo(string),
TypeInfo(HFONT),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(IDispatch)],Addr(____GetStringSize__Wrapper),cRegister);

RegisterProc(nil,MethodNames[10],mtProc,TypeInfo(_T11),[
TypeInfo(Char),
TypeInfo(HFONT),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(IDispatch)],Addr(____GetSymbolSize__Wrapper),cRegister);

RegisterProc(nil,MethodNames[11],mtProc,TypeInfo(_T12),[
TypeInfo(Char),
TypeInfo(HFONT),TypeInfo(Integer)],Addr(GetSymbolWidth),cRegister);

RegisterProc(nil,MethodNames[12],mtProc,TypeInfo(_T13),[
TypeInfo(Char),
TypeInfo(HFONT),TypeInfo(Integer)],Addr(GetSymbolHeight),cRegister);

RegisterProc(nil,MethodNames[13],mtProc,TypeInfo(_T14),[TypeInfo(Integer)],Addr(GetWheelScrollLines),cRegister);

RegisterProc(nil,MethodNames[14],mtProc,TypeInfo(_T15),[
TypeInfo(string),
TypeInfo(string),TypeInfo(Boolean)],Addr(QueryComputer),cRegister);

RegisterProc(nil,MethodNames[15],mtProc,TypeInfo(_T16),[
TypeInfo(THandle),TypeInfo(TWinControl)],Addr(GetVCLControlFromHWND),cRegister);

RegisterProc(nil,MethodNames[16],mtProc,TypeInfo(_T17),[
TypeInfo(TMemo)],Addr(CorrectMemoText),cRegister);

RegisterProc(nil,MethodNames[17],mtProc,TypeInfo(_T18),[TypeInfo(TNotifierListEx)],Addr(GetTreeNotifiers),cRegister);

RegisterProc(nil,MethodNames[18],mtProc,TypeInfo(_T19),[
TypeInfo(TListItem),
TypeInfo(TListItem),
TypeInfo(TNodeAttachMode)],Addr(MoveListItem),cRegister);

RegisterProc(nil,MethodNames[19],mtProc,TypeInfo(_T20),NoParams,Addr(FreePropEditors),cRegister);

RegisterProc(nil,MethodNames[20],mtProc,TypeInfo(_T21),NoParams,Addr(ShowObjectInspector),cRegister);

RegisterProc(nil,MethodNames[21],mtProc,TypeInfo(_T22),NoParams,Addr(HideObjectInspector),cRegister);

RegisterProc(nil,MethodNames[22],mtProc,TypeInfo(_T23),NoParams,Addr(ShowComponentPalette),cRegister);

RegisterProc(nil,MethodNames[23],mtProc,TypeInfo(_T24),NoParams,Addr(HideComponentPalette),cRegister);

RegisterProc(nil,MethodNames[24],mtProc,TypeInfo(_T25),NoParams,Addr(ShowAlignPalette),cRegister);

RegisterProc(nil,MethodNames[25],mtProc,TypeInfo(_T26),NoParams,Addr(HideAlignPalette),cRegister);

RegisterProc(nil,MethodNames[26],mtProc,TypeInfo(_T28),[
TypeInfo(TCustomForm)],Addr(UpdateLabelsEnabled),cRegister);

RegisterProc(nil,MethodNames[27],mtProc,TypeInfo(_T29),[
TypeInfo(TBitmap),
TypeInfo(string)],Addr(LoadBitmapFromResource),cRegister);

RegisterProc(nil,MethodNames[28],mtProc,TypeInfo(_T30),[
TypeInfo(TBitmap)],Addr(LoadUnknownGlyph),cRegister);

RegisterProc(nil,MethodNames[29],mtProc,TypeInfo(_T34),[
TypeInfo(TPersistent),
TypeInfo(string)],Addr(CallPropertyEditor),cRegister);

RegisterProc(nil,MethodNames[30],mtProc,TypeInfo(_T35),[
TypeInfo(TColor),TypeInfo(DWORD)],Addr(GetRGBColor),cRegister);

RegisterProc(nil,MethodNames[31],mtProc,TypeInfo(_T42),[
TypeInfo(string),
TypeInfo(Boolean)],Addr(CorrectFormFiles),cRegister);

RegisterProc(nil,MethodNames[32],mtProc,TypeInfo(_T43),[
TypeInfo(TComponent),
TypeInfo(TList)],Addr(GetUsedModules),cRegister);

RegisterProc(nil,MethodNames[33],mtProc,TypeInfo(_T44),[
TypeInfo(TCustomForm),
TypeInfo(Integer)],Addr(ShowFormEx),cRegister);

RegisterProc(nil,MethodNames[34],mtProc,TypeInfo(_T45),[
TypeInfo(TComponent)],Addr(UpdateDisabledControls),cRegister);

RegisterProc(nil,MethodNames[35],mtProc,TypeInfo(_T46),[
TypeInfo(TComponent)],Addr(ClearComponent),cRegister);

RegisterProc(nil,MethodNames[36],mtProc,TypeInfo(_T47),[TypeInfo(Boolean)],Addr(DesignerCanPaste),cRegister);

RegisterProc(nil,MethodNames[37],mtProc,TypeInfo(_T48),[TypeInfo(TDataModule)],Addr(CreateDataModule),cRegister);

RegisterProc(nil,MethodNames[38],mtProc,TypeInfo(_T49),[TypeInfo(TList)],Addr(DataModuleWrappers),cRegister);

RegisterProc(nil,MethodNames[39],mtProc,TypeInfo(_T50),[
TypeInfo(TCustomForm),TypeInfo(TDataModule)],Addr(DataModuleByWrapper),cRegister);

RegisterProc(nil,MethodNames[40],mtProc,TypeInfo(_T51),[
TypeInfo(TDataModule),TypeInfo(TCustomForm)],Addr(GetDataModuleWrapper),cRegister);

RegisterProc(nil,MethodNames[41],mtProc,TypeInfo(_T52),[
TypeInfo(TPageControl),TypeInfo(TTabSheet)],Addr(CreateNewTabSheet),cRegister);

RegisterProc(nil,MethodNames[42],mtProc,TypeInfo(_T53),[
TypeInfo(TPageControl),
TypeInfo(Boolean)],Addr(SetAllTabsVisible),cRegister);

RegisterProc(nil,MethodNames[43],mtProc,TypeInfo(_T54),[
TypeInfo(TPageControl),
ArrayInfo(TypeInfo(string)),
TypeInfo(Boolean)],Addr(SetTabsVisible),cRegister);

RegisterProc(nil,MethodNames[44],mtProc,TypeInfo(_T55),[
TypeInfo(TPageControl)],Addr(CorrectActiveTab),cRegister);

RegisterProc(nil,MethodNames[45],mtProc,TypeInfo(_T56),[
TypeInfo(TTabControl),
TypeInfo(string)],Addr(DeleteTab),cRegister);

RegisterProc(nil,MethodNames[46],mtProc,TypeInfo(_T57),[
TypeInfo(TCustomImageList),
TypeInfo(string)],Addr(ImageListSaveToFile),cRegister);

RegisterProc(nil,MethodNames[47],mtProc,TypeInfo(_T58),[
TypeInfo(TCustomImageList),
TypeInfo(string),
TypeInfo(THandle),TypeInfo(Integer)],Addr(AddBitmapFromResource),cRegister);

RegisterProc(nil,MethodNames[48],mtProc,TypeInfo(_T59),[
TypeInfo(TCustomImageList),
TypeInfo(string),TypeInfo(Boolean)],Addr(AddIconFromAnyResource),cRegister);

RegisterProc(nil,MethodNames[49],mtProc,TypeInfo(_T60),[
TypeInfo(TCustomImageList),
TypeInfo(string),
TypeInfo(THandle),TypeInfo(Boolean)],Addr(AddIconFromResource),cRegister);

RegisterProc(nil,MethodNames[50],mtProc,TypeInfo(_T61),[
TypeInfo(TMenuItem),
TypeInfo(Tmenu),TypeInfo(Boolean)],Addr(IsChildMenu),cRegister);

RegisterProc(nil,MethodNames[51],mtProc,TypeInfo(_T62),[
TypeInfo(TControl),TypeInfo(TPopupMenu)],Addr(GetControlPopupMenu),cRegister);

RegisterProc(nil,MethodNames[52],mtProc,TypeInfo(_T63),[
TypeInfo(TPopupMenu),
TypeInfo(TPopupMenu)],Addr(CopyPopupMenu),cRegister);

RegisterProc(nil,MethodNames[53],mtProc,TypeInfo(_T64),[
TypeInfo(TPopupMenu),
TypeInfo(TPopupMenu),
TypeInfo(TDCDsgnComp)],Addr(MakeComponentPopup),cRegister);

RegisterProc(nil,MethodNames[54],mtProc,TypeInfo(_T65),[TypeInfo(TFormStyle)],Addr(ToolsFormStyle),cRegister);

RegisterProc(nil,MethodNames[55],mtProc,TypeInfo(_T66),[
TypeInfo(TForm)],Addr(SetMainForm),cRegister);

RegisterProc(nil,MethodNames[56],mtProc,TypeInfo(_T67),[
TypeInfo(TForm),TypeInfo(Boolean)],Addr(IsFormModal),cRegister);

RegisterProc(nil,MethodNames[57],mtProc,TypeInfo(_T68),[
TypeInfo(TFormDesigner),
TypeInfo(Integer),TypeInfo(string)],Addr(DelphiTypeToString),cRegister);

RegisterProc(nil,MethodNames[58],mtProc,TypeInfo(_T69),[
TypeInfo(TComponentList),
TypeInfo(TList)],Addr(CompListToList),cRegister);

RegisterProc(nil,MethodNames[59],mtProc,TypeInfo(_T70),[
TypeInfo(TList),
TypeInfo(TComponentList)],Addr(ListToCompList),cRegister);

RegisterProc(nil,MethodNames[60],mtProc,TypeInfo(_T71),[
TypeInfo(TPersistent)],Addr(DesignerModified),cRegister);

RegisterProc(nil,MethodNames[61],mtProc,TypeInfo(_T72),[
TypeInfo(TPersistent),TypeInfo(TDesigner)],Addr(GetDesigner),cRegister);

RegisterProc(nil,MethodNames[62],mtProc,TypeInfo(_T73),[
TypeInfo(TPersistent),TypeInfo(TFormDesigner)],Addr(GetFormDesigner),cRegister);

RegisterProc(nil,MethodNames[63],mtProc,TypeInfo(_T74),[TypeInfo(TDesignerList)],Addr(DesignerList),cRegister);

RegisterProc(nil,MethodNames[64],mtProc,TypeInfo(_T75),[
TypeInfo(TFormDesigner),TypeInfo(Boolean)],Addr(IsFDesigner),cRegister);

RegisterProc(nil,MethodNames[65],mtProc,TypeInfo(_T76),[
TypeInfo(string),TypeInfo(string)],Addr(DCEnsureLongPathIsOk),cRegister);

RegisterProc(nil,MethodNames[66],mtProc,TypeInfo(_T77),[
TypeInfo(string),TypeInfo(string)],Addr(DCEnsureLongPathsAreOk),cRegister);

RegisterProc(nil,MethodNames[67],mtProc,TypeInfo(_T78),[
TypeInfo(TDCDsgnProp),TypeInfo(TPropertyEditor)],Addr(DCDsgnPropToPropEdit),cRegister);

RegisterProc(nil,MethodNames[68],mtProc,TypeInfo(_T84),[
TypeInfo(TFont)],Addr(DCChangeFontWithDlg),cRegister);

RegisterProc(nil,MethodNames[69],mtProc,TypeInfo(_T85),[
TypeInfo(TColor),TypeInfo(TColor)],Addr(DCChangeColorWithDlg),cRegister);

RegisterProc(nil,MethodNames[70],mtProc,TypeInfo(_T86),[
TypeInfo(TFormDesigner),
TypeInfo(TCustomForm)],Addr(DCSetDesignerForm),cRegister);

RegisterProc(nil,MethodNames[71],mtProc,TypeInfo(_T87),[
TypeInfo(TFormDesigner),TypeInfo(TCustomForm)],Addr(DCGetDesignerForm),cRegister);

RegRegisterMethod(TActionsList,'GetActionItem',TypeInfo(_T88),[
TypeInfo(TPersistent),
TypeInfo(Integer),TypeInfo(TCollectionItem)],Addr(TActionsList.GetActionItem));

RegRegisterMethod(TActionsList,'GetVerb',TypeInfo(_T89),[
TypeInfo(TPersistent),
TypeInfo(Integer),TypeInfo(string)],Addr(TActionsList.GetVerb));

RegRegisterMethod(TActionsList,'ExecuteVerb',TypeInfo(_T90),[
TypeInfo(TPersistent),
TypeInfo(Integer)],Addr(TActionsList.ExecuteVerb));

RegRegisterMethod(TActionsList,'GetVerbCount',TypeInfo(_T91),[
TypeInfo(TPersistent),TypeInfo(Integer)],Addr(TActionsList.GetVerbCount));

RegRegisterMethod(TAppExceptionObject,'ExceptionEvent',TypeInfo(_T94),[
TypeInfo(TObject),
TypeInfo(Exception)], pointer(0));

RegisterProc(TAppExceptionObject,'Create',mtConstructor,TypeInfo(_T95),NoParams,Addr(TAppExceptionObject.Create),cRegister);

RegisterProc(TAxControlCollection,'Create',mtConstructor,TypeInfo(_T96),NoParams,Addr(TAxControlCollection.Create),cRegister);

RegRegisterMethod(TAxControlCollection,'LoadRegisteredControls',TypeInfo(_T97),NoParams,Addr(TAxControlCollection.LoadRegisteredControls));

RegRegisterMethod(TAxControlCollection,'ItemByGUID',TypeInfo(_T98),[
TypeInfo(IDispatch),TypeInfo(TAxControlInfo)],Addr(__TAxControlCollection__ItemByGUID__Wrapper));

RegRegisterMethod(TAxControlCollection,'GetActiveXNames',TypeInfo(_T99),[
TypeInfo(TStrings)],Addr(TAxControlCollection.GetActiveXNames));

RegisterProc(TDCApplication,'Create',mtConstructor,TypeInfo(_T100),NoParams,Addr(TDCApplication.Create),cRegister);

RegRegisterMethod(TDCApplication,'ActiveXRegistered',TypeInfo(_T101),[
TypeInfo(IDispatch),TypeInfo(Boolean)],Addr(__TDCApplication__ActiveXRegistered__Wrapper));

RegRegisterMethod(TDCApplication,'RegisterActiveX',TypeInfo(_T102),[
TypeInfo(TAxControlInfo)],Addr(TDCApplication.RegisterActiveX));

RegRegisterMethod(TDCApplication,'UnRegisterActiveX',TypeInfo(_T103),[
TypeInfo(TAxControlInfo)],Addr(TDCApplication.UnRegisterActiveX));

RegRegisterMethod(TDCFileOperation,'Execute',TypeInfo(_T104),[TypeInfo(Boolean)],Addr(TDCFileOperation.Execute));

RegRegisterMethod(TDCFileOperation,'Copy',TypeInfo(_T105),[TypeInfo(Boolean)],Addr(TDCFileOperation.Copy));

RegRegisterMethod(TDCFileOperation,'Delete',TypeInfo(_T106),[TypeInfo(Boolean)],Addr(TDCFileOperation.Delete));

RegRegisterMethod(TDCFileOperation,'Move',TypeInfo(_T107),[TypeInfo(Boolean)],Addr(TDCFileOperation.Move));

RegRegisterMethod(TDCFileOperation,'Rename',TypeInfo(_T108),[TypeInfo(Boolean)],Addr(TDCFileOperation.Rename));

RegRegisterMethod(TFDesigner,'GetOwnerControl',TypeInfo(_T109),[TypeInfo(TComponent)], pointer(132));

RegRegisterMethod(TFDesigner,'InUpdate',TypeInfo(_T110),[TypeInfo(Boolean)], pointer(136));

RegisterProc(TFDesigner,'Create',mtConstructor,TypeInfo(_T111),NoParams,Addr(TFDesigner.Create),cRegister);

RegRegisterMethod(TFDesigner,'CanBeSelected',TypeInfo(_T112),[
TypeInfo(TPersistent),TypeInfo(Boolean)], pointer(140));

RegRegisterMethod(TFDesigner,'AllowEdit',TypeInfo(_T113),[
TypeInfo(TComponent),
TypeInfo(string),TypeInfo(Boolean)], pointer(144));

RegRegisterMethod(TFDesigner,'AllowEditList',TypeInfo(_T114),[
TypeInfo(TList),
TypeInfo(string),TypeInfo(Boolean)],Addr(TFDesigner.AllowEditList));

RegRegisterMethod(TFDesigner,'AllowPropShow',TypeInfo(_T115),[
TypeInfo(TComponent),
TypeInfo(string),TypeInfo(Boolean)], pointer(148));

RegRegisterMethod(TFDesigner,'AllowPropShowList',TypeInfo(_T116),[
TypeInfo(TList),
TypeInfo(string),TypeInfo(Boolean)],Addr(TFDesigner.AllowPropShowList));

RegRegisterMethod(TFDesigner,'IsSelected',TypeInfo(_T117),[
TypeInfo(TPersistent),TypeInfo(Boolean)],Addr(TFDesigner.IsSelected));

RegRegisterMethod(TFDesigner,'DeselectComponent',TypeInfo(_T118),[
TypeInfo(TPersistent)],Addr(TFDesigner.DeselectComponent));

RegRegisterMethod(TNotifierListEx,'PostMessage',TypeInfo(_T119),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TNotifierListEx.PostMessage));

RegRegisterMethod(TTreeSource,'SetSelectedObject',TypeInfo(_T120),[
TypeInfo(Integer)], pointer(44));

RegRegisterMethod(TTreeSource,'SetTreeLink',TypeInfo(_T121),[
TypeInfo(TPersistent)], pointer(48));

RegRegisterMethod(TTreeSource,'ObjectInserted',TypeInfo(_T122),[
TypeInfo(Integer)], pointer(52));

RegRegisterMethod(TTreeSource,'GetLargeImages',TypeInfo(_T123),[TypeInfo(TCustomImageList)], pointer(56));

RegRegisterMethod(TTreeSource,'GetSmallImages',TypeInfo(_T124),[TypeInfo(TCustomImageList)], pointer(60));

RegRegisterMethod(TTreeSource,'GetStateImages',TypeInfo(_T125),[TypeInfo(TCustomImageList)], pointer(64));

RegRegisterMethod(TTreeSource,'SetLargeImages',TypeInfo(_T126),[
TypeInfo(TCustomImageList)], pointer(68));

RegRegisterMethod(TTreeSource,'SetSmallImages',TypeInfo(_T127),[
TypeInfo(TCustomImageList)], pointer(72));

RegRegisterMethod(TTreeSource,'SetStateImages',TypeInfo(_T128),[
TypeInfo(TCustomImageList)], pointer(76));

RegRegisterMethod(TTreeSource,'GetSelectedObject',TypeInfo(_T129),[TypeInfo(Integer)], pointer(80));

RegRegisterMethod(TTreeSource,'GetTreeLink',TypeInfo(_T130),[TypeInfo(TPersistent)], pointer(84));

RegRegisterMethod(TTreeSource,'SetCaption',TypeInfo(_T132),[
TypeInfo(Integer),
TypeInfo(string)], pointer(92));

RegRegisterMethod(TTreeSource,'Add',TypeInfo(_T133),[
TypeInfo(Integer),
TypeInfo(string),
TypeInfo(TNodeAttachMode)], pointer(96));

RegRegisterMethod(TTreeSource,'Clear',TypeInfo(_T134),NoParams, pointer(100));

RegRegisterMethod(TTreeSource,'Delete',TypeInfo(_T135),[
TypeInfo(Integer)], pointer(104));

RegRegisterMethod(TTreeSource,'CanMove',TypeInfo(_T136),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TNodeAttachMode),TypeInfo(Boolean)], pointer(108));

RegRegisterMethod(TTreeSource,'MoveTo',TypeInfo(_T137),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TNodeAttachMode)], pointer(112));

RegRegisterMethod(TTreeSource,'BeginUpdate',TypeInfo(_T138),NoParams, pointer(116));

RegRegisterMethod(TTreeSource,'EndUpdate',TypeInfo(_T139),NoParams, pointer(120));

RegRegisterMethod(TTreeSource,'GetInspectorControl',TypeInfo(_T140),[
TypeInfo(Integer),TypeInfo(TPersistent)], pointer(124));

RegRegisterMethod(TTreeSource,'ActionAllowed',TypeInfo(_T141),[
TypeInfo(Integer),
TypeInfo(TActionCode),TypeInfo(Boolean)], pointer(128));

RegRegisterMethod(TTreeSource,'GetDisplayName',TypeInfo(_T142),[
TypeInfo(Integer),TypeInfo(string)], pointer(132));

RegRegisterMethod(TTreeSource,'GetAttrCount',TypeInfo(_T143),[TypeInfo(Integer)], pointer(136));

RegRegisterMethod(TTreeSource,'GetAttrName',TypeInfo(_T144),[
TypeInfo(Integer),TypeInfo(string)], pointer(140));

RegRegisterMethod(TTreeSource,'GetAttrValue',TypeInfo(_T145),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(string)], pointer(144));

RegRegisterMethod(TTreeSource,'GetStatusLine',TypeInfo(_T146),[
TypeInfo(Integer),TypeInfo(string)], pointer(148));

RegRegisterMethod(TTreeSource,'ValidSource',TypeInfo(_T147),[TypeInfo(Boolean)], pointer(152));

RegRegisterMethod(TTreeSource,'Edit',TypeInfo(_T148),[
TypeInfo(Integer)], pointer(156));

RegRegisterMethod(TTreeSource,'GetSortType',TypeInfo(_T149),[TypeInfo(TSortType)], pointer(160));

RegRegisterMethod(TTreeSource,'HasChild',TypeInfo(_T150),[
TypeInfo(Integer),TypeInfo(Boolean)], pointer(164));

RegRegisterMethod(TTreeSource,'GetParentId',TypeInfo(_T151),[
TypeInfo(Integer),TypeInfo(Integer)], pointer(168));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'RegisterPropChangesNotifier',mtProc,TypeInfo(_T8),[
TypeInfo(TPersistent),
TypeInfo(TPropChangeProc)],Addr(RegisterPropChangesNotifier),cRegister)}

{RegisterProc(nil,'UnRegisterPropChangesNotifier',mtProc,TypeInfo(_T9),[
TypeInfo(TPersistent),
TypeInfo(TPropChangeProc)],Addr(UnRegisterPropChangesNotifier),cRegister)}

{RegisterProc(nil,'GetEventDispatchTypeInfo',mtProc,TypeInfo(_T27),[
TypeInfo(IUnknown),TypeInfo(ITypeInfo)],Addr(GetEventDispatchTypeInfo),cRegister)}

{RegisterProc(nil,'LoadBitmapForClass',mtProc,TypeInfo(_T31),[
TypeInfo(TBitmap),
TypeInfo(TClass)],Addr(LoadBitmapForClass),cRegister)}

{RegisterProc(nil,'FindObjectBitmapResEx',mtProc,TypeInfo(_T32),[
TypeInfo(THandle),
TypeInfo(TClass),
TypeInfo(string),TypeInfo(string)],Addr(FindObjectBitmapResEx),cRegister)}

{RegisterProc(nil,'FindObjectBitmapRes',mtProc,TypeInfo(_T33),[
TypeInfo(THandle),
TypeInfo(TClass),
TypeInfo(string),TypeInfo(string)],Addr(FindObjectBitmapRes),cRegister)}

{RegisterProc(nil,'RegisterTreeSource',mtProc,TypeInfo(_T36),[
TypeInfo(TClass),
TypeInfo(TTreeSourceClass),
TypeInfo(string)],Addr(RegisterTreeSource),cRegister)}

{RegisterProc(nil,'RegisterDefaultTreeSource',mtProc,TypeInfo(_T37),[
TypeInfo(TClass),
TypeInfo(TTreeSourceClass),
TypeInfo(string)],Addr(RegisterDefaultTreeSource),cRegister)}

{RegisterProc(nil,'GetRegisteredTreeSource',mtProc,TypeInfo(_T38),[
TypeInfo(TClass),
TypeInfo(string),TypeInfo(TTreeSourceClass)],Addr(GetRegisteredTreeSource),cRegister)}

{RegisterProc(nil,'RegisterVisualProperty',mtProc,TypeInfo(_T39),[
TypeInfo(string),
TypeInfo(TPersistentClass),
TypeInfo(string)],Addr(RegisterVisualProperty),cRegister)}

{RegisterProc(nil,'RegisterComponentAction',mtProc,TypeInfo(_T40),[
TypeInfo(string),
TypeInfo(TPersistentClass),
TypeInfo(TActionProc)],Addr(RegisterComponentAction),cRegister)}

{RegisterProc(nil,'GetClassRegisterPackage',mtProc,TypeInfo(_T41),[
TypeInfo(TClass),TypeInfo(THandle)],Addr(GetClassRegisterPackage),cRegister)}

{RegisterProc(nil,'DCEnumShortCutNames',mtProc,TypeInfo(_T79),[
TypeInfo(TGetStrProc)],Addr(DCEnumShortCutNames),cRegister)}

{RegisterProc(nil,'DCEnumShortCuts',mtProc,TypeInfo(_T80),[
TypeInfo(TDCEnumShortCutProc),
TypeInfoPointer],Addr(DCEnumShortCuts),cRegister)}

{RegisterProc(nil,'DCEnumFShortCuts',mtProc,TypeInfo(_T81),[
TypeInfo(Integer),
TypeInfo(TDCEnumShortCutProc),
TypeInfoPointer],Addr(DCEnumFShortCuts),cRegister)}

{RegisterProc(nil,'DCEnumKeyCodes',mtProc,TypeInfo(_T82),[
ArrayInfo(TypeInfo(Integer)),
TypeInfo(Integer),
TypeInfo(TDCEnumShortCutProc),
TypeInfoPointer],Addr(DCEnumKeyCodes),cRegister)}

{RegisterProc(nil,'DCEnumAZShortCuts',mtProc,TypeInfo(_T83),[
TypeInfo(Integer),
TypeInfo(TDCEnumShortCutProc),
TypeInfoPointer],Addr(DCEnumAZShortCuts),cRegister)}

{RegRegisterMethod(TActionsList,'RegisterComponentAction',TypeInfo(_T92),[
TypeInfo(string),
TypeInfo(TPersistentClass),
TypeInfo(TActionProc)],Addr(TActionsList.RegisterComponentAction))}

{RegRegisterMethod(TActionsList,'RegisterVisualProperty',TypeInfo(_T93),[
TypeInfo(string),
TypeInfo(TPersistentClass),
TypeInfo(string)],Addr(TActionsList.RegisterVisualProperty))}

{RegRegisterMethod(TTreeSource,'GetItems',TypeInfo(_T131),[
TypeInfo(Integer),
TypeInfo(TIteratorProc)], pointer(88))}

RegisterEvent(TypeInfo(TFileProcessEvent),[
TypeInfo(TObject),
TypeInfo(string),
TypeInfo(Boolean)]);

{RegisterEvent(TypeInfo(TIteratorProc),[
TypeInfo(IDispatch)]);}

RegisterEvent(TypeInfo(TPropChangeProc),[
TypeInfo(TList)]);

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
