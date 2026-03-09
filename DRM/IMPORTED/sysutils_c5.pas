{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit SYSUTILS_C5;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  activex,
  classes,
  dcscript,
  dcsystem,
  dcdreamlib,
  Windows,
  SysConst,
  SysUtils;
function ConvertInt64RecToVariant(var R : Int64Rec) : OleVariant;
function ConvertVariantToInt64Rec(const V : OleVariant) : Int64Rec;
function ConvertLongRecToVariant(var R : LongRec) : OleVariant;
function ConvertVariantToLongRec(const V : OleVariant) : LongRec;
function ConvertTActiveThreadRecordToVariant(var R : TActiveThreadRecord) : OleVariant;
function ConvertVariantToTActiveThreadRecord(const V : OleVariant) : TActiveThreadRecord;
function ConvertTFileRecToVariant(var R : TFileRec) : OleVariant;
function ConvertVariantToTFileRec(const V : OleVariant) : TFileRec;
function ConvertTFloatRecToVariant(var R : TFloatRec) : OleVariant;
function ConvertVariantToTFloatRec(const V : OleVariant) : TFloatRec;
function ConvertTLangRecToVariant(var R : TLangRec) : OleVariant;
function ConvertVariantToTLangRec(const V : OleVariant) : TLangRec;
function ConvertTMethodToVariant(var R : TMethod) : OleVariant;
function ConvertVariantToTMethod(const V : OleVariant) : TMethod;
function ConvertTSearchRecToVariant(var R : TSearchRec) : OleVariant;
function ConvertVariantToTSearchRec(const V : OleVariant) : TSearchRec;
function ConvertTSysLocaleToVariant(var R : TSysLocale) : OleVariant;
function ConvertVariantToTSysLocale(const V : OleVariant) : TSysLocale;
function ConvertTSystemTimeToVariant(var R : TSystemTime) : OleVariant;
function ConvertVariantToTSystemTime(const V : OleVariant) : TSystemTime;
function ConvertTTextRecToVariant(var R : TTextRec) : OleVariant;
function ConvertVariantToTTextRec(const V : OleVariant) : TTextRec;
function ConvertTTimeStampToVariant(var R : TTimeStamp) : OleVariant;
function ConvertVariantToTTimeStamp(const V : OleVariant) : TTimeStamp;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TSysLocale__Wrapper = class(TDCRecordWrapper)
private
fR : TSysLocale;
public
function GetRecordPtr : pointer; override;
published
procedure setDefaultLCID(const val : LCID);
function getDefaultLCID : LCID;
property DefaultLCID : LCID read getDefaultLCID write setDefaultLCID;
procedure setPriLangID(const val : LANGID);
function getPriLangID : LANGID;
property PriLangID : LANGID read getPriLangID write setPriLangID;
procedure setSubLangID(const val : LANGID);
function getSubLangID : LANGID;
property SubLangID : LANGID read getSubLangID write setSubLangID;
procedure setFarEast(const val : Boolean);
function getFarEast : Boolean;
property FarEast : Boolean read getFarEast write setFarEast;
procedure setMiddleEast(const val : Boolean);
function getMiddleEast : Boolean;
property MiddleEast : Boolean read getMiddleEast write setMiddleEast;
end;
type __Int64Rec__Wrapper = class(TDCRecordWrapper)
private
fR : Int64Rec;
public
function GetRecordPtr : pointer; override;
published
procedure setLo(const val : DWORD);
function getLo : DWORD;
property Lo : DWORD read getLo write setLo;
procedure setHi(const val : DWORD);
function getHi : DWORD;
property Hi : DWORD read getHi write setHi;
end;
type __LongRec__Wrapper = class(TDCRecordWrapper)
private
fR : LongRec;
public
function GetRecordPtr : pointer; override;
published
procedure setLo(const val : Word);
function getLo : Word;
property Lo : Word read getLo write setLo;
procedure setHi(const val : Word);
function getHi : Word;
property Hi : Word read getHi write setHi;
end;
type __TActiveThreadRecord__Wrapper = class(TDCRecordWrapper)
private
fR : TActiveThreadRecord;
public
function GetRecordPtr : pointer; override;
published
procedure setThreadID(const val : Integer);
function getThreadID : Integer;
property ThreadID : Integer read getThreadID write setThreadID;
procedure setRecursionCount(const val : Integer);
function getRecursionCount : Integer;
property RecursionCount : Integer read getRecursionCount write setRecursionCount;
end;
type __TFileRec__Wrapper = class(TDCRecordWrapper)
private
fR : TFileRec;
public
function GetRecordPtr : pointer; override;
published
procedure setHandle(const val : Integer);
function getHandle : Integer;
property Handle : Integer read getHandle write setHandle;
procedure setMode(const val : Integer);
function getMode : Integer;
property Mode : Integer read getMode write setMode;
procedure setRecSize(const val : Cardinal);
function getRecSize : Cardinal;
property RecSize : Cardinal read getRecSize write setRecSize;
end;
type __TFloatRec__Wrapper = class(TDCRecordWrapper)
private
fR : TFloatRec;
public
function GetRecordPtr : pointer; override;
published
procedure setExponent(const val : SmallInt);
function getExponent : SmallInt;
property Exponent : SmallInt read getExponent write setExponent;
procedure setNegative(const val : Boolean);
function getNegative : Boolean;
property Negative : Boolean read getNegative write setNegative;
end;
type __TLangRec__Wrapper = class(TDCRecordWrapper)
private
fR : TLangRec;
public
function GetRecordPtr : pointer; override;
published
procedure setFName(const val : AnsiString);
function getFName : AnsiString;
property FName : AnsiString read getFName write setFName;
procedure setFLCID(const val : LCID);
function getFLCID : LCID;
property FLCID : LCID read getFLCID write setFLCID;
procedure setFExt(const val : AnsiString);
function getFExt : AnsiString;
property FExt : AnsiString read getFExt write setFExt;
end;
type __TMethod__Wrapper = class(TDCRecordWrapper)
private
fR : TMethod;
public
function GetRecordPtr : pointer; override;
published
end;
type __TSearchRec__Wrapper = class(TDCRecordWrapper)
private
fR : TSearchRec;
public
function GetRecordPtr : pointer; override;
published
procedure setTime(const val : Integer);
function getTime : Integer;
property Time : Integer read getTime write setTime;
procedure setSize(const val : Integer);
function getSize : Integer;
property Size : Integer read getSize write setSize;
procedure setAttr(const val : Integer);
function getAttr : Integer;
property Attr : Integer read getAttr write setAttr;
procedure setExcludeAttr(const val : Integer);
function getExcludeAttr : Integer;
property ExcludeAttr : Integer read getExcludeAttr write setExcludeAttr;
procedure setFindHandle(const val : THandle);
function getFindHandle : THandle;
property FindHandle : THandle read getFindHandle write setFindHandle;
end;
type __TTextRec__Wrapper = class(TDCRecordWrapper)
private
fR : TTextRec;
public
function GetRecordPtr : pointer; override;
published
procedure setHandle(const val : Integer);
function getHandle : Integer;
property Handle : Integer read getHandle write setHandle;
procedure setMode(const val : Integer);
function getMode : Integer;
property Mode : Integer read getMode write setMode;
procedure setBufSize(const val : Cardinal);
function getBufSize : Cardinal;
property BufSize : Cardinal read getBufSize write setBufSize;
procedure setBufPos(const val : Cardinal);
function getBufPos : Cardinal;
property BufPos : Cardinal read getBufPos write setBufPos;
procedure setBufEnd(const val : Cardinal);
function getBufEnd : Cardinal;
property BufEnd : Cardinal read getBufEnd write setBufEnd;
end;
type __TTimeStamp__Wrapper = class(TDCRecordWrapper)
private
fR : TTimeStamp;
public
function GetRecordPtr : pointer; override;
published
procedure setTime(const val : Integer);
function getTime : Integer;
property Time : Integer read getTime write setTime;
procedure setDate(const val : Integer);
function getDate : Integer;
property Date : Integer read getDate write setDate;
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
type
_T0 = function : TLanguages of object;

_T1 = function (p0 : Cardinal): Pointer of object;

{_T2 = procedure (p0 : TProcedure) of object;}

_T3 = function (const p0 : string): PString of object;

_T4 = procedure (p0 : PString) of object;

_T5 = procedure (var p0 : PString;
const p1 : string) of object;

_T6 = procedure (var p0 : string;
const p1 : string) of object;

_T7 = function (const p0 : string): string of object;

_T8 = _T7;

_T9 = function (const p0 : string;
const p1 : string): Integer of object;

_T10 = function (p0 : Pointer;
p1 : Pointer;
p2 : Integer): Boolean of object;

_T11 = _T9;

_T12 = function (const p0 : string;
const p1 : string): Boolean of object;

_T13 = _T7;

_T14 = _T7;

_T15 = _T9;

_T16 = _T12;

_T17 = _T9;

_T18 = _T12;

{_T19 = function (p0 : PChar;
p1 : PChar): Integer of object;}

{_T20 = function (p0 : PChar;
p1 : PChar): Integer of object;}

{_T21 = function (p0 : PChar;
p1 : PChar;
p2 : Cardinal): Integer of object;}

{_T22 = function (p0 : PChar;
p1 : PChar;
p2 : Cardinal): Integer of object;}

{_T23 = function (p0 : PChar): PChar of object;}

{_T24 = function (p0 : PChar): PChar of object;}

_T25 = function (const p0 : string): PChar of object;

{_T26 = function (p0 : PChar): PChar of object;}

_T27 = _T7;

_T28 = _T7;

_T29 = _T7;

_T30 = _T7;

_T31 = function (const p0 : string;
p1 : Char): string of object;

{_T32 = function (var p0 : PChar;
p1 : Char): string of object;}

_T33 = _T7;

_T34 = function (const p0 : string): Boolean of object;

_T35 = function (p0 : Integer): string of object;

_T36 = function (p0 : Integer;
p1 : Integer): string of object;

_T37 = function (const p0 : string): Integer of object;

{_T38 = function (const p0 : string): Int64 of object;}

_T39 = function (const p0 : string;
p1 : Integer): Integer of object;

{_T40 = function (const p0 : string;
p1 : Int64): Int64 of object;}

_T41 = _T35;

_T42 = function (p0 : Integer;
const p1 : Array of Const): string of object;

_T43 = function (const p0 : string;
p1 : LongWord): Integer of object;

_T44 = _T37;

_T45 = function (p0 : Integer;
var p1 : Integer;
p2 : LongWord): Integer of object;

_T46 = function (p0 : Integer;
const p1 : Integer;
p2 : LongWord): Integer of object;

_T47 = function (p0 : Integer;
p1 : Integer;
p2 : Integer): Integer of object;

_T48 = procedure (p0 : Integer) of object;

_T49 = _T37;

_T50 = _T34;

_T51 = function (const p0 : string;
p1 : Integer;
const p2 : IDispatch): Integer of object;

_T52 = function (const p0 : IDispatch): Integer of object;

_T53 = procedure (const p0 : IDispatch) of object;

_T54 = function (p0 : Integer): Integer of object;

_T55 = function (p0 : Integer;
p1 : Integer): Integer of object;

_T56 = _T37;

_T57 = _T39;

_T58 = _T34;

_T59 = _T12;

_T60 = function (const p0 : string;
const p1 : string): string of object;

_T61 = _T7;

_T62 = _T7;

_T63 = _T7;

_T64 = _T7;

_T65 = _T7;

_T66 = _T7;

_T67 = _T7;

_T68 = _T60;

_T69 = _T7;

_T70 = _T60;

{_T71 = function (p0 : Byte): Int64 of object;}

{_T72 = function (p0 : Byte): Int64 of object;}

_T73 = function (p0 : Integer): TDateTime of object;

_T74 = function (p0 : TDateTime): Integer of object;

_T75 = function : string of object;

_T76 = _T34;

_T77 = _T34;

_T78 = _T34;

{_T79 = function (const p0 : PChar): Cardinal of object;}

{_T80 = function (const p0 : PChar): PChar of object;}

{_T81 = function (p0 : PChar;
const p1 : PChar;
p2 : Cardinal): PChar of object;}

{_T82 = function (p0 : PChar;
const p1 : PChar): PChar of object;}

{_T83 = function (p0 : PChar;
const p1 : PChar): PChar of object;}

{_T84 = function (p0 : PChar;
const p1 : PChar;
p2 : Cardinal): PChar of object;}

{_T85 = function (p0 : PChar;
const p1 : string): PChar of object;}

{_T86 = function (p0 : PChar;
const p1 : string;
p2 : Cardinal): PChar of object;}

{_T87 = function (p0 : PChar;
const p1 : PChar): PChar of object;}

{_T88 = function (p0 : PChar;
const p1 : PChar;
p2 : Cardinal): PChar of object;}

{_T89 = function (const p0 : PChar;
const p1 : PChar): Integer of object;}

{_T90 = function (const p0 : PChar;
const p1 : PChar): Integer of object;}

{_T91 = function (const p0 : PChar;
const p1 : PChar;
p2 : Cardinal): Integer of object;}

{_T92 = function (const p0 : PChar;
const p1 : PChar;
p2 : Cardinal): Integer of object;}

{_T93 = function (const p0 : PChar;
p1 : Char): PChar of object;}

{_T94 = function (const p0 : PChar;
p1 : Char): PChar of object;}

{_T95 = function (const p0 : PChar;
const p1 : PChar): PChar of object;}

{_T96 = function (p0 : PChar): PChar of object;}

{_T97 = function (p0 : PChar): PChar of object;}

{_T98 = function (const p0 : PChar): string of object;}

_T99 = function (p0 : Cardinal): PChar of object;

{_T100 = function (const p0 : PChar): Cardinal of object;}

{_T101 = function (const p0 : PChar): PChar of object;}

{_T102 = procedure (p0 : PChar) of object;}

_T103 = function (const p0 : string;
const p1 : Array of Const): string of object;

_T104 = procedure (var p0 : string;
const p1 : string;
const p2 : Array of Const) of object;

{_T105 = function (p0 : PChar;
p1 : PChar;
const p2 : Array of Const): PChar of object;}

{_T106 = function (p0 : PChar;
p1 : Cardinal;
p2 : PChar;
const p3 : Array of Const): PChar of object;}

_T107 = function (var p0;
p1 : Cardinal;
const p2 : Cardinal;
p3 : Cardinal;
const p4 : Array of Const): Cardinal of object;

_T108 = function (p0 : Extended): string of object;

_T109 = function (p0 : Currency): string of object;

_T110 = function (p0 : Extended;
p1 : TFloatFormat;
p2 : Integer;
p3 : Integer): string of object;

_T111 = function (p0 : Currency;
p1 : TFloatFormat;
p2 : Integer): string of object;

{_T112 = function (p0 : PChar;
const p1 : PChar;
p2 : TFloatValue;
p3 : TFloatFormat;
p4 : Integer;
p5 : Integer): Integer of object;}

_T113 = function (const p0 : string;
p1 : Extended): string of object;

_T114 = function (const p0 : string;
p1 : Currency): string of object;

{_T115 = function (p0 : PChar;
const p1 : PChar;
p2 : TFloatValue;
p3 : PChar): Integer of object;}

_T116 = function (const p0 : string): Extended of object;

_T117 = function (const p0 : string): Currency of object;

{_T118 = function (p0 : PChar;
var p1 : PChar;
p2 : TFloatValue): Boolean of object;}

_T119 = procedure (const p0 : IDispatch;
const p1 : IDispatch;
p2 : TFloatValue;
p3 : Integer;
p4 : Integer) of object;

_T120 = function (p0 : TDateTime): IDispatch of object;

_T121 = function (const p0 : IDispatch): TDateTime of object;

_T122 = function (p0 : Comp): IDispatch of object;

_T123 = function (const p0 : IDispatch): Comp of object;

_T124 = function (p0 : Word;
p1 : Word;
p2 : Word): TDateTime of object;

_T125 = function (p0 : Word;
p1 : Word;
p2 : Word;
p3 : Word): TDateTime of object;

_T126 = procedure (p0 : TDateTime;
var p1 : Word;
var p2 : Word;
var p3 : Word) of object;

_T127 = procedure (p0 : TDateTime;
var p1 : Word;
var p2 : Word;
var p3 : Word;
var p4 : Word) of object;

_T128 = procedure (p0 : TDateTime;
const p1 : IDispatch) of object;

_T129 = _T121;

_T130 = _T74;

_T131 = function : TDateTime of object;

_T132 = _T131;

_T133 = _T131;

_T134 = function (const p0 : TDateTime;
p1 : Integer): TDateTime of object;

_T135 = procedure (var p0 : TDateTime;
const p1 : TDateTime) of object;

_T136 = _T135;

_T137 = function (p0 : Word): Boolean of object;

_T138 = function (p0 : TDateTime): string of object;

_T139 = _T138;

_T140 = _T138;

_T141 = function (const p0 : string): TDateTime of object;

_T142 = _T141;

_T143 = _T141;

_T144 = function (const p0 : string;
p1 : TDateTime): string of object;

_T145 = procedure (var p0 : string;
const p1 : string;
p2 : TDateTime) of object;

_T146 = _T35;

_T147 = function (p0 : Integer;
p1 : Integer;
const p2 : string): string of object;

_T148 = function (p0 : Integer;
p1 : Integer;
p2 : Char): Char of object;

_T149 = procedure  of object;

_T150 = function : TObject of object;

_T151 = function : Pointer of object;

{_T152 = function (p0 : TObject;
p1 : Pointer;
p2 : PChar;
p3 : Integer): Integer of object;}

_T153 = procedure (p0 : TObject;
p1 : Pointer) of object;

_T154 = _T149;

_T155 = _T149;

_T156 = _T149;

_T157 = function (const p0 : string;
p1 : Integer): TMbcsByteType of object;

{_T158 = function (p0 : PChar;
p1 : Cardinal): TMbcsByteType of object;}

_T159 = _T39;

_T160 = _T39;

_T161 = _T39;

_T162 = _T39;

_T163 = function (const p0 : string;
p1 : Integer): Boolean of object;

_T164 = function (const p0 : string;
const p1 : string;
p2 : Integer): Boolean of object;

_T165 = _T7;

_T166 = _T7;

_T167 = _T9;

_T168 = _T9;

_T169 = _T7;

_T170 = _T7;

_T171 = _T9;

{_T172 = function (p0 : PChar;
p1 : PChar): PChar of object;}

{_T173 = function (p0 : PChar;
p1 : Char): PChar of object;}

{_T174 = function (p0 : PChar;
p1 : Char): PChar of object;}

_T175 = function (const p0 : string;
const p1 : string;
const p2 : string;
p3 : TReplaceFlags): string of object;

_T176 = function (const p0 : string;
const p1 : string;
p2 : TSysCharSet;
p3 : Integer): string of object;

_T177 = function (const p0 : string;
p1 : TSysCharSet;
p2 : Boolean): Boolean of object;

_T178 = procedure (var p0) of object;

_T180 = function (const p0 : string): HMODULE of object;

_T181 = procedure (p0 : HMODULE) of object;

{_T182 = procedure (p0 : HMODULE;
p1 : Pointer;
var p2 : Integer;
p3 : TPackageInfoProc) of object;}

{_T183 = function (p0 : PChar): string of object;}

_T184 = _T181;

_T185 = _T181;

_T186 = _T149;

_T187 = function (p0 : BOOL): BOOL of object;

{_T188 = procedure (p0 : TTerminateProc) of object;}

_T189 = function : Boolean of object;

_T190 = function : LongWord of object;

_T191 = _T149;

_T192 = _T149;

_T193 = function (const p0 : string;
p1 : UINT): HMODULE of object;

_T194 = procedure (const p0 : string) of object;

_T195 = procedure (const p0 : string;
const p1 : Array of Const) of object;

_T196 = _T48;

_T197 = procedure (p0 : Integer;
const p1 : Array of Const) of object;

_T198 = procedure (const p0 : string;
p1 : Integer) of object;

_T199 = procedure (const p0 : string;
const p1 : Array of Const;
p2 : Integer) of object;

_T200 = procedure (p0 : Integer;
p1 : Integer) of object;

{_T201 = procedure (p0 : PResStringRec;
const p1 : Array of Const;
p2 : Integer) of object;}

_T202 = _T149;

_T203 = function (p0 : LCID): Integer of object;

_T204 = _T149;

_T205 = _T149;

_T206 = _T149;

_T207 = _T149;

_T208 = _T149;

function __TSysLocale__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TSysLocale__Wrapper.setDefaultLCID(const val : LCID);
begin
TSysLocale(GetRecordPtr^).DefaultLCID := val;
end;
function __TSysLocale__Wrapper.getDefaultLCID : LCID;
begin
result := TSysLocale(GetRecordPtr^).DefaultLCID;
end;
procedure __TSysLocale__Wrapper.setPriLangID(const val : LANGID);
begin
TSysLocale(GetRecordPtr^).PriLangID := val;
end;
function __TSysLocale__Wrapper.getPriLangID : LANGID;
begin
result := TSysLocale(GetRecordPtr^).PriLangID;
end;
procedure __TSysLocale__Wrapper.setSubLangID(const val : LANGID);
begin
TSysLocale(GetRecordPtr^).SubLangID := val;
end;
function __TSysLocale__Wrapper.getSubLangID : LANGID;
begin
result := TSysLocale(GetRecordPtr^).SubLangID;
end;
procedure __TSysLocale__Wrapper.setFarEast(const val : Boolean);
begin
TSysLocale(GetRecordPtr^).FarEast := val;
end;
function __TSysLocale__Wrapper.getFarEast : Boolean;
begin
result := TSysLocale(GetRecordPtr^).FarEast;
end;
procedure __TSysLocale__Wrapper.setMiddleEast(const val : Boolean);
begin
TSysLocale(GetRecordPtr^).MiddleEast := val;
end;
function __TSysLocale__Wrapper.getMiddleEast : Boolean;
begin
result := TSysLocale(GetRecordPtr^).MiddleEast;
end;
function __Int64Rec__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __Int64Rec__Wrapper.setLo(const val : DWORD);
begin
Int64Rec(GetRecordPtr^).Lo := val;
end;
function __Int64Rec__Wrapper.getLo : DWORD;
begin
result := Int64Rec(GetRecordPtr^).Lo;
end;
procedure __Int64Rec__Wrapper.setHi(const val : DWORD);
begin
Int64Rec(GetRecordPtr^).Hi := val;
end;
function __Int64Rec__Wrapper.getHi : DWORD;
begin
result := Int64Rec(GetRecordPtr^).Hi;
end;
function __LongRec__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __LongRec__Wrapper.setLo(const val : Word);
begin
LongRec(GetRecordPtr^).Lo := val;
end;
function __LongRec__Wrapper.getLo : Word;
begin
result := LongRec(GetRecordPtr^).Lo;
end;
procedure __LongRec__Wrapper.setHi(const val : Word);
begin
LongRec(GetRecordPtr^).Hi := val;
end;
function __LongRec__Wrapper.getHi : Word;
begin
result := LongRec(GetRecordPtr^).Hi;
end;
function __TActiveThreadRecord__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TActiveThreadRecord__Wrapper.setThreadID(const val : Integer);
begin
TActiveThreadRecord(GetRecordPtr^).ThreadID := val;
end;
function __TActiveThreadRecord__Wrapper.getThreadID : Integer;
begin
result := TActiveThreadRecord(GetRecordPtr^).ThreadID;
end;
procedure __TActiveThreadRecord__Wrapper.setRecursionCount(const val : Integer);
begin
TActiveThreadRecord(GetRecordPtr^).RecursionCount := val;
end;
function __TActiveThreadRecord__Wrapper.getRecursionCount : Integer;
begin
result := TActiveThreadRecord(GetRecordPtr^).RecursionCount;
end;
function __TFileRec__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TFileRec__Wrapper.setHandle(const val : Integer);
begin
TFileRec(GetRecordPtr^).Handle := val;
end;
function __TFileRec__Wrapper.getHandle : Integer;
begin
result := TFileRec(GetRecordPtr^).Handle;
end;
procedure __TFileRec__Wrapper.setMode(const val : Integer);
begin
TFileRec(GetRecordPtr^).Mode := val;
end;
function __TFileRec__Wrapper.getMode : Integer;
begin
result := TFileRec(GetRecordPtr^).Mode;
end;
procedure __TFileRec__Wrapper.setRecSize(const val : Cardinal);
begin
TFileRec(GetRecordPtr^).RecSize := val;
end;
function __TFileRec__Wrapper.getRecSize : Cardinal;
begin
result := TFileRec(GetRecordPtr^).RecSize;
end;
function __TFloatRec__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TFloatRec__Wrapper.setExponent(const val : SmallInt);
begin
TFloatRec(GetRecordPtr^).Exponent := val;
end;
function __TFloatRec__Wrapper.getExponent : SmallInt;
begin
result := TFloatRec(GetRecordPtr^).Exponent;
end;
procedure __TFloatRec__Wrapper.setNegative(const val : Boolean);
begin
TFloatRec(GetRecordPtr^).Negative := val;
end;
function __TFloatRec__Wrapper.getNegative : Boolean;
begin
result := TFloatRec(GetRecordPtr^).Negative;
end;
function __TLangRec__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TLangRec__Wrapper.setFName(const val : AnsiString);
begin
TLangRec(GetRecordPtr^).FName := val;
end;
function __TLangRec__Wrapper.getFName : AnsiString;
begin
result := TLangRec(GetRecordPtr^).FName;
end;
procedure __TLangRec__Wrapper.setFLCID(const val : LCID);
begin
TLangRec(GetRecordPtr^).FLCID := val;
end;
function __TLangRec__Wrapper.getFLCID : LCID;
begin
result := TLangRec(GetRecordPtr^).FLCID;
end;
procedure __TLangRec__Wrapper.setFExt(const val : AnsiString);
begin
TLangRec(GetRecordPtr^).FExt := val;
end;
function __TLangRec__Wrapper.getFExt : AnsiString;
begin
result := TLangRec(GetRecordPtr^).FExt;
end;
function __TMethod__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
function __TSearchRec__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TSearchRec__Wrapper.setTime(const val : Integer);
begin
TSearchRec(GetRecordPtr^).Time := val;
end;
function __TSearchRec__Wrapper.getTime : Integer;
begin
result := TSearchRec(GetRecordPtr^).Time;
end;
procedure __TSearchRec__Wrapper.setSize(const val : Integer);
begin
TSearchRec(GetRecordPtr^).Size := val;
end;
function __TSearchRec__Wrapper.getSize : Integer;
begin
result := TSearchRec(GetRecordPtr^).Size;
end;
procedure __TSearchRec__Wrapper.setAttr(const val : Integer);
begin
TSearchRec(GetRecordPtr^).Attr := val;
end;
function __TSearchRec__Wrapper.getAttr : Integer;
begin
result := TSearchRec(GetRecordPtr^).Attr;
end;
procedure __TSearchRec__Wrapper.setExcludeAttr(const val : Integer);
begin
TSearchRec(GetRecordPtr^).ExcludeAttr := val;
end;
function __TSearchRec__Wrapper.getExcludeAttr : Integer;
begin
result := TSearchRec(GetRecordPtr^).ExcludeAttr;
end;
procedure __TSearchRec__Wrapper.setFindHandle(const val : THandle);
begin
TSearchRec(GetRecordPtr^).FindHandle := val;
end;
function __TSearchRec__Wrapper.getFindHandle : THandle;
begin
result := TSearchRec(GetRecordPtr^).FindHandle;
end;
function __TTextRec__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TTextRec__Wrapper.setHandle(const val : Integer);
begin
TTextRec(GetRecordPtr^).Handle := val;
end;
function __TTextRec__Wrapper.getHandle : Integer;
begin
result := TTextRec(GetRecordPtr^).Handle;
end;
procedure __TTextRec__Wrapper.setMode(const val : Integer);
begin
TTextRec(GetRecordPtr^).Mode := val;
end;
function __TTextRec__Wrapper.getMode : Integer;
begin
result := TTextRec(GetRecordPtr^).Mode;
end;
procedure __TTextRec__Wrapper.setBufSize(const val : Cardinal);
begin
TTextRec(GetRecordPtr^).BufSize := val;
end;
function __TTextRec__Wrapper.getBufSize : Cardinal;
begin
result := TTextRec(GetRecordPtr^).BufSize;
end;
procedure __TTextRec__Wrapper.setBufPos(const val : Cardinal);
begin
TTextRec(GetRecordPtr^).BufPos := val;
end;
function __TTextRec__Wrapper.getBufPos : Cardinal;
begin
result := TTextRec(GetRecordPtr^).BufPos;
end;
procedure __TTextRec__Wrapper.setBufEnd(const val : Cardinal);
begin
TTextRec(GetRecordPtr^).BufEnd := val;
end;
function __TTextRec__Wrapper.getBufEnd : Cardinal;
begin
result := TTextRec(GetRecordPtr^).BufEnd;
end;
function __TTimeStamp__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TTimeStamp__Wrapper.setTime(const val : Integer);
begin
TTimeStamp(GetRecordPtr^).Time := val;
end;
function __TTimeStamp__Wrapper.getTime : Integer;
begin
result := TTimeStamp(GetRecordPtr^).Time;
end;
procedure __TTimeStamp__Wrapper.setDate(const val : Integer);
begin
TTimeStamp(GetRecordPtr^).Date := val;
end;
function __TTimeStamp__Wrapper.getDate : Integer;
begin
result := TTimeStamp(GetRecordPtr^).Date;
end;
function _Int64Rec_ : IDispatch;
begin
  result := __Int64Rec__Wrapper.Create;
end;
function _LongRec_ : IDispatch;
begin
  result := __LongRec__Wrapper.Create;
end;
function _TActiveThreadRecord_ : IDispatch;
begin
  result := __TActiveThreadRecord__Wrapper.Create;
end;
function _TFileRec_ : IDispatch;
begin
  result := __TFileRec__Wrapper.Create;
end;
function _TFloatRec_ : IDispatch;
begin
  result := __TFloatRec__Wrapper.Create;
end;
function _TLangRec_ : IDispatch;
begin
  result := __TLangRec__Wrapper.Create;
end;
function _TMethod_ : IDispatch;
begin
  result := __TMethod__Wrapper.Create;
end;
function _TSearchRec_ : IDispatch;
begin
  result := __TSearchRec__Wrapper.Create;
end;
function _TSysLocale_ : IDispatch;
begin
  result := __TSysLocale__Wrapper.Create;
end;
function _TTextRec_ : IDispatch;
begin
  result := __TTextRec__Wrapper.Create;
end;
function _TTimeStamp_ : IDispatch;
begin
  result := __TTimeStamp__Wrapper.Create;
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
function ____FindFirst__Wrapper(const p0 : string;
p1 : Integer;
const p2 : IDispatch): Integer;
var
__p2 : ^TSearchRec;
__i2 : IDispatch;
begin
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
result := FindFirst(p0,p1,__p2^);
end;

function ____FindNext__Wrapper(const p0 : IDispatch): Integer;
var
__p0 : ^TSearchRec;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := FindNext(__p0^);
end;

procedure ____FindClose__Wrapper(const p0 : IDispatch);
var
__p0 : ^TSearchRec;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
FindClose(__p0^);
end;

procedure ____FloatToDecimal__Wrapper(const p0 : IDispatch;
const p1 : IDispatch;
p2 : TFloatValue;
p3 : Integer;
p4 : Integer);
var
__p0 : ^TFloatRec;
__i0 : IDispatch;
__p1 : ^TFloatRec;
__i1 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
FloatToDecimal(__p0^,__p1^,p2,p3,p4);
end;

function ____DateTimeToTimeStamp__Wrapper(p0 : TDateTime): IDispatch;
var
__result : TTimeStamp;
__wrapper : __TTimeStamp__Wrapper;
begin
__result := DateTimeToTimeStamp(p0);
__wrapper := __TTimeStamp__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function ____TimeStampToDateTime__Wrapper(const p0 : IDispatch): TDateTime;
var
__p0 : ^TTimeStamp;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := TimeStampToDateTime(__p0^);
end;

function ____MSecsToTimeStamp__Wrapper(p0 : Comp): IDispatch;
var
__result : TTimeStamp;
__wrapper : __TTimeStamp__Wrapper;
begin
__result := MSecsToTimeStamp(p0);
__wrapper := __TTimeStamp__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function ____TimeStampToMSecs__Wrapper(const p0 : IDispatch): Comp;
var
__p0 : ^TTimeStamp;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := TimeStampToMSecs(__p0^);
end;

procedure ____DateTimeToSystemTime__Wrapper(p0 : TDateTime;
const p1 : IDispatch);
var
__p1 : ^TSystemTime;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
DateTimeToSystemTime(p0,__p1^);
end;

function ____SystemTimeToDateTime__Wrapper(const p0 : IDispatch): TDateTime;
var
__p0 : ^TSystemTime;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := SystemTimeToDateTime(__p0^);
end;

function ____SafeLoadLibrary__Wrapper(cArgs : integer; pArgs : PArgList) : OleVariant;
begin
case cArgs of
1:
begin
result := SafeLoadLibrary(OleVariant(pargs^[0]));
end;
2:
begin
result := SafeLoadLibrary(OleVariant(pargs^[1]),OleVariant(pargs^[0]));
end;
end
end;


type __Int64Rec__Wrapper__ = class(__Int64Rec__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __Int64Rec__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertInt64RecToVariant(var R : Int64Rec) : OleVariant;
var
__rw : __Int64Rec__Wrapper__;
begin
__rw := __Int64Rec__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToInt64Rec(const V : OleVariant) : Int64Rec;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := Int64Rec((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __LongRec__Wrapper__ = class(__LongRec__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __LongRec__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertLongRecToVariant(var R : LongRec) : OleVariant;
var
__rw : __LongRec__Wrapper__;
begin
__rw := __LongRec__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToLongRec(const V : OleVariant) : LongRec;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := LongRec((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TActiveThreadRecord__Wrapper__ = class(__TActiveThreadRecord__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TActiveThreadRecord__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTActiveThreadRecordToVariant(var R : TActiveThreadRecord) : OleVariant;
var
__rw : __TActiveThreadRecord__Wrapper__;
begin
__rw := __TActiveThreadRecord__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTActiveThreadRecord(const V : OleVariant) : TActiveThreadRecord;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TActiveThreadRecord((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TFileRec__Wrapper__ = class(__TFileRec__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TFileRec__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTFileRecToVariant(var R : TFileRec) : OleVariant;
var
__rw : __TFileRec__Wrapper__;
begin
__rw := __TFileRec__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTFileRec(const V : OleVariant) : TFileRec;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TFileRec((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TFloatRec__Wrapper__ = class(__TFloatRec__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TFloatRec__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTFloatRecToVariant(var R : TFloatRec) : OleVariant;
var
__rw : __TFloatRec__Wrapper__;
begin
__rw := __TFloatRec__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTFloatRec(const V : OleVariant) : TFloatRec;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TFloatRec((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TLangRec__Wrapper__ = class(__TLangRec__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TLangRec__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTLangRecToVariant(var R : TLangRec) : OleVariant;
var
__rw : __TLangRec__Wrapper__;
begin
__rw := __TLangRec__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTLangRec(const V : OleVariant) : TLangRec;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TLangRec((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TMethod__Wrapper__ = class(__TMethod__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TMethod__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTMethodToVariant(var R : TMethod) : OleVariant;
var
__rw : __TMethod__Wrapper__;
begin
__rw := __TMethod__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTMethod(const V : OleVariant) : TMethod;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TMethod((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TSearchRec__Wrapper__ = class(__TSearchRec__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TSearchRec__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTSearchRecToVariant(var R : TSearchRec) : OleVariant;
var
__rw : __TSearchRec__Wrapper__;
begin
__rw := __TSearchRec__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTSearchRec(const V : OleVariant) : TSearchRec;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TSearchRec((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TSysLocale__Wrapper__ = class(__TSysLocale__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TSysLocale__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTSysLocaleToVariant(var R : TSysLocale) : OleVariant;
var
__rw : __TSysLocale__Wrapper__;
begin
__rw := __TSysLocale__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTSysLocale(const V : OleVariant) : TSysLocale;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TSysLocale((_idisp as IDCRecordWrapper).GetRecordPtr^);
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

type __TTextRec__Wrapper__ = class(__TTextRec__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TTextRec__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTTextRecToVariant(var R : TTextRec) : OleVariant;
var
__rw : __TTextRec__Wrapper__;
begin
__rw := __TTextRec__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTTextRec(const V : OleVariant) : TTextRec;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TTextRec((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TTimeStamp__Wrapper__ = class(__TTimeStamp__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TTimeStamp__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTTimeStampToVariant(var R : TTimeStamp) : OleVariant;
var
__rw : __TTimeStamp__Wrapper__;
begin
__rw := __TTimeStamp__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTTimeStamp(const V : OleVariant) : TTimeStamp;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TTimeStamp((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetException__HelpContext(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := Exception(Instance).HelpContext;
end;

procedure __DC__SetException__HelpContext(Instance : TObject; Params : PVariantArgList);
begin
Exception(Instance).HelpContext:=OleVariant(Params^[0]);
end;

function __DC__GetException__Message(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := Exception(Instance).Message;
end;

procedure __DC__SetException__Message(Instance : TObject; Params : PVariantArgList);
begin
Exception(Instance).Message:=OleVariant(Params^[0]);
end;

function __DC__GetTLanguages__Count(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TLanguages(Instance).Count;
end;

function __DC__GetTLanguages__Name(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TLanguages(Instance).Name[OleVariant(Params^[0])];
end;

function __DC__GetTLanguages__NameFromLocaleID(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TLanguages(Instance).NameFromLocaleID[OleVariant(Params^[0])];
end;

function __DC__GetTLanguages__NameFromLCID(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TLanguages(Instance).NameFromLCID[OleVariant(Params^[0])];
end;

function __DC__GetTLanguages__ID(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TLanguages(Instance).ID[OleVariant(Params^[0])];
end;

function __DC__GetTLanguages__LocaleID(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TLanguages(Instance).LocaleID[OleVariant(Params^[0])];
end;

function __DC__GetTLanguages__Ext(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TLanguages(Instance).Ext[OleVariant(Params^[0])];
end;

procedure __RegisterProps;
begin
RegisterProperty(Exception,'HelpContext',__DC__GetException__HelpContext,__DC__SetException__HelpContext);
RegisterProperty(Exception,'Message',__DC__GetException__Message,__DC__SetException__Message);
RegisterProperty(TLanguages,'Count',__DC__GetTLanguages__Count,nil);
RegisterIndexedProperty(TLanguages,'Name',1,False,__DC__GetTLanguages__Name,nil);
RegisterIndexedProperty(TLanguages,'NameFromLocaleID',1,False,__DC__GetTLanguages__NameFromLocaleID,nil);
RegisterIndexedProperty(TLanguages,'NameFromLCID',1,False,__DC__GetTLanguages__NameFromLCID,nil);
RegisterIndexedProperty(TLanguages,'ID',1,False,__DC__GetTLanguages__ID,nil);
RegisterIndexedProperty(TLanguages,'LocaleID',1,False,__DC__GetTLanguages__LocaleID,nil);
RegisterIndexedProperty(TLanguages,'Ext',1,False,__DC__GetTLanguages__Ext,nil);
end;

function __DC__GetSysUtils__EmptyStr(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := SysUtils.EmptyStr;
end;

procedure __DC__SetSysUtils__EmptyStr(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.EmptyStr:=OleVariant(Params^[0]);
end;

function __DC__GetSysUtils__NullStr(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(SysUtils.NullStr);
end;

procedure __DC__SetSysUtils__NullStr(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.NullStr:=VarToPointer(OleVariant(Params^[0]));
end;

function __DC__GetSysUtils__Win32Platform(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := SysUtils.Win32Platform;
end;

procedure __DC__SetSysUtils__Win32Platform(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.Win32Platform:=OleVariant(Params^[0]);
end;

function __DC__GetSysUtils__Win32MajorVersion(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := SysUtils.Win32MajorVersion;
end;

procedure __DC__SetSysUtils__Win32MajorVersion(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.Win32MajorVersion:=OleVariant(Params^[0]);
end;

function __DC__GetSysUtils__Win32MinorVersion(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := SysUtils.Win32MinorVersion;
end;

procedure __DC__SetSysUtils__Win32MinorVersion(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.Win32MinorVersion:=OleVariant(Params^[0]);
end;

function __DC__GetSysUtils__Win32BuildNumber(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := SysUtils.Win32BuildNumber;
end;

procedure __DC__SetSysUtils__Win32BuildNumber(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.Win32BuildNumber:=OleVariant(Params^[0]);
end;

function __DC__GetSysUtils__Win32CSDVersion(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := SysUtils.Win32CSDVersion;
end;

procedure __DC__SetSysUtils__Win32CSDVersion(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.Win32CSDVersion:=OleVariant(Params^[0]);
end;

function __DC__GetSysUtils__CurrencyString(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := SysUtils.CurrencyString;
end;

procedure __DC__SetSysUtils__CurrencyString(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.CurrencyString:=OleVariant(Params^[0]);
end;

function __DC__GetSysUtils__CurrencyFormat(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := SysUtils.CurrencyFormat;
end;

procedure __DC__SetSysUtils__CurrencyFormat(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.CurrencyFormat:=OleVariant(Params^[0]);
end;

function __DC__GetSysUtils__NegCurrFormat(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := SysUtils.NegCurrFormat;
end;

procedure __DC__SetSysUtils__NegCurrFormat(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.NegCurrFormat:=OleVariant(Params^[0]);
end;

function __DC__GetSysUtils__ThousandSeparator(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := SysUtils.ThousandSeparator;
end;

procedure __DC__SetSysUtils__ThousandSeparator(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.ThousandSeparator:=VarToChar(OleVariant(Params^[0]));
end;

function __DC__GetSysUtils__DecimalSeparator(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := SysUtils.DecimalSeparator;
end;

procedure __DC__SetSysUtils__DecimalSeparator(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.DecimalSeparator:=VarToChar(OleVariant(Params^[0]));
end;

function __DC__GetSysUtils__CurrencyDecimals(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := SysUtils.CurrencyDecimals;
end;

procedure __DC__SetSysUtils__CurrencyDecimals(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.CurrencyDecimals:=OleVariant(Params^[0]);
end;

function __DC__GetSysUtils__DateSeparator(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := SysUtils.DateSeparator;
end;

procedure __DC__SetSysUtils__DateSeparator(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.DateSeparator:=VarToChar(OleVariant(Params^[0]));
end;

function __DC__GetSysUtils__ShortDateFormat(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := SysUtils.ShortDateFormat;
end;

procedure __DC__SetSysUtils__ShortDateFormat(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.ShortDateFormat:=OleVariant(Params^[0]);
end;

function __DC__GetSysUtils__LongDateFormat(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := SysUtils.LongDateFormat;
end;

procedure __DC__SetSysUtils__LongDateFormat(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.LongDateFormat:=OleVariant(Params^[0]);
end;

function __DC__GetSysUtils__TimeSeparator(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := SysUtils.TimeSeparator;
end;

procedure __DC__SetSysUtils__TimeSeparator(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.TimeSeparator:=VarToChar(OleVariant(Params^[0]));
end;

function __DC__GetSysUtils__TimeAMString(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := SysUtils.TimeAMString;
end;

procedure __DC__SetSysUtils__TimeAMString(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.TimeAMString:=OleVariant(Params^[0]);
end;

function __DC__GetSysUtils__TimePMString(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := SysUtils.TimePMString;
end;

procedure __DC__SetSysUtils__TimePMString(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.TimePMString:=OleVariant(Params^[0]);
end;

function __DC__GetSysUtils__ShortTimeFormat(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := SysUtils.ShortTimeFormat;
end;

procedure __DC__SetSysUtils__ShortTimeFormat(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.ShortTimeFormat:=OleVariant(Params^[0]);
end;

function __DC__GetSysUtils__LongTimeFormat(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := SysUtils.LongTimeFormat;
end;

procedure __DC__SetSysUtils__LongTimeFormat(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.LongTimeFormat:=OleVariant(Params^[0]);
end;

function __DC__GetSysUtils__SysLocale(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TSysLocale__Wrapper;
begin
__wrapper := __TSysLocale__Wrapper.Create;
__wrapper.fR := SysUtils.SysLocale;
result := IUnknown(__wrapper) as IDispatch;
end;

function __DC__GetSysUtils__TwoDigitYearCenturyWindow(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := SysUtils.TwoDigitYearCenturyWindow;
end;

procedure __DC__SetSysUtils__TwoDigitYearCenturyWindow(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.TwoDigitYearCenturyWindow:=OleVariant(Params^[0]);
end;

function __DC__GetSysUtils__ListSeparator(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := SysUtils.ListSeparator;
end;

procedure __DC__SetSysUtils__ListSeparator(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.ListSeparator:=VarToChar(OleVariant(Params^[0]));
end;

function __DC__GetSysUtils__HexDisplayPrefix(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := SysUtils.HexDisplayPrefix;
end;

procedure __DC__SetSysUtils__HexDisplayPrefix(Instance : TObject; Params : PVariantArgList);
begin
SysUtils.HexDisplayPrefix:=OleVariant(Params^[0]);
end;

var __RegisteredVars : TList;
procedure __RegisterVars;
begin
__RegisteredVars := TList.Create;
__RegisteredVars.Add(RegisterVar('EmptyStr',__DC__GetSysUtils__EmptyStr,__DC__SetSysUtils__EmptyStr));
__RegisteredVars.Add(RegisterVar('NullStr',__DC__GetSysUtils__NullStr,__DC__SetSysUtils__NullStr));
__RegisteredVars.Add(RegisterVar('Win32Platform',__DC__GetSysUtils__Win32Platform,__DC__SetSysUtils__Win32Platform));
__RegisteredVars.Add(RegisterVar('Win32MajorVersion',__DC__GetSysUtils__Win32MajorVersion,__DC__SetSysUtils__Win32MajorVersion));
__RegisteredVars.Add(RegisterVar('Win32MinorVersion',__DC__GetSysUtils__Win32MinorVersion,__DC__SetSysUtils__Win32MinorVersion));
__RegisteredVars.Add(RegisterVar('Win32BuildNumber',__DC__GetSysUtils__Win32BuildNumber,__DC__SetSysUtils__Win32BuildNumber));
__RegisteredVars.Add(RegisterVar('Win32CSDVersion',__DC__GetSysUtils__Win32CSDVersion,__DC__SetSysUtils__Win32CSDVersion));
__RegisteredVars.Add(RegisterVar('CurrencyString',__DC__GetSysUtils__CurrencyString,__DC__SetSysUtils__CurrencyString));
__RegisteredVars.Add(RegisterVar('CurrencyFormat',__DC__GetSysUtils__CurrencyFormat,__DC__SetSysUtils__CurrencyFormat));
__RegisteredVars.Add(RegisterVar('NegCurrFormat',__DC__GetSysUtils__NegCurrFormat,__DC__SetSysUtils__NegCurrFormat));
__RegisteredVars.Add(RegisterVar('ThousandSeparator',__DC__GetSysUtils__ThousandSeparator,__DC__SetSysUtils__ThousandSeparator));
__RegisteredVars.Add(RegisterVar('DecimalSeparator',__DC__GetSysUtils__DecimalSeparator,__DC__SetSysUtils__DecimalSeparator));
__RegisteredVars.Add(RegisterVar('CurrencyDecimals',__DC__GetSysUtils__CurrencyDecimals,__DC__SetSysUtils__CurrencyDecimals));
__RegisteredVars.Add(RegisterVar('DateSeparator',__DC__GetSysUtils__DateSeparator,__DC__SetSysUtils__DateSeparator));
__RegisteredVars.Add(RegisterVar('ShortDateFormat',__DC__GetSysUtils__ShortDateFormat,__DC__SetSysUtils__ShortDateFormat));
__RegisteredVars.Add(RegisterVar('LongDateFormat',__DC__GetSysUtils__LongDateFormat,__DC__SetSysUtils__LongDateFormat));
__RegisteredVars.Add(RegisterVar('TimeSeparator',__DC__GetSysUtils__TimeSeparator,__DC__SetSysUtils__TimeSeparator));
__RegisteredVars.Add(RegisterVar('TimeAMString',__DC__GetSysUtils__TimeAMString,__DC__SetSysUtils__TimeAMString));
__RegisteredVars.Add(RegisterVar('TimePMString',__DC__GetSysUtils__TimePMString,__DC__SetSysUtils__TimePMString));
__RegisteredVars.Add(RegisterVar('ShortTimeFormat',__DC__GetSysUtils__ShortTimeFormat,__DC__SetSysUtils__ShortTimeFormat));
__RegisteredVars.Add(RegisterVar('LongTimeFormat',__DC__GetSysUtils__LongTimeFormat,__DC__SetSysUtils__LongTimeFormat));
__RegisteredVars.Add(RegisterVar('SysLocale',__DC__GetSysUtils__SysLocale,nil));
__RegisteredVars.Add(RegisterVar('TwoDigitYearCenturyWindow',__DC__GetSysUtils__TwoDigitYearCenturyWindow,__DC__SetSysUtils__TwoDigitYearCenturyWindow));
__RegisteredVars.Add(RegisterVar('ListSeparator',__DC__GetSysUtils__ListSeparator,__DC__SetSysUtils__ListSeparator));
__RegisteredVars.Add(RegisterVar('HexDisplayPrefix',__DC__GetSysUtils__HexDisplayPrefix,__DC__SetSysUtils__HexDisplayPrefix));
end;

procedure __UnregisterVars;
begin
__RegisteredVars.Free;
end;

const __ConstNames0 : array[0..54] of string = (
'fmOpenRead'
,'fmOpenWrite'
,'fmOpenReadWrite'
,'fmShareCompat'
,'fmShareExclusive'
,'fmShareDenyWrite'
,'fmShareDenyRead'
,'fmShareDenyNone'
,'faReadOnly'
,'faHidden'
,'faSysFile'
,'faVolumeID'
,'faDirectory'
,'faArchive'
,'faAnyFile'
,'fmClosed'
,'fmInput'
,'fmOutput'
,'fmInOut'
,'SecsPerDay'
,'MSecsPerDay'
,'DateDelta'
,'fvExtended'
,'fvCurrency'
,'ffGeneral'
,'ffExponent'
,'ffFixed'
,'ffNumber'
,'ffCurrency'
,'mbSingleByte'
,'mbLeadByte'
,'mbTrailByte'
,'rfReplaceAll'
,'rfIgnoreCase'
,'pfNeverBuild'
,'pfDesignOnly'
,'pfRunOnly'
,'pfIgnoreDupUnits'
,'pfModuleTypeMask'
,'pfExeModule'
,'pfPackageModule'
,'pfProducerMask'
,'pfV3Produced'
,'pfProducerUndefined'
,'pfBCB4Produced'
,'pfDelphi4Produced'
,'pfLibraryModule'
,'ufMainUnit'
,'ufPackageUnit'
,'ufWeakUnit'
,'ufOrgWeakUnit'
,'ufImplicitUnit'
,'ufWeakPackageUnit'
,'ntContainsUnit'
,'ntRequiresPackage'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,fmOpenRead));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,fmOpenWrite));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,fmOpenReadWrite));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,fmShareCompat));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,fmShareExclusive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,fmShareDenyWrite));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,fmShareDenyRead));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,fmShareDenyNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,faReadOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,faHidden));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,faSysFile));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,faVolumeID));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,faDirectory));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,faArchive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,faAnyFile));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,fmClosed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,fmInput));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,fmOutput));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,fmInOut));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,SecsPerDay));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,MSecsPerDay));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,DateDelta));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,fvExtended));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,fvCurrency));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,ffGeneral));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,ffExponent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,ffFixed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,ffNumber));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,ffCurrency));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,mbSingleByte));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,mbLeadByte));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,mbTrailByte));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,rfReplaceAll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,rfIgnoreCase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,pfNeverBuild));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,pfDesignOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,pfRunOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,pfIgnoreDupUnits));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,pfModuleTypeMask));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,pfExeModule));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,pfPackageModule));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,pfProducerMask));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,pfV3Produced));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,pfProducerUndefined));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,pfBCB4Produced));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,pfDelphi4Produced));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,pfLibraryModule));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,ufMainUnit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[48] ,ufPackageUnit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[49] ,ufWeakUnit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[50] ,ufOrgWeakUnit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[51] ,ufImplicitUnit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[52] ,ufWeakPackageUnit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[53] ,ntContainsUnit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[54] ,ntRequiresPackage));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..35] of TClass = (
EAbort,
EAbstractError,
EAccessViolation,
EAssertionFailed,
EControlC,
EConvertError,
EDivByZero,
EExternal,
EExternalException,
EHeapException,
EInOutError,
EIntError,
EIntfCastError,
EIntOverflow,
EInvalidCast,
EInvalidContainer,
EInvalidInsert,
EInvalidOp,
EInvalidPointer,
EMathError,
EOutOfMemory,
EOverflow,
EPackageError,
EPrivilege,
EPropReadOnly,
EPropWriteOnly,
ERangeError,
ESafecallException,
EStackOverflow,
EUnderflow,
EVariantError,
EWin32Error,
Exception,
EZeroDivide,
TLanguages,
TMultiReadExclusiveWriteSynchronizer
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..154] of string = (
'Int64Rec'
,'LongRec'
,'TActiveThreadRecord'
,'TFileRec'
,'TFloatRec'
,'TLangRec'
,'TMethod'
,'TSearchRec'
,'TSysLocale'
,'TTextRec'
,'TTimeStamp'
,'Languages'
,'AllocMem'
,'NewStr'
,'DisposeStr'
,'AssignStr'
,'AppendStr'
,'UpperCase'
,'LowerCase'
,'CompareStr'
,'CompareMem'
,'CompareText'
,'SameText'
,'AnsiUpperCase'
,'AnsiLowerCase'
,'AnsiCompareStr'
,'AnsiSameStr'
,'AnsiCompareText'
,'AnsiSameText'
,'AnsiLastChar'
,'Trim'
,'TrimLeft'
,'TrimRight'
,'QuotedStr'
,'AnsiQuotedStr'
,'AdjustLineBreaks'
,'IsValidIdent'
,'IntToStr'
,'IntToHex'
,'StrToInt'
,'StrToIntDef'
,'LoadStr'
,'FmtLoadStr'
,'FileOpen'
,'FileCreate'
,'FileRead'
,'FileWrite'
,'FileSeek'
,'FileClose'
,'FileAge'
,'FileExists'
,'FindFirst'
,'FindNext'
,'FindClose'
,'FileGetDate'
,'FileSetDate'
,'FileGetAttr'
,'FileSetAttr'
,'DeleteFile'
,'RenameFile'
,'ChangeFileExt'
,'ExtractFilePath'
,'ExtractFileDir'
,'ExtractFileDrive'
,'ExtractFileName'
,'ExtractFileExt'
,'ExpandFileName'
,'ExpandUNCFileName'
,'ExtractRelativePath'
,'ExtractShortPathName'
,'FileSearch'
,'FileDateToDateTime'
,'DateTimeToFileDate'
,'GetCurrentDir'
,'SetCurrentDir'
,'CreateDir'
,'RemoveDir'
,'StrAlloc'
,'Format'
,'FmtStr'
,'FormatBuf'
,'FloatToStr'
,'CurrToStr'
,'FloatToStrF'
,'CurrToStrF'
,'FormatFloat'
,'FormatCurr'
,'StrToFloat'
,'StrToCurr'
,'FloatToDecimal'
,'DateTimeToTimeStamp'
,'TimeStampToDateTime'
,'MSecsToTimeStamp'
,'TimeStampToMSecs'
,'EncodeDate'
,'EncodeTime'
,'DecodeDate'
,'DecodeTime'
,'DateTimeToSystemTime'
,'SystemTimeToDateTime'
,'DayOfWeek'
,'Date'
,'Time'
,'Now'
,'IncMonth'
,'ReplaceTime'
,'ReplaceDate'
,'IsLeapYear'
,'DateToStr'
,'TimeToStr'
,'DateTimeToStr'
,'StrToDate'
,'StrToTime'
,'StrToDateTime'
,'FormatDateTime'
,'DateTimeToString'
,'SysErrorMessage'
,'GetLocaleStr'
,'GetLocaleChar'
,'GetFormatSettings'
,'ExceptObject'
,'ExceptAddr'
,'ShowException'
,'Abort'
,'OutOfMemoryError'
,'Beep'
,'ByteType'
,'ByteToCharLen'
,'CharToByteLen'
,'ByteToCharIndex'
,'CharToByteIndex'
,'IsPathDelimiter'
,'IsDelimiter'
,'IncludeTrailingBackslash'
,'ExcludeTrailingBackslash'
,'LastDelimiter'
,'AnsiCompareFileName'
,'AnsiLowerCaseFileName'
,'AnsiUpperCaseFileName'
,'AnsiPos'
,'StringReplace'
,'WrapText'
,'FindCmdLineSwitch'
,'FreeAndNil'
,'LoadPackage'
,'UnloadPackage'
,'InitializePackage'
,'FinalizePackage'
,'RaiseLastWin32Error'
,'Win32Check'
,'CallTerminateProcs'
,'GDAL'
,'RCS'
,'RPR'
,'SafeLoadLibrary'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_Int64Rec_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(_LongRec_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[2],Addr(_TActiveThreadRecord_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[3],Addr(_TFileRec_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[4],Addr(_TFloatRec_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[5],Addr(_TLangRec_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[6],Addr(_TMethod_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[7],Addr(_TSearchRec_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[8],Addr(_TSysLocale_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[9],Addr(_TTextRec_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[10],Addr(_TTimeStamp_)));
RegisterProc(nil,MethodNames[11],mtProc,TypeInfo(_T0),[TypeInfo(TLanguages)],Addr(Languages),cRegister);

RegisterProc(nil,MethodNames[12],mtProc,TypeInfo(_T1),[
TypeInfo(Cardinal),TypeInfoPointer],Addr(AllocMem),cRegister);

RegisterProc(nil,MethodNames[13],mtProc,TypeInfo(_T3),[
TypeInfo(string),TypeInfoPointer],Addr(NewStr),cRegister);

RegisterProc(nil,MethodNames[14],mtProc,TypeInfo(_T4),[
TypeInfoPointer],Addr(DisposeStr),cRegister);

RegisterProc(nil,MethodNames[15],mtProc,TypeInfo(_T5),[
TypeInfoPointer,
TypeInfo(string)],Addr(AssignStr),cRegister);

RegisterProc(nil,MethodNames[16],mtProc,TypeInfo(_T6),[
TypeInfo(string),
TypeInfo(string)],Addr(AppendStr),cRegister);

RegisterProc(nil,MethodNames[17],mtProc,TypeInfo(_T7),[
TypeInfo(string),TypeInfo(string)],Addr(UpperCase),cRegister);

RegisterProc(nil,MethodNames[18],mtProc,TypeInfo(_T8),[
TypeInfo(string),TypeInfo(string)],Addr(LowerCase),cRegister);

RegisterProc(nil,MethodNames[19],mtProc,TypeInfo(_T9),[
TypeInfo(string),
TypeInfo(string),TypeInfo(Integer)],Addr(CompareStr),cRegister);

RegisterProc(nil,MethodNames[20],mtProc,TypeInfo(_T10),[
TypeInfoPointer,
TypeInfoPointer,
TypeInfo(Integer),TypeInfo(Boolean)],Addr(CompareMem),cRegister);

RegisterProc(nil,MethodNames[21],mtProc,TypeInfo(_T11),[
TypeInfo(string),
TypeInfo(string),TypeInfo(Integer)],Addr(CompareText),cRegister);

RegisterProc(nil,MethodNames[22],mtProc,TypeInfo(_T12),[
TypeInfo(string),
TypeInfo(string),TypeInfo(Boolean)],Addr(SameText),cRegister);

RegisterProc(nil,MethodNames[23],mtProc,TypeInfo(_T13),[
TypeInfo(string),TypeInfo(string)],Addr(AnsiUpperCase),cRegister);

RegisterProc(nil,MethodNames[24],mtProc,TypeInfo(_T14),[
TypeInfo(string),TypeInfo(string)],Addr(AnsiLowerCase),cRegister);

RegisterProc(nil,MethodNames[25],mtProc,TypeInfo(_T15),[
TypeInfo(string),
TypeInfo(string),TypeInfo(Integer)],Addr(AnsiCompareStr),cRegister);

RegisterProc(nil,MethodNames[26],mtProc,TypeInfo(_T16),[
TypeInfo(string),
TypeInfo(string),TypeInfo(Boolean)],Addr(AnsiSameStr),cRegister);

RegisterProc(nil,MethodNames[27],mtProc,TypeInfo(_T17),[
TypeInfo(string),
TypeInfo(string),TypeInfo(Integer)],Addr(AnsiCompareText),cRegister);

RegisterProc(nil,MethodNames[28],mtProc,TypeInfo(_T18),[
TypeInfo(string),
TypeInfo(string),TypeInfo(Boolean)],Addr(AnsiSameText),cRegister);

RegisterProc(nil,MethodNames[29],mtProc,TypeInfo(_T25),[
TypeInfo(string),TypeInfoPChar],Addr(AnsiLastChar),cRegister);

RegisterProc(nil,MethodNames[30],mtProc,TypeInfo(_T27),[
TypeInfo(string),TypeInfo(string)],Addr(Trim),cRegister);

RegisterProc(nil,MethodNames[31],mtProc,TypeInfo(_T28),[
TypeInfo(string),TypeInfo(string)],Addr(TrimLeft),cRegister);

RegisterProc(nil,MethodNames[32],mtProc,TypeInfo(_T29),[
TypeInfo(string),TypeInfo(string)],Addr(TrimRight),cRegister);

RegisterProc(nil,MethodNames[33],mtProc,TypeInfo(_T30),[
TypeInfo(string),TypeInfo(string)],Addr(QuotedStr),cRegister);

RegisterProc(nil,MethodNames[34],mtProc,TypeInfo(_T31),[
TypeInfo(string),
TypeInfo(Char),TypeInfo(string)],Addr(AnsiQuotedStr),cRegister);

RegisterProc(nil,MethodNames[35],mtProc,TypeInfo(_T33),[
TypeInfo(string),TypeInfo(string)],Addr(AdjustLineBreaks),cRegister);

RegisterProc(nil,MethodNames[36],mtProc,TypeInfo(_T34),[
TypeInfo(string),TypeInfo(Boolean)],Addr(IsValidIdent),cRegister);

RegisterProc(nil,MethodNames[37],mtProc,TypeInfo(_T35),[
TypeInfo(Integer),TypeInfo(string)],Addr(IntToStr),cRegister);

RegisterProc(nil,MethodNames[38],mtProc,TypeInfo(_T36),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(string)],Addr(IntToHex),cRegister);

RegisterProc(nil,MethodNames[39],mtProc,TypeInfo(_T37),[
TypeInfo(string),TypeInfo(Integer)],Addr(StrToInt),cRegister);

RegisterProc(nil,MethodNames[40],mtProc,TypeInfo(_T39),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Integer)],Addr(StrToIntDef),cRegister);

RegisterProc(nil,MethodNames[41],mtProc,TypeInfo(_T41),[
TypeInfo(Integer),TypeInfo(string)],Addr(LoadStr),cRegister);

RegisterProc(nil,MethodNames[42],mtProc,TypeInfo(_T42),[
TypeInfo(Integer),
TypeInfoArrayOfConst,TypeInfo(string)],Addr(FmtLoadStr),cRegister);

RegisterProc(nil,MethodNames[43],mtProc,TypeInfo(_T43),[
TypeInfo(string),
TypeInfo(LongWord),TypeInfo(Integer)],Addr(FileOpen),cRegister);

RegisterProc(nil,MethodNames[44],mtProc,TypeInfo(_T44),[
TypeInfo(string),TypeInfo(Integer)],Addr(FileCreate),cRegister);

RegisterProc(nil,MethodNames[45],mtProc,TypeInfo(_T45),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(LongWord),TypeInfo(Integer)],Addr(FileRead),cRegister);

RegisterProc(nil,MethodNames[46],mtProc,TypeInfo(_T46),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(LongWord),TypeInfo(Integer)],Addr(FileWrite),cRegister);

RegisterProc(nil,MethodNames[47],mtProc,TypeInfo(_T47),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Integer)],Addr(FileSeek),cRegister);

RegisterProc(nil,MethodNames[48],mtProc,TypeInfo(_T48),[
TypeInfo(Integer)],Addr(FileClose),cRegister);

RegisterProc(nil,MethodNames[49],mtProc,TypeInfo(_T49),[
TypeInfo(string),TypeInfo(Integer)],Addr(FileAge),cRegister);

RegisterProc(nil,MethodNames[50],mtProc,TypeInfo(_T50),[
TypeInfo(string),TypeInfo(Boolean)],Addr(FileExists),cRegister);

RegisterProc(nil,MethodNames[51],mtProc,TypeInfo(_T51),[
TypeInfo(string),
TypeInfo(Integer),
TypeInfo(IDispatch),TypeInfo(Integer)],Addr(____FindFirst__Wrapper),cRegister);

RegisterProc(nil,MethodNames[52],mtProc,TypeInfo(_T52),[
TypeInfo(IDispatch),TypeInfo(Integer)],Addr(____FindNext__Wrapper),cRegister);

RegisterProc(nil,MethodNames[53],mtProc,TypeInfo(_T53),[
TypeInfo(IDispatch)],Addr(____FindClose__Wrapper),cRegister);

RegisterProc(nil,MethodNames[54],mtProc,TypeInfo(_T54),[
TypeInfo(Integer),TypeInfo(Integer)],Addr(FileGetDate),cRegister);

RegisterProc(nil,MethodNames[55],mtProc,TypeInfo(_T55),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Integer)],Addr(FileSetDate),cRegister);

RegisterProc(nil,MethodNames[56],mtProc,TypeInfo(_T56),[
TypeInfo(string),TypeInfo(Integer)],Addr(FileGetAttr),cRegister);

RegisterProc(nil,MethodNames[57],mtProc,TypeInfo(_T57),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Integer)],Addr(FileSetAttr),cRegister);

RegisterProc(nil,MethodNames[58],mtProc,TypeInfo(_T58),[
TypeInfo(string),TypeInfo(Boolean)],Addr(DeleteFile),cRegister);

RegisterProc(nil,MethodNames[59],mtProc,TypeInfo(_T59),[
TypeInfo(string),
TypeInfo(string),TypeInfo(Boolean)],Addr(RenameFile),cRegister);

RegisterProc(nil,MethodNames[60],mtProc,TypeInfo(_T60),[
TypeInfo(string),
TypeInfo(string),TypeInfo(string)],Addr(ChangeFileExt),cRegister);

RegisterProc(nil,MethodNames[61],mtProc,TypeInfo(_T61),[
TypeInfo(string),TypeInfo(string)],Addr(ExtractFilePath),cRegister);

RegisterProc(nil,MethodNames[62],mtProc,TypeInfo(_T62),[
TypeInfo(string),TypeInfo(string)],Addr(ExtractFileDir),cRegister);

RegisterProc(nil,MethodNames[63],mtProc,TypeInfo(_T63),[
TypeInfo(string),TypeInfo(string)],Addr(ExtractFileDrive),cRegister);

RegisterProc(nil,MethodNames[64],mtProc,TypeInfo(_T64),[
TypeInfo(string),TypeInfo(string)],Addr(ExtractFileName),cRegister);

RegisterProc(nil,MethodNames[65],mtProc,TypeInfo(_T65),[
TypeInfo(string),TypeInfo(string)],Addr(ExtractFileExt),cRegister);

RegisterProc(nil,MethodNames[66],mtProc,TypeInfo(_T66),[
TypeInfo(string),TypeInfo(string)],Addr(ExpandFileName),cRegister);

RegisterProc(nil,MethodNames[67],mtProc,TypeInfo(_T67),[
TypeInfo(string),TypeInfo(string)],Addr(ExpandUNCFileName),cRegister);

RegisterProc(nil,MethodNames[68],mtProc,TypeInfo(_T68),[
TypeInfo(string),
TypeInfo(string),TypeInfo(string)],Addr(ExtractRelativePath),cRegister);

RegisterProc(nil,MethodNames[69],mtProc,TypeInfo(_T69),[
TypeInfo(string),TypeInfo(string)],Addr(ExtractShortPathName),cRegister);

RegisterProc(nil,MethodNames[70],mtProc,TypeInfo(_T70),[
TypeInfo(string),
TypeInfo(string),TypeInfo(string)],Addr(FileSearch),cRegister);

RegisterProc(nil,MethodNames[71],mtProc,TypeInfo(_T73),[
TypeInfo(Integer),TypeInfo(TDateTime)],Addr(FileDateToDateTime),cRegister);

RegisterProc(nil,MethodNames[72],mtProc,TypeInfo(_T74),[
TypeInfo(TDateTime),TypeInfo(Integer)],Addr(DateTimeToFileDate),cRegister);

RegisterProc(nil,MethodNames[73],mtProc,TypeInfo(_T75),[TypeInfo(string)],Addr(GetCurrentDir),cRegister);

RegisterProc(nil,MethodNames[74],mtProc,TypeInfo(_T76),[
TypeInfo(string),TypeInfo(Boolean)],Addr(SetCurrentDir),cRegister);

RegisterProc(nil,MethodNames[75],mtProc,TypeInfo(_T77),[
TypeInfo(string),TypeInfo(Boolean)],Addr(CreateDir),cRegister);

RegisterProc(nil,MethodNames[76],mtProc,TypeInfo(_T78),[
TypeInfo(string),TypeInfo(Boolean)],Addr(RemoveDir),cRegister);

RegisterProc(nil,MethodNames[77],mtProc,TypeInfo(_T99),[
TypeInfo(Cardinal),TypeInfoPChar],Addr(StrAlloc),cRegister);

RegisterProc(nil,MethodNames[78],mtProc,TypeInfo(_T103),[
TypeInfo(string),
TypeInfoArrayOfConst,TypeInfo(string)],Addr(Format),cRegister);

RegisterProc(nil,MethodNames[79],mtProc,TypeInfo(_T104),[
TypeInfo(string),
TypeInfo(string),
TypeInfoArrayOfConst],Addr(FmtStr),cRegister);

RegisterProc(nil,MethodNames[80],mtProc,TypeInfo(_T107),[
TypeInfoUntyped,
TypeInfo(Cardinal),
TypeInfo(Cardinal),
TypeInfo(Cardinal),
TypeInfoArrayOfConst,TypeInfo(Cardinal)],Addr(FormatBuf),cRegister);

RegisterProc(nil,MethodNames[81],mtProc,TypeInfo(_T108),[
TypeInfo(Extended),TypeInfo(string)],Addr(FloatToStr),cRegister);

RegisterProc(nil,MethodNames[82],mtProc,TypeInfo(_T109),[
TypeInfo(Currency),TypeInfo(string)],Addr(CurrToStr),cRegister);

RegisterProc(nil,MethodNames[83],mtProc,TypeInfo(_T110),[
TypeInfo(Extended),
TypeInfo(TFloatFormat),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(string)],Addr(FloatToStrF),cRegister);

RegisterProc(nil,MethodNames[84],mtProc,TypeInfo(_T111),[
TypeInfo(Currency),
TypeInfo(TFloatFormat),
TypeInfo(Integer),TypeInfo(string)],Addr(CurrToStrF),cRegister);

RegisterProc(nil,MethodNames[85],mtProc,TypeInfo(_T113),[
TypeInfo(string),
TypeInfo(Extended),TypeInfo(string)],Addr(FormatFloat),cRegister);

RegisterProc(nil,MethodNames[86],mtProc,TypeInfo(_T114),[
TypeInfo(string),
TypeInfo(Currency),TypeInfo(string)],Addr(FormatCurr),cRegister);

RegisterProc(nil,MethodNames[87],mtProc,TypeInfo(_T116),[
TypeInfo(string),TypeInfo(Extended)],Addr(StrToFloat),cRegister);

RegisterProc(nil,MethodNames[88],mtProc,TypeInfo(_T117),[
TypeInfo(string),TypeInfo(Currency)],Addr(StrToCurr),cRegister);

RegisterProc(nil,MethodNames[89],mtProc,TypeInfo(_T119),[
TypeInfo(IDispatch),
TypeInfo(IDispatch),
TypeInfo(TFloatValue),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(____FloatToDecimal__Wrapper),cRegister);

RegisterProc(nil,MethodNames[90],mtProc,TypeInfo(_T120),[
TypeInfo(TDateTime),TypeInfo(IDispatch)],Addr(____DateTimeToTimeStamp__Wrapper),cRegister);

RegisterProc(nil,MethodNames[91],mtProc,TypeInfo(_T121),[
TypeInfo(IDispatch),TypeInfo(TDateTime)],Addr(____TimeStampToDateTime__Wrapper),cRegister);

RegisterProc(nil,MethodNames[92],mtProc,TypeInfo(_T122),[
TypeInfo(Comp),TypeInfo(IDispatch)],Addr(____MSecsToTimeStamp__Wrapper),cRegister);

RegisterProc(nil,MethodNames[93],mtProc,TypeInfo(_T123),[
TypeInfo(IDispatch),TypeInfo(Comp)],Addr(____TimeStampToMSecs__Wrapper),cRegister);

RegisterProc(nil,MethodNames[94],mtProc,TypeInfo(_T124),[
TypeInfo(Word),
TypeInfo(Word),
TypeInfo(Word),TypeInfo(TDateTime)],Addr(EncodeDate),cRegister);

RegisterProc(nil,MethodNames[95],mtProc,TypeInfo(_T125),[
TypeInfo(Word),
TypeInfo(Word),
TypeInfo(Word),
TypeInfo(Word),TypeInfo(TDateTime)],Addr(EncodeTime),cRegister);

RegisterProc(nil,MethodNames[96],mtProc,TypeInfo(_T126),[
TypeInfo(TDateTime),
TypeInfo(Word),
TypeInfo(Word),
TypeInfo(Word)],Addr(DecodeDate),cRegister);

RegisterProc(nil,MethodNames[97],mtProc,TypeInfo(_T127),[
TypeInfo(TDateTime),
TypeInfo(Word),
TypeInfo(Word),
TypeInfo(Word),
TypeInfo(Word)],Addr(DecodeTime),cRegister);

RegisterProc(nil,MethodNames[98],mtProc,TypeInfo(_T128),[
TypeInfo(TDateTime),
TypeInfo(IDispatch)],Addr(____DateTimeToSystemTime__Wrapper),cRegister);

RegisterProc(nil,MethodNames[99],mtProc,TypeInfo(_T129),[
TypeInfo(IDispatch),TypeInfo(TDateTime)],Addr(____SystemTimeToDateTime__Wrapper),cRegister);

RegisterProc(nil,MethodNames[100],mtProc,TypeInfo(_T130),[
TypeInfo(TDateTime),TypeInfo(Integer)],Addr(DayOfWeek),cRegister);

RegisterProc(nil,MethodNames[101],mtProc,TypeInfo(_T131),[TypeInfo(TDateTime)],Addr(Date),cRegister);

RegisterProc(nil,MethodNames[102],mtProc,TypeInfo(_T132),[TypeInfo(TDateTime)],Addr(Time),cRegister);

RegisterProc(nil,MethodNames[103],mtProc,TypeInfo(_T133),[TypeInfo(TDateTime)],Addr(Now),cRegister);

RegisterProc(nil,MethodNames[104],mtProc,TypeInfo(_T134),[
TypeInfo(TDateTime),
TypeInfo(Integer),TypeInfo(TDateTime)],Addr(IncMonth),cRegister);

RegisterProc(nil,MethodNames[105],mtProc,TypeInfo(_T135),[
TypeInfo(TDateTime),
TypeInfo(TDateTime)],Addr(ReplaceTime),cRegister);

RegisterProc(nil,MethodNames[106],mtProc,TypeInfo(_T136),[
TypeInfo(TDateTime),
TypeInfo(TDateTime)],Addr(ReplaceDate),cRegister);

RegisterProc(nil,MethodNames[107],mtProc,TypeInfo(_T137),[
TypeInfo(Word),TypeInfo(Boolean)],Addr(IsLeapYear),cRegister);

RegisterProc(nil,MethodNames[108],mtProc,TypeInfo(_T138),[
TypeInfo(TDateTime),TypeInfo(string)],Addr(DateToStr),cRegister);

RegisterProc(nil,MethodNames[109],mtProc,TypeInfo(_T139),[
TypeInfo(TDateTime),TypeInfo(string)],Addr(TimeToStr),cRegister);

RegisterProc(nil,MethodNames[110],mtProc,TypeInfo(_T140),[
TypeInfo(TDateTime),TypeInfo(string)],Addr(DateTimeToStr),cRegister);

RegisterProc(nil,MethodNames[111],mtProc,TypeInfo(_T141),[
TypeInfo(string),TypeInfo(TDateTime)],Addr(StrToDate),cRegister);

RegisterProc(nil,MethodNames[112],mtProc,TypeInfo(_T142),[
TypeInfo(string),TypeInfo(TDateTime)],Addr(StrToTime),cRegister);

RegisterProc(nil,MethodNames[113],mtProc,TypeInfo(_T143),[
TypeInfo(string),TypeInfo(TDateTime)],Addr(StrToDateTime),cRegister);

RegisterProc(nil,MethodNames[114],mtProc,TypeInfo(_T144),[
TypeInfo(string),
TypeInfo(TDateTime),TypeInfo(string)],Addr(FormatDateTime),cRegister);

RegisterProc(nil,MethodNames[115],mtProc,TypeInfo(_T145),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TDateTime)],Addr(DateTimeToString),cRegister);

RegisterProc(nil,MethodNames[116],mtProc,TypeInfo(_T146),[
TypeInfo(Integer),TypeInfo(string)],Addr(SysErrorMessage),cRegister);

RegisterProc(nil,MethodNames[117],mtProc,TypeInfo(_T147),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(string),TypeInfo(string)],Addr(GetLocaleStr),cRegister);

RegisterProc(nil,MethodNames[118],mtProc,TypeInfo(_T148),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Char),TypeInfo(Char)],Addr(GetLocaleChar),cRegister);

RegisterProc(nil,MethodNames[119],mtProc,TypeInfo(_T149),NoParams,Addr(GetFormatSettings),cRegister);

RegisterProc(nil,MethodNames[120],mtProc,TypeInfo(_T150),[TypeInfo(TObject)],Addr(ExceptObject),cRegister);

RegisterProc(nil,MethodNames[121],mtProc,TypeInfo(_T151),[TypeInfoPointer],Addr(ExceptAddr),cRegister);

RegisterProc(nil,MethodNames[122],mtProc,TypeInfo(_T153),[
TypeInfo(TObject),
TypeInfoPointer],Addr(ShowException),cRegister);

RegisterProc(nil,MethodNames[123],mtProc,TypeInfo(_T154),NoParams,Addr(Abort),cRegister);

RegisterProc(nil,MethodNames[124],mtProc,TypeInfo(_T155),NoParams,Addr(OutOfMemoryError),cRegister);

RegisterProc(nil,MethodNames[125],mtProc,TypeInfo(_T156),NoParams,Addr(Beep),cRegister);

RegisterProc(nil,MethodNames[126],mtProc,TypeInfo(_T157),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(TMbcsByteType)],Addr(ByteType),cRegister);

RegisterProc(nil,MethodNames[127],mtProc,TypeInfo(_T159),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Integer)],Addr(ByteToCharLen),cRegister);

RegisterProc(nil,MethodNames[128],mtProc,TypeInfo(_T160),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Integer)],Addr(CharToByteLen),cRegister);

RegisterProc(nil,MethodNames[129],mtProc,TypeInfo(_T161),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Integer)],Addr(ByteToCharIndex),cRegister);

RegisterProc(nil,MethodNames[130],mtProc,TypeInfo(_T162),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Integer)],Addr(CharToByteIndex),cRegister);

