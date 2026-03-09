{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit VARIANTS_D6;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  activex,
  classes,
  dcscript,
  dcsystem,
  dcdreamlib,
  Types,
  Variants;
function ConvertTGUIDToVariant(var R : TGUID) : OleVariant;
function ConvertVariantToTGUID(const V : OleVariant) : TGUID;
function ConvertTVarDataToVariant(var R : TVarData) : OleVariant;
function ConvertVariantToTVarData(const V : OleVariant) : TVarData;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TGUID__Wrapper = class(TDCRecordWrapper)
private
fR : TGUID;
public
function GetRecordPtr : pointer; override;
published
procedure setD1(const val : LongWord);
function getD1 : LongWord;
property D1 : LongWord read getD1 write setD1;
procedure setD2(const val : Word);
function getD2 : Word;
property D2 : Word read getD2 write setD2;
procedure setD3(const val : Word);
function getD3 : Word;
property D3 : Word read getD3 write setD3;
end;
type __TVarData__Wrapper = class(TDCRecordWrapper)
private
fR : TVarData;
public
function GetRecordPtr : pointer; override;
published
procedure setVType(const val : TVarType);
function getVType : TVarType;
property VType : TVarType read getVType write setVType;
procedure setReserved1(const val : Word);
function getReserved1 : Word;
property Reserved1 : Word read getReserved1 write setReserved1;
procedure setReserved2(const val : Word);
function getReserved2 : Word;
property Reserved2 : Word read getReserved2 write setReserved2;
procedure setReserved3(const val : Word);
function getReserved3 : Word;
property Reserved3 : Word read getReserved3 write setReserved3;
procedure setVSmallInt(const val : SmallInt);
function getVSmallInt : SmallInt;
property VSmallInt : SmallInt read getVSmallInt write setVSmallInt;
procedure setVInteger(const val : Integer);
function getVInteger : Integer;
property VInteger : Integer read getVInteger write setVInteger;
procedure setVSingle(const val : Single);
function getVSingle : Single;
property VSingle : Single read getVSingle write setVSingle;
procedure setVDouble(const val : Double);
function getVDouble : Double;
property VDouble : Double read getVDouble write setVDouble;
procedure setVCurrency(const val : Currency);
function getVCurrency : Currency;
property VCurrency : Currency read getVCurrency write setVCurrency;
procedure setVError(const val : LongWord);
function getVError : LongWord;
property VError : LongWord read getVError write setVError;
procedure setVBoolean(const val : WordBool);
function getVBoolean : WordBool;
property VBoolean : WordBool read getVBoolean write setVBoolean;
procedure setVShortInt(const val : Shortint);
function getVShortInt : Shortint;
property VShortInt : Shortint read getVShortInt write setVShortInt;
procedure setVByte(const val : Byte);
function getVByte : Byte;
property VByte : Byte read getVByte write setVByte;
procedure setVWord(const val : Word);
function getVWord : Word;
property VWord : Word read getVWord write setVWord;
procedure setVLongWord(const val : LongWord);
function getVLongWord : LongWord;
property VLongWord : LongWord read getVLongWord write setVLongWord;
end;
type __TCustomVariantType__ = class(TCustomVariantType);
type
_T0 = function (const p0 : Variant): TVarType of object;

_T1 = function (const p0 : Variant;
p1 : TVarType): Variant of object;

_T2 = function (const p0 : Variant;
p1 : TVarType): Boolean of object;

_T3 = function (const p0 : Variant): Boolean of object;

_T4 = _T3;

_T5 = procedure (const p0 : Variant) of object;

_T6 = _T3;

_T7 = _T3;

_T8 = _T3;

_T9 = _T3;

_T10 = _T3;

_T11 = _T3;

_T12 = _T3;

_T13 = function (const p0 : Variant): string of object;

_T14 = function (const p0 : Variant;
const p1 : string): string of object;

_T15 = function (const p0 : Variant): WideString of object;

_T16 = function (const p0 : Variant;
const p1 : WideString): WideString of object;

_T17 = function (const p0 : Variant): TDateTime of object;

_T18 = function (const p0 : TDateTime): Variant of object;

_T19 = function (const p0 : Variant;
const p1 : Variant;
const p2 : Variant): Boolean of object;

_T20 = function (const p0 : Variant;
const p1 : Variant;
const p2 : Variant): Variant of object;

_T21 = function (const p0 : Variant;
const p1 : Variant): Boolean of object;

_T22 = function (const p0 : Variant;
const p1 : Variant): TVariantRelationship of object;

_T23 = _T3;

_T24 = function (const p0 : Variant;
const p1 : IDispatch;
out p2): Boolean of object;

_T25 = procedure (var p0 : Variant;
const p1 : Variant) of object;

_T26 = _T3;

_T27 = function (const p0 : Array of Integer;
p1 : TVarType): Variant of object;

_T28 = function (const p0 : Array of Variant): Variant of object;

_T29 = function (const p0 : Variant): Variant of object;

_T30 = function (const p0 : TVarType): Boolean of object;

_T31 = _T30;

_T32 = function (const p0 : Variant): Integer of object;

_T33 = function (const p0 : Variant;
p1 : Integer): Integer of object;

_T34 = _T33;

_T35 = function (const p0 : Variant): Pointer of object;

_T36 = _T5;

_T37 = function (const p0 : Variant;
const p1 : Array of Integer): Variant of object;

_T38 = procedure (var p0 : Variant;
const p1 : Variant;
const p2 : Array of Integer) of object;

_T39 = procedure (var p0 : Variant;
const p1 : Pointer;
p2 : Pointer) of object;

_T40 = procedure (var p0 : Pointer;
const p1 : Variant;
p2 : Pointer) of object;

_T41 = function : Variant of object;

_T42 = _T41;

_T43 = function (const p0 : TVarType;
out p1 : TCustomVariantType): Boolean of object;

_T44 = function (const p0 : IDispatch;
out p1): HResult of object;

_T45 = function (const p0 : IDispatch;
const p1 : TVarOp;
out p2 : TVarType): Boolean of object;

_T46 = _T45;

_T47 = function (const p0 : IDispatch;
out p1 : TVarType): Boolean of object;

_T49 = procedure  of object;

_T50 = function (const p0 : IDispatch): Boolean of object;

_T51 = procedure (const p0 : IDispatch;
const p1 : IDispatch) of object;

_T52 = procedure (const p0 : IDispatch;
const p1 : IDispatch;
const p2 : TVarType) of object;

_T53 = _T51;

_T54 = procedure (const p0 : IDispatch) of object;

_T55 = procedure (const p0 : IDispatch;
const p1 : IDispatch;
const p2 : Boolean) of object;

_T56 = procedure (const p0 : IDispatch;
const p1 : IDispatch;
const p2 : TVarOp) of object;

_T57 = procedure (const p0 : IDispatch;
const p1 : TVarOp) of object;

_T58 = function (const p0 : IDispatch;
const p1 : IDispatch;
const p2 : TVarOp): Boolean of object;

_T59 = procedure (const p0 : IDispatch;
const p1 : IDispatch;
var p2 : TVarCompareResult) of object;

_T60 = function (const p0 : IDispatch;
const p1 : IDispatch;
const p2 : string;
const p3 : TVarDataArray): Boolean of object;

_T61 = function (const p0 : IDispatch;
const p1 : string;
const p2 : TVarDataArray): Boolean of object;

_T62 = function (const p0 : IDispatch;
const p1 : IDispatch;
const p2 : string): Boolean of object;

_T63 = function (const p0 : IDispatch;
const p1 : string;
const p2 : IDispatch): Boolean of object;

function __TGUID__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TGUID__Wrapper.setD1(const val : LongWord);
begin
TGUID(GetRecordPtr^).D1 := val;
end;
function __TGUID__Wrapper.getD1 : LongWord;
begin
result := TGUID(GetRecordPtr^).D1;
end;
procedure __TGUID__Wrapper.setD2(const val : Word);
begin
TGUID(GetRecordPtr^).D2 := val;
end;
function __TGUID__Wrapper.getD2 : Word;
begin
result := TGUID(GetRecordPtr^).D2;
end;
procedure __TGUID__Wrapper.setD3(const val : Word);
begin
TGUID(GetRecordPtr^).D3 := val;
end;
function __TGUID__Wrapper.getD3 : Word;
begin
result := TGUID(GetRecordPtr^).D3;
end;
function __TVarData__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TVarData__Wrapper.setVType(const val : TVarType);
begin
TVarData(GetRecordPtr^).VType := val;
end;
function __TVarData__Wrapper.getVType : TVarType;
begin
result := TVarData(GetRecordPtr^).VType;
end;
procedure __TVarData__Wrapper.setReserved1(const val : Word);
begin
TVarData(GetRecordPtr^).Reserved1 := val;
end;
function __TVarData__Wrapper.getReserved1 : Word;
begin
result := TVarData(GetRecordPtr^).Reserved1;
end;
procedure __TVarData__Wrapper.setReserved2(const val : Word);
begin
TVarData(GetRecordPtr^).Reserved2 := val;
end;
function __TVarData__Wrapper.getReserved2 : Word;
begin
result := TVarData(GetRecordPtr^).Reserved2;
end;
procedure __TVarData__Wrapper.setReserved3(const val : Word);
begin
TVarData(GetRecordPtr^).Reserved3 := val;
end;
function __TVarData__Wrapper.getReserved3 : Word;
begin
result := TVarData(GetRecordPtr^).Reserved3;
end;
procedure __TVarData__Wrapper.setVSmallInt(const val : SmallInt);
begin
TVarData(GetRecordPtr^).VSmallInt := val;
end;
function __TVarData__Wrapper.getVSmallInt : SmallInt;
begin
result := TVarData(GetRecordPtr^).VSmallInt;
end;
procedure __TVarData__Wrapper.setVInteger(const val : Integer);
begin
TVarData(GetRecordPtr^).VInteger := val;
end;
function __TVarData__Wrapper.getVInteger : Integer;
begin
result := TVarData(GetRecordPtr^).VInteger;
end;
procedure __TVarData__Wrapper.setVSingle(const val : Single);
begin
TVarData(GetRecordPtr^).VSingle := val;
end;
function __TVarData__Wrapper.getVSingle : Single;
begin
result := TVarData(GetRecordPtr^).VSingle;
end;
procedure __TVarData__Wrapper.setVDouble(const val : Double);
begin
TVarData(GetRecordPtr^).VDouble := val;
end;
function __TVarData__Wrapper.getVDouble : Double;
begin
result := TVarData(GetRecordPtr^).VDouble;
end;
procedure __TVarData__Wrapper.setVCurrency(const val : Currency);
begin
TVarData(GetRecordPtr^).VCurrency := val;
end;
function __TVarData__Wrapper.getVCurrency : Currency;
begin
result := TVarData(GetRecordPtr^).VCurrency;
end;
procedure __TVarData__Wrapper.setVError(const val : LongWord);
begin
TVarData(GetRecordPtr^).VError := val;
end;
function __TVarData__Wrapper.getVError : LongWord;
begin
result := TVarData(GetRecordPtr^).VError;
end;
procedure __TVarData__Wrapper.setVBoolean(const val : WordBool);
begin
TVarData(GetRecordPtr^).VBoolean := val;
end;
function __TVarData__Wrapper.getVBoolean : WordBool;
begin
result := TVarData(GetRecordPtr^).VBoolean;
end;
procedure __TVarData__Wrapper.setVShortInt(const val : Shortint);
begin
TVarData(GetRecordPtr^).VShortInt := val;
end;
function __TVarData__Wrapper.getVShortInt : Shortint;
begin
result := TVarData(GetRecordPtr^).VShortInt;
end;
procedure __TVarData__Wrapper.setVByte(const val : Byte);
begin
TVarData(GetRecordPtr^).VByte := val;
end;
function __TVarData__Wrapper.getVByte : Byte;
begin
result := TVarData(GetRecordPtr^).VByte;
end;
procedure __TVarData__Wrapper.setVWord(const val : Word);
begin
TVarData(GetRecordPtr^).VWord := val;
end;
function __TVarData__Wrapper.getVWord : Word;
begin
result := TVarData(GetRecordPtr^).VWord;
end;
procedure __TVarData__Wrapper.setVLongWord(const val : LongWord);
begin
TVarData(GetRecordPtr^).VLongWord := val;
end;
function __TVarData__Wrapper.getVLongWord : LongWord;
begin
result := TVarData(GetRecordPtr^).VLongWord;
end;
function ____VarSupports__Wrapper(const p0 : Variant;
const p1 : IDispatch;
out p2): Boolean;
var
__p1 : ^TGUID;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
result := VarSupports(p0,__p1^,p2);
end;

function __TCustomVariantType__QueryInterface__Wrapper(__Instance : TCustomVariantType;
const p0 : IDispatch;
out p1): HResult;
var
__p0 : ^TGUID;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := __TCustomVariantType__(__Instance).QueryInterface(__p0^,p1);
end;

function __TCustomVariantType__LeftPromotion__Wrapper(__Instance : TCustomVariantType;
const p0 : IDispatch;
const p1 : TVarOp;
out p2 : TVarType): Boolean;
var
__p0 : ^TVarData;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := __TCustomVariantType__(__Instance).LeftPromotion(__p0^,p1,p2);
end;

function __TCustomVariantType__RightPromotion__Wrapper(__Instance : TCustomVariantType;
const p0 : IDispatch;
const p1 : TVarOp;
out p2 : TVarType): Boolean;
var
__p0 : ^TVarData;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := __TCustomVariantType__(__Instance).RightPromotion(__p0^,p1,p2);
end;

function __TCustomVariantType__OlePromotion__Wrapper(__Instance : TCustomVariantType;
const p0 : IDispatch;
out p1 : TVarType): Boolean;
var
__p0 : ^TVarData;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := __TCustomVariantType__(__Instance).OlePromotion(__p0^,p1);
end;

function __TCustomVariantType__IsClear__Wrapper(__Instance : TCustomVariantType;
const p0 : IDispatch): Boolean;
var
__p0 : ^TVarData;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := TCustomVariantType(__Instance).IsClear(__p0^);
end;

procedure __TCustomVariantType__Cast__Wrapper(__Instance : TCustomVariantType;
const p0 : IDispatch;
const p1 : IDispatch);
var
__p0 : ^TVarData;
__i0 : IDispatch;
__p1 : ^TVarData;
__i1 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
TCustomVariantType(__Instance).Cast(__p0^,__p1^);
end;

procedure __TCustomVariantType__CastTo__Wrapper(__Instance : TCustomVariantType;
const p0 : IDispatch;
const p1 : IDispatch;
const p2 : TVarType);
var
__p0 : ^TVarData;
__i0 : IDispatch;
__p1 : ^TVarData;
__i1 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
TCustomVariantType(__Instance).CastTo(__p0^,__p1^,p2);
end;

procedure __TCustomVariantType__CastToOle__Wrapper(__Instance : TCustomVariantType;
const p0 : IDispatch;
const p1 : IDispatch);
var
__p0 : ^TVarData;
__i0 : IDispatch;
__p1 : ^TVarData;
__i1 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
TCustomVariantType(__Instance).CastToOle(__p0^,__p1^);
end;

procedure __TCustomVariantType__Clear__Wrapper(__Instance : TCustomVariantType;
const p0 : IDispatch);
var
__p0 : ^TVarData;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TCustomVariantType(__Instance).Clear(__p0^);
end;

procedure __TCustomVariantType__Copy__Wrapper(__Instance : TCustomVariantType;
const p0 : IDispatch;
const p1 : IDispatch;
const p2 : Boolean);
var
__p0 : ^TVarData;
__i0 : IDispatch;
__p1 : ^TVarData;
__i1 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
TCustomVariantType(__Instance).Copy(__p0^,__p1^,p2);
end;

procedure __TCustomVariantType__BinaryOp__Wrapper(__Instance : TCustomVariantType;
const p0 : IDispatch;
const p1 : IDispatch;
const p2 : TVarOp);
var
__p0 : ^TVarData;
__i0 : IDispatch;
__p1 : ^TVarData;
__i1 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
TCustomVariantType(__Instance).BinaryOp(__p0^,__p1^,p2);
end;

procedure __TCustomVariantType__UnaryOp__Wrapper(__Instance : TCustomVariantType;
const p0 : IDispatch;
const p1 : TVarOp);
var
__p0 : ^TVarData;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TCustomVariantType(__Instance).UnaryOp(__p0^,p1);
end;

function __TCustomVariantType__CompareOp__Wrapper(__Instance : TCustomVariantType;
const p0 : IDispatch;
const p1 : IDispatch;
const p2 : TVarOp): Boolean;
var
__p0 : ^TVarData;
__i0 : IDispatch;
__p1 : ^TVarData;
__i1 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
result := TCustomVariantType(__Instance).CompareOp(__p0^,__p1^,p2);
end;

procedure __TCustomVariantType__Compare__Wrapper(__Instance : TCustomVariantType;
const p0 : IDispatch;
const p1 : IDispatch;
var p2 : TVarCompareResult);
var
__p0 : ^TVarData;
__i0 : IDispatch;
__p1 : ^TVarData;
__i1 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
TCustomVariantType(__Instance).Compare(__p0^,__p1^,p2);
end;

function __TInvokeableVariantType__DoFunction__Wrapper(__Instance : TInvokeableVariantType;
const p0 : IDispatch;
const p1 : IDispatch;
const p2 : string;
const p3 : TVarDataArray): Boolean;
var
__p0 : ^TVarData;
__i0 : IDispatch;
__p1 : ^TVarData;
__i1 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
result := TInvokeableVariantType(__Instance).DoFunction(__p0^,__p1^,p2,p3);
end;

function __TInvokeableVariantType__DoProcedure__Wrapper(__Instance : TInvokeableVariantType;
const p0 : IDispatch;
const p1 : string;
const p2 : TVarDataArray): Boolean;
var
__p0 : ^TVarData;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := TInvokeableVariantType(__Instance).DoProcedure(__p0^,p1,p2);
end;

function __TInvokeableVariantType__GetProperty__Wrapper(__Instance : TInvokeableVariantType;
const p0 : IDispatch;
const p1 : IDispatch;
const p2 : string): Boolean;
var
__p0 : ^TVarData;
__i0 : IDispatch;
__p1 : ^TVarData;
__i1 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
result := TInvokeableVariantType(__Instance).GetProperty(__p0^,__p1^,p2);
end;

function __TInvokeableVariantType__SetProperty__Wrapper(__Instance : TInvokeableVariantType;
const p0 : IDispatch;
const p1 : string;
const p2 : IDispatch): Boolean;
var
__p0 : ^TVarData;
__i0 : IDispatch;
__p2 : ^TVarData;
__i2 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
result := TInvokeableVariantType(__Instance).SetProperty(__p0^,p1,__p2^);
end;


type __TGUID__Wrapper__ = class(__TGUID__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TGUID__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTGUIDToVariant(var R : TGUID) : OleVariant;
var
__rw : __TGUID__Wrapper__;
begin
__rw := __TGUID__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTGUID(const V : OleVariant) : TGUID;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TGUID((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TVarData__Wrapper__ = class(__TVarData__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TVarData__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTVarDataToVariant(var R : TVarData) : OleVariant;
var
__rw : __TVarData__Wrapper__;
begin
__rw := __TVarData__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTVarData(const V : OleVariant) : TVarData;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TVarData((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTCustomVariantType__VarType(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomVariantType(Instance).VarType;
end;

procedure __RegisterProps;
begin
RegisterProperty(TCustomVariantType,'VarType',__DC__GetTCustomVariantType__VarType,nil);
end;

function __DC__GetVariants__EmptyParam(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := Variants.EmptyParam;
end;

procedure __DC__SetVariants__EmptyParam(Instance : TObject; Params : PVariantArgList);
begin
Variants.EmptyParam:=OleVariant(Params^[0]);
end;

var __RegisteredVars : TList;
procedure __RegisterVars;
begin
__RegisteredVars := TList.Create;
__RegisteredVars.Add(RegisterVar('EmptyParam',__DC__GetVariants__EmptyParam,__DC__SetVariants__EmptyParam));
end;

procedure __UnregisterVars;
begin
__RegisteredVars.Free;
end;

const __ConstNames0 : array[0..6] of string = (
'vrEqual'
,'vrLessThan'
,'vrGreaterThan'
,'vrNotEqual'
,'crLessThan'
,'crEqual'
,'crGreaterThan'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,vrEqual));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,vrLessThan));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,vrGreaterThan));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,vrNotEqual));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,crLessThan));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,crEqual));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,crGreaterThan));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..1] of TClass = (
TCustomVariantType,
TInvokeableVariantType
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..43] of string = (
'VarType'
,'VarAsType'
,'VarIsType'
,'VarIsByRef'
,'VarIsEmpty'
,'VarCheckEmpty'
,'VarIsNull'
,'VarIsClear'
,'VarIsCustom'
,'VarIsOrdinal'
,'VarIsFloat'
,'VarIsNumeric'
,'VarIsStr'
,'VarToStr'
,'VarToStrDef'
,'VarToWideStr'
,'VarToWideStrDef'
,'VarToDateTime'
,'VarFromDateTime'
,'VarInRange'
,'VarEnsureRange'
,'VarSameValue'
,'VarCompareValue'
,'VarIsEmptyParam'
,'VarSupports'
,'VarCopyNoInd'
,'VarIsArray'
,'VarArrayCreate'
,'VarArrayOf'
,'VarArrayRef'
,'VarTypeIsValidArrayType'
,'VarTypeIsValidElementType'
,'VarArrayDimCount'
,'VarArrayLowBound'
,'VarArrayHighBound'
,'VarArrayLock'
,'VarArrayUnlock'
,'VarArrayGet'
,'VarArrayPut'
,'DynArrayToVariant'
,'DynArrayFromVariant'
,'Unassigned'
,'Null'
,'FindCustomVariantType'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T0),[
TypeInfo(Variant),TypeInfo(TVarType)],Addr(VarType),cRegister);

RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T1),[
TypeInfo(Variant),
TypeInfo(TVarType),TypeInfo(Variant)],Addr(VarAsType),cRegister);

RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T2),[
TypeInfo(Variant),
TypeInfo(TVarType),TypeInfo(Boolean)],Addr(VarIsType),cRegister);

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T3),[
TypeInfo(Variant),TypeInfo(Boolean)],Addr(VarIsByRef),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T4),[
TypeInfo(Variant),TypeInfo(Boolean)],Addr(VarIsEmpty),cRegister);

RegisterProc(nil,MethodNames[5],mtProc,TypeInfo(_T5),[
TypeInfo(Variant)],Addr(VarCheckEmpty),cRegister);

RegisterProc(nil,MethodNames[6],mtProc,TypeInfo(_T6),[
TypeInfo(Variant),TypeInfo(Boolean)],Addr(VarIsNull),cRegister);

RegisterProc(nil,MethodNames[7],mtProc,TypeInfo(_T7),[
TypeInfo(Variant),TypeInfo(Boolean)],Addr(VarIsClear),cRegister);

RegisterProc(nil,MethodNames[8],mtProc,TypeInfo(_T8),[
TypeInfo(Variant),TypeInfo(Boolean)],Addr(VarIsCustom),cRegister);

RegisterProc(nil,MethodNames[9],mtProc,TypeInfo(_T9),[
TypeInfo(Variant),TypeInfo(Boolean)],Addr(VarIsOrdinal),cRegister);

