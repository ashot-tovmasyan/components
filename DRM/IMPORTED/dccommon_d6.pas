{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit dccommon_D6;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  MultiMon,
  Imm,
  Types,
  dcscript,
  ActiveX,
  windows,
  messages,
  shellapi,
  commctrl,
  Classes,
  Sysutils,
  IniFiles,
  graphics,
  forms,
  controls,
  menus,
  StdCtrls,
  buttons,
  comctrls,
  consts,
  typinfo,
  dcsystem,
  dcdreamlib,
  dcconsts,
  ActnList,
  imglist,
  dcapi,
  dccommon;
function ConvertTCreateParamsToVariant(var R : TCreateParams) : OleVariant;
function ConvertVariantToTCreateParams(const V : OleVariant) : TCreateParams;
function ConvertTMessageToVariant(var R : TMessage) : OleVariant;
function ConvertVariantToTMessage(const V : OleVariant) : TMessage;
function ConvertTRectToVariant(var R : TRect) : OleVariant;
function ConvertVariantToTRect(const V : OleVariant) : TRect;
function ConvertTTextMetricToVariant(var R : TTextMetric) : OleVariant;
function ConvertVariantToTTextMetric(const V : OleVariant) : TTextMetric;
function ConvertTWMDropFilesToVariant(var R : TWMDropFiles) : OleVariant;
function ConvertVariantToTWMDropFiles(const V : OleVariant) : TWMDropFiles;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TCreateParams__Wrapper = class(TDCRecordWrapper)
private
fR : TCreateParams;
public
function GetRecordPtr : pointer; override;
published
procedure setStyle(const val : DWORD);
function getStyle : DWORD;
property Style : DWORD read getStyle write setStyle;
procedure setExStyle(const val : DWORD);
function getExStyle : DWORD;
property ExStyle : DWORD read getExStyle write setExStyle;
procedure setX(const val : Integer);
function getX : Integer;
property X : Integer read getX write setX;
procedure setY(const val : Integer);
function getY : Integer;
property Y : Integer read getY write setY;
procedure setWidth(const val : Integer);
function getWidth : Integer;
property Width : Integer read getWidth write setWidth;
procedure setHeight(const val : Integer);
function getHeight : Integer;
property Height : Integer read getHeight write setHeight;
end;
type __TTextMetric__Wrapper = class(TDCRecordWrapper)
private
fR : TTextMetric;
public
function GetRecordPtr : pointer; override;
published
procedure settmHeight(const val : Longint);
function gettmHeight : Longint;
property tmHeight : Longint read gettmHeight write settmHeight;
procedure settmAscent(const val : Longint);
function gettmAscent : Longint;
property tmAscent : Longint read gettmAscent write settmAscent;
procedure settmDescent(const val : Longint);
function gettmDescent : Longint;
property tmDescent : Longint read gettmDescent write settmDescent;
procedure settmInternalLeading(const val : Longint);
function gettmInternalLeading : Longint;
property tmInternalLeading : Longint read gettmInternalLeading write settmInternalLeading;
procedure settmExternalLeading(const val : Longint);
function gettmExternalLeading : Longint;
property tmExternalLeading : Longint read gettmExternalLeading write settmExternalLeading;
procedure settmAveCharWidth(const val : Longint);
function gettmAveCharWidth : Longint;
property tmAveCharWidth : Longint read gettmAveCharWidth write settmAveCharWidth;
procedure settmMaxCharWidth(const val : Longint);
function gettmMaxCharWidth : Longint;
property tmMaxCharWidth : Longint read gettmMaxCharWidth write settmMaxCharWidth;
procedure settmWeight(const val : Longint);
function gettmWeight : Longint;
property tmWeight : Longint read gettmWeight write settmWeight;
procedure settmOverhang(const val : Longint);
function gettmOverhang : Longint;
property tmOverhang : Longint read gettmOverhang write settmOverhang;
procedure settmDigitizedAspectX(const val : Longint);
function gettmDigitizedAspectX : Longint;
property tmDigitizedAspectX : Longint read gettmDigitizedAspectX write settmDigitizedAspectX;
procedure settmDigitizedAspectY(const val : Longint);
function gettmDigitizedAspectY : Longint;
property tmDigitizedAspectY : Longint read gettmDigitizedAspectY write settmDigitizedAspectY;
procedure settmFirstChar(const val : AnsiChar);
function gettmFirstChar : AnsiChar;
property tmFirstChar : AnsiChar read gettmFirstChar write settmFirstChar;
procedure settmLastChar(const val : AnsiChar);
function gettmLastChar : AnsiChar;
property tmLastChar : AnsiChar read gettmLastChar write settmLastChar;
procedure settmDefaultChar(const val : AnsiChar);
function gettmDefaultChar : AnsiChar;
property tmDefaultChar : AnsiChar read gettmDefaultChar write settmDefaultChar;
procedure settmBreakChar(const val : AnsiChar);
function gettmBreakChar : AnsiChar;
property tmBreakChar : AnsiChar read gettmBreakChar write settmBreakChar;
procedure settmItalic(const val : Byte);
function gettmItalic : Byte;
property tmItalic : Byte read gettmItalic write settmItalic;
procedure settmUnderlined(const val : Byte);
function gettmUnderlined : Byte;
property tmUnderlined : Byte read gettmUnderlined write settmUnderlined;
procedure settmStruckOut(const val : Byte);
function gettmStruckOut : Byte;
property tmStruckOut : Byte read gettmStruckOut write settmStruckOut;
procedure settmPitchAndFamily(const val : Byte);
function gettmPitchAndFamily : Byte;
property tmPitchAndFamily : Byte read gettmPitchAndFamily write settmPitchAndFamily;
procedure settmCharSet(const val : Byte);
function gettmCharSet : Byte;
property tmCharSet : Byte read gettmCharSet write settmCharSet;
end;
type __TMessage__Wrapper = class(TDCRecordWrapper)
private
fR : TMessage;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setWParam(const val : Longint);
function getWParam : Longint;
property WParam : Longint read getWParam write setWParam;
procedure setLParam(const val : Longint);
function getLParam : Longint;
property LParam : Longint read getLParam write setLParam;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
procedure setWParamLo(const val : Word);
function getWParamLo : Word;
property WParamLo : Word read getWParamLo write setWParamLo;
procedure setWParamHi(const val : Word);
function getWParamHi : Word;
property WParamHi : Word read getWParamHi write setWParamHi;
procedure setLParamLo(const val : Word);
function getLParamLo : Word;
property LParamLo : Word read getLParamLo write setLParamLo;
procedure setLParamHi(const val : Word);
function getLParamHi : Word;
property LParamHi : Word read getLParamHi write setLParamHi;
procedure setResultLo(const val : Word);
function getResultLo : Word;
property ResultLo : Word read getResultLo write setResultLo;
procedure setResultHi(const val : Word);
function getResultHi : Word;
property ResultHi : Word read getResultHi write setResultHi;
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
type __TWMDropFiles__Wrapper = class(TDCRecordWrapper)
private
fR : TWMDropFiles;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setDrop(const val : THandle);
function getDrop : THandle;
property Drop : THandle read getDrop write setDrop;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type
_T0 = procedure (const p0 : IDispatch;
p1 : TBorderStyle;
p2 : Boolean) of object;

_T1 = function (p0 : TFont): IDispatch of object;

_T2 = function (p0 : THandle;
p1 : Integer): Integer of object;

_T3 = procedure (p0 : HWnd;
p1 : Integer;
p2 : Integer) of object;

_T4 = procedure (p0 : HWnd;
p1 : Integer;
p2 : Integer;
p3 : Integer;
p4 : Integer) of object;

_T5 = function (p0 : TFont): Integer of object;

_T6 = _T5;

_T7 = _T5;

_T8 = _T5;

_T9 = function (p0 : TFont): Boolean of object;

_T10 = function (const p0 : string;
const p1 : string): Boolean of object;

_T11 = function (const p0 : string): Boolean of object;

_T12 = _T11;

_T13 = _T11;

_T14 = function : Integer of object;

_T15 = function (p0 : Integer): TCustomForm of object;

{_T16 = function (p0 : TComponentClass): TCustomForm of object;}

{_T17 = function (p0 : TComponentClass): TDataModule of object;}

_T18 = procedure (p0 : TComponent;
p1 : Boolean) of object;

_T19 = function (p0 : TPersistent): TComponent of object;

_T20 = function (p0 : TPersistent): TCustomForm of object;

_T21 = procedure (p0 : TComponent) of object;

_T22 = procedure (p0 : TPersistent) of object;

_T23 = _T21;

{_T24 = function (p0 : TClass): TCustomForm of object;}

_T25 = function (p0 : TCustomForm): Boolean of object;

{_T26 = function (p0 : TCustomFormClass;
p1 : TComponent): TCustomForm of object;}

_T27 = function (const p0 : string): TComponent of object;

{_T28 = function (p0 : TClass): THandle of object;}

_T29 = procedure (p0 : TWinControl) of object;

_T30 = procedure (p0 : TWinControl;
const p1 : string) of object;

_T31 = _T30;

{_T32 = procedure (p0 : TComponentClass;
p1 : TAssignVerbProc) of object;}

_T33 = procedure (const p0 : IDispatch;
p1 : TCustomForm;
p2 : Boolean) of object;

_T34 = procedure (p0 : TWinControl;
const p1 : string;
const p2 : string;
const p3 : string) of object;

_T35 = _T34;

_T36 = procedure (const p0 : string) of object;

_T37 = procedure  of object;

_T38 = _T37;

_T39 = _T37;

_T40 = procedure (p0 : TTabControl;
p1 : Boolean) of object;

_T41 = procedure (p0 : TTabControl;
const p1 : string) of object;

_T42 = procedure (p0 : TStrings) of object;

{_T43 = function (const p0 : string;
p1 : PChar): THandle of object;}

_T44 = function (p0 : TStream): Boolean of object;

_T45 = procedure (p0 : TMenuItem;
p1 : Boolean) of object;

_T46 = procedure (p0 : TMenuItem) of object;

_T47 = procedure (p0 : TCustomForm) of object;

_T48 = procedure (p0 : TList) of object;

_T49 = _T48;

_T50 = _T11;

_T51 = procedure (p0 : TPageControl;
p1 : TPageControl) of object;

_T52 = procedure (p0 : TCustomImageList;
p1 : TBitmap;
p2 : TColor;
p3 : Integer) of object;

_T53 = procedure (p0 : TBitmap) of object;

_T54 = procedure (p0 : TBitmap;
p1 : TColor;
p2 : TColor) of object;

_T55 = procedure (p0 : THandle;
p1 : Integer;
p2 : Integer;
p3 : Integer;
p4 : Integer;
p5 : THandle;
p6 : Integer;
p7 : Integer;
p8 : Integer;
p9 : Integer;
p10 : TColor) of object;

_T56 = procedure (p0 : TCanvas;
p1 : TPersistent;
p2 : TColor;
const p3 : IDispatch;
p4 : Integer) of object;

{_T57 = procedure (const p0 : string;
const p1 : Array of TBasicActionClass;
p2 : TComponentClass) of object;}

_T58 = function (const p0 : string;
var p1 : string): Boolean of object;

_T59 = function (const p0 : Boolean;
const p1 : Boolean;
p2 : Char;
const p3 : IDispatch): string of object;

_T60 = _T44;

_T61 = function (p0 : TStream): string of object;

{_T62 = function (p0 : TCustomFormClass): string of object;}

{_T63 = procedure (p0 : TCustomFormClass;
const p1 : string) of object;}

{_T64 = procedure (p0 : TCustomFormClass;
p1 : Integer;
const p2 : string) of object;}

{_T65 = procedure (p0 : TCustomFormClass) of object;}

_T66 = procedure (const p0 : Array of TSpeedButton;
p1 : Boolean) of object;

_T67 = _T18;

_T68 = function : TSortedList of object;

{_T69 = function (p0 : Integer): TCustomFormClass of object;}

_T70 = function : TStringList of object;

_T71 = _T53;

{_T72 = function (p0 : PTypeData;
p1 : PTypeData): Boolean of object;}

_T73 = _T37;

_T74 = _T27;

_T75 = procedure (p0 : TCompFiler) of object;

_T76 = procedure (p0 : TReader;
const p1 : string;
var p2 : Boolean) of object;

_T77 = procedure (p0 : TReader;
const p1 : string;
var p2 : Pointer;
var p3 : Boolean) of object;

_T78 = function (const p0 : string): Integer of object;

_T79 = _T18;

_T80 = _T21;

_T81 = _T21;

_T82 = _T21;

_T83 = _T18;

_T84 = _T21;

_T85 = function (p0 : Integer): string of object;

_T86 = _T37;

_T87 = function (p0 : TStream;
p1 : TComponent): string of object;

_T88 = procedure (p0 : TStream;
p1 : TComponent) of object;

_T89 = procedure (const p0 : TFileName;
p1 : TComponent) of object;

_T90 = _T89;

{_T91 = function (p0 : TStream;
p1 : TComponentClass;
p2 : Boolean): TComponent of object;}

{_T92 = function (const p0 : TFileName;
p1 : TComponentClass;
p2 : Boolean): TComponent of object;}

_T93 = function : string of object;

{_T94 = function : IOleObject of object;}

_T95 = procedure (p0 : Integer;
const p1 : string) of object;

_T96 = _T85;

_T97 = _T37;

_T98 = _T37;

_T99 = function (p0 : Char): Boolean of object;

_T100 = procedure (p0 : TObject) of object;

_T101 = procedure (p0 : Integer;
p1 : Integer;
p2 : Integer) of object;

_T102 = procedure (p0 : TStream) of object;

_T103 = _T102;

_T104 = procedure (const p0 : string;
const p1 : string) of object;

_T105 = _T104;

_T106 = _T37;

_T107 = _T37;

{_T108 = procedure (p0 : TWndMethod) of object;}

_T109 = procedure (p0 : TPersistent;
const p1 : string;
p2 : Integer) of object;

_T110 = procedure (p0 : Integer) of object;

_T111 = _T37;

_T112 = _T37;

_T113 = _T100;

function __TCreateParams__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCreateParams__Wrapper.setStyle(const val : DWORD);
begin
TCreateParams(GetRecordPtr^).Style := val;
end;
function __TCreateParams__Wrapper.getStyle : DWORD;
begin
result := TCreateParams(GetRecordPtr^).Style;
end;
procedure __TCreateParams__Wrapper.setExStyle(const val : DWORD);
begin
TCreateParams(GetRecordPtr^).ExStyle := val;
end;
function __TCreateParams__Wrapper.getExStyle : DWORD;
begin
result := TCreateParams(GetRecordPtr^).ExStyle;
end;
procedure __TCreateParams__Wrapper.setX(const val : Integer);
begin
TCreateParams(GetRecordPtr^).X := val;
end;
function __TCreateParams__Wrapper.getX : Integer;
begin
result := TCreateParams(GetRecordPtr^).X;
end;
procedure __TCreateParams__Wrapper.setY(const val : Integer);
begin
TCreateParams(GetRecordPtr^).Y := val;
end;
function __TCreateParams__Wrapper.getY : Integer;
begin
result := TCreateParams(GetRecordPtr^).Y;
end;
procedure __TCreateParams__Wrapper.setWidth(const val : Integer);
begin
TCreateParams(GetRecordPtr^).Width := val;
end;
function __TCreateParams__Wrapper.getWidth : Integer;
begin
result := TCreateParams(GetRecordPtr^).Width;
end;
procedure __TCreateParams__Wrapper.setHeight(const val : Integer);
begin
TCreateParams(GetRecordPtr^).Height := val;
end;
function __TCreateParams__Wrapper.getHeight : Integer;
begin
result := TCreateParams(GetRecordPtr^).Height;
end;
function __TTextMetric__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TTextMetric__Wrapper.settmHeight(const val : Longint);
begin
TTextMetric(GetRecordPtr^).tmHeight := val;
end;
function __TTextMetric__Wrapper.gettmHeight : Longint;
begin
result := TTextMetric(GetRecordPtr^).tmHeight;
end;
procedure __TTextMetric__Wrapper.settmAscent(const val : Longint);
begin
TTextMetric(GetRecordPtr^).tmAscent := val;
end;
function __TTextMetric__Wrapper.gettmAscent : Longint;
begin
result := TTextMetric(GetRecordPtr^).tmAscent;
end;
procedure __TTextMetric__Wrapper.settmDescent(const val : Longint);
begin
TTextMetric(GetRecordPtr^).tmDescent := val;
end;
function __TTextMetric__Wrapper.gettmDescent : Longint;
begin
result := TTextMetric(GetRecordPtr^).tmDescent;
end;
procedure __TTextMetric__Wrapper.settmInternalLeading(const val : Longint);
begin
TTextMetric(GetRecordPtr^).tmInternalLeading := val;
end;
function __TTextMetric__Wrapper.gettmInternalLeading : Longint;
begin
result := TTextMetric(GetRecordPtr^).tmInternalLeading;
end;
procedure __TTextMetric__Wrapper.settmExternalLeading(const val : Longint);
begin
TTextMetric(GetRecordPtr^).tmExternalLeading := val;
end;
function __TTextMetric__Wrapper.gettmExternalLeading : Longint;
begin
result := TTextMetric(GetRecordPtr^).tmExternalLeading;
end;
procedure __TTextMetric__Wrapper.settmAveCharWidth(const val : Longint);
begin
TTextMetric(GetRecordPtr^).tmAveCharWidth := val;
end;
function __TTextMetric__Wrapper.gettmAveCharWidth : Longint;
begin
result := TTextMetric(GetRecordPtr^).tmAveCharWidth;
end;
procedure __TTextMetric__Wrapper.settmMaxCharWidth(const val : Longint);
begin
TTextMetric(GetRecordPtr^).tmMaxCharWidth := val;
end;
function __TTextMetric__Wrapper.gettmMaxCharWidth : Longint;
begin
result := TTextMetric(GetRecordPtr^).tmMaxCharWidth;
end;
procedure __TTextMetric__Wrapper.settmWeight(const val : Longint);
begin
TTextMetric(GetRecordPtr^).tmWeight := val;
end;
function __TTextMetric__Wrapper.gettmWeight : Longint;
begin
result := TTextMetric(GetRecordPtr^).tmWeight;
end;
procedure __TTextMetric__Wrapper.settmOverhang(const val : Longint);
begin
TTextMetric(GetRecordPtr^).tmOverhang := val;
end;
function __TTextMetric__Wrapper.gettmOverhang : Longint;
begin
result := TTextMetric(GetRecordPtr^).tmOverhang;
end;
procedure __TTextMetric__Wrapper.settmDigitizedAspectX(const val : Longint);
begin
TTextMetric(GetRecordPtr^).tmDigitizedAspectX := val;
end;
function __TTextMetric__Wrapper.gettmDigitizedAspectX : Longint;
begin
result := TTextMetric(GetRecordPtr^).tmDigitizedAspectX;
end;
procedure __TTextMetric__Wrapper.settmDigitizedAspectY(const val : Longint);
begin
TTextMetric(GetRecordPtr^).tmDigitizedAspectY := val;
end;
function __TTextMetric__Wrapper.gettmDigitizedAspectY : Longint;
begin
result := TTextMetric(GetRecordPtr^).tmDigitizedAspectY;
end;
procedure __TTextMetric__Wrapper.settmFirstChar(const val : AnsiChar);
begin
TTextMetric(GetRecordPtr^).tmFirstChar := val;
end;
function __TTextMetric__Wrapper.gettmFirstChar : AnsiChar;
begin
result := TTextMetric(GetRecordPtr^).tmFirstChar;
end;
procedure __TTextMetric__Wrapper.settmLastChar(const val : AnsiChar);
begin
TTextMetric(GetRecordPtr^).tmLastChar := val;
end;
function __TTextMetric__Wrapper.gettmLastChar : AnsiChar;
begin
result := TTextMetric(GetRecordPtr^).tmLastChar;
end;
procedure __TTextMetric__Wrapper.settmDefaultChar(const val : AnsiChar);
begin
TTextMetric(GetRecordPtr^).tmDefaultChar := val;
end;
function __TTextMetric__Wrapper.gettmDefaultChar : AnsiChar;
begin
result := TTextMetric(GetRecordPtr^).tmDefaultChar;
end;
procedure __TTextMetric__Wrapper.settmBreakChar(const val : AnsiChar);
begin
TTextMetric(GetRecordPtr^).tmBreakChar := val;
end;
function __TTextMetric__Wrapper.gettmBreakChar : AnsiChar;
begin
result := TTextMetric(GetRecordPtr^).tmBreakChar;
end;
procedure __TTextMetric__Wrapper.settmItalic(const val : Byte);
begin
TTextMetric(GetRecordPtr^).tmItalic := val;
end;
function __TTextMetric__Wrapper.gettmItalic : Byte;
begin
result := TTextMetric(GetRecordPtr^).tmItalic;
end;
procedure __TTextMetric__Wrapper.settmUnderlined(const val : Byte);
begin
TTextMetric(GetRecordPtr^).tmUnderlined := val;
end;
function __TTextMetric__Wrapper.gettmUnderlined : Byte;
begin
result := TTextMetric(GetRecordPtr^).tmUnderlined;
end;
procedure __TTextMetric__Wrapper.settmStruckOut(const val : Byte);
begin
TTextMetric(GetRecordPtr^).tmStruckOut := val;
end;
function __TTextMetric__Wrapper.gettmStruckOut : Byte;
begin
result := TTextMetric(GetRecordPtr^).tmStruckOut;
end;
procedure __TTextMetric__Wrapper.settmPitchAndFamily(const val : Byte);
begin
TTextMetric(GetRecordPtr^).tmPitchAndFamily := val;
end;
function __TTextMetric__Wrapper.gettmPitchAndFamily : Byte;
begin
result := TTextMetric(GetRecordPtr^).tmPitchAndFamily;
end;
procedure __TTextMetric__Wrapper.settmCharSet(const val : Byte);
begin
TTextMetric(GetRecordPtr^).tmCharSet := val;
end;
function __TTextMetric__Wrapper.gettmCharSet : Byte;
begin
result := TTextMetric(GetRecordPtr^).tmCharSet;
end;
function __TMessage__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TMessage__Wrapper.setMsg(const val : Cardinal);
begin
TMessage(GetRecordPtr^).Msg := val;
end;
function __TMessage__Wrapper.getMsg : Cardinal;
begin
result := TMessage(GetRecordPtr^).Msg;
end;
procedure __TMessage__Wrapper.setWParam(const val : Longint);
begin
TMessage(GetRecordPtr^).WParam := val;
end;
function __TMessage__Wrapper.getWParam : Longint;
begin
result := TMessage(GetRecordPtr^).WParam;
end;
procedure __TMessage__Wrapper.setLParam(const val : Longint);
begin
TMessage(GetRecordPtr^).LParam := val;
end;
function __TMessage__Wrapper.getLParam : Longint;
begin
result := TMessage(GetRecordPtr^).LParam;
end;
procedure __TMessage__Wrapper.setResult(const val : Longint);
begin
TMessage(GetRecordPtr^).Result := val;
end;
function __TMessage__Wrapper.getResult : Longint;
begin
result := TMessage(GetRecordPtr^).Result;
end;
procedure __TMessage__Wrapper.setWParamLo(const val : Word);
begin
TMessage(GetRecordPtr^).WParamLo := val;
end;
function __TMessage__Wrapper.getWParamLo : Word;
begin
result := TMessage(GetRecordPtr^).WParamLo;
end;
procedure __TMessage__Wrapper.setWParamHi(const val : Word);
begin
TMessage(GetRecordPtr^).WParamHi := val;
end;
function __TMessage__Wrapper.getWParamHi : Word;
begin
result := TMessage(GetRecordPtr^).WParamHi;
end;
procedure __TMessage__Wrapper.setLParamLo(const val : Word);
begin
TMessage(GetRecordPtr^).LParamLo := val;
end;
function __TMessage__Wrapper.getLParamLo : Word;
begin
result := TMessage(GetRecordPtr^).LParamLo;
end;
procedure __TMessage__Wrapper.setLParamHi(const val : Word);
begin
TMessage(GetRecordPtr^).LParamHi := val;
end;
function __TMessage__Wrapper.getLParamHi : Word;
begin
result := TMessage(GetRecordPtr^).LParamHi;
end;
procedure __TMessage__Wrapper.setResultLo(const val : Word);
begin
TMessage(GetRecordPtr^).ResultLo := val;
end;
function __TMessage__Wrapper.getResultLo : Word;
begin
result := TMessage(GetRecordPtr^).ResultLo;
end;
procedure __TMessage__Wrapper.setResultHi(const val : Word);
begin
TMessage(GetRecordPtr^).ResultHi := val;
end;
function __TMessage__Wrapper.getResultHi : Word;
begin
result := TMessage(GetRecordPtr^).ResultHi;
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
function __TWMDropFiles__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMDropFiles__Wrapper.setMsg(const val : Cardinal);
begin
TWMDropFiles(GetRecordPtr^).Msg := val;
end;
function __TWMDropFiles__Wrapper.getMsg : Cardinal;
begin
result := TWMDropFiles(GetRecordPtr^).Msg;
end;
procedure __TWMDropFiles__Wrapper.setDrop(const val : THandle);
begin
TWMDropFiles(GetRecordPtr^).Drop := val;
end;
function __TWMDropFiles__Wrapper.getDrop : THandle;
begin
result := TWMDropFiles(GetRecordPtr^).Drop;
end;
procedure __TWMDropFiles__Wrapper.setUnused(const val : Longint);
begin
TWMDropFiles(GetRecordPtr^).Unused := val;
end;
function __TWMDropFiles__Wrapper.getUnused : Longint;
begin
result := TWMDropFiles(GetRecordPtr^).Unused;
end;
procedure __TWMDropFiles__Wrapper.setResult(const val : Longint);
begin
TWMDropFiles(GetRecordPtr^).Result := val;
end;
function __TWMDropFiles__Wrapper.getResult : Longint;
begin
result := TWMDropFiles(GetRecordPtr^).Result;
end;
procedure ____UpdateParamsWithBorderStyle__Wrapper(const p0 : IDispatch;
p1 : TBorderStyle;
p2 : Boolean);
var
__p0 : ^TCreateParams;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
UpdateParamsWithBorderStyle(__p0^,p1,p2);
end;

function ____GetFontMetrics__Wrapper(p0 : TFont): IDispatch;
var
__result : TTextMetric;
__wrapper : __TTextMetric__Wrapper;
begin
__result := GetFontMetrics(p0);
__wrapper := __TTextMetric__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

procedure ____CalcEditorMinMaxInfo__Wrapper(const p0 : IDispatch;
p1 : TCustomForm;
p2 : Boolean);
var
__p0 : ^TMessage;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
CalcEditorMinMaxInfo(__p0^,p1,p2);
end;

procedure ____DrawImage__Wrapper(p0 : TCanvas;
p1 : TPersistent;
p2 : TColor;
const p3 : IDispatch;
p4 : Integer);
var
__p3 : ^TRect;
__i3 : IDispatch;
begin
if p3 = nil then exit;
__p3 := (p3 as IDCRecordWrapper).GetRecordPtr;
DrawImage(p0,p1,p2,__p3^,p4);
end;

function ____DropFiles__Wrapper(const p0 : Boolean;
const p1 : Boolean;
p2 : Char;
const p3 : IDispatch): string;
var
__p3 : ^TWMDropFiles;
__i3 : IDispatch;
begin
if p3 = nil then exit;
__p3 := (p3 as IDCRecordWrapper).GetRecordPtr;
result := DropFiles(p0,p1,p2,__p3^);
end;


type __TCreateParams__Wrapper__ = class(__TCreateParams__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCreateParams__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCreateParamsToVariant(var R : TCreateParams) : OleVariant;
var
__rw : __TCreateParams__Wrapper__;
begin
__rw := __TCreateParams__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCreateParams(const V : OleVariant) : TCreateParams;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCreateParams((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TMessage__Wrapper__ = class(__TMessage__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TMessage__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTMessageToVariant(var R : TMessage) : OleVariant;
var
__rw : __TMessage__Wrapper__;
begin
__rw := __TMessage__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTMessage(const V : OleVariant) : TMessage;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TMessage((_idisp as IDCRecordWrapper).GetRecordPtr^);
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

type __TTextMetric__Wrapper__ = class(__TTextMetric__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TTextMetric__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTTextMetricToVariant(var R : TTextMetric) : OleVariant;
var
__rw : __TTextMetric__Wrapper__;
begin
__rw := __TTextMetric__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTTextMetric(const V : OleVariant) : TTextMetric;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TTextMetric((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMDropFiles__Wrapper__ = class(__TWMDropFiles__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMDropFiles__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMDropFilesToVariant(var R : TWMDropFiles) : OleVariant;
var
__rw : __TWMDropFiles__Wrapper__;
begin
__rw := __TWMDropFiles__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMDropFiles(const V : OleVariant) : TWMDropFiles;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMDropFiles((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTCompFiler__EventNames(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCompFiler(Instance).EventNames);
end;

function __DC__GetTCompFiler__FilerErrors(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCompFiler(Instance).FilerErrors;
end;

function __DC__GetTCompFiler__IgnoreDesignedForms(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCompFiler(Instance).IgnoreDesignedForms;
end;

procedure __DC__SetTCompFiler__IgnoreDesignedForms(Instance : TObject; Params : PVariantArgList);
begin
TCompFiler(Instance).IgnoreDesignedForms:=OleVariant(Params^[0]);
end;

function __DC__GetTCompFiler__CompClassName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCompFiler(Instance).CompClassName;
end;

function __DC__GetTCustomDCOleControl__OleName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCOleControl(Instance).OleName;
end;

function __DC__GetTDCCustomControl__Keys(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCCustomControl(Instance).Keys);
end;

function __DC__GetTDCCustomControl__KeyState(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDCCustomControl(Instance).KeyState;
end;

procedure __DC__SetTDCCustomControl__KeyState(Instance : TObject; Params : PVariantArgList);
begin
TDCCustomControl(Instance).KeyState:=OleVariant(Params^[0]);
end;

function __DC__GetTDCCustomControl__KeyMapping(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDCCustomControl(Instance).KeyMapping;
end;

procedure __DC__SetTDCCustomControl__KeyMapping(Instance : TObject; Params : PVariantArgList);
begin
TDCCustomControl(Instance).KeyMapping:=OleVariant(Params^[0]);
end;

function __DC__GetTDCCustomControl__WantReturns(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDCCustomControl(Instance).WantReturns;
end;

procedure __DC__SetTDCCustomControl__WantReturns(Instance : TObject; Params : PVariantArgList);
begin
TDCCustomControl(Instance).WantReturns:=OleVariant(Params^[0]);
end;

function __DC__GetTDCCustomControl__WantTabs(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDCCustomControl(Instance).WantTabs;
end;

procedure __DC__SetTDCCustomControl__WantTabs(Instance : TObject; Params : PVariantArgList);
begin
TDCCustomControl(Instance).WantTabs:=OleVariant(Params^[0]);
end;

function __DC__GetTDCCustomControl__OemConvert(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDCCustomControl(Instance).OemConvert;
end;

procedure __DC__SetTDCCustomControl__OemConvert(Instance : TObject; Params : PVariantArgList);
begin
TDCCustomControl(Instance).OemConvert:=OleVariant(Params^[0]);
end;

function __DC__GetTHandleObject__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := THandleObject(Instance).Handle;
end;

function __DC__GetTPropFileSystem__Component(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TPropFileSystem(Instance).Component);
end;

procedure __DC__SetTPropFileSystem__Component(Instance : TObject; Params : PVariantArgList);
begin
TPropFileSystem(Instance).Component:=TComponent(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTVerbList__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TVerbList(Instance).Items[OleVariant(Params^[0])]);
end;

procedure __DC__SetTVerbList__Items(Instance : TObject; Params : PVariantArgList);
begin
TVerbList(Instance).Items[OleVariant(Params^[1])]:=TVerbListItem(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTVerbListItem__VerbStates(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TVerbStates;
begin
tmp := TVerbListItem(Instance).VerbStates;
result := VarFromSet(tmp, sizeof(tmp));
end;

function __DC__GetTVerbListItem__ClearHandler(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TVerbListItem(Instance).ClearHandler;
end;

procedure __RegisterProps;
begin
RegisterProperty(TCompFiler,'EventNames',__DC__GetTCompFiler__EventNames,nil);
RegisterProperty(TCompFiler,'FilerErrors',__DC__GetTCompFiler__FilerErrors,nil);
RegisterProperty(TCompFiler,'IgnoreDesignedForms',__DC__GetTCompFiler__IgnoreDesignedForms,__DC__SetTCompFiler__IgnoreDesignedForms);
RegisterProperty(TCompFiler,'CompClassName',__DC__GetTCompFiler__CompClassName,nil);
RegisterProperty(TCustomDCOleControl,'OleName',__DC__GetTCustomDCOleControl__OleName,nil);
RegisterProperty(TDCCustomControl,'Keys',__DC__GetTDCCustomControl__Keys,nil);
RegisterProperty(TDCCustomControl,'KeyState',__DC__GetTDCCustomControl__KeyState,__DC__SetTDCCustomControl__KeyState);
RegisterProperty(TDCCustomControl,'KeyMapping',__DC__GetTDCCustomControl__KeyMapping,__DC__SetTDCCustomControl__KeyMapping);
RegisterProperty(TDCCustomControl,'WantReturns',__DC__GetTDCCustomControl__WantReturns,__DC__SetTDCCustomControl__WantReturns);
RegisterProperty(TDCCustomControl,'WantTabs',__DC__GetTDCCustomControl__WantTabs,__DC__SetTDCCustomControl__WantTabs);
RegisterProperty(TDCCustomControl,'OemConvert',__DC__GetTDCCustomControl__OemConvert,__DC__SetTDCCustomControl__OemConvert);
RegisterProperty(THandleObject,'Handle',__DC__GetTHandleObject__Handle,nil);
RegisterProperty(TPropFileSystem,'Component',__DC__GetTPropFileSystem__Component,__DC__SetTPropFileSystem__Component);
RegisterIndexedProperty(TVerbList,'Items',1,True,__DC__GetTVerbList__Items,__DC__SetTVerbList__Items);
RegisterProperty(TVerbListItem,'VerbStates',__DC__GetTVerbListItem__VerbStates,nil);
RegisterProperty(TVerbListItem,'ClearHandler',__DC__GetTVerbListItem__ClearHandler,nil);
end;

function __DC__Getdccommon__UseOneFont(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := dccommon.UseOneFont;
end;

procedure __DC__Setdccommon__UseOneFont(Instance : TObject; Params : PVariantArgList);
begin
dccommon.UseOneFont:=OleVariant(Params^[0]);
end;

function __DC__Getdccommon__FMainForm(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(dccommon.FMainForm);
end;

procedure __DC__Setdccommon__FMainForm(Instance : TObject; Params : PVariantArgList);
begin
TObject(dccommon.FMainForm):=(VarToObject(OleVariant(Params^[0])));
end;

function __DC__Getdccommon__HotCharSet(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TCharSet;
begin
result := VarFromSet(dccommon.HotCharSet, sizeof(dccommon.HotCharSet));
end;

procedure __DC__Setdccommon__HotCharSet(Instance : TObject; Params : PVariantArgList);
begin
VarToSet(dccommon.HotCharSet, sizeof(dccommon.HotCharSet), Variant(Params^[0]));
end;

function __DC__Getdccommon__SaveFormAsText(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := dccommon.SaveFormAsText;
end;

procedure __DC__Setdccommon__SaveFormAsText(Instance : TObject; Params : PVariantArgList);
begin
dccommon.SaveFormAsText:=OleVariant(Params^[0]);
end;

var __RegisteredVars : TList;
procedure __RegisterVars;
begin
__RegisteredVars := TList.Create;
__RegisteredVars.Add(RegisterVar('UseOneFont',__DC__Getdccommon__UseOneFont,__DC__Setdccommon__UseOneFont));
__RegisteredVars.Add(RegisterVar('FMainForm',__DC__Getdccommon__FMainForm,__DC__Setdccommon__FMainForm));
__RegisteredVars.Add(RegisterVar('HotCharSet',__DC__Getdccommon__HotCharSet,__DC__Setdccommon__HotCharSet));
__RegisteredVars.Add(RegisterVar('SaveFormAsText',__DC__Getdccommon__SaveFormAsText,__DC__Setdccommon__SaveFormAsText));
end;

procedure __UnregisterVars;
begin
__RegisteredVars.Free;
end;

const __ConstNames0 : array[0..39] of string = (
'cOtherIdentChars'
,'Key_A'
,'Key_B'
,'Key_C'
,'Key_D'
,'Key_E'
,'Key_F'
,'Key_G'
,'Key_H'
,'Key_I'
,'Key_J'
,'Key_K'
,'Key_L'
,'Key_M'
,'Key_N'
,'Key_O'
,'Key_P'
,'Key_Q'
,'Key_R'
,'Key_S'
,'Key_T'
,'Key_U'
,'Key_V'
,'Key_W'
,'Key_X'
,'Key_Y'
,'Key_Z'
,'Key_0'
,'Key_1'
,'Key_2'
,'Key_3'
,'Key_4'
,'Key_5'
,'Key_6'
,'Key_7'
,'Key_8'
,'Key_9'
,'Key_QuoteLeft'
,'Key_BracketLeft'
,'Key_BracketRight'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,VarFromSet(cOtherIdentChars, sizeof(cOtherIdentChars))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,Key_A));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,Key_B));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,Key_C));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,Key_D));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,Key_E));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,Key_F));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,Key_G));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,Key_H));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,Key_I));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,Key_J));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,Key_K));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,Key_L));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,Key_M));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,Key_N));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,Key_O));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,Key_P));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,Key_Q));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,Key_R));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,Key_S));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,Key_T));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,Key_U));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,Key_V));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,Key_W));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,Key_X));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,Key_Y));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,Key_Z));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,Key_0));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,Key_1));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,Key_2));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,Key_3));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,Key_4));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,Key_5));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,Key_6));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,Key_7));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,Key_8));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,Key_9));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,Key_QuoteLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,Key_BracketLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,Key_BracketRight));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..12] of TClass = (
TCompFiler,
TCustomDCOleControl,
TDCCustomControl,
TDCHandleObject,
TDCPropStore,
TDCSpeedButton,
TDCTabControl,
THandleObject,
TPropFileSystem,
TPropStream,
TVerbDispatcher,
TVerbList,
TVerbListItem
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..59] of string = (
'UpdateParamsWithBorderStyle'
,'GetFontMetrics'
,'GetScrollPosEx'
,'_SetScrollPos'
,'_SetScrollSize'
,'GetMaxFontWidth'
,'GetAveFontWidth'
,'GetMaxFontHeight'
,'GetMinFontHeight'
,'IsFontMonoSpaced'
,'CheckFileExt'
,'IsStringHot'
,'IsWWWString'
,'IsEmailString'
,'ScreenFormCount'
,'ScreenForms'
,'SetDesign'
,'GetTopOwner'
,'GetPForm'
,'CallCompOnCreate'
,'DesignerModified'
,'DesignerSelectComponent'
,'FormIsActive'
,'GlobalFindObject'
,'UpdateEditors'
,'WriteWinPosToReg'
,'ReadWinPosFromReg'
,'CalcEditorMinMaxInfo'
,'WriteWinPosToIni'
,'ReadWinPosFromIni'
,'JumpToURL'
,'WriteToUs'
,'HomePage'
,'OnlineRegistration'
,'ChangeTab'
,'AddNewTab'
,'GetLoadedPackagesPaths'
,'StreamContainsDataModule'
,'ClearMenuSubItems'
,'RemoveExtraMenuSeparators'
,'SetFormFont'
,'ResModulesToList'
,'ModulesToList'
,'FileIsPackage'
,'MovePages'
,'ChangeImageList'
,'CreateBrushPattern'
,'CreateBrushPatternEx'
,'StretchBltTransparent'
,'DrawImage'
,'QueryDirectory'
,'DropFiles'
,'IsTextStream'
,'GetClassNameFromStream'
,'SetFlatProp'
,'SetFlatPropToAll'
,'OptionFormClasses'
,'OptionFormCaptions'
,'CorrectBitmap'
,'Register'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T0),[
TypeInfo(IDispatch),
TypeInfo(TBorderStyle),
TypeInfo(Boolean)],Addr(____UpdateParamsWithBorderStyle__Wrapper),cRegister);

RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T1),[
TypeInfo(TFont),TypeInfo(IDispatch)],Addr(____GetFontMetrics__Wrapper),cRegister);

RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T2),[
TypeInfo(THandle),
TypeInfo(Integer),TypeInfo(Integer)],Addr(GetScrollPosEx),cRegister);

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T3),[
TypeInfo(HWnd),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(_SetScrollPos),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T4),[
TypeInfo(HWnd),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(_SetScrollSize),cRegister);

RegisterProc(nil,MethodNames[5],mtProc,TypeInfo(_T5),[
TypeInfo(TFont),TypeInfo(Integer)],Addr(GetMaxFontWidth),cRegister);

RegisterProc(nil,MethodNames[6],mtProc,TypeInfo(_T6),[
TypeInfo(TFont),TypeInfo(Integer)],Addr(GetAveFontWidth),cRegister);

RegisterProc(nil,MethodNames[7],mtProc,TypeInfo(_T7),[
TypeInfo(TFont),TypeInfo(Integer)],Addr(GetMaxFontHeight),cRegister);

RegisterProc(nil,MethodNames[8],mtProc,TypeInfo(_T8),[
TypeInfo(TFont),TypeInfo(Integer)],Addr(GetMinFontHeight),cRegister);

RegisterProc(nil,MethodNames[9],mtProc,TypeInfo(_T9),[
TypeInfo(TFont),TypeInfo(Boolean)],Addr(IsFontMonoSpaced),cRegister);

