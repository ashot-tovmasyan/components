{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit PROVIDER_C5;
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
  Classes,
  DbClient,
  DB,
  DsIntf,
  ActiveX,
  Midas,
  Provider;
function ConvertTPutFieldInfoToVariant(var R : TPutFieldInfo) : OleVariant;
function ConvertVariantToTPutFieldInfo(const V : OleVariant) : TPutFieldInfo;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TPutFieldInfo__Wrapper = class(TDCRecordWrapper)
private
fR : TPutFieldInfo;
public
function GetRecordPtr : pointer; override;
published
procedure setFieldNo(const val : Integer);
function getFieldNo : Integer;
property FieldNo : Integer read getFieldNo write setFieldNo;
procedure setField(const val : TField);
function getField : TField;
property Field : TField read getField write setField;
procedure setDataSet(const val : TDataSet);
function getDataSet : TDataSet;
property DataSet : TDataSet read getDataSet write setDataSet;
procedure setSize(const val : Integer);
function getSize : Integer;
property Size : Integer read getSize write setSize;
procedure setIsDetail(const val : Boolean);
function getIsDetail : Boolean;
property IsDetail : Boolean read getIsDetail write setIsDetail;
procedure setOpened(const val : Boolean);
function getOpened : Boolean;
property Opened : Boolean read getOpened write setOpened;
procedure setLocalFieldIndex(const val : Integer);
function getLocalFieldIndex : Integer;
property LocalFieldIndex : Integer read getLocalFieldIndex write setLocalFieldIndex;
end;
type __TCustomProvider__ = class(TCustomProvider);
type
_T0 = function (p0 : TPersistent;
const p1 : string): TObject of object;

_T1 = function (p0 : TPersistent;
const p1 : string): string of object;

_T2 = procedure (p0 : string;
p1 : Integer) of object;

_T3 = function : TCustomResolver of object;

_T4 = procedure (p0 : TGetRecordOptions;
p1 : TProviderOptions;
var p2 : Integer;
var p3 : OleVariant) of object;

_T5 = procedure (p0 : TDataSet;
p1 : TDataSet) of object;

_T6 = procedure (p0 : TDataSet;
p1 : TDataSet;
p2 : Boolean;
p3 : Boolean) of object;

_T7 = _T5;

_T8 = procedure  of object;

_T9 = function (const p0 : OleVariant;
p1 : Integer;
out p2 : Integer): OleVariant of object;

_T10 = function (p0 : Integer;
out p1 : Integer;
p2 : TGetRecordOptions;
const p3 : WideString;
var p4 : OleVariant): OleVariant of object;

_T11 = function (const p0 : OleVariant;
p1 : TFetchOptions): OleVariant of object;

_T12 = procedure (const p0 : WideString;
var p1 : OleVariant) of object;

_T13 = function (p0 : TParamTypes): OleVariant of object;

_T14 = procedure (p0 : Integer;
p1 : Integer;
const p2 : WideString;
var p3 : OleVariant;
var p4 : OleVariant) of object;

_T15 = procedure (const p0 : WideString;
var p1 : OleVariant;
var p2 : OleVariant) of object;

_T16 = _T9;

_T17 = function (p0 : Integer;
out p1 : Integer;
p2 : Integer): OleVariant of object;

_T18 = function (const p0 : OleVariant;
p1 : Integer;
var p2 : OleVariant): OleVariant of object;

_T19 = _T15;

_T20 = function (var p0 : OleVariant): OleVariant of object;

_T21 = function (p0 : OleVariant): OleVariant of object;

_T22 = procedure (p0 : TUpdateTree) of object;

_T23 = _T8;

_T24 = _T8;

_T25 = _T22;

_T26 = _T22;

_T27 = _T22;

_T28 = _T22;

_T29 = _T22;

_T30 = _T22;

_T31 = function (p0 : OleVariant;
p1 : TFetchOptions): OleVariant of object;

_T32 = _T9;

_T33 = procedure (p0 : TBaseProvider) of object;

_T34 = procedure (p0 : TDataSet;
var p1 : Integer;
out p2 : OleVariant) of object;

_T35 = procedure (p0 : TDataSet;
var p1 : string) of object;

_T36 = procedure (p0 : TDataSet;
p1 : TList) of object;

_T37 = procedure (p0 : TDataSetProvider) of object;

_T38 = procedure (p0 : TCustomProvider) of object;

_T39 = procedure (p0 : TDataSet) of object;

_T40 = procedure (p0 : TPacketDataSet) of object;

_T41 = function : Boolean of object;

_T42 = _T41;

_T43 = procedure (p0 : Boolean) of object;

_T44 = function : TUpdateKind of object;

_T45 = procedure (p0 : TStringList;
p1 : TParams) of object;

_T46 = procedure (p0 : TStringList;
p1 : TParams;
p2 : TDataSet) of object;

_T47 = _T37;

_T48 = procedure (p0 : TUpdateTree;
p1 : TCustomResolver) of object;

function __TPutFieldInfo__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TPutFieldInfo__Wrapper.setFieldNo(const val : Integer);
begin
TPutFieldInfo(GetRecordPtr^).FieldNo := val;
end;
function __TPutFieldInfo__Wrapper.getFieldNo : Integer;
begin
result := TPutFieldInfo(GetRecordPtr^).FieldNo;
end;
procedure __TPutFieldInfo__Wrapper.setField(const val : TField);
begin
TPutFieldInfo(GetRecordPtr^).Field := val;
end;
function __TPutFieldInfo__Wrapper.getField : TField;
begin
result := TPutFieldInfo(GetRecordPtr^).Field;
end;
procedure __TPutFieldInfo__Wrapper.setDataSet(const val : TDataSet);
begin
TPutFieldInfo(GetRecordPtr^).DataSet := val;
end;
function __TPutFieldInfo__Wrapper.getDataSet : TDataSet;
begin
result := TPutFieldInfo(GetRecordPtr^).DataSet;
end;
procedure __TPutFieldInfo__Wrapper.setSize(const val : Integer);
begin
TPutFieldInfo(GetRecordPtr^).Size := val;
end;
function __TPutFieldInfo__Wrapper.getSize : Integer;
begin
result := TPutFieldInfo(GetRecordPtr^).Size;
end;
procedure __TPutFieldInfo__Wrapper.setIsDetail(const val : Boolean);
begin
TPutFieldInfo(GetRecordPtr^).IsDetail := val;
end;
function __TPutFieldInfo__Wrapper.getIsDetail : Boolean;
begin
result := TPutFieldInfo(GetRecordPtr^).IsDetail;
end;
procedure __TPutFieldInfo__Wrapper.setOpened(const val : Boolean);
begin
TPutFieldInfo(GetRecordPtr^).Opened := val;
end;
function __TPutFieldInfo__Wrapper.getOpened : Boolean;
begin
result := TPutFieldInfo(GetRecordPtr^).Opened;
end;
procedure __TPutFieldInfo__Wrapper.setLocalFieldIndex(const val : Integer);
begin
TPutFieldInfo(GetRecordPtr^).LocalFieldIndex := val;
end;
function __TPutFieldInfo__Wrapper.getLocalFieldIndex : Integer;
begin
result := TPutFieldInfo(GetRecordPtr^).LocalFieldIndex;
end;
function _TPutFieldInfo_ : IDispatch;
begin
  result := __TPutFieldInfo__Wrapper.Create;
end;
function __TCustomProvider__InternalGetParams__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList) : OleVariant;
var
__s0 : TParamTypes;
begin
if cArgs > 0 then
VarToSet(__s0,OleVariant(pargs^[0]),SizeOf(TParamTypes));
case cArgs of
0:
begin
result := __TCustomProvider__(__Instance).InternalGetParams;
end;
1:
begin
result := __TCustomProvider__(__Instance).InternalGetParams(__s0);
end;
end
end;

