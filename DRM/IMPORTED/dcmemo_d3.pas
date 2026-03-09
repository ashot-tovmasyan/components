{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit dcmemo_D3;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  activex,
  dcscript,
  Messages,
  Windows,
  Forms,
  Dialogs,
  CommCtrl,
  Graphics,
  controls,
  StdCtrls,
  clipbrd,
  RichEdit,
  menus,
  dcsystem,
  consts,
  Classes,
  SysUtils,
  dcdreamlib,
  dcedit,
  dccommon,
  typinfo,
  dccontrols,
  dcstring,
  dcconsts,
  dcExport,
  fontman,
  dcmemo;
function ConvertTPointToVariant(var R : TPoint) : OleVariant;
function ConvertVariantToTPoint(const V : OleVariant) : TPoint;
function ConvertTRectToVariant(var R : TRect) : OleVariant;
function ConvertVariantToTRect(const V : OleVariant) : TRect;
function ConvertTWBPointToVariant(var R : TWBPoint) : OleVariant;
function ConvertVariantToTWBPoint(const V : OleVariant) : TWBPoint;
function ConvertTWMContextMenuToVariant(var R : TWMContextMenu) : OleVariant;
function ConvertVariantToTWMContextMenu(const V : OleVariant) : TWMContextMenu;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TPoint__Wrapper = class(TDCRecordWrapper)
private
fR : TPoint;
public
function GetRecordPtr : pointer; override;
published
procedure setx(const val : Longint);
function getx : Longint;
property x : Longint read getx write setx;
procedure sety(const val : Longint);
function gety : Longint;
property y : Longint read gety write sety;
end;
type __TWBPoint__Wrapper = class(TDCRecordWrapper)
private
fR : TWBPoint;
public
function GetRecordPtr : pointer; override;
published
procedure setX(const val : Integer);
function getX : Integer;
property X : Integer read getX write setX;
procedure setY(const val : Integer);
function getY : Integer;
property Y : Integer read getY write setY;
procedure setBaseLine(const val : Integer);
function getBaseLine : Integer;
property BaseLine : Integer read getBaseLine write setBaseLine;
end;
type __TWMContextMenu__Wrapper = class(TDCRecordWrapper)
private
fR : TWMContextMenu;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure sethWnd(const val : hWnd);
function gethWnd : hWnd;
property hWnd : hWnd read gethWnd write sethWnd;
procedure setXPos(const val : SmallInt);
function getXPos : SmallInt;
property XPos : SmallInt read getXPos write setXPos;
procedure setYPos(const val : SmallInt);
function getYPos : SmallInt;
property YPos : SmallInt read getYPos write setYPos;
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
type __TCustomDCMemo__ = class(TCustomDCMemo);
type
_T0 = function : TList of object;

_T1 = _T0;

_T2 = procedure (p0 : TObject) of object;

_T3 = _T2;

_T4 = function : TMemoEnvOptions of object;

_T5 = procedure (p0 : TCustomMemoSource;
p1 : TList) of object;

_T6 = function (p0 : TCustomMemoSource): TCustomDCMemo of object;

_T7 = function (p0 : TCustomMemoSource): Integer of object;

_T8 = procedure (p0 : TImageList;
p1 : TDCGutterImages) of object;

_T9 = _T2;

_T10 = _T2;

_T11 = _T2;

_T12 = _T2;

{_T13 = procedure (p0 : TGetStrProc) of object;}

_T14 = procedure  of object;

_T15 = procedure (const p0 : IDispatch;
p1 : TMemoAttributes) of object;

_T16 = _T14;

_T17 = procedure (p0 : TObject;
p1 : Integer) of object;

_T18 = procedure (p0 : TObject;
p1 : Integer;
p2 : Integer) of object;

_T19 = function : TCustomMemoSource of object;

_T20 = procedure (p0 : Boolean) of object;

_T21 = function (const p0 : IDispatch;
p1 : TDrawState): Boolean of object;

_T22 = procedure (p0 : Integer;
p1 : TFont;
var p2 : TColor) of object;

_T23 = function : TCustomForm of object;

_T24 = _T23;

_T25 = procedure (p0 : TStrings) of object;

_T26 = procedure (var p0 : string) of object;

_T27 = function (var p0 : TPopupType): Boolean of object;

_T28 = _T14;

_T29 = procedure (p0 : TScrollStyle;
p1 : Integer) of object;

_T30 = procedure (p0 : Integer;
p1 : Integer;
p2 : TShiftState) of object;

_T31 = procedure (var p0 : string;
var p1 : string) of object;

_T33 = procedure (const p0 : IDispatch;
var p1 : Integer) of object;

_T34 = procedure (p0 : TMemoStates) of object;

_T35 = _T14;

_T36 = procedure (const p0 : string) of object;

_T37 = function (p0 : Integer;
p1 : TCollapseState): Boolean of object;

_T38 = procedure (p0 : Integer;
p1 : TCollapseState) of object;

_T39 = function (p0 : TStrings;
const p1 : string;
var p2 : Integer): Boolean of object;

_T40 = procedure (p0 : Integer) of object;

_T41 = procedure (p0 : string) of object;

_T42 = function (var p0 : Word;
p1 : TShiftState): Boolean of object;

_T43 = _T14;

_T44 = procedure (const p0 : IDispatch) of object;

_T45 = _T14;

_T46 = _T14;

_T47 = _T14;

_T48 = _T14;

_T49 = _T14;

_T50 = _T14;

_T51 = _T14;

_T52 = _T14;

_T53 = _T14;

_T54 = _T14;

_T55 = _T14;

_T56 = _T14;

_T57 = _T14;

_T58 = function (const p0 : IDispatch): IDispatch of object;

_T59 = function : IDispatch of object;

_T60 = function : Boolean of object;

_T61 = procedure (p0 : Integer;
const p1 : string) of object;

_T62 = _T36;

{_T63 = procedure (p0 : PChar) of object;}

_T64 = function (p0 : Integer;
p1 : Integer): IDispatch of object;

_T65 = function (p0 : Integer;
p1 : Integer;
p2 : Boolean): IDispatch of object;

_T66 = procedure (p0 : Integer;
p1 : Integer) of object;

_T67 = function (p0 : Integer;
p1 : Integer): Integer of object;

_T68 = _T20;

_T69 = _T14;

_T70 = _T36;

_T71 = procedure (const p0 : string;
p1 : Boolean) of object;

_T72 = procedure (p0 : TMetaFile;
p1 : THandle) of object;

_T73 = procedure (p0 : TMetaFile;
p1 : THandle;
p2 : Integer) of object;

_T74 = procedure (p0 : TBitmap) of object;

_T75 = procedure (p0 : TDCGraphicsFormat) of object;

_T76 = procedure (p0 : string;
p1 : TDCGraphicsFormat) of object;

_T77 = _T14;

_T78 = _T14;

_T79 = function : Integer of object;

_T80 = _T14;

_T81 = _T14;

_T82 = _T14;

_T83 = _T14;

_T84 = _T14;

_T85 = _T14;

_T86 = _T14;

_T87 = _T14;

_T88 = _T14;

_T89 = _T14;

_T90 = _T14;

_T91 = _T14;

_T92 = _T14;

_T93 = _T14;

_T94 = _T14;

_T95 = _T14;

_T96 = _T14;

_T97 = _T14;

_T98 = _T14;

_T99 = _T14;

_T100 = _T40;

_T101 = _T40;

_T102 = _T14;

_T103 = _T14;

_T104 = _T14;

_T105 = _T14;

_T106 = _T14;

_T107 = _T14;

_T108 = _T14;

_T109 = _T14;

_T110 = _T14;

_T111 = _T66;

_T112 = _T14;

_T113 = _T19;

_T114 = _T36;

_T115 = _T36;

_T116 = _T14;

_T117 = procedure (const p0 : TDCExporter) of object;

{_T118 = procedure (p0 : TStream;
p1 : TDCExporterClass) of object;}

{_T119 = procedure (const p0 : string;
p1 : TDCExporterClass) of object;}

_T120 = _T36;

_T121 = _T36;

_T122 = procedure (p0 : TStream) of object;

_T123 = _T122;

_T124 = procedure (const p0 : TDCExporter;
p1 : Boolean) of object;

{_T125 = procedure (p0 : TStream;
p1 : TDCExporterClass;
p2 : Boolean) of object;}

{_T126 = procedure (const p0 : string;
p1 : TDCExporterClass;
p2 : Boolean) of object;}

_T127 = _T71;

_T128 = _T71;

_T129 = procedure (p0 : TStream;
p1 : Boolean) of object;

_T130 = _T129;

_T131 = _T122;

_T132 = _T36;

_T133 = _T122;

_T134 = _T36;

_T135 = _T122;

_T136 = _T36;

_T137 = _T122;

_T138 = _T36;

{_T139 = procedure (p0 : TStream;
p1 : TDCImporterClass) of object;}

_T140 = function (const p0 : IDispatch): string of object;

_T141 = _T79;

_T142 = _T79;

_T143 = procedure (const p0 : string;
const p1 : IDispatch;
p2 : Boolean) of object;

_T144 = _T14;

_T145 = _T25;

_T146 = procedure (p0 : TStrings;
p1 : Array of TLeftRightAlign;
p2 : Integer) of object;

_T147 = _T14;

_T148 = _T14;

_T149 = _T14;

_T150 = _T60;

_T151 = _T25;

_T152 = _T25;

_T153 = procedure (const p0 : string;
const p1 : string;
p2 : Integer) of object;

_T154 = _T14;

_T155 = procedure (p0 : TCustomDCMemo) of object;

_T156 = _T14;

_T157 = _T155;

_T158 = _T155;

_T159 = _T14;

_T160 = _T14;

_T161 = _T14;

_T162 = procedure (p0 : TPersistent) of object;

_T163 = _T14;

_T164 = _T155;

_T165 = _T155;

_T166 = _T155;

_T167 = _T155;

_T168 = function : TCustomDCMemo of object;

_T169 = _T14;

_T170 = _T14;

_T171 = _T79;

_T172 = _T79;

_T173 = function (const p0 : string;
p1 : TColor;
p2 : TColor): TTextStyle of object;

_T174 = function (const p0 : string;
p1 : TColor;
p2 : TColor;
p3 : TFontStyles;
p4 : TUpdateMemoColors;
p5 : Boolean;
p6 : Boolean): TTextStyle of object;

_T175 = _T14;

_T176 = _T14;

_T177 = _T14;

_T178 = _T14;

{_T179 = function (p0 : PWBPoint;
p1 : Boolean;
var p2 : Boolean): Integer of object;}

_T180 = _T66;

function __TPoint__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TPoint__Wrapper.setx(const val : Longint);
begin
TPoint(GetRecordPtr^).x := val;
end;
function __TPoint__Wrapper.getx : Longint;
begin
result := TPoint(GetRecordPtr^).x;
end;
procedure __TPoint__Wrapper.sety(const val : Longint);
begin
TPoint(GetRecordPtr^).y := val;
end;
function __TPoint__Wrapper.gety : Longint;
begin
result := TPoint(GetRecordPtr^).y;
end;
function __TWBPoint__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWBPoint__Wrapper.setX(const val : Integer);
begin
TWBPoint(GetRecordPtr^).X := val;
end;
function __TWBPoint__Wrapper.getX : Integer;
begin
result := TWBPoint(GetRecordPtr^).X;
end;
procedure __TWBPoint__Wrapper.setY(const val : Integer);
begin
TWBPoint(GetRecordPtr^).Y := val;
end;
function __TWBPoint__Wrapper.getY : Integer;
begin
result := TWBPoint(GetRecordPtr^).Y;
end;
procedure __TWBPoint__Wrapper.setBaseLine(const val : Integer);
begin
TWBPoint(GetRecordPtr^).BaseLine := val;
end;
function __TWBPoint__Wrapper.getBaseLine : Integer;
begin
result := TWBPoint(GetRecordPtr^).BaseLine;
end;
function __TWMContextMenu__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMContextMenu__Wrapper.setMsg(const val : Cardinal);
begin
TWMContextMenu(GetRecordPtr^).Msg := val;
end;
function __TWMContextMenu__Wrapper.getMsg : Cardinal;
begin
result := TWMContextMenu(GetRecordPtr^).Msg;
end;
procedure __TWMContextMenu__Wrapper.sethWnd(const val : hWnd);
begin
TWMContextMenu(GetRecordPtr^).hWnd := val;
end;
function __TWMContextMenu__Wrapper.gethWnd : hWnd;
begin
result := TWMContextMenu(GetRecordPtr^).hWnd;
end;
procedure __TWMContextMenu__Wrapper.setXPos(const val : SmallInt);
begin
TWMContextMenu(GetRecordPtr^).XPos := val;
end;
function __TWMContextMenu__Wrapper.getXPos : SmallInt;
begin
result := TWMContextMenu(GetRecordPtr^).XPos;
end;
procedure __TWMContextMenu__Wrapper.setYPos(const val : SmallInt);
begin
TWMContextMenu(GetRecordPtr^).YPos := val;
end;
function __TWMContextMenu__Wrapper.getYPos : SmallInt;
begin
result := TWMContextMenu(GetRecordPtr^).YPos;
end;
procedure __TWMContextMenu__Wrapper.setResult(const val : Longint);
begin
TWMContextMenu(GetRecordPtr^).Result := val;
end;
function __TWMContextMenu__Wrapper.getResult : Longint;
begin
result := TWMContextMenu(GetRecordPtr^).Result;
end;
function _TWBPoint_ : IDispatch;
begin
  result := __TWBPoint__Wrapper.Create;
end;
function _TWMContextMenu_ : IDispatch;
begin
  result := __TWMContextMenu__Wrapper.Create;
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
procedure __TAttributeParser__GetAttribute__Wrapper(__Instance : TAttributeParser;
const p0 : IDispatch;
p1 : TMemoAttributes);
var
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TAttributeParser(__Instance).GetAttribute(__p0^,p1);
end;

function __TCustomDCMemo__DoPaintGutter__Wrapper(__Instance : TCustomDCMemo;
const p0 : IDispatch;
p1 : TDrawState): Boolean;
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := __TCustomDCMemo__(__Instance).DoPaintGutter(__p0^,p1);
end;

procedure __TCustomDCMemo__DoGetColorStyle__Wrapper(__Instance : TCustomDCMemo;
const p0 : IDispatch;
var p1 : Integer);
var
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
__TCustomDCMemo__(__Instance).DoGetColorStyle(__p0^,p1);
end;

procedure __TCustomDCMemo__EnsurePointVisible__Wrapper(__Instance : TCustomDCMemo;
const p0 : IDispatch);
var
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TCustomDCMemo(__Instance).EnsurePointVisible(__p0^);
end;

function __TCustomDCMemo__TextToPixelPoint__Wrapper(__Instance : TCustomDCMemo;
const p0 : IDispatch): IDispatch;
var
__result : TPoint;
__wrapper : __TPoint__Wrapper;
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
__result := TCustomDCMemo(__Instance).TextToPixelPoint(__p0^);
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function __TCustomDCMemo__GetCurentPosinPixels__Wrapper(__Instance : TCustomDCMemo): IDispatch;
var
__result : TPoint;
__wrapper : __TPoint__Wrapper;
begin
__result := TCustomDCMemo(__Instance).GetCurentPosinPixels;
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function __TCustomDCMemo__ConvertMousePos__Wrapper(__Instance : TCustomDCMemo;
p0 : Integer;
p1 : Integer): IDispatch;
var
__result : TPoint;
__wrapper : __TPoint__Wrapper;
begin
__result := TCustomDCMemo(__Instance).ConvertMousePos(p0,p1);
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function __TCustomDCMemo__ConvertMousePosEx__Wrapper(__Instance : TCustomDCMemo;
p0 : Integer;
p1 : Integer;
p2 : Boolean): IDispatch;
var
__result : TPoint;
__wrapper : __TPoint__Wrapper;
begin
__result := TCustomDCMemo(__Instance).ConvertMousePosEx(p0,p1,p2);
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function __TCustomDCMemo__TextAtMousePoint__Wrapper(__Instance : TCustomDCMemo;
const p0 : IDispatch): string;
var
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := TCustomDCMemo(__Instance).TextAtMousePoint(__p0^);
end;

procedure __TCustomDCMemo__ShowPopupHint__Wrapper(__Instance : TCustomDCMemo;
const p0 : string;
const p1 : IDispatch;
p2 : Boolean);
var
__p1 : ^TPoint;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
TCustomDCMemo(__Instance).ShowPopupHint(p0,__p1^,p2);
end;


type __TPoint__Wrapper__ = class(__TPoint__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TPoint__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTPointToVariant(var R : TPoint) : OleVariant;
var
__rw : __TPoint__Wrapper__;
begin
__rw := __TPoint__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTPoint(const V : OleVariant) : TPoint;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TPoint((_idisp as IDCRecordWrapper).GetRecordPtr^);
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

type __TWBPoint__Wrapper__ = class(__TWBPoint__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWBPoint__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWBPointToVariant(var R : TWBPoint) : OleVariant;
var
__rw : __TWBPoint__Wrapper__;
begin
__rw := __TWBPoint__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWBPoint(const V : OleVariant) : TWBPoint;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWBPoint((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMContextMenu__Wrapper__ = class(__TWMContextMenu__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMContextMenu__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMContextMenuToVariant(var R : TWMContextMenu) : OleVariant;
var
__rw : __TWMContextMenu__Wrapper__;
begin
__rw := __TWMContextMenu__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMContextMenu(const V : OleVariant) : TWMContextMenu;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMContextMenu((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTCustomDCMemo__CharWidth(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).CharWidth;
end;

function __DC__GetTCustomDCMemo__LineHeight(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).LineHeight;
end;

function __DC__GetTCustomDCMemo__WinLinePos(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).WinLinePos;
end;

procedure __DC__SetTCustomDCMemo__WinLinePos(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).WinLinePos:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__WinCharPos(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).WinCharPos;
end;

procedure __DC__SetTCustomDCMemo__WinCharPos(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).WinCharPos:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__CaretCharPos(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).CaretCharPos;
end;

function __DC__GetTCustomDCMemo__CaretLinePos(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).CaretLinePos;
end;

function __DC__GetTCustomDCMemo__DisabledColor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).DisabledColor;
end;

procedure __DC__SetTCustomDCMemo__DisabledColor(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).DisabledColor:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__ReadOnlyColor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).ReadOnlyColor;
end;

procedure __DC__SetTCustomDCMemo__ReadOnlyColor(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).ReadOnlyColor:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__CurPosText(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).CurPosText;
end;

function __DC__GetTCustomDCMemo__CaretPoint(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TPoint__Wrapper;
begin
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := TCustomDCMemo(Instance).CaretPoint;
result := IUnknown(__wrapper) as IDispatch;
end;

procedure __DC__SetTCustomDCMemo__CaretPoint(Instance : TObject; Params : PVariantArgList);
var
__idisp:IDispatch;
__iwrapper:IDCRecordWrapper;
begin
__idisp:=DCVarToInterface(OleVariant(Params^[0]));
if __idisp=nil then exit;
__idisp.QueryInterface(IDCRecordWrapper, __iwrapper);
TCustomDCMemo(Instance).CaretPoint:=TPoint(__iwrapper.GetRecordPtr^);
end;

function __DC__GetTCustomDCMemo__CaretPos(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TPoint__Wrapper;
begin
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := TCustomDCMemo(Instance).CaretPos;
result := IUnknown(__wrapper) as IDispatch;
end;

procedure __DC__SetTCustomDCMemo__CaretPos(Instance : TObject; Params : PVariantArgList);
var
__idisp:IDispatch;
__iwrapper:IDCRecordWrapper;
begin
__idisp:=DCVarToInterface(OleVariant(Params^[0]));
if __idisp=nil then exit;
__idisp.QueryInterface(IDCRecordWrapper, __iwrapper);
TCustomDCMemo(Instance).CaretPos:=TPoint(__iwrapper.GetRecordPtr^);
end;

function __DC__GetTCustomDCMemo__SelColor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).SelColor;
end;

procedure __DC__SetTCustomDCMemo__SelColor(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).SelColor:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__SelBackColor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).SelBackColor;
end;

procedure __DC__SetTCustomDCMemo__SelBackColor(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).SelBackColor:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__MatchColor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).MatchColor;
end;

procedure __DC__SetTCustomDCMemo__MatchColor(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).MatchColor:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__MatchBackColor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).MatchBackColor;
end;

procedure __DC__SetTCustomDCMemo__MatchBackColor(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).MatchBackColor:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__HideSelection(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).HideSelection;
end;

procedure __DC__SetTCustomDCMemo__HideSelection(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).HideSelection:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__SpacesInTab(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).SpacesInTab;
end;

procedure __DC__SetTCustomDCMemo__SpacesInTab(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).SpacesInTab:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__HorzMaxPos(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).HorzMaxPos;
end;

procedure __DC__SetTCustomDCMemo__HorzMaxPos(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).HorzMaxPos:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__TextStyles(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCMemo(Instance).TextStyles);
end;

procedure __DC__SetTCustomDCMemo__TextStyles(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).TextStyles:=TTextStyles(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCMemo__MemoSource(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCMemo(Instance).MemoSource);
end;

procedure __DC__SetTCustomDCMemo__MemoSource(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).MemoSource:=TCustomMemoSource(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCMemo__BorderStyle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).BorderStyle;
end;

procedure __DC__SetTCustomDCMemo__BorderStyle(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).BorderStyle:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__UseGlobalOptions(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).UseGlobalOptions;
end;

procedure __DC__SetTCustomDCMemo__UseGlobalOptions(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).UseGlobalOptions:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__ScrollBars(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).ScrollBars;
end;

procedure __DC__SetTCustomDCMemo__ScrollBars(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).ScrollBars:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__Options(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TMemoOptions;
begin
tmp := TCustomDCMemo(Instance).Options;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTCustomDCMemo__Options(Instance : TObject; Params : PVariantArgList);
var
  tmp : TMemoOptions;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TCustomDCMemo(Instance).Options:=tmp;
end;

function __DC__GetTCustomDCMemo__MarginPos(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).MarginPos;
end;

procedure __DC__SetTCustomDCMemo__MarginPos(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).MarginPos:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__GutterBrush(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCMemo(Instance).GutterBrush);
end;

procedure __DC__SetTCustomDCMemo__GutterBrush(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).GutterBrush:=TBrush(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCMemo__MarginPen(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCMemo(Instance).MarginPen);
end;

procedure __DC__SetTCustomDCMemo__MarginPen(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).MarginPen:=TPen(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCMemo__GutterLineColor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).GutterLineColor;
end;

procedure __DC__SetTCustomDCMemo__GutterLineColor(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).GutterLineColor:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__GutterWidth(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).GutterWidth;
end;

procedure __DC__SetTCustomDCMemo__GutterWidth(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).GutterWidth:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__GutterImgs(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCMemo(Instance).GutterImgs);
end;

procedure __DC__SetTCustomDCMemo__GutterImgs(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).GutterImgs:=TDCGutterImages(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCMemo__GutterImgsAlign(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).GutterImgsAlign;
end;

procedure __DC__SetTCustomDCMemo__GutterImgsAlign(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).GutterImgsAlign:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__LineNumbersWidth(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).LineNumbersWidth;
end;

function __DC__GetTCustomDCMemo__ClipboardType(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).ClipboardType;
end;

procedure __DC__SetTCustomDCMemo__ClipboardType(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).ClipboardType:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__PlainText(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).PlainText;
end;

procedure __DC__SetTCustomDCMemo__PlainText(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).PlainText:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__ReadOnly(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).ReadOnly;
end;

procedure __DC__SetTCustomDCMemo__ReadOnly(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).ReadOnly:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__Lines(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCMemo(Instance).Lines);
end;

procedure __DC__SetTCustomDCMemo__Lines(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).Lines:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCMemo__Font(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCMemo(Instance).Font);
end;

procedure __DC__SetTCustomDCMemo__Font(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).Font:=TMemoFont(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCMemo__PrinterFont(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCMemo(Instance).PrinterFont);
end;

procedure __DC__SetTCustomDCMemo__PrinterFont(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).PrinterFont:=TMemoFont(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCMemo__TemplateFont(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCMemo(Instance).TemplateFont);
end;

procedure __DC__SetTCustomDCMemo__TemplateFont(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).TemplateFont:=TFont(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCMemo__UsePrinterFont(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).UsePrinterFont;
end;

procedure __DC__SetTCustomDCMemo__UsePrinterFont(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).UsePrinterFont:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__StringsOptions(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TStringsOptions;
begin
tmp := TCustomDCMemo(Instance).StringsOptions;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTCustomDCMemo__StringsOptions(Instance : TObject; Params : PVariantArgList);
var
  tmp : TStringsOptions;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TCustomDCMemo(Instance).StringsOptions:=tmp;
end;

function __DC__GetTCustomDCMemo__SyntaxParser(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCMemo(Instance).SyntaxParser);
end;

procedure __DC__SetTCustomDCMemo__SyntaxParser(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).SyntaxParser:=TSimpleParser(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCMemo__TabStops(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).TabStops;
end;

procedure __DC__SetTCustomDCMemo__TabStops(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).TabStops:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__Delimeters(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).Delimeters;
end;

procedure __DC__SetTCustomDCMemo__Delimeters(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).Delimeters:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__AllowUndo(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).AllowUndo;
end;

procedure __DC__SetTCustomDCMemo__AllowUndo(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).AllowUndo:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__UndoLimit(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).UndoLimit;
end;

procedure __DC__SetTCustomDCMemo__UndoLimit(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).UndoLimit:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__LineNumColor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).LineNumColor;
end;

procedure __DC__SetTCustomDCMemo__LineNumColor(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).LineNumColor:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__LineNumAlign(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).LineNumAlign;
end;

procedure __DC__SetTCustomDCMemo__LineNumAlign(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).LineNumAlign:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__BlockIndent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).BlockIndent;
end;

procedure __DC__SetTCustomDCMemo__BlockIndent(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).BlockIndent:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__GutterBackColor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).GutterBackColor;
end;

procedure __DC__SetTCustomDCMemo__GutterBackColor(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).GutterBackColor:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__LineBookmarkColor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).LineBookmarkColor;
end;

procedure __DC__SetTCustomDCMemo__LineBookmarkColor(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).LineBookmarkColor:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__Text(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).Text;
end;

procedure __DC__SetTCustomDCMemo__Text(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).Text:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__SelText(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).SelText;
end;

procedure __DC__SetTCustomDCMemo__SelText(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).SelText:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__PrintOptions(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TDCPrintOptions;
begin
tmp := TCustomDCMemo(Instance).PrintOptions;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTCustomDCMemo__PrintOptions(Instance : TObject; Params : PVariantArgList);
var
  tmp : TDCPrintOptions;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TCustomDCMemo(Instance).PrintOptions:=tmp;
end;

function __DC__GetTCustomDCMemo__CodeTemplates(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCMemo(Instance).CodeTemplates);
end;

procedure __DC__SetTCustomDCMemo__CodeTemplates(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).CodeTemplates:=TMemoCodeTemplates(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCMemo__TemplatesType(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).TemplatesType;
end;

procedure __DC__SetTCustomDCMemo__TemplatesType(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).TemplatesType:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__HideCaret(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).HideCaret;
end;

procedure __DC__SetTCustomDCMemo__HideCaret(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).HideCaret:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__LeftIndent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).LeftIndent;
end;

procedure __DC__SetTCustomDCMemo__LeftIndent(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).LeftIndent:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__PrintIndent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).PrintIndent;
end;

procedure __DC__SetTCustomDCMemo__PrintIndent(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).PrintIndent:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__MemoBackground(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCMemo(Instance).MemoBackground);
end;

procedure __DC__SetTCustomDCMemo__MemoBackground(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).MemoBackground:=TControlBackground(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCMemo__Background(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCMemo(Instance).Background);
end;

procedure __DC__SetTCustomDCMemo__Background(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).Background:=TBitmap(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCMemo__BkgndOption(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).BkgndOption;
end;

procedure __DC__SetTCustomDCMemo__BkgndOption(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).BkgndOption:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__GutterBackground(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCMemo(Instance).GutterBackground);
end;

procedure __DC__SetTCustomDCMemo__GutterBackground(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).GutterBackground:=TControlBackground(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCMemo__LineNumBackColor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).LineNumBackColor;
end;

procedure __DC__SetTCustomDCMemo__LineNumBackColor(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).LineNumBackColor:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__HideScrollBars(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).HideScrollBars;
end;

procedure __DC__SetTCustomDCMemo__HideScrollBars(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).HideScrollBars:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__HighlightUrls(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).HighlightUrls;
end;

procedure __DC__SetTCustomDCMemo__HighlightUrls(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).HighlightUrls:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__WordWrap(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).WordWrap;
end;

procedure __DC__SetTCustomDCMemo__WordWrap(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).WordWrap:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__BlockOption(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).BlockOption;
end;

procedure __DC__SetTCustomDCMemo__BlockOption(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).BlockOption:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__OutFormat(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).OutFormat;
end;

procedure __DC__SetTCustomDCMemo__OutFormat(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).OutFormat:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__LineSeparator(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCMemo(Instance).LineSeparator);
end;

procedure __DC__SetTCustomDCMemo__LineSeparator(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).LineSeparator:=TLineSeparator(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCMemo__LineHighlight(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCMemo(Instance).LineHighlight);
end;

procedure __DC__SetTCustomDCMemo__LineHighlight(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).LineHighlight:=TLineHighlight(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCMemo__SpecialSymbols(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCMemo(Instance).SpecialSymbols);
end;

procedure __DC__SetTCustomDCMemo__SpecialSymbols(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).SpecialSymbols:=TSpecialSymbols(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCMemo__UseDefaultMenu(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).UseDefaultMenu;
end;

procedure __DC__SetTCustomDCMemo__UseDefaultMenu(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).UseDefaultMenu:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__MaxLineLen(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).MaxLineLen;
end;

function __DC__GetTCustomDCMemo__GutterLineIndent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).GutterLineIndent;
end;

procedure __DC__SetTCustomDCMemo__GutterLineIndent(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).GutterLineIndent:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__HintPause(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).HintPause;
end;

procedure __DC__SetTCustomDCMemo__HintPause(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).HintPause:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__WordSelectionType(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).WordSelectionType;
end;

procedure __DC__SetTCustomDCMemo__WordSelectionType(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).WordSelectionType:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__UseMonoFont(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCMemo(Instance).UseMonoFont;
end;

procedure __DC__SetTCustomDCMemo__UseMonoFont(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).UseMonoFont:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCMemo__SelAttributes(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCMemo(Instance).SelAttributes);
end;

procedure __DC__SetTCustomDCMemo__SelAttributes(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCMemo(Instance).SelAttributes:=TMemoAttributes(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTMemoAttributes__Charset(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMemoAttributes(Instance).Charset;
end;

procedure __DC__SetTMemoAttributes__Charset(Instance : TObject; Params : PVariantArgList);
begin
TMemoAttributes(Instance).Charset:=OleVariant(Params^[0]);
end;

function __DC__GetTMemoAttributes__Color(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMemoAttributes(Instance).Color;
end;

procedure __DC__SetTMemoAttributes__Color(Instance : TObject; Params : PVariantArgList);
begin
TMemoAttributes(Instance).Color:=OleVariant(Params^[0]);
end;

function __DC__GetTMemoAttributes__BkColor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMemoAttributes(Instance).BkColor;
end;

procedure __DC__SetTMemoAttributes__BkColor(Instance : TObject; Params : PVariantArgList);
begin
TMemoAttributes(Instance).BkColor:=OleVariant(Params^[0]);
end;

function __DC__GetTMemoAttributes__ConsistentAttributes(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TConsistentAttrs;
begin
tmp := TMemoAttributes(Instance).ConsistentAttributes;
result := VarFromSet(tmp, sizeof(tmp));
end;

function __DC__GetTMemoAttributes__Name(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMemoAttributes(Instance).Name;
end;

procedure __DC__SetTMemoAttributes__Name(Instance : TObject; Params : PVariantArgList);
begin
TMemoAttributes(Instance).Name:=OleVariant(Params^[0]);
end;

function __DC__GetTMemoAttributes__Pitch(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMemoAttributes(Instance).Pitch;
end;

procedure __DC__SetTMemoAttributes__Pitch(Instance : TObject; Params : PVariantArgList);
begin
TMemoAttributes(Instance).Pitch:=OleVariant(Params^[0]);
end;

function __DC__GetTMemoAttributes__Size(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMemoAttributes(Instance).Size;
end;

procedure __DC__SetTMemoAttributes__Size(Instance : TObject; Params : PVariantArgList);
begin
TMemoAttributes(Instance).Size:=OleVariant(Params^[0]);
end;

function __DC__GetTMemoAttributes__Style(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TFontStyles;
begin
tmp := TMemoAttributes(Instance).Style;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTMemoAttributes__Style(Instance : TObject; Params : PVariantArgList);
var
  tmp : TFontStyles;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TMemoAttributes(Instance).Style:=tmp;
end;

function __DC__GetTMemoAttributes__ResetOnOverFlow(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMemoAttributes(Instance).ResetOnOverFlow;
end;

procedure __DC__SetTMemoAttributes__ResetOnOverFlow(Instance : TObject; Params : PVariantArgList);
begin
TMemoAttributes(Instance).ResetOnOverFlow:=OleVariant(Params^[0]);
end;

function __DC__GetTMemoFont__Owner(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TMemoFont(Instance).Owner);
end;

function __DC__GetTTextStyles__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TTextStyles(Instance).Items[OleVariant(Params^[0])]);
end;

procedure __RegisterProps;
begin
RegisterProperty(TCustomDCMemo,'CharWidth',__DC__GetTCustomDCMemo__CharWidth,nil);
RegisterProperty(TCustomDCMemo,'LineHeight',__DC__GetTCustomDCMemo__LineHeight,nil);
RegisterProperty(TCustomDCMemo,'WinLinePos',__DC__GetTCustomDCMemo__WinLinePos,__DC__SetTCustomDCMemo__WinLinePos);
RegisterProperty(TCustomDCMemo,'WinCharPos',__DC__GetTCustomDCMemo__WinCharPos,__DC__SetTCustomDCMemo__WinCharPos);
RegisterProperty(TCustomDCMemo,'CaretCharPos',__DC__GetTCustomDCMemo__CaretCharPos,nil);
RegisterProperty(TCustomDCMemo,'CaretLinePos',__DC__GetTCustomDCMemo__CaretLinePos,nil);
RegisterProperty(TCustomDCMemo,'DisabledColor',__DC__GetTCustomDCMemo__DisabledColor,__DC__SetTCustomDCMemo__DisabledColor);
RegisterProperty(TCustomDCMemo,'ReadOnlyColor',__DC__GetTCustomDCMemo__ReadOnlyColor,__DC__SetTCustomDCMemo__ReadOnlyColor);
RegisterProperty(TCustomDCMemo,'CurPosText',__DC__GetTCustomDCMemo__CurPosText,nil);
RegisterProperty(TCustomDCMemo,'CaretPoint',__DC__GetTCustomDCMemo__CaretPoint,__DC__SetTCustomDCMemo__CaretPoint);
RegisterProperty(TCustomDCMemo,'CaretPos',__DC__GetTCustomDCMemo__CaretPos,__DC__SetTCustomDCMemo__CaretPos);
RegisterProperty(TCustomDCMemo,'SelColor',__DC__GetTCustomDCMemo__SelColor,__DC__SetTCustomDCMemo__SelColor);
RegisterProperty(TCustomDCMemo,'SelBackColor',__DC__GetTCustomDCMemo__SelBackColor,__DC__SetTCustomDCMemo__SelBackColor);
RegisterProperty(TCustomDCMemo,'MatchColor',__DC__GetTCustomDCMemo__MatchColor,__DC__SetTCustomDCMemo__MatchColor);
RegisterProperty(TCustomDCMemo,'MatchBackColor',__DC__GetTCustomDCMemo__MatchBackColor,__DC__SetTCustomDCMemo__MatchBackColor);
RegisterProperty(TCustomDCMemo,'HideSelection',__DC__GetTCustomDCMemo__HideSelection,__DC__SetTCustomDCMemo__HideSelection);
RegisterProperty(TCustomDCMemo,'SpacesInTab',__DC__GetTCustomDCMemo__SpacesInTab,__DC__SetTCustomDCMemo__SpacesInTab);
RegisterProperty(TCustomDCMemo,'HorzMaxPos',__DC__GetTCustomDCMemo__HorzMaxPos,__DC__SetTCustomDCMemo__HorzMaxPos);
RegisterProperty(TCustomDCMemo,'TextStyles',__DC__GetTCustomDCMemo__TextStyles,__DC__SetTCustomDCMemo__TextStyles);
RegisterProperty(TCustomDCMemo,'MemoSource',__DC__GetTCustomDCMemo__MemoSource,__DC__SetTCustomDCMemo__MemoSource);
RegisterProperty(TCustomDCMemo,'BorderStyle',__DC__GetTCustomDCMemo__BorderStyle,__DC__SetTCustomDCMemo__BorderStyle);
RegisterProperty(TCustomDCMemo,'UseGlobalOptions',__DC__GetTCustomDCMemo__UseGlobalOptions,__DC__SetTCustomDCMemo__UseGlobalOptions);
RegisterProperty(TCustomDCMemo,'ScrollBars',__DC__GetTCustomDCMemo__ScrollBars,__DC__SetTCustomDCMemo__ScrollBars);
RegisterProperty(TCustomDCMemo,'Options',__DC__GetTCustomDCMemo__Options,__DC__SetTCustomDCMemo__Options);
RegisterProperty(TCustomDCMemo,'MarginPos',__DC__GetTCustomDCMemo__MarginPos,__DC__SetTCustomDCMemo__MarginPos);
RegisterProperty(TCustomDCMemo,'GutterBrush',__DC__GetTCustomDCMemo__GutterBrush,__DC__SetTCustomDCMemo__GutterBrush);
RegisterProperty(TCustomDCMemo,'MarginPen',__DC__GetTCustomDCMemo__MarginPen,__DC__SetTCustomDCMemo__MarginPen);
RegisterProperty(TCustomDCMemo,'GutterLineColor',__DC__GetTCustomDCMemo__GutterLineColor,__DC__SetTCustomDCMemo__GutterLineColor);
RegisterProperty(TCustomDCMemo,'GutterWidth',__DC__GetTCustomDCMemo__GutterWidth,__DC__SetTCustomDCMemo__GutterWidth);
RegisterProperty(TCustomDCMemo,'GutterImgs',__DC__GetTCustomDCMemo__GutterImgs,__DC__SetTCustomDCMemo__GutterImgs);
RegisterProperty(TCustomDCMemo,'GutterImgsAlign',__DC__GetTCustomDCMemo__GutterImgsAlign,__DC__SetTCustomDCMemo__GutterImgsAlign);
RegisterProperty(TCustomDCMemo,'LineNumbersWidth',__DC__GetTCustomDCMemo__LineNumbersWidth,nil);
RegisterProperty(TCustomDCMemo,'ClipboardType',__DC__GetTCustomDCMemo__ClipboardType,__DC__SetTCustomDCMemo__ClipboardType);
RegisterProperty(TCustomDCMemo,'PlainText',__DC__GetTCustomDCMemo__PlainText,__DC__SetTCustomDCMemo__PlainText);
RegisterProperty(TCustomDCMemo,'ReadOnly',__DC__GetTCustomDCMemo__ReadOnly,__DC__SetTCustomDCMemo__ReadOnly);
RegisterProperty(TCustomDCMemo,'Lines',__DC__GetTCustomDCMemo__Lines,__DC__SetTCustomDCMemo__Lines);
RegisterProperty(TCustomDCMemo,'Font',__DC__GetTCustomDCMemo__Font,__DC__SetTCustomDCMemo__Font);
RegisterProperty(TCustomDCMemo,'PrinterFont',__DC__GetTCustomDCMemo__PrinterFont,__DC__SetTCustomDCMemo__PrinterFont);
RegisterProperty(TCustomDCMemo,'TemplateFont',__DC__GetTCustomDCMemo__TemplateFont,__DC__SetTCustomDCMemo__TemplateFont);
RegisterProperty(TCustomDCMemo,'UsePrinterFont',__DC__GetTCustomDCMemo__UsePrinterFont,__DC__SetTCustomDCMemo__UsePrinterFont);
RegisterProperty(TCustomDCMemo,'StringsOptions',__DC__GetTCustomDCMemo__StringsOptions,__DC__SetTCustomDCMemo__StringsOptions);
RegisterProperty(TCustomDCMemo,'SyntaxParser',__DC__GetTCustomDCMemo__SyntaxParser,__DC__SetTCustomDCMemo__SyntaxParser);
RegisterProperty(TCustomDCMemo,'TabStops',__DC__GetTCustomDCMemo__TabStops,__DC__SetTCustomDCMemo__TabStops);
RegisterProperty(TCustomDCMemo,'Delimeters',__DC__GetTCustomDCMemo__Delimeters,__DC__SetTCustomDCMemo__Delimeters);
RegisterProperty(TCustomDCMemo,'AllowUndo',__DC__GetTCustomDCMemo__AllowUndo,__DC__SetTCustomDCMemo__AllowUndo);
RegisterProperty(TCustomDCMemo,'UndoLimit',__DC__GetTCustomDCMemo__UndoLimit,__DC__SetTCustomDCMemo__UndoLimit);
RegisterProperty(TCustomDCMemo,'LineNumColor',__DC__GetTCustomDCMemo__LineNumColor,__DC__SetTCustomDCMemo__LineNumColor);
RegisterProperty(TCustomDCMemo,'LineNumAlign',__DC__GetTCustomDCMemo__LineNumAlign,__DC__SetTCustomDCMemo__LineNumAlign);
RegisterProperty(TCustomDCMemo,'BlockIndent',__DC__GetTCustomDCMemo__BlockIndent,__DC__SetTCustomDCMemo__BlockIndent);
RegisterProperty(TCustomDCMemo,'GutterBackColor',__DC__GetTCustomDCMemo__GutterBackColor,__DC__SetTCustomDCMemo__GutterBackColor);
RegisterProperty(TCustomDCMemo,'LineBookmarkColor',__DC__GetTCustomDCMemo__LineBookmarkColor,__DC__SetTCustomDCMemo__LineBookmarkColor);
RegisterProperty(TCustomDCMemo,'Text',__DC__GetTCustomDCMemo__Text,__DC__SetTCustomDCMemo__Text);
RegisterProperty(TCustomDCMemo,'SelText',__DC__GetTCustomDCMemo__SelText,__DC__SetTCustomDCMemo__SelText);
RegisterProperty(TCustomDCMemo,'PrintOptions',__DC__GetTCustomDCMemo__PrintOptions,__DC__SetTCustomDCMemo__PrintOptions);
RegisterProperty(TCustomDCMemo,'CodeTemplates',__DC__GetTCustomDCMemo__CodeTemplates,__DC__SetTCustomDCMemo__CodeTemplates);
RegisterProperty(TCustomDCMemo,'TemplatesType',__DC__GetTCustomDCMemo__TemplatesType,__DC__SetTCustomDCMemo__TemplatesType);
RegisterProperty(TCustomDCMemo,'HideCaret',__DC__GetTCustomDCMemo__HideCaret,__DC__SetTCustomDCMemo__HideCaret);
RegisterProperty(TCustomDCMemo,'LeftIndent',__DC__GetTCustomDCMemo__LeftIndent,__DC__SetTCustomDCMemo__LeftIndent);
RegisterProperty(TCustomDCMemo,'PrintIndent',__DC__GetTCustomDCMemo__PrintIndent,__DC__SetTCustomDCMemo__PrintIndent);
RegisterProperty(TCustomDCMemo,'MemoBackground',__DC__GetTCustomDCMemo__MemoBackground,__DC__SetTCustomDCMemo__MemoBackground);
RegisterProperty(TCustomDCMemo,'Background',__DC__GetTCustomDCMemo__Background,__DC__SetTCustomDCMemo__Background);
RegisterProperty(TCustomDCMemo,'BkgndOption',__DC__GetTCustomDCMemo__BkgndOption,__DC__SetTCustomDCMemo__BkgndOption);
RegisterProperty(TCustomDCMemo,'GutterBackground',__DC__GetTCustomDCMemo__GutterBackground,__DC__SetTCustomDCMemo__GutterBackground);
RegisterProperty(TCustomDCMemo,'LineNumBackColor',__DC__GetTCustomDCMemo__LineNumBackColor,__DC__SetTCustomDCMemo__LineNumBackColor);
RegisterProperty(TCustomDCMemo,'HideScrollBars',__DC__GetTCustomDCMemo__HideScrollBars,__DC__SetTCustomDCMemo__HideScrollBars);
RegisterProperty(TCustomDCMemo,'HighlightUrls',__DC__GetTCustomDCMemo__HighlightUrls,__DC__SetTCustomDCMemo__HighlightUrls);
RegisterProperty(TCustomDCMemo,'WordWrap',__DC__GetTCustomDCMemo__WordWrap,__DC__SetTCustomDCMemo__WordWrap);
RegisterProperty(TCustomDCMemo,'BlockOption',__DC__GetTCustomDCMemo__BlockOption,__DC__SetTCustomDCMemo__BlockOption);
RegisterProperty(TCustomDCMemo,'OutFormat',__DC__GetTCustomDCMemo__OutFormat,__DC__SetTCustomDCMemo__OutFormat);
RegisterProperty(TCustomDCMemo,'LineSeparator',__DC__GetTCustomDCMemo__LineSeparator,__DC__SetTCustomDCMemo__LineSeparator);
RegisterProperty(TCustomDCMemo,'LineHighlight',__DC__GetTCustomDCMemo__LineHighlight,__DC__SetTCustomDCMemo__LineHighlight);
RegisterProperty(TCustomDCMemo,'SpecialSymbols',__DC__GetTCustomDCMemo__SpecialSymbols,__DC__SetTCustomDCMemo__SpecialSymbols);
RegisterProperty(TCustomDCMemo,'UseDefaultMenu',__DC__GetTCustomDCMemo__UseDefaultMenu,__DC__SetTCustomDCMemo__UseDefaultMenu);
RegisterProperty(TCustomDCMemo,'MaxLineLen',__DC__GetTCustomDCMemo__MaxLineLen,nil);
RegisterProperty(TCustomDCMemo,'GutterLineIndent',__DC__GetTCustomDCMemo__GutterLineIndent,__DC__SetTCustomDCMemo__GutterLineIndent);
RegisterProperty(TCustomDCMemo,'HintPause',__DC__GetTCustomDCMemo__HintPause,__DC__SetTCustomDCMemo__HintPause);
RegisterProperty(TCustomDCMemo,'WordSelectionType',__DC__GetTCustomDCMemo__WordSelectionType,__DC__SetTCustomDCMemo__WordSelectionType);
RegisterProperty(TCustomDCMemo,'UseMonoFont',__DC__GetTCustomDCMemo__UseMonoFont,__DC__SetTCustomDCMemo__UseMonoFont);
RegisterProperty(TCustomDCMemo,'SelAttributes',__DC__GetTCustomDCMemo__SelAttributes,__DC__SetTCustomDCMemo__SelAttributes);
RegisterProperty(TMemoAttributes,'Charset',__DC__GetTMemoAttributes__Charset,__DC__SetTMemoAttributes__Charset);
RegisterProperty(TMemoAttributes,'Color',__DC__GetTMemoAttributes__Color,__DC__SetTMemoAttributes__Color);
RegisterProperty(TMemoAttributes,'BkColor',__DC__GetTMemoAttributes__BkColor,__DC__SetTMemoAttributes__BkColor);
RegisterProperty(TMemoAttributes,'ConsistentAttributes',__DC__GetTMemoAttributes__ConsistentAttributes,nil);
RegisterProperty(TMemoAttributes,'Name',__DC__GetTMemoAttributes__Name,__DC__SetTMemoAttributes__Name);
RegisterProperty(TMemoAttributes,'Pitch',__DC__GetTMemoAttributes__Pitch,__DC__SetTMemoAttributes__Pitch);
RegisterProperty(TMemoAttributes,'Size',__DC__GetTMemoAttributes__Size,__DC__SetTMemoAttributes__Size);
RegisterProperty(TMemoAttributes,'Style',__DC__GetTMemoAttributes__Style,__DC__SetTMemoAttributes__Style);
RegisterProperty(TMemoAttributes,'ResetOnOverFlow',__DC__GetTMemoAttributes__ResetOnOverFlow,__DC__SetTMemoAttributes__ResetOnOverFlow);
RegisterProperty(TMemoFont,'Owner',__DC__GetTMemoFont__Owner,nil);
RegisterIndexedProperty(TTextStyles,'Items',1,True,__DC__GetTTextStyles__Items,nil);
end;

const __ConstNames0 : array[0..83] of string = (
'sAll'
,'sNormal'
,'sCtrlK'
,'sCtrlQ'
,'sAltJ'
,'sCtrlX'
,'sCtrlO'
,'sAltBrief'
,'sAltBriefCol'
,'sBriefHomeEnd'
,'WHEELDELTA'
,'crMemoHandPt'
,'gfBitmap'
,'gfMetafile'
,'gfEnhancedMetafile'
,'moDrawMargin'
,'moDrawGutter'
,'moThumbTracking'
,'moDblClickLine'
,'moColorSyntax'
,'moLineNumbers'
,'moOverwriteCaret'
,'moLeftIndent'
,'moDisableDrag'
,'moSelectOnlyText'
,'moLineNumbersOnGutter'
,'moNotePadCursorStyle'
,'moBreakWordAtMargin'
,'moDrawSpecialSymbols'
,'moDisableRightClickMove'
,'moColoredLineStyle'
,'moDisableInvertedSel'
,'moHideInvisibleLines'
,'moDrawLineBookmarks'
,'moShowScrollHint'
,'moUseReadOnlyColor'
,'moExtendedSel'
,'moCenterOnBookmark'
,'moTripleClick'
,'moLimitLineNumbers'
,'cbNormal'
,'cbRtf'
,'poWrapLines'
,'poInColor'
,'poPrintSel'
,'poPrintHeader'
,'poLineNumbers'
,'poPrintSyntax'
,'poShowProgress'
,'esNone'
,'esBlockSel'
,'esBlockDrag'
,'esMarkWord'
,'mcNone'
,'mcText'
,'mcSelection'
,'mcSearchMatch'
,'moDrawLineSeparator'
,'moWrappedLineSeparator'
,'shDoubleLine'
,'shSingleLine'
,'csColor'
,'csBkColor'
,'csFace'
,'csCharSet'
,'csPitch'
,'csSize'
,'csBold'
,'csItalic'
,'csStrikeOut'
,'csUnderline'
,'csStyle'
,'ptHint'
,'ptListBox'
,'iaLeft'
,'iaRight'
,'dsBeforePaint'
,'dsAfterPaint'
,'dsText'
,'dsAfterText'
,'dsSelection'
,'dsMarkedText'
,'ptHeader'
,'ptFooter'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,sAll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,sNormal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,sCtrlK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,sCtrlQ));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,sAltJ));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,sCtrlX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,sCtrlO));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,sAltBrief));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,sAltBriefCol));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,sBriefHomeEnd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,WHEELDELTA));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,crMemoHandPt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,gfBitmap));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,gfMetafile));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,gfEnhancedMetafile));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,moDrawMargin));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,moDrawGutter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,moThumbTracking));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,moDblClickLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,moColorSyntax));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,moLineNumbers));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,moOverwriteCaret));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,moLeftIndent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,moDisableDrag));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,moSelectOnlyText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,moLineNumbersOnGutter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,moNotePadCursorStyle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,moBreakWordAtMargin));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,moDrawSpecialSymbols));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,moDisableRightClickMove));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,moColoredLineStyle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,moDisableInvertedSel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,moHideInvisibleLines));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,moDrawLineBookmarks));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,moShowScrollHint));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,moUseReadOnlyColor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,moExtendedSel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,moCenterOnBookmark));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,moTripleClick));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,moLimitLineNumbers));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,cbNormal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,cbRtf));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,poWrapLines));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,poInColor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,poPrintSel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,poPrintHeader));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,poLineNumbers));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,poPrintSyntax));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[48] ,poShowProgress));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[49] ,esNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[50] ,esBlockSel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[51] ,esBlockDrag));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[52] ,esMarkWord));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[53] ,mcNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[54] ,mcText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[55] ,mcSelection));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[56] ,mcSearchMatch));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[57] ,moDrawLineSeparator));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[58] ,moWrappedLineSeparator));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[59] ,shDoubleLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[60] ,shSingleLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[61] ,csColor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[62] ,csBkColor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[63] ,csFace));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[64] ,csCharSet));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[65] ,csPitch));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[66] ,csSize));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[67] ,csBold));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[68] ,csItalic));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[69] ,csStrikeOut));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[70] ,csUnderline));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[71] ,csStyle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[72] ,ptHint));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[73] ,ptListBox));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[74] ,iaLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[75] ,iaRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[76] ,dsBeforePaint));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[77] ,dsAfterPaint));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[78] ,dsText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[79] ,dsAfterText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[80] ,dsSelection));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[81] ,dsMarkedText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[82] ,ptHeader));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[83] ,ptFooter));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..19] of TClass = (
TAttributeParser,
TCustomDCMemo,
TDCGutterImages,
TDCMemo,
TFontList,
TGutterBackground,
TGutterImage,
TLineHighlight,
TLineInfoList,
TLineSeparator,
TMemoAttributes,
TMemoEnvOptions,
TMemoFont,
TMemoPostionStore,
TPositionList,
TSpecialSymbols,
TStoredPosition,
TTextStyle,
TTextStyles,
TWordWrapList
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..15] of string = (
'TWBPoint'
,'TWMContextMenu'
,'MemoList'
,'EnvOptObjectList'
,'RegisterMemoEnvOptObject'
,'UnRegisterMemoEnvOptObject'
,'GlobalMemoOptions'
,'GetConnectedMemos'
,'GetConnectedMemo'
,'GetConnectedMemoCount'
,'ImageListToGutterImages'
,'InitDefaultKeyboard'
,'InitClassicKeyboard'
,'InitBriefKeyboard'
,'InitEpsilonKeyboard'
,'RemoveExtraStyles'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TWBPoint_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(_TWMContextMenu_)));
RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T0),[TypeInfo(TList)],Addr(MemoList),cRegister);

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T1),[TypeInfo(TList)],Addr(EnvOptObjectList),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T2),[
TypeInfo(TObject)],Addr(RegisterMemoEnvOptObject),cRegister);