RegisterProc(nil,MethodNames[10],mtProc,TypeInfo(_T10),[
TypeInfo(string),
TypeInfo(string),TypeInfo(Boolean)],Addr(CheckFileExt),cRegister);

RegisterProc(nil,MethodNames[11],mtProc,TypeInfo(_T11),[
TypeInfo(string),TypeInfo(Boolean)],Addr(IsStringHot),cRegister);

RegisterProc(nil,MethodNames[12],mtProc,TypeInfo(_T12),[
TypeInfo(string),TypeInfo(Boolean)],Addr(IsWWWString),cRegister);

RegisterProc(nil,MethodNames[13],mtProc,TypeInfo(_T13),[
TypeInfo(string),TypeInfo(Boolean)],Addr(IsEmailString),cRegister);

RegisterProc(nil,MethodNames[14],mtProc,TypeInfo(_T14),[TypeInfo(Integer)],Addr(ScreenFormCount),cRegister);

RegisterProc(nil,MethodNames[15],mtProc,TypeInfo(_T15),[
TypeInfo(Integer),TypeInfo(TCustomForm)],Addr(ScreenForms),cRegister);

RegisterProc(nil,MethodNames[16],mtProc,TypeInfo(_T18),[
TypeInfo(TComponent),
TypeInfo(Boolean)],Addr(SetDesign),cRegister);

