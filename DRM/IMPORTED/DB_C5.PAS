{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit DB_C5;
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
  Graphics,
  Db;
function ConvertTBcdToVariant(var R : TBcd) : OleVariant;
function ConvertVariantToTBcd(const V : OleVariant) : TBcd;
function ConvertTDateTimeRecToVariant(var R : TDateTimeRec) : OleVariant;
function ConvertVariantToTDateTimeRec(const V : OleVariant) : TDateTimeRec;
function ConvertTGUIDToVariant(var R : TGUID) : OleVariant;
function ConvertVariantToTGUID(const V : OleVariant) : TGUID;
function ConvertTLookupListEntryToVariant(var R : TLookupListEntry) : OleVariant;
function ConvertVariantToTLookupListEntry(const V : OleVariant) : TLookupListEntry;
function ConvertTPacketAttributeToVariant(var R : TPacketAttribute) : OleVariant;
function ConvertVariantToTPacketAttribute(const V : OleVariant) : TPacketAttribute;
function ConvertTVarRecToVariant(var R : TVarRec) : OleVariant;
function ConvertVariantToTVarRec(const V : OleVariant) : TVarRec;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
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
type __TBcd__Wrapper = class(TDCRecordWrapper)
private
fR : TBcd;
public
function GetRecordPtr : pointer; override;
published
procedure setPrecision(const val : Byte);
function getPrecision : Byte;
property Precision : Byte read getPrecision write setPrecision;
procedure setSignSpecialPlaces(const val : Byte);
function getSignSpecialPlaces : Byte;
property SignSpecialPlaces : Byte read getSignSpecialPlaces write setSignSpecialPlaces;
end;
type __TDateTimeRec__Wrapper = class(TDCRecordWrapper)
private
fR : TDateTimeRec;
public
function GetRecordPtr : pointer; override;
published
procedure setDate(const val : Longint);
function getDate : Longint;
property Date : Longint read getDate write setDate;
procedure setTime(const val : Longint);
function getTime : Longint;
property Time : Longint read getTime write setTime;
end;
type __TLookupListEntry__Wrapper = class(TDCRecordWrapper)
private
fR : TLookupListEntry;
public
function GetRecordPtr : pointer; override;
published
procedure setKey(const val : Variant);
function getKey : Variant;
property Key : Variant read getKey write setKey;
procedure setValue(const val : Variant);
function getValue : Variant;
property Value : Variant read getValue write setValue;
end;
type __TPacketAttribute__Wrapper = class(TDCRecordWrapper)
private
fR : TPacketAttribute;
public
function GetRecordPtr : pointer; override;
published
procedure setName(const val : AnsiString);
function getName : AnsiString;
property Name : AnsiString read getName write setName;
procedure setValue(const val : OleVariant);
function getValue : OleVariant;
property Value : OleVariant read getValue write setValue;
procedure setIncludeInDelta(const val : Boolean);
function getIncludeInDelta : Boolean;
property IncludeInDelta : Boolean read getIncludeInDelta write setIncludeInDelta;
end;
type __TVarRec__Wrapper = class(TDCRecordWrapper)
private
fR : TVarRec;
public
function GetRecordPtr : pointer; override;
published
procedure setVInteger(const val : Integer);
function getVInteger : Integer;
property VInteger : Integer read getVInteger write setVInteger;
procedure setVType(const val : Byte);
function getVType : Byte;
property VType : Byte read getVType write setVType;
procedure setVBoolean(const val : Boolean);
function getVBoolean : Boolean;
property VBoolean : Boolean read getVBoolean write setVBoolean;
procedure setVChar(const val : Char);
function getVChar : Char;
property VChar : Char read getVChar write setVChar;
procedure setVObject(const val : TObject);
function getVObject : TObject;
property VObject : TObject read getVObject write setVObject;
procedure setVWideChar(const val : WideChar);
function getVWideChar : WideChar;
property VWideChar : WideChar read getVWideChar write setVWideChar;
end;
type __TDataSet__ = class(TDataSet);
type
_T0 = function (const p0 : string;
var p1 : Integer): string of object;

{_T1 = procedure (const p0 : Array of TFieldClass) of object;}

_T2 = procedure (const p0 : string;
p1 : TComponent) of object;

_T3 = procedure (const p0 : string;
const p1 : Array of Const;
p2 : TComponent) of object;

_T4 = procedure (var p0;
p1 : Integer) of object;

_T5 = function (p0 : Pointer;
p1 : Pointer;
p2 : Integer): Boolean of object;

_T6 = function (const p0 : IDispatch;
var p1 : Currency): Boolean of object;

_T8 = function (p0 : TDataSet;
p1 : TComponent;
const p2 : string): TField of object;

_T9 = function (p0 : Integer): TFieldType of object;

_T10 = procedure (p0 : string;
p1 : string;
p2 : Integer;
p3 : Integer;
p4 : Exception) of object;

_T11 = procedure (p0 : Pointer) of object;

_T12 = function : Pointer of object;

_T13 = function : Integer of object;

_T14 = procedure (const p0 : string) of object;

_T15 = procedure (p0 : TStream) of object;

_T16 = _T14;

_T17 = _T15;

_T18 = procedure (p0 : TPersistent) of object;

_T19 = function : TCheckConstraint of object;

_T20 = procedure  of object;

_T21 = _T20;

_T22 = function : Boolean of object;

_T23 = function (p0 : Integer): TDataSet of object;

_T24 = _T13;

_T26 = procedure (p0 : Boolean) of object;

_T27 = procedure (p0 : TObject) of object;

_T28 = _T20;

_T29 = _T20;

_T30 = _T20;

_T31 = _T20;

_T32 = procedure (p0 : TDataEvent;
p1 : Longint) of object;

_T33 = _T20;

_T34 = procedure (p0 : Integer) of object;

_T35 = _T20;

_T36 = procedure (p0 : TFieldRef) of object;

_T37 = _T13;

_T38 = _T22;

_T39 = _T13;

_T40 = _T22;

_T41 = _T13;

_T42 = _T20;

_T43 = function (p0 : Integer): Integer of object;

_T44 = procedure (p0 : TField) of object;

_T45 = _T34;

_T46 = _T34;

_T47 = _T20;

_T48 = _T20;

_T49 = _T22;

_T50 = function (p0 : TBasicAction): Boolean of object;

_T51 = _T50;

_T52 = _T20;

_T53 = _T26;

_T54 = _T20;

_T55 = function (const p0 : string;
p1 : TParams;
p2 : Pointer): Integer of object;

_T56 = procedure (p0 : TList) of object;

_T57 = function : TIndexDef of object;

_T58 = function : string of object;

_T59 = function : TParams of object;

_T60 = _T58;

_T61 = _T58;

_T62 = function (p0 : TIndexOptions): TIndexDefs of object;

_T63 = function (p0 : Exception;
p1 : EUpdateError): EUpdateError of object;

_T64 = _T22;

_T65 = _T22;

_T66 = _T22;

_T67 = _T20;

_T68 = procedure (p0 : TParams) of object;

_T69 = _T14;

_T70 = _T20;

_T71 = function (p0 : TUpdateKind;
p1 : TDataSet): Boolean of object;

_T72 = _T44;

{_T73 = procedure (p0 : PChar) of object;}

_T74 = _T20;

_T75 = procedure (p0 : TField;
p1 : TFieldDef) of object;

_T76 = _T20;

_T77 = _T20;

{_T78 = procedure (p0 : PChar) of object;}

_T79 = _T44;

_T80 = _T20;

_T81 = _T20;

_T82 = function (p0 : TDataSetField): TDataSet of object;

_T83 = procedure (p0 : TField;
p1 : Pointer;
p2 : Pointer;
p3 : Boolean) of object;

_T84 = _T32;

_T85 = _T27;

_T86 = _T20;

_T87 = _T20;

_T88 = _T20;

_T89 = _T20;

_T90 = _T20;

_T91 = _T20;

_T92 = _T20;

_T93 = _T20;

_T94 = _T20;

_T95 = _T20;

_T96 = _T20;

_T97 = _T20;

_T98 = _T20;

_T99 = _T20;

_T100 = _T20;

_T101 = _T20;

_T102 = _T20;

_T103 = _T20;

_T104 = _T20;

_T105 = _T20;

_T106 = _T20;

_T107 = function (p0 : Boolean;
p1 : Boolean): Boolean of object;

_T108 = _T20;

_T109 = function (p0 : TField): Variant of object;

_T110 = function (p0 : TGroupPosInd): Integer of object;

_T111 = _T20;

_T112 = function : TBookmarkStr of object;

{_T113 = procedure (p0 : PChar) of object;}

_T114 = _T22;

_T115 = function : TDataSource of object;

{_T116 = function (p0 : TFieldType): TFieldClass of object;}

_T117 = function (p0 : TField): string of object;

_T118 = function (p0 : TDataSetState;
p1 : TField): Variant of object;

_T119 = function (p0 : TField): Boolean of object;

_T120 = _T13;

_T121 = _T22;

_T122 = _T13;

_T123 = _T22;

_T124 = _T13;

_T125 = _T13;

_T126 = _T20;

{_T127 = procedure (p0 : PChar) of object;}

_T128 = _T20;

_T129 = _T20;

_T130 = _T20;

_T131 = _T20;

_T132 = _T26;

{_T133 = procedure (p0 : PChar) of object;}

_T134 = _T20;

_T135 = _T26;

_T136 = procedure (const p0 : TBookmarkStr) of object;

_T137 = _T34;

_T138 = _T34;

_T139 = procedure (const p0 : TDataSetField) of object;

_T140 = _T26;

_T141 = procedure (p0 : TFilterOptions) of object;

_T142 = _T14;

{_T143 = procedure (const p0 : TFilterRecordEvent) of object;}

_T144 = _T34;

_T145 = procedure (p0 : TDataSetState;
p1 : TField;
const p2 : Variant) of object;

_T146 = _T20;

_T147 = function : PChar of object;

{_T148 = procedure (var p0 : PChar) of object;}

{_T149 = procedure (p0 : PChar;
p1 : Pointer) of object;}

{_T150 = function (p0 : PChar): TBookmarkFlag of object;}

{_T151 = function (p0 : PChar;
p1 : TGetMode;
p2 : Boolean): TGetResult of object;}

_T152 = function : Word of object;

_T153 = procedure (p0 : Pointer;
p1 : Boolean) of object;

_T154 = _T20;

_T155 = _T20;

_T156 = _T20;

_T157 = _T11;

_T158 = _T20;

_T159 = _T20;

{_T160 = procedure (p0 : PChar) of object;}

_T161 = _T20;

_T162 = _T20;

_T163 = _T20;

{_T164 = procedure (p0 : PChar) of object;}

_T165 = _T22;

{_T166 = procedure (p0 : PChar;
p1 : TBookmarkFlag) of object;}

{_T167 = procedure (p0 : PChar;
p1 : Pointer) of object;}

_T168 = procedure (p0 : TField;
p1 : Pointer) of object;

_T169 = _T147;

_T170 = _T20;

_T171 = procedure (const p0 : Array of Const) of object;

_T172 = function (p0 : TBookmark): Boolean of object;

_T173 = _T20;

_T174 = _T20;

_T175 = _T20;

_T176 = _T20;

_T177 = _T22;

_T178 = function (p0 : TBookmark;
p1 : TBookmark): Integer of object;

_T179 = function (p0 : TField;
p1 : TBlobStreamMode): TStream of object;

_T180 = _T20;

_T181 = _T20;

_T182 = _T20;

_T183 = _T20;

_T184 = _T20;

_T185 = function (const p0 : string): TField of object;

_T186 = _T185;

_T187 = _T22;

_T188 = _T22;

_T189 = _T22;

_T190 = _T22;

_T191 = _T20;

_T192 = procedure (p0 : TBookmark) of object;

_T193 = function : TBookmark of object;

{_T194 = function (p0 : PChar): Boolean of object;}

_T195 = _T56;

_T196 = procedure (p0 : TList;
p1 : TList) of object;

_T197 = function (p0 : Integer;
var p1 : TBlobByteData): Integer of object;

_T198 = function (p0 : TField;
p1 : Pointer): Boolean of object;

_T199 = procedure (p0 : TList;
const p1 : string) of object;

_T200 = procedure (p0 : TStrings) of object;

_T201 = _T192;

_T202 = _T20;

_T203 = _T171;

_T204 = _T22;

_T205 = function (p0 : TDataSource): Boolean of object;

_T206 = _T22;

_T207 = _T20;

_T208 = function (const p0 : string;
const p1 : Variant;
p2 : TLocateOptions): Boolean of object;

_T209 = function (const p0 : string;
const p1 : Variant;
const p2 : string): Variant of object;

_T210 = _T43;

_T211 = _T20;

_T212 = _T20;

_T213 = _T20;

_T214 = _T20;

_T215 = _T20;

_T216 = procedure (p0 : TResyncMode) of object;

_T217 = _T171;

{_T218 = function (p0 : PChar;
p1 : PChar;
p2 : Boolean): Integer of object;}

_T219 = _T20;

_T220 = _T20;

_T221 = function : TUpdateStatus of object;

_T222 = procedure (p0 : TDataSet) of object;

_T223 = _T20;

_T224 = _T32;

_T225 = _T20;

_T226 = _T20;

_T227 = function (p0 : TDataSet): Boolean of object;

{_T228 = procedure (p0 : TDataSet;
p1 : TPersistent;
p2 : TCollectionItemClass) of object;}

_T229 = function (const p0 : string): TNamedItem of object;

_T230 = _T200;

_T231 = function (const p0 : string): Integer of object;

_T232 = function : TDataSet of object;

_T233 = function (const p0 : string): EDatabaseError of object;

_T234 = _T26;

_T235 = _T34;

_T236 = _T20;

_T237 = _T20;

_T238 = _T22;

_T239 = function : Variant of object;

_T240 = function : Currency of object;

_T241 = function : TDateTime of object;

_T242 = function : Double of object;

_T243 = function : Longint of object;

_T244 = _T58;

_T245 = _T239;

_T246 = _T22;

_T247 = _T58;

_T248 = _T13;

_T249 = procedure (p0 : Pointer;
p1 : Pointer) of object;

_T250 = _T13;

_T251 = _T13;

_T252 = _T22;

_T253 = _T22;

_T254 = _T13;

_T255 = procedure (var p0 : string;
p1 : Boolean) of object;

_T256 = _T26;

_T257 = procedure (const p0 : Variant) of object;

_T258 = procedure (p0 : Currency) of object;

_T259 = procedure (p0 : TDateTime) of object;

_T260 = procedure (p0 : Double) of object;

_T261 = procedure (p0 : Longint) of object;

_T262 = _T14;

_T263 = _T257;

_T264 = _T222;

_T265 = procedure (p0 : TFieldKind) of object;

_T266 = procedure (p0 : TObjectField) of object;

_T267 = _T34;

_T268 = _T14;

_T269 = _T257;

_T270 = procedure (const p0 : IDispatch) of object;

_T271 = _T20;

_T272 = _T20;

_T273 = function (p0 : Pointer;
p1 : Boolean): Boolean of object;

_T274 = _T22;

_T275 = function (p0 : Char): Boolean of object;

_T276 = _T20;

_T277 = _T153;

_T278 = procedure (p0 : TFieldType) of object;

_T279 = _T11;

_T280 = procedure (p0 : TFieldDefs;
const p1 : string;
p2 : TFieldType;
p3 : Integer;
p4 : Boolean;
p5 : Integer) of object;

_T281 = function : TFieldDef of object;

_T282 = function (p0 : TComponent;
p1 : TObjectField;
const p2 : string;
p3 : Boolean): TField of object;

_T283 = _T22;

_T284 = function (const p0 : string): TFieldDef of object;

_T285 = _T284;

_T286 = _T18;

_T287 = _T281;

_T288 = _T284;

_T289 = _T20;

_T290 = procedure (const p0 : string;
p1 : TFieldType;
p2 : Integer;
p3 : Boolean) of object;

_T291 = _T185;

_T292 = _T185;

_T293 = _T222;

_T294 = _T44;

_T295 = _T14;

_T296 = _T14;

_T297 = _T20;

_T298 = _T185;

_T299 = _T185;

_T300 = function (p0 : Integer): TField of object;

_T301 = _T200;

_T302 = function (p0 : TField): Integer of object;

_T303 = _T44;

_T304 = _T22;

_T305 = _T20;

_T306 = _T222;

_T307 = _T20;

_T308 = procedure (p0 : TIndexDefs;
const p1 : string;
const p2 : string;
p3 : TIndexOptions) of object;

_T309 = _T222;

_T310 = _T57;

_T311 = function (const p0 : string): TIndexDef of object;

_T312 = _T20;

_T313 = _T311;

_T314 = function (const p0 : string;
p1 : Boolean): TIndexDef of object;

_T315 = procedure (const p0 : string;
const p1 : string;
p2 : TIndexOptions) of object;

_T316 = _T20;

_T317 = procedure (const p0 : Variant;
const p1 : Variant) of object;

_T318 = _T20;

_T319 = function (const p0 : Variant): Variant of object;

_T320 = _T222;

_T321 = function : TFields of object;

_T322 = function (p0 : Integer): Variant of object;

_T323 = procedure (p0 : Integer;
const p1 : Variant) of object;

_T324 = procedure (p0 : TParams;
p1 : TParamType) of object;

_T325 = _T44;

_T326 = procedure (p0 : TField;
const p1 : Variant) of object;

_T327 = _T20;

_T328 = _T11;

_T329 = _T13;

_T330 = procedure (const p0 : string;
p1 : TBlobType) of object;

_T331 = procedure (p0 : TStream;
p1 : TBlobType) of object;

_T332 = procedure (p0 : Pointer;
p1 : Integer) of object;

_T333 = _T11;

_T334 = _T18;

_T335 = _T68;

_T336 = procedure (p0 : TParam) of object;

_T337 = _T336;

_T338 = function (p0 : TFieldType;
const p1 : string;
p2 : TParamType): TParam of object;

_T339 = _T199;

_T340 = function (p0 : TParams): Boolean of object;

_T341 = function (p0 : string;
p1 : Boolean): string of object;

_T342 = function (const p0 : string): TParam of object;

_T343 = _T342;

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
function __TBcd__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TBcd__Wrapper.setPrecision(const val : Byte);
begin
TBcd(GetRecordPtr^).Precision := val;
end;
function __TBcd__Wrapper.getPrecision : Byte;
begin
result := TBcd(GetRecordPtr^).Precision;
end;
procedure __TBcd__Wrapper.setSignSpecialPlaces(const val : Byte);
begin
TBcd(GetRecordPtr^).SignSpecialPlaces := val;
end;
function __TBcd__Wrapper.getSignSpecialPlaces : Byte;
begin
result := TBcd(GetRecordPtr^).SignSpecialPlaces;
end;
function __TDateTimeRec__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TDateTimeRec__Wrapper.setDate(const val : Longint);
begin
TDateTimeRec(GetRecordPtr^).Date := val;
end;
function __TDateTimeRec__Wrapper.getDate : Longint;
begin
result := TDateTimeRec(GetRecordPtr^).Date;
end;
procedure __TDateTimeRec__Wrapper.setTime(const val : Longint);
begin
TDateTimeRec(GetRecordPtr^).Time := val;
end;
function __TDateTimeRec__Wrapper.getTime : Longint;
begin
result := TDateTimeRec(GetRecordPtr^).Time;
end;
function __TLookupListEntry__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TLookupListEntry__Wrapper.setKey(const val : Variant);
begin
TLookupListEntry(GetRecordPtr^).Key := val;
end;
function __TLookupListEntry__Wrapper.getKey : Variant;
begin
result := TLookupListEntry(GetRecordPtr^).Key;
end;
procedure __TLookupListEntry__Wrapper.setValue(const val : Variant);
begin
TLookupListEntry(GetRecordPtr^).Value := val;
end;
function __TLookupListEntry__Wrapper.getValue : Variant;
begin
result := TLookupListEntry(GetRecordPtr^).Value;
end;
function __TPacketAttribute__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TPacketAttribute__Wrapper.setName(const val : AnsiString);
begin
TPacketAttribute(GetRecordPtr^).Name := val;
end;
function __TPacketAttribute__Wrapper.getName : AnsiString;
begin
result := TPacketAttribute(GetRecordPtr^).Name;
end;
procedure __TPacketAttribute__Wrapper.setValue(const val : OleVariant);
begin
TPacketAttribute(GetRecordPtr^).Value := val;
end;
function __TPacketAttribute__Wrapper.getValue : OleVariant;
begin
result := TPacketAttribute(GetRecordPtr^).Value;
end;
procedure __TPacketAttribute__Wrapper.setIncludeInDelta(const val : Boolean);
begin
TPacketAttribute(GetRecordPtr^).IncludeInDelta := val;
end;
function __TPacketAttribute__Wrapper.getIncludeInDelta : Boolean;
begin
result := TPacketAttribute(GetRecordPtr^).IncludeInDelta;
end;
function _TBcd_ : IDispatch;
begin
  result := __TBcd__Wrapper.Create;
end;
function _TDateTimeRec_ : IDispatch;
begin
  result := __TDateTimeRec__Wrapper.Create;
end;
function _TLookupListEntry_ : IDispatch;
begin
  result := __TLookupListEntry__Wrapper.Create;
end;
function _TPacketAttribute_ : IDispatch;
begin
  result := __TPacketAttribute__Wrapper.Create;
end;
function __TVarRec__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TVarRec__Wrapper.setVInteger(const val : Integer);
begin
TVarRec(GetRecordPtr^).VInteger := val;
end;
function __TVarRec__Wrapper.getVInteger : Integer;
begin
result := TVarRec(GetRecordPtr^).VInteger;
end;
procedure __TVarRec__Wrapper.setVType(const val : Byte);
begin
TVarRec(GetRecordPtr^).VType := val;
end;
function __TVarRec__Wrapper.getVType : Byte;
begin
result := TVarRec(GetRecordPtr^).VType;
end;
procedure __TVarRec__Wrapper.setVBoolean(const val : Boolean);
begin
TVarRec(GetRecordPtr^).VBoolean := val;
end;
function __TVarRec__Wrapper.getVBoolean : Boolean;
begin
result := TVarRec(GetRecordPtr^).VBoolean;
end;
procedure __TVarRec__Wrapper.setVChar(const val : Char);
begin
TVarRec(GetRecordPtr^).VChar := val;
end;
function __TVarRec__Wrapper.getVChar : Char;
begin
result := TVarRec(GetRecordPtr^).VChar;
end;
procedure __TVarRec__Wrapper.setVObject(const val : TObject);
begin
TVarRec(GetRecordPtr^).VObject := val;
end;
function __TVarRec__Wrapper.getVObject : TObject;
begin
result := TVarRec(GetRecordPtr^).VObject;
end;
procedure __TVarRec__Wrapper.setVWideChar(const val : WideChar);
begin
TVarRec(GetRecordPtr^).VWideChar := val;
end;
function __TVarRec__Wrapper.getVWideChar : WideChar;
begin
result := TVarRec(GetRecordPtr^).VWideChar;
end;
procedure ____DatabaseError__Wrapper(cArgs : integer; pArgs : PArgList);
begin
case cArgs of
1:
begin
DatabaseError(OleVariant(pargs^[0]));
end;
2:
begin
DatabaseError(OleVariant(pargs^[1]),TComponent(VarToObject(OleVariant(pargs^[0]))));
end;
end
end;

procedure ____DatabaseErrorFmt__Wrapper(const p0 : string;
const p1 : Array of Const;
p2 : TComponent);
begin
DatabaseErrorFmt(p0,p1,p2);
end;

function ____BCDToCurr__Wrapper(const p0 : IDispatch;
var p1 : Currency): Boolean;
var
__p0 : ^TBcd;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := BCDToCurr(__p0^,p1);
end;

function __TDataSet__PSExecuteStatement__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList) : OleVariant;
begin
case cArgs of
2:
begin
result := __TDataSet__(__Instance).PSExecuteStatement(OleVariant(pargs^[1]),TParams(VarToObject(OleVariant(pargs^[0]))));
end;
3:
begin
result := __TDataSet__(__Instance).PSExecuteStatement(OleVariant(pargs^[2]),TParams(VarToObject(OleVariant(pargs^[1]))),VarToPointer(OleVariant(pargs^[0])));
end;
end
end;