RegisterProc(nil,MethodNames[5],mtProc,TypeInfo(_T3),[
TypeInfo(TObject)],Addr(UnRegisterMemoEnvOptObject),cRegister);

RegisterProc(nil,MethodNames[6],mtProc,TypeInfo(_T4),[TypeInfo(TMemoEnvOptions)],Addr(GlobalMemoOptions),cRegister);

RegisterProc(nil,MethodNames[7],mtProc,TypeInfo(_T5),[
TypeInfo(TCustomMemoSource),
TypeInfo(TList)],Addr(GetConnectedMemos),cRegister);

RegisterProc(nil,MethodNames[8],mtProc,TypeInfo(_T6),[
TypeInfo(TCustomMemoSource),TypeInfo(TCustomDCMemo)],Addr(GetConnectedMemo),cRegister);

RegisterProc(nil,MethodNames[9],mtProc,TypeInfo(_T7),[
TypeInfo(TCustomMemoSource),TypeInfo(Integer)],Addr(GetConnectedMemoCount),cRegister);

RegisterProc(nil,MethodNames[10],mtProc,TypeInfo(_T8),[
TypeInfo(TImageList),
TypeInfo(TDCGutterImages)],Addr(ImageListToGutterImages),cRegister);

RegisterProc(nil,MethodNames[11],mtProc,TypeInfo(_T9),[
TypeInfo(TObject)],Addr(InitDefaultKeyboard),cRegister);

