{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit DBTABLES_D6;
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
  Variants,
  Windows,
  SysUtils,
  Classes,
  DB,
  DBCommon,
  BDE,
  SMINTF,
  DBTables;
function ConvertTKeyBufferToVariant(var R : TKeyBuffer) : OleVariant;
function ConvertVariantToTKeyBuffer(const V : OleVariant) : TKeyBuffer;
function ConvertTRecInfoToVariant(var R : TRecInfo) : OleVariant;
function ConvertVariantToTRecInfo(const V : OleVariant) : TRecInfo;
function ConvertTServerDescToVariant(var R : TServerDesc) : OleVariant;
function ConvertVariantToTServerDesc(const V : OleVariant) : TServerDesc;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TKeyBuffer__Wrapper = class(TDCRecordWrapper)
private
fR : TKeyBuffer;
public
function GetRecordPtr : pointer; override;
published
procedure setModified(const val : Boolean);
function getModified : Boolean;
property Modified : Boolean read getModified write setModified;
procedure setExclusive(const val : Boolean);
function getExclusive : Boolean;
property Exclusive : Boolean read getExclusive write setExclusive;
procedure setFieldCount(const val : Integer);
function getFieldCount : Integer;
property FieldCount : Integer read getFieldCount write setFieldCount;
end;
type __TRecInfo__Wrapper = class(TDCRecordWrapper)
private
fR : TRecInfo;
public
function GetRecordPtr : pointer; override;
published
procedure setRecordNumber(const val : Longint);
function getRecordNumber : Longint;
property RecordNumber : Longint read getRecordNumber write setRecordNumber;
procedure setUpdateStatus(const val : TUpdateStatus);
function getUpdateStatus : TUpdateStatus;
property UpdateStatus : TUpdateStatus read getUpdateStatus write setUpdateStatus;
procedure setBookmarkFlag(const val : TBookmarkFlag);
function getBookmarkFlag : TBookmarkFlag;
property BookmarkFlag : TBookmarkFlag read getBookmarkFlag write setBookmarkFlag;
end;
type __TServerDesc__Wrapper = class(TDCRecordWrapper)
private
fR : TServerDesc;
public
function GetRecordPtr : pointer; override;
published
procedure setBindType(const val : TFieldType);
function getBindType : TFieldType;
property BindType : TFieldType read getBindType write setBindType;
end;
type
{_T0 = function (p0 : TLocale;
const p1 : string;
p2 : PChar;
p3 : Integer): PChar of object;}

{_T1 = procedure (p0 : TLocale;
p1 : PChar;
var p2 : string) of object;}

{_T2 = procedure (p0 : TLocale;
p1 : PChar;
p2 : PChar;
p3 : Integer) of object;}

{_T3 = procedure (p0 : TLocale;
p1 : PChar;
p2 : PChar;
p3 : Integer) of object;}

_T4 = function (p0 : TLocale;
const p1 : string;
const p2 : string;
p3 : Integer): Integer of object;

{_T5 = function (p0 : TLocale;
const p1 : PChar;
const p2 : PChar;
p3 : Integer): Integer of object;}

_T6 = _T4;

{_T7 = function (p0 : TLocale;
const p1 : PChar;
const p2 : PChar;
p3 : Integer): Integer of object;}

{_T8 = function (p0 : TDataSet;
var p1 : DataSources): Boolean of object;}

_T9 = procedure (p0 : DBIResult) of object;

_T10 = _T9;

{_T11 = procedure (const p0 : TBDEInitProc) of object;}

_T12 = _T9;

_T13 = procedure  of object;

{_T14 = procedure (p0 : TObject;
p1 : hDBICur;
p2 : CBType;
p3 : Pointer;
p4 : Integer;
p5 : TBDECallbackEvent;
p6 : Boolean) of object;}

{_T15 = function : hDBICur of object;}

_T16 = _T13;

_T17 = _T13;

{_T18 = function (const p0 : string;
p1 : Boolean): hDBICur of object;}

_T19 = _T13;

_T20 = _T13;

_T21 = _T13;

_T22 = _T13;

{_T23 = function (p0 : DsInfoReq;
var p1 : DataSources): DBIResult of object;}

_T24 = function : Boolean of object;

_T25 = _T13;

_T26 = _T13;

_T27 = _T13;

_T28 = _T13;

_T29 = _T13;

_T30 = _T13;

_T31 = procedure (p0 : TBlobField;
p1 : TBlobStreamMode) of object;

_T32 = _T13;

_T33 = procedure (const p0 : Array of TDBDataSet) of object;

_T34 = _T13;

_T35 = _T13;

_T37 = procedure (const p0 : string) of object;

_T38 = procedure (const p0 : string;
p1 : TStrings) of object;

_T39 = procedure (p0 : TStrings;
p1 : Boolean) of object;

_T40 = _T13;

_T41 = _T13;

_T42 = _T37;

_T43 = function : TDataSet of object;

_T44 = procedure (p0 : TDataSet) of object;

_T45 = procedure (p0 : TUpdateKind) of object;

_T46 = _T13;

_T47 = function (p0 : Integer;
p1 : Boolean): Boolean of object;

_T48 = function (p0 : DBIResult): Boolean of object;

_T49 = procedure (p0 : TDatabase) of object;

_T50 = function : TDatabase of object;

{_T51 = procedure (p0 : EDBEngineError;
p1 : DBIResult;
p2 : Longint;
p3 : PChar) of object;}

_T52 = procedure (p0 : TTable) of object;

_T53 = procedure (p0 : TStrings) of object;

_T54 = _T13;

{_T55 = procedure (p0 : PChar) of object;}

_T56 = _T13;

_T57 = function (const p0 : string): TParam of object;

_T58 = _T13;

_T59 = _T13;

_T60 = procedure (const p0 : string;
const p1 : string;
p2 : TStrings) of object;

_T61 = _T38;

_T62 = procedure (const p0 : string;
const p1 : string;
const p2 : string) of object;

_T63 = _T37;

_T64 = _T13;

_T65 = _T49;

_T66 = _T37;

_T67 = _T37;

_T68 = _T13;

_T69 = function (const p0 : string): TDatabase of object;

_T70 = _T53;

_T71 = _T38;

_T72 = function (const p0 : string): string of object;

_T73 = _T60;

_T74 = _T53;

_T75 = _T53;

_T76 = _T38;

_T77 = _T60;

_T78 = _T24;

_T79 = procedure (const p0 : string;
const p1 : string;
p2 : Boolean;
p3 : Boolean;
p4 : TStrings) of object;

_T80 = _T38;

_T81 = function (const p0 : string): Boolean of object;

_T82 = procedure (p0 : string;
p1 : TStrings) of object;

_T83 = _T82;

_T84 = _T13;

_T85 = _T69;

_T86 = _T13;

_T87 = _T37;

_T88 = _T13;

_T89 = _T13;

_T90 = function (const p0 : string): TSession of object;

_T91 = _T53;

_T92 = _T90;

_T93 = function (p0 : TUpdateKind): TStrings of object;

_T94 = procedure (p0 : TParams) of object;

_T95 = _T24;

_T96 = _T13;

_T97 = _T57;

_T98 = _T13;

_T99 = _T13;

_T100 = _T13;

_T101 = function (p0 : TBDEDataSet;
p1 : TBatchMode): Longint of object;

_T102 = procedure (const p0 : string;
const p1 : string;
p2 : TIndexOptions;
const p3 : string) of object;

_T103 = _T13;

_T104 = _T13;

_T105 = _T37;

_T106 = _T13;

_T107 = _T37;

_T108 = _T13;

_T109 = _T13;

_T110 = _T13;

_T111 = _T13;

_T112 = _T13;

_T113 = function (const p0 : Array of Const): Boolean of object;

_T114 = procedure (const p0 : Array of Const) of object;

_T115 = _T53;

_T116 = _T52;

_T117 = _T24;

_T118 = _T13;

_T119 = procedure (p0 : TLockType) of object;

_T120 = _T37;

_T121 = _T37;

_T122 = _T13;

_T123 = procedure (const p0 : Array of Const;
const p1 : Array of Const) of object;

_T124 = _T13;

_T125 = _T13;

_T126 = _T119;

_T127 = _T45;

_T128 = _T45;

function __TKeyBuffer__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TKeyBuffer__Wrapper.setModified(const val : Boolean);
begin
TKeyBuffer(GetRecordPtr^).Modified := val;
end;
function __TKeyBuffer__Wrapper.getModified : Boolean;
begin
result := TKeyBuffer(GetRecordPtr^).Modified;
end;
procedure __TKeyBuffer__Wrapper.setExclusive(const val : Boolean);
begin
TKeyBuffer(GetRecordPtr^).Exclusive := val;
end;
function __TKeyBuffer__Wrapper.getExclusive : Boolean;
begin
result := TKeyBuffer(GetRecordPtr^).Exclusive;
end;
procedure __TKeyBuffer__Wrapper.setFieldCount(const val : Integer);
begin
TKeyBuffer(GetRecordPtr^).FieldCount := val;
end;
function __TKeyBuffer__Wrapper.getFieldCount : Integer;
begin
result := TKeyBuffer(GetRecordPtr^).FieldCount;
end;
function __TRecInfo__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TRecInfo__Wrapper.setRecordNumber(const val : Longint);
begin
TRecInfo(GetRecordPtr^).RecordNumber := val;
end;
function __TRecInfo__Wrapper.getRecordNumber : Longint;
begin
result := TRecInfo(GetRecordPtr^).RecordNumber;
end;
procedure __TRecInfo__Wrapper.setUpdateStatus(const val : TUpdateStatus);
begin
TRecInfo(GetRecordPtr^).UpdateStatus := val;
end;
function __TRecInfo__Wrapper.getUpdateStatus : TUpdateStatus;
begin
result := TRecInfo(GetRecordPtr^).UpdateStatus;
end;
procedure __TRecInfo__Wrapper.setBookmarkFlag(const val : TBookmarkFlag);
begin
TRecInfo(GetRecordPtr^).BookmarkFlag := val;
end;
function __TRecInfo__Wrapper.getBookmarkFlag : TBookmarkFlag;
begin
result := TRecInfo(GetRecordPtr^).BookmarkFlag;
end;
function __TServerDesc__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TServerDesc__Wrapper.setBindType(const val : TFieldType);
begin
TServerDesc(GetRecordPtr^).BindType := val;
end;
function __TServerDesc__Wrapper.getBindType : TFieldType;
begin
result := TServerDesc(GetRecordPtr^).BindType;
end;
function _TKeyBuffer_ : IDispatch;
begin
  result := __TKeyBuffer__Wrapper.Create;
end;
function _TRecInfo_ : IDispatch;
begin
  result := __TRecInfo__Wrapper.Create;
end;
function _TServerDesc_ : IDispatch;
begin
  result := __TServerDesc__Wrapper.Create;
end;
procedure __TDatabase__GetTableNames__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
1:
begin
TDatabase(__Instance).GetTableNames(TStrings(VarToObject(OleVariant(pargs^[0]))));
end;
2:
begin
TDatabase(__Instance).GetTableNames(TStrings(VarToObject(OleVariant(pargs^[1]))),OleVariant(pargs^[0]));
end;
end
end;

procedure __TTable__AddIndex__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
var
__s2 : TIndexOptions;
begin
if cArgs > 2 then
VarToSet(__s2,OleVariant(pargs^[2]),SizeOf(TIndexOptions));
case cArgs of
3:
begin
TTable(__Instance).AddIndex(OleVariant(pargs^[2]),OleVariant(pargs^[1]),__s2);
end;
4:
begin
TTable(__Instance).AddIndex(OleVariant(pargs^[3]),OleVariant(pargs^[2]),__s2,OleVariant(pargs^[0]));
end;
end
end;


type __TKeyBuffer__Wrapper__ = class(__TKeyBuffer__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TKeyBuffer__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTKeyBufferToVariant(var R : TKeyBuffer) : OleVariant;
var
__rw : __TKeyBuffer__Wrapper__;
begin
__rw := __TKeyBuffer__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTKeyBuffer(const V : OleVariant) : TKeyBuffer;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TKeyBuffer((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TRecInfo__Wrapper__ = class(__TRecInfo__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TRecInfo__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTRecInfoToVariant(var R : TRecInfo) : OleVariant;
var
__rw : __TRecInfo__Wrapper__;
begin
__rw := __TRecInfo__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTRecInfo(const V : OleVariant) : TRecInfo;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TRecInfo((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TServerDesc__Wrapper__ = class(__TServerDesc__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TServerDesc__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTServerDescToVariant(var R : TServerDesc) : OleVariant;
var
__rw : __TServerDesc__Wrapper__;
begin
__rw := __TServerDesc__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTServerDesc(const V : OleVariant) : TServerDesc;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TServerDesc((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetEDBEngineError__ErrorCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := EDBEngineError(Instance).ErrorCount;
end;

function __DC__GetEDBEngineError__Errors(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(EDBEngineError(Instance).Errors[OleVariant(Params^[0])]);
end;

function __DC__GetTBatchMove__ChangedCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBatchMove(Instance).ChangedCount;
end;

function __DC__GetTBatchMove__KeyViolCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBatchMove(Instance).KeyViolCount;
end;

function __DC__GetTBatchMove__MovedCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBatchMove(Instance).MovedCount;
end;

function __DC__GetTBatchMove__ProblemCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBatchMove(Instance).ProblemCount;
end;

function __DC__GetTBDEDataSet__CacheBlobs(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBDEDataSet(Instance).CacheBlobs;
end;

procedure __DC__SetTBDEDataSet__CacheBlobs(Instance : TObject; Params : PVariantArgList);
begin
TBDEDataSet(Instance).CacheBlobs:=OleVariant(Params^[0]);
end;

function __DC__GetTBDEDataSet__ExpIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBDEDataSet(Instance).ExpIndex;
end;

function __DC__GetTBDEDataSet__KeySize(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBDEDataSet(Instance).KeySize;
end;

function __DC__GetTBDEDataSet__Locale(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(TBDEDataSet(Instance).Locale);
end;

function __DC__GetTBDEDataSet__UpdateObject(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TBDEDataSet(Instance).UpdateObject);
end;

procedure __DC__SetTBDEDataSet__UpdateObject(Instance : TObject; Params : PVariantArgList);
begin
TBDEDataSet(Instance).UpdateObject:=TDataSetUpdateObject(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTBDEDataSet__UpdatesPending(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBDEDataSet(Instance).UpdatesPending;
end;

function __DC__GetTBDEDataSet__UpdateRecordTypes(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TUpdateRecordTypes;
begin
tmp := TBDEDataSet(Instance).UpdateRecordTypes;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTBDEDataSet__UpdateRecordTypes(Instance : TObject; Params : PVariantArgList);
var
  tmp : TUpdateRecordTypes;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TBDEDataSet(Instance).UpdateRecordTypes:=tmp;
end;

function __DC__GetTDatabase__DataSets(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDatabase(Instance).DataSets[OleVariant(Params^[0])]);
end;

function __DC__GetTDatabase__Directory(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDatabase(Instance).Directory;
end;

procedure __DC__SetTDatabase__Directory(Instance : TObject; Params : PVariantArgList);
begin
TDatabase(Instance).Directory:=OleVariant(Params^[0]);
end;

function __DC__GetTDatabase__IsSQLBased(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDatabase(Instance).IsSQLBased;
end;

function __DC__GetTDatabase__InTransaction(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDatabase(Instance).InTransaction;
end;

function __DC__GetTDatabase__Locale(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(TDatabase(Instance).Locale);
end;

function __DC__GetTDatabase__Session(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDatabase(Instance).Session);
end;

function __DC__GetTDatabase__Temporary(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDatabase(Instance).Temporary;
end;

procedure __DC__SetTDatabase__Temporary(Instance : TObject; Params : PVariantArgList);
begin
TDatabase(Instance).Temporary:=OleVariant(Params^[0]);
end;

function __DC__GetTDatabase__SessionAlias(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDatabase(Instance).SessionAlias;
end;

function __DC__GetTDatabase__TraceFlags(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TTraceFlags;
begin
tmp := TDatabase(Instance).TraceFlags;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTDatabase__TraceFlags(Instance : TObject; Params : PVariantArgList);
var
  tmp : TTraceFlags;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TDatabase(Instance).TraceFlags:=tmp;
end;

function __DC__GetTDBDataSet__Database(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDBDataSet(Instance).Database);
end;

function __DC__GetTDBDataSet__DBLocale(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(TDBDataSet(Instance).DBLocale);
end;

function __DC__GetTDBDataSet__DBSession(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDBDataSet(Instance).DBSession);
end;

function __DC__GetTDBError__Category(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDBError(Instance).Category;
end;

function __DC__GetTDBError__ErrorCode(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDBError(Instance).ErrorCode;
end;

function __DC__GetTDBError__SubCode(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDBError(Instance).SubCode;
end;

function __DC__GetTDBError__Message(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDBError(Instance).Message;
end;

function __DC__GetTDBError__NativeError(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDBError(Instance).NativeError;
end;

function __DC__GetTParamList__Buffer(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := String(TParamList(Instance).Buffer);
end;

function __DC__GetTParamList__FieldCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParamList(Instance).FieldCount;
end;

function __DC__GetTQuery__Prepared(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQuery(Instance).Prepared;
end;

procedure __DC__SetTQuery__Prepared(Instance : TObject; Params : PVariantArgList);
begin
TQuery(Instance).Prepared:=OleVariant(Params^[0]);
end;

function __DC__GetTQuery__ParamCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQuery(Instance).ParamCount;
end;

function __DC__GetTQuery__Local(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQuery(Instance).Local;
end;

function __DC__GetTQuery__Text(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQuery(Instance).Text;
end;

function __DC__GetTQuery__RowsAffected(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQuery(Instance).RowsAffected;
end;

function __DC__GetTQuery__SQLBinary(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := String(TQuery(Instance).SQLBinary);
end;

procedure __DC__SetTQuery__SQLBinary(Instance : TObject; Params : PVariantArgList);
begin
TQuery(Instance).SQLBinary:=PChar(String(OleVariant(Params^[0])));
end;

function __DC__GetTSession__ConfigMode(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TConfigMode;
begin
tmp := TSession(Instance).ConfigMode;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTSession__ConfigMode(Instance : TObject; Params : PVariantArgList);
var
  tmp : TConfigMode;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TSession(Instance).ConfigMode:=tmp;
end;

function __DC__GetTSession__DatabaseCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TSession(Instance).DatabaseCount;
end;

function __DC__GetTSession__Databases(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TSession(Instance).Databases[OleVariant(Params^[0])]);
end;

function __DC__GetTSession__Locale(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(TSession(Instance).Locale);
end;

function __DC__GetTSession__TraceFlags(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TTraceFlags;
begin
tmp := TSession(Instance).TraceFlags;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTSession__TraceFlags(Instance : TObject; Params : PVariantArgList);
var
  tmp : TTraceFlags;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TSession(Instance).TraceFlags:=tmp;
end;

function __DC__GetTSessionList__CurrentSession(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TSessionList(Instance).CurrentSession);
end;

procedure __DC__SetTSessionList__CurrentSession(Instance : TObject; Params : PVariantArgList);
begin
TSessionList(Instance).CurrentSession:=TSession(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTSessionList__Count(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TSessionList(Instance).Count;
end;

function __DC__GetTSessionList__Sessions(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TSessionList(Instance).Sessions[OleVariant(Params^[0])]);
end;

function __DC__GetTSessionList__List(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TSessionList(Instance).List[OleVariant(Params^[0])]);
end;

function __DC__GetTStoredProc__ParamCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStoredProc(Instance).ParamCount;
end;

function __DC__GetTStoredProc__Prepared(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStoredProc(Instance).Prepared;
end;

procedure __DC__SetTStoredProc__Prepared(Instance : TObject; Params : PVariantArgList);
begin
TStoredProc(Instance).Prepared:=OleVariant(Params^[0]);
end;

function __DC__GetTTable__Exists(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTable(Instance).Exists;
end;

function __DC__GetTTable__IndexFieldCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTable(Instance).IndexFieldCount;
end;

function __DC__GetTTable__IndexFields(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TTable(Instance).IndexFields[OleVariant(Params^[0])]);
end;

procedure __DC__SetTTable__IndexFields(Instance : TObject; Params : PVariantArgList);
begin
TTable(Instance).IndexFields[OleVariant(Params^[1])]:=TField(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTTable__KeyExclusive(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTable(Instance).KeyExclusive;
end;

procedure __DC__SetTTable__KeyExclusive(Instance : TObject; Params : PVariantArgList);
begin
TTable(Instance).KeyExclusive:=OleVariant(Params^[0]);
end;

function __DC__GetTTable__KeyFieldCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTable(Instance).KeyFieldCount;
end;

procedure __DC__SetTTable__KeyFieldCount(Instance : TObject; Params : PVariantArgList);
begin
TTable(Instance).KeyFieldCount:=OleVariant(Params^[0]);
end;

function __DC__GetTTable__TableLevel(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTable(Instance).TableLevel;
end;

procedure __DC__SetTTable__TableLevel(Instance : TObject; Params : PVariantArgList);
begin
TTable(Instance).TableLevel:=OleVariant(Params^[0]);
end;

function __DC__GetTUpdateSQL__DatabaseName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TUpdateSQL(Instance).DatabaseName;
end;

procedure __DC__SetTUpdateSQL__DatabaseName(Instance : TObject; Params : PVariantArgList);
begin
TUpdateSQL(Instance).DatabaseName:=OleVariant(Params^[0]);
end;

function __DC__GetTUpdateSQL__DataSet(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TUpdateSQL(Instance).DataSet);
end;

procedure __DC__SetTUpdateSQL__DataSet(Instance : TObject; Params : PVariantArgList);
begin
TUpdateSQL(Instance).DataSet:=TDataSet(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTUpdateSQL__Query(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TUpdateSQL(Instance).Query[OleVariant(Params^[0])]);
end;

function __DC__GetTUpdateSQL__SQL(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TUpdateSQL(Instance).SQL[OleVariant(Params^[0])]);
end;

procedure __DC__SetTUpdateSQL__SQL(Instance : TObject; Params : PVariantArgList);
begin
TUpdateSQL(Instance).SQL[OleVariant(Params^[1])]:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTUpdateSQL__SessionName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TUpdateSQL(Instance).SessionName;
end;

procedure __DC__SetTUpdateSQL__SessionName(Instance : TObject; Params : PVariantArgList);
begin
TUpdateSQL(Instance).SessionName:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
RegisterProperty(EDBEngineError,'ErrorCount',__DC__GetEDBEngineError__ErrorCount,nil);
RegisterIndexedProperty(EDBEngineError,'Errors',1,False,__DC__GetEDBEngineError__Errors,nil);
RegisterProperty(TBatchMove,'ChangedCount',__DC__GetTBatchMove__ChangedCount,nil);
RegisterProperty(TBatchMove,'KeyViolCount',__DC__GetTBatchMove__KeyViolCount,nil);
RegisterProperty(TBatchMove,'MovedCount',__DC__GetTBatchMove__MovedCount,nil);
RegisterProperty(TBatchMove,'ProblemCount',__DC__GetTBatchMove__ProblemCount,nil);
RegisterProperty(TBDEDataSet,'CacheBlobs',__DC__GetTBDEDataSet__CacheBlobs,__DC__SetTBDEDataSet__CacheBlobs);
RegisterProperty(TBDEDataSet,'ExpIndex',__DC__GetTBDEDataSet__ExpIndex,nil);
RegisterProperty(TBDEDataSet,'KeySize',__DC__GetTBDEDataSet__KeySize,nil);
RegisterProperty(TBDEDataSet,'Locale',__DC__GetTBDEDataSet__Locale,nil);
RegisterProperty(TBDEDataSet,'UpdateObject',__DC__GetTBDEDataSet__UpdateObject,__DC__SetTBDEDataSet__UpdateObject);
RegisterProperty(TBDEDataSet,'UpdatesPending',__DC__GetTBDEDataSet__UpdatesPending,nil);
RegisterProperty(TBDEDataSet,'UpdateRecordTypes',__DC__GetTBDEDataSet__UpdateRecordTypes,__DC__SetTBDEDataSet__UpdateRecordTypes);
RegisterIndexedProperty(TDatabase,'DataSets',1,False,__DC__GetTDatabase__DataSets,nil);
RegisterProperty(TDatabase,'Directory',__DC__GetTDatabase__Directory,__DC__SetTDatabase__Directory);
RegisterProperty(TDatabase,'IsSQLBased',__DC__GetTDatabase__IsSQLBased,nil);
RegisterProperty(TDatabase,'InTransaction',__DC__GetTDatabase__InTransaction,nil);
RegisterProperty(TDatabase,'Locale',__DC__GetTDatabase__Locale,nil);
RegisterProperty(TDatabase,'Session',__DC__GetTDatabase__Session,nil);
RegisterProperty(TDatabase,'Temporary',__DC__GetTDatabase__Temporary,__DC__SetTDatabase__Temporary);
RegisterProperty(TDatabase,'SessionAlias',__DC__GetTDatabase__SessionAlias,nil);
RegisterProperty(TDatabase,'TraceFlags',__DC__GetTDatabase__TraceFlags,__DC__SetTDatabase__TraceFlags);
RegisterProperty(TDBDataSet,'Database',__DC__GetTDBDataSet__Database,nil);
RegisterProperty(TDBDataSet,'DBLocale',__DC__GetTDBDataSet__DBLocale,nil);
RegisterProperty(TDBDataSet,'DBSession',__DC__GetTDBDataSet__DBSession,nil);
RegisterProperty(TDBError,'Category',__DC__GetTDBError__Category,nil);
RegisterProperty(TDBError,'ErrorCode',__DC__GetTDBError__ErrorCode,nil);
RegisterProperty(TDBError,'SubCode',__DC__GetTDBError__SubCode,nil);
RegisterProperty(TDBError,'Message',__DC__GetTDBError__Message,nil);
RegisterProperty(TDBError,'NativeError',__DC__GetTDBError__NativeError,nil);
RegisterProperty(TParamList,'Buffer',__DC__GetTParamList__Buffer,nil);
RegisterProperty(TParamList,'FieldCount',__DC__GetTParamList__FieldCount,nil);
RegisterProperty(TQuery,'Prepared',__DC__GetTQuery__Prepared,__DC__SetTQuery__Prepared);
RegisterProperty(TQuery,'ParamCount',__DC__GetTQuery__ParamCount,nil);
RegisterProperty(TQuery,'Local',__DC__GetTQuery__Local,nil);
RegisterProperty(TQuery,'Text',__DC__GetTQuery__Text,nil);
RegisterProperty(TQuery,'RowsAffected',__DC__GetTQuery__RowsAffected,nil);
RegisterProperty(TQuery,'SQLBinary',__DC__GetTQuery__SQLBinary,__DC__SetTQuery__SQLBinary);
RegisterProperty(TSession,'ConfigMode',__DC__GetTSession__ConfigMode,__DC__SetTSession__ConfigMode);
RegisterProperty(TSession,'DatabaseCount',__DC__GetTSession__DatabaseCount,nil);
RegisterIndexedProperty(TSession,'Databases',1,False,__DC__GetTSession__Databases,nil);
RegisterProperty(TSession,'Locale',__DC__GetTSession__Locale,nil);
RegisterProperty(TSession,'TraceFlags',__DC__GetTSession__TraceFlags,__DC__SetTSession__TraceFlags);
RegisterProperty(TSessionList,'CurrentSession',__DC__GetTSessionList__CurrentSession,__DC__SetTSessionList__CurrentSession);
RegisterProperty(TSessionList,'Count',__DC__GetTSessionList__Count,nil);
RegisterIndexedProperty(TSessionList,'Sessions',1,True,__DC__GetTSessionList__Sessions,nil);
RegisterIndexedProperty(TSessionList,'List',1,False,__DC__GetTSessionList__List,nil);
RegisterProperty(TStoredProc,'ParamCount',__DC__GetTStoredProc__ParamCount,nil);
RegisterProperty(TStoredProc,'Prepared',__DC__GetTStoredProc__Prepared,__DC__SetTStoredProc__Prepared);
RegisterProperty(TTable,'Exists',__DC__GetTTable__Exists,nil);
RegisterProperty(TTable,'IndexFieldCount',__DC__GetTTable__IndexFieldCount,nil);
RegisterIndexedProperty(TTable,'IndexFields',1,False,__DC__GetTTable__IndexFields,__DC__SetTTable__IndexFields);
RegisterProperty(TTable,'KeyExclusive',__DC__GetTTable__KeyExclusive,__DC__SetTTable__KeyExclusive);
RegisterProperty(TTable,'KeyFieldCount',__DC__GetTTable__KeyFieldCount,__DC__SetTTable__KeyFieldCount);
RegisterProperty(TTable,'TableLevel',__DC__GetTTable__TableLevel,__DC__SetTTable__TableLevel);
RegisterProperty(TUpdateSQL,'DatabaseName',__DC__GetTUpdateSQL__DatabaseName,__DC__SetTUpdateSQL__DatabaseName);
RegisterProperty(TUpdateSQL,'DataSet',__DC__GetTUpdateSQL__DataSet,__DC__SetTUpdateSQL__DataSet);
RegisterIndexedProperty(TUpdateSQL,'Query',1,False,__DC__GetTUpdateSQL__Query,nil);
RegisterIndexedProperty(TUpdateSQL,'SQL',1,False,__DC__GetTUpdateSQL__SQL,__DC__SetTUpdateSQL__SQL);
RegisterProperty(TUpdateSQL,'SessionName',__DC__GetTUpdateSQL__SessionName,__DC__SetTUpdateSQL__SessionName);
end;

function __DC__GetDBTables__Session(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(DBTables.Session);
end;

procedure __DC__SetDBTables__Session(Instance : TObject; Params : PVariantArgList);
begin
TObject(DBTables.Session):=(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetDBTables__Sessions(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(DBTables.Sessions);
end;

procedure __DC__SetDBTables__Sessions(Instance : TObject; Params : PVariantArgList);
begin
TObject(DBTables.Sessions):=(VarToObject(OleVariant(Params^[0])));
end;

var __RegisteredVars : TList;
procedure __RegisterVars;
begin
__RegisteredVars := TList.Create;
__RegisteredVars.Add(RegisterVar('Session',__DC__GetDBTables__Session,__DC__SetDBTables__Session));
__RegisteredVars.Add(RegisterVar('Sessions',__DC__GetDBTables__Sessions,__DC__SetDBTables__Sessions));
end;

procedure __UnregisterVars;
begin
__RegisteredVars.Free;
end;

const __ConstNames0 : array[0..63] of string = (
'smTraceBufSize'
,'dbfOpened'
,'dbfPrepared'
,'dbfExecSQL'
,'dbfTable'
,'dbfFieldList'
,'dbfIndexList'
,'dbfStoredProc'
,'dbfExecProc'
,'dbfProcDesc'
,'dbfDatabase'
,'dbfProvider'
,'cfmVirtual'
,'cfmPersistent'
,'cfmSession'
,'dbOpen'
,'dbClose'
,'dbAdd'
,'dbRemove'
,'dbAddAlias'
,'dbDeleteAlias'
,'dbAddDriver'
,'dbDeleteDriver'
,'tfQPrepare'
,'tfQExecute'
,'tfError'
,'tfStmt'
,'tfConnect'
,'tfTransact'
,'tfBlob'
,'tfMisc'
,'tfVendor'
,'tfDataIn'
,'tfDataOut'
,'tiDirtyRead'
,'tiReadCommitted'
,'tiRepeatableRead'
,'rnDbase'
,'rnParadox'
,'rnNotSupported'
,'kiLookup'
,'kiRangeStart'
,'kiRangeEnd'
,'kiCurRangeStart'
,'kiCurRangeEnd'
,'kiSave'
,'batAppend'
,'batUpdate'
,'batAppendUpdate'
,'batDelete'
,'batCopy'
,'ttDefault'
,'ttParadox'
,'ttDBase'
,'ttFoxPro'
,'ttASCII'
,'ltReadLock'
,'ltWriteLock'
,'pbByName'
,'pbByNumber'
,'cmVirtual'
,'cmPersistent'
,'cmSession'
,'cmAll'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,smTraceBufSize));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,dbfOpened));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,dbfPrepared));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,dbfExecSQL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,dbfTable));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,dbfFieldList));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,dbfIndexList));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,dbfStoredProc));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,dbfExecProc));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,dbfProcDesc));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,dbfDatabase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,dbfProvider));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,cfmVirtual));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,cfmPersistent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,cfmSession));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,dbOpen));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,dbClose));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,dbAdd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,dbRemove));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,dbAddAlias));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,dbDeleteAlias));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,dbAddDriver));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,dbDeleteDriver));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,tfQPrepare));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,tfQExecute));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,tfError));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,tfStmt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,tfConnect));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,tfTransact));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,tfBlob));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,tfMisc));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,tfVendor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,tfDataIn));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,tfDataOut));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,tiDirtyRead));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,tiReadCommitted));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,tiRepeatableRead));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,rnDbase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,rnParadox));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,rnNotSupported));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,kiLookup));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,kiRangeStart));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,kiRangeEnd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,kiCurRangeStart));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,kiCurRangeEnd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,kiSave));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,batAppend));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,batUpdate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[48] ,batAppendUpdate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[49] ,batDelete));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[50] ,batCopy));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[51] ,ttDefault));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[52] ,ttParadox));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[53] ,ttDBase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[54] ,ttFoxPro));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[55] ,ttASCII));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[56] ,ltReadLock));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[57] ,ltWriteLock));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[58] ,pbByName));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[59] ,pbByNumber));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[60] ,VarFromSet(cmVirtual, sizeof(cmVirtual))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[61] ,VarFromSet(cmPersistent, sizeof(cmPersistent))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[62] ,VarFromSet(cmSession, sizeof(cmSession))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[63] ,VarFromSet(cmAll, sizeof(cmAll))));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..19] of TClass = (
EDBEngineError,
ENoResultSet,
TBatchMove,
TBDECallback,
TBDEDataSet,
TBlobStream,
TDatabase,
TDataSetUpdateObject,
TDBDataSet,
TDBError,
TIndexFiles,
TNestedTable,
TParamList,
TQuery,
TSession,
TSessionList,
TSQLUpdateObject,
TStoredProc,
TTable,
TUpdateSQL
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..6] of string = (
'TKeyBuffer'
,'TRecInfo'
,'TServerDesc'
,'NativeCompareStr'
,'NativeCompareText'
,'DbiError'
,'Check'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TKeyBuffer_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(_TRecInfo_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[2],Addr(_TServerDesc_)));
RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T4),[
TypeInfoPointer,
TypeInfo(string),
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Integer)],Addr(NativeCompareStr),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T6),[
TypeInfoPointer,
TypeInfo(string),
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Integer)],Addr(NativeCompareText),cRegister);

