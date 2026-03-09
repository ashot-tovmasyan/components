{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit ADODB_D6;
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
  Variants,
  ActiveX,
  SysUtils,
  Classes,
  TypInfo,
  DB,
  OleDB,
  ADOInt,
  ADODB;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TADOCommand__ = class(TADOCommand);
type
_T0 = procedure (const p0 : WideString;
const p1 : WideString;
const p2 : WideString) of object;

_T1 = function : string of object;

_T2 = procedure (p0 : TStrings) of object;

_T3 = function (p0 : THandle;
p1 : WideString): WideString of object;

_T4 = _T3;

_T5 = function (p0 : TStrings;
p1 : string): Integer of object;

_T6 = procedure (p0 : TBlobField;
p1 : TBlobStreamMode) of object;

_T7 = procedure  of object;

_T8 = procedure (p0 : Boolean) of object;

_T9 = _T7;

_T10 = procedure (const p0 : WideString) of object;

_T11 = function (p0 : Integer;
p1 : Boolean): Boolean of object;

_T12 = _T7;

{_T13 = function : _Recordset of object;}

_T14 = _T7;

_T15 = _T7;

_T16 = function : Integer of object;

_T17 = _T7;

_T18 = _T7;

_T20 = _T2;

_T21 = procedure (const p0 : string;
p1 : TStrings) of object;

_T22 = procedure (p0 : TStrings;
p1 : Boolean) of object;

_T23 = procedure (const p0 : WideString;
const p1 : WideString) of object;

_T24 = procedure (const p0 : TSchemaInfo;
const p1 : OleVariant;
const p2 : OleVariant;
p3 : TADODataSet) of object;

_T25 = _T7;

_T26 = _T7;

_T27 = _T2;

_T28 = _T16;

_T29 = _T7;

_T30 = _T2;

_T31 = _T7;

_T32 = procedure (p0 : TObject) of object;

_T33 = _T32;

_T34 = _T7;

_T35 = procedure (const p0 : TADOConnection) of object;

_T36 = _T11;

_T37 = procedure (const p0 : TDataSource) of object;

_T38 = procedure (p0 : TAffectRecords) of object;

_T39 = _T7;

_T40 = procedure (p0 : TCustomADODataSet;
p1 : TADOLockType) of object;

_T41 = _T38;

_T42 = procedure (p0 : Array of Const) of object;

_T43 = _T10;

{_T44 = function (var p0 : Integer): _Recordset of object;}

_T45 = procedure (p0 : TExecuteOptions) of object;

_T46 = procedure (const p0 : WideString;
p1 : TPersistFormat) of object;

_T47 = function (const p0 : Variant;
p1 : TSeekOption): Boolean of object;

_T48 = function (p0 : TCursorOptions): Boolean of object;

_T49 = _T38;

_T50 = procedure (p0 : OleVariant) of object;

_T51 = procedure (const p0 : string;
p1 : TDataType) of object;

_T52 = procedure (p0 : TStream;
p1 : TDataType) of object;

_T53 = function : TParameter of object;

_T54 = procedure (p0 : TParameters) of object;

_T55 = function (const p0 : WideString;
p1 : TDataType;
p2 : TParameterDirection;
p3 : Integer;
p4 : OleVariant): TParameter of object;

_T56 = function (const p0 : WideString): TParameter of object;

_T57 = procedure (p0 : TList;
const p1 : WideString) of object;

_T58 = function (p0 : TParameters): Boolean of object;

_T59 = _T56;

_T60 = function (p0 : string;
p1 : Boolean): string of object;

_T61 = function : Boolean of object;

function ____GetDataLinkFiles__Wrapper(cArgs : integer; pArgs : PArgList) : OleVariant;
begin
case cArgs of
1:
begin
result := GetDataLinkFiles(TStrings(VarToObject(OleVariant(pargs^[0]))));
end;
2:
begin
result := GetDataLinkFiles(TStrings(VarToObject(OleVariant(pargs^[1]))),OleVariant(pargs^[0]));
end;
end
end;

procedure __TADOCommand__Initialize__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
0:
begin
__TADOCommand__(__Instance).Initialize;
end;
1:
begin
__TADOCommand__(__Instance).Initialize(OleVariant(pargs^[0]));
end;
end
end;

procedure __TADOConnection__GetTableNames__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
1:
begin
TADOConnection(__Instance).GetTableNames(TStrings(VarToObject(OleVariant(pargs^[0]))));
end;
2:
begin
TADOConnection(__Instance).GetTableNames(TStrings(VarToObject(OleVariant(pargs^[1]))),OleVariant(pargs^[0]));
end;
end
end;

procedure __TCustomADODataSet__CancelBatch__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
0:
begin
TCustomADODataSet(__Instance).CancelBatch;
end;
1:
begin
TCustomADODataSet(__Instance).CancelBatch(OleVariant(pargs^[0]));
end;
end
end;

procedure __TCustomADODataSet__Clone__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
1:
begin
TCustomADODataSet(__Instance).Clone(TCustomADODataSet(VarToObject(OleVariant(pargs^[0]))));
end;
2:
begin
TCustomADODataSet(__Instance).Clone(TCustomADODataSet(VarToObject(OleVariant(pargs^[1]))),OleVariant(pargs^[0]));
end;
end
end;

procedure __TCustomADODataSet__DeleteRecords__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
0:
begin
TCustomADODataSet(__Instance).DeleteRecords;
end;
1:
begin
TCustomADODataSet(__Instance).DeleteRecords(OleVariant(pargs^[0]));
end;
end
end;

procedure __TCustomADODataSet__Requery__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
var
__s0 : TExecuteOptions;
begin
if cArgs > 0 then
VarToSet(__s0,OleVariant(pargs^[0]),SizeOf(TExecuteOptions));
case cArgs of
0:
begin
TCustomADODataSet(__Instance).Requery;
end;
1:
begin
TCustomADODataSet(__Instance).Requery(__s0);
end;
end
end;

procedure __TCustomADODataSet__SaveToFile__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
0:
begin
TCustomADODataSet(__Instance).SaveToFile;
end;
1:
begin
TCustomADODataSet(__Instance).SaveToFile(OleVariant(pargs^[0]));
end;
2:
begin
TCustomADODataSet(__Instance).SaveToFile(OleVariant(pargs^[1]),OleVariant(pargs^[0]));
end;
end
end;

function __TCustomADODataSet__Seek__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList) : OleVariant;
begin
case cArgs of
1:
begin
result := TCustomADODataSet(__Instance).Seek(OleVariant(pargs^[0]));
end;
2:
begin
result := TCustomADODataSet(__Instance).Seek(OleVariant(pargs^[1]),OleVariant(pargs^[0]));
end;
end
end;

