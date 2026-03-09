{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit PROVIDER_C4;
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
  ComObj,
  Classes,
  StdVcl,
  DbClient,
  DB,
  DsIntf,
  Provider;
function ConvertTPutFieldInfoToVariant(var R : TPutFieldInfo) : OleVariant;
function ConvertVariantToTPutFieldInfo(const V : OleVariant) : TPutFieldInfo;
function ConvertTSQLGenInfoToVariant(var R : TSQLGenInfo) : OleVariant;
function ConvertVariantToTSQLGenInfo(const V : OleVariant) : TSQLGenInfo;
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
procedure setFastScan(const val : Boolean);
function getFastScan : Boolean;
property FastScan : Boolean read getFastScan write setFastScan;
end;
type __TSQLGenInfo__Wrapper = class(TDCRecordWrapper)
private
fR : TSQLGenInfo;
public
function GetRecordPtr : pointer; override;
published
end;
type
_T0 = function (p0 : TPersistent;
const p1 : string): TObject of object;

_T1 = function (p0 : TPersistent;
const p1 : string): string of object;

_T2 = procedure (p0 : string;
p1 : Integer) of object;

_T3 = procedure (p0 : string;
p1 : string;
p2 : Integer;
p3 : Integer;
p4 : Exception) of object;

_T4 = procedure (p0 : TDataSet;
p1 : TClientDataSet) of object;

_T5 = procedure (p0 : TDataSet;
p1 : TClientDataSet;
p2 : Boolean) of object;

_T6 = function : TCustomResolver of object;

_T7 = procedure (p0 : Boolean;
p1 : Boolean;
p2 : TProviderOptions;
var p3 : Integer;
var p4 : OleVariant) of object;

_T8 = procedure (const p0 : string;
const p1 : OleVariant) of object;

_T9 = procedure (p0 : Integer;
const p1 : OleVariant) of object;

_T10 = function (const p0 : string;
p1 : TClientDataSet): string of object;

_T11 = function : Integer of object;

_T12 = function (p0 : Exception;
p1 : EUpdateError): EUpdateError of object;

_T13 = procedure  of object;

_T14 = function : OleVariant of object;

_T15 = function (const p0 : OleVariant): OleVariant of object;

{_T16 = function : IProvider of object;}

_T17 = _T14;

_T18 = _T14;

_T19 = function (p0 : Integer;
out p1 : Integer): OleVariant of object;

_T20 = function (var p0 : OleVariant;
p1 : Integer;
out p2 : Integer): OleVariant of object;

_T21 = function (p0 : OleVariant): OleVariant of object;

_T22 = procedure (p0 : WordBool) of object;

_T23 = procedure (p0 : OleVariant) of object;

_T24 = procedure (p0 : TUpdateTree) of object;

_T25 = _T13;

_T26 = _T13;

_T27 = _T24;

_T28 = _T24;

_T29 = _T24;

_T30 = _T24;

_T31 = _T24;

_T32 = _T24;

_T33 = _T15;

_T34 = function (const p0 : OleVariant;
p1 : Integer;
out p2 : Integer): OleVariant of object;

_T35 = procedure (p0 : TBaseProvider) of object;

_T36 = procedure (p0 : TDataSet;
var p1 : Integer;
out p2 : OleVariant) of object;

_T37 = procedure (p0 : TDataSet;
p1 : TList) of object;

_T38 = procedure (p0 : TDataSetProvider) of object;

_T39 = procedure (p0 : TDataSet) of object;

_T40 = procedure (p0 : TPacketDataSet) of object;

_T41 = function : Boolean of object;

_T42 = _T41;

_T43 = procedure (p0 : Boolean) of object;

_T44 = function : TUpdateKind of object;

_T45 = procedure (p0 : TCustomProvider) of object;

_T46 = procedure (p0 : TStringList;
p1 : TParams) of object;

_T47 = procedure (p0 : TStringList;
p1 : TParams;
p2 : TDataSet) of object;

_T48 = procedure (p0 : TBaseProvider;
const p1 : IDispatch) of object;

_T49 = procedure (p0 : TUpdateTree;
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
procedure __TPutFieldInfo__Wrapper.setFastScan(const val : Boolean);
begin
TPutFieldInfo(GetRecordPtr^).FastScan := val;
end;
function __TPutFieldInfo__Wrapper.getFastScan : Boolean;
begin
result := TPutFieldInfo(GetRecordPtr^).FastScan;
end;
function __TSQLGenInfo__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
function _TPutFieldInfo_ : IDispatch;
begin
  result := __TPutFieldInfo__Wrapper.Create;
end;
function _TSQLGenInfo_ : IDispatch;
begin
  result := __TSQLGenInfo__Wrapper.Create;
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

procedure __TSQLResolver__Create__Wrapper(__Instance : TSQLResolver;
p0 : TBaseProvider;
const p1 : IDispatch);
var
__p1 : ^TSQLGenInfo;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
TSQLResolver(__Instance).Create(p0,__p1^);
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

type __TSQLGenInfo__Wrapper__ = class(__TSQLGenInfo__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TSQLGenInfo__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTSQLGenInfoToVariant(var R : TSQLGenInfo) : OleVariant;
var
__rw : __TSQLGenInfo__Wrapper__;
begin
__rw := __TSQLGenInfo__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTSQLGenInfo(const V : OleVariant) : TSQLGenInfo;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TSQLGenInfo((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetEDSWriter__ErrorCode(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := EDSWriter(Instance).ErrorCode;
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

function __DC__GetTCustomProvider__Constraints(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomProvider(Instance).Constraints;
end;

procedure __DC__SetTCustomProvider__Constraints(Instance : TObject; Params : PVariantArgList);
begin
TCustomProvider(Instance).Constraints:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomProvider__Data(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomProvider(Instance).Data;
end;

function __DC__GetTDataPacketWriter__Constraints(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataPacketWriter(Instance).Constraints;
end;

procedure __DC__SetTDataPacketWriter__Constraints(Instance : TObject; Params : PVariantArgList);
begin
TDataPacketWriter(Instance).Constraints:=OleVariant(Params^[0]);
end;

function __DC__GetTDataPacketWriter__MetaData(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataPacketWriter(Instance).MetaData;
end;

procedure __DC__SetTDataPacketWriter__MetaData(Instance : TObject; Params : PVariantArgList);
begin
TDataPacketWriter(Instance).MetaData:=OleVariant(Params^[0]);
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

function __DC__GetTDataPacketWriter__UpdateMode(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDataPacketWriter(Instance).UpdateMode;
end;

procedure __DC__SetTDataPacketWriter__UpdateMode(Instance : TObject; Params : PVariantArgList);
begin
TDataPacketWriter(Instance).UpdateMode:=OleVariant(Params^[0]);
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
RegisterProperty(EUpdateError,'Context',__DC__GetEUpdateError__Context,nil);
RegisterProperty(EUpdateError,'ErrorCode',__DC__GetEUpdateError__ErrorCode,nil);
RegisterProperty(EUpdateError,'PreviousError',__DC__GetEUpdateError__PreviousError,nil);
RegisterProperty(EUpdateError,'OriginalException',__DC__GetEUpdateError__OriginalException,nil);
RegisterProperty(TBaseProvider,'Resolver',__DC__GetTBaseProvider__Resolver,nil);
RegisterProperty(TBaseProvider,'Options',__DC__GetTBaseProvider__Options,__DC__SetTBaseProvider__Options);
RegisterProperty(TCustomProvider,'Constraints',__DC__GetTCustomProvider__Constraints,__DC__SetTCustomProvider__Constraints);
RegisterProperty(TCustomProvider,'Data',__DC__GetTCustomProvider__Data,nil);
RegisterProperty(TDataPacketWriter,'Constraints',__DC__GetTDataPacketWriter__Constraints,__DC__SetTDataPacketWriter__Constraints);
RegisterProperty(TDataPacketWriter,'MetaData',__DC__GetTDataPacketWriter__MetaData,__DC__SetTDataPacketWriter__MetaData);
RegisterProperty(TDataPacketWriter,'Options',__DC__GetTDataPacketWriter__Options,__DC__SetTDataPacketWriter__Options);
RegisterProperty(TDataPacketWriter,'UpdateMode',__DC__GetTDataPacketWriter__UpdateMode,__DC__SetTDataPacketWriter__UpdateMode);
RegisterProperty(TPacketDataSet,'NewValuesModified',__DC__GetTPacketDataSet__NewValuesModified,nil);
RegisterProperty(TPacketDataSet,'StreamMetaData',__DC__GetTPacketDataSet__StreamMetaData,__DC__SetTPacketDataSet__StreamMetaData);
RegisterProperty(TPacketDataSet,'UseCurValues',__DC__GetTPacketDataSet__UseCurValues,__DC__SetTPacketDataSet__UseCurValues);
end;

const __ConstNames0 : array[0..10] of string = (
'poFetchBlobsOnDemand'
,'poFetchDetailsOnDemand'
,'poIncFieldProps'
,'poCascadeDeletes'
,'poCascadeUpdates'
,'poReadOnly'
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
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,poFetchBlobsOnDemand));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,poFetchDetailsOnDemand));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,poIncFieldProps));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,poCascadeDeletes));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,poCascadeUpdates));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,poReadOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,rrSkip));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,rrAbort));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,rrMerge));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,rrApply));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,rrIgnore));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..12] of TClass = (
EDSWriter,
EUpdateError,
TBaseProvider,
TCustomPacketWriter,
TCustomProvider,
TCustomResolver,
TDataPacketWriter,
TDataSetProvider,
TDataSetResolver,
TPacketDataSet,
TProviderObject,
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
const MethodNames : array[0..3] of string = (
'TPutFieldInfo'
,'TSQLGenInfo'
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
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(_TSQLGenInfo_)));
RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T0),[
TypeInfo(TPersistent),
TypeInfo(string),TypeInfo(TObject)],Addr(GetObjectProperty),cRegister);

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T1),[
TypeInfo(TPersistent),
TypeInfo(string),TypeInfo(string)],Addr(GetStringProperty),cRegister);

