{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit CLASSES_D5;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  dcscript,
  dcsystem,
  dcdreamlib,
  SysUtils,
  Windows,
  ActiveX,
  Classes;
function ConvertTGUIDToVariant(var R : TGUID) : OleVariant;
function ConvertVariantToTGUID(const V : OleVariant) : TGUID;
function ConvertTIdentMapEntryToVariant(var R : TIdentMapEntry) : OleVariant;
function ConvertVariantToTIdentMapEntry(const V : OleVariant) : TIdentMapEntry;
function ConvertTPointToVariant(var R : TPoint) : OleVariant;
function ConvertVariantToTPoint(const V : OleVariant) : TPoint;
function ConvertTRectToVariant(var R : TRect) : OleVariant;
function ConvertVariantToTRect(const V : OleVariant) : TRect;
function ConvertTSmallPointToVariant(var R : TSmallPoint) : OleVariant;
function ConvertVariantToTSmallPoint(const V : OleVariant) : TSmallPoint;
function ConvertTStringItemToVariant(var R : TStringItem) : OleVariant;
function ConvertVariantToTStringItem(const V : OleVariant) : TStringItem;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TIdentMapEntry__Wrapper = class(TDCRecordWrapper)
private
fR : TIdentMapEntry;
public
function GetRecordPtr : pointer; override;
published
procedure setValue(const val : Integer);
function getValue : Integer;
property Value : Integer read getValue write setValue;
procedure setName(const val : AnsiString);
function getName : AnsiString;
property Name : AnsiString read getName write setName;
end;
type __TStringItem__Wrapper = class(TDCRecordWrapper)
private
fR : TStringItem;
public
function GetRecordPtr : pointer; override;
published
procedure setFString(const val : AnsiString);
function getFString : AnsiString;
property FString : AnsiString read getFString write setFString;
procedure setFObject(const val : TObject);
function getFObject : TObject;
property FObject : TObject read getFObject write setFObject;
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
type __TSmallPoint__Wrapper = class(TDCRecordWrapper)
private
fR : TSmallPoint;
public
function GetRecordPtr : pointer; override;
published
procedure setx(const val : SHORT);
function getx : SHORT;
property x : SHORT read getx write setx;
procedure sety(const val : SHORT);
function gety : SHORT;
property y : SHORT read gety write sety;
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
type __TGUID__Wrapper = class(TDCRecordWrapper)
private
fR : TGUID;
public
function GetRecordPtr : pointer; override;
published
procedure setD1(const val : LongWord);
function getD1 : LongWord;
property D1 : LongWord read getD1 write setD1;
procedure setD2(const val : Word);
function getD2 : Word;
property D2 : Word read getD2 write setD2;
procedure setD3(const val : Word);
function getD3 : Word;
property D3 : Word read getD3 write setD3;
end;
type __TComponent__ = class(TComponent);
type
_T0 = function (p0 : Integer;
p1 : Integer): IDispatch of object;

_T1 = function (p0 : SmallInt;
p1 : SmallInt): IDispatch of object;

_T2 = function (p0 : Integer;
p1 : Integer;
p2 : Integer;
p3 : Integer): IDispatch of object;

_T3 = _T2;

{_T4 = procedure (p0 : TPersistentClass) of object;}

{_T5 = procedure (p0 : Array of TPersistentClass) of object;}

{_T6 = procedure (p0 : TPersistentClass;
const p1 : string) of object;}

{_T7 = procedure (p0 : TPersistentClass) of object;}

{_T8 = procedure (p0 : Array of TPersistentClass) of object;}

_T9 = procedure (p0 : HMODULE) of object;

{_T10 = function (const p0 : string): TPersistentClass of object;}

{_T11 = function (const p0 : string): TPersistentClass of object;}

{_T12 = procedure (const p0 : string;
p1 : Array of TComponentClass) of object;}

{_T13 = procedure (p0 : Array of TComponentClass) of object;}

{_T14 = procedure (p0 : Array of TComponentClass;
p1 : TActiveXRegType) of object;}

{_T15 = procedure (p0 : Pointer;
p1 : TIdentToInt;
p2 : TIntToIdent) of object;}

_T16 = function (const p0 : string;
var p1 : Longint;
const p2 : IDispatch): Boolean of object;

_T17 = function (p0 : Longint;
var p1 : string;
const p2 : IDispatch): Boolean of object;

{_T18 = function (p0 : Pointer): TIntToIdent of object;}

{_T19 = function (p0 : Pointer): TIdentToInt of object;}

{_T20 = function (p0 : TComponent;
p1 : TClass): Boolean of object;}

_T21 = function (const p0 : string;
p1 : TComponent): Boolean of object;

_T22 = function (const p0 : string;
p1 : TComponent): TComponent of object;

_T23 = function (p0 : THandle;
const p1 : string): TComponent of object;

_T24 = _T22;

_T25 = procedure (const p0 : string;
p1 : TComponent) of object;

_T26 = procedure  of object;

_T27 = procedure (p0 : TComponent;
p1 : TStrings) of object;

_T28 = procedure (p0 : TComponent;
const p1 : string;
p2 : TStrings) of object;

_T29 = procedure (p0 : TComponent;
const p1 : string;
const p2 : string) of object;

_T30 = procedure (p0 : TComponent;
const p1 : string) of object;

_T31 = procedure (p0 : TPersistent) of object;

_T32 = function (p0 : TComponent;
const p1 : string): TComponent of object;

_T33 = _T26;

_T34 = _T26;

_T35 = _T26;

_T36 = function (p0 : TCollection;
p1 : TCollection): Boolean of object;

_T37 = procedure (p0 : TStream;
p1 : TStream) of object;

_T38 = _T37;

_T39 = _T37;

_T40 = _T37;

_T41 = function (p0 : TStream): TStreamOriginalFormat of object;

{_T42 = function (p0 : PChar;
p1 : PChar): PChar of object;}

{_T43 = function (p0 : TSysCharSet;
p1 : TSysCharSet;
p2 : PChar;
p3 : TStrings): Integer of object;}

{_T44 = procedure (p0 : PChar;
p1 : PChar;
p2 : Integer) of object;}

{_T45 = function (p0 : PChar;
p1 : PChar;
p2 : Integer): Integer of object;}

{_T46 = function (p0 : TPersistent): IDesignerNotify of object;}

_T47 = _T26;

{_T48 = procedure (p0 : TNotifyEvent) of object;}

_T49 = function (p0 : TObject): Boolean of object;

_T50 = procedure (p0 : TObject) of object;

_T51 = _T50;

_T52 = function : Boolean of object;

_T53 = procedure (p0 : TBasicActionLink) of object;

_T54 = _T53;

_T55 = _T52;

_T56 = _T50;

_T57 = _T26;

_T58 = _T52;

_T59 = procedure (p0 : TBasicAction) of object;

{_T60 = procedure (p0 : TNotifyEvent) of object;}

_T61 = _T50;

_T62 = _T52;

_T63 = _T52;

_T64 = function : Integer of object;

_T65 = _T64;

_T66 = function (p0 : Integer): string of object;

_T67 = function (p0 : Integer;
p1 : Integer): string of object;

_T68 = procedure (p0 : TCollectionItem) of object;

_T69 = _T68;

{_T70 = procedure (p0 : TCollectionItemClass) of object;}

_T71 = function : TCollectionItem of object;

_T72 = _T26;

_T73 = _T26;

_T74 = procedure (p0 : Integer) of object;

_T75 = _T26;

_T76 = function (p0 : Integer): TCollectionItem of object;

_T77 = _T76;

_T78 = function : string of object;

_T79 = _T74;

_T80 = procedure (const p0 : string) of object;

_T81 = procedure (p0 : TCollection) of object;

{_T82 = procedure (p0 : TGetChildProc;
p1 : TComponent) of object;}

_T83 = function : TComponent of object;

_T84 = _T83;

_T85 = _T26;

_T86 = procedure (p0 : TComponent;
p1 : TOperation) of object;

_T87 = procedure (p0 : TReader) of object;

_T88 = procedure (const p0 : TComponentName) of object;

_T89 = procedure (p0 : TComponent;
p1 : Integer) of object;

_T90 = procedure (p0 : TComponent) of object;

_T91 = _T26;

_T92 = _T26;

_T93 = procedure (p0 : Boolean;
const p1 : string;
const p2 : string) of object;

_T94 = _T29;

_T95 = _T90;

_T96 = _T90;

_T97 = procedure (p0 : TWriter) of object;

_T98 = function (const p0 : IDispatch;
out p1): HResult of object;

_T99 = _T90;

_T100 = _T26;

_T101 = _T26;

_T102 = function (p0 : TBasicAction): Boolean of object;

_T103 = function (const p0 : string): TComponent of object;

_T104 = _T90;

_T105 = _T90;

_T106 = _T26;

_T107 = _T83;

_T108 = _T52;

_T109 = _T90;

_T110 = _T90;

_T111 = _T102;

_T112 = procedure (p0 : TStream) of object;

_T113 = _T80;

_T114 = _T90;

_T115 = procedure (p0 : TStream;
p1 : Integer) of object;

{_T116 = procedure (const p0 : string;
p1 : TReaderProc;
p2 : TWriterProc;
p3 : Boolean) of object;}

{_T117 = procedure (const p0 : string;
p1 : TStreamProc;
p2 : TStreamProc;
p3 : Boolean) of object;}

_T118 = _T26;

_T119 = procedure (const p0 : string;
p1 : Word) of object;

_T120 = _T74;

_T121 = _T26;

_T122 = _T26;

_T123 = _T74;

_T124 = procedure (p0 : Integer;
p1 : Integer) of object;

_T125 = function : TInterfaceList of object;

{_T126 = function : IUnknown of object;}

{_T127 = function (p0 : IUnknown): Integer of object;}

{_T128 = function (p0 : IUnknown): Integer of object;}

{_T129 = procedure (p0 : Integer;
p1 : IUnknown) of object;}

{_T130 = function : IUnknown of object;}

{_T131 = function (p0 : IUnknown): Integer of object;}

_T132 = _T26;

_T133 = _T26;

_T134 = _T26;

_T135 = procedure (p0 : Pointer;
p1 : TListNotification) of object;

_T136 = function (p0 : Pointer): Integer of object;

_T137 = _T26;

_T138 = _T74;

_T139 = procedure (const p0 : string;
p1 : Integer) of object;

_T140 = _T124;

_T141 = function : TList of object;

_T142 = function (p0 : Pointer): Pointer of object;

_T143 = function : Pointer of object;

_T144 = _T136;

_T145 = procedure (p0 : Integer;
p1 : Pointer) of object;

_T146 = _T143;

_T147 = _T124;

_T148 = _T136;

_T149 = _T26;

{_T150 = procedure (p0 : TListSortCompare) of object;}

_T151 = function (var p0 : Longint): Pointer of object;

_T152 = _T26;

_T153 = _T112;

_T154 = _T80;

{_T155 = procedure (p0 : TPersistent;
p1 : TCollectionItemClass) of object;}

_T156 = _T112;

_T157 = procedure (p0 : Char) of object;

_T158 = _T80;

_T159 = _T80;

_T160 = procedure (const p0 : string;
const p1 : Array of Const) of object;

_T161 = _T80;

_T162 = _T112;

_T163 = function : Char of object;

_T164 = function : Longint of object;

_T165 = _T78;

_T166 = function : Extended of object;

{_T167 = function : Int64 of object;}

_T168 = _T78;

_T169 = function : WideString of object;

_T170 = function (const p0 : string): Boolean of object;

_T171 = _T31;

_T172 = procedure (p0 : TFiler) of object;

_T173 = function : TPersistent of object;

_T174 = _T31;

_T175 = _T78;

_T176 = _T170;

{_T177 = function (const p0 : string;
p1 : TPersistentClass): TComponent of object;}

_T178 = function (p0 : TComponent;
const p1 : string): Pointer of object;

_T179 = procedure (p0 : TComponent;
var p1 : string) of object;

_T180 = procedure (var p0 : string) of object;

_T181 = _T26;

_T182 = procedure (p0 : TValueType) of object;

_T183 = _T52;

_T184 = _T26;

_T185 = _T26;

_T186 = function : TValueType of object;

_T187 = procedure (var p0;
p1 : Longint) of object;

_T188 = _T52;

_T189 = _T163;

_T190 = _T81;

_T191 = function (p0 : TComponent): TComponent of object;

{_T192 = procedure (p0 : TComponent;
p1 : TComponent;
p2 : TReadComponentsProc) of object;}

_T193 = _T166;

_T194 = function : Single of object;

_T195 = function : Currency of object;

_T196 = function : TDateTime of object;

_T197 = _T78;

_T198 = _T164;

{_T199 = function : Int64 of object;}

_T200 = _T26;

_T201 = _T26;

_T202 = procedure (var p0 : TFilerFlags;
var p1 : Integer) of object;

_T203 = _T191;

_T204 = _T26;

_T205 = _T78;

_T206 = _T78;

_T207 = _T169;

_T208 = _T186;

_T209 = _T97;

{_T210 = procedure (p0 : THandle;
const p1 : string;
p2 : PChar) of object;}

{_T211 = procedure (p0 : THandle;
p1 : Integer;
p2 : PChar) of object;}

_T212 = procedure (p0 : Longint) of object;

_T213 = function (var p0;
p1 : Longint): Longint of object;

_T214 = function (const p0;
p1 : Longint): Longint of object;

_T215 = function (p0 : Longint;
p1 : Word): Longint of object;

_T216 = _T187;

_T217 = procedure (const p0;
p1 : Longint) of object;

_T218 = function (p0 : TStream;
p1 : Longint): Longint of object;

_T219 = _T191;

_T220 = _T191;

_T221 = _T90;

_T222 = _T25;

_T223 = procedure (p0 : TComponent;
p1 : TComponent) of object;

_T224 = procedure (const p0 : string;
p1 : TComponent;
p2 : TComponent) of object;

_T225 = procedure (const p0 : string;
out p1 : Integer) of object;

_T226 = _T74;

_T227 = _T26;

_T228 = procedure (p0 : TStream;
p1 : TStreamOwnership) of object;

_T229 = function (p0 : Pointer;
p1 : Longint;
p2 : PLongint): HResult of object;

_T230 = _T229;

{_T231 = function (p0 : Largeint;
p1 : Longint;
out p2 : Largeint): HResult of object;}

{_T232 = function (p0 : Largeint): HResult of object;}

{_T233 = function (p0 : IStream;
p1 : Largeint;
out p2 : Largeint;
out p3 : Largeint): HResult of object;}

_T234 = function (p0 : Longint): HResult of object;

_T235 = function : HResult of object;

{_T236 = function (p0 : Largeint;
p1 : Largeint;
p2 : Longint): HResult of object;}

{_T237 = function (p0 : Largeint;
p1 : Largeint;
p2 : Longint): HResult of object;}

{_T239 = function (out p0 : IStream): HResult of object;}

_T240 = _T26;

_T241 = _T26;

_T242 = function (const p0 : string;
var p1 : Integer): Boolean of object;

_T243 = _T26;

{_T244 = procedure (p0 : TStringListSortCompare) of object;}

_T245 = _T66;

_T246 = _T64;

_T247 = _T64;

_T248 = function (p0 : Integer): TObject of object;

_T249 = _T78;

_T250 = procedure (p0 : Integer;
const p1 : string) of object;

_T251 = procedure (p0 : Integer;
p1 : TObject) of object;

_T252 = _T74;

_T253 = _T80;

_T254 = procedure (p0 : Boolean) of object;

_T255 = function (const p0 : string): Integer of object;

_T256 = function (const p0 : string;
p1 : TObject): Integer of object;

_T257 = _T80;

_T258 = procedure (p0 : TStrings) of object;

_T259 = _T26;

_T260 = _T26;

_T261 = _T74;

_T262 = _T26;

_T263 = function (p0 : TStrings): Boolean of object;

_T264 = _T124;

_T265 = function : PChar of object;

_T266 = _T255;

_T267 = _T255;

_T268 = function (p0 : TObject): Integer of object;

_T269 = _T250;

_T270 = procedure (p0 : Integer;
const p1 : string;
p2 : TObject) of object;

_T271 = _T80;

_T272 = _T112;

_T273 = _T124;

_T274 = _T80;

_T275 = _T112;

{_T276 = procedure (p0 : PChar) of object;}

_T277 = _T80;

_T278 = function (p0 : Longint): string of object;

_T279 = _T80;

_T280 = _T26;

_T281 = _T26;

_T282 = _T254;

_T283 = _T26;

_T284 = _T26;

_T285 = _T26;

_T286 = function : LongWord of object;

_T287 = _T26;

_T288 = procedure (p0 : Pointer) of object;

_T289 = _T26;

_T290 = _T141;

_T291 = _T288;

_T292 = _T26;

_T293 = _T90;

_T294 = _T217;

_T295 = _T254;

_T296 = _T81;

_T297 = _T90;

_T298 = _T157;

_T299 = _T223;

_T300 = procedure (const p0 : Extended) of object;

_T301 = procedure (const p0 : Single) of object;

_T302 = procedure (const p0 : Currency) of object;

_T303 = procedure (const p0 : TDateTime) of object;

_T304 = _T80;

_T305 = _T212;

_T306 = _T26;

_T307 = _T26;

_T308 = _T90;

_T309 = _T26;

_T310 = _T80;

_T311 = _T80;

_T312 = procedure (const p0 : WideString) of object;

function __TIdentMapEntry__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TIdentMapEntry__Wrapper.setValue(const val : Integer);
begin
TIdentMapEntry(GetRecordPtr^).Value := val;
end;
function __TIdentMapEntry__Wrapper.getValue : Integer;
begin
result := TIdentMapEntry(GetRecordPtr^).Value;
end;
procedure __TIdentMapEntry__Wrapper.setName(const val : AnsiString);
begin
TIdentMapEntry(GetRecordPtr^).Name := val;
end;
function __TIdentMapEntry__Wrapper.getName : AnsiString;
begin
result := TIdentMapEntry(GetRecordPtr^).Name;
end;
function __TStringItem__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TStringItem__Wrapper.setFString(const val : AnsiString);
begin
TStringItem(GetRecordPtr^).FString := val;
end;
function __TStringItem__Wrapper.getFString : AnsiString;
begin
result := TStringItem(GetRecordPtr^).FString;
end;
procedure __TStringItem__Wrapper.setFObject(const val : TObject);
begin
TStringItem(GetRecordPtr^).FObject := val;
end;
function __TStringItem__Wrapper.getFObject : TObject;
begin
result := TStringItem(GetRecordPtr^).FObject;
end;
function _TIdentMapEntry_ : IDispatch;
begin
  result := __TIdentMapEntry__Wrapper.Create;
end;
function _TStringItem_ : IDispatch;
begin
  result := __TStringItem__Wrapper.Create;
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
function __TSmallPoint__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TSmallPoint__Wrapper.setx(const val : SHORT);
begin
TSmallPoint(GetRecordPtr^).x := val;
end;
function __TSmallPoint__Wrapper.getx : SHORT;
begin
result := TSmallPoint(GetRecordPtr^).x;
end;
procedure __TSmallPoint__Wrapper.sety(const val : SHORT);
begin
TSmallPoint(GetRecordPtr^).y := val;
end;
function __TSmallPoint__Wrapper.gety : SHORT;
begin
result := TSmallPoint(GetRecordPtr^).y;
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
function __TGUID__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TGUID__Wrapper.setD1(const val : LongWord);
begin
TGUID(GetRecordPtr^).D1 := val;
end;
function __TGUID__Wrapper.getD1 : LongWord;
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
function ____Point__Wrapper(p0 : Integer;
p1 : Integer): IDispatch;
var
__result : TPoint;
__wrapper : __TPoint__Wrapper;
begin
__result := Point(p0,p1);
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function ____SmallPoint__Wrapper(p0 : SmallInt;
p1 : SmallInt): IDispatch;
var
__result : TSmallPoint;
__wrapper : __TSmallPoint__Wrapper;
begin
__result := SmallPoint(p0,p1);
__wrapper := __TSmallPoint__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function ____Rect__Wrapper(p0 : Integer;
p1 : Integer;
p2 : Integer;
p3 : Integer): IDispatch;
var
__result : TRect;
__wrapper : __TRect__Wrapper;
begin
__result := Rect(p0,p1,p2,p3);
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function ____Bounds__Wrapper(p0 : Integer;
p1 : Integer;
p2 : Integer;
p3 : Integer): IDispatch;
var
__result : TRect;
__wrapper : __TRect__Wrapper;
begin
__result := Bounds(p0,p1,p2,p3);
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function ____IdentToInt__Wrapper(const p0 : string;
var p1 : Longint;
const p2 : IDispatch): Boolean;
var
__p2 : ^TIdentMapEntry;
__i2 : IDispatch;
begin
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
result := IdentToInt(p0,p1,__p2^);
end;

function ____IntToIdent__Wrapper(p0 : Longint;
var p1 : string;
const p2 : IDispatch): Boolean;
var
__p2 : ^TIdentMapEntry;
__i2 : IDispatch;
begin
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
result := IntToIdent(p0,p1,__p2^);
end;

function __TComponent__QueryInterface__Wrapper(__Instance : TComponent;
const p0 : IDispatch;
out p1): HResult;
var
__p0 : ^TGUID;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := __TComponent__(__Instance).QueryInterface(__p0^,p1);
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

type __TIdentMapEntry__Wrapper__ = class(__TIdentMapEntry__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TIdentMapEntry__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTIdentMapEntryToVariant(var R : TIdentMapEntry) : OleVariant;
var
__rw : __TIdentMapEntry__Wrapper__;
begin
__rw := __TIdentMapEntry__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTIdentMapEntry(const V : OleVariant) : TIdentMapEntry;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TIdentMapEntry((_idisp as IDCRecordWrapper).GetRecordPtr^);
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

type __TSmallPoint__Wrapper__ = class(__TSmallPoint__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TSmallPoint__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTSmallPointToVariant(var R : TSmallPoint) : OleVariant;
var
__rw : __TSmallPoint__Wrapper__;
begin
__rw := __TSmallPoint__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTSmallPoint(const V : OleVariant) : TSmallPoint;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TSmallPoint((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TStringItem__Wrapper__ = class(__TStringItem__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TStringItem__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTStringItemToVariant(var R : TStringItem) : OleVariant;
var
__rw : __TStringItem__Wrapper__;
begin
__rw := __TStringItem__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTStringItem(const V : OleVariant) : TStringItem;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TStringItem((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTBasicActionLink__Action(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TBasicActionLink(Instance).Action);
end;

procedure __DC__SetTBasicActionLink__Action(Instance : TObject; Params : PVariantArgList);
begin
TBasicActionLink(Instance).Action:=TBasicAction(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTBits__Bits(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBits(Instance).Bits[OleVariant(Params^[0])];
end;

procedure __DC__SetTBits__Bits(Instance : TObject; Params : PVariantArgList);
begin
TBits(Instance).Bits[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTBits__Size(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBits(Instance).Size;
end;

procedure __DC__SetTBits__Size(Instance : TObject; Params : PVariantArgList);
begin
TBits(Instance).Size:=OleVariant(Params^[0]);
end;

function __DC__GetTCollection__Count(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCollection(Instance).Count;
end;

function __DC__GetTCollection__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCollection(Instance).Items[OleVariant(Params^[0])]);
end;

procedure __DC__SetTCollection__Items(Instance : TObject; Params : PVariantArgList);
begin
TCollection(Instance).Items[OleVariant(Params^[1])]:=TCollectionItem(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCollectionItem__Collection(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCollectionItem(Instance).Collection);
end;

procedure __DC__SetTCollectionItem__Collection(Instance : TObject; Params : PVariantArgList);
begin
TCollectionItem(Instance).Collection:=TCollection(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCollectionItem__ID(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCollectionItem(Instance).ID;
end;

function __DC__GetTCollectionItem__Index(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCollectionItem(Instance).Index;
end;

procedure __DC__SetTCollectionItem__Index(Instance : TObject; Params : PVariantArgList);
begin
TCollectionItem(Instance).Index:=OleVariant(Params^[0]);
end;

function __DC__GetTCollectionItem__DisplayName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCollectionItem(Instance).DisplayName;
end;

procedure __DC__SetTCollectionItem__DisplayName(Instance : TObject; Params : PVariantArgList);
begin
TCollectionItem(Instance).DisplayName:=OleVariant(Params^[0]);
end;

function __DC__GetTComponent__Components(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TComponent(Instance).Components[OleVariant(Params^[0])]);
end;

function __DC__GetTComponent__ComponentCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TComponent(Instance).ComponentCount;
end;

function __DC__GetTComponent__ComponentIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TComponent(Instance).ComponentIndex;
end;

procedure __DC__SetTComponent__ComponentIndex(Instance : TObject; Params : PVariantArgList);
begin
TComponent(Instance).ComponentIndex:=OleVariant(Params^[0]);
end;

function __DC__GetTComponent__ComponentState(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TComponentState;
begin
tmp := TComponent(Instance).ComponentState;
result := VarFromSet(tmp, sizeof(tmp));
end;

function __DC__GetTComponent__ComponentStyle(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TComponentStyle;
begin
tmp := TComponent(Instance).ComponentStyle;
result := VarFromSet(tmp, sizeof(tmp));
end;

function __DC__GetTComponent__DesignInfo(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TComponent(Instance).DesignInfo;
end;

procedure __DC__SetTComponent__DesignInfo(Instance : TObject; Params : PVariantArgList);
begin
TComponent(Instance).DesignInfo:=OleVariant(Params^[0]);
end;

function __DC__GetTComponent__Owner(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TComponent(Instance).Owner);
end;

function __DC__GetTComponent__VCLComObject(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(TComponent(Instance).VCLComObject);
end;

procedure __DC__SetTComponent__VCLComObject(Instance : TObject; Params : PVariantArgList);
begin
TComponent(Instance).VCLComObject:=VarToPointer(OleVariant(Params^[0]));
end;

function __DC__GetTCustomMemoryStream__Memory(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(TCustomMemoryStream(Instance).Memory);
end;

function __DC__GetTFiler__Root(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TFiler(Instance).Root);
end;

procedure __DC__SetTFiler__Root(Instance : TObject; Params : PVariantArgList);
begin
TFiler(Instance).Root:=TComponent(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTFiler__LookupRoot(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TFiler(Instance).LookupRoot);
end;

function __DC__GetTFiler__Ancestor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TFiler(Instance).Ancestor);
end;

procedure __DC__SetTFiler__Ancestor(Instance : TObject; Params : PVariantArgList);
begin
TFiler(Instance).Ancestor:=TPersistent(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTFiler__IgnoreChildren(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFiler(Instance).IgnoreChildren;
end;

procedure __DC__SetTFiler__IgnoreChildren(Instance : TObject; Params : PVariantArgList);
begin
TFiler(Instance).IgnoreChildren:=OleVariant(Params^[0]);
end;

function __DC__GetTHandleStream__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := THandleStream(Instance).Handle;
end;

function __DC__GetTInterfaceList__Capacity(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TInterfaceList(Instance).Capacity;
end;

procedure __DC__SetTInterfaceList__Capacity(Instance : TObject; Params : PVariantArgList);
begin
TInterfaceList(Instance).Capacity:=OleVariant(Params^[0]);
end;

function __DC__GetTInterfaceList__Count(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TInterfaceList(Instance).Count;
end;

procedure __DC__SetTInterfaceList__Count(Instance : TObject; Params : PVariantArgList);
begin
TInterfaceList(Instance).Count:=OleVariant(Params^[0]);
end;

function __DC__GetTList__Capacity(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TList(Instance).Capacity;
end;

procedure __DC__SetTList__Capacity(Instance : TObject; Params : PVariantArgList);
begin
TList(Instance).Capacity:=OleVariant(Params^[0]);
end;

function __DC__GetTList__Count(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TList(Instance).Count;
end;

procedure __DC__SetTList__Count(Instance : TObject; Params : PVariantArgList);
begin
TList(Instance).Count:=OleVariant(Params^[0]);
end;

function __DC__GetTList__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(TList(Instance).Items[OleVariant(Params^[0])]);
end;

procedure __DC__SetTList__Items(Instance : TObject; Params : PVariantArgList);
begin
TList(Instance).Items[OleVariant(Params^[1])]:=VarToPointer(OleVariant(Params^[0]));
end;

function __DC__GetTParser__FloatType(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParser(Instance).FloatType;
end;

function __DC__GetTParser__SourceLine(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParser(Instance).SourceLine;
end;

function __DC__GetTParser__Token(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParser(Instance).Token;
end;

function __DC__GetTReader__Owner(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TReader(Instance).Owner);
end;

procedure __DC__SetTReader__Owner(Instance : TObject; Params : PVariantArgList);
begin
TReader(Instance).Owner:=TComponent(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTReader__Parent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TReader(Instance).Parent);
end;

procedure __DC__SetTReader__Parent(Instance : TObject; Params : PVariantArgList);
begin
TReader(Instance).Parent:=TComponent(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTReader__Position(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TReader(Instance).Position;
end;

procedure __DC__SetTReader__Position(Instance : TObject; Params : PVariantArgList);
begin
TReader(Instance).Position:=OleVariant(Params^[0]);
end;

function __DC__GetTStream__Position(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStream(Instance).Position;
end;

procedure __DC__SetTStream__Position(Instance : TObject; Params : PVariantArgList);
begin
TStream(Instance).Position:=OleVariant(Params^[0]);
end;

function __DC__GetTStream__Size(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStream(Instance).Size;
end;

procedure __DC__SetTStream__Size(Instance : TObject; Params : PVariantArgList);
begin
TStream(Instance).Size:=OleVariant(Params^[0]);
end;

function __DC__GetTStreamAdapter__Stream(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TStreamAdapter(Instance).Stream);
end;

function __DC__GetTStreamAdapter__StreamOwnership(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStreamAdapter(Instance).StreamOwnership;
end;

procedure __DC__SetTStreamAdapter__StreamOwnership(Instance : TObject; Params : PVariantArgList);
begin
TStreamAdapter(Instance).StreamOwnership:=OleVariant(Params^[0]);
end;

function __DC__GetTStringList__Duplicates(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStringList(Instance).Duplicates;
end;

procedure __DC__SetTStringList__Duplicates(Instance : TObject; Params : PVariantArgList);
begin
TStringList(Instance).Duplicates:=OleVariant(Params^[0]);
end;

function __DC__GetTStringList__Sorted(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStringList(Instance).Sorted;
end;

procedure __DC__SetTStringList__Sorted(Instance : TObject; Params : PVariantArgList);
begin
TStringList(Instance).Sorted:=OleVariant(Params^[0]);
end;

function __DC__GetTStrings__Capacity(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStrings(Instance).Capacity;
end;

procedure __DC__SetTStrings__Capacity(Instance : TObject; Params : PVariantArgList);
begin
TStrings(Instance).Capacity:=OleVariant(Params^[0]);
end;

function __DC__GetTStrings__CommaText(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStrings(Instance).CommaText;
end;

procedure __DC__SetTStrings__CommaText(Instance : TObject; Params : PVariantArgList);
begin
TStrings(Instance).CommaText:=OleVariant(Params^[0]);
end;

function __DC__GetTStrings__Count(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStrings(Instance).Count;
end;

function __DC__GetTStrings__Names(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStrings(Instance).Names[OleVariant(Params^[0])];
end;

function __DC__GetTStrings__Objects(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TStrings(Instance).Objects[OleVariant(Params^[0])]);
end;

procedure __DC__SetTStrings__Objects(Instance : TObject; Params : PVariantArgList);
begin
TStrings(Instance).Objects[OleVariant(Params^[1])]:=TObject(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTStrings__Values(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStrings(Instance).Values[OleVariant(Params^[0])];
end;

procedure __DC__SetTStrings__Values(Instance : TObject; Params : PVariantArgList);
begin
TStrings(Instance).Values[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTStrings__Strings(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStrings(Instance).Strings[OleVariant(Params^[0])];
end;

procedure __DC__SetTStrings__Strings(Instance : TObject; Params : PVariantArgList);
begin
TStrings(Instance).Strings[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTStrings__Text(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStrings(Instance).Text;
end;

procedure __DC__SetTStrings__Text(Instance : TObject; Params : PVariantArgList);
begin
TStrings(Instance).Text:=OleVariant(Params^[0]);
end;

function __DC__GetTStringStream__DataString(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStringStream(Instance).DataString;
end;

function __DC__GetTThread__FreeOnTerminate(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TThread(Instance).FreeOnTerminate;
end;

procedure __DC__SetTThread__FreeOnTerminate(Instance : TObject; Params : PVariantArgList);
begin
TThread(Instance).FreeOnTerminate:=OleVariant(Params^[0]);
end;

function __DC__GetTThread__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TThread(Instance).Handle;
end;

function __DC__GetTThread__Priority(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TThread(Instance).Priority;
end;

procedure __DC__SetTThread__Priority(Instance : TObject; Params : PVariantArgList);
begin
TThread(Instance).Priority:=OleVariant(Params^[0]);
end;

function __DC__GetTThread__Suspended(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TThread(Instance).Suspended;
end;

procedure __DC__SetTThread__Suspended(Instance : TObject; Params : PVariantArgList);
begin
TThread(Instance).Suspended:=OleVariant(Params^[0]);
end;

function __DC__GetTThread__ThreadID(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TThread(Instance).ThreadID;
end;

function __DC__GetTThreadList__Duplicates(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TThreadList(Instance).Duplicates;
end;

procedure __DC__SetTThreadList__Duplicates(Instance : TObject; Params : PVariantArgList);
begin
TThreadList(Instance).Duplicates:=OleVariant(Params^[0]);
end;

function __DC__GetTWriter__Position(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWriter(Instance).Position;
end;

procedure __DC__SetTWriter__Position(Instance : TObject; Params : PVariantArgList);
begin
TWriter(Instance).Position:=OleVariant(Params^[0]);
end;

function __DC__GetTWriter__RootAncestor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TWriter(Instance).RootAncestor);
end;

procedure __DC__SetTWriter__RootAncestor(Instance : TObject; Params : PVariantArgList);
begin
TWriter(Instance).RootAncestor:=TComponent(VarToObject(OleVariant(Params^[0])));
end;

procedure __RegisterProps;
begin
RegisterProperty(TBasicActionLink,'Action',__DC__GetTBasicActionLink__Action,__DC__SetTBasicActionLink__Action);
RegisterIndexedProperty(TBits,'Bits',1,True,__DC__GetTBits__Bits,__DC__SetTBits__Bits);
RegisterProperty(TBits,'Size',__DC__GetTBits__Size,__DC__SetTBits__Size);
RegisterProperty(TCollection,'Count',__DC__GetTCollection__Count,nil);
RegisterIndexedProperty(TCollection,'Items',1,False,__DC__GetTCollection__Items,__DC__SetTCollection__Items);
RegisterProperty(TCollectionItem,'Collection',__DC__GetTCollectionItem__Collection,__DC__SetTCollectionItem__Collection);
RegisterProperty(TCollectionItem,'ID',__DC__GetTCollectionItem__ID,nil);
RegisterProperty(TCollectionItem,'Index',__DC__GetTCollectionItem__Index,__DC__SetTCollectionItem__Index);
RegisterProperty(TCollectionItem,'DisplayName',__DC__GetTCollectionItem__DisplayName,__DC__SetTCollectionItem__DisplayName);
RegisterIndexedProperty(TComponent,'Components',1,False,__DC__GetTComponent__Components,nil);
RegisterProperty(TComponent,'ComponentCount',__DC__GetTComponent__ComponentCount,nil);
RegisterProperty(TComponent,'ComponentIndex',__DC__GetTComponent__ComponentIndex,__DC__SetTComponent__ComponentIndex);
RegisterProperty(TComponent,'ComponentState',__DC__GetTComponent__ComponentState,nil);
RegisterProperty(TComponent,'ComponentStyle',__DC__GetTComponent__ComponentStyle,nil);
RegisterProperty(TComponent,'DesignInfo',__DC__GetTComponent__DesignInfo,__DC__SetTComponent__DesignInfo);
RegisterProperty(TComponent,'Owner',__DC__GetTComponent__Owner,nil);
RegisterProperty(TComponent,'VCLComObject',__DC__GetTComponent__VCLComObject,__DC__SetTComponent__VCLComObject);
RegisterProperty(TCustomMemoryStream,'Memory',__DC__GetTCustomMemoryStream__Memory,nil);
RegisterProperty(TFiler,'Root',__DC__GetTFiler__Root,__DC__SetTFiler__Root);
RegisterProperty(TFiler,'LookupRoot',__DC__GetTFiler__LookupRoot,nil);
RegisterProperty(TFiler,'Ancestor',__DC__GetTFiler__Ancestor,__DC__SetTFiler__Ancestor);
RegisterProperty(TFiler,'IgnoreChildren',__DC__GetTFiler__IgnoreChildren,__DC__SetTFiler__IgnoreChildren);
RegisterProperty(THandleStream,'Handle',__DC__GetTHandleStream__Handle,nil);
RegisterProperty(TInterfaceList,'Capacity',__DC__GetTInterfaceList__Capacity,__DC__SetTInterfaceList__Capacity);
RegisterProperty(TInterfaceList,'Count',__DC__GetTInterfaceList__Count,__DC__SetTInterfaceList__Count);
RegisterProperty(TList,'Capacity',__DC__GetTList__Capacity,__DC__SetTList__Capacity);
RegisterProperty(TList,'Count',__DC__GetTList__Count,__DC__SetTList__Count);
RegisterIndexedProperty(TList,'Items',1,True,__DC__GetTList__Items,__DC__SetTList__Items);
RegisterProperty(TParser,'FloatType',__DC__GetTParser__FloatType,nil);
RegisterProperty(TParser,'SourceLine',__DC__GetTParser__SourceLine,nil);
RegisterProperty(TParser,'Token',__DC__GetTParser__Token,nil);
RegisterProperty(TReader,'Owner',__DC__GetTReader__Owner,__DC__SetTReader__Owner);
RegisterProperty(TReader,'Parent',__DC__GetTReader__Parent,__DC__SetTReader__Parent);
RegisterProperty(TReader,'Position',__DC__GetTReader__Position,__DC__SetTReader__Position);
RegisterProperty(TStream,'Position',__DC__GetTStream__Position,__DC__SetTStream__Position);
RegisterProperty(TStream,'Size',__DC__GetTStream__Size,__DC__SetTStream__Size);
RegisterProperty(TStreamAdapter,'Stream',__DC__GetTStreamAdapter__Stream,nil);
RegisterProperty(TStreamAdapter,'StreamOwnership',__DC__GetTStreamAdapter__StreamOwnership,__DC__SetTStreamAdapter__StreamOwnership);
RegisterProperty(TStringList,'Duplicates',__DC__GetTStringList__Duplicates,__DC__SetTStringList__Duplicates);
RegisterProperty(TStringList,'Sorted',__DC__GetTStringList__Sorted,__DC__SetTStringList__Sorted);
RegisterProperty(TStrings,'Capacity',__DC__GetTStrings__Capacity,__DC__SetTStrings__Capacity);
RegisterProperty(TStrings,'CommaText',__DC__GetTStrings__CommaText,__DC__SetTStrings__CommaText);
RegisterProperty(TStrings,'Count',__DC__GetTStrings__Count,nil);
RegisterIndexedProperty(TStrings,'Names',1,False,__DC__GetTStrings__Names,nil);
RegisterIndexedProperty(TStrings,'Objects',1,False,__DC__GetTStrings__Objects,__DC__SetTStrings__Objects);
RegisterIndexedProperty(TStrings,'Values',1,False,__DC__GetTStrings__Values,__DC__SetTStrings__Values);
RegisterIndexedProperty(TStrings,'Strings',1,True,__DC__GetTStrings__Strings,__DC__SetTStrings__Strings);
RegisterProperty(TStrings,'Text',__DC__GetTStrings__Text,__DC__SetTStrings__Text);
RegisterProperty(TStringStream,'DataString',__DC__GetTStringStream__DataString,nil);
RegisterProperty(TThread,'FreeOnTerminate',__DC__GetTThread__FreeOnTerminate,__DC__SetTThread__FreeOnTerminate);
RegisterProperty(TThread,'Handle',__DC__GetTThread__Handle,nil);
RegisterProperty(TThread,'Priority',__DC__GetTThread__Priority,__DC__SetTThread__Priority);
RegisterProperty(TThread,'Suspended',__DC__GetTThread__Suspended,__DC__SetTThread__Suspended);
RegisterProperty(TThread,'ThreadID',__DC__GetTThread__ThreadID,nil);
RegisterProperty(TThreadList,'Duplicates',__DC__GetTThreadList__Duplicates,__DC__SetTThreadList__Duplicates);
RegisterProperty(TWriter,'Position',__DC__GetTWriter__Position,__DC__SetTWriter__Position);
RegisterProperty(TWriter,'RootAncestor',__DC__GetTWriter__RootAncestor,__DC__SetTWriter__RootAncestor);
end;

function __DC__GetClasses__CurrentGroup(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := Classes.CurrentGroup;
end;

procedure __DC__SetClasses__CurrentGroup(Instance : TObject; Params : PVariantArgList);
begin
Classes.CurrentGroup:=OleVariant(Params^[0]);
end;

function __DC__GetClasses__GlobalNameSpace(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(Classes.GlobalNameSpace);
end;

procedure __DC__SetClasses__GlobalNameSpace(Instance : TObject; Params : PVariantArgList);
begin
TObject(Classes.GlobalNameSpace):=(VarToObject(OleVariant(Params^[0])));
end;

var __RegisteredVars : TList;
procedure __RegisterVars;
begin
__RegisteredVars := TList.Create;
__RegisteredVars.Add(RegisterVar('CurrentGroup',__DC__GetClasses__CurrentGroup,__DC__SetClasses__CurrentGroup));
__RegisteredVars.Add(RegisterVar('GlobalNameSpace',__DC__GetClasses__GlobalNameSpace,__DC__SetClasses__GlobalNameSpace));
end;

procedure __UnregisterVars;
begin
__RegisteredVars.Free;
end;

const __ConstNames0 : array[0..86] of string = (
'MaxListSize'
,'soFromBeginning'
,'soFromCurrent'
,'soFromEnd'
,'fmCreate'
,'toEOF'
,'toSymbol'
,'toString'
,'toInteger'
,'toFloat'
,'toWString'
,'scShift'
,'scCtrl'
,'scAlt'
,'scNone'
,'taLeftJustify'
,'taRightJustify'
,'taCenter'
,'bdLeftToRight'
,'bdRightToLeft'
,'bdRightToLeftNoAlign'
,'bdRightToLeftReadingOnly'
,'ssShift'
,'ssAlt'
,'ssCtrl'
,'ssLeft'
,'ssRight'
,'ssMiddle'
,'ssDouble'
,'dupIgnore'
,'dupAccept'
,'dupError'
,'lnAdded'
,'lnExtracted'
,'lnDeleted'
,'soReference'
,'soOwned'
,'vaNull'
,'vaList'
,'vaInt8'
,'vaInt16'
,'vaInt32'
,'vaExtended'
,'vaString'
,'vaIdent'
,'vaFalse'
,'vaTrue'
,'vaBinary'
,'vaSet'
,'vaLString'
,'vaNil'
,'vaCollection'
,'vaSingle'
,'vaCurrency'
,'vaDate'
,'vaWString'
,'vaInt64'
,'ffInherited'
,'ffChildPos'
,'ffInline'
,'tpIdle'
,'tpLowest'
,'tpLower'
,'tpNormal'
,'tpHigher'
,'tpHighest'
,'tpTimeCritical'
,'opInsert'
,'opRemove'
,'csLoading'
,'csReading'
,'csWriting'
,'csDestroying'
,'csDesigning'
,'csAncestor'
,'csUpdating'
,'csFixups'
,'csFreeNotification'
,'csInline'
,'csDesignInstance'
,'csInheritable'
,'csCheckPropAvail'
,'axrComponentOnly'
,'axrIncludeDescendants'
,'sofUnknown'
,'sofBinary'
,'sofText'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,MaxListSize));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,soFromBeginning));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,soFromCurrent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,soFromEnd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,fmCreate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,toEOF));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,toSymbol));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,toString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,toInteger));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,toFloat));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,toWString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,scShift));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,scCtrl));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,scAlt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,scNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,taLeftJustify));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,taRightJustify));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,taCenter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,bdLeftToRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,bdRightToLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,bdRightToLeftNoAlign));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,bdRightToLeftReadingOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,ssShift));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,ssAlt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,ssCtrl));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,ssLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,ssRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,ssMiddle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,ssDouble));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,dupIgnore));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,dupAccept));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,dupError));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,lnAdded));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,lnExtracted));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,lnDeleted));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,soReference));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,soOwned));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,vaNull));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,vaList));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,vaInt8));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,vaInt16));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,vaInt32));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,vaExtended));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,vaString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,vaIdent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,vaFalse));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,vaTrue));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,vaBinary));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[48] ,vaSet));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[49] ,vaLString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[50] ,vaNil));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[51] ,vaCollection));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[52] ,vaSingle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[53] ,vaCurrency));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[54] ,vaDate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[55] ,vaWString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[56] ,vaInt64));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[57] ,ffInherited));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[58] ,ffChildPos));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[59] ,ffInline));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[60] ,tpIdle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[61] ,tpLowest));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[62] ,tpLower));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[63] ,tpNormal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[64] ,tpHigher));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[65] ,tpHighest));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[66] ,tpTimeCritical));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[67] ,opInsert));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[68] ,opRemove));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[69] ,csLoading));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[70] ,csReading));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[71] ,csWriting));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[72] ,csDestroying));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[73] ,csDesigning));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[74] ,csAncestor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[75] ,csUpdating));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[76] ,csFixups));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[77] ,csFreeNotification));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[78] ,csInline));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[79] ,csDesignInstance));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[80] ,csInheritable));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[81] ,csCheckPropAvail));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[82] ,axrComponentOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[83] ,axrIncludeDescendants));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[84] ,sofUnknown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[85] ,sofBinary));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[86] ,sofText));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..43] of TClass = (
EBitsError,
EClassNotFound,
EComponentError,
EFCreateError,
EFilerError,
EFOpenError,
EInvalidImage,
EInvalidOperation,
EListError,
EMethodNotFound,
EOutOfResources,
EParserError,
EReadError,
EResNotFound,
EStreamError,
EStringListError,
EThread,
EWriteError,
TBasicAction,
TBasicActionLink,
TBits,
TCollection,
TCollectionItem,
TComponent,
TCustomMemoryStream,
TFiler,
TFileStream,
THandleStream,
TInterfaceList,
TList,
TMemoryStream,
TOwnedCollection,
TParser,
TPersistent,
TReader,
TResourceStream,
TStream,
TStreamAdapter,
TStringList,
TStrings,
TStringStream,
TThread,
TThreadList,
TWriter
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..29] of string = (
'TIdentMapEntry'
,'TStringItem'
,'Point'
,'SmallPoint'
,'Rect'
,'Bounds'
,'UnRegisterModuleClasses'
,'IdentToInt'
,'IntToIdent'
,'InitComponentRes'
,'ReadComponentRes'
,'ReadComponentResEx'
,'ReadComponentResFile'
,'WriteComponentResFile'
,'GlobalFixupReferences'
,'GetFixupReferenceNames'
,'GetFixupInstanceNames'
,'RedirectFixupReferences'
,'RemoveFixupReferences'
,'RemoveFixups'
,'FindNestedComponent'
,'BeginGlobalLoading'
,'NotifyGlobalLoading'
,'EndGlobalLoading'
,'CollectionsEqual'
,'ObjectBinaryToText'
,'ObjectTextToBinary'
,'ObjectResourceToText'
,'ObjectTextToResource'
,'TestStreamFormat'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TIdentMapEntry_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(_TStringItem_)));
RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T0),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(IDispatch)],Addr(____Point__Wrapper),cRegister);

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T1),[
TypeInfo(SmallInt),
TypeInfo(SmallInt),TypeInfo(IDispatch)],Addr(____SmallPoint__Wrapper),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T2),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(IDispatch)],Addr(____Rect__Wrapper),cRegister);

