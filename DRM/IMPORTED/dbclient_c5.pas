{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit DBCLIENT_C5;
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
  ActiveX,
  Graphics,
  Classes,
  Controls,
  Forms,
  Db,
  DSIntf,
  DBCommon,
  Midas,
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
p1 : TClientDataSet) of object;

_T5 = function : Variant of object;

_T6 = procedure (p0 : TPersistent) of object;

_T7 = function : TAggregate of object;

_T8 = procedure  of object;

_T9 = function (const p0 : string): TAggregate of object;

_T10 = function (const p0 : string): Integer of object;

_T11 = procedure (p0 : TBlobField;
p1 : TBlobStreamMode) of object;

_T12 = _T8;

_T13 = function (p0 : OleVariant;
p1 : Integer;
out p2 : Integer): OleVariant of object;

_T14 = function (p0 : Integer;
out p1 : Integer;
p2 : Integer;
const p3 : WideString;
p4 : OleVariant): OleVariant of object;

_T15 = function (p0 : OleVariant;
p1 : Integer): OleVariant of object;

_T16 = procedure (p0 : OleVariant) of object;

_T17 = procedure (const p0 : OleVariant;
p1 : Boolean) of object;

_T18 = _T8;

_T19 = _T8;

_T20 = function : TCustomRemoteServer of object;

_T21 = procedure (p0 : TCustomRemoteServer) of object;

_T22 = procedure (const p0 : string;
const p1 : string;
p2 : TIndexOptions;
const p3 : string;
const p4 : string;
const p5 : Integer) of object;

_T23 = _T17;

_T24 = _T8;

_T25 = function (p0 : Integer): Integer of object;

_T26 = _T8;

_T27 = _T8;

_T28 = _T8;

_T29 = procedure (p0 : TClientDataSet;
p1 : Boolean;
p2 : Boolean) of object;

_T30 = function : Boolean of object;

_T31 = function (p0 : OleVariant): OleVariant of object;

_T32 = procedure (const p0 : string) of object;

_T33 = _T8;

_T34 = _T8;

_T35 = _T8;

_T36 = _T8;

_T37 = _T8;

_T38 = _T8;

_T39 = _T8;

_T40 = _T8;

_T41 = _T8;

_T42 = _T8;

_T43 = _T8;

_T44 = function (const p0 : Array of Const): Boolean of object;

_T45 = procedure (const p0 : Array of Const) of object;

_T46 = function (p0 : Integer): TGroupPosInds of object;

_T47 = procedure (p0 : string) of object;

_T48 = procedure (p0 : TStrings) of object;

_T49 = function : Integer of object;

_T50 = function (const p0 : string): OleVariant of object;

_T51 = procedure (p0 : TClientDataSet) of object;

_T52 = _T30;

_T53 = _T8;

_T54 = _T32;

_T55 = procedure (p0 : TStream) of object;

_T56 = _T8;

_T57 = function (const p0 : OleVariant): Boolean of object;

_T58 = _T8;

_T59 = procedure (const p0 : string;
p1 : TDataPacketFormat) of object;

_T60 = procedure (p0 : TStream;
p1 : TDataPacketFormat) of object;

{_T61 = procedure (p0 : PChar;
p1 : PChar;
p2 : PChar) of object;}

_T62 = _T8;

_T63 = procedure (const p0 : string;
const p1 : OleVariant;
p2 : Boolean) of object;

_T64 = procedure (p0 : TComponent) of object;

_T65 = procedure (const p0 : Array of Const;
const p1 : Array of Const) of object;

_T66 = _T8;

_T67 = _T8;

_T68 = function (p0 : Boolean): Boolean of object;

_T69 = function : OleVariant of object;

{_T70 = procedure (p0 : TGetStrProc) of object;}

{_T71 = function : IAppServer of object;}

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