RegisterProc(EDSWriter,'Create',mtConstructor,TypeInfo(_T2),[
TypeInfo(string),
TypeInfo(Integer)],Addr(EDSWriter.Create),cRegister);

RegisterProc(EUpdateError,'Create',mtConstructor,TypeInfo(_T3),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Exception)],Addr(EUpdateError.Create),cRegister);

RegRegisterMethod(TBaseProvider,'LocateRecord',TypeInfo(_T4),[
TypeInfo(TDataSet),
TypeInfo(TClientDataSet)], pointer(88));

RegRegisterMethod(TBaseProvider,'UpdateRecord',TypeInfo(_T5),[
TypeInfo(TDataSet),
TypeInfo(TClientDataSet),
TypeInfo(Boolean)], pointer(92));

RegRegisterMethod(TBaseProvider,'CreateResolver',TypeInfo(_T6),[TypeInfo(TCustomResolver)], pointer(96));

RegRegisterMethod(TBaseProvider,'CreateDataPacket',TypeInfo(_T7),[
TypeInfo(Boolean),
TypeInfo(Boolean),
TypeInfo(TProviderOptions),
TypeInfo(Integer),
TypeInfo(OleVariant)], pointer(100));

RegRegisterMethod(TBaseProvider,'SetParamByName',TypeInfo(_T8),[
TypeInfo(string),
TypeInfo(OleVariant)], pointer(104));