RegisterProc(nil,MethodNames[5],mtProc,TypeInfo(_T9),[
TypeInfo(DBIResult)],Addr(DbiError),cRegister);

RegisterProc(nil,MethodNames[6],mtProc,TypeInfo(_T10),[
TypeInfo(DBIResult)],Addr(Check),cRegister);

RegisterProc(EDBEngineError,'Create',mtConstructor,TypeInfo(_T12),[
TypeInfo(DBIResult)],Addr(EDBEngineError.Create),cRegister);

RegRegisterMethod(TBatchMove,'Execute',TypeInfo(_T13),NoParams,Addr(TBatchMove.Execute));

RegRegisterMethod(TBDEDataSet,'DestroyHandle',TypeInfo(_T16),NoParams, pointer(604));

RegRegisterMethod(TBDEDataSet,'DestroyLookupCursor',TypeInfo(_T17),NoParams, pointer(608));

RegRegisterMethod(TBDEDataSet,'PrepareCursor',TypeInfo(_T19),NoParams, pointer(616));

RegRegisterMethod(TBDEDataSet,'ApplyUpdates',TypeInfo(_T20),NoParams,Addr(TBDEDataSet.ApplyUpdates));

RegRegisterMethod(TBDEDataSet,'CancelUpdates',TypeInfo(_T21),NoParams,Addr(TBDEDataSet.CancelUpdates));

