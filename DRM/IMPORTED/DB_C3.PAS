{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit DB_C3;
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

_T2 = procedure (const p0 : string) of object;

_T3 = procedure (const p0 : string;
const p1 : Array of Const) of object;

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

_T9 = function : Integer of object;

_T10 = _T2;

_T11 = procedure (p0 : TStream) of object;

_T12 = _T2;

_T13 = _T11;

_T14 = procedure (p0 : TPersistent) of object;

_T15 = function : TCheckConstraint of object;

_T16 = procedure  of object;

_T17 = _T16;

_T18 = _T16;

_T19 = procedure (p0 : Integer) of object;

_T20 = procedure (p0 : TFieldRef) of object;

_T21 = _T16;

_T22 = _T16;

_T23 = procedure (p0 : TField) of object;

_T24 = _T16;

_T25 = _T16;

_T26 = function : Boolean of object;

_T27 = _T16;

_T28 = _T16;

_T29 = function (p0 : Pointer;
var p1 : Currency): Boolean of object;

_T30 = function (const p0 : Currency;
p1 : Pointer;
p2 : Integer;
p3 : Integer): Boolean of object;

{_T31 = procedure (p0 : PChar) of object;}

_T32 = _T16;

_T33 = _T16;

_T34 = _T16;

{_T35 = procedure (p0 : PChar) of object;}

_T36 = _T23;

_T37 = _T16;

_T38 = procedure (p0 : TDataEvent;
p1 : Longint) of object;

_T39 = procedure (p0 : TObject) of object;

_T40 = _T16;

_T41 = _T16;

_T42 = _T16;

_T43 = _T16;

_T44 = _T16;

_T45 = _T16;

_T46 = _T16;

_T47 = _T16;

_T48 = _T16;

_T49 = _T16;

_T50 = _T16;

_T51 = _T16;

_T52 = _T16;

_T53 = _T16;

_T54 = _T16;

_T55 = _T16;

_T56 = _T16;

_T57 = _T16;

_T58 = _T16;

_T59 = function (p0 : Boolean;
p1 : Boolean): Boolean of object;

_T60 = _T16;

_T61 = function : TBookmarkStr of object;

{_T62 = procedure (p0 : PChar) of object;}

_T63 = _T26;

_T64 = function : TDataSource of object;

{_T65 = function (p0 : TFieldType): TFieldClass of object;}

_T66 = function (p0 : TDataSetState;
p1 : TField): Variant of object;

_T67 = function (p0 : TField): Boolean of object;

_T68 = _T9;

_T69 = _T26;

_T70 = _T9;

_T71 = _T26;

_T72 = _T9;

_T73 = _T9;

_T74 = _T16;

{_T75 = procedure (p0 : PChar) of object;}

_T76 = _T16;

_T77 = _T16;

_T78 = _T16;

_T79 = procedure (p0 : Boolean) of object;

{_T80 = procedure (p0 : PChar) of object;}

_T81 = procedure (const p0 : TBookmarkStr) of object;

_T82 = _T19;

_T83 = _T79;

_T84 = procedure (p0 : TFilterOptions) of object;

_T85 = _T2;

_T86 = procedure (p0 : TDataSetState;
p1 : TField;
p2 : Variant) of object;

{_T87 = procedure (const p0 : TFilterRecordEvent) of object;}

_T88 = _T19;

_T89 = _T16;

_T90 = function : PChar of object;

{_T91 = procedure (var p0 : PChar) of object;}

{_T92 = procedure (p0 : PChar;
p1 : Pointer) of object;}

{_T93 = function (p0 : PChar): TBookmarkFlag of object;}

_T94 = function (p0 : TField;
p1 : Pointer): Boolean of object;

{_T95 = function (p0 : PChar;
p1 : TGetMode;
p2 : Boolean): TGetResult of object;}

_T96 = function : Word of object;

_T97 = procedure (p0 : Pointer;
p1 : Boolean) of object;

_T98 = _T16;

_T99 = _T16;

_T100 = _T16;

_T101 = procedure (p0 : Pointer) of object;

_T102 = _T16;

_T103 = _T16;

{_T104 = procedure (p0 : PChar) of object;}

_T105 = _T16;

_T106 = _T16;

_T107 = _T16;

{_T108 = procedure (p0 : PChar) of object;}

_T109 = _T26;

{_T110 = procedure (p0 : PChar;
p1 : TBookmarkFlag) of object;}

{_T111 = procedure (p0 : PChar;
p1 : Pointer) of object;}

_T112 = procedure (p0 : TField;
p1 : Pointer) of object;

_T113 = _T90;

_T114 = _T16;

_T115 = procedure (const p0 : Array of Const) of object;

_T116 = function (p0 : TBookmark): Boolean of object;

_T117 = _T16;

_T118 = _T16;

_T119 = _T16;

_T120 = _T16;

_T121 = _T26;

_T122 = function (p0 : TBookmark;
p1 : TBookmark): Integer of object;

_T123 = function (p0 : TField;
p1 : TBlobStreamMode): TStream of object;

_T124 = _T16;

_T125 = _T16;

_T126 = _T16;

_T127 = _T16;

_T128 = _T16;

_T129 = function (const p0 : string): TField of object;

_T130 = _T129;

_T131 = _T26;

_T132 = _T26;

_T133 = _T26;

_T134 = _T26;

_T135 = _T16;

_T136 = procedure (p0 : TBookmark) of object;

_T137 = function : TBookmark of object;

{_T138 = function (p0 : PChar): Boolean of object;}

_T139 = procedure (p0 : TList;
const p1 : string) of object;

_T140 = procedure (p0 : TStrings) of object;

_T141 = _T136;

_T142 = _T16;

_T143 = _T115;

_T144 = _T26;

_T145 = function (p0 : TDataSource): Boolean of object;

_T146 = _T26;

_T147 = _T16;

_T148 = function (const p0 : string;
const p1 : Variant;
p2 : TLocateOptions): Boolean of object;

_T149 = function (const p0 : string;
const p1 : Variant;
const p2 : string): Variant of object;

_T150 = function (p0 : Integer): Integer of object;

_T151 = _T16;

_T152 = _T16;

_T153 = _T16;

_T154 = _T16;

_T155 = _T16;

_T156 = procedure (p0 : TResyncMode) of object;

_T157 = _T115;

{_T158 = procedure (p0 : PChar;
p1 : PChar;
p2 : Boolean) of object;}

_T159 = _T16;

_T160 = _T16;

_T161 = procedure (p0 : TDataSet) of object;

_T162 = _T16;

_T163 = _T38;

_T164 = _T16;

_T165 = _T16;

_T166 = function (p0 : TDataSet): Boolean of object;

{_T167 = procedure (p0 : TDataSet;
p1 : TCollectionItemClass) of object;}

_T168 = function (const p0 : string): Integer of object;

_T169 = function (const p0 : string): TNamedItem of object;

_T170 = function (const p0 : string): EDatabaseError of object;

_T171 = _T19;

_T172 = _T16;

_T173 = _T16;

_T174 = _T26;

_T175 = function : Currency of object;

_T176 = function : TDateTime of object;

_T177 = function : Double of object;

_T178 = function : Longint of object;

_T179 = function : string of object;

_T180 = function : Variant of object;

_T181 = _T26;

_T182 = _T96;

_T183 = _T9;

_T184 = _T26;

_T185 = procedure (var p0 : string;
p1 : Boolean) of object;

_T186 = _T79;

_T187 = procedure (p0 : Currency) of object;

_T188 = procedure (p0 : TDateTime) of object;

_T189 = procedure (p0 : Double) of object;

_T190 = procedure (p0 : Longint) of object;

_T191 = _T2;

_T192 = procedure (const p0 : Variant) of object;

_T193 = _T4;

_T194 = _T2;

_T195 = _T192;

_T196 = procedure (const p0 : IDispatch) of object;

_T197 = _T16;

_T198 = _T16;

_T199 = function (p0 : Pointer): Boolean of object;

_T200 = _T26;

_T201 = function (p0 : Char): Boolean of object;

_T202 = _T16;

_T203 = _T101;

_T204 = procedure (p0 : TFieldType) of object;

_T205 = _T101;

_T206 = function (p0 : TComponent): TField of object;

_T207 = _T161;

_T208 = function : TFieldDef of object;

_T209 = function (const p0 : string): TFieldDef of object;

_T210 = _T16;

_T211 = procedure (const p0 : string;
p1 : TFieldType;
p2 : Word;
p3 : Boolean) of object;

_T212 = _T161;

_T213 = function : TIndexDef of object;

_T214 = function (const p0 : string): TIndexDef of object;

_T215 = _T16;

_T216 = _T214;

_T217 = function (const p0 : string;
p1 : Boolean): TIndexDef of object;

_T218 = procedure (const p0 : string;
const p1 : string;
p2 : TIndexOptions) of object;

_T219 = _T16;

_T220 = procedure (const p0 : Variant;
const p1 : Variant) of object;

_T221 = _T16;

_T222 = function (const p0 : Variant): Variant of object;

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
function _TDateTimeRec_ : IDispatch;
begin
  result := __TDateTimeRec__Wrapper.Create;
end;
function _TLookupListEntry_ : IDispatch;
begin
  result := __TLookupListEntry__Wrapper.Create;
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

function __DC__GetTDataLink__BufferCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataLink(Instance).BufferCount;
end;

procedure __DC__SetTDataLink__BufferCount(Instance : TObject; Params : PVariantArgList);
begin
TDataLink(Instance).BufferCount:=OleVariant(Params^[0]);
end;

function __DC__GetTDataLink__Dataset(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDataLink(Instance).Dataset);
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

function __DC__GetTDataSet__Bof(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataSet(Instance).Bof;
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

function __DC__GetTDataSet__Fields(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDataSet(Instance).Fields[OleVariant(Params^[0])]);
end;

procedure __DC__SetTDataSet__Fields(Instance : TObject; Params : PVariantArgList);
begin
TDataSet(Instance).Fields[OleVariant(Params^[1])]:=TField(VarToObject(OleVariant(Params^[0])));
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

function __DC__GetTDataSetDesigner__Dataset(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDataSetDesigner(Instance).Dataset);
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

function __DC__GetTDefCollection__Dataset(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDefCollection(Instance).Dataset);
end;

function __DC__GetTDefCollection__Updated(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDefCollection(Instance).Updated;
end;

procedure __DC__SetTDefCollection__Updated(Instance : TObject; Params : PVariantArgList);
begin
TDefCollection(Instance).Updated:=OleVariant(Params^[0]);
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

function __DC__GetTField__Dataset(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TField(Instance).Dataset);
end;

procedure __DC__SetTField__Dataset(Instance : TObject; Params : PVariantArgList);
begin
TField(Instance).Dataset:=TDataSet(VarToObject(OleVariant(Params^[0])));
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

function __DC__GetTFieldDef__InternalCalcField(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFieldDef(Instance).InternalCalcField;
end;

procedure __DC__SetTFieldDef__InternalCalcField(Instance : TObject; Params : PVariantArgList);
begin
TFieldDef(Instance).InternalCalcField:=OleVariant(Params^[0]);
end;

function __DC__GetTFieldDefs__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TFieldDefs(Instance).Items[OleVariant(Params^[0])]);
end;

procedure __DC__SetTFieldDefs__Items(Instance : TObject; Params : PVariantArgList);
begin
TFieldDefs(Instance).Items[OleVariant(Params^[1])]:=TFieldDef(VarToObject(OleVariant(Params^[0])));
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

function __DC__GetTStringField__Value(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStringField(Instance).Value;
end;

procedure __DC__SetTStringField__Value(Instance : TObject; Params : PVariantArgList);
begin
TStringField(Instance).Value:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
RegisterProperty(TBCDField,'Value',__DC__GetTBCDField__Value,__DC__SetTBCDField__Value);
RegisterProperty(TBlobField,'BlobSize',__DC__GetTBlobField__BlobSize,nil);
RegisterProperty(TBlobField,'Modified',__DC__GetTBlobField__Modified,__DC__SetTBlobField__Modified);
RegisterProperty(TBlobField,'Value',__DC__GetTBlobField__Value,__DC__SetTBlobField__Value);
RegisterProperty(TBlobField,'Transliterate',__DC__GetTBlobField__Transliterate,__DC__SetTBlobField__Transliterate);
RegisterProperty(TBooleanField,'Value',__DC__GetTBooleanField__Value,__DC__SetTBooleanField__Value);
RegisterIndexedProperty(TCheckConstraints,'Items',1,True,__DC__GetTCheckConstraints__Items,__DC__SetTCheckConstraints__Items);
RegisterProperty(TDataLink,'Active',__DC__GetTDataLink__Active,nil);
RegisterProperty(TDataLink,'ActiveRecord',__DC__GetTDataLink__ActiveRecord,__DC__SetTDataLink__ActiveRecord);
RegisterProperty(TDataLink,'BufferCount',__DC__GetTDataLink__BufferCount,__DC__SetTDataLink__BufferCount);
RegisterProperty(TDataLink,'Dataset',__DC__GetTDataLink__Dataset,nil);
RegisterProperty(TDataLink,'DataSource',__DC__GetTDataLink__DataSource,__DC__SetTDataLink__DataSource);
RegisterProperty(TDataLink,'DataSourceFixed',__DC__GetTDataLink__DataSourceFixed,__DC__SetTDataLink__DataSourceFixed);
RegisterProperty(TDataLink,'Editing',__DC__GetTDataLink__Editing,nil);
RegisterProperty(TDataLink,'ReadOnly',__DC__GetTDataLink__ReadOnly,__DC__SetTDataLink__ReadOnly);
RegisterProperty(TDataLink,'RecordCount',__DC__GetTDataLink__RecordCount,nil);
RegisterProperty(TDataSet,'Bof',__DC__GetTDataSet__Bof,nil);
RegisterProperty(TDataSet,'Bookmark',__DC__GetTDataSet__Bookmark,__DC__SetTDataSet__Bookmark);
RegisterProperty(TDataSet,'CanModify',__DC__GetTDataSet__CanModify,nil);
RegisterProperty(TDataSet,'DataSource',__DC__GetTDataSet__DataSource,nil);
RegisterProperty(TDataSet,'DefaultFields',__DC__GetTDataSet__DefaultFields,nil);
RegisterProperty(TDataSet,'Designer',__DC__GetTDataSet__Designer,nil);
RegisterProperty(TDataSet,'Eof',__DC__GetTDataSet__Eof,nil);
RegisterProperty(TDataSet,'FieldCount',__DC__GetTDataSet__FieldCount,nil);
RegisterProperty(TDataSet,'FieldDefs',__DC__GetTDataSet__FieldDefs,__DC__SetTDataSet__FieldDefs);
RegisterIndexedProperty(TDataSet,'Fields',1,False,__DC__GetTDataSet__Fields,__DC__SetTDataSet__Fields);
RegisterIndexedProperty(TDataSet,'FieldValues',1,True,__DC__GetTDataSet__FieldValues,__DC__SetTDataSet__FieldValues);
RegisterProperty(TDataSet,'Found',__DC__GetTDataSet__Found,nil);
RegisterProperty(TDataSet,'Modified',__DC__GetTDataSet__Modified,nil);
RegisterProperty(TDataSet,'RecordCount',__DC__GetTDataSet__RecordCount,nil);
RegisterProperty(TDataSet,'RecNo',__DC__GetTDataSet__RecNo,__DC__SetTDataSet__RecNo);
RegisterProperty(TDataSet,'RecordSize',__DC__GetTDataSet__RecordSize,nil);
RegisterProperty(TDataSet,'State',__DC__GetTDataSet__State,nil);
RegisterProperty(TDataSet,'Filter',__DC__GetTDataSet__Filter,__DC__SetTDataSet__Filter);
RegisterProperty(TDataSet,'Filtered',__DC__GetTDataSet__Filtered,__DC__SetTDataSet__Filtered);
RegisterProperty(TDataSet,'FilterOptions',__DC__GetTDataSet__FilterOptions,__DC__SetTDataSet__FilterOptions);
RegisterProperty(TDataSet,'Active',__DC__GetTDataSet__Active,__DC__SetTDataSet__Active);
RegisterProperty(TDataSet,'AutoCalcFields',__DC__GetTDataSet__AutoCalcFields,__DC__SetTDataSet__AutoCalcFields);
RegisterProperty(TDataSetDesigner,'Dataset',__DC__GetTDataSetDesigner__Dataset,nil);
RegisterProperty(TDataSource,'State',__DC__GetTDataSource__State,nil);
RegisterProperty(TDateTimeField,'Value',__DC__GetTDateTimeField__Value,__DC__SetTDateTimeField__Value);
RegisterProperty(TDefCollection,'Dataset',__DC__GetTDefCollection__Dataset,nil);
RegisterProperty(TDefCollection,'Updated',__DC__GetTDefCollection__Updated,__DC__SetTDefCollection__Updated);
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
RegisterProperty(TField,'Dataset',__DC__GetTField__Dataset,__DC__SetTField__Dataset);
RegisterProperty(TField,'DataSize',__DC__GetTField__DataSize,nil);
RegisterProperty(TField,'DataType',__DC__GetTField__DataType,nil);
RegisterProperty(TField,'DisplayName',__DC__GetTField__DisplayName,nil);
RegisterProperty(TField,'DisplayText',__DC__GetTField__DisplayText,nil);
RegisterProperty(TField,'EditMask',__DC__GetTField__EditMask,__DC__SetTField__EditMask);
RegisterProperty(TField,'EditMaskPtr',__DC__GetTField__EditMaskPtr,nil);
RegisterProperty(TField,'FieldNo',__DC__GetTField__FieldNo,nil);
RegisterProperty(TField,'IsIndexField',__DC__GetTField__IsIndexField,nil);
RegisterProperty(TField,'IsNull',__DC__GetTField__IsNull,nil);
RegisterProperty(TField,'Lookup',__DC__GetTField__Lookup,__DC__SetTField__Lookup);
RegisterProperty(TField,'LookupList',__DC__GetTField__LookupList,nil);
RegisterProperty(TField,'NewValue',__DC__GetTField__NewValue,__DC__SetTField__NewValue);
RegisterProperty(TField,'Offset',__DC__GetTField__Offset,nil);
RegisterProperty(TField,'OldValue',__DC__GetTField__OldValue,nil);
RegisterProperty(TField,'Size',__DC__GetTField__Size,__DC__SetTField__Size);
RegisterProperty(TField,'Text',__DC__GetTField__Text,__DC__SetTField__Text);
RegisterProperty(TField,'ValidChars',__DC__GetTField__ValidChars,__DC__SetTField__ValidChars);
RegisterProperty(TField,'Value',__DC__GetTField__Value,__DC__SetTField__Value);
RegisterProperty(TFieldDef,'InternalCalcField',__DC__GetTFieldDef__InternalCalcField,__DC__SetTFieldDef__InternalCalcField);
RegisterIndexedProperty(TFieldDefs,'Items',1,True,__DC__GetTFieldDefs__Items,__DC__SetTFieldDefs__Items);
RegisterProperty(TFloatField,'Value',__DC__GetTFloatField__Value,__DC__SetTFloatField__Value);
RegisterProperty(TIndexDef,'FieldExpression',__DC__GetTIndexDef__FieldExpression,nil);
RegisterIndexedProperty(TIndexDefs,'Items',1,True,__DC__GetTIndexDefs__Items,__DC__SetTIndexDefs__Items);
RegisterProperty(TIntegerField,'Value',__DC__GetTIntegerField__Value,__DC__SetTIntegerField__Value);
RegisterProperty(TStringField,'Value',__DC__GetTStringField__Value,__DC__SetTStringField__Value);
end;

const __ConstNames0 : array[0..86] of string = (
'dsMaxBufferCount'
,'dsMaxStringSize'
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
,'usUnmodified'
,'usModified'
,'usInserted'
,'usDeleted'
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
,'ixPrimary'
,'ixUnique'
,'ixDescending'
,'ixCaseInsensitive'
,'ixExpression'
,'fkData'
,'fkCalculated'
,'fkLookup'
,'fkInternalCalc'
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
,'dsEditModes'
,'dsWriteModes'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,dsMaxBufferCount));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,dsMaxStringSize));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,dsInactive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,dsBrowse));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,dsEdit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,dsInsert));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,dsSetKey));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,dsCalcFields));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,dsFilter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,dsNewValue));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,dsOldValue));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,dsCurValue));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,deFieldChange));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,deRecordChange));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,deDataSetChange));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,deDataSetScroll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,deLayoutChange));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,deUpdateRecord));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,deUpdateState));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,deCheckBrowseMode));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,dePropertyChange));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,deFieldListChange));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,deFocusControl));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,usUnmodified));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,usModified));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,usInserted));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,usDeleted));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,ftUnknown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,ftString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,ftSmallint));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,ftInteger));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,ftWord));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,ftBoolean));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,ftFloat));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,ftCurrency));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,ftBCD));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,ftDate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,ftTime));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,ftDateTime));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,ftBytes));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,ftVarBytes));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,ftAutoInc));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,ftBlob));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,ftMemo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,ftGraphic));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,ftFmtMemo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,ftParadoxOle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,ftDBaseOle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[48] ,ftTypedBinary));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[49] ,ftCursor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[50] ,ixPrimary));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[51] ,ixUnique));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[52] ,ixDescending));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[53] ,ixCaseInsensitive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[54] ,ixExpression));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[55] ,fkData));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[56] ,fkCalculated));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[57] ,fkLookup));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[58] ,fkInternalCalc));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[59] ,bfCurrent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[60] ,bfBOF));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[61] ,bfEOF));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[62] ,bfInserted));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[63] ,gmCurrent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[64] ,gmNext));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[65] ,gmPrior));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[66] ,grOK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[67] ,grBOF));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[68] ,grEOF));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[69] ,grError));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[70] ,rmExact));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[71] ,rmCenter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[72] ,daFail));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[73] ,daAbort));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[74] ,daRetry));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[75] ,ukModify));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[76] ,ukInsert));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[77] ,ukDelete));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[78] ,bmRead));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[79] ,bmWrite));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[80] ,bmReadWrite));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[81] ,loCaseInsensitive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[82] ,loPartialKey));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[83] ,foCaseInsensitive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[84] ,foNoPartialCompare));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[85] ,VarFromSet(dsEditModes, sizeof(dsEditModes))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[86] ,VarFromSet(dsWriteModes, sizeof(dsWriteModes))));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..33] of TClass = (
EDatabaseError,
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
TDataSource,
TDateField,
TDateTimeField,
TDefCollection,
TField,
TFieldDef,
TFieldDefs,
TFloatField,
TGraphicField,
TIndexDef,
TIndexDefs,
TIntegerField,
TLookupList,
TMemoField,
TNamedItem,
TNumericField,
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
const MethodNames : array[0..9] of string = (
'TDateTimeRec'
,'TLookupListEntry'
,'ExtractFieldName'
,'DatabaseError'
,'DatabaseErrorFmt'
,'DBError'
,'DBErrorFmt'
,'DisposeMem'
,'BuffersEqual'
,'GetFieldProperty'
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
RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T0),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(string)],Addr(ExtractFieldName),cRegister);

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T2),[
TypeInfo(string)],Addr(DatabaseError),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T3),[
TypeInfo(string),
TypeInfoArrayOfConst],Addr(DatabaseErrorFmt),cRegister);

