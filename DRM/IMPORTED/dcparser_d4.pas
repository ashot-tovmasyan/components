{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit dcparser_D4;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  activex,
  dcscript,
  dcdreamlib,
  dcsystem,
  consts,
  classes,
  sysutils,
  dcapi,
  dcconsts,
  windows,
  dcparser;
function ConvertTDCOperationStorageToVariant(var R : TDCOperationStorage) : OleVariant;
function ConvertVariantToTDCOperationStorage(const V : OleVariant) : TDCOperationStorage;
function ConvertTPointToVariant(var R : TPoint) : OleVariant;
function ConvertVariantToTPoint(const V : OleVariant) : TPoint;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TDCOperationStorage__Wrapper = class(TDCRecordWrapper)
private
fR : TDCOperationStorage;
public
function GetRecordPtr : pointer; override;
published
procedure setOperation(const val : TDCStoreOperation);
function getOperation : TDCStoreOperation;
property Operation : TDCStoreOperation read getOperation write setOperation;
end;
type __TPoint__Wrapper = class(TDCRecordWrapper)
private
fR : TPoint;
public
function GetRecordPtr : pointer; override;
published
procedure setx(const val : Longint);
function getx : Longint;
property x : Longint read getx write setx;
procedure sety(const val : Longint);
function gety : Longint;
property y : Longint read gety write sety;
end;
type __TCustomDCParser__ = class(TCustomDCParser);
type
_T0 = procedure  of object;

_T1 = function (const p0 : string): TCharSet of object;

_T2 = procedure (const p0 : string) of object;

_T3 = _T2;

_T4 = function (const p0 : string;
const p1 : string;
const p2 : string;
p3 : Boolean): Boolean of object;

_T5 = function (const p0 : string;
const p1 : string;
const p2 : string;
const p3 : string): string of object;

_T6 = function (const p0 : string): Extended of object;

_T7 = function (const p0 : string;
const p1 : string;
const p2 : string;
const p3 : string;
p4 : Boolean): string of object;

{_T8 = function (const p0 : string;
const p1 : string;
const p2 : string;
const p3 : string;
p4 : Boolean;
p5 : TDCFileConfirm): string of object;}

{_T9 = procedure (var p0 : PChar) of object;}

_T10 = function : string of object;

_T11 = procedure (p0 : Integer;
const p1 : string;
var p2 : string) of object;

_T12 = procedure (p0 : Integer) of object;

_T13 = _T0;

_T14 = _T0;

_T15 = procedure (p0 : TTokenData) of object;

_T16 = _T15;

{_T17 = function : TCollectionItemClass of object;}

_T18 = _T0;

_T19 = function : Integer of object;

_T20 = function : IDispatch of object;

_T21 = procedure (const p0 : string;
const p1 : Array of Const) of object;

_T22 = _T2;

_T23 = procedure (p0 : Char) of object;

_T24 = _T23;

_T25 = _T12;

_T26 = _T12;

_T27 = function (p0 : Integer): Boolean of object;

_T28 = function (p0 : Char): Boolean of object;

_T29 = _T10;

_T30 = _T10;

_T31 = function : Boolean of object;

_T32 = _T10;

_T33 = _T10;

_T34 = _T19;

_T35 = function (p0 : Integer): Integer of object;

_T36 = _T27;

_T37 = _T27;

_T38 = _T28;

_T39 = _T28;

_T40 = _T28;

_T41 = _T27;

_T42 = _T10;

_T43 = _T0;

_T44 = _T0;

_T45 = _T0;

_T46 = _T0;

_T47 = _T0;

_T48 = _T0;

_T49 = _T0;

_T50 = _T19;

{_T51 = procedure (const p0 : Array of Integer;
const p1 : TCharSet;
p2 : TParseProc) of object;}

{_T52 = procedure (const p0 : TCharSet;
p1 : TParseProc) of object;}

_T53 = _T19;

_T54 = _T19;

_T55 = _T19;

_T56 = _T19;

_T57 = _T19;

_T58 = _T31;

_T59 = _T0;

_T60 = function (p0 : Integer): string of object;

_T61 = function (const p0 : string): Integer of object;

_T62 = _T10;

_T63 = procedure (var p0 : string;
var p1 : Boolean) of object;

_T64 = procedure (const p0 : string;
p1 : Boolean) of object;

_T65 = procedure (p0 : TStream) of object;

_T66 = _T2;

_T67 = procedure (p0 : Pointer;
p1 : TDCStoreOperation) of object;

_T68 = _T0;

_T69 = function (const p0 : string): Boolean of object;

_T70 = _T64;

_T71 = _T0;

_T72 = _T0;

_T73 = function (p0 : Char): Integer of object;

_T74 = _T19;

_T75 = _T19;

_T76 = _T19;

_T77 = _T19;

_T78 = _T0;

_T79 = _T0;

_T80 = procedure (p0 : TCustomDCParser) of object;

function __TDCOperationStorage__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TDCOperationStorage__Wrapper.setOperation(const val : TDCStoreOperation);
begin
TDCOperationStorage(GetRecordPtr^).Operation := val;
end;
function __TDCOperationStorage__Wrapper.getOperation : TDCStoreOperation;
begin
result := TDCOperationStorage(GetRecordPtr^).Operation;
end;
function _TDCOperationStorage_ : IDispatch;
begin
  result := __TDCOperationStorage__Wrapper.Create;
end;
function __TPoint__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TPoint__Wrapper.setx(const val : Longint);
begin
TPoint(GetRecordPtr^).x := val;
end;
function __TPoint__Wrapper.getx : Longint;
begin
result := TPoint(GetRecordPtr^).x;
end;
procedure __TPoint__Wrapper.sety(const val : Longint);
begin
TPoint(GetRecordPtr^).y := val;
end;
function __TPoint__Wrapper.gety : Longint;
begin
result := TPoint(GetRecordPtr^).y;
end;
function __TCustomDCParser__GetErrorPoint__Wrapper(__Instance : TCustomDCParser): IDispatch;
var
__result : TPoint;
__wrapper : __TPoint__Wrapper;
begin
__result := __TCustomDCParser__(__Instance).GetErrorPoint;
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;


type __TDCOperationStorage__Wrapper__ = class(__TDCOperationStorage__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TDCOperationStorage__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTDCOperationStorageToVariant(var R : TDCOperationStorage) : OleVariant;
var
__rw : __TDCOperationStorage__Wrapper__;
begin
__rw := __TDCOperationStorage__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTDCOperationStorage(const V : OleVariant) : TDCOperationStorage;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TDCOperationStorage((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TPoint__Wrapper__ = class(__TPoint__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TPoint__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTPointToVariant(var R : TPoint) : OleVariant;
var
__rw : __TPoint__Wrapper__;
begin
__rw := __TPoint__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTPoint(const V : OleVariant) : TPoint;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TPoint((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTCustomDCParser__TokenPtr(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := String(TCustomDCParser(Instance).TokenPtr);
end;

function __DC__GetTCustomDCParser__SourcePtr(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := String(TCustomDCParser(Instance).SourcePtr);
end;

function __DC__GetTCustomDCParser__LinePtr(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := String(TCustomDCParser(Instance).LinePtr);
end;

procedure __DC__SetTCustomDCParser__LinePtr(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCParser(Instance).LinePtr:=PChar(String(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCParser__ParserState(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCParser(Instance).ParserState;
end;

procedure __DC__SetTCustomDCParser__ParserState(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCParser(Instance).ParserState:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCParser__Token(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCParser(Instance).Token;
end;

function __DC__GetTCustomDCParser__ResWordID(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCParser(Instance).ResWordID;
end;

function __DC__GetTCustomDCParser__SortedResWords(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCParser(Instance).SortedResWords);
end;

function __DC__GetTCustomDCParser__InternalState(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCParser(Instance).InternalState;
end;

procedure __DC__SetTCustomDCParser__InternalState(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCParser(Instance).InternalState:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCParser__CharPos(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCParser(Instance).CharPos;
end;

procedure __DC__SetTCustomDCParser__CharPos(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCParser(Instance).CharPos:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCParser__TokenCharPos(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCParser(Instance).TokenCharPos;
end;

procedure __DC__SetTCustomDCParser__TokenCharPos(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCParser(Instance).TokenCharPos:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCParser__LinePos(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCParser(Instance).LinePos;
end;

procedure __DC__SetTCustomDCParser__LinePos(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCParser(Instance).LinePos:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCParser__ResWords(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCParser(Instance).ResWords);
end;

procedure __DC__SetTCustomDCParser__ResWords(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCParser(Instance).ResWords:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDCParser__UnterminatedString(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCParser(Instance).UnterminatedString;
end;

function __DC__GetTCustomDCParser__CaseSensitive(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCParser(Instance).CaseSensitive;
end;

procedure __DC__SetTCustomDCParser__CaseSensitive(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCParser(Instance).CaseSensitive:=OleVariant(Params^[0]);
end;

function __DC__GetTDCIncludeParser__ParsedFileName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDCIncludeParser(Instance).ParsedFileName;
end;

procedure __DC__SetTDCIncludeParser__ParsedFileName(Instance : TObject; Params : PVariantArgList);
begin
TDCIncludeParser(Instance).ParsedFileName:=OleVariant(Params^[0]);
end;

function __DC__GetTDCIncludeParser__UnitPaths(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCIncludeParser(Instance).UnitPaths);
end;

function __DC__GetTDCIncludeParser__InclFiles(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCIncludeParser(Instance).InclFiles);
end;

function __DC__GetTDCIncludeTokenData__Operations(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCIncludeTokenData(Instance).Operations);
end;

function __DC__GetTModuleParser__Defines(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TModuleParser(Instance).Defines);
end;

function __DC__GetTModuleParser__Directives(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TModuleParser(Instance).Directives);
end;

function __DC__GetTModuleParser__SkipFlag(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TModuleParser(Instance).SkipFlag[OleVariant(Params^[0])];
end;

procedure __DC__SetTModuleParser__SkipFlag(Instance : TObject; Params : PVariantArgList);
begin
TModuleParser(Instance).SkipFlag[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTModuleParser__IgnoreDefines(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TModuleParser(Instance).IgnoreDefines);
end;

procedure __DC__SetTModuleParser__IgnoreDefines(Instance : TObject; Params : PVariantArgList);
begin
TModuleParser(Instance).IgnoreDefines:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTModuleParser__PlatformKind(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TModuleParser(Instance).PlatformKind;
end;

procedure __DC__SetTModuleParser__PlatformKind(Instance : TObject; Params : PVariantArgList);
begin
TModuleParser(Instance).PlatformKind:=OleVariant(Params^[0]);
end;

function __DC__GetTModuleParser__DelphiVer(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TModuleParser(Instance).DelphiVer;
end;

function __DC__GetTStringsParser__Strings(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TStringsParser(Instance).Strings);
end;

procedure __DC__SetTStringsParser__Strings(Instance : TObject; Params : PVariantArgList);
begin
TStringsParser(Instance).Strings:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTStringsParser__EOLIsSignificant(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStringsParser(Instance).EOLIsSignificant;
end;

procedure __DC__SetTStringsParser__EOLIsSignificant(Instance : TObject; Params : PVariantArgList);
begin
TStringsParser(Instance).EOLIsSignificant:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
RegisterProperty(TCustomDCParser,'TokenPtr',__DC__GetTCustomDCParser__TokenPtr,nil);
RegisterProperty(TCustomDCParser,'SourcePtr',__DC__GetTCustomDCParser__SourcePtr,nil);
RegisterProperty(TCustomDCParser,'LinePtr',__DC__GetTCustomDCParser__LinePtr,__DC__SetTCustomDCParser__LinePtr);
RegisterProperty(TCustomDCParser,'ParserState',__DC__GetTCustomDCParser__ParserState,__DC__SetTCustomDCParser__ParserState);
RegisterProperty(TCustomDCParser,'Token',__DC__GetTCustomDCParser__Token,nil);
RegisterProperty(TCustomDCParser,'ResWordID',__DC__GetTCustomDCParser__ResWordID,nil);
RegisterProperty(TCustomDCParser,'SortedResWords',__DC__GetTCustomDCParser__SortedResWords,nil);
RegisterProperty(TCustomDCParser,'InternalState',__DC__GetTCustomDCParser__InternalState,__DC__SetTCustomDCParser__InternalState);
RegisterProperty(TCustomDCParser,'CharPos',__DC__GetTCustomDCParser__CharPos,__DC__SetTCustomDCParser__CharPos);
RegisterProperty(TCustomDCParser,'TokenCharPos',__DC__GetTCustomDCParser__TokenCharPos,__DC__SetTCustomDCParser__TokenCharPos);
RegisterProperty(TCustomDCParser,'LinePos',__DC__GetTCustomDCParser__LinePos,__DC__SetTCustomDCParser__LinePos);
RegisterProperty(TCustomDCParser,'ResWords',__DC__GetTCustomDCParser__ResWords,__DC__SetTCustomDCParser__ResWords);
RegisterProperty(TCustomDCParser,'UnterminatedString',__DC__GetTCustomDCParser__UnterminatedString,nil);
RegisterProperty(TCustomDCParser,'CaseSensitive',__DC__GetTCustomDCParser__CaseSensitive,__DC__SetTCustomDCParser__CaseSensitive);
RegisterProperty(TDCIncludeParser,'ParsedFileName',__DC__GetTDCIncludeParser__ParsedFileName,__DC__SetTDCIncludeParser__ParsedFileName);
RegisterProperty(TDCIncludeParser,'UnitPaths',__DC__GetTDCIncludeParser__UnitPaths,nil);
RegisterProperty(TDCIncludeParser,'InclFiles',__DC__GetTDCIncludeParser__InclFiles,nil);
RegisterProperty(TDCIncludeTokenData,'Operations',__DC__GetTDCIncludeTokenData__Operations,nil);
RegisterProperty(TModuleParser,'Defines',__DC__GetTModuleParser__Defines,nil);
RegisterProperty(TModuleParser,'Directives',__DC__GetTModuleParser__Directives,nil);
RegisterIndexedProperty(TModuleParser,'SkipFlag',1,False,__DC__GetTModuleParser__SkipFlag,__DC__SetTModuleParser__SkipFlag);
RegisterProperty(TModuleParser,'IgnoreDefines',__DC__GetTModuleParser__IgnoreDefines,__DC__SetTModuleParser__IgnoreDefines);
RegisterProperty(TModuleParser,'PlatformKind',__DC__GetTModuleParser__PlatformKind,__DC__SetTModuleParser__PlatformKind);
RegisterProperty(TModuleParser,'DelphiVer',__DC__GetTModuleParser__DelphiVer,nil);
RegisterProperty(TStringsParser,'Strings',__DC__GetTStringsParser__Strings,__DC__SetTStringsParser__Strings);
RegisterProperty(TStringsParser,'EOLIsSignificant',__DC__GetTStringsParser__EOLIsSignificant,__DC__SetTStringsParser__EOLIsSignificant);
end;

const __ConstNames0 : array[0..63] of string = (
'SErrStringsNotSet'
,'MaxIfDefLevel'
,'cMaxDelphiResWords'
,'cMaxDFMResWords'
,'cMaxVBScrResWords'
,'cMaxJScrResWords'
,'SqlWordsNum'
,'cMaxPerlScrResWords'
,'cMaxCppResWords'
,'cMaxCResWords'
,'cMaxPythonResWords'
,'cDirectivesNum'
,'cCppSuffixesSize'
,'IDD_DEFINE'
,'pkWindows'
,'pkLinux'
,'SDCConditionalExpressions'
,'SDCDefined'
,'SDCDeclared'
,'SDCMSWINDOWS'
,'SDCWIN32'
,'SDCLINUX'
,'ID_absolute'
,'IDJ_abstract'
,'IDPerl_and'
,'cAnyChar'
,'cFirstIdentChar'
,'cOtherIdentChars'
,'cHexDigit'
,'cDigit'
,'cFloatDigit'
,'cWhiteChar'
,'cOtherWhiteChar'
,'cFirstAsmIdentChar'
,'cValidChar'
,'tokNone'
,'tokEOF'
,'tokString'
,'tokComment'
,'tokSymbol'
,'tokInteger'
,'tokFloat'
,'tokResWord'
,'tokWhiteChar'
,'tokPreProcessor'
,'tokAssembler'
,'tokHtmlTag'
,'tokHtmlParam'
,'tokEOL'
,'psNormal'
,'psComment'
,'psComment2'
,'psHtmlTag'
,'psAsm'
,'psAsmComment'
,'psAsmCComment'
,'psAsmComment2'
,'psString'
,'psCString'
,'psDefine'
,'psPerlLongString'
,'soAdd'
,'soRelease'
,'HASHSIZE'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,SErrStringsNotSet));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,MaxIfDefLevel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,cMaxDelphiResWords));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,cMaxDFMResWords));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,cMaxVBScrResWords));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,cMaxJScrResWords));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,SqlWordsNum));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,cMaxPerlScrResWords));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,cMaxCppResWords));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,cMaxCResWords));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,cMaxPythonResWords));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,cDirectivesNum));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,cCppSuffixesSize));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,IDD_DEFINE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,pkWindows));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,pkLinux));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,SDCConditionalExpressions));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,SDCDefined));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,SDCDeclared));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,SDCMSWINDOWS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,SDCWIN32));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,SDCLINUX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,ID_absolute));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,IDJ_abstract));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,IDPerl_and));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,VarFromSet(cAnyChar, sizeof(cAnyChar))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,VarFromSet(cFirstIdentChar, sizeof(cFirstIdentChar))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,VarFromSet(cOtherIdentChars, sizeof(cOtherIdentChars))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,VarFromSet(cHexDigit, sizeof(cHexDigit))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,VarFromSet(cDigit, sizeof(cDigit))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,VarFromSet(cFloatDigit, sizeof(cFloatDigit))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,VarFromSet(cWhiteChar, sizeof(cWhiteChar))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,VarFromSet(cOtherWhiteChar, sizeof(cOtherWhiteChar))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,VarFromSet(cFirstAsmIdentChar, sizeof(cFirstAsmIdentChar))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,VarFromSet(cValidChar, sizeof(cValidChar))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,tokNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,tokEOF));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,tokString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,tokComment));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,tokSymbol));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,tokInteger));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,tokFloat));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,tokResWord));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,tokWhiteChar));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,tokPreProcessor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,tokAssembler));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,tokHtmlTag));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,tokHtmlParam));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[48] ,tokEOL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[49] ,psNormal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[50] ,psComment));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[51] ,psComment2));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[52] ,psHtmlTag));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[53] ,psAsm));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[54] ,psAsmComment));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[55] ,psAsmCComment));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[56] ,psAsmComment2));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[57] ,psString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[58] ,psCString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[59] ,psDefine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[60] ,psPerlLongString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[61] ,soAdd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[62] ,soRelease));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[63] ,HASHSIZE));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..16] of TClass = (
TCParser,
TCPPParser,
TCustomDCParser,
TDCIDStringConvert,
TDCIncludeParser,
TDCIncludeTokenData,
TDelphiParser,
TDFMParser,
THTMLParser,
TJavaScriptParser,
TModuleParser,
TPerlParser,
TPythonParser,
TSqlParser,
TStringsParser,
TTokenData,
TVBScriptParser
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..8] of string = (
'TDCOperationStorage'
,'Register'
,'ParseCharSetDef'
,'CreateINTsForDir'
,'CreateIntFile'
,'SearchNotResourcedStrings'
,'LoadAndParseIfDefs'
,'GetFloatFromString'
,'DCRemoveIfDefs'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TDCOperationStorage_)));
RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T0),NoParams,Addr(Register),cRegister);

RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T1),[
TypeInfo(string),TypeInfo(TCharSet)],Addr(ParseCharSetDef),cRegister);

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T2),[
TypeInfo(string)],Addr(CreateINTsForDir),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T3),[
TypeInfo(string)],Addr(CreateIntFile),cRegister);

RegisterProc(nil,MethodNames[5],mtProc,TypeInfo(_T4),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(string),
TypeInfo(Boolean),TypeInfo(Boolean)],Addr(SearchNotResourcedStrings),cRegister);

RegisterProc(nil,MethodNames[6],mtProc,TypeInfo(_T5),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(string),
TypeInfo(string),TypeInfo(string)],Addr(LoadAndParseIfDefs),cRegister);

RegisterProc(nil,MethodNames[7],mtProc,TypeInfo(_T6),[
TypeInfo(string),TypeInfo(Extended)],Addr(GetFloatFromString),cRegister);

RegisterProc(nil,MethodNames[8],mtProc,TypeInfo(_T7),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(string),
TypeInfo(string),
TypeInfo(Boolean),TypeInfo(string)],Addr(DCRemoveIfDefs),cRegister);

RegRegisterMethod(TCustomDCParser,'GetErrorDesc',TypeInfo(_T10),[TypeInfo(string)], pointer(72));

RegRegisterMethod(TCustomDCParser,'DoGetColorData',TypeInfo(_T11),[
TypeInfo(Integer),
TypeInfo(string),
TypeInfo(string)], pointer(76));