procedure __TCustomADODataSet__UpdateBatch__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
0:
begin
TCustomADODataSet(__Instance).UpdateBatch;
end;
1:
begin
TCustomADODataSet(__Instance).UpdateBatch(OleVariant(pargs^[0]));
end;
end
end;

function __DC__GetTADOCommand__States(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TObjectStates;
begin
tmp := TADOCommand(Instance).States;
result := VarFromSet(tmp, sizeof(tmp));
end;

function __DC__GetTADOConnection__CommandCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TADOConnection(Instance).CommandCount;
end;

function __DC__GetTADOConnection__Commands(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TADOConnection(Instance).Commands[OleVariant(Params^[0])]);
end;

function __DC__GetTADOConnection__DataSets(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TADOConnection(Instance).DataSets[OleVariant(Params^[0])]);
end;

function __DC__GetTADOConnection__InTransaction(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TADOConnection(Instance).InTransaction;
end;

function __DC__GetTADOConnection__State(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TObjectStates;
begin
tmp := TADOConnection(Instance).State;
result := VarFromSet(tmp, sizeof(tmp));
end;

function __DC__GetTADOConnection__Version(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TADOConnection(Instance).Version;
end;

function __DC__GetTADODataSet__IndexDefs(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TADODataSet(Instance).IndexDefs);
end;

procedure __DC__SetTADODataSet__IndexDefs(Instance : TObject; Params : PVariantArgList);
begin
TADODataSet(Instance).IndexDefs:=TIndexDefs(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTADOQuery__RowsAffected(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TADOQuery(Instance).RowsAffected;
end;

function __DC__GetTADOTable__IndexDefs(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TADOTable(Instance).IndexDefs);
end;

procedure __DC__SetTADOTable__IndexDefs(Instance : TObject; Params : PVariantArgList);
begin
TADOTable(Instance).IndexDefs:=TIndexDefs(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomADODataSet__EnableBCD(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomADODataSet(Instance).EnableBCD;
end;

procedure __DC__SetTCustomADODataSet__EnableBCD(Instance : TObject; Params : PVariantArgList);
begin
TCustomADODataSet(Instance).EnableBCD:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomADODataSet__DesignerData(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomADODataSet(Instance).DesignerData;
end;

procedure __DC__SetTCustomADODataSet__DesignerData(Instance : TObject; Params : PVariantArgList);
begin
TCustomADODataSet(Instance).DesignerData:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomADODataSet__IndexName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomADODataSet(Instance).IndexName;
end;

procedure __DC__SetTCustomADODataSet__IndexName(Instance : TObject; Params : PVariantArgList);
begin
TCustomADODataSet(Instance).IndexName:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomADODataSet__IndexFieldCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomADODataSet(Instance).IndexFieldCount;
end;

function __DC__GetTCustomADODataSet__IndexFields(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomADODataSet(Instance).IndexFields[OleVariant(Params^[0])]);
end;

procedure __DC__SetTCustomADODataSet__IndexFields(Instance : TObject; Params : PVariantArgList);
begin
TCustomADODataSet(Instance).IndexFields[OleVariant(Params^[1])]:=TField(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomADODataSet__FilterGroup(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomADODataSet(Instance).FilterGroup;
end;

procedure __DC__SetTCustomADODataSet__FilterGroup(Instance : TObject; Params : PVariantArgList);
begin
TCustomADODataSet(Instance).FilterGroup:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomADODataSet__RecordsetState(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TObjectStates;
begin
tmp := TCustomADODataSet(Instance).RecordsetState;
result := VarFromSet(tmp, sizeof(tmp));
end;

function __DC__GetTCustomADODataSet__RecordStatus(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TRecordStatusSet;
begin
tmp := TCustomADODataSet(Instance).RecordStatus;
result := VarFromSet(tmp, sizeof(tmp));
end;

function __DC__GetTCustomADODataSet__Sort(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomADODataSet(Instance).Sort;
end;

procedure __DC__SetTCustomADODataSet__Sort(Instance : TObject; Params : PVariantArgList);
begin
TCustomADODataSet(Instance).Sort:=OleVariant(Params^[0]);
end;

function __DC__GetTParameter__Parameters(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TParameter(Instance).Parameters);
end;

function __DC__GetTParameters__ParamValues(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TParameters(Instance).ParamValues[OleVariant(Params^[0])];
end;

procedure __DC__SetTParameters__ParamValues(Instance : TObject; Params : PVariantArgList);
begin
TParameters(Instance).ParamValues[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTParameters__Command(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TParameters(Instance).Command);
end;

function __DC__GetTParameters__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TParameters(Instance).Items[OleVariant(Params^[0])]);
end;

procedure __DC__SetTParameters__Items(Instance : TObject; Params : PVariantArgList);
begin
TParameters(Instance).Items[OleVariant(Params^[1])]:=TParameter(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTRDSConnection__AppServer(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TRDSConnection(Instance).AppServer;
end;

procedure __RegisterProps;
begin
RegisterProperty(TADOCommand,'States',__DC__GetTADOCommand__States,nil);
RegisterProperty(TADOConnection,'CommandCount',__DC__GetTADOConnection__CommandCount,nil);
RegisterIndexedProperty(TADOConnection,'Commands',1,False,__DC__GetTADOConnection__Commands,nil);
RegisterIndexedProperty(TADOConnection,'DataSets',1,False,__DC__GetTADOConnection__DataSets,nil);
RegisterProperty(TADOConnection,'InTransaction',__DC__GetTADOConnection__InTransaction,nil);
RegisterProperty(TADOConnection,'State',__DC__GetTADOConnection__State,nil);
RegisterProperty(TADOConnection,'Version',__DC__GetTADOConnection__Version,nil);
RegisterProperty(TADODataSet,'IndexDefs',__DC__GetTADODataSet__IndexDefs,__DC__SetTADODataSet__IndexDefs);
RegisterProperty(TADOQuery,'RowsAffected',__DC__GetTADOQuery__RowsAffected,nil);
RegisterProperty(TADOTable,'IndexDefs',__DC__GetTADOTable__IndexDefs,__DC__SetTADOTable__IndexDefs);
RegisterProperty(TCustomADODataSet,'EnableBCD',__DC__GetTCustomADODataSet__EnableBCD,__DC__SetTCustomADODataSet__EnableBCD);
RegisterProperty(TCustomADODataSet,'DesignerData',__DC__GetTCustomADODataSet__DesignerData,__DC__SetTCustomADODataSet__DesignerData);
RegisterProperty(TCustomADODataSet,'IndexName',__DC__GetTCustomADODataSet__IndexName,__DC__SetTCustomADODataSet__IndexName);
RegisterProperty(TCustomADODataSet,'IndexFieldCount',__DC__GetTCustomADODataSet__IndexFieldCount,nil);
RegisterIndexedProperty(TCustomADODataSet,'IndexFields',1,False,__DC__GetTCustomADODataSet__IndexFields,__DC__SetTCustomADODataSet__IndexFields);
RegisterProperty(TCustomADODataSet,'FilterGroup',__DC__GetTCustomADODataSet__FilterGroup,__DC__SetTCustomADODataSet__FilterGroup);
RegisterProperty(TCustomADODataSet,'RecordsetState',__DC__GetTCustomADODataSet__RecordsetState,nil);
RegisterProperty(TCustomADODataSet,'RecordStatus',__DC__GetTCustomADODataSet__RecordStatus,nil);
RegisterProperty(TCustomADODataSet,'Sort',__DC__GetTCustomADODataSet__Sort,__DC__SetTCustomADODataSet__Sort);
RegisterProperty(TParameter,'Parameters',__DC__GetTParameter__Parameters,nil);
RegisterIndexedProperty(TParameters,'ParamValues',1,False,__DC__GetTParameters__ParamValues,__DC__SetTParameters__ParamValues);
RegisterProperty(TParameters,'Command',__DC__GetTParameters__Command,nil);
RegisterIndexedProperty(TParameters,'Items',1,True,__DC__GetTParameters__Items,__DC__SetTParameters__Items);
RegisterProperty(TRDSConnection,'AppServer',__DC__GetTRDSConnection__AppServer,nil);
end;

const __ConstNames0 : array[0..167] of string = (
'cmUnknown'
,'cmRead'
,'cmWrite'
,'cmReadWrite'
,'cmShareDenyRead'
,'cmShareDenyWrite'
,'cmShareExclusive'
,'cmShareDenyNone'
,'coConnectUnspecified'
,'coAsyncConnect'
,'clUseServer'
,'clUseClient'
,'ctUnspecified'
,'ctOpenForwardOnly'
,'ctKeyset'
,'ctDynamic'
,'ctStatic'
,'esOK'
,'esErrorsOccured'
,'esCantDeny'
,'esCancel'
,'esUnwantedEvent'
,'eoAsyncExecute'
,'eoAsyncFetch'
,'eoAsyncFetchNonBlocking'
,'eoExecuteNoRecords'
,'ilUnspecified'
,'ilChaos'
,'ilReadUncommitted'
,'ilBrowse'
,'ilCursorStability'
,'ilReadCommitted'
,'ilRepeatableRead'
,'ilSerializable'
,'ilIsolated'
,'ltUnspecified'
,'ltReadOnly'
,'ltPessimistic'
,'ltOptimistic'
,'ltBatchOptimistic'
,'stClosed'
,'stOpen'
,'stConnecting'
,'stExecuting'
,'stFetching'
,'siAsserts'
,'siCatalogs'
,'siCharacterSets'
,'siCollations'
,'siColumns'
,'siCheckConstraints'
,'siConstraintColumnUsage'
,'siConstraintTableUsage'
,'siKeyColumnUsage'
,'siReferentialConstraints'
,'siTableConstraints'
,'siColumnsDomainUsage'
,'siIndexes'
,'siColumnPrivileges'
,'siTablePrivileges'
,'siUsagePrivileges'
,'siProcedures'
,'siSchemata'
,'siSQLLanguages'
,'siStatistics'
,'siTables'
,'siTranslations'
,'siProviderTypes'
,'siViews'
,'siViewColumnUsage'
,'siViewTableUsage'
,'siProcedureParameters'
,'siForeignKeys'
,'siPrimaryKeys'
,'siProcedureColumns'
,'siDBInfoKeywords'
,'siDBInfoLiterals'
,'siCubes'
,'siDimensions'
,'siHierarchies'
,'siLevels'
,'siMeasures'
,'siProperties'
,'siMembers'
,'siProviderSpecific'
,'xaCommitRetaining'
,'xaAbortRetaining'
,'cmdUnknown'
,'cmdText'
,'cmdTable'
,'cmdStoredProc'
,'cmdFile'
,'cmdTableDirect'
,'paSigned'
,'paNullable'
,'paLong'
,'pdUnknown'
,'pdInput'
,'pdOutput'
,'pdInputOutput'
,'pdReturnValue'
,'coHoldRecords'
,'coMovePrevious'
,'coAddNew'
,'coDelete'
,'coUpdate'
,'coBookmark'
,'coApproxPosition'
,'coUpdateBatch'
,'coResync'
,'coNotify'
,'coFind'
,'coSeek'
,'coIndex'
,'erAddNew'
,'erDelete'
,'erUpdate'
,'erUndoUpdate'
,'erUndoAddNew'
,'erUndoDelete'
,'erRequery'
,'erResynch'
,'erClose'
,'erMove'
,'erFirstChange'
,'erMoveFirst'
,'erMoveNext'
,'erMovePrevious'
,'erMoveLast'
,'fgUnassigned'
,'fgNone'
,'fgPendingRecords'
,'fgAffectedRecords'
,'fgFetchedRecords'
,'fgPredicate'
,'fgConflictingRecords'
,'moMarshalAll'
,'moMarshalModifiedOnly'
,'rsOK'
,'rsNew'
,'rsModified'
,'rsDeleted'
,'rsUnmodified'
,'rsInvalid'
,'rsMultipleChanges'
,'rsPendingChanges'
,'rsCanceled'
,'rsCantRelease'
,'rsConcurrencyViolation'
,'rsIntegrityViolation'
,'rsMaxChangesExceeded'
,'rsObjectOpen'
,'rsOutOfMemory'
,'rsPermissionDenied'
,'rsSchemaViolation'
,'rsDBDeleted'
,'arCurrent'
,'arFiltered'
,'arAll'
,'arAllChapters'
,'pfADTG'
,'pfXML'
,'soFirstEQ'
,'soLastEQ'
,'soAfterEQ'
,'soAfter'
,'soBeforeEQ'
,'soBefore'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,cmUnknown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,cmRead));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,cmWrite));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,cmReadWrite));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,cmShareDenyRead));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,cmShareDenyWrite));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,cmShareExclusive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,cmShareDenyNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,coConnectUnspecified));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,coAsyncConnect));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,clUseServer));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,clUseClient));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,ctUnspecified));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,ctOpenForwardOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,ctKeyset));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,ctDynamic));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,ctStatic));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,esOK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,esErrorsOccured));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,esCantDeny));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,esCancel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,esUnwantedEvent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,eoAsyncExecute));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,eoAsyncFetch));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,eoAsyncFetchNonBlocking));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,eoExecuteNoRecords));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,ilUnspecified));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,ilChaos));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,ilReadUncommitted));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,ilBrowse));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,ilCursorStability));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,ilReadCommitted));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,ilRepeatableRead));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,ilSerializable));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,ilIsolated));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,ltUnspecified));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,ltReadOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,ltPessimistic));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,ltOptimistic));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,ltBatchOptimistic));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,stClosed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,stOpen));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,stConnecting));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,stExecuting));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,stFetching));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,siAsserts));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,siCatalogs));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,siCharacterSets));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[48] ,siCollations));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[49] ,siColumns));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[50] ,siCheckConstraints));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[51] ,siConstraintColumnUsage));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[52] ,siConstraintTableUsage));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[53] ,siKeyColumnUsage));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[54] ,siReferentialConstraints));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[55] ,siTableConstraints));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[56] ,siColumnsDomainUsage));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[57] ,siIndexes));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[58] ,siColumnPrivileges));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[59] ,siTablePrivileges));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[60] ,siUsagePrivileges));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[61] ,siProcedures));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[62] ,siSchemata));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[63] ,siSQLLanguages));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[64] ,siStatistics));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[65] ,siTables));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[66] ,siTranslations));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[67] ,siProviderTypes));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[68] ,siViews));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[69] ,siViewColumnUsage));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[70] ,siViewTableUsage));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[71] ,siProcedureParameters));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[72] ,siForeignKeys));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[73] ,siPrimaryKeys));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[74] ,siProcedureColumns));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[75] ,siDBInfoKeywords));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[76] ,siDBInfoLiterals));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[77] ,siCubes));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[78] ,siDimensions));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[79] ,siHierarchies));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[80] ,siLevels));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[81] ,siMeasures));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[82] ,siProperties));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[83] ,siMembers));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[84] ,siProviderSpecific));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[85] ,xaCommitRetaining));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[86] ,xaAbortRetaining));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[87] ,cmdUnknown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[88] ,cmdText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[89] ,cmdTable));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[90] ,cmdStoredProc));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[91] ,cmdFile));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[92] ,cmdTableDirect));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[93] ,paSigned));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[94] ,paNullable));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[95] ,paLong));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[96] ,pdUnknown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[97] ,pdInput));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[98] ,pdOutput));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[99] ,pdInputOutput));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[100] ,pdReturnValue));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[101] ,coHoldRecords));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[102] ,coMovePrevious));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[103] ,coAddNew));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[104] ,coDelete));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[105] ,coUpdate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[106] ,coBookmark));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[107] ,coApproxPosition));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[108] ,coUpdateBatch));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[109] ,coResync));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[110] ,coNotify));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[111] ,coFind));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[112] ,coSeek));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[113] ,coIndex));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[114] ,erAddNew));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[115] ,erDelete));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[116] ,erUpdate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[117] ,erUndoUpdate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[118] ,erUndoAddNew));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[119] ,erUndoDelete));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[120] ,erRequery));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[121] ,erResynch));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[122] ,erClose));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[123] ,erMove));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[124] ,erFirstChange));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[125] ,erMoveFirst));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[126] ,erMoveNext));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[127] ,erMovePrevious));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[128] ,erMoveLast));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[129] ,fgUnassigned));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[130] ,fgNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[131] ,fgPendingRecords));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[132] ,fgAffectedRecords));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[133] ,fgFetchedRecords));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[134] ,fgPredicate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[135] ,fgConflictingRecords));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[136] ,moMarshalAll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[137] ,moMarshalModifiedOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[138] ,rsOK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[139] ,rsNew));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[140] ,rsModified));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[141] ,rsDeleted));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[142] ,rsUnmodified));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[143] ,rsInvalid));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[144] ,rsMultipleChanges));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[145] ,rsPendingChanges));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[146] ,rsCanceled));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[147] ,rsCantRelease));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[148] ,rsConcurrencyViolation));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[149] ,rsIntegrityViolation));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[150] ,rsMaxChangesExceeded));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[151] ,rsObjectOpen));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[152] ,rsOutOfMemory));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[153] ,rsPermissionDenied));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[154] ,rsSchemaViolation));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[155] ,rsDBDeleted));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[156] ,arCurrent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[157] ,arFiltered));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[158] ,arAll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[159] ,arAllChapters));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[160] ,pfADTG));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[161] ,pfXML));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[162] ,soFirstEQ));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[163] ,soLastEQ));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[164] ,soAfterEQ));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[165] ,soAfter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[166] ,soBeforeEQ));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[167] ,soBefore));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..11] of TClass = (
EADOError,
TADOBlobStream,
TADOCommand,
TADOConnection,
TADODataSet,
TADOQuery,
TADOStoredProc,
TADOTable,
TCustomADODataSet,
TParameter,
TParameters,
TRDSConnection
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..5] of string = (
'CreateUDLFile'
,'DataLinkDir'
,'GetProviderNames'
,'PromptDataSource'
,'PromptDataLinkFile'
,'GetDataLinkFiles'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T0),[
TypeInfo(WideString),
TypeInfo(WideString),
TypeInfo(WideString)],Addr(CreateUDLFile),cRegister);

RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T1),[TypeInfo(string)],Addr(DataLinkDir),cRegister);

RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T2),[
TypeInfo(TStrings)],Addr(GetProviderNames),cRegister);

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T3),[
TypeInfo(THandle),
TypeInfo(WideString),TypeInfo(WideString)],Addr(PromptDataSource),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T4),[
TypeInfo(THandle),
TypeInfo(WideString),TypeInfo(WideString)],Addr(PromptDataLinkFile),cRegister);

RegisterProc(nil,MethodNames[5],mtScriptProc,TypeInfo(_T5),[
TypeInfo(TStrings),
TypeInfo(string),TypeInfo(Integer)],Addr(____GetDataLinkFiles__Wrapper),cRegister);

RegisterProc(TADOBlobStream,'Create',mtConstructor,TypeInfo(_T6),[
TypeInfo(TBlobField),
TypeInfo(TBlobStreamMode)],Addr(TADOBlobStream.Create),cRegister);

RegRegisterMethod(TADOBlobStream,'Truncate',TypeInfo(_T7),NoParams,Addr(TADOBlobStream.Truncate));

RegisterProc(TADOCommand,'Initialize',mtScriptMethod,TypeInfo(_T8),[
TypeInfo(Boolean)],Addr(__TADOCommand__Initialize__Wrapper),cRegister);