RegisterProc(nil,MethodNames[131],mtProc,TypeInfo(_T163),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Boolean)],Addr(IsPathDelimiter),cRegister);

RegisterProc(nil,MethodNames[132],mtProc,TypeInfo(_T164),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Boolean)],Addr(IsDelimiter),cRegister);

RegisterProc(nil,MethodNames[133],mtProc,TypeInfo(_T165),[
TypeInfo(string),TypeInfo(string)],Addr(IncludeTrailingBackslash),cRegister);

RegisterProc(nil,MethodNames[134],mtProc,TypeInfo(_T166),[
TypeInfo(string),TypeInfo(string)],Addr(ExcludeTrailingBackslash),cRegister);

RegisterProc(nil,MethodNames[135],mtProc,TypeInfo(_T167),[
TypeInfo(string),
TypeInfo(string),TypeInfo(Integer)],Addr(LastDelimiter),cRegister);

RegisterProc(nil,MethodNames[136],mtProc,TypeInfo(_T168),[
TypeInfo(string),
TypeInfo(string),TypeInfo(Integer)],Addr(AnsiCompareFileName),cRegister);

RegisterProc(nil,MethodNames[137],mtProc,TypeInfo(_T169),[
TypeInfo(string),TypeInfo(string)],Addr(AnsiLowerCaseFileName),cRegister);

