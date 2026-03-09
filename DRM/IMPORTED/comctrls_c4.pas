{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit COMCTRLS_C4;
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
  Messages,
  Windows,
  SysUtils,
  CommCtrl,
  Classes,
  Controls,
  Forms,
  Menus,
  Graphics,
  StdCtrls,
  RichEdit,
  ToolWin,
  ImgList,
  ExtCtrls,
  ComCtrls;
function ConvertTConversionFormatToVariant(var R : TConversionFormat) : OleVariant;
function ConvertVariantToTConversionFormat(const V : OleVariant) : TConversionFormat;
function ConvertTLVItemToVariant(var R : TLVItem) : OleVariant;
function ConvertVariantToTLVItem(const V : OleVariant) : TLVItem;
function ConvertTNodeCacheToVariant(var R : TNodeCache) : OleVariant;
function ConvertVariantToTNodeCache(const V : OleVariant) : TNodeCache;
function ConvertTNodeInfoToVariant(var R : TNodeInfo) : OleVariant;
function ConvertVariantToTNodeInfo(const V : OleVariant) : TNodeInfo;
function ConvertTPointToVariant(var R : TPoint) : OleVariant;
function ConvertVariantToTPoint(const V : OleVariant) : TPoint;
function ConvertTRectToVariant(var R : TRect) : OleVariant;
function ConvertVariantToTRect(const V : OleVariant) : TRect;
function ConvertTRichEditStreamInfoToVariant(var R : TRichEditStreamInfo) : OleVariant;
function ConvertVariantToTRichEditStreamInfo(const V : OleVariant) : TRichEditStreamInfo;
function ConvertTSystemTimeToVariant(var R : TSystemTime) : OleVariant;
function ConvertVariantToTSystemTime(const V : OleVariant) : TSystemTime;
function ConvertTTVItemToVariant(var R : TTVItem) : OleVariant;
function ConvertVariantToTTVItem(const V : OleVariant) : TTVItem;
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
type __TConversionFormat__Wrapper = class(TDCRecordWrapper)
private
fR : TConversionFormat;
public
function GetRecordPtr : pointer; override;
published
procedure setExtension(const val : AnsiString);
function getExtension : AnsiString;
property Extension : AnsiString read getExtension write setExtension;
end;
type __TNodeCache__Wrapper = class(TDCRecordWrapper)
private
fR : TNodeCache;
public
function GetRecordPtr : pointer; override;
published
procedure setCacheNode(const val : TTreeNode);
function getCacheNode : TTreeNode;
property CacheNode : TTreeNode read getCacheNode write setCacheNode;
procedure setCacheIndex(const val : Integer);
function getCacheIndex : Integer;
property CacheIndex : Integer read getCacheIndex write setCacheIndex;
end;
type __TNodeInfo__Wrapper = class(TDCRecordWrapper)
private
fR : TNodeInfo;
public
function GetRecordPtr : pointer; override;
published
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
procedure setCount(const val : Integer);
function getCount : Integer;
property Count : Integer read getCount write setCount;
end;
type __TRichEditStreamInfo__Wrapper = class(TDCRecordWrapper)
private
fR : TRichEditStreamInfo;
public
function GetRecordPtr : pointer; override;
published
procedure setConverter(const val : TConversion);
function getConverter : TConversion;
property Converter : TConversion read getConverter write setConverter;
procedure setStream(const val : TStream);
function getStream : TStream;
property Stream : TStream read getStream write setStream;
end;
type __TSystemTime__Wrapper = class(TDCRecordWrapper)
private
fR : TSystemTime;
public
function GetRecordPtr : pointer; override;
published
procedure setwYear(const val : Word);
function getwYear : Word;
property wYear : Word read getwYear write setwYear;
procedure setwMonth(const val : Word);
function getwMonth : Word;
property wMonth : Word read getwMonth write setwMonth;
procedure setwDayOfWeek(const val : Word);
function getwDayOfWeek : Word;
property wDayOfWeek : Word read getwDayOfWeek write setwDayOfWeek;
procedure setwDay(const val : Word);
function getwDay : Word;
property wDay : Word read getwDay write setwDay;
procedure setwHour(const val : Word);
function getwHour : Word;
property wHour : Word read getwHour write setwHour;
procedure setwMinute(const val : Word);
function getwMinute : Word;
property wMinute : Word read getwMinute write setwMinute;
procedure setwSecond(const val : Word);
function getwSecond : Word;
property wSecond : Word read getwSecond write setwSecond;
procedure setwMilliseconds(const val : Word);
function getwMilliseconds : Word;
property wMilliseconds : Word read getwMilliseconds write setwMilliseconds;
end;
type __TLVItem__Wrapper = class(TDCRecordWrapper)
private
fR : TLVItem;
public
function GetRecordPtr : pointer; override;
published
procedure setMask(const val : UINT);
function getMask : UINT;
property Mask : UINT read getMask write setMask;
procedure setiItem(const val : Integer);
function getiItem : Integer;
property iItem : Integer read getiItem write setiItem;
procedure setiSubItem(const val : Integer);
function getiSubItem : Integer;
property iSubItem : Integer read getiSubItem write setiSubItem;
procedure setstate(const val : UINT);
function getstate : UINT;
property state : UINT read getstate write setstate;
procedure setstateMask(const val : UINT);
function getstateMask : UINT;
property stateMask : UINT read getstateMask write setstateMask;
procedure setcchTextMax(const val : Integer);
function getcchTextMax : Integer;
property cchTextMax : Integer read getcchTextMax write setcchTextMax;
procedure setiImage(const val : Integer);
function getiImage : Integer;
property iImage : Integer read getiImage write setiImage;
procedure setlParam(const val : lParam);
function getlParam : lParam;
property lParam : lParam read getlParam write setlParam;
procedure setiIndent(const val : Integer);
function getiIndent : Integer;
property iIndent : Integer read getiIndent write setiIndent;
end;
type __TTVItem__Wrapper = class(TDCRecordWrapper)
private
fR : TTVItem;
public
function GetRecordPtr : pointer; override;
published
procedure setMask(const val : UINT);
function getMask : UINT;
property Mask : UINT read getMask write setMask;
procedure setstate(const val : UINT);
function getstate : UINT;
property state : UINT read getstate write setstate;
procedure setstateMask(const val : UINT);
function getstateMask : UINT;
property stateMask : UINT read getstateMask write setstateMask;
procedure setcchTextMax(const val : Integer);
function getcchTextMax : Integer;
property cchTextMax : Integer read getcchTextMax write setcchTextMax;
procedure setiImage(const val : Integer);
function getiImage : Integer;
property iImage : Integer read getiImage write setiImage;
procedure setiSelectedImage(const val : Integer);
function getiSelectedImage : Integer;
property iSelectedImage : Integer read getiSelectedImage write setiSelectedImage;
procedure setcChildren(const val : Integer);
function getcChildren : Integer;
property cChildren : Integer read getcChildren write setcChildren;
procedure setlParam(const val : lParam);
function getlParam : lParam;
property lParam : lParam read getlParam write setlParam;
end;
type __TCommonCalendar__ = class(TCommonCalendar);
type __TCustomListView__ = class(TCustomListView);
type __TCustomRichEdit__ = class(TCustomRichEdit);
type __TCustomTabControl__ = class(TCustomTabControl);
type __TCustomTreeView__ = class(TCustomTreeView);
type __THeaderControl__ = class(THeaderControl);
type __TStatusBar__ = class(TStatusBar);
type
_T0 = function (p0 : Integer): Boolean of object;

_T1 = procedure (p0 : Integer) of object;

_T2 = function : Integer of object;

_T3 = procedure (p0 : TToolButton) of object;

_T4 = procedure  of object;

_T5 = _T4;

_T6 = _T4;

_T7 = _T4;

_T8 = procedure (p0 : Word;
p1 : Word;
p2 : Integer) of object;

_T9 = _T4;

_T10 = procedure (p0 : SmallInt) of object;

_T11 = _T4;

_T12 = _T4;

_T13 = procedure (p0 : TDate) of object;

_T14 = function : HWND of object;

_T15 = function : DWORD of object;

_T16 = function (p0 : Integer;
p1 : TColor): Boolean of object;

_T17 = function (const p0 : IDispatch): Boolean of object;

{_T18 = function (p0 : Integer;
p1 : PSystemTime): Boolean of object;}

_T19 = procedure (p0 : Array of LongWord;
var p1 : LongWord) of object;

{_T20 = function (p0 : TStream;
p1 : PChar;
p2 : Integer): Integer of object;}

{_T21 = function (p0 : TStream;
p1 : PChar;
p2 : Integer): Integer of object;}

_T22 = _T4;

_T23 = _T4;

_T24 = procedure (p0 : TCoolBar) of object;

_T25 = function : TCoolBand of object;

_T26 = function (p0 : TControl): TCoolBand of object;

_T27 = _T4;

_T28 = function (p0 : TListItem;
p1 : Integer): Boolean of object;

_T29 = function (p0 : TListItem): Boolean of object;

_T30 = procedure (p0 : TListItem;
p1 : Integer) of object;

_T31 = procedure (p0 : TListColumn) of object;

_T32 = function : TListItem of object;

_T33 = function (const p0 : IDispatch;
p1 : TCustomDrawStage): Boolean of object;

_T34 = function (p0 : TListItem;
p1 : TCustomDrawState;
p2 : TCustomDrawStage): Boolean of object;

_T35 = function (p0 : TListItem;
p1 : Integer;
p2 : TCustomDrawState;
p3 : TCustomDrawStage): Boolean of object;

_T36 = procedure (p0 : TListItem) of object;

_T37 = procedure (p0 : TListItem;
const p1 : IDispatch;
p2 : TOwnerDrawState) of object;

_T38 = procedure (const p0 : IDispatch) of object;

_T39 = function (p0 : TListItem;
p1 : TItemRequest): Boolean of object;

_T40 = function (p0 : TItemFind;
const p1 : string;
const p2 : IDispatch;
p3 : Pointer;
p4 : Integer;
p5 : TSearchDirection;
p6 : Boolean): Integer of object;

_T41 = function (p0 : Integer;
p1 : Integer): Boolean of object;

_T42 = function (p0 : Integer;
p1 : Integer;
p2 : TItemStates;
p3 : TItemStates): Boolean of object;

_T43 = _T36;

_T44 = function : Boolean of object;

_T45 = procedure (p0 : TListArrangement) of object;

_T46 = function (p0 : Integer;
p1 : string;
p2 : Boolean;
p3 : Boolean;
p4 : Boolean): TListItem of object;

_T47 = function (p0 : Integer;
p1 : Pointer;
p2 : Boolean;
p3 : Boolean): TListItem of object;

_T48 = function (p0 : Integer;
p1 : Integer): THitTests of object;

_T49 = function (p0 : Integer;
p1 : Integer): TListItem of object;

_T50 = function (const p0 : IDispatch;
p1 : TSearchDirection): TListItem of object;

_T51 = function (p0 : TListItem;
p1 : TSearchDirection;
p2 : TItemStates): TListItem of object;

_T52 = function : string of object;

_T53 = _T44;

_T54 = procedure (p0 : Integer;
p1 : Integer) of object;

{_T55 = function (p0 : TLVCompare;
p1 : Longint): Boolean of object;}

_T56 = function (p0 : string): Integer of object;

_T57 = _T54;

_T58 = _T38;

_T59 = _T4;

_T60 = function (const p0 : string;
p1 : Integer;
p2 : Integer;
p3 : TSearchTypes): Integer of object;

_T61 = procedure (const p0 : string) of object;

{_T62 = procedure (const p0 : string;
p1 : TConversionClass) of object;}

_T63 = _T44;

_T64 = _T0;

_T65 = _T4;

_T66 = procedure (p0 : Integer;
const p1 : IDispatch;
p2 : Boolean) of object;

_T67 = function (p0 : Integer): Integer of object;

_T68 = function (p0 : TTreeNode): Boolean of object;

_T69 = _T68;

_T70 = _T68;

_T71 = _T68;

_T72 = procedure (p0 : TTreeNode) of object;

_T73 = _T72;

_T74 = function : TTreeNode of object;

_T75 = _T33;

_T76 = function (p0 : TTreeNode;
p1 : TCustomDrawState;
p2 : TCustomDrawStage): Boolean of object;

_T77 = _T72;

_T78 = _T38;

_T79 = _T72;

_T80 = _T72;

_T81 = _T72;

_T82 = _T44;

{_T83 = function (p0 : TTVCompare;
p1 : Longint): Boolean of object;}

_T84 = _T4;

_T85 = _T4;

_T86 = _T48;

_T87 = function (p0 : Integer;
p1 : Integer): TTreeNode of object;

_T88 = _T44;

_T89 = _T61;

_T90 = procedure (p0 : TStream) of object;

_T91 = _T61;

_T92 = _T90;

_T93 = _T44;

_T94 = procedure (p0 : TUDBtnType) of object;

_T95 = _T4;

_T96 = procedure (p0 : THeaderSection;
const p1 : IDispatch;
p2 : Boolean) of object;

_T97 = procedure (p0 : THeaderSection) of object;

_T98 = _T97;

_T99 = procedure (p0 : THeaderSection;
p1 : Integer;
p2 : TSectionTrackState) of object;

_T100 = _T4;

_T101 = _T44;

_T102 = _T44;

_T103 = procedure (p0 : THeaderControl) of object;

_T104 = function : THeaderSection of object;

_T105 = procedure (p0 : TCustomListView) of object;

_T106 = _T105;

_T107 = function : TListColumn of object;

_T108 = procedure (p0 : TListItems) of object;

_T109 = _T4;

_T110 = _T4;

_T111 = function (p0 : TDisplayCode): IDispatch of object;

_T112 = _T44;

_T113 = function : IDispatch of object;

_T114 = procedure (p0 : Boolean) of object;

_T115 = _T4;

_T116 = _T38;

_T117 = _T105;

_T118 = _T32;

_T119 = _T4;

_T120 = _T4;

_T121 = _T1;

_T122 = _T4;

_T123 = function (p0 : TListItem): Integer of object;

_T124 = function (p0 : Integer): TListItem of object;

_T125 = procedure (p0 : TCommonCalendar) of object;

_T126 = function (p0 : TTabSheet;
p1 : Boolean;
p2 : Boolean): TTabSheet of object;

_T127 = _T114;

_T128 = procedure (p0 : TShiftState;
p1 : Integer;
p2 : Integer;
p3 : TPageScrollerOrientation;
var p4 : Integer) of object;

_T129 = function (p0 : TPageScrollerButton): TPageScrollerButtonState of object;

_T130 = procedure (p0 : TCustomRichEdit) of object;

_T131 = _T4;

_T132 = _T1;

_T133 = _T44;

_T134 = procedure (p0 : TStatusPanel;
const p1 : IDispatch) of object;

_T135 = _T4;

_T136 = _T44;

_T137 = _T44;

_T138 = procedure (p0 : TStatusBar) of object;

_T139 = function : TStatusPanel of object;

_T140 = _T4;

_T141 = _T4;

_T142 = procedure (p0 : TCustomRichEdit;
p1 : TAttributeType) of object;

_T143 = _T4;

_T144 = function (p0 : TToolButton): Boolean of object;

_T145 = _T3;

_T146 = _T3;

_T147 = _T144;

_T148 = function (p0 : Boolean): Boolean of object;

_T149 = _T4;

_T150 = _T4;

_T151 = _T4;

_T152 = _T4;

_T153 = _T44;

_T154 = _T1;

_T155 = procedure (p0 : TTreeNodes) of object;

_T156 = _T44;

_T157 = _T114;

{_T158 = function (p0 : TTVCompare;
p1 : Longint): Boolean of object;}

_T159 = _T4;

_T160 = _T4;

_T161 = function (p0 : Boolean): IDispatch of object;

_T162 = _T44;

_T163 = _T114;

_T164 = _T114;

_T165 = _T74;

_T166 = _T14;

_T167 = _T74;

_T168 = _T74;

_T169 = function (p0 : TTreeNode): TTreeNode of object;

_T170 = _T74;

_T171 = _T74;

_T172 = _T74;

_T173 = _T169;

_T174 = _T74;

_T175 = _T74;

_T176 = _T68;

_T177 = function (p0 : TTreeNode): Integer of object;

_T178 = _T4;

_T179 = procedure (p0 : TTreeNode;
p1 : TNodeAttachMode) of object;

_T180 = procedure (p0 : TCustomTreeView) of object;

_T181 = function (p0 : TTreeNode;
const p1 : string): TTreeNode of object;

_T182 = _T181;

_T183 = function (p0 : TTreeNode;
const p1 : string;
p2 : Pointer): TTreeNode of object;

_T184 = _T183;

_T185 = _T181;

_T186 = _T181;

_T187 = _T183;

_T188 = _T183;

_T189 = _T4;

_T190 = _T4;

_T191 = _T72;

_T192 = _T4;

_T193 = _T74;

{_T194 = function (p0 : HTreeItem): TTreeNode of object;}

_T195 = _T181;

_T196 = _T183;

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
function __TConversionFormat__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TConversionFormat__Wrapper.setExtension(const val : AnsiString);
begin
TConversionFormat(GetRecordPtr^).Extension := val;
end;
function __TConversionFormat__Wrapper.getExtension : AnsiString;
begin
result := TConversionFormat(GetRecordPtr^).Extension;
end;
function __TNodeCache__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TNodeCache__Wrapper.setCacheNode(const val : TTreeNode);
begin
TNodeCache(GetRecordPtr^).CacheNode := val;
end;
function __TNodeCache__Wrapper.getCacheNode : TTreeNode;
begin
result := TNodeCache(GetRecordPtr^).CacheNode;
end;
procedure __TNodeCache__Wrapper.setCacheIndex(const val : Integer);
begin
TNodeCache(GetRecordPtr^).CacheIndex := val;
end;
function __TNodeCache__Wrapper.getCacheIndex : Integer;
begin
result := TNodeCache(GetRecordPtr^).CacheIndex;
end;
function __TNodeInfo__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TNodeInfo__Wrapper.setImageIndex(const val : Integer);
begin
TNodeInfo(GetRecordPtr^).ImageIndex := val;
end;
function __TNodeInfo__Wrapper.getImageIndex : Integer;
begin
result := TNodeInfo(GetRecordPtr^).ImageIndex;
end;
procedure __TNodeInfo__Wrapper.setSelectedIndex(const val : Integer);
begin
TNodeInfo(GetRecordPtr^).SelectedIndex := val;
end;
function __TNodeInfo__Wrapper.getSelectedIndex : Integer;
begin
result := TNodeInfo(GetRecordPtr^).SelectedIndex;
end;
procedure __TNodeInfo__Wrapper.setStateIndex(const val : Integer);
begin
TNodeInfo(GetRecordPtr^).StateIndex := val;
end;
function __TNodeInfo__Wrapper.getStateIndex : Integer;
begin
result := TNodeInfo(GetRecordPtr^).StateIndex;
end;
procedure __TNodeInfo__Wrapper.setOverlayIndex(const val : Integer);
begin
TNodeInfo(GetRecordPtr^).OverlayIndex := val;
end;
function __TNodeInfo__Wrapper.getOverlayIndex : Integer;
begin
result := TNodeInfo(GetRecordPtr^).OverlayIndex;
end;
procedure __TNodeInfo__Wrapper.setCount(const val : Integer);
begin
TNodeInfo(GetRecordPtr^).Count := val;
end;
function __TNodeInfo__Wrapper.getCount : Integer;
begin
result := TNodeInfo(GetRecordPtr^).Count;
end;
function __TRichEditStreamInfo__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TRichEditStreamInfo__Wrapper.setConverter(const val : TConversion);
begin
TRichEditStreamInfo(GetRecordPtr^).Converter := val;
end;
function __TRichEditStreamInfo__Wrapper.getConverter : TConversion;
begin
result := TRichEditStreamInfo(GetRecordPtr^).Converter;
end;
procedure __TRichEditStreamInfo__Wrapper.setStream(const val : TStream);
begin
TRichEditStreamInfo(GetRecordPtr^).Stream := val;
end;
function __TRichEditStreamInfo__Wrapper.getStream : TStream;
begin
result := TRichEditStreamInfo(GetRecordPtr^).Stream;
end;
function _TConversionFormat_ : IDispatch;
begin
  result := __TConversionFormat__Wrapper.Create;
end;
function _TNodeCache_ : IDispatch;
begin
  result := __TNodeCache__Wrapper.Create;
end;
function _TNodeInfo_ : IDispatch;
begin
  result := __TNodeInfo__Wrapper.Create;
end;
function _TRichEditStreamInfo_ : IDispatch;
begin
  result := __TRichEditStreamInfo__Wrapper.Create;
end;
function __TSystemTime__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TSystemTime__Wrapper.setwYear(const val : Word);
begin
TSystemTime(GetRecordPtr^).wYear := val;
end;
function __TSystemTime__Wrapper.getwYear : Word;
begin
result := TSystemTime(GetRecordPtr^).wYear;
end;
procedure __TSystemTime__Wrapper.setwMonth(const val : Word);
begin
TSystemTime(GetRecordPtr^).wMonth := val;
end;
function __TSystemTime__Wrapper.getwMonth : Word;
begin
result := TSystemTime(GetRecordPtr^).wMonth;
end;
procedure __TSystemTime__Wrapper.setwDayOfWeek(const val : Word);
begin
TSystemTime(GetRecordPtr^).wDayOfWeek := val;
end;
function __TSystemTime__Wrapper.getwDayOfWeek : Word;
begin
result := TSystemTime(GetRecordPtr^).wDayOfWeek;
end;
procedure __TSystemTime__Wrapper.setwDay(const val : Word);
begin
TSystemTime(GetRecordPtr^).wDay := val;
end;
function __TSystemTime__Wrapper.getwDay : Word;
begin
result := TSystemTime(GetRecordPtr^).wDay;
end;
procedure __TSystemTime__Wrapper.setwHour(const val : Word);
begin
TSystemTime(GetRecordPtr^).wHour := val;
end;
function __TSystemTime__Wrapper.getwHour : Word;
begin
result := TSystemTime(GetRecordPtr^).wHour;
end;
procedure __TSystemTime__Wrapper.setwMinute(const val : Word);
begin
TSystemTime(GetRecordPtr^).wMinute := val;
end;
function __TSystemTime__Wrapper.getwMinute : Word;
begin
result := TSystemTime(GetRecordPtr^).wMinute;
end;
procedure __TSystemTime__Wrapper.setwSecond(const val : Word);
begin
TSystemTime(GetRecordPtr^).wSecond := val;
end;
function __TSystemTime__Wrapper.getwSecond : Word;
begin
result := TSystemTime(GetRecordPtr^).wSecond;
end;
procedure __TSystemTime__Wrapper.setwMilliseconds(const val : Word);
begin
TSystemTime(GetRecordPtr^).wMilliseconds := val;
end;
function __TSystemTime__Wrapper.getwMilliseconds : Word;
begin
result := TSystemTime(GetRecordPtr^).wMilliseconds;
end;
function __TLVItem__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TLVItem__Wrapper.setMask(const val : UINT);
begin
TLVItem(GetRecordPtr^).Mask := val;
end;
function __TLVItem__Wrapper.getMask : UINT;
begin
result := TLVItem(GetRecordPtr^).Mask;
end;
procedure __TLVItem__Wrapper.setiItem(const val : Integer);
begin
TLVItem(GetRecordPtr^).iItem := val;
end;
function __TLVItem__Wrapper.getiItem : Integer;
begin
result := TLVItem(GetRecordPtr^).iItem;
end;
procedure __TLVItem__Wrapper.setiSubItem(const val : Integer);
begin
TLVItem(GetRecordPtr^).iSubItem := val;
end;
function __TLVItem__Wrapper.getiSubItem : Integer;
begin
result := TLVItem(GetRecordPtr^).iSubItem;
end;
procedure __TLVItem__Wrapper.setstate(const val : UINT);
begin
TLVItem(GetRecordPtr^).state := val;
end;
function __TLVItem__Wrapper.getstate : UINT;
begin
result := TLVItem(GetRecordPtr^).state;
end;
procedure __TLVItem__Wrapper.setstateMask(const val : UINT);
begin
TLVItem(GetRecordPtr^).stateMask := val;
end;
function __TLVItem__Wrapper.getstateMask : UINT;
begin
result := TLVItem(GetRecordPtr^).stateMask;
end;
procedure __TLVItem__Wrapper.setcchTextMax(const val : Integer);
begin
TLVItem(GetRecordPtr^).cchTextMax := val;
end;
function __TLVItem__Wrapper.getcchTextMax : Integer;
begin
result := TLVItem(GetRecordPtr^).cchTextMax;
end;
procedure __TLVItem__Wrapper.setiImage(const val : Integer);
begin
TLVItem(GetRecordPtr^).iImage := val;
end;
function __TLVItem__Wrapper.getiImage : Integer;
begin
result := TLVItem(GetRecordPtr^).iImage;
end;
procedure __TLVItem__Wrapper.setlParam(const val : lParam);
begin
TLVItem(GetRecordPtr^).lParam := val;
end;
function __TLVItem__Wrapper.getlParam : lParam;
begin
result := TLVItem(GetRecordPtr^).lParam;
end;
procedure __TLVItem__Wrapper.setiIndent(const val : Integer);
begin
TLVItem(GetRecordPtr^).iIndent := val;
end;
function __TLVItem__Wrapper.getiIndent : Integer;
begin
result := TLVItem(GetRecordPtr^).iIndent;
end;
function __TTVItem__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TTVItem__Wrapper.setMask(const val : UINT);
begin
TTVItem(GetRecordPtr^).Mask := val;
end;
function __TTVItem__Wrapper.getMask : UINT;
begin
result := TTVItem(GetRecordPtr^).Mask;
end;
procedure __TTVItem__Wrapper.setstate(const val : UINT);
begin
TTVItem(GetRecordPtr^).state := val;
end;
function __TTVItem__Wrapper.getstate : UINT;
begin
result := TTVItem(GetRecordPtr^).state;
end;
procedure __TTVItem__Wrapper.setstateMask(const val : UINT);
begin
TTVItem(GetRecordPtr^).stateMask := val;
end;
function __TTVItem__Wrapper.getstateMask : UINT;
begin
result := TTVItem(GetRecordPtr^).stateMask;
end;
procedure __TTVItem__Wrapper.setcchTextMax(const val : Integer);
begin
TTVItem(GetRecordPtr^).cchTextMax := val;
end;
function __TTVItem__Wrapper.getcchTextMax : Integer;
begin
result := TTVItem(GetRecordPtr^).cchTextMax;
end;
procedure __TTVItem__Wrapper.setiImage(const val : Integer);
begin
TTVItem(GetRecordPtr^).iImage := val;
end;
function __TTVItem__Wrapper.getiImage : Integer;
begin
result := TTVItem(GetRecordPtr^).iImage;
end;
procedure __TTVItem__Wrapper.setiSelectedImage(const val : Integer);
begin
TTVItem(GetRecordPtr^).iSelectedImage := val;
end;
function __TTVItem__Wrapper.getiSelectedImage : Integer;
begin
result := TTVItem(GetRecordPtr^).iSelectedImage;
end;
procedure __TTVItem__Wrapper.setcChildren(const val : Integer);
begin
TTVItem(GetRecordPtr^).cChildren := val;
end;
function __TTVItem__Wrapper.getcChildren : Integer;
begin
result := TTVItem(GetRecordPtr^).cChildren;
end;
procedure __TTVItem__Wrapper.setlParam(const val : lParam);
begin
TTVItem(GetRecordPtr^).lParam := val;
end;
function __TTVItem__Wrapper.getlParam : lParam;
begin
result := TTVItem(GetRecordPtr^).lParam;
end;
function __TCommonCalendar__MsgSetDateTime__Wrapper(__Instance : TCommonCalendar;
const p0 : IDispatch): Boolean;
var
__p0 : ^TSystemTime;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := __TCommonCalendar__(__Instance).MsgSetDateTime(__p0^);
end;

function __TCustomListView__CustomDraw__Wrapper(__Instance : TCustomListView;
const p0 : IDispatch;
p1 : TCustomDrawStage): Boolean;
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := __TCustomListView__(__Instance).CustomDraw(__p0^,p1);
end;

procedure __TCustomListView__DrawItem__Wrapper(__Instance : TCustomListView;
p0 : TListItem;
const p1 : IDispatch;
p2 : TOwnerDrawState);
var
__p1 : ^TRect;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
__TCustomListView__(__Instance).DrawItem(p0,__p1^,p2);
end;

procedure __TCustomListView__Edit__Wrapper(__Instance : TCustomListView;
const p0 : IDispatch);
var
__p0 : ^TLVItem;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
__TCustomListView__(__Instance).Edit(__p0^);
end;

function __TCustomListView__OwnerDataFind__Wrapper(__Instance : TCustomListView;
p0 : TItemFind;
const p1 : string;
const p2 : IDispatch;
p3 : Pointer;
p4 : Integer;
p5 : TSearchDirection;
p6 : Boolean): Integer;
var
__p2 : ^TPoint;
__i2 : IDispatch;
begin
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
result := __TCustomListView__(__Instance).OwnerDataFind(p0,p1,__p2^,p3,p4,p5,p6);
end;

function __TCustomListView__GetNearestItem__Wrapper(__Instance : TCustomListView;
const p0 : IDispatch;
p1 : TSearchDirection): TListItem;
var
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := TCustomListView(__Instance).GetNearestItem(__p0^,p1);
end;

procedure __TCustomRichEdit__RequestSize__Wrapper(__Instance : TCustomRichEdit;
const p0 : IDispatch);
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
__TCustomRichEdit__(__Instance).RequestSize(__p0^);
end;

procedure __TCustomTabControl__DrawTab__Wrapper(__Instance : TCustomTabControl;
p0 : Integer;
const p1 : IDispatch;
p2 : Boolean);
var
__p1 : ^TRect;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
__TCustomTabControl__(__Instance).DrawTab(p0,__p1^,p2);
end;

function __TCustomTreeView__CustomDraw__Wrapper(__Instance : TCustomTreeView;
const p0 : IDispatch;
p1 : TCustomDrawStage): Boolean;
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := __TCustomTreeView__(__Instance).CustomDraw(__p0^,p1);
end;

procedure __TCustomTreeView__Edit__Wrapper(__Instance : TCustomTreeView;
const p0 : IDispatch);
var
__p0 : ^TTVItem;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
__TCustomTreeView__(__Instance).Edit(__p0^);
end;

procedure __THeaderControl__DrawSection__Wrapper(__Instance : THeaderControl;
p0 : THeaderSection;
const p1 : IDispatch;
p2 : Boolean);
var
__p1 : ^TRect;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
__THeaderControl__(__Instance).DrawSection(p0,__p1^,p2);
end;

function __TListItem__DisplayRect__Wrapper(__Instance : TListItem;
p0 : TDisplayCode): IDispatch;
var
__result : TRect;
__wrapper : __TRect__Wrapper;
begin
__result := TListItem(__Instance).DisplayRect(p0);
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function __TListItem__GetPosition__Wrapper(__Instance : TListItem): IDispatch;
var
__result : TPoint;
__wrapper : __TPoint__Wrapper;
begin
__result := TListItem(__Instance).GetPosition;
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

procedure __TListItem__SetPosition__Wrapper(__Instance : TListItem;
const p0 : IDispatch);
var
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TListItem(__Instance).SetPosition(__p0^);
end;

procedure __TStatusBar__DrawPanel__Wrapper(__Instance : TStatusBar;
p0 : TStatusPanel;
const p1 : IDispatch);
var
__p1 : ^TRect;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
__TStatusBar__(__Instance).DrawPanel(p0,__p1^);
end;

function __TTreeNode__DisplayRect__Wrapper(__Instance : TTreeNode;
p0 : Boolean): IDispatch;
var
__result : TRect;
__wrapper : __TRect__Wrapper;
begin
__result := TTreeNode(__Instance).DisplayRect(p0);
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;


type __TConversionFormat__Wrapper__ = class(__TConversionFormat__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TConversionFormat__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTConversionFormatToVariant(var R : TConversionFormat) : OleVariant;
var
__rw : __TConversionFormat__Wrapper__;
begin
__rw := __TConversionFormat__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTConversionFormat(const V : OleVariant) : TConversionFormat;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TConversionFormat((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TLVItem__Wrapper__ = class(__TLVItem__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TLVItem__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTLVItemToVariant(var R : TLVItem) : OleVariant;
var
__rw : __TLVItem__Wrapper__;
begin
__rw := __TLVItem__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTLVItem(const V : OleVariant) : TLVItem;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TLVItem((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TNodeCache__Wrapper__ = class(__TNodeCache__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TNodeCache__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTNodeCacheToVariant(var R : TNodeCache) : OleVariant;
var
__rw : __TNodeCache__Wrapper__;
begin
__rw := __TNodeCache__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTNodeCache(const V : OleVariant) : TNodeCache;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TNodeCache((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TNodeInfo__Wrapper__ = class(__TNodeInfo__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TNodeInfo__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTNodeInfoToVariant(var R : TNodeInfo) : OleVariant;
var
__rw : __TNodeInfo__Wrapper__;
begin
__rw := __TNodeInfo__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTNodeInfo(const V : OleVariant) : TNodeInfo;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TNodeInfo((_idisp as IDCRecordWrapper).GetRecordPtr^);
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

type __TRichEditStreamInfo__Wrapper__ = class(__TRichEditStreamInfo__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TRichEditStreamInfo__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTRichEditStreamInfoToVariant(var R : TRichEditStreamInfo) : OleVariant;
var
__rw : __TRichEditStreamInfo__Wrapper__;
begin
__rw := __TRichEditStreamInfo__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTRichEditStreamInfo(const V : OleVariant) : TRichEditStreamInfo;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TRichEditStreamInfo((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TSystemTime__Wrapper__ = class(__TSystemTime__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TSystemTime__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTSystemTimeToVariant(var R : TSystemTime) : OleVariant;
var
__rw : __TSystemTime__Wrapper__;
begin
__rw := __TSystemTime__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTSystemTime(const V : OleVariant) : TSystemTime;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TSystemTime((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TTVItem__Wrapper__ = class(__TTVItem__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TTVItem__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTTVItemToVariant(var R : TTVItem) : OleVariant;
var
__rw : __TTVItem__Wrapper__;
begin
__rw := __TTVItem__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTTVItem(const V : OleVariant) : TTVItem;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TTVItem((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTAnimate__FrameCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TAnimate(Instance).FrameCount;
end;

function __DC__GetTAnimate__FrameHeight(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TAnimate(Instance).FrameHeight;
end;

function __DC__GetTAnimate__FrameWidth(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TAnimate(Instance).FrameWidth;
end;

function __DC__GetTAnimate__Open(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TAnimate(Instance).Open;
end;

procedure __DC__SetTAnimate__Open(Instance : TObject; Params : PVariantArgList);
begin
TAnimate(Instance).Open:=OleVariant(Params^[0]);
end;

function __DC__GetTAnimate__ResHandle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TAnimate(Instance).ResHandle;
end;

procedure __DC__SetTAnimate__ResHandle(Instance : TObject; Params : PVariantArgList);
begin
TAnimate(Instance).ResHandle:=OleVariant(Params^[0]);
end;

function __DC__GetTAnimate__ResId(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TAnimate(Instance).ResId;
end;

procedure __DC__SetTAnimate__ResId(Instance : TObject; Params : PVariantArgList);
begin
TAnimate(Instance).ResId:=OleVariant(Params^[0]);
end;

function __DC__GetTAnimate__ResName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TAnimate(Instance).ResName;
end;

procedure __DC__SetTAnimate__ResName(Instance : TObject; Params : PVariantArgList);
begin
TAnimate(Instance).ResName:=OleVariant(Params^[0]);
end;

function __DC__GetTCoolBand__Height(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCoolBand(Instance).Height;
end;

function __DC__GetTCoolBands__CoolBar(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCoolBands(Instance).CoolBar);
end;

function __DC__GetTCoolBands__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCoolBands(Instance).Items[OleVariant(Params^[0])]);
end;

procedure __DC__SetTCoolBands__Items(Instance : TObject; Params : PVariantArgList);
begin
TCoolBands(Instance).Items[OleVariant(Params^[1])]:=TCoolBand(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomListView__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomListView(Instance).Canvas);
end;

function __DC__GetTCustomListView__Checkboxes(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomListView(Instance).Checkboxes;
end;

procedure __DC__SetTCustomListView__Checkboxes(Instance : TObject; Params : PVariantArgList);
begin
TCustomListView(Instance).Checkboxes:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomListView__Column(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomListView(Instance).Column[OleVariant(Params^[0])]);
end;

function __DC__GetTCustomListView__DropTarget(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomListView(Instance).DropTarget);
end;

procedure __DC__SetTCustomListView__DropTarget(Instance : TObject; Params : PVariantArgList);
begin
TCustomListView(Instance).DropTarget:=TListItem(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomListView__FlatScrollBars(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomListView(Instance).FlatScrollBars;
end;

procedure __DC__SetTCustomListView__FlatScrollBars(Instance : TObject; Params : PVariantArgList);
begin
TCustomListView(Instance).FlatScrollBars:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomListView__FullDrag(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomListView(Instance).FullDrag;
end;

procedure __DC__SetTCustomListView__FullDrag(Instance : TObject; Params : PVariantArgList);
begin
TCustomListView(Instance).FullDrag:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomListView__GridLines(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomListView(Instance).GridLines;
end;

procedure __DC__SetTCustomListView__GridLines(Instance : TObject; Params : PVariantArgList);
begin
TCustomListView(Instance).GridLines:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomListView__HotTrack(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomListView(Instance).HotTrack;
end;

procedure __DC__SetTCustomListView__HotTrack(Instance : TObject; Params : PVariantArgList);
begin
TCustomListView(Instance).HotTrack:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomListView__HotTrackStyles(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TListHotTrackStyles;
begin
tmp := TCustomListView(Instance).HotTrackStyles;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTCustomListView__HotTrackStyles(Instance : TObject; Params : PVariantArgList);
var
  tmp : TListHotTrackStyles;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TCustomListView(Instance).HotTrackStyles:=tmp;
end;

function __DC__GetTCustomListView__ItemFocused(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomListView(Instance).ItemFocused);
end;

procedure __DC__SetTCustomListView__ItemFocused(Instance : TObject; Params : PVariantArgList);
begin
TCustomListView(Instance).ItemFocused:=TListItem(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomListView__RowSelect(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomListView(Instance).RowSelect;
end;

procedure __DC__SetTCustomListView__RowSelect(Instance : TObject; Params : PVariantArgList);
begin
TCustomListView(Instance).RowSelect:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomListView__SelCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomListView(Instance).SelCount;
end;

function __DC__GetTCustomListView__Selected(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomListView(Instance).Selected);
end;

procedure __DC__SetTCustomListView__Selected(Instance : TObject; Params : PVariantArgList);
begin
TCustomListView(Instance).Selected:=TListItem(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomListView__TopItem(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomListView(Instance).TopItem);
end;

function __DC__GetTCustomListView__ViewOrigin(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TPoint__Wrapper;
begin
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := TCustomListView(Instance).ViewOrigin;
result := IUnknown(__wrapper) as IDispatch;
end;

function __DC__GetTCustomListView__VisibleRowCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomListView(Instance).VisibleRowCount;
end;

function __DC__GetTCustomListView__BoundingRect(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TRect__Wrapper;
begin
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := TCustomListView(Instance).BoundingRect;
result := IUnknown(__wrapper) as IDispatch;
end;

function __DC__GetTCustomRichEdit__DefAttributes(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomRichEdit(Instance).DefAttributes);
end;

procedure __DC__SetTCustomRichEdit__DefAttributes(Instance : TObject; Params : PVariantArgList);
begin
TCustomRichEdit(Instance).DefAttributes:=TTextAttributes(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomRichEdit__SelAttributes(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomRichEdit(Instance).SelAttributes);
end;

procedure __DC__SetTCustomRichEdit__SelAttributes(Instance : TObject; Params : PVariantArgList);
begin
TCustomRichEdit(Instance).SelAttributes:=TTextAttributes(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomRichEdit__PageRect(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TRect__Wrapper;
begin
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := TCustomRichEdit(Instance).PageRect;
result := IUnknown(__wrapper) as IDispatch;
end;

procedure __DC__SetTCustomRichEdit__PageRect(Instance : TObject; Params : PVariantArgList);
var
__idisp:IDispatch;
__iwrapper:IDCRecordWrapper;
begin
__idisp:=DCVarToInterface(OleVariant(Params^[0]));
if __idisp=nil then exit;
__idisp.QueryInterface(IDCRecordWrapper, __iwrapper);
TCustomRichEdit(Instance).PageRect:=TRect(__iwrapper.GetRecordPtr^);
end;

function __DC__GetTCustomRichEdit__Paragraph(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomRichEdit(Instance).Paragraph);
end;

function __DC__GetTCustomTabControl__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomTabControl(Instance).Canvas);
end;

function __DC__GetTCustomTabControl__TabStop(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomTabControl(Instance).TabStop;
end;

procedure __DC__SetTCustomTabControl__TabStop(Instance : TObject; Params : PVariantArgList);
begin
TCustomTabControl(Instance).TabStop:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomTreeView__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomTreeView(Instance).Canvas);
end;

function __DC__GetTCustomTreeView__DropTarget(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomTreeView(Instance).DropTarget);
end;

procedure __DC__SetTCustomTreeView__DropTarget(Instance : TObject; Params : PVariantArgList);
begin
TCustomTreeView(Instance).DropTarget:=TTreeNode(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomTreeView__Selected(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomTreeView(Instance).Selected);
end;

procedure __DC__SetTCustomTreeView__Selected(Instance : TObject; Params : PVariantArgList);
begin
TCustomTreeView(Instance).Selected:=TTreeNode(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomTreeView__TopItem(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomTreeView(Instance).TopItem);
end;

procedure __DC__SetTCustomTreeView__TopItem(Instance : TObject; Params : PVariantArgList);
begin
TCustomTreeView(Instance).TopItem:=TTreeNode(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTDateTimePicker__DateTime(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDateTimePicker(Instance).DateTime;
end;

procedure __DC__SetTDateTimePicker__DateTime(Instance : TObject; Params : PVariantArgList);
begin
TDateTimePicker(Instance).DateTime:=OleVariant(Params^[0]);
end;

function __DC__GetTDateTimePicker__DroppedDown(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDateTimePicker(Instance).DroppedDown;
end;

function __DC__GetTHeaderControl__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(THeaderControl(Instance).Canvas);
end;

function __DC__GetTHeaderSection__Left(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := THeaderSection(Instance).Left;
end;

function __DC__GetTHeaderSection__Right(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := THeaderSection(Instance).Right;
end;

function __DC__GetTHeaderSections__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(THeaderSections(Instance).Items[OleVariant(Params^[0])]);
end;

procedure __DC__SetTHeaderSections__Items(Instance : TObject; Params : PVariantArgList);
begin
THeaderSections(Instance).Items[OleVariant(Params^[1])]:=THeaderSection(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTListColumn__WidthType(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TListColumn(Instance).WidthType;
end;

function __DC__GetTListColumns__Owner(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TListColumns(Instance).Owner);
end;

function __DC__GetTListColumns__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TListColumns(Instance).Items[OleVariant(Params^[0])]);
end;

procedure __DC__SetTListColumns__Items(Instance : TObject; Params : PVariantArgList);
begin
TListColumns(Instance).Items[OleVariant(Params^[1])]:=TListColumn(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTListItem__Caption(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TListItem(Instance).Caption;
end;

procedure __DC__SetTListItem__Caption(Instance : TObject; Params : PVariantArgList);
begin
TListItem(Instance).Caption:=OleVariant(Params^[0]);
end;

function __DC__GetTListItem__Checked(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TListItem(Instance).Checked;
end;

procedure __DC__SetTListItem__Checked(Instance : TObject; Params : PVariantArgList);
begin
TListItem(Instance).Checked:=OleVariant(Params^[0]);
end;

function __DC__GetTListItem__Cut(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TListItem(Instance).Cut;
end;

procedure __DC__SetTListItem__Cut(Instance : TObject; Params : PVariantArgList);
begin
TListItem(Instance).Cut:=OleVariant(Params^[0]);
end;

function __DC__GetTListItem__Data(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(TListItem(Instance).Data);
end;

procedure __DC__SetTListItem__Data(Instance : TObject; Params : PVariantArgList);
begin
TListItem(Instance).Data:=VarToPointer(OleVariant(Params^[0]));
end;

function __DC__GetTListItem__DropTarget(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TListItem(Instance).DropTarget;
end;

procedure __DC__SetTListItem__DropTarget(Instance : TObject; Params : PVariantArgList);
begin
TListItem(Instance).DropTarget:=OleVariant(Params^[0]);
end;

function __DC__GetTListItem__Focused(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TListItem(Instance).Focused;
end;

procedure __DC__SetTListItem__Focused(Instance : TObject; Params : PVariantArgList);
begin
TListItem(Instance).Focused:=OleVariant(Params^[0]);
end;

function __DC__GetTListItem__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TListItem(Instance).Handle;
end;

function __DC__GetTListItem__ImageIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TListItem(Instance).ImageIndex;
end;

procedure __DC__SetTListItem__ImageIndex(Instance : TObject; Params : PVariantArgList);
begin
TListItem(Instance).ImageIndex:=OleVariant(Params^[0]);
end;

function __DC__GetTListItem__Indent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TListItem(Instance).Indent;
end;

procedure __DC__SetTListItem__Indent(Instance : TObject; Params : PVariantArgList);
begin
TListItem(Instance).Indent:=OleVariant(Params^[0]);
end;

function __DC__GetTListItem__Index(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TListItem(Instance).Index;
end;

function __DC__GetTListItem__Left(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TListItem(Instance).Left;
end;

procedure __DC__SetTListItem__Left(Instance : TObject; Params : PVariantArgList);
begin
TListItem(Instance).Left:=OleVariant(Params^[0]);
end;

function __DC__GetTListItem__ListView(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TListItem(Instance).ListView);
end;

function __DC__GetTListItem__Owner(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TListItem(Instance).Owner);
end;

function __DC__GetTListItem__OverlayIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TListItem(Instance).OverlayIndex;
end;

procedure __DC__SetTListItem__OverlayIndex(Instance : TObject; Params : PVariantArgList);
begin
TListItem(Instance).OverlayIndex:=OleVariant(Params^[0]);
end;

function __DC__GetTListItem__Position(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TPoint__Wrapper;
begin
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := TListItem(Instance).Position;
result := IUnknown(__wrapper) as IDispatch;
end;

procedure __DC__SetTListItem__Position(Instance : TObject; Params : PVariantArgList);
var
__idisp:IDispatch;
__iwrapper:IDCRecordWrapper;
begin
__idisp:=DCVarToInterface(OleVariant(Params^[0]));
if __idisp=nil then exit;
__idisp.QueryInterface(IDCRecordWrapper, __iwrapper);
TListItem(Instance).Position:=TPoint(__iwrapper.GetRecordPtr^);
end;

function __DC__GetTListItem__Selected(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TListItem(Instance).Selected;
end;

procedure __DC__SetTListItem__Selected(Instance : TObject; Params : PVariantArgList);
begin
TListItem(Instance).Selected:=OleVariant(Params^[0]);
end;

function __DC__GetTListItem__StateIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TListItem(Instance).StateIndex;
end;

procedure __DC__SetTListItem__StateIndex(Instance : TObject; Params : PVariantArgList);
begin
TListItem(Instance).StateIndex:=OleVariant(Params^[0]);
end;

function __DC__GetTListItem__SubItems(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TListItem(Instance).SubItems);
end;

procedure __DC__SetTListItem__SubItems(Instance : TObject; Params : PVariantArgList);
begin
TListItem(Instance).SubItems:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTListItem__Top(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TListItem(Instance).Top;
end;

procedure __DC__SetTListItem__Top(Instance : TObject; Params : PVariantArgList);
begin
TListItem(Instance).Top:=OleVariant(Params^[0]);
end;

function __DC__GetTListItems__Count(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TListItems(Instance).Count;
end;

procedure __DC__SetTListItems__Count(Instance : TObject; Params : PVariantArgList);
begin
TListItems(Instance).Count:=OleVariant(Params^[0]);
end;

function __DC__GetTListItems__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TListItems(Instance).Handle;
end;

function __DC__GetTListItems__Item(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TListItems(Instance).Item[OleVariant(Params^[0])]);
end;

procedure __DC__SetTListItems__Item(Instance : TObject; Params : PVariantArgList);
begin
TListItems(Instance).Item[OleVariant(Params^[1])]:=TListItem(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTListItems__Owner(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TListItems(Instance).Owner);
end;

function __DC__GetTPageControl__PageCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPageControl(Instance).PageCount;
end;

function __DC__GetTPageControl__Pages(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TPageControl(Instance).Pages[OleVariant(Params^[0])]);
end;

function __DC__GetTParaAttributes__Alignment(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParaAttributes(Instance).Alignment;
end;

procedure __DC__SetTParaAttributes__Alignment(Instance : TObject; Params : PVariantArgList);
begin
TParaAttributes(Instance).Alignment:=OleVariant(Params^[0]);
end;

function __DC__GetTParaAttributes__FirstIndent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParaAttributes(Instance).FirstIndent;
end;

procedure __DC__SetTParaAttributes__FirstIndent(Instance : TObject; Params : PVariantArgList);
begin
TParaAttributes(Instance).FirstIndent:=OleVariant(Params^[0]);
end;

function __DC__GetTParaAttributes__LeftIndent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParaAttributes(Instance).LeftIndent;
end;

procedure __DC__SetTParaAttributes__LeftIndent(Instance : TObject; Params : PVariantArgList);
begin
TParaAttributes(Instance).LeftIndent:=OleVariant(Params^[0]);
end;

function __DC__GetTParaAttributes__Numbering(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParaAttributes(Instance).Numbering;
end;

procedure __DC__SetTParaAttributes__Numbering(Instance : TObject; Params : PVariantArgList);
begin
TParaAttributes(Instance).Numbering:=OleVariant(Params^[0]);
end;

function __DC__GetTParaAttributes__RightIndent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParaAttributes(Instance).RightIndent;
end;

procedure __DC__SetTParaAttributes__RightIndent(Instance : TObject; Params : PVariantArgList);
begin
TParaAttributes(Instance).RightIndent:=OleVariant(Params^[0]);
end;

function __DC__GetTParaAttributes__Tab(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParaAttributes(Instance).Tab[OleVariant(Params^[0])];
end;

procedure __DC__SetTParaAttributes__Tab(Instance : TObject; Params : PVariantArgList);
begin
TParaAttributes(Instance).Tab[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTParaAttributes__TabCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParaAttributes(Instance).TabCount;
end;

procedure __DC__SetTParaAttributes__TabCount(Instance : TObject; Params : PVariantArgList);
begin
TParaAttributes(Instance).TabCount:=OleVariant(Params^[0]);
end;

function __DC__GetTStatusBar__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TStatusBar(Instance).Canvas);
end;

function __DC__GetTStatusPanels__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TStatusPanels(Instance).Items[OleVariant(Params^[0])]);
end;

procedure __DC__SetTStatusPanels__Items(Instance : TObject; Params : PVariantArgList);
begin
TStatusPanels(Instance).Items[OleVariant(Params^[1])]:=TStatusPanel(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTTabControl__DisplayRect(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TRect__Wrapper;
begin
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := TTabControl(Instance).DisplayRect;
result := IUnknown(__wrapper) as IDispatch;
end;

function __DC__GetTTabSheet__PageControl(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TTabSheet(Instance).PageControl);
end;

procedure __DC__SetTTabSheet__PageControl(Instance : TObject; Params : PVariantArgList);
begin
TTabSheet(Instance).PageControl:=TPageControl(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTTabSheet__TabIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTabSheet(Instance).TabIndex;
end;

function __DC__GetTTextAttributes__Charset(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTextAttributes(Instance).Charset;
end;

procedure __DC__SetTTextAttributes__Charset(Instance : TObject; Params : PVariantArgList);
begin
TTextAttributes(Instance).Charset:=OleVariant(Params^[0]);
end;

function __DC__GetTTextAttributes__Color(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTextAttributes(Instance).Color;
end;

procedure __DC__SetTTextAttributes__Color(Instance : TObject; Params : PVariantArgList);
begin
TTextAttributes(Instance).Color:=OleVariant(Params^[0]);
end;

function __DC__GetTTextAttributes__ConsistentAttributes(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TConsistentAttributes;
begin
tmp := TTextAttributes(Instance).ConsistentAttributes;
result := VarFromSet(tmp, sizeof(tmp));
end;

function __DC__GetTTextAttributes__Name(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTextAttributes(Instance).Name;
end;

procedure __DC__SetTTextAttributes__Name(Instance : TObject; Params : PVariantArgList);
begin
TTextAttributes(Instance).Name:=OleVariant(Params^[0]);
end;

function __DC__GetTTextAttributes__Pitch(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTextAttributes(Instance).Pitch;
end;

procedure __DC__SetTTextAttributes__Pitch(Instance : TObject; Params : PVariantArgList);
begin
TTextAttributes(Instance).Pitch:=OleVariant(Params^[0]);
end;

function __DC__GetTTextAttributes__Protected(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTextAttributes(Instance).Protected;
end;

procedure __DC__SetTTextAttributes__Protected(Instance : TObject; Params : PVariantArgList);
begin
TTextAttributes(Instance).Protected:=OleVariant(Params^[0]);
end;

function __DC__GetTTextAttributes__Size(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTextAttributes(Instance).Size;
end;

procedure __DC__SetTTextAttributes__Size(Instance : TObject; Params : PVariantArgList);
begin
TTextAttributes(Instance).Size:=OleVariant(Params^[0]);
end;

function __DC__GetTTextAttributes__Style(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TFontStyles;
begin
tmp := TTextAttributes(Instance).Style;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTTextAttributes__Style(Instance : TObject; Params : PVariantArgList);
var
  tmp : TFontStyles;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TTextAttributes(Instance).Style:=tmp;
end;

function __DC__GetTTextAttributes__Height(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTextAttributes(Instance).Height;
end;

procedure __DC__SetTTextAttributes__Height(Instance : TObject; Params : PVariantArgList);
begin
TTextAttributes(Instance).Height:=OleVariant(Params^[0]);
end;

function __DC__GetTToolBar__ButtonCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TToolBar(Instance).ButtonCount;
end;

function __DC__GetTToolBar__Buttons(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TToolBar(Instance).Buttons[OleVariant(Params^[0])]);
end;

function __DC__GetTToolBar__RowCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TToolBar(Instance).RowCount;
end;

function __DC__GetTToolButton__Index(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TToolButton(Instance).Index;
end;

function __DC__GetTTreeNode__AbsoluteIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTreeNode(Instance).AbsoluteIndex;
end;

function __DC__GetTTreeNode__Count(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTreeNode(Instance).Count;
end;

function __DC__GetTTreeNode__Cut(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTreeNode(Instance).Cut;
end;

procedure __DC__SetTTreeNode__Cut(Instance : TObject; Params : PVariantArgList);
begin
TTreeNode(Instance).Cut:=OleVariant(Params^[0]);
end;

function __DC__GetTTreeNode__Data(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(TTreeNode(Instance).Data);
end;

procedure __DC__SetTTreeNode__Data(Instance : TObject; Params : PVariantArgList);
begin
TTreeNode(Instance).Data:=VarToPointer(OleVariant(Params^[0]));
end;

function __DC__GetTTreeNode__Deleting(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTreeNode(Instance).Deleting;
end;

function __DC__GetTTreeNode__Focused(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTreeNode(Instance).Focused;
end;

procedure __DC__SetTTreeNode__Focused(Instance : TObject; Params : PVariantArgList);
begin
TTreeNode(Instance).Focused:=OleVariant(Params^[0]);
end;

function __DC__GetTTreeNode__DropTarget(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTreeNode(Instance).DropTarget;
end;

procedure __DC__SetTTreeNode__DropTarget(Instance : TObject; Params : PVariantArgList);
begin
TTreeNode(Instance).DropTarget:=OleVariant(Params^[0]);
end;

function __DC__GetTTreeNode__Selected(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTreeNode(Instance).Selected;
end;

procedure __DC__SetTTreeNode__Selected(Instance : TObject; Params : PVariantArgList);
begin
TTreeNode(Instance).Selected:=OleVariant(Params^[0]);
end;

function __DC__GetTTreeNode__Expanded(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTreeNode(Instance).Expanded;
end;

procedure __DC__SetTTreeNode__Expanded(Instance : TObject; Params : PVariantArgList);
begin
TTreeNode(Instance).Expanded:=OleVariant(Params^[0]);
end;

function __DC__GetTTreeNode__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTreeNode(Instance).Handle;
end;

function __DC__GetTTreeNode__HasChildren(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTreeNode(Instance).HasChildren;
end;

procedure __DC__SetTTreeNode__HasChildren(Instance : TObject; Params : PVariantArgList);
begin
TTreeNode(Instance).HasChildren:=OleVariant(Params^[0]);
end;

function __DC__GetTTreeNode__ImageIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTreeNode(Instance).ImageIndex;
end;

procedure __DC__SetTTreeNode__ImageIndex(Instance : TObject; Params : PVariantArgList);
begin
TTreeNode(Instance).ImageIndex:=OleVariant(Params^[0]);
end;

function __DC__GetTTreeNode__Index(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTreeNode(Instance).Index;
end;

function __DC__GetTTreeNode__IsVisible(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTreeNode(Instance).IsVisible;
end;

function __DC__GetTTreeNode__Item(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TTreeNode(Instance).Item[OleVariant(Params^[0])]);
end;

procedure __DC__SetTTreeNode__Item(Instance : TObject; Params : PVariantArgList);
begin
TTreeNode(Instance).Item[OleVariant(Params^[1])]:=TTreeNode(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTTreeNode__Level(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTreeNode(Instance).Level;
end;

function __DC__GetTTreeNode__OverlayIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTreeNode(Instance).OverlayIndex;
end;

procedure __DC__SetTTreeNode__OverlayIndex(Instance : TObject; Params : PVariantArgList);
begin
TTreeNode(Instance).OverlayIndex:=OleVariant(Params^[0]);
end;

function __DC__GetTTreeNode__Owner(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TTreeNode(Instance).Owner);
end;

function __DC__GetTTreeNode__Parent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TTreeNode(Instance).Parent);
end;

function __DC__GetTTreeNode__SelectedIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTreeNode(Instance).SelectedIndex;
end;

procedure __DC__SetTTreeNode__SelectedIndex(Instance : TObject; Params : PVariantArgList);
begin
TTreeNode(Instance).SelectedIndex:=OleVariant(Params^[0]);
end;

function __DC__GetTTreeNode__StateIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTreeNode(Instance).StateIndex;
end;

procedure __DC__SetTTreeNode__StateIndex(Instance : TObject; Params : PVariantArgList);
begin
TTreeNode(Instance).StateIndex:=OleVariant(Params^[0]);
end;

function __DC__GetTTreeNode__Text(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTreeNode(Instance).Text;
end;

procedure __DC__SetTTreeNode__Text(Instance : TObject; Params : PVariantArgList);
begin
TTreeNode(Instance).Text:=OleVariant(Params^[0]);
end;

function __DC__GetTTreeNode__TreeView(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TTreeNode(Instance).TreeView);
end;

function __DC__GetTTreeNodes__Count(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTreeNodes(Instance).Count;
end;

function __DC__GetTTreeNodes__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTreeNodes(Instance).Handle;
end;

function __DC__GetTTreeNodes__Item(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TTreeNodes(Instance).Item[OleVariant(Params^[0])]);
end;

function __DC__GetTTreeNodes__Owner(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TTreeNodes(Instance).Owner);
end;

procedure __RegisterProps;
begin
RegisterProperty(TAnimate,'FrameCount',__DC__GetTAnimate__FrameCount,nil);
RegisterProperty(TAnimate,'FrameHeight',__DC__GetTAnimate__FrameHeight,nil);
RegisterProperty(TAnimate,'FrameWidth',__DC__GetTAnimate__FrameWidth,nil);
RegisterProperty(TAnimate,'Open',__DC__GetTAnimate__Open,__DC__SetTAnimate__Open);
RegisterProperty(TAnimate,'ResHandle',__DC__GetTAnimate__ResHandle,__DC__SetTAnimate__ResHandle);
RegisterProperty(TAnimate,'ResId',__DC__GetTAnimate__ResId,__DC__SetTAnimate__ResId);
RegisterProperty(TAnimate,'ResName',__DC__GetTAnimate__ResName,__DC__SetTAnimate__ResName);
RegisterProperty(TCoolBand,'Height',__DC__GetTCoolBand__Height,nil);
RegisterProperty(TCoolBands,'CoolBar',__DC__GetTCoolBands__CoolBar,nil);
RegisterIndexedProperty(TCoolBands,'Items',1,True,__DC__GetTCoolBands__Items,__DC__SetTCoolBands__Items);
RegisterProperty(TCustomListView,'Canvas',__DC__GetTCustomListView__Canvas,nil);
RegisterProperty(TCustomListView,'Checkboxes',__DC__GetTCustomListView__Checkboxes,__DC__SetTCustomListView__Checkboxes);
RegisterIndexedProperty(TCustomListView,'Column',1,False,__DC__GetTCustomListView__Column,nil);
RegisterProperty(TCustomListView,'DropTarget',__DC__GetTCustomListView__DropTarget,__DC__SetTCustomListView__DropTarget);
RegisterProperty(TCustomListView,'FlatScrollBars',__DC__GetTCustomListView__FlatScrollBars,__DC__SetTCustomListView__FlatScrollBars);
RegisterProperty(TCustomListView,'FullDrag',__DC__GetTCustomListView__FullDrag,__DC__SetTCustomListView__FullDrag);
RegisterProperty(TCustomListView,'GridLines',__DC__GetTCustomListView__GridLines,__DC__SetTCustomListView__GridLines);
RegisterProperty(TCustomListView,'HotTrack',__DC__GetTCustomListView__HotTrack,__DC__SetTCustomListView__HotTrack);
RegisterProperty(TCustomListView,'HotTrackStyles',__DC__GetTCustomListView__HotTrackStyles,__DC__SetTCustomListView__HotTrackStyles);
RegisterProperty(TCustomListView,'ItemFocused',__DC__GetTCustomListView__ItemFocused,__DC__SetTCustomListView__ItemFocused);
RegisterProperty(TCustomListView,'RowSelect',__DC__GetTCustomListView__RowSelect,__DC__SetTCustomListView__RowSelect);
RegisterProperty(TCustomListView,'SelCount',__DC__GetTCustomListView__SelCount,nil);
RegisterProperty(TCustomListView,'Selected',__DC__GetTCustomListView__Selected,__DC__SetTCustomListView__Selected);
RegisterProperty(TCustomListView,'TopItem',__DC__GetTCustomListView__TopItem,nil);
RegisterProperty(TCustomListView,'ViewOrigin',__DC__GetTCustomListView__ViewOrigin,nil);
RegisterProperty(TCustomListView,'VisibleRowCount',__DC__GetTCustomListView__VisibleRowCount,nil);
RegisterProperty(TCustomListView,'BoundingRect',__DC__GetTCustomListView__BoundingRect,nil);
RegisterProperty(TCustomRichEdit,'DefAttributes',__DC__GetTCustomRichEdit__DefAttributes,__DC__SetTCustomRichEdit__DefAttributes);
RegisterProperty(TCustomRichEdit,'SelAttributes',__DC__GetTCustomRichEdit__SelAttributes,__DC__SetTCustomRichEdit__SelAttributes);
RegisterProperty(TCustomRichEdit,'PageRect',__DC__GetTCustomRichEdit__PageRect,__DC__SetTCustomRichEdit__PageRect);
RegisterProperty(TCustomRichEdit,'Paragraph',__DC__GetTCustomRichEdit__Paragraph,nil);
RegisterProperty(TCustomTabControl,'Canvas',__DC__GetTCustomTabControl__Canvas,nil);
RegisterProperty(TCustomTabControl,'TabStop',__DC__GetTCustomTabControl__TabStop,__DC__SetTCustomTabControl__TabStop);
RegisterProperty(TCustomTreeView,'Canvas',__DC__GetTCustomTreeView__Canvas,nil);
RegisterProperty(TCustomTreeView,'DropTarget',__DC__GetTCustomTreeView__DropTarget,__DC__SetTCustomTreeView__DropTarget);
RegisterProperty(TCustomTreeView,'Selected',__DC__GetTCustomTreeView__Selected,__DC__SetTCustomTreeView__Selected);
RegisterProperty(TCustomTreeView,'TopItem',__DC__GetTCustomTreeView__TopItem,__DC__SetTCustomTreeView__TopItem);
RegisterProperty(TDateTimePicker,'DateTime',__DC__GetTDateTimePicker__DateTime,__DC__SetTDateTimePicker__DateTime);
RegisterProperty(TDateTimePicker,'DroppedDown',__DC__GetTDateTimePicker__DroppedDown,nil);
RegisterProperty(THeaderControl,'Canvas',__DC__GetTHeaderControl__Canvas,nil);
RegisterProperty(THeaderSection,'Left',__DC__GetTHeaderSection__Left,nil);
RegisterProperty(THeaderSection,'Right',__DC__GetTHeaderSection__Right,nil);
RegisterIndexedProperty(THeaderSections,'Items',1,True,__DC__GetTHeaderSections__Items,__DC__SetTHeaderSections__Items);
RegisterProperty(TListColumn,'WidthType',__DC__GetTListColumn__WidthType,nil);
RegisterProperty(TListColumns,'Owner',__DC__GetTListColumns__Owner,nil);
RegisterIndexedProperty(TListColumns,'Items',1,True,__DC__GetTListColumns__Items,__DC__SetTListColumns__Items);
RegisterProperty(TListItem,'Caption',__DC__GetTListItem__Caption,__DC__SetTListItem__Caption);
RegisterProperty(TListItem,'Checked',__DC__GetTListItem__Checked,__DC__SetTListItem__Checked);
RegisterProperty(TListItem,'Cut',__DC__GetTListItem__Cut,__DC__SetTListItem__Cut);
RegisterProperty(TListItem,'Data',__DC__GetTListItem__Data,__DC__SetTListItem__Data);
RegisterProperty(TListItem,'DropTarget',__DC__GetTListItem__DropTarget,__DC__SetTListItem__DropTarget);
RegisterProperty(TListItem,'Focused',__DC__GetTListItem__Focused,__DC__SetTListItem__Focused);
RegisterProperty(TListItem,'Handle',__DC__GetTListItem__Handle,nil);
RegisterProperty(TListItem,'ImageIndex',__DC__GetTListItem__ImageIndex,__DC__SetTListItem__ImageIndex);
RegisterProperty(TListItem,'Indent',__DC__GetTListItem__Indent,__DC__SetTListItem__Indent);
RegisterProperty(TListItem,'Index',__DC__GetTListItem__Index,nil);
RegisterProperty(TListItem,'Left',__DC__GetTListItem__Left,__DC__SetTListItem__Left);
RegisterProperty(TListItem,'ListView',__DC__GetTListItem__ListView,nil);
RegisterProperty(TListItem,'Owner',__DC__GetTListItem__Owner,nil);
RegisterProperty(TListItem,'OverlayIndex',__DC__GetTListItem__OverlayIndex,__DC__SetTListItem__OverlayIndex);
RegisterProperty(TListItem,'Position',__DC__GetTListItem__Position,__DC__SetTListItem__Position);
RegisterProperty(TListItem,'Selected',__DC__GetTListItem__Selected,__DC__SetTListItem__Selected);
RegisterProperty(TListItem,'StateIndex',__DC__GetTListItem__StateIndex,__DC__SetTListItem__StateIndex);
RegisterProperty(TListItem,'SubItems',__DC__GetTListItem__SubItems,__DC__SetTListItem__SubItems);
RegisterProperty(TListItem,'Top',__DC__GetTListItem__Top,__DC__SetTListItem__Top);
RegisterProperty(TListItems,'Count',__DC__GetTListItems__Count,__DC__SetTListItems__Count);
RegisterProperty(TListItems,'Handle',__DC__GetTListItems__Handle,nil);
RegisterIndexedProperty(TListItems,'Item',1,True,__DC__GetTListItems__Item,__DC__SetTListItems__Item);
RegisterProperty(TListItems,'Owner',__DC__GetTListItems__Owner,nil);
RegisterProperty(TPageControl,'PageCount',__DC__GetTPageControl__PageCount,nil);
RegisterIndexedProperty(TPageControl,'Pages',1,False,__DC__GetTPageControl__Pages,nil);
RegisterProperty(TParaAttributes,'Alignment',__DC__GetTParaAttributes__Alignment,__DC__SetTParaAttributes__Alignment);
RegisterProperty(TParaAttributes,'FirstIndent',__DC__GetTParaAttributes__FirstIndent,__DC__SetTParaAttributes__FirstIndent);
RegisterProperty(TParaAttributes,'LeftIndent',__DC__GetTParaAttributes__LeftIndent,__DC__SetTParaAttributes__LeftIndent);
RegisterProperty(TParaAttributes,'Numbering',__DC__GetTParaAttributes__Numbering,__DC__SetTParaAttributes__Numbering);
RegisterProperty(TParaAttributes,'RightIndent',__DC__GetTParaAttributes__RightIndent,__DC__SetTParaAttributes__RightIndent);
RegisterIndexedProperty(TParaAttributes,'Tab',1,False,__DC__GetTParaAttributes__Tab,__DC__SetTParaAttributes__Tab);
RegisterProperty(TParaAttributes,'TabCount',__DC__GetTParaAttributes__TabCount,__DC__SetTParaAttributes__TabCount);
RegisterProperty(TStatusBar,'Canvas',__DC__GetTStatusBar__Canvas,nil);
RegisterIndexedProperty(TStatusPanels,'Items',1,True,__DC__GetTStatusPanels__Items,__DC__SetTStatusPanels__Items);
RegisterProperty(TTabControl,'DisplayRect',__DC__GetTTabControl__DisplayRect,nil);
RegisterProperty(TTabSheet,'PageControl',__DC__GetTTabSheet__PageControl,__DC__SetTTabSheet__PageControl);
RegisterProperty(TTabSheet,'TabIndex',__DC__GetTTabSheet__TabIndex,nil);
RegisterProperty(TTextAttributes,'Charset',__DC__GetTTextAttributes__Charset,__DC__SetTTextAttributes__Charset);
RegisterProperty(TTextAttributes,'Color',__DC__GetTTextAttributes__Color,__DC__SetTTextAttributes__Color);
RegisterProperty(TTextAttributes,'ConsistentAttributes',__DC__GetTTextAttributes__ConsistentAttributes,nil);
RegisterProperty(TTextAttributes,'Name',__DC__GetTTextAttributes__Name,__DC__SetTTextAttributes__Name);
RegisterProperty(TTextAttributes,'Pitch',__DC__GetTTextAttributes__Pitch,__DC__SetTTextAttributes__Pitch);
RegisterProperty(TTextAttributes,'Protected',__DC__GetTTextAttributes__Protected,__DC__SetTTextAttributes__Protected);
RegisterProperty(TTextAttributes,'Size',__DC__GetTTextAttributes__Size,__DC__SetTTextAttributes__Size);
RegisterProperty(TTextAttributes,'Style',__DC__GetTTextAttributes__Style,__DC__SetTTextAttributes__Style);
RegisterProperty(TTextAttributes,'Height',__DC__GetTTextAttributes__Height,__DC__SetTTextAttributes__Height);
RegisterProperty(TToolBar,'ButtonCount',__DC__GetTToolBar__ButtonCount,nil);
RegisterIndexedProperty(TToolBar,'Buttons',1,False,__DC__GetTToolBar__Buttons,nil);
RegisterProperty(TToolBar,'RowCount',__DC__GetTToolBar__RowCount,nil);
RegisterProperty(TToolButton,'Index',__DC__GetTToolButton__Index,nil);
RegisterProperty(TTreeNode,'AbsoluteIndex',__DC__GetTTreeNode__AbsoluteIndex,nil);
RegisterProperty(TTreeNode,'Count',__DC__GetTTreeNode__Count,nil);
RegisterProperty(TTreeNode,'Cut',__DC__GetTTreeNode__Cut,__DC__SetTTreeNode__Cut);
RegisterProperty(TTreeNode,'Data',__DC__GetTTreeNode__Data,__DC__SetTTreeNode__Data);
RegisterProperty(TTreeNode,'Deleting',__DC__GetTTreeNode__Deleting,nil);
RegisterProperty(TTreeNode,'Focused',__DC__GetTTreeNode__Focused,__DC__SetTTreeNode__Focused);
RegisterProperty(TTreeNode,'DropTarget',__DC__GetTTreeNode__DropTarget,__DC__SetTTreeNode__DropTarget);
RegisterProperty(TTreeNode,'Selected',__DC__GetTTreeNode__Selected,__DC__SetTTreeNode__Selected);
RegisterProperty(TTreeNode,'Expanded',__DC__GetTTreeNode__Expanded,__DC__SetTTreeNode__Expanded);
RegisterProperty(TTreeNode,'Handle',__DC__GetTTreeNode__Handle,nil);
RegisterProperty(TTreeNode,'HasChildren',__DC__GetTTreeNode__HasChildren,__DC__SetTTreeNode__HasChildren);
RegisterProperty(TTreeNode,'ImageIndex',__DC__GetTTreeNode__ImageIndex,__DC__SetTTreeNode__ImageIndex);
RegisterProperty(TTreeNode,'Index',__DC__GetTTreeNode__Index,nil);
RegisterProperty(TTreeNode,'IsVisible',__DC__GetTTreeNode__IsVisible,nil);
RegisterIndexedProperty(TTreeNode,'Item',1,True,__DC__GetTTreeNode__Item,__DC__SetTTreeNode__Item);
RegisterProperty(TTreeNode,'Level',__DC__GetTTreeNode__Level,nil);
RegisterProperty(TTreeNode,'OverlayIndex',__DC__GetTTreeNode__OverlayIndex,__DC__SetTTreeNode__OverlayIndex);
RegisterProperty(TTreeNode,'Owner',__DC__GetTTreeNode__Owner,nil);
RegisterProperty(TTreeNode,'Parent',__DC__GetTTreeNode__Parent,nil);
RegisterProperty(TTreeNode,'SelectedIndex',__DC__GetTTreeNode__SelectedIndex,__DC__SetTTreeNode__SelectedIndex);
RegisterProperty(TTreeNode,'StateIndex',__DC__GetTTreeNode__StateIndex,__DC__SetTTreeNode__StateIndex);
RegisterProperty(TTreeNode,'Text',__DC__GetTTreeNode__Text,__DC__SetTTreeNode__Text);
RegisterProperty(TTreeNode,'TreeView',__DC__GetTTreeNode__TreeView,nil);
RegisterProperty(TTreeNodes,'Count',__DC__GetTTreeNodes__Count,nil);
RegisterProperty(TTreeNodes,'Handle',__DC__GetTTreeNodes__Handle,nil);
RegisterIndexedProperty(TTreeNodes,'Item',1,True,__DC__GetTTreeNodes__Item,nil);
RegisterProperty(TTreeNodes,'Owner',__DC__GetTTreeNodes__Owner,nil);
end;

const __ConstNames0 : array[0..204] of string = (
'tpTop'
,'tpBottom'
,'tpLeft'
,'tpRight'
,'tsTabs'
,'tsButtons'
,'tsFlatButtons'
,'psText'
,'psOwnerDraw'
,'pbNone'
,'pbLowered'
,'pbRaised'
,'dtControl'
,'dtItem'
,'dtSubItem'
,'cdPrePaint'
,'cdPostPaint'
,'cdPreErase'
,'cdPostErase'
,'cdsSelected'
,'cdsGrayed'
,'cdsDisabled'
,'cdsChecked'
,'cdsFocused'
,'cdsDefault'
,'cdsHot'
,'cdsMarked'
,'cdsIndeterminate'
,'hsText'
,'hsOwnerDraw'
,'tsTrackBegin'
,'tsTrackMove'
,'tsTrackEnd'
,'hsButtons'
,'hsFlat'
,'nsCut'
,'nsDropHilited'
,'nsFocused'
,'nsSelected'
,'nsExpanded'
,'naAdd'
,'naAddFirst'
,'naAddChild'
,'naAddChildFirst'
,'naInsert'
,'taAddFirst'
,'taAdd'
,'taInsert'
,'htAbove'
,'htBelow'
,'htNowhere'
,'htOnItem'
,'htOnButton'
,'htOnIcon'
,'htOnIndent'
,'htOnLabel'
,'htOnRight'
,'htOnStateIcon'
,'htToLeft'
,'htToRight'
,'stNone'
,'stData'
,'stText'
,'stBoth'
,'trHorizontal'
,'trVertical'
,'tmBottomRight'
,'tmTopLeft'
,'tmBoth'
,'tsNone'
,'tsAuto'
,'tsManual'
,'pbHorizontal'
,'pbVertical'
,'atSelected'
,'atDefaultText'
,'caBold'
,'caColor'
,'caFace'
,'caItalic'
,'caSize'
,'caStrikeOut'
,'caUnderline'
,'caProtected'
,'nsNone'
,'nsBullet'
,'stWholeWord'
,'stMatchCase'
,'udLeft'
,'udRight'
,'udHorizontal'
,'udVertical'
,'btNext'
,'btPrev'
,'hkShift'
,'hkCtrl'
,'hkAlt'
,'hkExt'
,'hcNone'
,'hcShift'
,'hcCtrl'
,'hcAlt'
,'hcShiftCtrl'
,'hcShiftAlt'
,'hcCtrlAlt'
,'hcShiftCtrlAlt'
,'ColumnHeaderWidth'
,'ColumnTextWidth'
,'drBounds'
,'drIcon'
,'drLabel'
,'drSelectBounds'
,'iaTop'
,'iaLeft'
,'arAlignBottom'
,'arAlignLeft'
,'arAlignRight'
,'arAlignTop'
,'arDefault'
,'arSnapToGrid'
,'vsIcon'
,'vsSmallIcon'
,'vsList'
,'vsReport'
,'isNone'
,'isCut'
,'isDropHilited'
,'isFocused'
,'isSelected'
,'isActivating'
,'ctText'
,'ctImage'
,'ctState'
,'ifData'
,'ifPartialString'
,'ifExactString'
,'ifNearest'
,'sdLeft'
,'sdRight'
,'sdAbove'
,'sdBelow'
,'sdAll'
,'htHandPoint'
,'htUnderlineCold'
,'htUnderlineHot'
,'irText'
,'irImage'
,'irParam'
,'irState'
,'irIndent'
,'aviNone'
,'aviFindFolder'
,'aviFindFile'
,'aviFindComputer'
,'aviCopyFiles'
,'aviCopyFile'
,'aviRecycleFile'
,'aviEmptyRecycle'
,'aviDeleteFile'
,'CN_DROPDOWNCLOSED'
,'tbsButton'
,'tbsCheck'
,'tbsDropDown'
,'tbsSeparator'
,'tbsDivider'
,'tbsChecked'
,'tbsPressed'
,'tbsEnabled'
,'tbsHidden'
,'tbsIndeterminate'
,'tbsWrap'
,'tbsEllipses'
,'tbsMarked'
,'CN_BANDCHANGE'
,'bmNone'
,'bmClick'
,'bmDblClick'
,'dowMonday'
,'dowTuesday'
,'dowWednesday'
,'dowThursday'
,'dowFriday'
,'dowSaturday'
,'dowSunday'
,'dowLocaleDefault'
,'dtkDate'
,'dtkTime'
,'dmComboBox'
,'dmUpDown'
,'dfShort'
,'dfLong'
,'dtaLeft'
,'dtaRight'
,'soHorizontal'
,'soVertical'
,'sbFirst'
,'sbLast'
,'bsNormal'
,'bsInvisible'
,'bsGrayed'
,'bsDepressed'
,'bsHot'
,'ComCtlVersionIE3'
,'ComCtlVersionIE4'
,'ComCtlVersionIE401'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,tpTop));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,tpBottom));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,tpLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,tpRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,tsTabs));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,tsButtons));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,tsFlatButtons));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,psText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,psOwnerDraw));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,pbNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,pbLowered));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,pbRaised));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,dtControl));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,dtItem));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,dtSubItem));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,cdPrePaint));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,cdPostPaint));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,cdPreErase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,cdPostErase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,cdsSelected));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,cdsGrayed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,cdsDisabled));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,cdsChecked));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,cdsFocused));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,cdsDefault));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,cdsHot));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,cdsMarked));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,cdsIndeterminate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,hsText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,hsOwnerDraw));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,tsTrackBegin));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,tsTrackMove));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,tsTrackEnd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,hsButtons));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,hsFlat));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,nsCut));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,nsDropHilited));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,nsFocused));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,nsSelected));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,nsExpanded));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,naAdd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,naAddFirst));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,naAddChild));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,naAddChildFirst));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,naInsert));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,taAddFirst));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,taAdd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,taInsert));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[48] ,htAbove));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[49] ,htBelow));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[50] ,htNowhere));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[51] ,htOnItem));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[52] ,htOnButton));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[53] ,htOnIcon));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[54] ,htOnIndent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[55] ,htOnLabel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[56] ,htOnRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[57] ,htOnStateIcon));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[58] ,htToLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[59] ,htToRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[60] ,stNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[61] ,stData));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[62] ,stText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[63] ,stBoth));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[64] ,trHorizontal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[65] ,trVertical));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[66] ,tmBottomRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[67] ,tmTopLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[68] ,tmBoth));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[69] ,tsNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[70] ,tsAuto));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[71] ,tsManual));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[72] ,pbHorizontal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[73] ,pbVertical));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[74] ,atSelected));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[75] ,atDefaultText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[76] ,caBold));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[77] ,caColor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[78] ,caFace));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[79] ,caItalic));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[80] ,caSize));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[81] ,caStrikeOut));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[82] ,caUnderline));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[83] ,caProtected));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[84] ,nsNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[85] ,nsBullet));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[86] ,stWholeWord));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[87] ,stMatchCase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[88] ,udLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[89] ,udRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[90] ,udHorizontal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[91] ,udVertical));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[92] ,btNext));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[93] ,btPrev));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[94] ,hkShift));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[95] ,hkCtrl));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[96] ,hkAlt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[97] ,hkExt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[98] ,hcNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[99] ,hcShift));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[100] ,hcCtrl));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[101] ,hcAlt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[102] ,hcShiftCtrl));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[103] ,hcShiftAlt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[104] ,hcCtrlAlt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[105] ,hcShiftCtrlAlt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[106] ,ColumnHeaderWidth));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[107] ,ColumnTextWidth));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[108] ,drBounds));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[109] ,drIcon));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[110] ,drLabel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[111] ,drSelectBounds));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[112] ,iaTop));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[113] ,iaLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[114] ,arAlignBottom));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[115] ,arAlignLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[116] ,arAlignRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[117] ,arAlignTop));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[118] ,arDefault));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[119] ,arSnapToGrid));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[120] ,vsIcon));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[121] ,vsSmallIcon));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[122] ,vsList));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[123] ,vsReport));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[124] ,isNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[125] ,isCut));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[126] ,isDropHilited));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[127] ,isFocused));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[128] ,isSelected));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[129] ,isActivating));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[130] ,ctText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[131] ,ctImage));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[132] ,ctState));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[133] ,ifData));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[134] ,ifPartialString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[135] ,ifExactString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[136] ,ifNearest));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[137] ,sdLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[138] ,sdRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[139] ,sdAbove));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[140] ,sdBelow));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[141] ,sdAll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[142] ,htHandPoint));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[143] ,htUnderlineCold));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[144] ,htUnderlineHot));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[145] ,irText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[146] ,irImage));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[147] ,irParam));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[148] ,irState));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[149] ,irIndent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[150] ,aviNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[151] ,aviFindFolder));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[152] ,aviFindFile));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[153] ,aviFindComputer));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[154] ,aviCopyFiles));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[155] ,aviCopyFile));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[156] ,aviRecycleFile));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[157] ,aviEmptyRecycle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[158] ,aviDeleteFile));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[159] ,CN_DROPDOWNCLOSED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[160] ,tbsButton));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[161] ,tbsCheck));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[162] ,tbsDropDown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[163] ,tbsSeparator));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[164] ,tbsDivider));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[165] ,tbsChecked));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[166] ,tbsPressed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[167] ,tbsEnabled));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[168] ,tbsHidden));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[169] ,tbsIndeterminate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[170] ,tbsWrap));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[171] ,tbsEllipses));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[172] ,tbsMarked));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[173] ,CN_BANDCHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[174] ,bmNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[175] ,bmClick));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[176] ,bmDblClick));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[177] ,dowMonday));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[178] ,dowTuesday));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[179] ,dowWednesday));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[180] ,dowThursday));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[181] ,dowFriday));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[182] ,dowSaturday));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[183] ,dowSunday));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[184] ,dowLocaleDefault));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[185] ,dtkDate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[186] ,dtkTime));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[187] ,dmComboBox));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[188] ,dmUpDown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[189] ,dfShort));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[190] ,dfLong));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[191] ,dtaLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[192] ,dtaRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[193] ,soHorizontal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[194] ,soVertical));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[195] ,sbFirst));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[196] ,sbLast));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[197] ,bsNormal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[198] ,bsInvisible));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[199] ,bsGrayed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[200] ,bsDepressed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[201] ,bsHot));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[202] ,ComCtlVersionIE3));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[203] ,ComCtlVersionIE4));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[204] ,ComCtlVersionIE401));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..49] of TClass = (
ECommonCalendarError,
EDateTimeError,
EMonthCalError,
ETreeViewError,
TAnimate,
TCommonCalendar,
TConversion,
TCoolBand,
TCoolBands,
TCoolBar,
TCustomHotKey,
TCustomListView,
TCustomRichEdit,
TCustomTabControl,
TCustomTreeView,
TCustomUpDown,
TDateTimeColors,
TDateTimePicker,
THeaderControl,
THeaderSection,
THeaderSections,
THotKey,
TIconOptions,
TListColumn,
TListColumns,
TListItem,
TListItems,
TListView,
TMonthCalColors,
TMonthCalendar,
TPageControl,
TPageScroller,
TParaAttributes,
TProgressBar,
TRichEdit,
TStatusBar,
TStatusPanel,
TStatusPanels,
TTabControl,
TTabSheet,
TTextAttributes,
TToolBar,
TToolBarDockObject,
TToolButton,
TToolButtonActionLink,
TTrackBar,
TTreeNode,
TTreeNodes,
TTreeView,
TUpDown
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..7] of string = (
'TConversionFormat'
,'TNodeCache'
,'TNodeInfo'
,'TRichEditStreamInfo'
,'InitCommonControl'
,'CheckCommonControl'
,'GetComCtlVersion'
,'CheckToolMenuDropdown'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TConversionFormat_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(_TNodeCache_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[2],Addr(_TNodeInfo_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[3],Addr(_TRichEditStreamInfo_)));
RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T0),[
TypeInfo(Integer),TypeInfo(Boolean)],Addr(InitCommonControl),cRegister);