RegRegisterMethod(TADOCommand,'OpenConnection',TypeInfo(_T9),NoParams, pointer(52));

RegRegisterMethod(TADOCommand,'SetCommandText',TypeInfo(_T10),[
TypeInfo(WideString)], pointer(56));

RegRegisterMethod(TADOCommand,'SetConnectionFlag',TypeInfo(_T11),[
TypeInfo(Integer),
TypeInfo(Boolean),TypeInfo(Boolean)], pointer(60));

RegRegisterMethod(TADOCommand,'Cancel',TypeInfo(_T12),NoParams,Addr(TADOCommand.Cancel));

RegRegisterMethod(TADOConnection,'CheckDisconnect',TypeInfo(_T14),NoParams, pointer(80));

RegRegisterMethod(TADOConnection,'WaitForConnectComplete',TypeInfo(_T15),NoParams, pointer(84));

RegRegisterMethod(TADOConnection,'BeginTrans',TypeInfo(_T16),[TypeInfo(Integer)],Addr(TADOConnection.BeginTrans));

RegRegisterMethod(TADOConnection,'Cancel',TypeInfo(_T17),NoParams,Addr(TADOConnection.Cancel));

RegRegisterMethod(TADOConnection,'CommitTrans',TypeInfo(_T18),NoParams,Addr(TADOConnection.CommitTrans));

