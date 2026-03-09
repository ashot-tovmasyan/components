{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit GRAPHICS_C3;
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
  Graphics;
function ConvertTBrushDataToVariant(var R : TBrushData) : OleVariant;
function ConvertVariantToTBrushData(const V : OleVariant) : TBrushData;
function ConvertTFontDataToVariant(var R : TFontData) : OleVariant;
function ConvertVariantToTFontData(const V : OleVariant) : TFontData;
function ConvertTPenDataToVariant(var R : TPenData) : OleVariant;
function ConvertVariantToTPenData(const V : OleVariant) : TPenData;
function ConvertTPointToVariant(var R : TPoint) : OleVariant;
function ConvertVariantToTPoint(const V : OleVariant) : TPoint;
function ConvertTRectToVariant(var R : TRect) : OleVariant;
function ConvertVariantToTRect(const V : OleVariant) : TRect;
function ConvertTResDataToVariant(var R : TResData) : OleVariant;
function ConvertVariantToTResData(const V : OleVariant) : TResData;
function ConvertTResourceToVariant(var R : TResource) : OleVariant;
function ConvertVariantToTResource(const V : OleVariant) : TResource;
function ConvertTSizeToVariant(var R : TSize) : OleVariant;
function ConvertVariantToTSize(const V : OleVariant) : TSize;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
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
type __TFontData__Wrapper = class(TDCRecordWrapper)
private
fR : TFontData;
public
function GetRecordPtr : pointer; override;
published
procedure setHeight(const val : Integer);
function getHeight : Integer;
property Height : Integer read getHeight write setHeight;
procedure setPitch(const val : TFontPitch);
function getPitch : TFontPitch;
property Pitch : TFontPitch read getPitch write setPitch;
procedure setCharset(const val : TFontCharset);
function getCharset : TFontCharset;
property Charset : TFontCharset read getCharset write setCharset;
procedure setName(const val : TFontDataName);
function getName : TFontDataName;
property Name : TFontDataName read getName write setName;
end;
type __TBrushData__Wrapper = class(TDCRecordWrapper)
private
fR : TBrushData;
public
function GetRecordPtr : pointer; override;
published
procedure setColor(const val : TColor);
function getColor : TColor;
property Color : TColor read getColor write setColor;
procedure setBitmap(const val : TBitmap);
function getBitmap : TBitmap;
property Bitmap : TBitmap read getBitmap write setBitmap;
procedure setStyle(const val : TBrushStyle);
function getStyle : TBrushStyle;
property Style : TBrushStyle read getStyle write setStyle;
end;
type __TPenData__Wrapper = class(TDCRecordWrapper)
private
fR : TPenData;
public
function GetRecordPtr : pointer; override;
published
procedure setColor(const val : TColor);
function getColor : TColor;
property Color : TColor read getColor write setColor;
procedure setWidth(const val : Integer);
function getWidth : Integer;
property Width : Integer read getWidth write setWidth;
procedure setStyle(const val : TPenStyle);
function getStyle : TPenStyle;
property Style : TPenStyle read getStyle write setStyle;
end;
type __TResData__Wrapper = class(TDCRecordWrapper)
private
fR : TResData;
public
function GetRecordPtr : pointer; override;
published
procedure setHandle(const val : THandle);
function getHandle : THandle;
property Handle : THandle read getHandle write setHandle;
end;
type __TResource__Wrapper = class(TDCRecordWrapper)
private
fR : TResource;
public
function GetRecordPtr : pointer; override;
published
procedure setRefCount(const val : Integer);
function getRefCount : Integer;
property RefCount : Integer read getRefCount write setRefCount;
procedure setHandle(const val : THandle);
function getHandle : THandle;
property Handle : THandle read getHandle write setHandle;
procedure setHashCode(const val : Word);
function getHashCode : Word;
property HashCode : Word read getHashCode write setHashCode;
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
type __TGraphic__ = class(TGraphic);
type __TPicture__ = class(TPicture);
type
{_T0 = function (p0 : TGraphicClass): string of object;}

{_T1 = function (p0 : TGraphicClass): string of object;}

{_T2 = function (p0 : TGraphicClass): string of object;}

_T3 = function (p0 : TColor): Longint of object;

_T4 = function (p0 : TColor): string of object;

_T5 = function (const p0 : string): TColor of object;

{_T6 = procedure (p0 : TGetStrProc) of object;}

_T7 = function (p0 : Longint;
var p1 : string): Boolean of object;

_T8 = function (const p0 : string;
var p1 : Longint): Boolean of object;

{_T9 = procedure (p0 : TGetStrProc) of object;}

_T10 = _T7;

_T11 = _T8;

_T12 = procedure (p0 : HBITMAP;
var p1 : Integer;
var p2 : DWORD) of object;

_T13 = function (p0 : HBITMAP;
p1 : HPALETTE;
var p2 : HPALETTE;
var p3): Boolean of object;

_T14 = procedure  of object;

_T15 = _T14;

_T16 = function : TFontCharset of object;

_T17 = function (p0 : HDC;
p1 : Integer;
p2 : Integer;
p3 : Integer;
p4 : Integer;
p5 : HDC;
p6 : Integer;
p7 : Integer;
p8 : Integer;
p9 : Integer;
p10 : HDC;
p11 : Integer;
p12 : Integer): Boolean of object;

_T18 = function (p0 : HBITMAP;
const p1 : Array of TColor;
const p2 : Array of TColor): HBITMAP of object;

{_T19 = function (p0 : THandle;
p1 : PChar;
const p2 : Array of TColor;
const p3 : Array of TColor): HBITMAP of object;}

_T20 = function (p0 : HBITMAP): HBITMAP of object;

{_T21 = function (p0 : THandle;
p1 : PChar): HBITMAP of object;}

_T22 = function : HBITMAP of object;

_T23 = _T22;

_T24 = procedure (p0 : TBitmapHandleType) of object;

_T25 = _T14;

_T26 = _T14;

_T27 = procedure (p0 : THandle;
const p1 : string) of object;

_T28 = procedure (p0 : THandle;
p1 : Integer) of object;

_T29 = procedure (p0 : TColor) of object;

_T30 = _T22;

_T31 = _T22;

_T32 = function : HPALETTE of object;

_T33 = _T14;

_T34 = _T14;

_T35 = _T14;

_T36 = _T14;

_T37 = _T14;

_T38 = procedure (p0 : Integer;
p1 : Integer;
p2 : Integer;
p3 : Integer;
p4 : Integer;
p5 : Integer;
p6 : Integer;
p7 : Integer) of object;

_T39 = procedure (const p0 : IDispatch;
p1 : TBitmap;
const p2 : IDispatch;
p3 : TColor) of object;

_T40 = _T38;

_T41 = procedure (const p0 : IDispatch;
p1 : TCanvas;
const p2 : IDispatch) of object;

_T42 = procedure (p0 : Integer;
p1 : Integer;
p2 : TGraphic) of object;

_T43 = procedure (const p0 : IDispatch) of object;

_T44 = procedure (p0 : Integer;
p1 : Integer;
p2 : Integer;
p3 : Integer) of object;

_T45 = _T43;

_T46 = procedure (p0 : Integer;
p1 : Integer;
p2 : TColor;
p3 : TFillStyle) of object;

_T47 = _T43;

_T48 = procedure (p0 : Integer;
p1 : Integer) of object;

_T49 = _T14;

_T50 = _T48;

_T51 = _T38;

_T52 = _T43;

_T53 = _T43;

_T54 = _T43;

_T55 = _T43;

_T56 = _T44;

_T57 = _T14;

_T58 = procedure (p0 : Integer;
p1 : Integer;
p2 : Integer;
p3 : Integer;
p4 : Integer;
p5 : Integer) of object;

_T59 = procedure (const p0 : IDispatch;
p1 : TGraphic) of object;

_T60 = function (const p0 : string): IDispatch of object;

_T61 = function (const p0 : string): Integer of object;

_T62 = procedure (p0 : Integer;
p1 : Integer;
const p2 : string) of object;

_T63 = procedure (const p0 : IDispatch;
p1 : Integer;
p2 : Integer;
const p3 : string) of object;

_T64 = _T61;

_T65 = function : Boolean of object;

_T66 = _T14;

_T67 = _T14;

_T68 = _T14;

_T69 = procedure (p0 : TObject) of object;

_T70 = procedure (p0 : TCanvas;
const p1 : IDispatch) of object;

_T71 = function (p0 : TGraphic): Boolean of object;

_T72 = _T65;

_T73 = function : Integer of object;

_T74 = _T32;

_T75 = _T65;

_T76 = _T73;

_T77 = procedure (p0 : TObject;
p1 : TProgressStage;
p2 : Byte;
p3 : Boolean;
const p4 : IDispatch;
const p5 : string) of object;

_T78 = procedure (p0 : TStream) of object;

_T79 = procedure (p0 : Integer) of object;

_T80 = procedure (p0 : HPALETTE) of object;

_T81 = procedure (p0 : Boolean) of object;

_T82 = _T79;

_T83 = _T78;

_T84 = procedure (const p0 : string) of object;

_T85 = _T84;

_T86 = _T78;

_T87 = _T78;

_T88 = procedure (p0 : Word;
p1 : THandle;
p2 : HPALETTE) of object;

_T89 = procedure (var p0 : Word;
var p1 : THandle;
var p2 : HPALETTE) of object;

_T90 = _T14;

_T91 = function : HICON of object;

_T92 = _T14;

_T93 = function : HENHMETAFILE of object;

_T94 = procedure (p0 : TMetafile;
p1 : HDC) of object;

_T95 = procedure (p0 : TMetafile;
p1 : HDC;
const p2 : string;
const p3 : string) of object;

_T96 = _T14;

_T97 = _T69;

_T98 = _T77;

_T99 = _T14;

_T100 = _T84;

_T101 = _T84;

_T102 = _T88;

_T103 = _T89;

_T104 = function (p0 : Word): Boolean of object;

{_T105 = procedure (const p0 : string;
const p1 : string;
p2 : TGraphicClass) of object;}

{_T106 = procedure (const p0 : string;
p1 : Integer;
p2 : TGraphicClass) of object;}

{_T107 = procedure (p0 : Word;
p1 : TGraphicClass) of object;}

{_T108 = procedure (p0 : TGraphicClass) of object;}

_T109 = _T14;

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
function __TFontData__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TFontData__Wrapper.setHeight(const val : Integer);
begin
TFontData(GetRecordPtr^).Height := val;
end;
function __TFontData__Wrapper.getHeight : Integer;
begin
result := TFontData(GetRecordPtr^).Height;
end;
procedure __TFontData__Wrapper.setPitch(const val : TFontPitch);
begin
TFontData(GetRecordPtr^).Pitch := val;
end;
function __TFontData__Wrapper.getPitch : TFontPitch;
begin
result := TFontData(GetRecordPtr^).Pitch;
end;
procedure __TFontData__Wrapper.setCharset(const val : TFontCharset);
begin
TFontData(GetRecordPtr^).Charset := val;
end;
function __TFontData__Wrapper.getCharset : TFontCharset;
begin
result := TFontData(GetRecordPtr^).Charset;
end;
procedure __TFontData__Wrapper.setName(const val : TFontDataName);
begin
TFontData(GetRecordPtr^).Name := val;
end;
function __TFontData__Wrapper.getName : TFontDataName;
begin
result := TFontData(GetRecordPtr^).Name;
end;
function __TBrushData__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TBrushData__Wrapper.setColor(const val : TColor);
begin
TBrushData(GetRecordPtr^).Color := val;
end;
function __TBrushData__Wrapper.getColor : TColor;
begin
result := TBrushData(GetRecordPtr^).Color;
end;
procedure __TBrushData__Wrapper.setBitmap(const val : TBitmap);
begin
TBrushData(GetRecordPtr^).Bitmap := val;
end;
function __TBrushData__Wrapper.getBitmap : TBitmap;
begin
result := TBrushData(GetRecordPtr^).Bitmap;
end;
procedure __TBrushData__Wrapper.setStyle(const val : TBrushStyle);
begin
TBrushData(GetRecordPtr^).Style := val;
end;
function __TBrushData__Wrapper.getStyle : TBrushStyle;
begin
result := TBrushData(GetRecordPtr^).Style;
end;
function __TPenData__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TPenData__Wrapper.setColor(const val : TColor);
begin
TPenData(GetRecordPtr^).Color := val;
end;
function __TPenData__Wrapper.getColor : TColor;
begin
result := TPenData(GetRecordPtr^).Color;
end;
procedure __TPenData__Wrapper.setWidth(const val : Integer);
begin
TPenData(GetRecordPtr^).Width := val;
end;
function __TPenData__Wrapper.getWidth : Integer;
begin
result := TPenData(GetRecordPtr^).Width;
end;
procedure __TPenData__Wrapper.setStyle(const val : TPenStyle);
begin
TPenData(GetRecordPtr^).Style := val;
end;
function __TPenData__Wrapper.getStyle : TPenStyle;
begin
result := TPenData(GetRecordPtr^).Style;
end;
function __TResData__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TResData__Wrapper.setHandle(const val : THandle);
begin
TResData(GetRecordPtr^).Handle := val;
end;
function __TResData__Wrapper.getHandle : THandle;
begin
result := TResData(GetRecordPtr^).Handle;
end;
function __TResource__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TResource__Wrapper.setRefCount(const val : Integer);
begin
TResource(GetRecordPtr^).RefCount := val;
end;
function __TResource__Wrapper.getRefCount : Integer;
begin
result := TResource(GetRecordPtr^).RefCount;
end;
procedure __TResource__Wrapper.setHandle(const val : THandle);
begin
TResource(GetRecordPtr^).Handle := val;
end;
function __TResource__Wrapper.getHandle : THandle;
begin
result := TResource(GetRecordPtr^).Handle;
end;
procedure __TResource__Wrapper.setHashCode(const val : Word);
begin
TResource(GetRecordPtr^).HashCode := val;
end;
function __TResource__Wrapper.getHashCode : Word;
begin
result := TResource(GetRecordPtr^).HashCode;
end;
function _TBrushData_ : IDispatch;
begin
  result := __TBrushData__Wrapper.Create;
end;
function _TFontData_ : IDispatch;
begin
  result := __TFontData__Wrapper.Create;
end;
function _TPenData_ : IDispatch;
begin
  result := __TPenData__Wrapper.Create;
end;
function _TResData_ : IDispatch;
begin
  result := __TResData__Wrapper.Create;
end;
function _TResource_ : IDispatch;
begin
  result := __TResource__Wrapper.Create;
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
procedure __TCanvas__BrushCopy__Wrapper(__Instance : TCanvas;
const p0 : IDispatch;
p1 : TBitmap;
const p2 : IDispatch;
p3 : TColor);
var
__p0 : ^TRect;
__i0 : IDispatch;
__p2 : ^TRect;
__i2 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
TCanvas(__Instance).BrushCopy(__p0^,p1,__p2^,p3);
end;

procedure __TCanvas__CopyRect__Wrapper(__Instance : TCanvas;
const p0 : IDispatch;
p1 : TCanvas;
const p2 : IDispatch);
var
__p0 : ^TRect;
__i0 : IDispatch;
__p2 : ^TRect;
__i2 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
TCanvas(__Instance).CopyRect(__p0^,p1,__p2^);
end;

procedure __TCanvas__DrawFocusRect__Wrapper(__Instance : TCanvas;
const p0 : IDispatch);
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TCanvas(__Instance).DrawFocusRect(__p0^);
end;

procedure __TCanvas__FillRect__Wrapper(__Instance : TCanvas;
const p0 : IDispatch);
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TCanvas(__Instance).FillRect(__p0^);
end;

procedure __TCanvas__FrameRect__Wrapper(__Instance : TCanvas;
const p0 : IDispatch);
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TCanvas(__Instance).FrameRect(__p0^);
end;

procedure __TCanvas__Polygon__Wrapper(__Instance : TCanvas;
const p0 : IDispatch);
var
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TCanvas(__Instance).Polygon(__p0^);
end;

procedure __TCanvas__Polyline__Wrapper(__Instance : TCanvas;
const p0 : IDispatch);
var
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TCanvas(__Instance).Polyline(__p0^);
end;

procedure __TCanvas__PolyBezier__Wrapper(__Instance : TCanvas;
const p0 : IDispatch);
var
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TCanvas(__Instance).PolyBezier(__p0^);
end;

procedure __TCanvas__PolyBezierTo__Wrapper(__Instance : TCanvas;
const p0 : IDispatch);
var
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TCanvas(__Instance).PolyBezierTo(__p0^);
end;

procedure __TCanvas__StretchDraw__Wrapper(__Instance : TCanvas;
const p0 : IDispatch;
p1 : TGraphic);
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TCanvas(__Instance).StretchDraw(__p0^,p1);
end;

function __TCanvas__TextExtent__Wrapper(__Instance : TCanvas;
const p0 : string): IDispatch;
var
__result : TSize;
__wrapper : __TSize__Wrapper;
begin
__result := TCanvas(__Instance).TextExtent(p0);
__wrapper := __TSize__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

procedure __TCanvas__TextRect__Wrapper(__Instance : TCanvas;
const p0 : IDispatch;
p1 : Integer;
p2 : Integer;
const p3 : string);
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TCanvas(__Instance).TextRect(__p0^,p1,p2,p3);
end;

procedure __TGraphic__Draw__Wrapper(__Instance : TGraphic;
p0 : TCanvas;
const p1 : IDispatch);
var
__p1 : ^TRect;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
__TGraphic__(__Instance).Draw(p0,__p1^);
end;

procedure __TGraphic__Progress__Wrapper(__Instance : TGraphic;
p0 : TObject;
p1 : TProgressStage;
p2 : Byte;
p3 : Boolean;
const p4 : IDispatch;
const p5 : string);
var
__p4 : ^TRect;
__i4 : IDispatch;
begin
if p4 = nil then exit;
__p4 := (p4 as IDCRecordWrapper).GetRecordPtr;
__TGraphic__(__Instance).Progress(p0,p1,p2,p3,__p4^,p5);
end;

procedure __TPicture__Progress__Wrapper(__Instance : TPicture;
p0 : TObject;
p1 : TProgressStage;
p2 : Byte;
p3 : Boolean;
const p4 : IDispatch;
const p5 : string);
var
__p4 : ^TRect;
__i4 : IDispatch;
begin
if p4 = nil then exit;
__p4 := (p4 as IDCRecordWrapper).GetRecordPtr;
__TPicture__(__Instance).Progress(p0,p1,p2,p3,__p4^,p5);
end;


type __TBrushData__Wrapper__ = class(__TBrushData__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TBrushData__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTBrushDataToVariant(var R : TBrushData) : OleVariant;
var
__rw : __TBrushData__Wrapper__;
begin
__rw := __TBrushData__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTBrushData(const V : OleVariant) : TBrushData;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TBrushData((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TFontData__Wrapper__ = class(__TFontData__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TFontData__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTFontDataToVariant(var R : TFontData) : OleVariant;
var
__rw : __TFontData__Wrapper__;
begin
__rw := __TFontData__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTFontData(const V : OleVariant) : TFontData;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TFontData((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TPenData__Wrapper__ = class(__TPenData__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TPenData__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTPenDataToVariant(var R : TPenData) : OleVariant;
var
__rw : __TPenData__Wrapper__;
begin
__rw := __TPenData__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTPenData(const V : OleVariant) : TPenData;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TPenData((_idisp as IDCRecordWrapper).GetRecordPtr^);
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

type __TResData__Wrapper__ = class(__TResData__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TResData__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTResDataToVariant(var R : TResData) : OleVariant;
var
__rw : __TResData__Wrapper__;
begin
__rw := __TResData__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTResData(const V : OleVariant) : TResData;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TResData((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TResource__Wrapper__ = class(__TResource__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TResource__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTResourceToVariant(var R : TResource) : OleVariant;
var
__rw : __TResource__Wrapper__;
begin
__rw := __TResource__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTResource(const V : OleVariant) : TResource;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TResource((_idisp as IDCRecordWrapper).GetRecordPtr^);
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
function __DC__GetTBitmap__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TBitmap(Instance).Canvas);
end;

function __DC__GetTBitmap__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBitmap(Instance).Handle;
end;

procedure __DC__SetTBitmap__Handle(Instance : TObject; Params : PVariantArgList);
begin
TBitmap(Instance).Handle:=OleVariant(Params^[0]);
end;

function __DC__GetTBitmap__HandleType(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBitmap(Instance).HandleType;
end;

procedure __DC__SetTBitmap__HandleType(Instance : TObject; Params : PVariantArgList);
begin
TBitmap(Instance).HandleType:=OleVariant(Params^[0]);
end;

function __DC__GetTBitmap__IgnorePalette(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBitmap(Instance).IgnorePalette;
end;

procedure __DC__SetTBitmap__IgnorePalette(Instance : TObject; Params : PVariantArgList);
begin
TBitmap(Instance).IgnorePalette:=OleVariant(Params^[0]);
end;

function __DC__GetTBitmap__MaskHandle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBitmap(Instance).MaskHandle;
end;

function __DC__GetTBitmap__Monochrome(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBitmap(Instance).Monochrome;
end;

procedure __DC__SetTBitmap__Monochrome(Instance : TObject; Params : PVariantArgList);
begin
TBitmap(Instance).Monochrome:=OleVariant(Params^[0]);
end;

function __DC__GetTBitmap__PixelFormat(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBitmap(Instance).PixelFormat;
end;

procedure __DC__SetTBitmap__PixelFormat(Instance : TObject; Params : PVariantArgList);
begin
TBitmap(Instance).PixelFormat:=OleVariant(Params^[0]);
end;

function __DC__GetTBitmap__ScanLine(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(TBitmap(Instance).ScanLine[OleVariant(Params^[0])]);
end;

function __DC__GetTBitmap__TransparentColor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBitmap(Instance).TransparentColor;
end;

procedure __DC__SetTBitmap__TransparentColor(Instance : TObject; Params : PVariantArgList);
begin
TBitmap(Instance).TransparentColor:=OleVariant(Params^[0]);
end;

function __DC__GetTBitmap__TransparentMode(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBitmap(Instance).TransparentMode;
end;

procedure __DC__SetTBitmap__TransparentMode(Instance : TObject; Params : PVariantArgList);
begin
TBitmap(Instance).TransparentMode:=OleVariant(Params^[0]);
end;

function __DC__GetTBrush__Bitmap(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TBrush(Instance).Bitmap);
end;

procedure __DC__SetTBrush__Bitmap(Instance : TObject; Params : PVariantArgList);
begin
TBrush(Instance).Bitmap:=TBitmap(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTBrush__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBrush(Instance).Handle;
end;

procedure __DC__SetTBrush__Handle(Instance : TObject; Params : PVariantArgList);
begin
TBrush(Instance).Handle:=OleVariant(Params^[0]);
end;

function __DC__GetTCanvas__ClipRect(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TRect__Wrapper;
begin
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := TCanvas(Instance).ClipRect;
result := IUnknown(__wrapper) as IDispatch;
end;

function __DC__GetTCanvas__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCanvas(Instance).Handle;
end;

procedure __DC__SetTCanvas__Handle(Instance : TObject; Params : PVariantArgList);
begin
TCanvas(Instance).Handle:=OleVariant(Params^[0]);
end;

function __DC__GetTCanvas__LockCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCanvas(Instance).LockCount;
end;

function __DC__GetTCanvas__PenPos(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TPoint__Wrapper;
begin
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := TCanvas(Instance).PenPos;
result := IUnknown(__wrapper) as IDispatch;
end;

procedure __DC__SetTCanvas__PenPos(Instance : TObject; Params : PVariantArgList);
var
__idisp:IDispatch;
__iwrapper:IDCRecordWrapper;
begin
__idisp:=DCVarToInterface(OleVariant(Params^[0]));
if __idisp=nil then exit;
__idisp.QueryInterface(IDCRecordWrapper, __iwrapper);
TCanvas(Instance).PenPos:=TPoint(__iwrapper.GetRecordPtr^);
end;

function __DC__GetTCanvas__Pixels(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCanvas(Instance).Pixels[OleVariant(Params^[1]), OleVariant(Params^[0])];
end;

procedure __DC__SetTCanvas__Pixels(Instance : TObject; Params : PVariantArgList);
begin
TCanvas(Instance).Pixels[OleVariant(Params^[2]), OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTFont__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFont(Instance).Handle;
end;

procedure __DC__SetTFont__Handle(Instance : TObject; Params : PVariantArgList);
begin
TFont(Instance).Handle:=OleVariant(Params^[0]);
end;

function __DC__GetTFont__PixelsPerInch(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFont(Instance).PixelsPerInch;
end;

procedure __DC__SetTFont__PixelsPerInch(Instance : TObject; Params : PVariantArgList);
begin
TFont(Instance).PixelsPerInch:=OleVariant(Params^[0]);
end;

function __DC__GetTGraphic__Empty(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TGraphic(Instance).Empty;
end;

function __DC__GetTGraphic__Height(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TGraphic(Instance).Height;
end;

procedure __DC__SetTGraphic__Height(Instance : TObject; Params : PVariantArgList);
begin
TGraphic(Instance).Height:=OleVariant(Params^[0]);
end;

function __DC__GetTGraphic__Modified(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TGraphic(Instance).Modified;
end;

procedure __DC__SetTGraphic__Modified(Instance : TObject; Params : PVariantArgList);
begin
TGraphic(Instance).Modified:=OleVariant(Params^[0]);
end;

function __DC__GetTGraphic__Palette(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TGraphic(Instance).Palette;
end;

procedure __DC__SetTGraphic__Palette(Instance : TObject; Params : PVariantArgList);
begin
TGraphic(Instance).Palette:=OleVariant(Params^[0]);
end;

function __DC__GetTGraphic__PaletteModified(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TGraphic(Instance).PaletteModified;
end;

procedure __DC__SetTGraphic__PaletteModified(Instance : TObject; Params : PVariantArgList);
begin
TGraphic(Instance).PaletteModified:=OleVariant(Params^[0]);
end;

function __DC__GetTGraphic__Transparent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TGraphic(Instance).Transparent;
end;

procedure __DC__SetTGraphic__Transparent(Instance : TObject; Params : PVariantArgList);
begin
TGraphic(Instance).Transparent:=OleVariant(Params^[0]);
end;

function __DC__GetTGraphic__Width(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TGraphic(Instance).Width;
end;

procedure __DC__SetTGraphic__Width(Instance : TObject; Params : PVariantArgList);
begin
TGraphic(Instance).Width:=OleVariant(Params^[0]);
end;

function __DC__GetTIcon__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TIcon(Instance).Handle;
end;

procedure __DC__SetTIcon__Handle(Instance : TObject; Params : PVariantArgList);
begin
TIcon(Instance).Handle:=OleVariant(Params^[0]);
end;

function __DC__GetTMetafile__CreatedBy(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMetafile(Instance).CreatedBy;
end;

function __DC__GetTMetafile__Description(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMetafile(Instance).Description;
end;

function __DC__GetTMetafile__Enhanced(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMetafile(Instance).Enhanced;
end;

procedure __DC__SetTMetafile__Enhanced(Instance : TObject; Params : PVariantArgList);
begin
TMetafile(Instance).Enhanced:=OleVariant(Params^[0]);
end;

function __DC__GetTMetafile__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMetafile(Instance).Handle;
end;

procedure __DC__SetTMetafile__Handle(Instance : TObject; Params : PVariantArgList);
begin
TMetafile(Instance).Handle:=OleVariant(Params^[0]);
end;

function __DC__GetTMetafile__MMWidth(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMetafile(Instance).MMWidth;
end;

procedure __DC__SetTMetafile__MMWidth(Instance : TObject; Params : PVariantArgList);
begin
TMetafile(Instance).MMWidth:=OleVariant(Params^[0]);
end;

function __DC__GetTMetafile__MMHeight(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMetafile(Instance).MMHeight;
end;

procedure __DC__SetTMetafile__MMHeight(Instance : TObject; Params : PVariantArgList);
begin
TMetafile(Instance).MMHeight:=OleVariant(Params^[0]);
end;

function __DC__GetTMetafile__Inch(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMetafile(Instance).Inch;
end;

procedure __DC__SetTMetafile__Inch(Instance : TObject; Params : PVariantArgList);
begin
TMetafile(Instance).Inch:=OleVariant(Params^[0]);
end;

function __DC__GetTPen__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPen(Instance).Handle;
end;

procedure __DC__SetTPen__Handle(Instance : TObject; Params : PVariantArgList);
begin
TPen(Instance).Handle:=OleVariant(Params^[0]);
end;

function __DC__GetTPicture__Bitmap(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TPicture(Instance).Bitmap);
end;

procedure __DC__SetTPicture__Bitmap(Instance : TObject; Params : PVariantArgList);
begin
TPicture(Instance).Bitmap:=TBitmap(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTPicture__Graphic(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TPicture(Instance).Graphic);
end;

procedure __DC__SetTPicture__Graphic(Instance : TObject; Params : PVariantArgList);
begin
TPicture(Instance).Graphic:=TGraphic(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTPicture__Height(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPicture(Instance).Height;
end;

function __DC__GetTPicture__Icon(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TPicture(Instance).Icon);
end;

procedure __DC__SetTPicture__Icon(Instance : TObject; Params : PVariantArgList);
begin
TPicture(Instance).Icon:=TIcon(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTPicture__Metafile(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TPicture(Instance).Metafile);
end;

procedure __DC__SetTPicture__Metafile(Instance : TObject; Params : PVariantArgList);
begin
TPicture(Instance).Metafile:=TMetafile(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTPicture__Width(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPicture(Instance).Width;
end;

procedure __RegisterProps;
begin
RegisterProperty(TBitmap,'Canvas',__DC__GetTBitmap__Canvas,nil);
RegisterProperty(TBitmap,'Handle',__DC__GetTBitmap__Handle,__DC__SetTBitmap__Handle);
RegisterProperty(TBitmap,'HandleType',__DC__GetTBitmap__HandleType,__DC__SetTBitmap__HandleType);
RegisterProperty(TBitmap,'IgnorePalette',__DC__GetTBitmap__IgnorePalette,__DC__SetTBitmap__IgnorePalette);
RegisterProperty(TBitmap,'MaskHandle',__DC__GetTBitmap__MaskHandle,nil);
RegisterProperty(TBitmap,'Monochrome',__DC__GetTBitmap__Monochrome,__DC__SetTBitmap__Monochrome);
RegisterProperty(TBitmap,'PixelFormat',__DC__GetTBitmap__PixelFormat,__DC__SetTBitmap__PixelFormat);
RegisterIndexedProperty(TBitmap,'ScanLine',1,False,__DC__GetTBitmap__ScanLine,nil);
RegisterProperty(TBitmap,'TransparentColor',__DC__GetTBitmap__TransparentColor,__DC__SetTBitmap__TransparentColor);
RegisterProperty(TBitmap,'TransparentMode',__DC__GetTBitmap__TransparentMode,__DC__SetTBitmap__TransparentMode);
RegisterProperty(TBrush,'Bitmap',__DC__GetTBrush__Bitmap,__DC__SetTBrush__Bitmap);
RegisterProperty(TBrush,'Handle',__DC__GetTBrush__Handle,__DC__SetTBrush__Handle);
RegisterProperty(TCanvas,'ClipRect',__DC__GetTCanvas__ClipRect,nil);
RegisterProperty(TCanvas,'Handle',__DC__GetTCanvas__Handle,__DC__SetTCanvas__Handle);
RegisterProperty(TCanvas,'LockCount',__DC__GetTCanvas__LockCount,nil);
RegisterProperty(TCanvas,'PenPos',__DC__GetTCanvas__PenPos,__DC__SetTCanvas__PenPos);
RegisterIndexedProperty(TCanvas,'Pixels',2,False,__DC__GetTCanvas__Pixels,__DC__SetTCanvas__Pixels);
RegisterProperty(TFont,'Handle',__DC__GetTFont__Handle,__DC__SetTFont__Handle);
RegisterProperty(TFont,'PixelsPerInch',__DC__GetTFont__PixelsPerInch,__DC__SetTFont__PixelsPerInch);
RegisterProperty(TGraphic,'Empty',__DC__GetTGraphic__Empty,nil);
RegisterProperty(TGraphic,'Height',__DC__GetTGraphic__Height,__DC__SetTGraphic__Height);
RegisterProperty(TGraphic,'Modified',__DC__GetTGraphic__Modified,__DC__SetTGraphic__Modified);
RegisterProperty(TGraphic,'Palette',__DC__GetTGraphic__Palette,__DC__SetTGraphic__Palette);
RegisterProperty(TGraphic,'PaletteModified',__DC__GetTGraphic__PaletteModified,__DC__SetTGraphic__PaletteModified);
RegisterProperty(TGraphic,'Transparent',__DC__GetTGraphic__Transparent,__DC__SetTGraphic__Transparent);
RegisterProperty(TGraphic,'Width',__DC__GetTGraphic__Width,__DC__SetTGraphic__Width);
RegisterProperty(TIcon,'Handle',__DC__GetTIcon__Handle,__DC__SetTIcon__Handle);
RegisterProperty(TMetafile,'CreatedBy',__DC__GetTMetafile__CreatedBy,nil);
RegisterProperty(TMetafile,'Description',__DC__GetTMetafile__Description,nil);
RegisterProperty(TMetafile,'Enhanced',__DC__GetTMetafile__Enhanced,__DC__SetTMetafile__Enhanced);
RegisterProperty(TMetafile,'Handle',__DC__GetTMetafile__Handle,__DC__SetTMetafile__Handle);
RegisterProperty(TMetafile,'MMWidth',__DC__GetTMetafile__MMWidth,__DC__SetTMetafile__MMWidth);
RegisterProperty(TMetafile,'MMHeight',__DC__GetTMetafile__MMHeight,__DC__SetTMetafile__MMHeight);
RegisterProperty(TMetafile,'Inch',__DC__GetTMetafile__Inch,__DC__SetTMetafile__Inch);
RegisterProperty(TPen,'Handle',__DC__GetTPen__Handle,__DC__SetTPen__Handle);
RegisterProperty(TPicture,'Bitmap',__DC__GetTPicture__Bitmap,__DC__SetTPicture__Bitmap);
RegisterProperty(TPicture,'Graphic',__DC__GetTPicture__Graphic,__DC__SetTPicture__Graphic);
RegisterProperty(TPicture,'Height',__DC__GetTPicture__Height,nil);
RegisterProperty(TPicture,'Icon',__DC__GetTPicture__Icon,__DC__SetTPicture__Icon);
RegisterProperty(TPicture,'Metafile',__DC__GetTPicture__Metafile,__DC__SetTPicture__Metafile);
RegisterProperty(TPicture,'Width',__DC__GetTPicture__Width,nil);
end;

function __DC__GetGraphics__DefFontData(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TFontData__Wrapper;
begin
__wrapper := __TFontData__Wrapper.Create;
__wrapper.fR := Graphics.DefFontData;
result := IUnknown(__wrapper) as IDispatch;
end;

function __DC__GetGraphics__SystemPalette16(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := Graphics.SystemPalette16;
end;

procedure __DC__SetGraphics__SystemPalette16(Instance : TObject; Params : PVariantArgList);
begin
Graphics.SystemPalette16:=OleVariant(Params^[0]);
end;

function __DC__GetGraphics__DDBsOnly(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := Graphics.DDBsOnly;
end;

procedure __DC__SetGraphics__DDBsOnly(Instance : TObject; Params : PVariantArgList);
begin
Graphics.DDBsOnly:=OleVariant(Params^[0]);
end;

var __RegisteredVars : TList;
procedure __RegisterVars;
begin
__RegisteredVars := TList.Create;
__RegisteredVars.Add(RegisterVar('DefFontData',__DC__GetGraphics__DefFontData,nil));
__RegisteredVars.Add(RegisterVar('SystemPalette16',__DC__GetGraphics__SystemPalette16,__DC__SetGraphics__SystemPalette16));
__RegisteredVars.Add(RegisterVar('DDBsOnly',__DC__GetGraphics__DDBsOnly,__DC__SetGraphics__DDBsOnly));
end;

procedure __UnregisterVars;
begin
__RegisteredVars.Free;
end;

const __ConstNames0 : array[0..121] of string = (
'clScrollBar'
,'clBackground'
,'clActiveCaption'
,'clInactiveCaption'
,'clMenu'
,'clWindow'
,'clWindowFrame'
,'clMenuText'
,'clWindowText'
,'clCaptionText'
,'clActiveBorder'
,'clInactiveBorder'
,'clAppWorkSpace'
,'clHighlight'
,'clHighlightText'
,'clBtnFace'
,'clBtnShadow'
,'clGrayText'
,'clBtnText'
,'clInactiveCaptionText'
,'clBtnHighlight'
,'cl3DDkShadow'
,'cl3DLight'
,'clInfoText'
,'clInfoBk'
,'clBlack'
,'clMaroon'
,'clGreen'
,'clOlive'
,'clNavy'
,'clPurple'
,'clTeal'
,'clGray'
,'clSilver'
,'clRed'
,'clLime'
,'clYellow'
,'clBlue'
,'clFuchsia'
,'clAqua'
,'clLtGray'
,'clDkGray'
,'clWhite'
,'clNone'
,'clDefault'
,'cmBlackness'
,'cmDstInvert'
,'cmMergeCopy'
,'cmMergePaint'
,'cmNotSrcCopy'
,'cmNotSrcErase'
,'cmPatCopy'
,'cmPatInvert'
,'cmPatPaint'
,'cmSrcAnd'
,'cmSrcCopy'
,'cmSrcErase'
,'cmSrcInvert'
,'cmSrcPaint'
,'cmWhiteness'
,'fpDefault'
,'fpVariable'
,'fpFixed'
,'fsBold'
,'fsItalic'
,'fsUnderline'
,'fsStrikeOut'
,'psSolid'
,'psDash'
,'psDot'
,'psDashDot'
,'psDashDotDot'
,'psClear'
,'psInsideFrame'
,'pmBlack'
,'pmWhite'
,'pmNop'
,'pmNot'
,'pmCopy'
,'pmNotCopy'
,'pmMergePenNot'
,'pmMaskPenNot'
,'pmMergeNotPen'
,'pmMaskNotPen'
,'pmMerge'
,'pmNotMerge'
,'pmMask'
,'pmNotMask'
,'pmXor'
,'pmNotXor'
,'bsSolid'
,'bsClear'
,'bsHorizontal'
,'bsVertical'
,'bsFDiagonal'
,'bsBDiagonal'
,'bsCross'
,'bsDiagCross'
,'fsSurface'
,'fsBorder'
,'fmAlternate'
,'fmWinding'
,'csHandleValid'
,'csFontValid'
,'csPenValid'
,'csBrushValid'
,'psStarting'
,'psRunning'
,'psEnding'
,'bmDIB'
,'bmDDB'
,'pfDevice'
,'pf1bit'
,'pf4bit'
,'pf8bit'
,'pf15bit'
,'pf16bit'
,'pf24bit'
,'pf32bit'
,'pfCustom'
,'tmAuto'
,'tmFixed'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,clScrollBar));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,clBackground));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,clActiveCaption));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,clInactiveCaption));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,clMenu));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,clWindow));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,clWindowFrame));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,clMenuText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,clWindowText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,clCaptionText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,clActiveBorder));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,clInactiveBorder));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,clAppWorkSpace));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,clHighlight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,clHighlightText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,clBtnFace));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,clBtnShadow));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,clGrayText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,clBtnText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,clInactiveCaptionText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,clBtnHighlight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,cl3DDkShadow));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,cl3DLight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,clInfoText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,clInfoBk));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,clBlack));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,clMaroon));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,clGreen));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,clOlive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,clNavy));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,clPurple));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,clTeal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,clGray));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,clSilver));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,clRed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,clLime));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,clYellow));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,clBlue));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,clFuchsia));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,clAqua));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,clLtGray));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,clDkGray));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,clWhite));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,clNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,clDefault));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,cmBlackness));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,cmDstInvert));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,cmMergeCopy));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[48] ,cmMergePaint));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[49] ,cmNotSrcCopy));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[50] ,cmNotSrcErase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[51] ,cmPatCopy));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[52] ,cmPatInvert));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[53] ,cmPatPaint));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[54] ,cmSrcAnd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[55] ,cmSrcCopy));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[56] ,cmSrcErase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[57] ,cmSrcInvert));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[58] ,cmSrcPaint));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[59] ,cmWhiteness));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[60] ,fpDefault));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[61] ,fpVariable));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[62] ,fpFixed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[63] ,fsBold));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[64] ,fsItalic));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[65] ,fsUnderline));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[66] ,fsStrikeOut));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[67] ,psSolid));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[68] ,psDash));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[69] ,psDot));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[70] ,psDashDot));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[71] ,psDashDotDot));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[72] ,psClear));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[73] ,psInsideFrame));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[74] ,pmBlack));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[75] ,pmWhite));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[76] ,pmNop));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[77] ,pmNot));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[78] ,pmCopy));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[79] ,pmNotCopy));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[80] ,pmMergePenNot));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[81] ,pmMaskPenNot));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[82] ,pmMergeNotPen));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[83] ,pmMaskNotPen));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[84] ,pmMerge));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[85] ,pmNotMerge));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[86] ,pmMask));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[87] ,pmNotMask));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[88] ,pmXor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[89] ,pmNotXor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[90] ,bsSolid));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[91] ,bsClear));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[92] ,bsHorizontal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[93] ,bsVertical));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[94] ,bsFDiagonal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[95] ,bsBDiagonal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[96] ,bsCross));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[97] ,bsDiagCross));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[98] ,fsSurface));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[99] ,fsBorder));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[100] ,fmAlternate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[101] ,fmWinding));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[102] ,csHandleValid));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[103] ,csFontValid));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[104] ,csPenValid));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[105] ,csBrushValid));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[106] ,psStarting));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[107] ,psRunning));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[108] ,psEnding));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[109] ,bmDIB));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[110] ,bmDDB));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[111] ,pfDevice));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[112] ,pf1bit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[113] ,pf4bit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[114] ,pf8bit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[115] ,pf15bit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[116] ,pf16bit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[117] ,pf24bit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[118] ,pf32bit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[119] ,pfCustom));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[120] ,tmAuto));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[121] ,tmFixed));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..16] of TClass = (
EInvalidGraphic,
EInvalidGraphicOperation,
TBitmap,
TBitmapImage,
TBrush,
TCanvas,
TFont,
TGraphic,
TGraphicsObject,
TIcon,
TIconImage,
TMetafile,
TMetafileCanvas,
TMetafileImage,
TPen,
TPicture,
TSharedImage
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..19] of string = (
'TBrushData'
,'TFontData'
,'TPenData'
,'TResData'
,'TResource'
,'ColorToRGB'
,'ColorToString'
,'StringToColor'
,'ColorToIdent'
,'IdentToColor'
,'CharsetToIdent'
,'IdentToCharset'
,'GetDIBSizes'
,'GetDIB'
,'PaletteChanged'
,'FreeMemoryContexts'
,'GetDefFontCharSet'
,'TransparentStretchBlt'
,'CreateMappedBmp'
,'CreateGrayMappedBmp'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TBrushData_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(_TFontData_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[2],Addr(_TPenData_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[3],Addr(_TResData_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[4],Addr(_TResource_)));
RegisterProc(nil,MethodNames[5],mtProc,TypeInfo(_T3),[
TypeInfo(TColor),TypeInfo(Longint)],Addr(ColorToRGB),cRegister);

RegisterProc(nil,MethodNames[6],mtProc,TypeInfo(_T4),[
TypeInfo(TColor),TypeInfo(string)],Addr(ColorToString),cRegister);

RegisterProc(nil,MethodNames[7],mtProc,TypeInfo(_T5),[
TypeInfo(string),TypeInfo(TColor)],Addr(StringToColor),cRegister);

RegisterProc(nil,MethodNames[8],mtProc,TypeInfo(_T7),[
TypeInfo(Longint),
TypeInfo(string),TypeInfo(Boolean)],Addr(ColorToIdent),cRegister);

RegisterProc(nil,MethodNames[9],mtProc,TypeInfo(_T8),[
TypeInfo(string),
TypeInfo(Longint),TypeInfo(Boolean)],Addr(IdentToColor),cRegister);

RegisterProc(nil,MethodNames[10],mtProc,TypeInfo(_T10),[
TypeInfo(Longint),
TypeInfo(string),TypeInfo(Boolean)],Addr(CharsetToIdent),cRegister);

RegisterProc(nil,MethodNames[11],mtProc,TypeInfo(_T11),[
TypeInfo(string),
TypeInfo(Longint),TypeInfo(Boolean)],Addr(IdentToCharset),cRegister);

RegisterProc(nil,MethodNames[12],mtProc,TypeInfo(_T12),[
TypeInfo(HBITMAP),
TypeInfo(Integer),
TypeInfo(DWORD)],Addr(GetDIBSizes),cRegister);

RegisterProc(nil,MethodNames[13],mtProc,TypeInfo(_T13),[
TypeInfo(HBITMAP),
TypeInfo(HPALETTE),
TypeInfo(HPALETTE),
TypeInfoUntyped,TypeInfo(Boolean)],Addr(GetDIB),cRegister);

RegisterProc(nil,MethodNames[14],mtProc,TypeInfo(_T14),NoParams,Addr(PaletteChanged),cRegister);

RegisterProc(nil,MethodNames[15],mtProc,TypeInfo(_T15),NoParams,Addr(FreeMemoryContexts),cRegister);

RegisterProc(nil,MethodNames[16],mtProc,TypeInfo(_T16),[TypeInfo(TFontCharset)],Addr(GetDefFontCharSet),cRegister);

RegisterProc(nil,MethodNames[17],mtProc,TypeInfo(_T17),[
TypeInfo(HDC),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(HDC),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(HDC),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Boolean)],Addr(TransparentStretchBlt),cRegister);

RegisterProc(nil,MethodNames[18],mtProc,TypeInfo(_T18),[
TypeInfo(HBITMAP),
ArrayInfo(TypeInfo(TColor)),
ArrayInfo(TypeInfo(TColor)),TypeInfo(HBITMAP)],Addr(CreateMappedBmp),cRegister);

RegisterProc(nil,MethodNames[19],mtProc,TypeInfo(_T20),[
TypeInfo(HBITMAP),TypeInfo(HBITMAP)],Addr(CreateGrayMappedBmp),cRegister);

RegRegisterMethod(TBitmap,'GetHandle',TypeInfo(_T22),[TypeInfo(HBITMAP)], pointer(96));

RegRegisterMethod(TBitmap,'GetMaskHandle',TypeInfo(_T23),[TypeInfo(HBITMAP)], pointer(100));

RegRegisterMethod(TBitmap,'SetHandleType',TypeInfo(_T24),[
TypeInfo(TBitmapHandleType)], pointer(104));

RegRegisterMethod(TBitmap,'Dormant',TypeInfo(_T25),NoParams,Addr(TBitmap.Dormant));

RegRegisterMethod(TBitmap,'FreeImage',TypeInfo(_T26),NoParams,Addr(TBitmap.FreeImage));

RegRegisterMethod(TBitmap,'LoadFromResourceName',TypeInfo(_T27),[
TypeInfo(THandle),
TypeInfo(string)],Addr(TBitmap.LoadFromResourceName));

RegRegisterMethod(TBitmap,'LoadFromResourceID',TypeInfo(_T28),[
TypeInfo(THandle),
TypeInfo(Integer)],Addr(TBitmap.LoadFromResourceID));

RegRegisterMethod(TBitmap,'Mask',TypeInfo(_T29),[
TypeInfo(TColor)],Addr(TBitmap.Mask));

RegRegisterMethod(TBitmap,'ReleaseHandle',TypeInfo(_T30),[TypeInfo(HBITMAP)],Addr(TBitmap.ReleaseHandle));

RegRegisterMethod(TBitmap,'ReleaseMaskHandle',TypeInfo(_T31),[TypeInfo(HBITMAP)],Addr(TBitmap.ReleaseMaskHandle));

RegRegisterMethod(TBitmap,'ReleasePalette',TypeInfo(_T32),[TypeInfo(HPALETTE)],Addr(TBitmap.ReleasePalette));

RegisterProc(TBrush,'Create',mtConstructor,TypeInfo(_T33),NoParams,Addr(TBrush.Create),cRegister);

RegRegisterMethod(TCanvas,'Changed',TypeInfo(_T34),NoParams, pointer(12));

RegRegisterMethod(TCanvas,'Changing',TypeInfo(_T35),NoParams, pointer(16));

RegRegisterMethod(TCanvas,'CreateHandle',TypeInfo(_T36),NoParams, pointer(20));

RegisterProc(TCanvas,'Create',mtConstructor,TypeInfo(_T37),NoParams,Addr(TCanvas.Create),cRegister);

RegRegisterMethod(TCanvas,'Arc',TypeInfo(_T38),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TCanvas.Arc));