RegisterProc(nil,MethodNames[17],mtProc,TypeInfo(_T19),[
TypeInfo(TPersistent),TypeInfo(TComponent)],Addr(GetTopOwner),cRegister);

RegisterProc(nil,MethodNames[18],mtProc,TypeInfo(_T20),[
TypeInfo(TPersistent),TypeInfo(TCustomForm)],Addr(GetPForm),cRegister);

RegisterProc(nil,MethodNames[19],mtProc,TypeInfo(_T21),[
TypeInfo(TComponent)],Addr(CallCompOnCreate),cRegister);

RegisterProc(nil,MethodNames[20],mtProc,TypeInfo(_T22),[
TypeInfo(TPersistent)],Addr(DesignerModified),cRegister);

RegisterProc(nil,MethodNames[21],mtProc,TypeInfo(_T23),[
TypeInfo(TComponent)],Addr(DesignerSelectComponent),cRegister);

RegisterProc(nil,MethodNames[22],mtProc,TypeInfo(_T25),[
TypeInfo(TCustomForm),TypeInfo(Boolean)],Addr(FormIsActive),cRegister);

RegisterProc(nil,MethodNames[23],mtProc,TypeInfo(_T27),[
TypeInfo(string),TypeInfo(TComponent)],Addr(GlobalFindObject),cRegister);