RegisterProc(nil,MethodNames[5],mtProc,TypeInfo(_T1),[
TypeInfo(Integer)],Addr(CheckCommonControl),cRegister);

RegisterProc(nil,MethodNames[6],mtProc,TypeInfo(_T2),[TypeInfo(Integer)],Addr(GetComCtlVersion),cRegister);

RegisterProc(nil,MethodNames[7],mtProc,TypeInfo(_T3),[
TypeInfo(TToolButton)],Addr(CheckToolMenuDropdown),cRegister);

RegRegisterMethod(TAnimate,'DoOpen',TypeInfo(_T4),NoParams, pointer(184));

RegRegisterMethod(TAnimate,'DoClose',TypeInfo(_T5),NoParams, pointer(188));

RegRegisterMethod(TAnimate,'DoStart',TypeInfo(_T6),NoParams, pointer(192));

RegRegisterMethod(TAnimate,'DoStop',TypeInfo(_T7),NoParams, pointer(196));

RegRegisterMethod(TAnimate,'Play',TypeInfo(_T8),[
TypeInfo(Word),
TypeInfo(Word),
TypeInfo(Integer)],Addr(TAnimate.Play));

RegRegisterMethod(TAnimate,'Reset',TypeInfo(_T9),NoParams,Addr(TAnimate.Reset));