RegRegisterMethod(TCanvas,'BrushCopy',TypeInfo(_T39),[
TypeInfo(IDispatch),
TypeInfo(TBitmap),
TypeInfo(IDispatch),
TypeInfo(TColor)],Addr(__TCanvas__BrushCopy__Wrapper));

RegRegisterMethod(TCanvas,'Chord',TypeInfo(_T40),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TCanvas.Chord));

RegRegisterMethod(TCanvas,'CopyRect',TypeInfo(_T41),[
TypeInfo(IDispatch),
TypeInfo(TCanvas),
TypeInfo(IDispatch)],Addr(__TCanvas__CopyRect__Wrapper));

RegRegisterMethod(TCanvas,'Draw',TypeInfo(_T42),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TGraphic)],Addr(TCanvas.Draw));

RegRegisterMethod(TCanvas,'DrawFocusRect',TypeInfo(_T43),[
TypeInfo(IDispatch)],Addr(__TCanvas__DrawFocusRect__Wrapper));

RegRegisterMethod(TCanvas,'Ellipse',TypeInfo(_T44),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TCanvas.Ellipse));

RegRegisterMethod(TCanvas,'FillRect',TypeInfo(_T45),[
TypeInfo(IDispatch)],Addr(__TCanvas__FillRect__Wrapper));