procedure __TClientDataSet__AddIndex__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
var
__s2 : TIndexOptions;
begin
if cArgs > 2 then
VarToSet(__s2,OleVariant(pargs^[2]),SizeOf(TIndexOptions));
case cArgs of
3:
begin
TClientDataSet(__Instance).AddIndex(OleVariant(pargs^[2]),OleVariant(pargs^[1]),__s2);
end;
4:
begin
TClientDataSet(__Instance).AddIndex(OleVariant(pargs^[3]),OleVariant(pargs^[2]),__s2,OleVariant(pargs^[0]));
end;
5:
begin
TClientDataSet(__Instance).AddIndex(OleVariant(pargs^[4]),OleVariant(pargs^[3]),__s2,OleVariant(pargs^[1]),OleVariant(pargs^[0]));
end;
6:
begin
TClientDataSet(__Instance).AddIndex(OleVariant(pargs^[5]),OleVariant(pargs^[4]),__s2,OleVariant(pargs^[2]),OleVariant(pargs^[1]),OleVariant(pargs^[0]));
end;
end
end;

procedure __TClientDataSet__CloneCursor__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
2:
begin
TClientDataSet(__Instance).CloneCursor(TClientDataSet(VarToObject(OleVariant(pargs^[1]))),OleVariant(pargs^[0]));
end;
3:
begin
TClientDataSet(__Instance).CloneCursor(TClientDataSet(VarToObject(OleVariant(pargs^[2]))),OleVariant(pargs^[1]),OleVariant(pargs^[0]));
end;
end
end;

procedure __TClientDataSet__LoadFromFile__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
0:
begin
TClientDataSet(__Instance).LoadFromFile;
end;
1:
begin
TClientDataSet(__Instance).LoadFromFile(OleVariant(pargs^[0]));
end;
end
end;

procedure __TClientDataSet__SaveToFile__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
0:
begin
TClientDataSet(__Instance).SaveToFile;
end;
1:
begin
TClientDataSet(__Instance).SaveToFile(OleVariant(pargs^[0]));
end;
2:
begin
TClientDataSet(__Instance).SaveToFile(OleVariant(pargs^[1]),OleVariant(pargs^[0]));
end;
end
end;

procedure __TClientDataSet__SaveToStream__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
1:
begin
TClientDataSet(__Instance).SaveToStream(TStream(VarToObject(OleVariant(pargs^[0]))));
end;
2:
begin
TClientDataSet(__Instance).SaveToStream(TStream(VarToObject(OleVariant(pargs^[1]))),OleVariant(pargs^[0]));
end;
end
end;

procedure __TClientDataSet__SetOptionalParam__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
2:
begin
TClientDataSet(__Instance).SetOptionalParam(OleVariant(pargs^[1]),OleVariant(pargs^[0]));
end;
3:
begin
TClientDataSet(__Instance).SetOptionalParam(OleVariant(pargs^[2]),OleVariant(pargs^[1]),OleVariant(pargs^[0]));
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