procedure __TDataSet__OpenCursor__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
0:
begin
__TDataSet__(__Instance).OpenCursor;
end;
1:
begin
__TDataSet__(__Instance).OpenCursor(OleVariant(pargs^[0]));
end;
end
end;

procedure __TField__AssignValue__Wrapper(__Instance : TField;
const p0 : IDispatch);
var
__p0 : ^TVarRec;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TField(__Instance).AssignValue(__p0^);
end;

function __TField__GetData__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList) : OleVariant;
begin
case cArgs of
1:
begin
result := TField(__Instance).GetData(VarToPointer(OleVariant(pargs^[0])));
end;
2:
begin
result := TField(__Instance).GetData(VarToPointer(OleVariant(pargs^[1])),OleVariant(pargs^[0]));
end;
end
end;

procedure __TField__SetData__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
1:
begin
TField(__Instance).SetData(VarToPointer(OleVariant(pargs^[0])));
end;
2:
begin
TField(__Instance).SetData(VarToPointer(OleVariant(pargs^[1])),OleVariant(pargs^[0]));
end;
end
end;

function __TFieldDef__CreateField__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList) : OleVariant;
begin
case cArgs of
1:
begin
result := VarFromObject(TFieldDef(__Instance).CreateField(TComponent(VarToObject(OleVariant(pargs^[0])))));
end;
2:
begin
result := VarFromObject(TFieldDef(__Instance).CreateField(TComponent(VarToObject(OleVariant(pargs^[1]))),TObjectField(VarToObject(OleVariant(pargs^[0])))));
end;
3:
begin
result := VarFromObject(TFieldDef(__Instance).CreateField(TComponent(VarToObject(OleVariant(pargs^[2]))),TObjectField(VarToObject(OleVariant(pargs^[1]))),OleVariant(pargs^[0])));
end;
4:
begin
result := VarFromObject(TFieldDef(__Instance).CreateField(TComponent(VarToObject(OleVariant(pargs^[3]))),TObjectField(VarToObject(OleVariant(pargs^[2]))),OleVariant(pargs^[1]),OleVariant(pargs^[0])));
end;
end
end;

procedure __TFieldDefs__Add__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
2:
begin
TFieldDefs(__Instance).Add(OleVariant(pargs^[1]),OleVariant(pargs^[0]));
end;
3:
begin
TFieldDefs(__Instance).Add(OleVariant(pargs^[2]),OleVariant(pargs^[1]),OleVariant(pargs^[0]));
end;
4:
begin
TFieldDefs(__Instance).Add(OleVariant(pargs^[3]),OleVariant(pargs^[2]),OleVariant(pargs^[1]),OleVariant(pargs^[0]));
end;
end
end;