RegisterProc(nil,MethodNames[5],mtProc,TypeInfo(_T4),[
TypeInfo(Word)],Addr(DBError),cRegister);

RegisterProc(nil,MethodNames[6],mtProc,TypeInfo(_T5),[
TypeInfo(Word),
TypeInfoArrayOfConst],Addr(DBErrorFmt),cRegister);

RegisterProc(nil,MethodNames[7],mtProc,TypeInfo(_T6),[
TypeInfoUntyped,
TypeInfo(Integer)],Addr(DisposeMem),cRegister);

RegisterProc(nil,MethodNames[8],mtProc,TypeInfo(_T7),[
TypeInfoPointer,
TypeInfoPointer,
TypeInfo(Integer),TypeInfo(Boolean)],Addr(BuffersEqual),cRegister);

RegisterProc(nil,MethodNames[9],mtProc,TypeInfo(_T8),[
TypeInfo(TDataSet),
TypeInfo(TComponent),
TypeInfo(string),TypeInfo(TField)],Addr(GetFieldProperty),cRegister);

RegRegisterMethod(TBlobField,'GetBlobSize',TypeInfo(_T9),[TypeInfo(Integer)], pointer(160));

RegRegisterMethod(TBlobField,'LoadFromFile',TypeInfo(_T10),[
TypeInfo(string)],Addr(TBlobField.LoadFromFile));

