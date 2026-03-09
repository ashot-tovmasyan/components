{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit dcscript_C5;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  Messages,
  dialogs,
  dcconsts,
  Classes,
  TypInfo,
  Sysutils,
  comobj,
  controls,
  forms,
  ActiveX,
  Windows,
  dchook,
  dcAxScript,
  dcapp,
  dcapi,
  Consts,
  dccdes,
  dcdreamlib,
  actnlist,
  dcsystem,
  dccommon,
  dcscript;
function ConvertTDispParamsToVariant(var R : TDispParams) : OleVariant;
function ConvertVariantToTDispParams(const V : OleVariant) : TDispParams;
function ConvertTExcepInfoToVariant(var R : TExcepInfo) : OleVariant;
function ConvertVariantToTExcepInfo(const V : OleVariant) : TExcepInfo;
function ConvertTGUIDToVariant(var R : TGUID) : OleVariant;
function ConvertVariantToTGUID(const V : OleVariant) : TGUID;
function ConvertTParamInfoToVariant(var R : TParamInfo) : OleVariant;
function ConvertVariantToTParamInfo(const V : OleVariant) : TParamInfo;
function ConvertTParamRecToVariant(var R : TParamRec) : OleVariant;
function ConvertVariantToTParamRec(const V : OleVariant) : TParamRec;
function ConvertTTypeConvertInfoToVariant(var R : TTypeConvertInfo) : OleVariant;
function ConvertVariantToTTypeConvertInfo(const V : OleVariant) : TTypeConvertInfo;
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
type __TParamInfo__Wrapper = class(TDCRecordWrapper)
private
fR : TParamInfo;
public
function GetRecordPtr : pointer; override;
published
procedure setskip(const val : Integer);
function getskip : Integer;
property skip : Integer read getskip write setskip;
procedure setsize(const val : Integer);
function getsize : Integer;
property size : Integer read getsize write setsize;
procedure setinregister(const val : Integer);
function getinregister : Integer;
property inregister : Integer read getinregister write setinregister;
end;
type __TParamRec__Wrapper = class(TDCRecordWrapper)
private
fR : TParamRec;
public
function GetRecordPtr : pointer; override;
published
procedure setPSize(const val : Integer);
function getPSize : Integer;
property PSize : Integer read getPSize write setPSize;
procedure setUseRegister(const val : Integer);
function getUseRegister : Integer;
property UseRegister : Integer read getUseRegister write setUseRegister;
end;
type __TTypeConvertInfo__Wrapper = class(TDCRecordWrapper)
private
fR : TTypeConvertInfo;
public
function GetRecordPtr : pointer; override;
published
procedure settSize(const val : Integer);
function gettSize : Integer;
property tSize : Integer read gettSize write settSize;
end;
type __TExcepInfo__Wrapper = class(TDCRecordWrapper)
private
fR : TExcepInfo;
public
function GetRecordPtr : pointer; override;
published
procedure setwCode(const val : Word);
function getwCode : Word;
property wCode : Word read getwCode write setwCode;
procedure setwReserved(const val : Word);
function getwReserved : Word;
property wReserved : Word read getwReserved write setwReserved;
procedure setbstrSource(const val : WideString);
function getbstrSource : WideString;
property bstrSource : WideString read getbstrSource write setbstrSource;
procedure setbstrDescription(const val : WideString);
function getbstrDescription : WideString;
property bstrDescription : WideString read getbstrDescription write setbstrDescription;
procedure setbstrHelpFile(const val : WideString);
function getbstrHelpFile : WideString;
property bstrHelpFile : WideString read getbstrHelpFile write setbstrHelpFile;
procedure setdwHelpContext(const val : Longint);
function getdwHelpContext : Longint;
property dwHelpContext : Longint read getdwHelpContext write setdwHelpContext;
end;
type __TDispParams__Wrapper = class(TDCRecordWrapper)
private
fR : TDispParams;
public
function GetRecordPtr : pointer; override;
published
procedure setcArgs(const val : Longint);
function getcArgs : Longint;
property cArgs : Longint read getcArgs write setcArgs;
procedure setcNamedArgs(const val : Longint);
function getcNamedArgs : Longint;
property cNamedArgs : Longint read getcNamedArgs write setcNamedArgs;
end;
type __TActiveScriptSite__ = class(TActiveScriptSite);
type __TAxScriptRunner__ = class(TAxScriptRunner);
type __TDCScripter__ = class(TDCScripter);
type __TScriptRunner__ = class(TScriptRunner);
type
{_T0 = procedure (p0 : TPersistent;
p1 : TEventHandler;
p2 : Boolean) of object;}

_T1 = procedure (p0 : TPersistent) of object;

{_T2 = function (p0 : TPersistent;
const p1 : string;
p2 : TEventHandler;
p3 : Boolean): Pointer of object;}

{_T3 = function (p0 : TPersistent;
const p1 : string;
p2 : TEventHandler;
p3 : Boolean;
const p4 : string): Pointer of object;}

{_T4 = function (p0 : TPersistent;
p1 : PPropInfo;
p2 : TEventHandler;
p3 : Boolean): Pointer of object;}

{_T5 = function (p0 : TPersistent;
p1 : PPropInfo;
p2 : TEventHandler;
p3 : Boolean;
const p4 : string): Pointer of object;}

_T6 = procedure (p0 : TComponent;
p1 : TDCScripter) of object;

_T7 = procedure (p0 : TComponent) of object;

_T8 = procedure (p0 : Pointer) of object;

_T9 = function (p0 : Pointer): Pointer of object;

_T10 = function (p0 : Pointer): Boolean of object;

{_T11 = procedure (p0 : TPersistent;
p1 : PPropInfo) of object;}

{_T12 = procedure (p0 : TPersistent;
p1 : PPropInfo) of object;}

{_T13 = procedure (p0 : TScriptRunClass;
p1 : TComponent;
p2 : Boolean;
p3 : TStrings;
p4 : TScriptErrorHandler) of object;}

{_T14 = procedure (p0 : TScriptRunClass;
const p1 : string;
const p2 : string) of object;}

{_T15 = function (const p0 : string): TScriptRunClass of object;}

{_T16 = procedure (const p0 : string;
p1 : TTemplateFun) of object;}

{_T17 = function (const p0 : IDispatch): TObject of object;}

{_T18 = function (p0 : TObject;
p1 : TList): IDispatch of object;}

{_T19 = function (p0 : TScriptRunClass;
const p1 : string;
p2 : PTypeInfo;
const p3 : Array of PTypeInfo;
p4 : Pointer;
p5 : TCallType;
p6 : TMethodType): TMethodInfo of object;}

{_T20 = function (p0 : TScriptRunClass;
const p1 : string;
p2 : PTypeInfo;
const p3 : Array of PTypeInfo;
p4 : Pointer;
p5 : TCallType): TMethodInfo of object;}

{_T21 = function (p0 : TClass;
const p1 : string;
p2 : TMethodType;
p3 : PTypeInfo;
const p4 : Array of PTypeInfo;
p5 : Pointer;
p6 : TCallType): TMethodInfo of object;}

{_T22 = function (const p0 : string;
p1 : PTypeInfo;
const p2 : Array of PTypeInfo;
p3 : Pointer;
p4 : TCallType): TMethodInfo of object;}

{_T23 = function (p0 : TClass;
const p1 : string;
p2 : PTypeInfo;
const p3 : Array of PTypeInfo;
p4 : Pointer;
p5 : TCallType): TMethodInfo of object;}

{_T24 = function (p0 : TClass;
const p1 : string;
p2 : PTypeInfo;
const p3 : Array of PTypeInfo;
p4 : Pointer;
p5 : TCallType): TMethodInfo of object;}

{_T25 = function (p0 : TClass;
const p1 : string;
p2 : PTypeInfo;
const p3 : Array of PTypeInfo;
p4 : Pointer): TMethodInfo of object;}

_T26 = function (const p0 : string;
p1 : Pointer): TMethodInfo of object;

_T27 = procedure (const p0 : string;
p1 : TMethodInfo) of object;

{_T28 = procedure (p0 : TClass;
const p1 : string;
p2 : TMethodInfo) of object;}

{_T29 = procedure (p0 : PTypeInfo;
const p1 : Array of PTypeInfo) of object;}

{_T30 = procedure (p0 : TClass;
const p1 : string;
p2 : Integer;
p3 : Boolean;
p4 : TPropGetProc;
p5 : TPropSetProc) of object;}

{_T31 = procedure (p0 : TClass;
const p1 : string;
p2 : TPropGetProc;
p3 : TPropSetProc) of object;}

_T32 = function (const p0 : string;
const p1 : Variant): TRegisteredConstInfo of object;

_T33 = procedure (const p0 : string;
p1 : TRegisteredConstInfo) of object;

{_T34 = function (const p0 : string;
p1 : TPropGetProc;
p2 : TPropSetProc): TVarInfo of object;}

_T35 = procedure (const p0 : string;
p1 : TVarInfo) of object;

{_T36 = procedure (p0 : TClass) of object;}

{_T37 = procedure (p0 : TClass) of object;}

{_T38 = procedure (const p0 : Array of TClass) of object;}

{_T39 = procedure (const p0 : Array of TClass) of object;}

{_T40 = function (p0 : TClass;
const p1 : string): TMethodInfo of object;}

{_T41 = procedure (p0 : TObject;
p1 : TMethodInfo;
p2 : Integer;
p3 : PArgList;
p4 : POleVariant) of object;}

{_T42 = function (p0 : Integer;
p1 : PArgList): OleVariant of object;}

_T43 = function (p0 : TObject): OleVariant of object;

_T44 = function (const p0;
p1 : Integer): Integer of object;

_T45 = procedure (var p0;
p1 : Integer;
const p2 : OleVariant) of object;

_T46 = function (const p0 : OleVariant): TObject of object;

_T47 = function (const p0 : OleVariant): Char of object;

_T48 = function (const p0 : OleVariant): Pointer of object;

_T49 = function (p0 : Pointer): OleVariant of object;

_T50 = function (const p0 : string): Boolean of object;

{_T51 = function (const p0 : IDispatch): Variant of object;}

{_T52 = function (const p0 : Variant): IDispatch of object;}

{_T53 = function (const p0 : Variant): IDispatch of object;}

_T54 = function (const p0 : string): THandle of object;

_T55 = function (p0 : THandle): Boolean of object;

_T56 = procedure (p0 : THandle) of object;

_T57 = function (p0 : TIDEObjectList): THandle of object;

_T58 = _T57;

_T59 = _T54;

_T60 = _T54;

_T61 = function (const p0 : string;
const p1 : string;
const p2 : TFilerID;
p3 : Boolean): THandle of object;

_T62 = function (p0 : Integer;
p1 : Integer): Boolean of object;

{_T63 = function (p0 : Integer;
p1 : PArgList): OleVariant of object;}

_T64 = function (p0 : Byte): string of object;

_T65 = function (p0 : POleVariant): POleVariant of object;

{_T66 = function (p0 : PTypeInfo): PTypeInfo of object;}

{_T67 = function (p0 : PTypeInfo): PTypeInfo of object;}

_T68 = function : TStringList of object;

{_T69 = function (p0 : TClass): Integer of object;}

_T70 = procedure (p0 : TDCScripter;
p1 : TStrings) of object;

_T71 = function (const p0 : string;
p1 : TStrings;
p2 : TComponent;
const p3 : string;
const p4 : Array of OleVariant): OleVariant of object;

_T72 = procedure (const p0 : string) of object;

_T73 = _T50;

_T74 = _T50;

_T75 = _T50;

_T76 = _T50;

_T77 = procedure (const p0 : string;
var p1 : Variant) of object;

_T78 = procedure  of object;

_T79 = _T50;

_T80 = _T50;

_T81 = _T68;

_T82 = _T68;

_T83 = _T68;

_T84 = _T68;

_T85 = function (p0 : Integer): TRegisteredClassInfo of object;

_T86 = procedure (var p0 : TDCScripter) of object;

_T87 = function (p0 : Integer): Integer of object;

{_T88 = function (p0 : PTypeInfo): PTypeConvertInfo of object;}

{_T89 = function (p0 : PTypeInfo): Boolean of object;}

_T91 = _T78;

_T92 = function (var p0 : TLCID): HRESULT of object;

{_T93 = function (var p0 : TBSTR): HRESULT of object;}

_T94 = function (var p0 : OleVariant;
const p1 : IDispatch): HRESULT of object;

_T95 = function (p0 : Longint): HRESULT of object;

{_T96 = function (p0 : IActiveScriptError): HRESULT of object;}

_T97 = function : HRESULT of object;

_T98 = _T97;

_T99 = function (var p0 : THandle): HRESULT of object;

_T100 = function (p0 : WordBool): HRESULT of object;

_T101 = _T72;

{_T102 = procedure (const p0 : string;
const p1 : IUnknown;
p2 : Integer) of object;}

_T103 = function : IDispatch of object;

_T104 = function (p0 : TObject;
p1 : TMethodInfo;
const p2 : IDispatch;
p3 : POleVariant): HRESULT of object;

_T105 = function (p0 : Pointer;
const p1 : IDispatch): HRESULT of object;

_T106 = function (p0 : Pointer;
const p1 : IDispatch;
p2 : POleVariant): HRESULT of object;

_T107 = _T78;

_T108 = function : Pointer of object;

_T109 = procedure (p0 : TObject;
const p1 : IDispatch;
p2 : Integer;
p3 : Integer;
var p4 : Boolean) of object;

_T110 = function (const p0 : TFilerID;
const p1 : TFileName): TComponent of object;

_T111 = function (const p0 : string;
var p1 : TFilerID;
var p2 : TFileName): Boolean of object;

_T112 = _T78;

_T113 = _T78;

_T114 = _T78;

_T115 = function : Integer of object;

_T116 = _T72;

_T117 = _T78;

{_T118 = function (p0 : PChar;
p1 : Integer;
p2 : PArgList): Variant of object;}

{_T119 = function : TCodeDesignerClass of object;}

_T120 = _T78;

_T121 = _T78;

{_T122 = procedure (const p0 : string;
p1 : Boolean;
const p2 : IDispatch) of object;}

_T123 = procedure (p0 : TObject;
const p1 : string;
p2 : Boolean) of object;

_T124 = _T72;

_T125 = function : Variant of object;

_T126 = function (const p0 : string;
const p1 : Array of OleVariant): Variant of object;

_T127 = function (const p0 : string): Variant of object;

_T128 = function : TComponent of object;

_T129 = function : Boolean of object;

_T130 = function (var p0 : Integer;
var p1 : Integer;
p2 : Boolean): Boolean of object;

_T131 = function (var p0 : Integer;
var p1 : Integer;
var p2 : string;
p3 : Boolean): Boolean of object;

_T132 = _T127;

_T133 = procedure (p0 : TStream) of object;

_T134 = _T133;

_T135 = _T72;

_T136 = _T72;

_T137 = function : string of object;

_T138 = _T129;

_T139 = _T72;

_T140 = _T72;

_T141 = function (p0 : TDCScripter;
p1 : Integer): Boolean of object;

_T142 = _T78;

_T143 = _T129;

{_T144 = function (const p0 : PWideChar): Integer of object;}

_T145 = _T78;

_T146 = _T72;

{_T147 = function : IDispatch of object;}

_T148 = _T109;

_T149 = _T78;

_T150 = _T137;

_T151 = _T72;

_T152 = _T78;

_T153 = _T78;

_T154 = procedure (p0 : TDCScripter;
const p1 : string) of object;

_T155 = function (const p0 : string): TDispID of object;

{_T156 = function (p0 : PChar;
p1 : Integer;
p2 : PArgList): Variant of object;}

_T157 = _T50;

{_T158 = procedure (const p0 : string;
p1 : Boolean;
const p2 : IDispatch) of object;}

_T159 = _T72;

_T160 = procedure (p0 : TStrings) of object;

_T161 = procedure (const p0 : string;
const p1 : OleVariant) of object;

_T162 = function (const p0 : string): OleVariant of object;

_T163 = _T133;

_T164 = _T133;

_T165 = _T162;

_T166 = _T125;

_T167 = _T78;

_T168 = _T78;

_T169 = _T115;

_T170 = procedure (var p0 : string;
var p1 : string) of object;

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
function __TParamInfo__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TParamInfo__Wrapper.setskip(const val : Integer);
begin
TParamInfo(GetRecordPtr^).skip := val;
end;
function __TParamInfo__Wrapper.getskip : Integer;
begin
result := TParamInfo(GetRecordPtr^).skip;
end;
procedure __TParamInfo__Wrapper.setsize(const val : Integer);
begin
TParamInfo(GetRecordPtr^).size := val;
end;
function __TParamInfo__Wrapper.getsize : Integer;
begin
result := TParamInfo(GetRecordPtr^).size;
end;
procedure __TParamInfo__Wrapper.setinregister(const val : Integer);
begin
TParamInfo(GetRecordPtr^).inregister := val;
end;
function __TParamInfo__Wrapper.getinregister : Integer;
begin
result := TParamInfo(GetRecordPtr^).inregister;
end;
function __TParamRec__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TParamRec__Wrapper.setPSize(const val : Integer);
begin
TParamRec(GetRecordPtr^).PSize := val;
end;
function __TParamRec__Wrapper.getPSize : Integer;
begin
result := TParamRec(GetRecordPtr^).PSize;
end;
procedure __TParamRec__Wrapper.setUseRegister(const val : Integer);
begin
TParamRec(GetRecordPtr^).UseRegister := val;
end;
function __TParamRec__Wrapper.getUseRegister : Integer;
begin
result := TParamRec(GetRecordPtr^).UseRegister;
end;
function __TTypeConvertInfo__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TTypeConvertInfo__Wrapper.settSize(const val : Integer);
begin
TTypeConvertInfo(GetRecordPtr^).tSize := val;
end;
function __TTypeConvertInfo__Wrapper.gettSize : Integer;
begin
result := TTypeConvertInfo(GetRecordPtr^).tSize;
end;
function _TParamInfo_ : IDispatch;
begin
  result := __TParamInfo__Wrapper.Create;
end;
function _TParamRec_ : IDispatch;
begin
  result := __TParamRec__Wrapper.Create;
end;
function _TTypeConvertInfo_ : IDispatch;
begin
  result := __TTypeConvertInfo__Wrapper.Create;
end;
function __TExcepInfo__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TExcepInfo__Wrapper.setwCode(const val : Word);
begin
TExcepInfo(GetRecordPtr^).wCode := val;
end;
function __TExcepInfo__Wrapper.getwCode : Word;
begin
result := TExcepInfo(GetRecordPtr^).wCode;
end;
procedure __TExcepInfo__Wrapper.setwReserved(const val : Word);
begin
TExcepInfo(GetRecordPtr^).wReserved := val;
end;
function __TExcepInfo__Wrapper.getwReserved : Word;
begin
result := TExcepInfo(GetRecordPtr^).wReserved;
end;
procedure __TExcepInfo__Wrapper.setbstrSource(const val : WideString);
begin
TExcepInfo(GetRecordPtr^).bstrSource := val;
end;
function __TExcepInfo__Wrapper.getbstrSource : WideString;
begin
result := TExcepInfo(GetRecordPtr^).bstrSource;
end;
procedure __TExcepInfo__Wrapper.setbstrDescription(const val : WideString);
begin
TExcepInfo(GetRecordPtr^).bstrDescription := val;
end;
function __TExcepInfo__Wrapper.getbstrDescription : WideString;
begin
result := TExcepInfo(GetRecordPtr^).bstrDescription;
end;
procedure __TExcepInfo__Wrapper.setbstrHelpFile(const val : WideString);
begin
TExcepInfo(GetRecordPtr^).bstrHelpFile := val;
end;
function __TExcepInfo__Wrapper.getbstrHelpFile : WideString;
begin
result := TExcepInfo(GetRecordPtr^).bstrHelpFile;
end;
procedure __TExcepInfo__Wrapper.setdwHelpContext(const val : Longint);
begin
TExcepInfo(GetRecordPtr^).dwHelpContext := val;
end;
function __TExcepInfo__Wrapper.getdwHelpContext : Longint;
begin
result := TExcepInfo(GetRecordPtr^).dwHelpContext;
end;
function __TDispParams__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TDispParams__Wrapper.setcArgs(const val : Longint);
begin
TDispParams(GetRecordPtr^).cArgs := val;
end;
function __TDispParams__Wrapper.getcArgs : Longint;
begin
result := TDispParams(GetRecordPtr^).cArgs;
end;
procedure __TDispParams__Wrapper.setcNamedArgs(const val : Longint);
begin
TDispParams(GetRecordPtr^).cNamedArgs := val;
end;
function __TDispParams__Wrapper.getcNamedArgs : Longint;
begin
result := TDispParams(GetRecordPtr^).cNamedArgs;
end;
function __TActiveScriptSite__OnScriptTerminate__Wrapper(__Instance : TActiveScriptSite;
var p0 : OleVariant;
const p1 : IDispatch): HRESULT;
var
__p1 : ^TExcepInfo;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
result := __TActiveScriptSite__(__Instance).OnScriptTerminate(p0,__p1^);
end;

function __TAxScriptRunner__GetDefaultCatID__Wrapper(__Instance : TAxScriptRunner): IDispatch;
var
__result : TGUID;
__wrapper : __TGUID__Wrapper;
begin
__result := __TAxScriptRunner__(__Instance).GetDefaultCatID;
__wrapper := __TGUID__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function __TDCompWrapper__MethodCall__Wrapper(__Instance : TDCompWrapper;
p0 : TObject;
p1 : TMethodInfo;
const p2 : IDispatch;
p3 : POleVariant): HRESULT;
var
__p2 : ^TDispParams;
__i2 : IDispatch;
begin
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
result := TDCompWrapper(__Instance).MethodCall(p0,p1,__p2^,p3);
end;

function __TDCompWrapper__PutProperty__Wrapper(__Instance : TDCompWrapper;
p0 : Pointer;
const p1 : IDispatch): HRESULT;
var
__p1 : ^TDispParams;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
result := TDCompWrapper(__Instance).PutProperty(p0,__p1^);
end;

function __TDCompWrapper__GetProperty__Wrapper(__Instance : TDCompWrapper;
p0 : Pointer;
const p1 : IDispatch;
p2 : POleVariant): HRESULT;
var
__p1 : ^TDispParams;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
result := TDCompWrapper(__Instance).GetProperty(p0,__p1^,p2);
end;

procedure __TDCScripter__ScriptError__Wrapper(__Instance : TDCScripter;
p0 : TObject;
const p1 : IDispatch;
p2 : Integer;
p3 : Integer;
var p4 : Boolean);
var
__p1 : ^TExcepInfo;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
__TDCScripter__(__Instance).ScriptError(p0,__p1^,p2,p3,p4);
end;

procedure __TScriptRunner__ScriptError__Wrapper(__Instance : TScriptRunner;
p0 : TObject;
const p1 : IDispatch;
p2 : Integer;
p3 : Integer;
var p4 : Boolean);
var
__p1 : ^TExcepInfo;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
__TScriptRunner__(__Instance).ScriptError(p0,__p1^,p2,p3,p4);
end;


type __TDispParams__Wrapper__ = class(__TDispParams__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TDispParams__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTDispParamsToVariant(var R : TDispParams) : OleVariant;
var
__rw : __TDispParams__Wrapper__;
begin
__rw := __TDispParams__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTDispParams(const V : OleVariant) : TDispParams;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TDispParams((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TExcepInfo__Wrapper__ = class(__TExcepInfo__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TExcepInfo__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTExcepInfoToVariant(var R : TExcepInfo) : OleVariant;
var
__rw : __TExcepInfo__Wrapper__;
begin
__rw := __TExcepInfo__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTExcepInfo(const V : OleVariant) : TExcepInfo;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TExcepInfo((_idisp as IDCRecordWrapper).GetRecordPtr^);
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

type __TParamInfo__Wrapper__ = class(__TParamInfo__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TParamInfo__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTParamInfoToVariant(var R : TParamInfo) : OleVariant;
var
__rw : __TParamInfo__Wrapper__;
begin
__rw := __TParamInfo__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTParamInfo(const V : OleVariant) : TParamInfo;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TParamInfo((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TParamRec__Wrapper__ = class(__TParamRec__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TParamRec__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTParamRecToVariant(var R : TParamRec) : OleVariant;
var
__rw : __TParamRec__Wrapper__;
begin
__rw := __TParamRec__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTParamRec(const V : OleVariant) : TParamRec;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TParamRec((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TTypeConvertInfo__Wrapper__ = class(__TTypeConvertInfo__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TTypeConvertInfo__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTTypeConvertInfoToVariant(var R : TTypeConvertInfo) : OleVariant;
var
__rw : __TTypeConvertInfo__Wrapper__;
begin
__rw := __TTypeConvertInfo__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTTypeConvertInfo(const V : OleVariant) : TTypeConvertInfo;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TTypeConvertInfo((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTAxScriptRunner__CatID(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TGUID__Wrapper;
begin
__wrapper := __TGUID__Wrapper.Create;
__wrapper.fR := TAxScriptRunner(Instance).CatID;
result := IUnknown(__wrapper) as IDispatch;
end;

procedure __DC__SetTAxScriptRunner__CatID(Instance : TObject; Params : PVariantArgList);
var
__idisp:IDispatch;
__iwrapper:IDCRecordWrapper;
begin
__idisp:=DCVarToInterface(OleVariant(Params^[0]));
if __idisp=nil then exit;
__idisp.QueryInterface(IDCRecordWrapper, __iwrapper);
TAxScriptRunner(Instance).CatID:=TGUID(__iwrapper.GetRecordPtr^);
end;

function __DC__GetTAxScriptRunner__ScriptRun(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TAxScriptRunner(Instance).ScriptRun);
end;

function __DC__GetTDCompWrapper__WrappObject(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCompWrapper(Instance).WrappObject);
end;

procedure __DC__SetTDCompWrapper__WrappObject(Instance : TObject; Params : PVariantArgList);
begin
TDCompWrapper(Instance).WrappObject:=TObject(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTDCScripter__FilerID(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDCScripter(Instance).FilerID;
end;

procedure __DC__SetTDCScripter__FilerID(Instance : TObject; Params : PVariantArgList);
begin
TDCScripter(Instance).FilerID:=OleVariant(Params^[0]);
end;

function __DC__GetTDCScripter__ModuleClassName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDCScripter(Instance).ModuleClassName;
end;

function __DC__GetTDCScripter__ObjectList(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCScripter(Instance).ObjectList);
end;

function __DC__GetTDCScripter__Project(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDCScripter(Instance).Project;
end;

procedure __DC__SetTDCScripter__Project(Instance : TObject; Params : PVariantArgList);
begin
TDCScripter(Instance).Project:=OleVariant(Params^[0]);
end;

function __DC__GetTDCScripter__RunFailed(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDCScripter(Instance).RunFailed;
end;

function __DC__GetTDCScripter__ScriptRun(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCScripter(Instance).ScriptRun);
end;

function __DC__GetTDCScripter__ScriptVars(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDCScripter(Instance).ScriptVars[OleVariant(Params^[0])];
end;

procedure __DC__SetTDCScripter__ScriptVars(Instance : TObject; Params : PVariantArgList);
begin
TDCScripter(Instance).ScriptVars[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTDCScripter__UnitName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDCScripter(Instance).UnitName;
end;

function __DC__GetTDCScripter__UsedModules(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCScripter(Instance).UsedModules[OleVariant(Params^[0])]);
end;

function __DC__GetTDCScripter__HookAllEvents(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDCScripter(Instance).HookAllEvents;
end;

procedure __DC__SetTDCScripter__HookAllEvents(Instance : TObject; Params : PVariantArgList);
begin
TDCScripter(Instance).HookAllEvents:=OleVariant(Params^[0]);
end;

function __DC__GetTDCScripter__DebugObject(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCScripter(Instance).DebugObject);
end;

procedure __DC__SetTDCScripter__DebugObject(Instance : TObject; Params : PVariantArgList);
begin
TDCScripter(Instance).DebugObject:=TObject(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTEventItem__Scripter(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TEventItem(Instance).Scripter);
end;

function __DC__GetTEventItems__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TEventItems(Instance).Items[OleVariant(Params^[0])]);
end;

function __DC__GetTMethodInfo__ParamCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMethodInfo(Instance).ParamCount;
end;

procedure __DC__SetTMethodInfo__ParamCount(Instance : TObject; Params : PVariantArgList);
begin
TMethodInfo(Instance).ParamCount:=OleVariant(Params^[0]);
end;

function __DC__GetTScriptRunner__DefaultObject(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TScriptRunner(Instance).DefaultObject);
end;

function __DC__GetTScriptRunner__Silent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TScriptRunner(Instance).Silent;
end;

procedure __DC__SetTScriptRunner__Silent(Instance : TObject; Params : PVariantArgList);
begin
TScriptRunner(Instance).Silent:=OleVariant(Params^[0]);
end;

function __DC__GetTScriptRunner__ScriptName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TScriptRunner(Instance).ScriptName;
end;

procedure __DC__SetTScriptRunner__ScriptName(Instance : TObject; Params : PVariantArgList);
begin
TScriptRunner(Instance).ScriptName:=OleVariant(Params^[0]);
end;

function __DC__GetTScriptRunner__StrictSyntaxCheck(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TScriptRunner(Instance).StrictSyntaxCheck;
end;

function __DC__GetTScriptRunner__Scripter(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TScriptRunner(Instance).Scripter);
end;

procedure __RegisterProps;
begin
RegisterProperty(TAxScriptRunner,'CatID',__DC__GetTAxScriptRunner__CatID,__DC__SetTAxScriptRunner__CatID);
RegisterProperty(TAxScriptRunner,'ScriptRun',__DC__GetTAxScriptRunner__ScriptRun,nil);
RegisterProperty(TDCompWrapper,'WrappObject',__DC__GetTDCompWrapper__WrappObject,__DC__SetTDCompWrapper__WrappObject);
RegisterProperty(TDCScripter,'FilerID',__DC__GetTDCScripter__FilerID,__DC__SetTDCScripter__FilerID);
RegisterProperty(TDCScripter,'ModuleClassName',__DC__GetTDCScripter__ModuleClassName,nil);
RegisterProperty(TDCScripter,'ObjectList',__DC__GetTDCScripter__ObjectList,nil);
RegisterProperty(TDCScripter,'Project',__DC__GetTDCScripter__Project,__DC__SetTDCScripter__Project);
RegisterProperty(TDCScripter,'RunFailed',__DC__GetTDCScripter__RunFailed,nil);
RegisterProperty(TDCScripter,'ScriptRun',__DC__GetTDCScripter__ScriptRun,nil);
RegisterIndexedProperty(TDCScripter,'ScriptVars',1,False,__DC__GetTDCScripter__ScriptVars,__DC__SetTDCScripter__ScriptVars);
RegisterProperty(TDCScripter,'UnitName',__DC__GetTDCScripter__UnitName,nil);
RegisterIndexedProperty(TDCScripter,'UsedModules',1,False,__DC__GetTDCScripter__UsedModules,nil);
RegisterProperty(TDCScripter,'HookAllEvents',__DC__GetTDCScripter__HookAllEvents,__DC__SetTDCScripter__HookAllEvents);
RegisterProperty(TDCScripter,'DebugObject',__DC__GetTDCScripter__DebugObject,__DC__SetTDCScripter__DebugObject);
RegisterProperty(TEventItem,'Scripter',__DC__GetTEventItem__Scripter,nil);
RegisterIndexedProperty(TEventItems,'Items',1,True,__DC__GetTEventItems__Items,nil);
RegisterProperty(TMethodInfo,'ParamCount',__DC__GetTMethodInfo__ParamCount,__DC__SetTMethodInfo__ParamCount);
RegisterProperty(TScriptRunner,'DefaultObject',__DC__GetTScriptRunner__DefaultObject,nil);
RegisterProperty(TScriptRunner,'Silent',__DC__GetTScriptRunner__Silent,__DC__SetTScriptRunner__Silent);
RegisterProperty(TScriptRunner,'ScriptName',__DC__GetTScriptRunner__ScriptName,__DC__SetTScriptRunner__ScriptName);
RegisterProperty(TScriptRunner,'StrictSyntaxCheck',__DC__GetTScriptRunner__StrictSyntaxCheck,nil);
RegisterProperty(TScriptRunner,'Scripter',__DC__GetTScriptRunner__Scripter,nil);
end;

const __ConstNames0 : array[0..21] of string = (
'SRunnerExtension'
,'SRunnerDescription'
,'ExternalRunner'
,'SCRIPTERROREVENTNAME'
,'SCRIPTERRORFILENAME'
,'PCharTypeInfo'
,'PWideCharTypeInfo'
,'RealTypeInfo'
,'UntypedTypeInfo'
,'ArrayOfConstInfo'
,'PointerInfo'
,'PWideCharInfo'
,'TypeInfoPChar'
,'TypeInfoPWideChar'
,'TypeInfoReal'
,'TypeInfoUntyped'
,'TypeInfoArrayOfConst'
,'TypeInfoPointer'
,'tNoTypeInfoTypes'
,'MaxParams'
,'valoffset'
,'DCShowWarnIfNoEventType'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,SRunnerExtension));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,SRunnerDescription));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,ExternalRunner));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,SCRIPTERROREVENTNAME));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,SCRIPTERRORFILENAME));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,PCharTypeInfo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,PWideCharTypeInfo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,RealTypeInfo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,UntypedTypeInfo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,ArrayOfConstInfo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,PointerInfo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,PWideCharInfo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,Integer(TypeInfoPChar)));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,Integer(TypeInfoPWideChar)));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,Integer(TypeInfoReal)));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,Integer(TypeInfoUntyped)));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,Integer(TypeInfoArrayOfConst)));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,Integer(TypeInfoPointer)));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,VarFromSet(tNoTypeInfoTypes, sizeof(tNoTypeInfoTypes))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,MaxParams));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,valoffset));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,DCShowWarnIfNoEventType));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..25] of TClass = (
SScriptEngineRunException,
TActiveScriptSite,
TAxScriptRunner,
TDCompWrapper,
TDCRecordWrapper,
TDCScriptAction,
TDCScripter,
TDebugManager,
TEnableScriptRunner,
TEventItem,
TEventItems,
TFreeNotifier,
TItemInfo,
TJavaScriptEncodeRunner,
TJavaScriptRunner,
TMethodInfo,
TPerlScriptRunner,
TPropertyInfo,
TPythonScriptRunner,
TRegisteredClassInfo,
TRegisteredConstInfo,
TScriptRun,
TScriptRunner,
TVarInfo,
TVbScriptEncodeRunner,
TVbScriptRunner
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..52] of string = (
'TParamInfo'
,'TParamRec'
,'TTypeConvertInfo'
,'RestoreEventHandlers'
,'HookAllEvents'
,'UnhookAllEvents'
,'FreeEventCode'
,'GetOldEventCode'
,'IsEventCode'
,'RegisterRWProc'
,'UnregisterProcedure'
,'RegisterConst'
,'UnregisterConst'
,'UnregisterVar'
,'VarFromObject'
,'VarFromSet'
,'VarToSet'
,'VarToObject'
,'VarToChar'
,'VarToPointer'
,'PointerToVariant'
,'FileCanBeExecuted'
,'ExternalRunProject'
,'IsModuleRunning'
,'ResetRunningModule'
,'RunObjectList'
,'RunObjectListModal'
,'RunUnit'
,'RunUnitModal'
,'UniRunUnit'
,'InSet'
,'_Chr'
,'GetRefVariant'
,'GetRegisteredClassesList'
,'GetRoutineNames'
,'ExecScript'
,'ExecuteJavaClass'
,'IsIdentRegistered'
,'IsConstRegistered'
,'IsClassRegistered'
,'IsPropRegistered'
,'GetRegisteredConst'
,'BreakRunningScript'
,'IsMethodRegistered'
,'IsVarRegistered'
,'GetRegisteredConstList'
,'GetRegisteredVarList'
,'GetRegisteredPropNames'
,'GetRegisteredProcList'
,'GetRegisteredClassInfo'
,'RunRunner'
,'GetDWordSize'
,'DCUnitFinalization'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TParamInfo_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(_TParamRec_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[2],Addr(_TTypeConvertInfo_)));
RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T1),[
TypeInfo(TPersistent)],Addr(RestoreEventHandlers),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T6),[
TypeInfo(TComponent),
TypeInfo(TDCScripter)],Addr(HookAllEvents),cRegister);