RegisterProc(nil,MethodNames[5],mtProc,TypeInfo(_T3),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(IDispatch)],Addr(____Bounds__Wrapper),cRegister);

RegisterProc(nil,MethodNames[6],mtProc,TypeInfo(_T9),[
TypeInfo(HMODULE)],Addr(UnRegisterModuleClasses),cRegister);

RegisterProc(nil,MethodNames[7],mtProc,TypeInfo(_T16),[
TypeInfo(string),
TypeInfo(Longint),
ArrayInfo(TypeInfo(IDispatch)),TypeInfo(Boolean)],Addr(____IdentToInt__Wrapper),cRegister);

RegisterProc(nil,MethodNames[8],mtProc,TypeInfo(_T17),[
TypeInfo(Longint),
TypeInfo(string),
ArrayInfo(TypeInfo(IDispatch)),TypeInfo(Boolean)],Addr(____IntToIdent__Wrapper),cRegister);

RegisterProc(nil,MethodNames[9],mtProc,TypeInfo(_T21),[
TypeInfo(string),
TypeInfo(TComponent),TypeInfo(Boolean)],Addr(InitComponentRes),cRegister);

RegisterProc(nil,MethodNames[10],mtProc,TypeInfo(_T22),[
TypeInfo(string),
TypeInfo(TComponent),TypeInfo(TComponent)],Addr(ReadComponentRes),cRegister);