RegRegisterMethod(TBlobField,'LoadFromStream',TypeInfo(_T11),[
TypeInfo(TStream)],Addr(TBlobField.LoadFromStream));

RegRegisterMethod(TBlobField,'SaveToFile',TypeInfo(_T12),[
TypeInfo(string)],Addr(TBlobField.SaveToFile));

RegRegisterMethod(TBlobField,'SaveToStream',TypeInfo(_T13),[
TypeInfo(TStream)],Addr(TBlobField.SaveToStream));

RegisterProc(TCheckConstraints,'Create',mtConstructor,TypeInfo(_T14),[
TypeInfo(TPersistent)],Addr(TCheckConstraints.Create),cRegister);

RegRegisterMethod(TCheckConstraints,'Add',TypeInfo(_T15),[TypeInfo(TCheckConstraint)],Addr(TCheckConstraints.Add));

RegRegisterMethod(TDataLink,'ActiveChanged',TypeInfo(_T16),NoParams, pointer(12));

RegRegisterMethod(TDataLink,'CheckBrowseMode',TypeInfo(_T17),NoParams, pointer(16));

RegRegisterMethod(TDataLink,'DataSetChanged',TypeInfo(_T18),NoParams, pointer(20));

RegRegisterMethod(TDataLink,'DataSetScrolled',TypeInfo(_T19),[
TypeInfo(Integer)], pointer(24));

