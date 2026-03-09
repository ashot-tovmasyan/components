{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit DBCLIENT_D3;
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
  Graphics,
  Classes,
  Controls,
  Forms,
  Db,
  BDE,
  DSIntf,
  DBCommon,
  StdVcl,
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
procedure setAttribute(const val : DSAttr);
function getAttribute : DSAttr;
property Attribute : DSAttr read getAttribute write setAttribute;
end;
type
_T0 = procedure (p0 : string;
p1 : DBIResult) of object;

_T1 = procedure (p0 : string;
p1 : string;
p2 : DBIResult) of object;

_T2 = procedure (p0 : TBlobField;
p1 : TBlobStreamMode) of object;

_T3 = procedure  of object;

_T4 = procedure (p0 : OleVariant;
p1 : Boolean) of object;

_T5 = _T3;

_T6 = procedure (const p0 : string;
const p1 : string;
p2 : TIndexOptions) of object;

_T7 = _T4;

_T8 = _T3;

_T9 = function (p0 : Integer): Integer of object;

_T10 = _T3;

_T11 = _T3;

_T12 = _T3;

_T13 = procedure (p0 : TClientDataSet;
p1 : Boolean) of object;

_T14 = function : Boolean of object;

_T15 = procedure (const p0 : string) of object;

_T16 = _T3;

_T17 = _T3;

_T18 = _T3;

_T19 = _T3;

_T20 = _T3;

_T21 = _T3;

_T22 = function (const p0 : Array of Const): Boolean of object;

_T23 = procedure (const p0 : Array of Const) of object;

_T24 = _T3;

_T25 = procedure (p0 : TStrings) of object;

_T26 = function : Integer of object;

_T27 = procedure (p0 : TClientDataSet) of object;

_T28 = _T14;

_T29 = _T3;

_T30 = _T15;

_T31 = procedure (p0 : TStream) of object;

_T32 = _T3;

_T33 = function (p0 : OleVariant): Boolean of object;

_T34 = _T3;

_T35 = _T15;

_T36 = _T31;

{_T37 = procedure (p0 : PChar;
p1 : PChar;
p2 : PChar) of object;}

_T38 = _T3;

_T39 = procedure (const p0 : Array of Const;
const p1 : Array of Const) of object;

_T40 = _T3;

_T41 = _T3;

_T42 = function (p0 : Boolean): Boolean of object;

_T43 = function : TUpdateStatus of object;

_T44 = _T27;

_T45 = _T3;

_T46 = _T3;

_T47 = _T14;

{_T48 = function (const p0 : string): IProvider of object;}

{_T49 = procedure (p0 : TGetStrProc) of object;}

_T50 = _T27;

_T51 = procedure (p0 : Boolean) of object;

_T52 = function : Variant of object;

_T53 = procedure (p0 : Variant) of object;

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
procedure __TRecInfo__Wrapper.setAttribute(const val : DSAttr);
begin
TRecInfo(GetRecordPtr^).Attribute := val;
end;
function __TRecInfo__Wrapper.getAttribute : DSAttr;
begin
result := TRecInfo(GetRecordPtr^).Attribute;
end;
function _TKeyBuffer_ : IDispatch;
begin
  result := __TKeyBuffer__Wrapper.Create;
end;
function _TRecInfo_ : IDispatch;
begin
  result := __TRecInfo__Wrapper.Create;
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

function __DC__GetTClientDataSet__ChangeCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TClientDataSet(Instance).ChangeCount;
end;

function __DC__GetTClientDataSet__Data(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TClientDataSet(Instance).Data;
end;

procedure __DC__SetTClientDataSet__Data(Instance : TObject; Params : PVariantArgList);
begin
TClientDataSet(Instance).Data:=OleVariant(Params^[0]);
end;

function __DC__GetTClientDataSet__Delta(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TClientDataSet(Instance).Delta;
end;

function __DC__GetTClientDataSet__IndexDefs(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TClientDataSet(Instance).IndexDefs);
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

function __DC__GetTRemoteServer__AppServer(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TRemoteServer(Instance).AppServer;
end;

procedure __RegisterProps;
begin
RegisterProperty(EDBClient,'ErrorCode',__DC__GetEDBClient__ErrorCode,nil);
RegisterProperty(EReconcileError,'Context',__DC__GetEReconcileError__Context,nil);
RegisterProperty(TClientDataSet,'ChangeCount',__DC__GetTClientDataSet__ChangeCount,nil);
RegisterProperty(TClientDataSet,'Data',__DC__GetTClientDataSet__Data,__DC__SetTClientDataSet__Data);
RegisterProperty(TClientDataSet,'Delta',__DC__GetTClientDataSet__Delta,nil);
RegisterProperty(TClientDataSet,'IndexDefs',__DC__GetTClientDataSet__IndexDefs,nil);
RegisterProperty(TClientDataSet,'IndexFieldCount',__DC__GetTClientDataSet__IndexFieldCount,nil);
RegisterIndexedProperty(TClientDataSet,'IndexFields',1,False,__DC__GetTClientDataSet__IndexFields,__DC__SetTClientDataSet__IndexFields);
RegisterProperty(TClientDataSet,'KeyExclusive',__DC__GetTClientDataSet__KeyExclusive,__DC__SetTClientDataSet__KeyExclusive);
RegisterProperty(TClientDataSet,'KeyFieldCount',__DC__GetTClientDataSet__KeyFieldCount,__DC__SetTClientDataSet__KeyFieldCount);
RegisterProperty(TClientDataSet,'KeySize',__DC__GetTClientDataSet__KeySize,nil);
RegisterProperty(TClientDataSet,'LogChanges',__DC__GetTClientDataSet__LogChanges,__DC__SetTClientDataSet__LogChanges);
RegisterProperty(TRemoteServer,'AppServer',__DC__GetTRemoteServer__AppServer,nil);
end;

const __ConstNames0 : array[0..12] of string = (
'kiLookup'
,'kiRangeStart'
,'kiRangeEnd'
,'kiCurRangeStart'
,'kiCurRangeEnd'
,'kiSave'
,'raSkip'
,'raAbort'
,'raMerge'
,'raCorrect'
,'raCancel'
,'raRefresh'
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
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,raSkip));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,raAbort));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,raMerge));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,raCorrect));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,raCancel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,raRefresh));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,AllRecords));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..5] of TClass = (
EDBClient,
EReconcileError,
TClientBlobStream,
TClientDataSet,
TCustomRemoteServer,
TRemoteServer
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..1] of string = (
'TKeyBuffer'
,'TRecInfo'
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
RegisterProc(EDBClient,'Create',mtConstructor,TypeInfo(_T0),[
TypeInfo(string),
TypeInfo(DBIResult)],Addr(EDBClient.Create),cRegister);

RegisterProc(EReconcileError,'Create',mtConstructor,TypeInfo(_T1),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(DBIResult)],Addr(EReconcileError.Create),cRegister);