RegRegisterMethod(TCanvas,'FloodFill',TypeInfo(_T46),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TColor),
TypeInfo(TFillStyle)],Addr(TCanvas.FloodFill));

RegRegisterMethod(TCanvas,'FrameRect',TypeInfo(_T47),[
TypeInfo(IDispatch)],Addr(__TCanvas__FrameRect__Wrapper));

RegRegisterMethod(TCanvas,'LineTo',TypeInfo(_T48),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TCanvas.LineTo));

RegRegisterMethod(TCanvas,'Lock',TypeInfo(_T49),NoParams,Addr(TCanvas.Lock));

RegRegisterMethod(TCanvas,'MoveTo',TypeInfo(_T50),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TCanvas.MoveTo));

RegRegisterMethod(TCanvas,'Pie',TypeInfo(_T51),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TCanvas.Pie));

RegRegisterMethod(TCanvas,'Polygon',TypeInfo(_T52),[
ArrayInfo(TypeInfo(IDispatch))],Addr(__TCanvas__Polygon__Wrapper));

RegRegisterMethod(TCanvas,'Polyline',TypeInfo(_T53),[
ArrayInfo(TypeInfo(IDispatch))],Addr(__TCanvas__Polyline__Wrapper));

RegRegisterMethod(TCanvas,'PolyBezier',TypeInfo(_T54),[
ArrayInfo(TypeInfo(IDispatch))],Addr(__TCanvas__PolyBezier__Wrapper));