RegRegisterMethod(TDataLink,'FocusControl',TypeInfo(_T20),[
TypeInfoPointer], pointer(28));

RegRegisterMethod(TDataLink,'EditingChanged',TypeInfo(_T21),NoParams, pointer(32));

RegRegisterMethod(TDataLink,'LayoutChanged',TypeInfo(_T22),NoParams, pointer(36));

RegRegisterMethod(TDataLink,'RecordChanged',TypeInfo(_T23),[
TypeInfo(TField)], pointer(40));

RegRegisterMethod(TDataLink,'UpdateData',TypeInfo(_T24),NoParams, pointer(44));

RegisterProc(TDataLink,'Create',mtConstructor,TypeInfo(_T25),NoParams,Addr(TDataLink.Create),cRegister);

RegRegisterMethod(TDataLink,'Edit',TypeInfo(_T26),[TypeInfo(Boolean)],Addr(TDataLink.Edit));

RegRegisterMethod(TDataLink,'UpdateRecord',TypeInfo(_T27),NoParams,Addr(TDataLink.UpdateRecord));

RegRegisterMethod(TDataSet,'ActivateBuffers',TypeInfo(_T28),NoParams, pointer(44));

RegRegisterMethod(TDataSet,'BCDToCurr',TypeInfo(_T29),[
TypeInfoPointer,
TypeInfo(Currency),TypeInfo(Boolean)], pointer(48));

RegRegisterMethod(TDataSet,'CurrToBCD',TypeInfo(_T30),[
TypeInfo(Currency),
TypeInfoPointer,
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Boolean)], pointer(52));

RegRegisterMethod(TDataSet,'CheckActive',TypeInfo(_T32),NoParams, pointer(60));

RegRegisterMethod(TDataSet,'CheckInactive',TypeInfo(_T33),NoParams, pointer(64));

RegRegisterMethod(TDataSet,'ClearBuffers',TypeInfo(_T34),NoParams, pointer(68));