function __DC__GetTClientDataSet__HasAppServer(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TClientDataSet(Instance).HasAppServer;
end;

function __DC__GetTClientDataSet__ActiveAggs(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TClientDataSet(Instance).ActiveAggs[OleVariant(Params^[0])]);
end;

function __DC__GetTClientDataSet__ChangeCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TClientDataSet(Instance).ChangeCount;
end;

function __DC__GetTClientDataSet__CloneSource(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TClientDataSet(Instance).CloneSource);
end;

function __DC__GetTClientDataSet__Data(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TClientDataSet(Instance).Data;
end;

procedure __DC__SetTClientDataSet__Data(Instance : TObject; Params : PVariantArgList);
begin
TClientDataSet(Instance).Data:=OleVariant(Params^[0]);
end;

function __DC__GetTClientDataSet__DataSize(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TClientDataSet(Instance).DataSize;
end;

function __DC__GetTClientDataSet__Delta(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TClientDataSet(Instance).Delta;
end;

function __DC__GetTClientDataSet__GroupingLevel(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TClientDataSet(Instance).GroupingLevel;
end;

function __DC__GetTClientDataSet__IndexFieldCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TClientDataSet(Instance).IndexFieldCount;
end;

function __DC__GetTClientDataSet__IndexFields(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TClientDataSet(Instance).IndexFields[OleVariant(Params^[0])]);
end;

procedure __DC__SetTClientDataSet__IndexFields(Instance : TObject; Params : PVariantArgList);
begin
TClientDataSet(Instance).IndexFields[OleVariant(Params^[1])]:=TField(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTClientDataSet__KeyExclusive(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TClientDataSet(Instance).KeyExclusive;
end;

procedure __DC__SetTClientDataSet__KeyExclusive(Instance : TObject; Params : PVariantArgList);
begin
TClientDataSet(Instance).KeyExclusive:=OleVariant(Params^[0]);
end;

function __DC__GetTClientDataSet__KeyFieldCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TClientDataSet(Instance).KeyFieldCount;
end;

procedure __DC__SetTClientDataSet__KeyFieldCount(Instance : TObject; Params : PVariantArgList);
begin
TClientDataSet(Instance).KeyFieldCount:=OleVariant(Params^[0]);
end;

function __DC__GetTClientDataSet__KeySize(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TClientDataSet(Instance).KeySize;
end;

function __DC__GetTClientDataSet__LogChanges(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TClientDataSet(Instance).LogChanges;
end;

procedure __DC__SetTClientDataSet__LogChanges(Instance : TObject; Params : PVariantArgList);
begin
TClientDataSet(Instance).LogChanges:=OleVariant(Params^[0]);
end;

function __DC__GetTClientDataSet__SavePoint(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TClientDataSet(Instance).SavePoint;
end;

procedure __DC__SetTClientDataSet__SavePoint(Instance : TObject; Params : PVariantArgList);
begin
TClientDataSet(Instance).SavePoint:=OleVariant(Params^[0]);
end;

function __DC__GetTClientDataSet__StatusFilter(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TUpdateStatusSet;
begin
tmp := TClientDataSet(Instance).StatusFilter;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTClientDataSet__StatusFilter(Instance : TObject; Params : PVariantArgList);
var
  tmp : TUpdateStatusSet;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TClientDataSet(Instance).StatusFilter:=tmp;
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
RegisterProperty(TClientDataSet,'HasAppServer',__DC__GetTClientDataSet__HasAppServer,nil);
RegisterIndexedProperty(TClientDataSet,'ActiveAggs',1,False,__DC__GetTClientDataSet__ActiveAggs,nil);
RegisterProperty(TClientDataSet,'ChangeCount',__DC__GetTClientDataSet__ChangeCount,nil);
RegisterProperty(TClientDataSet,'CloneSource',__DC__GetTClientDataSet__CloneSource,nil);
RegisterProperty(TClientDataSet,'Data',__DC__GetTClientDataSet__Data,__DC__SetTClientDataSet__Data);
RegisterProperty(TClientDataSet,'DataSize',__DC__GetTClientDataSet__DataSize,nil);
RegisterProperty(TClientDataSet,'Delta',__DC__GetTClientDataSet__Delta,nil);
RegisterProperty(TClientDataSet,'GroupingLevel',__DC__GetTClientDataSet__GroupingLevel,nil);
RegisterProperty(TClientDataSet,'IndexFieldCount',__DC__GetTClientDataSet__IndexFieldCount,nil);
RegisterIndexedProperty(TClientDataSet,'IndexFields',1,False,__DC__GetTClientDataSet__IndexFields,__DC__SetTClientDataSet__IndexFields);
RegisterProperty(TClientDataSet,'KeyExclusive',__DC__GetTClientDataSet__KeyExclusive,__DC__SetTClientDataSet__KeyExclusive);
RegisterProperty(TClientDataSet,'KeyFieldCount',__DC__GetTClientDataSet__KeyFieldCount,__DC__SetTClientDataSet__KeyFieldCount);
RegisterProperty(TClientDataSet,'KeySize',__DC__GetTClientDataSet__KeySize,nil);
RegisterProperty(TClientDataSet,'LogChanges',__DC__GetTClientDataSet__LogChanges,__DC__SetTClientDataSet__LogChanges);
RegisterProperty(TClientDataSet,'SavePoint',__DC__GetTClientDataSet__SavePoint,__DC__SetTClientDataSet__SavePoint);
RegisterProperty(TClientDataSet,'StatusFilter',__DC__GetTClientDataSet__StatusFilter,__DC__SetTClientDataSet__StatusFilter);
end;

const __ConstNames0 : array[0..22] of string = (
'kiLookup'
,'kiRangeStart'
,'kiRangeEnd'
,'kiCurRangeStart'
,'kiCurRangeEnd'
,'kiSave'
,'dfBinary'
,'dfXML'
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
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,raSkip));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,raAbort));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,raMerge));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,raCorrect));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,raCancel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,raRefresh));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,doDisableInserts));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,doDisableDeletes));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,doDisableEdits));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,doNoResetCall));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,foRecord));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,foBlobs));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,foDetails));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,VarFromSet(AllParamTypes, sizeof(AllParamTypes))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,AllRecords));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..6] of TClass = (
EDBClient,
EReconcileError,
TAggregate,
TAggregates,
TClientBlobStream,
TClientDataSet,
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
TypeInfo(TClientDataSet)],Addr(TAggregate.Create),cRegister);

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

