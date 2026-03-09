{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit CLASSES_D6;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  Types,
  dcscript,
  dcsystem,
  dcdreamlib,
  Windows,
  Messages,
  SysUtils,
  Variants,
  TypInfo,
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
type __TSmallPoint__Wrapper = class(TDCRecordWrapper)
private
fR : TSmallPoint;
public
function GetRecordPtr : pointer; override;
published
procedure setX(const val : SmallInt);
function getX : SmallInt;
property X : SmallInt read getX write setX;
procedure setY(const val : SmallInt);
function getY : SmallInt;
property Y : SmallInt read getY write setY;
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

_T2 = function (const p0 : IDispatch;
const p1 : IDispatch): Boolean of object;

_T3 = function (p0 : Integer;
p1 : Integer): Boolean of object;

_T4 = function (p0 : Integer;
p1 : Integer;
p2 : Integer;
p3 : Integer): IDispatch of object;

_T5 = _T4;

{_T6 = procedure (p0 : TPersistentClass) of object;}

{_T7 = procedure (p0 : Array of TPersistentClass) of object;}

{_T8 = procedure (p0 : TPersistentClass;
const p1 : string) of object;}

{_T9 = procedure (p0 : TPersistentClass) of object;}

{_T10 = procedure (p0 : Array of TPersistentClass) of object;}

_T11 = procedure (p0 : HMODULE) of object;

{_T12 = function (const p0 : string): TPersistentClass of object;}

{_T13 = function (const p0 : string): TPersistentClass of object;}

{_T14 = procedure (p0 : TPersistentClass) of object;}

{_T15 = procedure (p0 : TPersistentClass;
p1 : TPersistentClass) of object;}

{_T16 = function (p0 : TPersistentClass): TPersistentClass of object;}

{_T17 = function (p0 : TPersistentClass): TPersistentClass of object;}

{_T18 = procedure (const p0 : string;
p1 : Array of TComponentClass) of object;}

{_T19 = procedure (p0 : Array of TComponentClass) of object;}

{_T20 = procedure (p0 : Array of TComponentClass;
p1 : TActiveXRegType) of object;}

{_T21 = procedure (p0 : Pointer;
p1 : TIdentToInt;
p2 : TIntToIdent) of object;}

{_T22 = procedure (p0 : Pointer;
p1 : TIdentToInt;
p2 : TIntToIdent) of object;}

{_T23 = procedure (p0 : TFindGlobalComponent) of object;}

{_T24 = procedure (p0 : TFindGlobalComponent) of object;}

_T25 = function (const p0 : string): TComponent of object;

_T26 = function (const p0 : string): Boolean of object;

_T27 = function (const p0 : string;
var p1 : Longint;
const p2 : IDispatch): Boolean of object;

_T28 = function (p0 : Longint;
var p1 : string;
const p2 : IDispatch): Boolean of object;

{_T29 = function (p0 : Pointer): TIntToIdent of object;}

{_T30 = function (p0 : Pointer): TIdentToInt of object;}

{_T31 = function (p0 : TComponent;
p1 : TClass): Boolean of object;}

_T32 = function (const p0 : string;
p1 : TComponent): Boolean of object;

_T33 = function (const p0 : string;
p1 : TComponent): TComponent of object;

_T34 = function (p0 : THandle;
const p1 : string): TComponent of object;

_T35 = _T33;

_T36 = procedure (const p0 : string;
p1 : TComponent) of object;

_T37 = procedure  of object;

_T38 = procedure (p0 : TComponent;
p1 : TStrings) of object;

_T39 = procedure (p0 : TComponent;
const p1 : string;
p2 : TStrings) of object;

_T40 = procedure (p0 : TComponent;
const p1 : string;
const p2 : string) of object;

_T41 = procedure (p0 : TComponent;
const p1 : string) of object;

_T42 = procedure (p0 : TPersistent) of object;

_T43 = function (p0 : TComponent;
const p1 : string): TComponent of object;

_T44 = _T37;

_T45 = _T37;

_T46 = _T37;

_T47 = function (p0 : TCollection;
p1 : TCollection;
p2 : TComponent;
p3 : TComponent): Boolean of object;

_T48 = function (p0 : TCollectionItem): TPersistent of object;

_T49 = procedure (p0 : TStream;
p1 : TStream) of object;

_T50 = _T49;

_T51 = _T49;

_T52 = _T49;

_T53 = function (p0 : TStream): TStreamOriginalFormat of object;

{_T54 = function (p0 : PChar;
p1 : PChar): PChar of object;}

{_T55 = function (p0 : TSysCharSet;
p1 : TSysCharSet;
p2 : PChar;
p3 : TStrings): Integer of object;}

{_T56 = procedure (p0 : PChar;
p1 : PChar;
p2 : Integer) of object;}

{_T57 = function (p0 : PChar;
p1 : PChar;
p2 : Integer): Integer of object;}

{_T58 = function (p0 : TPersistent): IDesignerNotify of object;}

{_T59 = function (p0 : TClass;
p1 : TClass): Integer of object;}

_T60 = function : Boolean of object;

{_T61 = function (p0 : TWndMethod): Pointer of object;}

_T62 = procedure (p0 : Pointer) of object;

{_T63 = function (p0 : TWndMethod): HWND of object;}

_T64 = procedure (p0 : HWND) of object;

_T65 = _T37;

{_T66 = procedure (p0 : TNotifyEvent) of object;}

_T67 = function (p0 : TObject): Boolean of object;

_T68 = procedure (p0 : TObject) of object;

_T69 = _T68;

_T70 = _T60;

_T71 = procedure (p0 : TBasicActionLink) of object;

_T72 = _T71;

_T73 = _T60;

_T74 = _T68;

_T75 = _T37;

_T76 = _T60;

_T77 = procedure (p0 : TBasicAction) of object;

{_T78 = procedure (p0 : TNotifyEvent) of object;}

_T79 = _T68;

_T80 = function (p0 : TComponent): Boolean of object;

_T81 = _T60;

_T82 = function : Integer of object;

{_T83 = procedure (p0 : TPersistentClass;
p1 : Boolean) of object;}

{_T84 = function (const p0 : string): TPersistentClass of object;}

{_T85 = procedure (p0 : TGetClass) of object;}

_T86 = procedure (var p0 : TCollectionItem) of object;

_T87 = procedure (p0 : TCollectionItem) of object;

_T88 = procedure (p0 : TCollectionItem;
p1 : TCollectionNotification) of object;

_T89 = _T82;

_T90 = function (p0 : Integer): string of object;

_T91 = function (p0 : Integer;
p1 : Integer): string of object;

_T92 = _T87;

_T93 = _T87;

{_T94 = procedure (p0 : TCollectionItemClass) of object;}

_T95 = function : TPersistent of object;

_T96 = function : TCollectionItem of object;

_T97 = _T37;

_T98 = _T37;

_T99 = procedure (p0 : Integer) of object;

_T100 = _T37;

_T101 = function (p0 : Integer): TCollectionItem of object;

_T102 = _T101;

_T103 = function : string of object;

_T104 = procedure (p0 : TCollection) of object;

_T105 = _T99;

_T106 = procedure (const p0 : string) of object;

_T107 = _T104;

{_T108 = procedure (p0 : TGetChildProc;
p1 : TComponent) of object;}

_T109 = function : TComponent of object;

_T110 = _T109;

_T111 = _T37;

_T112 = procedure (p0 : TComponent;
p1 : TOperation) of object;

_T113 = _T37;

_T114 = procedure (p0 : TReader) of object;

_T115 = procedure (const p0 : TComponentName) of object;

_T116 = procedure (p0 : TComponent;
p1 : Integer) of object;

_T117 = procedure (p0 : TComponent) of object;

_T118 = _T37;

_T119 = _T37;

_T120 = procedure (p0 : Boolean;
const p1 : string;
const p2 : string) of object;

_T121 = _T40;

_T122 = _T117;

_T123 = _T117;

_T124 = procedure (p0 : TWriter) of object;

_T125 = function (const p0 : IDispatch;
out p1): HResult of object;

_T126 = _T117;

_T127 = _T37;

_T128 = _T37;

_T129 = function (p0 : TBasicAction): Boolean of object;

_T130 = _T25;

_T131 = _T117;

_T132 = _T117;

_T133 = _T37;

_T134 = _T109;

_T135 = _T60;

_T136 = _T117;

_T137 = _T117;

_T138 = procedure (p0 : Boolean) of object;

_T139 = _T129;

{_T140 = function (const p0 : IInterface): Boolean of object;}

{_T141 = function (const p0 : IInterface;
p1 : TOperation): Boolean of object;}

_T142 = procedure (p0 : TStream) of object;

_T143 = _T106;

_T144 = _T37;

_T145 = _T37;

_T146 = _T60;

_T147 = _T116;

_T148 = _T117;

_T149 = procedure (p0 : TStream;
p1 : Integer) of object;

{_T150 = procedure (const p0 : string;
p1 : TReaderProc;
p2 : TWriterProc;
p3 : Boolean) of object;}

{_T151 = procedure (const p0 : string;
p1 : TStreamProc;
p2 : TStreamProc;
p3 : Boolean) of object;}

_T152 = _T37;

_T153 = procedure (const p0 : string;
p1 : Word) of object;

_T154 = _T99;

_T155 = _T125;

_T156 = _T37;

_T157 = _T37;

_T158 = _T99;

_T159 = procedure (p0 : Integer;
p1 : Integer) of object;

_T160 = function : TInterfaceList of object;

{_T161 = function : IInterface of object;}

{_T162 = function (const p0 : IInterface): Integer of object;}

{_T163 = function (const p0 : IInterface): Integer of object;}

{_T164 = procedure (p0 : Integer;
const p1 : IInterface) of object;}

{_T165 = function : IInterface of object;}

{_T166 = function (const p0 : IInterface): Integer of object;}

_T167 = _T37;

_T168 = _T37;

_T169 = _T37;

_T170 = procedure (p0 : Pointer;
p1 : TListNotification) of object;

_T171 = function (p0 : Pointer): Integer of object;

_T172 = _T37;

_T173 = _T99;

_T174 = procedure (const p0 : string;
p1 : Integer) of object;

_T175 = _T159;

_T176 = function : TList of object;

_T177 = function (p0 : Pointer): Pointer of object;

_T178 = function : Pointer of object;

_T179 = _T171;

_T180 = procedure (p0 : Integer;
p1 : Pointer) of object;

_T181 = _T178;

_T182 = _T159;

_T183 = _T171;

_T184 = _T37;

{_T185 = procedure (p0 : TListSortCompare) of object;}

_T186 = procedure (p0 : TList;
p1 : TListAssignOp;
p2 : TList) of object;

_T187 = function (var p0 : Longint): Pointer of object;

_T188 = _T37;

_T189 = _T142;

_T190 = _T106;

{_T191 = procedure (p0 : TPersistent;
p1 : TCollectionItemClass) of object;}

_T192 = _T142;

_T193 = procedure (p0 : Char) of object;

_T194 = _T106;

_T195 = _T106;

_T196 = procedure (const p0 : string;
const p1 : Array of Const) of object;

_T197 = _T106;

_T198 = _T142;

_T199 = function : Char of object;

_T200 = function : Longint of object;

_T201 = _T103;

_T202 = function : Extended of object;

{_T203 = function : Int64 of object;}

_T204 = _T103;

_T205 = function : WideString of object;

_T206 = _T26;

_T207 = _T42;

_T208 = procedure (p0 : TFiler) of object;

_T209 = _T95;

_T210 = _T42;

_T211 = _T103;

_T212 = _T26;

{_T213 = function (const p0 : string;
p1 : TPersistentClass): TComponent of object;}

_T214 = function (p0 : TComponent;
const p1 : string): Pointer of object;

_T215 = procedure (p0 : TComponent;
var p1 : string) of object;

_T216 = procedure (var p0 : string) of object;

_T217 = _T37;

_T218 = procedure (p0 : TValueType) of object;

_T219 = _T60;

_T220 = _T37;

_T221 = _T37;

_T222 = function : TValueType of object;

_T223 = procedure (var p0;
p1 : Longint) of object;

_T224 = _T60;

_T225 = _T199;

_T226 = _T104;

_T227 = function (p0 : TComponent): TComponent of object;

{_T228 = procedure (p0 : TComponent;
p1 : TComponent;
p2 : TReadComponentsProc) of object;}

_T229 = _T202;

_T230 = function : Single of object;

_T231 = function : Currency of object;

_T232 = function : TDateTime of object;

_T233 = _T103;

_T234 = _T200;

{_T235 = function : Int64 of object;}

_T236 = _T37;

_T237 = _T37;

_T238 = procedure (var p0 : TFilerFlags;
var p1 : Integer) of object;

_T239 = _T227;

_T240 = _T37;

_T241 = _T103;

_T242 = _T103;

_T243 = _T205;

_T244 = _T222;

_T245 = function : Variant of object;

_T246 = _T124;

_T247 = _T37;

_T248 = procedure (p0 : TPersistent;
p1 : TPersistent) of object;

_T249 = _T37;

_T250 = _T37;

{_T251 = procedure (p0 : THandle;
const p1 : string;
p2 : PChar) of object;}

{_T252 = procedure (p0 : THandle;
p1 : Integer;
p2 : PChar) of object;}

_T253 = procedure (p0 : Longint) of object;

_T254 = function (var p0;
p1 : Longint): Longint of object;

_T255 = function (const p0;
p1 : Longint): Longint of object;

_T256 = function (p0 : Longint;
p1 : Word): Longint of object;

_T257 = _T223;

_T258 = procedure (const p0;
p1 : Longint) of object;

{_T259 = function (p0 : TStream;
p1 : Int64): Int64 of object;}

_T260 = _T227;

_T261 = _T227;

_T262 = _T117;

_T263 = _T36;

_T264 = procedure (p0 : TComponent;
p1 : TComponent) of object;

_T265 = procedure (const p0 : string;
p1 : TComponent;
p2 : TComponent) of object;

_T266 = procedure (const p0 : string;
out p1 : Integer) of object;

_T267 = _T99;

_T268 = _T37;

_T269 = procedure (p0 : TStream;
p1 : TStreamOwnership) of object;

_T270 = function (p0 : Pointer;
p1 : Longint;
p2 : PLongint): HResult of object;

_T271 = _T270;

{_T272 = function (p0 : Largeint;
p1 : Longint;
out p2 : Largeint): HResult of object;}

{_T273 = function (p0 : Largeint): HResult of object;}

{_T274 = function (p0 : IStream;
p1 : Largeint;
out p2 : Largeint;
out p3 : Largeint): HResult of object;}

_T275 = function (p0 : Longint): HResult of object;

_T276 = function : HResult of object;

{_T277 = function (p0 : Largeint;
p1 : Largeint;
p2 : Longint): HResult of object;}

{_T278 = function (p0 : Largeint;
p1 : Largeint;
p2 : Longint): HResult of object;}

{_T280 = function (out p0 : IStream): HResult of object;}

_T281 = _T37;

_T282 = _T37;

_T283 = procedure (p0 : Integer;
const p1 : string;
p2 : TObject) of object;

_T284 = function (const p0 : string;
var p1 : Integer): Boolean of object;

_T285 = _T37;

{_T286 = procedure (p0 : TStringListSortCompare) of object;}

_T287 = _T90;

_T288 = _T82;

_T289 = _T82;

_T290 = function (p0 : Integer): TObject of object;

_T291 = _T103;

_T292 = procedure (p0 : Integer;
const p1 : string) of object;

_T293 = procedure (p0 : Integer;
p1 : TObject) of object;

_T294 = _T99;

_T295 = _T106;

_T296 = _T138;

_T297 = function (const p0 : string;
const p1 : string): Integer of object;

_T298 = function (const p0 : string): Integer of object;

_T299 = function (const p0 : string;
p1 : TObject): Integer of object;

_T300 = _T106;

_T301 = procedure (p0 : TStrings) of object;

_T302 = _T37;

_T303 = _T37;

_T304 = _T99;

_T305 = _T37;

_T306 = function (p0 : TStrings): Boolean of object;

_T307 = _T159;

_T308 = function : PChar of object;

_T309 = _T298;

_T310 = _T298;

_T311 = function (p0 : TObject): Integer of object;

_T312 = _T292;

_T313 = _T283;

_T314 = _T106;

_T315 = _T142;

_T316 = _T159;

_T317 = _T106;

_T318 = _T142;

{_T319 = procedure (p0 : PChar) of object;}

_T320 = _T106;

_T321 = function (p0 : Longint): string of object;

_T322 = _T106;

_T323 = _T37;

_T324 = _T37;

_T325 = _T138;

_T326 = _T37;

_T327 = _T37;

_T328 = _T37;

_T329 = function : LongWord of object;

_T330 = _T37;

_T331 = _T62;

_T332 = _T37;

_T333 = _T176;

_T334 = _T62;

_T335 = _T37;

_T336 = _T117;

_T337 = _T258;

_T338 = _T138;

_T339 = _T104;

_T340 = _T117;

_T341 = _T193;

_T342 = _T264;

_T343 = procedure (const p0 : Extended) of object;

_T344 = procedure (const p0 : Single) of object;

_T345 = procedure (const p0 : Currency) of object;

_T346 = procedure (const p0 : TDateTime) of object;

_T347 = _T106;

_T348 = _T253;

_T349 = _T37;

_T350 = _T37;

_T351 = _T117;

_T352 = _T37;

_T353 = _T106;

_T354 = _T106;

_T355 = procedure (const p0 : WideString) of object;

_T356 = procedure (const p0 : Variant) of object;

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
function __TSmallPoint__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TSmallPoint__Wrapper.setX(const val : SmallInt);
begin
TSmallPoint(GetRecordPtr^).X := val;
end;
function __TSmallPoint__Wrapper.getX : SmallInt;
begin
result := TSmallPoint(GetRecordPtr^).X;
end;
procedure __TSmallPoint__Wrapper.setY(const val : SmallInt);
begin
TSmallPoint(GetRecordPtr^).Y := val;
end;
function __TSmallPoint__Wrapper.getY : SmallInt;
begin
result := TSmallPoint(GetRecordPtr^).Y;
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

function ____PointsEqual__Wrapper(const p0 : IDispatch;
const p1 : IDispatch): Boolean;
var
__p0 : ^TPoint;
__i0 : IDispatch;
__p1 : ^TPoint;
__i1 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
result := PointsEqual(__p0^,__p1^);
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

function __TBasicActionLink__Execute__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList) : OleVariant;
begin
case cArgs of
0:
begin
result := TBasicActionLink(__Instance).Execute;
end;
1:
begin
result := TBasicActionLink(__Instance).Execute(TComponent(VarToObject(OleVariant(pargs^[0]))));
end;
end
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