RegRegisterMethod(TCustomDCParser,'SetLinePos',TypeInfo(_T12),[
TypeInfo(Integer)], pointer(80));

RegRegisterMethod(TCustomDCParser,'InitCommon',TypeInfo(_T13),NoParams, pointer(84));

RegRegisterMethod(TCustomDCParser,'UpdateLinePtr',TypeInfo(_T14),NoParams, pointer(88));

RegRegisterMethod(TCustomDCParser,'TokenDataToState',TypeInfo(_T15),[
TypeInfo(TTokenData)], pointer(92));

RegRegisterMethod(TCustomDCParser,'StateToTokenData',TypeInfo(_T16),[
TypeInfo(TTokenData)], pointer(96));

RegRegisterMethod(TCustomDCParser,'UpdateSettings',TypeInfo(_T18),NoParams, pointer(104));

RegRegisterMethod(TCustomDCParser,'ParseComment',TypeInfo(_T19),[TypeInfo(Integer)], pointer(108));

RegRegisterMethod(TCustomDCParser,'GetErrorPoint',TypeInfo(_T20),[TypeInfo(IDispatch)], pointer(112));

RegRegisterMethod(TCustomDCParser,'ErrorFmt',TypeInfo(_T21),[
TypeInfo(string),
TypeInfoArrayOfConst],Addr(TCustomDCParser.ErrorFmt));