RegRegisterMethod(TCanvas,'PolyBezierTo',TypeInfo(_T55),[
ArrayInfo(TypeInfo(IDispatch))],Addr(__TCanvas__PolyBezierTo__Wrapper));

RegRegisterMethod(TCanvas,'Rectangle',TypeInfo(_T56),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TCanvas.Rectangle));

RegRegisterMethod(TCanvas,'Refresh',TypeInfo(_T57),NoParams,Addr(TCanvas.Refresh));

RegRegisterMethod(TCanvas,'RoundRect',TypeInfo(_T58),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TCanvas.RoundRect));

RegRegisterMethod(TCanvas,'StretchDraw',TypeInfo(_T59),[
TypeInfo(IDispatch),
TypeInfo(TGraphic)],Addr(__TCanvas__StretchDraw__Wrapper));

RegRegisterMethod(TCanvas,'TextExtent',TypeInfo(_T60),[
TypeInfo(string),TypeInfo(IDispatch)],Addr(__TCanvas__TextExtent__Wrapper));

RegRegisterMethod(TCanvas,'TextHeight',TypeInfo(_T61),[
TypeInfo(string),TypeInfo(Integer)],Addr(TCanvas.TextHeight));

RegRegisterMethod(TCanvas,'TextOut',TypeInfo(_T62),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(string)],Addr(TCanvas.TextOut));

