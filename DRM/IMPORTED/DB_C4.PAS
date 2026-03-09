{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit DB_C4;
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
function ConvertTDateTimeRecToVariant(var R : TDateTimeRec) : OleVariant;
function ConvertVariantToTDateTimeRec(const V : OleVariant) : TDateTimeRec;
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
type
_T0 = function (const p0 : string;
var p1 : Integer): string of object;

{_T1 = procedure (const p0 : Array of TFieldClass) of object;}

_T2 = procedure (const p0 : string;
p1 : TComponent) of object;

_T3 = procedure (const p0 : string;
const p1 : Array of Const;
p2 : TComponent) of object;

_T4 = procedure (p0 : Word) of object;

_T5 = procedure (p0 : Word;
const p1 : Array of Const) of object;

_T6 = procedure (var p0;
p1 : Integer) of object;

_T7 = function (p0 : Pointer;
p1 : Pointer;
p2 : Integer): Boolean of object;

_T8 = function (p0 : TDataSet;
p1 : TComponent;
const p2 : string): TField of object;

_T9 = function (p0 : TParam): PChar of object;

_T10 = procedure (p0 : Pointer) of object;

_T11 = function : Pointer of object;

_T12 = function : Integer of object;

_T13 = procedure (const p0 : string) of object;

_T14 = procedure (p0 : TStream) of object;

_T15 = _T13;

_T16 = _T14;

_T17 = procedure (p0 : TPersistent) of object;

_T18 = function : TCheckConstraint of object;

_T19 = procedure  of object;

_T20 = _T19;

_T21 = procedure (p0 : TDataEvent;
p1 : Longint) of object;

_T22 = _T19;

_T23 = procedure (p0 : Integer) of object;

_T24 = _T19;

_T25 = procedure (p0 : TFieldRef) of object;

_T26 = _T12;

_T27 = function : Boolean of object;

_T28 = _T12;

_T29 = _T27;

_T30 = _T12;

_T31 = _T19;

_T32 = function (p0 : Integer): Integer of object;

_T33 = procedure (p0 : TField) of object;

_T34 = _T23;

_T35 = _T23;

_T36 = _T19;

_T37 = _T19;

_T38 = _T27;

_T39 = function (p0 : TBasicAction): Boolean of object;

_T40 = _T39;

_T41 = _T19;

_T42 = _T33;

_T43 = function (p0 : Pointer;
var p1 : Currency): Boolean of object;

_T44 = function (const p0 : Currency;
p1 : Pointer;
p2 : Integer;
p3 : Integer): Boolean of object;

{_T45 = procedure (p0 : PChar) of object;}

_T46 = _T19;

_T47 = _T19;

_T48 = _T19;

{_T49 = procedure (p0 : PChar) of object;}

_T50 = _T33;

_T51 = _T19;

_T52 = function (p0 : TDataSetField): TDataSet of object;

_T53 = _T21;

_T54 = procedure (p0 : TObject) of object;

_T55 = _T19;

_T56 = _T19;

_T57 = _T19;

_T58 = _T19;

_T59 = _T19;

_T60 = _T19;

_T61 = _T19;

_T62 = _T19;

_T63 = _T19;

_T64 = _T19;

_T65 = _T19;

_T66 = _T19;

_T67 = _T19;

_T68 = _T19;

_T69 = _T19;

_T70 = _T19;

_T71 = _T19;

_T72 = _T19;

_T73 = _T19;

_T74 = function (p0 : Boolean;
p1 : Boolean): Boolean of object;

_T75 = _T19;

_T76 = function (p0 : TField): Variant of object;

_T77 = function (p0 : TGroupPosInd): Integer of object;

_T78 = _T19;

_T79 = function : TBookmarkStr of object;

{_T80 = procedure (p0 : PChar) of object;}

_T81 = _T27;

_T82 = function : TDataSource of object;

{_T83 = function (p0 : TFieldType): TFieldClass of object;}

_T84 = function (p0 : TField): string of object;

_T85 = function (p0 : TDataSetState;
p1 : TField): Variant of object;

_T86 = function (p0 : TField): Boolean of object;

_T87 = _T12;

_T88 = _T27;

_T89 = _T12;

_T90 = _T27;

_T91 = _T12;

_T92 = _T12;

_T93 = _T19;

{_T94 = procedure (p0 : PChar) of object;}

_T95 = _T19;

_T96 = _T19;

_T97 = _T19;

_T98 = _T19;

_T99 = procedure (p0 : Boolean) of object;

{_T100 = procedure (p0 : PChar) of object;}

_T101 = _T19;

_T102 = _T99;

_T103 = procedure (const p0 : TBookmarkStr) of object;

_T104 = _T23;

_T105 = _T23;

_T106 = procedure (const p0 : TDataSetField) of object;

_T107 = _T99;

_T108 = procedure (p0 : TFilterOptions) of object;

_T109 = _T13;

{_T110 = procedure (const p0 : TFilterRecordEvent) of object;}

_T111 = _T23;

_T112 = procedure (p0 : TDataSetState;
p1 : TField;
const p2 : Variant) of object;

_T113 = _T19;

_T114 = function : PChar of object;

{_T115 = procedure (var p0 : PChar) of object;}

{_T116 = procedure (p0 : PChar;
p1 : Pointer) of object;}

{_T117 = function (p0 : PChar): TBookmarkFlag of object;}

{_T118 = function (p0 : PChar;
p1 : TGetMode;
p2 : Boolean): TGetResult of object;}

_T119 = function : Word of object;

_T120 = procedure (p0 : Pointer;
p1 : Boolean) of object;

_T121 = _T19;

_T122 = _T19;

_T123 = _T19;

_T124 = _T10;

_T125 = _T19;

_T126 = _T19;

{_T127 = procedure (p0 : PChar) of object;}

_T128 = _T19;

_T129 = _T19;

_T130 = _T19;

{_T131 = procedure (p0 : PChar) of object;}

_T132 = _T27;

{_T133 = procedure (p0 : PChar;
p1 : TBookmarkFlag) of object;}

{_T134 = procedure (p0 : PChar;
p1 : Pointer) of object;}

_T135 = procedure (p0 : TField;
p1 : Pointer) of object;

_T136 = _T114;

_T137 = _T19;

_T138 = procedure (const p0 : Array of Const) of object;

_T139 = function (p0 : TBookmark): Boolean of object;

_T140 = _T19;

_T141 = _T19;

_T142 = _T19;

_T143 = _T19;

_T144 = _T27;

_T145 = function (p0 : TBookmark;
p1 : TBookmark): Integer of object;

_T146 = function (p0 : TField;
p1 : TBlobStreamMode): TStream of object;

_T147 = _T19;

_T148 = _T19;

_T149 = _T19;

_T150 = _T19;

_T151 = _T19;

_T152 = function (const p0 : string): TField of object;

_T153 = _T152;

_T154 = _T27;

_T155 = _T27;

_T156 = _T27;

_T157 = _T27;

_T158 = _T19;

_T159 = procedure (p0 : TBookmark) of object;

_T160 = function : TBookmark of object;

{_T161 = function (p0 : PChar): Boolean of object;}

_T162 = procedure (p0 : TList) of object;

_T163 = procedure (p0 : TList;
p1 : TList) of object;

_T164 = function (p0 : Integer;
var p1 : TBlobByteData): Integer of object;

_T165 = function (p0 : TField;
p1 : Pointer): Boolean of object;

_T166 = procedure (p0 : TList;
const p1 : string) of object;

_T167 = procedure (p0 : TStrings) of object;

_T168 = _T162;

_T169 = _T159;

_T170 = _T19;

_T171 = _T138;

_T172 = _T27;

_T173 = function (p0 : TDataSource): Boolean of object;

_T174 = _T27;

_T175 = _T19;

_T176 = function (const p0 : string;
const p1 : Variant;
p2 : TLocateOptions): Boolean of object;

_T177 = function (const p0 : string;
const p1 : Variant;
const p2 : string): Variant of object;

_T178 = _T32;

_T179 = _T19;

_T180 = _T19;

_T181 = _T19;

_T182 = _T19;

_T183 = _T19;

_T184 = procedure (p0 : TResyncMode) of object;

_T185 = _T138;

{_T186 = function (p0 : PChar;
p1 : PChar;
p2 : Boolean): Integer of object;}

_T187 = _T19;

_T188 = _T19;

_T189 = function : TUpdateStatus of object;

_T190 = procedure (p0 : TDataSet) of object;

_T191 = _T19;

_T192 = _T21;

_T193 = _T19;

_T194 = _T19;

_T195 = function (p0 : TDataSet): Boolean of object;

{_T196 = procedure (p0 : TDataSet;
p1 : TPersistent;
p2 : TCollectionItemClass) of object;}

_T197 = function (const p0 : string): TNamedItem of object;

_T198 = _T167;

_T199 = function (const p0 : string): Integer of object;

_T200 = function : TDataSet of object;

_T201 = function (const p0 : string): EDatabaseError of object;

_T202 = _T99;

_T203 = _T23;

_T204 = _T19;

_T205 = _T19;

_T206 = _T27;

_T207 = function : Variant of object;

_T208 = function : Currency of object;

_T209 = function : TDateTime of object;

_T210 = function : Double of object;

_T211 = function : Longint of object;

_T212 = function : string of object;

_T213 = _T207;

_T214 = _T27;

_T215 = _T119;

_T216 = _T12;

_T217 = _T12;

_T218 = _T27;

_T219 = _T27;

_T220 = _T119;

_T221 = procedure (var p0 : string;
p1 : Boolean) of object;

_T222 = _T99;

_T223 = procedure (const p0 : Variant) of object;

_T224 = procedure (p0 : Currency) of object;

_T225 = procedure (p0 : TDateTime) of object;

_T226 = procedure (p0 : Double) of object;

_T227 = procedure (p0 : Longint) of object;

_T228 = _T13;

_T229 = _T223;

_T230 = _T190;

_T231 = procedure (p0 : TFieldKind) of object;

_T232 = procedure (p0 : TObjectField) of object;

_T233 = _T4;

_T234 = _T13;

_T235 = _T223;

_T236 = procedure (const p0 : IDispatch) of object;

_T237 = _T19;

_T238 = _T19;

_T239 = function (p0 : Pointer): Boolean of object;

_T240 = _T27;

_T241 = function (p0 : Char): Boolean of object;

_T242 = _T19;

_T243 = _T10;

_T244 = procedure (p0 : TFieldType) of object;

_T245 = _T10;

_T246 = procedure (p0 : TFieldDefs;
const p1 : string;
p2 : TFieldType;
p3 : Word;
p4 : Boolean;
p5 : Integer) of object;

_T247 = function : TFieldDef of object;

_T248 = function (p0 : TComponent;
p1 : TObjectField;
const p2 : string;
p3 : Boolean): TField of object;

_T249 = _T27;

_T250 = function (const p0 : string): TFieldDef of object;

_T251 = _T250;

_T252 = _T17;

_T253 = _T247;

_T254 = _T250;

_T255 = _T19;

_T256 = procedure (const p0 : string;
p1 : TFieldType;
p2 : Word;
p3 : Boolean) of object;

_T257 = _T152;

_T258 = _T152;

_T259 = _T190;

_T260 = _T33;

_T261 = _T13;

_T262 = _T13;

_T263 = _T19;

_T264 = _T152;

_T265 = _T152;

_T266 = function (p0 : Integer): TField of object;

_T267 = _T167;

_T268 = function (p0 : TField): Integer of object;

_T269 = _T33;

_T270 = _T27;

_T271 = _T19;

_T272 = _T190;

_T273 = _T19;

_T274 = procedure (p0 : TIndexDefs;
const p1 : string;
const p2 : string;
p3 : TIndexOptions) of object;

_T275 = _T190;

_T276 = function : TIndexDef of object;

_T277 = function (const p0 : string): TIndexDef of object;

_T278 = _T19;

_T279 = _T277;

_T280 = function (const p0 : string;
p1 : Boolean): TIndexDef of object;

_T281 = procedure (const p0 : string;
const p1 : string;
p2 : TIndexOptions) of object;

_T282 = _T19;

_T283 = procedure (const p0 : Variant;
const p1 : Variant) of object;

_T284 = _T19;

_T285 = function (const p0 : Variant): Variant of object;

_T286 = function : TFields of object;

_T287 = function (p0 : Integer): Variant of object;

_T288 = procedure (p0 : Integer;
const p1 : Variant) of object;

_T289 = procedure (p0 : TParams;
p1 : TParamType) of object;

_T290 = _T33;

_T291 = procedure (p0 : TField;
const p1 : Variant) of object;

_T292 = _T19;

_T293 = _T10;

_T294 = _T12;

_T295 = procedure (const p0 : string;
p1 : TBlobType) of object;

_T296 = procedure (p0 : TStream;
p1 : TBlobType) of object;

_T297 = procedure (p0 : Pointer;
p1 : Integer) of object;

_T298 = _T10;

_T299 = _T17;

_T300 = procedure (p0 : TParams) of object;

_T301 = procedure (p0 : TParam) of object;

_T302 = _T301;

_T303 = function (p0 : TFieldType;
const p1 : string;
p2 : TParamType): TParam of object;

_T304 = _T166;

_T305 = function (p0 : TParams): Boolean of object;

_T306 = function (p0 : string;
p1 : Boolean): string of object;

_T307 = function (const p0 : string): TParam of object;

_T308 = _T307;

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

function __DC__GetTStringField__FixedChar(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStringField(Instance).FixedChar;
end;

procedure __DC__SetTStringField__FixedChar(Instance : TObject; Params : PVariantArgList);
begin
TStringField(Instance).FixedChar:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
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
RegisterIndexedProperty(TFields,'Fields',1,True,__DC__GetTFields__Fields,nil);
RegisterProperty(TFlatList,'DataSet',__DC__GetTFlatList__DataSet,nil);
RegisterProperty(TFloatField,'Value',__DC__GetTFloatField__Value,__DC__SetTFloatField__Value);
RegisterProperty(TIndexDef,'FieldExpression',__DC__GetTIndexDef__FieldExpression,nil);
RegisterIndexedProperty(TIndexDefs,'Items',1,True,__DC__GetTIndexDefs__Items,__DC__SetTIndexDefs__Items);
RegisterProperty(TIntegerField,'Value',__DC__GetTIntegerField__Value,__DC__SetTIntegerField__Value);
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
RegisterProperty(TParam,'Text',__DC__GetTParam__Text,__DC__SetTParam__Text);
RegisterIndexedProperty(TParams,'Items',1,True,__DC__GetTParams__Items,__DC__SetTParams__Items);
RegisterIndexedProperty(TParams,'ParamValues',1,False,__DC__GetTParams__ParamValues,__DC__SetTParams__ParamValues);
RegisterProperty(TStringField,'Value',__DC__GetTStringField__Value,__DC__SetTStringField__Value);
RegisterProperty(TStringField,'FixedChar',__DC__GetTStringField__FixedChar,__DC__SetTStringField__FixedChar);
end;

const __ConstNames0 : array[0..119] of string = (
'dsMaxStringSize'
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
,'usUnmodified'
,'usModified'
,'usInserted'
,'usDeleted'
,'upWhereAll'
,'upWhereChanged'
,'upWhereKeyOnly'
,'ftUnknown'
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
,'faHiddenCol'
,'faReadonly'
,'faRequired'
,'faLink'
,'faUnNamed'
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
,'ukModify'
,'ukInsert'
,'ukDelete'
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
,'dsEditModes'
,'dsWriteModes'
,'ObjectFieldTypes'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,dsMaxStringSize));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,dsInactive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,dsBrowse));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,dsEdit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,dsInsert));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,dsSetKey));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,dsCalcFields));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,dsFilter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,dsNewValue));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,dsOldValue));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,dsCurValue));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,dsBlockRead));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,dsInternalCalc));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,deFieldChange));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,deRecordChange));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,deDataSetChange));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,deDataSetScroll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,deLayoutChange));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,deUpdateRecord));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,deUpdateState));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,deCheckBrowseMode));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,dePropertyChange));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,deFieldListChange));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,deFocusControl));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,deParentScroll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,usUnmodified));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,usModified));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,usInserted));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,usDeleted));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,upWhereAll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,upWhereChanged));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,upWhereKeyOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,ftUnknown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,ftString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,ftSmallint));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,ftInteger));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,ftWord));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,ftBoolean));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,ftFloat));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,ftCurrency));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,ftBCD));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,ftDate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,ftTime));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,ftDateTime));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,ftBytes));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,ftVarBytes));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,ftAutoInc));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,ftBlob));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[48] ,ftMemo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[49] ,ftGraphic));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[50] ,ftFmtMemo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[51] ,ftParadoxOle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[52] ,ftDBaseOle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[53] ,ftTypedBinary));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[54] ,ftCursor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[55] ,ftFixedChar));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[56] ,ftWideString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[57] ,ftLargeint));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[58] ,ftADT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[59] ,ftArray));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[60] ,ftReference));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[61] ,ftDataSet));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[62] ,faHiddenCol));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[63] ,faReadonly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[64] ,faRequired));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[65] ,faLink));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[66] ,faUnNamed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[67] ,ixPrimary));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[68] ,ixUnique));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[69] ,ixDescending));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[70] ,ixCaseInsensitive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[71] ,ixExpression));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[72] ,ixNonMaintained));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[73] ,fkData));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[74] ,fkCalculated));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[75] ,fkLookup));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[76] ,fkInternalCalc));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[77] ,fkAggregate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[78] ,pfInUpdate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[79] ,pfInWhere));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[80] ,pfInKey));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[81] ,pfHidden));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[82] ,ptUnknown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[83] ,ptInput));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[84] ,ptOutput));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[85] ,ptInputOutput));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[86] ,ptResult));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[87] ,bfCurrent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[88] ,bfBOF));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[89] ,bfEOF));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[90] ,bfInserted));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[91] ,gmCurrent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[92] ,gmNext));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[93] ,gmPrior));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[94] ,grOK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[95] ,grBOF));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[96] ,grEOF));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[97] ,grError));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[98] ,rmExact));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[99] ,rmCenter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[100] ,daFail));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[101] ,daAbort));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[102] ,daRetry));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[103] ,ukModify));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[104] ,ukInsert));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[105] ,ukDelete));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[106] ,bmRead));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[107] ,bmWrite));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[108] ,bmReadWrite));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[109] ,loCaseInsensitive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[110] ,loPartialKey));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[111] ,foCaseInsensitive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[112] ,foNoPartialCompare));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[113] ,gbFirst));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[114] ,gbMiddle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[115] ,gbLast));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[116] ,VarFromSet(ftNonTextTypes, sizeof(ftNonTextTypes))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[117] ,VarFromSet(dsEditModes, sizeof(dsEditModes))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[118] ,VarFromSet(dsWriteModes, sizeof(dsWriteModes))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[119] ,VarFromSet(ObjectFieldTypes, sizeof(ObjectFieldTypes))));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..47] of TClass = (
EDatabaseError,
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
TIndexDef,
TIndexDefs,
TIntegerField,
TLargeintField,
TLookupList,
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
'TDateTimeRec'
,'TLookupListEntry'
,'TPacketAttribute'
,'ExtractFieldName'
,'DatabaseError'
,'DatabaseErrorFmt'
,'DBError'
,'DBErrorFmt'
,'DisposeMem'
,'BuffersEqual'
,'GetFieldProperty'
,'GetParamDataStr'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TDateTimeRec_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(_TLookupListEntry_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[2],Addr(_TPacketAttribute_)));
RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T0),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(string)],Addr(ExtractFieldName),cRegister);