RegRegisterMethod(TBDEDataSet,'CommitUpdates',TypeInfo(_T22),NoParams,Addr(TBDEDataSet.CommitUpdates));

RegRegisterMethod(TBDEDataSet,'ConstraintsDisabled',TypeInfo(_T24),[TypeInfo(Boolean)],Addr(TBDEDataSet.ConstraintsDisabled));

RegRegisterMethod(TBDEDataSet,'DisableConstraints',TypeInfo(_T25),NoParams,Addr(TBDEDataSet.DisableConstraints));

RegRegisterMethod(TBDEDataSet,'EnableConstraints',TypeInfo(_T26),NoParams,Addr(TBDEDataSet.EnableConstraints));

RegRegisterMethod(TBDEDataSet,'FetchAll',TypeInfo(_T27),NoParams,Addr(TBDEDataSet.FetchAll));

RegRegisterMethod(TBDEDataSet,'FlushBuffers',TypeInfo(_T28),NoParams,Addr(TBDEDataSet.FlushBuffers));

RegRegisterMethod(TBDEDataSet,'GetIndexInfo',TypeInfo(_T29),NoParams,Addr(TBDEDataSet.GetIndexInfo));

RegRegisterMethod(TBDEDataSet,'RevertRecord',TypeInfo(_T30),NoParams,Addr(TBDEDataSet.RevertRecord));