RegRegisterMethod(TCanvas,'TextRect',TypeInfo(_T63),[
TypeInfo(IDispatch),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(string)],Addr(__TCanvas__TextRect__Wrapper));

RegRegisterMethod(TCanvas,'TextWidth',TypeInfo(_T64),[
TypeInfo(string),TypeInfo(Integer)],Addr(TCanvas.TextWidth));

RegRegisterMethod(TCanvas,'TryLock',TypeInfo(_T65),[TypeInfo(Boolean)],Addr(TCanvas.TryLock));

RegRegisterMethod(TCanvas,'Unlock',TypeInfo(_T66),NoParams,Addr(TCanvas.Unlock));

RegisterProc(TFont,'Create',mtConstructor,TypeInfo(_T67),NoParams,Addr(TFont.Create),cRegister);

RegisterProc(TGraphic,'Create',mtConstructor,TypeInfo(_T68),NoParams, pointer(12),cRegister);

RegRegisterMethod(TGraphic,'Changed',TypeInfo(_T69),[
TypeInfo(TObject)], pointer(16));

RegRegisterMethod(TGraphic,'Draw',TypeInfo(_T70),[
TypeInfo(TCanvas),
TypeInfo(IDispatch)], pointer(20));

RegRegisterMethod(TGraphic,'Equals',TypeInfo(_T71),[
TypeInfo(TGraphic),TypeInfo(Boolean)], pointer(24));