function __TInterfacedPersistent__QueryInterface__Wrapper(__Instance : TInterfacedPersistent;
const p0 : IDispatch;
out p1): HResult;
var
__p0 : ^TGUID;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := TInterfacedPersistent(__Instance).QueryInterface(__p0^,p1);
end;

procedure __TList__Assign__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
1:
begin
TList(__Instance).Assign(TList(VarToObject(OleVariant(pargs^[0]))));
end;
2:
begin
TList(__Instance).Assign(TList(VarToObject(OleVariant(pargs^[1]))),OleVariant(pargs^[0]));
end;
3:
begin
TList(__Instance).Assign(TList(VarToObject(OleVariant(pargs^[2]))),OleVariant(pargs^[1]),TList(VarToObject(OleVariant(pargs^[0]))));
end;
end
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
function __DC__GetTBasicAction__ActionComponent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TBasicAction(Instance).ActionComponent);
end;

procedure __DC__SetTBasicAction__ActionComponent(Instance : TObject; Params : PVariantArgList);
begin
TBasicAction(Instance).ActionComponent:=TComponent(VarToObject(OleVariant(Params^[0])));
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

function __DC__GetTDataModule__DesignOffset(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TPoint__Wrapper;
begin
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := TDataModule(Instance).DesignOffset;
result := IUnknown(__wrapper) as IDispatch;
end;

procedure __DC__SetTDataModule__DesignOffset(Instance : TObject; Params : PVariantArgList);
var
__idisp:IDispatch;
__iwrapper:IDCRecordWrapper;
begin
__idisp:=DCVarToInterface(OleVariant(Params^[0]));
if __idisp=nil then exit;
__idisp.QueryInterface(IDCRecordWrapper, __iwrapper);
TDataModule(Instance).DesignOffset:=TPoint(__iwrapper.GetRecordPtr^);
end;

function __DC__GetTDataModule__DesignSize(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TPoint__Wrapper;
begin
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := TDataModule(Instance).DesignSize;
result := IUnknown(__wrapper) as IDispatch;
end;

procedure __DC__SetTDataModule__DesignSize(Instance : TObject; Params : PVariantArgList);
var
__idisp:IDispatch;
__iwrapper:IDCRecordWrapper;
begin
__idisp:=DCVarToInterface(OleVariant(Params^[0]));
if __idisp=nil then exit;
__idisp.QueryInterface(IDCRecordWrapper, __iwrapper);
TDataModule(Instance).DesignSize:=TPoint(__iwrapper.GetRecordPtr^);
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

function __DC__GetTRecall__Reference(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TRecall(Instance).Reference);
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

function __DC__GetTStringList__CaseSensitive(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStringList(Instance).CaseSensitive;
end;

procedure __DC__SetTStringList__CaseSensitive(Instance : TObject; Params : PVariantArgList);
begin
TStringList(Instance).CaseSensitive:=OleVariant(Params^[0]);
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

function __DC__GetTStrings__Delimiter(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStrings(Instance).Delimiter;
end;

procedure __DC__SetTStrings__Delimiter(Instance : TObject; Params : PVariantArgList);
begin
TStrings(Instance).Delimiter:=VarToChar(OleVariant(Params^[0]));
end;

function __DC__GetTStrings__DelimitedText(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStrings(Instance).DelimitedText;
end;

procedure __DC__SetTStrings__DelimitedText(Instance : TObject; Params : PVariantArgList);
begin
TStrings(Instance).DelimitedText:=OleVariant(Params^[0]);
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

function __DC__GetTStrings__QuoteChar(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStrings(Instance).QuoteChar;
end;

procedure __DC__SetTStrings__QuoteChar(Instance : TObject; Params : PVariantArgList);
begin
TStrings(Instance).QuoteChar:=VarToChar(OleVariant(Params^[0]));
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

function __DC__GetTThread__FatalException(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TThread(Instance).FatalException);
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

function __DC__GetTWriter__UseQualifiedNames(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWriter(Instance).UseQualifiedNames;
end;

procedure __DC__SetTWriter__UseQualifiedNames(Instance : TObject; Params : PVariantArgList);
begin
TWriter(Instance).UseQualifiedNames:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
RegisterProperty(TBasicAction,'ActionComponent',__DC__GetTBasicAction__ActionComponent,__DC__SetTBasicAction__ActionComponent);
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
RegisterProperty(TDataModule,'DesignOffset',__DC__GetTDataModule__DesignOffset,__DC__SetTDataModule__DesignOffset);
RegisterProperty(TDataModule,'DesignSize',__DC__GetTDataModule__DesignSize,__DC__SetTDataModule__DesignSize);
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
RegisterProperty(TRecall,'Reference',__DC__GetTRecall__Reference,nil);
RegisterProperty(TStreamAdapter,'Stream',__DC__GetTStreamAdapter__Stream,nil);
RegisterProperty(TStreamAdapter,'StreamOwnership',__DC__GetTStreamAdapter__StreamOwnership,__DC__SetTStreamAdapter__StreamOwnership);
RegisterProperty(TStringList,'Duplicates',__DC__GetTStringList__Duplicates,__DC__SetTStringList__Duplicates);
RegisterProperty(TStringList,'Sorted',__DC__GetTStringList__Sorted,__DC__SetTStringList__Sorted);
RegisterProperty(TStringList,'CaseSensitive',__DC__GetTStringList__CaseSensitive,__DC__SetTStringList__CaseSensitive);
RegisterProperty(TStrings,'Capacity',__DC__GetTStrings__Capacity,__DC__SetTStrings__Capacity);
RegisterProperty(TStrings,'CommaText',__DC__GetTStrings__CommaText,__DC__SetTStrings__CommaText);
RegisterProperty(TStrings,'Count',__DC__GetTStrings__Count,nil);
RegisterProperty(TStrings,'Delimiter',__DC__GetTStrings__Delimiter,__DC__SetTStrings__Delimiter);
RegisterProperty(TStrings,'DelimitedText',__DC__GetTStrings__DelimitedText,__DC__SetTStrings__DelimitedText);
RegisterIndexedProperty(TStrings,'Names',1,False,__DC__GetTStrings__Names,nil);
RegisterIndexedProperty(TStrings,'Objects',1,False,__DC__GetTStrings__Objects,__DC__SetTStrings__Objects);
RegisterProperty(TStrings,'QuoteChar',__DC__GetTStrings__QuoteChar,__DC__SetTStrings__QuoteChar);
RegisterIndexedProperty(TStrings,'Values',1,False,__DC__GetTStrings__Values,__DC__SetTStrings__Values);
RegisterIndexedProperty(TStrings,'Strings',1,True,__DC__GetTStrings__Strings,__DC__SetTStrings__Strings);
RegisterProperty(TStrings,'Text',__DC__GetTStrings__Text,__DC__SetTStrings__Text);
RegisterProperty(TStringStream,'DataString',__DC__GetTStringStream__DataString,nil);
RegisterProperty(TThread,'FatalException',__DC__GetTThread__FatalException,nil);
RegisterProperty(TThread,'FreeOnTerminate',__DC__GetTThread__FreeOnTerminate,__DC__SetTThread__FreeOnTerminate);
RegisterProperty(TThread,'Handle',__DC__GetTThread__Handle,nil);
RegisterProperty(TThread,'Priority',__DC__GetTThread__Priority,__DC__SetTThread__Priority);
RegisterProperty(TThread,'Suspended',__DC__GetTThread__Suspended,__DC__SetTThread__Suspended);
RegisterProperty(TThread,'ThreadID',__DC__GetTThread__ThreadID,nil);
RegisterProperty(TThreadList,'Duplicates',__DC__GetTThreadList__Duplicates,__DC__SetTThreadList__Duplicates);
RegisterProperty(TWriter,'Position',__DC__GetTWriter__Position,__DC__SetTWriter__Position);
RegisterProperty(TWriter,'RootAncestor',__DC__GetTWriter__RootAncestor,__DC__SetTWriter__RootAncestor);
RegisterProperty(TWriter,'UseQualifiedNames',__DC__GetTWriter__UseQualifiedNames,__DC__SetTWriter__UseQualifiedNames);
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

const __ConstNames0 : array[0..105] of string = (
'MaxListSize'
,'soFromBeginning'
,'soFromCurrent'
,'soFromEnd'
,'soBeginning'
,'soCurrent'
,'soEnd'
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
,'htKeyword'
,'htContext'
,'dupIgnore'
,'dupAccept'
,'dupError'
,'lnAdded'
,'lnExtracted'
,'lnDeleted'
,'laCopy'
,'laAnd'
,'laOr'
,'laXor'
,'laSrcUnique'
,'laDestUnique'
,'cnAdded'
,'cnExtracting'
,'cnDeleting'
,'sdDelimiter'
,'sdQuoteChar'
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
,'vaUTF8String'
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
,'csSubComponent'
,'csTransient'
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
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,soBeginning));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,soCurrent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,soEnd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,fmCreate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,toEOF));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,toSymbol));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,toString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,toInteger));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,toFloat));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,toWString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,scShift));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,scCtrl));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,scAlt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,scNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,taLeftJustify));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,taRightJustify));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,taCenter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,bdLeftToRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,bdRightToLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,bdRightToLeftNoAlign));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,bdRightToLeftReadingOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,ssShift));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,ssAlt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,ssCtrl));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,ssLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,ssRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,ssMiddle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,ssDouble));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,htKeyword));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,htContext));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,dupIgnore));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,dupAccept));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,dupError));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,lnAdded));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,lnExtracted));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,lnDeleted));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,laCopy));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,laAnd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,laOr));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,laXor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,laSrcUnique));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,laDestUnique));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,cnAdded));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,cnExtracting));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[48] ,cnDeleting));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[49] ,sdDelimiter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[50] ,sdQuoteChar));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[51] ,soReference));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[52] ,soOwned));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[53] ,vaNull));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[54] ,vaList));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[55] ,vaInt8));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[56] ,vaInt16));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[57] ,vaInt32));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[58] ,vaExtended));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[59] ,vaString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[60] ,vaIdent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[61] ,vaFalse));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[62] ,vaTrue));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[63] ,vaBinary));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[64] ,vaSet));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[65] ,vaLString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[66] ,vaNil));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[67] ,vaCollection));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[68] ,vaSingle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[69] ,vaCurrency));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[70] ,vaDate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[71] ,vaWString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[72] ,vaInt64));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[73] ,vaUTF8String));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[74] ,ffInherited));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[75] ,ffChildPos));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[76] ,ffInline));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[77] ,tpIdle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[78] ,tpLowest));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[79] ,tpLower));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[80] ,tpNormal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[81] ,tpHigher));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[82] ,tpHighest));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[83] ,tpTimeCritical));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[84] ,opInsert));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[85] ,opRemove));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[86] ,csLoading));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[87] ,csReading));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[88] ,csWriting));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[89] ,csDestroying));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[90] ,csDesigning));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[91] ,csAncestor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[92] ,csUpdating));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[93] ,csFixups));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[94] ,csFreeNotification));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[95] ,csInline));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[96] ,csDesignInstance));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[97] ,csInheritable));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[98] ,csCheckPropAvail));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[99] ,csSubComponent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[100] ,csTransient));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[101] ,axrComponentOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[102] ,axrIncludeDescendants));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[103] ,sofUnknown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[104] ,sofBinary));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[105] ,sofText));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..47] of TClass = (
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
TClassFinder,
TCollection,
TCollectionItem,
TComponent,
TCustomMemoryStream,
TDataModule,
TFiler,
TFileStream,
THandleStream,
TInterfacedPersistent,
TInterfaceList,
TList,
TMemoryStream,
TOwnedCollection,
TParser,
TPersistent,
TReader,
TRecall,
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
const MethodNames : array[0..37] of string = (
'TIdentMapEntry'
,'TStringItem'
,'Point'
,'SmallPoint'
,'PointsEqual'
,'InvalidPoint'
,'Rect'
,'Bounds'
,'UnRegisterModuleClasses'
,'FindGlobalComponent'
,'IsUniqueGlobalComponentName'
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
,'GetUltimateOwner'
,'ObjectBinaryToText'
,'ObjectTextToBinary'
,'ObjectResourceToText'
,'ObjectTextToResource'
,'TestStreamFormat'
,'CheckSynchronize'
,'FreeObjectInstance'
,'DeallocateHWnd'
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
TypeInfo(IDispatch),
TypeInfo(IDispatch),TypeInfo(Boolean)],Addr(____PointsEqual__Wrapper),cRegister);