RegisterProc(nil,MethodNames[12],mtProc,TypeInfo(_T10),[
TypeInfo(TObject)],Addr(InitClassicKeyboard),cRegister);

RegisterProc(nil,MethodNames[13],mtProc,TypeInfo(_T11),[
TypeInfo(TObject)],Addr(InitBriefKeyboard),cRegister);

RegisterProc(nil,MethodNames[14],mtProc,TypeInfo(_T12),[
TypeInfo(TObject)],Addr(InitEpsilonKeyboard),cRegister);

RegisterProc(nil,MethodNames[15],mtProc,TypeInfo(_T14),NoParams,Addr(RemoveExtraStyles),cRegister);

RegRegisterMethod(TAttributeParser,'GetAttribute',TypeInfo(_T15),[
TypeInfo(IDispatch),
TypeInfo(TMemoAttributes)],Addr(__TAttributeParser__GetAttribute__Wrapper));

RegRegisterMethod(TAttributeParser,'ClearStyles',TypeInfo(_T16),NoParams,Addr(TAttributeParser.ClearStyles));

RegRegisterMethod(TCustomDCMemo,'HintCallBack',TypeInfo(_T17),[
TypeInfo(TObject),
TypeInfo(Integer)], pointer(140));

RegRegisterMethod(TCustomDCMemo,'SourceChanged',TypeInfo(_T18),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer)], pointer(144));