RegRegisterMethod(TAnimate,'Seek',TypeInfo(_T10),[
TypeInfo(SmallInt)],Addr(TAnimate.Seek));

RegRegisterMethod(TAnimate,'Stop',TypeInfo(_T11),NoParams,Addr(TAnimate.Stop));

RegRegisterMethod(TCommonCalendar,'CheckEmptyDate',TypeInfo(_T12),NoParams, pointer(184));

RegRegisterMethod(TCommonCalendar,'CheckValidDate',TypeInfo(_T13),[
TypeInfo(TDate)], pointer(188));

RegRegisterMethod(TCommonCalendar,'GetCalendarHandle',TypeInfo(_T14),[TypeInfo(HWND)], pointer(192));

RegRegisterMethod(TCommonCalendar,'GetCalStyles',TypeInfo(_T15),[TypeInfo(DWORD)], pointer(196));

RegRegisterMethod(TCommonCalendar,'MsgSetCalColors',TypeInfo(_T16),[
TypeInfo(Integer),
TypeInfo(TColor),TypeInfo(Boolean)], pointer(200));

RegRegisterMethod(TCommonCalendar,'MsgSetDateTime',TypeInfo(_T17),[
TypeInfo(IDispatch),TypeInfo(Boolean)], pointer(204));

RegRegisterMethod(TCommonCalendar,'BoldDays',TypeInfo(_T19),[
ArrayInfo(TypeInfo(LongWord)),
TypeInfo(LongWord)],Addr(TCommonCalendar.BoldDays));