RegisterProc(nil,MethodNames[5],mtProc,TypeInfo(_T3),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Boolean)],Addr(InvalidPoint),cRegister);

RegisterProc(nil,MethodNames[6],mtProc,TypeInfo(_T4),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(IDispatch)],Addr(____Rect__Wrapper),cRegister);

RegisterProc(nil,MethodNames[7],mtProc,TypeInfo(_T5),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(IDispatch)],Addr(____Bounds__Wrapper),cRegister);

RegisterProc(nil,MethodNames[8],mtProc,TypeInfo(_T11),[
TypeInfo(HMODULE)],Addr(UnRegisterModuleClasses),cRegister);

RegisterProc(nil,MethodNames[9],mtProc,TypeInfo(_T25),[
TypeInfo(string),TypeInfo(TComponent)],Addr(FindGlobalComponent),cRegister);

RegisterProc(nil,MethodNames[10],mtProc,TypeInfo(_T26),[
TypeInfo(string),TypeInfo(Boolean)],Addr(IsUniqueGlobalComponentName),cRegister);

RegisterProc(nil,MethodNames[11],mtProc,TypeInfo(_T27),[
TypeInfo(string),
TypeInfo(Longint),
ArrayInfo(TypeInfo(IDispatch)),TypeInfo(Boolean)],Addr(____IdentToInt__Wrapper),cRegister);

RegisterProc(nil,MethodNames[12],mtProc,TypeInfo(_T28),[
TypeInfo(Longint),
TypeInfo(string),
ArrayInfo(TypeInfo(IDispatch)),TypeInfo(Boolean)],Addr(____IntToIdent__Wrapper),cRegister);

RegisterProc(nil,MethodNames[13],mtProc,TypeInfo(_T32),[
TypeInfo(string),
TypeInfo(TComponent),TypeInfo(Boolean)],Addr(InitComponentRes),cRegister);

RegisterProc(nil,MethodNames[14],mtProc,TypeInfo(_T33),[
TypeInfo(string),
TypeInfo(TComponent),TypeInfo(TComponent)],Addr(ReadComponentRes),cRegister);

RegisterProc(nil,MethodNames[15],mtProc,TypeInfo(_T34),[
TypeInfo(THandle),
TypeInfo(string),TypeInfo(TComponent)],Addr(ReadComponentResEx),cRegister);

RegisterProc(nil,MethodNames[16],mtProc,TypeInfo(_T35),[
TypeInfo(string),
TypeInfo(TComponent),TypeInfo(TComponent)],Addr(ReadComponentResFile),cRegister);

RegisterProc(nil,MethodNames[17],mtProc,TypeInfo(_T36),[
TypeInfo(string),
TypeInfo(TComponent)],Addr(WriteComponentResFile),cRegister);

RegisterProc(nil,MethodNames[18],mtProc,TypeInfo(_T37),NoParams,Addr(GlobalFixupReferences),cRegister);

