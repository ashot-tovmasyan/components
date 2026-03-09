{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit DBCLIENT_D6;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  dcscript,
  dcsystem,
  dcdreamlib,
  Windows,
  SysUtils,
  Variants,
  Classes,
  DB,
  DSIntf,
  DBCommon,
  Midas,
  SqlTimSt,
  ActiveX,
  DBClient;
function ConvertTKeyBufferToVariant(var R : TKeyBuffer) : OleVariant;
function ConvertVariantToTKeyBuffer(const V : OleVariant) : TKeyBuffer;
function ConvertTRecInfoToVariant(var R : TRecInfo) : OleVariant;
function ConvertVariantToTRecInfo(const V : OleVariant) : TRecInfo;
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
procedure setBookmarkFlag(const val : TBookmarkFlag);
function getBookmarkFlag : TBookmarkFlag;
property BookmarkFlag : TBookmarkFlag read getBookmarkFlag write setBookmarkFlag;
end;
type
_T0 = function (p0 : TParams;
p1 : TParamTypes): OleVariant of object;

_T1 = procedure (const p0 : OleVariant;
p1 : TParams) of object;

_T2 = procedure (p0 : string;
p1 : DBResult) of object;

_T3 = procedure (p0 : string;
p1 : string;
p2 : DBResult;
p3 : DBResult) of object;

_T4 = procedure (p0 : TAggregates;
p1 : TCustomClientDataSet) of object;

_T5 = function : Variant of object;

_T6 = procedure (p0 : TPersistent) of object;

_T7 = function : TAggregate of object;

_T8 = procedure  of object;

_T9 = function (const p0 : string): TAggregate of object;

_T10 = function (const p0 : string): Integer of object;

_T11 = procedure (p0 : TBlobField;
p1 : TBlobStreamMode) of object;

_T12 = _T8;

_T13 = procedure (var p0 : OleVariant) of object;

_T14 = _T13;

_T15 = function (p0 : OleVariant;
p1 : Integer;
out p2 : Integer): OleVariant of object;

_T16 = _T13;

_T17 = _T13;

_T18 = _T13;

_T19 = _T13;

_T20 = function (p0 : Integer;
out p1 : Integer;
p2 : Integer;
const p3 : WideString;
p4 : OleVariant): OleVariant of object;

_T21 = _T13;

_T22 = _T13;

_T23 = function (p0 : OleVariant;
p1 : Integer): OleVariant of object;

_T24 = _T13;

_T25 = _T13;

_T26 = procedure (p0 : OleVariant) of object;

_T27 = procedure (const p0 : OleVariant;
p1 : Boolean) of object;

_T28 = _T8;

_T29 = _T8;

{_T30 = function : IAppServer of object;}

_T31 = function : TCustomRemoteServer of object;

_T32 = procedure (p0 : TAggregates) of object;

{_T33 = procedure (p0 : IAppServer) of object;}

_T34 = procedure (p0 : string) of object;

_T35 = procedure (p0 : TCustomRemoteServer) of object;

_T36 = procedure (const p0 : string;
const p1 : string;
p2 : TIndexOptions;
const p3 : string;
const p4 : string;
const p5 : Integer) of object;

_T37 = _T27;

_T38 = _T8;

_T39 = function (p0 : Integer): Integer of object;

_T40 = _T8;

_T41 = _T8;

_T42 = _T8;

_T43 = procedure (p0 : TCustomClientDataSet;
p1 : Boolean;
p2 : Boolean) of object;

_T44 = function : Boolean of object;

_T45 = function (p0 : OleVariant): OleVariant of object;

_T46 = procedure (const p0 : string) of object;

_T47 = _T8;

_T48 = _T8;

_T49 = _T8;

_T50 = _T8;

_T51 = _T8;

_T52 = _T8;

_T53 = _T8;

_T54 = _T8;

_T55 = _T8;

_T56 = _T8;

_T57 = _T8;

_T58 = function (const p0 : Array of Const): Boolean of object;

_T59 = procedure (const p0 : Array of Const) of object;

_T60 = function (p0 : Integer): TGroupPosInds of object;

_T61 = _T34;

_T62 = procedure (p0 : TStrings) of object;

_T63 = function : Integer of object;

_T64 = function (const p0 : string): OleVariant of object;

_T65 = procedure (p0 : TCustomClientDataSet) of object;

_T66 = _T44;

_T67 = _T8;

_T68 = _T46;

_T69 = procedure (p0 : TStream) of object;

_T70 = _T8;

_T71 = function (const p0 : OleVariant): Boolean of object;

_T72 = _T8;

_T73 = procedure (const p0 : string;
p1 : TDataPacketFormat) of object;

_T74 = procedure (p0 : TStream;
p1 : TDataPacketFormat) of object;

{_T75 = procedure (p0 : PChar;
p1 : PChar;
p2 : PChar) of object;}

_T76 = _T8;

_T77 = procedure (const p0 : string;
const p1 : OleVariant;
p2 : Boolean) of object;

_T78 = procedure (p0 : TComponent) of object;

_T79 = procedure (const p0 : Array of Const;
const p1 : Array of Const) of object;

_T80 = _T8;

_T81 = _T8;

_T82 = function (p0 : Boolean): Boolean of object;

_T83 = _T5;

_T84 = procedure (p0 : Variant) of object;

_T85 = function : OleVariant of object;

{_T86 = procedure (p0 : TGetStrProc) of object;}

{_T87 = function : IAppServer of object;}

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
procedure __TRecInfo__Wrapper.setBookmarkFlag(const val : TBookmarkFlag);
begin
TRecInfo(GetRecordPtr^).BookmarkFlag := val;
end;
function __TRecInfo__Wrapper.getBookmarkFlag : TBookmarkFlag;
begin
result := TRecInfo(GetRecordPtr^).BookmarkFlag;
end;
function _TKeyBuffer_ : IDispatch;
begin
  result := __TKeyBuffer__Wrapper.Create;
end;
function _TRecInfo_ : IDispatch;
begin
  result := __TRecInfo__Wrapper.Create;
end;
function ____PackageParams__Wrapper(cArgs : integer; pArgs : PArgList) : OleVariant;
var
__s1 : TParamTypes;
begin
if cArgs > 1 then
VarToSet(__s1,OleVariant(pargs^[1]),SizeOf(TParamTypes));
case cArgs of
1:
begin
result := PackageParams(TParams(VarToObject(OleVariant(pargs^[0]))));
end;
2:
begin
result := PackageParams(TParams(VarToObject(OleVariant(pargs^[1]))),__s1);
end;
end
end;

procedure __TCustomClientDataSet__AddIndex__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
var
__s2 : TIndexOptions;
begin
if cArgs > 2 then
VarToSet(__s2,OleVariant(pargs^[2]),SizeOf(TIndexOptions));
case cArgs of
3:
begin
TCustomClientDataSet(__Instance).AddIndex(OleVariant(pargs^[2]),OleVariant(pargs^[1]),__s2);
end;
4:
begin
TCustomClientDataSet(__Instance).AddIndex(OleVariant(pargs^[3]),OleVariant(pargs^[2]),__s2,OleVariant(pargs^[0]));
end;
5:
begin
TCustomClientDataSet(__Instance).AddIndex(OleVariant(pargs^[4]),OleVariant(pargs^[3]),__s2,OleVariant(pargs^[1]),OleVariant(pargs^[0]));
end;
6:
begin
TCustomClientDataSet(__Instance).AddIndex(OleVariant(pargs^[5]),OleVariant(pargs^[4]),__s2,OleVariant(pargs^[2]),OleVariant(pargs^[1]),OleVariant(pargs^[0]));
end;
end
end;

procedure __TCustomClientDataSet__CloneCursor__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
2:
begin
TCustomClientDataSet(__Instance).CloneCursor(TCustomClientDataSet(VarToObject(OleVariant(pargs^[1]))),OleVariant(pargs^[0]));
end;
3:
begin
TCustomClientDataSet(__Instance).CloneCursor(TCustomClientDataSet(VarToObject(OleVariant(pargs^[2]))),OleVariant(pargs^[1]),OleVariant(pargs^[0]));
end;
end
end;

procedure __TCustomClientDataSet__LoadFromFile__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
0:
begin
TCustomClientDataSet(__Instance).LoadFromFile;
end;
1:
begin
TCustomClientDataSet(__Instance).LoadFromFile(OleVariant(pargs^[0]));
end;
end
end;

procedure __TCustomClientDataSet__SaveToFile__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
0:
begin
TCustomClientDataSet(__Instance).SaveToFile;
end;
1:
begin
TCustomClientDataSet(__Instance).SaveToFile(OleVariant(pargs^[0]));
end;
2:
begin
TCustomClientDataSet(__Instance).SaveToFile(OleVariant(pargs^[1]),OleVariant(pargs^[0]));
end;
end
end;

procedure __TCustomClientDataSet__SaveToStream__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
1:
begin
TCustomClientDataSet(__Instance).SaveToStream(TStream(VarToObject(OleVariant(pargs^[0]))));
end;
2:
begin
TCustomClientDataSet(__Instance).SaveToStream(TStream(VarToObject(OleVariant(pargs^[1]))),OleVariant(pargs^[0]));
end;
end
end;

procedure __TCustomClientDataSet__SetOptionalParam__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
2:
begin
TCustomClientDataSet(__Instance).SetOptionalParam(OleVariant(pargs^[1]),OleVariant(pargs^[0]));
end;
3:
begin
TCustomClientDataSet(__Instance).SetOptionalParam(OleVariant(pargs^[2]),OleVariant(pargs^[1]),OleVariant(pargs^[0]));
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
function __DC__GetEDBClient__ErrorCode(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := EDBClient(Instance).ErrorCode;
end;

function __DC__GetEReconcileError__Context(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := EReconcileError(Instance).Context;
end;

function __DC__GetEReconcileError__PreviousError(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := EReconcileError(Instance).PreviousError;
end;

function __DC__GetTAggregate__AggHandle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TAggregate(Instance).AggHandle;
end;

procedure __DC__SetTAggregate__AggHandle(Instance : TObject; Params : PVariantArgList);
begin
TAggregate(Instance).AggHandle:=OleVariant(Params^[0]);
end;

function __DC__GetTAggregate__InUse(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TAggregate(Instance).InUse;
end;

procedure __DC__SetTAggregate__InUse(Instance : TObject; Params : PVariantArgList);
begin
TAggregate(Instance).InUse:=OleVariant(Params^[0]);
end;

function __DC__GetTAggregate__DataSet(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TAggregate(Instance).DataSet);
end;

function __DC__GetTAggregate__DataSize(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TAggregate(Instance).DataSize;
end;

function __DC__GetTAggregate__DataType(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TAggregate(Instance).DataType;
end;

function __DC__GetTAggregates__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TAggregates(Instance).Items[OleVariant(Params^[0])]);
end;

procedure __DC__SetTAggregates__Items(Instance : TObject; Params : PVariantArgList);
begin
TAggregates(Instance).Items[OleVariant(Params^[1])]:=TAggregate(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomClientDataSet__HasAppServer(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomClientDataSet(Instance).HasAppServer;
end;

function __DC__GetTCustomClientDataSet__ActiveAggs(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomClientDataSet(Instance).ActiveAggs[OleVariant(Params^[0])]);
end;

function __DC__GetTCustomClientDataSet__ChangeCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomClientDataSet(Instance).ChangeCount;
end;

function __DC__GetTCustomClientDataSet__CloneSource(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomClientDataSet(Instance).CloneSource);
end;

function __DC__GetTCustomClientDataSet__Data(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomClientDataSet(Instance).Data;
end;

procedure __DC__SetTCustomClientDataSet__Data(Instance : TObject; Params : PVariantArgList);
begin
TCustomClientDataSet(Instance).Data:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomClientDataSet__XMLData(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomClientDataSet(Instance).XMLData;
end;

procedure __DC__SetTCustomClientDataSet__XMLData(Instance : TObject; Params : PVariantArgList);
begin
TCustomClientDataSet(Instance).XMLData:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomClientDataSet__DataSize(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomClientDataSet(Instance).DataSize;
end;

function __DC__GetTCustomClientDataSet__Delta(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomClientDataSet(Instance).Delta;
end;

function __DC__GetTCustomClientDataSet__GroupingLevel(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomClientDataSet(Instance).GroupingLevel;
end;

function __DC__GetTCustomClientDataSet__IndexFieldCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomClientDataSet(Instance).IndexFieldCount;
end;

function __DC__GetTCustomClientDataSet__IndexFields(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomClientDataSet(Instance).IndexFields[OleVariant(Params^[0])]);
end;

procedure __DC__SetTCustomClientDataSet__IndexFields(Instance : TObject; Params : PVariantArgList);
begin
TCustomClientDataSet(Instance).IndexFields[OleVariant(Params^[1])]:=TField(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomClientDataSet__KeyExclusive(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomClientDataSet(Instance).KeyExclusive;
end;

procedure __DC__SetTCustomClientDataSet__KeyExclusive(Instance : TObject; Params : PVariantArgList);
begin
TCustomClientDataSet(Instance).KeyExclusive:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomClientDataSet__KeyFieldCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomClientDataSet(Instance).KeyFieldCount;
end;

procedure __DC__SetTCustomClientDataSet__KeyFieldCount(Instance : TObject; Params : PVariantArgList);
begin
TCustomClientDataSet(Instance).KeyFieldCount:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomClientDataSet__KeySize(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomClientDataSet(Instance).KeySize;
end;

function __DC__GetTCustomClientDataSet__LogChanges(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomClientDataSet(Instance).LogChanges;
end;

procedure __DC__SetTCustomClientDataSet__LogChanges(Instance : TObject; Params : PVariantArgList);
begin
TCustomClientDataSet(Instance).LogChanges:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomClientDataSet__SavePoint(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomClientDataSet(Instance).SavePoint;
end;

procedure __DC__SetTCustomClientDataSet__SavePoint(Instance : TObject; Params : PVariantArgList);
begin
TCustomClientDataSet(Instance).SavePoint:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomClientDataSet__StatusFilter(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TUpdateStatusSet;
begin
tmp := TCustomClientDataSet(Instance).StatusFilter;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTCustomClientDataSet__StatusFilter(Instance : TObject; Params : PVariantArgList);
var
  tmp : TUpdateStatusSet;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TCustomClientDataSet(Instance).StatusFilter:=tmp;
end;

function __DC__GetTCustomRemoteServer__AppServer(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomRemoteServer(Instance).AppServer;
end;

procedure __RegisterProps;
begin
RegisterProperty(EDBClient,'ErrorCode',__DC__GetEDBClient__ErrorCode,nil);
RegisterProperty(EReconcileError,'Context',__DC__GetEReconcileError__Context,nil);
RegisterProperty(EReconcileError,'PreviousError',__DC__GetEReconcileError__PreviousError,nil);
RegisterProperty(TAggregate,'AggHandle',__DC__GetTAggregate__AggHandle,__DC__SetTAggregate__AggHandle);
RegisterProperty(TAggregate,'InUse',__DC__GetTAggregate__InUse,__DC__SetTAggregate__InUse);
RegisterProperty(TAggregate,'DataSet',__DC__GetTAggregate__DataSet,nil);
RegisterProperty(TAggregate,'DataSize',__DC__GetTAggregate__DataSize,nil);
RegisterProperty(TAggregate,'DataType',__DC__GetTAggregate__DataType,nil);
RegisterIndexedProperty(TAggregates,'Items',1,True,__DC__GetTAggregates__Items,__DC__SetTAggregates__Items);
RegisterProperty(TCustomClientDataSet,'HasAppServer',__DC__GetTCustomClientDataSet__HasAppServer,nil);
RegisterIndexedProperty(TCustomClientDataSet,'ActiveAggs',1,False,__DC__GetTCustomClientDataSet__ActiveAggs,nil);
RegisterProperty(TCustomClientDataSet,'ChangeCount',__DC__GetTCustomClientDataSet__ChangeCount,nil);
RegisterProperty(TCustomClientDataSet,'CloneSource',__DC__GetTCustomClientDataSet__CloneSource,nil);
RegisterProperty(TCustomClientDataSet,'Data',__DC__GetTCustomClientDataSet__Data,__DC__SetTCustomClientDataSet__Data);
RegisterProperty(TCustomClientDataSet,'XMLData',__DC__GetTCustomClientDataSet__XMLData,__DC__SetTCustomClientDataSet__XMLData);
RegisterProperty(TCustomClientDataSet,'DataSize',__DC__GetTCustomClientDataSet__DataSize,nil);
RegisterProperty(TCustomClientDataSet,'Delta',__DC__GetTCustomClientDataSet__Delta,nil);
RegisterProperty(TCustomClientDataSet,'GroupingLevel',__DC__GetTCustomClientDataSet__GroupingLevel,nil);
RegisterProperty(TCustomClientDataSet,'IndexFieldCount',__DC__GetTCustomClientDataSet__IndexFieldCount,nil);
RegisterIndexedProperty(TCustomClientDataSet,'IndexFields',1,False,__DC__GetTCustomClientDataSet__IndexFields,__DC__SetTCustomClientDataSet__IndexFields);
RegisterProperty(TCustomClientDataSet,'KeyExclusive',__DC__GetTCustomClientDataSet__KeyExclusive,__DC__SetTCustomClientDataSet__KeyExclusive);
RegisterProperty(TCustomClientDataSet,'KeyFieldCount',__DC__GetTCustomClientDataSet__KeyFieldCount,__DC__SetTCustomClientDataSet__KeyFieldCount);
RegisterProperty(TCustomClientDataSet,'KeySize',__DC__GetTCustomClientDataSet__KeySize,nil);
RegisterProperty(TCustomClientDataSet,'LogChanges',__DC__GetTCustomClientDataSet__LogChanges,__DC__SetTCustomClientDataSet__LogChanges);
RegisterProperty(TCustomClientDataSet,'SavePoint',__DC__GetTCustomClientDataSet__SavePoint,__DC__SetTCustomClientDataSet__SavePoint);
RegisterProperty(TCustomClientDataSet,'StatusFilter',__DC__GetTCustomClientDataSet__StatusFilter,__DC__SetTCustomClientDataSet__StatusFilter);
RegisterProperty(TCustomRemoteServer,'AppServer',__DC__GetTCustomRemoteServer__AppServer,nil);
end;

const __ConstNames0 : array[0..23] of string = (
'kiLookup'
,'kiRangeStart'
,'kiRangeEnd'
,'kiCurRangeStart'
,'kiCurRangeEnd'
,'kiSave'
,'dfBinary'
,'dfXML'
,'dfXMLUTF8'
,'raSkip'
,'raAbort'
,'raMerge'
,'raCorrect'
,'raCancel'
,'raRefresh'
,'doDisableInserts'
,'doDisableDeletes'
,'doDisableEdits'
,'doNoResetCall'
,'foRecord'
,'foBlobs'
,'foDetails'
,'AllParamTypes'
,'AllRecords'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,kiLookup));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,kiRangeStart));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,kiRangeEnd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,kiCurRangeStart));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,kiCurRangeEnd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,kiSave));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,dfBinary));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,dfXML));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,dfXMLUTF8));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,raSkip));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,raAbort));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,raMerge));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,raCorrect));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,raCancel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,raRefresh));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,doDisableInserts));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,doDisableDeletes));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,doDisableEdits));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,doNoResetCall));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,foRecord));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,foBlobs));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,foDetails));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,VarFromSet(AllParamTypes, sizeof(AllParamTypes))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,AllRecords));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..8] of TClass = (
EDBClient,
EReconcileError,
TAggregate,
TAggregates,
TClientBlobStream,
TClientDataSet,
TConnectionBroker,
TCustomClientDataSet,
TCustomRemoteServer
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..3] of string = (
'TKeyBuffer'
,'TRecInfo'
,'PackageParams'
,'UnpackParams'
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
RegisterProc(nil,MethodNames[2],mtScriptProc,TypeInfo(_T0),[
TypeInfo(TParams),
TypeInfo(TParamTypes),TypeInfo(OleVariant)],Addr(____PackageParams__Wrapper),cRegister);

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T1),[
TypeInfo(OleVariant),
TypeInfo(TParams)],Addr(UnpackParams),cRegister);

