{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit COMCTRLS_D6;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  Types,
  activex,
  dcscript,
  dcsystem,
  dcdreamlib,
  Messages,
  Windows,
  SysUtils,
  CommCtrl,
  Controls,
  Forms,
  Classes,
  Menus,
  Graphics,
  StdCtrls,
  RichEdit,
  ToolWin,
  ImgList,
  ExtCtrls,
  ListActns,
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
procedure setX(const val : Longint);
function getX : Longint;
property X : Longint read getX write setX;
procedure setY(const val : Longint);
function getY : Longint;
property Y : Longint read getY write setY;
end;
type __TRect__Wrapper = class(TDCRecordWrapper)
private
fR : TRect;
public
function GetRecordPtr : pointer; override;
published
procedure setLeft(const val : Longint);
function getLeft : Longint;
property Left : Longint read getLeft write setLeft;
procedure setTop(const val : Longint);
function getTop : Longint;
property Top : Longint read getTop write setTop;
procedure setRight(const val : Longint);
function getRight : Longint;
property Right : Longint read getRight write setRight;
procedure setBottom(const val : Longint);
function getBottom : Longint;
property Bottom : Longint read getBottom write setBottom;
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
type __TCustomHeaderControl__ = class(TCustomHeaderControl);
type __TCustomListView__ = class(TCustomListView);
type __TCustomRichEdit__ = class(TCustomRichEdit);
type __TCustomStatusBar__ = class(TCustomStatusBar);
type __TCustomTabControl__ = class(TCustomTabControl);
type __TCustomTreeView__ = class(TCustomTreeView);
type __TToolBar__ = class(TToolBar);
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

{_T12 = function : TComboExItemsClass of object;}

{_T13 = function : TComboExItemClass of object;}

_T14 = procedure (p0 : TCustomComboBoxEx) of object;

_T15 = function (const p0 : string;
const p1 : Integer;
const p2 : Integer;
const p3 : Integer;
const p4 : Integer;
p5 : Pointer): TComboExItem of object;

_T16 = procedure (const p0 : TImageIndex) of object;

_T17 = _T16;

_T18 = procedure (const p0 : Integer) of object;

_T19 = function : TComboExItem of object;

_T20 = _T15;

_T21 = function (p0 : Integer): TComboExItem of object;

_T22 = _T4;

_T23 = procedure (p0 : TDate) of object;

_T24 = function : HWND of object;

_T25 = function : DWORD of object;

_T26 = function (p0 : Integer;
p1 : TColor): Boolean of object;

_T27 = function (const p0 : IDispatch): Boolean of object;

{_T28 = function (p0 : Integer;
p1 : PSystemTime): Boolean of object;}

_T29 = procedure (p0 : Array of LongWord;
var p1 : LongWord) of object;

{_T30 = function (p0 : TStream;
p1 : PChar;
p2 : Integer): Integer of object;}

{_T31 = function (p0 : TStream;
p1 : PChar;
p2 : Integer): Integer of object;}

_T32 = _T4;

_T33 = _T4;

_T34 = procedure (p0 : TCoolBar) of object;

_T35 = function : TCoolBand of object;

_T36 = function (p0 : TControl): TCoolBand of object;

_T37 = _T4;

_T38 = function : THeaderSection of object;

_T39 = function : THeaderSections of object;

_T40 = procedure (p0 : THeaderSection;
const p1 : IDispatch;
p2 : Boolean) of object;

_T41 = procedure (p0 : THeaderSection) of object;

_T42 = procedure (p0 : THeaderSection;
p1 : THeaderSection;
var p2 : Boolean) of object;

_T43 = _T4;

_T44 = _T41;

_T45 = procedure (p0 : THeaderSection;
p1 : Integer;
p2 : TSectionTrackState) of object;

_T46 = procedure (p0 : TCustomImageList) of object;

_T47 = function (p0 : TListItem;
p1 : Integer): Boolean of object;

_T48 = function (p0 : TListItem): Boolean of object;

_T49 = procedure (p0 : TListItem;
p1 : Integer) of object;

_T50 = procedure (p0 : TListColumn) of object;

_T51 = procedure (p0 : TListColumn;
const p1 : IDispatch) of object;

_T52 = function : TListItem of object;

_T53 = function : TListItems of object;

_T54 = function (const p0 : IDispatch;
p1 : TCustomDrawStage): Boolean of object;

_T55 = function (p0 : TListItem;
p1 : TCustomDrawState;
p2 : TCustomDrawStage): Boolean of object;

_T56 = function (p0 : TListItem;
p1 : Integer;
p2 : TCustomDrawState;
p3 : TCustomDrawStage): Boolean of object;

_T57 = procedure (p0 : TListItem) of object;

_T58 = procedure (p0 : TListItem;
var p1 : string) of object;

_T59 = procedure (p0 : TListItem;
const p1 : IDispatch;
p2 : TOwnerDrawState) of object;

_T60 = procedure (const p0 : IDispatch) of object;

_T61 = function (p0 : TListItem;
p1 : TItemRequest): Boolean of object;

_T62 = function (p0 : TItemFind;
const p1 : string;
const p2 : IDispatch;
p3 : Pointer;
p4 : Integer;
p5 : TSearchDirection;
p6 : Boolean): Integer of object;

_T63 = function (p0 : Integer;
p1 : Integer): Boolean of object;

_T64 = function (p0 : Integer;
p1 : Integer;
p2 : TItemStates;
p3 : TItemStates): Boolean of object;

_T65 = _T57;

_T66 = function (p0 : TCustomDrawTarget;
p1 : TCustomDrawStage): Boolean of object;

_T67 = procedure (p0 : TViewStyle) of object;

_T68 = function : Boolean of object;

_T69 = procedure (p0 : TListArrangement) of object;

_T70 = function (p0 : Integer;
p1 : string;
p2 : Boolean;
p3 : Boolean;
p4 : Boolean): TListItem of object;

_T71 = function (p0 : Integer;
p1 : Pointer;
p2 : Boolean;
p3 : Boolean): TListItem of object;

_T72 = function (p0 : Integer;
p1 : Integer): THitTests of object;

_T73 = function (p0 : Integer;
p1 : Integer): TListItem of object;

_T74 = function (const p0 : IDispatch;
p1 : TSearchDirection): TListItem of object;

_T75 = function (p0 : TListItem;
p1 : TSearchDirection;
p2 : TItemStates): TListItem of object;

_T76 = function : string of object;

_T77 = _T68;

_T78 = procedure (p0 : Integer;
p1 : Integer) of object;

{_T79 = function (p0 : TLVCompare;
p1 : Longint): Boolean of object;}

_T80 = function (p0 : string): Integer of object;

_T81 = _T78;

_T82 = _T60;

_T83 = _T4;

_T84 = function (const p0 : string;
p1 : Integer;
p2 : Integer;
p3 : TSearchTypes): Integer of object;

_T85 = procedure (const p0 : string) of object;

{_T86 = procedure (const p0 : string;
p1 : TConversionClass) of object;}

_T87 = function : TStatusPanel of object;

_T88 = function : TStatusPanels of object;

_T89 = _T68;

_T90 = procedure (p0 : TStatusPanel;
const p1 : IDispatch) of object;

{_T91 = function : TStatusPanelClass of object;}

_T92 = _T68;

_T93 = _T0;

_T94 = _T4;

_T95 = procedure (p0 : Integer;
const p1 : IDispatch;
p2 : Boolean) of object;

_T96 = function (p0 : Integer): Integer of object;

_T97 = function (p0 : Integer;
p1 : Integer): Integer of object;

_T98 = _T72;

_T99 = function (p0 : Integer): IDispatch of object;

_T100 = _T2;

_T101 = _T1;

_T102 = function (p0 : TTreeNode): Boolean of object;

_T103 = _T102;

_T104 = _T102;

_T105 = _T102;

_T106 = procedure (p0 : TTreeNode) of object;

_T107 = _T106;

_T108 = function : TTreeNode of object;

_T109 = function : TTreeNodes of object;

_T110 = _T54;

_T111 = function (p0 : TTreeNode;
p1 : TCustomDrawState;
p2 : TCustomDrawStage;
var p3 : Boolean): Boolean of object;

_T112 = _T106;

_T113 = _T106;

_T114 = _T60;

_T115 = _T106;

_T116 = _T106;

_T117 = _T106;

_T118 = _T66;

_T119 = function (p0 : Boolean): Boolean of object;

_T121 = _T4;

_T122 = _T4;

_T123 = _T72;

_T124 = function (p0 : Integer;
p1 : Integer): TTreeNode of object;

_T125 = _T68;

_T126 = _T85;

_T127 = procedure (p0 : TStream) of object;

_T128 = _T85;

_T129 = _T127;

_T130 = procedure (p0 : TTreeNode;
p1 : TShiftState) of object;

_T131 = _T106;

_T132 = procedure (p0 : TTreeNode;
p1 : Boolean) of object;

_T133 = procedure (p0 : Boolean) of object;

_T134 = function (p0 : TList): TTreeNode of object;

_T135 = _T108;

_T136 = _T68;

_T137 = procedure (p0 : TUDBtnType) of object;

_T138 = _T4;

_T139 = _T4;

_T140 = _T68;

_T141 = _T68;

_T142 = procedure (p0 : TCustomHeaderControl) of object;

_T143 = _T38;

_T144 = function (p0 : THeaderSection;
p1 : Integer): THeaderSection of object;

_T145 = function (p0 : Integer): THeaderSection of object;

_T146 = procedure (p0 : TCustomListView) of object;

_T147 = _T146;

_T148 = function : TListColumn of object;

_T149 = function : TCustomListView of object;

_T150 = procedure (p0 : TListItems) of object;

_T151 = _T4;

_T152 = _T4;

_T153 = function (p0 : TDisplayCode): IDispatch of object;

_T154 = _T68;

_T155 = function : IDispatch of object;

_T156 = _T133;

_T157 = _T4;

_T158 = _T60;

_T159 = _T2;

_T160 = _T146;

_T161 = _T52;

_T162 = function (p0 : TListItem;
p1 : Integer): TListItem of object;

_T163 = _T4;

_T164 = _T4;

_T165 = _T1;

_T166 = _T4;

_T167 = function (p0 : TListItem): Integer of object;

_T168 = function (p0 : Integer): TListItem of object;

_T169 = procedure (p0 : TCommonCalendar) of object;

_T170 = _T4;

_T171 = function (p0 : TTabSheet;
p1 : Boolean;
p2 : Boolean): TTabSheet of object;

_T172 = procedure (p0 : Boolean;
p1 : Boolean) of object;

_T173 = procedure (p0 : TShiftState;
p1 : Integer;
p2 : Integer;
p3 : TPageScrollerOrientation;
var p4 : Integer) of object;

_T174 = function (p0 : TPageScrollerButton): TPageScrollerButtonState of object;

_T175 = procedure (p0 : TCustomRichEdit) of object;

_T176 = _T4;

_T177 = _T1;

_T178 = _T4;

_T179 = _T68;

_T180 = _T68;

_T181 = procedure (p0 : TCustomStatusBar) of object;

_T182 = _T87;

_T183 = function (p0 : TStatusPanel;
p1 : Integer): TStatusPanel of object;

_T184 = function (p0 : Integer): TStatusPanel of object;

_T185 = _T4;

_T186 = _T4;

_T187 = procedure (p0 : TCustomRichEdit;
p1 : TAttributeType) of object;

_T188 = _T4;

_T189 = function (p0 : TToolButton): Boolean of object;

_T190 = _T3;

_T191 = _T54;

_T192 = function (p0 : TToolButton;
p1 : TCustomDrawState;
p2 : TCustomDrawStage;
var p3 : TTBCustomDrawFlags): Boolean of object;

_T193 = _T0;

_T194 = _T0;

_T195 = _T3;

_T196 = _T66;

_T197 = _T189;

_T198 = _T119;

_T199 = _T4;

_T200 = _T4;

_T201 = _T4;

_T202 = _T4;

_T203 = _T68;

_T204 = _T4;

_T205 = _T1;

_T206 = procedure (p0 : TTreeNodes) of object;

_T207 = _T119;

_T208 = _T133;

_T210 = _T4;

_T211 = _T4;

_T212 = function (p0 : Boolean): IDispatch of object;

_T213 = _T68;

_T214 = _T133;

_T215 = _T133;

_T216 = _T108;

_T217 = _T24;

_T218 = _T108;

_T219 = _T108;

_T220 = function (p0 : TTreeNode): TTreeNode of object;

_T221 = _T108;

_T222 = _T108;

_T223 = _T108;

_T224 = _T220;

_T225 = _T108;

_T226 = _T108;

_T227 = _T102;

_T228 = function (p0 : TTreeNode): Integer of object;

_T229 = _T4;

_T230 = procedure (p0 : TTreeNode;
p1 : TNodeAttachMode) of object;

_T231 = _T68;

_T232 = procedure (p0 : TCustomTreeView) of object;

_T233 = function (p0 : TTreeNode;
const p1 : string): TTreeNode of object;

_T234 = _T233;

_T235 = function (p0 : TTreeNode;
const p1 : string;
p2 : Pointer): TTreeNode of object;

_T236 = _T235;

_T237 = _T233;

_T238 = _T233;

_T239 = _T235;

_T240 = _T235;

_T241 = function (p0 : TTreeNode;
p1 : TTreeNode;
const p2 : string;
p3 : Pointer;
p4 : TNodeAttachMode): TTreeNode of object;

_T242 = _T119;

_T243 = _T4;

_T244 = _T4;

_T246 = _T106;

_T247 = _T4;

_T248 = _T108;

{_T249 = function (p0 : HTreeItem): TTreeNode of object;}

_T250 = _T233;

_T251 = _T235;

_T252 = function (p0 : TTreeNode;
p1 : TTreeNode;
const p2 : string;
p3 : Pointer): TTreeNode of object;

_T253 = function : TWorkArea of object;

_T254 = _T1;

_T255 = function (p0 : Integer): TWorkArea of object;

function __TPoint__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TPoint__Wrapper.setX(const val : Longint);
begin
TPoint(GetRecordPtr^).X := val;
end;
function __TPoint__Wrapper.getX : Longint;
begin
result := TPoint(GetRecordPtr^).X;
end;
procedure __TPoint__Wrapper.setY(const val : Longint);
begin
TPoint(GetRecordPtr^).Y := val;
end;
function __TPoint__Wrapper.getY : Longint;
begin
result := TPoint(GetRecordPtr^).Y;
end;
function __TRect__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TRect__Wrapper.setLeft(const val : Longint);
begin
TRect(GetRecordPtr^).Left := val;
end;
function __TRect__Wrapper.getLeft : Longint;
begin
result := TRect(GetRecordPtr^).Left;
end;
procedure __TRect__Wrapper.setTop(const val : Longint);
begin
TRect(GetRecordPtr^).Top := val;
end;
function __TRect__Wrapper.getTop : Longint;
begin
result := TRect(GetRecordPtr^).Top;
end;
procedure __TRect__Wrapper.setRight(const val : Longint);
begin
TRect(GetRecordPtr^).Right := val;
end;
function __TRect__Wrapper.getRight : Longint;
begin
result := TRect(GetRecordPtr^).Right;
end;
procedure __TRect__Wrapper.setBottom(const val : Longint);
begin
TRect(GetRecordPtr^).Bottom := val;
end;
function __TRect__Wrapper.getBottom : Longint;
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

procedure __TCustomHeaderControl__DrawSection__Wrapper(__Instance : TCustomHeaderControl;
p0 : THeaderSection;
const p1 : IDispatch;
p2 : Boolean);
var
__p1 : ^TRect;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
__TCustomHeaderControl__(__Instance).DrawSection(p0,__p1^,p2);
end;

procedure __TCustomListView__ColRightClick__Wrapper(__Instance : TCustomListView;
p0 : TListColumn;
const p1 : IDispatch);
var
__p1 : ^TPoint;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
__TCustomListView__(__Instance).ColRightClick(p0,__p1^);
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

procedure __TCustomStatusBar__DrawPanel__Wrapper(__Instance : TCustomStatusBar;
p0 : TStatusPanel;
const p1 : IDispatch);
var
__p1 : ^TRect;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
__TCustomStatusBar__(__Instance).DrawPanel(p0,__p1^);
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

function __TCustomTabControl__TabRect__Wrapper(__Instance : TCustomTabControl;
p0 : Integer): IDispatch;
var
__result : TRect;
__wrapper : __TRect__Wrapper;
begin
__result := TCustomTabControl(__Instance).TabRect(p0);
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
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

function __TCustomTreeView__AlphaSort__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList) : OleVariant;
begin
case cArgs of
0:
begin
result := TCustomTreeView(__Instance).AlphaSort;
end;
1:
begin
result := TCustomTreeView(__Instance).AlphaSort(OleVariant(pargs^[0]));
end;
end
end;