RegisterProc(nil,MethodNames[5],mtProc,TypeInfo(_T7),[
TypeInfo(TComponent)],Addr(UnhookAllEvents),cRegister);

RegisterProc(nil,MethodNames[6],mtProc,TypeInfo(_T8),[
TypeInfoPointer],Addr(FreeEventCode),cRegister);

RegisterProc(nil,MethodNames[7],mtProc,TypeInfo(_T9),[
TypeInfoPointer,TypeInfoPointer],Addr(GetOldEventCode),cRegister);

RegisterProc(nil,MethodNames[8],mtProc,TypeInfo(_T10),[
TypeInfoPointer,TypeInfo(Boolean)],Addr(IsEventCode),cRegister);

RegisterProc(nil,MethodNames[9],mtProc,TypeInfo(_T26),[
TypeInfo(string),
TypeInfoPointer,TypeInfo(TMethodInfo)],Addr(RegisterRWProc),cRegister);

RegisterProc(nil,MethodNames[10],mtProc,TypeInfo(_T27),[
TypeInfo(string),
TypeInfo(TMethodInfo)],Addr(UnregisterProcedure),cRegister);

RegisterProc(nil,MethodNames[11],mtProc,TypeInfo(_T32),[
TypeInfo(string),
TypeInfo(Variant),TypeInfo(TRegisteredConstInfo)],Addr(RegisterConst),cRegister);