RegisterProc(nil,MethodNames[4],mtScriptProc,TypeInfo(_T2),[
TypeInfo(string),
TypeInfo(TComponent)],Addr(____DatabaseError__Wrapper),cRegister);

RegisterProc(nil,MethodNames[5],mtProc,TypeInfo(_T3),[
TypeInfo(string),
TypeInfoArrayOfConst,
TypeInfo(TComponent)],Addr(____DatabaseErrorFmt__Wrapper),cRegister);

RegisterProc(nil,MethodNames[6],mtProc,TypeInfo(_T4),[
TypeInfo(Word)],Addr(DBError),cRegister);

RegisterProc(nil,MethodNames[7],mtProc,TypeInfo(_T5),[
TypeInfo(Word),
TypeInfoArrayOfConst],Addr(DBErrorFmt),cRegister);

RegisterProc(nil,MethodNames[8],mtProc,TypeInfo(_T6),[
TypeInfoUntyped,
TypeInfo(Integer)],Addr(DisposeMem),cRegister);

RegisterProc(nil,MethodNames[9],mtProc,TypeInfo(_T7),[
TypeInfoPointer,
TypeInfoPointer,
TypeInfo(Integer),TypeInfo(Boolean)],Addr(BuffersEqual),cRegister);

RegisterProc(nil,MethodNames[10],mtProc,TypeInfo(_T8),[
TypeInfo(TDataSet),
TypeInfo(TComponent),
TypeInfo(string),TypeInfo(TField)],Addr(GetFieldProperty),cRegister);