RegisterProc(nil,MethodNames[24],mtProc,TypeInfo(_T29),[
TypeInfo(TWinControl)],Addr(UpdateEditors),cRegister);

RegisterProc(nil,MethodNames[25],mtProc,TypeInfo(_T30),[
TypeInfo(TWinControl),
TypeInfo(string)],Addr(WriteWinPosToReg),cRegister);

RegisterProc(nil,MethodNames[26],mtProc,TypeInfo(_T31),[
TypeInfo(TWinControl),
TypeInfo(string)],Addr(ReadWinPosFromReg),cRegister);

RegisterProc(nil,MethodNames[27],mtProc,TypeInfo(_T33),[
TypeInfo(IDispatch),
TypeInfo(TCustomForm),
TypeInfo(Boolean)],Addr(____CalcEditorMinMaxInfo__Wrapper),cRegister);

RegisterProc(nil,MethodNames[28],mtProc,TypeInfo(_T34),[
TypeInfo(TWinControl),
TypeInfo(string),
TypeInfo(string),
TypeInfo(string)],Addr(WriteWinPosToIni),cRegister);

RegisterProc(nil,MethodNames[29],mtProc,TypeInfo(_T35),[
TypeInfo(TWinControl),
TypeInfo(string),
TypeInfo(string),
TypeInfo(string)],Addr(ReadWinPosFromIni),cRegister);