procedure __TPacketDataSet__InitAltRecBuffers__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
0:
begin
TPacketDataSet(__Instance).InitAltRecBuffers;
end;
1:
begin
TPacketDataSet(__Instance).InitAltRecBuffers(OleVariant(pargs^[0]));
end;
end
end;


type __TPutFieldInfo__Wrapper__ = class(__TPutFieldInfo__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TPutFieldInfo__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTPutFieldInfoToVariant(var R : TPutFieldInfo) : OleVariant;
var
__rw : __TPutFieldInfo__Wrapper__;
begin
__rw := __TPutFieldInfo__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTPutFieldInfo(const V : OleVariant) : TPutFieldInfo;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TPutFieldInfo((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetEDSWriter__ErrorCode(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := EDSWriter(Instance).ErrorCode;
end;

function __DC__GetTBaseProvider__Resolver(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TBaseProvider(Instance).Resolver);
end;

function __DC__GetTBaseProvider__Options(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TProviderOptions;
begin
tmp := TBaseProvider(Instance).Options;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTBaseProvider__Options(Instance : TObject; Params : PVariantArgList);
var
  tmp : TProviderOptions;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TBaseProvider(Instance).Options:=tmp;
end;

function __DC__GetTBaseProvider__UpdateMode(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TBaseProvider(Instance).UpdateMode;
end;

procedure __DC__SetTBaseProvider__UpdateMode(Instance : TObject; Params : PVariantArgList);
begin
TBaseProvider(Instance).UpdateMode:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomProvider__Data(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomProvider(Instance).Data;
end;

function __DC__GetTCustomProvider__Exported(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomProvider(Instance).Exported;
end;

procedure __DC__SetTCustomProvider__Exported(Instance : TObject; Params : PVariantArgList);
begin
TCustomProvider(Instance).Exported:=OleVariant(Params^[0]);
end;

function __DC__GetTDataPacketWriter__Constraints(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataPacketWriter(Instance).Constraints;
end;

procedure __DC__SetTDataPacketWriter__Constraints(Instance : TObject; Params : PVariantArgList);
begin
TDataPacketWriter(Instance).Constraints:=OleVariant(Params^[0]);
end;

function __DC__GetTDataPacketWriter__PacketOptions(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TGetRecordOptions;
begin
tmp := TDataPacketWriter(Instance).PacketOptions;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTDataPacketWriter__PacketOptions(Instance : TObject; Params : PVariantArgList);
var
  tmp : TGetRecordOptions;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TDataPacketWriter(Instance).PacketOptions:=tmp;
end;

function __DC__GetTDataPacketWriter__Options(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TProviderOptions;
begin
tmp := TDataPacketWriter(Instance).Options;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTDataPacketWriter__Options(Instance : TObject; Params : PVariantArgList);
var
  tmp : TProviderOptions;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TDataPacketWriter(Instance).Options:=tmp;
end;

function __DC__GetTPacketDataSet__NewValuesModified(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPacketDataSet(Instance).NewValuesModified;
end;

function __DC__GetTPacketDataSet__StreamMetaData(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPacketDataSet(Instance).StreamMetaData;
end;

procedure __DC__SetTPacketDataSet__StreamMetaData(Instance : TObject; Params : PVariantArgList);
begin
TPacketDataSet(Instance).StreamMetaData:=OleVariant(Params^[0]);
end;

function __DC__GetTPacketDataSet__UseCurValues(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPacketDataSet(Instance).UseCurValues;
end;

procedure __DC__SetTPacketDataSet__UseCurValues(Instance : TObject; Params : PVariantArgList);
begin
TPacketDataSet(Instance).UseCurValues:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
RegisterProperty(EDSWriter,'ErrorCode',__DC__GetEDSWriter__ErrorCode,nil);
RegisterProperty(TBaseProvider,'Resolver',__DC__GetTBaseProvider__Resolver,nil);
RegisterProperty(TBaseProvider,'Options',__DC__GetTBaseProvider__Options,__DC__SetTBaseProvider__Options);
RegisterProperty(TBaseProvider,'UpdateMode',__DC__GetTBaseProvider__UpdateMode,__DC__SetTBaseProvider__UpdateMode);
RegisterProperty(TCustomProvider,'Data',__DC__GetTCustomProvider__Data,nil);
RegisterProperty(TCustomProvider,'Exported',__DC__GetTCustomProvider__Exported,__DC__SetTCustomProvider__Exported);
RegisterProperty(TDataPacketWriter,'Constraints',__DC__GetTDataPacketWriter__Constraints,__DC__SetTDataPacketWriter__Constraints);
RegisterProperty(TDataPacketWriter,'PacketOptions',__DC__GetTDataPacketWriter__PacketOptions,__DC__SetTDataPacketWriter__PacketOptions);
RegisterProperty(TDataPacketWriter,'Options',__DC__GetTDataPacketWriter__Options,__DC__SetTDataPacketWriter__Options);
RegisterProperty(TPacketDataSet,'NewValuesModified',__DC__GetTPacketDataSet__NewValuesModified,nil);
RegisterProperty(TPacketDataSet,'StreamMetaData',__DC__GetTPacketDataSet__StreamMetaData,__DC__SetTPacketDataSet__StreamMetaData);
RegisterProperty(TPacketDataSet,'UseCurValues',__DC__GetTPacketDataSet__UseCurValues,__DC__SetTPacketDataSet__UseCurValues);
end;

const __ConstNames0 : array[0..21] of string = (
'grMetaData'
,'grReset'
,'grXML'
,'poFetchBlobsOnDemand'
,'poFetchDetailsOnDemand'
,'poIncFieldProps'
,'poCascadeDeletes'
,'poCascadeUpdates'
,'poReadOnly'
,'poAllowMultiRecordUpdates'
,'poDisableInserts'
,'poDisableEdits'
,'poDisableDeletes'
,'poNoReset'
,'poAutoRefresh'
,'poPropogateChanges'
,'poAllowCommandText'
,'rrSkip'
,'rrAbort'
,'rrMerge'
,'rrApply'
,'rrIgnore'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,grMetaData));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,grReset));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,grXML));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,poFetchBlobsOnDemand));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,poFetchDetailsOnDemand));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,poIncFieldProps));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,poCascadeDeletes));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,poCascadeUpdates));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,poReadOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,poAllowMultiRecordUpdates));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,poDisableInserts));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,poDisableEdits));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,poDisableDeletes));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,poNoReset));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,poAutoRefresh));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,poPropogateChanges));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,poAllowCommandText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,rrSkip));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,rrAbort));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,rrMerge));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,rrApply));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,rrIgnore));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..12] of TClass = (
EDSWriter,
TBaseProvider,
TCustomPacketWriter,
TCustomProvider,
TCustomResolver,
TDataPacketWriter,
TDataSetProvider,
TDataSetResolver,
TLocalAppServer,
TPacketDataSet,
TProvider,
TSQLResolver,
TUpdateTree
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..2] of string = (
'TPutFieldInfo'
,'GetObjectProperty'
,'GetStringProperty'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TPutFieldInfo_)));
RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T0),[
TypeInfo(TPersistent),
TypeInfo(string),TypeInfo(TObject)],Addr(GetObjectProperty),cRegister);

RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T1),[
TypeInfo(TPersistent),
TypeInfo(string),TypeInfo(string)],Addr(GetStringProperty),cRegister);

RegisterProc(EDSWriter,'Create',mtConstructor,TypeInfo(_T2),[
TypeInfo(string),
TypeInfo(Integer)],Addr(EDSWriter.Create),cRegister);

RegRegisterMethod(TBaseProvider,'CreateResolver',TypeInfo(_T3),[TypeInfo(TCustomResolver)], pointer(80));

RegRegisterMethod(TBaseProvider,'CreateDataPacket',TypeInfo(_T4),[
TypeInfo(TGetRecordOptions),
TypeInfo(TProviderOptions),
TypeInfo(Integer),
TypeInfo(OleVariant)], pointer(84));

RegRegisterMethod(TBaseProvider,'LocateRecord',TypeInfo(_T5),[
TypeInfo(TDataSet),
TypeInfo(TDataSet)], pointer(88));

RegRegisterMethod(TBaseProvider,'UpdateRecord',TypeInfo(_T6),[
TypeInfo(TDataSet),
TypeInfo(TDataSet),
TypeInfo(Boolean),
TypeInfo(Boolean)], pointer(92));

RegRegisterMethod(TBaseProvider,'FetchDetails',TypeInfo(_T7),[
TypeInfo(TDataSet),
TypeInfo(TDataSet)], pointer(96));