RegisterProc(nil,MethodNames[11],mtProc,TypeInfo(_T9),[
TypeInfo(TParam),TypeInfoPChar],Addr(GetParamDataStr),cRegister);

RegRegisterMethod(TAggregateField,'SetHandle',TypeInfo(_T10),[
TypeInfoPointer], pointer(200));

RegRegisterMethod(TAggregateField,'GetHandle',TypeInfo(_T11),[TypeInfoPointer], pointer(204));

RegRegisterMethod(TBlobField,'GetBlobSize',TypeInfo(_T12),[TypeInfo(Integer)], pointer(200));

RegRegisterMethod(TBlobField,'LoadFromFile',TypeInfo(_T13),[
TypeInfo(string)],Addr(TBlobField.LoadFromFile));

RegRegisterMethod(TBlobField,'LoadFromStream',TypeInfo(_T14),[
TypeInfo(TStream)],Addr(TBlobField.LoadFromStream));

RegRegisterMethod(TBlobField,'SaveToFile',TypeInfo(_T15),[
TypeInfo(string)],Addr(TBlobField.SaveToFile));

RegRegisterMethod(TBlobField,'SaveToStream',TypeInfo(_T16),[
TypeInfo(TStream)],Addr(TBlobField.SaveToStream));

RegisterProc(TCheckConstraints,'Create',mtConstructor,TypeInfo(_T17),[
TypeInfo(TPersistent)],Addr(TCheckConstraints.Create),cRegister);

RegRegisterMethod(TCheckConstraints,'Add',TypeInfo(_T18),[TypeInfo(TCheckConstraint)],Addr(TCheckConstraints.Add));

RegRegisterMethod(TDataLink,'ActiveChanged',TypeInfo(_T19),NoParams, pointer(12));

RegRegisterMethod(TDataLink,'CheckBrowseMode',TypeInfo(_T20),NoParams, pointer(16));

RegRegisterMethod(TDataLink,'DataEvent',TypeInfo(_T21),[
TypeInfo(TDataEvent),
TypeInfo(Longint)], pointer(20));

RegRegisterMethod(TDataLink,'DataSetChanged',TypeInfo(_T22),NoParams, pointer(24));

RegRegisterMethod(TDataLink,'DataSetScrolled',TypeInfo(_T23),[
TypeInfo(Integer)], pointer(28));

RegRegisterMethod(TDataLink,'EditingChanged',TypeInfo(_T24),NoParams, pointer(32));

RegRegisterMethod(TDataLink,'FocusControl',TypeInfo(_T25),[
TypeInfoPointer], pointer(36));

RegRegisterMethod(TDataLink,'GetActiveRecord',TypeInfo(_T26),[TypeInfo(Integer)], pointer(40));

RegRegisterMethod(TDataLink,'GetBOF',TypeInfo(_T27),[TypeInfo(Boolean)], pointer(44));

RegRegisterMethod(TDataLink,'GetBufferCount',TypeInfo(_T28),[TypeInfo(Integer)], pointer(48));

RegRegisterMethod(TDataLink,'GetEOF',TypeInfo(_T29),[TypeInfo(Boolean)], pointer(52));

RegRegisterMethod(TDataLink,'GetRecordCount',TypeInfo(_T30),[TypeInfo(Integer)], pointer(56));

RegRegisterMethod(TDataLink,'LayoutChanged',TypeInfo(_T31),NoParams, pointer(60));

RegRegisterMethod(TDataLink,'MoveBy',TypeInfo(_T32),[
TypeInfo(Integer),TypeInfo(Integer)], pointer(64));

RegRegisterMethod(TDataLink,'RecordChanged',TypeInfo(_T33),[
TypeInfo(TField)], pointer(68));

RegRegisterMethod(TDataLink,'SetActiveRecord',TypeInfo(_T34),[
TypeInfo(Integer)], pointer(72));

RegRegisterMethod(TDataLink,'SetBufferCount',TypeInfo(_T35),[
TypeInfo(Integer)], pointer(76));