RegRegisterMethod(TCoolBand,'ParentColorChanged',TypeInfo(_T22),NoParams, pointer(MinVMTOffset - 2));

RegRegisterMethod(TCoolBand,'ParentBitmapChanged',TypeInfo(_T23),NoParams, pointer(MinVMTOffset - 3));

RegisterProc(TCoolBands,'Create',mtConstructor,TypeInfo(_T24),[
TypeInfo(TCoolBar)],Addr(TCoolBands.Create),cRegister);

RegRegisterMethod(TCoolBands,'Add',TypeInfo(_T25),[TypeInfo(TCoolBand)],Addr(TCoolBands.Add));

RegRegisterMethod(TCoolBands,'FindBand',TypeInfo(_T26),[
TypeInfo(TControl),TypeInfo(TCoolBand)],Addr(TCoolBands.FindBand));

RegRegisterMethod(TCoolBar,'Change',TypeInfo(_T27),NoParams, pointer(MinVMTOffset - 71));

RegRegisterMethod(TCustomListView,'CanChange',TypeInfo(_T28),[
TypeInfo(TListItem),
TypeInfo(Integer),TypeInfo(Boolean)], pointer(MinVMTOffset - 71));

RegRegisterMethod(TCustomListView,'CanEdit',TypeInfo(_T29),[
TypeInfo(TListItem),TypeInfo(Boolean)], pointer(MinVMTOffset - 72));