procedure __TCustomTreeView__Select__Wrapper(__Instance : TCustomTreeView;
p0 : TTreeNode;
p1 : TShiftState);
begin
TCustomTreeView(__Instance).Select(p0,p1);
end;

procedure __TCustomTreeView__Subselect__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
1:
begin
TCustomTreeView(__Instance).Subselect(TTreeNode(VarToObject(OleVariant(pargs^[0]))));
end;
2:
begin
TCustomTreeView(__Instance).Subselect(TTreeNode(VarToObject(OleVariant(pargs^[1]))),OleVariant(pargs^[0]));
end;
end
end;

procedure __TCustomTreeView__ClearSelection__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
0:
begin
TCustomTreeView(__Instance).ClearSelection;
end;
1:
begin
TCustomTreeView(__Instance).ClearSelection(OleVariant(pargs^[0]));
end;
end
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

function __TListItems__AddItem__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList) : OleVariant;
begin
case cArgs of
1:
begin
result := VarFromObject(TListItems(__Instance).AddItem(TListItem(VarToObject(OleVariant(pargs^[0])))));
end;
2:
begin
result := VarFromObject(TListItems(__Instance).AddItem(TListItem(VarToObject(OleVariant(pargs^[1]))),OleVariant(pargs^[0])));
end;
end
end;

procedure __TPageControl__SelectNextPage__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
1:
begin
TPageControl(__Instance).SelectNextPage(OleVariant(pargs^[0]));
end;
2:
begin
TPageControl(__Instance).SelectNextPage(OleVariant(pargs^[1]),OleVariant(pargs^[0]));
end;
end
end;

function __TToolBar__CustomDraw__Wrapper(__Instance : TToolBar;
const p0 : IDispatch;
p1 : TCustomDrawStage): Boolean;
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := __TToolBar__(__Instance).CustomDraw(__p0^,p1);
end;

function __TTreeNode__AlphaSort__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList) : OleVariant;
begin
case cArgs of
0:
begin
result := TTreeNode(__Instance).AlphaSort;
end;
1:
begin
result := TTreeNode(__Instance).AlphaSort(OleVariant(pargs^[0]));
end;
end
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

function __TTreeNodes__AlphaSort__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList) : OleVariant;
begin
case cArgs of
0:
begin
result := TTreeNodes(__Instance).AlphaSort;
end;
1:
begin
result := TTreeNodes(__Instance).AlphaSort(OleVariant(pargs^[0]));
end;
end
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

