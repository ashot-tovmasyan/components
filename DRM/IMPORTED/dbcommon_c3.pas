{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit DBCOMMON_C3;
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

{_T2 = function (p0 : PVarArray): Variant of object;}

_T3 = procedure (p0 : TDataSet;
const p1 : string;
p2 : TFilterOptions) of object;

_T4 = procedure (p0 : TDataSet;
p1 : TFilterOptions) of object;

{_T5 = function (p0 : TField;
p1 : CanOp;
const p2 : Variant): PExprNode of object;}

{_T6 = function (p0 : TExprNodeKind;
p1 : CanOp;
const p2 : Variant;
p3 : PExprNode;
p4 : PExprNode): PExprNode of object;}

{_T7 = function (p0 : PExprNode): PCANExpr of object;}

_T8 = procedure (p0 : TDataSet) of object;

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
RegisterProperty(TMasterDataLink,'FieldNames',__DC__GetTMasterDataLink__FieldNames,__DC__SetTMasterDataLink__FieldNames);
RegisterProperty(TMasterDataLink,'Fields',__DC__GetTMasterDataLink__Fields,nil);
end;

const __ConstNames0 : array[0..14] of string = (
'enField'
,'enConst'
,'enOperator'
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
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,enField));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,enConst));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,enOperator));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,etEnd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,etSymbol));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,etName));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,etLiteral));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,etLParen));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,etRParen));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,etEQ));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,etNE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,etGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,etLE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,etGT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,etLT));
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
TypeInfo(TFilterOptions)],Addr(TExprParser.Create),cRegister);

RegisterProc(TFilterExpr,'Create',mtConstructor,TypeInfo(_T4),[
TypeInfo(TDataSet),
TypeInfo(TFilterOptions)],Addr(TFilterExpr.Create),cRegister);

RegisterProc(TMasterDataLink,'Create',mtConstructor,TypeInfo(_T8),[
TypeInfo(TDataSet)],Addr(TMasterDataLink.Create),cRegister);

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'SafeArrayToVariant',mtProc,TypeInfo(_T2),[
TypeInfoPointer,TypeInfo(Variant)],Addr(SafeArrayToVariant),cRegister)}

{RegRegisterMethod(TFilterExpr,'NewCompareNode',TypeInfo(_T5),[
TypeInfo(TField),
TypeInfo(CanOp),
TypeInfo(Variant),TypeInfoPointer],Addr(TFilterExpr.NewCompareNode))}

{RegRegisterMethod(TFilterExpr,'NewNode',TypeInfo(_T6),[
TypeInfo(TExprNodeKind),
TypeInfo(CanOp),
TypeInfo(Variant),
TypeInfoPointer,
TypeInfoPointer,TypeInfoPointer],Addr(TFilterExpr.NewNode))}

{RegRegisterMethod(TFilterExpr,'GetFilterData',TypeInfo(_T7),[
TypeInfoPointer,TypeInfoPointer],Addr(TFilterExpr.GetFilterData))}

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