RegRegisterMethod(TCustomListView,'Change',TypeInfo(_T30),[
TypeInfo(TListItem),
TypeInfo(Integer)], pointer(MinVMTOffset - 73));

RegRegisterMethod(TCustomListView,'ColClick',TypeInfo(_T31),[
TypeInfo(TListColumn)], pointer(MinVMTOffset - 74));

RegRegisterMethod(TCustomListView,'CreateListItem',TypeInfo(_T32),[TypeInfo(TListItem)], pointer(184));

RegRegisterMethod(TCustomListView,'CustomDraw',TypeInfo(_T33),[
TypeInfo(IDispatch),
TypeInfo(TCustomDrawStage),TypeInfo(Boolean)], pointer(188));

RegRegisterMethod(TCustomListView,'CustomDrawItem',TypeInfo(_T34),[
TypeInfo(TListItem),
TypeInfo(TCustomDrawState),
TypeInfo(TCustomDrawStage),TypeInfo(Boolean)], pointer(192));

RegRegisterMethod(TCustomListView,'CustomDrawSubItem',TypeInfo(_T35),[
TypeInfo(TListItem),
TypeInfo(Integer),
TypeInfo(TCustomDrawState),
TypeInfo(TCustomDrawStage),TypeInfo(Boolean)], pointer(196));

