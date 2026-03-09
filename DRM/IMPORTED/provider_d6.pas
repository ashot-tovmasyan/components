{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit PROVIDER_D6;
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
  DBClient,
  DB,
  DSIntf,
  ActiveX,
  Midas,
  SqlTimSt,
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

_T2 = function (p0 : TStrings): Variant of object;

_T3 = procedure (p0 : string;
p1 : Integer) of object;

_T4 = function : TCustomResolver of object;

_T5 = procedure (p0 : TGetRecordOptions;
p1 : TProviderOptions;
var p2 : Integer;
var p3 : OleVariant) of object;

_T6 = procedure (p0 : TDataSet;
p1 : TDataSet) of object;

_T7 = procedure (p0 : TDataSet;
p1 : TDataSet;
p2 : Boolean;
p3 : Boolean) of object;

_T8 = _T6;

_T9 = procedure  of object;

_T10 = function (const p0 : OleVariant;
p1 : Integer;
out p2 : Integer): OleVariant of object;

_T11 = function (p0 : Integer;
out p1 : Integer;
p2 : TGetRecordOptions;
const p3 : WideString;
var p4 : OleVariant): OleVariant of object;

_T12 = function (const p0 : OleVariant;
p1 : TFetchOptions): OleVariant of object;

_T13 = procedure (const p0 : WideString;
var p1 : OleVariant) of object;

_T14 = function (p0 : TParamTypes): OleVariant of object;

_T15 = procedure (var p0 : OleVariant) of object;

_T16 = _T15;

_T17 = _T15;

_T18 = procedure (const p0 : WideString;
var p1 : OleVariant;
var p2 : OleVariant) of object;

_T19 = _T15;

_T20 = _T15;

_T21 = _T15;

_T22 = procedure (p0 : Integer;
p1 : Integer;
const p2 : WideString;
var p3 : OleVariant;
var p4 : OleVariant) of object;

_T23 = _T15;

_T24 = _T15;

_T25 = _T10;

_T26 = function (p0 : Integer;
out p1 : Integer;
p2 : Integer): OleVariant of object;

_T27 = function (const p0 : OleVariant;
p1 : Integer;
var p2 : OleVariant): OleVariant of object;

_T28 = _T18;

_T29 = function (var p0 : OleVariant): OleVariant of object;

_T30 = function (p0 : OleVariant): OleVariant of object;

_T31 = procedure (p0 : TUpdateTree) of object;

_T32 = _T9;

_T33 = _T9;

_T34 = _T31;

_T35 = _T31;

_T36 = _T31;

_T37 = _T31;

_T38 = _T31;

_T39 = _T31;

_T40 = function (p0 : OleVariant;
p1 : TFetchOptions): OleVariant of object;

_T41 = _T10;

_T42 = procedure (p0 : TBaseProvider) of object;

_T43 = procedure (p0 : TDataSet;
var p1 : Integer;
out p2 : OleVariant) of object;

_T44 = procedure (p0 : TDataSet;
var p1 : string) of object;

_T45 = procedure (p0 : TDataSet;
p1 : TList) of object;

_T46 = procedure (p0 : TDataSetProvider) of object;

_T47 = procedure (p0 : TCustomProvider) of object;

_T48 = procedure (p0 : TDataSet) of object;

_T49 = procedure (p0 : TPacketDataSet) of object;

_T50 = function : Boolean of object;

_T51 = _T50;

_T52 = procedure (p0 : Boolean) of object;

_T53 = function : TUpdateKind of object;

_T54 = procedure (p0 : TStringList;
p1 : TParams) of object;

_T55 = procedure (p0 : TStringList;
p1 : TParams;
p2 : TDataSet) of object;

_T56 = _T46;

_T57 = procedure (p0 : TUpdateTree;
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

const __ConstNames0 : array[0..27] of string = (
'grMetaData'
,'grReset'
,'grXML'
,'grXMLUTF8'
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
,'poRetainServerOrder'
,'ResetOption'
,'MetaDataOption'
,'XMLOption'
,'XMLUTF8Option'
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
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,grXMLUTF8));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,poFetchBlobsOnDemand));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,poFetchDetailsOnDemand));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,poIncFieldProps));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,poCascadeDeletes));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,poCascadeUpdates));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,poReadOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,poAllowMultiRecordUpdates));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,poDisableInserts));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,poDisableEdits));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,poDisableDeletes));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,poNoReset));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,poAutoRefresh));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,poPropogateChanges));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,poAllowCommandText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,poRetainServerOrder));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,ResetOption));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,MetaDataOption));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,XMLOption));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,XMLUTF8Option));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,rrSkip));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,rrAbort));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,rrMerge));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,rrApply));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,rrIgnore));
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
const MethodNames : array[0..3] of string = (
'TPutFieldInfo'
,'GetObjectProperty'
,'GetStringProperty'
,'VarArrayFromStrings'
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

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T2),[
TypeInfo(TStrings),TypeInfo(Variant)],Addr(VarArrayFromStrings),cRegister);