RegisterProc(TCustomPacketWriter,'Create',mtConstructor,TypeInfo(_T8),NoParams, pointer(0),cRegister);

RegRegisterMethod(TCustomProvider,'InternalApplyUpdates',TypeInfo(_T9),[
TypeInfo(OleVariant),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(OleVariant)], pointer(48));

RegRegisterMethod(TCustomProvider,'InternalGetRecords',TypeInfo(_T10),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TGetRecordOptions),
TypeInfo(WideString),
TypeInfo(OleVariant),TypeInfo(OleVariant)], pointer(52));

RegRegisterMethod(TCustomProvider,'InternalRowRequest',TypeInfo(_T11),[
TypeInfo(OleVariant),
TypeInfo(TFetchOptions),TypeInfo(OleVariant)], pointer(56));

RegRegisterMethod(TCustomProvider,'InternalExecute',TypeInfo(_T12),[
TypeInfo(WideString),
TypeInfo(OleVariant)], pointer(60));

RegisterProc(TCustomProvider,'InternalGetParams',mtScriptMethod,TypeInfo(_T13),[
TypeInfo(TParamTypes),TypeInfo(OleVariant)],Addr(__TCustomProvider__InternalGetParams__Wrapper),cRegister);

RegRegisterMethod(TCustomProvider,'DoBeforeGetRecords',TypeInfo(_T14),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(WideString),
TypeInfo(OleVariant),
TypeInfo(OleVariant)], pointer(68));