RegisterProc(nil,MethodNames[138],mtProc,TypeInfo(_T170),[
TypeInfo(string),TypeInfo(string)],Addr(AnsiUpperCaseFileName),cRegister);

RegisterProc(nil,MethodNames[139],mtProc,TypeInfo(_T171),[
TypeInfo(string),
TypeInfo(string),TypeInfo(Integer)],Addr(AnsiPos),cRegister);

RegisterProc(nil,MethodNames[140],mtProc,TypeInfo(_T175),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(string),
TypeInfo(TReplaceFlags),TypeInfo(string)],Addr(StringReplace),cRegister);

RegisterProc(nil,MethodNames[141],mtProc,TypeInfo(_T176),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TSysCharSet),
TypeInfo(Integer),TypeInfo(string)],Addr(WrapText),cRegister);

RegisterProc(nil,MethodNames[142],mtProc,TypeInfo(_T177),[
TypeInfo(string),
TypeInfo(TSysCharSet),
TypeInfo(Boolean),TypeInfo(Boolean)],Addr(FindCmdLineSwitch),cRegister);

RegisterProc(nil,MethodNames[143],mtProc,TypeInfo(_T178),[
TypeInfoUntyped],Addr(FreeAndNil),cRegister);

RegisterProc(nil,MethodNames[144],mtProc,TypeInfo(_T180),[
TypeInfo(string),TypeInfo(HMODULE)],Addr(LoadPackage),cRegister);