RegisterProc(nil,MethodNames[30],mtProc,TypeInfo(_T36),[
TypeInfo(string)],Addr(JumpToURL),cRegister);

RegisterProc(nil,MethodNames[31],mtProc,TypeInfo(_T37),NoParams,Addr(WriteToUs),cRegister);

RegisterProc(nil,MethodNames[32],mtProc,TypeInfo(_T38),NoParams,Addr(HomePage),cRegister);

RegisterProc(nil,MethodNames[33],mtProc,TypeInfo(_T39),NoParams,Addr(OnlineRegistration),cRegister);

RegisterProc(nil,MethodNames[34],mtProc,TypeInfo(_T40),[
TypeInfo(TTabControl),
TypeInfo(Boolean)],Addr(ChangeTab),cRegister);

RegisterProc(nil,MethodNames[35],mtProc,TypeInfo(_T41),[
TypeInfo(TTabControl),
TypeInfo(string)],Addr(AddNewTab),cRegister);

RegisterProc(nil,MethodNames[36],mtProc,TypeInfo(_T42),[
TypeInfo(TStrings)],Addr(GetLoadedPackagesPaths),cRegister);

RegisterProc(nil,MethodNames[37],mtProc,TypeInfo(_T44),[
TypeInfo(TStream),TypeInfo(Boolean)],Addr(StreamContainsDataModule),cRegister);