RegRegisterMethod(TCustomDCMemo,'CreateDefaultMemoSource',TypeInfo(_T19),[TypeInfo(TCustomMemoSource)], pointer(148));

RegRegisterMethod(TCustomDCMemo,'SetUseGlobalOptions',TypeInfo(_T20),[
TypeInfo(Boolean)], pointer(152));

RegRegisterMethod(TCustomDCMemo,'DoPaintGutter',TypeInfo(_T21),[
TypeInfo(IDispatch),
TypeInfo(TDrawState),TypeInfo(Boolean)], pointer(156));

RegRegisterMethod(TCustomDCMemo,'DoGetFontFromStyle',TypeInfo(_T22),[
TypeInfo(Integer),
TypeInfo(TFont),
TypeInfo(TColor)], pointer(160));

RegRegisterMethod(TCustomDCMemo,'CreatePrintDialog',TypeInfo(_T23),[TypeInfo(TCustomForm)], pointer(164));

RegRegisterMethod(TCustomDCMemo,'CreatePrintProgressDialog',TypeInfo(_T24),[TypeInfo(TCustomForm)], pointer(168));

RegRegisterMethod(TCustomDCMemo,'TemplateInsert',TypeInfo(_T25),[
TypeInfo(TStrings)], pointer(172));

RegRegisterMethod(TCustomDCMemo,'HintInsert',TypeInfo(_T26),[
TypeInfo(string)], pointer(176));