RegisterProc(nil,MethodNames[10],mtProc,TypeInfo(_T10),[
TypeInfo(Variant),TypeInfo(Boolean)],Addr(VarIsFloat),cRegister);

RegisterProc(nil,MethodNames[11],mtProc,TypeInfo(_T11),[
TypeInfo(Variant),TypeInfo(Boolean)],Addr(VarIsNumeric),cRegister);

RegisterProc(nil,MethodNames[12],mtProc,TypeInfo(_T12),[
TypeInfo(Variant),TypeInfo(Boolean)],Addr(VarIsStr),cRegister);

RegisterProc(nil,MethodNames[13],mtProc,TypeInfo(_T13),[
TypeInfo(Variant),TypeInfo(string)],Addr(VarToStr),cRegister);

RegisterProc(nil,MethodNames[14],mtProc,TypeInfo(_T14),[
TypeInfo(Variant),
TypeInfo(string),TypeInfo(string)],Addr(VarToStrDef),cRegister);

RegisterProc(nil,MethodNames[15],mtProc,TypeInfo(_T15),[
TypeInfo(Variant),TypeInfo(WideString)],Addr(VarToWideStr),cRegister);

RegisterProc(nil,MethodNames[16],mtProc,TypeInfo(_T16),[
TypeInfo(Variant),
TypeInfo(WideString),TypeInfo(WideString)],Addr(VarToWideStrDef),cRegister);