RegRegisterMethod(TCustomListView,'Delete',TypeInfo(_T36),[
TypeInfo(TListItem)], pointer(MinVMTOffset - 75));

RegRegisterMethod(TCustomListView,'DrawItem',TypeInfo(_T37),[
TypeInfo(TListItem),
TypeInfo(IDispatch),
TypeInfo(TOwnerDrawState)], pointer(200));

RegRegisterMethod(TCustomListView,'Edit',TypeInfo(_T38),[
TypeInfo(IDispatch)], pointer(MinVMTOffset - 76));

RegRegisterMethod(TCustomListView,'OwnerDataFetch',TypeInfo(_T39),[
TypeInfo(TListItem),
TypeInfo(TItemRequest),TypeInfo(Boolean)], pointer(204));

RegRegisterMethod(TCustomListView,'OwnerDataFind',TypeInfo(_T40),[
TypeInfo(TItemFind),
TypeInfo(string),
TypeInfo(IDispatch),
TypeInfoPointer,
TypeInfo(Integer),
TypeInfo(TSearchDirection),
TypeInfo(Boolean),TypeInfo(Integer)], pointer(208));

RegRegisterMethod(TCustomListView,'OwnerDataHint',TypeInfo(_T41),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Boolean)], pointer(212));

RegRegisterMethod(TCustomListView,'OwnerDataStateChange',TypeInfo(_T42),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TItemStates),
TypeInfo(TItemStates),TypeInfo(Boolean)], pointer(216));

RegRegisterMethod(TCustomListView,'InsertItem',TypeInfo(_T43),[
TypeInfo(TListItem)], pointer(MinVMTOffset - 77));

RegRegisterMethod(TCustomListView,'AlphaSort',TypeInfo(_T44),[TypeInfo(Boolean)],Addr(TCustomListView.AlphaSort));

RegRegisterMethod(TCustomListView,'Arrange',TypeInfo(_T45),[
TypeInfo(TListArrangement)],Addr(TCustomListView.Arrange));

RegRegisterMethod(TCustomListView,'FindCaption',TypeInfo(_T46),[
TypeInfo(Integer),
TypeInfo(string),
TypeInfo(Boolean),
TypeInfo(Boolean),
TypeInfo(Boolean),TypeInfo(TListItem)],Addr(TCustomListView.FindCaption));

RegRegisterMethod(TCustomListView,'FindData',TypeInfo(_T47),[
TypeInfo(Integer),
TypeInfoPointer,
TypeInfo(Boolean),
TypeInfo(Boolean),TypeInfo(TListItem)],Addr(TCustomListView.FindData));

RegRegisterMethod(TCustomListView,'GetHitTestInfoAt',TypeInfo(_T48),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(THitTests)],Addr(TCustomListView.GetHitTestInfoAt));

RegRegisterMethod(TCustomListView,'GetItemAt',TypeInfo(_T49),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(TListItem)],Addr(TCustomListView.GetItemAt));

RegRegisterMethod(TCustomListView,'GetNearestItem',TypeInfo(_T50),[
TypeInfo(IDispatch),
TypeInfo(TSearchDirection),TypeInfo(TListItem)],Addr(__TCustomListView__GetNearestItem__Wrapper));

RegRegisterMethod(TCustomListView,'GetNextItem',TypeInfo(_T51),[
TypeInfo(TListItem),
TypeInfo(TSearchDirection),
TypeInfo(TItemStates),TypeInfo(TListItem)],Addr(TCustomListView.GetNextItem));

RegRegisterMethod(TCustomListView,'GetSearchString',TypeInfo(_T52),[TypeInfo(string)],Addr(TCustomListView.GetSearchString));

RegRegisterMethod(TCustomListView,'IsEditing',TypeInfo(_T53),[TypeInfo(Boolean)],Addr(TCustomListView.IsEditing));

RegRegisterMethod(TCustomListView,'Scroll',TypeInfo(_T54),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TCustomListView.Scroll));

