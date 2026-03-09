{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit SYSTEM_C3;
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
  dcdreamlib;
function ConvertTGUIDToVariant(var R : TGUID) : OleVariant;
function ConvertVariantToTGUID(const V : OleVariant) : TGUID;
function ConvertTHeapStatusToVariant(var R : THeapStatus) : OleVariant;
function ConvertVariantToTHeapStatus(const V : OleVariant) : THeapStatus;
function ConvertTInterfaceEntryToVariant(var R : TInterfaceEntry) : OleVariant;
function ConvertVariantToTInterfaceEntry(const V : OleVariant) : TInterfaceEntry;
function ConvertTInterfaceTableToVariant(var R : TInterfaceTable) : OleVariant;
function ConvertVariantToTInterfaceTable(const V : OleVariant) : TInterfaceTable;
function ConvertTLibModuleToVariant(var R : TLibModule) : OleVariant;
function ConvertVariantToTLibModule(const V : OleVariant) : TLibModule;
function ConvertTMemoryManagerToVariant(var R : TMemoryManager) : OleVariant;
function ConvertVariantToTMemoryManager(const V : OleVariant) : TMemoryManager;
function ConvertTModuleUnloadRecToVariant(var R : TModuleUnloadRec) : OleVariant;
function ConvertVariantToTModuleUnloadRec(const V : OleVariant) : TModuleUnloadRec;
function ConvertTResStringRecToVariant(var R : TResStringRec) : OleVariant;
function ConvertVariantToTResStringRec(const V : OleVariant) : TResStringRec;
function ConvertTVarArrayToVariant(var R : TVarArray) : OleVariant;
function ConvertVariantToTVarArray(const V : OleVariant) : TVarArray;
function ConvertTVarArrayBoundToVariant(var R : TVarArrayBound) : OleVariant;
function ConvertVariantToTVarArrayBound(const V : OleVariant) : TVarArrayBound;
function ConvertTVarDataToVariant(var R : TVarData) : OleVariant;
function ConvertVariantToTVarData(const V : OleVariant) : TVarData;
function ConvertTVarRecToVariant(var R : TVarRec) : OleVariant;
function ConvertVariantToTVarRec(const V : OleVariant) : TVarRec;
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
procedure setD1(const val : Integer);
function getD1 : Integer;
property D1 : Integer read getD1 write setD1;
procedure setD2(const val : Word);
function getD2 : Word;
property D2 : Word read getD2 write setD2;
procedure setD3(const val : Word);
function getD3 : Word;
property D3 : Word read getD3 write setD3;
end;
type __THeapStatus__Wrapper = class(TDCRecordWrapper)
private
fR : THeapStatus;
public
function GetRecordPtr : pointer; override;
published
procedure setTotalAddrSpace(const val : Cardinal);
function getTotalAddrSpace : Cardinal;
property TotalAddrSpace : Cardinal read getTotalAddrSpace write setTotalAddrSpace;
procedure setTotalUncommitted(const val : Cardinal);
function getTotalUncommitted : Cardinal;
property TotalUncommitted : Cardinal read getTotalUncommitted write setTotalUncommitted;
procedure setTotalCommitted(const val : Cardinal);
function getTotalCommitted : Cardinal;
property TotalCommitted : Cardinal read getTotalCommitted write setTotalCommitted;
procedure setTotalAllocated(const val : Cardinal);
function getTotalAllocated : Cardinal;
property TotalAllocated : Cardinal read getTotalAllocated write setTotalAllocated;
procedure setTotalFree(const val : Cardinal);
function getTotalFree : Cardinal;
property TotalFree : Cardinal read getTotalFree write setTotalFree;
procedure setFreeSmall(const val : Cardinal);
function getFreeSmall : Cardinal;
property FreeSmall : Cardinal read getFreeSmall write setFreeSmall;
procedure setFreeBig(const val : Cardinal);
function getFreeBig : Cardinal;
property FreeBig : Cardinal read getFreeBig write setFreeBig;
procedure setUnused(const val : Cardinal);
function getUnused : Cardinal;
property Unused : Cardinal read getUnused write setUnused;
procedure setOverhead(const val : Cardinal);
function getOverhead : Cardinal;
property Overhead : Cardinal read getOverhead write setOverhead;
procedure setHeapErrorCode(const val : Cardinal);
function getHeapErrorCode : Cardinal;
property HeapErrorCode : Cardinal read getHeapErrorCode write setHeapErrorCode;
end;
type __TInterfaceEntry__Wrapper = class(TDCRecordWrapper)
private
fR : TInterfaceEntry;
public
function GetRecordPtr : pointer; override;
published
procedure setIOffset(const val : Integer);
function getIOffset : Integer;
property IOffset : Integer read getIOffset write setIOffset;
end;
type __TInterfaceTable__Wrapper = class(TDCRecordWrapper)
private
fR : TInterfaceTable;
public
function GetRecordPtr : pointer; override;
published
procedure setEntryCount(const val : Integer);
function getEntryCount : Integer;
property EntryCount : Integer read getEntryCount write setEntryCount;
end;
type __TLibModule__Wrapper = class(TDCRecordWrapper)
private
fR : TLibModule;
public
function GetRecordPtr : pointer; override;
published
procedure setInstance(const val : Integer);
function getInstance : Integer;
property Instance : Integer read getInstance write setInstance;
procedure setCodeInstance(const val : Integer);
function getCodeInstance : Integer;
property CodeInstance : Integer read getCodeInstance write setCodeInstance;
procedure setDataInstance(const val : Integer);
function getDataInstance : Integer;
property DataInstance : Integer read getDataInstance write setDataInstance;
procedure setResInstance(const val : Integer);
function getResInstance : Integer;
property ResInstance : Integer read getResInstance write setResInstance;
procedure setReserved(const val : Integer);
function getReserved : Integer;
property Reserved : Integer read getReserved write setReserved;
end;
type __TMemoryManager__Wrapper = class(TDCRecordWrapper)
private
fR : TMemoryManager;
public
function GetRecordPtr : pointer; override;
published
end;
type __TModuleUnloadRec__Wrapper = class(TDCRecordWrapper)
private
fR : TModuleUnloadRec;
public
function GetRecordPtr : pointer; override;
published
end;
type __TResStringRec__Wrapper = class(TDCRecordWrapper)
private
fR : TResStringRec;
public
function GetRecordPtr : pointer; override;
published
procedure setIdentifier(const val : Integer);
function getIdentifier : Integer;
property Identifier : Integer read getIdentifier write setIdentifier;
end;
type __TVarArray__Wrapper = class(TDCRecordWrapper)
private
fR : TVarArray;
public
function GetRecordPtr : pointer; override;
published
procedure setDimCount(const val : Word);
function getDimCount : Word;
property DimCount : Word read getDimCount write setDimCount;
procedure setFlags(const val : Word);
function getFlags : Word;
property Flags : Word read getFlags write setFlags;
procedure setElementSize(const val : Integer);
function getElementSize : Integer;
property ElementSize : Integer read getElementSize write setElementSize;
procedure setLockCount(const val : Integer);
function getLockCount : Integer;
property LockCount : Integer read getLockCount write setLockCount;
end;
type __TVarArrayBound__Wrapper = class(TDCRecordWrapper)
private
fR : TVarArrayBound;
public
function GetRecordPtr : pointer; override;
published
procedure setElementCount(const val : Integer);
function getElementCount : Integer;
property ElementCount : Integer read getElementCount write setElementCount;
procedure setLowBound(const val : Integer);
function getLowBound : Integer;
property LowBound : Integer read getLowBound write setLowBound;
end;
type __TVarData__Wrapper = class(TDCRecordWrapper)
private
fR : TVarData;
public
function GetRecordPtr : pointer; override;
published
procedure setVType(const val : Word);
function getVType : Word;
property VType : Word read getVType write setVType;
procedure setReserved1(const val : Word);
function getReserved1 : Word;
property Reserved1 : Word read getReserved1 write setReserved1;
procedure setReserved2(const val : Word);
function getReserved2 : Word;
property Reserved2 : Word read getReserved2 write setReserved2;
procedure setReserved3(const val : Word);
function getReserved3 : Word;
property Reserved3 : Word read getReserved3 write setReserved3;
procedure setVSmallint(const val : SmallInt);
function getVSmallint : SmallInt;
property VSmallint : SmallInt read getVSmallint write setVSmallint;
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
procedure setVDate(const val : Double);
function getVDate : Double;
property VDate : Double read getVDate write setVDate;
procedure setVError(const val : Integer);
function getVError : Integer;
property VError : Integer read getVError write setVError;
procedure setVBoolean(const val : WordBool);
function getVBoolean : WordBool;
property VBoolean : WordBool read getVBoolean write setVBoolean;
procedure setVByte(const val : Byte);
function getVByte : Byte;
property VByte : Byte read getVByte write setVByte;
end;
type __TVarRec__Wrapper = class(TDCRecordWrapper)
private
fR : TVarRec;
public
function GetRecordPtr : pointer; override;
published
procedure setVInteger(const val : Integer);
function getVInteger : Integer;
property VInteger : Integer read getVInteger write setVInteger;
procedure setVType(const val : Byte);
function getVType : Byte;
property VType : Byte read getVType write setVType;
procedure setVBoolean(const val : Boolean);
function getVBoolean : Boolean;
property VBoolean : Boolean read getVBoolean write setVBoolean;
procedure setVChar(const val : Char);
function getVChar : Char;
property VChar : Char read getVChar write setVChar;
procedure setVObject(const val : TObject);
function getVObject : TObject;
property VObject : TObject read getVObject write setVObject;
procedure setVWideChar(const val : WideChar);
function getVWideChar : WideChar;
property VWideChar : WideChar read getVWideChar write setVWideChar;
end;
type
_T0 = procedure (const p0 : IDispatch) of object;

_T1 = _T0;

_T2 = function : Boolean of object;

_T3 = function (p0 : Integer): Pointer of object;

_T4 = function (p0 : Pointer): Integer of object;

_T5 = function (p0 : Pointer;
p1 : Integer): Pointer of object;

_T6 = function : IDispatch of object;

{_T7 = function (p0 : Pointer;
p1 : Integer;
p2 : TThreadFunc;
p3 : Pointer;
p4 : Integer;
var p5 : Integer): Integer of object;}

_T8 = procedure (p0 : Integer) of object;

_T9 = function : Integer of object;

_T10 = procedure (const p0;
var p1;
p2 : Integer) of object;

_T11 = _T9;

_T12 = function (p0 : Integer): string of object;

_T13 = procedure  of object;

_T14 = function (p0 : Char): Char of object;

_T15 = procedure (p0 : Word) of object;

{_T16 = function (p0 : PWideChar): string of object;}

{_T17 = function (p0 : PWideChar;
p1 : Integer): string of object;}

{_T18 = procedure (p0 : PWideChar;
var p1 : string) of object;}

{_T19 = procedure (p0 : PWideChar;
p1 : Integer;
var p2 : string) of object;}

{_T20 = function (const p0 : string;
p1 : PWideChar;
p2 : Integer): PWideChar of object;}

{_T21 = function (p0 : PWideChar): string of object;}

{_T22 = procedure (p0 : PWideChar;
var p1 : string) of object;}

_T23 = function (const p0 : string): PWideChar of object;

_T24 = procedure (var p0 : Variant;
const p1 : Variant) of object;

_T25 = function (const p0 : Variant): Integer of object;

_T26 = function (const p0 : Variant;
p1 : Integer): Variant of object;

_T27 = function (const p0 : Variant): Boolean of object;

_T28 = _T27;

_T29 = function (const p0 : Variant): string of object;

_T30 = function (p0 : TDateTime): Variant of object;

_T31 = function (const p0 : Variant): TDateTime of object;

_T32 = function (const p0 : Array of Integer;
p1 : Integer): Variant of object;

_T33 = function (const p0 : Array of Variant): Variant of object;

_T34 = _T25;

_T35 = function (const p0 : Variant;
p1 : Integer): Integer of object;

_T36 = _T35;

_T37 = function (const p0 : Variant): Pointer of object;

_T38 = procedure (const p0 : Variant) of object;

_T39 = _T27;

{_T40 = procedure (p0 : PLibModule) of object;}

{_T41 = procedure (p0 : PLibModule) of object;}

_T42 = function (p0 : Pointer): Longint of object;

{_T43 = function (p0 : TClass): Longint of object;}

_T44 = function (p0 : Longint): Longint of object;

{_T45 = function (p0 : PChar): Longint of object;}

{_T46 = procedure (p0 : TEnumModuleFunc;
p1 : Pointer) of object;}

{_T47 = procedure (p0 : TEnumModuleFunc;
p1 : Pointer) of object;}

{_T48 = procedure (p0 : TModuleUnloadProc) of object;}

{_T49 = procedure (p0 : TModuleUnloadProc) of object;}

{_T50 = function (p0 : PResStringRec): string of object;}

_T51 = procedure (var p0 : string) of object;

_T52 = _T13;

_T53 = _T13;

_T54 = function (p0 : Comp): Double of object;

_T55 = procedure (p0 : Double;
var p1 : Comp) of object;

_T56 = function (p0 : Comp): Currency of object;

_T57 = procedure (p0 : Currency;
var p1 : Comp) of object;

_T58 = _T3;

_T59 = _T4;

_T60 = _T5;

_T61 = _T13;

_T62 = _T13;

_T63 = function (p0 : Pointer): TObject of object;

_T64 = _T13;

{_T65 = function : TClass of object;}

_T66 = function : ShortString of object;

_T67 = function (const p0 : string): Boolean of object;

{_T68 = function : TClass of object;}

_T69 = function : Pointer of object;

_T70 = function : Longint of object;

{_T71 = function (p0 : TClass): Boolean of object;}

_T72 = function (const p0 : ShortString): Pointer of object;

_T73 = function (p0 : Pointer): ShortString of object;

_T74 = _T72;

_T75 = function (const p0 : IDispatch;
out p1): Boolean of object;

{_T77 = function : PInterfaceTable of object;}

_T78 = function (p0 : TObject;
p1 : Pointer): HRESULT of object;

_T79 = _T13;

_T80 = _T13;

_T81 = procedure (var p0) of object;

_T82 = _T81;

_T83 = function : TObject of object;

_T84 = _T13;

_T85 = _T13;

function __TGUID__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TGUID__Wrapper.setD1(const val : Integer);
begin
TGUID(GetRecordPtr^).D1 := val;
end;
function __TGUID__Wrapper.getD1 : Integer;
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
function __THeapStatus__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __THeapStatus__Wrapper.setTotalAddrSpace(const val : Cardinal);
begin
THeapStatus(GetRecordPtr^).TotalAddrSpace := val;
end;
function __THeapStatus__Wrapper.getTotalAddrSpace : Cardinal;
begin
result := THeapStatus(GetRecordPtr^).TotalAddrSpace;
end;
procedure __THeapStatus__Wrapper.setTotalUncommitted(const val : Cardinal);
begin
THeapStatus(GetRecordPtr^).TotalUncommitted := val;
end;
function __THeapStatus__Wrapper.getTotalUncommitted : Cardinal;
begin
result := THeapStatus(GetRecordPtr^).TotalUncommitted;
end;
procedure __THeapStatus__Wrapper.setTotalCommitted(const val : Cardinal);
begin
THeapStatus(GetRecordPtr^).TotalCommitted := val;
end;
function __THeapStatus__Wrapper.getTotalCommitted : Cardinal;
begin
result := THeapStatus(GetRecordPtr^).TotalCommitted;
end;
procedure __THeapStatus__Wrapper.setTotalAllocated(const val : Cardinal);
begin
THeapStatus(GetRecordPtr^).TotalAllocated := val;
end;
function __THeapStatus__Wrapper.getTotalAllocated : Cardinal;
begin
result := THeapStatus(GetRecordPtr^).TotalAllocated;
end;
procedure __THeapStatus__Wrapper.setTotalFree(const val : Cardinal);
begin
THeapStatus(GetRecordPtr^).TotalFree := val;
end;
function __THeapStatus__Wrapper.getTotalFree : Cardinal;
begin
result := THeapStatus(GetRecordPtr^).TotalFree;
end;
procedure __THeapStatus__Wrapper.setFreeSmall(const val : Cardinal);
begin
THeapStatus(GetRecordPtr^).FreeSmall := val;
end;
function __THeapStatus__Wrapper.getFreeSmall : Cardinal;
begin
result := THeapStatus(GetRecordPtr^).FreeSmall;
end;
procedure __THeapStatus__Wrapper.setFreeBig(const val : Cardinal);
begin
THeapStatus(GetRecordPtr^).FreeBig := val;
end;
function __THeapStatus__Wrapper.getFreeBig : Cardinal;
begin
result := THeapStatus(GetRecordPtr^).FreeBig;
end;
procedure __THeapStatus__Wrapper.setUnused(const val : Cardinal);
begin
THeapStatus(GetRecordPtr^).Unused := val;
end;
function __THeapStatus__Wrapper.getUnused : Cardinal;
begin
result := THeapStatus(GetRecordPtr^).Unused;
end;
procedure __THeapStatus__Wrapper.setOverhead(const val : Cardinal);
begin
THeapStatus(GetRecordPtr^).Overhead := val;
end;
function __THeapStatus__Wrapper.getOverhead : Cardinal;
begin
result := THeapStatus(GetRecordPtr^).Overhead;
end;
procedure __THeapStatus__Wrapper.setHeapErrorCode(const val : Cardinal);
begin
THeapStatus(GetRecordPtr^).HeapErrorCode := val;
end;
function __THeapStatus__Wrapper.getHeapErrorCode : Cardinal;
begin
result := THeapStatus(GetRecordPtr^).HeapErrorCode;
end;
function __TInterfaceEntry__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TInterfaceEntry__Wrapper.setIOffset(const val : Integer);
begin
TInterfaceEntry(GetRecordPtr^).IOffset := val;
end;
function __TInterfaceEntry__Wrapper.getIOffset : Integer;
begin
result := TInterfaceEntry(GetRecordPtr^).IOffset;
end;
function __TInterfaceTable__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TInterfaceTable__Wrapper.setEntryCount(const val : Integer);
begin
TInterfaceTable(GetRecordPtr^).EntryCount := val;
end;
function __TInterfaceTable__Wrapper.getEntryCount : Integer;
begin
result := TInterfaceTable(GetRecordPtr^).EntryCount;
end;
function __TLibModule__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TLibModule__Wrapper.setInstance(const val : Integer);
begin
TLibModule(GetRecordPtr^).Instance := val;
end;
function __TLibModule__Wrapper.getInstance : Integer;
begin
result := TLibModule(GetRecordPtr^).Instance;
end;
procedure __TLibModule__Wrapper.setCodeInstance(const val : Integer);
begin
TLibModule(GetRecordPtr^).CodeInstance := val;
end;
function __TLibModule__Wrapper.getCodeInstance : Integer;
begin
result := TLibModule(GetRecordPtr^).CodeInstance;
end;
procedure __TLibModule__Wrapper.setDataInstance(const val : Integer);
begin
TLibModule(GetRecordPtr^).DataInstance := val;
end;
function __TLibModule__Wrapper.getDataInstance : Integer;
begin
result := TLibModule(GetRecordPtr^).DataInstance;
end;
procedure __TLibModule__Wrapper.setResInstance(const val : Integer);
begin
TLibModule(GetRecordPtr^).ResInstance := val;
end;
function __TLibModule__Wrapper.getResInstance : Integer;
begin
result := TLibModule(GetRecordPtr^).ResInstance;
end;
procedure __TLibModule__Wrapper.setReserved(const val : Integer);
begin
TLibModule(GetRecordPtr^).Reserved := val;
end;
function __TLibModule__Wrapper.getReserved : Integer;
begin
result := TLibModule(GetRecordPtr^).Reserved;
end;
function __TMemoryManager__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
function __TModuleUnloadRec__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
function __TResStringRec__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TResStringRec__Wrapper.setIdentifier(const val : Integer);
begin
TResStringRec(GetRecordPtr^).Identifier := val;
end;
function __TResStringRec__Wrapper.getIdentifier : Integer;
begin
result := TResStringRec(GetRecordPtr^).Identifier;
end;
function __TVarArray__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TVarArray__Wrapper.setDimCount(const val : Word);
begin
TVarArray(GetRecordPtr^).DimCount := val;
end;
function __TVarArray__Wrapper.getDimCount : Word;
begin
result := TVarArray(GetRecordPtr^).DimCount;
end;
procedure __TVarArray__Wrapper.setFlags(const val : Word);
begin
TVarArray(GetRecordPtr^).Flags := val;
end;
function __TVarArray__Wrapper.getFlags : Word;
begin
result := TVarArray(GetRecordPtr^).Flags;
end;
procedure __TVarArray__Wrapper.setElementSize(const val : Integer);
begin
TVarArray(GetRecordPtr^).ElementSize := val;
end;
function __TVarArray__Wrapper.getElementSize : Integer;
begin
result := TVarArray(GetRecordPtr^).ElementSize;
end;
procedure __TVarArray__Wrapper.setLockCount(const val : Integer);
begin
TVarArray(GetRecordPtr^).LockCount := val;
end;
function __TVarArray__Wrapper.getLockCount : Integer;
begin
result := TVarArray(GetRecordPtr^).LockCount;
end;
function __TVarArrayBound__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TVarArrayBound__Wrapper.setElementCount(const val : Integer);
begin
TVarArrayBound(GetRecordPtr^).ElementCount := val;
end;
function __TVarArrayBound__Wrapper.getElementCount : Integer;
begin
result := TVarArrayBound(GetRecordPtr^).ElementCount;
end;
procedure __TVarArrayBound__Wrapper.setLowBound(const val : Integer);
begin
TVarArrayBound(GetRecordPtr^).LowBound := val;
end;
function __TVarArrayBound__Wrapper.getLowBound : Integer;
begin
result := TVarArrayBound(GetRecordPtr^).LowBound;
end;
function __TVarData__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TVarData__Wrapper.setVType(const val : Word);
begin
TVarData(GetRecordPtr^).VType := val;
end;
function __TVarData__Wrapper.getVType : Word;
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
procedure __TVarData__Wrapper.setVSmallint(const val : SmallInt);
begin
TVarData(GetRecordPtr^).VSmallint := val;
end;
function __TVarData__Wrapper.getVSmallint : SmallInt;
begin
result := TVarData(GetRecordPtr^).VSmallint;
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
procedure __TVarData__Wrapper.setVDate(const val : Double);
begin
TVarData(GetRecordPtr^).VDate := val;
end;
function __TVarData__Wrapper.getVDate : Double;
begin
result := TVarData(GetRecordPtr^).VDate;
end;
procedure __TVarData__Wrapper.setVError(const val : Integer);
begin
TVarData(GetRecordPtr^).VError := val;
end;
function __TVarData__Wrapper.getVError : Integer;
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
procedure __TVarData__Wrapper.setVByte(const val : Byte);
begin
TVarData(GetRecordPtr^).VByte := val;
end;
function __TVarData__Wrapper.getVByte : Byte;
begin
result := TVarData(GetRecordPtr^).VByte;
end;
function __TVarRec__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TVarRec__Wrapper.setVInteger(const val : Integer);
begin
TVarRec(GetRecordPtr^).VInteger := val;
end;
function __TVarRec__Wrapper.getVInteger : Integer;
begin
result := TVarRec(GetRecordPtr^).VInteger;
end;
procedure __TVarRec__Wrapper.setVType(const val : Byte);
begin
TVarRec(GetRecordPtr^).VType := val;
end;
function __TVarRec__Wrapper.getVType : Byte;
begin
result := TVarRec(GetRecordPtr^).VType;
end;
procedure __TVarRec__Wrapper.setVBoolean(const val : Boolean);
begin
TVarRec(GetRecordPtr^).VBoolean := val;
end;
function __TVarRec__Wrapper.getVBoolean : Boolean;
begin
result := TVarRec(GetRecordPtr^).VBoolean;
end;
procedure __TVarRec__Wrapper.setVChar(const val : Char);
begin
TVarRec(GetRecordPtr^).VChar := val;
end;
function __TVarRec__Wrapper.getVChar : Char;
begin
result := TVarRec(GetRecordPtr^).VChar;
end;
procedure __TVarRec__Wrapper.setVObject(const val : TObject);
begin
TVarRec(GetRecordPtr^).VObject := val;
end;
function __TVarRec__Wrapper.getVObject : TObject;
begin
result := TVarRec(GetRecordPtr^).VObject;
end;
procedure __TVarRec__Wrapper.setVWideChar(const val : WideChar);
begin
TVarRec(GetRecordPtr^).VWideChar := val;
end;
function __TVarRec__Wrapper.getVWideChar : WideChar;
begin
result := TVarRec(GetRecordPtr^).VWideChar;
end;
function _TGUID_ : IDispatch;
begin
  result := __TGUID__Wrapper.Create;
end;
function _THeapStatus_ : IDispatch;
begin
  result := __THeapStatus__Wrapper.Create;
end;
function _TInterfaceEntry_ : IDispatch;
begin
  result := __TInterfaceEntry__Wrapper.Create;
end;
function _TInterfaceTable_ : IDispatch;
begin
  result := __TInterfaceTable__Wrapper.Create;
end;
function _TLibModule_ : IDispatch;
begin
  result := __TLibModule__Wrapper.Create;
end;
function _TMemoryManager_ : IDispatch;
begin
  result := __TMemoryManager__Wrapper.Create;
end;
function _TModuleUnloadRec_ : IDispatch;
begin
  result := __TModuleUnloadRec__Wrapper.Create;
end;
function _TResStringRec_ : IDispatch;
begin
  result := __TResStringRec__Wrapper.Create;
end;
function _TVarArray_ : IDispatch;
begin
  result := __TVarArray__Wrapper.Create;
end;
function _TVarArrayBound_ : IDispatch;
begin
  result := __TVarArrayBound__Wrapper.Create;
end;
function _TVarData_ : IDispatch;
begin
  result := __TVarData__Wrapper.Create;
end;
function _TVarRec_ : IDispatch;
begin
  result := __TVarRec__Wrapper.Create;
end;
procedure ____GetMemoryManager__Wrapper(const p0 : IDispatch);
var
__p0 : ^TMemoryManager;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
GetMemoryManager(__p0^);
end;

procedure ____SetMemoryManager__Wrapper(const p0 : IDispatch);
var
__p0 : ^TMemoryManager;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
SetMemoryManager(__p0^);
end;

function ____GetHeapStatus__Wrapper: IDispatch;
var
__result : THeapStatus;
__wrapper : __THeapStatus__Wrapper;
begin
__result := GetHeapStatus;
__wrapper := __THeapStatus__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function __TObject__GetInterface__Wrapper(__Instance : TObject;
const p0 : IDispatch;
out p1): Boolean;
var
__p0 : ^TGUID;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := TObject(__Instance).GetInterface(__p0^,p1);
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

type __THeapStatus__Wrapper__ = class(__THeapStatus__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __THeapStatus__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTHeapStatusToVariant(var R : THeapStatus) : OleVariant;
var
__rw : __THeapStatus__Wrapper__;
begin
__rw := __THeapStatus__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTHeapStatus(const V : OleVariant) : THeapStatus;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := THeapStatus((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TInterfaceEntry__Wrapper__ = class(__TInterfaceEntry__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TInterfaceEntry__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTInterfaceEntryToVariant(var R : TInterfaceEntry) : OleVariant;
var
__rw : __TInterfaceEntry__Wrapper__;
begin
__rw := __TInterfaceEntry__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTInterfaceEntry(const V : OleVariant) : TInterfaceEntry;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TInterfaceEntry((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TInterfaceTable__Wrapper__ = class(__TInterfaceTable__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TInterfaceTable__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTInterfaceTableToVariant(var R : TInterfaceTable) : OleVariant;
var
__rw : __TInterfaceTable__Wrapper__;
begin
__rw := __TInterfaceTable__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTInterfaceTable(const V : OleVariant) : TInterfaceTable;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TInterfaceTable((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TLibModule__Wrapper__ = class(__TLibModule__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TLibModule__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTLibModuleToVariant(var R : TLibModule) : OleVariant;
var
__rw : __TLibModule__Wrapper__;
begin
__rw := __TLibModule__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTLibModule(const V : OleVariant) : TLibModule;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TLibModule((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TMemoryManager__Wrapper__ = class(__TMemoryManager__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TMemoryManager__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTMemoryManagerToVariant(var R : TMemoryManager) : OleVariant;
var
__rw : __TMemoryManager__Wrapper__;
begin
__rw := __TMemoryManager__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTMemoryManager(const V : OleVariant) : TMemoryManager;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TMemoryManager((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TModuleUnloadRec__Wrapper__ = class(__TModuleUnloadRec__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TModuleUnloadRec__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTModuleUnloadRecToVariant(var R : TModuleUnloadRec) : OleVariant;
var
__rw : __TModuleUnloadRec__Wrapper__;
begin
__rw := __TModuleUnloadRec__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTModuleUnloadRec(const V : OleVariant) : TModuleUnloadRec;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TModuleUnloadRec((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TResStringRec__Wrapper__ = class(__TResStringRec__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TResStringRec__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTResStringRecToVariant(var R : TResStringRec) : OleVariant;
var
__rw : __TResStringRec__Wrapper__;
begin
__rw := __TResStringRec__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTResStringRec(const V : OleVariant) : TResStringRec;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TResStringRec((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TVarArray__Wrapper__ = class(__TVarArray__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TVarArray__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTVarArrayToVariant(var R : TVarArray) : OleVariant;
var
__rw : __TVarArray__Wrapper__;
begin
__rw := __TVarArray__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTVarArray(const V : OleVariant) : TVarArray;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TVarArray((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TVarArrayBound__Wrapper__ = class(__TVarArrayBound__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TVarArrayBound__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTVarArrayBoundToVariant(var R : TVarArrayBound) : OleVariant;
var
__rw : __TVarArrayBound__Wrapper__;
begin
__rw := __TVarArrayBound__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTVarArrayBound(const V : OleVariant) : TVarArrayBound;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TVarArrayBound((_idisp as IDCRecordWrapper).GetRecordPtr^);
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

type __TVarRec__Wrapper__ = class(__TVarRec__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TVarRec__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTVarRecToVariant(var R : TVarRec) : OleVariant;
var
__rw : __TVarRec__Wrapper__;
begin
__rw := __TVarRec__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTVarRec(const V : OleVariant) : TVarRec;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TVarRec((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTInterfacedObject__RefCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TInterfacedObject(Instance).RefCount;
end;

procedure __RegisterProps;
begin
RegisterProperty(TInterfacedObject,'RefCount',__DC__GetTInterfacedObject__RefCount,nil);
end;

function __DC__GetSystem__ExceptProc(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(System.ExceptProc);
end;

procedure __DC__SetSystem__ExceptProc(Instance : TObject; Params : PVariantArgList);
begin
System.ExceptProc:=VarToPointer(OleVariant(Params^[0]));
end;

function __DC__GetSystem__ErrorProc(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(System.ErrorProc);
end;

procedure __DC__SetSystem__ErrorProc(Instance : TObject; Params : PVariantArgList);
begin
System.ErrorProc:=VarToPointer(OleVariant(Params^[0]));
end;

function __DC__GetSystem__ExceptClsProc(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(System.ExceptClsProc);
end;

procedure __DC__SetSystem__ExceptClsProc(Instance : TObject; Params : PVariantArgList);
begin
System.ExceptClsProc:=VarToPointer(OleVariant(Params^[0]));
end;

function __DC__GetSystem__ExceptObjProc(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(System.ExceptObjProc);
end;

procedure __DC__SetSystem__ExceptObjProc(Instance : TObject; Params : PVariantArgList);
begin
System.ExceptObjProc:=VarToPointer(OleVariant(Params^[0]));
end;

function __DC__GetSystem__SafeCallErrorProc(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(System.SafeCallErrorProc);
end;

procedure __DC__SetSystem__SafeCallErrorProc(Instance : TObject; Params : PVariantArgList);
begin
System.SafeCallErrorProc:=VarToPointer(OleVariant(Params^[0]));
end;

function __DC__GetSystem__AssertErrorProc(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(System.AssertErrorProc);
end;

procedure __DC__SetSystem__AssertErrorProc(Instance : TObject; Params : PVariantArgList);
begin
System.AssertErrorProc:=VarToPointer(OleVariant(Params^[0]));
end;

function __DC__GetSystem__AbstractErrorProc(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(System.AbstractErrorProc);
end;

procedure __DC__SetSystem__AbstractErrorProc(Instance : TObject; Params : PVariantArgList);
begin
System.AbstractErrorProc:=VarToPointer(OleVariant(Params^[0]));
end;

function __DC__GetSystem__HPrevInst(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := System.HPrevInst;
end;

procedure __DC__SetSystem__HPrevInst(Instance : TObject; Params : PVariantArgList);
begin
System.HPrevInst:=OleVariant(Params^[0]);
end;

function __DC__GetSystem__MainInstance(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := System.MainInstance;
end;

procedure __DC__SetSystem__MainInstance(Instance : TObject; Params : PVariantArgList);
begin
System.MainInstance:=OleVariant(Params^[0]);
end;

function __DC__GetSystem__IsLibrary(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := System.IsLibrary;
end;

procedure __DC__SetSystem__IsLibrary(Instance : TObject; Params : PVariantArgList);
begin
System.IsLibrary:=OleVariant(Params^[0]);
end;

function __DC__GetSystem__CmdShow(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := System.CmdShow;
end;

procedure __DC__SetSystem__CmdShow(Instance : TObject; Params : PVariantArgList);
begin
System.CmdShow:=OleVariant(Params^[0]);
end;

function __DC__GetSystem__CmdLine(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := String(System.CmdLine);
end;

procedure __DC__SetSystem__CmdLine(Instance : TObject; Params : PVariantArgList);
begin
System.CmdLine:=PChar(String(OleVariant(Params^[0])));
end;

function __DC__GetSystem__InitProc(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(System.InitProc);
end;

procedure __DC__SetSystem__InitProc(Instance : TObject; Params : PVariantArgList);
begin
System.InitProc:=VarToPointer(OleVariant(Params^[0]));
end;

function __DC__GetSystem__ExitCode(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := System.ExitCode;
end;

procedure __DC__SetSystem__ExitCode(Instance : TObject; Params : PVariantArgList);
begin
System.ExitCode:=OleVariant(Params^[0]);
end;

function __DC__GetSystem__ExitProc(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(System.ExitProc);
end;

procedure __DC__SetSystem__ExitProc(Instance : TObject; Params : PVariantArgList);
begin
System.ExitProc:=VarToPointer(OleVariant(Params^[0]));
end;

function __DC__GetSystem__ErrorAddr(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(System.ErrorAddr);
end;

procedure __DC__SetSystem__ErrorAddr(Instance : TObject; Params : PVariantArgList);
begin
System.ErrorAddr:=VarToPointer(OleVariant(Params^[0]));
end;

function __DC__GetSystem__RandSeed(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := System.RandSeed;
end;

procedure __DC__SetSystem__RandSeed(Instance : TObject; Params : PVariantArgList);
begin
System.RandSeed:=OleVariant(Params^[0]);
end;

function __DC__GetSystem__IsConsole(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := System.IsConsole;
end;

procedure __DC__SetSystem__IsConsole(Instance : TObject; Params : PVariantArgList);
begin
System.IsConsole:=OleVariant(Params^[0]);
end;

function __DC__GetSystem__IsMultiThread(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := System.IsMultiThread;
end;

procedure __DC__SetSystem__IsMultiThread(Instance : TObject; Params : PVariantArgList);
begin
System.IsMultiThread:=OleVariant(Params^[0]);
end;

function __DC__GetSystem__FileMode(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := System.FileMode;
end;

procedure __DC__SetSystem__FileMode(Instance : TObject; Params : PVariantArgList);
begin
System.FileMode:=OleVariant(Params^[0]);
end;

function __DC__GetSystem__Test8086(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := System.Test8086;
end;

procedure __DC__SetSystem__Test8086(Instance : TObject; Params : PVariantArgList);
begin
System.Test8086:=OleVariant(Params^[0]);
end;

function __DC__GetSystem__Test8087(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := System.Test8087;
end;

procedure __DC__SetSystem__Test8087(Instance : TObject; Params : PVariantArgList);
begin
System.Test8087:=OleVariant(Params^[0]);
end;

function __DC__GetSystem__TestFDIV(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := System.TestFDIV;
end;

procedure __DC__SetSystem__TestFDIV(Instance : TObject; Params : PVariantArgList);
begin
System.TestFDIV:=OleVariant(Params^[0]);
end;

function __DC__GetSystem__Default8087CW(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := System.Default8087CW;
end;

procedure __DC__SetSystem__Default8087CW(Instance : TObject; Params : PVariantArgList);
begin
System.Default8087CW:=OleVariant(Params^[0]);
end;

function __DC__GetSystem__HeapAllocFlags(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := System.HeapAllocFlags;
end;

procedure __DC__SetSystem__HeapAllocFlags(Instance : TObject; Params : PVariantArgList);
begin
System.HeapAllocFlags:=OleVariant(Params^[0]);
end;

function __DC__GetSystem__DebugHook(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := System.DebugHook;
end;

procedure __DC__SetSystem__DebugHook(Instance : TObject; Params : PVariantArgList);
begin
System.DebugHook:=OleVariant(Params^[0]);
end;

function __DC__GetSystem__Unassigned(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := System.Unassigned;
end;

procedure __DC__SetSystem__Unassigned(Instance : TObject; Params : PVariantArgList);
begin
end;

function __DC__GetSystem__Null(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := System.Null;
end;

procedure __DC__SetSystem__Null(Instance : TObject; Params : PVariantArgList);
begin
end;

function __DC__GetSystem__AllocMemCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := System.AllocMemCount;
end;

procedure __DC__SetSystem__AllocMemCount(Instance : TObject; Params : PVariantArgList);
begin
System.AllocMemCount:=OleVariant(Params^[0]);
end;

function __DC__GetSystem__AllocMemSize(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := System.AllocMemSize;
end;

procedure __DC__SetSystem__AllocMemSize(Instance : TObject; Params : PVariantArgList);
begin
System.AllocMemSize:=OleVariant(Params^[0]);
end;

function __DC__GetSystem__VarDispProc(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(System.VarDispProc);
end;

procedure __DC__SetSystem__VarDispProc(Instance : TObject; Params : PVariantArgList);
begin
System.VarDispProc:=VarToPointer(OleVariant(Params^[0]));
end;

function __DC__GetSystem__DispCallByIDProc(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := PointerToVariant(System.DispCallByIDProc);
end;

procedure __DC__SetSystem__DispCallByIDProc(Instance : TObject; Params : PVariantArgList);
begin
System.DispCallByIDProc:=VarToPointer(OleVariant(Params^[0]));
end;

var __RegisteredVars : TList;
procedure __RegisterVars;
begin
__RegisteredVars := TList.Create;
__RegisteredVars.Add(RegisterVar('ExceptProc',__DC__GetSystem__ExceptProc,__DC__SetSystem__ExceptProc));
__RegisteredVars.Add(RegisterVar('ErrorProc',__DC__GetSystem__ErrorProc,__DC__SetSystem__ErrorProc));
__RegisteredVars.Add(RegisterVar('ExceptClsProc',__DC__GetSystem__ExceptClsProc,__DC__SetSystem__ExceptClsProc));
__RegisteredVars.Add(RegisterVar('ExceptObjProc',__DC__GetSystem__ExceptObjProc,__DC__SetSystem__ExceptObjProc));
__RegisteredVars.Add(RegisterVar('SafeCallErrorProc',__DC__GetSystem__SafeCallErrorProc,__DC__SetSystem__SafeCallErrorProc));
__RegisteredVars.Add(RegisterVar('AssertErrorProc',__DC__GetSystem__AssertErrorProc,__DC__SetSystem__AssertErrorProc));
__RegisteredVars.Add(RegisterVar('AbstractErrorProc',__DC__GetSystem__AbstractErrorProc,__DC__SetSystem__AbstractErrorProc));
__RegisteredVars.Add(RegisterVar('HPrevInst',__DC__GetSystem__HPrevInst,__DC__SetSystem__HPrevInst));
__RegisteredVars.Add(RegisterVar('MainInstance',__DC__GetSystem__MainInstance,__DC__SetSystem__MainInstance));
__RegisteredVars.Add(RegisterVar('IsLibrary',__DC__GetSystem__IsLibrary,__DC__SetSystem__IsLibrary));
__RegisteredVars.Add(RegisterVar('CmdShow',__DC__GetSystem__CmdShow,__DC__SetSystem__CmdShow));
__RegisteredVars.Add(RegisterVar('CmdLine',__DC__GetSystem__CmdLine,__DC__SetSystem__CmdLine));
__RegisteredVars.Add(RegisterVar('InitProc',__DC__GetSystem__InitProc,__DC__SetSystem__InitProc));
__RegisteredVars.Add(RegisterVar('ExitCode',__DC__GetSystem__ExitCode,__DC__SetSystem__ExitCode));
__RegisteredVars.Add(RegisterVar('ExitProc',__DC__GetSystem__ExitProc,__DC__SetSystem__ExitProc));
__RegisteredVars.Add(RegisterVar('ErrorAddr',__DC__GetSystem__ErrorAddr,__DC__SetSystem__ErrorAddr));
__RegisteredVars.Add(RegisterVar('RandSeed',__DC__GetSystem__RandSeed,__DC__SetSystem__RandSeed));
__RegisteredVars.Add(RegisterVar('IsConsole',__DC__GetSystem__IsConsole,__DC__SetSystem__IsConsole));
__RegisteredVars.Add(RegisterVar('IsMultiThread',__DC__GetSystem__IsMultiThread,__DC__SetSystem__IsMultiThread));
__RegisteredVars.Add(RegisterVar('FileMode',__DC__GetSystem__FileMode,__DC__SetSystem__FileMode));
__RegisteredVars.Add(RegisterVar('Test8086',__DC__GetSystem__Test8086,__DC__SetSystem__Test8086));
__RegisteredVars.Add(RegisterVar('Test8087',__DC__GetSystem__Test8087,__DC__SetSystem__Test8087));
__RegisteredVars.Add(RegisterVar('TestFDIV',__DC__GetSystem__TestFDIV,__DC__SetSystem__TestFDIV));
__RegisteredVars.Add(RegisterVar('Default8087CW',__DC__GetSystem__Default8087CW,__DC__SetSystem__Default8087CW));
__RegisteredVars.Add(RegisterVar('HeapAllocFlags',__DC__GetSystem__HeapAllocFlags,__DC__SetSystem__HeapAllocFlags));
__RegisteredVars.Add(RegisterVar('DebugHook',__DC__GetSystem__DebugHook,__DC__SetSystem__DebugHook));
__RegisteredVars.Add(RegisterVar('Unassigned',__DC__GetSystem__Unassigned,__DC__SetSystem__Unassigned));
__RegisteredVars.Add(RegisterVar('Null',__DC__GetSystem__Null,__DC__SetSystem__Null));
__RegisteredVars.Add(RegisterVar('AllocMemCount',__DC__GetSystem__AllocMemCount,__DC__SetSystem__AllocMemCount));
__RegisteredVars.Add(RegisterVar('AllocMemSize',__DC__GetSystem__AllocMemSize,__DC__SetSystem__AllocMemSize));
__RegisteredVars.Add(RegisterVar('VarDispProc',__DC__GetSystem__VarDispProc,__DC__SetSystem__VarDispProc));
__RegisteredVars.Add(RegisterVar('DispCallByIDProc',__DC__GetSystem__DispCallByIDProc,__DC__SetSystem__DispCallByIDProc));
end;

procedure __UnregisterVars;
begin
__RegisteredVars.Free;
end;

const __ConstNames0 : array[0..57] of string = (
'varEmpty'
,'varNull'
,'varSmallint'
,'varInteger'
,'varSingle'
,'varDouble'
,'varCurrency'
,'varDate'
,'varOleStr'
,'varDispatch'
,'varError'
,'varBoolean'
,'varVariant'
,'varUnknown'
,'varByte'
,'varString'
,'varTypeMask'
,'varArray'
,'varByRef'
,'vtInteger'
,'vtBoolean'
,'vtChar'
,'vtExtended'
,'vtString'
,'vtPointer'
,'vtPChar'
,'vtObject'
,'vtClass'
,'vtWideChar'
,'vtPWideChar'
,'vtAnsiString'
,'vtCurrency'
,'vtVariant'
,'vtInterface'
,'vtWideString'
,'vmtSelfPtr'
,'vmtIntfTable'
,'vmtAutoTable'
,'vmtInitTable'
,'vmtTypeInfo'
,'vmtFieldTable'
,'vmtMethodTable'
,'vmtDynamicTable'
,'vmtClassName'
,'vmtInstanceSize'
,'vmtParent'
,'vmtSafeCallException'
,'vmtAfterConstruction'
,'vmtBeforeDestruction'
,'vmtDispatch'
,'vmtDefaultHandler'
,'vmtNewInstance'
,'vmtFreeInstance'
,'vmtDestroy'
,'vmtQueryInterface'
,'vmtAddRef'
,'vmtRelease'
,'vmtCreateObject'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,varEmpty));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,varNull));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,varSmallint));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,varInteger));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,varSingle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,varDouble));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,varCurrency));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,varDate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,varOleStr));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,varDispatch));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,varError));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,varBoolean));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,varVariant));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,varUnknown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,varByte));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,varString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,varTypeMask));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,varArray));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,varByRef));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,vtInteger));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,vtBoolean));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,vtChar));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,vtExtended));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,vtString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,vtPointer));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,vtPChar));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,vtObject));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,vtClass));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,vtWideChar));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,vtPWideChar));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,vtAnsiString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,vtCurrency));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,vtVariant));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,vtInterface));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,vtWideString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,vmtSelfPtr));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,vmtIntfTable));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,vmtAutoTable));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,vmtInitTable));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,vmtTypeInfo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,vmtFieldTable));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,vmtMethodTable));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,vmtDynamicTable));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,vmtClassName));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,vmtInstanceSize));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,vmtParent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,vmtSafeCallException));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,vmtAfterConstruction));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[48] ,vmtBeforeDestruction));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[49] ,vmtDispatch));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[50] ,vmtDefaultHandler));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[51] ,vmtNewInstance));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[52] ,vmtFreeInstance));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[53] ,vmtDestroy));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[54] ,vmtQueryInterface));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[55] ,vmtAddRef));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[56] ,vmtRelease));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[57] ,vmtCreateObject));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..1] of TClass = (
TInterfacedObject,
TObject
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..55] of string = (
'TGUID'
,'THeapStatus'
,'TInterfaceEntry'
,'TInterfaceTable'
,'TLibModule'
,'TMemoryManager'
,'TModuleUnloadRec'
,'TResStringRec'
,'TVarArray'
,'TVarArrayBound'
,'TVarData'
,'TVarRec'
,'GetMemoryManager'
,'SetMemoryManager'
,'IsMemoryManagerSet'
,'SysGetMem'
,'SysFreeMem'
,'SysReallocMem'
,'GetHeapStatus'
,'EndThread'
,'IOResult'
,'Move'
,'ParamCount'
,'ParamStr'
,'Randomize'
,'UpCase'
,'Set8087CW'
,'StringToOleStr'
,'VarCopyNoInd'
,'VarType'
,'VarAsType'
,'VarIsEmpty'
,'VarIsNull'
,'VarToStr'
,'VarFromDateTime'
,'VarToDateTime'
,'VarArrayCreate'
,'VarArrayOf'
,'VarArrayDimCount'
,'VarArrayLowBound'
,'VarArrayHighBound'
,'VarArrayLock'
,'VarArrayUnlock'
,'VarIsArray'
,'FindHInstance'
,'FindResourceHInstance'
,'UniqueString'
,'FPower10'
,'TextStart'
,'CompToDouble'
,'DoubleToComp'
,'CompToCurrency'
,'CurrencyToComp'
,'GetMemory'
,'FreeMemory'
,'ReallocMemory'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TGUID_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(_THeapStatus_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[2],Addr(_TInterfaceEntry_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[3],Addr(_TInterfaceTable_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[4],Addr(_TLibModule_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[5],Addr(_TMemoryManager_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[6],Addr(_TModuleUnloadRec_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[7],Addr(_TResStringRec_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[8],Addr(_TVarArray_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[9],Addr(_TVarArrayBound_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[10],Addr(_TVarData_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[11],Addr(_TVarRec_)));
RegisterProc(nil,MethodNames[12],mtProc,TypeInfo(_T0),[
TypeInfo(IDispatch)],Addr(____GetMemoryManager__Wrapper),cRegister);

RegisterProc(nil,MethodNames[13],mtProc,TypeInfo(_T1),[
TypeInfo(IDispatch)],Addr(____SetMemoryManager__Wrapper),cRegister);

RegisterProc(nil,MethodNames[14],mtProc,TypeInfo(_T2),[TypeInfo(Boolean)],Addr(IsMemoryManagerSet),cRegister);

RegisterProc(nil,MethodNames[15],mtProc,TypeInfo(_T3),[
TypeInfo(Integer),TypeInfoPointer],Addr(SysGetMem),cRegister);

RegisterProc(nil,MethodNames[16],mtProc,TypeInfo(_T4),[
TypeInfoPointer,TypeInfo(Integer)],Addr(SysFreeMem),cRegister);

RegisterProc(nil,MethodNames[17],mtProc,TypeInfo(_T5),[
TypeInfoPointer,
TypeInfo(Integer),TypeInfoPointer],Addr(SysReallocMem),cRegister);

RegisterProc(nil,MethodNames[18],mtProc,TypeInfo(_T6),[TypeInfo(IDispatch)],Addr(____GetHeapStatus__Wrapper),cRegister);

RegisterProc(nil,MethodNames[19],mtProc,TypeInfo(_T8),[
TypeInfo(Integer)],Addr(EndThread),cRegister);

RegisterProc(nil,MethodNames[20],mtProc,TypeInfo(_T9),[TypeInfo(Integer)],Addr(IOResult),cRegister);

RegisterProc(nil,MethodNames[21],mtProc,TypeInfo(_T10),[
TypeInfoUntyped,
TypeInfoUntyped,
TypeInfo(Integer)],Addr(Move),cRegister);

RegisterProc(nil,MethodNames[22],mtProc,TypeInfo(_T11),[TypeInfo(Integer)],Addr(ParamCount),cRegister);

RegisterProc(nil,MethodNames[23],mtProc,TypeInfo(_T12),[
TypeInfo(Integer),TypeInfo(string)],Addr(ParamStr),cRegister);

RegisterProc(nil,MethodNames[24],mtProc,TypeInfo(_T13),NoParams,Addr(Randomize),cRegister);

RegisterProc(nil,MethodNames[25],mtProc,TypeInfo(_T14),[
TypeInfo(Char),TypeInfo(Char)],Addr(UpCase),cRegister);

RegisterProc(nil,MethodNames[26],mtProc,TypeInfo(_T15),[
TypeInfo(Word)],Addr(Set8087CW),cRegister);

RegisterProc(nil,MethodNames[27],mtProc,TypeInfo(_T23),[
TypeInfo(string),TypeInfoPWideChar],Addr(StringToOleStr),cRegister);

RegisterProc(nil,MethodNames[28],mtProc,TypeInfo(_T24),[
TypeInfo(Variant),
TypeInfo(Variant)],Addr(VarCopyNoInd),cRegister);

RegisterProc(nil,MethodNames[29],mtProc,TypeInfo(_T25),[
TypeInfo(Variant),TypeInfo(Integer)],Addr(VarType),cRegister);

RegisterProc(nil,MethodNames[30],mtProc,TypeInfo(_T26),[
TypeInfo(Variant),
TypeInfo(Integer),TypeInfo(Variant)],Addr(VarAsType),cRegister);

RegisterProc(nil,MethodNames[31],mtProc,TypeInfo(_T27),[
TypeInfo(Variant),TypeInfo(Boolean)],Addr(VarIsEmpty),cRegister);

RegisterProc(nil,MethodNames[32],mtProc,TypeInfo(_T28),[
TypeInfo(Variant),TypeInfo(Boolean)],Addr(VarIsNull),cRegister);

RegisterProc(nil,MethodNames[33],mtProc,TypeInfo(_T29),[
TypeInfo(Variant),TypeInfo(string)],Addr(VarToStr),cRegister);

RegisterProc(nil,MethodNames[34],mtProc,TypeInfo(_T30),[
TypeInfo(TDateTime),TypeInfo(Variant)],Addr(VarFromDateTime),cRegister);

RegisterProc(nil,MethodNames[35],mtProc,TypeInfo(_T31),[
TypeInfo(Variant),TypeInfo(TDateTime)],Addr(VarToDateTime),cRegister);

RegisterProc(nil,MethodNames[36],mtProc,TypeInfo(_T32),[
ArrayInfo(TypeInfo(Integer)),
TypeInfo(Integer),TypeInfo(Variant)],Addr(VarArrayCreate),cRegister);

RegisterProc(nil,MethodNames[37],mtProc,TypeInfo(_T33),[
ArrayInfo(TypeInfo(Variant)),TypeInfo(Variant)],Addr(VarArrayOf),cRegister);

RegisterProc(nil,MethodNames[38],mtProc,TypeInfo(_T34),[
TypeInfo(Variant),TypeInfo(Integer)],Addr(VarArrayDimCount),cRegister);

RegisterProc(nil,MethodNames[39],mtProc,TypeInfo(_T35),[
TypeInfo(Variant),
TypeInfo(Integer),TypeInfo(Integer)],Addr(VarArrayLowBound),cRegister);

RegisterProc(nil,MethodNames[40],mtProc,TypeInfo(_T36),[
TypeInfo(Variant),
TypeInfo(Integer),TypeInfo(Integer)],Addr(VarArrayHighBound),cRegister);

RegisterProc(nil,MethodNames[41],mtProc,TypeInfo(_T37),[
TypeInfo(Variant),TypeInfoPointer],Addr(VarArrayLock),cRegister);

RegisterProc(nil,MethodNames[42],mtProc,TypeInfo(_T38),[
TypeInfo(Variant)],Addr(VarArrayUnlock),cRegister);

RegisterProc(nil,MethodNames[43],mtProc,TypeInfo(_T39),[
TypeInfo(Variant),TypeInfo(Boolean)],Addr(VarIsArray),cRegister);

RegisterProc(nil,MethodNames[44],mtProc,TypeInfo(_T42),[
TypeInfoPointer,TypeInfo(Longint)],Addr(FindHInstance),cRegister);

RegisterProc(nil,MethodNames[45],mtProc,TypeInfo(_T44),[
TypeInfo(Longint),TypeInfo(Longint)],Addr(FindResourceHInstance),cRegister);

RegisterProc(nil,MethodNames[46],mtProc,TypeInfo(_T51),[
TypeInfo(string)],Addr(UniqueString),cRegister);

RegisterProc(nil,MethodNames[47],mtProc,TypeInfo(_T52),NoParams,Addr(FPower10),cRegister);

RegisterProc(nil,MethodNames[48],mtProc,TypeInfo(_T53),NoParams,Addr(TextStart),cRegister);

RegisterProc(nil,MethodNames[49],mtProc,TypeInfo(_T54),[
TypeInfo(Comp),TypeInfo(Double)],Addr(CompToDouble),cCdecl);

RegisterProc(nil,MethodNames[50],mtProc,TypeInfo(_T55),[
TypeInfo(Double),
TypeInfo(Comp)],Addr(DoubleToComp),cCdecl);

RegisterProc(nil,MethodNames[51],mtProc,TypeInfo(_T56),[
TypeInfo(Comp),TypeInfo(Currency)],Addr(CompToCurrency),cCdecl);

RegisterProc(nil,MethodNames[52],mtProc,TypeInfo(_T57),[
TypeInfo(Currency),
TypeInfo(Comp)],Addr(CurrencyToComp),cCdecl);

RegisterProc(nil,MethodNames[53],mtProc,TypeInfo(_T58),[
TypeInfo(Integer),TypeInfoPointer],Addr(GetMemory),cCdecl);

RegisterProc(nil,MethodNames[54],mtProc,TypeInfo(_T59),[
TypeInfoPointer,TypeInfo(Integer)],Addr(FreeMemory),cCdecl);

RegisterProc(nil,MethodNames[55],mtProc,TypeInfo(_T60),[
TypeInfoPointer,
TypeInfo(Integer),TypeInfoPointer],Addr(ReallocMemory),cCdecl);

RegisterProc(TObject,'Create',mtConstructor,TypeInfo(_T61),NoParams,Addr(TObject.Create),cRegister);

RegRegisterMethod(TObject,'Free',TypeInfo(_T62),NoParams,Addr(TObject.Free));

RegisterProc(TObject,'InitInstance',mtClassMethod,TypeInfo(_T63),[
TypeInfoPointer,TypeInfo(TObject)],Addr(TObject.InitInstance),cRegister);

RegRegisterMethod(TObject,'CleanupInstance',TypeInfo(_T64),NoParams,Addr(TObject.CleanupInstance));

RegisterProc(TObject,'ClassName',mtClassMethod,TypeInfo(_T66),[TypeInfo(ShortString)],Addr(TObject.ClassName),cRegister);

RegisterProc(TObject,'ClassNameIs',mtClassMethod,TypeInfo(_T67),[
TypeInfo(string),TypeInfo(Boolean)],Addr(TObject.ClassNameIs),cRegister);

RegisterProc(TObject,'ClassInfo',mtClassMethod,TypeInfo(_T69),[TypeInfoPointer],Addr(TObject.ClassInfo),cRegister);

RegisterProc(TObject,'InstanceSize',mtClassMethod,TypeInfo(_T70),[TypeInfo(Longint)],Addr(TObject.InstanceSize),cRegister);

RegisterProc(TObject,'MethodAddress',mtClassMethod,TypeInfo(_T72),[
TypeInfo(ShortString),TypeInfoPointer],Addr(TObject.MethodAddress),cRegister);

RegisterProc(TObject,'MethodName',mtClassMethod,TypeInfo(_T73),[
TypeInfoPointer,TypeInfo(ShortString)],Addr(TObject.MethodName),cRegister);

RegRegisterMethod(TObject,'FieldAddress',TypeInfo(_T74),[
TypeInfo(ShortString),TypeInfoPointer],Addr(TObject.FieldAddress));

RegRegisterMethod(TObject,'GetInterface',TypeInfo(_T75),[
TypeInfo(IDispatch),
TypeInfoUntyped,TypeInfo(Boolean)],Addr(__TObject__GetInterface__Wrapper));

RegRegisterMethod(TObject,'SafeCallException',TypeInfo(_T78),[
TypeInfo(TObject),
TypeInfoPointer,TypeInfo(HRESULT)], pointer(-28));

RegRegisterMethod(TObject,'AfterConstruction',TypeInfo(_T79),NoParams, pointer(-24));

RegRegisterMethod(TObject,'BeforeDestruction',TypeInfo(_T80),NoParams, pointer(-20));

RegRegisterMethod(TObject,'Dispatch',TypeInfo(_T81),[
TypeInfoUntyped], pointer(-16));

RegRegisterMethod(TObject,'DefaultHandler',TypeInfo(_T82),[
TypeInfoUntyped], pointer(-12));

RegisterProc(TObject,'NewInstance',mtClassMethod,TypeInfo(_T83),[TypeInfo(TObject)], pointer(-8),cRegister);

RegRegisterMethod(TObject,'FreeInstance',TypeInfo(_T84),NoParams, pointer(-4));

RegisterProc(TObject,'Destroy',mtDestructor,TypeInfo(_T85),NoParams, pointer(0),cRegister);

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'BeginThread',mtProc,TypeInfo(_T7),[
TypeInfoPointer,
TypeInfo(Integer),
TypeInfo(TThreadFunc),
TypeInfoPointer,
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Integer)],Addr(BeginThread),cRegister)}

{RegisterProc(nil,'WideCharToString',mtProc,TypeInfo(_T16),[
TypeInfoPWideChar,TypeInfo(string)],Addr(WideCharToString),cRegister)}

{RegisterProc(nil,'WideCharLenToString',mtProc,TypeInfo(_T17),[
TypeInfoPWideChar,
TypeInfo(Integer),TypeInfo(string)],Addr(WideCharLenToString),cRegister)}

{RegisterProc(nil,'WideCharToStrVar',mtProc,TypeInfo(_T18),[
TypeInfoPWideChar,
TypeInfo(string)],Addr(WideCharToStrVar),cRegister)}

{RegisterProc(nil,'WideCharLenToStrVar',mtProc,TypeInfo(_T19),[
TypeInfoPWideChar,
TypeInfo(Integer),
TypeInfo(string)],Addr(WideCharLenToStrVar),cRegister)}

{RegisterProc(nil,'StringToWideChar',mtProc,TypeInfo(_T20),[
TypeInfo(string),
TypeInfoPWideChar,
TypeInfo(Integer),TypeInfoPWideChar],Addr(StringToWideChar),cRegister)}

{RegisterProc(nil,'OleStrToString',mtProc,TypeInfo(_T21),[
TypeInfoPWideChar,TypeInfo(string)],Addr(OleStrToString),cRegister)}

{RegisterProc(nil,'OleStrToStrVar',mtProc,TypeInfo(_T22),[
TypeInfoPWideChar,
TypeInfo(string)],Addr(OleStrToStrVar),cRegister)}

{RegisterProc(nil,'RegisterModule',mtProc,TypeInfo(_T40),[
TypeInfoPointer],Addr(RegisterModule),cRegister)}

{RegisterProc(nil,'UnregisterModule',mtProc,TypeInfo(_T41),[
TypeInfoPointer],Addr(UnregisterModule),cRegister)}

{RegisterProc(nil,'FindClassHInstance',mtProc,TypeInfo(_T43),[
TypeInfo(TClass),TypeInfo(Longint)],Addr(FindClassHInstance),cRegister)}

{RegisterProc(nil,'LoadResourceModule',mtProc,TypeInfo(_T45),[
TypeInfoPChar,TypeInfo(Longint)],Addr(LoadResourceModule),cRegister)}

{RegisterProc(nil,'EnumModules',mtProc,TypeInfo(_T46),[
TypeInfo(TEnumModuleFunc),
TypeInfoPointer],Addr(EnumModules),cRegister)}

{RegisterProc(nil,'EnumResourceModules',mtProc,TypeInfo(_T47),[
TypeInfo(TEnumModuleFunc),
TypeInfoPointer],Addr(EnumResourceModules),cRegister)}

{RegisterProc(nil,'AddModuleUnloadProc',mtProc,TypeInfo(_T48),[
TypeInfo(TModuleUnloadProc)],Addr(AddModuleUnloadProc),cRegister)}

{RegisterProc(nil,'RemoveModuleUnloadProc',mtProc,TypeInfo(_T49),[
TypeInfo(TModuleUnloadProc)],Addr(RemoveModuleUnloadProc),cRegister)}

{RegisterProc(nil,'LoadResString',mtProc,TypeInfo(_T50),[
TypeInfoPointer,TypeInfo(string)],Addr(LoadResString),cRegister)}

{RegRegisterMethod(TObject,'ClassType',TypeInfo(_T65),[TypeInfo(TClass)],Addr(TObject.ClassType))}

{RegisterProc(TObject,'ClassParent',mtClassMethod,TypeInfo(_T68),[TypeInfo(TClass)],Addr(TObject.ClassParent),cRegister)}

{RegisterProc(TObject,'InheritsFrom',mtClassMethod,TypeInfo(_T71),[
TypeInfo(TClass),TypeInfo(Boolean)],Addr(TObject.InheritsFrom),cRegister)}

{RegisterProc(TObject,'GetInterfaceTable',mtClassMethod,TypeInfo(_T77),[TypeInfoPointer],Addr(TObject.GetInterfaceTable),cRegister)}

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