RegisterProc(nil,MethodNames[11],mtProc,TypeInfo(_T23),[
TypeInfo(THandle),
TypeInfo(string),TypeInfo(TComponent)],Addr(ReadComponentResEx),cRegister);

RegisterProc(nil,MethodNames[12],mtProc,TypeInfo(_T24),[
TypeInfo(string),
TypeInfo(TComponent),TypeInfo(TComponent)],Addr(ReadComponentResFile),cRegister);

RegisterProc(nil,MethodNames[13],mtProc,TypeInfo(_T25),[
TypeInfo(string),
TypeInfo(TComponent)],Addr(WriteComponentResFile),cRegister);

RegisterProc(nil,MethodNames[14],mtProc,TypeInfo(_T26),NoParams,Addr(GlobalFixupReferences),cRegister);

RegisterProc(nil,MethodNames[15],mtProc,TypeInfo(_T27),[
TypeInfo(TComponent),
TypeInfo(TStrings)],Addr(GetFixupReferenceNames),cRegister);

RegisterProc(nil,MethodNames[16],mtProc,TypeInfo(_T28),[
TypeInfo(TComponent),
TypeInfo(string),
TypeInfo(TStrings)],Addr(GetFixupInstanceNames),cRegister);

RegisterProc(nil,MethodNames[17],mtProc,TypeInfo(_T29),[
TypeInfo(TComponent),
TypeInfo(string),
TypeInfo(string)],Addr(RedirectFixupReferences),cRegister);