RegisterProc(EDBClient,'Create',mtConstructor,TypeInfo(_T2),[
TypeInfo(string),
TypeInfo(DBResult)],Addr(EDBClient.Create),cRegister);

RegisterProc(EReconcileError,'Create',mtConstructor,TypeInfo(_T3),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(DBResult),
TypeInfo(DBResult)],Addr(EReconcileError.Create),cRegister);

RegisterProc(TAggregate,'Create',mtConstructor,TypeInfo(_T4),[
TypeInfo(TAggregates),
TypeInfo(TCustomClientDataSet)],Addr(TAggregate.Create),cRegister);

RegRegisterMethod(TAggregate,'Value',TypeInfo(_T5),[TypeInfo(Variant)],Addr(TAggregate.Value));

RegisterProc(TAggregates,'Create',mtConstructor,TypeInfo(_T6),[
TypeInfo(TPersistent)],Addr(TAggregates.Create),cRegister);

RegRegisterMethod(TAggregates,'Add',TypeInfo(_T7),[TypeInfo(TAggregate)],Addr(TAggregates.Add));

RegRegisterMethod(TAggregates,'Clear',TypeInfo(_T8),NoParams,Addr(TAggregates.Clear));

RegRegisterMethod(TAggregates,'Find',TypeInfo(_T9),[
TypeInfo(string),TypeInfo(TAggregate)],Addr(TAggregates.Find));