RegRegisterMethod(TGraphic,'GetEmpty',TypeInfo(_T72),[TypeInfo(Boolean)], pointer(28));

RegRegisterMethod(TGraphic,'GetHeight',TypeInfo(_T73),[TypeInfo(Integer)], pointer(32));

RegRegisterMethod(TGraphic,'GetPalette',TypeInfo(_T74),[TypeInfo(HPALETTE)], pointer(36));

RegRegisterMethod(TGraphic,'GetTransparent',TypeInfo(_T75),[TypeInfo(Boolean)], pointer(40));

RegRegisterMethod(TGraphic,'GetWidth',TypeInfo(_T76),[TypeInfo(Integer)], pointer(44));

RegRegisterMethod(TGraphic,'Progress',TypeInfo(_T77),[
TypeInfo(TObject),
TypeInfo(TProgressStage),
TypeInfo(Byte),
TypeInfo(Boolean),
TypeInfo(IDispatch),
TypeInfo(string)], pointer(MinVMTOffset - 2));

RegRegisterMethod(TGraphic,'ReadData',TypeInfo(_T78),[
TypeInfo(TStream)], pointer(48));

RegRegisterMethod(TGraphic,'SetHeight',TypeInfo(_T79),[
TypeInfo(Integer)], pointer(52));