function __DC__GetTComboBoxExStrings__SortType(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TComboBoxExStrings(Instance).SortType;
end;

procedure __DC__SetTComboBoxExStrings__SortType(Instance : TObject; Params : PVariantArgList);
begin
TComboBoxExStrings(Instance).SortType:=OleVariant(Params^[0]);
end;

function __DC__GetTComboBoxExStrings__ItemsEx(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TComboBoxExStrings(Instance).ItemsEx);
end;

procedure __DC__SetTComboBoxExStrings__ItemsEx(Instance : TObject; Params : PVariantArgList);
begin
TComboBoxExStrings(Instance).ItemsEx:=TComboExItems(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTComboExItems__ComboItems(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TComboExItems(Instance).ComboItems[OleVariant(Params^[0])]);
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

function __DC__GetTCustomComboBoxEx__DropDownCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomComboBoxEx(Instance).DropDownCount;
end;

procedure __DC__SetTCustomComboBoxEx__DropDownCount(Instance : TObject; Params : PVariantArgList);
begin
TCustomComboBoxEx(Instance).DropDownCount:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomComboBoxEx__Images(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomComboBoxEx(Instance).Images);
end;

procedure __DC__SetTCustomComboBoxEx__Images(Instance : TObject; Params : PVariantArgList);
begin
TCustomComboBoxEx(Instance).Images:=TCustomImageList(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomComboBoxEx__ItemsEx(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomComboBoxEx(Instance).ItemsEx);
end;

procedure __DC__SetTCustomComboBoxEx__ItemsEx(Instance : TObject; Params : PVariantArgList);
begin
TCustomComboBoxEx(Instance).ItemsEx:=TComboExItems(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomComboBoxEx__SelText(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomComboBoxEx(Instance).SelText;
end;

procedure __DC__SetTCustomComboBoxEx__SelText(Instance : TObject; Params : PVariantArgList);
begin
TCustomComboBoxEx(Instance).SelText:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomComboBoxEx__Style(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomComboBoxEx(Instance).Style;
end;

procedure __DC__SetTCustomComboBoxEx__Style(Instance : TObject; Params : PVariantArgList);
begin
TCustomComboBoxEx(Instance).Style:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomComboBoxEx__StyleEx(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TComboBoxExStyles;
begin
tmp := TCustomComboBoxEx(Instance).StyleEx;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTCustomComboBoxEx__StyleEx(Instance : TObject; Params : PVariantArgList);
var
  tmp : TComboBoxExStyles;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TCustomComboBoxEx(Instance).StyleEx:=tmp;
end;

function __DC__GetTCustomHeaderControl__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomHeaderControl(Instance).Canvas);
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

function __DC__GetTCustomListView__WorkAreas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomListView(Instance).WorkAreas);
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

function __DC__GetTCustomStatusBar__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomStatusBar(Instance).Canvas);
end;

function __DC__GetTCustomStatusBar__AutoHint(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomStatusBar(Instance).AutoHint;
end;

procedure __DC__SetTCustomStatusBar__AutoHint(Instance : TObject; Params : PVariantArgList);
begin
TCustomStatusBar(Instance).AutoHint:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomStatusBar__Panels(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomStatusBar(Instance).Panels);
end;

procedure __DC__SetTCustomStatusBar__Panels(Instance : TObject; Params : PVariantArgList);
begin
TCustomStatusBar(Instance).Panels:=TStatusPanels(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomStatusBar__SimplePanel(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomStatusBar(Instance).SimplePanel;
end;

procedure __DC__SetTCustomStatusBar__SimplePanel(Instance : TObject; Params : PVariantArgList);
begin
TCustomStatusBar(Instance).SimplePanel:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomStatusBar__SimpleText(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomStatusBar(Instance).SimpleText;
end;

procedure __DC__SetTCustomStatusBar__SimpleText(Instance : TObject; Params : PVariantArgList);
begin
TCustomStatusBar(Instance).SimpleText:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomStatusBar__SizeGrip(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomStatusBar(Instance).SizeGrip;
end;

procedure __DC__SetTCustomStatusBar__SizeGrip(Instance : TObject; Params : PVariantArgList);
begin
TCustomStatusBar(Instance).SizeGrip:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomStatusBar__UseSystemFont(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomStatusBar(Instance).UseSystemFont;
end;

procedure __DC__SetTCustomStatusBar__UseSystemFont(Instance : TObject; Params : PVariantArgList);
begin
TCustomStatusBar(Instance).UseSystemFont:=OleVariant(Params^[0]);
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

function __DC__GetTCustomTreeView__SelectionCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomTreeView(Instance).SelectionCount;
end;

function __DC__GetTCustomTreeView__Selections(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomTreeView(Instance).Selections[OleVariant(Params^[0])]);
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

function __DC__GetTListItem__Deleting(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TListItem(Instance).Deleting;
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

function __DC__GetTListItem__SubItemImages(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TListItem(Instance).SubItemImages[OleVariant(Params^[0])];
end;

procedure __DC__SetTListItem__SubItemImages(Instance : TObject; Params : PVariantArgList);
begin
TListItem(Instance).SubItemImages[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
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

function __DC__GetTPageControl__ActivePageIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPageControl(Instance).ActivePageIndex;
end;

procedure __DC__SetTPageControl__ActivePageIndex(Instance : TObject; Params : PVariantArgList);
begin
TPageControl(Instance).ActivePageIndex:=OleVariant(Params^[0]);
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

function __DC__GetTToolBar__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TToolBar(Instance).Canvas);
end;

function __DC__GetTToolBar__CustomizeKeyName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TToolBar(Instance).CustomizeKeyName;
end;

procedure __DC__SetTToolBar__CustomizeKeyName(Instance : TObject; Params : PVariantArgList);
begin
TToolBar(Instance).CustomizeKeyName:=OleVariant(Params^[0]);
end;

function __DC__GetTToolBar__CustomizeValueName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TToolBar(Instance).CustomizeValueName;
end;

procedure __DC__SetTToolBar__CustomizeValueName(Instance : TObject; Params : PVariantArgList);
begin
TToolBar(Instance).CustomizeValueName:=OleVariant(Params^[0]);
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

function __DC__GetTWorkArea__Rect(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TRect__Wrapper;
begin
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := TWorkArea(Instance).Rect;
result := IUnknown(__wrapper) as IDispatch;
end;

procedure __DC__SetTWorkArea__Rect(Instance : TObject; Params : PVariantArgList);
var
__idisp:IDispatch;
__iwrapper:IDCRecordWrapper;
begin
__idisp:=DCVarToInterface(OleVariant(Params^[0]));
if __idisp=nil then exit;
__idisp.QueryInterface(IDCRecordWrapper, __iwrapper);
TWorkArea(Instance).Rect:=TRect(__iwrapper.GetRecordPtr^);
end;

function __DC__GetTWorkArea__Color(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWorkArea(Instance).Color;
end;

procedure __DC__SetTWorkArea__Color(Instance : TObject; Params : PVariantArgList);
begin
TWorkArea(Instance).Color:=OleVariant(Params^[0]);
end;

function __DC__GetTWorkAreas__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TWorkAreas(Instance).Items[OleVariant(Params^[0])]);
end;

procedure __DC__SetTWorkAreas__Items(Instance : TObject; Params : PVariantArgList);
begin
TWorkAreas(Instance).Items[OleVariant(Params^[1])]:=TWorkArea(VarToObject(OleVariant(Params^[0])));
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
RegisterProperty(TComboBoxExStrings,'SortType',__DC__GetTComboBoxExStrings__SortType,__DC__SetTComboBoxExStrings__SortType);
RegisterProperty(TComboBoxExStrings,'ItemsEx',__DC__GetTComboBoxExStrings__ItemsEx,__DC__SetTComboBoxExStrings__ItemsEx);
RegisterIndexedProperty(TComboExItems,'ComboItems',1,False,__DC__GetTComboExItems__ComboItems,nil);
RegisterProperty(TCoolBand,'Height',__DC__GetTCoolBand__Height,nil);
RegisterProperty(TCoolBands,'CoolBar',__DC__GetTCoolBands__CoolBar,nil);
RegisterIndexedProperty(TCoolBands,'Items',1,True,__DC__GetTCoolBands__Items,__DC__SetTCoolBands__Items);
RegisterProperty(TCustomComboBoxEx,'DropDownCount',__DC__GetTCustomComboBoxEx__DropDownCount,__DC__SetTCustomComboBoxEx__DropDownCount);
RegisterProperty(TCustomComboBoxEx,'Images',__DC__GetTCustomComboBoxEx__Images,__DC__SetTCustomComboBoxEx__Images);
RegisterProperty(TCustomComboBoxEx,'ItemsEx',__DC__GetTCustomComboBoxEx__ItemsEx,__DC__SetTCustomComboBoxEx__ItemsEx);
RegisterProperty(TCustomComboBoxEx,'SelText',__DC__GetTCustomComboBoxEx__SelText,__DC__SetTCustomComboBoxEx__SelText);
RegisterProperty(TCustomComboBoxEx,'Style',__DC__GetTCustomComboBoxEx__Style,__DC__SetTCustomComboBoxEx__Style);
RegisterProperty(TCustomComboBoxEx,'StyleEx',__DC__GetTCustomComboBoxEx__StyleEx,__DC__SetTCustomComboBoxEx__StyleEx);
RegisterProperty(TCustomHeaderControl,'Canvas',__DC__GetTCustomHeaderControl__Canvas,nil);
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
RegisterProperty(TCustomListView,'WorkAreas',__DC__GetTCustomListView__WorkAreas,nil);
RegisterProperty(TCustomRichEdit,'DefAttributes',__DC__GetTCustomRichEdit__DefAttributes,__DC__SetTCustomRichEdit__DefAttributes);
RegisterProperty(TCustomRichEdit,'SelAttributes',__DC__GetTCustomRichEdit__SelAttributes,__DC__SetTCustomRichEdit__SelAttributes);
RegisterProperty(TCustomRichEdit,'PageRect',__DC__GetTCustomRichEdit__PageRect,__DC__SetTCustomRichEdit__PageRect);
RegisterProperty(TCustomRichEdit,'Paragraph',__DC__GetTCustomRichEdit__Paragraph,nil);
RegisterProperty(TCustomStatusBar,'Canvas',__DC__GetTCustomStatusBar__Canvas,nil);
RegisterProperty(TCustomStatusBar,'AutoHint',__DC__GetTCustomStatusBar__AutoHint,__DC__SetTCustomStatusBar__AutoHint);
RegisterProperty(TCustomStatusBar,'Panels',__DC__GetTCustomStatusBar__Panels,__DC__SetTCustomStatusBar__Panels);
RegisterProperty(TCustomStatusBar,'SimplePanel',__DC__GetTCustomStatusBar__SimplePanel,__DC__SetTCustomStatusBar__SimplePanel);
RegisterProperty(TCustomStatusBar,'SimpleText',__DC__GetTCustomStatusBar__SimpleText,__DC__SetTCustomStatusBar__SimpleText);
RegisterProperty(TCustomStatusBar,'SizeGrip',__DC__GetTCustomStatusBar__SizeGrip,__DC__SetTCustomStatusBar__SizeGrip);
RegisterProperty(TCustomStatusBar,'UseSystemFont',__DC__GetTCustomStatusBar__UseSystemFont,__DC__SetTCustomStatusBar__UseSystemFont);
RegisterProperty(TCustomTabControl,'Canvas',__DC__GetTCustomTabControl__Canvas,nil);
RegisterProperty(TCustomTabControl,'TabStop',__DC__GetTCustomTabControl__TabStop,__DC__SetTCustomTabControl__TabStop);
RegisterProperty(TCustomTreeView,'Canvas',__DC__GetTCustomTreeView__Canvas,nil);
RegisterProperty(TCustomTreeView,'DropTarget',__DC__GetTCustomTreeView__DropTarget,__DC__SetTCustomTreeView__DropTarget);
RegisterProperty(TCustomTreeView,'Selected',__DC__GetTCustomTreeView__Selected,__DC__SetTCustomTreeView__Selected);
RegisterProperty(TCustomTreeView,'TopItem',__DC__GetTCustomTreeView__TopItem,__DC__SetTCustomTreeView__TopItem);
RegisterProperty(TCustomTreeView,'SelectionCount',__DC__GetTCustomTreeView__SelectionCount,nil);
RegisterIndexedProperty(TCustomTreeView,'Selections',1,False,__DC__GetTCustomTreeView__Selections,nil);
RegisterProperty(TDateTimePicker,'DateTime',__DC__GetTDateTimePicker__DateTime,__DC__SetTDateTimePicker__DateTime);
RegisterProperty(TDateTimePicker,'DroppedDown',__DC__GetTDateTimePicker__DroppedDown,nil);
RegisterProperty(THeaderSection,'Left',__DC__GetTHeaderSection__Left,nil);
RegisterProperty(THeaderSection,'Right',__DC__GetTHeaderSection__Right,nil);
RegisterIndexedProperty(THeaderSections,'Items',1,True,__DC__GetTHeaderSections__Items,__DC__SetTHeaderSections__Items);
RegisterProperty(TListColumn,'WidthType',__DC__GetTListColumn__WidthType,nil);
RegisterIndexedProperty(TListColumns,'Items',1,True,__DC__GetTListColumns__Items,__DC__SetTListColumns__Items);
RegisterProperty(TListItem,'Caption',__DC__GetTListItem__Caption,__DC__SetTListItem__Caption);
RegisterProperty(TListItem,'Checked',__DC__GetTListItem__Checked,__DC__SetTListItem__Checked);
RegisterProperty(TListItem,'Cut',__DC__GetTListItem__Cut,__DC__SetTListItem__Cut);
RegisterProperty(TListItem,'Data',__DC__GetTListItem__Data,__DC__SetTListItem__Data);
RegisterProperty(TListItem,'Deleting',__DC__GetTListItem__Deleting,nil);
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
RegisterIndexedProperty(TListItem,'SubItemImages',1,False,__DC__GetTListItem__SubItemImages,__DC__SetTListItem__SubItemImages);
RegisterProperty(TListItem,'Top',__DC__GetTListItem__Top,__DC__SetTListItem__Top);
RegisterProperty(TListItems,'Count',__DC__GetTListItems__Count,__DC__SetTListItems__Count);
RegisterProperty(TListItems,'Handle',__DC__GetTListItems__Handle,nil);
RegisterIndexedProperty(TListItems,'Item',1,True,__DC__GetTListItems__Item,__DC__SetTListItems__Item);
RegisterProperty(TListItems,'Owner',__DC__GetTListItems__Owner,nil);
RegisterProperty(TPageControl,'ActivePageIndex',__DC__GetTPageControl__ActivePageIndex,__DC__SetTPageControl__ActivePageIndex);
RegisterProperty(TPageControl,'PageCount',__DC__GetTPageControl__PageCount,nil);
RegisterIndexedProperty(TPageControl,'Pages',1,False,__DC__GetTPageControl__Pages,nil);
RegisterProperty(TParaAttributes,'Alignment',__DC__GetTParaAttributes__Alignment,__DC__SetTParaAttributes__Alignment);
RegisterProperty(TParaAttributes,'FirstIndent',__DC__GetTParaAttributes__FirstIndent,__DC__SetTParaAttributes__FirstIndent);
RegisterProperty(TParaAttributes,'LeftIndent',__DC__GetTParaAttributes__LeftIndent,__DC__SetTParaAttributes__LeftIndent);
RegisterProperty(TParaAttributes,'Numbering',__DC__GetTParaAttributes__Numbering,__DC__SetTParaAttributes__Numbering);
RegisterProperty(TParaAttributes,'RightIndent',__DC__GetTParaAttributes__RightIndent,__DC__SetTParaAttributes__RightIndent);
RegisterIndexedProperty(TParaAttributes,'Tab',1,False,__DC__GetTParaAttributes__Tab,__DC__SetTParaAttributes__Tab);
RegisterProperty(TParaAttributes,'TabCount',__DC__GetTParaAttributes__TabCount,__DC__SetTParaAttributes__TabCount);
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
RegisterProperty(TToolBar,'Canvas',__DC__GetTToolBar__Canvas,nil);
RegisterProperty(TToolBar,'CustomizeKeyName',__DC__GetTToolBar__CustomizeKeyName,__DC__SetTToolBar__CustomizeKeyName);
RegisterProperty(TToolBar,'CustomizeValueName',__DC__GetTToolBar__CustomizeValueName,__DC__SetTToolBar__CustomizeValueName);
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
RegisterProperty(TWorkArea,'Rect',__DC__GetTWorkArea__Rect,__DC__SetTWorkArea__Rect);
RegisterProperty(TWorkArea,'Color',__DC__GetTWorkArea__Color,__DC__SetTWorkArea__Color);
RegisterIndexedProperty(TWorkAreas,'Items',1,True,__DC__GetTWorkAreas__Items,__DC__SetTWorkAreas__Items);
end;

const __ConstNames0 : array[0..225] of string = (
'htAbove'
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
,'tpTop'
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
,'stNone'
,'stData'
,'stText'
,'stBoth'
,'msControlSelect'
,'msShiftSelect'
,'msVisibleOnly'
,'msSiblingOnly'
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
,'updNone'
,'updUp'
,'updDown'
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
,'tbNoEdges'
,'tbHiliteHotTrack'
,'tbNoOffset'
,'tbNoMark'
,'tbNoEtchedEffect'
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
,'csExDropDown'
,'csExSimple'
,'csExDropDownList'
,'csExCaseSensitive'
,'csExNoEditImage'
,'csExNoEditImageIndent'
,'csExNoSizeLimit'
,'csExPathWordBreak'
,'ComCtlVersionIE3'
,'ComCtlVersionIE4'
,'ComCtlVersionIE401'
,'ComCtlVersionIE5'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,htAbove));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,htBelow));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,htNowhere));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,htOnItem));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,htOnButton));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,htOnIcon));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,htOnIndent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,htOnLabel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,htOnRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,htOnStateIcon));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,htToLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,htToRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,tpTop));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,tpBottom));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,tpLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,tpRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,tsTabs));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,tsButtons));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,tsFlatButtons));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,psText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,psOwnerDraw));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,pbNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,pbLowered));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,pbRaised));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,dtControl));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,dtItem));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,dtSubItem));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,cdPrePaint));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,cdPostPaint));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,cdPreErase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,cdPostErase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,cdsSelected));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,cdsGrayed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,cdsDisabled));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,cdsChecked));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,cdsFocused));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,cdsDefault));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,cdsHot));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,cdsMarked));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,cdsIndeterminate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,hsText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,hsOwnerDraw));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,tsTrackBegin));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,tsTrackMove));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,tsTrackEnd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,hsButtons));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,hsFlat));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,nsCut));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[48] ,nsDropHilited));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[49] ,nsFocused));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[50] ,nsSelected));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[51] ,nsExpanded));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[52] ,naAdd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[53] ,naAddFirst));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[54] ,naAddChild));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[55] ,naAddChildFirst));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[56] ,naInsert));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[57] ,taAddFirst));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[58] ,taAdd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[59] ,taInsert));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[60] ,stNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[61] ,stData));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[62] ,stText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[63] ,stBoth));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[64] ,msControlSelect));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[65] ,msShiftSelect));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[66] ,msVisibleOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[67] ,msSiblingOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[68] ,trHorizontal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[69] ,trVertical));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[70] ,tmBottomRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[71] ,tmTopLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[72] ,tmBoth));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[73] ,tsNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[74] ,tsAuto));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[75] ,tsManual));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[76] ,pbHorizontal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[77] ,pbVertical));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[78] ,atSelected));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[79] ,atDefaultText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[80] ,caBold));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[81] ,caColor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[82] ,caFace));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[83] ,caItalic));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[84] ,caSize));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[85] ,caStrikeOut));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[86] ,caUnderline));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[87] ,caProtected));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[88] ,nsNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[89] ,nsBullet));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[90] ,stWholeWord));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[91] ,stMatchCase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[92] ,udLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[93] ,udRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[94] ,udHorizontal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[95] ,udVertical));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[96] ,btNext));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[97] ,btPrev));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[98] ,updNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[99] ,updUp));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[100] ,updDown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[101] ,hkShift));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[102] ,hkCtrl));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[103] ,hkAlt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[104] ,hkExt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[105] ,hcNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[106] ,hcShift));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[107] ,hcCtrl));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[108] ,hcAlt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[109] ,hcShiftCtrl));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[110] ,hcShiftAlt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[111] ,hcCtrlAlt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[112] ,hcShiftCtrlAlt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[113] ,ColumnHeaderWidth));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[114] ,ColumnTextWidth));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[115] ,drBounds));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[116] ,drIcon));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[117] ,drLabel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[118] ,drSelectBounds));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[119] ,iaTop));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[120] ,iaLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[121] ,arAlignBottom));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[122] ,arAlignLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[123] ,arAlignRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[124] ,arAlignTop));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[125] ,arDefault));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[126] ,arSnapToGrid));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[127] ,vsIcon));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[128] ,vsSmallIcon));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[129] ,vsList));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[130] ,vsReport));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[131] ,isNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[132] ,isCut));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[133] ,isDropHilited));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[134] ,isFocused));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[135] ,isSelected));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[136] ,isActivating));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[137] ,ctText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[138] ,ctImage));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[139] ,ctState));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[140] ,ifData));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[141] ,ifPartialString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[142] ,ifExactString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[143] ,ifNearest));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[144] ,sdLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[145] ,sdRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[146] ,sdAbove));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[147] ,sdBelow));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[148] ,sdAll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[149] ,htHandPoint));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[150] ,htUnderlineCold));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[151] ,htUnderlineHot));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[152] ,irText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[153] ,irImage));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[154] ,irParam));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[155] ,irState));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[156] ,irIndent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[157] ,aviNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[158] ,aviFindFolder));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[159] ,aviFindFile));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[160] ,aviFindComputer));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[161] ,aviCopyFiles));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[162] ,aviCopyFile));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[163] ,aviRecycleFile));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[164] ,aviEmptyRecycle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[165] ,aviDeleteFile));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[166] ,CN_DROPDOWNCLOSED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[167] ,tbsButton));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[168] ,tbsCheck));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[169] ,tbsDropDown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[170] ,tbsSeparator));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[171] ,tbsDivider));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[172] ,tbsChecked));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[173] ,tbsPressed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[174] ,tbsEnabled));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[175] ,tbsHidden));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[176] ,tbsIndeterminate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[177] ,tbsWrap));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[178] ,tbsEllipses));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[179] ,tbsMarked));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[180] ,tbNoEdges));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[181] ,tbHiliteHotTrack));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[182] ,tbNoOffset));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[183] ,tbNoMark));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[184] ,tbNoEtchedEffect));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[185] ,CN_BANDCHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[186] ,bmNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[187] ,bmClick));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[188] ,bmDblClick));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[189] ,dowMonday));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[190] ,dowTuesday));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[191] ,dowWednesday));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[192] ,dowThursday));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[193] ,dowFriday));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[194] ,dowSaturday));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[195] ,dowSunday));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[196] ,dowLocaleDefault));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[197] ,dtkDate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[198] ,dtkTime));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[199] ,dmComboBox));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[200] ,dmUpDown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[201] ,dfShort));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[202] ,dfLong));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[203] ,dtaLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[204] ,dtaRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[205] ,soHorizontal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[206] ,soVertical));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[207] ,sbFirst));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[208] ,sbLast));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[209] ,bsNormal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[210] ,bsInvisible));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[211] ,bsGrayed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[212] ,bsDepressed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[213] ,bsHot));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[214] ,csExDropDown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[215] ,csExSimple));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[216] ,csExDropDownList));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[217] ,csExCaseSensitive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[218] ,csExNoEditImage));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[219] ,csExNoEditImageIndent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[220] ,csExNoSizeLimit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[221] ,csExPathWordBreak));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[222] ,ComCtlVersionIE3));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[223] ,ComCtlVersionIE4));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[224] ,ComCtlVersionIE401));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[225] ,ComCtlVersionIE5));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..60] of TClass = (
ECommonCalendarError,
EDateTimeError,
EMonthCalError,
ETreeViewError,
TAnimate,
TComboBoxEx,
TComboBoxExActionLink,
TComboBoxExStrings,
TComboExItem,
TComboExItems,
TCommonCalendar,
TConversion,
TCoolBand,
TCoolBands,
TCoolBar,
TCustomComboBoxEx,
TCustomHeaderControl,
TCustomHotKey,
TCustomListView,
TCustomRichEdit,
TCustomStatusBar,
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
TListViewActionLink,
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
TUpDown,
TWorkArea,
TWorkAreas
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

RegRegisterMethod(TAnimate,'DoOpen',TypeInfo(_T4),NoParams, pointer(196));

RegRegisterMethod(TAnimate,'DoClose',TypeInfo(_T5),NoParams, pointer(200));

RegRegisterMethod(TAnimate,'DoStart',TypeInfo(_T6),NoParams, pointer(204));

RegRegisterMethod(TAnimate,'DoStop',TypeInfo(_T7),NoParams, pointer(208));

RegRegisterMethod(TAnimate,'Play',TypeInfo(_T8),[
TypeInfo(Word),
TypeInfo(Word),
TypeInfo(Integer)],Addr(TAnimate.Play));

RegRegisterMethod(TAnimate,'Reset',TypeInfo(_T9),NoParams,Addr(TAnimate.Reset));

RegRegisterMethod(TAnimate,'Seek',TypeInfo(_T10),[
TypeInfo(SmallInt)],Addr(TAnimate.Seek));

RegRegisterMethod(TAnimate,'Stop',TypeInfo(_T11),NoParams,Addr(TAnimate.Stop));

RegisterProc(TComboBoxExStrings,'Create',mtConstructor,TypeInfo(_T14),[
TypeInfo(TCustomComboBoxEx)],Addr(TComboBoxExStrings.Create),cRegister);

RegRegisterMethod(TComboBoxExStrings,'AddItem',TypeInfo(_T15),[
TypeInfo(string),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfoPointer,TypeInfo(TComboExItem)],Addr(TComboBoxExStrings.AddItem));

RegRegisterMethod(TComboExItem,'SetOverlayImageIndex',TypeInfo(_T16),[
TypeInfo(TImageIndex)], pointer(44));

RegRegisterMethod(TComboExItem,'SetSelectedImageIndex',TypeInfo(_T17),[
TypeInfo(TImageIndex)], pointer(48));

RegRegisterMethod(TComboExItems,'SetItem',TypeInfo(_T18),[
TypeInfo(Integer)], pointer(44));

RegRegisterMethod(TComboExItems,'Add',TypeInfo(_T19),[TypeInfo(TComboExItem)],Addr(TComboExItems.Add));

RegRegisterMethod(TComboExItems,'AddItem',TypeInfo(_T20),[
TypeInfo(string),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfoPointer,TypeInfo(TComboExItem)],Addr(TComboExItems.AddItem));

RegRegisterMethod(TComboExItems,'Insert',TypeInfo(_T21),[
TypeInfo(Integer),TypeInfo(TComboExItem)],Addr(TComboExItems.Insert));

RegRegisterMethod(TCommonCalendar,'CheckEmptyDate',TypeInfo(_T22),NoParams, pointer(196));

RegRegisterMethod(TCommonCalendar,'CheckValidDate',TypeInfo(_T23),[
TypeInfo(TDate)], pointer(200));

RegRegisterMethod(TCommonCalendar,'GetCalendarHandle',TypeInfo(_T24),[TypeInfo(HWND)], pointer(204));

RegRegisterMethod(TCommonCalendar,'GetCalStyles',TypeInfo(_T25),[TypeInfo(DWORD)], pointer(208));

RegRegisterMethod(TCommonCalendar,'MsgSetCalColors',TypeInfo(_T26),[
TypeInfo(Integer),
TypeInfo(TColor),TypeInfo(Boolean)], pointer(212));

RegRegisterMethod(TCommonCalendar,'MsgSetDateTime',TypeInfo(_T27),[
TypeInfo(IDispatch),TypeInfo(Boolean)], pointer(216));

RegRegisterMethod(TCommonCalendar,'BoldDays',TypeInfo(_T29),[
ArrayInfo(TypeInfo(LongWord)),
TypeInfo(LongWord)],Addr(TCommonCalendar.BoldDays));

RegRegisterMethod(TCoolBand,'ParentColorChanged',TypeInfo(_T32),NoParams, pointer(MinVMTOffset - 2));

RegRegisterMethod(TCoolBand,'ParentBitmapChanged',TypeInfo(_T33),NoParams, pointer(MinVMTOffset - 3));

RegisterProc(TCoolBands,'Create',mtConstructor,TypeInfo(_T34),[
TypeInfo(TCoolBar)],Addr(TCoolBands.Create),cRegister);

RegRegisterMethod(TCoolBands,'Add',TypeInfo(_T35),[TypeInfo(TCoolBand)],Addr(TCoolBands.Add));

RegRegisterMethod(TCoolBands,'FindBand',TypeInfo(_T36),[
TypeInfo(TControl),TypeInfo(TCoolBand)],Addr(TCoolBands.FindBand));

RegRegisterMethod(TCoolBar,'Change',TypeInfo(_T37),NoParams, pointer(MinVMTOffset - 76));

RegRegisterMethod(TCustomHeaderControl,'CreateSection',TypeInfo(_T38),[TypeInfo(THeaderSection)], pointer(196));

RegRegisterMethod(TCustomHeaderControl,'CreateSections',TypeInfo(_T39),[TypeInfo(THeaderSections)], pointer(200));

RegRegisterMethod(TCustomHeaderControl,'DrawSection',TypeInfo(_T40),[
TypeInfo(THeaderSection),
TypeInfo(IDispatch),
TypeInfo(Boolean)], pointer(MinVMTOffset - 76));

RegRegisterMethod(TCustomHeaderControl,'SectionClick',TypeInfo(_T41),[
TypeInfo(THeaderSection)], pointer(MinVMTOffset - 77));

RegRegisterMethod(TCustomHeaderControl,'SectionDrag',TypeInfo(_T42),[
TypeInfo(THeaderSection),
TypeInfo(THeaderSection),
TypeInfo(Boolean)], pointer(MinVMTOffset - 78));

RegRegisterMethod(TCustomHeaderControl,'SectionEndDrag',TypeInfo(_T43),NoParams, pointer(MinVMTOffset - 79));

RegRegisterMethod(TCustomHeaderControl,'SectionResize',TypeInfo(_T44),[
TypeInfo(THeaderSection)], pointer(MinVMTOffset - 80));

RegRegisterMethod(TCustomHeaderControl,'SectionTrack',TypeInfo(_T45),[
TypeInfo(THeaderSection),
TypeInfo(Integer),
TypeInfo(TSectionTrackState)], pointer(MinVMTOffset - 81));

RegRegisterMethod(TCustomHeaderControl,'SetImages',TypeInfo(_T46),[
TypeInfo(TCustomImageList)], pointer(204));

RegRegisterMethod(TCustomListView,'CanChange',TypeInfo(_T47),[
TypeInfo(TListItem),
TypeInfo(Integer),TypeInfo(Boolean)], pointer(MinVMTOffset - 76));

RegRegisterMethod(TCustomListView,'CanEdit',TypeInfo(_T48),[
TypeInfo(TListItem),TypeInfo(Boolean)], pointer(MinVMTOffset - 77));

RegRegisterMethod(TCustomListView,'Change',TypeInfo(_T49),[
TypeInfo(TListItem),
TypeInfo(Integer)], pointer(MinVMTOffset - 78));

RegRegisterMethod(TCustomListView,'ColClick',TypeInfo(_T50),[
TypeInfo(TListColumn)], pointer(MinVMTOffset - 79));

RegRegisterMethod(TCustomListView,'ColRightClick',TypeInfo(_T51),[
TypeInfo(TListColumn),
TypeInfo(IDispatch)], pointer(MinVMTOffset - 80));

RegRegisterMethod(TCustomListView,'CreateListItem',TypeInfo(_T52),[TypeInfo(TListItem)], pointer(244));

RegRegisterMethod(TCustomListView,'CreateListItems',TypeInfo(_T53),[TypeInfo(TListItems)], pointer(248));

RegRegisterMethod(TCustomListView,'CustomDraw',TypeInfo(_T54),[
TypeInfo(IDispatch),
TypeInfo(TCustomDrawStage),TypeInfo(Boolean)], pointer(252));

RegRegisterMethod(TCustomListView,'CustomDrawItem',TypeInfo(_T55),[
TypeInfo(TListItem),
TypeInfo(TCustomDrawState),
TypeInfo(TCustomDrawStage),TypeInfo(Boolean)], pointer(256));

RegRegisterMethod(TCustomListView,'CustomDrawSubItem',TypeInfo(_T56),[
TypeInfo(TListItem),
TypeInfo(Integer),
TypeInfo(TCustomDrawState),
TypeInfo(TCustomDrawStage),TypeInfo(Boolean)], pointer(260));

RegRegisterMethod(TCustomListView,'Delete',TypeInfo(_T57),[
TypeInfo(TListItem)], pointer(MinVMTOffset - 81));

RegRegisterMethod(TCustomListView,'DoInfoTip',TypeInfo(_T58),[
TypeInfo(TListItem),
TypeInfo(string)], pointer(264));

RegRegisterMethod(TCustomListView,'DrawItem',TypeInfo(_T59),[
TypeInfo(TListItem),
TypeInfo(IDispatch),
TypeInfo(TOwnerDrawState)], pointer(268));

RegRegisterMethod(TCustomListView,'Edit',TypeInfo(_T60),[
TypeInfo(IDispatch)], pointer(MinVMTOffset - 82));

RegRegisterMethod(TCustomListView,'OwnerDataFetch',TypeInfo(_T61),[
TypeInfo(TListItem),
TypeInfo(TItemRequest),TypeInfo(Boolean)], pointer(272));

RegRegisterMethod(TCustomListView,'OwnerDataFind',TypeInfo(_T62),[
TypeInfo(TItemFind),
TypeInfo(string),
TypeInfo(IDispatch),
TypeInfoPointer,
TypeInfo(Integer),
TypeInfo(TSearchDirection),
TypeInfo(Boolean),TypeInfo(Integer)], pointer(276));

RegRegisterMethod(TCustomListView,'OwnerDataHint',TypeInfo(_T63),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Boolean)], pointer(280));