RegisterProc(TBlobStream,'Create',mtConstructor,TypeInfo(_T31),[
TypeInfo(TBlobField),
TypeInfo(TBlobStreamMode)],Addr(TBlobStream.Create),cRegister);

RegRegisterMethod(TBlobStream,'Truncate',TypeInfo(_T32),NoParams,Addr(TBlobStream.Truncate));

RegRegisterMethod(TDatabase,'ApplyUpdates',TypeInfo(_T33),[
ArrayInfo(TypeInfo(TDBDataSet))],Addr(TDatabase.ApplyUpdates));

RegRegisterMethod(TDatabase,'CloseDataSets',TypeInfo(_T34),NoParams,Addr(TDatabase.CloseDataSets));

RegRegisterMethod(TDatabase,'Commit',TypeInfo(_T35),NoParams,Addr(TDatabase.Commit));

RegRegisterMethod(TDatabase,'FlushSchemaCache',TypeInfo(_T37),[
TypeInfo(string)],Addr(TDatabase.FlushSchemaCache));

RegRegisterMethod(TDatabase,'GetFieldNames',TypeInfo(_T38),[
TypeInfo(string),
TypeInfo(TStrings)],Addr(TDatabase.GetFieldNames));

RegisterProc(TDatabase,'GetTableNames',mtScriptMethod,TypeInfo(_T39),[
TypeInfo(TStrings),
TypeInfo(Boolean)],Addr(__TDatabase__GetTableNames__Wrapper),cRegister);