type __TBcd__Wrapper__ = class(__TBcd__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TBcd__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTBcdToVariant(var R : TBcd) : OleVariant;
var
__rw : __TBcd__Wrapper__;
begin
__rw := __TBcd__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTBcd(const V : OleVariant) : TBcd;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TBcd((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TDateTimeRec__Wrapper__ = class(__TDateTimeRec__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TDateTimeRec__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTDateTimeRecToVariant(var R : TDateTimeRec) : OleVariant;
var
__rw : __TDateTimeRec__Wrapper__;
begin
__rw := __TDateTimeRec__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTDateTimeRec(const V : OleVariant) : TDateTimeRec;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TDateTimeRec((_idisp as IDCRecordWrapper).GetRecordPtr^);
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

type __TLookupListEntry__Wrapper__ = class(__TLookupListEntry__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TLookupListEntry__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTLookupListEntryToVariant(var R : TLookupListEntry) : OleVariant;
var
__rw : __TLookupListEntry__Wrapper__;
begin
__rw := __TLookupListEntry__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTLookupListEntry(const V : OleVariant) : TLookupListEntry;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TLookupListEntry((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TPacketAttribute__Wrapper__ = class(__TPacketAttribute__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TPacketAttribute__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTPacketAttributeToVariant(var R : TPacketAttribute) : OleVariant;
var
__rw : __TPacketAttribute__Wrapper__;
begin
__rw := __TPacketAttribute__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTPacketAttribute(const V : OleVariant) : TPacketAttribute;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TPacketAttribute((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TVarRec__Wrapper__ = class(__TVarRec__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TVarRec__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTVarRecToVariant(var R : TVarRec) : OleVariant;
var
__rw : __TVarRec__Wrapper__;
begin
__rw := __TVarRec__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTVarRec(const V : OleVariant) : TVarRec;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TVarRec((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetEUpdateError__Context(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := EUpdateError(Instance).Context;
end;

function __DC__GetEUpdateError__ErrorCode(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := EUpdateError(Instance).ErrorCode;
end;

function __DC__GetEUpdateError__PreviousError(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := EUpdateError(Instance).PreviousError;
end;

function __DC__GetEUpdateError__OriginalException(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(EUpdateError(Instance).OriginalException);
end;

function __DC__GetTAggregateField__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(TAggregateField(Instance).Handle);
end;

procedure __DC__SetTAggregateField__Handle(Instance : TObject; Params : PVariantArgList);
begin
TAggregateField(Instance).Handle:=VarToPointer(OleVariant(Params^[0]));
end;

function __DC__GetTAggregateField__ResultType(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TAggregateField(Instance).ResultType;
end;

procedure __DC__SetTAggregateField__ResultType(Instance : TObject; Params : PVariantArgList);
begin
TAggregateField(Instance).ResultType:=OleVariant(Params^[0]);
end;

function __DC__GetTArrayField__Size(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TArrayField(Instance).Size;
end;

procedure __DC__SetTArrayField__Size(Instance : TObject; Params : PVariantArgList);
begin
TArrayField(Instance).Size:=OleVariant(Params^[0]);
end;

function __DC__GetTBCDField__Value(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBCDField(Instance).Value;
end;

procedure __DC__SetTBCDField__Value(Instance : TObject; Params : PVariantArgList);
begin
TBCDField(Instance).Value:=OleVariant(Params^[0]);
end;

function __DC__GetTBlobField__BlobSize(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBlobField(Instance).BlobSize;
end;

function __DC__GetTBlobField__Modified(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBlobField(Instance).Modified;
end;

procedure __DC__SetTBlobField__Modified(Instance : TObject; Params : PVariantArgList);
begin
TBlobField(Instance).Modified:=OleVariant(Params^[0]);
end;

function __DC__GetTBlobField__Value(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBlobField(Instance).Value;
end;

procedure __DC__SetTBlobField__Value(Instance : TObject; Params : PVariantArgList);
begin
TBlobField(Instance).Value:=OleVariant(Params^[0]);
end;

function __DC__GetTBlobField__Transliterate(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBlobField(Instance).Transliterate;
end;

procedure __DC__SetTBlobField__Transliterate(Instance : TObject; Params : PVariantArgList);
begin
TBlobField(Instance).Transliterate:=OleVariant(Params^[0]);
end;

function __DC__GetTBooleanField__Value(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBooleanField(Instance).Value;
end;

procedure __DC__SetTBooleanField__Value(Instance : TObject; Params : PVariantArgList);
begin
TBooleanField(Instance).Value:=OleVariant(Params^[0]);
end;

function __DC__GetTCheckConstraints__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCheckConstraints(Instance).Items[OleVariant(Params^[0])]);
end;

procedure __DC__SetTCheckConstraints__Items(Instance : TObject; Params : PVariantArgList);
begin
TCheckConstraints(Instance).Items[OleVariant(Params^[1])]:=TCheckConstraint(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomConnection__Connected(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomConnection(Instance).Connected;
end;

procedure __DC__SetTCustomConnection__Connected(Instance : TObject; Params : PVariantArgList);
begin
TCustomConnection(Instance).Connected:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomConnection__DataSets(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomConnection(Instance).DataSets[OleVariant(Params^[0])]);
end;

function __DC__GetTCustomConnection__DataSetCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomConnection(Instance).DataSetCount;
end;

function __DC__GetTCustomConnection__LoginPrompt(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomConnection(Instance).LoginPrompt;
end;

procedure __DC__SetTCustomConnection__LoginPrompt(Instance : TObject; Params : PVariantArgList);
begin
TCustomConnection(Instance).LoginPrompt:=OleVariant(Params^[0]);
end;

function __DC__GetTDataLink__Active(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataLink(Instance).Active;
end;

function __DC__GetTDataLink__ActiveRecord(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataLink(Instance).ActiveRecord;
end;

procedure __DC__SetTDataLink__ActiveRecord(Instance : TObject; Params : PVariantArgList);
begin
TDataLink(Instance).ActiveRecord:=OleVariant(Params^[0]);
end;

function __DC__GetTDataLink__BOF(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataLink(Instance).BOF;
end;

function __DC__GetTDataLink__BufferCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataLink(Instance).BufferCount;
end;

procedure __DC__SetTDataLink__BufferCount(Instance : TObject; Params : PVariantArgList);
begin
TDataLink(Instance).BufferCount:=OleVariant(Params^[0]);
end;

function __DC__GetTDataLink__DataSet(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDataLink(Instance).DataSet);
end;

function __DC__GetTDataLink__DataSource(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDataLink(Instance).DataSource);
end;

procedure __DC__SetTDataLink__DataSource(Instance : TObject; Params : PVariantArgList);
begin
TDataLink(Instance).DataSource:=TDataSource(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTDataLink__DataSourceFixed(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataLink(Instance).DataSourceFixed;
end;

procedure __DC__SetTDataLink__DataSourceFixed(Instance : TObject; Params : PVariantArgList);
begin
TDataLink(Instance).DataSourceFixed:=OleVariant(Params^[0]);
end;

function __DC__GetTDataLink__Editing(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataLink(Instance).Editing;
end;

function __DC__GetTDataLink__Eof(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataLink(Instance).Eof;
end;

function __DC__GetTDataLink__ReadOnly(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataLink(Instance).ReadOnly;
end;

procedure __DC__SetTDataLink__ReadOnly(Instance : TObject; Params : PVariantArgList);
begin
TDataLink(Instance).ReadOnly:=OleVariant(Params^[0]);
end;

function __DC__GetTDataLink__RecordCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataLink(Instance).RecordCount;
end;

function __DC__GetTDataSet__AggFields(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDataSet(Instance).AggFields);
end;

function __DC__GetTDataSet__BOF(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataSet(Instance).BOF;
end;

function __DC__GetTDataSet__Bookmark(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataSet(Instance).Bookmark;
end;

procedure __DC__SetTDataSet__Bookmark(Instance : TObject; Params : PVariantArgList);
begin
TDataSet(Instance).Bookmark:=OleVariant(Params^[0]);
end;

function __DC__GetTDataSet__CanModify(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataSet(Instance).CanModify;
end;

function __DC__GetTDataSet__DataSetField(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDataSet(Instance).DataSetField);
end;

procedure __DC__SetTDataSet__DataSetField(Instance : TObject; Params : PVariantArgList);
begin
TDataSet(Instance).DataSetField:=TDataSetField(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTDataSet__DataSource(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDataSet(Instance).DataSource);
end;

function __DC__GetTDataSet__DefaultFields(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataSet(Instance).DefaultFields;
end;

function __DC__GetTDataSet__Designer(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDataSet(Instance).Designer);
end;

function __DC__GetTDataSet__Eof(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataSet(Instance).Eof;
end;

function __DC__GetTDataSet__BlockReadSize(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataSet(Instance).BlockReadSize;
end;

procedure __DC__SetTDataSet__BlockReadSize(Instance : TObject; Params : PVariantArgList);
begin
TDataSet(Instance).BlockReadSize:=OleVariant(Params^[0]);
end;

function __DC__GetTDataSet__FieldCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataSet(Instance).FieldCount;
end;

function __DC__GetTDataSet__FieldDefs(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDataSet(Instance).FieldDefs);
end;

procedure __DC__SetTDataSet__FieldDefs(Instance : TObject; Params : PVariantArgList);
begin
TDataSet(Instance).FieldDefs:=TFieldDefs(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTDataSet__FieldDefList(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDataSet(Instance).FieldDefList);
end;

function __DC__GetTDataSet__Fields(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDataSet(Instance).Fields);
end;

function __DC__GetTDataSet__FieldList(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDataSet(Instance).FieldList);
end;

function __DC__GetTDataSet__FieldValues(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataSet(Instance).FieldValues[OleVariant(Params^[0])];
end;

procedure __DC__SetTDataSet__FieldValues(Instance : TObject; Params : PVariantArgList);
begin
TDataSet(Instance).FieldValues[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTDataSet__Found(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataSet(Instance).Found;
end;

function __DC__GetTDataSet__Modified(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataSet(Instance).Modified;
end;

function __DC__GetTDataSet__ObjectView(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataSet(Instance).ObjectView;
end;

procedure __DC__SetTDataSet__ObjectView(Instance : TObject; Params : PVariantArgList);
begin
TDataSet(Instance).ObjectView:=OleVariant(Params^[0]);
end;

function __DC__GetTDataSet__RecordCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataSet(Instance).RecordCount;
end;

function __DC__GetTDataSet__RecNo(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataSet(Instance).RecNo;
end;

procedure __DC__SetTDataSet__RecNo(Instance : TObject; Params : PVariantArgList);
begin
TDataSet(Instance).RecNo:=OleVariant(Params^[0]);
end;

function __DC__GetTDataSet__RecordSize(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataSet(Instance).RecordSize;
end;

function __DC__GetTDataSet__SparseArrays(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataSet(Instance).SparseArrays;
end;

procedure __DC__SetTDataSet__SparseArrays(Instance : TObject; Params : PVariantArgList);
begin
TDataSet(Instance).SparseArrays:=OleVariant(Params^[0]);
end;

function __DC__GetTDataSet__State(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataSet(Instance).State;
end;

function __DC__GetTDataSet__Filter(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataSet(Instance).Filter;
end;

procedure __DC__SetTDataSet__Filter(Instance : TObject; Params : PVariantArgList);
begin
TDataSet(Instance).Filter:=OleVariant(Params^[0]);
end;

function __DC__GetTDataSet__Filtered(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataSet(Instance).Filtered;
end;

procedure __DC__SetTDataSet__Filtered(Instance : TObject; Params : PVariantArgList);
begin
TDataSet(Instance).Filtered:=OleVariant(Params^[0]);
end;

function __DC__GetTDataSet__FilterOptions(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TFilterOptions;
begin
tmp := TDataSet(Instance).FilterOptions;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTDataSet__FilterOptions(Instance : TObject; Params : PVariantArgList);
var
  tmp : TFilterOptions;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TDataSet(Instance).FilterOptions:=tmp;
end;

function __DC__GetTDataSet__Active(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataSet(Instance).Active;
end;

procedure __DC__SetTDataSet__Active(Instance : TObject; Params : PVariantArgList);
begin
TDataSet(Instance).Active:=OleVariant(Params^[0]);
end;

function __DC__GetTDataSet__AutoCalcFields(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataSet(Instance).AutoCalcFields;
end;

procedure __DC__SetTDataSet__AutoCalcFields(Instance : TObject; Params : PVariantArgList);
begin
TDataSet(Instance).AutoCalcFields:=OleVariant(Params^[0]);
end;

function __DC__GetTDataSetDesigner__DataSet(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDataSetDesigner(Instance).DataSet);
end;

function __DC__GetTDataSetField__NestedDataSet(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDataSetField(Instance).NestedDataSet);
end;

function __DC__GetTDataSource__State(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataSource(Instance).State;
end;

function __DC__GetTDateTimeField__Value(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDateTimeField(Instance).Value;
end;

procedure __DC__SetTDateTimeField__Value(Instance : TObject; Params : PVariantArgList);
begin
TDateTimeField(Instance).Value:=OleVariant(Params^[0]);
end;

function __DC__GetTDefCollection__DataSet(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDefCollection(Instance).DataSet);
end;

function __DC__GetTDefCollection__Updated(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDefCollection(Instance).Updated;
end;

procedure __DC__SetTDefCollection__Updated(Instance : TObject; Params : PVariantArgList);
begin
TDefCollection(Instance).Updated:=OleVariant(Params^[0]);
end;

function __DC__GetTDetailDataLink__DetailDataSet(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDetailDataLink(Instance).DetailDataSet);
end;

function __DC__GetTField__AsBoolean(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).AsBoolean;
end;

procedure __DC__SetTField__AsBoolean(Instance : TObject; Params : PVariantArgList);
begin
TField(Instance).AsBoolean:=OleVariant(Params^[0]);
end;

function __DC__GetTField__AsCurrency(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).AsCurrency;
end;

procedure __DC__SetTField__AsCurrency(Instance : TObject; Params : PVariantArgList);
begin
TField(Instance).AsCurrency:=OleVariant(Params^[0]);
end;

function __DC__GetTField__AsDateTime(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).AsDateTime;
end;

procedure __DC__SetTField__AsDateTime(Instance : TObject; Params : PVariantArgList);
begin
TField(Instance).AsDateTime:=OleVariant(Params^[0]);
end;

function __DC__GetTField__AsFloat(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).AsFloat;
end;

procedure __DC__SetTField__AsFloat(Instance : TObject; Params : PVariantArgList);
begin
TField(Instance).AsFloat:=OleVariant(Params^[0]);
end;

function __DC__GetTField__AsInteger(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).AsInteger;
end;

procedure __DC__SetTField__AsInteger(Instance : TObject; Params : PVariantArgList);
begin
TField(Instance).AsInteger:=OleVariant(Params^[0]);
end;

function __DC__GetTField__AsString(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).AsString;
end;

procedure __DC__SetTField__AsString(Instance : TObject; Params : PVariantArgList);
begin
TField(Instance).AsString:=OleVariant(Params^[0]);
end;

function __DC__GetTField__AsVariant(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).AsVariant;
end;

procedure __DC__SetTField__AsVariant(Instance : TObject; Params : PVariantArgList);
begin
TField(Instance).AsVariant:=OleVariant(Params^[0]);
end;

function __DC__GetTField__AttributeSet(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).AttributeSet;
end;

procedure __DC__SetTField__AttributeSet(Instance : TObject; Params : PVariantArgList);
begin
TField(Instance).AttributeSet:=OleVariant(Params^[0]);
end;

function __DC__GetTField__Calculated(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).Calculated;
end;

procedure __DC__SetTField__Calculated(Instance : TObject; Params : PVariantArgList);
begin
TField(Instance).Calculated:=OleVariant(Params^[0]);
end;

function __DC__GetTField__CanModify(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).CanModify;
end;

function __DC__GetTField__CurValue(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).CurValue;
end;

function __DC__GetTField__DataSet(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TField(Instance).DataSet);
end;

procedure __DC__SetTField__DataSet(Instance : TObject; Params : PVariantArgList);
begin
TField(Instance).DataSet:=TDataSet(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTField__DataSize(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).DataSize;
end;

function __DC__GetTField__DataType(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).DataType;
end;

function __DC__GetTField__DisplayName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).DisplayName;
end;

function __DC__GetTField__DisplayText(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).DisplayText;
end;

function __DC__GetTField__EditMask(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).EditMask;
end;

procedure __DC__SetTField__EditMask(Instance : TObject; Params : PVariantArgList);
begin
TField(Instance).EditMask:=OleVariant(Params^[0]);
end;

function __DC__GetTField__EditMaskPtr(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).EditMaskPtr;
end;

function __DC__GetTField__FieldNo(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).FieldNo;
end;

function __DC__GetTField__FullName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).FullName;
end;

function __DC__GetTField__IsIndexField(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).IsIndexField;
end;

function __DC__GetTField__IsNull(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).IsNull;
end;

function __DC__GetTField__Lookup(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).Lookup;
end;

procedure __DC__SetTField__Lookup(Instance : TObject; Params : PVariantArgList);
begin
TField(Instance).Lookup:=OleVariant(Params^[0]);
end;

function __DC__GetTField__LookupList(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TField(Instance).LookupList);
end;

function __DC__GetTField__NewValue(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).NewValue;
end;

procedure __DC__SetTField__NewValue(Instance : TObject; Params : PVariantArgList);
begin
TField(Instance).NewValue:=OleVariant(Params^[0]);
end;

function __DC__GetTField__Offset(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).Offset;
end;

function __DC__GetTField__OldValue(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).OldValue;
end;

function __DC__GetTField__ParentField(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TField(Instance).ParentField);
end;

procedure __DC__SetTField__ParentField(Instance : TObject; Params : PVariantArgList);
begin
TField(Instance).ParentField:=TObjectField(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTField__Size(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).Size;
end;

procedure __DC__SetTField__Size(Instance : TObject; Params : PVariantArgList);
begin
TField(Instance).Size:=OleVariant(Params^[0]);
end;

function __DC__GetTField__Text(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).Text;
end;

procedure __DC__SetTField__Text(Instance : TObject; Params : PVariantArgList);
begin
TField(Instance).Text:=OleVariant(Params^[0]);
end;

function __DC__GetTField__ValidChars(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TFieldChars;
begin
tmp := TField(Instance).ValidChars;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTField__ValidChars(Instance : TObject; Params : PVariantArgList);
var
  tmp : TFieldChars;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TField(Instance).ValidChars:=tmp;
end;

function __DC__GetTField__Value(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TField(Instance).Value;
end;

procedure __DC__SetTField__Value(Instance : TObject; Params : PVariantArgList);
begin
TField(Instance).Value:=OleVariant(Params^[0]);
end;

function __DC__GetTFieldDef__FieldNo(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFieldDef(Instance).FieldNo;
end;

procedure __DC__SetTFieldDef__FieldNo(Instance : TObject; Params : PVariantArgList);
begin
TFieldDef(Instance).FieldNo:=OleVariant(Params^[0]);
end;

function __DC__GetTFieldDef__InternalCalcField(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFieldDef(Instance).InternalCalcField;
end;

procedure __DC__SetTFieldDef__InternalCalcField(Instance : TObject; Params : PVariantArgList);
begin
TFieldDef(Instance).InternalCalcField:=OleVariant(Params^[0]);
end;

function __DC__GetTFieldDef__ParentDef(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TFieldDef(Instance).ParentDef);
end;

function __DC__GetTFieldDef__Required(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFieldDef(Instance).Required;
end;

procedure __DC__SetTFieldDef__Required(Instance : TObject; Params : PVariantArgList);
begin
TFieldDef(Instance).Required:=OleVariant(Params^[0]);
end;

function __DC__GetTFieldDefList__FieldDefs(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TFieldDefList(Instance).FieldDefs[OleVariant(Params^[0])]);
end;

function __DC__GetTFieldDefs__HiddenFields(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFieldDefs(Instance).HiddenFields;
end;

procedure __DC__SetTFieldDefs__HiddenFields(Instance : TObject; Params : PVariantArgList);
begin
TFieldDefs(Instance).HiddenFields:=OleVariant(Params^[0]);
end;

function __DC__GetTFieldDefs__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TFieldDefs(Instance).Items[OleVariant(Params^[0])]);
end;

procedure __DC__SetTFieldDefs__Items(Instance : TObject; Params : PVariantArgList);
begin
TFieldDefs(Instance).Items[OleVariant(Params^[1])]:=TFieldDef(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTFieldDefs__ParentDef(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TFieldDefs(Instance).ParentDef);
end;

function __DC__GetTFieldList__Fields(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TFieldList(Instance).Fields[OleVariant(Params^[0])]);
end;

function __DC__GetTFields__Count(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFields(Instance).Count;
end;

function __DC__GetTFields__DataSet(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TFields(Instance).DataSet);
end;

function __DC__GetTFields__Fields(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TFields(Instance).Fields[OleVariant(Params^[0])]);
end;

procedure __DC__SetTFields__Fields(Instance : TObject; Params : PVariantArgList);
begin
TFields(Instance).Fields[OleVariant(Params^[1])]:=TField(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTFlatList__DataSet(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TFlatList(Instance).DataSet);
end;

function __DC__GetTFloatField__Value(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFloatField(Instance).Value;
end;

procedure __DC__SetTFloatField__Value(Instance : TObject; Params : PVariantArgList);
begin
TFloatField(Instance).Value:=OleVariant(Params^[0]);
end;

function __DC__GetTGuidField__AsGuid(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TGUID__Wrapper;
begin
__wrapper := __TGUID__Wrapper.Create;
__wrapper.fR := TGuidField(Instance).AsGuid;
result := IUnknown(__wrapper) as IDispatch;
end;

procedure __DC__SetTGuidField__AsGuid(Instance : TObject; Params : PVariantArgList);
var
__idisp:IDispatch;
__iwrapper:IDCRecordWrapper;
begin
__idisp:=DCVarToInterface(OleVariant(Params^[0]));
if __idisp=nil then exit;
__idisp.QueryInterface(IDCRecordWrapper, __iwrapper);
TGuidField(Instance).AsGuid:=TGUID(__iwrapper.GetRecordPtr^);
end;

function __DC__GetTIndexDef__FieldExpression(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TIndexDef(Instance).FieldExpression;
end;

function __DC__GetTIndexDefs__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TIndexDefs(Instance).Items[OleVariant(Params^[0])]);
end;

procedure __DC__SetTIndexDefs__Items(Instance : TObject; Params : PVariantArgList);
begin
TIndexDefs(Instance).Items[OleVariant(Params^[1])]:=TIndexDef(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTIntegerField__Value(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TIntegerField(Instance).Value;
end;

procedure __DC__SetTIntegerField__Value(Instance : TObject; Params : PVariantArgList);
begin
TIntegerField(Instance).Value:=OleVariant(Params^[0]);
end;

function __DC__GetTMasterDataLink__FieldNames(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMasterDataLink(Instance).FieldNames;
end;

procedure __DC__SetTMasterDataLink__FieldNames(Instance : TObject; Params : PVariantArgList);
begin
TMasterDataLink(Instance).FieldNames:=OleVariant(Params^[0]);
end;

function __DC__GetTMasterDataLink__Fields(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TMasterDataLink(Instance).Fields);
end;

function __DC__GetTObjectField__FieldCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TObjectField(Instance).FieldCount;
end;

function __DC__GetTObjectField__Fields(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TObjectField(Instance).Fields);
end;

function __DC__GetTObjectField__FieldValues(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TObjectField(Instance).FieldValues[OleVariant(Params^[0])];
end;

procedure __DC__SetTObjectField__FieldValues(Instance : TObject; Params : PVariantArgList);
begin
TObjectField(Instance).FieldValues[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTObjectField__UnNamed(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TObjectField(Instance).UnNamed;
end;

function __DC__GetTParam__AsBCD(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParam(Instance).AsBCD;
end;

procedure __DC__SetTParam__AsBCD(Instance : TObject; Params : PVariantArgList);
begin
TParam(Instance).AsBCD:=OleVariant(Params^[0]);
end;

function __DC__GetTParam__AsBlob(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParam(Instance).AsBlob;
end;

procedure __DC__SetTParam__AsBlob(Instance : TObject; Params : PVariantArgList);
begin
TParam(Instance).AsBlob:=OleVariant(Params^[0]);
end;

function __DC__GetTParam__AsBoolean(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParam(Instance).AsBoolean;
end;

procedure __DC__SetTParam__AsBoolean(Instance : TObject; Params : PVariantArgList);
begin
TParam(Instance).AsBoolean:=OleVariant(Params^[0]);
end;

function __DC__GetTParam__AsCurrency(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParam(Instance).AsCurrency;
end;

procedure __DC__SetTParam__AsCurrency(Instance : TObject; Params : PVariantArgList);
begin
TParam(Instance).AsCurrency:=OleVariant(Params^[0]);
end;

function __DC__GetTParam__AsDate(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParam(Instance).AsDate;
end;

procedure __DC__SetTParam__AsDate(Instance : TObject; Params : PVariantArgList);
begin
TParam(Instance).AsDate:=OleVariant(Params^[0]);
end;

function __DC__GetTParam__AsDateTime(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParam(Instance).AsDateTime;
end;

procedure __DC__SetTParam__AsDateTime(Instance : TObject; Params : PVariantArgList);
begin
TParam(Instance).AsDateTime:=OleVariant(Params^[0]);
end;

function __DC__GetTParam__AsFloat(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParam(Instance).AsFloat;
end;

procedure __DC__SetTParam__AsFloat(Instance : TObject; Params : PVariantArgList);
begin
TParam(Instance).AsFloat:=OleVariant(Params^[0]);
end;

function __DC__GetTParam__AsInteger(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParam(Instance).AsInteger;
end;

procedure __DC__SetTParam__AsInteger(Instance : TObject; Params : PVariantArgList);
begin
TParam(Instance).AsInteger:=OleVariant(Params^[0]);
end;

function __DC__GetTParam__AsSmallInt(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParam(Instance).AsSmallInt;
end;

procedure __DC__SetTParam__AsSmallInt(Instance : TObject; Params : PVariantArgList);
begin
TParam(Instance).AsSmallInt:=OleVariant(Params^[0]);
end;

function __DC__GetTParam__AsMemo(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParam(Instance).AsMemo;
end;

procedure __DC__SetTParam__AsMemo(Instance : TObject; Params : PVariantArgList);
begin
TParam(Instance).AsMemo:=OleVariant(Params^[0]);
end;

function __DC__GetTParam__AsString(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParam(Instance).AsString;
end;

procedure __DC__SetTParam__AsString(Instance : TObject; Params : PVariantArgList);
begin
TParam(Instance).AsString:=OleVariant(Params^[0]);
end;

function __DC__GetTParam__AsTime(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParam(Instance).AsTime;
end;

procedure __DC__SetTParam__AsTime(Instance : TObject; Params : PVariantArgList);
begin
TParam(Instance).AsTime:=OleVariant(Params^[0]);
end;

function __DC__GetTParam__AsWord(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParam(Instance).AsWord;
end;

procedure __DC__SetTParam__AsWord(Instance : TObject; Params : PVariantArgList);
begin
TParam(Instance).AsWord:=OleVariant(Params^[0]);
end;

function __DC__GetTParam__Bound(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParam(Instance).Bound;
end;

procedure __DC__SetTParam__Bound(Instance : TObject; Params : PVariantArgList);
begin
TParam(Instance).Bound:=OleVariant(Params^[0]);
end;

function __DC__GetTParam__IsNull(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParam(Instance).IsNull;
end;

function __DC__GetTParam__NativeStr(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParam(Instance).NativeStr;
end;

procedure __DC__SetTParam__NativeStr(Instance : TObject; Params : PVariantArgList);
begin
TParam(Instance).NativeStr:=OleVariant(Params^[0]);
end;

function __DC__GetTParam__Text(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParam(Instance).Text;
end;

procedure __DC__SetTParam__Text(Instance : TObject; Params : PVariantArgList);
begin
TParam(Instance).Text:=OleVariant(Params^[0]);
end;

function __DC__GetTParams__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TParams(Instance).Items[OleVariant(Params^[0])]);
end;

procedure __DC__SetTParams__Items(Instance : TObject; Params : PVariantArgList);
begin
TParams(Instance).Items[OleVariant(Params^[1])]:=TParam(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTParams__ParamValues(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParams(Instance).ParamValues[OleVariant(Params^[0])];
end;

procedure __DC__SetTParams__ParamValues(Instance : TObject; Params : PVariantArgList);
begin
TParams(Instance).ParamValues[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTStringField__Value(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStringField(Instance).Value;
end;

procedure __DC__SetTStringField__Value(Instance : TObject; Params : PVariantArgList);
begin
TStringField(Instance).Value:=OleVariant(Params^[0]);
end;

function __DC__GetTWideStringField__Value(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWideStringField(Instance).Value;
end;

procedure __DC__SetTWideStringField__Value(Instance : TObject; Params : PVariantArgList);
begin
TWideStringField(Instance).Value:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
RegisterProperty(EUpdateError,'Context',__DC__GetEUpdateError__Context,nil);
RegisterProperty(EUpdateError,'ErrorCode',__DC__GetEUpdateError__ErrorCode,nil);
RegisterProperty(EUpdateError,'PreviousError',__DC__GetEUpdateError__PreviousError,nil);
RegisterProperty(EUpdateError,'OriginalException',__DC__GetEUpdateError__OriginalException,nil);
RegisterProperty(TAggregateField,'Handle',__DC__GetTAggregateField__Handle,__DC__SetTAggregateField__Handle);
RegisterProperty(TAggregateField,'ResultType',__DC__GetTAggregateField__ResultType,__DC__SetTAggregateField__ResultType);
RegisterProperty(TArrayField,'Size',__DC__GetTArrayField__Size,__DC__SetTArrayField__Size);
RegisterProperty(TBCDField,'Value',__DC__GetTBCDField__Value,__DC__SetTBCDField__Value);
RegisterProperty(TBlobField,'BlobSize',__DC__GetTBlobField__BlobSize,nil);
RegisterProperty(TBlobField,'Modified',__DC__GetTBlobField__Modified,__DC__SetTBlobField__Modified);
RegisterProperty(TBlobField,'Value',__DC__GetTBlobField__Value,__DC__SetTBlobField__Value);
RegisterProperty(TBlobField,'Transliterate',__DC__GetTBlobField__Transliterate,__DC__SetTBlobField__Transliterate);
RegisterProperty(TBooleanField,'Value',__DC__GetTBooleanField__Value,__DC__SetTBooleanField__Value);
RegisterIndexedProperty(TCheckConstraints,'Items',1,True,__DC__GetTCheckConstraints__Items,__DC__SetTCheckConstraints__Items);
RegisterProperty(TCustomConnection,'Connected',__DC__GetTCustomConnection__Connected,__DC__SetTCustomConnection__Connected);
RegisterIndexedProperty(TCustomConnection,'DataSets',1,False,__DC__GetTCustomConnection__DataSets,nil);
RegisterProperty(TCustomConnection,'DataSetCount',__DC__GetTCustomConnection__DataSetCount,nil);
RegisterProperty(TCustomConnection,'LoginPrompt',__DC__GetTCustomConnection__LoginPrompt,__DC__SetTCustomConnection__LoginPrompt);
RegisterProperty(TDataLink,'Active',__DC__GetTDataLink__Active,nil);
RegisterProperty(TDataLink,'ActiveRecord',__DC__GetTDataLink__ActiveRecord,__DC__SetTDataLink__ActiveRecord);
RegisterProperty(TDataLink,'BOF',__DC__GetTDataLink__BOF,nil);
RegisterProperty(TDataLink,'BufferCount',__DC__GetTDataLink__BufferCount,__DC__SetTDataLink__BufferCount);
RegisterProperty(TDataLink,'DataSet',__DC__GetTDataLink__DataSet,nil);
RegisterProperty(TDataLink,'DataSource',__DC__GetTDataLink__DataSource,__DC__SetTDataLink__DataSource);
RegisterProperty(TDataLink,'DataSourceFixed',__DC__GetTDataLink__DataSourceFixed,__DC__SetTDataLink__DataSourceFixed);
RegisterProperty(TDataLink,'Editing',__DC__GetTDataLink__Editing,nil);
RegisterProperty(TDataLink,'Eof',__DC__GetTDataLink__Eof,nil);
RegisterProperty(TDataLink,'ReadOnly',__DC__GetTDataLink__ReadOnly,__DC__SetTDataLink__ReadOnly);
RegisterProperty(TDataLink,'RecordCount',__DC__GetTDataLink__RecordCount,nil);
RegisterProperty(TDataSet,'AggFields',__DC__GetTDataSet__AggFields,nil);
RegisterProperty(TDataSet,'BOF',__DC__GetTDataSet__BOF,nil);
RegisterProperty(TDataSet,'Bookmark',__DC__GetTDataSet__Bookmark,__DC__SetTDataSet__Bookmark);
RegisterProperty(TDataSet,'CanModify',__DC__GetTDataSet__CanModify,nil);
RegisterProperty(TDataSet,'DataSetField',__DC__GetTDataSet__DataSetField,__DC__SetTDataSet__DataSetField);
RegisterProperty(TDataSet,'DataSource',__DC__GetTDataSet__DataSource,nil);
RegisterProperty(TDataSet,'DefaultFields',__DC__GetTDataSet__DefaultFields,nil);
RegisterProperty(TDataSet,'Designer',__DC__GetTDataSet__Designer,nil);
RegisterProperty(TDataSet,'Eof',__DC__GetTDataSet__Eof,nil);
RegisterProperty(TDataSet,'BlockReadSize',__DC__GetTDataSet__BlockReadSize,__DC__SetTDataSet__BlockReadSize);
RegisterProperty(TDataSet,'FieldCount',__DC__GetTDataSet__FieldCount,nil);
RegisterProperty(TDataSet,'FieldDefs',__DC__GetTDataSet__FieldDefs,__DC__SetTDataSet__FieldDefs);
RegisterProperty(TDataSet,'FieldDefList',__DC__GetTDataSet__FieldDefList,nil);
RegisterProperty(TDataSet,'Fields',__DC__GetTDataSet__Fields,nil);
RegisterProperty(TDataSet,'FieldList',__DC__GetTDataSet__FieldList,nil);
RegisterIndexedProperty(TDataSet,'FieldValues',1,True,__DC__GetTDataSet__FieldValues,__DC__SetTDataSet__FieldValues);
RegisterProperty(TDataSet,'Found',__DC__GetTDataSet__Found,nil);
RegisterProperty(TDataSet,'Modified',__DC__GetTDataSet__Modified,nil);
RegisterProperty(TDataSet,'ObjectView',__DC__GetTDataSet__ObjectView,__DC__SetTDataSet__ObjectView);
RegisterProperty(TDataSet,'RecordCount',__DC__GetTDataSet__RecordCount,nil);
RegisterProperty(TDataSet,'RecNo',__DC__GetTDataSet__RecNo,__DC__SetTDataSet__RecNo);
RegisterProperty(TDataSet,'RecordSize',__DC__GetTDataSet__RecordSize,nil);
RegisterProperty(TDataSet,'SparseArrays',__DC__GetTDataSet__SparseArrays,__DC__SetTDataSet__SparseArrays);
RegisterProperty(TDataSet,'State',__DC__GetTDataSet__State,nil);
RegisterProperty(TDataSet,'Filter',__DC__GetTDataSet__Filter,__DC__SetTDataSet__Filter);
RegisterProperty(TDataSet,'Filtered',__DC__GetTDataSet__Filtered,__DC__SetTDataSet__Filtered);
RegisterProperty(TDataSet,'FilterOptions',__DC__GetTDataSet__FilterOptions,__DC__SetTDataSet__FilterOptions);
RegisterProperty(TDataSet,'Active',__DC__GetTDataSet__Active,__DC__SetTDataSet__Active);
RegisterProperty(TDataSet,'AutoCalcFields',__DC__GetTDataSet__AutoCalcFields,__DC__SetTDataSet__AutoCalcFields);
RegisterProperty(TDataSetDesigner,'DataSet',__DC__GetTDataSetDesigner__DataSet,nil);
RegisterProperty(TDataSetField,'NestedDataSet',__DC__GetTDataSetField__NestedDataSet,nil);
RegisterProperty(TDataSource,'State',__DC__GetTDataSource__State,nil);
RegisterProperty(TDateTimeField,'Value',__DC__GetTDateTimeField__Value,__DC__SetTDateTimeField__Value);
RegisterProperty(TDefCollection,'DataSet',__DC__GetTDefCollection__DataSet,nil);
RegisterProperty(TDefCollection,'Updated',__DC__GetTDefCollection__Updated,__DC__SetTDefCollection__Updated);
RegisterProperty(TDetailDataLink,'DetailDataSet',__DC__GetTDetailDataLink__DetailDataSet,nil);
RegisterProperty(TField,'AsBoolean',__DC__GetTField__AsBoolean,__DC__SetTField__AsBoolean);
RegisterProperty(TField,'AsCurrency',__DC__GetTField__AsCurrency,__DC__SetTField__AsCurrency);
RegisterProperty(TField,'AsDateTime',__DC__GetTField__AsDateTime,__DC__SetTField__AsDateTime);
RegisterProperty(TField,'AsFloat',__DC__GetTField__AsFloat,__DC__SetTField__AsFloat);
RegisterProperty(TField,'AsInteger',__DC__GetTField__AsInteger,__DC__SetTField__AsInteger);
RegisterProperty(TField,'AsString',__DC__GetTField__AsString,__DC__SetTField__AsString);
RegisterProperty(TField,'AsVariant',__DC__GetTField__AsVariant,__DC__SetTField__AsVariant);
RegisterProperty(TField,'AttributeSet',__DC__GetTField__AttributeSet,__DC__SetTField__AttributeSet);
RegisterProperty(TField,'Calculated',__DC__GetTField__Calculated,__DC__SetTField__Calculated);
RegisterProperty(TField,'CanModify',__DC__GetTField__CanModify,nil);
RegisterProperty(TField,'CurValue',__DC__GetTField__CurValue,nil);
RegisterProperty(TField,'DataSet',__DC__GetTField__DataSet,__DC__SetTField__DataSet);
RegisterProperty(TField,'DataSize',__DC__GetTField__DataSize,nil);
RegisterProperty(TField,'DataType',__DC__GetTField__DataType,nil);
RegisterProperty(TField,'DisplayName',__DC__GetTField__DisplayName,nil);
RegisterProperty(TField,'DisplayText',__DC__GetTField__DisplayText,nil);
RegisterProperty(TField,'EditMask',__DC__GetTField__EditMask,__DC__SetTField__EditMask);
RegisterProperty(TField,'EditMaskPtr',__DC__GetTField__EditMaskPtr,nil);
RegisterProperty(TField,'FieldNo',__DC__GetTField__FieldNo,nil);
RegisterProperty(TField,'FullName',__DC__GetTField__FullName,nil);
RegisterProperty(TField,'IsIndexField',__DC__GetTField__IsIndexField,nil);
RegisterProperty(TField,'IsNull',__DC__GetTField__IsNull,nil);
RegisterProperty(TField,'Lookup',__DC__GetTField__Lookup,__DC__SetTField__Lookup);
RegisterProperty(TField,'LookupList',__DC__GetTField__LookupList,nil);
RegisterProperty(TField,'NewValue',__DC__GetTField__NewValue,__DC__SetTField__NewValue);
RegisterProperty(TField,'Offset',__DC__GetTField__Offset,nil);
RegisterProperty(TField,'OldValue',__DC__GetTField__OldValue,nil);
RegisterProperty(TField,'ParentField',__DC__GetTField__ParentField,__DC__SetTField__ParentField);
RegisterProperty(TField,'Size',__DC__GetTField__Size,__DC__SetTField__Size);
RegisterProperty(TField,'Text',__DC__GetTField__Text,__DC__SetTField__Text);
RegisterProperty(TField,'ValidChars',__DC__GetTField__ValidChars,__DC__SetTField__ValidChars);
RegisterProperty(TField,'Value',__DC__GetTField__Value,__DC__SetTField__Value);
RegisterProperty(TFieldDef,'FieldNo',__DC__GetTFieldDef__FieldNo,__DC__SetTFieldDef__FieldNo);
RegisterProperty(TFieldDef,'InternalCalcField',__DC__GetTFieldDef__InternalCalcField,__DC__SetTFieldDef__InternalCalcField);
RegisterProperty(TFieldDef,'ParentDef',__DC__GetTFieldDef__ParentDef,nil);
RegisterProperty(TFieldDef,'Required',__DC__GetTFieldDef__Required,__DC__SetTFieldDef__Required);
RegisterIndexedProperty(TFieldDefList,'FieldDefs',1,True,__DC__GetTFieldDefList__FieldDefs,nil);
RegisterProperty(TFieldDefs,'HiddenFields',__DC__GetTFieldDefs__HiddenFields,__DC__SetTFieldDefs__HiddenFields);
RegisterIndexedProperty(TFieldDefs,'Items',1,True,__DC__GetTFieldDefs__Items,__DC__SetTFieldDefs__Items);
RegisterProperty(TFieldDefs,'ParentDef',__DC__GetTFieldDefs__ParentDef,nil);
RegisterIndexedProperty(TFieldList,'Fields',1,True,__DC__GetTFieldList__Fields,nil);
RegisterProperty(TFields,'Count',__DC__GetTFields__Count,nil);
RegisterProperty(TFields,'DataSet',__DC__GetTFields__DataSet,nil);
RegisterIndexedProperty(TFields,'Fields',1,True,__DC__GetTFields__Fields,__DC__SetTFields__Fields);
RegisterProperty(TFlatList,'DataSet',__DC__GetTFlatList__DataSet,nil);
RegisterProperty(TFloatField,'Value',__DC__GetTFloatField__Value,__DC__SetTFloatField__Value);
RegisterProperty(TGuidField,'AsGuid',__DC__GetTGuidField__AsGuid,__DC__SetTGuidField__AsGuid);
RegisterProperty(TIndexDef,'FieldExpression',__DC__GetTIndexDef__FieldExpression,nil);
RegisterIndexedProperty(TIndexDefs,'Items',1,True,__DC__GetTIndexDefs__Items,__DC__SetTIndexDefs__Items);
RegisterProperty(TIntegerField,'Value',__DC__GetTIntegerField__Value,__DC__SetTIntegerField__Value);
RegisterProperty(TMasterDataLink,'FieldNames',__DC__GetTMasterDataLink__FieldNames,__DC__SetTMasterDataLink__FieldNames);
RegisterProperty(TMasterDataLink,'Fields',__DC__GetTMasterDataLink__Fields,nil);
RegisterProperty(TObjectField,'FieldCount',__DC__GetTObjectField__FieldCount,nil);
RegisterProperty(TObjectField,'Fields',__DC__GetTObjectField__Fields,nil);
RegisterIndexedProperty(TObjectField,'FieldValues',1,True,__DC__GetTObjectField__FieldValues,__DC__SetTObjectField__FieldValues);
RegisterProperty(TObjectField,'UnNamed',__DC__GetTObjectField__UnNamed,nil);
RegisterProperty(TParam,'AsBCD',__DC__GetTParam__AsBCD,__DC__SetTParam__AsBCD);
RegisterProperty(TParam,'AsBlob',__DC__GetTParam__AsBlob,__DC__SetTParam__AsBlob);
RegisterProperty(TParam,'AsBoolean',__DC__GetTParam__AsBoolean,__DC__SetTParam__AsBoolean);
RegisterProperty(TParam,'AsCurrency',__DC__GetTParam__AsCurrency,__DC__SetTParam__AsCurrency);
RegisterProperty(TParam,'AsDate',__DC__GetTParam__AsDate,__DC__SetTParam__AsDate);
RegisterProperty(TParam,'AsDateTime',__DC__GetTParam__AsDateTime,__DC__SetTParam__AsDateTime);
RegisterProperty(TParam,'AsFloat',__DC__GetTParam__AsFloat,__DC__SetTParam__AsFloat);
RegisterProperty(TParam,'AsInteger',__DC__GetTParam__AsInteger,__DC__SetTParam__AsInteger);
RegisterProperty(TParam,'AsSmallInt',__DC__GetTParam__AsSmallInt,__DC__SetTParam__AsSmallInt);
RegisterProperty(TParam,'AsMemo',__DC__GetTParam__AsMemo,__DC__SetTParam__AsMemo);
RegisterProperty(TParam,'AsString',__DC__GetTParam__AsString,__DC__SetTParam__AsString);
RegisterProperty(TParam,'AsTime',__DC__GetTParam__AsTime,__DC__SetTParam__AsTime);
RegisterProperty(TParam,'AsWord',__DC__GetTParam__AsWord,__DC__SetTParam__AsWord);
RegisterProperty(TParam,'Bound',__DC__GetTParam__Bound,__DC__SetTParam__Bound);
RegisterProperty(TParam,'IsNull',__DC__GetTParam__IsNull,nil);
RegisterProperty(TParam,'NativeStr',__DC__GetTParam__NativeStr,__DC__SetTParam__NativeStr);
RegisterProperty(TParam,'Text',__DC__GetTParam__Text,__DC__SetTParam__Text);
RegisterIndexedProperty(TParams,'Items',1,True,__DC__GetTParams__Items,__DC__SetTParams__Items);
RegisterIndexedProperty(TParams,'ParamValues',1,False,__DC__GetTParams__ParamValues,__DC__SetTParams__ParamValues);
RegisterProperty(TStringField,'Value',__DC__GetTStringField__Value,__DC__SetTStringField__Value);
RegisterProperty(TWideStringField,'Value',__DC__GetTWideStringField__Value,__DC__SetTWideStringField__Value);
end;

const __ConstNames0 : array[0..141] of string = (
'ftUnknown'
,'ftString'
,'ftSmallint'
,'ftInteger'
,'ftWord'
,'ftBoolean'
,'ftFloat'
,'ftCurrency'
,'ftBCD'
,'ftDate'
,'ftTime'
,'ftDateTime'
,'ftBytes'
,'ftVarBytes'
,'ftAutoInc'
,'ftBlob'
,'ftMemo'
,'ftGraphic'
,'ftFmtMemo'
,'ftParadoxOle'
,'ftDBaseOle'
,'ftTypedBinary'
,'ftCursor'
,'ftFixedChar'
,'ftWideString'
,'ftLargeint'
,'ftADT'
,'ftArray'
,'ftReference'
,'ftDataSet'
,'ftOraBlob'
,'ftOraClob'
,'ftVariant'
,'ftInterface'
,'ftIDispatch'
,'ftGuid'
,'dsInactive'
,'dsBrowse'
,'dsEdit'
,'dsInsert'
,'dsSetKey'
,'dsCalcFields'
,'dsFilter'
,'dsNewValue'
,'dsOldValue'
,'dsCurValue'
,'dsBlockRead'
,'dsInternalCalc'
,'dsOpening'
,'deFieldChange'
,'deRecordChange'
,'deDataSetChange'
,'deDataSetScroll'
,'deLayoutChange'
,'deUpdateRecord'
,'deUpdateState'
,'deCheckBrowseMode'
,'dePropertyChange'
,'deFieldListChange'
,'deFocusControl'
,'deParentScroll'
,'deConnectChange'
,'usUnmodified'
,'usModified'
,'usInserted'
,'usDeleted'
,'uaFail'
,'uaAbort'
,'uaSkip'
,'uaRetry'
,'uaApplied'
,'rtModified'
,'rtInserted'
,'rtDeleted'
,'rtUnmodified'
,'upWhereAll'
,'upWhereChanged'
,'upWhereKeyOnly'
,'ukModify'
,'ukInsert'
,'ukDelete'
,'faHiddenCol'
,'faReadonly'
,'faRequired'
,'faLink'
,'faUnNamed'
,'faFixed'
,'ixPrimary'
,'ixUnique'
,'ixDescending'
,'ixCaseInsensitive'
,'ixExpression'
,'ixNonMaintained'
,'fkData'
,'fkCalculated'
,'fkLookup'
,'fkInternalCalc'
,'fkAggregate'
,'pfInUpdate'
,'pfInWhere'
,'pfInKey'
,'pfHidden'
,'arNone'
,'arAutoInc'
,'arDefault'
,'ptUnknown'
,'ptInput'
,'ptOutput'
,'ptInputOutput'
,'ptResult'
,'bfCurrent'
,'bfBOF'
,'bfEOF'
,'bfInserted'
,'gmCurrent'
,'gmNext'
,'gmPrior'
,'grOK'
,'grBOF'
,'grEOF'
,'grError'
,'rmExact'
,'rmCenter'
,'daFail'
,'daAbort'
,'daRetry'
,'bmRead'
,'bmWrite'
,'bmReadWrite'
,'loCaseInsensitive'
,'loPartialKey'
,'foCaseInsensitive'
,'foNoPartialCompare'
,'gbFirst'
,'gbMiddle'
,'gbLast'
,'ftNonTextTypes'
,'ftFixedSizeTypes'
,'dsEditModes'
,'dsWriteModes'
,'ObjectFieldTypes'
,'dsMaxStringSize'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,ftUnknown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,ftString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,ftSmallint));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,ftInteger));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,ftWord));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,ftBoolean));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,ftFloat));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,ftCurrency));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,ftBCD));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,ftDate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,ftTime));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,ftDateTime));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,ftBytes));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,ftVarBytes));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,ftAutoInc));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,ftBlob));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,ftMemo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,ftGraphic));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,ftFmtMemo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,ftParadoxOle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,ftDBaseOle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,ftTypedBinary));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,ftCursor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,ftFixedChar));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,ftWideString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,ftLargeint));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,ftADT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,ftArray));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,ftReference));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,ftDataSet));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,ftOraBlob));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,ftOraClob));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,ftVariant));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,ftInterface));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,ftIDispatch));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,ftGuid));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,dsInactive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,dsBrowse));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,dsEdit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,dsInsert));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,dsSetKey));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,dsCalcFields));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,dsFilter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,dsNewValue));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,dsOldValue));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,dsCurValue));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,dsBlockRead));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,dsInternalCalc));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[48] ,dsOpening));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[49] ,deFieldChange));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[50] ,deRecordChange));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[51] ,deDataSetChange));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[52] ,deDataSetScroll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[53] ,deLayoutChange));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[54] ,deUpdateRecord));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[55] ,deUpdateState));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[56] ,deCheckBrowseMode));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[57] ,dePropertyChange));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[58] ,deFieldListChange));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[59] ,deFocusControl));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[60] ,deParentScroll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[61] ,deConnectChange));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[62] ,usUnmodified));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[63] ,usModified));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[64] ,usInserted));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[65] ,usDeleted));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[66] ,uaFail));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[67] ,uaAbort));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[68] ,uaSkip));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[69] ,uaRetry));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[70] ,uaApplied));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[71] ,rtModified));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[72] ,rtInserted));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[73] ,rtDeleted));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[74] ,rtUnmodified));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[75] ,upWhereAll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[76] ,upWhereChanged));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[77] ,upWhereKeyOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[78] ,ukModify));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[79] ,ukInsert));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[80] ,ukDelete));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[81] ,faHiddenCol));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[82] ,faReadonly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[83] ,faRequired));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[84] ,faLink));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[85] ,faUnNamed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[86] ,faFixed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[87] ,ixPrimary));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[88] ,ixUnique));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[89] ,ixDescending));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[90] ,ixCaseInsensitive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[91] ,ixExpression));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[92] ,ixNonMaintained));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[93] ,fkData));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[94] ,fkCalculated));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[95] ,fkLookup));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[96] ,fkInternalCalc));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[97] ,fkAggregate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[98] ,pfInUpdate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[99] ,pfInWhere));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[100] ,pfInKey));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[101] ,pfHidden));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[102] ,arNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[103] ,arAutoInc));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[104] ,arDefault));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[105] ,ptUnknown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[106] ,ptInput));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[107] ,ptOutput));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[108] ,ptInputOutput));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[109] ,ptResult));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[110] ,bfCurrent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[111] ,bfBOF));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[112] ,bfEOF));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[113] ,bfInserted));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[114] ,gmCurrent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[115] ,gmNext));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[116] ,gmPrior));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[117] ,grOK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[118] ,grBOF));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[119] ,grEOF));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[120] ,grError));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[121] ,rmExact));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[122] ,rmCenter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[123] ,daFail));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[124] ,daAbort));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[125] ,daRetry));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[126] ,bmRead));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[127] ,bmWrite));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[128] ,bmReadWrite));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[129] ,loCaseInsensitive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[130] ,loPartialKey));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[131] ,foCaseInsensitive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[132] ,foNoPartialCompare));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[133] ,gbFirst));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[134] ,gbMiddle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[135] ,gbLast));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[136] ,VarFromSet(ftNonTextTypes, sizeof(ftNonTextTypes))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[137] ,VarFromSet(ftFixedSizeTypes, sizeof(ftFixedSizeTypes))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[138] ,VarFromSet(dsEditModes, sizeof(dsEditModes))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[139] ,VarFromSet(dsWriteModes, sizeof(dsWriteModes))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[140] ,VarFromSet(ObjectFieldTypes, sizeof(ObjectFieldTypes))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[141] ,dsMaxStringSize));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..55] of TClass = (
EDatabaseError,
EUpdateError,
TADTField,
TAggregateField,
TArrayField,
TAutoIncField,
TBCDField,
TBinaryField,
TBlobField,
TBooleanField,
TBytesField,
TCheckConstraint,
TCheckConstraints,
TCurrencyField,
TCustomConnection,
TDataLink,
TDataSet,
TDataSetDesigner,
TDataSetField,
TDataSource,
TDateField,
TDateTimeField,
TDefCollection,
TDetailDataLink,
TField,
TFieldDef,
TFieldDefList,
TFieldDefs,
TFieldList,
TFields,
TFlatList,
TFloatField,
TGraphicField,
TGuidField,
TIDispatchField,
TIndexDef,
TIndexDefs,
TIntegerField,
TInterfaceField,
TLargeintField,
TLookupList,
TMasterDataLink,
TMemoField,
TNamedItem,
TNumericField,
TObjectField,
TParam,
TParams,
TReferenceField,
TSmallintField,
TStringField,
TTimeField,
TVarBytesField,
TVariantField,
TWideStringField,
TWordField
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..11] of string = (
'TBcd'
,'TDateTimeRec'
,'TLookupListEntry'
,'TPacketAttribute'
,'ExtractFieldName'
,'DatabaseError'
,'DatabaseErrorFmt'
,'DisposeMem'
,'BuffersEqual'
,'BCDToCurr'
,'GetFieldProperty'
,'VarTypeToDataType'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TBcd_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(_TDateTimeRec_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[2],Addr(_TLookupListEntry_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[3],Addr(_TPacketAttribute_)));
RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T0),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(string)],Addr(ExtractFieldName),cRegister);