RegRegisterMethod(TCustomListView,'OwnerDataStateChange',TypeInfo(_T64),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TItemStates),
TypeInfo(TItemStates),TypeInfo(Boolean)], pointer(284));

RegRegisterMethod(TCustomListView,'InsertItem',TypeInfo(_T65),[
TypeInfo(TListItem)], pointer(MinVMTOffset - 83));

RegRegisterMethod(TCustomListView,'IsCustomDrawn',TypeInfo(_T66),[
TypeInfo(TCustomDrawTarget),
TypeInfo(TCustomDrawStage),TypeInfo(Boolean)], pointer(288));

RegRegisterMethod(TCustomListView,'SetViewStyle',TypeInfo(_T67),[
TypeInfo(TViewStyle)], pointer(292));

RegRegisterMethod(TCustomListView,'AlphaSort',TypeInfo(_T68),[TypeInfo(Boolean)],Addr(TCustomListView.AlphaSort));

RegRegisterMethod(TCustomListView,'Arrange',TypeInfo(_T69),[
TypeInfo(TListArrangement)],Addr(TCustomListView.Arrange));

RegRegisterMethod(TCustomListView,'FindCaption',TypeInfo(_T70),[
TypeInfo(Integer),
TypeInfo(string),
TypeInfo(Boolean),
TypeInfo(Boolean),
TypeInfo(Boolean),TypeInfo(TListItem)],Addr(TCustomListView.FindCaption));