RegisterProc(nil,MethodNames[12],mtProc,TypeInfo(_T33),[
TypeInfo(string),
TypeInfo(TRegisteredConstInfo)],Addr(UnregisterConst),cRegister);

RegisterProc(nil,MethodNames[13],mtProc,TypeInfo(_T35),[
TypeInfo(string),
TypeInfo(TVarInfo)],Addr(UnregisterVar),cRegister);

RegisterProc(nil,MethodNames[14],mtProc,TypeInfo(_T43),[
TypeInfo(TObject),TypeInfo(OleVariant)],Addr(VarFromObject),cRegister);

RegisterProc(nil,MethodNames[15],mtProc,TypeInfo(_T44),[
TypeInfoUntyped,
TypeInfo(Integer),TypeInfo(Integer)],Addr(VarFromSet),cRegister);

RegisterProc(nil,MethodNames[16],mtProc,TypeInfo(_T45),[
TypeInfoUntyped,
TypeInfo(Integer),
TypeInfo(OleVariant)],Addr(VarToSet),cRegister);

RegisterProc(nil,MethodNames[17],mtProc,TypeInfo(_T46),[
TypeInfo(OleVariant),TypeInfo(TObject)],Addr(VarToObject),cRegister);

RegisterProc(nil,MethodNames[18],mtProc,TypeInfo(_T47),[
TypeInfo(OleVariant),TypeInfo(Char)],Addr(VarToChar),cRegister);