RegisterProc(nil,MethodNames[19],mtProc,TypeInfo(_T38),[
TypeInfo(TComponent),
TypeInfo(TStrings)],Addr(GetFixupReferenceNames),cRegister);

RegisterProc(nil,MethodNames[20],mtProc,TypeInfo(_T39),[
TypeInfo(TComponent),
TypeInfo(string),
TypeInfo(TStrings)],Addr(GetFixupInstanceNames),cRegister);

RegisterProc(nil,MethodNames[21],mtProc,TypeInfo(_T40),[
TypeInfo(TComponent),
TypeInfo(string),
TypeInfo(string)],Addr(RedirectFixupReferences),cRegister);

RegisterProc(nil,MethodNames[22],mtProc,TypeInfo(_T41),[
TypeInfo(TComponent),
TypeInfo(string)],Addr(RemoveFixupReferences),cRegister);

RegisterProc(nil,MethodNames[23],mtProc,TypeInfo(_T42),[
TypeInfo(TPersistent)],Addr(RemoveFixups),cRegister);

RegisterProc(nil,MethodNames[24],mtProc,TypeInfo(_T43),[
TypeInfo(TComponent),
TypeInfo(string),TypeInfo(TComponent)],Addr(FindNestedComponent),cRegister);

RegisterProc(nil,MethodNames[25],mtProc,TypeInfo(_T44),NoParams,Addr(BeginGlobalLoading),cRegister);

RegisterProc(nil,MethodNames[26],mtProc,TypeInfo(_T45),NoParams,Addr(NotifyGlobalLoading),cRegister);

RegisterProc(nil,MethodNames[27],mtProc,TypeInfo(_T46),NoParams,Addr(EndGlobalLoading),cRegister);

RegisterProc(nil,MethodNames[28],mtProc,TypeInfo(_T47),[
TypeInfo(TCollection),
TypeInfo(TCollection),
TypeInfo(TComponent),
TypeInfo(TComponent),TypeInfo(Boolean)],Addr(CollectionsEqual),cRegister);

RegisterProc(nil,MethodNames[29],mtProc,TypeInfo(_T48),[
TypeInfo(TCollectionItem),TypeInfo(TPersistent)],Addr(GetUltimateOwner),cRegister);

RegisterProc(nil,MethodNames[30],mtProc,TypeInfo(_T49),[
TypeInfo(TStream),
TypeInfo(TStream)],Addr(ObjectBinaryToText),cRegister);

RegisterProc(nil,MethodNames[31],mtProc,TypeInfo(_T50),[
TypeInfo(TStream),
TypeInfo(TStream)],Addr(ObjectTextToBinary),cRegister);

RegisterProc(nil,MethodNames[32],mtProc,TypeInfo(_T51),[
TypeInfo(TStream),
TypeInfo(TStream)],Addr(ObjectResourceToText),cRegister);

RegisterProc(nil,MethodNames[33],mtProc,TypeInfo(_T52),[
TypeInfo(TStream),
TypeInfo(TStream)],Addr(ObjectTextToResource),cRegister);

RegisterProc(nil,MethodNames[34],mtProc,TypeInfo(_T53),[
TypeInfo(TStream),TypeInfo(TStreamOriginalFormat)],Addr(TestStreamFormat),cRegister);

RegisterProc(nil,MethodNames[35],mtProc,TypeInfo(_T60),[TypeInfo(Boolean)],Addr(CheckSynchronize),cRegister);

RegisterProc(nil,MethodNames[36],mtProc,TypeInfo(_T62),[
TypeInfoPointer],Addr(FreeObjectInstance),cRegister);

RegisterProc(nil,MethodNames[37],mtProc,TypeInfo(_T64),[
TypeInfo(HWND)],Addr(DeallocateHWnd),cRegister);

RegRegisterMethod(TBasicAction,'Change',TypeInfo(_T65),NoParams, pointer(48));

RegRegisterMethod(TBasicAction,'HandlesTarget',TypeInfo(_T67),[
TypeInfo(TObject),TypeInfo(Boolean)], pointer(56));

RegRegisterMethod(TBasicAction,'UpdateTarget',TypeInfo(_T68),[
TypeInfo(TObject)], pointer(60));

RegRegisterMethod(TBasicAction,'ExecuteTarget',TypeInfo(_T69),[
TypeInfo(TObject)], pointer(64));

RegRegisterMethod(TBasicAction,'Execute',TypeInfo(_T70),[TypeInfo(Boolean)], pointer(MinVMTOffset - 16));

RegRegisterMethod(TBasicAction,'RegisterChanges',TypeInfo(_T71),[
TypeInfo(TBasicActionLink)],Addr(TBasicAction.RegisterChanges));

RegRegisterMethod(TBasicAction,'UnRegisterChanges',TypeInfo(_T72),[
TypeInfo(TBasicActionLink)],Addr(TBasicAction.UnRegisterChanges));

RegRegisterMethod(TBasicAction,'Update',TypeInfo(_T73),[TypeInfo(Boolean)], pointer(68));

RegRegisterMethod(TBasicActionLink,'AssignClient',TypeInfo(_T74),[
TypeInfo(TObject)], pointer(0));

RegRegisterMethod(TBasicActionLink,'Change',TypeInfo(_T75),NoParams, pointer(4));

RegRegisterMethod(TBasicActionLink,'IsOnExecuteLinked',TypeInfo(_T76),[TypeInfo(Boolean)], pointer(8));

RegRegisterMethod(TBasicActionLink,'SetAction',TypeInfo(_T77),[
TypeInfo(TBasicAction)], pointer(12));

RegisterProc(TBasicActionLink,'Create',mtConstructor,TypeInfo(_T79),[
TypeInfo(TObject)], pointer(20),cRegister);

RegisterProc(TBasicActionLink,'Execute',mtScriptMethod,TypeInfo(_T80),[
TypeInfo(TComponent),TypeInfo(Boolean)],Addr(__TBasicActionLink__Execute__Wrapper),cRegister);

RegRegisterMethod(TBasicActionLink,'Update',TypeInfo(_T81),[TypeInfo(Boolean)], pointer(28));

RegRegisterMethod(TBits,'OpenBit',TypeInfo(_T82),[TypeInfo(Integer)],Addr(TBits.OpenBit));

RegRegisterMethod(TCollection,'Added',TypeInfo(_T86),[
TypeInfo(TCollectionItem)], pointer(12));

RegRegisterMethod(TCollection,'Deleting',TypeInfo(_T87),[
TypeInfo(TCollectionItem)], pointer(16));

RegRegisterMethod(TCollection,'Notify',TypeInfo(_T88),[
TypeInfo(TCollectionItem),
TypeInfo(TCollectionNotification)], pointer(20));

RegRegisterMethod(TCollection,'GetAttrCount',TypeInfo(_T89),[TypeInfo(Integer)], pointer(MinVMTOffset - 2));

RegRegisterMethod(TCollection,'GetAttr',TypeInfo(_T90),[
TypeInfo(Integer),TypeInfo(string)], pointer(MinVMTOffset - 3));

RegRegisterMethod(TCollection,'GetItemAttr',TypeInfo(_T91),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(string)], pointer(MinVMTOffset - 4));

RegRegisterMethod(TCollection,'SetItemName',TypeInfo(_T92),[
TypeInfo(TCollectionItem)], pointer(24));

RegRegisterMethod(TCollection,'Update',TypeInfo(_T93),[
TypeInfo(TCollectionItem)], pointer(28));

RegRegisterMethod(TCollection,'Owner',TypeInfo(_T95),[TypeInfo(TPersistent)],Addr(TCollection.Owner));

RegRegisterMethod(TCollection,'Add',TypeInfo(_T96),[TypeInfo(TCollectionItem)],Addr(TCollection.Add));

RegRegisterMethod(TCollection,'BeginUpdate',TypeInfo(_T97),NoParams, pointer(32));

RegRegisterMethod(TCollection,'Clear',TypeInfo(_T98),NoParams,Addr(TCollection.Clear));

RegRegisterMethod(TCollection,'Delete',TypeInfo(_T99),[
TypeInfo(Integer)],Addr(TCollection.Delete));

RegRegisterMethod(TCollection,'EndUpdate',TypeInfo(_T100),NoParams, pointer(36));

RegRegisterMethod(TCollection,'FindItemID',TypeInfo(_T101),[
TypeInfo(Integer),TypeInfo(TCollectionItem)],Addr(TCollection.FindItemID));

RegRegisterMethod(TCollection,'Insert',TypeInfo(_T102),[
TypeInfo(Integer),TypeInfo(TCollectionItem)],Addr(TCollection.Insert));

RegRegisterMethod(TCollectionItem,'GetDisplayName',TypeInfo(_T103),[TypeInfo(string)], pointer(12));

RegRegisterMethod(TCollectionItem,'SetCollection',TypeInfo(_T104),[
TypeInfo(TCollection)], pointer(16));

RegRegisterMethod(TCollectionItem,'SetIndex',TypeInfo(_T105),[
TypeInfo(Integer)], pointer(20));

RegRegisterMethod(TCollectionItem,'SetDisplayName',TypeInfo(_T106),[
TypeInfo(string)], pointer(24));

RegisterProc(TCollectionItem,'Create',mtConstructor,TypeInfo(_T107),[
TypeInfo(TCollection)], pointer(28),cRegister);

RegRegisterMethod(TComponent,'GetChildOwner',TypeInfo(_T109),[TypeInfo(TComponent)], pointer(MinVMTOffset - 3));

RegRegisterMethod(TComponent,'GetChildParent',TypeInfo(_T110),[TypeInfo(TComponent)], pointer(MinVMTOffset - 4));

RegRegisterMethod(TComponent,'Loaded',TypeInfo(_T111),NoParams, pointer(12));

RegRegisterMethod(TComponent,'Notification',TypeInfo(_T112),[
TypeInfo(TComponent),
TypeInfo(TOperation)], pointer(16));

RegRegisterMethod(TComponent,'PaletteCreated',TypeInfo(_T113),NoParams, pointer(MinVMTOffset - 5));

RegRegisterMethod(TComponent,'ReadState',TypeInfo(_T114),[
TypeInfo(TReader)], pointer(20));

RegRegisterMethod(TComponent,'SetName',TypeInfo(_T115),[
TypeInfo(TComponentName)], pointer(24));

RegRegisterMethod(TComponent,'SetChildOrder',TypeInfo(_T116),[
TypeInfo(TComponent),
TypeInfo(Integer)], pointer(MinVMTOffset - 6));

RegRegisterMethod(TComponent,'SetParentComponent',TypeInfo(_T117),[
TypeInfo(TComponent)], pointer(MinVMTOffset - 7));

RegRegisterMethod(TComponent,'Updating',TypeInfo(_T118),NoParams, pointer(MinVMTOffset - 8));

RegRegisterMethod(TComponent,'Updated',TypeInfo(_T119),NoParams, pointer(MinVMTOffset - 9));

RegisterProc(TComponent,'UpdateRegistry',mtClassMethod,TypeInfo(_T120),[
TypeInfo(Boolean),
TypeInfo(string),
TypeInfo(string)], pointer(28),cRegister);

RegRegisterMethod(TComponent,'ValidateRename',TypeInfo(_T121),[
TypeInfo(TComponent),
TypeInfo(string),
TypeInfo(string)], pointer(32));