RegRegisterMethod(TAggregates,'IndexOf',TypeInfo(_T10),[
TypeInfo(string),TypeInfo(Integer)],Addr(TAggregates.IndexOf));

RegisterProc(TClientBlobStream,'Create',mtConstructor,TypeInfo(_T11),[
TypeInfo(TBlobField),
TypeInfo(TBlobStreamMode)],Addr(TClientBlobStream.Create),cRegister);

RegRegisterMethod(TClientBlobStream,'Truncate',TypeInfo(_T12),NoParams,Addr(TClientBlobStream.Truncate));

RegRegisterMethod(TCustomClientDataSet,'DoAfterApplyUpdates',TypeInfo(_T13),[
TypeInfo(OleVariant)], pointer(600));

RegRegisterMethod(TCustomClientDataSet,'DoBeforeApplyUpdates',TypeInfo(_T14),[
TypeInfo(OleVariant)], pointer(604));

RegRegisterMethod(TCustomClientDataSet,'DoApplyUpdates',TypeInfo(_T15),[
TypeInfo(OleVariant),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(OleVariant)], pointer(608));

RegRegisterMethod(TCustomClientDataSet,'DoAfterGetParams',TypeInfo(_T16),[
TypeInfo(OleVariant)], pointer(612));

RegRegisterMethod(TCustomClientDataSet,'DoBeforeGetParams',TypeInfo(_T17),[
TypeInfo(OleVariant)], pointer(616));