RegisterProc(nil,MethodNames[19],mtProc,TypeInfo(_T48),[
TypeInfo(OleVariant),TypeInfoPointer],Addr(VarToPointer),cRegister);

RegisterProc(nil,MethodNames[20],mtProc,TypeInfo(_T49),[
TypeInfoPointer,TypeInfo(OleVariant)],Addr(PointerToVariant),cRegister);

RegisterProc(nil,MethodNames[21],mtProc,TypeInfo(_T50),[
TypeInfo(string),TypeInfo(Boolean)],Addr(FileCanBeExecuted),cRegister);

RegisterProc(nil,MethodNames[22],mtProc,TypeInfo(_T54),[
TypeInfo(string),TypeInfo(THandle)],Addr(ExternalRunProject),cRegister);

RegisterProc(nil,MethodNames[23],mtProc,TypeInfo(_T55),[
TypeInfo(THandle),TypeInfo(Boolean)],Addr(IsModuleRunning),cRegister);

RegisterProc(nil,MethodNames[24],mtProc,TypeInfo(_T56),[
TypeInfo(THandle)],Addr(ResetRunningModule),cRegister);

RegisterProc(nil,MethodNames[25],mtProc,TypeInfo(_T57),[
TypeInfo(TIDEObjectList),TypeInfo(THandle)],Addr(RunObjectList),cRegister);