RegRegisterMethod(TBaseProvider,'SetParamByIndex',TypeInfo(_T9),[
TypeInfo(Integer),
TypeInfo(OleVariant)], pointer(108));

RegRegisterMethod(TBaseProvider,'GetKeyFields',TypeInfo(_T10),[
TypeInfo(string),
TypeInfo(TClientDataSet),TypeInfo(string)], pointer(112));

RegRegisterMethod(TBaseProvider,'GetParamCount',TypeInfo(_T11),[TypeInfo(Integer)], pointer(116));

RegRegisterMethod(TBaseProvider,'GetUpdateException',TypeInfo(_T12),[
TypeInfo(Exception),
TypeInfo(EUpdateError),TypeInfo(EUpdateError)], pointer(120));

RegisterProc(TCustomPacketWriter,'Create',mtConstructor,TypeInfo(_T13),NoParams, pointer(0),cRegister);

RegRegisterMethod(TCustomProvider,'FetchParams',TypeInfo(_T14),[TypeInfo(OleVariant)], pointer(48));

RegRegisterMethod(TCustomProvider,'FetchData',TypeInfo(_T15),[
TypeInfo(OleVariant),TypeInfo(OleVariant)], pointer(52));

RegRegisterMethod(TCustomProvider,'Get_Data',TypeInfo(_T17),[TypeInfo(OleVariant)], pointer(60));

