{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit OLECTRLS_C4;
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
  Messages,
  ActiveX,
  SysUtils,
  Classes,
  Controls,
  Forms,
  Menus,
  Graphics,
  ComObj,
  AxCtrls,
  OleCtrls;
function ConvertTControlDataToVariant(var R : TControlData) : OleVariant;
function ConvertVariantToTControlData(const V : OleVariant) : TControlData;
function ConvertTControlData2ToVariant(var R : TControlData2) : OleVariant;
function ConvertVariantToTControlData2(const V : OleVariant) : TControlData2;
function ConvertTEnumValueToVariant(var R : TEnumValue) : OleVariant;
function ConvertVariantToTEnumValue(const V : OleVariant) : TEnumValue;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TControlData__Wrapper = class(TDCRecordWrapper)
private
fR : TControlData;
public
function GetRecordPtr : pointer; override;
published
procedure setEventCount(const val : Longint);
function getEventCount : Longint;
property EventCount : Longint read getEventCount write setEventCount;
procedure setFlags(const val : DWORD);
function getFlags : DWORD;
property Flags : DWORD read getFlags write setFlags;
procedure setVersion(const val : Integer);
function getVersion : Integer;
property Version : Integer read getVersion write setVersion;
procedure setFontCount(const val : Integer);
function getFontCount : Integer;
property FontCount : Integer read getFontCount write setFontCount;
procedure setFontIDs(const val : PDispIDList);
function getFontIDs : PDispIDList;
//property FontIDs : PDispIDList read getFontIDs write setFontIDs;
procedure setPictureCount(const val : Integer);
function getPictureCount : Integer;
property PictureCount : Integer read getPictureCount write setPictureCount;
procedure setPictureIDs(const val : PDispIDList);
function getPictureIDs : PDispIDList;
//property PictureIDs : PDispIDList read getPictureIDs write setPictureIDs;
procedure setReserved(const val : Integer);
function getReserved : Integer;
property Reserved : Integer read getReserved write setReserved;
procedure setInstanceCount(const val : Integer);
function getInstanceCount : Integer;
property InstanceCount : Integer read getInstanceCount write setInstanceCount;
procedure setEnumPropDescs(const val : TList);
function getEnumPropDescs : TList;
property EnumPropDescs : TList read getEnumPropDescs write setEnumPropDescs;
end;
type __TControlData2__Wrapper = class(TDCRecordWrapper)
private
fR : TControlData2;
public
function GetRecordPtr : pointer; override;
published
procedure setEventCount(const val : Longint);
function getEventCount : Longint;
property EventCount : Longint read getEventCount write setEventCount;
procedure setFlags(const val : DWORD);
function getFlags : DWORD;
property Flags : DWORD read getFlags write setFlags;
procedure setVersion(const val : Integer);
function getVersion : Integer;
property Version : Integer read getVersion write setVersion;
procedure setFontCount(const val : Integer);
function getFontCount : Integer;
property FontCount : Integer read getFontCount write setFontCount;
procedure setFontIDs(const val : PDispIDList);
function getFontIDs : PDispIDList;
//property FontIDs : PDispIDList read getFontIDs write setFontIDs;
procedure setPictureCount(const val : Integer);
function getPictureCount : Integer;
property PictureCount : Integer read getPictureCount write setPictureCount;
procedure setPictureIDs(const val : PDispIDList);
function getPictureIDs : PDispIDList;
//property PictureIDs : PDispIDList read getPictureIDs write setPictureIDs;
procedure setReserved(const val : Integer);
function getReserved : Integer;
property Reserved : Integer read getReserved write setReserved;
procedure setInstanceCount(const val : Integer);
function getInstanceCount : Integer;
property InstanceCount : Integer read getInstanceCount write setInstanceCount;
procedure setEnumPropDescs(const val : TList);
function getEnumPropDescs : TList;
property EnumPropDescs : TList read getEnumPropDescs write setEnumPropDescs;
procedure setFirstEventOfs(const val : Cardinal);
function getFirstEventOfs : Cardinal;
property FirstEventOfs : Cardinal read getFirstEventOfs write setFirstEventOfs;
end;
type __TEnumValue__Wrapper = class(TDCRecordWrapper)
private
fR : TEnumValue;
public
function GetRecordPtr : pointer; override;
published
procedure setValue(const val : Longint);
function getValue : Longint;
property Value : Longint read getValue write setValue;
procedure setIdent(const val : AnsiString);
function getIdent : AnsiString;
property Ident : AnsiString read getIdent write setIdent;
end;
type
_T0 = function (p0 : TFont): Variant of object;

_T1 = procedure (const p0 : Variant;
p1 : TFont) of object;

{_T2 = procedure (p0 : Integer;
p1 : Integer;
const p2 : ITypeInfo) of object;}

{_T3 = procedure (p0 : TGetStrProc) of object;}

_T4 = function (const p0 : string): Integer of object;

_T5 = function (p0 : Integer): string of object;

{_T6 = procedure (p0 : TOleControl) of object;}

function __TControlData__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TControlData__Wrapper.setEventCount(const val : Longint);
begin
TControlData(GetRecordPtr^).EventCount := val;
end;
function __TControlData__Wrapper.getEventCount : Longint;
begin
result := TControlData(GetRecordPtr^).EventCount;
end;
procedure __TControlData__Wrapper.setFlags(const val : DWORD);
begin
TControlData(GetRecordPtr^).Flags := val;
end;
function __TControlData__Wrapper.getFlags : DWORD;
begin
result := TControlData(GetRecordPtr^).Flags;
end;
procedure __TControlData__Wrapper.setVersion(const val : Integer);
begin
TControlData(GetRecordPtr^).Version := val;
end;
function __TControlData__Wrapper.getVersion : Integer;
begin
result := TControlData(GetRecordPtr^).Version;
end;
procedure __TControlData__Wrapper.setFontCount(const val : Integer);
begin
TControlData(GetRecordPtr^).FontCount := val;
end;
function __TControlData__Wrapper.getFontCount : Integer;
begin
result := TControlData(GetRecordPtr^).FontCount;
end;
procedure __TControlData__Wrapper.setFontIDs(const val : PDispIDList);
begin
TControlData(GetRecordPtr^).FontIDs := val;
end;
function __TControlData__Wrapper.getFontIDs : PDispIDList;
begin
result := TControlData(GetRecordPtr^).FontIDs;
end;
procedure __TControlData__Wrapper.setPictureCount(const val : Integer);
begin
TControlData(GetRecordPtr^).PictureCount := val;
end;
function __TControlData__Wrapper.getPictureCount : Integer;
begin
result := TControlData(GetRecordPtr^).PictureCount;
end;
procedure __TControlData__Wrapper.setPictureIDs(const val : PDispIDList);
begin
TControlData(GetRecordPtr^).PictureIDs := val;
end;
function __TControlData__Wrapper.getPictureIDs : PDispIDList;
begin
result := TControlData(GetRecordPtr^).PictureIDs;
end;
procedure __TControlData__Wrapper.setReserved(const val : Integer);
begin
TControlData(GetRecordPtr^).Reserved := val;
end;
function __TControlData__Wrapper.getReserved : Integer;
begin
result := TControlData(GetRecordPtr^).Reserved;
end;
procedure __TControlData__Wrapper.setInstanceCount(const val : Integer);
begin
TControlData(GetRecordPtr^).InstanceCount := val;
end;
function __TControlData__Wrapper.getInstanceCount : Integer;
begin
result := TControlData(GetRecordPtr^).InstanceCount;
end;
procedure __TControlData__Wrapper.setEnumPropDescs(const val : TList);
begin
TControlData(GetRecordPtr^).EnumPropDescs := val;
end;
function __TControlData__Wrapper.getEnumPropDescs : TList;
begin
result := TControlData(GetRecordPtr^).EnumPropDescs;
end;
function __TControlData2__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TControlData2__Wrapper.setEventCount(const val : Longint);
begin
TControlData2(GetRecordPtr^).EventCount := val;
end;
function __TControlData2__Wrapper.getEventCount : Longint;
begin
result := TControlData2(GetRecordPtr^).EventCount;
end;
procedure __TControlData2__Wrapper.setFlags(const val : DWORD);
begin
TControlData2(GetRecordPtr^).Flags := val;
end;
function __TControlData2__Wrapper.getFlags : DWORD;
begin
result := TControlData2(GetRecordPtr^).Flags;
end;
procedure __TControlData2__Wrapper.setVersion(const val : Integer);
begin
TControlData2(GetRecordPtr^).Version := val;
end;
function __TControlData2__Wrapper.getVersion : Integer;
begin
result := TControlData2(GetRecordPtr^).Version;
end;
procedure __TControlData2__Wrapper.setFontCount(const val : Integer);
begin
TControlData2(GetRecordPtr^).FontCount := val;
end;
function __TControlData2__Wrapper.getFontCount : Integer;
begin
result := TControlData2(GetRecordPtr^).FontCount;
end;
procedure __TControlData2__Wrapper.setFontIDs(const val : PDispIDList);
begin
TControlData2(GetRecordPtr^).FontIDs := val;
end;
function __TControlData2__Wrapper.getFontIDs : PDispIDList;
begin
result := TControlData2(GetRecordPtr^).FontIDs;
end;
procedure __TControlData2__Wrapper.setPictureCount(const val : Integer);
begin
TControlData2(GetRecordPtr^).PictureCount := val;
end;
function __TControlData2__Wrapper.getPictureCount : Integer;
begin
result := TControlData2(GetRecordPtr^).PictureCount;
end;
procedure __TControlData2__Wrapper.setPictureIDs(const val : PDispIDList);
begin
TControlData2(GetRecordPtr^).PictureIDs := val;
end;
function __TControlData2__Wrapper.getPictureIDs : PDispIDList;
begin
result := TControlData2(GetRecordPtr^).PictureIDs;
end;
procedure __TControlData2__Wrapper.setReserved(const val : Integer);
begin
TControlData2(GetRecordPtr^).Reserved := val;
end;
function __TControlData2__Wrapper.getReserved : Integer;
begin
result := TControlData2(GetRecordPtr^).Reserved;
end;
procedure __TControlData2__Wrapper.setInstanceCount(const val : Integer);
begin
TControlData2(GetRecordPtr^).InstanceCount := val;
end;
function __TControlData2__Wrapper.getInstanceCount : Integer;
begin
result := TControlData2(GetRecordPtr^).InstanceCount;
end;
procedure __TControlData2__Wrapper.setEnumPropDescs(const val : TList);
begin
TControlData2(GetRecordPtr^).EnumPropDescs := val;
end;
function __TControlData2__Wrapper.getEnumPropDescs : TList;
begin
result := TControlData2(GetRecordPtr^).EnumPropDescs;
end;
procedure __TControlData2__Wrapper.setFirstEventOfs(const val : Cardinal);
begin
TControlData2(GetRecordPtr^).FirstEventOfs := val;
end;
function __TControlData2__Wrapper.getFirstEventOfs : Cardinal;
begin
result := TControlData2(GetRecordPtr^).FirstEventOfs;
end;
function __TEnumValue__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TEnumValue__Wrapper.setValue(const val : Longint);
begin
TEnumValue(GetRecordPtr^).Value := val;
end;
function __TEnumValue__Wrapper.getValue : Longint;
begin
result := TEnumValue(GetRecordPtr^).Value;
end;
procedure __TEnumValue__Wrapper.setIdent(const val : AnsiString);
begin
TEnumValue(GetRecordPtr^).Ident := val;
end;
function __TEnumValue__Wrapper.getIdent : AnsiString;
begin
result := TEnumValue(GetRecordPtr^).Ident;
end;
function _TControlData_ : IDispatch;
begin
  result := __TControlData__Wrapper.Create;
end;
function _TControlData2_ : IDispatch;
begin
  result := __TControlData2__Wrapper.Create;
end;
function _TEnumValue_ : IDispatch;
begin
  result := __TEnumValue__Wrapper.Create;
end;

type __TControlData__Wrapper__ = class(__TControlData__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TControlData__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTControlDataToVariant(var R : TControlData) : OleVariant;
var
__rw : __TControlData__Wrapper__;
begin
__rw := __TControlData__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTControlData(const V : OleVariant) : TControlData;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TControlData((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TControlData2__Wrapper__ = class(__TControlData2__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TControlData2__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTControlData2ToVariant(var R : TControlData2) : OleVariant;
var
__rw : __TControlData2__Wrapper__;
begin
__rw := __TControlData2__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTControlData2(const V : OleVariant) : TControlData2;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TControlData2((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TEnumValue__Wrapper__ = class(__TEnumValue__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TEnumValue__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTEnumValueToVariant(var R : TEnumValue) : OleVariant;
var
__rw : __TEnumValue__Wrapper__;
begin
__rw := __TEnumValue__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTEnumValue(const V : OleVariant) : TEnumValue;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TEnumValue((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
procedure __RegisterProps;
begin
end;

procedure __RegisterConsts0;
begin
end;

procedure __UnregisterConsts0;
begin
end;

const ClassList : array[0..2] of TClass = (
EOleCtrlError,
TEnumPropDesc,
TEventDispatch
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
'TControlData'
,'TControlData2'
,'TEnumValue'
,'FontToOleFont'
,'OleFontToFont'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TControlData_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(_TControlData2_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[2],Addr(_TEnumValue_)));
RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T0),[
TypeInfo(TFont),TypeInfo(Variant)],Addr(FontToOleFont),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T1),[
TypeInfo(Variant),
TypeInfo(TFont)],Addr(OleFontToFont),cRegister);

RegRegisterMethod(TEnumPropDesc,'StringToValue',TypeInfo(_T4),[
TypeInfo(string),TypeInfo(Integer)],Addr(TEnumPropDesc.StringToValue));

RegRegisterMethod(TEnumPropDesc,'ValueToString',TypeInfo(_T5),[
TypeInfo(Integer),TypeInfo(string)],Addr(TEnumPropDesc.ValueToString));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(TEnumPropDesc,'Create',mtConstructor,TypeInfo(_T2),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(ITypeInfo)],Addr(TEnumPropDesc.Create),cRegister)}

{RegRegisterMethod(TEnumPropDesc,'GetStrings',TypeInfo(_T3),[
TypeInfo(TGetStrProc)],Addr(TEnumPropDesc.GetStrings))}

{RegisterProc(TEventDispatch,'Create',mtConstructor,TypeInfo(_T6),[
TypeInfo(TOleControl)],Addr(TEventDispatch.Create),cRegister)}

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