RegRegisterMethod(TCustomClientDataSet,'DoAfterGetRecords',TypeInfo(_T18),[
TypeInfo(OleVariant)], pointer(620));

RegRegisterMethod(TCustomClientDataSet,'DoBeforeGetRecords',TypeInfo(_T19),[
TypeInfo(OleVariant)], pointer(624));

RegRegisterMethod(TCustomClientDataSet,'DoGetRecords',TypeInfo(_T20),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(WideString),
TypeInfo(OleVariant),TypeInfo(OleVariant)], pointer(628));

RegRegisterMethod(TCustomClientDataSet,'DoAfterRowRequest',TypeInfo(_T21),[
TypeInfo(OleVariant)], pointer(632));

RegRegisterMethod(TCustomClientDataSet,'DoBeforeRowRequest',TypeInfo(_T22),[
TypeInfo(OleVariant)], pointer(636));

RegRegisterMethod(TCustomClientDataSet,'DoRowRequest',TypeInfo(_T23),[
TypeInfo(OleVariant),
TypeInfo(Integer),TypeInfo(OleVariant)], pointer(640));

RegRegisterMethod(TCustomClientDataSet,'DoAfterExecute',TypeInfo(_T24),[
TypeInfo(OleVariant)], pointer(644));

RegRegisterMethod(TCustomClientDataSet,'DoBeforeExecute',TypeInfo(_T25),[
TypeInfo(OleVariant)], pointer(648));