RegisterProc(nil,MethodNames[26],mtProc,TypeInfo(_T58),[
TypeInfo(TIDEObjectList),TypeInfo(THandle)],Addr(RunObjectListModal),cRegister);

RegisterProc(nil,MethodNames[27],mtProc,TypeInfo(_T59),[
TypeInfo(string),TypeInfo(THandle)],Addr(RunUnit),cRegister);

RegisterProc(nil,MethodNames[28],mtProc,TypeInfo(_T60),[
TypeInfo(string),TypeInfo(THandle)],Addr(RunUnitModal),cRegister);

RegisterProc(nil,MethodNames[29],mtProc,TypeInfo(_T61),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(TFilerID),
TypeInfo(Boolean),TypeInfo(THandle)],Addr(UniRunUnit),cRegister);

RegisterProc(nil,MethodNames[30],mtProc,TypeInfo(_T62),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Boolean)],Addr(InSet),cRegister);

RegisterProc(nil,MethodNames[31],mtProc,TypeInfo(_T64),[
TypeInfo(Byte),TypeInfo(string)],Addr(_Chr),cRegister);

RegisterProc(nil,MethodNames[32],mtProc,TypeInfo(_T65),[
TypeInfoPointer,TypeInfoPointer],Addr(GetRefVariant),cRegister);

RegisterProc(nil,MethodNames[33],mtProc,TypeInfo(_T68),[TypeInfo(TStringList)],Addr(GetRegisteredClassesList),cRegister);

RegisterProc(nil,MethodNames[34],mtProc,TypeInfo(_T70),[
TypeInfo(TDCScripter),
TypeInfo(TStrings)],Addr(GetRoutineNames),cRegister);

RegisterProc(nil,MethodNames[35],mtProc,TypeInfo(_T71),[
TypeInfo(string),
TypeInfo(TStrings),
TypeInfo(TComponent),
TypeInfo(string),
ArrayInfo(TypeInfo(OleVariant)),TypeInfo(OleVariant)],Addr(ExecScript),cRegister);

RegisterProc(nil,MethodNames[36],mtProc,TypeInfo(_T72),[
TypeInfo(string)],Addr(ExecuteJavaClass),cRegister);

RegisterProc(nil,MethodNames[37],mtProc,TypeInfo(_T73),[
TypeInfo(string),TypeInfo(Boolean)],Addr(IsIdentRegistered),cRegister);

RegisterProc(nil,MethodNames[38],mtProc,TypeInfo(_T74),[
TypeInfo(string),TypeInfo(Boolean)],Addr(IsConstRegistered),cRegister);

RegisterProc(nil,MethodNames[39],mtProc,TypeInfo(_T75),[
TypeInfo(string),TypeInfo(Boolean)],Addr(IsClassRegistered),cRegister);

RegisterProc(nil,MethodNames[40],mtProc,TypeInfo(_T76),[
TypeInfo(string),TypeInfo(Boolean)],Addr(IsPropRegistered),cRegister);

RegisterProc(nil,MethodNames[41],mtProc,TypeInfo(_T77),[
TypeInfo(string),
TypeInfo(Variant)],Addr(GetRegisteredConst),cRegister);

RegisterProc(nil,MethodNames[42],mtProc,TypeInfo(_T78),NoParams,Addr(BreakRunningScript),cRegister);

RegisterProc(nil,MethodNames[43],mtProc,TypeInfo(_T79),[
TypeInfo(string),TypeInfo(Boolean)],Addr(IsMethodRegistered),cRegister);

RegisterProc(nil,MethodNames[44],mtProc,TypeInfo(_T80),[
TypeInfo(string),TypeInfo(Boolean)],Addr(IsVarRegistered),cRegister);

RegisterProc(nil,MethodNames[45],mtProc,TypeInfo(_T81),[TypeInfo(TStringList)],Addr(GetRegisteredConstList),cRegister);

RegisterProc(nil,MethodNames[46],mtProc,TypeInfo(_T82),[TypeInfo(TStringList)],Addr(GetRegisteredVarList),cRegister);

RegisterProc(nil,MethodNames[47],mtProc,TypeInfo(_T83),[TypeInfo(TStringList)],Addr(GetRegisteredPropNames),cRegister);

RegisterProc(nil,MethodNames[48],mtProc,TypeInfo(_T84),[TypeInfo(TStringList)],Addr(GetRegisteredProcList),cRegister);

RegisterProc(nil,MethodNames[49],mtProc,TypeInfo(_T85),[
TypeInfo(Integer),TypeInfo(TRegisteredClassInfo)],Addr(GetRegisteredClassInfo),cRegister);