RegRegisterMethod(TDataSet,'CloseBlob',TypeInfo(_T36),[
TypeInfo(TField)], pointer(76));

RegRegisterMethod(TDataSet,'CloseCursor',TypeInfo(_T37),NoParams, pointer(80));

RegRegisterMethod(TDataSet,'DataEvent',TypeInfo(_T38),[
TypeInfo(TDataEvent),
TypeInfo(Longint)], pointer(84));

RegRegisterMethod(TDataSet,'DefChanged',TypeInfo(_T39),[
TypeInfo(TObject)], pointer(88));

RegRegisterMethod(TDataSet,'DestroyFields',TypeInfo(_T40),NoParams, pointer(92));

RegRegisterMethod(TDataSet,'DoAfterCancel',TypeInfo(_T41),NoParams, pointer(96));

RegRegisterMethod(TDataSet,'DoAfterClose',TypeInfo(_T42),NoParams, pointer(100));

RegRegisterMethod(TDataSet,'DoAfterDelete',TypeInfo(_T43),NoParams, pointer(104));

RegRegisterMethod(TDataSet,'DoAfterEdit',TypeInfo(_T44),NoParams, pointer(108));

RegRegisterMethod(TDataSet,'DoAfterInsert',TypeInfo(_T45),NoParams, pointer(112));

RegRegisterMethod(TDataSet,'DoAfterOpen',TypeInfo(_T46),NoParams, pointer(116));

RegRegisterMethod(TDataSet,'DoAfterPost',TypeInfo(_T47),NoParams, pointer(120));

RegRegisterMethod(TDataSet,'DoAfterScroll',TypeInfo(_T48),NoParams, pointer(124));

RegRegisterMethod(TDataSet,'DoBeforeCancel',TypeInfo(_T49),NoParams, pointer(128));

RegRegisterMethod(TDataSet,'DoBeforeClose',TypeInfo(_T50),NoParams, pointer(132));

RegRegisterMethod(TDataSet,'DoBeforeDelete',TypeInfo(_T51),NoParams, pointer(136));

RegRegisterMethod(TDataSet,'DoBeforeEdit',TypeInfo(_T52),NoParams, pointer(140));

RegRegisterMethod(TDataSet,'DoBeforeInsert',TypeInfo(_T53),NoParams, pointer(144));

RegRegisterMethod(TDataSet,'DoBeforeOpen',TypeInfo(_T54),NoParams, pointer(148));

RegRegisterMethod(TDataSet,'DoBeforePost',TypeInfo(_T55),NoParams, pointer(152));

RegRegisterMethod(TDataSet,'DoBeforeScroll',TypeInfo(_T56),NoParams, pointer(156));

RegRegisterMethod(TDataSet,'DoOnCalcFields',TypeInfo(_T57),NoParams, pointer(160));

RegRegisterMethod(TDataSet,'DoOnNewRecord',TypeInfo(_T58),NoParams, pointer(164));

RegRegisterMethod(TDataSet,'FindRecord',TypeInfo(_T59),[
TypeInfo(Boolean),
TypeInfo(Boolean),TypeInfo(Boolean)], pointer(168));

RegRegisterMethod(TDataSet,'FreeFieldBuffers',TypeInfo(_T60),NoParams, pointer(172));

RegRegisterMethod(TDataSet,'GetBookmarkStr',TypeInfo(_T61),[TypeInfo(TBookmarkStr)], pointer(176));

RegRegisterMethod(TDataSet,'GetCanModify',TypeInfo(_T63),[TypeInfo(Boolean)], pointer(184));

RegRegisterMethod(TDataSet,'GetDataSource',TypeInfo(_T64),[TypeInfo(TDataSource)], pointer(188));

RegRegisterMethod(TDataSet,'GetStateFieldValue',TypeInfo(_T66),[
TypeInfo(TDataSetState),
TypeInfo(TField),TypeInfo(Variant)], pointer(196));

RegRegisterMethod(TDataSet,'GetIsIndexField',TypeInfo(_T67),[
TypeInfo(TField),TypeInfo(Boolean)], pointer(200));

RegRegisterMethod(TDataSet,'GetNextRecords',TypeInfo(_T68),[TypeInfo(Integer)], pointer(204));

RegRegisterMethod(TDataSet,'GetNextRecord',TypeInfo(_T69),[TypeInfo(Boolean)], pointer(208));

RegRegisterMethod(TDataSet,'GetPriorRecords',TypeInfo(_T70),[TypeInfo(Integer)], pointer(212));

RegRegisterMethod(TDataSet,'GetPriorRecord',TypeInfo(_T71),[TypeInfo(Boolean)], pointer(216));

RegRegisterMethod(TDataSet,'GetRecordCount',TypeInfo(_T72),[TypeInfo(Integer)], pointer(220));

RegRegisterMethod(TDataSet,'GetRecNo',TypeInfo(_T73),[TypeInfo(Integer)], pointer(224));

RegRegisterMethod(TDataSet,'InitFieldDefs',TypeInfo(_T74),NoParams, pointer(228));

RegRegisterMethod(TDataSet,'InternalCancel',TypeInfo(_T76),NoParams, pointer(236));

RegRegisterMethod(TDataSet,'InternalEdit',TypeInfo(_T77),NoParams, pointer(240));

RegRegisterMethod(TDataSet,'InternalRefresh',TypeInfo(_T78),NoParams, pointer(244));

RegRegisterMethod(TDataSet,'OpenCursor',TypeInfo(_T79),[
TypeInfo(Boolean)], pointer(248));

RegRegisterMethod(TDataSet,'SetBookmarkStr',TypeInfo(_T81),[
TypeInfo(TBookmarkStr)], pointer(256));

RegRegisterMethod(TDataSet,'SetCurrentRecord',TypeInfo(_T82),[
TypeInfo(Integer)], pointer(260));

RegRegisterMethod(TDataSet,'SetFiltered',TypeInfo(_T83),[
TypeInfo(Boolean)], pointer(264));

RegRegisterMethod(TDataSet,'SetFilterOptions',TypeInfo(_T84),[
TypeInfo(TFilterOptions)], pointer(268));

RegRegisterMethod(TDataSet,'SetFilterText',TypeInfo(_T85),[
TypeInfo(string)], pointer(272));

RegRegisterMethod(TDataSet,'SetStateFieldValue',TypeInfo(_T86),[
TypeInfo(TDataSetState),
TypeInfo(TField),
TypeInfo(Variant)], pointer(276));

RegRegisterMethod(TDataSet,'SetRecNo',TypeInfo(_T88),[
TypeInfo(Integer)], pointer(284));

RegRegisterMethod(TDataSet,'UpdateIndexDefs',TypeInfo(_T89),NoParams, pointer(288));

RegRegisterMethod(TDataSet,'AllocRecordBuffer',TypeInfo(_T90),[TypeInfoPChar], pointer(292));

RegRegisterMethod(TDataSet,'GetFieldData',TypeInfo(_T94),[
TypeInfo(TField),
TypeInfoPointer,TypeInfo(Boolean)], pointer(308));