RegisterProc(nil,MethodNames[145],mtProc,TypeInfo(_T181),[
TypeInfo(HMODULE)],Addr(UnloadPackage),cRegister);

RegisterProc(nil,MethodNames[146],mtProc,TypeInfo(_T184),[
TypeInfo(HMODULE)],Addr(InitializePackage),cRegister);

RegisterProc(nil,MethodNames[147],mtProc,TypeInfo(_T185),[
TypeInfo(HMODULE)],Addr(FinalizePackage),cRegister);

RegisterProc(nil,MethodNames[148],mtProc,TypeInfo(_T186),NoParams,Addr(RaiseLastWin32Error),cRegister);

RegisterProc(nil,MethodNames[149],mtProc,TypeInfo(_T187),[
TypeInfo(BOOL),TypeInfo(BOOL)],Addr(Win32Check),cRegister);

RegisterProc(nil,MethodNames[150],mtProc,TypeInfo(_T189),[TypeInfo(Boolean)],Addr(CallTerminateProcs),cRegister);

RegisterProc(nil,MethodNames[151],mtProc,TypeInfo(_T190),[TypeInfo(LongWord)],Addr(GDAL),cRegister);

RegisterProc(nil,MethodNames[152],mtProc,TypeInfo(_T191),NoParams,Addr(RCS),cRegister);