RegRegisterMethod(TCustomListView,'FindData',TypeInfo(_T71),[
TypeInfo(Integer),
TypeInfoPointer,
TypeInfo(Boolean),
TypeInfo(Boolean),TypeInfo(TListItem)],Addr(TCustomListView.FindData));

RegRegisterMethod(TCustomListView,'GetHitTestInfoAt',TypeInfo(_T72),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(THitTests)],Addr(TCustomListView.GetHitTestInfoAt));

RegRegisterMethod(TCustomListView,'GetItemAt',TypeInfo(_T73),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(TListItem)],Addr(TCustomListView.GetItemAt));

RegRegisterMethod(TCustomListView,'GetNearestItem',TypeInfo(_T74),[
TypeInfo(IDispatch),
TypeInfo(TSearchDirection),TypeInfo(TListItem)],Addr(__TCustomListView__GetNearestItem__Wrapper));

RegRegisterMethod(TCustomListView,'GetNextItem',TypeInfo(_T75),[
TypeInfo(TListItem),
TypeInfo(TSearchDirection),
TypeInfo(TItemStates),TypeInfo(TListItem)],Addr(TCustomListView.GetNextItem));

RegRegisterMethod(TCustomListView,'GetSearchString',TypeInfo(_T76),[TypeInfo(string)],Addr(TCustomListView.GetSearchString));

RegRegisterMethod(TCustomListView,'IsEditing',TypeInfo(_T77),[TypeInfo(Boolean)],Addr(TCustomListView.IsEditing));

RegRegisterMethod(TCustomListView,'Scroll',TypeInfo(_T78),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TCustomListView.Scroll));

RegRegisterMethod(TCustomListView,'StringWidth',TypeInfo(_T80),[
TypeInfo(string),TypeInfo(Integer)],Addr(TCustomListView.StringWidth));

RegRegisterMethod(TCustomListView,'UpdateItems',TypeInfo(_T81),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TCustomListView.UpdateItems));

RegRegisterMethod(TCustomRichEdit,'RequestSize',TypeInfo(_T82),[
TypeInfo(IDispatch)], pointer(236));

RegRegisterMethod(TCustomRichEdit,'SelectionChange',TypeInfo(_T83),NoParams, pointer(MinVMTOffset - 77));

RegRegisterMethod(TCustomRichEdit,'FindText',TypeInfo(_T84),[
TypeInfo(string),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TSearchTypes),TypeInfo(Integer)],Addr(TCustomRichEdit.FindText));

RegRegisterMethod(TCustomRichEdit,'Print',TypeInfo(_T85),[
TypeInfo(string)], pointer(240));

RegRegisterMethod(TCustomStatusBar,'CreatePanel',TypeInfo(_T87),[TypeInfo(TStatusPanel)], pointer(196));

RegRegisterMethod(TCustomStatusBar,'CreatePanels',TypeInfo(_T88),[TypeInfo(TStatusPanels)], pointer(200));

RegRegisterMethod(TCustomStatusBar,'DoHint',TypeInfo(_T89),[TypeInfo(Boolean)], pointer(204));

RegRegisterMethod(TCustomStatusBar,'DrawPanel',TypeInfo(_T90),[
TypeInfo(TStatusPanel),
TypeInfo(IDispatch)], pointer(MinVMTOffset - 76));

RegRegisterMethod(TCustomTabControl,'CanChange',TypeInfo(_T92),[TypeInfo(Boolean)], pointer(MinVMTOffset - 76));

RegRegisterMethod(TCustomTabControl,'CanShowTab',TypeInfo(_T93),[
TypeInfo(Integer),TypeInfo(Boolean)], pointer(196));

RegRegisterMethod(TCustomTabControl,'Change',TypeInfo(_T94),NoParams, pointer(MinVMTOffset - 77));

RegRegisterMethod(TCustomTabControl,'DrawTab',TypeInfo(_T95),[
TypeInfo(Integer),
TypeInfo(IDispatch),
TypeInfo(Boolean)], pointer(200));

RegRegisterMethod(TCustomTabControl,'GetImageIndex',TypeInfo(_T96),[
TypeInfo(Integer),TypeInfo(Integer)], pointer(204));

RegRegisterMethod(TCustomTabControl,'IndexOfTabAt',TypeInfo(_T97),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Integer)],Addr(TCustomTabControl.IndexOfTabAt));

RegRegisterMethod(TCustomTabControl,'GetHitTestInfoAt',TypeInfo(_T98),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(THitTests)],Addr(TCustomTabControl.GetHitTestInfoAt));