RegRegisterMethod(TDataLink,'UpdateData',TypeInfo(_T36),NoParams, pointer(80));

RegisterProc(TDataLink,'Create',mtConstructor,TypeInfo(_T37),NoParams,Addr(TDataLink.Create),cRegister);

RegRegisterMethod(TDataLink,'Edit',TypeInfo(_T38),[TypeInfo(Boolean)],Addr(TDataLink.Edit));

RegRegisterMethod(TDataLink,'ExecuteAction',TypeInfo(_T39),[
TypeInfo(TBasicAction),TypeInfo(Boolean)], pointer(MinVMTOffset - 2));

RegRegisterMethod(TDataLink,'UpdateAction',TypeInfo(_T40),[
TypeInfo(TBasicAction),TypeInfo(Boolean)], pointer(MinVMTOffset - 3));

RegRegisterMethod(TDataLink,'UpdateRecord',TypeInfo(_T41),NoParams,Addr(TDataLink.UpdateRecord));

RegRegisterMethod(TDataSet,'ResetAggField',TypeInfo(_T42),[
TypeInfo(TField)], pointer(48));

RegRegisterMethod(TDataSet,'BCDToCurr',TypeInfo(_T43),[
TypeInfoPointer,
TypeInfo(Currency),TypeInfo(Boolean)], pointer(52));

RegRegisterMethod(TDataSet,'CurrToBCD',TypeInfo(_T44),[
TypeInfo(Currency),
TypeInfoPointer,
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Boolean)], pointer(56));

RegRegisterMethod(TDataSet,'CheckActive',TypeInfo(_T46),NoParams, pointer(64));

RegRegisterMethod(TDataSet,'CheckInactive',TypeInfo(_T47),NoParams, pointer(68));

RegRegisterMethod(TDataSet,'ClearBuffers',TypeInfo(_T48),NoParams, pointer(72));

RegRegisterMethod(TDataSet,'CloseBlob',TypeInfo(_T50),[
TypeInfo(TField)], pointer(80));

RegRegisterMethod(TDataSet,'CloseCursor',TypeInfo(_T51),NoParams, pointer(84));

RegRegisterMethod(TDataSet,'CreateNestedDataSet',TypeInfo(_T52),[
TypeInfo(TDataSetField),TypeInfo(TDataSet)], pointer(88));

RegRegisterMethod(TDataSet,'DataEvent',TypeInfo(_T53),[
TypeInfo(TDataEvent),
TypeInfo(Longint)], pointer(92));

RegRegisterMethod(TDataSet,'DefChanged',TypeInfo(_T54),[
TypeInfo(TObject)], pointer(96));

RegRegisterMethod(TDataSet,'DestroyFields',TypeInfo(_T55),NoParams, pointer(100));

RegRegisterMethod(TDataSet,'DoAfterCancel',TypeInfo(_T56),NoParams, pointer(104));

RegRegisterMethod(TDataSet,'DoAfterClose',TypeInfo(_T57),NoParams, pointer(108));

RegRegisterMethod(TDataSet,'DoAfterDelete',TypeInfo(_T58),NoParams, pointer(112));

RegRegisterMethod(TDataSet,'DoAfterEdit',TypeInfo(_T59),NoParams, pointer(116));

RegRegisterMethod(TDataSet,'DoAfterInsert',TypeInfo(_T60),NoParams, pointer(120));

RegRegisterMethod(TDataSet,'DoAfterOpen',TypeInfo(_T61),NoParams, pointer(124));

RegRegisterMethod(TDataSet,'DoAfterPost',TypeInfo(_T62),NoParams, pointer(128));

RegRegisterMethod(TDataSet,'DoAfterScroll',TypeInfo(_T63),NoParams, pointer(132));

RegRegisterMethod(TDataSet,'DoBeforeCancel',TypeInfo(_T64),NoParams, pointer(136));

RegRegisterMethod(TDataSet,'DoBeforeClose',TypeInfo(_T65),NoParams, pointer(140));

RegRegisterMethod(TDataSet,'DoBeforeDelete',TypeInfo(_T66),NoParams, pointer(144));

RegRegisterMethod(TDataSet,'DoBeforeEdit',TypeInfo(_T67),NoParams, pointer(148));

RegRegisterMethod(TDataSet,'DoBeforeInsert',TypeInfo(_T68),NoParams, pointer(152));

RegRegisterMethod(TDataSet,'DoBeforeOpen',TypeInfo(_T69),NoParams, pointer(156));

RegRegisterMethod(TDataSet,'DoBeforePost',TypeInfo(_T70),NoParams, pointer(160));

RegRegisterMethod(TDataSet,'DoBeforeScroll',TypeInfo(_T71),NoParams, pointer(164));

RegRegisterMethod(TDataSet,'DoOnCalcFields',TypeInfo(_T72),NoParams, pointer(168));

RegRegisterMethod(TDataSet,'DoOnNewRecord',TypeInfo(_T73),NoParams, pointer(172));

RegRegisterMethod(TDataSet,'FindRecord',TypeInfo(_T74),[
TypeInfo(Boolean),
TypeInfo(Boolean),TypeInfo(Boolean)], pointer(176));

RegRegisterMethod(TDataSet,'FreeFieldBuffers',TypeInfo(_T75),NoParams, pointer(180));

RegRegisterMethod(TDataSet,'GetAggregateValue',TypeInfo(_T76),[
TypeInfo(TField),TypeInfo(Variant)], pointer(184));

RegRegisterMethod(TDataSet,'GetAggRecordCount',TypeInfo(_T77),[
TypeInfo(TGroupPosInd),TypeInfo(Integer)], pointer(188));

RegRegisterMethod(TDataSet,'ActivateBuffers',TypeInfo(_T78),NoParams, pointer(192));

RegRegisterMethod(TDataSet,'GetBookmarkStr',TypeInfo(_T79),[TypeInfo(TBookmarkStr)], pointer(196));

RegRegisterMethod(TDataSet,'GetCanModify',TypeInfo(_T81),[TypeInfo(Boolean)], pointer(204));

RegRegisterMethod(TDataSet,'GetDataSource',TypeInfo(_T82),[TypeInfo(TDataSource)], pointer(208));

RegRegisterMethod(TDataSet,'GetFieldFullName',TypeInfo(_T84),[
TypeInfo(TField),TypeInfo(string)], pointer(216));

RegRegisterMethod(TDataSet,'GetStateFieldValue',TypeInfo(_T85),[
TypeInfo(TDataSetState),
TypeInfo(TField),TypeInfo(Variant)], pointer(220));

RegRegisterMethod(TDataSet,'GetIsIndexField',TypeInfo(_T86),[
TypeInfo(TField),TypeInfo(Boolean)], pointer(224));

RegRegisterMethod(TDataSet,'GetNextRecords',TypeInfo(_T87),[TypeInfo(Integer)], pointer(228));

RegRegisterMethod(TDataSet,'GetNextRecord',TypeInfo(_T88),[TypeInfo(Boolean)], pointer(232));

RegRegisterMethod(TDataSet,'GetPriorRecords',TypeInfo(_T89),[TypeInfo(Integer)], pointer(236));

RegRegisterMethod(TDataSet,'GetPriorRecord',TypeInfo(_T90),[TypeInfo(Boolean)], pointer(240));

RegRegisterMethod(TDataSet,'GetRecordCount',TypeInfo(_T91),[TypeInfo(Integer)], pointer(244));

RegRegisterMethod(TDataSet,'GetRecNo',TypeInfo(_T92),[TypeInfo(Integer)], pointer(248));

RegRegisterMethod(TDataSet,'InitFieldDefs',TypeInfo(_T93),NoParams, pointer(252));

RegRegisterMethod(TDataSet,'InternalCancel',TypeInfo(_T95),NoParams, pointer(260));

RegRegisterMethod(TDataSet,'InternalEdit',TypeInfo(_T96),NoParams, pointer(264));

RegRegisterMethod(TDataSet,'InternalInsert',TypeInfo(_T97),NoParams, pointer(268));

RegRegisterMethod(TDataSet,'InternalRefresh',TypeInfo(_T98),NoParams, pointer(272));

RegRegisterMethod(TDataSet,'OpenCursor',TypeInfo(_T99),[
TypeInfo(Boolean)], pointer(276));

RegRegisterMethod(TDataSet,'BlockReadNext',TypeInfo(_T101),NoParams, pointer(284));

RegRegisterMethod(TDataSet,'SetActive',TypeInfo(_T102),[
TypeInfo(Boolean)], pointer(288));

