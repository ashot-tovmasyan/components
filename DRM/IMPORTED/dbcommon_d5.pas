{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit DBCOMMON_D5;
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
  Classes,
  DB,
  DBCommon;
function ConvertTExprNodeToVariant(var R : TExprNode) : OleVariant;
function ConvertVariantToTExprNode(const V : OleVariant) : TExprNode;
function ConvertTFieldInfoToVariant(var R : TFieldInfo) : OleVariant;
function ConvertVariantToTFieldInfo(const V : OleVariant) : TFieldInfo;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TExprNode__Wrapper = class(TDCRecordWrapper)
private
fR : TExprNode;
public
function GetRecordPtr : pointer; override;
published
procedure setFKind(const val : TExprNodeKind);
function getFKind : TExprNodeKind;
property FKind : TExprNodeKind read getFKind write setFKind;
procedure setFPartial(const val : Boolean);
function getFPartial : Boolean;
property FPartial : Boolean read getFPartial write setFPartial;
procedure setFOperator(const val : TCANOperator);
function getFOperator : TCANOperator;
property FOperator : TCANOperator read getFOperator write setFOperator;
procedure setFData(const val : Variant);
function getFData : Variant;
property FData : Variant read getFData write setFData;
procedure setFDataType(const val : TFieldType);
function getFDataType : TFieldType;
property FDataType : TFieldType read getFDataType write setFDataType;
procedure setFDataSize(const val : Integer);
function getFDataSize : Integer;
property FDataSize : Integer read getFDataSize write setFDataSize;
procedure setFArgs(const val : TList);
function getFArgs : TList;
property FArgs : TList read getFArgs write setFArgs;
procedure setFScopeKind(const val : TExprScopeKind);
function getFScopeKind : TExprScopeKind;
property FScopeKind : TExprScopeKind read getFScopeKind write setFScopeKind;
end;
type __TFieldInfo__Wrapper = class(TDCRecordWrapper)
private
fR : TFieldInfo;
public
function GetRecordPtr : pointer; override;
published
procedure setDatabaseName(const val : AnsiString);
function getDatabaseName : AnsiString;
property DatabaseName : AnsiString read getDatabaseName write setDatabaseName;
procedure setTableName(const val : AnsiString);
function getTableName : AnsiString;
property TableName : AnsiString read getTableName write setTableName;
procedure setOriginalFieldName(const val : AnsiString);
function getOriginalFieldName : AnsiString;
property OriginalFieldName : AnsiString read getOriginalFieldName write setOriginalFieldName;
end;
type
_T0 = function (const p0 : string;
const p1 : IDispatch): Boolean of object;

{_T1 = function (var p0 : PChar;
out p1 : string;
p2 : TSQLToken): TSQLToken of object;}

_T2 = function (const p0 : string;
p1 : TDataSet): TIndexDef of object;

_T3 = function (const p0 : string): string of object;

{_T4 = procedure (p0 : TDataSet;
const p1 : string;
p2 : TFilterOptions;
p3 : TParserOptions;
const p4 : string;
p5 : TBits;
p6 : TFieldMap) of object;}

_T5 = procedure (const p0 : string;
p1 : TFilterOptions;
p2 : TParserOptions;
const p3 : string) of object;

{_T6 = procedure (p0 : TDataSet;
p1 : TFilterOptions;
p2 : TParserOptions;
const p3 : string;
p4 : TBits;
p5 : TFieldMap) of object;}

{_T7 = function (p0 : TField;
p1 : TCANOperator;
const p2 : Variant): PExprNode of object;}

{_T8 = function (p0 : TExprNodeKind;
p1 : TCANOperator;
const p2 : Variant;
p3 : PExprNode;
p4 : PExprNode): PExprNode of object;}

{_T9 = function (p0 : PExprNode): TExprData of object;}

function __TExprNode__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TExprNode__Wrapper.setFKind(const val : TExprNodeKind);
begin
TExprNode(GetRecordPtr^).FKind := val;
end;
function __TExprNode__Wrapper.getFKind : TExprNodeKind;
begin
result := TExprNode(GetRecordPtr^).FKind;
end;
procedure __TExprNode__Wrapper.setFPartial(const val : Boolean);
begin
TExprNode(GetRecordPtr^).FPartial := val;
end;
function __TExprNode__Wrapper.getFPartial : Boolean;
begin
result := TExprNode(GetRecordPtr^).FPartial;
end;
procedure __TExprNode__Wrapper.setFOperator(const val : TCANOperator);
begin
TExprNode(GetRecordPtr^).FOperator := val;
end;
function __TExprNode__Wrapper.getFOperator : TCANOperator;
begin
result := TExprNode(GetRecordPtr^).FOperator;
end;
procedure __TExprNode__Wrapper.setFData(const val : Variant);
begin
TExprNode(GetRecordPtr^).FData := val;
end;
function __TExprNode__Wrapper.getFData : Variant;
begin
result := TExprNode(GetRecordPtr^).FData;
end;
procedure __TExprNode__Wrapper.setFDataType(const val : TFieldType);
begin
TExprNode(GetRecordPtr^).FDataType := val;
end;
function __TExprNode__Wrapper.getFDataType : TFieldType;
begin
result := TExprNode(GetRecordPtr^).FDataType;
end;
procedure __TExprNode__Wrapper.setFDataSize(const val : Integer);
begin
TExprNode(GetRecordPtr^).FDataSize := val;
end;
function __TExprNode__Wrapper.getFDataSize : Integer;
begin
result := TExprNode(GetRecordPtr^).FDataSize;
end;
procedure __TExprNode__Wrapper.setFArgs(const val : TList);
begin
TExprNode(GetRecordPtr^).FArgs := val;
end;
function __TExprNode__Wrapper.getFArgs : TList;
begin
result := TExprNode(GetRecordPtr^).FArgs;
end;
procedure __TExprNode__Wrapper.setFScopeKind(const val : TExprScopeKind);
begin
TExprNode(GetRecordPtr^).FScopeKind := val;
end;
function __TExprNode__Wrapper.getFScopeKind : TExprScopeKind;
begin
result := TExprNode(GetRecordPtr^).FScopeKind;
end;
function __TFieldInfo__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TFieldInfo__Wrapper.setDatabaseName(const val : AnsiString);
begin
TFieldInfo(GetRecordPtr^).DatabaseName := val;
end;
function __TFieldInfo__Wrapper.getDatabaseName : AnsiString;
begin
result := TFieldInfo(GetRecordPtr^).DatabaseName;
end;
procedure __TFieldInfo__Wrapper.setTableName(const val : AnsiString);
begin
TFieldInfo(GetRecordPtr^).TableName := val;
end;
function __TFieldInfo__Wrapper.getTableName : AnsiString;
begin
result := TFieldInfo(GetRecordPtr^).TableName;
end;
procedure __TFieldInfo__Wrapper.setOriginalFieldName(const val : AnsiString);
begin
TFieldInfo(GetRecordPtr^).OriginalFieldName := val;
end;
function __TFieldInfo__Wrapper.getOriginalFieldName : AnsiString;
begin
result := TFieldInfo(GetRecordPtr^).OriginalFieldName;
end;
function _TExprNode_ : IDispatch;
begin
  result := __TExprNode__Wrapper.Create;
end;
function _TFieldInfo_ : IDispatch;
begin
  result := __TFieldInfo__Wrapper.Create;
end;
function ____GetFieldInfo__Wrapper(const p0 : string;
const p1 : IDispatch): Boolean;
var
__p1 : ^TFieldInfo;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
result := GetFieldInfo(p0,__p1^);
end;


type __TExprNode__Wrapper__ = class(__TExprNode__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TExprNode__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTExprNodeToVariant(var R : TExprNode) : OleVariant;
var
__rw : __TExprNode__Wrapper__;
begin
__rw := __TExprNode__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTExprNode(const V : OleVariant) : TExprNode;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TExprNode((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TFieldInfo__Wrapper__ = class(__TFieldInfo__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TFieldInfo__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTFieldInfoToVariant(var R : TFieldInfo) : OleVariant;
var
__rw : __TFieldInfo__Wrapper__;
begin
__rw := __TFieldInfo__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTFieldInfo(const V : OleVariant) : TFieldInfo;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TFieldInfo((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTExprParser__DataSize(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TExprParser(Instance).DataSize;
end;

procedure __DC__SetTFilterExpr__DataSet(Instance : TObject; Params : PVariantArgList);
begin
TFilterExpr(Instance).DataSet:=TDataSet(VarToObject(OleVariant(Params^[0])));
end;

procedure __RegisterProps;
begin
RegisterProperty(TExprParser,'DataSize',__DC__GetTExprParser__DataSize,nil);
RegisterProperty(TFilterExpr,'DataSet',nil,__DC__SetTFilterExpr__DataSet);
end;

const __ConstNames0 : array[0..113] of string = (
'coNOTDEFINED'
,'coISBLANK'
,'coNOTBLANK'
,'coEQ'
,'coNE'
,'coGT'
,'coLT'
,'coGE'
,'coLE'
,'coNOT'
,'coAND'
,'coOR'
,'coTUPLE2'
,'coFIELD2'
,'coCONST2'
,'coMINUS'
,'coADD'
,'coSUB'
,'coMUL'
,'coDIV'
,'coMOD'
,'coREM'
,'coSUM'
,'coCOUNT'
,'coMIN'
,'coMAX'
,'coAVG'
,'coCONT'
,'coUDF2'
,'coCONTINUE2'
,'coLIKE'
,'coIN'
,'coLIST2'
,'coUPPER'
,'coLOWER'
,'coFUNC2'
,'coLISTELEM2'
,'coASSIGN'
,'nodeNULL'
,'nodeUNARY'
,'nodeBINARY'
,'nodeCOMPARE'
,'nodeFIELD'
,'nodeCONST'
,'nodeTUPLE'
,'nodeCONTINUE'
,'nodeUDF'
,'nodeLIST'
,'nodeFUNC'
,'nodeLISTELEM'
,'CANEXPRSIZE'
,'CANHDRSIZE'
,'CANEXPRVERSION'
,'poExtSyntax'
,'poAggregate'
,'poDefaultExpr'
,'poUseOrigNames'
,'poFieldNameGiven'
,'poFieldDepend'
,'enField'
,'enConst'
,'enOperator'
,'enFunc'
,'skField'
,'skAgg'
,'skConst'
,'etEnd'
,'etSymbol'
,'etName'
,'etLiteral'
,'etLParen'
,'etRParen'
,'etEQ'
,'etNE'
,'etGE'
,'etLE'
,'etGT'
,'etLT'
,'etADD'
,'etSUB'
,'etMUL'
,'etDIV'
,'etComma'
,'etLIKE'
,'etISNULL'
,'etISNOTNULL'
,'etIN'
,'stUnknown'
,'stTableName'
,'stFieldName'
,'stAscending'
,'stDescending'
,'stSelect'
,'stFrom'
,'stWhere'
,'stGroupBy'
,'stHaving'
,'stUnion'
,'stPlan'
,'stOrderBy'
,'stForUpdate'
,'stEnd'
,'stPredicate'
,'stValue'
,'stIsNull'
,'stIsNotNull'
,'stLike'
,'stAnd'
,'stOr'
,'stNumber'
,'stAllFields'
,'stComment'
,'stDistinct'
,'SQLSections'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,coNOTDEFINED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,coISBLANK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,coNOTBLANK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,coEQ));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,coNE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,coGT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,coLT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,coGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,coLE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,coNOT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,coAND));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,coOR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,coTUPLE2));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,coFIELD2));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,coCONST2));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,coMINUS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,coADD));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,coSUB));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,coMUL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,coDIV));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,coMOD));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,coREM));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,coSUM));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,coCOUNT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,coMIN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,coMAX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,coAVG));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,coCONT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,coUDF2));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,coCONTINUE2));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,coLIKE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,coIN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,coLIST2));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,coUPPER));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,coLOWER));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,coFUNC2));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,coLISTELEM2));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,coASSIGN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,nodeNULL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,nodeUNARY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,nodeBINARY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,nodeCOMPARE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,nodeFIELD));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,nodeCONST));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,nodeTUPLE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,nodeCONTINUE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,nodeUDF));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,nodeLIST));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[48] ,nodeFUNC));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[49] ,nodeLISTELEM));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[50] ,CANEXPRSIZE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[51] ,CANHDRSIZE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[52] ,CANEXPRVERSION));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[53] ,poExtSyntax));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[54] ,poAggregate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[55] ,poDefaultExpr));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[56] ,poUseOrigNames));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[57] ,poFieldNameGiven));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[58] ,poFieldDepend));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[59] ,enField));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[60] ,enConst));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[61] ,enOperator));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[62] ,enFunc));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[63] ,skField));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[64] ,skAgg));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[65] ,skConst));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[66] ,etEnd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[67] ,etSymbol));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[68] ,etName));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[69] ,etLiteral));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[70] ,etLParen));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[71] ,etRParen));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[72] ,etEQ));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[73] ,etNE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[74] ,etGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[75] ,etLE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[76] ,etGT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[77] ,etLT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[78] ,etADD));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[79] ,etSUB));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[80] ,etMUL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[81] ,etDIV));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[82] ,etComma));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[83] ,etLIKE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[84] ,etISNULL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[85] ,etISNOTNULL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[86] ,etIN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[87] ,stUnknown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[88] ,stTableName));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[89] ,stFieldName));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[90] ,stAscending));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[91] ,stDescending));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[92] ,stSelect));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[93] ,stFrom));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[94] ,stWhere));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[95] ,stGroupBy));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[96] ,stHaving));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[97] ,stUnion));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[98] ,stPlan));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[99] ,stOrderBy));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[100] ,stForUpdate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[101] ,stEnd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[102] ,stPredicate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[103] ,stValue));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[104] ,stIsNull));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[105] ,stIsNotNull));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[106] ,stLike));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[107] ,stAnd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[108] ,stOr));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[109] ,stNumber));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[110] ,stAllFields));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[111] ,stComment));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[112] ,stDistinct));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[113] ,VarFromSet(SQLSections, sizeof(SQLSections))));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..1] of TClass = (
TExprParser,
TFilterExpr
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..4] of string = (
'TExprNode'
,'TFieldInfo'
,'GetFieldInfo'
,'GetIndexForOrderBy'
,'GetTableNameFromSQL'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TExprNode_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(_TFieldInfo_)));
RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T0),[
TypeInfo(string),
TypeInfo(IDispatch),TypeInfo(Boolean)],Addr(____GetFieldInfo__Wrapper),cRegister);

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T2),[
TypeInfo(string),
TypeInfo(TDataSet),TypeInfo(TIndexDef)],Addr(GetIndexForOrderBy),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T3),[
TypeInfo(string),TypeInfo(string)],Addr(GetTableNameFromSQL),cRegister);