RegRegisterMethod(TDataSet,'GetRecordSize',TypeInfo(_T96),[TypeInfo(Word)], pointer(316));

RegRegisterMethod(TDataSet,'InternalAddRecord',TypeInfo(_T97),[
TypeInfoPointer,
TypeInfo(Boolean)], pointer(320));

RegRegisterMethod(TDataSet,'InternalClose',TypeInfo(_T98),NoParams, pointer(324));

RegRegisterMethod(TDataSet,'InternalDelete',TypeInfo(_T99),NoParams, pointer(328));

RegRegisterMethod(TDataSet,'InternalFirst',TypeInfo(_T100),NoParams, pointer(332));

RegRegisterMethod(TDataSet,'InternalGotoBookmark',TypeInfo(_T101),[
TypeInfoPointer], pointer(336));

RegRegisterMethod(TDataSet,'InternalHandleException',TypeInfo(_T102),NoParams, pointer(340));

RegRegisterMethod(TDataSet,'InternalInitFieldDefs',TypeInfo(_T103),NoParams, pointer(344));

RegRegisterMethod(TDataSet,'InternalLast',TypeInfo(_T105),NoParams, pointer(352));

RegRegisterMethod(TDataSet,'InternalOpen',TypeInfo(_T106),NoParams, pointer(356));

RegRegisterMethod(TDataSet,'InternalPost',TypeInfo(_T107),NoParams, pointer(360));

RegRegisterMethod(TDataSet,'IsCursorOpen',TypeInfo(_T109),[TypeInfo(Boolean)], pointer(368));

RegRegisterMethod(TDataSet,'SetFieldData',TypeInfo(_T112),[
TypeInfo(TField),
TypeInfoPointer], pointer(380));

RegRegisterMethod(TDataSet,'ActiveBuffer',TypeInfo(_T113),[TypeInfoPChar],Addr(TDataSet.ActiveBuffer));

RegRegisterMethod(TDataSet,'Append',TypeInfo(_T114),NoParams,Addr(TDataSet.Append));

RegRegisterMethod(TDataSet,'AppendRecord',TypeInfo(_T115),[
TypeInfoArrayOfConst],Addr(TDataSet.AppendRecord));

RegRegisterMethod(TDataSet,'BookmarkValid',TypeInfo(_T116),[
TypeInfoPointer,TypeInfo(Boolean)], pointer(384));

RegRegisterMethod(TDataSet,'Cancel',TypeInfo(_T117),NoParams, pointer(388));

RegRegisterMethod(TDataSet,'CheckBrowseMode',TypeInfo(_T118),NoParams,Addr(TDataSet.CheckBrowseMode));

RegRegisterMethod(TDataSet,'ClearFields',TypeInfo(_T119),NoParams,Addr(TDataSet.ClearFields));

RegRegisterMethod(TDataSet,'Close',TypeInfo(_T120),NoParams,Addr(TDataSet.Close));

RegRegisterMethod(TDataSet,'ControlsDisabled',TypeInfo(_T121),[TypeInfo(Boolean)],Addr(TDataSet.ControlsDisabled));

RegRegisterMethod(TDataSet,'CompareBookmarks',TypeInfo(_T122),[
TypeInfoPointer,
TypeInfoPointer,TypeInfo(Integer)], pointer(392));

RegRegisterMethod(TDataSet,'CreateBlobStream',TypeInfo(_T123),[
TypeInfo(TField),
TypeInfo(TBlobStreamMode),TypeInfo(TStream)], pointer(396));

RegRegisterMethod(TDataSet,'CursorPosChanged',TypeInfo(_T124),NoParams,Addr(TDataSet.CursorPosChanged));

RegRegisterMethod(TDataSet,'Delete',TypeInfo(_T125),NoParams,Addr(TDataSet.Delete));

RegRegisterMethod(TDataSet,'DisableControls',TypeInfo(_T126),NoParams,Addr(TDataSet.DisableControls));

RegRegisterMethod(TDataSet,'Edit',TypeInfo(_T127),NoParams,Addr(TDataSet.Edit));

RegRegisterMethod(TDataSet,'EnableControls',TypeInfo(_T128),NoParams,Addr(TDataSet.EnableControls));

RegRegisterMethod(TDataSet,'FieldByName',TypeInfo(_T129),[
TypeInfo(string),TypeInfo(TField)],Addr(TDataSet.FieldByName));

RegRegisterMethod(TDataSet,'FindField',TypeInfo(_T130),[
TypeInfo(string),TypeInfo(TField)],Addr(TDataSet.FindField));

RegRegisterMethod(TDataSet,'FindFirst',TypeInfo(_T131),[TypeInfo(Boolean)],Addr(TDataSet.FindFirst));

RegRegisterMethod(TDataSet,'FindLast',TypeInfo(_T132),[TypeInfo(Boolean)],Addr(TDataSet.FindLast));

RegRegisterMethod(TDataSet,'FindNext',TypeInfo(_T133),[TypeInfo(Boolean)],Addr(TDataSet.FindNext));

RegRegisterMethod(TDataSet,'FindPrior',TypeInfo(_T134),[TypeInfo(Boolean)],Addr(TDataSet.FindPrior));

RegRegisterMethod(TDataSet,'First',TypeInfo(_T135),NoParams,Addr(TDataSet.First));

RegRegisterMethod(TDataSet,'FreeBookmark',TypeInfo(_T136),[
TypeInfoPointer], pointer(400));

RegRegisterMethod(TDataSet,'GetBookmark',TypeInfo(_T137),[TypeInfoPointer], pointer(404));

RegRegisterMethod(TDataSet,'GetFieldList',TypeInfo(_T139),[
TypeInfo(TList),
TypeInfo(string)],Addr(TDataSet.GetFieldList));

RegRegisterMethod(TDataSet,'GetFieldNames',TypeInfo(_T140),[
TypeInfo(TStrings)],Addr(TDataSet.GetFieldNames));

RegRegisterMethod(TDataSet,'GotoBookmark',TypeInfo(_T141),[
TypeInfoPointer],Addr(TDataSet.GotoBookmark));

RegRegisterMethod(TDataSet,'Insert',TypeInfo(_T142),NoParams,Addr(TDataSet.Insert));

RegRegisterMethod(TDataSet,'InsertRecord',TypeInfo(_T143),[
TypeInfoArrayOfConst],Addr(TDataSet.InsertRecord));

RegRegisterMethod(TDataSet,'IsEmpty',TypeInfo(_T144),[TypeInfo(Boolean)],Addr(TDataSet.IsEmpty));

RegRegisterMethod(TDataSet,'IsLinkedTo',TypeInfo(_T145),[
TypeInfo(TDataSource),TypeInfo(Boolean)],Addr(TDataSet.IsLinkedTo));

RegRegisterMethod(TDataSet,'IsSequenced',TypeInfo(_T146),[TypeInfo(Boolean)], pointer(412));

RegRegisterMethod(TDataSet,'Last',TypeInfo(_T147),NoParams,Addr(TDataSet.Last));

RegRegisterMethod(TDataSet,'Locate',TypeInfo(_T148),[
TypeInfo(string),
TypeInfo(Variant),
TypeInfo(TLocateOptions),TypeInfo(Boolean)], pointer(416));