RegRegisterMethod(TClientDataSet,'DoApplyUpdates',TypeInfo(_T13),[
TypeInfo(OleVariant),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(OleVariant)], pointer(592));

RegRegisterMethod(TClientDataSet,'DoGetRecords',TypeInfo(_T14),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(WideString),
TypeInfo(OleVariant),TypeInfo(OleVariant)], pointer(596));

RegRegisterMethod(TClientDataSet,'DoRowRequest',TypeInfo(_T15),[
TypeInfo(OleVariant),
TypeInfo(Integer),TypeInfo(OleVariant)], pointer(600));

RegRegisterMethod(TClientDataSet,'DoExecute',TypeInfo(_T16),[
TypeInfo(OleVariant)], pointer(604));

RegRegisterMethod(TClientDataSet,'AddDataPacket',TypeInfo(_T17),[
TypeInfo(OleVariant),
TypeInfo(Boolean)], pointer(608));

RegRegisterMethod(TClientDataSet,'CheckDetailRecords',TypeInfo(_T18),NoParams, pointer(612));

RegRegisterMethod(TClientDataSet,'DestroyLookupCursor',TypeInfo(_T19),NoParams, pointer(616));

RegRegisterMethod(TClientDataSet,'GetRemoteServer',TypeInfo(_T20),[TypeInfo(TCustomRemoteServer)], pointer(620));

RegRegisterMethod(TClientDataSet,'SetRemoteServer',TypeInfo(_T21),[
TypeInfo(TCustomRemoteServer)], pointer(624));

RegisterProc(TClientDataSet,'AddIndex',mtScriptMethod,TypeInfo(_T22),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TIndexOptions),
TypeInfo(string),
TypeInfo(string),
TypeInfo(Integer)],Addr(__TClientDataSet__AddIndex__Wrapper),cRegister);

RegRegisterMethod(TClientDataSet,'AppendData',TypeInfo(_T23),[
TypeInfo(OleVariant),
TypeInfo(Boolean)],Addr(TClientDataSet.AppendData));

RegRegisterMethod(TClientDataSet,'ApplyRange',TypeInfo(_T24),NoParams,Addr(TClientDataSet.ApplyRange));

RegRegisterMethod(TClientDataSet,'ApplyUpdates',TypeInfo(_T25),[
TypeInfo(Integer),TypeInfo(Integer)], pointer(628));

RegRegisterMethod(TClientDataSet,'CancelRange',TypeInfo(_T26),NoParams,Addr(TClientDataSet.CancelRange));

RegRegisterMethod(TClientDataSet,'CancelUpdates',TypeInfo(_T27),NoParams,Addr(TClientDataSet.CancelUpdates));

RegRegisterMethod(TClientDataSet,'CreateDataSet',TypeInfo(_T28),NoParams,Addr(TClientDataSet.CreateDataSet));