RegRegisterMethod(TExprParser,'SetExprParams',TypeInfo(_T5),[
TypeInfo(string),
TypeInfo(TFilterOptions),
TypeInfo(TParserOptions),
TypeInfo(string)],Addr(TExprParser.SetExprParams));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'NextSQLToken',mtProc,TypeInfo(_T1),[
TypeInfoPChar,
TypeInfo(string),
TypeInfo(TSQLToken),TypeInfo(TSQLToken)],Addr(NextSQLToken),cRegister)}

{RegisterProc(TExprParser,'Create',mtConstructor,TypeInfo(_T4),[
TypeInfo(TDataSet),
TypeInfo(string),
TypeInfo(TFilterOptions),
TypeInfo(TParserOptions),
TypeInfo(string),
TypeInfo(TBits),
TypeInfo(TFieldMap)],Addr(TExprParser.Create),cRegister)}

{RegisterProc(TFilterExpr,'Create',mtConstructor,TypeInfo(_T6),[
TypeInfo(TDataSet),
TypeInfo(TFilterOptions),
TypeInfo(TParserOptions),
TypeInfo(string),
TypeInfo(TBits),
TypeInfo(TFieldMap)],Addr(TFilterExpr.Create),cRegister)}

{RegRegisterMethod(TFilterExpr,'NewCompareNode',TypeInfo(_T7),[
TypeInfo(TField),
TypeInfo(TCANOperator),
TypeInfo(Variant),TypeInfoPointer],Addr(TFilterExpr.NewCompareNode))}

{RegRegisterMethod(TFilterExpr,'NewNode',TypeInfo(_T8),[
TypeInfo(TExprNodeKind),
TypeInfo(TCANOperator),
TypeInfo(Variant),
TypeInfoPointer,
TypeInfoPointer,TypeInfoPointer],Addr(TFilterExpr.NewNode))}

{RegRegisterMethod(TFilterExpr,'GetFilterData',TypeInfo(_T9),[
TypeInfoPointer,TypeInfo(TExprData)],Addr(TFilterExpr.GetFilterData))}

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