RegRegisterMethod(TCustomDCMemo,'ActivatePopupBox',TypeInfo(_T27),[
TypeInfo(TPopupType),TypeInfo(Boolean)], pointer(180));

RegRegisterMethod(TCustomDCMemo,'MarkWordOnTemplate',TypeInfo(_T28),NoParams, pointer(184));

RegRegisterMethod(TCustomDCMemo,'DoMemoScroll',TypeInfo(_T29),[
TypeInfo(TScrollStyle),
TypeInfo(Integer)], pointer(188));

RegRegisterMethod(TCustomDCMemo,'DoClickGutter',TypeInfo(_T30),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TShiftState)], pointer(192));

RegRegisterMethod(TCustomDCMemo,'DoCustomString',TypeInfo(_T31),[
TypeInfo(string),
TypeInfo(string)], pointer(196));

RegRegisterMethod(TCustomDCMemo,'DoGetColorStyle',TypeInfo(_T33),[
TypeInfo(IDispatch),
TypeInfo(Integer)], pointer(204));

RegRegisterMethod(TCustomDCMemo,'StateChanged',TypeInfo(_T34),[
TypeInfo(TMemoStates)], pointer(208));

RegRegisterMethod(TCustomDCMemo,'SelectionChanged',TypeInfo(_T35),NoParams, pointer(212));