RegisterProc(EDSWriter,'Create',mtConstructor,TypeInfo(_T3),[
TypeInfo(string),
TypeInfo(Integer)],Addr(EDSWriter.Create),cRegister);

RegRegisterMethod(TBaseProvider,'CreateResolver',TypeInfo(_T4),[TypeInfo(TCustomResolver)], pointer(112));

RegRegisterMethod(TBaseProvider,'CreateDataPacket',TypeInfo(_T5),[
TypeInfo(TGetRecordOptions),
TypeInfo(TProviderOptions),
TypeInfo(Integer),
TypeInfo(OleVariant)], pointer(116));

RegRegisterMethod(TBaseProvider,'LocateRecord',TypeInfo(_T6),[
TypeInfo(TDataSet),
TypeInfo(TDataSet)], pointer(120));

RegRegisterMethod(TBaseProvider,'UpdateRecord',TypeInfo(_T7),[
TypeInfo(TDataSet),
TypeInfo(TDataSet),
TypeInfo(Boolean),
TypeInfo(Boolean)], pointer(124));

RegRegisterMethod(TBaseProvider,'FetchDetails',TypeInfo(_T8),[
TypeInfo(TDataSet),
TypeInfo(TDataSet)], pointer(128));

RegisterProc(TCustomPacketWriter,'Create',mtConstructor,TypeInfo(_T9),NoParams, pointer(0),cRegister);

RegRegisterMethod(TCustomProvider,'InternalApplyUpdates',TypeInfo(_T10),[
TypeInfo(OleVariant),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(OleVariant)], pointer(48));

RegRegisterMethod(TCustomProvider,'InternalGetRecords',TypeInfo(_T11),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TGetRecordOptions),
TypeInfo(WideString),
TypeInfo(OleVariant),TypeInfo(OleVariant)], pointer(52));

RegRegisterMethod(TCustomProvider,'InternalRowRequest',TypeInfo(_T12),[
TypeInfo(OleVariant),
TypeInfo(TFetchOptions),TypeInfo(OleVariant)], pointer(56));

RegRegisterMethod(TCustomProvider,'InternalExecute',TypeInfo(_T13),[
TypeInfo(WideString),
TypeInfo(OleVariant)], pointer(60));

RegisterProc(TCustomProvider,'InternalGetParams',mtScriptMethod,TypeInfo(_T14),[
TypeInfo(TParamTypes),TypeInfo(OleVariant)],Addr(__TCustomProvider__InternalGetParams__Wrapper),cRegister);

RegRegisterMethod(TCustomProvider,'DoAfterApplyUpdates',TypeInfo(_T15),[
TypeInfo(OleVariant)], pointer(68));

RegRegisterMethod(TCustomProvider,'DoBeforeApplyUpdates',TypeInfo(_T16),[
TypeInfo(OleVariant)], pointer(72));

RegRegisterMethod(TCustomProvider,'DoAfterExecute',TypeInfo(_T17),[
TypeInfo(OleVariant)], pointer(76));

RegRegisterMethod(TCustomProvider,'DoBeforeExecute',TypeInfo(_T18),[
TypeInfo(WideString),
TypeInfo(OleVariant),
TypeInfo(OleVariant)], pointer(80));