RegRegisterMethod(TDataSet,'SetBookmarkStr',TypeInfo(_T103),[
TypeInfo(TBookmarkStr)], pointer(292));

RegRegisterMethod(TDataSet,'SetBlockReadSize',TypeInfo(_T104),[
TypeInfo(Integer)], pointer(296));

RegRegisterMethod(TDataSet,'SetCurrentRecord',TypeInfo(_T105),[
TypeInfo(Integer)], pointer(300));

RegRegisterMethod(TDataSet,'SetDataSetField',TypeInfo(_T106),[
TypeInfo(TDataSetField)], pointer(304));

RegRegisterMethod(TDataSet,'SetFiltered',TypeInfo(_T107),[
TypeInfo(Boolean)], pointer(308));

RegRegisterMethod(TDataSet,'SetFilterOptions',TypeInfo(_T108),[
TypeInfo(TFilterOptions)], pointer(312));

RegRegisterMethod(TDataSet,'SetFilterText',TypeInfo(_T109),[
TypeInfo(string)], pointer(316));

RegRegisterMethod(TDataSet,'SetRecNo',TypeInfo(_T111),[
TypeInfo(Integer)], pointer(324));

RegRegisterMethod(TDataSet,'SetStateFieldValue',TypeInfo(_T112),[
TypeInfo(TDataSetState),
TypeInfo(TField),
TypeInfo(Variant)], pointer(328));

RegRegisterMethod(TDataSet,'UpdateIndexDefs',TypeInfo(_T113),NoParams, pointer(332));

RegRegisterMethod(TDataSet,'AllocRecordBuffer',TypeInfo(_T114),[TypeInfoPChar], pointer(336));

RegRegisterMethod(TDataSet,'GetRecordSize',TypeInfo(_T119),[TypeInfo(Word)], pointer(356));

RegRegisterMethod(TDataSet,'InternalAddRecord',TypeInfo(_T120),[
TypeInfoPointer,
TypeInfo(Boolean)], pointer(360));

RegRegisterMethod(TDataSet,'InternalClose',TypeInfo(_T121),NoParams, pointer(364));

RegRegisterMethod(TDataSet,'InternalDelete',TypeInfo(_T122),NoParams, pointer(368));

RegRegisterMethod(TDataSet,'InternalFirst',TypeInfo(_T123),NoParams, pointer(372));

RegRegisterMethod(TDataSet,'InternalGotoBookmark',TypeInfo(_T124),[
TypeInfoPointer], pointer(376));

RegRegisterMethod(TDataSet,'InternalHandleException',TypeInfo(_T125),NoParams, pointer(380));

RegRegisterMethod(TDataSet,'InternalInitFieldDefs',TypeInfo(_T126),NoParams, pointer(384));

RegRegisterMethod(TDataSet,'InternalLast',TypeInfo(_T128),NoParams, pointer(392));

RegRegisterMethod(TDataSet,'InternalOpen',TypeInfo(_T129),NoParams, pointer(396));

RegRegisterMethod(TDataSet,'InternalPost',TypeInfo(_T130),NoParams, pointer(400));

RegRegisterMethod(TDataSet,'IsCursorOpen',TypeInfo(_T132),[TypeInfo(Boolean)], pointer(408));

RegRegisterMethod(TDataSet,'SetFieldData',TypeInfo(_T135),[
TypeInfo(TField),
TypeInfoPointer], pointer(420));

RegRegisterMethod(TDataSet,'ActiveBuffer',TypeInfo(_T136),[TypeInfoPChar],Addr(TDataSet.ActiveBuffer));

RegRegisterMethod(TDataSet,'Append',TypeInfo(_T137),NoParams,Addr(TDataSet.Append));

RegRegisterMethod(TDataSet,'AppendRecord',TypeInfo(_T138),[
TypeInfoArrayOfConst],Addr(TDataSet.AppendRecord));

RegRegisterMethod(TDataSet,'BookmarkValid',TypeInfo(_T139),[
TypeInfoPointer,TypeInfo(Boolean)], pointer(424));

RegRegisterMethod(TDataSet,'Cancel',TypeInfo(_T140),NoParams, pointer(428));

RegRegisterMethod(TDataSet,'CheckBrowseMode',TypeInfo(_T141),NoParams,Addr(TDataSet.CheckBrowseMode));

RegRegisterMethod(TDataSet,'ClearFields',TypeInfo(_T142),NoParams,Addr(TDataSet.ClearFields));

RegRegisterMethod(TDataSet,'Close',TypeInfo(_T143),NoParams,Addr(TDataSet.Close));

RegRegisterMethod(TDataSet,'ControlsDisabled',TypeInfo(_T144),[TypeInfo(Boolean)],Addr(TDataSet.ControlsDisabled));

RegRegisterMethod(TDataSet,'CompareBookmarks',TypeInfo(_T145),[
TypeInfoPointer,
TypeInfoPointer,TypeInfo(Integer)], pointer(432));

RegRegisterMethod(TDataSet,'CreateBlobStream',TypeInfo(_T146),[
TypeInfo(TField),
TypeInfo(TBlobStreamMode),TypeInfo(TStream)], pointer(436));

RegRegisterMethod(TDataSet,'CursorPosChanged',TypeInfo(_T147),NoParams,Addr(TDataSet.CursorPosChanged));

RegRegisterMethod(TDataSet,'Delete',TypeInfo(_T148),NoParams,Addr(TDataSet.Delete));

RegRegisterMethod(TDataSet,'DisableControls',TypeInfo(_T149),NoParams,Addr(TDataSet.DisableControls));

RegRegisterMethod(TDataSet,'Edit',TypeInfo(_T150),NoParams,Addr(TDataSet.Edit));

RegRegisterMethod(TDataSet,'EnableControls',TypeInfo(_T151),NoParams,Addr(TDataSet.EnableControls));

RegRegisterMethod(TDataSet,'FieldByName',TypeInfo(_T152),[
TypeInfo(string),TypeInfo(TField)],Addr(TDataSet.FieldByName));

RegRegisterMethod(TDataSet,'FindField',TypeInfo(_T153),[
TypeInfo(string),TypeInfo(TField)],Addr(TDataSet.FindField));

RegRegisterMethod(TDataSet,'FindFirst',TypeInfo(_T154),[TypeInfo(Boolean)],Addr(TDataSet.FindFirst));

RegRegisterMethod(TDataSet,'FindLast',TypeInfo(_T155),[TypeInfo(Boolean)],Addr(TDataSet.FindLast));

RegRegisterMethod(TDataSet,'FindNext',TypeInfo(_T156),[TypeInfo(Boolean)],Addr(TDataSet.FindNext));

RegRegisterMethod(TDataSet,'FindPrior',TypeInfo(_T157),[TypeInfo(Boolean)],Addr(TDataSet.FindPrior));

RegRegisterMethod(TDataSet,'First',TypeInfo(_T158),NoParams,Addr(TDataSet.First));

RegRegisterMethod(TDataSet,'FreeBookmark',TypeInfo(_T159),[
TypeInfoPointer], pointer(440));

RegRegisterMethod(TDataSet,'GetBookmark',TypeInfo(_T160),[TypeInfoPointer], pointer(444));

RegRegisterMethod(TDataSet,'GetDetailDataSets',TypeInfo(_T162),[
TypeInfo(TList)],Addr(TDataSet.GetDetailDataSets));

RegRegisterMethod(TDataSet,'GetDetailLinkFields',TypeInfo(_T163),[
TypeInfo(TList),
TypeInfo(TList)], pointer(452));

RegRegisterMethod(TDataSet,'GetBlobFieldData',TypeInfo(_T164),[
TypeInfo(Integer),
DynArrayInfo(TypeInfo(TBlobByteData)),TypeInfo(Integer)], pointer(456));

RegRegisterMethod(TDataSet,'GetFieldData',TypeInfo(_T165),[
TypeInfo(TField),
TypeInfoPointer,TypeInfo(Boolean)], pointer(460));

RegRegisterMethod(TDataSet,'GetFieldList',TypeInfo(_T166),[
TypeInfo(TList),
TypeInfo(string)],Addr(TDataSet.GetFieldList));

RegRegisterMethod(TDataSet,'GetFieldNames',TypeInfo(_T167),[
TypeInfo(TStrings)],Addr(TDataSet.GetFieldNames));