RegRegisterMethod(TCustomListView,'StringWidth',TypeInfo(_T56),[
TypeInfo(string),TypeInfo(Integer)],Addr(TCustomListView.StringWidth));

RegRegisterMethod(TCustomListView,'UpdateItems',TypeInfo(_T57),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TCustomListView.UpdateItems));

RegRegisterMethod(TCustomRichEdit,'RequestSize',TypeInfo(_T58),[
TypeInfo(IDispatch)], pointer(220));

RegRegisterMethod(TCustomRichEdit,'SelectionChange',TypeInfo(_T59),NoParams, pointer(MinVMTOffset - 72));

RegRegisterMethod(TCustomRichEdit,'FindText',TypeInfo(_T60),[
TypeInfo(string),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TSearchTypes),TypeInfo(Integer)],Addr(TCustomRichEdit.FindText));

RegRegisterMethod(TCustomRichEdit,'Print',TypeInfo(_T61),[
TypeInfo(string)], pointer(224));

RegRegisterMethod(TCustomTabControl,'CanChange',TypeInfo(_T63),[TypeInfo(Boolean)], pointer(MinVMTOffset - 71));

RegRegisterMethod(TCustomTabControl,'CanShowTab',TypeInfo(_T64),[
TypeInfo(Integer),TypeInfo(Boolean)], pointer(184));

RegRegisterMethod(TCustomTabControl,'Change',TypeInfo(_T65),NoParams, pointer(MinVMTOffset - 72));

RegRegisterMethod(TCustomTabControl,'DrawTab',TypeInfo(_T66),[
TypeInfo(Integer),
TypeInfo(IDispatch),
TypeInfo(Boolean)], pointer(188));

RegRegisterMethod(TCustomTabControl,'GetImageIndex',TypeInfo(_T67),[
TypeInfo(Integer),TypeInfo(Integer)], pointer(192));

RegRegisterMethod(TCustomTreeView,'CanEdit',TypeInfo(_T68),[
TypeInfo(TTreeNode),TypeInfo(Boolean)], pointer(MinVMTOffset - 71));

RegRegisterMethod(TCustomTreeView,'CanChange',TypeInfo(_T69),[
TypeInfo(TTreeNode),TypeInfo(Boolean)], pointer(MinVMTOffset - 72));

RegRegisterMethod(TCustomTreeView,'CanCollapse',TypeInfo(_T70),[
TypeInfo(TTreeNode),TypeInfo(Boolean)], pointer(MinVMTOffset - 73));

RegRegisterMethod(TCustomTreeView,'CanExpand',TypeInfo(_T71),[
TypeInfo(TTreeNode),TypeInfo(Boolean)], pointer(MinVMTOffset - 74));

RegRegisterMethod(TCustomTreeView,'Change',TypeInfo(_T72),[
TypeInfo(TTreeNode)], pointer(MinVMTOffset - 75));

RegRegisterMethod(TCustomTreeView,'Collapse',TypeInfo(_T73),[
TypeInfo(TTreeNode)], pointer(MinVMTOffset - 76));

RegRegisterMethod(TCustomTreeView,'CreateNode',TypeInfo(_T74),[TypeInfo(TTreeNode)], pointer(184));

RegRegisterMethod(TCustomTreeView,'CustomDraw',TypeInfo(_T75),[
TypeInfo(IDispatch),
TypeInfo(TCustomDrawStage),TypeInfo(Boolean)], pointer(188));

RegRegisterMethod(TCustomTreeView,'CustomDrawItem',TypeInfo(_T76),[
TypeInfo(TTreeNode),
TypeInfo(TCustomDrawState),
TypeInfo(TCustomDrawStage),TypeInfo(Boolean)], pointer(192));

RegRegisterMethod(TCustomTreeView,'Delete',TypeInfo(_T77),[
TypeInfo(TTreeNode)], pointer(MinVMTOffset - 77));

RegRegisterMethod(TCustomTreeView,'Edit',TypeInfo(_T78),[
TypeInfo(IDispatch)], pointer(MinVMTOffset - 78));

RegRegisterMethod(TCustomTreeView,'Expand',TypeInfo(_T79),[
TypeInfo(TTreeNode)], pointer(MinVMTOffset - 79));

RegRegisterMethod(TCustomTreeView,'GetImageIndex',TypeInfo(_T80),[
TypeInfo(TTreeNode)], pointer(196));

RegRegisterMethod(TCustomTreeView,'GetSelectedIndex',TypeInfo(_T81),[
TypeInfo(TTreeNode)], pointer(200));

RegRegisterMethod(TCustomTreeView,'AlphaSort',TypeInfo(_T82),[TypeInfo(Boolean)],Addr(TCustomTreeView.AlphaSort));

RegRegisterMethod(TCustomTreeView,'FullCollapse',TypeInfo(_T84),NoParams,Addr(TCustomTreeView.FullCollapse));

RegRegisterMethod(TCustomTreeView,'FullExpand',TypeInfo(_T85),NoParams,Addr(TCustomTreeView.FullExpand));

RegRegisterMethod(TCustomTreeView,'GetHitTestInfoAt',TypeInfo(_T86),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(THitTests)],Addr(TCustomTreeView.GetHitTestInfoAt));

RegRegisterMethod(TCustomTreeView,'GetNodeAt',TypeInfo(_T87),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(TTreeNode)],Addr(TCustomTreeView.GetNodeAt));

RegRegisterMethod(TCustomTreeView,'IsEditing',TypeInfo(_T88),[TypeInfo(Boolean)],Addr(TCustomTreeView.IsEditing));

RegRegisterMethod(TCustomTreeView,'LoadFromFile',TypeInfo(_T89),[
TypeInfo(string)],Addr(TCustomTreeView.LoadFromFile));

RegRegisterMethod(TCustomTreeView,'LoadFromStream',TypeInfo(_T90),[
TypeInfo(TStream)],Addr(TCustomTreeView.LoadFromStream));

RegRegisterMethod(TCustomTreeView,'SaveToFile',TypeInfo(_T91),[
TypeInfo(string)],Addr(TCustomTreeView.SaveToFile));

RegRegisterMethod(TCustomTreeView,'SaveToStream',TypeInfo(_T92),[
TypeInfo(TStream)],Addr(TCustomTreeView.SaveToStream));

RegRegisterMethod(TCustomUpDown,'CanChange',TypeInfo(_T93),[TypeInfo(Boolean)], pointer(MinVMTOffset - 71));

RegRegisterMethod(TCustomUpDown,'Click',TypeInfo(_T94),[
TypeInfo(TUDBtnType)], pointer(MinVMTOffset - 72));

RegRegisterMethod(TDateTimePicker,'Change',TypeInfo(_T95),NoParams, pointer(MinVMTOffset - 71));

RegRegisterMethod(THeaderControl,'DrawSection',TypeInfo(_T96),[
TypeInfo(THeaderSection),
TypeInfo(IDispatch),
TypeInfo(Boolean)], pointer(MinVMTOffset - 71));

RegRegisterMethod(THeaderControl,'SectionClick',TypeInfo(_T97),[
TypeInfo(THeaderSection)], pointer(MinVMTOffset - 72));

RegRegisterMethod(THeaderControl,'SectionResize',TypeInfo(_T98),[
TypeInfo(THeaderSection)], pointer(MinVMTOffset - 73));

RegRegisterMethod(THeaderControl,'SectionTrack',TypeInfo(_T99),[
TypeInfo(THeaderSection),
TypeInfo(Integer),
TypeInfo(TSectionTrackState)], pointer(MinVMTOffset - 74));

RegRegisterMethod(THeaderSection,'ParentBiDiModeChanged',TypeInfo(_T100),NoParams,Addr(THeaderSection.ParentBiDiModeChanged));

RegRegisterMethod(THeaderSection,'UseRightToLeftAlignment',TypeInfo(_T101),[TypeInfo(Boolean)],Addr(THeaderSection.UseRightToLeftAlignment));

RegRegisterMethod(THeaderSection,'UseRightToLeftReading',TypeInfo(_T102),[TypeInfo(Boolean)],Addr(THeaderSection.UseRightToLeftReading));

RegisterProc(THeaderSections,'Create',mtConstructor,TypeInfo(_T103),[
TypeInfo(THeaderControl)],Addr(THeaderSections.Create),cRegister);

RegRegisterMethod(THeaderSections,'Add',TypeInfo(_T104),[TypeInfo(THeaderSection)],Addr(THeaderSections.Add));

RegisterProc(TIconOptions,'Create',mtConstructor,TypeInfo(_T105),[
TypeInfo(TCustomListView)],Addr(TIconOptions.Create),cRegister);

RegisterProc(TListColumns,'Create',mtConstructor,TypeInfo(_T106),[
TypeInfo(TCustomListView)],Addr(TListColumns.Create),cRegister);

RegRegisterMethod(TListColumns,'Add',TypeInfo(_T107),[TypeInfo(TListColumn)],Addr(TListColumns.Add));

RegisterProc(TListItem,'Create',mtConstructor,TypeInfo(_T108),[
TypeInfo(TListItems)],Addr(TListItem.Create),cRegister);

RegRegisterMethod(TListItem,'CancelEdit',TypeInfo(_T109),NoParams,Addr(TListItem.CancelEdit));

RegRegisterMethod(TListItem,'Delete',TypeInfo(_T110),NoParams,Addr(TListItem.Delete));

RegRegisterMethod(TListItem,'DisplayRect',TypeInfo(_T111),[
TypeInfo(TDisplayCode),TypeInfo(IDispatch)],Addr(__TListItem__DisplayRect__Wrapper));

RegRegisterMethod(TListItem,'EditCaption',TypeInfo(_T112),[TypeInfo(Boolean)],Addr(TListItem.EditCaption));

RegRegisterMethod(TListItem,'GetPosition',TypeInfo(_T113),[TypeInfo(IDispatch)],Addr(__TListItem__GetPosition__Wrapper));

RegRegisterMethod(TListItem,'MakeVisible',TypeInfo(_T114),[
TypeInfo(Boolean)],Addr(TListItem.MakeVisible));

RegRegisterMethod(TListItem,'Update',TypeInfo(_T115),NoParams,Addr(TListItem.Update));

RegRegisterMethod(TListItem,'SetPosition',TypeInfo(_T116),[
TypeInfo(IDispatch)],Addr(__TListItem__SetPosition__Wrapper));

RegisterProc(TListItems,'Create',mtConstructor,TypeInfo(_T117),[
TypeInfo(TCustomListView)],Addr(TListItems.Create),cRegister);

RegRegisterMethod(TListItems,'Add',TypeInfo(_T118),[TypeInfo(TListItem)],Addr(TListItems.Add));

RegRegisterMethod(TListItems,'BeginUpdate',TypeInfo(_T119),NoParams,Addr(TListItems.BeginUpdate));

RegRegisterMethod(TListItems,'Clear',TypeInfo(_T120),NoParams,Addr(TListItems.Clear));

RegRegisterMethod(TListItems,'Delete',TypeInfo(_T121),[
TypeInfo(Integer)],Addr(TListItems.Delete));

RegRegisterMethod(TListItems,'EndUpdate',TypeInfo(_T122),NoParams,Addr(TListItems.EndUpdate));

RegRegisterMethod(TListItems,'IndexOf',TypeInfo(_T123),[
TypeInfo(TListItem),TypeInfo(Integer)],Addr(TListItems.IndexOf));

RegRegisterMethod(TListItems,'Insert',TypeInfo(_T124),[
TypeInfo(Integer),TypeInfo(TListItem)],Addr(TListItems.Insert));

RegisterProc(TMonthCalColors,'Create',mtConstructor,TypeInfo(_T125),[
TypeInfo(TCommonCalendar)],Addr(TMonthCalColors.Create),cRegister);

RegRegisterMethod(TPageControl,'FindNextPage',TypeInfo(_T126),[
TypeInfo(TTabSheet),
TypeInfo(Boolean),
TypeInfo(Boolean),TypeInfo(TTabSheet)],Addr(TPageControl.FindNextPage));

RegRegisterMethod(TPageControl,'SelectNextPage',TypeInfo(_T127),[
TypeInfo(Boolean)],Addr(TPageControl.SelectNextPage));

RegRegisterMethod(TPageScroller,'Scroll',TypeInfo(_T128),[
TypeInfo(TShiftState),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TPageScrollerOrientation),
TypeInfo(Integer)], pointer(MinVMTOffset - 71));

RegRegisterMethod(TPageScroller,'GetButtonState',TypeInfo(_T129),[
TypeInfo(TPageScrollerButton),TypeInfo(TPageScrollerButtonState)],Addr(TPageScroller.GetButtonState));

RegisterProc(TParaAttributes,'Create',mtConstructor,TypeInfo(_T130),[
TypeInfo(TCustomRichEdit)],Addr(TParaAttributes.Create),cRegister);

RegRegisterMethod(TProgressBar,'StepIt',TypeInfo(_T131),NoParams,Addr(TProgressBar.StepIt));

RegRegisterMethod(TProgressBar,'StepBy',TypeInfo(_T132),[
TypeInfo(Integer)],Addr(TProgressBar.StepBy));

RegRegisterMethod(TStatusBar,'DoHint',TypeInfo(_T133),[TypeInfo(Boolean)], pointer(184));

RegRegisterMethod(TStatusBar,'DrawPanel',TypeInfo(_T134),[
TypeInfo(TStatusPanel),
TypeInfo(IDispatch)], pointer(MinVMTOffset - 71));

RegRegisterMethod(TStatusPanel,'ParentBiDiModeChanged',TypeInfo(_T135),NoParams,Addr(TStatusPanel.ParentBiDiModeChanged));

RegRegisterMethod(TStatusPanel,'UseRightToLeftAlignment',TypeInfo(_T136),[TypeInfo(Boolean)],Addr(TStatusPanel.UseRightToLeftAlignment));

RegRegisterMethod(TStatusPanel,'UseRightToLeftReading',TypeInfo(_T137),[TypeInfo(Boolean)],Addr(TStatusPanel.UseRightToLeftReading));

RegisterProc(TStatusPanels,'Create',mtConstructor,TypeInfo(_T138),[
TypeInfo(TStatusBar)],Addr(TStatusPanels.Create),cRegister);

RegRegisterMethod(TStatusPanels,'Add',TypeInfo(_T139),[TypeInfo(TStatusPanel)],Addr(TStatusPanels.Add));

RegRegisterMethod(TTabSheet,'DoHide',TypeInfo(_T140),NoParams, pointer(MinVMTOffset - 71));

RegRegisterMethod(TTabSheet,'DoShow',TypeInfo(_T141),NoParams, pointer(MinVMTOffset - 72));

RegisterProc(TTextAttributes,'Create',mtConstructor,TypeInfo(_T142),[
TypeInfo(TCustomRichEdit),
TypeInfo(TAttributeType)],Addr(TTextAttributes.Create),cRegister);

RegRegisterMethod(TToolBar,'CancelMenu',TypeInfo(_T143),NoParams, pointer(MinVMTOffset - 71));

RegRegisterMethod(TToolBar,'CheckMenuDropdown',TypeInfo(_T144),[
TypeInfo(TToolButton),TypeInfo(Boolean)], pointer(MinVMTOffset - 72));

RegRegisterMethod(TToolBar,'ClickButton',TypeInfo(_T145),[
TypeInfo(TToolButton)], pointer(MinVMTOffset - 73));

RegRegisterMethod(TToolBar,'InitMenu',TypeInfo(_T146),[
TypeInfo(TToolButton)], pointer(MinVMTOffset - 74));

RegRegisterMethod(TToolBar,'TrackMenu',TypeInfo(_T147),[
TypeInfo(TToolButton),TypeInfo(Boolean)], pointer(MinVMTOffset - 75));

RegRegisterMethod(TToolBarDockObject,'ToolDockImage',TypeInfo(_T148),[
TypeInfo(Boolean),TypeInfo(Boolean)], pointer(56));

RegRegisterMethod(TToolButton,'BeginUpdate',TypeInfo(_T149),NoParams, pointer(140));

RegRegisterMethod(TToolButton,'EndUpdate',TypeInfo(_T150),NoParams, pointer(144));

RegRegisterMethod(TToolButton,'RefreshControl',TypeInfo(_T151),NoParams, pointer(148));