RegRegisterMethod(TADOConnection,'GetProcedureNames',TypeInfo(_T20),[
TypeInfo(TStrings)],Addr(TADOConnection.GetProcedureNames));

RegRegisterMethod(TADOConnection,'GetFieldNames',TypeInfo(_T21),[
TypeInfo(string),
TypeInfo(TStrings)],Addr(TADOConnection.GetFieldNames));

RegisterProc(TADOConnection,'GetTableNames',mtScriptMethod,TypeInfo(_T22),[
TypeInfo(TStrings),
TypeInfo(Boolean)],Addr(__TADOConnection__GetTableNames__Wrapper),cRegister);

RegRegisterMethod(TADOConnection,'Open',TypeInfo(_T23),[
TypeInfo(WideString),
TypeInfo(WideString)],Addr(TADOConnection.Open));

RegRegisterMethod(TADOConnection,'OpenSchema',TypeInfo(_T24),[
TypeInfo(TSchemaInfo),
TypeInfo(OleVariant),
TypeInfo(OleVariant),
TypeInfo(TADODataSet)],Addr(TADOConnection.OpenSchema));

RegRegisterMethod(TADOConnection,'RollbackTrans',TypeInfo(_T25),NoParams,Addr(TADOConnection.RollbackTrans));

RegRegisterMethod(TADODataSet,'CreateDataSet',TypeInfo(_T26),NoParams,Addr(TADODataSet.CreateDataSet));