RegisterProc(nil,MethodNames[17],mtProc,TypeInfo(_T17),[
TypeInfo(Variant),TypeInfo(TDateTime)],Addr(VarToDateTime),cRegister);

RegisterProc(nil,MethodNames[18],mtProc,TypeInfo(_T18),[
TypeInfo(TDateTime),TypeInfo(Variant)],Addr(VarFromDateTime),cRegister);

RegisterProc(nil,MethodNames[19],mtProc,TypeInfo(_T19),[
TypeInfo(Variant),
TypeInfo(Variant),
TypeInfo(Variant),TypeInfo(Boolean)],Addr(VarInRange),cRegister);

RegisterProc(nil,MethodNames[20],mtProc,TypeInfo(_T20),[
TypeInfo(Variant),
TypeInfo(Variant),
TypeInfo(Variant),TypeInfo(Variant)],Addr(VarEnsureRange),cRegister);

RegisterProc(nil,MethodNames[21],mtProc,TypeInfo(_T21),[
TypeInfo(Variant),
TypeInfo(Variant),TypeInfo(Boolean)],Addr(VarSameValue),cRegister);

RegisterProc(nil,MethodNames[22],mtProc,TypeInfo(_T22),[
TypeInfo(Variant),
TypeInfo(Variant),TypeInfo(TVariantRelationship)],Addr(VarCompareValue),cRegister);