RegisterProc(nil,MethodNames[153],mtProc,TypeInfo(_T192),NoParams,Addr(RPR),cRegister);

RegisterProc(nil,MethodNames[154],mtScriptProc,TypeInfo(_T193),[
TypeInfo(string),
TypeInfo(UINT),TypeInfo(HMODULE)],Addr(____SafeLoadLibrary__Wrapper),cRegister);

RegisterProc(Exception,'Create',mtConstructor,TypeInfo(_T194),[
TypeInfo(string)],Addr(Exception.Create),cRegister);

RegisterProc(Exception,'CreateFmt',mtConstructor,TypeInfo(_T195),[
TypeInfo(string),
TypeInfoArrayOfConst],Addr(Exception.CreateFmt),cRegister);

RegisterProc(Exception,'CreateRes',mtConstructor,TypeInfo(_T196),[
TypeInfo(Integer)],Addr(Exception.CreateRes),cRegister);

RegisterProc(Exception,'CreateResFmt',mtConstructor,TypeInfo(_T197),[
TypeInfo(Integer),
TypeInfoArrayOfConst],Addr(Exception.CreateResFmt),cRegister);

RegisterProc(Exception,'CreateHelp',mtConstructor,TypeInfo(_T198),[
TypeInfo(string),
TypeInfo(Integer)],Addr(Exception.CreateHelp),cRegister);