RegisterProc(TClientDataSet,'CloneCursor',mtScriptMethod,TypeInfo(_T29),[
TypeInfo(TClientDataSet),
TypeInfo(Boolean),
TypeInfo(Boolean)],Addr(__TClientDataSet__CloneCursor__Wrapper),cRegister);

RegRegisterMethod(TClientDataSet,'ConstraintsDisabled',TypeInfo(_T30),[TypeInfo(Boolean)],Addr(TClientDataSet.ConstraintsDisabled));

RegRegisterMethod(TClientDataSet,'DataRequest',TypeInfo(_T31),[
TypeInfo(OleVariant),TypeInfo(OleVariant)], pointer(632));

RegRegisterMethod(TClientDataSet,'DeleteIndex',TypeInfo(_T32),[
TypeInfo(string)],Addr(TClientDataSet.DeleteIndex));

RegRegisterMethod(TClientDataSet,'DisableConstraints',TypeInfo(_T33),NoParams,Addr(TClientDataSet.DisableConstraints));

RegRegisterMethod(TClientDataSet,'EnableConstraints',TypeInfo(_T34),NoParams,Addr(TClientDataSet.EnableConstraints));

RegRegisterMethod(TClientDataSet,'EditKey',TypeInfo(_T35),NoParams,Addr(TClientDataSet.EditKey));

RegRegisterMethod(TClientDataSet,'EditRangeEnd',TypeInfo(_T36),NoParams,Addr(TClientDataSet.EditRangeEnd));

RegRegisterMethod(TClientDataSet,'EditRangeStart',TypeInfo(_T37),NoParams,Addr(TClientDataSet.EditRangeStart));

RegRegisterMethod(TClientDataSet,'EmptyDataSet',TypeInfo(_T38),NoParams,Addr(TClientDataSet.EmptyDataSet));

RegRegisterMethod(TClientDataSet,'Execute',TypeInfo(_T39),NoParams, pointer(636));

RegRegisterMethod(TClientDataSet,'FetchBlobs',TypeInfo(_T40),NoParams,Addr(TClientDataSet.FetchBlobs));

RegRegisterMethod(TClientDataSet,'FetchDetails',TypeInfo(_T41),NoParams,Addr(TClientDataSet.FetchDetails));

RegRegisterMethod(TClientDataSet,'RefreshRecord',TypeInfo(_T42),NoParams,Addr(TClientDataSet.RefreshRecord));

RegRegisterMethod(TClientDataSet,'FetchParams',TypeInfo(_T43),NoParams,Addr(TClientDataSet.FetchParams));

RegRegisterMethod(TClientDataSet,'FindKey',TypeInfo(_T44),[
TypeInfoArrayOfConst,TypeInfo(Boolean)], pointer(640));

RegRegisterMethod(TClientDataSet,'FindNearest',TypeInfo(_T45),[
TypeInfoArrayOfConst],Addr(TClientDataSet.FindNearest));

RegRegisterMethod(TClientDataSet,'GetGroupState',TypeInfo(_T46),[
TypeInfo(Integer),TypeInfo(TGroupPosInds)],Addr(TClientDataSet.GetGroupState));

RegRegisterMethod(TClientDataSet,'GetIndexInfo',TypeInfo(_T47),[
TypeInfo(string)],Addr(TClientDataSet.GetIndexInfo));

RegRegisterMethod(TClientDataSet,'GetIndexNames',TypeInfo(_T48),[
TypeInfo(TStrings)],Addr(TClientDataSet.GetIndexNames));

RegRegisterMethod(TClientDataSet,'GetNextPacket',TypeInfo(_T49),[TypeInfo(Integer)],Addr(TClientDataSet.GetNextPacket));

RegRegisterMethod(TClientDataSet,'GetOptionalParam',TypeInfo(_T50),[
TypeInfo(string),TypeInfo(OleVariant)],Addr(TClientDataSet.GetOptionalParam));

RegRegisterMethod(TClientDataSet,'GotoCurrent',TypeInfo(_T51),[
TypeInfo(TClientDataSet)],Addr(TClientDataSet.GotoCurrent));