RegisterProc(nil,MethodNames[5],mtScriptProc,TypeInfo(_T2),[
TypeInfo(string),
TypeInfo(TComponent)],Addr(____DatabaseError__Wrapper),cRegister);

RegisterProc(nil,MethodNames[6],mtProc,TypeInfo(_T3),[
TypeInfo(string),
TypeInfoArrayOfConst,
TypeInfo(TComponent)],Addr(____DatabaseErrorFmt__Wrapper),cRegister);

RegisterProc(nil,MethodNames[7],mtProc,TypeInfo(_T4),[
TypeInfoUntyped,
TypeInfo(Integer)],Addr(DisposeMem),cRegister);

RegisterProc(nil,MethodNames[8],mtProc,TypeInfo(_T5),[
TypeInfoPointer,
TypeInfoPointer,
TypeInfo(Integer),TypeInfo(Boolean)],Addr(BuffersEqual),cRegister);

RegisterProc(nil,MethodNames[9],mtProc,TypeInfo(_T6),[
TypeInfo(IDispatch),
TypeInfo(Currency),TypeInfo(Boolean)],Addr(____BCDToCurr__Wrapper),cRegister);

RegisterProc(nil,MethodNames[10],mtProc,TypeInfo(_T8),[
TypeInfo(TDataSet),
TypeInfo(TComponent),
TypeInfo(string),TypeInfo(TField)],Addr(GetFieldProperty),cRegister);