RegisterProc(nil,MethodNames[50],mtProc,TypeInfo(_T86),[
TypeInfo(TDCScripter)],Addr(RunRunner),cRegister);

RegisterProc(nil,MethodNames[51],mtProc,TypeInfo(_T87),[
TypeInfo(Integer),TypeInfo(Integer)],Addr(GetDWordSize),cRegister);

RegisterProc(nil,MethodNames[52],mtProc,TypeInfo(_T91),NoParams,Addr(DCUnitFinalization),cRegister);

RegisterProc(TActiveScriptSite,'GetLCID',mtMethod,TypeInfo(_T92),[
TypeInfo(TLCID),TypeInfo(HRESULT)], pointer(0),cStdCall);

RegisterProc(TActiveScriptSite,'OnScriptTerminate',mtMethod,TypeInfo(_T94),[
TypeInfo(OleVariant),
TypeInfo(IDispatch),TypeInfo(HRESULT)], pointer(8),cRegister);

RegisterProc(TActiveScriptSite,'OnStateChange',mtMethod,TypeInfo(_T95),[
TypeInfo(Longint),TypeInfo(HRESULT)], pointer(12),cStdCall);

RegisterProc(TActiveScriptSite,'OnEnterScript',mtMethod,TypeInfo(_T97),[TypeInfo(HRESULT)], pointer(20),cStdCall);

RegisterProc(TActiveScriptSite,'OnLeaveScript',mtMethod,TypeInfo(_T98),[TypeInfo(HRESULT)], pointer(24),cStdCall);

RegisterProc(TActiveScriptSite,'GetWindow',mtMethod,TypeInfo(_T99),[
TypeInfo(THandle),TypeInfo(HRESULT)], pointer(28),cStdCall);

RegisterProc(TActiveScriptSite,'EnableModeless',mtMethod,TypeInfo(_T100),[
TypeInfo(WordBool),TypeInfo(HRESULT)], pointer(32),cStdCall);

RegisterProc(TActiveScriptSite,'Create',mtConstructor,TypeInfo(_T101),[
TypeInfo(string)],Addr(TActiveScriptSite.Create),cRegister);

RegRegisterMethod(TAxScriptRunner,'GetDefaultCatID',TypeInfo(_T103),[TypeInfo(IDispatch)], pointer(76));

RegRegisterMethod(TDCompWrapper,'MethodCall',TypeInfo(_T104),[
TypeInfo(TObject),
TypeInfo(TMethodInfo),
TypeInfo(IDispatch),
TypeInfoPointer,TypeInfo(HRESULT)],Addr(__TDCompWrapper__MethodCall__Wrapper));

RegRegisterMethod(TDCompWrapper,'PutProperty',TypeInfo(_T105),[
TypeInfoPointer,
TypeInfo(IDispatch),TypeInfo(HRESULT)],Addr(__TDCompWrapper__PutProperty__Wrapper));

RegRegisterMethod(TDCompWrapper,'GetProperty',TypeInfo(_T106),[
TypeInfoPointer,
TypeInfo(IDispatch),
TypeInfoPointer,TypeInfo(HRESULT)],Addr(__TDCompWrapper__GetProperty__Wrapper));

RegisterProc(TDCRecordWrapper,'Create',mtConstructor,TypeInfo(_T107),NoParams,Addr(TDCRecordWrapper.Create),cRegister);

RegRegisterMethod(TDCRecordWrapper,'GetRecordPtr',TypeInfo(_T108),[TypeInfoPointer], pointer(12));

RegRegisterMethod(TDCScripter,'ScriptError',TypeInfo(_T109),[
TypeInfo(TObject),
TypeInfo(IDispatch),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Boolean)], pointer(68));

RegRegisterMethod(TDCScripter,'LoadModule',TypeInfo(_T110),[
TypeInfo(TFilerID),
TypeInfo(TFileName),TypeInfo(TComponent)], pointer(72));

RegRegisterMethod(TDCScripter,'GetUnitFileName',TypeInfo(_T111),[
TypeInfo(string),
TypeInfo(TFilerID),
TypeInfo(TFileName),TypeInfo(Boolean)], pointer(76));

RegRegisterMethod(TDCScripter,'TraceInto',TypeInfo(_T112),NoParams,Addr(TDCScripter.TraceInto));

RegRegisterMethod(TDCScripter,'StepOver',TypeInfo(_T113),NoParams,Addr(TDCScripter.StepOver));

RegRegisterMethod(TDCScripter,'CreateScriptRunner',TypeInfo(_T114),NoParams,Addr(TDCScripter.CreateScriptRunner));

RegRegisterMethod(TDCScripter,'CurrentExecutionLine',TypeInfo(_T115),[TypeInfo(Integer)],Addr(TDCScripter.CurrentExecutionLine));

RegRegisterMethod(TDCScripter,'RaiseScriptError',TypeInfo(_T116),[
TypeInfo(string)],Addr(TDCScripter.RaiseScriptError));

RegRegisterMethod(TDCScripter,'StopScripts',TypeInfo(_T117),NoParams,Addr(TDCScripter.StopScripts));

RegRegisterMethod(TDCScripter,'Stop',TypeInfo(_T120),NoParams,Addr(TDCScripter.Stop));

RegRegisterMethod(TDCScripter,'InterruptScript',TypeInfo(_T121),NoParams,Addr(TDCScripter.InterruptScript));

RegRegisterMethod(TDCScripter,'AddObjectToScript',TypeInfo(_T123),[
TypeInfo(TObject),
TypeInfo(string),
TypeInfo(Boolean)],Addr(TDCScripter.AddObjectToScript));

RegRegisterMethod(TDCScripter,'RemoveItem',TypeInfo(_T124),[
TypeInfo(string)],Addr(TDCScripter.RemoveItem));

RegRegisterMethod(TDCScripter,'Run',TypeInfo(_T125),[TypeInfo(Variant)],Addr(TDCScripter.Run));

RegRegisterMethod(TDCScripter,'DispatchMethod',TypeInfo(_T126),[
TypeInfo(string),
ArrayInfo(TypeInfo(OleVariant)),TypeInfo(Variant)],Addr(TDCScripter.DispatchMethod));

RegRegisterMethod(TDCScripter,'CallNoParamsMethod',TypeInfo(_T127),[
TypeInfo(string),TypeInfo(Variant)],Addr(TDCScripter.CallNoParamsMethod));

RegRegisterMethod(TDCScripter,'GetModule',TypeInfo(_T128),[TypeInfo(TComponent)], pointer(80));

RegRegisterMethod(TDCScripter,'CheckSyntax',TypeInfo(_T129),[TypeInfo(Boolean)],Addr(TDCScripter.CheckSyntax));

RegRegisterMethod(TDCScripter,'CheckSyntaxEx',TypeInfo(_T130),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Boolean),TypeInfo(Boolean)],Addr(TDCScripter.CheckSyntaxEx));

RegRegisterMethod(TDCScripter,'CheckSyntaxEx2',TypeInfo(_T131),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(string),
TypeInfo(Boolean),TypeInfo(Boolean)],Addr(TDCScripter.CheckSyntaxEx2));

RegRegisterMethod(TDCScripter,'Evaluate',TypeInfo(_T132),[
TypeInfo(string),TypeInfo(Variant)],Addr(TDCScripter.Evaluate));

RegRegisterMethod(TDCScripter,'LoadCompiledScriptFromStream',TypeInfo(_T133),[
TypeInfo(TStream)],Addr(TDCScripter.LoadCompiledScriptFromStream));

RegRegisterMethod(TDCScripter,'SaveCompiledScriptToStream',TypeInfo(_T134),[
TypeInfo(TStream)],Addr(TDCScripter.SaveCompiledScriptToStream));

RegRegisterMethod(TDCScripter,'LoadCompiledScriptFromFile',TypeInfo(_T135),[
TypeInfo(string)],Addr(TDCScripter.LoadCompiledScriptFromFile));

RegRegisterMethod(TDCScripter,'SaveCompiledScriptToFile',TypeInfo(_T136),[
TypeInfo(string)],Addr(TDCScripter.SaveCompiledScriptToFile));

RegRegisterMethod(TDCScripter,'GetDisplayScriptName',TypeInfo(_T137),[TypeInfo(string)],Addr(TDCScripter.GetDisplayScriptName));

RegRegisterMethod(TDCScripter,'IsRunning',TypeInfo(_T138),[TypeInfo(Boolean)],Addr(TDCScripter.IsRunning));

RegRegisterMethod(TDCScripter,'UseUnit',TypeInfo(_T139),[
TypeInfo(string)],Addr(TDCScripter.UseUnit));

RegRegisterMethod(TDCScripter,'UnloadUnit',TypeInfo(_T140),[
TypeInfo(string)],Addr(TDCScripter.UnloadUnit));

RegRegisterMethod(TDebugManager,'IsBreakPoint',TypeInfo(_T141),[
TypeInfo(TDCScripter),
TypeInfo(Integer),TypeInfo(Boolean)], pointer(0));

RegisterProc(TRegisteredClassInfo,'Create',mtConstructor,TypeInfo(_T142),NoParams,Addr(TRegisteredClassInfo.Create),cRegister);