RegisterProc(nil,MethodNames[23],mtProc,TypeInfo(_T23),[
TypeInfo(Variant),TypeInfo(Boolean)],Addr(VarIsEmptyParam),cRegister);

RegisterProc(nil,MethodNames[24],mtProc,TypeInfo(_T24),[
TypeInfo(Variant),
TypeInfo(IDispatch),
TypeInfoUntyped,TypeInfo(Boolean)],Addr(____VarSupports__Wrapper),cRegister);

RegisterProc(nil,MethodNames[25],mtProc,TypeInfo(_T25),[
TypeInfo(Variant),
TypeInfo(Variant)],Addr(VarCopyNoInd),cRegister);

RegisterProc(nil,MethodNames[26],mtProc,TypeInfo(_T26),[
TypeInfo(Variant),TypeInfo(Boolean)],Addr(VarIsArray),cRegister);

RegisterProc(nil,MethodNames[27],mtProc,TypeInfo(_T27),[
ArrayInfo(TypeInfo(Integer)),
TypeInfo(TVarType),TypeInfo(Variant)],Addr(VarArrayCreate),cRegister);

RegisterProc(nil,MethodNames[28],mtProc,TypeInfo(_T28),[
ArrayInfo(TypeInfo(Variant)),TypeInfo(Variant)],Addr(VarArrayOf),cRegister);