RegRegisterMethod(TDataSet,'GetProviderAttributes',TypeInfo(_T168),[
TypeInfo(TList)], pointer(468));

RegRegisterMethod(TDataSet,'GotoBookmark',TypeInfo(_T169),[
TypeInfoPointer],Addr(TDataSet.GotoBookmark));

RegRegisterMethod(TDataSet,'Insert',TypeInfo(_T170),NoParams,Addr(TDataSet.Insert));

RegRegisterMethod(TDataSet,'InsertRecord',TypeInfo(_T171),[
TypeInfoArrayOfConst],Addr(TDataSet.InsertRecord));

RegRegisterMethod(TDataSet,'IsEmpty',TypeInfo(_T172),[TypeInfo(Boolean)],Addr(TDataSet.IsEmpty));

RegRegisterMethod(TDataSet,'IsLinkedTo',TypeInfo(_T173),[
TypeInfo(TDataSource),TypeInfo(Boolean)],Addr(TDataSet.IsLinkedTo));

RegRegisterMethod(TDataSet,'IsSequenced',TypeInfo(_T174),[TypeInfo(Boolean)], pointer(472));

RegRegisterMethod(TDataSet,'Last',TypeInfo(_T175),NoParams,Addr(TDataSet.Last));

RegRegisterMethod(TDataSet,'Locate',TypeInfo(_T176),[
TypeInfo(string),
TypeInfo(Variant),
TypeInfo(TLocateOptions),TypeInfo(Boolean)], pointer(476));

RegRegisterMethod(TDataSet,'Lookup',TypeInfo(_T177),[
TypeInfo(string),
TypeInfo(Variant),
TypeInfo(string),TypeInfo(Variant)], pointer(480));

RegRegisterMethod(TDataSet,'MoveBy',TypeInfo(_T178),[
TypeInfo(Integer),TypeInfo(Integer)],Addr(TDataSet.MoveBy));

RegRegisterMethod(TDataSet,'Next',TypeInfo(_T179),NoParams,Addr(TDataSet.Next));

RegRegisterMethod(TDataSet,'Open',TypeInfo(_T180),NoParams,Addr(TDataSet.Open));

RegRegisterMethod(TDataSet,'Post',TypeInfo(_T181),NoParams, pointer(484));

RegRegisterMethod(TDataSet,'Prior',TypeInfo(_T182),NoParams,Addr(TDataSet.Prior));

RegRegisterMethod(TDataSet,'Refresh',TypeInfo(_T183),NoParams,Addr(TDataSet.Refresh));

RegRegisterMethod(TDataSet,'Resync',TypeInfo(_T184),[
TypeInfo(TResyncMode)], pointer(488));

RegRegisterMethod(TDataSet,'SetFields',TypeInfo(_T185),[
TypeInfoArrayOfConst],Addr(TDataSet.SetFields));

RegRegisterMethod(TDataSet,'UpdateCursorPos',TypeInfo(_T187),NoParams,Addr(TDataSet.UpdateCursorPos));

RegRegisterMethod(TDataSet,'UpdateRecord',TypeInfo(_T188),NoParams,Addr(TDataSet.UpdateRecord));

RegRegisterMethod(TDataSet,'UpdateStatus',TypeInfo(_T189),[TypeInfo(TUpdateStatus)], pointer(496));

RegisterProc(TDataSetDesigner,'Create',mtConstructor,TypeInfo(_T190),[
TypeInfo(TDataSet)],Addr(TDataSetDesigner.Create),cRegister);

RegRegisterMethod(TDataSetDesigner,'BeginDesign',TypeInfo(_T191),NoParams,Addr(TDataSetDesigner.BeginDesign));

RegRegisterMethod(TDataSetDesigner,'DataEvent',TypeInfo(_T192),[
TypeInfo(TDataEvent),
TypeInfo(Longint)], pointer(0));

RegRegisterMethod(TDataSetDesigner,'EndDesign',TypeInfo(_T193),NoParams,Addr(TDataSetDesigner.EndDesign));

RegRegisterMethod(TDataSource,'Edit',TypeInfo(_T194),NoParams,Addr(TDataSource.Edit));

RegRegisterMethod(TDataSource,'IsLinkedTo',TypeInfo(_T195),[
TypeInfo(TDataSet),TypeInfo(Boolean)],Addr(TDataSource.IsLinkedTo));

RegRegisterMethod(TDefCollection,'Find',TypeInfo(_T197),[
TypeInfo(string),TypeInfo(TNamedItem)],Addr(TDefCollection.Find));

RegRegisterMethod(TDefCollection,'GetItemNames',TypeInfo(_T198),[
TypeInfo(TStrings)],Addr(TDefCollection.GetItemNames));

RegRegisterMethod(TDefCollection,'IndexOf',TypeInfo(_T199),[
TypeInfo(string),TypeInfo(Integer)],Addr(TDefCollection.IndexOf));

RegRegisterMethod(TDetailDataLink,'GetDetailDataSet',TypeInfo(_T200),[TypeInfo(TDataSet)], pointer(84));

RegRegisterMethod(TField,'AccessError',TypeInfo(_T201),[
TypeInfo(string),TypeInfo(EDatabaseError)], pointer(MinVMTOffset - 15));

RegRegisterMethod(TField,'Bind',TypeInfo(_T202),[
TypeInfo(Boolean)], pointer(48));

RegisterProc(TField,'CheckTypeSize',mtClassMethod,TypeInfo(_T203),[
TypeInfo(Integer)], pointer(52),cRegister);

RegRegisterMethod(TField,'Change',TypeInfo(_T204),NoParams, pointer(56));

RegRegisterMethod(TField,'FreeBuffers',TypeInfo(_T205),NoParams, pointer(60));

RegRegisterMethod(TField,'GetAsBoolean',TypeInfo(_T206),[TypeInfo(Boolean)], pointer(64));

RegRegisterMethod(TField,'GetAsByteArray',TypeInfo(_T207),[TypeInfo(Variant)], pointer(68));

RegRegisterMethod(TField,'GetAsCurrency',TypeInfo(_T208),[TypeInfo(Currency)], pointer(72));

RegRegisterMethod(TField,'GetAsDateTime',TypeInfo(_T209),[TypeInfo(TDateTime)], pointer(76));

RegRegisterMethod(TField,'GetAsFloat',TypeInfo(_T210),[TypeInfo(Double)], pointer(80));

RegRegisterMethod(TField,'GetAsInteger',TypeInfo(_T211),[TypeInfo(Longint)], pointer(84));

RegRegisterMethod(TField,'GetAsString',TypeInfo(_T212),[TypeInfo(string)], pointer(88));

RegRegisterMethod(TField,'GetAsVariant',TypeInfo(_T213),[TypeInfo(Variant)], pointer(92));

RegRegisterMethod(TField,'GetCanModify',TypeInfo(_T214),[TypeInfo(Boolean)], pointer(96));

RegRegisterMethod(TField,'GetDataSize',TypeInfo(_T215),[TypeInfo(Word)], pointer(100));

RegRegisterMethod(TField,'GetDefaultWidth',TypeInfo(_T216),[TypeInfo(Integer)], pointer(104));

RegRegisterMethod(TField,'GetFieldNo',TypeInfo(_T217),[TypeInfo(Integer)], pointer(108));

RegRegisterMethod(TField,'GetHasConstraints',TypeInfo(_T218),[TypeInfo(Boolean)], pointer(112));

RegRegisterMethod(TField,'GetIsNull',TypeInfo(_T219),[TypeInfo(Boolean)], pointer(116));

RegRegisterMethod(TField,'GetSize',TypeInfo(_T220),[TypeInfo(Word)], pointer(120));

RegRegisterMethod(TField,'GetText',TypeInfo(_T221),[
TypeInfo(string),
TypeInfo(Boolean)], pointer(124));

RegRegisterMethod(TField,'SetAsBoolean',TypeInfo(_T222),[
TypeInfo(Boolean)], pointer(128));

RegRegisterMethod(TField,'SetAsByteArray',TypeInfo(_T223),[
TypeInfo(Variant)], pointer(132));

RegRegisterMethod(TField,'SetAsCurrency',TypeInfo(_T224),[
TypeInfo(Currency)], pointer(136));

RegRegisterMethod(TField,'SetAsDateTime',TypeInfo(_T225),[
TypeInfo(TDateTime)], pointer(140));

RegRegisterMethod(TField,'SetAsFloat',TypeInfo(_T226),[
TypeInfo(Double)], pointer(144));