RegisterProc(TClientBlobStream,'Create',mtConstructor,TypeInfo(_T2),[
TypeInfo(TBlobField),
TypeInfo(TBlobStreamMode)],Addr(TClientBlobStream.Create),cRegister);

RegRegisterMethod(TClientBlobStream,'Truncate',TypeInfo(_T3),NoParams,Addr(TClientBlobStream.Truncate));

RegRegisterMethod(TClientDataSet,'AddDataPacket',TypeInfo(_T4),[
TypeInfo(OleVariant),
TypeInfo(Boolean)], pointer(428));

RegRegisterMethod(TClientDataSet,'DestroyLookupCursor',TypeInfo(_T5),NoParams, pointer(432));

RegRegisterMethod(TClientDataSet,'AddIndex',TypeInfo(_T6),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TIndexOptions)],Addr(TClientDataSet.AddIndex));

RegRegisterMethod(TClientDataSet,'AppendData',TypeInfo(_T7),[
TypeInfo(OleVariant),
TypeInfo(Boolean)],Addr(TClientDataSet.AppendData));

RegRegisterMethod(TClientDataSet,'ApplyRange',TypeInfo(_T8),NoParams,Addr(TClientDataSet.ApplyRange));

RegRegisterMethod(TClientDataSet,'ApplyUpdates',TypeInfo(_T9),[
TypeInfo(Integer),TypeInfo(Integer)],Addr(TClientDataSet.ApplyUpdates));