RegRegisterMethod(TCustomProvider,'GetMetaData',TypeInfo(_T18),[TypeInfo(OleVariant)], pointer(64));

RegRegisterMethod(TCustomProvider,'GetRecords',TypeInfo(_T19),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(OleVariant)], pointer(68));

RegRegisterMethod(TCustomProvider,'ApplyUpdates',TypeInfo(_T20),[
TypeInfo(OleVariant),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(OleVariant)], pointer(72));

RegRegisterMethod(TCustomProvider,'DataRequest',TypeInfo(_T21),[
TypeInfo(OleVariant),TypeInfo(OleVariant)], pointer(76));

RegRegisterMethod(TCustomProvider,'Reset',TypeInfo(_T22),[
TypeInfo(WordBool)], pointer(80));

RegRegisterMethod(TCustomProvider,'SetParams',TypeInfo(_T23),[
TypeInfo(OleVariant)], pointer(84));

RegRegisterMethod(TCustomResolver,'InternalBeforeResolve',TypeInfo(_T24),[
TypeInfo(TUpdateTree)], pointer(48));

RegRegisterMethod(TCustomResolver,'BeginUpdate',TypeInfo(_T25),NoParams, pointer(52));

RegRegisterMethod(TCustomResolver,'EndUpdate',TypeInfo(_T26),NoParams, pointer(56));

RegRegisterMethod(TCustomResolver,'InitTreeData',TypeInfo(_T27),[
TypeInfo(TUpdateTree)], pointer(60));

RegRegisterMethod(TCustomResolver,'FreeTreeData',TypeInfo(_T28),[
TypeInfo(TUpdateTree)], pointer(64));

RegRegisterMethod(TCustomResolver,'InitializeConflictBuffer',TypeInfo(_T29),[
TypeInfo(TUpdateTree)], pointer(68));

RegRegisterMethod(TCustomResolver,'DoUpdate',TypeInfo(_T30),[
TypeInfo(TUpdateTree)], pointer(72));

RegRegisterMethod(TCustomResolver,'DoDelete',TypeInfo(_T31),[
TypeInfo(TUpdateTree)], pointer(76));

RegRegisterMethod(TCustomResolver,'DoInsert',TypeInfo(_T32),[
TypeInfo(TUpdateTree)], pointer(80));

RegRegisterMethod(TCustomResolver,'FetchData',TypeInfo(_T33),[
TypeInfo(OleVariant),TypeInfo(OleVariant)], pointer(84));

RegRegisterMethod(TCustomResolver,'ApplyUpdates',TypeInfo(_T34),[
TypeInfo(OleVariant),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(OleVariant)], pointer(88));

