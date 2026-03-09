{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit DBCOMMON_D4;
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
  BDE,
  DBCommon;
function ConvertFMTBcdToVariant(var R : FMTBcd) : OleVariant;
function ConvertVariantToFMTBcd(const V : OleVariant) : FMTBcd;
function ConvertTExprNodeToVariant(var R : TExprNode) : OleVariant;
function ConvertVariantToTExprNode(const V : OleVariant) : TExprNode;
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
procedure setFOperator(const val : CanOp);
function getFOperator : CanOp;
property FOperator : CanOp read getFOperator write setFOperator;
procedure setFData(const val : Variant);
function getFData : Variant;
property FData : Variant read getFData write setFData;
procedure setFDataType(const val : Integer);
function getFDataType : Integer;
property FDataType : Integer read getFDataType write setFDataType;
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
type __FMTBcd__Wrapper = class(TDCRecordWrapper)
private
fR : FMTBcd;
public
function GetRecordPtr : pointer; override;
published
procedure setiPrecision(const val : Byte);
function getiPrecision : Byte;
property iPrecision : Byte read getiPrecision write setiPrecision;
procedure setiSignSpecialPlaces(const val : Byte);
function getiSignSpecialPlaces : Byte;
property iSignSpecialPlaces : Byte read getiSignSpecialPlaces write setiSignSpecialPlaces;
end;
type
_T0 = function (const p0 : IDispatch;
var p1 : Currency): Boolean of object;

_T1 = function (p0 : Currency;
const p1 : IDispatch;
p2 : Integer;
p3 : Integer): Boolean of object;

{_T2 = function (p0 : TDataSet;
var p1 : DataSources): Boolean of object;}

_T3 = procedure (p0 : TDataSet;
const p1 : string;
p2 : TFilterOptions;
p3 : TParserOptions;
const p4 : string;
p5 : TBits) of object;

_T4 = procedure (const p0 : string;
p1 : TFilterOptions;
p2 : TParserOptions;
const p3 : string) of object;

_T5 = procedure (p0 : TDataSet;
p1 : TFilterOptions;
p2 : TParserOptions;
const p3 : string;
p4 : TBits) of object;

{_T6 = function (p0 : TField;
p1 : CanOp;
const p2 : Variant): PExprNode of object;}

{_T7 = function (p0 : TExprNodeKind;
p1 : CanOp;
const p2 : Variant;
p3 : PExprNode;
p4 : PExprNode): PExprNode of object;}

{_T8 = function (p0 : PExprNode): PCANExpr of object;}

_T9 = procedure (p0 : TDataSet) of object;

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
procedure __TExprNode__Wrapper.setFOperator(const val : CanOp);
begin
TExprNode(GetRecordPtr^).FOperator := val;
end;
function __TExprNode__Wrapper.getFOperator : CanOp;
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
procedure __TExprNode__Wrapper.setFDataType(const val : Integer);
begin
TExprNode(GetRecordPtr^).FDataType := val;
end;
function __TExprNode__Wrapper.getFDataType : Integer;
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
function _TExprNode_ : IDispatch;
begin
  result := __TExprNode__Wrapper.Create;
end;
function __FMTBcd__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __FMTBcd__Wrapper.setiPrecision(const val : Byte);
begin
FMTBcd(GetRecordPtr^).iPrecision := val;
end;
function __FMTBcd__Wrapper.getiPrecision : Byte;
begin
result := FMTBcd(GetRecordPtr^).iPrecision;
end;
procedure __FMTBcd__Wrapper.setiSignSpecialPlaces(const val : Byte);
begin
FMTBcd(GetRecordPtr^).iSignSpecialPlaces := val;
end;
function __FMTBcd__Wrapper.getiSignSpecialPlaces : Byte;
begin
result := FMTBcd(GetRecordPtr^).iSignSpecialPlaces;
end;
function ____FMTBCDToCurr__Wrapper(const p0 : IDispatch;
var p1 : Currency): Boolean;
var
__p0 : ^FMTBcd;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := FMTBCDToCurr(__p0^,p1);
end;

function ____CurrToFMTBCD__Wrapper(p0 : Currency;
const p1 : IDispatch;
p2 : Integer;
p3 : Integer): Boolean;
var
__p1 : ^FMTBcd;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
result := CurrToFMTBCD(p0,__p1^,p2,p3);
end;


type __FMTBcd__Wrapper__ = class(__FMTBcd__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __FMTBcd__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertFMTBcdToVariant(var R : FMTBcd) : OleVariant;
var
__rw : __FMTBcd__Wrapper__;
begin
__rw := __FMTBcd__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToFMTBcd(const V : OleVariant) : FMTBcd;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := FMTBcd((_idisp as IDCRecordWrapper).GetRecordPtr^);
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
function __DC__GetTExprParser__DataSize(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TExprParser(Instance).DataSize;
end;

procedure __DC__SetTFilterExpr__DataSet(Instance : TObject; Params : PVariantArgList);
begin
TFilterExpr(Instance).DataSet:=TDataSet(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTMasterDataLink__FieldNames(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMasterDataLink(Instance).FieldNames;
end;

procedure __DC__SetTMasterDataLink__FieldNames(Instance : TObject; Params : PVariantArgList);
begin
TMasterDataLink(Instance).FieldNames:=OleVariant(Params^[0]);
end;

function __DC__GetTMasterDataLink__Fields(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TMasterDataLink(Instance).Fields);
end;

procedure __RegisterProps;
begin
RegisterProperty(TExprParser,'DataSize',__DC__GetTExprParser__DataSize,nil);
RegisterProperty(TFilterExpr,'DataSet',nil,__DC__SetTFilterExpr__DataSet);
RegisterProperty(TMasterDataLink,'FieldNames',__DC__GetTMasterDataLink__FieldNames,__DC__SetTMasterDataLink__FieldNames);
RegisterProperty(TMasterDataLink,'Fields',__DC__GetTMasterDataLink__Fields,nil);
end;

const __ConstNames0 : array[0..33] of string = (
'poExtSyntax'
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
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,poExtSyntax));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,poAggregate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,poDefaultExpr));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,poUseOrigNames));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,poFieldNameGiven));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,poFieldDepend));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,enField));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,enConst));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,enOperator));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,enFunc));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,skField));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,skAgg));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,skConst));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,etEnd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,etSymbol));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,etName));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,etLiteral));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,etLParen));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,etRParen));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,etEQ));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,etNE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,etGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,etLE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,etGT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,etLT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,etADD));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,etSUB));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,etMUL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,etDIV));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,etComma));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,etLIKE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,etISNULL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,etISNOTNULL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,etIN));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..2] of TClass = (
TExprParser,
TFilterExpr,
TMasterDataLink
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
'TExprNode'
,'FMTBCDToCurr'
,'CurrToFMTBCD'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TExprNode_)));
RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T0),[
TypeInfo(IDispatch),
TypeInfo(Currency),TypeInfo(Boolean)],Addr(____FMTBCDToCurr__Wrapper),cRegister);

RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T1),[
TypeInfo(Currency),
TypeInfo(IDispatch),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Boolean)],Addr(____CurrToFMTBCD__Wrapper),cRegister);

RegisterProc(TExprParser,'Create',mtConstructor,TypeInfo(_T3),[
TypeInfo(TDataSet),
TypeInfo(string),
TypeInfo(TFilterOptions),
TypeInfo(TParserOptions),
TypeInfo(string),
TypeInfo(TBits)],Addr(TExprParser.Create),cRegister);

RegRegisterMethod(TExprParser,'SetExprParams',TypeInfo(_T4),[
TypeInfo(string),
TypeInfo(TFilterOptions),
TypeInfo(TParserOptions),
TypeInfo(string)],Addr(TExprParser.SetExprParams));

RegisterProc(TFilterExpr,'Create',mtConstructor,TypeInfo(_T5),[
TypeInfo(TDataSet),
TypeInfo(TFilterOptions),
TypeInfo(TParserOptions),
TypeInfo(string),
TypeInfo(TBits)],Addr(TFilterExpr.Create),cRegister);

RegisterProc(TMasterDataLink,'Create',mtConstructor,TypeInfo(_T9),[
TypeInfo(TDataSet)],Addr(TMasterDataLink.Create),cRegister);

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'GetFieldSource',mtProc,TypeInfo(_T2),[
TypeInfo(TDataSet),
TypeInfo(DataSources),TypeInfo(Boolean)],Addr(GetFieldSource),cRegister)}

{RegRegisterMethod(TFilterExpr,'NewCompareNode',TypeInfo(_T6),[
TypeInfo(TField),
TypeInfo(CanOp),
TypeInfo(Variant),TypeInfoPointer],Addr(TFilterExpr.NewCompareNode))}

{RegRegisterMethod(TFilterExpr,'NewNode',TypeInfo(_T7),[
TypeInfo(TExprNodeKind),
TypeInfo(CanOp),
TypeInfo(Variant),
TypeInfoPointer,
TypeInfoPointer,TypeInfoPointer],Addr(TFilterExpr.NewNode))}

{RegRegisterMethod(TFilterExpr,'GetFilterData',TypeInfo(_T8),[
TypeInfoPointer,TypeInfoPointer],Addr(TFilterExpr.GetFilterData))}

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