RegRegisterMethod(TClientDataSet,'GotoKey',TypeInfo(_T52),[TypeInfo(Boolean)],Addr(TClientDataSet.GotoKey));

RegRegisterMethod(TClientDataSet,'GotoNearest',TypeInfo(_T53),NoParams,Addr(TClientDataSet.GotoNearest));

RegisterProc(TClientDataSet,'LoadFromFile',mtScriptMethod,TypeInfo(_T54),[
TypeInfo(string)],Addr(__TClientDataSet__LoadFromFile__Wrapper),cRegister);

RegRegisterMethod(TClientDataSet,'LoadFromStream',TypeInfo(_T55),[
TypeInfo(TStream)],Addr(TClientDataSet.LoadFromStream));

RegRegisterMethod(TClientDataSet,'MergeChangeLog',TypeInfo(_T56),NoParams,Addr(TClientDataSet.MergeChangeLog));

RegRegisterMethod(TClientDataSet,'Reconcile',TypeInfo(_T57),[
TypeInfo(OleVariant),TypeInfo(Boolean)],Addr(TClientDataSet.Reconcile));

RegRegisterMethod(TClientDataSet,'RevertRecord',TypeInfo(_T58),NoParams,Addr(TClientDataSet.RevertRecord));

RegisterProc(TClientDataSet,'SaveToFile',mtScriptMethod,TypeInfo(_T59),[
TypeInfo(string),
TypeInfo(TDataPacketFormat)],Addr(__TClientDataSet__SaveToFile__Wrapper),cRegister);

RegisterProc(TClientDataSet,'SaveToStream',mtScriptMethod,TypeInfo(_T60),[
TypeInfo(TStream),
TypeInfo(TDataPacketFormat)],Addr(__TClientDataSet__SaveToStream__Wrapper),cRegister);

RegRegisterMethod(TClientDataSet,'SetKey',TypeInfo(_T62),NoParams,Addr(TClientDataSet.SetKey));

RegisterProc(TClientDataSet,'SetOptionalParam',mtScriptMethod,TypeInfo(_T63),[
TypeInfo(string),
TypeInfo(OleVariant),
TypeInfo(Boolean)],Addr(__TClientDataSet__SetOptionalParam__Wrapper),cRegister);

RegRegisterMethod(TClientDataSet,'SetProvider',TypeInfo(_T64),[
TypeInfo(TComponent)],Addr(TClientDataSet.SetProvider));

RegRegisterMethod(TClientDataSet,'SetRange',TypeInfo(_T65),[
TypeInfoArrayOfConst,
TypeInfoArrayOfConst],Addr(TClientDataSet.SetRange));

RegRegisterMethod(TClientDataSet,'SetRangeEnd',TypeInfo(_T66),NoParams,Addr(TClientDataSet.SetRangeEnd));

RegRegisterMethod(TClientDataSet,'SetRangeStart',TypeInfo(_T67),NoParams,Addr(TClientDataSet.SetRangeStart));

RegRegisterMethod(TClientDataSet,'UndoLastChange',TypeInfo(_T68),[
TypeInfo(Boolean),TypeInfo(Boolean)],Addr(TClientDataSet.UndoLastChange));

RegRegisterMethod(TCustomRemoteServer,'GetServerList',TypeInfo(_T69),[TypeInfo(OleVariant)], pointer(80));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegRegisterMethod(TClientDataSet,'SetAltRecBuffers',TypeInfo(_T61),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfoPChar],Addr(TClientDataSet.SetAltRecBuffers))}

{RegRegisterMethod(TCustomRemoteServer,'GetProviderNames',TypeInfo(_T70),[
TypeInfo(TGetStrProc)], pointer(84))}

{RegRegisterMethod(TCustomRemoteServer,'GetServer',TypeInfo(_T71),[TypeInfo(IAppServer)], pointer(88))}

RegisterEvent(TypeInfo(TAggUpdateEvent),[
TypeInfo(TAggregate)]);

RegisterEvent(TypeInfo(TReconcileErrorEvent),[
TypeInfo(TClientDataSet),
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