RegRegisterMethod(TClientDataSet,'CancelRange',TypeInfo(_T10),NoParams,Addr(TClientDataSet.CancelRange));

RegRegisterMethod(TClientDataSet,'CancelUpdates',TypeInfo(_T11),NoParams,Addr(TClientDataSet.CancelUpdates));

RegRegisterMethod(TClientDataSet,'CreateDataSet',TypeInfo(_T12),NoParams,Addr(TClientDataSet.CreateDataSet));

RegRegisterMethod(TClientDataSet,'CloneCursor',TypeInfo(_T13),[
TypeInfo(TClientDataSet),
TypeInfo(Boolean)],Addr(TClientDataSet.CloneCursor));

RegRegisterMethod(TClientDataSet,'ConstraintsDisabled',TypeInfo(_T14),[TypeInfo(Boolean)],Addr(TClientDataSet.ConstraintsDisabled));

RegRegisterMethod(TClientDataSet,'DeleteIndex',TypeInfo(_T15),[
TypeInfo(string)],Addr(TClientDataSet.DeleteIndex));

RegRegisterMethod(TClientDataSet,'DisableConstraints',TypeInfo(_T16),NoParams,Addr(TClientDataSet.DisableConstraints));

RegRegisterMethod(TClientDataSet,'EnableConstraints',TypeInfo(_T17),NoParams,Addr(TClientDataSet.EnableConstraints));

RegRegisterMethod(TClientDataSet,'EditKey',TypeInfo(_T18),NoParams,Addr(TClientDataSet.EditKey));

RegRegisterMethod(TClientDataSet,'EditRangeEnd',TypeInfo(_T19),NoParams,Addr(TClientDataSet.EditRangeEnd));

RegRegisterMethod(TClientDataSet,'EditRangeStart',TypeInfo(_T20),NoParams,Addr(TClientDataSet.EditRangeStart));

RegRegisterMethod(TClientDataSet,'EmptyDataSet',TypeInfo(_T21),NoParams,Addr(TClientDataSet.EmptyDataSet));

RegRegisterMethod(TClientDataSet,'FindKey',TypeInfo(_T22),[
TypeInfoArrayOfConst,TypeInfo(Boolean)],Addr(TClientDataSet.FindKey));

RegRegisterMethod(TClientDataSet,'FindNearest',TypeInfo(_T23),[
TypeInfoArrayOfConst],Addr(TClientDataSet.FindNearest));

RegRegisterMethod(TClientDataSet,'GetIndexInfo',TypeInfo(_T24),NoParams,Addr(TClientDataSet.GetIndexInfo));

RegRegisterMethod(TClientDataSet,'GetIndexNames',TypeInfo(_T25),[
TypeInfo(TStrings)],Addr(TClientDataSet.GetIndexNames));

RegRegisterMethod(TClientDataSet,'GetNextPacket',TypeInfo(_T26),[TypeInfo(Integer)],Addr(TClientDataSet.GetNextPacket));

RegRegisterMethod(TClientDataSet,'GotoCurrent',TypeInfo(_T27),[
TypeInfo(TClientDataSet)],Addr(TClientDataSet.GotoCurrent));

RegRegisterMethod(TClientDataSet,'GotoKey',TypeInfo(_T28),[TypeInfo(Boolean)],Addr(TClientDataSet.GotoKey));

RegRegisterMethod(TClientDataSet,'GotoNearest',TypeInfo(_T29),NoParams,Addr(TClientDataSet.GotoNearest));

RegRegisterMethod(TClientDataSet,'LoadFromFile',TypeInfo(_T30),[
TypeInfo(string)],Addr(TClientDataSet.LoadFromFile));