RegRegisterMethod(TCustomClientDataSet,'DoExecute',TypeInfo(_T26),[
TypeInfo(OleVariant)], pointer(652));

RegRegisterMethod(TCustomClientDataSet,'AddDataPacket',TypeInfo(_T27),[
TypeInfo(OleVariant),
TypeInfo(Boolean)], pointer(656));

RegRegisterMethod(TCustomClientDataSet,'CheckDetailRecords',TypeInfo(_T28),NoParams, pointer(660));

RegRegisterMethod(TCustomClientDataSet,'DestroyLookupCursor',TypeInfo(_T29),NoParams, pointer(664));

RegRegisterMethod(TCustomClientDataSet,'GetRemoteServer',TypeInfo(_T31),[TypeInfo(TCustomRemoteServer)], pointer(672));

RegRegisterMethod(TCustomClientDataSet,'SetAggregates',TypeInfo(_T32),[
TypeInfo(TAggregates)], pointer(676));

RegRegisterMethod(TCustomClientDataSet,'SetCommandText',TypeInfo(_T34),[
TypeInfo(string)], pointer(684));

RegRegisterMethod(TCustomClientDataSet,'SetRemoteServer',TypeInfo(_T35),[
TypeInfo(TCustomRemoteServer)], pointer(688));

RegisterProc(TCustomClientDataSet,'AddIndex',mtScriptMethod,TypeInfo(_T36),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TIndexOptions),
TypeInfo(string),
TypeInfo(string),
TypeInfo(Integer)],Addr(__TCustomClientDataSet__AddIndex__Wrapper),cRegister);