RegRegisterMethod(TComponent,'ValidateContainer',TypeInfo(_T122),[
TypeInfo(TComponent)], pointer(MinVMTOffset - 10));

RegRegisterMethod(TComponent,'ValidateInsert',TypeInfo(_T123),[
TypeInfo(TComponent)], pointer(MinVMTOffset - 11));

RegRegisterMethod(TComponent,'WriteState',TypeInfo(_T124),[
TypeInfo(TWriter)], pointer(36));

RegisterProc(TComponent,'QueryInterface',mtMethod,TypeInfo(_T125),[
TypeInfo(IDispatch),
TypeInfoUntyped,TypeInfo(HResult)], pointer(40),cRegister);

RegisterProc(TComponent,'Create',mtConstructor,TypeInfo(_T126),[
TypeInfo(TComponent)], pointer(44),cRegister);

RegRegisterMethod(TComponent,'DestroyComponents',TypeInfo(_T127),NoParams,Addr(TComponent.DestroyComponents));

RegRegisterMethod(TComponent,'Destroying',TypeInfo(_T128),NoParams,Addr(TComponent.Destroying));

RegRegisterMethod(TComponent,'ExecuteAction',TypeInfo(_T129),[
TypeInfo(TBasicAction),TypeInfo(Boolean)], pointer(MinVMTOffset - 12));

RegRegisterMethod(TComponent,'FindComponent',TypeInfo(_T130),[
TypeInfo(string),TypeInfo(TComponent)],Addr(TComponent.FindComponent));

RegRegisterMethod(TComponent,'FreeNotification',TypeInfo(_T131),[
TypeInfo(TComponent)],Addr(TComponent.FreeNotification));

RegRegisterMethod(TComponent,'RemoveFreeNotification',TypeInfo(_T132),[
TypeInfo(TComponent)],Addr(TComponent.RemoveFreeNotification));

RegRegisterMethod(TComponent,'FreeOnRelease',TypeInfo(_T133),NoParams,Addr(TComponent.FreeOnRelease));

RegRegisterMethod(TComponent,'GetParentComponent',TypeInfo(_T134),[TypeInfo(TComponent)], pointer(MinVMTOffset - 13));

RegRegisterMethod(TComponent,'HasParent',TypeInfo(_T135),[TypeInfo(Boolean)], pointer(MinVMTOffset - 14));

RegRegisterMethod(TComponent,'InsertComponent',TypeInfo(_T136),[
TypeInfo(TComponent)],Addr(TComponent.InsertComponent));

RegRegisterMethod(TComponent,'RemoveComponent',TypeInfo(_T137),[
TypeInfo(TComponent)],Addr(TComponent.RemoveComponent));

RegRegisterMethod(TComponent,'SetSubComponent',TypeInfo(_T138),[
TypeInfo(Boolean)],Addr(TComponent.SetSubComponent));

RegRegisterMethod(TComponent,'UpdateAction',TypeInfo(_T139),[
TypeInfo(TBasicAction),TypeInfo(Boolean)], pointer(MinVMTOffset - 15));

RegRegisterMethod(TCustomMemoryStream,'SaveToStream',TypeInfo(_T142),[
TypeInfo(TStream)],Addr(TCustomMemoryStream.SaveToStream));

RegRegisterMethod(TCustomMemoryStream,'SaveToFile',TypeInfo(_T143),[
TypeInfo(string)],Addr(TCustomMemoryStream.SaveToFile));

RegRegisterMethod(TDataModule,'DoCreate',TypeInfo(_T144),NoParams, pointer(48));

RegRegisterMethod(TDataModule,'DoDestroy',TypeInfo(_T145),NoParams, pointer(52));

RegRegisterMethod(TDataModule,'HandleCreateException',TypeInfo(_T146),[TypeInfo(Boolean)], pointer(MinVMTOffset - 16));

RegisterProc(TDataModule,'CreateNew',mtConstructor,TypeInfo(_T147),[
TypeInfo(TComponent),
TypeInfo(Integer)], pointer(56),cRegister);

RegRegisterMethod(TFiler,'SetRoot',TypeInfo(_T148),[
TypeInfo(TComponent)], pointer(0));

RegisterProc(TFiler,'Create',mtConstructor,TypeInfo(_T149),[
TypeInfo(TStream),
TypeInfo(Integer)],Addr(TFiler.Create),cRegister);

RegRegisterMethod(TFiler,'FlushBuffer',TypeInfo(_T152),NoParams, pointer(12));

RegisterProc(TFileStream,'Create',mtConstructor,TypeInfo(_T153),[
TypeInfo(string),
TypeInfo(Word)],Addr(TFileStream.Create),cRegister);

RegisterProc(THandleStream,'Create',mtConstructor,TypeInfo(_T154),[
TypeInfo(Integer)],Addr(THandleStream.Create),cRegister);

RegisterProc(TInterfacedPersistent,'QueryInterface',mtMethod,TypeInfo(_T155),[
TypeInfo(IDispatch),
TypeInfoUntyped,TypeInfo(HResult)], pointer(12),cRegister);

RegisterProc(TInterfaceList,'Create',mtConstructor,TypeInfo(_T156),NoParams,Addr(TInterfaceList.Create),cRegister);

RegRegisterMethod(TInterfaceList,'Clear',TypeInfo(_T157),NoParams,Addr(TInterfaceList.Clear));

RegRegisterMethod(TInterfaceList,'Delete',TypeInfo(_T158),[
TypeInfo(Integer)],Addr(TInterfaceList.Delete));

RegRegisterMethod(TInterfaceList,'Exchange',TypeInfo(_T159),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TInterfaceList.Exchange));

RegRegisterMethod(TInterfaceList,'Expand',TypeInfo(_T160),[TypeInfo(TInterfaceList)],Addr(TInterfaceList.Expand));

RegRegisterMethod(TInterfaceList,'Lock',TypeInfo(_T167),NoParams,Addr(TInterfaceList.Lock));

RegRegisterMethod(TInterfaceList,'Unlock',TypeInfo(_T168),NoParams,Addr(TInterfaceList.Unlock));

RegRegisterMethod(TList,'Grow',TypeInfo(_T169),NoParams, pointer(0));

RegRegisterMethod(TList,'Notify',TypeInfo(_T170),[
TypeInfoPointer,
TypeInfo(TListNotification)], pointer(4));

RegRegisterMethod(TList,'Add',TypeInfo(_T171),[
TypeInfoPointer,TypeInfo(Integer)],Addr(TList.Add));

RegRegisterMethod(TList,'Clear',TypeInfo(_T172),NoParams, pointer(8));

RegRegisterMethod(TList,'Delete',TypeInfo(_T173),[
TypeInfo(Integer)],Addr(TList.Delete));

RegisterProc(TList,'Error',mtClassMethod,TypeInfo(_T174),[
TypeInfo(string),
TypeInfo(Integer)], pointer(12),cRegister);

RegRegisterMethod(TList,'Exchange',TypeInfo(_T175),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TList.Exchange));

RegRegisterMethod(TList,'Expand',TypeInfo(_T176),[TypeInfo(TList)],Addr(TList.Expand));

RegRegisterMethod(TList,'Extract',TypeInfo(_T177),[
TypeInfoPointer,TypeInfoPointer],Addr(TList.Extract));

RegRegisterMethod(TList,'First',TypeInfo(_T178),[TypeInfoPointer],Addr(TList.First));

RegRegisterMethod(TList,'IndexOf',TypeInfo(_T179),[
TypeInfoPointer,TypeInfo(Integer)],Addr(TList.IndexOf));

RegRegisterMethod(TList,'Insert',TypeInfo(_T180),[
TypeInfo(Integer),
TypeInfoPointer],Addr(TList.Insert));

RegRegisterMethod(TList,'Last',TypeInfo(_T181),[TypeInfoPointer],Addr(TList.Last));

RegRegisterMethod(TList,'Move',TypeInfo(_T182),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TList.Move));

RegRegisterMethod(TList,'Remove',TypeInfo(_T183),[
TypeInfoPointer,TypeInfo(Integer)],Addr(TList.Remove));

RegRegisterMethod(TList,'Pack',TypeInfo(_T184),NoParams,Addr(TList.Pack));

RegisterProc(TList,'Assign',mtScriptMethod,TypeInfo(_T186),[
TypeInfo(TList),
TypeInfo(TListAssignOp),
TypeInfo(TList)],Addr(__TList__Assign__Wrapper),cRegister);

RegRegisterMethod(TMemoryStream,'Realloc',TypeInfo(_T187),[
TypeInfo(Longint),TypeInfoPointer], pointer(28));

RegRegisterMethod(TMemoryStream,'Clear',TypeInfo(_T188),NoParams,Addr(TMemoryStream.Clear));

RegRegisterMethod(TMemoryStream,'LoadFromStream',TypeInfo(_T189),[
TypeInfo(TStream)],Addr(TMemoryStream.LoadFromStream));

RegRegisterMethod(TMemoryStream,'LoadFromFile',TypeInfo(_T190),[
TypeInfo(string)],Addr(TMemoryStream.LoadFromFile));

RegisterProc(TParser,'Create',mtConstructor,TypeInfo(_T192),[
TypeInfo(TStream)],Addr(TParser.Create),cRegister);

RegRegisterMethod(TParser,'CheckToken',TypeInfo(_T193),[
TypeInfo(Char)],Addr(TParser.CheckToken));

RegRegisterMethod(TParser,'CheckTokenSymbol',TypeInfo(_T194),[
TypeInfo(string)],Addr(TParser.CheckTokenSymbol));

RegRegisterMethod(TParser,'Error',TypeInfo(_T195),[
TypeInfo(string)],Addr(TParser.Error));

RegRegisterMethod(TParser,'ErrorFmt',TypeInfo(_T196),[
TypeInfo(string),
TypeInfoArrayOfConst],Addr(TParser.ErrorFmt));

RegRegisterMethod(TParser,'ErrorStr',TypeInfo(_T197),[
TypeInfo(string)],Addr(TParser.ErrorStr));

RegRegisterMethod(TParser,'HexToBinary',TypeInfo(_T198),[
TypeInfo(TStream)],Addr(TParser.HexToBinary));

RegRegisterMethod(TParser,'NextToken',TypeInfo(_T199),[TypeInfo(Char)],Addr(TParser.NextToken));

RegRegisterMethod(TParser,'SourcePos',TypeInfo(_T200),[TypeInfo(Longint)],Addr(TParser.SourcePos));

RegRegisterMethod(TParser,'TokenComponentIdent',TypeInfo(_T201),[TypeInfo(string)],Addr(TParser.TokenComponentIdent));

RegRegisterMethod(TParser,'TokenFloat',TypeInfo(_T202),[TypeInfo(Extended)],Addr(TParser.TokenFloat));

RegRegisterMethod(TParser,'TokenString',TypeInfo(_T204),[TypeInfo(string)],Addr(TParser.TokenString));

RegRegisterMethod(TParser,'TokenWideString',TypeInfo(_T205),[TypeInfo(WideString)],Addr(TParser.TokenWideString));

RegRegisterMethod(TParser,'TokenSymbolIs',TypeInfo(_T206),[
TypeInfo(string),TypeInfo(Boolean)],Addr(TParser.TokenSymbolIs));

RegRegisterMethod(TPersistent,'AssignTo',TypeInfo(_T207),[
TypeInfo(TPersistent)], pointer(0));