RegRegisterMethod(TClientDataSet,'LoadFromStream',TypeInfo(_T31),[
TypeInfo(TStream)],Addr(TClientDataSet.LoadFromStream));

RegRegisterMethod(TClientDataSet,'MergeChangeLog',TypeInfo(_T32),NoParams,Addr(TClientDataSet.MergeChangeLog));

RegRegisterMethod(TClientDataSet,'Reconcile',TypeInfo(_T33),[
TypeInfo(OleVariant),TypeInfo(Boolean)],Addr(TClientDataSet.Reconcile));

RegRegisterMethod(TClientDataSet,'RevertRecord',TypeInfo(_T34),NoParams,Addr(TClientDataSet.RevertRecord));

RegRegisterMethod(TClientDataSet,'SaveToFile',TypeInfo(_T35),[
TypeInfo(string)],Addr(TClientDataSet.SaveToFile));

RegRegisterMethod(TClientDataSet,'SaveToStream',TypeInfo(_T36),[
TypeInfo(TStream)],Addr(TClientDataSet.SaveToStream));

RegRegisterMethod(TClientDataSet,'SetKey',TypeInfo(_T38),NoParams,Addr(TClientDataSet.SetKey));

RegRegisterMethod(TClientDataSet,'SetRange',TypeInfo(_T39),[
TypeInfoArrayOfConst,
TypeInfoArrayOfConst],Addr(TClientDataSet.SetRange));

RegRegisterMethod(TClientDataSet,'SetRangeEnd',TypeInfo(_T40),NoParams,Addr(TClientDataSet.SetRangeEnd));

RegRegisterMethod(TClientDataSet,'SetRangeStart',TypeInfo(_T41),NoParams,Addr(TClientDataSet.SetRangeStart));

RegRegisterMethod(TClientDataSet,'UndoLastChange',TypeInfo(_T42),[
TypeInfo(Boolean),TypeInfo(Boolean)],Addr(TClientDataSet.UndoLastChange));

RegRegisterMethod(TClientDataSet,'UpdateStatus',TypeInfo(_T43),[TypeInfo(TUpdateStatus)],Addr(TClientDataSet.UpdateStatus));

RegRegisterMethod(TCustomRemoteServer,'AddDataSet',TypeInfo(_T44),[
TypeInfo(TClientDataSet)], pointer(40));

RegRegisterMethod(TCustomRemoteServer,'DoConnect',TypeInfo(_T45),NoParams, pointer(44));

RegRegisterMethod(TCustomRemoteServer,'DoDisconnect',TypeInfo(_T46),NoParams, pointer(48));

RegRegisterMethod(TCustomRemoteServer,'GetConnected',TypeInfo(_T47),[TypeInfo(Boolean)], pointer(52));

RegRegisterMethod(TCustomRemoteServer,'RemoveDataSet',TypeInfo(_T50),[
TypeInfo(TClientDataSet)], pointer(64));

RegRegisterMethod(TCustomRemoteServer,'SetConnected',TypeInfo(_T51),[
TypeInfo(Boolean)], pointer(68));

RegRegisterMethod(TRemoteServer,'GetAppServer',TypeInfo(_T52),[TypeInfo(Variant)], pointer(72));

RegRegisterMethod(TRemoteServer,'SetAppServer',TypeInfo(_T53),[
TypeInfo(Variant)], pointer(76));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegRegisterMethod(TClientDataSet,'SetAltRecBuffers',TypeInfo(_T37),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfoPChar],Addr(TClientDataSet.SetAltRecBuffers))}

{RegRegisterMethod(TCustomRemoteServer,'GetProvider',TypeInfo(_T48),[
TypeInfo(string),TypeInfo(IProvider)], pointer(56))}

{RegRegisterMethod(TCustomRemoteServer,'GetProviderNames',TypeInfo(_T49),[
TypeInfo(TGetStrProc)], pointer(60))}

RegisterEvent(TypeInfo(TReconcileErrorEvent),[
TypeInfo(TClientDataSet),
TypeInfo(EReconcileError),
TypeInfo(TUpdateKind),
TypeInfo(TReconcileAction)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