RegRegisterMethod(TGraphic,'SetPalette',TypeInfo(_T80),[
TypeInfo(HPALETTE)], pointer(56));

RegRegisterMethod(TGraphic,'SetTransparent',TypeInfo(_T81),[
TypeInfo(Boolean)], pointer(60));

RegRegisterMethod(TGraphic,'SetWidth',TypeInfo(_T82),[
TypeInfo(Integer)], pointer(64));

RegRegisterMethod(TGraphic,'WriteData',TypeInfo(_T83),[
TypeInfo(TStream)], pointer(68));

RegRegisterMethod(TGraphic,'LoadFromFile',TypeInfo(_T84),[
TypeInfo(string)], pointer(72));

RegRegisterMethod(TGraphic,'SaveToFile',TypeInfo(_T85),[
TypeInfo(string)], pointer(76));

RegRegisterMethod(TGraphic,'LoadFromStream',TypeInfo(_T86),[
TypeInfo(TStream)], pointer(80));

RegRegisterMethod(TGraphic,'SaveToStream',TypeInfo(_T87),[
TypeInfo(TStream)], pointer(84));

RegRegisterMethod(TGraphic,'LoadFromClipboardFormat',TypeInfo(_T88),[
TypeInfo(Word),
TypeInfo(THandle),
TypeInfo(HPALETTE)], pointer(88));