RegisterProc(Exception,'CreateFmtHelp',mtConstructor,TypeInfo(_T199),[
TypeInfo(string),
TypeInfoArrayOfConst,
TypeInfo(Integer)],Addr(Exception.CreateFmtHelp),cRegister);

RegisterProc(Exception,'CreateResHelp',mtConstructor,TypeInfo(_T200),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(Exception.CreateResHelp),cRegister);

RegisterProc(TLanguages,'Create',mtConstructor,TypeInfo(_T202),NoParams,Addr(TLanguages.Create),cRegister);

RegRegisterMethod(TLanguages,'IndexOf',TypeInfo(_T203),[
TypeInfo(LCID),TypeInfo(Integer)],Addr(TLanguages.IndexOf));

RegisterProc(TMultiReadExclusiveWriteSynchronizer,'Create',mtConstructor,TypeInfo(_T204),NoParams,Addr(TMultiReadExclusiveWriteSynchronizer.Create),cRegister);

RegRegisterMethod(TMultiReadExclusiveWriteSynchronizer,'BeginRead',TypeInfo(_T205),NoParams,Addr(TMultiReadExclusiveWriteSynchronizer.BeginRead));

RegRegisterMethod(TMultiReadExclusiveWriteSynchronizer,'EndRead',TypeInfo(_T206),NoParams,Addr(TMultiReadExclusiveWriteSynchronizer.EndRead));