RegRegisterMethod(TCustomDCParser,'Error',TypeInfo(_T22),[
TypeInfo(string)],Addr(TCustomDCParser.Error));

RegRegisterMethod(TCustomDCParser,'CheckChar',TypeInfo(_T23),[
TypeInfo(Char)],Addr(TCustomDCParser.CheckChar));

RegRegisterMethod(TCustomDCParser,'CheckNextChar',TypeInfo(_T24),[
TypeInfo(Char)],Addr(TCustomDCParser.CheckNextChar));

RegRegisterMethod(TCustomDCParser,'CheckResWord',TypeInfo(_T25),[
TypeInfo(Integer)],Addr(TCustomDCParser.CheckResWord));

RegRegisterMethod(TCustomDCParser,'CheckNextResWord',TypeInfo(_T26),[
TypeInfo(Integer)],Addr(TCustomDCParser.CheckNextResWord));

RegRegisterMethod(TCustomDCParser,'SkipToResWord',TypeInfo(_T27),[
TypeInfo(Integer),TypeInfo(Boolean)],Addr(TCustomDCParser.SkipToResWord));

RegRegisterMethod(TCustomDCParser,'SkipToChar',TypeInfo(_T28),[
TypeInfo(Char),TypeInfo(Boolean)],Addr(TCustomDCParser.SkipToChar));