RegRegisterMethod(TScriptRun,'InitEngine',TypeInfo(_T143),[TypeInfo(Boolean)],Addr(TScriptRun.InitEngine));

RegRegisterMethod(TScriptRun,'StopEngine',TypeInfo(_T145),NoParams,Addr(TScriptRun.StopEngine));

RegisterProc(TScriptRun,'Create',mtConstructor,TypeInfo(_T146),[
TypeInfo(string)],Addr(TScriptRun.Create),cRegister);

RegRegisterMethod(TScriptRunner,'ScriptError',TypeInfo(_T148),[
TypeInfo(TObject),
TypeInfo(IDispatch),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Boolean)], pointer(4));

RegRegisterMethod(TScriptRunner,'StopScript',TypeInfo(_T149),NoParams, pointer(8));

RegRegisterMethod(TScriptRunner,'GetModuleAlias',TypeInfo(_T150),[TypeInfo(string)], pointer(12));

RegRegisterMethod(TScriptRunner,'DoRemoveItem',TypeInfo(_T151),[
TypeInfo(string)], pointer(16));

RegRegisterMethod(TScriptRunner,'FreeRunner',TypeInfo(_T152),NoParams, pointer(20));

RegRegisterMethod(TScriptRunner,'DoInterrupt',TypeInfo(_T153),NoParams, pointer(24));

RegisterProc(TScriptRunner,'Create',mtConstructor,TypeInfo(_T154),[
TypeInfo(TDCScripter),
TypeInfo(string)], pointer(28),cRegister);

RegRegisterMethod(TScriptRunner,'GetIDByName',TypeInfo(_T155),[
TypeInfo(string),TypeInfo(TDispID)],Addr(TScriptRunner.GetIDByName));

RegRegisterMethod(TScriptRunner,'ParseScript',TypeInfo(_T157),[
TypeInfo(string),TypeInfo(Boolean)], pointer(36));

RegRegisterMethod(TScriptRunner,'RemoveItem',TypeInfo(_T159),[
TypeInfo(string)],Addr(TScriptRunner.RemoveItem));

RegRegisterMethod(TScriptRunner,'GetVarList',TypeInfo(_T160),[
TypeInfo(TStrings)], pointer(44));

RegRegisterMethod(TScriptRunner,'SetVarValue',TypeInfo(_T161),[
TypeInfo(string),
TypeInfo(OleVariant)],Addr(TScriptRunner.SetVarValue));

RegRegisterMethod(TScriptRunner,'GetVarValue',TypeInfo(_T162),[
TypeInfo(string),TypeInfo(OleVariant)],Addr(TScriptRunner.GetVarValue));

RegRegisterMethod(TScriptRunner,'SaveToStream',TypeInfo(_T163),[
TypeInfo(TStream)], pointer(48));

RegRegisterMethod(TScriptRunner,'LoadFromStream',TypeInfo(_T164),[
TypeInfo(TStream)], pointer(52));

RegRegisterMethod(TScriptRunner,'EvaluateExpression',TypeInfo(_T165),[
TypeInfo(string),TypeInfo(OleVariant)], pointer(56));

RegRegisterMethod(TScriptRunner,'Run',TypeInfo(_T166),[TypeInfo(Variant)],Addr(TScriptRunner.Run));

RegRegisterMethod(TScriptRunner,'TraceInto',TypeInfo(_T167),NoParams, pointer(60));

RegRegisterMethod(TScriptRunner,'StepOver',TypeInfo(_T168),NoParams, pointer(64));

RegRegisterMethod(TScriptRunner,'CurrentExecutionLine',TypeInfo(_T169),[TypeInfo(Integer)], pointer(68));

RegRegisterMethod(TScriptRunner,'GetWatchesPreffixes',TypeInfo(_T170),[
TypeInfo(string),
TypeInfo(string)], pointer(72));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'AssignEventHandlers',mtProc,TypeInfo(_T0),[
TypeInfo(TPersistent),
TypeInfo(TEventHandler),
TypeInfo(Boolean)],Addr(AssignEventHandlers),cRegister)}

{RegisterProc(nil,'CreateEventCode',mtProc,TypeInfo(_T2),[
TypeInfo(TPersistent),
TypeInfo(string),
TypeInfo(TEventHandler),
TypeInfo(Boolean),TypeInfoPointer],Addr(CreateEventCode),cRegister)}

{RegisterProc(nil,'CreateEventHandler',mtProc,TypeInfo(_T3),[
TypeInfo(TPersistent),
TypeInfo(string),
TypeInfo(TEventHandler),
TypeInfo(Boolean),
TypeInfo(string),TypeInfoPointer],Addr(CreateEventHandler),cRegister)}

{RegisterProc(nil,'CreateEvent',mtProc,TypeInfo(_T4),[
TypeInfo(TPersistent),
TypeInfoPointer,
TypeInfo(TEventHandler),
TypeInfo(Boolean),TypeInfoPointer],Addr(CreateEvent),cRegister)}

{RegisterProc(nil,'CreateHandler',mtProc,TypeInfo(_T5),[
TypeInfo(TPersistent),
TypeInfoPointer,
TypeInfo(TEventHandler),
TypeInfo(Boolean),
TypeInfo(string),TypeInfoPointer],Addr(CreateHandler),cRegister)}

{RegisterProc(nil,'RestoreOldEvent',mtProc,TypeInfo(_T11),[
TypeInfo(TPersistent),
TypeInfoPointer],Addr(RestoreOldEvent),cRegister)}

{RegisterProc(nil,'RestoreOldEventHandler',mtProc,TypeInfo(_T12),[
TypeInfo(TPersistent),
TypeInfoPointer],Addr(RestoreOldEventHandler),cRegister)}

{RegisterProc(nil,'RunModule',mtProc,TypeInfo(_T13),[
TypeInfo(TScriptRunClass),
TypeInfo(TComponent),
TypeInfo(Boolean),
TypeInfo(TStrings),
TypeInfo(TScriptErrorHandler)],Addr(RunModule),cRegister)}

{RegisterProc(nil,'RegisterScriptRunner',mtProc,TypeInfo(_T14),[
TypeInfo(TScriptRunClass),
TypeInfo(string),
TypeInfo(string)],Addr(RegisterScriptRunner),cRegister)}

{RegisterProc(nil,'GetScriptRunnerClass',mtProc,TypeInfo(_T15),[
TypeInfo(string),TypeInfo(TScriptRunClass)],Addr(GetScriptRunnerClass),cRegister)}

{RegisterProc(nil,'RegisterTemplateFun',mtProc,TypeInfo(_T16),[
TypeInfo(string),
TypeInfo(TTemplateFun)],Addr(RegisterTemplateFun),cRegister)}

{RegisterProc(nil,'Disp2Object',mtProc,TypeInfo(_T17),[
TypeInfo(IDispatch),TypeInfo(TObject)],Addr(Disp2Object),cRegister)}

{RegisterProc(nil,'GetObjectDispatch',mtProc,TypeInfo(_T18),[
TypeInfo(TObject),
TypeInfo(TList),TypeInfo(IDispatch)],Addr(GetObjectDispatch),cRegister)}

{RegisterProc(nil,'RegisterReservedProcEx',mtProc,TypeInfo(_T19),[
TypeInfo(TScriptRunClass),
TypeInfo(string),
TypeInfoPointer,
ArrayInfo(TypeInfoPointer),
TypeInfoPointer,
TypeInfo(TCallType),
TypeInfo(TMethodType),TypeInfo(TMethodInfo)],Addr(RegisterReservedProcEx),cRegister)}

{RegisterProc(nil,'RegisterReservedProc',mtProc,TypeInfo(_T20),[
TypeInfo(TScriptRunClass),
TypeInfo(string),
TypeInfoPointer,
ArrayInfo(TypeInfoPointer),
TypeInfoPointer,
TypeInfo(TCallType),TypeInfo(TMethodInfo)],Addr(RegisterReservedProc),cRegister)}

{RegisterProc(nil,'RegisterProc',mtProc,TypeInfo(_T21),[
TypeInfo(TClass),
TypeInfo(string),
TypeInfo(TMethodType),
TypeInfoPointer,
ArrayInfo(TypeInfoPointer),
TypeInfoPointer,
TypeInfo(TCallType),TypeInfo(TMethodInfo)],Addr(RegisterProc),cRegister)}

{RegisterProc(nil,'RegisterProcedure',mtProc,TypeInfo(_T22),[
TypeInfo(string),
TypeInfoPointer,
ArrayInfo(TypeInfoPointer),
TypeInfoPointer,
TypeInfo(TCallType),TypeInfo(TMethodInfo)],Addr(RegisterProcedure),cRegister)}

{RegisterProc(nil,'RegisterClassMethod',mtProc,TypeInfo(_T23),[
TypeInfo(TClass),
TypeInfo(string),
TypeInfoPointer,
ArrayInfo(TypeInfoPointer),
TypeInfoPointer,
TypeInfo(TCallType),TypeInfo(TMethodInfo)],Addr(RegisterClassMethod),cRegister)}