RegisterProc(nil,MethodNames[38],mtProc,TypeInfo(_T45),[
TypeInfo(TMenuItem),
TypeInfo(Boolean)],Addr(ClearMenuSubItems),cRegister);

RegisterProc(nil,MethodNames[39],mtProc,TypeInfo(_T46),[
TypeInfo(TMenuItem)],Addr(RemoveExtraMenuSeparators),cRegister);

RegisterProc(nil,MethodNames[40],mtProc,TypeInfo(_T47),[
TypeInfo(TCustomForm)],Addr(SetFormFont),cRegister);

RegisterProc(nil,MethodNames[41],mtProc,TypeInfo(_T48),[
TypeInfo(TList)],Addr(ResModulesToList),cRegister);

RegisterProc(nil,MethodNames[42],mtProc,TypeInfo(_T49),[
TypeInfo(TList)],Addr(ModulesToList),cRegister);

RegisterProc(nil,MethodNames[43],mtProc,TypeInfo(_T50),[
TypeInfo(string),TypeInfo(Boolean)],Addr(FileIsPackage),cRegister);

RegisterProc(nil,MethodNames[44],mtProc,TypeInfo(_T51),[
TypeInfo(TPageControl),
TypeInfo(TPageControl)],Addr(MovePages),cRegister);

RegisterProc(nil,MethodNames[45],mtProc,TypeInfo(_T52),[
TypeInfo(TCustomImageList),
TypeInfo(TBitmap),
TypeInfo(TColor),
TypeInfo(Integer)],Addr(ChangeImageList),cRegister);

RegisterProc(nil,MethodNames[46],mtProc,TypeInfo(_T53),[
TypeInfo(TBitmap)],Addr(CreateBrushPattern),cRegister);

RegisterProc(nil,MethodNames[47],mtProc,TypeInfo(_T54),[
TypeInfo(TBitmap),
TypeInfo(TColor),
TypeInfo(TColor)],Addr(CreateBrushPatternEx),cRegister);

RegisterProc(nil,MethodNames[48],mtProc,TypeInfo(_T55),[
TypeInfo(THandle),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(THandle),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TColor)],Addr(StretchBltTransparent),cRegister);

RegisterProc(nil,MethodNames[49],mtProc,TypeInfo(_T56),[
TypeInfo(TCanvas),
TypeInfo(TPersistent),
TypeInfo(TColor),
TypeInfo(IDispatch),
TypeInfo(Integer)],Addr(____DrawImage__Wrapper),cRegister);

RegisterProc(nil,MethodNames[50],mtProc,TypeInfo(_T58),[
TypeInfo(string),
TypeInfo(string),TypeInfo(Boolean)],Addr(QueryDirectory),cRegister);

RegisterProc(nil,MethodNames[51],mtProc,TypeInfo(_T59),[
TypeInfo(Boolean),
TypeInfo(Boolean),
TypeInfo(Char),
TypeInfo(IDispatch),TypeInfo(string)],Addr(____DropFiles__Wrapper),cRegister);

RegisterProc(nil,MethodNames[52],mtProc,TypeInfo(_T60),[
TypeInfo(TStream),TypeInfo(Boolean)],Addr(IsTextStream),cRegister);

RegisterProc(nil,MethodNames[53],mtProc,TypeInfo(_T61),[
TypeInfo(TStream),TypeInfo(string)],Addr(GetClassNameFromStream),cRegister);

RegisterProc(nil,MethodNames[54],mtProc,TypeInfo(_T66),[
ArrayInfo(TypeInfo(TSpeedButton)),
TypeInfo(Boolean)],Addr(SetFlatProp),cRegister);

RegisterProc(nil,MethodNames[55],mtProc,TypeInfo(_T67),[
TypeInfo(TComponent),
TypeInfo(Boolean)],Addr(SetFlatPropToAll),cRegister);

RegisterProc(nil,MethodNames[56],mtProc,TypeInfo(_T68),[TypeInfo(TSortedList)],Addr(OptionFormClasses),cRegister);

RegisterProc(nil,MethodNames[57],mtProc,TypeInfo(_T70),[TypeInfo(TStringList)],Addr(OptionFormCaptions),cRegister);

RegisterProc(nil,MethodNames[58],mtProc,TypeInfo(_T71),[
TypeInfo(TBitmap)],Addr(CorrectBitmap),cRegister);

RegisterProc(nil,MethodNames[59],mtProc,TypeInfo(_T73),NoParams,Addr(Register),cRegister);

RegRegisterMethod(TCompFiler,'GlobalFindCompWithoutDesigned',TypeInfo(_T74),[
TypeInfo(string),TypeInfo(TComponent)],Addr(TCompFiler.GlobalFindCompWithoutDesigned));

RegRegisterMethod(TCompFiler,'Assign',TypeInfo(_T75),[
TypeInfo(TCompFiler)],Addr(TCompFiler.Assign));

RegRegisterMethod(TCompFiler,'ReaderError',TypeInfo(_T76),[
TypeInfo(TReader),
TypeInfo(string),
TypeInfo(Boolean)],Addr(TCompFiler.ReaderError));

RegRegisterMethod(TCompFiler,'ReaderOnMethod',TypeInfo(_T77),[
TypeInfo(TReader),
TypeInfo(string),
TypeInfoPointer,
TypeInfo(Boolean)],Addr(TCompFiler.ReaderOnMethod));

RegRegisterMethod(TCompFiler,'AddEvent',TypeInfo(_T78),[
TypeInfo(string),TypeInfo(Integer)],Addr(TCompFiler.AddEvent));

RegRegisterMethod(TCompFiler,'BeginMethodTrick',TypeInfo(_T79),[
TypeInfo(TComponent),
TypeInfo(Boolean)],Addr(TCompFiler.BeginMethodTrick));

RegRegisterMethod(TCompFiler,'EndMethodTrick',TypeInfo(_T80),[
TypeInfo(TComponent)],Addr(TCompFiler.EndMethodTrick));

RegRegisterMethod(TCompFiler,'BeginClassNameTrick',TypeInfo(_T81),[
TypeInfo(TComponent)],Addr(TCompFiler.BeginClassNameTrick));

RegRegisterMethod(TCompFiler,'EndClassNameTrick',TypeInfo(_T82),[
TypeInfo(TComponent)],Addr(TCompFiler.EndClassNameTrick));

RegRegisterMethod(TCompFiler,'BeginTrick',TypeInfo(_T83),[
TypeInfo(TComponent),
TypeInfo(Boolean)],Addr(TCompFiler.BeginTrick));

RegRegisterMethod(TCompFiler,'EndTrick',TypeInfo(_T84),[
TypeInfo(TComponent)],Addr(TCompFiler.EndTrick));

RegRegisterMethod(TCompFiler,'EventNameByID',TypeInfo(_T85),[
TypeInfo(Integer),TypeInfo(string)],Addr(TCompFiler.EventNameByID));

RegisterProc(TCompFiler,'Create',mtConstructor,TypeInfo(_T86),NoParams,Addr(TCompFiler.Create),cRegister);

RegRegisterMethod(TCompFiler,'LoadFromStream',TypeInfo(_T87),[
TypeInfo(TStream),
TypeInfo(TComponent),TypeInfo(string)],Addr(TCompFiler.LoadFromStream));

RegRegisterMethod(TCompFiler,'SaveToStream',TypeInfo(_T88),[
TypeInfo(TStream),
TypeInfo(TComponent)],Addr(TCompFiler.SaveToStream));

RegRegisterMethod(TCompFiler,'LoadFromFile',TypeInfo(_T89),[
TypeInfo(TFileName),
TypeInfo(TComponent)],Addr(TCompFiler.LoadFromFile));