RegisterProc(nil,MethodNames[29],mtProc,TypeInfo(_T29),[
TypeInfo(Variant),TypeInfo(Variant)],Addr(VarArrayRef),cRegister);

RegisterProc(nil,MethodNames[30],mtProc,TypeInfo(_T30),[
TypeInfo(TVarType),TypeInfo(Boolean)],Addr(VarTypeIsValidArrayType),cRegister);

RegisterProc(nil,MethodNames[31],mtProc,TypeInfo(_T31),[
TypeInfo(TVarType),TypeInfo(Boolean)],Addr(VarTypeIsValidElementType),cRegister);

RegisterProc(nil,MethodNames[32],mtProc,TypeInfo(_T32),[
TypeInfo(Variant),TypeInfo(Integer)],Addr(VarArrayDimCount),cRegister);

RegisterProc(nil,MethodNames[33],mtProc,TypeInfo(_T33),[
TypeInfo(Variant),
TypeInfo(Integer),TypeInfo(Integer)],Addr(VarArrayLowBound),cRegister);

RegisterProc(nil,MethodNames[34],mtProc,TypeInfo(_T34),[
TypeInfo(Variant),
TypeInfo(Integer),TypeInfo(Integer)],Addr(VarArrayHighBound),cRegister);

RegisterProc(nil,MethodNames[35],mtProc,TypeInfo(_T35),[
TypeInfo(Variant),TypeInfoPointer],Addr(VarArrayLock),cRegister);