RegRegisterMethod(TCustomDCParser,'NextValidTokenStr',TypeInfo(_T29),[TypeInfo(string)],Addr(TCustomDCParser.NextValidTokenStr));

RegRegisterMethod(TCustomDCParser,'PeekValidTokenStr',TypeInfo(_T30),[TypeInfo(string)],Addr(TCustomDCParser.PeekValidTokenStr));

RegRegisterMethod(TCustomDCParser,'ParserEOF',TypeInfo(_T31),[TypeInfo(Boolean)],Addr(TCustomDCParser.ParserEOF));

RegRegisterMethod(TCustomDCParser,'NextTokenStr',TypeInfo(_T32),[TypeInfo(string)],Addr(TCustomDCParser.NextTokenStr));

RegRegisterMethod(TCustomDCParser,'PeekTokenStr',TypeInfo(_T33),[TypeInfo(string)],Addr(TCustomDCParser.PeekTokenStr));

RegRegisterMethod(TCustomDCParser,'PeekToken',TypeInfo(_T34),[TypeInfo(Integer)],Addr(TCustomDCParser.PeekToken));

RegRegisterMethod(TCustomDCParser,'SkipTokens',TypeInfo(_T35),[
TypeInfo(Integer),TypeInfo(Integer)],Addr(TCustomDCParser.SkipTokens));