RegisterProc(nil,MethodNames[18],mtProc,TypeInfo(_T30),[
TypeInfo(TComponent),
TypeInfo(string)],Addr(RemoveFixupReferences),cRegister);

RegisterProc(nil,MethodNames[19],mtProc,TypeInfo(_T31),[
TypeInfo(TPersistent)],Addr(RemoveFixups),cRegister);

RegisterProc(nil,MethodNames[20],mtProc,TypeInfo(_T32),[
TypeInfo(TComponent),
TypeInfo(string),TypeInfo(TComponent)],Addr(FindNestedComponent),cRegister);

RegisterProc(nil,MethodNames[21],mtProc,TypeInfo(_T33),NoParams,Addr(BeginGlobalLoading),cRegister);

RegisterProc(nil,MethodNames[22],mtProc,TypeInfo(_T34),NoParams,Addr(NotifyGlobalLoading),cRegister);

RegisterProc(nil,MethodNames[23],mtProc,TypeInfo(_T35),NoParams,Addr(EndGlobalLoading),cRegister);

RegisterProc(nil,MethodNames[24],mtProc,TypeInfo(_T36),[
TypeInfo(TCollection),
TypeInfo(TCollection),TypeInfo(Boolean)],Addr(CollectionsEqual),cRegister);

RegisterProc(nil,MethodNames[25],mtProc,TypeInfo(_T37),[
TypeInfo(TStream),
TypeInfo(TStream)],Addr(ObjectBinaryToText),cRegister);