RegisterProc(nil,MethodNames[11],mtProc,TypeInfo(_T9),[
TypeInfo(Integer),TypeInfo(TFieldType)],Addr(VarTypeToDataType),cRegister);

RegisterProc(EUpdateError,'Create',mtConstructor,TypeInfo(_T10),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Exception)],Addr(EUpdateError.Create),cRegister);

RegRegisterMethod(TAggregateField,'SetHandle',TypeInfo(_T11),[
TypeInfoPointer], pointer(208));

RegRegisterMethod(TAggregateField,'GetHandle',TypeInfo(_T12),[TypeInfoPointer], pointer(212));

RegRegisterMethod(TBlobField,'GetBlobSize',TypeInfo(_T13),[TypeInfo(Integer)], pointer(208));

RegRegisterMethod(TBlobField,'LoadFromFile',TypeInfo(_T14),[
TypeInfo(string)],Addr(TBlobField.LoadFromFile));

RegRegisterMethod(TBlobField,'LoadFromStream',TypeInfo(_T15),[
TypeInfo(TStream)],Addr(TBlobField.LoadFromStream));

RegRegisterMethod(TBlobField,'SaveToFile',TypeInfo(_T16),[
TypeInfo(string)],Addr(TBlobField.SaveToFile));

RegRegisterMethod(TBlobField,'SaveToStream',TypeInfo(_T17),[
TypeInfo(TStream)],Addr(TBlobField.SaveToStream));