RegRegisterMethod(TDataSet,'Lookup',TypeInfo(_T149),[
TypeInfo(string),
TypeInfo(Variant),
TypeInfo(string),TypeInfo(Variant)], pointer(420));

RegRegisterMethod(TDataSet,'MoveBy',TypeInfo(_T150),[
TypeInfo(Integer),TypeInfo(Integer)],Addr(TDataSet.MoveBy));

RegRegisterMethod(TDataSet,'Next',TypeInfo(_T151),NoParams,Addr(TDataSet.Next));

RegRegisterMethod(TDataSet,'Open',TypeInfo(_T152),NoParams,Addr(TDataSet.Open));

RegRegisterMethod(TDataSet,'Post',TypeInfo(_T153),NoParams, pointer(424));

RegRegisterMethod(TDataSet,'Prior',TypeInfo(_T154),NoParams,Addr(TDataSet.Prior));

RegRegisterMethod(TDataSet,'Refresh',TypeInfo(_T155),NoParams,Addr(TDataSet.Refresh));

RegRegisterMethod(TDataSet,'Resync',TypeInfo(_T156),[
TypeInfo(TResyncMode)], pointer(428));

RegRegisterMethod(TDataSet,'SetFields',TypeInfo(_T157),[
TypeInfoArrayOfConst],Addr(TDataSet.SetFields));

RegRegisterMethod(TDataSet,'UpdateCursorPos',TypeInfo(_T159),NoParams,Addr(TDataSet.UpdateCursorPos));

RegRegisterMethod(TDataSet,'UpdateRecord',TypeInfo(_T160),NoParams,Addr(TDataSet.UpdateRecord));

RegisterProc(TDataSetDesigner,'Create',mtConstructor,TypeInfo(_T161),[
TypeInfo(TDataSet)],Addr(TDataSetDesigner.Create),cRegister);

RegRegisterMethod(TDataSetDesigner,'BeginDesign',TypeInfo(_T162),NoParams,Addr(TDataSetDesigner.BeginDesign));

RegRegisterMethod(TDataSetDesigner,'DataEvent',TypeInfo(_T163),[
TypeInfo(TDataEvent),
TypeInfo(Longint)], pointer(0));

RegRegisterMethod(TDataSetDesigner,'EndDesign',TypeInfo(_T164),NoParams,Addr(TDataSetDesigner.EndDesign));

RegRegisterMethod(TDataSource,'Edit',TypeInfo(_T165),NoParams,Addr(TDataSource.Edit));

RegRegisterMethod(TDataSource,'IsLinkedTo',TypeInfo(_T166),[
TypeInfo(TDataSet),TypeInfo(Boolean)],Addr(TDataSource.IsLinkedTo));

RegRegisterMethod(TDefCollection,'IndexOf',TypeInfo(_T168),[
TypeInfo(string),TypeInfo(Integer)],Addr(TDefCollection.IndexOf));

RegRegisterMethod(TDefCollection,'Find',TypeInfo(_T169),[
TypeInfo(string),TypeInfo(TNamedItem)],Addr(TDefCollection.Find));

RegRegisterMethod(TField,'AccessError',TypeInfo(_T170),[
TypeInfo(string),TypeInfo(EDatabaseError)], pointer(MinVMTOffset - 13));

RegisterProc(TField,'CheckTypeSize',mtClassMethod,TypeInfo(_T171),[
TypeInfo(Integer)], pointer(44),cRegister);

RegRegisterMethod(TField,'Change',TypeInfo(_T172),NoParams, pointer(48));

RegRegisterMethod(TField,'FreeBuffers',TypeInfo(_T173),NoParams, pointer(52));

RegRegisterMethod(TField,'GetAsBoolean',TypeInfo(_T174),[TypeInfo(Boolean)], pointer(56));

RegRegisterMethod(TField,'GetAsCurrency',TypeInfo(_T175),[TypeInfo(Currency)], pointer(60));

RegRegisterMethod(TField,'GetAsDateTime',TypeInfo(_T176),[TypeInfo(TDateTime)], pointer(64));

RegRegisterMethod(TField,'GetAsFloat',TypeInfo(_T177),[TypeInfo(Double)], pointer(68));

RegRegisterMethod(TField,'GetAsInteger',TypeInfo(_T178),[TypeInfo(Longint)], pointer(72));

RegRegisterMethod(TField,'GetAsString',TypeInfo(_T179),[TypeInfo(string)], pointer(76));

RegRegisterMethod(TField,'GetAsVariant',TypeInfo(_T180),[TypeInfo(Variant)], pointer(80));

RegRegisterMethod(TField,'GetCanModify',TypeInfo(_T181),[TypeInfo(Boolean)], pointer(84));

RegRegisterMethod(TField,'GetDataSize',TypeInfo(_T182),[TypeInfo(Word)], pointer(88));

RegRegisterMethod(TField,'GetDefaultWidth',TypeInfo(_T183),[TypeInfo(Integer)], pointer(92));

RegRegisterMethod(TField,'GetIsNull',TypeInfo(_T184),[TypeInfo(Boolean)], pointer(96));

RegRegisterMethod(TField,'GetText',TypeInfo(_T185),[
TypeInfo(string),
TypeInfo(Boolean)], pointer(100));

RegRegisterMethod(TField,'SetAsBoolean',TypeInfo(_T186),[
TypeInfo(Boolean)], pointer(104));

RegRegisterMethod(TField,'SetAsCurrency',TypeInfo(_T187),[
TypeInfo(Currency)], pointer(108));

RegRegisterMethod(TField,'SetAsDateTime',TypeInfo(_T188),[
TypeInfo(TDateTime)], pointer(112));

RegRegisterMethod(TField,'SetAsFloat',TypeInfo(_T189),[
TypeInfo(Double)], pointer(116));

RegRegisterMethod(TField,'SetAsInteger',TypeInfo(_T190),[
TypeInfo(Longint)], pointer(120));

RegRegisterMethod(TField,'SetAsString',TypeInfo(_T191),[
TypeInfo(string)], pointer(124));

RegRegisterMethod(TField,'SetAsVariant',TypeInfo(_T192),[
TypeInfo(Variant)], pointer(128));

RegRegisterMethod(TField,'SetSize',TypeInfo(_T193),[
TypeInfo(Word)], pointer(132));

RegRegisterMethod(TField,'SetText',TypeInfo(_T194),[
TypeInfo(string)], pointer(136));

RegRegisterMethod(TField,'SetVarValue',TypeInfo(_T195),[
TypeInfo(Variant)], pointer(140));

RegRegisterMethod(TField,'AssignValue',TypeInfo(_T196),[
TypeInfo(IDispatch)],Addr(__TField__AssignValue__Wrapper));

RegRegisterMethod(TField,'Clear',TypeInfo(_T197),NoParams, pointer(144));

RegRegisterMethod(TField,'FocusControl',TypeInfo(_T198),NoParams,Addr(TField.FocusControl));

RegRegisterMethod(TField,'GetData',TypeInfo(_T199),[
TypeInfoPointer,TypeInfo(Boolean)],Addr(TField.GetData));