RegRegisterMethod(TDatabase,'Rollback',TypeInfo(_T40),NoParams,Addr(TDatabase.Rollback));

RegRegisterMethod(TDatabase,'StartTransaction',TypeInfo(_T41),NoParams,Addr(TDatabase.StartTransaction));

RegRegisterMethod(TDatabase,'ValidateName',TypeInfo(_T42),[
TypeInfo(string)],Addr(TDatabase.ValidateName));

RegRegisterMethod(TDataSetUpdateObject,'GetDataSet',TypeInfo(_T43),[TypeInfo(TDataSet)], pointer(48));

RegRegisterMethod(TDataSetUpdateObject,'SetDataSet',TypeInfo(_T44),[
TypeInfo(TDataSet)], pointer(52));

RegRegisterMethod(TDataSetUpdateObject,'Apply',TypeInfo(_T45),[
TypeInfo(TUpdateKind)], pointer(56));

RegRegisterMethod(TDBDataSet,'Disconnect',TypeInfo(_T46),NoParams, pointer(620));

RegRegisterMethod(TDBDataSet,'SetDBFlag',TypeInfo(_T47),[
TypeInfo(Integer),
TypeInfo(Boolean),TypeInfo(Boolean)], pointer(624));

RegRegisterMethod(TDBDataSet,'CheckOpen',TypeInfo(_T48),[
TypeInfo(DBIResult),TypeInfo(Boolean)],Addr(TDBDataSet.CheckOpen));