RegRegisterMethod(TMultiReadExclusiveWriteSynchronizer,'BeginWrite',TypeInfo(_T207),NoParams,Addr(TMultiReadExclusiveWriteSynchronizer.BeginWrite));

RegRegisterMethod(TMultiReadExclusiveWriteSynchronizer,'EndWrite',TypeInfo(_T208),NoParams,Addr(TMultiReadExclusiveWriteSynchronizer.EndWrite));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'AddExitProc',mtProc,TypeInfo(_T2),[
TypeInfo(TProcedure)],Addr(AddExitProc),cRegister)}

{RegisterProc(nil,'AnsiStrComp',mtProc,TypeInfo(_T19),[
TypeInfoPChar,
TypeInfoPChar,TypeInfo(Integer)],Addr(AnsiStrComp),cRegister)}

{RegisterProc(nil,'AnsiStrIComp',mtProc,TypeInfo(_T20),[
TypeInfoPChar,
TypeInfoPChar,TypeInfo(Integer)],Addr(AnsiStrIComp),cRegister)}

{RegisterProc(nil,'AnsiStrLComp',mtProc,TypeInfo(_T21),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(Cardinal),TypeInfo(Integer)],Addr(AnsiStrLComp),cRegister)}

{RegisterProc(nil,'AnsiStrLIComp',mtProc,TypeInfo(_T22),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(Cardinal),TypeInfo(Integer)],Addr(AnsiStrLIComp),cRegister)}