{RegisterProc(nil,'RegisterMethod',mtProc,TypeInfo(_T24),[
TypeInfo(TClass),
TypeInfo(string),
TypeInfoPointer,
ArrayInfo(TypeInfoPointer),
TypeInfoPointer,
TypeInfo(TCallType),TypeInfo(TMethodInfo)],Addr(RegisterMethod),cRegister)}

{RegisterProc(nil,'RegRegisterMethod',mtProc,TypeInfo(_T25),[
TypeInfo(TClass),
TypeInfo(string),
TypeInfoPointer,
ArrayInfo(TypeInfoPointer),
TypeInfoPointer,TypeInfo(TMethodInfo)],Addr(RegRegisterMethod),cRegister)}

{RegisterProc(nil,'UnregisterProc',mtProc,TypeInfo(_T28),[
TypeInfo(TClass),
TypeInfo(string),
TypeInfo(TMethodInfo)],Addr(UnregisterProc),cRegister)}

{RegisterProc(nil,'RegisterEvent',mtProc,TypeInfo(_T29),[
TypeInfoPointer,
ArrayInfo(TypeInfoPointer)],Addr(RegisterEvent),cRegister)}

{RegisterProc(nil,'RegisterIndexedProperty',mtProc,TypeInfo(_T30),[
TypeInfo(TClass),
TypeInfo(string),
TypeInfo(Integer),
TypeInfo(Boolean),
TypeInfo(TPropGetProc),
TypeInfo(TPropSetProc)],Addr(RegisterIndexedProperty),cRegister)}

{RegisterProc(nil,'RegisterProperty',mtProc,TypeInfo(_T31),[
TypeInfo(TClass),
TypeInfo(string),
TypeInfo(TPropGetProc),
TypeInfo(TPropSetProc)],Addr(RegisterProperty),cRegister)}

{RegisterProc(nil,'RegisterVar',mtProc,TypeInfo(_T34),[
TypeInfo(string),
TypeInfo(TPropGetProc),
TypeInfo(TPropSetProc),TypeInfo(TVarInfo)],Addr(RegisterVar),cRegister)}

{RegisterProc(nil,'RegisterClassInScript',mtProc,TypeInfo(_T36),[
TypeInfo(TClass)],Addr(RegisterClassInScript),cRegister)}

{RegisterProc(nil,'UnRegisterClassInScript',mtProc,TypeInfo(_T37),[
TypeInfo(TClass)],Addr(UnRegisterClassInScript),cRegister)}

{RegisterProc(nil,'RegisterClassesInScript',mtProc,TypeInfo(_T38),[
ArrayInfo(TypeInfo(TClass))],Addr(RegisterClassesInScript),cRegister)}

{RegisterProc(nil,'UnRegisterClassesInScript',mtProc,TypeInfo(_T39),[
ArrayInfo(TypeInfo(TClass))],Addr(UnRegisterClassesInScript),cRegister)}

{RegisterProc(nil,'GetMethodInfo',mtProc,TypeInfo(_T40),[
TypeInfo(TClass),
TypeInfo(string),TypeInfo(TMethodInfo)],Addr(GetMethodInfo),cRegister)}

{RegisterProc(nil,'CallMethod',mtProc,TypeInfo(_T41),[
TypeInfo(TObject),
TypeInfo(TMethodInfo),
TypeInfo(Integer),
TypeInfoPointer,
TypeInfoPointer],Addr(CallMethod),cRegister)}

{RegisterProc(nil,'CreateObject',mtProc,TypeInfo(_T42),[
TypeInfo(Integer),
TypeInfoPointer,TypeInfo(OleVariant)],Addr(CreateObject),cRegister)}

{RegisterProc(nil,'VarFromInterface',mtProc,TypeInfo(_T51),[
TypeInfo(IDispatch),TypeInfo(Variant)],Addr(VarFromInterface),cRegister)}

{RegisterProc(nil,'VarToInterface',mtProc,TypeInfo(_T52),[
TypeInfo(Variant),TypeInfo(IDispatch)],Addr(VarToInterface),cRegister)}

{RegisterProc(nil,'DCVarToInterface',mtProc,TypeInfo(_T53),[
TypeInfo(Variant),TypeInfo(IDispatch)],Addr(DCVarToInterface),cRegister)}

{RegisterProc(nil,'_Set',mtProc,TypeInfo(_T63),[
TypeInfo(Integer),
TypeInfoPointer,TypeInfo(OleVariant)],Addr(_Set),cRegister)}

{RegisterProc(nil,'ArrayInfo',mtProc,TypeInfo(_T66),[
TypeInfoPointer,TypeInfoPointer],Addr(ArrayInfo),cRegister)}

{RegisterProc(nil,'DynArrayInfo',mtProc,TypeInfo(_T67),[
TypeInfoPointer,TypeInfoPointer],Addr(DynArrayInfo),cRegister)}

{RegisterProc(nil,'GetClassInfoIndex',mtProc,TypeInfo(_T69),[
TypeInfo(TClass),TypeInfo(Integer)],Addr(GetClassInfoIndex),cRegister)}

{RegisterProc(nil,'GetConvertInfo',mtProc,TypeInfo(_T88),[
TypeInfoPointer,TypeInfoPointer],Addr(GetConvertInfo),cRegister)}

{RegisterProc(nil,'IsArrayInfo',mtProc,TypeInfo(_T89),[
TypeInfoPointer,TypeInfo(Boolean)],Addr(IsArrayInfo),cRegister)}

{RegisterProc(TActiveScriptSite,'GetDocVersionString',mtMethod,TypeInfo(_T93),[
TypeInfoPWideChar,TypeInfo(HRESULT)], pointer(4),cStdCall)}

{RegisterProc(TActiveScriptSite,'OnScriptError',mtMethod,TypeInfo(_T96),[
TypeInfo(IActiveScriptError),TypeInfo(HRESULT)], pointer(16),cStdCall)}

{RegRegisterMethod(TActiveScriptSite,'AddItem',TypeInfo(_T102),[
TypeInfo(string),
TypeInfo(IUnknown),
TypeInfo(Integer)],Addr(TActiveScriptSite.AddItem))}

{RegRegisterMethod(TDCScripter,'_DispatchMethod',TypeInfo(_T118),[
TypeInfoPChar,
TypeInfo(Integer),
TypeInfoPointer,TypeInfo(Variant)],Addr(TDCScripter._DispatchMethod))}

{RegRegisterMethod(TDCScripter,'GetCodeDesignerClass',TypeInfo(_T119),[TypeInfo(TCodeDesignerClass)],Addr(TDCScripter.GetCodeDesignerClass))}

{RegRegisterMethod(TDCScripter,'AddItem',TypeInfo(_T122),[
TypeInfo(string),
TypeInfo(Boolean),
TypeInfo(IDispatch)],Addr(TDCScripter.AddItem))}

{RegisterProc(TScriptRun,'ParseScript',mtMethod,TypeInfo(_T144),[
TypeInfoPWideChar,TypeInfo(Integer)],Addr(TScriptRun.ParseScript),cSafeCall)}

{RegRegisterMethod(TScriptRunner,'GetScriptDispatch',TypeInfo(_T147),[TypeInfo(IDispatch)], pointer(0))}

{RegRegisterMethod(TScriptRunner,'DispatchMethod',TypeInfo(_T156),[
TypeInfoPChar,
TypeInfo(Integer),
TypeInfoPointer,TypeInfo(Variant)], pointer(32))}

{RegRegisterMethod(TScriptRunner,'AddItem',TypeInfo(_T158),[
TypeInfo(string),
TypeInfo(Boolean),
TypeInfo(IDispatch)], pointer(40))}

RegisterEvent(TypeInfo(TAutoCreateFormHandler),[
TypeInfo(TObject),
TypeInfo(string),
TypeInfo(string),
TypeInfo(Boolean)]);

{RegisterEvent(TypeInfo(TGetFormClassProc),[
TypeInfo(TObject),
TypeInfo(TCustomFormClass)]);}

RegisterEvent(TypeInfo(TGetUnitFileNameProc),[
TypeInfo(TObject),
TypeInfo(string),
TypeInfo(TFilerID),
TypeInfo(TFileName),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TGetUnitScripterProc),[
TypeInfo(TObject),
TypeInfo(string),
TypeInfo(TDCScripter)]);

RegisterEvent(TypeInfo(TGetUserVarIDProc),[
TypeInfo(string),
TypeInfo(Integer)]);

RegisterEvent(TypeInfo(TGetUserVarProc),[
TypeInfo(string),
TypeInfo(Integer),
TypeInfo(OleVariant)]);

RegisterEvent(TypeInfo(TModuleLoadedProc),[
TypeInfo(TObject),
TypeInfo(TComponent),
TypeInfo(string)]);

{RegisterEvent(TypeInfo(TScriptErrorHandler),[
TypeInfo(TObject),
TypeInfo(IDispatch),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Boolean)]);}

RegisterEvent(TypeInfo(TScriptInitFinalProc),[
TypeInfo(TObject)]);

RegisterEvent(TypeInfo(TSetUserVarProc),[
TypeInfo(string),
TypeInfo(Integer),
TypeInfo(OleVariant)]);

RegisterEvent(TypeInfo(TSimpleObjectProc),NoParams);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