RegRegisterMethod(TCustomDCParser,'IsTokenResWord',TypeInfo(_T36),[
TypeInfo(Integer),TypeInfo(Boolean)],Addr(TCustomDCParser.IsTokenResWord));

RegRegisterMethod(TCustomDCParser,'IsPeekTokenResWord',TypeInfo(_T37),[
TypeInfo(Integer),TypeInfo(Boolean)],Addr(TCustomDCParser.IsPeekTokenResWord));

RegRegisterMethod(TCustomDCParser,'IsTokenChar',TypeInfo(_T38),[
TypeInfo(Char),TypeInfo(Boolean)],Addr(TCustomDCParser.IsTokenChar));

RegRegisterMethod(TCustomDCParser,'IsPeekTokenChar',TypeInfo(_T39),[
TypeInfo(Char),TypeInfo(Boolean)],Addr(TCustomDCParser.IsPeekTokenChar));

RegRegisterMethod(TCustomDCParser,'IsNextTokenChar',TypeInfo(_T40),[
TypeInfo(Char),TypeInfo(Boolean)],Addr(TCustomDCParser.IsNextTokenChar));

RegRegisterMethod(TCustomDCParser,'IsNextTokenResWord',TypeInfo(_T41),[
TypeInfo(Integer),TypeInfo(Boolean)],Addr(TCustomDCParser.IsNextTokenResWord));