RegRegisterMethod(TPersistent,'DefineProperties',TypeInfo(_T208),[
TypeInfo(TFiler)], pointer(4));

RegRegisterMethod(TPersistent,'GetOwner',TypeInfo(_T209),[TypeInfo(TPersistent)], pointer(MinVMTOffset - 0));

RegRegisterMethod(TPersistent,'Assign',TypeInfo(_T210),[
TypeInfo(TPersistent)], pointer(8));

RegRegisterMethod(TPersistent,'GetNamePath',TypeInfo(_T211),[TypeInfo(string)], pointer(MinVMTOffset - 1));

RegRegisterMethod(TReader,'Error',TypeInfo(_T212),[
TypeInfo(string),TypeInfo(Boolean)], pointer(16));

RegRegisterMethod(TReader,'FindMethod',TypeInfo(_T214),[
TypeInfo(TComponent),
TypeInfo(string),TypeInfoPointer], pointer(24));

RegRegisterMethod(TReader,'SetName',TypeInfo(_T215),[
TypeInfo(TComponent),
TypeInfo(string)], pointer(28));

RegRegisterMethod(TReader,'ReferenceName',TypeInfo(_T216),[
TypeInfo(string)], pointer(32));

RegRegisterMethod(TReader,'BeginReferences',TypeInfo(_T217),NoParams,Addr(TReader.BeginReferences));

RegRegisterMethod(TReader,'CheckValue',TypeInfo(_T218),[
TypeInfo(TValueType)],Addr(TReader.CheckValue));

RegRegisterMethod(TReader,'EndOfList',TypeInfo(_T219),[TypeInfo(Boolean)],Addr(TReader.EndOfList));

RegRegisterMethod(TReader,'EndReferences',TypeInfo(_T220),NoParams,Addr(TReader.EndReferences));

RegRegisterMethod(TReader,'FixupReferences',TypeInfo(_T221),NoParams,Addr(TReader.FixupReferences));

RegRegisterMethod(TReader,'NextValue',TypeInfo(_T222),[TypeInfo(TValueType)],Addr(TReader.NextValue));

RegRegisterMethod(TReader,'Read',TypeInfo(_T223),[
TypeInfoUntyped,
TypeInfo(Longint)],Addr(TReader.Read));

RegRegisterMethod(TReader,'ReadBoolean',TypeInfo(_T224),[TypeInfo(Boolean)],Addr(TReader.ReadBoolean));

RegRegisterMethod(TReader,'ReadChar',TypeInfo(_T225),[TypeInfo(Char)],Addr(TReader.ReadChar));

RegRegisterMethod(TReader,'ReadCollection',TypeInfo(_T226),[
TypeInfo(TCollection)],Addr(TReader.ReadCollection));

RegRegisterMethod(TReader,'ReadComponent',TypeInfo(_T227),[
TypeInfo(TComponent),TypeInfo(TComponent)],Addr(TReader.ReadComponent));

RegRegisterMethod(TReader,'ReadFloat',TypeInfo(_T229),[TypeInfo(Extended)],Addr(TReader.ReadFloat));

RegRegisterMethod(TReader,'ReadSingle',TypeInfo(_T230),[TypeInfo(Single)],Addr(TReader.ReadSingle));

RegRegisterMethod(TReader,'ReadCurrency',TypeInfo(_T231),[TypeInfo(Currency)],Addr(TReader.ReadCurrency));

RegRegisterMethod(TReader,'ReadDate',TypeInfo(_T232),[TypeInfo(TDateTime)],Addr(TReader.ReadDate));

RegRegisterMethod(TReader,'ReadIdent',TypeInfo(_T233),[TypeInfo(string)],Addr(TReader.ReadIdent));

RegRegisterMethod(TReader,'ReadInteger',TypeInfo(_T234),[TypeInfo(Longint)],Addr(TReader.ReadInteger));

RegRegisterMethod(TReader,'ReadListBegin',TypeInfo(_T236),NoParams,Addr(TReader.ReadListBegin));

RegRegisterMethod(TReader,'ReadListEnd',TypeInfo(_T237),NoParams,Addr(TReader.ReadListEnd));

RegRegisterMethod(TReader,'ReadPrefix',TypeInfo(_T238),[
TypeInfo(TFilerFlags),
TypeInfo(Integer)], pointer(36));

RegRegisterMethod(TReader,'ReadRootComponent',TypeInfo(_T239),[
TypeInfo(TComponent),TypeInfo(TComponent)],Addr(TReader.ReadRootComponent));

RegRegisterMethod(TReader,'ReadSignature',TypeInfo(_T240),NoParams,Addr(TReader.ReadSignature));

RegRegisterMethod(TReader,'ReadStr',TypeInfo(_T241),[TypeInfo(string)],Addr(TReader.ReadStr));

RegRegisterMethod(TReader,'ReadString',TypeInfo(_T242),[TypeInfo(string)],Addr(TReader.ReadString));

RegRegisterMethod(TReader,'ReadWideString',TypeInfo(_T243),[TypeInfo(WideString)],Addr(TReader.ReadWideString));

RegRegisterMethod(TReader,'ReadValue',TypeInfo(_T244),[TypeInfo(TValueType)],Addr(TReader.ReadValue));

RegRegisterMethod(TReader,'ReadVariant',TypeInfo(_T245),[TypeInfo(Variant)],Addr(TReader.ReadVariant));

RegRegisterMethod(TReader,'CopyValue',TypeInfo(_T246),[
TypeInfo(TWriter)],Addr(TReader.CopyValue));

RegRegisterMethod(TReader,'SkipValue',TypeInfo(_T247),NoParams,Addr(TReader.SkipValue));

RegisterProc(TRecall,'Create',mtConstructor,TypeInfo(_T248),[
TypeInfo(TPersistent),
TypeInfo(TPersistent)],Addr(TRecall.Create),cRegister);

RegRegisterMethod(TRecall,'Store',TypeInfo(_T249),NoParams,Addr(TRecall.Store));

RegRegisterMethod(TRecall,'Forget',TypeInfo(_T250),NoParams,Addr(TRecall.Forget));

RegRegisterMethod(TStream,'SetSize',TypeInfo(_T253),[
TypeInfo(Longint)], pointer(0));

RegRegisterMethod(TStream,'Read',TypeInfo(_T254),[
TypeInfoUntyped,
TypeInfo(Longint),TypeInfo(Longint)], pointer(8));

RegRegisterMethod(TStream,'Write',TypeInfo(_T255),[
TypeInfoUntyped,
TypeInfo(Longint),TypeInfo(Longint)], pointer(12));

RegRegisterMethod(TStream,'Seek',TypeInfo(_T256),[
TypeInfo(Longint),
TypeInfo(Word),TypeInfo(Longint)], pointer(16));

RegRegisterMethod(TStream,'ReadBuffer',TypeInfo(_T257),[
TypeInfoUntyped,
TypeInfo(Longint)],Addr(TStream.ReadBuffer));

RegRegisterMethod(TStream,'WriteBuffer',TypeInfo(_T258),[
TypeInfoUntyped,
TypeInfo(Longint)],Addr(TStream.WriteBuffer));

RegRegisterMethod(TStream,'ReadComponent',TypeInfo(_T260),[
TypeInfo(TComponent),TypeInfo(TComponent)],Addr(TStream.ReadComponent));

RegRegisterMethod(TStream,'ReadComponentRes',TypeInfo(_T261),[
TypeInfo(TComponent),TypeInfo(TComponent)],Addr(TStream.ReadComponentRes));

RegRegisterMethod(TStream,'WriteComponent',TypeInfo(_T262),[
TypeInfo(TComponent)],Addr(TStream.WriteComponent));

RegRegisterMethod(TStream,'WriteComponentRes',TypeInfo(_T263),[
TypeInfo(string),
TypeInfo(TComponent)],Addr(TStream.WriteComponentRes));

RegRegisterMethod(TStream,'WriteDescendent',TypeInfo(_T264),[
TypeInfo(TComponent),
TypeInfo(TComponent)], pointer(24));

RegRegisterMethod(TStream,'WriteDescendentRes',TypeInfo(_T265),[
TypeInfo(string),
TypeInfo(TComponent),
TypeInfo(TComponent)],Addr(TStream.WriteDescendentRes));

RegRegisterMethod(TStream,'WriteResourceHeader',TypeInfo(_T266),[
TypeInfo(string),
TypeInfo(Integer)],Addr(TStream.WriteResourceHeader));

RegRegisterMethod(TStream,'FixupResourceHeader',TypeInfo(_T267),[
TypeInfo(Integer)],Addr(TStream.FixupResourceHeader));

RegRegisterMethod(TStream,'ReadResHeader',TypeInfo(_T268),NoParams,Addr(TStream.ReadResHeader));

RegisterProc(TStreamAdapter,'Create',mtConstructor,TypeInfo(_T269),[
TypeInfo(TStream),
TypeInfo(TStreamOwnership)],Addr(TStreamAdapter.Create),cRegister);

RegisterProc(TStreamAdapter,'Read',mtMethod,TypeInfo(_T270),[
TypeInfoPointer,
TypeInfo(Longint),
TypeInfoPointer,TypeInfo(HResult)], pointer(0),cStdCall);

RegisterProc(TStreamAdapter,'Write',mtMethod,TypeInfo(_T271),[
TypeInfoPointer,
TypeInfo(Longint),
TypeInfoPointer,TypeInfo(HResult)], pointer(4),cStdCall);

RegisterProc(TStreamAdapter,'Commit',mtMethod,TypeInfo(_T275),[
TypeInfo(Longint),TypeInfo(HResult)], pointer(20),cStdCall);

RegisterProc(TStreamAdapter,'Revert',mtMethod,TypeInfo(_T276),[TypeInfo(HResult)], pointer(24),cStdCall);

RegRegisterMethod(TStringList,'Changed',TypeInfo(_T281),NoParams, pointer(128));

RegRegisterMethod(TStringList,'Changing',TypeInfo(_T282),NoParams, pointer(132));

RegRegisterMethod(TStringList,'InsertItem',TypeInfo(_T283),[
TypeInfo(Integer),
TypeInfo(string),
TypeInfo(TObject)], pointer(136));

RegRegisterMethod(TStringList,'Find',TypeInfo(_T284),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Boolean)], pointer(140));

RegRegisterMethod(TStringList,'Sort',TypeInfo(_T285),NoParams, pointer(144));

RegRegisterMethod(TStrings,'Get',TypeInfo(_T287),[
TypeInfo(Integer),TypeInfo(string)], pointer(12));

RegRegisterMethod(TStrings,'GetCapacity',TypeInfo(_T288),[TypeInfo(Integer)], pointer(16));

RegRegisterMethod(TStrings,'GetCount',TypeInfo(_T289),[TypeInfo(Integer)], pointer(20));

RegRegisterMethod(TStrings,'GetObject',TypeInfo(_T290),[
TypeInfo(Integer),TypeInfo(TObject)], pointer(24));

RegRegisterMethod(TStrings,'GetTextStr',TypeInfo(_T291),[TypeInfo(string)], pointer(28));

RegRegisterMethod(TStrings,'Put',TypeInfo(_T292),[
TypeInfo(Integer),
TypeInfo(string)], pointer(32));

RegRegisterMethod(TStrings,'PutObject',TypeInfo(_T293),[
TypeInfo(Integer),
TypeInfo(TObject)], pointer(36));