RegRegisterMethod(TCustomDCMemo,'MemoJumpToUrl',TypeInfo(_T36),[
TypeInfo(string)], pointer(216));

RegRegisterMethod(TCustomDCMemo,'CollapseStateChanging',TypeInfo(_T37),[
TypeInfo(Integer),
TypeInfo(TCollapseState),TypeInfo(Boolean)], pointer(220));

RegRegisterMethod(TCustomDCMemo,'CollapseStateChanged',TypeInfo(_T38),[
TypeInfo(Integer),
TypeInfo(TCollapseState)], pointer(224));

RegRegisterMethod(TCustomDCMemo,'DoFindInPopupBox',TypeInfo(_T39),[
TypeInfo(TStrings),
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Boolean)], pointer(228));

RegRegisterMethod(TCustomDCMemo,'VerticalScroll',TypeInfo(_T40),[
TypeInfo(Integer)], pointer(232));

RegRegisterMethod(TCustomDCMemo,'InsertHint',TypeInfo(_T41),[
TypeInfo(string)], pointer(236));

RegRegisterMethod(TCustomDCMemo,'ClosePopupListBox',TypeInfo(_T42),[
TypeInfo(Word),
TypeInfo(TShiftState),TypeInfo(Boolean)], pointer(240));

RegRegisterMethod(TCustomDCMemo,'EnsureCaretVisible',TypeInfo(_T43),NoParams,Addr(TCustomDCMemo.EnsureCaretVisible));

RegRegisterMethod(TCustomDCMemo,'EnsurePointVisible',TypeInfo(_T44),[
TypeInfo(IDispatch)],Addr(__TCustomDCMemo__EnsurePointVisible__Wrapper));

RegRegisterMethod(TCustomDCMemo,'MemoJumpToLineBegin',TypeInfo(_T45),NoParams,Addr(TCustomDCMemo.MemoJumpToLineBegin));

RegRegisterMethod(TCustomDCMemo,'MemoJumpToLineEnd',TypeInfo(_T46),NoParams,Addr(TCustomDCMemo.MemoJumpToLineEnd));

RegRegisterMethod(TCustomDCMemo,'MemoMarkToLineBegin',TypeInfo(_T47),NoParams,Addr(TCustomDCMemo.MemoMarkToLineBegin));

RegRegisterMethod(TCustomDCMemo,'MemoMarkToLineEnd',TypeInfo(_T48),NoParams,Addr(TCustomDCMemo.MemoMarkToLineEnd));

RegRegisterMethod(TCustomDCMemo,'MemoCursorUp',TypeInfo(_T49),NoParams,Addr(TCustomDCMemo.MemoCursorUp));

RegRegisterMethod(TCustomDCMemo,'MemoCursorDown',TypeInfo(_T50),NoParams,Addr(TCustomDCMemo.MemoCursorDown));

RegRegisterMethod(TCustomDCMemo,'MemoCursorLeft',TypeInfo(_T51),NoParams,Addr(TCustomDCMemo.MemoCursorLeft));

RegRegisterMethod(TCustomDCMemo,'MemoCursorRight',TypeInfo(_T52),NoParams,Addr(TCustomDCMemo.MemoCursorRight));

RegRegisterMethod(TCustomDCMemo,'MemoMarkDown',TypeInfo(_T53),NoParams,Addr(TCustomDCMemo.MemoMarkDown));

RegRegisterMethod(TCustomDCMemo,'MemoMarkUp',TypeInfo(_T54),NoParams,Addr(TCustomDCMemo.MemoMarkUp));

RegRegisterMethod(TCustomDCMemo,'CheckCursorLeft',TypeInfo(_T55),NoParams,Addr(TCustomDCMemo.CheckCursorLeft));

RegRegisterMethod(TCustomDCMemo,'MemoMarkLeft',TypeInfo(_T56),NoParams,Addr(TCustomDCMemo.MemoMarkLeft));

RegRegisterMethod(TCustomDCMemo,'UpdateCaret',TypeInfo(_T57),NoParams,Addr(TCustomDCMemo.UpdateCaret));

RegRegisterMethod(TCustomDCMemo,'TextToPixelPoint',TypeInfo(_T58),[
TypeInfo(IDispatch),TypeInfo(IDispatch)],Addr(__TCustomDCMemo__TextToPixelPoint__Wrapper));

RegRegisterMethod(TCustomDCMemo,'GetCurentPosinPixels',TypeInfo(_T59),[TypeInfo(IDispatch)],Addr(__TCustomDCMemo__GetCurentPosinPixels__Wrapper));

RegRegisterMethod(TCustomDCMemo,'PopupHintBox',TypeInfo(_T60),[TypeInfo(Boolean)], pointer(244));

RegRegisterMethod(TCustomDCMemo,'TempHighlightLineWithStyle',TypeInfo(_T61),[
TypeInfo(Integer),
TypeInfo(string)],Addr(TCustomDCMemo.TempHighlightLineWithStyle));

RegRegisterMethod(TCustomDCMemo,'ToggleImageAndTextStyle',TypeInfo(_T62),[
TypeInfo(string)],Addr(TCustomDCMemo.ToggleImageAndTextStyle));

RegRegisterMethod(TCustomDCMemo,'ConvertMousePos',TypeInfo(_T64),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(IDispatch)],Addr(__TCustomDCMemo__ConvertMousePos__Wrapper));

RegRegisterMethod(TCustomDCMemo,'ConvertMousePosEx',TypeInfo(_T65),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Boolean),TypeInfo(IDispatch)],Addr(__TCustomDCMemo__ConvertMousePosEx__Wrapper));

RegRegisterMethod(TCustomDCMemo,'SetPosByMouse',TypeInfo(_T66),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TCustomDCMemo.SetPosByMouse));

RegRegisterMethod(TCustomDCMemo,'PointToImageIndex',TypeInfo(_T67),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Integer)],Addr(TCustomDCMemo.PointToImageIndex));

RegRegisterMethod(TCustomDCMemo,'DrawMetaFileToClipboard',TypeInfo(_T68),[
TypeInfo(Boolean)],Addr(TCustomDCMemo.DrawMetaFileToClipboard));

RegRegisterMethod(TCustomDCMemo,'DrawBitmapToClipboard',TypeInfo(_T69),NoParams,Addr(TCustomDCMemo.DrawBitmapToClipboard));

RegRegisterMethod(TCustomDCMemo,'DrawToBMPFile',TypeInfo(_T70),[
TypeInfo(string)],Addr(TCustomDCMemo.DrawToBMPFile));

RegRegisterMethod(TCustomDCMemo,'DrawToEMFWMF',TypeInfo(_T71),[
TypeInfo(string),
TypeInfo(Boolean)],Addr(TCustomDCMemo.DrawToEMFWMF));

RegRegisterMethod(TCustomDCMemo,'DrawToMetaFile',TypeInfo(_T72),[
TypeInfo(TMetaFile),
TypeInfo(THandle)],Addr(TCustomDCMemo.DrawToMetaFile));

RegRegisterMethod(TCustomDCMemo,'DrawToMetaFileEx',TypeInfo(_T73),[
TypeInfo(TMetaFile),
TypeInfo(THandle),
TypeInfo(Integer)],Addr(TCustomDCMemo.DrawToMetaFileEx));

RegRegisterMethod(TCustomDCMemo,'DrawToBitmap',TypeInfo(_T74),[
TypeInfo(TBitmap)],Addr(TCustomDCMemo.DrawToBitmap));

RegRegisterMethod(TCustomDCMemo,'CopyGraphicToClipboard',TypeInfo(_T75),[
TypeInfo(TDCGraphicsFormat)],Addr(TCustomDCMemo.CopyGraphicToClipboard));