RegisterProc(nil,MethodNames[26],mtProc,TypeInfo(_T38),[
TypeInfo(TStream),
TypeInfo(TStream)],Addr(ObjectTextToBinary),cRegister);

RegisterProc(nil,MethodNames[27],mtProc,TypeInfo(_T39),[
TypeInfo(TStream),
TypeInfo(TStream)],Addr(ObjectResourceToText),cRegister);

RegisterProc(nil,MethodNames[28],mtProc,TypeInfo(_T40),[
TypeInfo(TStream),
TypeInfo(TStream)],Addr(ObjectTextToResource),cRegister);

RegisterProc(nil,MethodNames[29],mtProc,TypeInfo(_T41),[
TypeInfo(TStream),TypeInfo(TStreamOriginalFormat)],Addr(TestStreamFormat),cRegister);

RegRegisterMethod(TBasicAction,'Change',TypeInfo(_T47),NoParams, pointer(48));

RegRegisterMethod(TBasicAction,'HandlesTarget',TypeInfo(_T49),[
TypeInfo(TObject),TypeInfo(Boolean)], pointer(56));

RegRegisterMethod(TBasicAction,'UpdateTarget',TypeInfo(_T50),[
TypeInfo(TObject)], pointer(60));

RegRegisterMethod(TBasicAction,'ExecuteTarget',TypeInfo(_T51),[
TypeInfo(TObject)], pointer(64));

RegRegisterMethod(TBasicAction,'Execute',TypeInfo(_T52),[TypeInfo(Boolean)], pointer(MinVMTOffset - 15));

RegRegisterMethod(TBasicAction,'RegisterChanges',TypeInfo(_T53),[
TypeInfo(TBasicActionLink)],Addr(TBasicAction.RegisterChanges));

RegRegisterMethod(TBasicAction,'UnRegisterChanges',TypeInfo(_T54),[
TypeInfo(TBasicActionLink)],Addr(TBasicAction.UnRegisterChanges));

RegRegisterMethod(TBasicAction,'Update',TypeInfo(_T55),[TypeInfo(Boolean)], pointer(68));

RegRegisterMethod(TBasicActionLink,'AssignClient',TypeInfo(_T56),[
TypeInfo(TObject)], pointer(0));

RegRegisterMethod(TBasicActionLink,'Change',TypeInfo(_T57),NoParams, pointer(4));

RegRegisterMethod(TBasicActionLink,'IsOnExecuteLinked',TypeInfo(_T58),[TypeInfo(Boolean)], pointer(8));

RegRegisterMethod(TBasicActionLink,'SetAction',TypeInfo(_T59),[
TypeInfo(TBasicAction)], pointer(12));

RegisterProc(TBasicActionLink,'Create',mtConstructor,TypeInfo(_T61),[
TypeInfo(TObject)], pointer(20),cRegister);

RegRegisterMethod(TBasicActionLink,'Execute',TypeInfo(_T62),[TypeInfo(Boolean)], pointer(24));

RegRegisterMethod(TBasicActionLink,'Update',TypeInfo(_T63),[TypeInfo(Boolean)], pointer(28));

RegRegisterMethod(TBits,'OpenBit',TypeInfo(_T64),[TypeInfo(Integer)],Addr(TBits.OpenBit));

RegRegisterMethod(TCollection,'GetAttrCount',TypeInfo(_T65),[TypeInfo(Integer)], pointer(MinVMTOffset - 2));

RegRegisterMethod(TCollection,'GetAttr',TypeInfo(_T66),[
TypeInfo(Integer),TypeInfo(string)], pointer(MinVMTOffset - 3));

RegRegisterMethod(TCollection,'GetItemAttr',TypeInfo(_T67),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(string)], pointer(MinVMTOffset - 4));

RegRegisterMethod(TCollection,'SetItemName',TypeInfo(_T68),[
TypeInfo(TCollectionItem)], pointer(12));

RegRegisterMethod(TCollection,'Update',TypeInfo(_T69),[
TypeInfo(TCollectionItem)], pointer(16));

RegRegisterMethod(TCollection,'Add',TypeInfo(_T71),[TypeInfo(TCollectionItem)],Addr(TCollection.Add));

RegRegisterMethod(TCollection,'BeginUpdate',TypeInfo(_T72),NoParams, pointer(20));

RegRegisterMethod(TCollection,'Clear',TypeInfo(_T73),NoParams,Addr(TCollection.Clear));

RegRegisterMethod(TCollection,'Delete',TypeInfo(_T74),[
TypeInfo(Integer)],Addr(TCollection.Delete));

RegRegisterMethod(TCollection,'EndUpdate',TypeInfo(_T75),NoParams, pointer(24));

RegRegisterMethod(TCollection,'FindItemID',TypeInfo(_T76),[
TypeInfo(Integer),TypeInfo(TCollectionItem)],Addr(TCollection.FindItemID));

RegRegisterMethod(TCollection,'Insert',TypeInfo(_T77),[
TypeInfo(Integer),TypeInfo(TCollectionItem)],Addr(TCollection.Insert));

RegRegisterMethod(TCollectionItem,'GetDisplayName',TypeInfo(_T78),[TypeInfo(string)], pointer(12));

RegRegisterMethod(TCollectionItem,'SetIndex',TypeInfo(_T79),[
TypeInfo(Integer)], pointer(16));

RegRegisterMethod(TCollectionItem,'SetDisplayName',TypeInfo(_T80),[
TypeInfo(string)], pointer(20));

RegisterProc(TCollectionItem,'Create',mtConstructor,TypeInfo(_T81),[
TypeInfo(TCollection)], pointer(24),cRegister);

RegRegisterMethod(TComponent,'GetChildOwner',TypeInfo(_T83),[TypeInfo(TComponent)], pointer(MinVMTOffset - 3));

RegRegisterMethod(TComponent,'GetChildParent',TypeInfo(_T84),[TypeInfo(TComponent)], pointer(MinVMTOffset - 4));

RegRegisterMethod(TComponent,'Loaded',TypeInfo(_T85),NoParams, pointer(12));

RegRegisterMethod(TComponent,'Notification',TypeInfo(_T86),[
TypeInfo(TComponent),
TypeInfo(TOperation)], pointer(16));

RegRegisterMethod(TComponent,'ReadState',TypeInfo(_T87),[
TypeInfo(TReader)], pointer(20));

RegRegisterMethod(TComponent,'SetName',TypeInfo(_T88),[
TypeInfo(TComponentName)], pointer(24));

RegRegisterMethod(TComponent,'SetChildOrder',TypeInfo(_T89),[
TypeInfo(TComponent),
TypeInfo(Integer)], pointer(MinVMTOffset - 5));

RegRegisterMethod(TComponent,'SetParentComponent',TypeInfo(_T90),[
TypeInfo(TComponent)], pointer(MinVMTOffset - 6));

RegRegisterMethod(TComponent,'Updating',TypeInfo(_T91),NoParams, pointer(MinVMTOffset - 7));

RegRegisterMethod(TComponent,'Updated',TypeInfo(_T92),NoParams, pointer(MinVMTOffset - 8));

RegisterProc(TComponent,'UpdateRegistry',mtClassMethod,TypeInfo(_T93),[
TypeInfo(Boolean),
TypeInfo(string),
TypeInfo(string)], pointer(28),cRegister);

RegRegisterMethod(TComponent,'ValidateRename',TypeInfo(_T94),[
TypeInfo(TComponent),
TypeInfo(string),
TypeInfo(string)], pointer(32));

RegRegisterMethod(TComponent,'ValidateContainer',TypeInfo(_T95),[
TypeInfo(TComponent)], pointer(MinVMTOffset - 9));

RegRegisterMethod(TComponent,'ValidateInsert',TypeInfo(_T96),[
TypeInfo(TComponent)], pointer(MinVMTOffset - 10));

RegRegisterMethod(TComponent,'WriteState',TypeInfo(_T97),[
TypeInfo(TWriter)], pointer(36));

RegisterProc(TComponent,'QueryInterface',mtMethod,TypeInfo(_T98),[
TypeInfo(IDispatch),
TypeInfoUntyped,TypeInfo(HResult)], pointer(40),cRegister);

RegisterProc(TComponent,'Create',mtConstructor,TypeInfo(_T99),[
TypeInfo(TComponent)], pointer(44),cRegister);

RegRegisterMethod(TComponent,'DestroyComponents',TypeInfo(_T100),NoParams,Addr(TComponent.DestroyComponents));

RegRegisterMethod(TComponent,'Destroying',TypeInfo(_T101),NoParams,Addr(TComponent.Destroying));

RegRegisterMethod(TComponent,'ExecuteAction',TypeInfo(_T102),[
TypeInfo(TBasicAction),TypeInfo(Boolean)], pointer(MinVMTOffset - 11));

RegRegisterMethod(TComponent,'FindComponent',TypeInfo(_T103),[
TypeInfo(string),TypeInfo(TComponent)],Addr(TComponent.FindComponent));

RegRegisterMethod(TComponent,'FreeNotification',TypeInfo(_T104),[
TypeInfo(TComponent)],Addr(TComponent.FreeNotification));

RegRegisterMethod(TComponent,'RemoveFreeNotification',TypeInfo(_T105),[
TypeInfo(TComponent)],Addr(TComponent.RemoveFreeNotification));

RegRegisterMethod(TComponent,'FreeOnRelease',TypeInfo(_T106),NoParams,Addr(TComponent.FreeOnRelease));

RegRegisterMethod(TComponent,'GetParentComponent',TypeInfo(_T107),[TypeInfo(TComponent)], pointer(MinVMTOffset - 12));

RegRegisterMethod(TComponent,'HasParent',TypeInfo(_T108),[TypeInfo(Boolean)], pointer(MinVMTOffset - 13));

RegRegisterMethod(TComponent,'InsertComponent',TypeInfo(_T109),[
TypeInfo(TComponent)],Addr(TComponent.InsertComponent));

RegRegisterMethod(TComponent,'RemoveComponent',TypeInfo(_T110),[
TypeInfo(TComponent)],Addr(TComponent.RemoveComponent));

RegRegisterMethod(TComponent,'UpdateAction',TypeInfo(_T111),[
TypeInfo(TBasicAction),TypeInfo(Boolean)], pointer(MinVMTOffset - 14));

RegRegisterMethod(TCustomMemoryStream,'SaveToStream',TypeInfo(_T112),[
TypeInfo(TStream)],Addr(TCustomMemoryStream.SaveToStream));

RegRegisterMethod(TCustomMemoryStream,'SaveToFile',TypeInfo(_T113),[
TypeInfo(string)],Addr(TCustomMemoryStream.SaveToFile));

RegRegisterMethod(TFiler,'SetRoot',TypeInfo(_T114),[
TypeInfo(TComponent)], pointer(0));