RegRegisterMethod(TCompFiler,'SaveToFile',TypeInfo(_T90),[
TypeInfo(TFileName),
TypeInfo(TComponent)],Addr(TCompFiler.SaveToFile));

RegRegisterMethod(TCustomDCOleControl,'GetOleName',TypeInfo(_T93),[TypeInfo(string)], pointer(200));

RegRegisterMethod(TCustomDCOleControl,'SetEvent',TypeInfo(_T95),[
TypeInfo(Integer),
TypeInfo(string)], pointer(208));

RegRegisterMethod(TCustomDCOleControl,'GetEvent',TypeInfo(_T96),[
TypeInfo(Integer),TypeInfo(string)], pointer(212));

RegRegisterMethod(TDCCustomControl,'UpdateKeyMapping',TypeInfo(_T97),NoParams, pointer(200));

RegRegisterMethod(TDCCustomControl,'InitDefaultKeyMapping',TypeInfo(_T98),NoParams, pointer(204));

RegRegisterMethod(TDCCustomControl,'InsertChar',TypeInfo(_T99),[
TypeInfo(Char),TypeInfo(Boolean)], pointer(208));

RegisterProc(TDCHandleObject,'Create',mtConstructor,TypeInfo(_T100),[
TypeInfo(TObject)],Addr(TDCHandleObject.Create),cRegister);

RegRegisterMethod(TDCHandleObject,'PostMsg',TypeInfo(_T101),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TDCHandleObject.PostMsg));

RegRegisterMethod(TDCPropStore,'SaveToStream',TypeInfo(_T102),[
TypeInfo(TStream)],Addr(TDCPropStore.SaveToStream));

RegRegisterMethod(TDCPropStore,'LoadFromStream',TypeInfo(_T103),[
TypeInfo(TStream)],Addr(TDCPropStore.LoadFromStream));

RegRegisterMethod(TDCPropStore,'SaveToIniFile',TypeInfo(_T104),[
TypeInfo(string),
TypeInfo(string)],Addr(TDCPropStore.SaveToIniFile));

RegRegisterMethod(TDCPropStore,'LoadFromIniFile',TypeInfo(_T105),[
TypeInfo(string),
TypeInfo(string)],Addr(TDCPropStore.LoadFromIniFile));

RegRegisterMethod(TDCPropStore,'Load',TypeInfo(_T106),NoParams, pointer(48));

RegRegisterMethod(TDCPropStore,'Save',TypeInfo(_T107),NoParams, pointer(52));

RegisterProc(TPropStream,'Create',mtConstructor,TypeInfo(_T109),[
TypeInfo(TPersistent),
TypeInfo(string),
TypeInfo(Integer)],Addr(TPropStream.Create),cRegister);

RegRegisterMethod(TVerbDispatcher,'UpdateVerbObjects',TypeInfo(_T110),[
TypeInfo(Integer)],Addr(TVerbDispatcher.UpdateVerbObjects));

RegRegisterMethod(TVerbDispatcher,'UpdateControls',TypeInfo(_T111),NoParams,Addr(TVerbDispatcher.UpdateControls));

RegRegisterMethod(TVerbListItem,'UpdateControl',TypeInfo(_T112),NoParams,Addr(TVerbListItem.UpdateControl));

RegRegisterMethod(TVerbListItem,'VerbOnClick',TypeInfo(_T113),[
TypeInfo(TObject)],Addr(TVerbListItem.VerbOnClick));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'CreateFormWithClass',mtProc,TypeInfo(_T16),[
TypeInfo(TComponentClass),TypeInfo(TCustomForm)],Addr(CreateFormWithClass),cRegister)}

{RegisterProc(nil,'CreateDataModuleWithClass',mtProc,TypeInfo(_T17),[
TypeInfo(TComponentClass),TypeInfo(TDataModule)],Addr(CreateDataModuleWithClass),cRegister)}

{RegisterProc(nil,'FindFormWithClass',mtProc,TypeInfo(_T24),[
TypeInfo(TClass),TypeInfo(TCustomForm)],Addr(FindFormWithClass),cRegister)}

{RegisterProc(nil,'FindOrCreateFormWithClass',mtProc,TypeInfo(_T26),[
TypeInfo(TCustomFormClass),
TypeInfo(TComponent),TypeInfo(TCustomForm)],Addr(FindOrCreateFormWithClass),cRegister)}

{RegisterProc(nil,'GetFormResourceHandler',mtProc,TypeInfo(_T28),[
TypeInfo(TClass),TypeInfo(THandle)],Addr(GetFormResourceHandler),cRegister)}

{RegisterProc(nil,'RegisterAssignVerbProc',mtProc,TypeInfo(_T32),[
TypeInfo(TComponentClass),
TypeInfo(TAssignVerbProc)],Addr(RegisterAssignVerbProc),cRegister)}

{RegisterProc(nil,'FindResourceInstance',mtProc,TypeInfo(_T43),[
TypeInfo(string),
TypeInfoPChar,TypeInfo(THandle)],Addr(FindResourceInstance),cRegister)}

{RegisterProc(nil,'SafeRegisterActions',mtProc,TypeInfo(_T57),[
TypeInfo(string),
ArrayInfo(TypeInfo(TBasicActionClass)),
TypeInfo(TComponentClass)],Addr(SafeRegisterActions),cRegister)}

{RegisterProc(nil,'GetOptionsFormCaption',mtProc,TypeInfo(_T62),[
TypeInfo(TCustomFormClass),TypeInfo(string)],Addr(GetOptionsFormCaption),cRegister)}

{RegisterProc(nil,'RegisterOptionsForm',mtProc,TypeInfo(_T63),[
TypeInfo(TCustomFormClass),
TypeInfo(string)],Addr(RegisterOptionsForm),cRegister)}

{RegisterProc(nil,'RegisterOptionsFormOrder',mtProc,TypeInfo(_T64),[
TypeInfo(TCustomFormClass),
TypeInfo(Integer),
TypeInfo(string)],Addr(RegisterOptionsFormOrder),cRegister)}

{RegisterProc(nil,'UnregisterOptionsForm',mtProc,TypeInfo(_T65),[
TypeInfo(TCustomFormClass)],Addr(UnregisterOptionsForm),cRegister)}

{RegisterProc(nil,'OptionFormClass',mtProc,TypeInfo(_T69),[
TypeInfo(Integer),TypeInfo(TCustomFormClass)],Addr(OptionFormClass),cRegister)}

{RegisterProc(nil,'EqualMethodTypeData',mtProc,TypeInfo(_T72),[
TypeInfoPointer,
TypeInfoPointer,TypeInfo(Boolean)],Addr(EqualMethodTypeData),cRegister)}

{RegRegisterMethod(TCompFiler,'CreateFromStream',TypeInfo(_T91),[
TypeInfo(TStream),
TypeInfo(TComponentClass),
TypeInfo(Boolean),TypeInfo(TComponent)],Addr(TCompFiler.CreateFromStream))}

{RegRegisterMethod(TCompFiler,'CreateFromFile',TypeInfo(_T92),[
TypeInfo(TFileName),
TypeInfo(TComponentClass),
TypeInfo(Boolean),TypeInfo(TComponent)],Addr(TCompFiler.CreateFromFile))}

{RegRegisterMethod(TCustomDCOleControl,'GetOleObject',TypeInfo(_T94),[TypeInfo(IOleObject)], pointer(204))}

{RegisterProc(THandleObject,'Create',mtConstructor,TypeInfo(_T108),[
TypeInfo(TWndMethod)],Addr(THandleObject.Create),cRegister)}

RegisterEvent(TypeInfo(TDCInitComponentHandler),[
TypeInfo(TComponent),
TypeInfo(string),
TypeInfo(string)]);

RegisterEvent(TypeInfo(TProcessChangesProc),[
TypeInfo(TObject),
TypeInfo(Boolean)]);

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