RegRegisterMethod(TStrings,'SetCapacity',TypeInfo(_T294),[
TypeInfo(Integer)], pointer(40));

RegRegisterMethod(TStrings,'SetTextStr',TypeInfo(_T295),[
TypeInfo(string)], pointer(44));

RegRegisterMethod(TStrings,'SetUpdateState',TypeInfo(_T296),[
TypeInfo(Boolean)], pointer(48));

RegRegisterMethod(TStrings,'CompareStrings',TypeInfo(_T297),[
TypeInfo(string),
TypeInfo(string),TypeInfo(Integer)], pointer(52));

RegRegisterMethod(TStrings,'Add',TypeInfo(_T298),[
TypeInfo(string),TypeInfo(Integer)], pointer(56));

RegRegisterMethod(TStrings,'AddObject',TypeInfo(_T299),[
TypeInfo(string),
TypeInfo(TObject),TypeInfo(Integer)], pointer(60));

RegRegisterMethod(TStrings,'Append',TypeInfo(_T300),[
TypeInfo(string)],Addr(TStrings.Append));

RegRegisterMethod(TStrings,'AddStrings',TypeInfo(_T301),[
TypeInfo(TStrings)], pointer(64));

RegRegisterMethod(TStrings,'BeginUpdate',TypeInfo(_T302),NoParams,Addr(TStrings.BeginUpdate));

RegRegisterMethod(TStrings,'Clear',TypeInfo(_T303),NoParams, pointer(68));

RegRegisterMethod(TStrings,'Delete',TypeInfo(_T304),[
TypeInfo(Integer)], pointer(72));

RegRegisterMethod(TStrings,'EndUpdate',TypeInfo(_T305),NoParams,Addr(TStrings.EndUpdate));

RegRegisterMethod(TStrings,'Equals',TypeInfo(_T306),[
TypeInfo(TStrings),TypeInfo(Boolean)],Addr(TStrings.Equals));

RegRegisterMethod(TStrings,'Exchange',TypeInfo(_T307),[
TypeInfo(Integer),
TypeInfo(Integer)], pointer(76));

RegRegisterMethod(TStrings,'GetText',TypeInfo(_T308),[TypeInfoPChar], pointer(80));

RegRegisterMethod(TStrings,'IndexOf',TypeInfo(_T309),[
TypeInfo(string),TypeInfo(Integer)], pointer(84));

RegRegisterMethod(TStrings,'IndexOfName',TypeInfo(_T310),[
TypeInfo(string),TypeInfo(Integer)], pointer(88));

RegRegisterMethod(TStrings,'IndexOfObject',TypeInfo(_T311),[
TypeInfo(TObject),TypeInfo(Integer)], pointer(92));

RegRegisterMethod(TStrings,'Insert',TypeInfo(_T312),[
TypeInfo(Integer),
TypeInfo(string)], pointer(96));

RegRegisterMethod(TStrings,'InsertObject',TypeInfo(_T313),[
TypeInfo(Integer),
TypeInfo(string),
TypeInfo(TObject)], pointer(100));

RegRegisterMethod(TStrings,'LoadFromFile',TypeInfo(_T314),[
TypeInfo(string)], pointer(104));

RegRegisterMethod(TStrings,'LoadFromStream',TypeInfo(_T315),[
TypeInfo(TStream)], pointer(108));

RegRegisterMethod(TStrings,'Move',TypeInfo(_T316),[
TypeInfo(Integer),
TypeInfo(Integer)], pointer(112));

RegRegisterMethod(TStrings,'SaveToFile',TypeInfo(_T317),[
TypeInfo(string)], pointer(116));

RegRegisterMethod(TStrings,'SaveToStream',TypeInfo(_T318),[
TypeInfo(TStream)], pointer(120));

RegisterProc(TStringStream,'Create',mtConstructor,TypeInfo(_T320),[
TypeInfo(string)],Addr(TStringStream.Create),cRegister);

RegRegisterMethod(TStringStream,'ReadString',TypeInfo(_T321),[
TypeInfo(Longint),TypeInfo(string)],Addr(TStringStream.ReadString));

RegRegisterMethod(TStringStream,'WriteString',TypeInfo(_T322),[
TypeInfo(string)],Addr(TStringStream.WriteString));

RegRegisterMethod(TThread,'DoTerminate',TypeInfo(_T323),NoParams, pointer(0));

RegRegisterMethod(TThread,'Execute',TypeInfo(_T324),NoParams, pointer(4));

RegisterProc(TThread,'Create',mtConstructor,TypeInfo(_T325),[
TypeInfo(Boolean)],Addr(TThread.Create),cRegister);

RegRegisterMethod(TThread,'Resume',TypeInfo(_T326),NoParams,Addr(TThread.Resume));

RegRegisterMethod(TThread,'Suspend',TypeInfo(_T327),NoParams,Addr(TThread.Suspend));

RegRegisterMethod(TThread,'Terminate',TypeInfo(_T328),NoParams,Addr(TThread.Terminate));

RegRegisterMethod(TThread,'WaitFor',TypeInfo(_T329),[TypeInfo(LongWord)],Addr(TThread.WaitFor));

RegisterProc(TThreadList,'Create',mtConstructor,TypeInfo(_T330),NoParams,Addr(TThreadList.Create),cRegister);

RegRegisterMethod(TThreadList,'Add',TypeInfo(_T331),[
TypeInfoPointer],Addr(TThreadList.Add));

RegRegisterMethod(TThreadList,'Clear',TypeInfo(_T332),NoParams,Addr(TThreadList.Clear));

RegRegisterMethod(TThreadList,'LockList',TypeInfo(_T333),[TypeInfo(TList)],Addr(TThreadList.LockList));

RegRegisterMethod(TThreadList,'Remove',TypeInfo(_T334),[
TypeInfoPointer],Addr(TThreadList.Remove));

RegRegisterMethod(TThreadList,'UnlockList',TypeInfo(_T335),NoParams,Addr(TThreadList.UnlockList));

RegRegisterMethod(TWriter,'WriteData',TypeInfo(_T336),[
TypeInfo(TComponent)], pointer(16));

RegRegisterMethod(TWriter,'Write',TypeInfo(_T337),[
TypeInfoUntyped,
TypeInfo(Longint)],Addr(TWriter.Write));

RegRegisterMethod(TWriter,'WriteBoolean',TypeInfo(_T338),[
TypeInfo(Boolean)],Addr(TWriter.WriteBoolean));

RegRegisterMethod(TWriter,'WriteCollection',TypeInfo(_T339),[
TypeInfo(TCollection)],Addr(TWriter.WriteCollection));

RegRegisterMethod(TWriter,'WriteComponent',TypeInfo(_T340),[
TypeInfo(TComponent)],Addr(TWriter.WriteComponent));

RegRegisterMethod(TWriter,'WriteChar',TypeInfo(_T341),[
TypeInfo(Char)],Addr(TWriter.WriteChar));

RegRegisterMethod(TWriter,'WriteDescendent',TypeInfo(_T342),[
TypeInfo(TComponent),
TypeInfo(TComponent)],Addr(TWriter.WriteDescendent));

RegRegisterMethod(TWriter,'WriteFloat',TypeInfo(_T343),[
TypeInfo(Extended)],Addr(TWriter.WriteFloat));

RegRegisterMethod(TWriter,'WriteSingle',TypeInfo(_T344),[
TypeInfo(Single)],Addr(TWriter.WriteSingle));

RegRegisterMethod(TWriter,'WriteCurrency',TypeInfo(_T345),[
TypeInfo(Currency)],Addr(TWriter.WriteCurrency));

RegRegisterMethod(TWriter,'WriteDate',TypeInfo(_T346),[
TypeInfo(TDateTime)],Addr(TWriter.WriteDate));

RegRegisterMethod(TWriter,'WriteIdent',TypeInfo(_T347),[
TypeInfo(string)],Addr(TWriter.WriteIdent));

RegRegisterMethod(TWriter,'WriteInteger',TypeInfo(_T348),[
TypeInfo(Longint)],Addr(TWriter.WriteInteger));

RegRegisterMethod(TWriter,'WriteListBegin',TypeInfo(_T349),NoParams,Addr(TWriter.WriteListBegin));

RegRegisterMethod(TWriter,'WriteListEnd',TypeInfo(_T350),NoParams,Addr(TWriter.WriteListEnd));

RegRegisterMethod(TWriter,'WriteRootComponent',TypeInfo(_T351),[
TypeInfo(TComponent)],Addr(TWriter.WriteRootComponent));

RegRegisterMethod(TWriter,'WriteSignature',TypeInfo(_T352),NoParams,Addr(TWriter.WriteSignature));

RegRegisterMethod(TWriter,'WriteStr',TypeInfo(_T353),[
TypeInfo(string)],Addr(TWriter.WriteStr));

RegRegisterMethod(TWriter,'WriteString',TypeInfo(_T354),[
TypeInfo(string)],Addr(TWriter.WriteString));

RegRegisterMethod(TWriter,'WriteWideString',TypeInfo(_T355),[
TypeInfo(WideString)],Addr(TWriter.WriteWideString));

RegRegisterMethod(TWriter,'WriteVariant',TypeInfo(_T356),[
TypeInfo(Variant)],Addr(TWriter.WriteVariant));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'RegisterClass',mtProc,TypeInfo(_T6),[
TypeInfo(TPersistentClass)],Addr(RegisterClass),cRegister)}

{RegisterProc(nil,'RegisterClasses',mtProc,TypeInfo(_T7),[
ArrayInfo(TypeInfo(TPersistentClass))],Addr(RegisterClasses),cRegister)}

{RegisterProc(nil,'RegisterClassAlias',mtProc,TypeInfo(_T8),[
TypeInfo(TPersistentClass),
TypeInfo(string)],Addr(RegisterClassAlias),cRegister)}

{RegisterProc(nil,'UnRegisterClass',mtProc,TypeInfo(_T9),[
TypeInfo(TPersistentClass)],Addr(UnRegisterClass),cRegister)}

{RegisterProc(nil,'UnRegisterClasses',mtProc,TypeInfo(_T10),[
ArrayInfo(TypeInfo(TPersistentClass))],Addr(UnRegisterClasses),cRegister)}

{RegisterProc(nil,'FindClass',mtProc,TypeInfo(_T12),[
TypeInfo(string),TypeInfo(TPersistentClass)],Addr(FindClass),cRegister)}

{RegisterProc(nil,'GetClass',mtProc,TypeInfo(_T13),[
TypeInfo(string),TypeInfo(TPersistentClass)],Addr(GetClass),cRegister)}

{RegisterProc(nil,'StartClassGroup',mtProc,TypeInfo(_T14),[
TypeInfo(TPersistentClass)],Addr(StartClassGroup),cRegister)}

{RegisterProc(nil,'GroupDescendentsWith',mtProc,TypeInfo(_T15),[
TypeInfo(TPersistentClass),
TypeInfo(TPersistentClass)],Addr(GroupDescendentsWith),cRegister)}

{RegisterProc(nil,'ActivateClassGroup',mtProc,TypeInfo(_T16),[
TypeInfo(TPersistentClass),TypeInfo(TPersistentClass)],Addr(ActivateClassGroup),cRegister)}

{RegisterProc(nil,'ClassGroupOf',mtProc,TypeInfo(_T17),[
TypeInfo(TPersistentClass),TypeInfo(TPersistentClass)],Addr(ClassGroupOf),cRegister)}