RegRegisterMethod(TField,'SetAsInteger',TypeInfo(_T227),[
TypeInfo(Longint)], pointer(148));

RegRegisterMethod(TField,'SetAsString',TypeInfo(_T228),[
TypeInfo(string)], pointer(152));

RegRegisterMethod(TField,'SetAsVariant',TypeInfo(_T229),[
TypeInfo(Variant)], pointer(156));

RegRegisterMethod(TField,'SetDataSet',TypeInfo(_T230),[
TypeInfo(TDataSet)], pointer(160));

RegRegisterMethod(TField,'SetFieldKind',TypeInfo(_T231),[
TypeInfo(TFieldKind)], pointer(164));

RegRegisterMethod(TField,'SetParentField',TypeInfo(_T232),[
TypeInfo(TObjectField)], pointer(168));

RegRegisterMethod(TField,'SetSize',TypeInfo(_T233),[
TypeInfo(Word)], pointer(172));

RegRegisterMethod(TField,'SetText',TypeInfo(_T234),[
TypeInfo(string)], pointer(176));

RegRegisterMethod(TField,'SetVarValue',TypeInfo(_T235),[
TypeInfo(Variant)], pointer(180));

RegRegisterMethod(TField,'AssignValue',TypeInfo(_T236),[
TypeInfo(IDispatch)],Addr(__TField__AssignValue__Wrapper));

RegRegisterMethod(TField,'Clear',TypeInfo(_T237),NoParams, pointer(184));

RegRegisterMethod(TField,'FocusControl',TypeInfo(_T238),NoParams,Addr(TField.FocusControl));

RegRegisterMethod(TField,'GetData',TypeInfo(_T239),[
TypeInfoPointer,TypeInfo(Boolean)],Addr(TField.GetData));

RegisterProc(TField,'IsBlob',mtClassMethod,TypeInfo(_T240),[TypeInfo(Boolean)], pointer(188),cRegister);

RegRegisterMethod(TField,'IsValidChar',TypeInfo(_T241),[
TypeInfo(Char),TypeInfo(Boolean)], pointer(192));

RegRegisterMethod(TField,'RefreshLookupList',TypeInfo(_T242),NoParams,Addr(TField.RefreshLookupList));

RegRegisterMethod(TField,'SetData',TypeInfo(_T243),[
TypeInfoPointer],Addr(TField.SetData));

RegRegisterMethod(TField,'SetFieldType',TypeInfo(_T244),[
TypeInfo(TFieldType)], pointer(196));

RegRegisterMethod(TField,'Validate',TypeInfo(_T245),[
TypeInfoPointer],Addr(TField.Validate));

RegisterProc(TFieldDef,'Create',mtConstructor,TypeInfo(_T246),[
TypeInfo(TFieldDefs),
TypeInfo(string),
TypeInfo(TFieldType),
TypeInfo(Word),
TypeInfo(Boolean),
TypeInfo(Integer)],Addr(TFieldDef.Create),cRegister);

RegRegisterMethod(TFieldDef,'AddChild',TypeInfo(_T247),[TypeInfo(TFieldDef)],Addr(TFieldDef.AddChild));

RegisterProc(TFieldDef,'CreateField',mtScriptMethod,TypeInfo(_T248),[
TypeInfo(TComponent),
TypeInfo(TObjectField),
TypeInfo(string),
TypeInfo(Boolean),TypeInfo(TField)],Addr(__TFieldDef__CreateField__Wrapper),cRegister);

RegRegisterMethod(TFieldDef,'HasChildDefs',TypeInfo(_T249),[TypeInfo(Boolean)],Addr(TFieldDef.HasChildDefs));

RegRegisterMethod(TFieldDefList,'FieldByName',TypeInfo(_T250),[
TypeInfo(string),TypeInfo(TFieldDef)],Addr(TFieldDefList.FieldByName));

RegRegisterMethod(TFieldDefList,'Find',TypeInfo(_T251),[
TypeInfo(string),TypeInfo(TFieldDef)],Addr(TFieldDefList.Find));

RegisterProc(TFieldDefs,'Create',mtConstructor,TypeInfo(_T252),[
TypeInfo(TPersistent)],Addr(TFieldDefs.Create),cRegister);

RegRegisterMethod(TFieldDefs,'AddFieldDef',TypeInfo(_T253),[TypeInfo(TFieldDef)],Addr(TFieldDefs.AddFieldDef));

RegRegisterMethod(TFieldDefs,'Find',TypeInfo(_T254),[
TypeInfo(string),TypeInfo(TFieldDef)],Addr(TFieldDefs.Find));

RegRegisterMethod(TFieldDefs,'Update',TypeInfo(_T255),NoParams,Addr(TFieldDefs.Update));

RegRegisterMethod(TFieldDefs,'Add',TypeInfo(_T256),[
TypeInfo(string),
TypeInfo(TFieldType),
TypeInfo(Word),
TypeInfo(Boolean)],Addr(TFieldDefs.Add));

RegRegisterMethod(TFieldList,'FieldByName',TypeInfo(_T257),[
TypeInfo(string),TypeInfo(TField)],Addr(TFieldList.FieldByName));

RegRegisterMethod(TFieldList,'Find',TypeInfo(_T258),[
TypeInfo(string),TypeInfo(TField)],Addr(TFieldList.Find));

RegisterProc(TFields,'Create',mtConstructor,TypeInfo(_T259),[
TypeInfo(TDataSet)],Addr(TFields.Create),cRegister);

RegRegisterMethod(TFields,'Add',TypeInfo(_T260),[
TypeInfo(TField)],Addr(TFields.Add));

RegRegisterMethod(TFields,'CheckFieldName',TypeInfo(_T261),[
TypeInfo(string)],Addr(TFields.CheckFieldName));

RegRegisterMethod(TFields,'CheckFieldNames',TypeInfo(_T262),[
TypeInfo(string)],Addr(TFields.CheckFieldNames));

RegRegisterMethod(TFields,'Clear',TypeInfo(_T263),NoParams,Addr(TFields.Clear));

RegRegisterMethod(TFields,'FindField',TypeInfo(_T264),[
TypeInfo(string),TypeInfo(TField)],Addr(TFields.FindField));

RegRegisterMethod(TFields,'FieldByName',TypeInfo(_T265),[
TypeInfo(string),TypeInfo(TField)],Addr(TFields.FieldByName));

RegRegisterMethod(TFields,'FieldByNumber',TypeInfo(_T266),[
TypeInfo(Integer),TypeInfo(TField)],Addr(TFields.FieldByNumber));

RegRegisterMethod(TFields,'GetFieldNames',TypeInfo(_T267),[
TypeInfo(TStrings)],Addr(TFields.GetFieldNames));

RegRegisterMethod(TFields,'IndexOf',TypeInfo(_T268),[
TypeInfo(TField),TypeInfo(Integer)],Addr(TFields.IndexOf));

RegRegisterMethod(TFields,'Remove',TypeInfo(_T269),[
TypeInfo(TField)],Addr(TFields.Remove));

RegRegisterMethod(TFlatList,'GetUpdated',TypeInfo(_T270),[TypeInfo(Boolean)], pointer(128));

RegRegisterMethod(TFlatList,'UpdateList',TypeInfo(_T271),NoParams, pointer(132));

RegisterProc(TFlatList,'Create',mtConstructor,TypeInfo(_T272),[
TypeInfo(TDataSet)],Addr(TFlatList.Create),cRegister);

RegRegisterMethod(TFlatList,'Update',TypeInfo(_T273),NoParams,Addr(TFlatList.Update));

RegisterProc(TIndexDef,'Create',mtConstructor,TypeInfo(_T274),[
TypeInfo(TIndexDefs),
TypeInfo(string),
TypeInfo(string),
TypeInfo(TIndexOptions)],Addr(TIndexDef.Create),cRegister);

RegisterProc(TIndexDefs,'Create',mtConstructor,TypeInfo(_T275),[
TypeInfo(TDataSet)],Addr(TIndexDefs.Create),cRegister);

RegRegisterMethod(TIndexDefs,'AddIndexDef',TypeInfo(_T276),[TypeInfo(TIndexDef)],Addr(TIndexDefs.AddIndexDef));

RegRegisterMethod(TIndexDefs,'Find',TypeInfo(_T277),[
TypeInfo(string),TypeInfo(TIndexDef)],Addr(TIndexDefs.Find));

RegRegisterMethod(TIndexDefs,'Update',TypeInfo(_T278),NoParams,Addr(TIndexDefs.Update));