RegRegisterMethod(TDBDataSet,'CloseDatabase',TypeInfo(_T49),[
TypeInfo(TDatabase)],Addr(TDBDataSet.CloseDatabase));

RegRegisterMethod(TDBDataSet,'OpenDatabase',TypeInfo(_T50),[TypeInfo(TDatabase)],Addr(TDBDataSet.OpenDatabase));

RegisterProc(TIndexFiles,'Create',mtConstructor,TypeInfo(_T52),[
TypeInfo(TTable)],Addr(TIndexFiles.Create),cRegister);

RegisterProc(TParamList,'Create',mtConstructor,TypeInfo(_T53),[
TypeInfo(TStrings)],Addr(TParamList.Create),cRegister);

RegRegisterMethod(TQuery,'FreeStatement',TypeInfo(_T54),NoParams, pointer(628));

RegRegisterMethod(TQuery,'ExecSQL',TypeInfo(_T56),NoParams,Addr(TQuery.ExecSQL));

RegRegisterMethod(TQuery,'ParamByName',TypeInfo(_T57),[
TypeInfo(string),TypeInfo(TParam)],Addr(TQuery.ParamByName));

RegRegisterMethod(TQuery,'Prepare',TypeInfo(_T58),NoParams,Addr(TQuery.Prepare));

RegRegisterMethod(TQuery,'UnPrepare',TypeInfo(_T59),NoParams,Addr(TQuery.UnPrepare));

RegRegisterMethod(TSession,'AddAlias',TypeInfo(_T60),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TStrings)],Addr(TSession.AddAlias));

RegRegisterMethod(TSession,'AddDriver',TypeInfo(_T61),[
TypeInfo(string),
TypeInfo(TStrings)],Addr(TSession.AddDriver));

RegRegisterMethod(TSession,'AddStandardAlias',TypeInfo(_T62),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(string)],Addr(TSession.AddStandardAlias));