RegRegisterMethod(TCustomClientDataSet,'AppendData',TypeInfo(_T37),[
TypeInfo(OleVariant),
TypeInfo(Boolean)],Addr(TCustomClientDataSet.AppendData));

RegRegisterMethod(TCustomClientDataSet,'ApplyRange',TypeInfo(_T38),NoParams,Addr(TCustomClientDataSet.ApplyRange));

RegRegisterMethod(TCustomClientDataSet,'ApplyUpdates',TypeInfo(_T39),[
TypeInfo(Integer),TypeInfo(Integer)], pointer(692));

RegRegisterMethod(TCustomClientDataSet,'CancelRange',TypeInfo(_T40),NoParams,Addr(TCustomClientDataSet.CancelRange));

RegRegisterMethod(TCustomClientDataSet,'CancelUpdates',TypeInfo(_T41),NoParams,Addr(TCustomClientDataSet.CancelUpdates));

RegRegisterMethod(TCustomClientDataSet,'CreateDataSet',TypeInfo(_T42),NoParams,Addr(TCustomClientDataSet.CreateDataSet));

RegisterProc(TCustomClientDataSet,'CloneCursor',mtScriptMethod,TypeInfo(_T43),[
TypeInfo(TCustomClientDataSet),
TypeInfo(Boolean),
TypeInfo(Boolean)],Addr(__TCustomClientDataSet__CloneCursor__Wrapper),cRegister);