RegRegisterMethod(TCustomDCParser,'TokenString',TypeInfo(_T42),[TypeInfo(string)], pointer(116));

RegRegisterMethod(TCustomDCParser,'InitJScrSyntax',TypeInfo(_T43),NoParams,Addr(TCustomDCParser.InitJScrSyntax));

RegRegisterMethod(TCustomDCParser,'InitCSyntax',TypeInfo(_T44),NoParams,Addr(TCustomDCParser.InitCSyntax));

RegRegisterMethod(TCustomDCParser,'InitCppSyntax',TypeInfo(_T45),NoParams,Addr(TCustomDCParser.InitCppSyntax));

RegRegisterMethod(TCustomDCParser,'InitJSSyntax',TypeInfo(_T46),NoParams,Addr(TCustomDCParser.InitJSSyntax));

RegRegisterMethod(TCustomDCParser,'InitVBSyntax',TypeInfo(_T47),NoParams,Addr(TCustomDCParser.InitVBSyntax));

RegRegisterMethod(TCustomDCParser,'InitDelphiSyntax',TypeInfo(_T48),NoParams,Addr(TCustomDCParser.InitDelphiSyntax));

RegRegisterMethod(TCustomDCParser,'InitDFMSyntax',TypeInfo(_T49),NoParams,Addr(TCustomDCParser.InitDFMSyntax));

RegRegisterMethod(TCustomDCParser,'NextValidToken',TypeInfo(_T50),[TypeInfo(Integer)],Addr(TCustomDCParser.NextValidToken));

RegRegisterMethod(TCustomDCParser,'NextToken',TypeInfo(_T53),[TypeInfo(Integer)], pointer(120));

RegRegisterMethod(TCustomDCParser,'SimpleNextToken',TypeInfo(_T54),[TypeInfo(Integer)],Addr(TCustomDCParser.SimpleNextToken));

RegRegisterMethod(TCustomDCParser,'PushState',TypeInfo(_T55),[TypeInfo(Integer)],Addr(TCustomDCParser.PushState));

RegRegisterMethod(TCustomDCParser,'PopState',TypeInfo(_T56),[TypeInfo(Integer)],Addr(TCustomDCParser.PopState));

RegRegisterMethod(TCustomDCParser,'SoftPushState',TypeInfo(_T57),[TypeInfo(Integer)],Addr(TCustomDCParser.SoftPushState));

RegRegisterMethod(TCustomDCParser,'SoftPopState',TypeInfo(_T58),[TypeInfo(Boolean)],Addr(TCustomDCParser.SoftPopState));

RegisterProc(TDCIDStringConvert,'Create',mtConstructor,TypeInfo(_T59),NoParams,Addr(TDCIDStringConvert.Create),cRegister);

RegRegisterMethod(TDCIDStringConvert,'IDToString',TypeInfo(_T60),[
TypeInfo(Integer),TypeInfo(string)],Addr(TDCIDStringConvert.IDToString));

RegRegisterMethod(TDCIDStringConvert,'StringToID',TypeInfo(_T61),[
TypeInfo(string),TypeInfo(Integer)],Addr(TDCIDStringConvert.StringToID));

RegRegisterMethod(TDCIncludeParser,'GetParsedFileName',TypeInfo(_T62),[TypeInfo(string)], pointer(132));

RegRegisterMethod(TDCIncludeParser,'DoFileConfirm',TypeInfo(_T63),[
TypeInfo(string),
TypeInfo(Boolean)], pointer(136));

RegRegisterMethod(TDCIncludeParser,'AddIncludeFile',TypeInfo(_T64),[
TypeInfo(string),
TypeInfo(Boolean)],Addr(TDCIncludeParser.AddIncludeFile));