RegisterProc(TCheckConstraints,'Create',mtConstructor,TypeInfo(_T18),[
TypeInfo(TPersistent)],Addr(TCheckConstraints.Create),cRegister);

RegRegisterMethod(TCheckConstraints,'Add',TypeInfo(_T19),[TypeInfo(TCheckConstraint)],Addr(TCheckConstraints.Add));

RegRegisterMethod(TCustomConnection,'DoConnect',TypeInfo(_T20),NoParams, pointer(48));

RegRegisterMethod(TCustomConnection,'DoDisconnect',TypeInfo(_T21),NoParams, pointer(52));

RegRegisterMethod(TCustomConnection,'GetConnected',TypeInfo(_T22),[TypeInfo(Boolean)], pointer(56));

RegRegisterMethod(TCustomConnection,'GetDataSet',TypeInfo(_T23),[
TypeInfo(Integer),TypeInfo(TDataSet)], pointer(60));

RegRegisterMethod(TCustomConnection,'GetDataSetCount',TypeInfo(_T24),[TypeInfo(Integer)], pointer(64));

RegRegisterMethod(TCustomConnection,'SetConnected',TypeInfo(_T26),[
TypeInfo(Boolean)], pointer(72));

RegRegisterMethod(TCustomConnection,'UnRegisterClient',TypeInfo(_T27),[
TypeInfo(TObject)], pointer(76));

RegRegisterMethod(TCustomConnection,'Open',TypeInfo(_T28),NoParams,Addr(TCustomConnection.Open));

RegRegisterMethod(TCustomConnection,'Close',TypeInfo(_T29),NoParams,Addr(TCustomConnection.Close));

RegRegisterMethod(TDataLink,'ActiveChanged',TypeInfo(_T30),NoParams, pointer(12));

RegRegisterMethod(TDataLink,'CheckBrowseMode',TypeInfo(_T31),NoParams, pointer(16));

RegRegisterMethod(TDataLink,'DataEvent',TypeInfo(_T32),[
TypeInfo(TDataEvent),
TypeInfo(Longint)], pointer(20));

RegRegisterMethod(TDataLink,'DataSetChanged',TypeInfo(_T33),NoParams, pointer(24));

RegRegisterMethod(TDataLink,'DataSetScrolled',TypeInfo(_T34),[
TypeInfo(Integer)], pointer(28));

RegRegisterMethod(TDataLink,'EditingChanged',TypeInfo(_T35),NoParams, pointer(32));

RegRegisterMethod(TDataLink,'FocusControl',TypeInfo(_T36),[
TypeInfoPointer], pointer(36));

RegRegisterMethod(TDataLink,'GetActiveRecord',TypeInfo(_T37),[TypeInfo(Integer)], pointer(40));

RegRegisterMethod(TDataLink,'GetBOF',TypeInfo(_T38),[TypeInfo(Boolean)], pointer(44));

RegRegisterMethod(TDataLink,'GetBufferCount',TypeInfo(_T39),[TypeInfo(Integer)], pointer(48));

RegRegisterMethod(TDataLink,'GetEOF',TypeInfo(_T40),[TypeInfo(Boolean)], pointer(52));

RegRegisterMethod(TDataLink,'GetRecordCount',TypeInfo(_T41),[TypeInfo(Integer)], pointer(56));

RegRegisterMethod(TDataLink,'LayoutChanged',TypeInfo(_T42),NoParams, pointer(60));

RegRegisterMethod(TDataLink,'MoveBy',TypeInfo(_T43),[
TypeInfo(Integer),TypeInfo(Integer)], pointer(64));

RegRegisterMethod(TDataLink,'RecordChanged',TypeInfo(_T44),[
TypeInfo(TField)], pointer(68));

RegRegisterMethod(TDataLink,'SetActiveRecord',TypeInfo(_T45),[
TypeInfo(Integer)], pointer(72));

RegRegisterMethod(TDataLink,'SetBufferCount',TypeInfo(_T46),[
TypeInfo(Integer)], pointer(76));

RegRegisterMethod(TDataLink,'UpdateData',TypeInfo(_T47),NoParams, pointer(80));

RegisterProc(TDataLink,'Create',mtConstructor,TypeInfo(_T48),NoParams,Addr(TDataLink.Create),cRegister);

RegRegisterMethod(TDataLink,'Edit',TypeInfo(_T49),[TypeInfo(Boolean)],Addr(TDataLink.Edit));

RegRegisterMethod(TDataLink,'ExecuteAction',TypeInfo(_T50),[
TypeInfo(TBasicAction),TypeInfo(Boolean)], pointer(MinVMTOffset - 2));

RegRegisterMethod(TDataLink,'UpdateAction',TypeInfo(_T51),[
TypeInfo(TBasicAction),TypeInfo(Boolean)], pointer(MinVMTOffset - 3));

RegRegisterMethod(TDataLink,'UpdateRecord',TypeInfo(_T52),NoParams,Addr(TDataLink.UpdateRecord));

RegRegisterMethod(TDataSet,'PSEndTransaction',TypeInfo(_T53),[
TypeInfo(Boolean)], pointer(48));

RegRegisterMethod(TDataSet,'PSExecute',TypeInfo(_T54),NoParams, pointer(52));

RegisterProc(TDataSet,'PSExecuteStatement',mtScriptMethod,TypeInfo(_T55),[
TypeInfo(string),
TypeInfo(TParams),
TypeInfoPointer,TypeInfo(Integer)],Addr(__TDataSet__PSExecuteStatement__Wrapper),cRegister);

RegRegisterMethod(TDataSet,'PSGetAttributes',TypeInfo(_T56),[
TypeInfo(TList)], pointer(60));

RegRegisterMethod(TDataSet,'PSGetDefaultOrder',TypeInfo(_T57),[TypeInfo(TIndexDef)], pointer(64));

RegRegisterMethod(TDataSet,'PSGetKeyFields',TypeInfo(_T58),[TypeInfo(string)], pointer(68));

RegRegisterMethod(TDataSet,'PSGetParams',TypeInfo(_T59),[TypeInfo(TParams)], pointer(72));

RegRegisterMethod(TDataSet,'PSGetQuoteChar',TypeInfo(_T60),[TypeInfo(string)], pointer(76));

RegRegisterMethod(TDataSet,'PSGetTableName',TypeInfo(_T61),[TypeInfo(string)], pointer(80));

RegRegisterMethod(TDataSet,'PSGetIndexDefs',TypeInfo(_T62),[
TypeInfo(TIndexOptions),TypeInfo(TIndexDefs)], pointer(84));

RegRegisterMethod(TDataSet,'PSGetUpdateException',TypeInfo(_T63),[
TypeInfo(Exception),
TypeInfo(EUpdateError),TypeInfo(EUpdateError)], pointer(88));

RegRegisterMethod(TDataSet,'PSInTransaction',TypeInfo(_T64),[TypeInfo(Boolean)], pointer(92));

RegRegisterMethod(TDataSet,'PSIsSQLBased',TypeInfo(_T65),[TypeInfo(Boolean)], pointer(96));

RegRegisterMethod(TDataSet,'PSIsSQLSupported',TypeInfo(_T66),[TypeInfo(Boolean)], pointer(100));

RegRegisterMethod(TDataSet,'PSReset',TypeInfo(_T67),NoParams, pointer(104));

RegRegisterMethod(TDataSet,'PSSetParams',TypeInfo(_T68),[
TypeInfo(TParams)], pointer(108));

RegRegisterMethod(TDataSet,'PSSetCommandText',TypeInfo(_T69),[
TypeInfo(string)], pointer(112));

RegRegisterMethod(TDataSet,'PSStartTransaction',TypeInfo(_T70),NoParams, pointer(116));

RegRegisterMethod(TDataSet,'PSUpdateRecord',TypeInfo(_T71),[
TypeInfo(TUpdateKind),
TypeInfo(TDataSet),TypeInfo(Boolean)], pointer(120));

RegRegisterMethod(TDataSet,'ResetAggField',TypeInfo(_T72),[
TypeInfo(TField)], pointer(124));

RegRegisterMethod(TDataSet,'CheckActive',TypeInfo(_T74),NoParams, pointer(132));

RegRegisterMethod(TDataSet,'CheckFieldCompatibility',TypeInfo(_T75),[
TypeInfo(TField),
TypeInfo(TFieldDef)], pointer(136));

RegRegisterMethod(TDataSet,'CheckInactive',TypeInfo(_T76),NoParams, pointer(140));

RegRegisterMethod(TDataSet,'ClearBuffers',TypeInfo(_T77),NoParams, pointer(144));

RegRegisterMethod(TDataSet,'CloseBlob',TypeInfo(_T79),[
TypeInfo(TField)], pointer(152));

RegRegisterMethod(TDataSet,'CloseCursor',TypeInfo(_T80),NoParams, pointer(156));

RegRegisterMethod(TDataSet,'CreateFields',TypeInfo(_T81),NoParams, pointer(160));

RegRegisterMethod(TDataSet,'CreateNestedDataSet',TypeInfo(_T82),[
TypeInfo(TDataSetField),TypeInfo(TDataSet)], pointer(164));

RegRegisterMethod(TDataSet,'DataConvert',TypeInfo(_T83),[
TypeInfo(TField),
TypeInfoPointer,
TypeInfoPointer,
TypeInfo(Boolean)], pointer(168));

RegRegisterMethod(TDataSet,'DataEvent',TypeInfo(_T84),[
TypeInfo(TDataEvent),
TypeInfo(Longint)], pointer(172));

RegRegisterMethod(TDataSet,'DefChanged',TypeInfo(_T85),[
TypeInfo(TObject)], pointer(176));

RegRegisterMethod(TDataSet,'DestroyFields',TypeInfo(_T86),NoParams, pointer(180));

RegRegisterMethod(TDataSet,'DoAfterCancel',TypeInfo(_T87),NoParams, pointer(184));

RegRegisterMethod(TDataSet,'DoAfterClose',TypeInfo(_T88),NoParams, pointer(188));

RegRegisterMethod(TDataSet,'DoAfterDelete',TypeInfo(_T89),NoParams, pointer(192));

RegRegisterMethod(TDataSet,'DoAfterEdit',TypeInfo(_T90),NoParams, pointer(196));

RegRegisterMethod(TDataSet,'DoAfterInsert',TypeInfo(_T91),NoParams, pointer(200));

RegRegisterMethod(TDataSet,'DoAfterOpen',TypeInfo(_T92),NoParams, pointer(204));

RegRegisterMethod(TDataSet,'DoAfterPost',TypeInfo(_T93),NoParams, pointer(208));

RegRegisterMethod(TDataSet,'DoAfterRefresh',TypeInfo(_T94),NoParams, pointer(212));

RegRegisterMethod(TDataSet,'DoAfterScroll',TypeInfo(_T95),NoParams, pointer(216));

RegRegisterMethod(TDataSet,'DoBeforeCancel',TypeInfo(_T96),NoParams, pointer(220));

RegRegisterMethod(TDataSet,'DoBeforeClose',TypeInfo(_T97),NoParams, pointer(224));

RegRegisterMethod(TDataSet,'DoBeforeDelete',TypeInfo(_T98),NoParams, pointer(228));

RegRegisterMethod(TDataSet,'DoBeforeEdit',TypeInfo(_T99),NoParams, pointer(232));

RegRegisterMethod(TDataSet,'DoBeforeInsert',TypeInfo(_T100),NoParams, pointer(236));

RegRegisterMethod(TDataSet,'DoBeforeOpen',TypeInfo(_T101),NoParams, pointer(240));

RegRegisterMethod(TDataSet,'DoBeforePost',TypeInfo(_T102),NoParams, pointer(244));

RegRegisterMethod(TDataSet,'DoBeforeRefresh',TypeInfo(_T103),NoParams, pointer(248));

RegRegisterMethod(TDataSet,'DoBeforeScroll',TypeInfo(_T104),NoParams, pointer(252));

RegRegisterMethod(TDataSet,'DoOnCalcFields',TypeInfo(_T105),NoParams, pointer(256));

RegRegisterMethod(TDataSet,'DoOnNewRecord',TypeInfo(_T106),NoParams, pointer(260));

RegRegisterMethod(TDataSet,'FindRecord',TypeInfo(_T107),[
TypeInfo(Boolean),
TypeInfo(Boolean),TypeInfo(Boolean)], pointer(264));

RegRegisterMethod(TDataSet,'FreeFieldBuffers',TypeInfo(_T108),NoParams, pointer(268));

RegRegisterMethod(TDataSet,'GetAggregateValue',TypeInfo(_T109),[
TypeInfo(TField),TypeInfo(Variant)], pointer(272));

RegRegisterMethod(TDataSet,'GetAggRecordCount',TypeInfo(_T110),[
TypeInfo(TGroupPosInd),TypeInfo(Integer)], pointer(276));

RegRegisterMethod(TDataSet,'ActivateBuffers',TypeInfo(_T111),NoParams, pointer(280));

RegRegisterMethod(TDataSet,'GetBookmarkStr',TypeInfo(_T112),[TypeInfo(TBookmarkStr)], pointer(284));

RegRegisterMethod(TDataSet,'GetCanModify',TypeInfo(_T114),[TypeInfo(Boolean)], pointer(292));

RegRegisterMethod(TDataSet,'GetDataSource',TypeInfo(_T115),[TypeInfo(TDataSource)], pointer(296));

RegRegisterMethod(TDataSet,'GetFieldFullName',TypeInfo(_T117),[
TypeInfo(TField),TypeInfo(string)], pointer(304));

RegRegisterMethod(TDataSet,'GetStateFieldValue',TypeInfo(_T118),[
TypeInfo(TDataSetState),
TypeInfo(TField),TypeInfo(Variant)], pointer(308));

RegRegisterMethod(TDataSet,'GetIsIndexField',TypeInfo(_T119),[
TypeInfo(TField),TypeInfo(Boolean)], pointer(312));

RegRegisterMethod(TDataSet,'GetNextRecords',TypeInfo(_T120),[TypeInfo(Integer)], pointer(316));

RegRegisterMethod(TDataSet,'GetNextRecord',TypeInfo(_T121),[TypeInfo(Boolean)], pointer(320));

RegRegisterMethod(TDataSet,'GetPriorRecords',TypeInfo(_T122),[TypeInfo(Integer)], pointer(324));

RegRegisterMethod(TDataSet,'GetPriorRecord',TypeInfo(_T123),[TypeInfo(Boolean)], pointer(328));

RegRegisterMethod(TDataSet,'GetRecordCount',TypeInfo(_T124),[TypeInfo(Integer)], pointer(332));

RegRegisterMethod(TDataSet,'GetRecNo',TypeInfo(_T125),[TypeInfo(Integer)], pointer(336));

RegRegisterMethod(TDataSet,'InitFieldDefs',TypeInfo(_T126),NoParams, pointer(340));

RegRegisterMethod(TDataSet,'InternalCancel',TypeInfo(_T128),NoParams, pointer(348));

RegRegisterMethod(TDataSet,'InternalEdit',TypeInfo(_T129),NoParams, pointer(352));

RegRegisterMethod(TDataSet,'InternalInsert',TypeInfo(_T130),NoParams, pointer(356));

RegRegisterMethod(TDataSet,'InternalRefresh',TypeInfo(_T131),NoParams, pointer(360));

RegisterProc(TDataSet,'OpenCursor',mtScriptMethod,TypeInfo(_T132),[
TypeInfo(Boolean)],Addr(__TDataSet__OpenCursor__Wrapper),cRegister);

RegRegisterMethod(TDataSet,'BlockReadNext',TypeInfo(_T134),NoParams, pointer(372));

RegRegisterMethod(TDataSet,'SetActive',TypeInfo(_T135),[
TypeInfo(Boolean)], pointer(376));

RegRegisterMethod(TDataSet,'SetBookmarkStr',TypeInfo(_T136),[
TypeInfo(TBookmarkStr)], pointer(380));

RegRegisterMethod(TDataSet,'SetBlockReadSize',TypeInfo(_T137),[
TypeInfo(Integer)], pointer(384));

RegRegisterMethod(TDataSet,'SetCurrentRecord',TypeInfo(_T138),[
TypeInfo(Integer)], pointer(388));

RegRegisterMethod(TDataSet,'SetDataSetField',TypeInfo(_T139),[
TypeInfo(TDataSetField)], pointer(392));

RegRegisterMethod(TDataSet,'SetFiltered',TypeInfo(_T140),[
TypeInfo(Boolean)], pointer(396));

RegRegisterMethod(TDataSet,'SetFilterOptions',TypeInfo(_T141),[
TypeInfo(TFilterOptions)], pointer(400));

RegRegisterMethod(TDataSet,'SetFilterText',TypeInfo(_T142),[
TypeInfo(string)], pointer(404));

RegRegisterMethod(TDataSet,'SetRecNo',TypeInfo(_T144),[
TypeInfo(Integer)], pointer(412));

RegRegisterMethod(TDataSet,'SetStateFieldValue',TypeInfo(_T145),[
TypeInfo(TDataSetState),
TypeInfo(TField),
TypeInfo(Variant)], pointer(416));