RegisterProc(TFiler,'Create',mtConstructor,TypeInfo(_T115),[
TypeInfo(TStream),
TypeInfo(Integer)],Addr(TFiler.Create),cRegister);

RegRegisterMethod(TFiler,'FlushBuffer',TypeInfo(_T118),NoParams, pointer(12));

RegisterProc(TFileStream,'Create',mtConstructor,TypeInfo(_T119),[
TypeInfo(string),
TypeInfo(Word)],Addr(TFileStream.Create),cRegister);

RegisterProc(THandleStream,'Create',mtConstructor,TypeInfo(_T120),[
TypeInfo(Integer)],Addr(THandleStream.Create),cRegister);

RegisterProc(TInterfaceList,'Create',mtConstructor,TypeInfo(_T121),NoParams,Addr(TInterfaceList.Create),cRegister);

RegRegisterMethod(TInterfaceList,'Clear',TypeInfo(_T122),NoParams,Addr(TInterfaceList.Clear));

RegRegisterMethod(TInterfaceList,'Delete',TypeInfo(_T123),[
TypeInfo(Integer)],Addr(TInterfaceList.Delete));

RegRegisterMethod(TInterfaceList,'Exchange',TypeInfo(_T124),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TInterfaceList.Exchange));

RegRegisterMethod(TInterfaceList,'Expand',TypeInfo(_T125),[TypeInfo(TInterfaceList)],Addr(TInterfaceList.Expand));

RegRegisterMethod(TInterfaceList,'Lock',TypeInfo(_T132),NoParams,Addr(TInterfaceList.Lock));

RegRegisterMethod(TInterfaceList,'Unlock',TypeInfo(_T133),NoParams,Addr(TInterfaceList.Unlock));

RegRegisterMethod(TList,'Grow',TypeInfo(_T134),NoParams, pointer(0));

RegRegisterMethod(TList,'Notify',TypeInfo(_T135),[
TypeInfoPointer,
TypeInfo(TListNotification)], pointer(4));

RegRegisterMethod(TList,'Add',TypeInfo(_T136),[
TypeInfoPointer,TypeInfo(Integer)],Addr(TList.Add));

RegRegisterMethod(TList,'Clear',TypeInfo(_T137),NoParams, pointer(8));

RegRegisterMethod(TList,'Delete',TypeInfo(_T138),[
TypeInfo(Integer)],Addr(TList.Delete));

RegisterProc(TList,'Error',mtClassMethod,TypeInfo(_T139),[
TypeInfo(string),
TypeInfo(Integer)], pointer(12),cRegister);

RegRegisterMethod(TList,'Exchange',TypeInfo(_T140),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TList.Exchange));

RegRegisterMethod(TList,'Expand',TypeInfo(_T141),[TypeInfo(TList)],Addr(TList.Expand));

RegRegisterMethod(TList,'Extract',TypeInfo(_T142),[
TypeInfoPointer,TypeInfoPointer],Addr(TList.Extract));

RegRegisterMethod(TList,'First',TypeInfo(_T143),[TypeInfoPointer],Addr(TList.First));

RegRegisterMethod(TList,'IndexOf',TypeInfo(_T144),[
TypeInfoPointer,TypeInfo(Integer)],Addr(TList.IndexOf));

RegRegisterMethod(TList,'Insert',TypeInfo(_T145),[
TypeInfo(Integer),
TypeInfoPointer],Addr(TList.Insert));

RegRegisterMethod(TList,'Last',TypeInfo(_T146),[TypeInfoPointer],Addr(TList.Last));

RegRegisterMethod(TList,'Move',TypeInfo(_T147),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TList.Move));

RegRegisterMethod(TList,'Remove',TypeInfo(_T148),[
TypeInfoPointer,TypeInfo(Integer)],Addr(TList.Remove));

RegRegisterMethod(TList,'Pack',TypeInfo(_T149),NoParams,Addr(TList.Pack));

RegRegisterMethod(TMemoryStream,'Realloc',TypeInfo(_T151),[
TypeInfo(Longint),TypeInfoPointer], pointer(16));

RegRegisterMethod(TMemoryStream,'Clear',TypeInfo(_T152),NoParams,Addr(TMemoryStream.Clear));

RegRegisterMethod(TMemoryStream,'LoadFromStream',TypeInfo(_T153),[
TypeInfo(TStream)],Addr(TMemoryStream.LoadFromStream));

RegRegisterMethod(TMemoryStream,'LoadFromFile',TypeInfo(_T154),[
TypeInfo(string)],Addr(TMemoryStream.LoadFromFile));

RegisterProc(TParser,'Create',mtConstructor,TypeInfo(_T156),[
TypeInfo(TStream)],Addr(TParser.Create),cRegister);

RegRegisterMethod(TParser,'CheckToken',TypeInfo(_T157),[
TypeInfo(Char)],Addr(TParser.CheckToken));

RegRegisterMethod(TParser,'CheckTokenSymbol',TypeInfo(_T158),[
TypeInfo(string)],Addr(TParser.CheckTokenSymbol));

RegRegisterMethod(TParser,'Error',TypeInfo(_T159),[
TypeInfo(string)],Addr(TParser.Error));

RegRegisterMethod(TParser,'ErrorFmt',TypeInfo(_T160),[
TypeInfo(string),
TypeInfoArrayOfConst],Addr(TParser.ErrorFmt));

RegRegisterMethod(TParser,'ErrorStr',TypeInfo(_T161),[
TypeInfo(string)],Addr(TParser.ErrorStr));

RegRegisterMethod(TParser,'HexToBinary',TypeInfo(_T162),[
TypeInfo(TStream)],Addr(TParser.HexToBinary));

RegRegisterMethod(TParser,'NextToken',TypeInfo(_T163),[TypeInfo(Char)],Addr(TParser.NextToken));

RegRegisterMethod(TParser,'SourcePos',TypeInfo(_T164),[TypeInfo(Longint)],Addr(TParser.SourcePos));

RegRegisterMethod(TParser,'TokenComponentIdent',TypeInfo(_T165),[TypeInfo(string)],Addr(TParser.TokenComponentIdent));

RegRegisterMethod(TParser,'TokenFloat',TypeInfo(_T166),[TypeInfo(Extended)],Addr(TParser.TokenFloat));

RegRegisterMethod(TParser,'TokenString',TypeInfo(_T168),[TypeInfo(string)],Addr(TParser.TokenString));

RegRegisterMethod(TParser,'TokenWideString',TypeInfo(_T169),[TypeInfo(WideString)],Addr(TParser.TokenWideString));

RegRegisterMethod(TParser,'TokenSymbolIs',TypeInfo(_T170),[
TypeInfo(string),TypeInfo(Boolean)],Addr(TParser.TokenSymbolIs));

RegRegisterMethod(TPersistent,'AssignTo',TypeInfo(_T171),[
TypeInfo(TPersistent)], pointer(0));

RegRegisterMethod(TPersistent,'DefineProperties',TypeInfo(_T172),[
TypeInfo(TFiler)], pointer(4));

RegRegisterMethod(TPersistent,'GetOwner',TypeInfo(_T173),[TypeInfo(TPersistent)], pointer(MinVMTOffset - 0));

RegRegisterMethod(TPersistent,'Assign',TypeInfo(_T174),[
TypeInfo(TPersistent)], pointer(8));

RegRegisterMethod(TPersistent,'GetNamePath',TypeInfo(_T175),[TypeInfo(string)], pointer(MinVMTOffset - 1));

RegRegisterMethod(TReader,'Error',TypeInfo(_T176),[
TypeInfo(string),TypeInfo(Boolean)], pointer(16));

RegRegisterMethod(TReader,'FindMethod',TypeInfo(_T178),[
TypeInfo(TComponent),
TypeInfo(string),TypeInfoPointer], pointer(24));

RegRegisterMethod(TReader,'SetName',TypeInfo(_T179),[
TypeInfo(TComponent),
TypeInfo(string)], pointer(28));

RegRegisterMethod(TReader,'ReferenceName',TypeInfo(_T180),[
TypeInfo(string)], pointer(32));

RegRegisterMethod(TReader,'BeginReferences',TypeInfo(_T181),NoParams,Addr(TReader.BeginReferences));

RegRegisterMethod(TReader,'CheckValue',TypeInfo(_T182),[
TypeInfo(TValueType)],Addr(TReader.CheckValue));

RegRegisterMethod(TReader,'EndOfList',TypeInfo(_T183),[TypeInfo(Boolean)],Addr(TReader.EndOfList));

RegRegisterMethod(TReader,'EndReferences',TypeInfo(_T184),NoParams,Addr(TReader.EndReferences));

RegRegisterMethod(TReader,'FixupReferences',TypeInfo(_T185),NoParams,Addr(TReader.FixupReferences));

RegRegisterMethod(TReader,'NextValue',TypeInfo(_T186),[TypeInfo(TValueType)],Addr(TReader.NextValue));

RegRegisterMethod(TReader,'Read',TypeInfo(_T187),[
TypeInfoUntyped,
TypeInfo(Longint)],Addr(TReader.Read));

RegRegisterMethod(TReader,'ReadBoolean',TypeInfo(_T188),[TypeInfo(Boolean)],Addr(TReader.ReadBoolean));

RegRegisterMethod(TReader,'ReadChar',TypeInfo(_T189),[TypeInfo(Char)],Addr(TReader.ReadChar));

RegRegisterMethod(TReader,'ReadCollection',TypeInfo(_T190),[
TypeInfo(TCollection)],Addr(TReader.ReadCollection));

RegRegisterMethod(TReader,'ReadComponent',TypeInfo(_T191),[
TypeInfo(TComponent),TypeInfo(TComponent)],Addr(TReader.ReadComponent));

RegRegisterMethod(TReader,'ReadFloat',TypeInfo(_T193),[TypeInfo(Extended)],Addr(TReader.ReadFloat));

RegRegisterMethod(TReader,'ReadSingle',TypeInfo(_T194),[TypeInfo(Single)],Addr(TReader.ReadSingle));

RegRegisterMethod(TReader,'ReadCurrency',TypeInfo(_T195),[TypeInfo(Currency)],Addr(TReader.ReadCurrency));

RegRegisterMethod(TReader,'ReadDate',TypeInfo(_T196),[TypeInfo(TDateTime)],Addr(TReader.ReadDate));

RegRegisterMethod(TReader,'ReadIdent',TypeInfo(_T197),[TypeInfo(string)],Addr(TReader.ReadIdent));

RegRegisterMethod(TReader,'ReadInteger',TypeInfo(_T198),[TypeInfo(Longint)],Addr(TReader.ReadInteger));

RegRegisterMethod(TReader,'ReadListBegin',TypeInfo(_T200),NoParams,Addr(TReader.ReadListBegin));

RegRegisterMethod(TReader,'ReadListEnd',TypeInfo(_T201),NoParams,Addr(TReader.ReadListEnd));

RegRegisterMethod(TReader,'ReadPrefix',TypeInfo(_T202),[
TypeInfo(TFilerFlags),
TypeInfo(Integer)], pointer(36));

RegRegisterMethod(TReader,'ReadRootComponent',TypeInfo(_T203),[
TypeInfo(TComponent),TypeInfo(TComponent)],Addr(TReader.ReadRootComponent));

RegRegisterMethod(TReader,'ReadSignature',TypeInfo(_T204),NoParams,Addr(TReader.ReadSignature));

RegRegisterMethod(TReader,'ReadStr',TypeInfo(_T205),[TypeInfo(string)],Addr(TReader.ReadStr));

RegRegisterMethod(TReader,'ReadString',TypeInfo(_T206),[TypeInfo(string)],Addr(TReader.ReadString));

RegRegisterMethod(TReader,'ReadWideString',TypeInfo(_T207),[TypeInfo(WideString)],Addr(TReader.ReadWideString));

RegRegisterMethod(TReader,'ReadValue',TypeInfo(_T208),[TypeInfo(TValueType)],Addr(TReader.ReadValue));

RegRegisterMethod(TReader,'CopyValue',TypeInfo(_T209),[
TypeInfo(TWriter)],Addr(TReader.CopyValue));

RegRegisterMethod(TStream,'SetSize',TypeInfo(_T212),[
TypeInfo(Longint)], pointer(0));

RegRegisterMethod(TStream,'Read',TypeInfo(_T213),[
TypeInfoUntyped,
TypeInfo(Longint),TypeInfo(Longint)], pointer(4));

RegRegisterMethod(TStream,'Write',TypeInfo(_T214),[
TypeInfoUntyped,
TypeInfo(Longint),TypeInfo(Longint)], pointer(8));

RegRegisterMethod(TStream,'Seek',TypeInfo(_T215),[
TypeInfo(Longint),
TypeInfo(Word),TypeInfo(Longint)], pointer(12));