{RegisterProc(nil,'AnsiStrLower',mtProc,TypeInfo(_T23),[
TypeInfoPChar,TypeInfoPChar],Addr(AnsiStrLower),cRegister)}

{RegisterProc(nil,'AnsiStrUpper',mtProc,TypeInfo(_T24),[
TypeInfoPChar,TypeInfoPChar],Addr(AnsiStrUpper),cRegister)}

{RegisterProc(nil,'AnsiStrLastChar',mtProc,TypeInfo(_T26),[
TypeInfoPChar,TypeInfoPChar],Addr(AnsiStrLastChar),cRegister)}

{RegisterProc(nil,'AnsiExtractQuotedStr',mtProc,TypeInfo(_T32),[
TypeInfoPChar,
TypeInfo(Char),TypeInfo(string)],Addr(AnsiExtractQuotedStr),cRegister)}

{RegisterProc(nil,'StrToInt64',mtProc,TypeInfo(_T38),[
TypeInfo(string),TypeInfo(Int64)],Addr(StrToInt64),cRegister)}

{RegisterProc(nil,'StrToInt64Def',mtProc,TypeInfo(_T40),[
TypeInfo(string),
TypeInfo(Int64),TypeInfo(Int64)],Addr(StrToInt64Def),cRegister)}

{RegisterProc(nil,'DiskFree',mtProc,TypeInfo(_T71),[
TypeInfo(Byte),TypeInfo(Int64)],Addr(DiskFree),cRegister)}

{RegisterProc(nil,'DiskSize',mtProc,TypeInfo(_T72),[
TypeInfo(Byte),TypeInfo(Int64)],Addr(DiskSize),cRegister)}

{RegisterProc(nil,'StrLen',mtProc,TypeInfo(_T79),[
TypeInfoPChar,TypeInfo(Cardinal)],Addr(StrLen),cRegister)}

{RegisterProc(nil,'StrEnd',mtProc,TypeInfo(_T80),[
TypeInfoPChar,TypeInfoPChar],Addr(StrEnd),cRegister)}

{RegisterProc(nil,'StrMove',mtProc,TypeInfo(_T81),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(Cardinal),TypeInfoPChar],Addr(StrMove),cRegister)}

{RegisterProc(nil,'StrCopy',mtProc,TypeInfo(_T82),[
TypeInfoPChar,
TypeInfoPChar,TypeInfoPChar],Addr(StrCopy),cRegister)}

{RegisterProc(nil,'StrECopy',mtProc,TypeInfo(_T83),[
TypeInfoPChar,
TypeInfoPChar,TypeInfoPChar],Addr(StrECopy),cRegister)}

{RegisterProc(nil,'StrLCopy',mtProc,TypeInfo(_T84),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(Cardinal),TypeInfoPChar],Addr(StrLCopy),cRegister)}

{RegisterProc(nil,'StrPCopy',mtProc,TypeInfo(_T85),[
TypeInfoPChar,
TypeInfo(string),TypeInfoPChar],Addr(StrPCopy),cRegister)}

{RegisterProc(nil,'StrPLCopy',mtProc,TypeInfo(_T86),[
TypeInfoPChar,
TypeInfo(string),
TypeInfo(Cardinal),TypeInfoPChar],Addr(StrPLCopy),cRegister)}

{RegisterProc(nil,'StrCat',mtProc,TypeInfo(_T87),[
TypeInfoPChar,
TypeInfoPChar,TypeInfoPChar],Addr(StrCat),cRegister)}

{RegisterProc(nil,'StrLCat',mtProc,TypeInfo(_T88),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(Cardinal),TypeInfoPChar],Addr(StrLCat),cRegister)}

{RegisterProc(nil,'StrComp',mtProc,TypeInfo(_T89),[
TypeInfoPChar,
TypeInfoPChar,TypeInfo(Integer)],Addr(StrComp),cRegister)}

{RegisterProc(nil,'StrIComp',mtProc,TypeInfo(_T90),[
TypeInfoPChar,
TypeInfoPChar,TypeInfo(Integer)],Addr(StrIComp),cRegister)}

{RegisterProc(nil,'StrLComp',mtProc,TypeInfo(_T91),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(Cardinal),TypeInfo(Integer)],Addr(StrLComp),cRegister)}

{RegisterProc(nil,'StrLIComp',mtProc,TypeInfo(_T92),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(Cardinal),TypeInfo(Integer)],Addr(StrLIComp),cRegister)}

{RegisterProc(nil,'StrScan',mtProc,TypeInfo(_T93),[
TypeInfoPChar,
TypeInfo(Char),TypeInfoPChar],Addr(StrScan),cRegister)}

{RegisterProc(nil,'StrRScan',mtProc,TypeInfo(_T94),[
TypeInfoPChar,
TypeInfo(Char),TypeInfoPChar],Addr(StrRScan),cRegister)}

{RegisterProc(nil,'StrPos',mtProc,TypeInfo(_T95),[
TypeInfoPChar,
TypeInfoPChar,TypeInfoPChar],Addr(StrPos),cRegister)}

{RegisterProc(nil,'StrUpper',mtProc,TypeInfo(_T96),[
TypeInfoPChar,TypeInfoPChar],Addr(StrUpper),cRegister)}

{RegisterProc(nil,'StrLower',mtProc,TypeInfo(_T97),[
TypeInfoPChar,TypeInfoPChar],Addr(StrLower),cRegister)}

{RegisterProc(nil,'StrPas',mtProc,TypeInfo(_T98),[
TypeInfoPChar,TypeInfo(string)],Addr(StrPas),cRegister)}

{RegisterProc(nil,'StrBufSize',mtProc,TypeInfo(_T100),[
TypeInfoPChar,TypeInfo(Cardinal)],Addr(StrBufSize),cRegister)}

{RegisterProc(nil,'StrNew',mtProc,TypeInfo(_T101),[
TypeInfoPChar,TypeInfoPChar],Addr(StrNew),cRegister)}

{RegisterProc(nil,'StrDispose',mtProc,TypeInfo(_T102),[
TypeInfoPChar],Addr(StrDispose),cRegister)}

{RegisterProc(nil,'StrFmt',mtProc,TypeInfo(_T105),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfoArrayOfConst,TypeInfoPChar],Addr(StrFmt),cRegister)}

{RegisterProc(nil,'StrLFmt',mtProc,TypeInfo(_T106),[
TypeInfoPChar,
TypeInfo(Cardinal),
TypeInfoPChar,
TypeInfoArrayOfConst,TypeInfoPChar],Addr(StrLFmt),cRegister)}

{RegisterProc(nil,'FloatToText',mtProc,TypeInfo(_T112),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(TFloatValue),
TypeInfo(TFloatFormat),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Integer)],Addr(FloatToText),cRegister)}

{RegisterProc(nil,'FloatToTextFmt',mtProc,TypeInfo(_T115),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(TFloatValue),
TypeInfoPChar,TypeInfo(Integer)],Addr(FloatToTextFmt),cRegister)}

{RegisterProc(nil,'TextToFloat',mtProc,TypeInfo(_T118),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(TFloatValue),TypeInfo(Boolean)],Addr(TextToFloat),cRegister)}

{RegisterProc(nil,'ExceptionErrorMessage',mtProc,TypeInfo(_T152),[
TypeInfo(TObject),
TypeInfoPointer,
TypeInfoPChar,
TypeInfo(Integer),TypeInfo(Integer)],Addr(ExceptionErrorMessage),cRegister)}

{RegisterProc(nil,'StrByteType',mtProc,TypeInfo(_T158),[
TypeInfoPChar,
TypeInfo(Cardinal),TypeInfo(TMbcsByteType)],Addr(StrByteType),cRegister)}

{RegisterProc(nil,'AnsiStrPos',mtProc,TypeInfo(_T172),[
TypeInfoPChar,
TypeInfoPChar,TypeInfoPChar],Addr(AnsiStrPos),cRegister)}

{RegisterProc(nil,'AnsiStrRScan',mtProc,TypeInfo(_T173),[
TypeInfoPChar,
TypeInfo(Char),TypeInfoPChar],Addr(AnsiStrRScan),cRegister)}

{RegisterProc(nil,'AnsiStrScan',mtProc,TypeInfo(_T174),[
TypeInfoPChar,
TypeInfo(Char),TypeInfoPChar],Addr(AnsiStrScan),cRegister)}

{RegisterProc(nil,'GetPackageInfo',mtProc,TypeInfo(_T182),[
TypeInfo(HMODULE),
TypeInfoPointer,
TypeInfo(Integer),
TypeInfo(TPackageInfoProc)],Addr(GetPackageInfo),cRegister)}

{RegisterProc(nil,'GetPackageDescription',mtProc,TypeInfo(_T183),[
TypeInfoPChar,TypeInfo(string)],Addr(GetPackageDescription),cRegister)}

{RegisterProc(nil,'AddTerminateProc',mtProc,TypeInfo(_T188),[
TypeInfo(TTerminateProc)],Addr(AddTerminateProc),cRegister)}

{RegisterProc(Exception,'CreateResFmtHelp',mtConstructor,TypeInfo(_T201),[
TypeInfoPointer,
TypeInfoArrayOfConst,
TypeInfo(Integer)],Addr(Exception.CreateResFmtHelp),cRegister)}

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