RegRegisterMethod(TCustomProvider,'DoAfterGetParams',TypeInfo(_T19),[
TypeInfo(OleVariant)], pointer(84));

RegRegisterMethod(TCustomProvider,'DoBeforeGetParams',TypeInfo(_T20),[
TypeInfo(OleVariant)], pointer(88));

RegRegisterMethod(TCustomProvider,'DoAfterGetRecords',TypeInfo(_T21),[
TypeInfo(OleVariant)], pointer(92));

RegRegisterMethod(TCustomProvider,'DoBeforeGetRecords',TypeInfo(_T22),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(WideString),
TypeInfo(OleVariant),
TypeInfo(OleVariant)], pointer(96));

RegRegisterMethod(TCustomProvider,'DoAfterRowRequest',TypeInfo(_T23),[
TypeInfo(OleVariant)], pointer(100));

RegRegisterMethod(TCustomProvider,'DoBeforeRowRequest',TypeInfo(_T24),[
TypeInfo(OleVariant)], pointer(104));

RegRegisterMethod(TCustomProvider,'ApplyUpdates',TypeInfo(_T25),[
TypeInfo(OleVariant),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(OleVariant)],Addr(TCustomProvider.ApplyUpdates));

RegRegisterMethod(TCustomProvider,'GetRecords',TypeInfo(_T26),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(OleVariant)],Addr(TCustomProvider.GetRecords));

RegRegisterMethod(TCustomProvider,'RowRequest',TypeInfo(_T27),[
TypeInfo(OleVariant),
TypeInfo(Integer),
TypeInfo(OleVariant),TypeInfo(OleVariant)],Addr(TCustomProvider.RowRequest));

RegRegisterMethod(TCustomProvider,'Execute',TypeInfo(_T28),[
TypeInfo(WideString),
TypeInfo(OleVariant),
TypeInfo(OleVariant)],Addr(TCustomProvider.Execute));

RegRegisterMethod(TCustomProvider,'GetParams',TypeInfo(_T29),[
TypeInfo(OleVariant),TypeInfo(OleVariant)],Addr(TCustomProvider.GetParams));

RegRegisterMethod(TCustomProvider,'DataRequest',TypeInfo(_T30),[
TypeInfo(OleVariant),TypeInfo(OleVariant)], pointer(108));

RegRegisterMethod(TCustomResolver,'InternalBeforeResolve',TypeInfo(_T31),[
TypeInfo(TUpdateTree)], pointer(48));

RegRegisterMethod(TCustomResolver,'BeginUpdate',TypeInfo(_T32),NoParams, pointer(52));

RegRegisterMethod(TCustomResolver,'EndUpdate',TypeInfo(_T33),NoParams, pointer(56));

RegRegisterMethod(TCustomResolver,'InitTreeData',TypeInfo(_T34),[
TypeInfo(TUpdateTree)], pointer(60));

RegRegisterMethod(TCustomResolver,'FreeTreeData',TypeInfo(_T35),[
TypeInfo(TUpdateTree)], pointer(64));

RegRegisterMethod(TCustomResolver,'InitializeConflictBuffer',TypeInfo(_T36),[
TypeInfo(TUpdateTree)], pointer(68));

RegRegisterMethod(TCustomResolver,'DoUpdate',TypeInfo(_T37),[
TypeInfo(TUpdateTree)], pointer(72));

RegRegisterMethod(TCustomResolver,'DoDelete',TypeInfo(_T38),[
TypeInfo(TUpdateTree)], pointer(76));

RegRegisterMethod(TCustomResolver,'DoInsert',TypeInfo(_T39),[
TypeInfo(TUpdateTree)], pointer(80));

RegRegisterMethod(TCustomResolver,'RowRequest',TypeInfo(_T40),[
TypeInfo(OleVariant),
TypeInfo(TFetchOptions),TypeInfo(OleVariant)], pointer(84));

RegRegisterMethod(TCustomResolver,'ApplyUpdates',TypeInfo(_T41),[
TypeInfo(OleVariant),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(OleVariant)], pointer(88));