RegRegisterMethod(TADODataSet,'GetIndexNames',TypeInfo(_T27),[
TypeInfo(TStrings)],Addr(TADODataSet.GetIndexNames));

RegRegisterMethod(TADOQuery,'ExecSQL',TypeInfo(_T28),[TypeInfo(Integer)],Addr(TADOQuery.ExecSQL));

RegRegisterMethod(TADOStoredProc,'ExecProc',TypeInfo(_T29),NoParams,Addr(TADOStoredProc.ExecProc));

RegRegisterMethod(TADOTable,'GetIndexNames',TypeInfo(_T30),[
TypeInfo(TStrings)],Addr(TADOTable.GetIndexNames));

RegRegisterMethod(TCustomADODataSet,'DestroyLookupCursor',TypeInfo(_T31),NoParams, pointer(600));

RegRegisterMethod(TCustomADODataSet,'MasterChanged',TypeInfo(_T32),[
TypeInfo(TObject)], pointer(604));

RegRegisterMethod(TCustomADODataSet,'MasterDisabled',TypeInfo(_T33),[
TypeInfo(TObject)], pointer(608));

RegRegisterMethod(TCustomADODataSet,'PrepareCursor',TypeInfo(_T34),NoParams, pointer(612));

RegRegisterMethod(TCustomADODataSet,'SetConnection',TypeInfo(_T35),[
TypeInfo(TADOConnection)], pointer(616));