RegRegisterMethod(TToolButton,'UpdateControl',TypeInfo(_T152),NoParams, pointer(152));

RegRegisterMethod(TToolButton,'CheckMenuDropdown',TypeInfo(_T153),[TypeInfo(Boolean)], pointer(MinVMTOffset - 49));

RegRegisterMethod(TTrackBar,'SetTick',TypeInfo(_T154),[
TypeInfo(Integer)],Addr(TTrackBar.SetTick));

RegisterProc(TTreeNode,'Create',mtConstructor,TypeInfo(_T155),[
TypeInfo(TTreeNodes)],Addr(TTreeNode.Create),cRegister);

RegRegisterMethod(TTreeNode,'AlphaSort',TypeInfo(_T156),[TypeInfo(Boolean)],Addr(TTreeNode.AlphaSort));

RegRegisterMethod(TTreeNode,'Collapse',TypeInfo(_T157),[
TypeInfo(Boolean)],Addr(TTreeNode.Collapse));

RegRegisterMethod(TTreeNode,'Delete',TypeInfo(_T159),NoParams,Addr(TTreeNode.Delete));

RegRegisterMethod(TTreeNode,'DeleteChildren',TypeInfo(_T160),NoParams,Addr(TTreeNode.DeleteChildren));

RegRegisterMethod(TTreeNode,'DisplayRect',TypeInfo(_T161),[
TypeInfo(Boolean),TypeInfo(IDispatch)],Addr(__TTreeNode__DisplayRect__Wrapper));

RegRegisterMethod(TTreeNode,'EditText',TypeInfo(_T162),[TypeInfo(Boolean)],Addr(TTreeNode.EditText));

RegRegisterMethod(TTreeNode,'EndEdit',TypeInfo(_T163),[
TypeInfo(Boolean)],Addr(TTreeNode.EndEdit));

RegRegisterMethod(TTreeNode,'Expand',TypeInfo(_T164),[
TypeInfo(Boolean)],Addr(TTreeNode.Expand));

RegRegisterMethod(TTreeNode,'getFirstChild',TypeInfo(_T165),[TypeInfo(TTreeNode)],Addr(TTreeNode.getFirstChild));

RegRegisterMethod(TTreeNode,'GetHandle',TypeInfo(_T166),[TypeInfo(HWND)],Addr(TTreeNode.GetHandle));

RegRegisterMethod(TTreeNode,'GetLastChild',TypeInfo(_T167),[TypeInfo(TTreeNode)],Addr(TTreeNode.GetLastChild));

RegRegisterMethod(TTreeNode,'GetNext',TypeInfo(_T168),[TypeInfo(TTreeNode)],Addr(TTreeNode.GetNext));

RegRegisterMethod(TTreeNode,'GetNextChild',TypeInfo(_T169),[
TypeInfo(TTreeNode),TypeInfo(TTreeNode)],Addr(TTreeNode.GetNextChild));

RegRegisterMethod(TTreeNode,'getNextSibling',TypeInfo(_T170),[TypeInfo(TTreeNode)],Addr(TTreeNode.getNextSibling));

RegRegisterMethod(TTreeNode,'GetNextVisible',TypeInfo(_T171),[TypeInfo(TTreeNode)],Addr(TTreeNode.GetNextVisible));

RegRegisterMethod(TTreeNode,'GetPrev',TypeInfo(_T172),[TypeInfo(TTreeNode)],Addr(TTreeNode.GetPrev));

RegRegisterMethod(TTreeNode,'GetPrevChild',TypeInfo(_T173),[
TypeInfo(TTreeNode),TypeInfo(TTreeNode)],Addr(TTreeNode.GetPrevChild));

RegRegisterMethod(TTreeNode,'getPrevSibling',TypeInfo(_T174),[TypeInfo(TTreeNode)],Addr(TTreeNode.getPrevSibling));

RegRegisterMethod(TTreeNode,'GetPrevVisible',TypeInfo(_T175),[TypeInfo(TTreeNode)],Addr(TTreeNode.GetPrevVisible));

RegRegisterMethod(TTreeNode,'HasAsParent',TypeInfo(_T176),[
TypeInfo(TTreeNode),TypeInfo(Boolean)],Addr(TTreeNode.HasAsParent));

RegRegisterMethod(TTreeNode,'IndexOf',TypeInfo(_T177),[
TypeInfo(TTreeNode),TypeInfo(Integer)],Addr(TTreeNode.IndexOf));

RegRegisterMethod(TTreeNode,'MakeVisible',TypeInfo(_T178),NoParams,Addr(TTreeNode.MakeVisible));

RegRegisterMethod(TTreeNode,'MoveTo',TypeInfo(_T179),[
TypeInfo(TTreeNode),
TypeInfo(TNodeAttachMode)], pointer(12));

RegisterProc(TTreeNodes,'Create',mtConstructor,TypeInfo(_T180),[
TypeInfo(TCustomTreeView)],Addr(TTreeNodes.Create),cRegister);

RegRegisterMethod(TTreeNodes,'AddChildFirst',TypeInfo(_T181),[
TypeInfo(TTreeNode),
TypeInfo(string),TypeInfo(TTreeNode)],Addr(TTreeNodes.AddChildFirst));

RegRegisterMethod(TTreeNodes,'AddChild',TypeInfo(_T182),[
TypeInfo(TTreeNode),
TypeInfo(string),TypeInfo(TTreeNode)],Addr(TTreeNodes.AddChild));

RegRegisterMethod(TTreeNodes,'AddChildObjectFirst',TypeInfo(_T183),[
TypeInfo(TTreeNode),
TypeInfo(string),
TypeInfoPointer,TypeInfo(TTreeNode)],Addr(TTreeNodes.AddChildObjectFirst));

RegRegisterMethod(TTreeNodes,'AddChildObject',TypeInfo(_T184),[
TypeInfo(TTreeNode),
TypeInfo(string),
TypeInfoPointer,TypeInfo(TTreeNode)],Addr(TTreeNodes.AddChildObject));

RegRegisterMethod(TTreeNodes,'AddFirst',TypeInfo(_T185),[
TypeInfo(TTreeNode),
TypeInfo(string),TypeInfo(TTreeNode)],Addr(TTreeNodes.AddFirst));

RegRegisterMethod(TTreeNodes,'Add',TypeInfo(_T186),[
TypeInfo(TTreeNode),
TypeInfo(string),TypeInfo(TTreeNode)],Addr(TTreeNodes.Add));

RegRegisterMethod(TTreeNodes,'AddObjectFirst',TypeInfo(_T187),[
TypeInfo(TTreeNode),
TypeInfo(string),
TypeInfoPointer,TypeInfo(TTreeNode)],Addr(TTreeNodes.AddObjectFirst));

RegRegisterMethod(TTreeNodes,'AddObject',TypeInfo(_T188),[
TypeInfo(TTreeNode),
TypeInfo(string),
TypeInfoPointer,TypeInfo(TTreeNode)],Addr(TTreeNodes.AddObject));

RegRegisterMethod(TTreeNodes,'BeginUpdate',TypeInfo(_T189),NoParams,Addr(TTreeNodes.BeginUpdate));

RegRegisterMethod(TTreeNodes,'Clear',TypeInfo(_T190),NoParams,Addr(TTreeNodes.Clear));

RegRegisterMethod(TTreeNodes,'Delete',TypeInfo(_T191),[
TypeInfo(TTreeNode)],Addr(TTreeNodes.Delete));

RegRegisterMethod(TTreeNodes,'EndUpdate',TypeInfo(_T192),NoParams,Addr(TTreeNodes.EndUpdate));

RegRegisterMethod(TTreeNodes,'GetFirstNode',TypeInfo(_T193),[TypeInfo(TTreeNode)],Addr(TTreeNodes.GetFirstNode));

RegRegisterMethod(TTreeNodes,'Insert',TypeInfo(_T195),[
TypeInfo(TTreeNode),
TypeInfo(string),TypeInfo(TTreeNode)],Addr(TTreeNodes.Insert));

RegRegisterMethod(TTreeNodes,'InsertObject',TypeInfo(_T196),[
TypeInfo(TTreeNode),
TypeInfo(string),
TypeInfoPointer,TypeInfo(TTreeNode)],Addr(TTreeNodes.InsertObject));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegRegisterMethod(TCommonCalendar,'MsgSetRange',TypeInfo(_T18),[
TypeInfo(Integer),
TypeInfoPointer,TypeInfo(Boolean)], pointer(208))}

{RegRegisterMethod(TConversion,'ConvertReadStream',TypeInfo(_T20),[
TypeInfo(TStream),
TypeInfoPChar,
TypeInfo(Integer),TypeInfo(Integer)], pointer(0))}

{RegRegisterMethod(TConversion,'ConvertWriteStream',TypeInfo(_T21),[
TypeInfo(TStream),
TypeInfoPChar,
TypeInfo(Integer),TypeInfo(Integer)], pointer(4))}

{RegRegisterMethod(TCustomListView,'CustomSort',TypeInfo(_T55),[
TypeInfo(TLVCompare),
TypeInfo(Longint),TypeInfo(Boolean)],Addr(TCustomListView.CustomSort))}

{RegisterProc(TCustomRichEdit,'RegisterConversionFormat',mtClassMethod,TypeInfo(_T62),[
TypeInfo(string),
TypeInfo(TConversionClass)],Addr(TCustomRichEdit.RegisterConversionFormat),cRegister)}

{RegRegisterMethod(TCustomTreeView,'CustomSort',TypeInfo(_T83),[
TypeInfo(TTVCompare),
TypeInfo(Longint),TypeInfo(Boolean)],Addr(TCustomTreeView.CustomSort))}

{RegRegisterMethod(TTreeNode,'CustomSort',TypeInfo(_T158),[
TypeInfo(TTVCompare),
TypeInfo(Longint),TypeInfo(Boolean)],Addr(TTreeNode.CustomSort))}

{RegRegisterMethod(TTreeNodes,'GetNode',TypeInfo(_T194),[
TypeInfoPointer,TypeInfo(TTreeNode)],Addr(TTreeNodes.GetNode))}

{RegisterEvent(TypeInfo(TDrawPanelEvent),[
TypeInfo(TStatusBar),
TypeInfo(TStatusPanel),
TypeInfo(IDispatch)]);}

{RegisterEvent(TypeInfo(TDrawSectionEvent),[
TypeInfo(THeaderControl),
TypeInfo(THeaderSection),
TypeInfo(IDispatch),
TypeInfo(Boolean)]);}

{RegisterEvent(TypeInfo(TDrawTabEvent),[
TypeInfo(TCustomTabControl),
TypeInfo(Integer),
TypeInfo(IDispatch),
TypeInfo(Boolean)]);}

RegisterEvent(TypeInfo(TDTParseInputEvent),[
TypeInfo(TObject),
TypeInfo(string),
TypeInfo(TDateTime),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TLVChangeEvent),[
TypeInfo(TObject),
TypeInfo(TListItem),
TypeInfo(TItemChange)]);

RegisterEvent(TypeInfo(TLVChangingEvent),[
TypeInfo(TObject),
TypeInfo(TListItem),
TypeInfo(TItemChange),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TLVColumnClickEvent),[
TypeInfo(TObject),
TypeInfo(TListColumn)]);

RegisterEvent(TypeInfo(TLVCompareEvent),[
TypeInfo(TObject),
TypeInfo(TListItem),
TypeInfo(TListItem),
TypeInfo(Integer),
TypeInfo(Integer)]);

{RegisterEvent(TypeInfo(TLVCustomDrawEvent),[
TypeInfo(TCustomListView),
TypeInfo(IDispatch),
TypeInfo(Boolean)]);}

RegisterEvent(TypeInfo(TLVCustomDrawItemEvent),[
TypeInfo(TCustomListView),
TypeInfo(TListItem),
TypeInfo(TCustomDrawState),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TLVCustomDrawSubItemEvent),[
TypeInfo(TCustomListView),
TypeInfo(TListItem),
TypeInfo(Integer),
TypeInfo(TCustomDrawState),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TLVDeletedEvent),[
TypeInfo(TObject),
TypeInfo(TListItem)]);

{RegisterEvent(TypeInfo(TLVDrawItemEvent),[
TypeInfo(TCustomListView),
TypeInfo(TListItem),
TypeInfo(IDispatch),
TypeInfo(TOwnerDrawState)]);}

RegisterEvent(TypeInfo(TLVEditedEvent),[
TypeInfo(TObject),
TypeInfo(TListItem),
TypeInfo(string)]);

RegisterEvent(TypeInfo(TLVEditingEvent),[
TypeInfo(TObject),
TypeInfo(TListItem),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TLVNotifyEvent),[
TypeInfo(TObject),
TypeInfo(TListItem)]);

RegisterEvent(TypeInfo(TLVOwnerDataEvent),[
TypeInfo(TObject),
TypeInfo(TListItem)]);

{RegisterEvent(TypeInfo(TLVOwnerDataFindEvent),[
TypeInfo(TObject),
TypeInfo(TItemFind),
TypeInfo(string),
TypeInfo(IDispatch),
TypeInfoPointer,
TypeInfo(Integer),
TypeInfo(TSearchDirection),
TypeInfo(Boolean),
TypeInfo(Integer)]);}

RegisterEvent(TypeInfo(TLVOwnerDataHintEvent),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer)]);

RegisterEvent(TypeInfo(TLVOwnerDataStateChangeEvent),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TItemStates),
TypeInfo(TItemStates)]);

RegisterEvent(TypeInfo(TLVSelectItemEvent),[
TypeInfo(TObject),
TypeInfo(TListItem),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TOnGetMonthInfoEvent),[
TypeInfo(TObject),
TypeInfo(LongWord),
TypeInfo(LongWord)]);

RegisterEvent(TypeInfo(TPageScrollEvent),[
TypeInfo(TObject),
TypeInfo(TShiftState),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TPageScrollerOrientation),
TypeInfo(Integer)]);

RegisterEvent(TypeInfo(TRichEditProtectChange),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Boolean)]);

{RegisterEvent(TypeInfo(TRichEditResizeEvent),[
TypeInfo(TObject),
TypeInfo(IDispatch)]);}

RegisterEvent(TypeInfo(TRichEditSaveClipboard),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TSectionNotifyEvent),[
TypeInfo(THeaderControl),
TypeInfo(THeaderSection)]);

RegisterEvent(TypeInfo(TSectionTrackEvent),[
TypeInfo(THeaderControl),
TypeInfo(THeaderSection),
TypeInfo(Integer),
TypeInfo(TSectionTrackState)]);

RegisterEvent(TypeInfo(TTabChangingEvent),[
TypeInfo(TObject),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TTabGetImageEvent),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer)]);

RegisterEvent(TypeInfo(TTVChangedEvent),[
TypeInfo(TObject),
TypeInfo(TTreeNode)]);

RegisterEvent(TypeInfo(TTVChangingEvent),[
TypeInfo(TObject),
TypeInfo(TTreeNode),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TTVCollapsingEvent),[
TypeInfo(TObject),
TypeInfo(TTreeNode),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TTVCompareEvent),[
TypeInfo(TObject),
TypeInfo(TTreeNode),
TypeInfo(TTreeNode),
TypeInfo(Integer),
TypeInfo(Integer)]);

{RegisterEvent(TypeInfo(TTVCustomDrawEvent),[
TypeInfo(TCustomTreeView),
TypeInfo(IDispatch),
TypeInfo(Boolean)]);}

RegisterEvent(TypeInfo(TTVCustomDrawItemEvent),[
TypeInfo(TCustomTreeView),
TypeInfo(TTreeNode),
TypeInfo(TCustomDrawState),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TTVEditedEvent),[
TypeInfo(TObject),
TypeInfo(TTreeNode),
TypeInfo(string)]);

RegisterEvent(TypeInfo(TTVEditingEvent),[
TypeInfo(TObject),
TypeInfo(TTreeNode),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TTVExpandedEvent),[
TypeInfo(TObject),
TypeInfo(TTreeNode)]);

RegisterEvent(TypeInfo(TTVExpandingEvent),[
TypeInfo(TObject),
TypeInfo(TTreeNode),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TUDChangingEvent),[
TypeInfo(TObject),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TUDClickEvent),[
TypeInfo(TObject),
TypeInfo(TUDBtnType)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