RegRegisterMethod(TDataSet,'UpdateIndexDefs',TypeInfo(_T146),NoParams, pointer(420));

RegRegisterMethod(TDataSet,'AllocRecordBuffer',TypeInfo(_T147),[TypeInfoPChar], pointer(424));

RegRegisterMethod(TDataSet,'GetRecordSize',TypeInfo(_T152),[TypeInfo(Word)], pointer(444));

RegRegisterMethod(TDataSet,'InternalAddRecord',TypeInfo(_T153),[
TypeInfoPointer,
TypeInfo(Boolean)], pointer(448));

RegRegisterMethod(TDataSet,'InternalClose',TypeInfo(_T154),NoParams, pointer(452));

RegRegisterMethod(TDataSet,'InternalDelete',TypeInfo(_T155),NoParams, pointer(456));

RegRegisterMethod(TDataSet,'InternalFirst',TypeInfo(_T156),NoParams, pointer(460));

RegRegisterMethod(TDataSet,'InternalGotoBookmark',TypeInfo(_T157),[
TypeInfoPointer], pointer(464));

RegRegisterMethod(TDataSet,'InternalHandleException',TypeInfo(_T158),NoParams, pointer(468));

RegRegisterMethod(TDataSet,'InternalInitFieldDefs',TypeInfo(_T159),NoParams, pointer(472));

RegRegisterMethod(TDataSet,'InternalLast',TypeInfo(_T161),NoParams, pointer(480));

RegRegisterMethod(TDataSet,'InternalOpen',TypeInfo(_T162),NoParams, pointer(484));

RegRegisterMethod(TDataSet,'InternalPost',TypeInfo(_T163),NoParams, pointer(488));

RegRegisterMethod(TDataSet,'IsCursorOpen',TypeInfo(_T165),[TypeInfo(Boolean)], pointer(496));

RegRegisterMethod(TDataSet,'SetFieldData',TypeInfo(_T168),[
TypeInfo(TField),
TypeInfoPointer], pointer(508));

RegRegisterMethod(TDataSet,'ActiveBuffer',TypeInfo(_T169),[TypeInfoPChar],Addr(TDataSet.ActiveBuffer));

RegRegisterMethod(TDataSet,'Append',TypeInfo(_T170),NoParams,Addr(TDataSet.Append));

RegRegisterMethod(TDataSet,'AppendRecord',TypeInfo(_T171),[
TypeInfoArrayOfConst],Addr(TDataSet.AppendRecord));

RegRegisterMethod(TDataSet,'BookmarkValid',TypeInfo(_T172),[
TypeInfoPointer,TypeInfo(Boolean)], pointer(516));

RegRegisterMethod(TDataSet,'Cancel',TypeInfo(_T173),NoParams, pointer(520));

RegRegisterMethod(TDataSet,'CheckBrowseMode',TypeInfo(_T174),NoParams,Addr(TDataSet.CheckBrowseMode));

RegRegisterMethod(TDataSet,'ClearFields',TypeInfo(_T175),NoParams,Addr(TDataSet.ClearFields));

RegRegisterMethod(TDataSet,'Close',TypeInfo(_T176),NoParams,Addr(TDataSet.Close));

RegRegisterMethod(TDataSet,'ControlsDisabled',TypeInfo(_T177),[TypeInfo(Boolean)],Addr(TDataSet.ControlsDisabled));

RegRegisterMethod(TDataSet,'CompareBookmarks',TypeInfo(_T178),[
TypeInfoPointer,
TypeInfoPointer,TypeInfo(Integer)], pointer(524));

RegRegisterMethod(TDataSet,'CreateBlobStream',TypeInfo(_T179),[
TypeInfo(TField),
TypeInfo(TBlobStreamMode),TypeInfo(TStream)], pointer(528));

RegRegisterMethod(TDataSet,'CursorPosChanged',TypeInfo(_T180),NoParams,Addr(TDataSet.CursorPosChanged));

RegRegisterMethod(TDataSet,'Delete',TypeInfo(_T181),NoParams,Addr(TDataSet.Delete));

RegRegisterMethod(TDataSet,'DisableControls',TypeInfo(_T182),NoParams,Addr(TDataSet.DisableControls));

RegRegisterMethod(TDataSet,'Edit',TypeInfo(_T183),NoParams,Addr(TDataSet.Edit));

RegRegisterMethod(TDataSet,'EnableControls',TypeInfo(_T184),NoParams,Addr(TDataSet.EnableControls));

RegRegisterMethod(TDataSet,'FieldByName',TypeInfo(_T185),[
TypeInfo(string),TypeInfo(TField)],Addr(TDataSet.FieldByName));

RegRegisterMethod(TDataSet,'FindField',TypeInfo(_T186),[
TypeInfo(string),TypeInfo(TField)],Addr(TDataSet.FindField));

RegRegisterMethod(TDataSet,'FindFirst',TypeInfo(_T187),[TypeInfo(Boolean)],Addr(TDataSet.FindFirst));

RegRegisterMethod(TDataSet,'FindLast',TypeInfo(_T188),[TypeInfo(Boolean)],Addr(TDataSet.FindLast));

RegRegisterMethod(TDataSet,'FindNext',TypeInfo(_T189),[TypeInfo(Boolean)],Addr(TDataSet.FindNext));

RegRegisterMethod(TDataSet,'FindPrior',TypeInfo(_T190),[TypeInfo(Boolean)],Addr(TDataSet.FindPrior));

RegRegisterMethod(TDataSet,'First',TypeInfo(_T191),NoParams,Addr(TDataSet.First));

RegRegisterMethod(TDataSet,'FreeBookmark',TypeInfo(_T192),[
TypeInfoPointer], pointer(532));

RegRegisterMethod(TDataSet,'GetBookmark',TypeInfo(_T193),[TypeInfoPointer], pointer(536));

RegRegisterMethod(TDataSet,'GetDetailDataSets',TypeInfo(_T195),[
TypeInfo(TList)],Addr(TDataSet.GetDetailDataSets));

RegRegisterMethod(TDataSet,'GetDetailLinkFields',TypeInfo(_T196),[
TypeInfo(TList),
TypeInfo(TList)], pointer(544));

RegRegisterMethod(TDataSet,'GetBlobFieldData',TypeInfo(_T197),[
TypeInfo(Integer),
DynArrayInfo(TypeInfo(TBlobByteData)),TypeInfo(Integer)], pointer(548));

RegRegisterMethod(TDataSet,'GetFieldData',TypeInfo(_T198),[
TypeInfo(TField),
TypeInfoPointer,TypeInfo(Boolean)], pointer(552));

RegRegisterMethod(TDataSet,'GetFieldList',TypeInfo(_T199),[
TypeInfo(TList),
TypeInfo(string)],Addr(TDataSet.GetFieldList));

RegRegisterMethod(TDataSet,'GetFieldNames',TypeInfo(_T200),[
TypeInfo(TStrings)],Addr(TDataSet.GetFieldNames));

RegRegisterMethod(TDataSet,'GotoBookmark',TypeInfo(_T201),[
TypeInfoPointer],Addr(TDataSet.GotoBookmark));

RegRegisterMethod(TDataSet,'Insert',TypeInfo(_T202),NoParams,Addr(TDataSet.Insert));

RegRegisterMethod(TDataSet,'InsertRecord',TypeInfo(_T203),[
TypeInfoArrayOfConst],Addr(TDataSet.InsertRecord));

RegRegisterMethod(TDataSet,'IsEmpty',TypeInfo(_T204),[TypeInfo(Boolean)],Addr(TDataSet.IsEmpty));

RegRegisterMethod(TDataSet,'IsLinkedTo',TypeInfo(_T205),[
TypeInfo(TDataSource),TypeInfo(Boolean)],Addr(TDataSet.IsLinkedTo));

RegRegisterMethod(TDataSet,'IsSequenced',TypeInfo(_T206),[TypeInfo(Boolean)], pointer(564));

RegRegisterMethod(TDataSet,'Last',TypeInfo(_T207),NoParams,Addr(TDataSet.Last));

RegRegisterMethod(TDataSet,'Locate',TypeInfo(_T208),[
TypeInfo(string),
TypeInfo(Variant),
TypeInfo(TLocateOptions),TypeInfo(Boolean)], pointer(568));

RegRegisterMethod(TDataSet,'Lookup',TypeInfo(_T209),[
TypeInfo(string),
TypeInfo(Variant),
TypeInfo(string),TypeInfo(Variant)], pointer(572));

RegRegisterMethod(TDataSet,'MoveBy',TypeInfo(_T210),[
TypeInfo(Integer),TypeInfo(Integer)],Addr(TDataSet.MoveBy));

RegRegisterMethod(TDataSet,'Next',TypeInfo(_T211),NoParams,Addr(TDataSet.Next));

RegRegisterMethod(TDataSet,'Open',TypeInfo(_T212),NoParams,Addr(TDataSet.Open));

RegRegisterMethod(TDataSet,'Post',TypeInfo(_T213),NoParams, pointer(576));

RegRegisterMethod(TDataSet,'Prior',TypeInfo(_T214),NoParams,Addr(TDataSet.Prior));

RegRegisterMethod(TDataSet,'Refresh',TypeInfo(_T215),NoParams,Addr(TDataSet.Refresh));

RegRegisterMethod(TDataSet,'Resync',TypeInfo(_T216),[
TypeInfo(TResyncMode)], pointer(580));

RegRegisterMethod(TDataSet,'SetFields',TypeInfo(_T217),[
TypeInfoArrayOfConst],Addr(TDataSet.SetFields));

RegRegisterMethod(TDataSet,'UpdateCursorPos',TypeInfo(_T219),NoParams,Addr(TDataSet.UpdateCursorPos));

RegRegisterMethod(TDataSet,'UpdateRecord',TypeInfo(_T220),NoParams,Addr(TDataSet.UpdateRecord));

RegRegisterMethod(TDataSet,'UpdateStatus',TypeInfo(_T221),[TypeInfo(TUpdateStatus)], pointer(588));

RegisterProc(TDataSetDesigner,'Create',mtConstructor,TypeInfo(_T222),[
TypeInfo(TDataSet)],Addr(TDataSetDesigner.Create),cRegister);

RegRegisterMethod(TDataSetDesigner,'BeginDesign',TypeInfo(_T223),NoParams,Addr(TDataSetDesigner.BeginDesign));

RegRegisterMethod(TDataSetDesigner,'DataEvent',TypeInfo(_T224),[
TypeInfo(TDataEvent),
TypeInfo(Longint)], pointer(0));

RegRegisterMethod(TDataSetDesigner,'EndDesign',TypeInfo(_T225),NoParams,Addr(TDataSetDesigner.EndDesign));

RegRegisterMethod(TDataSource,'Edit',TypeInfo(_T226),NoParams,Addr(TDataSource.Edit));

RegRegisterMethod(TDataSource,'IsLinkedTo',TypeInfo(_T227),[
TypeInfo(TDataSet),TypeInfo(Boolean)],Addr(TDataSource.IsLinkedTo));

RegRegisterMethod(TDefCollection,'Find',TypeInfo(_T229),[
TypeInfo(string),TypeInfo(TNamedItem)],Addr(TDefCollection.Find));

RegRegisterMethod(TDefCollection,'GetItemNames',TypeInfo(_T230),[
TypeInfo(TStrings)],Addr(TDefCollection.GetItemNames));

RegRegisterMethod(TDefCollection,'IndexOf',TypeInfo(_T231),[
TypeInfo(string),TypeInfo(Integer)],Addr(TDefCollection.IndexOf));

RegRegisterMethod(TDetailDataLink,'GetDetailDataSet',TypeInfo(_T232),[TypeInfo(TDataSet)], pointer(84));

RegRegisterMethod(TField,'AccessError',TypeInfo(_T233),[
TypeInfo(string),TypeInfo(EDatabaseError)], pointer(MinVMTOffset - 15));

RegRegisterMethod(TField,'Bind',TypeInfo(_T234),[
TypeInfo(Boolean)], pointer(48));

RegisterProc(TField,'CheckTypeSize',mtClassMethod,TypeInfo(_T235),[
TypeInfo(Integer)], pointer(52),cRegister);

RegRegisterMethod(TField,'Change',TypeInfo(_T236),NoParams, pointer(56));

RegRegisterMethod(TField,'FreeBuffers',TypeInfo(_T237),NoParams, pointer(60));

RegRegisterMethod(TField,'GetAsBoolean',TypeInfo(_T238),[TypeInfo(Boolean)], pointer(64));

RegRegisterMethod(TField,'GetAsByteArray',TypeInfo(_T239),[TypeInfo(Variant)], pointer(68));

RegRegisterMethod(TField,'GetAsCurrency',TypeInfo(_T240),[TypeInfo(Currency)], pointer(72));

RegRegisterMethod(TField,'GetAsDateTime',TypeInfo(_T241),[TypeInfo(TDateTime)], pointer(76));

RegRegisterMethod(TField,'GetAsFloat',TypeInfo(_T242),[TypeInfo(Double)], pointer(80));

RegRegisterMethod(TField,'GetAsInteger',TypeInfo(_T243),[TypeInfo(Longint)], pointer(84));

RegRegisterMethod(TField,'GetAsString',TypeInfo(_T244),[TypeInfo(string)], pointer(88));

RegRegisterMethod(TField,'GetAsVariant',TypeInfo(_T245),[TypeInfo(Variant)], pointer(92));

RegRegisterMethod(TField,'GetCanModify',TypeInfo(_T246),[TypeInfo(Boolean)], pointer(96));

RegRegisterMethod(TField,'GetClassDesc',TypeInfo(_T247),[TypeInfo(string)], pointer(100));

RegRegisterMethod(TField,'GetDataSize',TypeInfo(_T248),[TypeInfo(Integer)], pointer(104));

RegRegisterMethod(TField,'CopyData',TypeInfo(_T249),[
TypeInfoPointer,
TypeInfoPointer], pointer(108));

RegRegisterMethod(TField,'GetDefaultWidth',TypeInfo(_T250),[TypeInfo(Integer)], pointer(112));

RegRegisterMethod(TField,'GetFieldNo',TypeInfo(_T251),[TypeInfo(Integer)], pointer(116));

RegRegisterMethod(TField,'GetHasConstraints',TypeInfo(_T252),[TypeInfo(Boolean)], pointer(120));

RegRegisterMethod(TField,'GetIsNull',TypeInfo(_T253),[TypeInfo(Boolean)], pointer(124));

RegRegisterMethod(TField,'GetSize',TypeInfo(_T254),[TypeInfo(Integer)], pointer(128));

RegRegisterMethod(TField,'GetText',TypeInfo(_T255),[
TypeInfo(string),
TypeInfo(Boolean)], pointer(132));

RegRegisterMethod(TField,'SetAsBoolean',TypeInfo(_T256),[
TypeInfo(Boolean)], pointer(136));

RegRegisterMethod(TField,'SetAsByteArray',TypeInfo(_T257),[
TypeInfo(Variant)], pointer(140));

RegRegisterMethod(TField,'SetAsCurrency',TypeInfo(_T258),[
TypeInfo(Currency)], pointer(144));

RegRegisterMethod(TField,'SetAsDateTime',TypeInfo(_T259),[
TypeInfo(TDateTime)], pointer(148));

RegRegisterMethod(TField,'SetAsFloat',TypeInfo(_T260),[
TypeInfo(Double)], pointer(152));

RegRegisterMethod(TField,'SetAsInteger',TypeInfo(_T261),[
TypeInfo(Longint)], pointer(156));

RegRegisterMethod(TField,'SetAsString',TypeInfo(_T262),[
TypeInfo(string)], pointer(160));

RegRegisterMethod(TField,'SetAsVariant',TypeInfo(_T263),[
TypeInfo(Variant)], pointer(164));

RegRegisterMethod(TField,'SetDataSet',TypeInfo(_T264),[
TypeInfo(TDataSet)], pointer(168));

RegRegisterMethod(TField,'SetFieldKind',TypeInfo(_T265),[
TypeInfo(TFieldKind)], pointer(172));

RegRegisterMethod(TField,'SetParentField',TypeInfo(_T266),[
TypeInfo(TObjectField)], pointer(176));

RegRegisterMethod(TField,'SetSize',TypeInfo(_T267),[
TypeInfo(Integer)], pointer(180));

RegRegisterMethod(TField,'SetText',TypeInfo(_T268),[
TypeInfo(string)], pointer(184));

RegRegisterMethod(TField,'SetVarValue',TypeInfo(_T269),[
TypeInfo(Variant)], pointer(188));

RegRegisterMethod(TField,'AssignValue',TypeInfo(_T270),[
TypeInfo(IDispatch)],Addr(__TField__AssignValue__Wrapper));

RegRegisterMethod(TField,'Clear',TypeInfo(_T271),NoParams, pointer(192));

RegRegisterMethod(TField,'FocusControl',TypeInfo(_T272),NoParams,Addr(TField.FocusControl));