RegisterProc(TCustomResolver,'Create',mtConstructor,TypeInfo(_T42),[
TypeInfo(TBaseProvider)],Addr(TCustomResolver.Create),cRegister);

RegRegisterMethod(TDataPacketWriter,'GetDataPacket',TypeInfo(_T43),[
TypeInfo(TDataSet),
TypeInfo(Integer),
TypeInfo(OleVariant)],Addr(TDataPacketWriter.GetDataPacket));

RegRegisterMethod(TDataSetProvider,'DoGetTableName',TypeInfo(_T44),[
TypeInfo(TDataSet),
TypeInfo(string)], pointer(132));

RegRegisterMethod(TDataSetProvider,'DoGetProviderAttributes',TypeInfo(_T45),[
TypeInfo(TDataSet),
TypeInfo(TList)], pointer(136));

RegisterProc(TDataSetResolver,'Create',mtConstructor,TypeInfo(_T46),[
TypeInfo(TDataSetProvider)],Addr(TDataSetResolver.Create),cRegister);

RegisterProc(TLocalAppServer,'Create',mtConstructor,TypeInfo(_T47),[
TypeInfo(TCustomProvider)],Addr(TLocalAppServer.Create),cRegister);

RegRegisterMethod(TPacketDataSet,'AssignCurValues',TypeInfo(_T48),[
TypeInfo(TDataSet)],Addr(TPacketDataSet.AssignCurValues));

RegRegisterMethod(TPacketDataSet,'CreateFromDelta',TypeInfo(_T49),[
TypeInfo(TPacketDataSet)],Addr(TPacketDataSet.CreateFromDelta));

RegRegisterMethod(TPacketDataSet,'HasCurValues',TypeInfo(_T50),[TypeInfo(Boolean)],Addr(TPacketDataSet.HasCurValues));

RegRegisterMethod(TPacketDataSet,'HasMergeConflicts',TypeInfo(_T51),[TypeInfo(Boolean)],Addr(TPacketDataSet.HasMergeConflicts));

RegisterProc(TPacketDataSet,'InitAltRecBuffers',mtScriptMethod,TypeInfo(_T52),[
TypeInfo(Boolean)],Addr(__TPacketDataSet__InitAltRecBuffers__Wrapper),cRegister);

RegRegisterMethod(TPacketDataSet,'UpdateKind',TypeInfo(_T53),[TypeInfo(TUpdateKind)],Addr(TPacketDataSet.UpdateKind));

RegRegisterMethod(TSQLResolver,'DoExecSQL',TypeInfo(_T54),[
TypeInfo(TStringList),
TypeInfo(TParams)], pointer(92));

RegRegisterMethod(TSQLResolver,'DoGetValues',TypeInfo(_T55),[
TypeInfo(TStringList),
TypeInfo(TParams),
TypeInfo(TDataSet)], pointer(96));

RegisterProc(TSQLResolver,'Create',mtConstructor,TypeInfo(_T56),[
TypeInfo(TDataSetProvider)],Addr(TSQLResolver.Create),cRegister);

RegisterProc(TUpdateTree,'Create',mtConstructor,TypeInfo(_T57),[
TypeInfo(TUpdateTree),
TypeInfo(TCustomResolver)],Addr(TUpdateTree.Create),cRegister);

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
RegisterEvent(TypeInfo(TAfterUpdateRecordEvent),[
TypeInfo(TObject),
TypeInfo(TDataSet),
TypeInfo(TCustomClientDataSet),
TypeInfo(TUpdateKind)]);

RegisterEvent(TypeInfo(TBeforeUpdateRecordEvent),[
TypeInfo(TObject),
TypeInfo(TDataSet),
TypeInfo(TCustomClientDataSet),
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
TypeInfo(TCustomClientDataSet)]);

{RegisterEvent(TypeInfo(TPutFieldProc),[
TypeInfoPointer]);}

RegisterEvent(TypeInfo(TResolverErrorEvent),[
TypeInfo(TObject),
TypeInfo(TCustomClientDataSet),
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