{RegisterProc(nil,'RegisterComponents',mtProc,TypeInfo(_T18),[
TypeInfo(string),
ArrayInfo(TypeInfo(TComponentClass))],Addr(RegisterComponents),cRegister)}

{RegisterProc(nil,'RegisterNoIcon',mtProc,TypeInfo(_T19),[
ArrayInfo(TypeInfo(TComponentClass))],Addr(RegisterNoIcon),cRegister)}

{RegisterProc(nil,'RegisterNonActiveX',mtProc,TypeInfo(_T20),[
ArrayInfo(TypeInfo(TComponentClass)),
TypeInfo(TActiveXRegType)],Addr(RegisterNonActiveX),cRegister)}

{RegisterProc(nil,'RegisterIntegerConsts',mtProc,TypeInfo(_T21),[
TypeInfoPointer,
TypeInfo(TIdentToInt),
TypeInfo(TIntToIdent)],Addr(RegisterIntegerConsts),cRegister)}

{RegisterProc(nil,'UnregisterIntegerConsts',mtProc,TypeInfo(_T22),[
TypeInfoPointer,
TypeInfo(TIdentToInt),
TypeInfo(TIntToIdent)],Addr(UnregisterIntegerConsts),cRegister)}

{RegisterProc(nil,'RegisterFindGlobalComponentProc',mtProc,TypeInfo(_T23),[
TypeInfo(TFindGlobalComponent)],Addr(RegisterFindGlobalComponentProc),cRegister)}

{RegisterProc(nil,'UnregisterFindGlobalComponentProc',mtProc,TypeInfo(_T24),[
TypeInfo(TFindGlobalComponent)],Addr(UnregisterFindGlobalComponentProc),cRegister)}

{RegisterProc(nil,'FindIntToIdent',mtProc,TypeInfo(_T29),[
TypeInfoPointer,TypeInfo(TIntToIdent)],Addr(FindIntToIdent),cRegister)}

{RegisterProc(nil,'FindIdentToInt',mtProc,TypeInfo(_T30),[
TypeInfoPointer,TypeInfo(TIdentToInt)],Addr(FindIdentToInt),cRegister)}

{RegisterProc(nil,'InitInheritedComponent',mtProc,TypeInfo(_T31),[
TypeInfo(TComponent),
TypeInfo(TClass),TypeInfo(Boolean)],Addr(InitInheritedComponent),cRegister)}

{RegisterProc(nil,'LineStart',mtProc,TypeInfo(_T54),[
TypeInfoPChar,
TypeInfoPChar,TypeInfoPChar],Addr(LineStart),cRegister)}

{RegisterProc(nil,'ExtractStrings',mtProc,TypeInfo(_T55),[
TypeInfo(TSysCharSet),
TypeInfo(TSysCharSet),
TypeInfoPChar,
TypeInfo(TStrings),TypeInfo(Integer)],Addr(ExtractStrings),cRegister)}

{RegisterProc(nil,'BinToHex',mtProc,TypeInfo(_T56),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(Integer)],Addr(BinToHex),cRegister)}

{RegisterProc(nil,'HexToBin',mtProc,TypeInfo(_T57),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(Integer),TypeInfo(Integer)],Addr(HexToBin),cRegister)}

{RegisterProc(nil,'FindRootDesigner',mtProc,TypeInfo(_T58),[
TypeInfo(TPersistent),TypeInfo(IDesignerNotify)],Addr(FindRootDesigner),cRegister)}

{RegisterProc(nil,'CountGenerations',mtProc,TypeInfo(_T59),[
TypeInfo(TClass),
TypeInfo(TClass),TypeInfo(Integer)],Addr(CountGenerations),cRegister)}

{RegisterProc(nil,'MakeObjectInstance',mtProc,TypeInfo(_T61),[
TypeInfo(TWndMethod),TypeInfoPointer],Addr(MakeObjectInstance),cRegister)}

{RegisterProc(nil,'AllocateHWnd',mtProc,TypeInfo(_T63),[
TypeInfo(TWndMethod),TypeInfo(HWND)],Addr(AllocateHWnd),cRegister)}

{RegRegisterMethod(TBasicAction,'SetOnExecute',TypeInfo(_T66),[
TypeInfo(TNotifyEvent)], pointer(52))}

{RegRegisterMethod(TBasicActionLink,'SetOnExecute',TypeInfo(_T78),[
TypeInfo(TNotifyEvent)], pointer(16))}

{RegisterProc(TClassFinder,'Create',mtConstructor,TypeInfo(_T83),[
TypeInfo(TPersistentClass),
TypeInfo(Boolean)],Addr(TClassFinder.Create),cRegister)}

{RegRegisterMethod(TClassFinder,'GetClass',TypeInfo(_T84),[
TypeInfo(string),TypeInfo(TPersistentClass)],Addr(TClassFinder.GetClass))}

{RegRegisterMethod(TClassFinder,'GetClasses',TypeInfo(_T85),[
TypeInfo(TGetClass)],Addr(TClassFinder.GetClasses))}

{RegisterProc(TCollection,'Create',mtConstructor,TypeInfo(_T94),[
TypeInfo(TCollectionItemClass)],Addr(TCollection.Create),cRegister)}

{RegRegisterMethod(TComponent,'GetChildren',TypeInfo(_T108),[
TypeInfo(TGetChildProc),
TypeInfo(TComponent)], pointer(MinVMTOffset - 2))}

{RegRegisterMethod(TComponent,'IsImplementorOf',TypeInfo(_T140),[
TypeInfo(IInterface),TypeInfo(Boolean)],Addr(TComponent.IsImplementorOf))}

{RegRegisterMethod(TComponent,'ReferenceInterface',TypeInfo(_T141),[
TypeInfo(IInterface),
TypeInfo(TOperation),TypeInfo(Boolean)],Addr(TComponent.ReferenceInterface))}

{RegRegisterMethod(TFiler,'DefineProperty',TypeInfo(_T150),[
TypeInfo(string),
TypeInfo(TReaderProc),
TypeInfo(TWriterProc),
TypeInfo(Boolean)], pointer(4))}

{RegRegisterMethod(TFiler,'DefineBinaryProperty',TypeInfo(_T151),[
TypeInfo(string),
TypeInfo(TStreamProc),
TypeInfo(TStreamProc),
TypeInfo(Boolean)], pointer(8))}

{RegRegisterMethod(TInterfaceList,'First',TypeInfo(_T161),[TypeInfo(IInterface)],Addr(TInterfaceList.First))}

{RegRegisterMethod(TInterfaceList,'IndexOf',TypeInfo(_T162),[
TypeInfo(IInterface),TypeInfo(Integer)],Addr(TInterfaceList.IndexOf))}

{RegRegisterMethod(TInterfaceList,'Add',TypeInfo(_T163),[
TypeInfo(IInterface),TypeInfo(Integer)],Addr(TInterfaceList.Add))}

{RegRegisterMethod(TInterfaceList,'Insert',TypeInfo(_T164),[
TypeInfo(Integer),
TypeInfo(IInterface)],Addr(TInterfaceList.Insert))}

{RegRegisterMethod(TInterfaceList,'Last',TypeInfo(_T165),[TypeInfo(IInterface)],Addr(TInterfaceList.Last))}

{RegRegisterMethod(TInterfaceList,'Remove',TypeInfo(_T166),[
TypeInfo(IInterface),TypeInfo(Integer)],Addr(TInterfaceList.Remove))}

{RegRegisterMethod(TList,'Sort',TypeInfo(_T185),[
TypeInfo(TListSortCompare)],Addr(TList.Sort))}

{RegisterProc(TOwnedCollection,'Create',mtConstructor,TypeInfo(_T191),[
TypeInfo(TPersistent),
TypeInfo(TCollectionItemClass)],Addr(TOwnedCollection.Create),cRegister)}

{RegRegisterMethod(TParser,'TokenInt',TypeInfo(_T203),[TypeInfo(Int64)],Addr(TParser.TokenInt))}

{RegRegisterMethod(TReader,'FindAncestorComponent',TypeInfo(_T213),[
TypeInfo(string),
TypeInfo(TPersistentClass),TypeInfo(TComponent)], pointer(20))}

{RegRegisterMethod(TReader,'ReadComponents',TypeInfo(_T228),[
TypeInfo(TComponent),
TypeInfo(TComponent),
TypeInfo(TReadComponentsProc)],Addr(TReader.ReadComponents))}

{RegRegisterMethod(TReader,'ReadInt64',TypeInfo(_T235),[TypeInfo(Int64)],Addr(TReader.ReadInt64))}

{RegisterProc(TResourceStream,'Create',mtConstructor,TypeInfo(_T251),[
TypeInfo(THandle),
TypeInfo(string),
TypeInfoPChar],Addr(TResourceStream.Create),cRegister)}

{RegisterProc(TResourceStream,'CreateFromID',mtConstructor,TypeInfo(_T252),[
TypeInfo(THandle),
TypeInfo(Integer),
TypeInfoPChar],Addr(TResourceStream.CreateFromID),cRegister)}

{RegRegisterMethod(TStream,'CopyFrom',TypeInfo(_T259),[
TypeInfo(TStream),
TypeInfo(Int64),TypeInfo(Int64)],Addr(TStream.CopyFrom))}

{RegisterProc(TStreamAdapter,'Seek',mtMethod,TypeInfo(_T272),[
TypeInfo(Largeint),
TypeInfo(Longint),
TypeInfo(Largeint),TypeInfo(HResult)], pointer(8),cStdCall)}

{RegisterProc(TStreamAdapter,'SetSize',mtMethod,TypeInfo(_T273),[
TypeInfo(Largeint),TypeInfo(HResult)], pointer(12),cStdCall)}

{RegisterProc(TStreamAdapter,'CopyTo',mtMethod,TypeInfo(_T274),[
TypeInfo(IStream),
TypeInfo(Largeint),
TypeInfo(Largeint),
TypeInfo(Largeint),TypeInfo(HResult)], pointer(16),cStdCall)}

{RegisterProc(TStreamAdapter,'LockRegion',mtMethod,TypeInfo(_T277),[
TypeInfo(Largeint),
TypeInfo(Largeint),
TypeInfo(Longint),TypeInfo(HResult)], pointer(28),cStdCall)}

{RegisterProc(TStreamAdapter,'UnlockRegion',mtMethod,TypeInfo(_T278),[
TypeInfo(Largeint),
TypeInfo(Largeint),
TypeInfo(Longint),TypeInfo(HResult)], pointer(32),cStdCall)}

{RegisterProc(TStreamAdapter,'Clone',mtMethod,TypeInfo(_T280),[
TypeInfo(IStream),TypeInfo(HResult)], pointer(40),cStdCall)}

{RegRegisterMethod(TStringList,'CustomSort',TypeInfo(_T286),[
TypeInfo(TStringListSortCompare)], pointer(148))}

{RegRegisterMethod(TStrings,'SetText',TypeInfo(_T319),[
TypeInfoPChar], pointer(124))}

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

{RegisterEvent(TypeInfo(TGetClass),[
TypeInfo(TPersistentClass)]);}

RegisterEvent(TypeInfo(TGetModuleProc),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(string),
TypeInfo(string),
TypeInfo(TStrings)]);

RegisterEvent(TypeInfo(TGetStrProc),[
TypeInfo(string)]);

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

{RegisterEvent(TypeInfo(TWndMethod),[
TypeInfo(IDispatch)]);}

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