RegisterProc(TField,'GetData',mtScriptMethod,TypeInfo(_T273),[
TypeInfoPointer,
TypeInfo(Boolean),TypeInfo(Boolean)],Addr(__TField__GetData__Wrapper),cRegister);

RegisterProc(TField,'IsBlob',mtClassMethod,TypeInfo(_T274),[TypeInfo(Boolean)], pointer(196),cRegister);

RegRegisterMethod(TField,'IsValidChar',TypeInfo(_T275),[
TypeInfo(Char),TypeInfo(Boolean)], pointer(200));

RegRegisterMethod(TField,'RefreshLookupList',TypeInfo(_T276),NoParams,Addr(TField.RefreshLookupList));

RegisterProc(TField,'SetData',mtScriptMethod,TypeInfo(_T277),[
TypeInfoPointer,
TypeInfo(Boolean)],Addr(__TField__SetData__Wrapper),cRegister);

RegRegisterMethod(TField,'SetFieldType',TypeInfo(_T278),[
TypeInfo(TFieldType)], pointer(204));

RegRegisterMethod(TField,'Validate',TypeInfo(_T279),[
TypeInfoPointer],Addr(TField.Validate));

RegisterProc(TFieldDef,'Create',mtConstructor,TypeInfo(_T280),[
TypeInfo(TFieldDefs),
TypeInfo(string),
TypeInfo(TFieldType),
TypeInfo(Integer),
TypeInfo(Boolean),
TypeInfo(Integer)],Addr(TFieldDef.Create),cRegister);

RegRegisterMethod(TFieldDef,'AddChild',TypeInfo(_T281),[TypeInfo(TFieldDef)],Addr(TFieldDef.AddChild));

RegisterProc(TFieldDef,'CreateField',mtScriptMethod,TypeInfo(_T282),[
TypeInfo(TComponent),
TypeInfo(TObjectField),
TypeInfo(string),
TypeInfo(Boolean),TypeInfo(TField)],Addr(__TFieldDef__CreateField__Wrapper),cRegister);

RegRegisterMethod(TFieldDef,'HasChildDefs',TypeInfo(_T283),[TypeInfo(Boolean)],Addr(TFieldDef.HasChildDefs));

RegRegisterMethod(TFieldDefList,'FieldByName',TypeInfo(_T284),[
TypeInfo(string),TypeInfo(TFieldDef)],Addr(TFieldDefList.FieldByName));

RegRegisterMethod(TFieldDefList,'Find',TypeInfo(_T285),[
TypeInfo(string),TypeInfo(TFieldDef)],Addr(TFieldDefList.Find));

RegisterProc(TFieldDefs,'Create',mtConstructor,TypeInfo(_T286),[
TypeInfo(TPersistent)],Addr(TFieldDefs.Create),cRegister);

RegRegisterMethod(TFieldDefs,'AddFieldDef',TypeInfo(_T287),[TypeInfo(TFieldDef)],Addr(TFieldDefs.AddFieldDef));

RegRegisterMethod(TFieldDefs,'Find',TypeInfo(_T288),[
TypeInfo(string),TypeInfo(TFieldDef)],Addr(TFieldDefs.Find));

RegRegisterMethod(TFieldDefs,'Update',TypeInfo(_T289),NoParams,Addr(TFieldDefs.Update));

RegisterProc(TFieldDefs,'Add',mtScriptMethod,TypeInfo(_T290),[
TypeInfo(string),
TypeInfo(TFieldType),
TypeInfo(Integer),
TypeInfo(Boolean)],Addr(__TFieldDefs__Add__Wrapper),cRegister);

RegRegisterMethod(TFieldList,'FieldByName',TypeInfo(_T291),[
TypeInfo(string),TypeInfo(TField)],Addr(TFieldList.FieldByName));

RegRegisterMethod(TFieldList,'Find',TypeInfo(_T292),[
TypeInfo(string),TypeInfo(TField)],Addr(TFieldList.Find));

RegisterProc(TFields,'Create',mtConstructor,TypeInfo(_T293),[
TypeInfo(TDataSet)],Addr(TFields.Create),cRegister);

RegRegisterMethod(TFields,'Add',TypeInfo(_T294),[
TypeInfo(TField)],Addr(TFields.Add));

RegRegisterMethod(TFields,'CheckFieldName',TypeInfo(_T295),[
TypeInfo(string)],Addr(TFields.CheckFieldName));

RegRegisterMethod(TFields,'CheckFieldNames',TypeInfo(_T296),[
TypeInfo(string)],Addr(TFields.CheckFieldNames));

RegRegisterMethod(TFields,'Clear',TypeInfo(_T297),NoParams,Addr(TFields.Clear));

RegRegisterMethod(TFields,'FindField',TypeInfo(_T298),[
TypeInfo(string),TypeInfo(TField)],Addr(TFields.FindField));

RegRegisterMethod(TFields,'FieldByName',TypeInfo(_T299),[
TypeInfo(string),TypeInfo(TField)],Addr(TFields.FieldByName));

RegRegisterMethod(TFields,'FieldByNumber',TypeInfo(_T300),[
TypeInfo(Integer),TypeInfo(TField)],Addr(TFields.FieldByNumber));

RegRegisterMethod(TFields,'GetFieldNames',TypeInfo(_T301),[
TypeInfo(TStrings)],Addr(TFields.GetFieldNames));

RegRegisterMethod(TFields,'IndexOf',TypeInfo(_T302),[
TypeInfo(TField),TypeInfo(Integer)],Addr(TFields.IndexOf));

RegRegisterMethod(TFields,'Remove',TypeInfo(_T303),[
TypeInfo(TField)],Addr(TFields.Remove));

RegRegisterMethod(TFlatList,'GetUpdated',TypeInfo(_T304),[TypeInfo(Boolean)], pointer(132));

RegRegisterMethod(TFlatList,'UpdateList',TypeInfo(_T305),NoParams, pointer(136));

RegisterProc(TFlatList,'Create',mtConstructor,TypeInfo(_T306),[
TypeInfo(TDataSet)],Addr(TFlatList.Create),cRegister);

RegRegisterMethod(TFlatList,'Update',TypeInfo(_T307),NoParams,Addr(TFlatList.Update));

RegisterProc(TIndexDef,'Create',mtConstructor,TypeInfo(_T308),[
TypeInfo(TIndexDefs),
TypeInfo(string),
TypeInfo(string),
TypeInfo(TIndexOptions)],Addr(TIndexDef.Create),cRegister);

RegisterProc(TIndexDefs,'Create',mtConstructor,TypeInfo(_T309),[
TypeInfo(TDataSet)],Addr(TIndexDefs.Create),cRegister);

RegRegisterMethod(TIndexDefs,'AddIndexDef',TypeInfo(_T310),[TypeInfo(TIndexDef)],Addr(TIndexDefs.AddIndexDef));

RegRegisterMethod(TIndexDefs,'Find',TypeInfo(_T311),[
TypeInfo(string),TypeInfo(TIndexDef)],Addr(TIndexDefs.Find));

RegRegisterMethod(TIndexDefs,'Update',TypeInfo(_T312),NoParams,Addr(TIndexDefs.Update));

RegRegisterMethod(TIndexDefs,'FindIndexForFields',TypeInfo(_T313),[
TypeInfo(string),TypeInfo(TIndexDef)],Addr(TIndexDefs.FindIndexForFields));

RegRegisterMethod(TIndexDefs,'GetIndexForFields',TypeInfo(_T314),[
TypeInfo(string),
TypeInfo(Boolean),TypeInfo(TIndexDef)],Addr(TIndexDefs.GetIndexForFields));

RegRegisterMethod(TIndexDefs,'Add',TypeInfo(_T315),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TIndexOptions)],Addr(TIndexDefs.Add));

RegisterProc(TLookupList,'Create',mtConstructor,TypeInfo(_T316),NoParams,Addr(TLookupList.Create),cRegister);

RegRegisterMethod(TLookupList,'Add',TypeInfo(_T317),[
TypeInfo(Variant),
TypeInfo(Variant)],Addr(TLookupList.Add));

RegRegisterMethod(TLookupList,'Clear',TypeInfo(_T318),NoParams,Addr(TLookupList.Clear));

RegRegisterMethod(TLookupList,'ValueOfKey',TypeInfo(_T319),[
TypeInfo(Variant),TypeInfo(Variant)],Addr(TLookupList.ValueOfKey));

RegisterProc(TMasterDataLink,'Create',mtConstructor,TypeInfo(_T320),[
TypeInfo(TDataSet)],Addr(TMasterDataLink.Create),cRegister);

RegRegisterMethod(TObjectField,'GetFields',TypeInfo(_T321),[TypeInfo(TFields)], pointer(208));

RegRegisterMethod(TObjectField,'GetFieldValue',TypeInfo(_T322),[
TypeInfo(Integer),TypeInfo(Variant)], pointer(212));

RegRegisterMethod(TObjectField,'SetFieldValue',TypeInfo(_T323),[
TypeInfo(Integer),
TypeInfo(Variant)], pointer(216));

RegisterProc(TParam,'Create',mtConstructor,TypeInfo(_T324),[
TypeInfo(TParams),
TypeInfo(TParamType)],Addr(TParam.Create),cRegister);

RegRegisterMethod(TParam,'AssignField',TypeInfo(_T325),[
TypeInfo(TField)],Addr(TParam.AssignField));

RegRegisterMethod(TParam,'AssignFieldValue',TypeInfo(_T326),[
TypeInfo(TField),
TypeInfo(Variant)],Addr(TParam.AssignFieldValue));

RegRegisterMethod(TParam,'Clear',TypeInfo(_T327),NoParams,Addr(TParam.Clear));

RegRegisterMethod(TParam,'GetData',TypeInfo(_T328),[
TypeInfoPointer],Addr(TParam.GetData));

RegRegisterMethod(TParam,'GetDataSize',TypeInfo(_T329),[TypeInfo(Integer)],Addr(TParam.GetDataSize));

RegRegisterMethod(TParam,'LoadFromFile',TypeInfo(_T330),[
TypeInfo(string),
TypeInfo(TBlobType)],Addr(TParam.LoadFromFile));

RegRegisterMethod(TParam,'LoadFromStream',TypeInfo(_T331),[
TypeInfo(TStream),
TypeInfo(TBlobType)],Addr(TParam.LoadFromStream));

RegRegisterMethod(TParam,'SetBlobData',TypeInfo(_T332),[
TypeInfoPointer,
TypeInfo(Integer)],Addr(TParam.SetBlobData));

RegRegisterMethod(TParam,'SetData',TypeInfo(_T333),[
TypeInfoPointer],Addr(TParam.SetData));

RegisterProc(TParams,'Create',mtConstructor,TypeInfo(_T334),[
TypeInfo(TPersistent)],Addr(TParams.Create),cRegister);

RegRegisterMethod(TParams,'AssignValues',TypeInfo(_T335),[
TypeInfo(TParams)],Addr(TParams.AssignValues));

RegRegisterMethod(TParams,'AddParam',TypeInfo(_T336),[
TypeInfo(TParam)],Addr(TParams.AddParam));

RegRegisterMethod(TParams,'RemoveParam',TypeInfo(_T337),[
TypeInfo(TParam)],Addr(TParams.RemoveParam));

RegRegisterMethod(TParams,'CreateParam',TypeInfo(_T338),[
TypeInfo(TFieldType),
TypeInfo(string),
TypeInfo(TParamType),TypeInfo(TParam)],Addr(TParams.CreateParam));

RegRegisterMethod(TParams,'GetParamList',TypeInfo(_T339),[
TypeInfo(TList),
TypeInfo(string)],Addr(TParams.GetParamList));

RegRegisterMethod(TParams,'IsEqual',TypeInfo(_T340),[
TypeInfo(TParams),TypeInfo(Boolean)],Addr(TParams.IsEqual));

RegRegisterMethod(TParams,'ParseSQL',TypeInfo(_T341),[
TypeInfo(string),
TypeInfo(Boolean),TypeInfo(string)],Addr(TParams.ParseSQL));

RegRegisterMethod(TParams,'ParamByName',TypeInfo(_T342),[
TypeInfo(string),TypeInfo(TParam)],Addr(TParams.ParamByName));

RegRegisterMethod(TParams,'FindParam',TypeInfo(_T343),[
TypeInfo(string),TypeInfo(TParam)],Addr(TParams.FindParam));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'RegisterFields',mtProc,TypeInfo(_T1),[
ArrayInfo(TypeInfo(TFieldClass))],Addr(RegisterFields),cRegister)}

{RegRegisterMethod(TDataSet,'CalculateFields',TypeInfo(_T73),[
TypeInfoPChar], pointer(128))}

{RegRegisterMethod(TDataSet,'ClearCalcFields',TypeInfo(_T78),[
TypeInfoPChar], pointer(148))}

{RegRegisterMethod(TDataSet,'GetCalcFields',TypeInfo(_T113),[
TypeInfoPChar], pointer(288))}

{RegRegisterMethod(TDataSet,'GetFieldClass',TypeInfo(_T116),[
TypeInfo(TFieldType),TypeInfo(TFieldClass)], pointer(300))}

{RegRegisterMethod(TDataSet,'InitRecord',TypeInfo(_T127),[
TypeInfoPChar], pointer(344))}

{RegRegisterMethod(TDataSet,'RefreshInternalCalcFields',TypeInfo(_T133),[
TypeInfoPChar], pointer(368))}

{RegRegisterMethod(TDataSet,'SetOnFilterRecord',TypeInfo(_T143),[
TypeInfo(TFilterRecordEvent)], pointer(408))}

{RegRegisterMethod(TDataSet,'FreeRecordBuffer',TypeInfo(_T148),[
TypeInfoPChar], pointer(428))}

{RegRegisterMethod(TDataSet,'GetBookmarkData',TypeInfo(_T149),[
TypeInfoPChar,
TypeInfoPointer], pointer(432))}

{RegRegisterMethod(TDataSet,'GetBookmarkFlag',TypeInfo(_T150),[
TypeInfoPChar,TypeInfo(TBookmarkFlag)], pointer(436))}

{RegRegisterMethod(TDataSet,'GetRecord',TypeInfo(_T151),[
TypeInfoPChar,
TypeInfo(TGetMode),
TypeInfo(Boolean),TypeInfo(TGetResult)], pointer(440))}

{RegRegisterMethod(TDataSet,'InternalInitRecord',TypeInfo(_T160),[
TypeInfoPChar], pointer(476))}

{RegRegisterMethod(TDataSet,'InternalSetToRecord',TypeInfo(_T164),[
TypeInfoPChar], pointer(492))}

{RegRegisterMethod(TDataSet,'SetBookmarkFlag',TypeInfo(_T166),[
TypeInfoPChar,
TypeInfo(TBookmarkFlag)], pointer(500))}

{RegRegisterMethod(TDataSet,'SetBookmarkData',TypeInfo(_T167),[
TypeInfoPChar,
TypeInfoPointer], pointer(504))}

{RegRegisterMethod(TDataSet,'GetCurrentRecord',TypeInfo(_T194),[
TypeInfoPChar,TypeInfo(Boolean)], pointer(540))}

{RegRegisterMethod(TDataSet,'Translate',TypeInfo(_T218),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(Boolean),TypeInfo(Integer)], pointer(584))}

{RegisterProc(TDefCollection,'Create',mtConstructor,TypeInfo(_T228),[
TypeInfo(TDataSet),
TypeInfo(TPersistent),
TypeInfo(TCollectionItemClass)],Addr(TDefCollection.Create),cRegister)}

RegisterEvent(TypeInfo(TConnectChangeEvent),[
TypeInfo(TObject),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TDataChangeEvent),[
TypeInfo(TObject),
TypeInfo(TField)]);

RegisterEvent(TypeInfo(TDataOperation),NoParams);

RegisterEvent(TypeInfo(TDataSetErrorEvent),[
TypeInfo(TDataSet),
TypeInfo(EDatabaseError),
TypeInfo(TDataAction)]);

RegisterEvent(TypeInfo(TDataSetNotifyEvent),[
TypeInfo(TDataSet)]);

RegisterEvent(TypeInfo(TDefUpdateMethod),NoParams);

RegisterEvent(TypeInfo(TFieldGetTextEvent),[
TypeInfo(TField),
TypeInfo(string),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TFieldNotifyEvent),[
TypeInfo(TField)]);

RegisterEvent(TypeInfo(TFieldSetTextEvent),[
TypeInfo(TField),
TypeInfo(string)]);

RegisterEvent(TypeInfo(TFilterRecordEvent),[
TypeInfo(TDataSet),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TLoginEvent),[
TypeInfo(TObject),
TypeInfo(string),
TypeInfo(string)]);

RegisterEvent(TypeInfo(TUpdateErrorEvent),[
TypeInfo(TDataSet),
TypeInfo(EDatabaseError),
TypeInfo(TUpdateKind),
TypeInfo(TUpdateAction)]);

RegisterEvent(TypeInfo(TUpdateRecordEvent),[
TypeInfo(TDataSet),
TypeInfo(TUpdateKind),
TypeInfo(TUpdateAction)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