RegRegisterMethod(TDCIncludeParser,'AddIncludeStream',TypeInfo(_T65),[
TypeInfo(TStream)],Addr(TDCIncludeParser.AddIncludeStream));

RegRegisterMethod(TDCIncludeParser,'LoadUnitPaths',TypeInfo(_T66),[
TypeInfo(string)],Addr(TDCIncludeParser.LoadUnitPaths));

RegRegisterMethod(TDCIncludeTokenData,'AddOperation',TypeInfo(_T67),[
TypeInfoPointer,
TypeInfo(TDCStoreOperation)],Addr(TDCIncludeTokenData.AddOperation));

RegRegisterMethod(THTMLParser,'InitHTMLSyntax',TypeInfo(_T68),NoParams,Addr(THTMLParser.InitHTMLSyntax));

RegRegisterMethod(TModuleParser,'DefineIsDefined',TypeInfo(_T69),[
TypeInfo(string),TypeInfo(Boolean)], pointer(124));

RegRegisterMethod(TModuleParser,'ParseIncludeFile',TypeInfo(_T70),[
TypeInfo(string),
TypeInfo(Boolean)], pointer(128));

RegRegisterMethod(TPerlParser,'InitPerlSyntax',TypeInfo(_T71),NoParams,Addr(TPerlParser.InitPerlSyntax));

RegRegisterMethod(TPythonParser,'InitPythonSyntax',TypeInfo(_T72),NoParams,Addr(TPythonParser.InitPythonSyntax));

RegRegisterMethod(TPythonParser,'ParseUniPythonStrConstEnd',TypeInfo(_T73),[
TypeInfo(Char),TypeInfo(Integer)],Addr(TPythonParser.ParseUniPythonStrConstEnd));

RegRegisterMethod(TPythonParser,'ParsePythonStrConstEnd',TypeInfo(_T74),[TypeInfo(Integer)],Addr(TPythonParser.ParsePythonStrConstEnd));

RegRegisterMethod(TPythonParser,'ParsePythonCStrConstEnd',TypeInfo(_T75),[TypeInfo(Integer)],Addr(TPythonParser.ParsePythonCStrConstEnd));

RegRegisterMethod(TPythonParser,'ParsePythonStrConst',TypeInfo(_T76),[TypeInfo(Integer)],Addr(TPythonParser.ParsePythonStrConst));

RegRegisterMethod(TPythonParser,'ParsePythonCStrConst',TypeInfo(_T77),[TypeInfo(Integer)],Addr(TPythonParser.ParsePythonCStrConst));

RegRegisterMethod(TSqlParser,'InitSqlSyntax',TypeInfo(_T78),NoParams,Addr(TSqlParser.InitSqlSyntax));

RegRegisterMethod(TStringsParser,'ResetParser',TypeInfo(_T79),NoParams,Addr(TStringsParser.ResetParser));

RegRegisterMethod(TTokenData,'ProcessSinglePop',TypeInfo(_T80),[
TypeInfo(TCustomDCParser)], pointer(28));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'DCRemoveIfDefsEx',mtProc,TypeInfo(_T8),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(string),
TypeInfo(string),
TypeInfo(Boolean),
TypeInfo(TDCFileConfirm),TypeInfo(string)],Addr(DCRemoveIfDefsEx),cRegister)}

{RegisterProc(nil,'DCIncPtr',mtProc,TypeInfo(_T9),[
TypeInfoPChar],Addr(DCIncPtr),cRegister)}

{RegRegisterMethod(TCustomDCParser,'GetTokenDataClass',TypeInfo(_T17),[TypeInfo(TCollectionItemClass)], pointer(100))}

{RegRegisterMethod(TCustomDCParser,'RegisterProc',TypeInfo(_T51),[
ArrayInfo(TypeInfo(Integer)),
TypeInfo(TCharSet),
TypeInfo(TParseProc)],Addr(TCustomDCParser.RegisterProc))}

{RegRegisterMethod(TCustomDCParser,'RegisterNormalProc',TypeInfo(_T52),[
TypeInfo(TCharSet),
TypeInfo(TParseProc)],Addr(TCustomDCParser.RegisterNormalProc))}

RegisterEvent(TypeInfo(TDCFileConfirm),[
TypeInfo(string),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TParseProc),[TypeInfo(Integer)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