RegisterProc(nil,MethodNames[36],mtProc,TypeInfo(_T36),[
TypeInfo(Variant)],Addr(VarArrayUnlock),cRegister);

RegisterProc(nil,MethodNames[37],mtProc,TypeInfo(_T37),[
TypeInfo(Variant),
ArrayInfo(TypeInfo(Integer)),TypeInfo(Variant)],Addr(VarArrayGet),cRegister);

RegisterProc(nil,MethodNames[38],mtProc,TypeInfo(_T38),[
TypeInfo(Variant),
TypeInfo(Variant),
ArrayInfo(TypeInfo(Integer))],Addr(VarArrayPut),cRegister);

RegisterProc(nil,MethodNames[39],mtProc,TypeInfo(_T39),[
TypeInfo(Variant),
TypeInfoPointer,
TypeInfoPointer],Addr(DynArrayToVariant),cRegister);

RegisterProc(nil,MethodNames[40],mtProc,TypeInfo(_T40),[
TypeInfoPointer,
TypeInfo(Variant),
TypeInfoPointer],Addr(DynArrayFromVariant),cRegister);

RegisterProc(nil,MethodNames[41],mtProc,TypeInfo(_T41),[TypeInfo(Variant)],Addr(Unassigned),cRegister);

RegisterProc(nil,MethodNames[42],mtProc,TypeInfo(_T42),[TypeInfo(Variant)],Addr(Null),cRegister);

RegisterProc(nil,MethodNames[43],mtProc,TypeInfo(_T43),[
TypeInfo(TVarType),
TypeInfo(TCustomVariantType),TypeInfo(Boolean)],Addr(FindCustomVariantType),cRegister);