RegRegisterMethod(TStream,'ReadBuffer',TypeInfo(_T216),[
TypeInfoUntyped,
TypeInfo(Longint)],Addr(TStream.ReadBuffer));

RegRegisterMethod(TStream,'WriteBuffer',TypeInfo(_T217),[
TypeInfoUntyped,
TypeInfo(Longint)],Addr(TStream.WriteBuffer));

RegRegisterMethod(TStream,'CopyFrom',TypeInfo(_T218),[
TypeInfo(TStream),
TypeInfo(Longint),TypeInfo(Longint)],Addr(TStream.CopyFrom));

RegRegisterMethod(TStream,'ReadComponent',TypeInfo(_T219),[
TypeInfo(TComponent),TypeInfo(TComponent)],Addr(TStream.ReadComponent));

RegRegisterMethod(TStream,'ReadComponentRes',TypeInfo(_T220),[
TypeInfo(TComponent),TypeInfo(TComponent)],Addr(TStream.ReadComponentRes));

RegRegisterMethod(TStream,'WriteComponent',TypeInfo(_T221),[
TypeInfo(TComponent)],Addr(TStream.WriteComponent));

RegRegisterMethod(TStream,'WriteComponentRes',TypeInfo(_T222),[
TypeInfo(string),
TypeInfo(TComponent)],Addr(TStream.WriteComponentRes));

RegRegisterMethod(TStream,'WriteDescendent',TypeInfo(_T223),[
TypeInfo(TComponent),
TypeInfo(TComponent)],Addr(TStream.WriteDescendent));

RegRegisterMethod(TStream,'WriteDescendentRes',TypeInfo(_T224),[
TypeInfo(string),
TypeInfo(TComponent),
TypeInfo(TComponent)],Addr(TStream.WriteDescendentRes));

RegRegisterMethod(TStream,'WriteResourceHeader',TypeInfo(_T225),[
TypeInfo(string),
TypeInfo(Integer)],Addr(TStream.WriteResourceHeader));

RegRegisterMethod(TStream,'FixupResourceHeader',TypeInfo(_T226),[
TypeInfo(Integer)],Addr(TStream.FixupResourceHeader));

RegRegisterMethod(TStream,'ReadResHeader',TypeInfo(_T227),NoParams,Addr(TStream.ReadResHeader));

RegisterProc(TStreamAdapter,'Create',mtConstructor,TypeInfo(_T228),[
TypeInfo(TStream),
TypeInfo(TStreamOwnership)],Addr(TStreamAdapter.Create),cRegister);

RegisterProc(TStreamAdapter,'Read',mtMethod,TypeInfo(_T229),[
TypeInfoPointer,
TypeInfo(Longint),
TypeInfoPointer,TypeInfo(HResult)], pointer(0),cStdCall);

RegisterProc(TStreamAdapter,'Write',mtMethod,TypeInfo(_T230),[
TypeInfoPointer,
TypeInfo(Longint),
TypeInfoPointer,TypeInfo(HResult)], pointer(4),cStdCall);

RegisterProc(TStreamAdapter,'Commit',mtMethod,TypeInfo(_T234),[
TypeInfo(Longint),TypeInfo(HResult)], pointer(20),cStdCall);

RegisterProc(TStreamAdapter,'Revert',mtMethod,TypeInfo(_T235),[TypeInfo(HResult)], pointer(24),cStdCall);

RegRegisterMethod(TStringList,'Changed',TypeInfo(_T240),NoParams, pointer(112));

RegRegisterMethod(TStringList,'Changing',TypeInfo(_T241),NoParams, pointer(116));

RegRegisterMethod(TStringList,'Find',TypeInfo(_T242),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Boolean)], pointer(120));

RegRegisterMethod(TStringList,'Sort',TypeInfo(_T243),NoParams, pointer(124));

RegRegisterMethod(TStrings,'Get',TypeInfo(_T245),[
TypeInfo(Integer),TypeInfo(string)], pointer(12));

RegRegisterMethod(TStrings,'GetCapacity',TypeInfo(_T246),[TypeInfo(Integer)], pointer(16));

RegRegisterMethod(TStrings,'GetCount',TypeInfo(_T247),[TypeInfo(Integer)], pointer(20));

RegRegisterMethod(TStrings,'GetObject',TypeInfo(_T248),[
TypeInfo(Integer),TypeInfo(TObject)], pointer(24));

RegRegisterMethod(TStrings,'GetTextStr',TypeInfo(_T249),[TypeInfo(string)], pointer(28));

RegRegisterMethod(TStrings,'Put',TypeInfo(_T250),[
TypeInfo(Integer),
TypeInfo(string)], pointer(32));

RegRegisterMethod(TStrings,'PutObject',TypeInfo(_T251),[
TypeInfo(Integer),
TypeInfo(TObject)], pointer(36));

RegRegisterMethod(TStrings,'SetCapacity',TypeInfo(_T252),[
TypeInfo(Integer)], pointer(40));

RegRegisterMethod(TStrings,'SetTextStr',TypeInfo(_T253),[
TypeInfo(string)], pointer(44));

RegRegisterMethod(TStrings,'SetUpdateState',TypeInfo(_T254),[
TypeInfo(Boolean)], pointer(48));

RegRegisterMethod(TStrings,'Add',TypeInfo(_T255),[
TypeInfo(string),TypeInfo(Integer)], pointer(52));

RegRegisterMethod(TStrings,'AddObject',TypeInfo(_T256),[
TypeInfo(string),
TypeInfo(TObject),TypeInfo(Integer)], pointer(56));

RegRegisterMethod(TStrings,'Append',TypeInfo(_T257),[
TypeInfo(string)],Addr(TStrings.Append));

RegRegisterMethod(TStrings,'AddStrings',TypeInfo(_T258),[
TypeInfo(TStrings)], pointer(60));

RegRegisterMethod(TStrings,'BeginUpdate',TypeInfo(_T259),NoParams,Addr(TStrings.BeginUpdate));

RegRegisterMethod(TStrings,'Clear',TypeInfo(_T260),NoParams, pointer(64));

RegRegisterMethod(TStrings,'Delete',TypeInfo(_T261),[
TypeInfo(Integer)], pointer(68));

RegRegisterMethod(TStrings,'EndUpdate',TypeInfo(_T262),NoParams,Addr(TStrings.EndUpdate));

RegRegisterMethod(TStrings,'Equals',TypeInfo(_T263),[
TypeInfo(TStrings),TypeInfo(Boolean)],Addr(TStrings.Equals));

RegRegisterMethod(TStrings,'Exchange',TypeInfo(_T264),[
TypeInfo(Integer),
TypeInfo(Integer)], pointer(72));

RegRegisterMethod(TStrings,'GetText',TypeInfo(_T265),[TypeInfoPChar], pointer(76));

RegRegisterMethod(TStrings,'IndexOf',TypeInfo(_T266),[
TypeInfo(string),TypeInfo(Integer)], pointer(80));

RegRegisterMethod(TStrings,'IndexOfName',TypeInfo(_T267),[
TypeInfo(string),TypeInfo(Integer)],Addr(TStrings.IndexOfName));

RegRegisterMethod(TStrings,'IndexOfObject',TypeInfo(_T268),[
TypeInfo(TObject),TypeInfo(Integer)],Addr(TStrings.IndexOfObject));

RegRegisterMethod(TStrings,'Insert',TypeInfo(_T269),[
TypeInfo(Integer),
TypeInfo(string)], pointer(84));

RegRegisterMethod(TStrings,'InsertObject',TypeInfo(_T270),[
TypeInfo(Integer),
TypeInfo(string),
TypeInfo(TObject)],Addr(TStrings.InsertObject));

RegRegisterMethod(TStrings,'LoadFromFile',TypeInfo(_T271),[
TypeInfo(string)], pointer(88));

RegRegisterMethod(TStrings,'LoadFromStream',TypeInfo(_T272),[
TypeInfo(TStream)], pointer(92));

RegRegisterMethod(TStrings,'Move',TypeInfo(_T273),[
TypeInfo(Integer),
TypeInfo(Integer)], pointer(96));

RegRegisterMethod(TStrings,'SaveToFile',TypeInfo(_T274),[
TypeInfo(string)], pointer(100));

RegRegisterMethod(TStrings,'SaveToStream',TypeInfo(_T275),[
TypeInfo(TStream)], pointer(104));

RegisterProc(TStringStream,'Create',mtConstructor,TypeInfo(_T277),[
TypeInfo(string)],Addr(TStringStream.Create),cRegister);

RegRegisterMethod(TStringStream,'ReadString',TypeInfo(_T278),[
TypeInfo(Longint),TypeInfo(string)],Addr(TStringStream.ReadString));

RegRegisterMethod(TStringStream,'WriteString',TypeInfo(_T279),[
TypeInfo(string)],Addr(TStringStream.WriteString));

RegRegisterMethod(TThread,'DoTerminate',TypeInfo(_T280),NoParams, pointer(0));

RegRegisterMethod(TThread,'Execute',TypeInfo(_T281),NoParams, pointer(4));

RegisterProc(TThread,'Create',mtConstructor,TypeInfo(_T282),[
TypeInfo(Boolean)],Addr(TThread.Create),cRegister);

RegRegisterMethod(TThread,'Resume',TypeInfo(_T283),NoParams,Addr(TThread.Resume));

RegRegisterMethod(TThread,'Suspend',TypeInfo(_T284),NoParams,Addr(TThread.Suspend));

RegRegisterMethod(TThread,'Terminate',TypeInfo(_T285),NoParams,Addr(TThread.Terminate));

RegRegisterMethod(TThread,'WaitFor',TypeInfo(_T286),[TypeInfo(LongWord)],Addr(TThread.WaitFor));

RegisterProc(TThreadList,'Create',mtConstructor,TypeInfo(_T287),NoParams,Addr(TThreadList.Create),cRegister);

RegRegisterMethod(TThreadList,'Add',TypeInfo(_T288),[
TypeInfoPointer],Addr(TThreadList.Add));

RegRegisterMethod(TThreadList,'Clear',TypeInfo(_T289),NoParams,Addr(TThreadList.Clear));

RegRegisterMethod(TThreadList,'LockList',TypeInfo(_T290),[TypeInfo(TList)],Addr(TThreadList.LockList));

RegRegisterMethod(TThreadList,'Remove',TypeInfo(_T291),[
TypeInfoPointer],Addr(TThreadList.Remove));

RegRegisterMethod(TThreadList,'UnlockList',TypeInfo(_T292),NoParams,Addr(TThreadList.UnlockList));

RegRegisterMethod(TWriter,'WriteData',TypeInfo(_T293),[
TypeInfo(TComponent)], pointer(16));

RegRegisterMethod(TWriter,'Write',TypeInfo(_T294),[
TypeInfoUntyped,
TypeInfo(Longint)],Addr(TWriter.Write));

RegRegisterMethod(TWriter,'WriteBoolean',TypeInfo(_T295),[
TypeInfo(Boolean)],Addr(TWriter.WriteBoolean));

RegRegisterMethod(TWriter,'WriteCollection',TypeInfo(_T296),[
TypeInfo(TCollection)],Addr(TWriter.WriteCollection));

RegRegisterMethod(TWriter,'WriteComponent',TypeInfo(_T297),[
TypeInfo(TComponent)],Addr(TWriter.WriteComponent));

RegRegisterMethod(TWriter,'WriteChar',TypeInfo(_T298),[
TypeInfo(Char)],Addr(TWriter.WriteChar));

RegRegisterMethod(TWriter,'WriteDescendent',TypeInfo(_T299),[
TypeInfo(TComponent),
TypeInfo(TComponent)],Addr(TWriter.WriteDescendent));

RegRegisterMethod(TWriter,'WriteFloat',TypeInfo(_T300),[
TypeInfo(Extended)],Addr(TWriter.WriteFloat));

RegRegisterMethod(TWriter,'WriteSingle',TypeInfo(_T301),[
TypeInfo(Single)],Addr(TWriter.WriteSingle));

RegRegisterMethod(TWriter,'WriteCurrency',TypeInfo(_T302),[
TypeInfo(Currency)],Addr(TWriter.WriteCurrency));

RegRegisterMethod(TWriter,'WriteDate',TypeInfo(_T303),[
TypeInfo(TDateTime)],Addr(TWriter.WriteDate));

RegRegisterMethod(TWriter,'WriteIdent',TypeInfo(_T304),[
TypeInfo(string)],Addr(TWriter.WriteIdent));

RegRegisterMethod(TWriter,'WriteInteger',TypeInfo(_T305),[
TypeInfo(Longint)],Addr(TWriter.WriteInteger));

RegRegisterMethod(TWriter,'WriteListBegin',TypeInfo(_T306),NoParams,Addr(TWriter.WriteListBegin));