RegRegisterMethod(TCustomClientDataSet,'ConstraintsDisabled',TypeInfo(_T44),[TypeInfo(Boolean)],Addr(TCustomClientDataSet.ConstraintsDisabled));

RegRegisterMethod(TCustomClientDataSet,'DataRequest',TypeInfo(_T45),[
TypeInfo(OleVariant),TypeInfo(OleVariant)], pointer(700));

RegRegisterMethod(TCustomClientDataSet,'DeleteIndex',TypeInfo(_T46),[
TypeInfo(string)],Addr(TCustomClientDataSet.DeleteIndex));

RegRegisterMethod(TCustomClientDataSet,'DisableConstraints',TypeInfo(_T47),NoParams,Addr(TCustomClientDataSet.DisableConstraints));

RegRegisterMethod(TCustomClientDataSet,'EnableConstraints',TypeInfo(_T48),NoParams,Addr(TCustomClientDataSet.EnableConstraints));

RegRegisterMethod(TCustomClientDataSet,'EditKey',TypeInfo(_T49),NoParams,Addr(TCustomClientDataSet.EditKey));

RegRegisterMethod(TCustomClientDataSet,'EditRangeEnd',TypeInfo(_T50),NoParams,Addr(TCustomClientDataSet.EditRangeEnd));

RegRegisterMethod(TCustomClientDataSet,'EditRangeStart',TypeInfo(_T51),NoParams,Addr(TCustomClientDataSet.EditRangeStart));

RegRegisterMethod(TCustomClientDataSet,'EmptyDataSet',TypeInfo(_T52),NoParams,Addr(TCustomClientDataSet.EmptyDataSet));

RegRegisterMethod(TCustomClientDataSet,'Execute',TypeInfo(_T53),NoParams, pointer(704));

RegRegisterMethod(TCustomClientDataSet,'FetchBlobs',TypeInfo(_T54),NoParams,Addr(TCustomClientDataSet.FetchBlobs));

RegRegisterMethod(TCustomClientDataSet,'FetchDetails',TypeInfo(_T55),NoParams,Addr(TCustomClientDataSet.FetchDetails));

RegRegisterMethod(TCustomClientDataSet,'RefreshRecord',TypeInfo(_T56),NoParams,Addr(TCustomClientDataSet.RefreshRecord));

RegRegisterMethod(TCustomClientDataSet,'FetchParams',TypeInfo(_T57),NoParams,Addr(TCustomClientDataSet.FetchParams));

RegRegisterMethod(TCustomClientDataSet,'FindKey',TypeInfo(_T58),[
TypeInfoArrayOfConst,TypeInfo(Boolean)], pointer(708));

RegRegisterMethod(TCustomClientDataSet,'FindNearest',TypeInfo(_T59),[
TypeInfoArrayOfConst],Addr(TCustomClientDataSet.FindNearest));

RegRegisterMethod(TCustomClientDataSet,'GetGroupState',TypeInfo(_T60),[
TypeInfo(Integer),TypeInfo(TGroupPosInds)],Addr(TCustomClientDataSet.GetGroupState));

RegRegisterMethod(TCustomClientDataSet,'GetIndexInfo',TypeInfo(_T61),[
TypeInfo(string)],Addr(TCustomClientDataSet.GetIndexInfo));

RegRegisterMethod(TCustomClientDataSet,'GetIndexNames',TypeInfo(_T62),[
TypeInfo(TStrings)],Addr(TCustomClientDataSet.GetIndexNames));

RegRegisterMethod(TCustomClientDataSet,'GetNextPacket',TypeInfo(_T63),[TypeInfo(Integer)],Addr(TCustomClientDataSet.GetNextPacket));

RegRegisterMethod(TCustomClientDataSet,'GetOptionalParam',TypeInfo(_T64),[
TypeInfo(string),TypeInfo(OleVariant)],Addr(TCustomClientDataSet.GetOptionalParam));

RegRegisterMethod(TCustomClientDataSet,'GotoCurrent',TypeInfo(_T65),[
TypeInfo(TCustomClientDataSet)],Addr(TCustomClientDataSet.GotoCurrent));

RegRegisterMethod(TCustomClientDataSet,'GotoKey',TypeInfo(_T66),[TypeInfo(Boolean)],Addr(TCustomClientDataSet.GotoKey));

RegRegisterMethod(TCustomClientDataSet,'GotoNearest',TypeInfo(_T67),NoParams,Addr(TCustomClientDataSet.GotoNearest));

RegisterProc(TCustomClientDataSet,'LoadFromFile',mtScriptMethod,TypeInfo(_T68),[
TypeInfo(string)],Addr(__TCustomClientDataSet__LoadFromFile__Wrapper),cRegister);