RegisterProc(TCustomResolver,'Create',mtConstructor,TypeInfo(_T35),[
TypeInfo(TBaseProvider)],Addr(TCustomResolver.Create),cRegister);

RegRegisterMethod(TDataPacketWriter,'GetDataPacket',TypeInfo(_T36),[
TypeInfo(TDataSet),
TypeInfo(Integer),
TypeInfo(OleVariant)],Addr(TDataPacketWriter.GetDataPacket));

RegRegisterMethod(TDataSetProvider,'DoGetParams',TypeInfo(_T37),[
TypeInfo(TDataSet),
TypeInfo(TList)], pointer(124));

RegisterProc(TDataSetResolver,'Create',mtConstructor,TypeInfo(_T38),[
TypeInfo(TDataSetProvider)],Addr(TDataSetResolver.Create),cRegister);

RegRegisterMethod(TPacketDataSet,'AssignCurValues',TypeInfo(_T39),[
TypeInfo(TDataSet)],Addr(TPacketDataSet.AssignCurValues));

RegRegisterMethod(TPacketDataSet,'CreateFromDelta',TypeInfo(_T40),[
TypeInfo(TPacketDataSet)],Addr(TPacketDataSet.CreateFromDelta));

RegRegisterMethod(TPacketDataSet,'HasCurValues',TypeInfo(_T41),[TypeInfo(Boolean)],Addr(TPacketDataSet.HasCurValues));

RegRegisterMethod(TPacketDataSet,'HasMergeConflicts',TypeInfo(_T42),[TypeInfo(Boolean)],Addr(TPacketDataSet.HasMergeConflicts));

RegisterProc(TPacketDataSet,'InitAltRecBuffers',mtScriptMethod,TypeInfo(_T43),[
TypeInfo(Boolean)],Addr(__TPacketDataSet__InitAltRecBuffers__Wrapper),cRegister);

RegRegisterMethod(TPacketDataSet,'UpdateKind',TypeInfo(_T44),[TypeInfo(TUpdateKind)],Addr(TPacketDataSet.UpdateKind));

RegisterProc(TProviderObject,'Create',mtConstructor,TypeInfo(_T45),[
TypeInfo(TCustomProvider)],Addr(TProviderObject.Create),cRegister);

RegRegisterMethod(TSQLResolver,'DoExecSQL',TypeInfo(_T46),[
TypeInfo(TStringList),
TypeInfo(TParams)], pointer(92));

RegRegisterMethod(TSQLResolver,'DoGetValues',TypeInfo(_T47),[
TypeInfo(TStringList),
TypeInfo(TParams),
TypeInfo(TDataSet)], pointer(96));

RegisterProc(TSQLResolver,'Create',mtConstructor,TypeInfo(_T48),[
TypeInfo(TBaseProvider),
TypeInfo(IDispatch)], pointer(100),cRegister);

RegisterProc(TUpdateTree,'Create',mtConstructor,TypeInfo(_T49),[
TypeInfo(TUpdateTree),
TypeInfo(TCustomResolver)],Addr(TUpdateTree.Create),cRegister);

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegRegisterMethod(TCustomProvider,'GetProvider',TypeInfo(_T16),[TypeInfo(IProvider)], pointer(56))}

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

RegisterEvent(TypeInfo(TExecSQLProc),[
TypeInfo(TObject),
TypeInfo(TStringList),
TypeInfo(TParams)]);

RegisterEvent(TypeInfo(TGetDSProps),[
TypeInfo(TObject),
TypeInfo(TDataSet),
TypeInfo(OleVariant)]);

RegisterEvent(TypeInfo(TGetParamsEvent),[
TypeInfo(TDataSet),
TypeInfo(TList)]);

RegisterEvent(TypeInfo(TGetValuesProc),[
TypeInfo(TObject),
TypeInfo(TStringList),
TypeInfo(TParams),
TypeInfo(TDataSet)]);

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