RegRegisterMethod(TCustomProvider,'DoBeforeExecute',TypeInfo(_T15),[
TypeInfo(WideString),
TypeInfo(OleVariant),
TypeInfo(OleVariant)], pointer(72));

RegRegisterMethod(TCustomProvider,'ApplyUpdates',TypeInfo(_T16),[
TypeInfo(OleVariant),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(OleVariant)],Addr(TCustomProvider.ApplyUpdates));

RegRegisterMethod(TCustomProvider,'GetRecords',TypeInfo(_T17),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(OleVariant)],Addr(TCustomProvider.GetRecords));

RegRegisterMethod(TCustomProvider,'RowRequest',TypeInfo(_T18),[
TypeInfo(OleVariant),
TypeInfo(Integer),
TypeInfo(OleVariant),TypeInfo(OleVariant)],Addr(TCustomProvider.RowRequest));

RegRegisterMethod(TCustomProvider,'Execute',TypeInfo(_T19),[
TypeInfo(WideString),
TypeInfo(OleVariant),
TypeInfo(OleVariant)],Addr(TCustomProvider.Execute));

RegRegisterMethod(TCustomProvider,'GetParams',TypeInfo(_T20),[
TypeInfo(OleVariant),TypeInfo(OleVariant)],Addr(TCustomProvider.GetParams));

RegRegisterMethod(TCustomProvider,'DataRequest',TypeInfo(_T21),[
TypeInfo(OleVariant),TypeInfo(OleVariant)], pointer(76));

RegRegisterMethod(TCustomResolver,'InternalBeforeResolve',TypeInfo(_T22),[
TypeInfo(TUpdateTree)], pointer(48));

RegRegisterMethod(TCustomResolver,'BeginUpdate',TypeInfo(_T23),NoParams, pointer(52));

RegRegisterMethod(TCustomResolver,'EndUpdate',TypeInfo(_T24),NoParams, pointer(56));

RegRegisterMethod(TCustomResolver,'InitTreeData',TypeInfo(_T25),[
TypeInfo(TUpdateTree)], pointer(60));

RegRegisterMethod(TCustomResolver,'FreeTreeData',TypeInfo(_T26),[
TypeInfo(TUpdateTree)], pointer(64));

RegRegisterMethod(TCustomResolver,'InitializeConflictBuffer',TypeInfo(_T27),[
TypeInfo(TUpdateTree)], pointer(68));

RegRegisterMethod(TCustomResolver,'DoUpdate',TypeInfo(_T28),[
TypeInfo(TUpdateTree)], pointer(72));

RegRegisterMethod(TCustomResolver,'DoDelete',TypeInfo(_T29),[
TypeInfo(TUpdateTree)], pointer(76));

RegRegisterMethod(TCustomResolver,'DoInsert',TypeInfo(_T30),[
TypeInfo(TUpdateTree)], pointer(80));

RegRegisterMethod(TCustomResolver,'RowRequest',TypeInfo(_T31),[
TypeInfo(OleVariant),
TypeInfo(TFetchOptions),TypeInfo(OleVariant)], pointer(84));

RegRegisterMethod(TCustomResolver,'ApplyUpdates',TypeInfo(_T32),[
TypeInfo(OleVariant),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(OleVariant)], pointer(88));

RegisterProc(TCustomResolver,'Create',mtConstructor,TypeInfo(_T33),[
TypeInfo(TBaseProvider)],Addr(TCustomResolver.Create),cRegister);

RegRegisterMethod(TDataPacketWriter,'GetDataPacket',TypeInfo(_T34),[
TypeInfo(TDataSet),
TypeInfo(Integer),
TypeInfo(OleVariant)],Addr(TDataPacketWriter.GetDataPacket));