RegRegisterMethod(TSession,'AddPassword',TypeInfo(_T63),[
TypeInfo(string)],Addr(TSession.AddPassword));

RegRegisterMethod(TSession,'Close',TypeInfo(_T64),NoParams,Addr(TSession.Close));

RegRegisterMethod(TSession,'CloseDatabase',TypeInfo(_T65),[
TypeInfo(TDatabase)],Addr(TSession.CloseDatabase));

RegRegisterMethod(TSession,'DeleteAlias',TypeInfo(_T66),[
TypeInfo(string)],Addr(TSession.DeleteAlias));

RegRegisterMethod(TSession,'DeleteDriver',TypeInfo(_T67),[
TypeInfo(string)],Addr(TSession.DeleteDriver));

RegRegisterMethod(TSession,'DropConnections',TypeInfo(_T68),NoParams,Addr(TSession.DropConnections));

RegRegisterMethod(TSession,'FindDatabase',TypeInfo(_T69),[
TypeInfo(string),TypeInfo(TDatabase)],Addr(TSession.FindDatabase));

RegRegisterMethod(TSession,'GetAliasNames',TypeInfo(_T70),[
TypeInfo(TStrings)],Addr(TSession.GetAliasNames));

RegRegisterMethod(TSession,'GetAliasParams',TypeInfo(_T71),[
TypeInfo(string),
TypeInfo(TStrings)],Addr(TSession.GetAliasParams));

RegRegisterMethod(TSession,'GetAliasDriverName',TypeInfo(_T72),[
TypeInfo(string),TypeInfo(string)],Addr(TSession.GetAliasDriverName));

RegRegisterMethod(TSession,'GetConfigParams',TypeInfo(_T73),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TStrings)],Addr(TSession.GetConfigParams));

RegRegisterMethod(TSession,'GetDatabaseNames',TypeInfo(_T74),[
TypeInfo(TStrings)],Addr(TSession.GetDatabaseNames));

RegRegisterMethod(TSession,'GetDriverNames',TypeInfo(_T75),[
TypeInfo(TStrings)],Addr(TSession.GetDriverNames));

RegRegisterMethod(TSession,'GetDriverParams',TypeInfo(_T76),[
TypeInfo(string),
TypeInfo(TStrings)],Addr(TSession.GetDriverParams));

RegRegisterMethod(TSession,'GetFieldNames',TypeInfo(_T77),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TStrings)],Addr(TSession.GetFieldNames));

RegRegisterMethod(TSession,'GetPassword',TypeInfo(_T78),[TypeInfo(Boolean)],Addr(TSession.GetPassword));

RegRegisterMethod(TSession,'GetTableNames',TypeInfo(_T79),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Boolean),
TypeInfo(Boolean),
TypeInfo(TStrings)],Addr(TSession.GetTableNames));

RegRegisterMethod(TSession,'GetStoredProcNames',TypeInfo(_T80),[
TypeInfo(string),
TypeInfo(TStrings)],Addr(TSession.GetStoredProcNames));

RegRegisterMethod(TSession,'IsAlias',TypeInfo(_T81),[
TypeInfo(string),TypeInfo(Boolean)],Addr(TSession.IsAlias));

RegRegisterMethod(TSession,'ModifyAlias',TypeInfo(_T82),[
TypeInfo(string),
TypeInfo(TStrings)],Addr(TSession.ModifyAlias));

RegRegisterMethod(TSession,'ModifyDriver',TypeInfo(_T83),[
TypeInfo(string),
TypeInfo(TStrings)],Addr(TSession.ModifyDriver));

RegRegisterMethod(TSession,'Open',TypeInfo(_T84),NoParams,Addr(TSession.Open));

RegRegisterMethod(TSession,'OpenDatabase',TypeInfo(_T85),[
TypeInfo(string),TypeInfo(TDatabase)],Addr(TSession.OpenDatabase));

RegRegisterMethod(TSession,'RemoveAllPasswords',TypeInfo(_T86),NoParams,Addr(TSession.RemoveAllPasswords));

RegRegisterMethod(TSession,'RemovePassword',TypeInfo(_T87),[
TypeInfo(string)],Addr(TSession.RemovePassword));

RegRegisterMethod(TSession,'SaveConfigFile',TypeInfo(_T88),NoParams,Addr(TSession.SaveConfigFile));

RegisterProc(TSessionList,'Create',mtConstructor,TypeInfo(_T89),NoParams,Addr(TSessionList.Create),cRegister);

RegRegisterMethod(TSessionList,'FindSession',TypeInfo(_T90),[
TypeInfo(string),TypeInfo(TSession)],Addr(TSessionList.FindSession));

RegRegisterMethod(TSessionList,'GetSessionNames',TypeInfo(_T91),[
TypeInfo(TStrings)],Addr(TSessionList.GetSessionNames));

RegRegisterMethod(TSessionList,'OpenSession',TypeInfo(_T92),[
TypeInfo(string),TypeInfo(TSession)],Addr(TSessionList.OpenSession));

RegRegisterMethod(TSQLUpdateObject,'GetSQL',TypeInfo(_T93),[
TypeInfo(TUpdateKind),TypeInfo(TStrings)], pointer(60));

RegRegisterMethod(TStoredProc,'CopyParams',TypeInfo(_T94),[
TypeInfo(TParams)],Addr(TStoredProc.CopyParams));

RegRegisterMethod(TStoredProc,'DescriptionsAvailable',TypeInfo(_T95),[TypeInfo(Boolean)],Addr(TStoredProc.DescriptionsAvailable));

RegRegisterMethod(TStoredProc,'ExecProc',TypeInfo(_T96),NoParams,Addr(TStoredProc.ExecProc));

RegRegisterMethod(TStoredProc,'ParamByName',TypeInfo(_T97),[
TypeInfo(string),TypeInfo(TParam)],Addr(TStoredProc.ParamByName));

RegRegisterMethod(TStoredProc,'Prepare',TypeInfo(_T98),NoParams,Addr(TStoredProc.Prepare));

RegRegisterMethod(TStoredProc,'GetResults',TypeInfo(_T99),NoParams,Addr(TStoredProc.GetResults));

RegRegisterMethod(TStoredProc,'UnPrepare',TypeInfo(_T100),NoParams,Addr(TStoredProc.UnPrepare));

RegRegisterMethod(TTable,'BatchMove',TypeInfo(_T101),[
TypeInfo(TBDEDataSet),
TypeInfo(TBatchMode),TypeInfo(Longint)],Addr(TTable.BatchMove));

RegisterProc(TTable,'AddIndex',mtScriptMethod,TypeInfo(_T102),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TIndexOptions),
TypeInfo(string)],Addr(__TTable__AddIndex__Wrapper),cRegister);

RegRegisterMethod(TTable,'ApplyRange',TypeInfo(_T103),NoParams,Addr(TTable.ApplyRange));

RegRegisterMethod(TTable,'CancelRange',TypeInfo(_T104),NoParams,Addr(TTable.CancelRange));

RegRegisterMethod(TTable,'CloseIndexFile',TypeInfo(_T105),[
TypeInfo(string)],Addr(TTable.CloseIndexFile));