RegRegisterMethod(TCustomADODataSet,'SetConnectionFlag',TypeInfo(_T36),[
TypeInfo(Integer),
TypeInfo(Boolean),TypeInfo(Boolean)], pointer(620));

RegRegisterMethod(TCustomADODataSet,'SetDataSource',TypeInfo(_T37),[
TypeInfo(TDataSource)], pointer(624));

RegisterProc(TCustomADODataSet,'CancelBatch',mtScriptMethod,TypeInfo(_T38),[
TypeInfo(TAffectRecords)],Addr(__TCustomADODataSet__CancelBatch__Wrapper),cRegister);

RegRegisterMethod(TCustomADODataSet,'CancelUpdates',TypeInfo(_T39),NoParams,Addr(TCustomADODataSet.CancelUpdates));

RegisterProc(TCustomADODataSet,'Clone',mtScriptMethod,TypeInfo(_T40),[
TypeInfo(TCustomADODataSet),
TypeInfo(TADOLockType)],Addr(__TCustomADODataSet__Clone__Wrapper),cRegister);

RegisterProc(TCustomADODataSet,'DeleteRecords',mtScriptMethod,TypeInfo(_T41),[
TypeInfo(TAffectRecords)],Addr(__TCustomADODataSet__DeleteRecords__Wrapper),cRegister);

RegRegisterMethod(TCustomADODataSet,'FilterOnBookmarks',TypeInfo(_T42),[
TypeInfoArrayOfConst],Addr(TCustomADODataSet.FilterOnBookmarks));

RegRegisterMethod(TCustomADODataSet,'LoadFromFile',TypeInfo(_T43),[
TypeInfo(WideString)],Addr(TCustomADODataSet.LoadFromFile));

RegisterProc(TCustomADODataSet,'Requery',mtScriptMethod,TypeInfo(_T45),[
TypeInfo(TExecuteOptions)],Addr(__TCustomADODataSet__Requery__Wrapper),cRegister);

RegisterProc(TCustomADODataSet,'SaveToFile',mtScriptMethod,TypeInfo(_T46),[
TypeInfo(WideString),
TypeInfo(TPersistFormat)],Addr(__TCustomADODataSet__SaveToFile__Wrapper),cRegister);

RegisterProc(TCustomADODataSet,'Seek',mtScriptMethod,TypeInfo(_T47),[
TypeInfo(Variant),
TypeInfo(TSeekOption),TypeInfo(Boolean)],Addr(__TCustomADODataSet__Seek__Wrapper),cRegister);

RegRegisterMethod(TCustomADODataSet,'Supports',TypeInfo(_T48),[
TypeInfo(TCursorOptions),TypeInfo(Boolean)],Addr(TCustomADODataSet.Supports));

RegisterProc(TCustomADODataSet,'UpdateBatch',mtScriptMethod,TypeInfo(_T49),[
TypeInfo(TAffectRecords)],Addr(__TCustomADODataSet__UpdateBatch__Wrapper),cRegister);

RegRegisterMethod(TParameter,'AppendChunk',TypeInfo(_T50),[
TypeInfo(OleVariant)],Addr(TParameter.AppendChunk));

RegRegisterMethod(TParameter,'LoadFromFile',TypeInfo(_T51),[
TypeInfo(string),
TypeInfo(TDataType)],Addr(TParameter.LoadFromFile));

RegRegisterMethod(TParameter,'LoadFromStream',TypeInfo(_T52),[
TypeInfo(TStream),
TypeInfo(TDataType)],Addr(TParameter.LoadFromStream));

RegRegisterMethod(TParameters,'AddParameter',TypeInfo(_T53),[TypeInfo(TParameter)],Addr(TParameters.AddParameter));

RegRegisterMethod(TParameters,'AssignValues',TypeInfo(_T54),[
TypeInfo(TParameters)],Addr(TParameters.AssignValues));

RegRegisterMethod(TParameters,'CreateParameter',TypeInfo(_T55),[
TypeInfo(WideString),
TypeInfo(TDataType),
TypeInfo(TParameterDirection),
TypeInfo(Integer),
TypeInfo(OleVariant),TypeInfo(TParameter)],Addr(TParameters.CreateParameter));

RegRegisterMethod(TParameters,'FindParam',TypeInfo(_T56),[
TypeInfo(WideString),TypeInfo(TParameter)],Addr(TParameters.FindParam));