RegRegisterMethod(TCustomDCMemo,'DrawToFile',TypeInfo(_T76),[
TypeInfo(string),
TypeInfo(TDCGraphicsFormat)],Addr(TCustomDCMemo.DrawToFile));

RegRegisterMethod(TCustomDCMemo,'PrintWithDialog',TypeInfo(_T77),NoParams,Addr(TCustomDCMemo.PrintWithDialog));

RegRegisterMethod(TCustomDCMemo,'Print',TypeInfo(_T78),NoParams,Addr(TCustomDCMemo.Print));

RegRegisterMethod(TCustomDCMemo,'SelLength',TypeInfo(_T79),[TypeInfo(Integer)],Addr(TCustomDCMemo.SelLength));

RegRegisterMethod(TCustomDCMemo,'LoadGlobalOptions',TypeInfo(_T80),NoParams, pointer(248));

RegRegisterMethod(TCustomDCMemo,'ProcessEscape',TypeInfo(_T81),NoParams,Addr(TCustomDCMemo.ProcessEscape));

RegRegisterMethod(TCustomDCMemo,'CancelDragging',TypeInfo(_T82),NoParams,Addr(TCustomDCMemo.CancelDragging));

RegRegisterMethod(TCustomDCMemo,'InsertSpace',TypeInfo(_T83),NoParams,Addr(TCustomDCMemo.InsertSpace));

RegRegisterMethod(TCustomDCMemo,'MarkColPageUp',TypeInfo(_T84),NoParams,Addr(TCustomDCMemo.MarkColPageUp));

RegRegisterMethod(TCustomDCMemo,'MarkColPageDown',TypeInfo(_T85),NoParams,Addr(TCustomDCMemo.MarkColPageDown));

RegRegisterMethod(TCustomDCMemo,'MarkColToTop',TypeInfo(_T86),NoParams,Addr(TCustomDCMemo.MarkColToTop));

RegRegisterMethod(TCustomDCMemo,'MarkColToBottom',TypeInfo(_T87),NoParams,Addr(TCustomDCMemo.MarkColToBottom));

RegRegisterMethod(TCustomDCMemo,'MarkPageUp',TypeInfo(_T88),NoParams,Addr(TCustomDCMemo.MarkPageUp));

RegRegisterMethod(TCustomDCMemo,'MarkPageDown',TypeInfo(_T89),NoParams,Addr(TCustomDCMemo.MarkPageDown));

RegRegisterMethod(TCustomDCMemo,'MarkToBottom',TypeInfo(_T90),NoParams,Addr(TCustomDCMemo.MarkToBottom));

RegRegisterMethod(TCustomDCMemo,'MarkToTop',TypeInfo(_T91),NoParams,Addr(TCustomDCMemo.MarkToTop));

RegRegisterMethod(TCustomDCMemo,'JumpToScreenTop',TypeInfo(_T92),NoParams,Addr(TCustomDCMemo.JumpToScreenTop));

RegRegisterMethod(TCustomDCMemo,'JumpToScreenBottom',TypeInfo(_T93),NoParams,Addr(TCustomDCMemo.JumpToScreenBottom));

RegRegisterMethod(TCustomDCMemo,'JumpLeftMost',TypeInfo(_T94),NoParams,Addr(TCustomDCMemo.JumpLeftMost));

RegRegisterMethod(TCustomDCMemo,'JumpRightMost',TypeInfo(_T95),NoParams,Addr(TCustomDCMemo.JumpRightMost));

RegRegisterMethod(TCustomDCMemo,'PageDown',TypeInfo(_T96),NoParams,Addr(TCustomDCMemo.PageDown));

RegRegisterMethod(TCustomDCMemo,'PageUp',TypeInfo(_T97),NoParams,Addr(TCustomDCMemo.PageUp));

RegRegisterMethod(TCustomDCMemo,'PageLeft',TypeInfo(_T98),NoParams,Addr(TCustomDCMemo.PageLeft));

RegRegisterMethod(TCustomDCMemo,'PageRight',TypeInfo(_T99),NoParams,Addr(TCustomDCMemo.PageRight));

RegRegisterMethod(TCustomDCMemo,'ScrollScreenHorz',TypeInfo(_T100),[
TypeInfo(Integer)],Addr(TCustomDCMemo.ScrollScreenHorz));

RegRegisterMethod(TCustomDCMemo,'ScrollScreenVert',TypeInfo(_T101),[
TypeInfo(Integer)],Addr(TCustomDCMemo.ScrollScreenVert));

RegRegisterMethod(TCustomDCMemo,'ScrollUp',TypeInfo(_T102),NoParams,Addr(TCustomDCMemo.ScrollUp));

RegRegisterMethod(TCustomDCMemo,'ScrollDown',TypeInfo(_T103),NoParams,Addr(TCustomDCMemo.ScrollDown));

RegRegisterMethod(TCustomDCMemo,'ScrollPageUp',TypeInfo(_T104),NoParams,Addr(TCustomDCMemo.ScrollPageUp));

RegRegisterMethod(TCustomDCMemo,'ScrollPageDown',TypeInfo(_T105),NoParams,Addr(TCustomDCMemo.ScrollPageDown));

RegRegisterMethod(TCustomDCMemo,'ScrollLeft',TypeInfo(_T106),NoParams,Addr(TCustomDCMemo.ScrollLeft));

RegRegisterMethod(TCustomDCMemo,'ScrollRight',TypeInfo(_T107),NoParams,Addr(TCustomDCMemo.ScrollRight));

RegRegisterMethod(TCustomDCMemo,'ScrollPageRight',TypeInfo(_T108),NoParams,Addr(TCustomDCMemo.ScrollPageRight));

RegRegisterMethod(TCustomDCMemo,'ScrollPageLeft',TypeInfo(_T109),NoParams,Addr(TCustomDCMemo.ScrollPageLeft));

RegRegisterMethod(TCustomDCMemo,'CenterScreenOnLine',TypeInfo(_T110),NoParams,Addr(TCustomDCMemo.CenterScreenOnLine));

RegRegisterMethod(TCustomDCMemo,'CenteredJumpTo',TypeInfo(_T111),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TCustomDCMemo.CenteredJumpTo));

RegRegisterMethod(TCustomDCMemo,'PromptedGotoLine',TypeInfo(_T112),NoParams,Addr(TCustomDCMemo.PromptedGotoLine));

RegRegisterMethod(TCustomDCMemo,'GetSource',TypeInfo(_T113),[TypeInfo(TCustomMemoSource)],Addr(TCustomDCMemo.GetSource));

RegRegisterMethod(TCustomDCMemo,'LoadFromFile',TypeInfo(_T114),[
TypeInfo(string)],Addr(TCustomDCMemo.LoadFromFile));

RegRegisterMethod(TCustomDCMemo,'SaveToFile',TypeInfo(_T115),[
TypeInfo(string)],Addr(TCustomDCMemo.SaveToFile));

RegRegisterMethod(TCustomDCMemo,'ShowCodeTemplates',TypeInfo(_T116),NoParams,Addr(TCustomDCMemo.ShowCodeTemplates));

RegRegisterMethod(TCustomDCMemo,'ExportTo',TypeInfo(_T117),[
TypeInfo(TDCExporter)],Addr(TCustomDCMemo.ExportTo));

RegRegisterMethod(TCustomDCMemo,'ExportToHtmlFile',TypeInfo(_T120),[
TypeInfo(string)],Addr(TCustomDCMemo.ExportToHtmlFile));

RegRegisterMethod(TCustomDCMemo,'ExportToRtfFile',TypeInfo(_T121),[
TypeInfo(string)],Addr(TCustomDCMemo.ExportToRtfFile));

RegRegisterMethod(TCustomDCMemo,'ExportToHtmlStream',TypeInfo(_T122),[
TypeInfo(TStream)],Addr(TCustomDCMemo.ExportToHtmlStream));

RegRegisterMethod(TCustomDCMemo,'ExportToRtfStream',TypeInfo(_T123),[
TypeInfo(TStream)],Addr(TCustomDCMemo.ExportToRtfStream));

RegRegisterMethod(TCustomDCMemo,'ExportToEx',TypeInfo(_T124),[
TypeInfo(TDCExporter),
TypeInfo(Boolean)],Addr(TCustomDCMemo.ExportToEx));

RegRegisterMethod(TCustomDCMemo,'ExportToHtmlFileEx',TypeInfo(_T127),[
TypeInfo(string),
TypeInfo(Boolean)],Addr(TCustomDCMemo.ExportToHtmlFileEx));

RegRegisterMethod(TCustomDCMemo,'ExportToRtfFileEx',TypeInfo(_T128),[
TypeInfo(string),
TypeInfo(Boolean)],Addr(TCustomDCMemo.ExportToRtfFileEx));

RegRegisterMethod(TCustomDCMemo,'ExportToHtmlStreamEx',TypeInfo(_T129),[
TypeInfo(TStream),
TypeInfo(Boolean)],Addr(TCustomDCMemo.ExportToHtmlStreamEx));

RegRegisterMethod(TCustomDCMemo,'ExportToRtfStreamEx',TypeInfo(_T130),[
TypeInfo(TStream),
TypeInfo(Boolean)],Addr(TCustomDCMemo.ExportToRtfStreamEx));

RegRegisterMethod(TCustomDCMemo,'PasteFromRtfStream',TypeInfo(_T131),[
TypeInfo(TStream)],Addr(TCustomDCMemo.PasteFromRtfStream));

RegRegisterMethod(TCustomDCMemo,'PasteFromRtfFile',TypeInfo(_T132),[
TypeInfo(string)],Addr(TCustomDCMemo.PasteFromRtfFile));

RegRegisterMethod(TCustomDCMemo,'LoadFromRtfStream',TypeInfo(_T133),[
TypeInfo(TStream)],Addr(TCustomDCMemo.LoadFromRtfStream));

RegRegisterMethod(TCustomDCMemo,'LoadFromRtfFile',TypeInfo(_T134),[
TypeInfo(string)],Addr(TCustomDCMemo.LoadFromRtfFile));

RegRegisterMethod(TCustomDCMemo,'PasteFromHtmlStream',TypeInfo(_T135),[
TypeInfo(TStream)],Addr(TCustomDCMemo.PasteFromHtmlStream));

RegRegisterMethod(TCustomDCMemo,'PasteFromHtmlFile',TypeInfo(_T136),[
TypeInfo(string)],Addr(TCustomDCMemo.PasteFromHtmlFile));

RegRegisterMethod(TCustomDCMemo,'LoadFromHtmlStream',TypeInfo(_T137),[
TypeInfo(TStream)],Addr(TCustomDCMemo.LoadFromHtmlStream));

RegRegisterMethod(TCustomDCMemo,'LoadFromHtmlFile',TypeInfo(_T138),[
TypeInfo(string)],Addr(TCustomDCMemo.LoadFromHtmlFile));

RegRegisterMethod(TCustomDCMemo,'TextAtMousePoint',TypeInfo(_T140),[
TypeInfo(IDispatch),TypeInfo(string)],Addr(__TCustomDCMemo__TextAtMousePoint__Wrapper));

RegRegisterMethod(TCustomDCMemo,'GetMaxCaretLine',TypeInfo(_T141),[TypeInfo(Integer)],Addr(TCustomDCMemo.GetMaxCaretLine));

RegRegisterMethod(TCustomDCMemo,'GetMaxCaretChar',TypeInfo(_T142),[TypeInfo(Integer)],Addr(TCustomDCMemo.GetMaxCaretChar));