RegRegisterMethod(TIndexDefs,'FindIndexForFields',TypeInfo(_T279),[
TypeInfo(string),TypeInfo(TIndexDef)],Addr(TIndexDefs.FindIndexForFields));

RegRegisterMethod(TIndexDefs,'GetIndexForFields',TypeInfo(_T280),[
TypeInfo(string),
TypeInfo(Boolean),TypeInfo(TIndexDef)],Addr(TIndexDefs.GetIndexForFields));

RegRegisterMethod(TIndexDefs,'Add',TypeInfo(_T281),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TIndexOptions)],Addr(TIndexDefs.Add));

RegisterProc(TLookupList,'Create',mtConstructor,TypeInfo(_T282),NoParams,Addr(TLookupList.Create),cRegister);

RegRegisterMethod(TLookupList,'Add',TypeInfo(_T283),[
TypeInfo(Variant),
TypeInfo(Variant)],Addr(TLookupList.Add));

RegRegisterMethod(TLookupList,'Clear',TypeInfo(_T284),NoParams,Addr(TLookupList.Clear));

RegRegisterMethod(TLookupList,'ValueOfKey',TypeInfo(_T285),[
TypeInfo(Variant),TypeInfo(Variant)],Addr(TLookupList.ValueOfKey));

RegRegisterMethod(TObjectField,'GetFields',TypeInfo(_T286),[TypeInfo(TFields)], pointer(200));

RegRegisterMethod(TObjectField,'GetFieldValue',TypeInfo(_T287),[
TypeInfo(Integer),TypeInfo(Variant)], pointer(204));

RegRegisterMethod(TObjectField,'SetFieldValue',TypeInfo(_T288),[
TypeInfo(Integer),
TypeInfo(Variant)], pointer(208));

RegisterProc(TParam,'Create',mtConstructor,TypeInfo(_T289),[
TypeInfo(TParams),
TypeInfo(TParamType)],Addr(TParam.Create),cRegister);

RegRegisterMethod(TParam,'AssignField',TypeInfo(_T290),[
TypeInfo(TField)],Addr(TParam.AssignField));

RegRegisterMethod(TParam,'AssignFieldValue',TypeInfo(_T291),[
TypeInfo(TField),
TypeInfo(Variant)],Addr(TParam.AssignFieldValue));

RegRegisterMethod(TParam,'Clear',TypeInfo(_T292),NoParams,Addr(TParam.Clear));

RegRegisterMethod(TParam,'GetData',TypeInfo(_T293),[
TypeInfoPointer],Addr(TParam.GetData));

RegRegisterMethod(TParam,'GetDataSize',TypeInfo(_T294),[TypeInfo(Integer)],Addr(TParam.GetDataSize));

RegRegisterMethod(TParam,'LoadFromFile',TypeInfo(_T295),[
TypeInfo(string),
TypeInfo(TBlobType)],Addr(TParam.LoadFromFile));

RegRegisterMethod(TParam,'LoadFromStream',TypeInfo(_T296),[
TypeInfo(TStream),
TypeInfo(TBlobType)],Addr(TParam.LoadFromStream));

RegRegisterMethod(TParam,'SetBlobData',TypeInfo(_T297),[
TypeInfoPointer,
TypeInfo(Integer)],Addr(TParam.SetBlobData));

RegRegisterMethod(TParam,'SetData',TypeInfo(_T298),[
TypeInfoPointer],Addr(TParam.SetData));

RegisterProc(TParams,'Create',mtConstructor,TypeInfo(_T299),[
TypeInfo(TPersistent)],Addr(TParams.Create),cRegister);

RegRegisterMethod(TParams,'AssignValues',TypeInfo(_T300),[
TypeInfo(TParams)],Addr(TParams.AssignValues));

RegRegisterMethod(TParams,'AddParam',TypeInfo(_T301),[
TypeInfo(TParam)],Addr(TParams.AddParam));

RegRegisterMethod(TParams,'RemoveParam',TypeInfo(_T302),[
TypeInfo(TParam)],Addr(TParams.RemoveParam));

RegRegisterMethod(TParams,'CreateParam',TypeInfo(_T303),[
TypeInfo(TFieldType),
TypeInfo(string),
TypeInfo(TParamType),TypeInfo(TParam)],Addr(TParams.CreateParam));

RegRegisterMethod(TParams,'GetParamList',TypeInfo(_T304),[
TypeInfo(TList),
TypeInfo(string)],Addr(TParams.GetParamList));

RegRegisterMethod(TParams,'IsEqual',TypeInfo(_T305),[
TypeInfo(TParams),TypeInfo(Boolean)],Addr(TParams.IsEqual));

RegRegisterMethod(TParams,'ParseSQL',TypeInfo(_T306),[
TypeInfo(string),
TypeInfo(Boolean),TypeInfo(string)],Addr(TParams.ParseSQL));

RegRegisterMethod(TParams,'ParamByName',TypeInfo(_T307),[
TypeInfo(string),TypeInfo(TParam)],Addr(TParams.ParamByName));

RegRegisterMethod(TParams,'FindParam',TypeInfo(_T308),[
TypeInfo(string),TypeInfo(TParam)],Addr(TParams.FindParam));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'RegisterFields',mtProc,TypeInfo(_T1),[
ArrayInfo(TypeInfo(TFieldClass))],Addr(RegisterFields),cRegister)}

{RegRegisterMethod(TDataSet,'CalculateFields',TypeInfo(_T45),[
TypeInfoPChar], pointer(60))}

{RegRegisterMethod(TDataSet,'ClearCalcFields',TypeInfo(_T49),[
TypeInfoPChar], pointer(76))}

{RegRegisterMethod(TDataSet,'GetCalcFields',TypeInfo(_T80),[
TypeInfoPChar], pointer(200))}

{RegRegisterMethod(TDataSet,'GetFieldClass',TypeInfo(_T83),[
TypeInfo(TFieldType),TypeInfo(TFieldClass)], pointer(212))}

{RegRegisterMethod(TDataSet,'InitRecord',TypeInfo(_T94),[
TypeInfoPChar], pointer(256))}

{RegRegisterMethod(TDataSet,'RefreshInternalCalcFields',TypeInfo(_T100),[
TypeInfoPChar], pointer(280))}

{RegRegisterMethod(TDataSet,'SetOnFilterRecord',TypeInfo(_T110),[
TypeInfo(TFilterRecordEvent)], pointer(320))}

{RegRegisterMethod(TDataSet,'FreeRecordBuffer',TypeInfo(_T115),[
TypeInfoPChar], pointer(340))}

{RegRegisterMethod(TDataSet,'GetBookmarkData',TypeInfo(_T116),[
TypeInfoPChar,
TypeInfoPointer], pointer(344))}

{RegRegisterMethod(TDataSet,'GetBookmarkFlag',TypeInfo(_T117),[
TypeInfoPChar,TypeInfo(TBookmarkFlag)], pointer(348))}

{RegRegisterMethod(TDataSet,'GetRecord',TypeInfo(_T118),[
TypeInfoPChar,
TypeInfo(TGetMode),
TypeInfo(Boolean),TypeInfo(TGetResult)], pointer(352))}

{RegRegisterMethod(TDataSet,'InternalInitRecord',TypeInfo(_T127),[
TypeInfoPChar], pointer(388))}

{RegRegisterMethod(TDataSet,'InternalSetToRecord',TypeInfo(_T131),[
TypeInfoPChar], pointer(404))}

{RegRegisterMethod(TDataSet,'SetBookmarkFlag',TypeInfo(_T133),[
TypeInfoPChar,
TypeInfo(TBookmarkFlag)], pointer(412))}

{RegRegisterMethod(TDataSet,'SetBookmarkData',TypeInfo(_T134),[
TypeInfoPChar,
TypeInfoPointer], pointer(416))}

{RegRegisterMethod(TDataSet,'GetCurrentRecord',TypeInfo(_T161),[
TypeInfoPChar,TypeInfo(Boolean)], pointer(448))}

{RegRegisterMethod(TDataSet,'Translate',TypeInfo(_T186),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(Boolean),TypeInfo(Integer)], pointer(492))}

{RegisterProc(TDefCollection,'Create',mtConstructor,TypeInfo(_T196),[
TypeInfo(TDataSet),
TypeInfo(TPersistent),
TypeInfo(TCollectionItemClass)],Addr(TDefCollection.Create),cRegister)}

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

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