RegisterProc(TCustomVariantType,'QueryInterface',mtMethod,TypeInfo(_T44),[
TypeInfo(IDispatch),
TypeInfoUntyped,TypeInfo(HResult)], pointer(0),cRegister);

RegRegisterMethod(TCustomVariantType,'LeftPromotion',TypeInfo(_T45),[
TypeInfo(IDispatch),
TypeInfo(TVarOp),
TypeInfo(TVarType),TypeInfo(Boolean)], pointer(4));

RegRegisterMethod(TCustomVariantType,'RightPromotion',TypeInfo(_T46),[
TypeInfo(IDispatch),
TypeInfo(TVarOp),
TypeInfo(TVarType),TypeInfo(Boolean)], pointer(8));

RegRegisterMethod(TCustomVariantType,'OlePromotion',TypeInfo(_T47),[
TypeInfo(IDispatch),
TypeInfo(TVarType),TypeInfo(Boolean)], pointer(12));

RegisterProc(TCustomVariantType,'Create',mtConstructor,TypeInfo(_T49),NoParams,Addr(TCustomVariantType.Create),cRegister);

RegRegisterMethod(TCustomVariantType,'IsClear',TypeInfo(_T50),[
TypeInfo(IDispatch),TypeInfo(Boolean)], pointer(20));

RegRegisterMethod(TCustomVariantType,'Cast',TypeInfo(_T51),[
TypeInfo(IDispatch),
TypeInfo(IDispatch)], pointer(24));

RegRegisterMethod(TCustomVariantType,'CastTo',TypeInfo(_T52),[
TypeInfo(IDispatch),
TypeInfo(IDispatch),
TypeInfo(TVarType)], pointer(28));

RegRegisterMethod(TCustomVariantType,'CastToOle',TypeInfo(_T53),[
TypeInfo(IDispatch),
TypeInfo(IDispatch)], pointer(32));

RegRegisterMethod(TCustomVariantType,'Clear',TypeInfo(_T54),[
TypeInfo(IDispatch)], pointer(36));

RegRegisterMethod(TCustomVariantType,'Copy',TypeInfo(_T55),[
TypeInfo(IDispatch),
TypeInfo(IDispatch),
TypeInfo(Boolean)], pointer(40));

RegRegisterMethod(TCustomVariantType,'BinaryOp',TypeInfo(_T56),[
TypeInfo(IDispatch),
TypeInfo(IDispatch),
TypeInfo(TVarOp)], pointer(44));

RegRegisterMethod(TCustomVariantType,'UnaryOp',TypeInfo(_T57),[
TypeInfo(IDispatch),
TypeInfo(TVarOp)], pointer(48));

RegRegisterMethod(TCustomVariantType,'CompareOp',TypeInfo(_T58),[
TypeInfo(IDispatch),
TypeInfo(IDispatch),
TypeInfo(TVarOp),TypeInfo(Boolean)], pointer(52));

RegRegisterMethod(TCustomVariantType,'Compare',TypeInfo(_T59),[
TypeInfo(IDispatch),
TypeInfo(IDispatch),
TypeInfo(TVarCompareResult)], pointer(56));

RegRegisterMethod(TInvokeableVariantType,'DoFunction',TypeInfo(_T60),[
TypeInfo(IDispatch),
TypeInfo(IDispatch),
TypeInfo(string),
DynArrayInfo(TypeInfo(TVarDataArray)),TypeInfo(Boolean)], pointer(60));

RegRegisterMethod(TInvokeableVariantType,'DoProcedure',TypeInfo(_T61),[
TypeInfo(IDispatch),
TypeInfo(string),
DynArrayInfo(TypeInfo(TVarDataArray)),TypeInfo(Boolean)], pointer(64));

RegRegisterMethod(TInvokeableVariantType,'GetProperty',TypeInfo(_T62),[
TypeInfo(IDispatch),
TypeInfo(IDispatch),
TypeInfo(string),TypeInfo(Boolean)], pointer(68));

RegRegisterMethod(TInvokeableVariantType,'SetProperty',TypeInfo(_T63),[
TypeInfo(IDispatch),
TypeInfo(string),
TypeInfo(IDispatch),TypeInfo(Boolean)], pointer(72));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
__RegisterClasses;
__RegisterConsts0;
__RegisterProps;
__RegisterVars;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnRegisterVars;
__UnregisterProcs;
end.