RegisterProc(TField,'IsBlob',mtClassMethod,TypeInfo(_T200),[TypeInfo(Boolean)], pointer(148),cRegister);

RegRegisterMethod(TField,'IsValidChar',TypeInfo(_T201),[
TypeInfo(Char),TypeInfo(Boolean)], pointer(152));

RegRegisterMethod(TField,'RefreshLookupList',TypeInfo(_T202),NoParams,Addr(TField.RefreshLookupList));

RegRegisterMethod(TField,'SetData',TypeInfo(_T203),[
TypeInfoPointer],Addr(TField.SetData));

RegRegisterMethod(TField,'SetFieldType',TypeInfo(_T204),[
TypeInfo(TFieldType)], pointer(156));

RegRegisterMethod(TField,'Validate',TypeInfo(_T205),[
TypeInfoPointer],Addr(TField.Validate));

RegRegisterMethod(TFieldDef,'CreateField',TypeInfo(_T206),[
TypeInfo(TComponent),TypeInfo(TField)],Addr(TFieldDef.CreateField));

RegisterProc(TFieldDefs,'Create',mtConstructor,TypeInfo(_T207),[
TypeInfo(TDataSet)],Addr(TFieldDefs.Create),cRegister);

RegRegisterMethod(TFieldDefs,'AddFieldDef',TypeInfo(_T208),[TypeInfo(TFieldDef)],Addr(TFieldDefs.AddFieldDef));

RegRegisterMethod(TFieldDefs,'Find',TypeInfo(_T209),[
TypeInfo(string),TypeInfo(TFieldDef)],Addr(TFieldDefs.Find));

RegRegisterMethod(TFieldDefs,'Update',TypeInfo(_T210),NoParams,Addr(TFieldDefs.Update));

RegRegisterMethod(TFieldDefs,'Add',TypeInfo(_T211),[
TypeInfo(string),
TypeInfo(TFieldType),
TypeInfo(Word),
TypeInfo(Boolean)],Addr(TFieldDefs.Add));

RegisterProc(TIndexDefs,'Create',mtConstructor,TypeInfo(_T212),[
TypeInfo(TDataSet)],Addr(TIndexDefs.Create),cRegister);

RegRegisterMethod(TIndexDefs,'AddIndexDef',TypeInfo(_T213),[TypeInfo(TIndexDef)],Addr(TIndexDefs.AddIndexDef));

RegRegisterMethod(TIndexDefs,'Find',TypeInfo(_T214),[
TypeInfo(string),TypeInfo(TIndexDef)],Addr(TIndexDefs.Find));

RegRegisterMethod(TIndexDefs,'Update',TypeInfo(_T215),NoParams,Addr(TIndexDefs.Update));

RegRegisterMethod(TIndexDefs,'FindIndexForFields',TypeInfo(_T216),[
TypeInfo(string),TypeInfo(TIndexDef)],Addr(TIndexDefs.FindIndexForFields));

RegRegisterMethod(TIndexDefs,'GetIndexForFields',TypeInfo(_T217),[
TypeInfo(string),
TypeInfo(Boolean),TypeInfo(TIndexDef)],Addr(TIndexDefs.GetIndexForFields));

RegRegisterMethod(TIndexDefs,'Add',TypeInfo(_T218),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TIndexOptions)],Addr(TIndexDefs.Add));

RegisterProc(TLookupList,'Create',mtConstructor,TypeInfo(_T219),NoParams,Addr(TLookupList.Create),cRegister);

RegRegisterMethod(TLookupList,'Add',TypeInfo(_T220),[
TypeInfo(Variant),
TypeInfo(Variant)],Addr(TLookupList.Add));

RegRegisterMethod(TLookupList,'Clear',TypeInfo(_T221),NoParams,Addr(TLookupList.Clear));

RegRegisterMethod(TLookupList,'ValueOfKey',TypeInfo(_T222),[
TypeInfo(Variant),TypeInfo(Variant)],Addr(TLookupList.ValueOfKey));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'RegisterFields',mtProc,TypeInfo(_T1),[
ArrayInfo(TypeInfo(TFieldClass))],Addr(RegisterFields),cRegister)}

{RegRegisterMethod(TDataSet,'CalculateFields',TypeInfo(_T31),[
TypeInfoPChar], pointer(56))}

{RegRegisterMethod(TDataSet,'ClearCalcFields',TypeInfo(_T35),[
TypeInfoPChar], pointer(72))}

{RegRegisterMethod(TDataSet,'GetCalcFields',TypeInfo(_T62),[
TypeInfoPChar], pointer(180))}

{RegRegisterMethod(TDataSet,'GetFieldClass',TypeInfo(_T65),[
TypeInfo(TFieldType),TypeInfo(TFieldClass)], pointer(192))}

{RegRegisterMethod(TDataSet,'InitRecord',TypeInfo(_T75),[
TypeInfoPChar], pointer(232))}

{RegRegisterMethod(TDataSet,'RefreshInternalCalcFields',TypeInfo(_T80),[
TypeInfoPChar], pointer(252))}

{RegRegisterMethod(TDataSet,'SetOnFilterRecord',TypeInfo(_T87),[
TypeInfo(TFilterRecordEvent)], pointer(280))}

{RegRegisterMethod(TDataSet,'FreeRecordBuffer',TypeInfo(_T91),[
TypeInfoPChar], pointer(296))}

{RegRegisterMethod(TDataSet,'GetBookmarkData',TypeInfo(_T92),[
TypeInfoPChar,
TypeInfoPointer], pointer(300))}

{RegRegisterMethod(TDataSet,'GetBookmarkFlag',TypeInfo(_T93),[
TypeInfoPChar,TypeInfo(TBookmarkFlag)], pointer(304))}

{RegRegisterMethod(TDataSet,'GetRecord',TypeInfo(_T95),[
TypeInfoPChar,
TypeInfo(TGetMode),
TypeInfo(Boolean),TypeInfo(TGetResult)], pointer(312))}

{RegRegisterMethod(TDataSet,'InternalInitRecord',TypeInfo(_T104),[
TypeInfoPChar], pointer(348))}

{RegRegisterMethod(TDataSet,'InternalSetToRecord',TypeInfo(_T108),[
TypeInfoPChar], pointer(364))}

{RegRegisterMethod(TDataSet,'SetBookmarkFlag',TypeInfo(_T110),[
TypeInfoPChar,
TypeInfo(TBookmarkFlag)], pointer(372))}

{RegRegisterMethod(TDataSet,'SetBookmarkData',TypeInfo(_T111),[
TypeInfoPChar,
TypeInfoPointer], pointer(376))}

{RegRegisterMethod(TDataSet,'GetCurrentRecord',TypeInfo(_T138),[
TypeInfoPChar,TypeInfo(Boolean)], pointer(408))}

{RegRegisterMethod(TDataSet,'Translate',TypeInfo(_T158),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(Boolean)], pointer(432))}

{RegisterProc(TDefCollection,'Create',mtConstructor,TypeInfo(_T167),[
TypeInfo(TDataSet),
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