RegRegisterMethod(TCustomTabControl,'TabRect',TypeInfo(_T99),[
TypeInfo(Integer),TypeInfo(IDispatch)],Addr(__TCustomTabControl__TabRect__Wrapper));

RegRegisterMethod(TCustomTabControl,'RowCount',TypeInfo(_T100),[TypeInfo(Integer)],Addr(TCustomTabControl.RowCount));

RegRegisterMethod(TCustomTabControl,'ScrollTabs',TypeInfo(_T101),[
TypeInfo(Integer)],Addr(TCustomTabControl.ScrollTabs));

RegRegisterMethod(TCustomTreeView,'CanEdit',TypeInfo(_T102),[
TypeInfo(TTreeNode),TypeInfo(Boolean)], pointer(MinVMTOffset - 76));

RegRegisterMethod(TCustomTreeView,'CanChange',TypeInfo(_T103),[
TypeInfo(TTreeNode),TypeInfo(Boolean)], pointer(MinVMTOffset - 77));

RegRegisterMethod(TCustomTreeView,'CanCollapse',TypeInfo(_T104),[
TypeInfo(TTreeNode),TypeInfo(Boolean)], pointer(MinVMTOffset - 78));

RegRegisterMethod(TCustomTreeView,'CanExpand',TypeInfo(_T105),[
TypeInfo(TTreeNode),TypeInfo(Boolean)], pointer(MinVMTOffset - 79));

RegRegisterMethod(TCustomTreeView,'Change',TypeInfo(_T106),[
TypeInfo(TTreeNode)], pointer(MinVMTOffset - 80));

RegRegisterMethod(TCustomTreeView,'Collapse',TypeInfo(_T107),[
TypeInfo(TTreeNode)], pointer(MinVMTOffset - 81));

RegRegisterMethod(TCustomTreeView,'CreateNode',TypeInfo(_T108),[TypeInfo(TTreeNode)], pointer(196));

RegRegisterMethod(TCustomTreeView,'CreateNodes',TypeInfo(_T109),[TypeInfo(TTreeNodes)], pointer(200));

RegRegisterMethod(TCustomTreeView,'CustomDraw',TypeInfo(_T110),[
TypeInfo(IDispatch),
TypeInfo(TCustomDrawStage),TypeInfo(Boolean)], pointer(204));

RegRegisterMethod(TCustomTreeView,'CustomDrawItem',TypeInfo(_T111),[
TypeInfo(TTreeNode),
TypeInfo(TCustomDrawState),
TypeInfo(TCustomDrawStage),
TypeInfo(Boolean),TypeInfo(Boolean)], pointer(208));

RegRegisterMethod(TCustomTreeView,'Delete',TypeInfo(_T112),[
TypeInfo(TTreeNode)], pointer(MinVMTOffset - 82));

RegRegisterMethod(TCustomTreeView,'Added',TypeInfo(_T113),[
TypeInfo(TTreeNode)], pointer(MinVMTOffset - 83));

RegRegisterMethod(TCustomTreeView,'Edit',TypeInfo(_T114),[
TypeInfo(IDispatch)], pointer(MinVMTOffset - 84));

RegRegisterMethod(TCustomTreeView,'Expand',TypeInfo(_T115),[
TypeInfo(TTreeNode)], pointer(MinVMTOffset - 85));

RegRegisterMethod(TCustomTreeView,'GetImageIndex',TypeInfo(_T116),[
TypeInfo(TTreeNode)], pointer(212));

RegRegisterMethod(TCustomTreeView,'GetSelectedIndex',TypeInfo(_T117),[
TypeInfo(TTreeNode)], pointer(216));

RegRegisterMethod(TCustomTreeView,'IsCustomDrawn',TypeInfo(_T118),[
TypeInfo(TCustomDrawTarget),
TypeInfo(TCustomDrawStage),TypeInfo(Boolean)], pointer(220));

RegisterProc(TCustomTreeView,'AlphaSort',mtScriptMethod,TypeInfo(_T119),[
TypeInfo(Boolean),TypeInfo(Boolean)],Addr(__TCustomTreeView__AlphaSort__Wrapper),cRegister);

RegRegisterMethod(TCustomTreeView,'FullCollapse',TypeInfo(_T121),NoParams,Addr(TCustomTreeView.FullCollapse));

RegRegisterMethod(TCustomTreeView,'FullExpand',TypeInfo(_T122),NoParams,Addr(TCustomTreeView.FullExpand));

RegRegisterMethod(TCustomTreeView,'GetHitTestInfoAt',TypeInfo(_T123),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(THitTests)],Addr(TCustomTreeView.GetHitTestInfoAt));

RegRegisterMethod(TCustomTreeView,'GetNodeAt',TypeInfo(_T124),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(TTreeNode)],Addr(TCustomTreeView.GetNodeAt));

RegRegisterMethod(TCustomTreeView,'IsEditing',TypeInfo(_T125),[TypeInfo(Boolean)],Addr(TCustomTreeView.IsEditing));

RegRegisterMethod(TCustomTreeView,'LoadFromFile',TypeInfo(_T126),[
TypeInfo(string)],Addr(TCustomTreeView.LoadFromFile));

RegRegisterMethod(TCustomTreeView,'LoadFromStream',TypeInfo(_T127),[
TypeInfo(TStream)],Addr(TCustomTreeView.LoadFromStream));

RegRegisterMethod(TCustomTreeView,'SaveToFile',TypeInfo(_T128),[
TypeInfo(string)],Addr(TCustomTreeView.SaveToFile));

RegRegisterMethod(TCustomTreeView,'SaveToStream',TypeInfo(_T129),[
TypeInfo(TStream)],Addr(TCustomTreeView.SaveToStream));

RegRegisterMethod(TCustomTreeView,'Select',TypeInfo(_T130),[
TypeInfo(TTreeNode),
TypeInfo(TShiftState)], pointer(224));

RegRegisterMethod(TCustomTreeView,'Deselect',TypeInfo(_T131),[
TypeInfo(TTreeNode)], pointer(236));

RegisterProc(TCustomTreeView,'Subselect',mtScriptMethod,TypeInfo(_T132),[
TypeInfo(TTreeNode),
TypeInfo(Boolean)],Addr(__TCustomTreeView__Subselect__Wrapper),cRegister);

RegisterProc(TCustomTreeView,'ClearSelection',mtScriptMethod,TypeInfo(_T133),[
TypeInfo(Boolean)],Addr(__TCustomTreeView__ClearSelection__Wrapper),cRegister);

RegRegisterMethod(TCustomTreeView,'GetSelections',TypeInfo(_T134),[
TypeInfo(TList),TypeInfo(TTreeNode)],Addr(TCustomTreeView.GetSelections));

RegRegisterMethod(TCustomTreeView,'FindNextToSelect',TypeInfo(_T135),[TypeInfo(TTreeNode)], pointer(248));

RegRegisterMethod(TCustomUpDown,'CanChange',TypeInfo(_T136),[TypeInfo(Boolean)], pointer(MinVMTOffset - 76));

RegRegisterMethod(TCustomUpDown,'Click',TypeInfo(_T137),[
TypeInfo(TUDBtnType)], pointer(MinVMTOffset - 77));

RegRegisterMethod(TDateTimePicker,'Change',TypeInfo(_T138),NoParams, pointer(MinVMTOffset - 76));

RegRegisterMethod(THeaderSection,'ParentBiDiModeChanged',TypeInfo(_T139),NoParams,Addr(THeaderSection.ParentBiDiModeChanged));

RegRegisterMethod(THeaderSection,'UseRightToLeftAlignment',TypeInfo(_T140),[TypeInfo(Boolean)],Addr(THeaderSection.UseRightToLeftAlignment));

RegRegisterMethod(THeaderSection,'UseRightToLeftReading',TypeInfo(_T141),[TypeInfo(Boolean)],Addr(THeaderSection.UseRightToLeftReading));

RegisterProc(THeaderSections,'Create',mtConstructor,TypeInfo(_T142),[
TypeInfo(TCustomHeaderControl)],Addr(THeaderSections.Create),cRegister);

RegRegisterMethod(THeaderSections,'Add',TypeInfo(_T143),[TypeInfo(THeaderSection)],Addr(THeaderSections.Add));

RegRegisterMethod(THeaderSections,'AddItem',TypeInfo(_T144),[
TypeInfo(THeaderSection),
TypeInfo(Integer),TypeInfo(THeaderSection)],Addr(THeaderSections.AddItem));

RegRegisterMethod(THeaderSections,'Insert',TypeInfo(_T145),[
TypeInfo(Integer),TypeInfo(THeaderSection)],Addr(THeaderSections.Insert));

RegisterProc(TIconOptions,'Create',mtConstructor,TypeInfo(_T146),[
TypeInfo(TCustomListView)],Addr(TIconOptions.Create),cRegister);

RegisterProc(TListColumns,'Create',mtConstructor,TypeInfo(_T147),[
TypeInfo(TCustomListView)],Addr(TListColumns.Create),cRegister);

RegRegisterMethod(TListColumns,'Add',TypeInfo(_T148),[TypeInfo(TListColumn)],Addr(TListColumns.Add));

RegRegisterMethod(TListColumns,'Owner',TypeInfo(_T149),[TypeInfo(TCustomListView)],Addr(TListColumns.Owner));

RegisterProc(TListItem,'Create',mtConstructor,TypeInfo(_T150),[
TypeInfo(TListItems)],Addr(TListItem.Create),cRegister);

RegRegisterMethod(TListItem,'CancelEdit',TypeInfo(_T151),NoParams,Addr(TListItem.CancelEdit));

RegRegisterMethod(TListItem,'Delete',TypeInfo(_T152),NoParams,Addr(TListItem.Delete));

RegRegisterMethod(TListItem,'DisplayRect',TypeInfo(_T153),[
TypeInfo(TDisplayCode),TypeInfo(IDispatch)],Addr(__TListItem__DisplayRect__Wrapper));

RegRegisterMethod(TListItem,'EditCaption',TypeInfo(_T154),[TypeInfo(Boolean)],Addr(TListItem.EditCaption));

RegRegisterMethod(TListItem,'GetPosition',TypeInfo(_T155),[TypeInfo(IDispatch)],Addr(__TListItem__GetPosition__Wrapper));

RegRegisterMethod(TListItem,'MakeVisible',TypeInfo(_T156),[
TypeInfo(Boolean)],Addr(TListItem.MakeVisible));

RegRegisterMethod(TListItem,'Update',TypeInfo(_T157),NoParams,Addr(TListItem.Update));

RegRegisterMethod(TListItem,'SetPosition',TypeInfo(_T158),[
TypeInfo(IDispatch)],Addr(__TListItem__SetPosition__Wrapper));

RegRegisterMethod(TListItem,'WorkArea',TypeInfo(_T159),[TypeInfo(Integer)],Addr(TListItem.WorkArea));

RegisterProc(TListItems,'Create',mtConstructor,TypeInfo(_T160),[
TypeInfo(TCustomListView)],Addr(TListItems.Create),cRegister);

RegRegisterMethod(TListItems,'Add',TypeInfo(_T161),[TypeInfo(TListItem)],Addr(TListItems.Add));

RegisterProc(TListItems,'AddItem',mtScriptMethod,TypeInfo(_T162),[
TypeInfo(TListItem),
TypeInfo(Integer),TypeInfo(TListItem)],Addr(__TListItems__AddItem__Wrapper),cRegister);

RegRegisterMethod(TListItems,'BeginUpdate',TypeInfo(_T163),NoParams,Addr(TListItems.BeginUpdate));

RegRegisterMethod(TListItems,'Clear',TypeInfo(_T164),NoParams,Addr(TListItems.Clear));

RegRegisterMethod(TListItems,'Delete',TypeInfo(_T165),[
TypeInfo(Integer)],Addr(TListItems.Delete));

RegRegisterMethod(TListItems,'EndUpdate',TypeInfo(_T166),NoParams,Addr(TListItems.EndUpdate));