RegRegisterMethod(TTable,'CreateTable',TypeInfo(_T106),NoParams,Addr(TTable.CreateTable));

RegRegisterMethod(TTable,'DeleteIndex',TypeInfo(_T107),[
TypeInfo(string)],Addr(TTable.DeleteIndex));

RegRegisterMethod(TTable,'DeleteTable',TypeInfo(_T108),NoParams,Addr(TTable.DeleteTable));

RegRegisterMethod(TTable,'EditKey',TypeInfo(_T109),NoParams,Addr(TTable.EditKey));

RegRegisterMethod(TTable,'EditRangeEnd',TypeInfo(_T110),NoParams,Addr(TTable.EditRangeEnd));

RegRegisterMethod(TTable,'EditRangeStart',TypeInfo(_T111),NoParams,Addr(TTable.EditRangeStart));

RegRegisterMethod(TTable,'EmptyTable',TypeInfo(_T112),NoParams,Addr(TTable.EmptyTable));

RegRegisterMethod(TTable,'FindKey',TypeInfo(_T113),[
TypeInfoArrayOfConst,TypeInfo(Boolean)],Addr(TTable.FindKey));

RegRegisterMethod(TTable,'FindNearest',TypeInfo(_T114),[
TypeInfoArrayOfConst],Addr(TTable.FindNearest));

RegRegisterMethod(TTable,'GetIndexNames',TypeInfo(_T115),[
TypeInfo(TStrings)],Addr(TTable.GetIndexNames));

RegRegisterMethod(TTable,'GotoCurrent',TypeInfo(_T116),[
TypeInfo(TTable)],Addr(TTable.GotoCurrent));

RegRegisterMethod(TTable,'GotoKey',TypeInfo(_T117),[TypeInfo(Boolean)],Addr(TTable.GotoKey));

RegRegisterMethod(TTable,'GotoNearest',TypeInfo(_T118),NoParams,Addr(TTable.GotoNearest));

RegRegisterMethod(TTable,'LockTable',TypeInfo(_T119),[
TypeInfo(TLockType)],Addr(TTable.LockTable));

RegRegisterMethod(TTable,'OpenIndexFile',TypeInfo(_T120),[
TypeInfo(string)],Addr(TTable.OpenIndexFile));

RegRegisterMethod(TTable,'RenameTable',TypeInfo(_T121),[
TypeInfo(string)],Addr(TTable.RenameTable));

RegRegisterMethod(TTable,'SetKey',TypeInfo(_T122),NoParams,Addr(TTable.SetKey));

RegRegisterMethod(TTable,'SetRange',TypeInfo(_T123),[
TypeInfoArrayOfConst,
TypeInfoArrayOfConst],Addr(TTable.SetRange));

RegRegisterMethod(TTable,'SetRangeEnd',TypeInfo(_T124),NoParams,Addr(TTable.SetRangeEnd));

RegRegisterMethod(TTable,'SetRangeStart',TypeInfo(_T125),NoParams,Addr(TTable.SetRangeStart));

RegRegisterMethod(TTable,'UnlockTable',TypeInfo(_T126),[
TypeInfo(TLockType)],Addr(TTable.UnlockTable));

RegRegisterMethod(TUpdateSQL,'ExecSQL',TypeInfo(_T127),[
TypeInfo(TUpdateKind)], pointer(64));

RegRegisterMethod(TUpdateSQL,'SetParams',TypeInfo(_T128),[
TypeInfo(TUpdateKind)], pointer(68));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'AnsiToNative',mtProc,TypeInfo(_T0),[
TypeInfoPointer,
TypeInfo(string),
TypeInfoPChar,
TypeInfo(Integer),TypeInfoPChar],Addr(AnsiToNative),cRegister)}

{RegisterProc(nil,'NativeToAnsi',mtProc,TypeInfo(_T1),[
TypeInfoPointer,
TypeInfoPChar,
TypeInfo(string)],Addr(NativeToAnsi),cRegister)}

{RegisterProc(nil,'AnsiToNativeBuf',mtProc,TypeInfo(_T2),[
TypeInfoPointer,
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(Integer)],Addr(AnsiToNativeBuf),cRegister)}

{RegisterProc(nil,'NativeToAnsiBuf',mtProc,TypeInfo(_T3),[
TypeInfoPointer,
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(Integer)],Addr(NativeToAnsiBuf),cRegister)}

{RegisterProc(nil,'NativeCompareStrBuf',mtProc,TypeInfo(_T5),[
TypeInfoPointer,
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(Integer),TypeInfo(Integer)],Addr(NativeCompareStrBuf),cRegister)}

{RegisterProc(nil,'NativeCompareTextBuf',mtProc,TypeInfo(_T7),[
TypeInfoPointer,
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(Integer),TypeInfo(Integer)],Addr(NativeCompareTextBuf),cRegister)}

{RegisterProc(nil,'GetFieldSource',mtProc,TypeInfo(_T8),[
TypeInfo(TDataSet),
TypeInfo(DataSources),TypeInfo(Boolean)],Addr(GetFieldSource),cRegister)}

{RegisterProc(nil,'RegisterBDEInitProc',mtProc,TypeInfo(_T11),[
TypeInfo(TBDEInitProc)],Addr(RegisterBDEInitProc),cRegister)}

{RegisterProc(TBDECallback,'Create',mtConstructor,TypeInfo(_T14),[
TypeInfo(TObject),
TypeInfoPointer,
TypeInfo(CBType),
TypeInfoPointer,
TypeInfo(Integer),
TypeInfo(TBDECallbackEvent),
TypeInfo(Boolean)],Addr(TBDECallback.Create),cRegister)}

{RegRegisterMethod(TBDEDataSet,'CreateHandle',TypeInfo(_T15),[TypeInfoPointer], pointer(600))}

{RegRegisterMethod(TBDEDataSet,'GetLookupCursor',TypeInfo(_T18),[
TypeInfo(string),
TypeInfo(Boolean),TypeInfoPointer], pointer(612))}

{RegisterProc(TBDEDataSet,'ConstraintCallBack',mtMethod,TypeInfo(_T23),[
TypeInfo(DsInfoReq),
TypeInfo(DataSources),TypeInfo(DBIResult)],Addr(TBDEDataSet.ConstraintCallBack),cStdCall)}

{RegisterProc(TDBError,'Create',mtConstructor,TypeInfo(_T51),[
TypeInfo(EDBEngineError),
TypeInfo(DBIResult),
TypeInfo(Longint),
TypeInfoPChar],Addr(TDBError.Create),cRegister)}

{RegRegisterMethod(TQuery,'GetStatementHandle',TypeInfo(_T55),[
TypeInfoPChar], pointer(632))}

RegisterEvent(TypeInfo(TBDECallbackEvent),[
TypeInfoPointer,TypeInfo(CBRType)]);

RegisterEvent(TypeInfo(TDatabaseLoginEvent),[
TypeInfo(TDatabase),
TypeInfo(TStrings)]);

RegisterEvent(TypeInfo(TDatabaseNotifyEvent),[
TypeInfo(TDatabaseEvent),
TypeInfoUntyped]);

RegisterEvent(TypeInfo(TPasswordEvent),[
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