RegRegisterMethod(TDataSetProvider,'DoGetTableName',TypeInfo(_T35),[
TypeInfo(TDataSet),
TypeInfo(string)], pointer(100));

RegRegisterMethod(TDataSetProvider,'DoGetProviderAttributes',TypeInfo(_T36),[
TypeInfo(TDataSet),
TypeInfo(TList)], pointer(104));

RegisterProc(TDataSetResolver,'Create',mtConstructor,TypeInfo(_T37),[
TypeInfo(TDataSetProvider)],Addr(TDataSetResolver.Create),cRegister);

RegisterProc(TLocalAppServer,'Create',mtConstructor,TypeInfo(_T38),[
TypeInfo(TCustomProvider)],Addr(TLocalAppServer.Create),cRegister);

RegRegisterMethod(TPacketDataSet,'AssignCurValues',TypeInfo(_T39),[
TypeInfo(TDataSet)],Addr(TPacketDataSet.AssignCurValues));

RegRegisterMethod(TPacketDataSet,'CreateFromDelta',TypeInfo(_T40),[
TypeInfo(TPacketDataSet)],Addr(TPacketDataSet.CreateFromDelta));

RegRegisterMethod(TPacketDataSet,'HasCurValues',TypeInfo(_T41),[TypeInfo(Boolean)],Addr(TPacketDataSet.HasCurValues));

RegRegisterMethod(TPacketDataSet,'HasMergeConflicts',TypeInfo(_T42),[TypeInfo(Boolean)],Addr(TPacketDataSet.HasMergeConflicts));

RegisterProc(TPacketDataSet,'InitAltRecBuffers',mtScriptMethod,TypeInfo(_T43),[
TypeInfo(Boolean)],Addr(__TPacketDataSet__InitAltRecBuffers__Wrapper),cRegister);

RegRegisterMethod(TPacketDataSet,'UpdateKind',TypeInfo(_T44),[TypeInfo(TUpdateKind)],Addr(TPacketDataSet.UpdateKind));

RegRegisterMethod(TSQLResolver,'DoExecSQL',TypeInfo(_T45),[
TypeInfo(TStringList),
TypeInfo(TParams)], pointer(92));

RegRegisterMethod(TSQLResolver,'DoGetValues',TypeInfo(_T46),[
TypeInfo(TStringList),
TypeInfo(TParams),
TypeInfo(TDataSet)], pointer(96));

RegisterProc(TSQLResolver,'Create',mtConstructor,TypeInfo(_T47),[
TypeInfo(TDataSetProvider)],Addr(TSQLResolver.Create),cRegister);

RegisterProc(TUpdateTree,'Create',mtConstructor,TypeInfo(_T48),[
TypeInfo(TUpdateTree),
TypeInfo(TCustomResolver)],Addr(TUpdateTree.Create),cRegister);

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
RegisterEvent(TypeInfo(TAfterUpdateRecordEvent),[
TypeInfo(TObject),
TypeInfo(TDataSet),
TypeInfo(TClientDataSet),
TypeInfo(TUpdateKind)]);

RegisterEvent(TypeInfo(TBeforeUpdateRecordEvent),[
TypeInfo(TObject),
TypeInfo(TDataSet),
TypeInfo(TClientDataSet),
TypeInfo(TUpdateKind),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TDataRequestEvent),[
TypeInfo(TObject),
TypeInfo(OleVariant),TypeInfo(OleVariant)]);

RegisterEvent(TypeInfo(TGetDSProps),[
TypeInfo(TObject),
TypeInfo(TDataSet),
TypeInfo(OleVariant)]);

RegisterEvent(TypeInfo(TGetParamsEvent),[
TypeInfo(TDataSet),
TypeInfo(TList)]);

RegisterEvent(TypeInfo(TGetTableNameEvent),[
TypeInfo(TObject),
TypeInfo(TDataSet),
TypeInfo(string)]);

RegisterEvent(TypeInfo(TProviderDataEvent),[
TypeInfo(TObject),
TypeInfo(TClientDataSet)]);

{RegisterEvent(TypeInfo(TPutFieldProc),[
TypeInfoPointer]);}

RegisterEvent(TypeInfo(TResolverErrorEvent),[
TypeInfo(TObject),
TypeInfo(TClientDataSet),
TypeInfo(EUpdateError),
TypeInfo(TUpdateKind),
TypeInfo(TResolverResponse)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