RegRegisterMethod(TListItems,'IndexOf',TypeInfo(_T167),[
TypeInfo(TListItem),TypeInfo(Integer)],Addr(TListItems.IndexOf));

RegRegisterMethod(TListItems,'Insert',TypeInfo(_T168),[
TypeInfo(Integer),TypeInfo(TListItem)],Addr(TListItems.Insert));

RegisterProc(TMonthCalColors,'Create',mtConstructor,TypeInfo(_T169),[
TypeInfo(TCommonCalendar)],Addr(TMonthCalColors.Create),cRegister);

RegRegisterMethod(TPageControl,'UpdateActivePage',TypeInfo(_T170),NoParams, pointer(208));

RegRegisterMethod(TPageControl,'FindNextPage',TypeInfo(_T171),[
TypeInfo(TTabSheet),
TypeInfo(Boolean),
TypeInfo(Boolean),TypeInfo(TTabSheet)],Addr(TPageControl.FindNextPage));

RegisterProc(TPageControl,'SelectNextPage',mtScriptMethod,TypeInfo(_T172),[
TypeInfo(Boolean),
TypeInfo(Boolean)],Addr(__TPageControl__SelectNextPage__Wrapper),cRegister);

RegRegisterMethod(TPageScroller,'Scroll',TypeInfo(_T173),[
TypeInfo(TShiftState),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TPageScrollerOrientation),
TypeInfo(Integer)], pointer(MinVMTOffset - 76));

RegRegisterMethod(TPageScroller,'GetButtonState',TypeInfo(_T174),[
TypeInfo(TPageScrollerButton),TypeInfo(TPageScrollerButtonState)],Addr(TPageScroller.GetButtonState));

RegisterProc(TParaAttributes,'Create',mtConstructor,TypeInfo(_T175),[
TypeInfo(TCustomRichEdit)],Addr(TParaAttributes.Create),cRegister);

RegRegisterMethod(TProgressBar,'StepIt',TypeInfo(_T176),NoParams,Addr(TProgressBar.StepIt));

RegRegisterMethod(TProgressBar,'StepBy',TypeInfo(_T177),[
TypeInfo(Integer)],Addr(TProgressBar.StepBy));

RegRegisterMethod(TStatusPanel,'ParentBiDiModeChanged',TypeInfo(_T178),NoParams,Addr(TStatusPanel.ParentBiDiModeChanged));

RegRegisterMethod(TStatusPanel,'UseRightToLeftAlignment',TypeInfo(_T179),[TypeInfo(Boolean)],Addr(TStatusPanel.UseRightToLeftAlignment));

RegRegisterMethod(TStatusPanel,'UseRightToLeftReading',TypeInfo(_T180),[TypeInfo(Boolean)],Addr(TStatusPanel.UseRightToLeftReading));

RegisterProc(TStatusPanels,'Create',mtConstructor,TypeInfo(_T181),[
TypeInfo(TCustomStatusBar)],Addr(TStatusPanels.Create),cRegister);

RegRegisterMethod(TStatusPanels,'Add',TypeInfo(_T182),[TypeInfo(TStatusPanel)],Addr(TStatusPanels.Add));

RegRegisterMethod(TStatusPanels,'AddItem',TypeInfo(_T183),[
TypeInfo(TStatusPanel),
TypeInfo(Integer),TypeInfo(TStatusPanel)],Addr(TStatusPanels.AddItem));

RegRegisterMethod(TStatusPanels,'Insert',TypeInfo(_T184),[
TypeInfo(Integer),TypeInfo(TStatusPanel)],Addr(TStatusPanels.Insert));

RegRegisterMethod(TTabSheet,'DoHide',TypeInfo(_T185),NoParams, pointer(MinVMTOffset - 76));

RegRegisterMethod(TTabSheet,'DoShow',TypeInfo(_T186),NoParams, pointer(MinVMTOffset - 77));

RegisterProc(TTextAttributes,'Create',mtConstructor,TypeInfo(_T187),[
TypeInfo(TCustomRichEdit),
TypeInfo(TAttributeType)],Addr(TTextAttributes.Create),cRegister);

RegRegisterMethod(TToolBar,'CancelMenu',TypeInfo(_T188),NoParams, pointer(MinVMTOffset - 76));

RegRegisterMethod(TToolBar,'CheckMenuDropdown',TypeInfo(_T189),[
TypeInfo(TToolButton),TypeInfo(Boolean)], pointer(MinVMTOffset - 77));

RegRegisterMethod(TToolBar,'ClickButton',TypeInfo(_T190),[
TypeInfo(TToolButton)], pointer(MinVMTOffset - 78));

RegRegisterMethod(TToolBar,'CustomDraw',TypeInfo(_T191),[
TypeInfo(IDispatch),
TypeInfo(TCustomDrawStage),TypeInfo(Boolean)], pointer(200));

RegRegisterMethod(TToolBar,'CustomDrawButton',TypeInfo(_T192),[
TypeInfo(TToolButton),
TypeInfo(TCustomDrawState),
TypeInfo(TCustomDrawStage),
TypeInfo(TTBCustomDrawFlags),TypeInfo(Boolean)], pointer(204));

RegRegisterMethod(TToolBar,'DoQueryInsert',TypeInfo(_T193),[
TypeInfo(Integer),TypeInfo(Boolean)], pointer(208));

RegRegisterMethod(TToolBar,'DoQueryDelete',TypeInfo(_T194),[
TypeInfo(Integer),TypeInfo(Boolean)], pointer(212));

RegRegisterMethod(TToolBar,'InitMenu',TypeInfo(_T195),[
TypeInfo(TToolButton)], pointer(MinVMTOffset - 79));

RegRegisterMethod(TToolBar,'IsCustomDrawn',TypeInfo(_T196),[
TypeInfo(TCustomDrawTarget),
TypeInfo(TCustomDrawStage),TypeInfo(Boolean)], pointer(216));

RegRegisterMethod(TToolBar,'TrackMenu',TypeInfo(_T197),[
TypeInfo(TToolButton),TypeInfo(Boolean)], pointer(MinVMTOffset - 80));

RegRegisterMethod(TToolBarDockObject,'ToolDockImage',TypeInfo(_T198),[
TypeInfo(Boolean),TypeInfo(Boolean)], pointer(60));

RegRegisterMethod(TToolButton,'BeginUpdate',TypeInfo(_T199),NoParams, pointer(144));

RegRegisterMethod(TToolButton,'EndUpdate',TypeInfo(_T200),NoParams, pointer(148));

RegRegisterMethod(TToolButton,'RefreshControl',TypeInfo(_T201),NoParams, pointer(152));

RegRegisterMethod(TToolButton,'UpdateControl',TypeInfo(_T202),NoParams, pointer(156));

RegRegisterMethod(TToolButton,'CheckMenuDropdown',TypeInfo(_T203),[TypeInfo(Boolean)], pointer(MinVMTOffset - 56));

RegRegisterMethod(TTrackBar,'Changed',TypeInfo(_T204),NoParams, pointer(MinVMTOffset - 76));

RegRegisterMethod(TTrackBar,'SetTick',TypeInfo(_T205),[
TypeInfo(Integer)],Addr(TTrackBar.SetTick));

RegisterProc(TTreeNode,'Create',mtConstructor,TypeInfo(_T206),[
TypeInfo(TTreeNodes)],Addr(TTreeNode.Create),cRegister);

RegisterProc(TTreeNode,'AlphaSort',mtScriptMethod,TypeInfo(_T207),[
TypeInfo(Boolean),TypeInfo(Boolean)],Addr(__TTreeNode__AlphaSort__Wrapper),cRegister);

RegRegisterMethod(TTreeNode,'Collapse',TypeInfo(_T208),[
TypeInfo(Boolean)],Addr(TTreeNode.Collapse));

RegRegisterMethod(TTreeNode,'Delete',TypeInfo(_T210),NoParams,Addr(TTreeNode.Delete));

RegRegisterMethod(TTreeNode,'DeleteChildren',TypeInfo(_T211),NoParams,Addr(TTreeNode.DeleteChildren));

RegRegisterMethod(TTreeNode,'DisplayRect',TypeInfo(_T212),[
TypeInfo(Boolean),TypeInfo(IDispatch)],Addr(__TTreeNode__DisplayRect__Wrapper));

RegRegisterMethod(TTreeNode,'EditText',TypeInfo(_T213),[TypeInfo(Boolean)],Addr(TTreeNode.EditText));

RegRegisterMethod(TTreeNode,'EndEdit',TypeInfo(_T214),[
TypeInfo(Boolean)],Addr(TTreeNode.EndEdit));

RegRegisterMethod(TTreeNode,'Expand',TypeInfo(_T215),[
TypeInfo(Boolean)],Addr(TTreeNode.Expand));

RegRegisterMethod(TTreeNode,'getFirstChild',TypeInfo(_T216),[TypeInfo(TTreeNode)],Addr(TTreeNode.getFirstChild));

RegRegisterMethod(TTreeNode,'GetHandle',TypeInfo(_T217),[TypeInfo(HWND)],Addr(TTreeNode.GetHandle));

RegRegisterMethod(TTreeNode,'GetLastChild',TypeInfo(_T218),[TypeInfo(TTreeNode)],Addr(TTreeNode.GetLastChild));

RegRegisterMethod(TTreeNode,'GetNext',TypeInfo(_T219),[TypeInfo(TTreeNode)],Addr(TTreeNode.GetNext));

RegRegisterMethod(TTreeNode,'GetNextChild',TypeInfo(_T220),[
TypeInfo(TTreeNode),TypeInfo(TTreeNode)],Addr(TTreeNode.GetNextChild));

RegRegisterMethod(TTreeNode,'getNextSibling',TypeInfo(_T221),[TypeInfo(TTreeNode)],Addr(TTreeNode.getNextSibling));

RegRegisterMethod(TTreeNode,'GetNextVisible',TypeInfo(_T222),[TypeInfo(TTreeNode)],Addr(TTreeNode.GetNextVisible));

RegRegisterMethod(TTreeNode,'GetPrev',TypeInfo(_T223),[TypeInfo(TTreeNode)],Addr(TTreeNode.GetPrev));

RegRegisterMethod(TTreeNode,'GetPrevChild',TypeInfo(_T224),[
TypeInfo(TTreeNode),TypeInfo(TTreeNode)],Addr(TTreeNode.GetPrevChild));

RegRegisterMethod(TTreeNode,'getPrevSibling',TypeInfo(_T225),[TypeInfo(TTreeNode)],Addr(TTreeNode.getPrevSibling));

RegRegisterMethod(TTreeNode,'GetPrevVisible',TypeInfo(_T226),[TypeInfo(TTreeNode)],Addr(TTreeNode.GetPrevVisible));

RegRegisterMethod(TTreeNode,'HasAsParent',TypeInfo(_T227),[
TypeInfo(TTreeNode),TypeInfo(Boolean)],Addr(TTreeNode.HasAsParent));

RegRegisterMethod(TTreeNode,'IndexOf',TypeInfo(_T228),[
TypeInfo(TTreeNode),TypeInfo(Integer)],Addr(TTreeNode.IndexOf));

RegRegisterMethod(TTreeNode,'MakeVisible',TypeInfo(_T229),NoParams,Addr(TTreeNode.MakeVisible));

RegRegisterMethod(TTreeNode,'MoveTo',TypeInfo(_T230),[
TypeInfo(TTreeNode),
TypeInfo(TNodeAttachMode)], pointer(12));

RegRegisterMethod(TTreeNode,'IsFirstNode',TypeInfo(_T231),[TypeInfo(Boolean)],Addr(TTreeNode.IsFirstNode));

RegisterProc(TTreeNodes,'Create',mtConstructor,TypeInfo(_T232),[
TypeInfo(TCustomTreeView)],Addr(TTreeNodes.Create),cRegister);

RegRegisterMethod(TTreeNodes,'AddChildFirst',TypeInfo(_T233),[
TypeInfo(TTreeNode),
TypeInfo(string),TypeInfo(TTreeNode)],Addr(TTreeNodes.AddChildFirst));