RegRegisterMethod(TWriter,'WriteListEnd',TypeInfo(_T307),NoParams,Addr(TWriter.WriteListEnd));

RegRegisterMethod(TWriter,'WriteRootComponent',TypeInfo(_T308),[
TypeInfo(TComponent)],Addr(TWriter.WriteRootComponent));

RegRegisterMethod(TWriter,'WriteSignature',TypeInfo(_T309),NoParams,Addr(TWriter.WriteSignature));

RegRegisterMethod(TWriter,'WriteStr',TypeInfo(_T310),[
TypeInfo(string)],Addr(TWriter.WriteStr));

RegRegisterMethod(TWriter,'WriteString',TypeInfo(_T311),[
TypeInfo(string)],Addr(TWriter.WriteString));

RegRegisterMethod(TWriter,'WriteWideString',TypeInfo(_T312),[
TypeInfo(WideString)],Addr(TWriter.WriteWideString));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'RegisterClass',mtProc,TypeInfo(_T4),[
TypeInfo(TPersistentClass)],Addr(RegisterClass),cRegister)}

{RegisterProc(nil,'RegisterClasses',mtProc,TypeInfo(_T5),[
ArrayInfo(TypeInfo(TPersistentClass))],Addr(RegisterClasses),cRegister)}

{RegisterProc(nil,'RegisterClassAlias',mtProc,TypeInfo(_T6),[
TypeInfo(TPersistentClass),
TypeInfo(string)],Addr(RegisterClassAlias),cRegister)}

{RegisterProc(nil,'UnRegisterClass',mtProc,TypeInfo(_T7),[
TypeInfo(TPersistentClass)],Addr(UnRegisterClass),cRegister)}

{RegisterProc(nil,'UnRegisterClasses',mtProc,TypeInfo(_T8),[
ArrayInfo(TypeInfo(TPersistentClass))],Addr(UnRegisterClasses),cRegister)}

{RegisterProc(nil,'FindClass',mtProc,TypeInfo(_T10),[
TypeInfo(string),TypeInfo(TPersistentClass)],Addr(FindClass),cRegister)}

{RegisterProc(nil,'GetClass',mtProc,TypeInfo(_T11),[
TypeInfo(string),TypeInfo(TPersistentClass)],Addr(GetClass),cRegister)}

{RegisterProc(nil,'RegisterComponents',mtProc,TypeInfo(_T12),[
TypeInfo(string),
ArrayInfo(TypeInfo(TComponentClass))],Addr(RegisterComponents),cRegister)}

{RegisterProc(nil,'RegisterNoIcon',mtProc,TypeInfo(_T13),[
ArrayInfo(TypeInfo(TComponentClass))],Addr(RegisterNoIcon),cRegister)}

{RegisterProc(nil,'RegisterNonActiveX',mtProc,TypeInfo(_T14),[
ArrayInfo(TypeInfo(TComponentClass)),
TypeInfo(TActiveXRegType)],Addr(RegisterNonActiveX),cRegister)}

{RegisterProc(nil,'RegisterIntegerConsts',mtProc,TypeInfo(_T15),[
TypeInfoPointer,
TypeInfo(TIdentToInt),
TypeInfo(TIntToIdent)],Addr(RegisterIntegerConsts),cRegister)}

{RegisterProc(nil,'FindIntToIdent',mtProc,TypeInfo(_T18),[
TypeInfoPointer,TypeInfo(TIntToIdent)],Addr(FindIntToIdent),cRegister)}

{RegisterProc(nil,'FindIdentToInt',mtProc,TypeInfo(_T19),[
TypeInfoPointer,TypeInfo(TIdentToInt)],Addr(FindIdentToInt),cRegister)}

{RegisterProc(nil,'InitInheritedComponent',mtProc,TypeInfo(_T20),[
TypeInfo(TComponent),
TypeInfo(TClass),TypeInfo(Boolean)],Addr(InitInheritedComponent),cRegister)}

{RegisterProc(nil,'LineStart',mtProc,TypeInfo(_T42),[
TypeInfoPChar,
TypeInfoPChar,TypeInfoPChar],Addr(LineStart),cRegister)}

{RegisterProc(nil,'ExtractStrings',mtProc,TypeInfo(_T43),[
TypeInfo(TSysCharSet),
TypeInfo(TSysCharSet),
TypeInfoPChar,
TypeInfo(TStrings),TypeInfo(Integer)],Addr(ExtractStrings),cRegister)}

{RegisterProc(nil,'BinToHex',mtProc,TypeInfo(_T44),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(Integer)],Addr(BinToHex),cRegister)}

{RegisterProc(nil,'HexToBin',mtProc,TypeInfo(_T45),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(Integer),TypeInfo(Integer)],Addr(HexToBin),cRegister)}

{RegisterProc(nil,'FindRootDesigner',mtProc,TypeInfo(_T46),[
TypeInfo(TPersistent),TypeInfo(IDesignerNotify)],Addr(FindRootDesigner),cRegister)}

{RegRegisterMethod(TBasicAction,'SetOnExecute',TypeInfo(_T48),[
TypeInfo(TNotifyEvent)], pointer(52))}

{RegRegisterMethod(TBasicActionLink,'SetOnExecute',TypeInfo(_T60),[
TypeInfo(TNotifyEvent)], pointer(16))}

{RegisterProc(TCollection,'Create',mtConstructor,TypeInfo(_T70),[
TypeInfo(TCollectionItemClass)],Addr(TCollection.Create),cRegister)}

{RegRegisterMethod(TComponent,'GetChildren',TypeInfo(_T82),[
TypeInfo(TGetChildProc),
TypeInfo(TComponent)], pointer(MinVMTOffset - 2))}

{RegRegisterMethod(TFiler,'DefineProperty',TypeInfo(_T116),[
TypeInfo(string),
TypeInfo(TReaderProc),
TypeInfo(TWriterProc),
TypeInfo(Boolean)], pointer(4))}

{RegRegisterMethod(TFiler,'DefineBinaryProperty',TypeInfo(_T117),[
TypeInfo(string),
TypeInfo(TStreamProc),
TypeInfo(TStreamProc),
TypeInfo(Boolean)], pointer(8))}

{RegRegisterMethod(TInterfaceList,'First',TypeInfo(_T126),[TypeInfo(IUnknown)],Addr(TInterfaceList.First))}

{RegRegisterMethod(TInterfaceList,'IndexOf',TypeInfo(_T127),[
TypeInfo(IUnknown),TypeInfo(Integer)],Addr(TInterfaceList.IndexOf))}

{RegRegisterMethod(TInterfaceList,'Add',TypeInfo(_T128),[
TypeInfo(IUnknown),TypeInfo(Integer)],Addr(TInterfaceList.Add))}

{RegRegisterMethod(TInterfaceList,'Insert',TypeInfo(_T129),[
TypeInfo(Integer),
TypeInfo(IUnknown)],Addr(TInterfaceList.Insert))}

{RegRegisterMethod(TInterfaceList,'Last',TypeInfo(_T130),[TypeInfo(IUnknown)],Addr(TInterfaceList.Last))}

{RegRegisterMethod(TInterfaceList,'Remove',TypeInfo(_T131),[
TypeInfo(IUnknown),TypeInfo(Integer)],Addr(TInterfaceList.Remove))}

{RegRegisterMethod(TList,'Sort',TypeInfo(_T150),[
TypeInfo(TListSortCompare)],Addr(TList.Sort))}

{RegisterProc(TOwnedCollection,'Create',mtConstructor,TypeInfo(_T155),[
TypeInfo(TPersistent),
TypeInfo(TCollectionItemClass)],Addr(TOwnedCollection.Create),cRegister)}

{RegRegisterMethod(TParser,'TokenInt',TypeInfo(_T167),[TypeInfo(Int64)],Addr(TParser.TokenInt))}

{RegRegisterMethod(TReader,'FindAncestorComponent',TypeInfo(_T177),[
TypeInfo(string),
TypeInfo(TPersistentClass),TypeInfo(TComponent)], pointer(20))}

{RegRegisterMethod(TReader,'ReadComponents',TypeInfo(_T192),[
TypeInfo(TComponent),
TypeInfo(TComponent),
TypeInfo(TReadComponentsProc)],Addr(TReader.ReadComponents))}

{RegRegisterMethod(TReader,'ReadInt64',TypeInfo(_T199),[TypeInfo(Int64)],Addr(TReader.ReadInt64))}

{RegisterProc(TResourceStream,'Create',mtConstructor,TypeInfo(_T210),[
TypeInfo(THandle),
TypeInfo(string),
TypeInfoPChar],Addr(TResourceStream.Create),cRegister)}

{RegisterProc(TResourceStream,'CreateFromID',mtConstructor,TypeInfo(_T211),[
TypeInfo(THandle),
TypeInfo(Integer),
TypeInfoPChar],Addr(TResourceStream.CreateFromID),cRegister)}

{RegisterProc(TStreamAdapter,'Seek',mtMethod,TypeInfo(_T231),[
TypeInfo(Largeint),
TypeInfo(Longint),
TypeInfo(Largeint),TypeInfo(HResult)], pointer(8),cStdCall)}

{RegisterProc(TStreamAdapter,'SetSize',mtMethod,TypeInfo(_T232),[
TypeInfo(Largeint),TypeInfo(HResult)], pointer(12),cStdCall)}

{RegisterProc(TStreamAdapter,'CopyTo',mtMethod,TypeInfo(_T233),[
TypeInfo(IStream),
TypeInfo(Largeint),
TypeInfo(Largeint),
TypeInfo(Largeint),TypeInfo(HResult)], pointer(16),cStdCall)}

{RegisterProc(TStreamAdapter,'LockRegion',mtMethod,TypeInfo(_T236),[
TypeInfo(Largeint),
TypeInfo(Largeint),
TypeInfo(Longint),TypeInfo(HResult)], pointer(28),cStdCall)}

{RegisterProc(TStreamAdapter,'UnlockRegion',mtMethod,TypeInfo(_T237),[
TypeInfo(Largeint),
TypeInfo(Largeint),
TypeInfo(Longint),TypeInfo(HResult)], pointer(32),cStdCall)}

{RegisterProc(TStreamAdapter,'Clone',mtMethod,TypeInfo(_T239),[
TypeInfo(IStream),TypeInfo(HResult)], pointer(40),cStdCall)}

{RegRegisterMethod(TStringList,'CustomSort',TypeInfo(_T244),[
TypeInfo(TStringListSortCompare)], pointer(128))}

{RegRegisterMethod(TStrings,'SetText',TypeInfo(_T276),[
TypeInfoPChar], pointer(108))}

{RegisterEvent(TypeInfo(TAncestorNotFoundEvent),[
TypeInfo(TReader),
TypeInfo(string),
TypeInfo(TPersistentClass),
TypeInfo(TComponent)]);}

{RegisterEvent(TypeInfo(TCreateComponentEvent),[
TypeInfo(TReader),
TypeInfo(TComponentClass),
TypeInfo(TComponent)]);}

RegisterEvent(TypeInfo(TFindAncestorEvent),[
TypeInfo(TWriter),
TypeInfo(TComponent),
TypeInfo(string),
TypeInfo(TComponent),
TypeInfo(TComponent)]);

{RegisterEvent(TypeInfo(TFindComponentClassEvent),[
TypeInfo(TReader),
TypeInfo(string),
TypeInfo(TComponentClass)]);}

RegisterEvent(TypeInfo(TFindMethodEvent),[
TypeInfo(TReader),
TypeInfo(string),
TypeInfoPointer,
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TGetChildProc),[
TypeInfo(TComponent)]);

RegisterEvent(TypeInfo(TGetModuleProc),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(string),
TypeInfo(string),
TypeInfo(TStrings)]);

RegisterEvent(TypeInfo(TGetStrProc),[
TypeInfo(string)]);

RegisterEvent(TypeInfo(THelpEvent),[
TypeInfo(Word),
TypeInfo(Longint),
TypeInfo(Boolean),TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TNotifyEvent),[
TypeInfo(TObject)]);

RegisterEvent(TypeInfo(TReadComponentsProc),[
TypeInfo(TComponent)]);

RegisterEvent(TypeInfo(TReaderError),[
TypeInfo(TReader),
TypeInfo(string),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TReaderProc),[
TypeInfo(TReader)]);

RegisterEvent(TypeInfo(TReferenceNameEvent),[
TypeInfo(TReader),
TypeInfo(string)]);

RegisterEvent(TypeInfo(TSetNameEvent),[
TypeInfo(TReader),
TypeInfo(TComponent),
TypeInfo(string)]);

RegisterEvent(TypeInfo(TStreamProc),[
TypeInfo(TStream)]);

RegisterEvent(TypeInfo(TThreadMethod),NoParams);

RegisterEvent(TypeInfo(TWriterProc),[
TypeInfo(TWriter)]);

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