RegRegisterMethod(TGraphic,'SaveToClipboardFormat',TypeInfo(_T89),[
TypeInfo(Word),
TypeInfo(THandle),
TypeInfo(HPALETTE)], pointer(92));

RegRegisterMethod(TGraphicsObject,'Changed',TypeInfo(_T90),NoParams, pointer(MinVMTOffset - 2));

RegRegisterMethod(TIcon,'ReleaseHandle',TypeInfo(_T91),[TypeInfo(HICON)],Addr(TIcon.ReleaseHandle));

RegRegisterMethod(TMetafile,'Clear',TypeInfo(_T92),NoParams,Addr(TMetafile.Clear));

RegRegisterMethod(TMetafile,'ReleaseHandle',TypeInfo(_T93),[TypeInfo(HENHMETAFILE)],Addr(TMetafile.ReleaseHandle));

RegisterProc(TMetafileCanvas,'Create',mtConstructor,TypeInfo(_T94),[
TypeInfo(TMetafile),
TypeInfo(HDC)],Addr(TMetafileCanvas.Create),cRegister);

RegisterProc(TMetafileCanvas,'CreateWithComment',mtConstructor,TypeInfo(_T95),[
TypeInfo(TMetafile),
TypeInfo(HDC),
TypeInfo(string),
TypeInfo(string)],Addr(TMetafileCanvas.CreateWithComment),cRegister);

RegisterProc(TPen,'Create',mtConstructor,TypeInfo(_T96),NoParams,Addr(TPen.Create),cRegister);

RegRegisterMethod(TPicture,'Changed',TypeInfo(_T97),[
TypeInfo(TObject)], pointer(MinVMTOffset - 2));

RegRegisterMethod(TPicture,'Progress',TypeInfo(_T98),[
TypeInfo(TObject),
TypeInfo(TProgressStage),
TypeInfo(Byte),
TypeInfo(Boolean),
TypeInfo(IDispatch),
TypeInfo(string)], pointer(MinVMTOffset - 3));

RegisterProc(TPicture,'Create',mtConstructor,TypeInfo(_T99),NoParams,Addr(TPicture.Create),cRegister);

RegRegisterMethod(TPicture,'LoadFromFile',TypeInfo(_T100),[
TypeInfo(string)],Addr(TPicture.LoadFromFile));

RegRegisterMethod(TPicture,'SaveToFile',TypeInfo(_T101),[
TypeInfo(string)],Addr(TPicture.SaveToFile));

RegRegisterMethod(TPicture,'LoadFromClipboardFormat',TypeInfo(_T102),[
TypeInfo(Word),
TypeInfo(THandle),
TypeInfo(HPALETTE)],Addr(TPicture.LoadFromClipboardFormat));

RegRegisterMethod(TPicture,'SaveToClipboardFormat',TypeInfo(_T103),[
TypeInfo(Word),
TypeInfo(THandle),
TypeInfo(HPALETTE)],Addr(TPicture.SaveToClipboardFormat));

RegisterProc(TPicture,'SupportsClipboardFormat',mtClassMethod,TypeInfo(_T104),[
TypeInfo(Word),TypeInfo(Boolean)],Addr(TPicture.SupportsClipboardFormat),cRegister);

RegRegisterMethod(TSharedImage,'FreeHandle',TypeInfo(_T109),NoParams, pointer(0));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'GraphicFilter',mtProc,TypeInfo(_T0),[
TypeInfo(TGraphicClass),TypeInfo(string)],Addr(GraphicFilter),cRegister)}

{RegisterProc(nil,'GraphicExtension',mtProc,TypeInfo(_T1),[
TypeInfo(TGraphicClass),TypeInfo(string)],Addr(GraphicExtension),cRegister)}

{RegisterProc(nil,'GraphicFileMask',mtProc,TypeInfo(_T2),[
TypeInfo(TGraphicClass),TypeInfo(string)],Addr(GraphicFileMask),cRegister)}

{RegisterProc(nil,'GetColorValues',mtProc,TypeInfo(_T6),[
TypeInfo(TGetStrProc)],Addr(GetColorValues),cRegister)}

{RegisterProc(nil,'GetCharsetValues',mtProc,TypeInfo(_T9),[
TypeInfo(TGetStrProc)],Addr(GetCharsetValues),cRegister)}

{RegisterProc(nil,'CreateMappedRes',mtProc,TypeInfo(_T19),[
TypeInfo(THandle),
TypeInfoPChar,
ArrayInfo(TypeInfo(TColor)),
ArrayInfo(TypeInfo(TColor)),TypeInfo(HBITMAP)],Addr(CreateMappedRes),cRegister)}

{RegisterProc(nil,'CreateGrayMappedRes',mtProc,TypeInfo(_T21),[
TypeInfo(THandle),
TypeInfoPChar,TypeInfo(HBITMAP)],Addr(CreateGrayMappedRes),cRegister)}

{RegisterProc(TPicture,'RegisterFileFormat',mtClassMethod,TypeInfo(_T105),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TGraphicClass)],Addr(TPicture.RegisterFileFormat),cRegister)}

{RegisterProc(TPicture,'RegisterFileFormatRes',mtClassMethod,TypeInfo(_T106),[
TypeInfo(string),
TypeInfo(Integer),
TypeInfo(TGraphicClass)],Addr(TPicture.RegisterFileFormatRes),cRegister)}

{RegisterProc(TPicture,'RegisterClipboardFormat',mtClassMethod,TypeInfo(_T107),[
TypeInfo(Word),
TypeInfo(TGraphicClass)],Addr(TPicture.RegisterClipboardFormat),cRegister)}

{RegisterProc(TPicture,'UnregisterGraphicClass',mtClassMethod,TypeInfo(_T108),[
TypeInfo(TGraphicClass)],Addr(TPicture.UnregisterGraphicClass),cRegister)}

{RegisterEvent(TypeInfo(TProgressEvent),[
TypeInfo(TObject),
TypeInfo(TProgressStage),
TypeInfo(Byte),
TypeInfo(Boolean),
TypeInfo(IDispatch),
TypeInfo(string)]);}

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