RegRegisterMethod(TTreeNodes,'AddChild',TypeInfo(_T234),[
TypeInfo(TTreeNode),
TypeInfo(string),TypeInfo(TTreeNode)],Addr(TTreeNodes.AddChild));

RegRegisterMethod(TTreeNodes,'AddChildObjectFirst',TypeInfo(_T235),[
TypeInfo(TTreeNode),
TypeInfo(string),
TypeInfoPointer,TypeInfo(TTreeNode)],Addr(TTreeNodes.AddChildObjectFirst));

RegRegisterMethod(TTreeNodes,'AddChildObject',TypeInfo(_T236),[
TypeInfo(TTreeNode),
TypeInfo(string),
TypeInfoPointer,TypeInfo(TTreeNode)],Addr(TTreeNodes.AddChildObject));

RegRegisterMethod(TTreeNodes,'AddFirst',TypeInfo(_T237),[
TypeInfo(TTreeNode),
TypeInfo(string),TypeInfo(TTreeNode)],Addr(TTreeNodes.AddFirst));

RegRegisterMethod(TTreeNodes,'Add',TypeInfo(_T238),[
TypeInfo(TTreeNode),
TypeInfo(string),TypeInfo(TTreeNode)],Addr(TTreeNodes.Add));

RegRegisterMethod(TTreeNodes,'AddObjectFirst',TypeInfo(_T239),[
TypeInfo(TTreeNode),
TypeInfo(string),
TypeInfoPointer,TypeInfo(TTreeNode)],Addr(TTreeNodes.AddObjectFirst));

RegRegisterMethod(TTreeNodes,'AddObject',TypeInfo(_T240),[
TypeInfo(TTreeNode),
TypeInfo(string),
TypeInfoPointer,TypeInfo(TTreeNode)],Addr(TTreeNodes.AddObject));

RegRegisterMethod(TTreeNodes,'AddNode',TypeInfo(_T241),[
TypeInfo(TTreeNode),
TypeInfo(TTreeNode),
TypeInfo(string),
TypeInfoPointer,
TypeInfo(TNodeAttachMode),TypeInfo(TTreeNode)],Addr(TTreeNodes.AddNode));

RegisterProc(TTreeNodes,'AlphaSort',mtScriptMethod,TypeInfo(_T242),[
TypeInfo(Boolean),TypeInfo(Boolean)],Addr(__TTreeNodes__AlphaSort__Wrapper),cRegister);

RegRegisterMethod(TTreeNodes,'BeginUpdate',TypeInfo(_T243),NoParams,Addr(TTreeNodes.BeginUpdate));

RegRegisterMethod(TTreeNodes,'Clear',TypeInfo(_T244),NoParams,Addr(TTreeNodes.Clear));

RegRegisterMethod(TTreeNodes,'Delete',TypeInfo(_T246),[
TypeInfo(TTreeNode)],Addr(TTreeNodes.Delete));

RegRegisterMethod(TTreeNodes,'EndUpdate',TypeInfo(_T247),NoParams,Addr(TTreeNodes.EndUpdate));

RegRegisterMethod(TTreeNodes,'GetFirstNode',TypeInfo(_T248),[TypeInfo(TTreeNode)],Addr(TTreeNodes.GetFirstNode));

RegRegisterMethod(TTreeNodes,'Insert',TypeInfo(_T250),[
TypeInfo(TTreeNode),
TypeInfo(string),TypeInfo(TTreeNode)],Addr(TTreeNodes.Insert));

RegRegisterMethod(TTreeNodes,'InsertObject',TypeInfo(_T251),[
TypeInfo(TTreeNode),
TypeInfo(string),
TypeInfoPointer,TypeInfo(TTreeNode)],Addr(TTreeNodes.InsertObject));

RegRegisterMethod(TTreeNodes,'InsertNode',TypeInfo(_T252),[
TypeInfo(TTreeNode),
TypeInfo(TTreeNode),
TypeInfo(string),
TypeInfoPointer,TypeInfo(TTreeNode)],Addr(TTreeNodes.InsertNode));

RegRegisterMethod(TWorkAreas,'Add',TypeInfo(_T253),[TypeInfo(TWorkArea)],Addr(TWorkAreas.Add));

RegRegisterMethod(TWorkAreas,'Delete',TypeInfo(_T254),[
TypeInfo(Integer)],Addr(TWorkAreas.Delete));

RegRegisterMethod(TWorkAreas,'Insert',TypeInfo(_T255),[
TypeInfo(Integer),TypeInfo(TWorkArea)],Addr(TWorkAreas.Insert));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegRegisterMethod(TComboBoxExStrings,'GetItemsClass',TypeInfo(_T12),[TypeInfo(TComboExItemsClass)], pointer(128))}

{RegRegisterMethod(TComboBoxExStrings,'GetItemClass',TypeInfo(_T13),[TypeInfo(TComboExItemClass)], pointer(132))}

{RegRegisterMethod(TCommonCalendar,'MsgSetRange',TypeInfo(_T28),[
TypeInfo(Integer),
TypeInfoPointer,TypeInfo(Boolean)], pointer(220))}

{RegRegisterMethod(TConversion,'ConvertReadStream',TypeInfo(_T30),[
TypeInfo(TStream),
TypeInfoPChar,
TypeInfo(Integer),TypeInfo(Integer)], pointer(0))}

{RegRegisterMethod(TConversion,'ConvertWriteStream',TypeInfo(_T31),[
TypeInfo(TStream),
TypeInfoPChar,
TypeInfo(Integer),TypeInfo(Integer)], pointer(4))}

{RegRegisterMethod(TCustomListView,'CustomSort',TypeInfo(_T79),[
TypeInfo(TLVCompare),
TypeInfo(Longint),TypeInfo(Boolean)],Addr(TCustomListView.CustomSort))}

{RegisterProc(TCustomRichEdit,'RegisterConversionFormat',mtClassMethod,TypeInfo(_T86),[
TypeInfo(string),
TypeInfo(TConversionClass)],Addr(TCustomRichEdit.RegisterConversionFormat),cRegister)}

{RegRegisterMethod(TCustomStatusBar,'GetPanelClass',TypeInfo(_T91),[TypeInfo(TStatusPanelClass)], pointer(208))}

{RegRegisterMethod(TTreeNodes,'GetNode',TypeInfo(_T249),[
TypeInfoPointer,TypeInfo(TTreeNode)],Addr(TTreeNodes.GetNode))}

{RegisterEvent(TypeInfo(TCustomDrawPanelEvent),[
TypeInfo(TCustomStatusBar),
TypeInfo(TStatusPanel),
TypeInfo(IDispatch)]);}

{RegisterEvent(TypeInfo(TCustomDrawSectionEvent),[
TypeInfo(TCustomHeaderControl),
TypeInfo(THeaderSection),
TypeInfo(IDispatch),
TypeInfo(Boolean)]);}

{RegisterEvent(TypeInfo(TCustomHCCreateSectionClassEvent),[
TypeInfo(TCustomHeaderControl),
TypeInfo(THeaderSectionClass)]);}

RegisterEvent(TypeInfo(TCustomSectionNotifyEvent),[
TypeInfo(TCustomHeaderControl),
TypeInfo(THeaderSection)]);

RegisterEvent(TypeInfo(TCustomSectionTrackEvent),[
TypeInfo(TCustomHeaderControl),
TypeInfo(THeaderSection),
TypeInfo(Integer),
TypeInfo(TSectionTrackState)]);

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

{RegisterEvent(TypeInfo(THCCreateSectionClassEvent),[
TypeInfo(THeaderControl),
TypeInfo(THeaderSectionClass)]);}

{RegisterEvent(TypeInfo(TLVAdvancedCustomDrawEvent),[
TypeInfo(TCustomListView),
TypeInfo(IDispatch),
TypeInfo(TCustomDrawStage),
TypeInfo(Boolean)]);}

RegisterEvent(TypeInfo(TLVAdvancedCustomDrawItemEvent),[
TypeInfo(TCustomListView),
TypeInfo(TListItem),
TypeInfo(TCustomDrawState),
TypeInfo(TCustomDrawStage),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TLVAdvancedCustomDrawSubItemEvent),[
TypeInfo(TCustomListView),
TypeInfo(TListItem),
TypeInfo(Integer),
TypeInfo(TCustomDrawState),
TypeInfo(TCustomDrawStage),
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

{RegisterEvent(TypeInfo(TLVColumnRClickEvent),[
TypeInfo(TObject),
TypeInfo(TListColumn),
TypeInfo(IDispatch)]);}

RegisterEvent(TypeInfo(TLVCompareEvent),[
TypeInfo(TObject),
TypeInfo(TListItem),
TypeInfo(TListItem),
TypeInfo(Integer),
TypeInfo(Integer)]);

{RegisterEvent(TypeInfo(TLVCreateItemClassEvent),[
TypeInfo(TCustomListView),
TypeInfo(TListItemClass)]);}

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

RegisterEvent(TypeInfo(TLVInfoTipEvent),[
TypeInfo(TObject),
TypeInfo(TListItem),
TypeInfo(string)]);

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

RegisterEvent(TypeInfo(TLVSubItemImageEvent),[
TypeInfo(TObject),
TypeInfo(TListItem),
TypeInfo(Integer),
TypeInfo(Integer)]);

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

{RegisterEvent(TypeInfo(TSBCreatePanelClassEvent),[
TypeInfo(TCustomStatusBar),
TypeInfo(TStatusPanelClass)]);}

RegisterEvent(TypeInfo(TSectionDragEvent),[
TypeInfo(TObject),
TypeInfo(THeaderSection),
TypeInfo(THeaderSection),
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

RegisterEvent(TypeInfo(TTBAdvancedCustomDrawBtnEvent),[
TypeInfo(TToolBar),
TypeInfo(TToolButton),
TypeInfo(TCustomDrawState),
TypeInfo(TCustomDrawStage),
TypeInfo(TTBCustomDrawFlags),
TypeInfo(Boolean)]);

{RegisterEvent(TypeInfo(TTBAdvancedCustomDrawEvent),[
TypeInfo(TToolBar),
TypeInfo(IDispatch),
TypeInfo(TCustomDrawStage),
TypeInfo(Boolean)]);}

RegisterEvent(TypeInfo(TTBButtonEvent),[
TypeInfo(TToolBar),
TypeInfo(TToolButton)]);

RegisterEvent(TypeInfo(TTBCustomDrawBtnEvent),[
TypeInfo(TToolBar),
TypeInfo(TToolButton),
TypeInfo(TCustomDrawState),
TypeInfo(Boolean)]);

{RegisterEvent(TypeInfo(TTBCustomDrawEvent),[
TypeInfo(TToolBar),
TypeInfo(IDispatch),
TypeInfo(Boolean)]);}

RegisterEvent(TypeInfo(TTBCustomizeQueryEvent),[
TypeInfo(TToolBar),
TypeInfo(Integer),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TTBNewButtonEvent),[
TypeInfo(TToolBar),
TypeInfo(Integer),
TypeInfo(TToolButton)]);

{RegisterEvent(TypeInfo(TTVAdvancedCustomDrawEvent),[
TypeInfo(TCustomTreeView),
TypeInfo(IDispatch),
TypeInfo(TCustomDrawStage),
TypeInfo(Boolean)]);}

RegisterEvent(TypeInfo(TTVAdvancedCustomDrawItemEvent),[
TypeInfo(TCustomTreeView),
TypeInfo(TTreeNode),
TypeInfo(TCustomDrawState),
TypeInfo(TCustomDrawStage),
TypeInfo(Boolean),
TypeInfo(Boolean)]);

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

{RegisterEvent(TypeInfo(TTVCreateNodeClassEvent),[
TypeInfo(TCustomTreeView),
TypeInfo(TTreeNodeClass)]);}

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

RegisterEvent(TypeInfo(TUDChangingEventEx),[
TypeInfo(TObject),
TypeInfo(Boolean),
TypeInfo(SmallInt),
TypeInfo(TUpDownDirection)]);

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