RegRegisterMethod(TCustomClientDataSet,'LoadFromStream',TypeInfo(_T69),[
TypeInfo(TStream)],Addr(TCustomClientDataSet.LoadFromStream));

RegRegisterMethod(TCustomClientDataSet,'MergeChangeLog',TypeInfo(_T70),NoParams,Addr(TCustomClientDataSet.MergeChangeLog));

RegRegisterMethod(TCustomClientDataSet,'Reconcile',TypeInfo(_T71),[
TypeInfo(OleVariant),TypeInfo(Boolean)],Addr(TCustomClientDataSet.Reconcile));

RegRegisterMethod(TCustomClientDataSet,'RevertRecord',TypeInfo(_T72),NoParams,Addr(TCustomClientDataSet.RevertRecord));

RegisterProc(TCustomClientDataSet,'SaveToFile',mtScriptMethod,TypeInfo(_T73),[
TypeInfo(string),
TypeInfo(TDataPacketFormat)],Addr(__TCustomClientDataSet__SaveToFile__Wrapper),cRegister);

RegisterProc(TCustomClientDataSet,'SaveToStream',mtScriptMethod,TypeInfo(_T74),[
TypeInfo(TStream),
TypeInfo(TDataPacketFormat)],Addr(__TCustomClientDataSet__SaveToStream__Wrapper),cRegister);

RegRegisterMethod(TCustomClientDataSet,'SetKey',TypeInfo(_T76),NoParams,Addr(TCustomClientDataSet.SetKey));

RegisterProc(TCustomClientDataSet,'SetOptionalParam',mtScriptMethod,TypeInfo(_T77),[
TypeInfo(string),
TypeInfo(OleVariant),
TypeInfo(Boolean)],Addr(__TCustomClientDataSet__SetOptionalParam__Wrapper),cRegister);

RegRegisterMethod(TCustomClientDataSet,'SetProvider',TypeInfo(_T78),[
TypeInfo(TComponent)],Addr(TCustomClientDataSet.SetProvider));

RegRegisterMethod(TCustomClientDataSet,'SetRange',TypeInfo(_T79),[
TypeInfoArrayOfConst,
TypeInfoArrayOfConst],Addr(TCustomClientDataSet.SetRange));

RegRegisterMethod(TCustomClientDataSet,'SetRangeEnd',TypeInfo(_T80),NoParams,Addr(TCustomClientDataSet.SetRangeEnd));

RegRegisterMethod(TCustomClientDataSet,'SetRangeStart',TypeInfo(_T81),NoParams,Addr(TCustomClientDataSet.SetRangeStart));

RegRegisterMethod(TCustomClientDataSet,'UndoLastChange',TypeInfo(_T82),[
TypeInfo(Boolean),TypeInfo(Boolean)],Addr(TCustomClientDataSet.UndoLastChange));

RegRegisterMethod(TCustomRemoteServer,'GetAppServer',TypeInfo(_T83),[TypeInfo(Variant)], pointer(80));

RegRegisterMethod(TCustomRemoteServer,'SetAppServer',TypeInfo(_T84),[
TypeInfo(Variant)], pointer(84));

RegRegisterMethod(TCustomRemoteServer,'GetServerList',TypeInfo(_T85),[TypeInfo(OleVariant)], pointer(88));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegRegisterMethod(TCustomClientDataSet,'GetAppServer',TypeInfo(_T30),[TypeInfo(IAppServer)], pointer(668))}

{RegRegisterMethod(TCustomClientDataSet,'SetAppServer',TypeInfo(_T33),[
TypeInfo(IAppServer)], pointer(680))}

{RegRegisterMethod(TCustomClientDataSet,'SetAltRecBuffers',TypeInfo(_T75),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfoPChar],Addr(TCustomClientDataSet.SetAltRecBuffers))}

{RegRegisterMethod(TCustomRemoteServer,'GetProviderNames',TypeInfo(_T86),[
TypeInfo(TGetStrProc)], pointer(92))}

{RegRegisterMethod(TCustomRemoteServer,'GetServer',TypeInfo(_T87),[TypeInfo(IAppServer)], pointer(96))}

RegisterEvent(TypeInfo(TAggUpdateEvent),[
TypeInfo(TAggregate)]);

RegisterEvent(TypeInfo(TGetUsernameEvent),[
TypeInfo(TObject),
TypeInfo(string)]);

RegisterEvent(TypeInfo(TReconcileErrorEvent),[
TypeInfo(TCustomClientDataSet),
TypeInfo(EReconcileError),
TypeInfo(TUpdateKind),
TypeInfo(TReconcileAction)]);

RegisterEvent(TypeInfo(TRemoteEvent),[
TypeInfo(TObject),
TypeInfo(OleVariant)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