RegRegisterMethod(TParameters,'GetParamList',TypeInfo(_T57),[
TypeInfo(TList),
TypeInfo(WideString)],Addr(TParameters.GetParamList));

RegRegisterMethod(TParameters,'IsEqual',TypeInfo(_T58),[
TypeInfo(TParameters),TypeInfo(Boolean)],Addr(TParameters.IsEqual));

RegRegisterMethod(TParameters,'ParamByName',TypeInfo(_T59),[
TypeInfo(WideString),TypeInfo(TParameter)],Addr(TParameters.ParamByName));

RegRegisterMethod(TParameters,'ParseSQL',TypeInfo(_T60),[
TypeInfo(string),
TypeInfo(Boolean),TypeInfo(string)],Addr(TParameters.ParseSQL));

RegRegisterMethod(TParameters,'Refresh',TypeInfo(_T61),[TypeInfo(Boolean)],Addr(TParameters.Refresh));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegRegisterMethod(TADOCommand,'Execute',TypeInfo(_T13),[TypeInfo(_Recordset)],Addr(TADOCommand.Execute))}

{RegRegisterMethod(TCustomADODataSet,'NextRecordset',TypeInfo(_T44),[
TypeInfo(Integer),TypeInfo(_Recordset)],Addr(TCustomADODataSet.NextRecordset))}

{RegisterEvent(TypeInfo(TBeginTransCompleteEvent),[
TypeInfo(TADOConnection),
TypeInfo(Integer),
TypeInfo(Error),
TypeInfo(TEventStatus)]);}

{RegisterEvent(TypeInfo(TConnectErrorEvent),[
TypeInfo(TADOConnection),
TypeInfo(Error),
TypeInfo(TEventStatus)]);}

RegisterEvent(TypeInfo(TDisconnectEvent),[
TypeInfo(TADOConnection),
TypeInfo(TEventStatus)]);

RegisterEvent(TypeInfo(TEndOfRecordsetEvent),[
TypeInfo(TCustomADODataSet),
TypeInfo(WordBool),
TypeInfo(TEventStatus)]);

{RegisterEvent(TypeInfo(TExecuteCompleteEvent),[
TypeInfo(TADOConnection),
TypeInfo(Integer),
TypeInfo(Error),
TypeInfo(TEventStatus),
TypeInfo(_Command),
TypeInfo(_Recordset)]);}

RegisterEvent(TypeInfo(TFetchProgressEvent),[
TypeInfo(TCustomADODataSet),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TEventStatus)]);

{RegisterEvent(TypeInfo(TFieldChangeCompleteEvent),[
TypeInfo(TCustomADODataSet),
TypeInfo(Integer),
TypeInfo(OleVariant),
TypeInfo(Error),
TypeInfo(TEventStatus)]);}

{RegisterEvent(TypeInfo(TInfoMessageEvent),[
TypeInfo(TADOConnection),
TypeInfo(Error),
TypeInfo(TEventStatus)]);}

{RegisterEvent(TypeInfo(TRecordChangeCompleteEvent),[
TypeInfo(TCustomADODataSet),
TypeInfo(TEventReason),
TypeInfo(Integer),
TypeInfo(Error),
TypeInfo(TEventStatus)]);}

{RegisterEvent(TypeInfo(TRecordsetCreate),[
TypeInfo(TCustomADODataSet),
TypeInfo(_Recordset)]);}

{RegisterEvent(TypeInfo(TRecordsetErrorEvent),[
TypeInfo(TCustomADODataSet),
TypeInfo(TEventReason),
TypeInfo(Error),
TypeInfo(TEventStatus)]);}

{RegisterEvent(TypeInfo(TRecordsetEvent),[
TypeInfo(TCustomADODataSet),
TypeInfo(Error),
TypeInfo(TEventStatus)]);}

RegisterEvent(TypeInfo(TRecordsetReasonEvent),[
TypeInfo(TCustomADODataSet),
TypeInfo(TEventReason),
TypeInfo(TEventStatus)]);

RegisterEvent(TypeInfo(TWillChangeFieldEvent),[
TypeInfo(TCustomADODataSet),
TypeInfo(Integer),
TypeInfo(OleVariant),
TypeInfo(TEventStatus)]);

RegisterEvent(TypeInfo(TWillChangeRecordEvent),[
TypeInfo(TCustomADODataSet),
TypeInfo(TEventReason),
TypeInfo(Integer),
TypeInfo(TEventStatus)]);

RegisterEvent(TypeInfo(TWillConnectEvent),[
TypeInfo(TADOConnection),
TypeInfo(WideString),
TypeInfo(WideString),
TypeInfo(WideString),
TypeInfo(TConnectOption),
TypeInfo(TEventStatus)]);

{RegisterEvent(TypeInfo(TWillExecuteEvent),[
TypeInfo(TADOConnection),
TypeInfo(WideString),
TypeInfo(TCursorType),
TypeInfo(TADOLockType),
TypeInfo(TCommandType),
TypeInfo(TExecuteOptions),
TypeInfo(TEventStatus),
TypeInfo(_Command),
TypeInfo(_Recordset)]);}

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