RegRegisterMethod(TCustomDCMemo,'ShowPopupHint',TypeInfo(_T143),[
TypeInfo(string),
TypeInfo(IDispatch),
TypeInfo(Boolean)],Addr(__TCustomDCMemo__ShowPopupHint__Wrapper));

RegRegisterMethod(TCustomDCMemo,'HidePopupHint',TypeInfo(_T144),NoParams,Addr(TCustomDCMemo.HidePopupHint));

RegRegisterMethod(TCustomDCMemo,'ShowPopupListBox',TypeInfo(_T145),[
TypeInfo(TStrings)],Addr(TCustomDCMemo.ShowPopupListBox));

RegRegisterMethod(TCustomDCMemo,'ShowPopupListBoxEx',TypeInfo(_T146),[
TypeInfo(TStrings),
ArrayInfo(TypeInfo(TLeftRightAlign)),
TypeInfo(Integer)],Addr(TCustomDCMemo.ShowPopupListBoxEx));

RegRegisterMethod(TCustomDCMemo,'CopyToClipboard',TypeInfo(_T147),NoParams, pointer(252));

RegRegisterMethod(TCustomDCMemo,'CutToClipboard',TypeInfo(_T148),NoParams, pointer(256));

RegRegisterMethod(TCustomDCMemo,'PasteFromClipboard',TypeInfo(_T149),NoParams, pointer(260));

RegRegisterMethod(TCustomDCMemo,'CanPaste',TypeInfo(_T150),[TypeInfo(Boolean)],Addr(TCustomDCMemo.CanPaste));

RegRegisterMethod(TCustomDCMemo,'GetWrapLines',TypeInfo(_T151),[
TypeInfo(TStrings)],Addr(TCustomDCMemo.GetWrapLines));

RegRegisterMethod(TCustomDCMemo,'GetBlockWrapLines',TypeInfo(_T152),[
TypeInfo(TStrings)],Addr(TCustomDCMemo.GetBlockWrapLines));

RegRegisterMethod(TDCGutterImages,'AddFromResource',TypeInfo(_T153),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Integer)],Addr(TDCGutterImages.AddFromResource));

RegRegisterMethod(TLineHighlight,'Update',TypeInfo(_T154),NoParams, pointer(12));

RegisterProc(TLineHighlight,'Create',mtConstructor,TypeInfo(_T155),[
TypeInfo(TCustomDCMemo)], pointer(16),cRegister);

RegRegisterMethod(TLineSeparator,'Update',TypeInfo(_T156),NoParams, pointer(12));

RegisterProc(TLineSeparator,'Create',mtConstructor,TypeInfo(_T157),[
TypeInfo(TCustomDCMemo)], pointer(16),cRegister);

RegisterProc(TMemoAttributes,'Create',mtConstructor,TypeInfo(_T158),[
TypeInfo(TCustomDCMemo)],Addr(TMemoAttributes.Create),cRegister);

RegRegisterMethod(TMemoAttributes,'Update',TypeInfo(_T159),NoParams,Addr(TMemoAttributes.Update));

RegRegisterMethod(TMemoAttributes,'BeginUpdate',TypeInfo(_T160),NoParams,Addr(TMemoAttributes.BeginUpdate));

RegRegisterMethod(TMemoAttributes,'EndUpdate',TypeInfo(_T161),NoParams,Addr(TMemoAttributes.EndUpdate));

RegisterProc(TMemoFont,'Create',mtConstructor,TypeInfo(_T162),[
TypeInfo(TPersistent)],Addr(TMemoFont.Create),cRegister);

RegisterProc(TMemoPostionStore,'Create',mtConstructor,TypeInfo(_T163),NoParams,Addr(TMemoPostionStore.Create),cRegister);

RegRegisterMethod(TMemoPostionStore,'SavePosition',TypeInfo(_T164),[
TypeInfo(TCustomDCMemo)],Addr(TMemoPostionStore.SavePosition));

RegRegisterMethod(TMemoPostionStore,'RestorePosition',TypeInfo(_T165),[
TypeInfo(TCustomDCMemo)],Addr(TMemoPostionStore.RestorePosition));

RegisterProc(TSpecialSymbols,'Create',mtConstructor,TypeInfo(_T166),[
TypeInfo(TCustomDCMemo)],Addr(TSpecialSymbols.Create),cRegister);

RegisterProc(TStoredPosition,'Create',mtConstructor,TypeInfo(_T167),[
TypeInfo(TCustomDCMemo)],Addr(TStoredPosition.Create),cRegister);

RegRegisterMethod(TTextStyle,'Memo',TypeInfo(_T168),[TypeInfo(TCustomDCMemo)],Addr(TTextStyle.Memo));

RegRegisterMethod(TTextStyles,'SetDefaultStyles',TypeInfo(_T169),NoParams,Addr(TTextStyles.SetDefaultStyles));

RegRegisterMethod(TTextStyles,'UpdateParams',TypeInfo(_T170),NoParams,Addr(TTextStyles.UpdateParams));

RegRegisterMethod(TTextStyles,'GetMaxCharWidth',TypeInfo(_T171),[TypeInfo(Integer)],Addr(TTextStyles.GetMaxCharWidth));

RegRegisterMethod(TTextStyles,'GetMaxCharHeight',TypeInfo(_T172),[TypeInfo(Integer)],Addr(TTextStyles.GetMaxCharHeight));

RegRegisterMethod(TTextStyles,'AddStyle',TypeInfo(_T173),[
TypeInfo(string),
TypeInfo(TColor),
TypeInfo(TColor),TypeInfo(TTextStyle)],Addr(TTextStyles.AddStyle));

RegRegisterMethod(TTextStyles,'AddStyleEx',TypeInfo(_T174),[
TypeInfo(string),
TypeInfo(TColor),
TypeInfo(TColor),
TypeInfo(TFontStyles),
TypeInfo(TUpdateMemoColors),
TypeInfo(Boolean),
TypeInfo(Boolean),TypeInfo(TTextStyle)],Addr(TTextStyles.AddStyleEx));

RegRegisterMethod(TTextStyles,'LoadColorStyles',TypeInfo(_T175),NoParams,Addr(TTextStyles.LoadColorStyles));

RegRegisterMethod(TTextStyles,'SaveColorStyles',TypeInfo(_T176),NoParams,Addr(TTextStyles.SaveColorStyles));

RegRegisterMethod(TTextStyles,'BeginParserUpdate',TypeInfo(_T177),NoParams,Addr(TTextStyles.BeginParserUpdate));

RegRegisterMethod(TTextStyles,'EndParserUpdate',TypeInfo(_T178),NoParams,Addr(TTextStyles.EndParserUpdate));

RegRegisterMethod(TWordWrapList,'ClearRange',TypeInfo(_T180),[
TypeInfo(Integer),
TypeInfo(Integer)], pointer(12));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'EnumTextStyles',mtProc,TypeInfo(_T13),[
TypeInfo(TGetStrProc)],Addr(EnumTextStyles),cRegister)}

{RegRegisterMethod(TCustomDCMemo,'SetSelTextBuf',TypeInfo(_T63),[
TypeInfoPChar],Addr(TCustomDCMemo.SetSelTextBuf))}

{RegRegisterMethod(TCustomDCMemo,'ExportToStream',TypeInfo(_T118),[
TypeInfo(TStream),
TypeInfo(TDCExporterClass)],Addr(TCustomDCMemo.ExportToStream))}

{RegRegisterMethod(TCustomDCMemo,'ExportToFile',TypeInfo(_T119),[
TypeInfo(string),
TypeInfo(TDCExporterClass)],Addr(TCustomDCMemo.ExportToFile))}

{RegRegisterMethod(TCustomDCMemo,'ExportToStreamEx',TypeInfo(_T125),[
TypeInfo(TStream),
TypeInfo(TDCExporterClass),
TypeInfo(Boolean)],Addr(TCustomDCMemo.ExportToStreamEx))}

{RegRegisterMethod(TCustomDCMemo,'ExportToFileEx',TypeInfo(_T126),[
TypeInfo(string),
TypeInfo(TDCExporterClass),
TypeInfo(Boolean)],Addr(TCustomDCMemo.ExportToFileEx))}

{RegRegisterMethod(TCustomDCMemo,'PasteFromImportStream',TypeInfo(_T139),[
TypeInfo(TStream),
TypeInfo(TDCImporterClass)],Addr(TCustomDCMemo.PasteFromImportStream))}

{RegRegisterMethod(TWordWrapList,'FindNear',TypeInfo(_T179),[
TypeInfoPointer,
TypeInfo(Boolean),
TypeInfo(Boolean),TypeInfo(Integer)],Addr(TWordWrapList.FindNear))}

RegisterEvent(TypeInfo(TBeforePrintEvent),[
TypeInfo(TObject),
TypeInfo(string),
TypeInfo(TPrintType)]);

RegisterEvent(TypeInfo(TClickGutterEvent),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TShiftState)]);

RegisterEvent(TypeInfo(TCollapseStateChanged),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TCollapseStateChanging),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Boolean),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TConvertProc),[
TypeInfo(Integer),TypeInfo(Integer)]);

{RegisterEvent(TypeInfo(TCustomDrawEvent),[
TypeInfo(TObject),
TypeInfo(TCanvas),
TypeInfo(IDispatch),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(string),
TypeInfo(TDrawStates),
TypeInfo(Boolean)]);}

RegisterEvent(TypeInfo(TCustomStringEvent),[
TypeInfo(TObject),
TypeInfo(string),
TypeInfo(string)]);

{RegisterEvent(TypeInfo(TDrawGutterEvent),[
TypeInfo(TObject),
TypeInfo(TCanvas),
TypeInfo(IDispatch),
TypeInfo(TDrawState),
TypeInfo(Boolean)]);}

RegisterEvent(TypeInfo(TExportStringEvent),[
TypeInfo(TObject),
TypeInfo(string)]);

RegisterEvent(TypeInfo(TFindStringInPopupEvent),[
TypeInfo(TObject),
TypeInfo(TStrings),
TypeInfo(string),
TypeInfo(Integer),
TypeInfo(Boolean)]);

{RegisterEvent(TypeInfo(TGetColorStyleEvent),[
TypeInfo(TObject),
TypeInfo(IDispatch),
TypeInfo(Integer)]);}

RegisterEvent(TypeInfo(TGetFontFromStyleEvent),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(TFont),
TypeInfo(TColor)]);

RegisterEvent(TypeInfo(TGetLineNumberEvent),[
TypeInfo(TObject),
TypeInfo(string),
TypeInfo(Integer)]);

RegisterEvent(TypeInfo(THintInsertEvent),[
TypeInfo(TObject),
TypeInfo(string)]);

RegisterEvent(TypeInfo(THintPopup),[
TypeInfo(TObject),
TypeInfo(TStrings),
TypeInfo(Boolean),
TypeInfo(TPopupType)]);

RegisterEvent(TypeInfo(TJumpToUrlEvent),[
TypeInfo(TObject),
TypeInfo(string),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TMemoChangeEvent),[
TypeInfo(TObject),
TypeInfo(TMemoStates)]);

RegisterEvent(TypeInfo(TMemoScrollEvent),[
TypeInfo(TObject),
TypeInfo(TScrollStyle),
TypeInfo(Integer)]);

RegisterEvent(TypeInfo(TVertScrollEvent),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Boolean),
TypeInfo(Boolean),
TypeInfo(string)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
