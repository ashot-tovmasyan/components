{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit dcstring_D3;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  dcscript,
  Windows,
  Messages,
  clipbrd,
  forms,
  controls,
  dialogs,
  activex,
  dcsystem,
  dccommon,
  Classes,
  SysUtils,
  Consts,
  dcconsts,
  dcdreamlib,
  dcregexpr,
  dcstring;
function ConvertTBookMarkRecToVariant(var R : TBookMarkRec) : OleVariant;
function ConvertVariantToTBookMarkRec(const V : OleVariant) : TBookMarkRec;
function ConvertTMessageToVariant(var R : TMessage) : OleVariant;
function ConvertVariantToTMessage(const V : OleVariant) : TMessage;
function ConvertTMethodToVariant(var R : TMethod) : OleVariant;
function ConvertVariantToTMethod(const V : OleVariant) : TMethod;
function ConvertTPointToVariant(var R : TPoint) : OleVariant;
function ConvertVariantToTPoint(const V : OleVariant) : TPoint;
function ConvertTRectToVariant(var R : TRect) : OleVariant;
function ConvertVariantToTRect(const V : OleVariant) : TRect;
function ConvertTTemplateRecToVariant(var R : TTemplateRec) : OleVariant;
function ConvertVariantToTTemplateRec(const V : OleVariant) : TTemplateRec;
function ConvertTUndoRecordToVariant(var R : TUndoRecord) : OleVariant;
function ConvertVariantToTUndoRecord(const V : OleVariant) : TUndoRecord;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TRect__Wrapper = class(TDCRecordWrapper)
private
fR : TRect;
public
function GetRecordPtr : pointer; override;
published
procedure setLeft(const val : Integer);
function getLeft : Integer;
property Left : Integer read getLeft write setLeft;
procedure setTop(const val : Integer);
function getTop : Integer;
property Top : Integer read getTop write setTop;
procedure setRight(const val : Integer);
function getRight : Integer;
property Right : Integer read getRight write setRight;
procedure setBottom(const val : Integer);
function getBottom : Integer;
property Bottom : Integer read getBottom write setBottom;
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
type __TBookMarkRec__Wrapper = class(TDCRecordWrapper)
private
fR : TBookMarkRec;
public
function GetRecordPtr : pointer; override;
published
procedure setX(const val : Integer);
function getX : Integer;
property X : Integer read getX write setX;
procedure setY(const val : Integer);
function getY : Integer;
property Y : Integer read getY write setY;
procedure setBookMark(const val : Integer);
function getBookMark : Integer;
property BookMark : Integer read getBookMark write setBookMark;
end;
type __TTemplateRec__Wrapper = class(TDCRecordWrapper)
private
fR : TTemplateRec;
public
function GetRecordPtr : pointer; override;
published
procedure setAName(const val : AnsiString);
function getAName : AnsiString;
property AName : AnsiString read getAName write setAName;
procedure setADesc(const val : AnsiString);
function getADesc : AnsiString;
property ADesc : AnsiString read getADesc write setADesc;
procedure setACode(const val : AnsiString);
function getACode : AnsiString;
property ACode : AnsiString read getACode write setACode;
end;
type __TUndoRecord__Wrapper = class(TDCRecordWrapper)
private
fR : TUndoRecord;
public
function GetRecordPtr : pointer; override;
published
procedure setFOperation(const val : TStringsOperation);
function getFOperation : TStringsOperation;
property FOperation : TStringsOperation read getFOperation write setFOperation;
procedure setFDeltaLine(const val : Integer);
function getFDeltaLine : Integer;
property FDeltaLine : Integer read getFDeltaLine write setFDeltaLine;
procedure setFDeltaChar(const val : Integer);
function getFDeltaChar : Integer;
property FDeltaChar : Integer read getFDeltaChar write setFDeltaChar;
procedure setFString(const val : AnsiString);
function getFString : AnsiString;
property FString : AnsiString read getFString write setFString;
procedure setFColorData(const val : AnsiString);
function getFColorData : AnsiString;
property FColorData : AnsiString read getFColorData write setFColorData;
procedure setFirstRecord(const val : Boolean);
function getFirstRecord : Boolean;
property FirstRecord : Boolean read getFirstRecord write setFirstRecord;
procedure setFOpCode(const val : Byte);
function getFOpCode : Byte;
property FOpCode : Byte read getFOpCode write setFOpCode;
procedure setFInUndoBlock(const val : Boolean);
function getFInUndoBlock : Boolean;
property FInUndoBlock : Boolean read getFInUndoBlock write setFInUndoBlock;
end;
type __TMethod__Wrapper = class(TDCRecordWrapper)
private
fR : TMethod;
public
function GetRecordPtr : pointer; override;
published
end;
type __TMessage__Wrapper = class(TDCRecordWrapper)
private
fR : TMessage;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setWParam(const val : Longint);
function getWParam : Longint;
property WParam : Longint read getWParam write setWParam;
procedure setLParam(const val : Longint);
function getLParam : Longint;
property LParam : Longint read getLParam write setLParam;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
procedure setWParamLo(const val : Word);
function getWParamLo : Word;
property WParamLo : Word read getWParamLo write setWParamLo;
procedure setWParamHi(const val : Word);
function getWParamHi : Word;
property WParamHi : Word read getWParamHi write setWParamHi;
procedure setLParamLo(const val : Word);
function getLParamLo : Word;
property LParamLo : Word read getLParamLo write setLParamLo;
procedure setLParamHi(const val : Word);
function getLParamHi : Word;
property LParamHi : Word read getLParamHi write setLParamHi;
procedure setResultLo(const val : Word);
function getResultLo : Word;
property ResultLo : Word read getResultLo write setResultLo;
procedure setResultHi(const val : Word);
function getResultHi : Word;
property ResultHi : Word read getResultHi write setResultHi;
end;
type __TCustomMemoSource__ = class(TCustomMemoSource);
type
_T0 = function (p0 : TStrings;
p1 : TSearchOptions;
const p2 : IDispatch;
var p3 : Integer;
const p4 : TCharSet): Boolean of object;

_T1 = function (const p0 : string;
p1 : Integer): string of object;

_T2 = procedure (p0 : TStrings;
p1 : TStrings;
p2 : Integer) of object;

_T3 = procedure (p0 : TStrings) of object;

_T4 = function : Boolean of object;

_T5 = function : TSearchOptions of object;

_T6 = procedure  of object;

_T7 = function (const p0 : string): TCustomMemoSource of object;

_T8 = function : TList of object;

_T9 = function : TMemoSourceOptions of object;

_T10 = procedure (p0 : TMemoCodeTemplates) of object;

_T11 = _T10;

_T12 = _T10;

_T13 = _T1;

_T14 = function (p0 : TStrings;
p1 : Integer): string of object;

{_T15 = procedure (const p0 : string;
p1 : TCodeTemplateProc) of object;}

_T16 = procedure (p0 : TMemoCodeTemplates;
const p1 : IDispatch) of object;

_T17 = function (const p0 : string;
const p1 : string;
p2 : Integer;
p3 : TObject;
const p4 : IDispatch;
var p5 : Integer): Boolean of object;

{_T18 = function (p0 : PChar;
p1 : Integer): PChar of object;}

_T19 = function (const p0 : string;
p1 : Integer): Integer of object;

_T20 = _T19;

_T21 = _T19;

_T22 = function (const p0 : string): Integer of object;

_T23 = function (const p0 : string;
p1 : Integer;
p2 : Integer): string of object;

_T24 = function (const p0 : string;
p1 : Integer): Boolean of object;

_T25 = _T24;

_T26 = _T24;

_T27 = procedure (var p0 : string;
p1 : Integer;
p2 : Integer) of object;

_T28 = procedure (p0 : string;
var p1 : string;
p2 : Integer) of object;

_T29 = _T6;

_T30 = procedure (const p0 : string) of object;

_T31 = _T30;

{_T32 = function : TStringItemClass of object;}

_T33 = _T30;

_T34 = function (p0 : TObject;
const p1 : IDispatch): Boolean of object;

_T35 = _T4;

_T36 = procedure (var p0 : TSelectionType) of object;

_T37 = function : TStrings of object;

_T38 = function (const p0 : string): string of object;

_T39 = function : TCustomForm of object;

_T40 = _T39;

_T41 = _T39;

_T42 = function (const p0 : string): Boolean of object;

_T43 = _T3;

_T44 = procedure (p0 : TObject;
p1 : Integer;
p2 : Integer) of object;

_T45 = procedure (p0 : Boolean) of object;

_T46 = _T6;

_T47 = procedure (p0 : Integer;
var p1 : string;
var p2 : string) of object;

_T48 = _T4;

_T49 = procedure (p0 : Integer;
p1 : Integer) of object;

_T50 = _T45;

_T51 = procedure (p0 : TPersistent;
const p1 : string) of object;

_T52 = _T51;

_T53 = _T4;

_T54 = procedure (p0 : Integer;
p1 : Byte) of object;

_T55 = _T6;

{_T56 = procedure (p0 : Integer;
p1 : TStrProc;
p2 : Boolean) of object;}

{_T57 = procedure (p0 : Integer;
p1 : TObjProc;
p2 : TObjProc;
p3 : Boolean) of object;}

_T58 = _T4;

_T59 = _T49;

_T60 = _T6;

_T61 = _T6;

_T62 = _T42;

_T63 = procedure (p0 : Integer) of object;

_T64 = function (p0 : Integer;
p1 : Integer): Boolean of object;

_T65 = _T4;

_T66 = _T42;

_T67 = function (p0 : Integer;
p1 : Boolean): Integer of object;

_T68 = _T6;

_T69 = _T63;

_T70 = _T64;

_T71 = procedure (p0 : Integer;
var p1 : Integer;
var p2 : Integer;
p3 : Boolean) of object;

_T72 = _T63;

_T73 = _T6;

_T74 = function (p0 : Integer): PChar of object;

_T75 = function (p0 : Integer): string of object;

{_T76 = procedure (p0 : TObjProc;
p1 : TSelectionType) of object;}

{_T77 = procedure (p0 : TNotifierProc;
p1 : Boolean) of object;}

{_T78 = procedure (p0 : TNotifierProc) of object;}

_T79 = _T3;

_T80 = procedure (p0 : TStream) of object;

_T81 = _T30;

_T82 = _T30;

_T83 = procedure (p0 : TStrings;
p1 : Boolean) of object;

_T84 = _T80;

_T85 = _T30;

_T86 = _T4;

_T87 = _T63;

_T88 = _T6;

_T89 = _T6;

_T90 = _T6;

_T91 = _T63;

_T92 = _T6;

_T93 = _T6;

_T94 = _T4;

_T95 = _T4;

_T96 = function (const p0 : IDispatch): IDispatch of object;

_T97 = _T96;

_T98 = function : IDispatch of object;

_T99 = procedure (const p0 : IDispatch) of object;

_T100 = _T49;

_T101 = _T6;

_T102 = _T6;

_T103 = _T6;

_T104 = _T6;

_T105 = _T6;

_T106 = _T6;

_T107 = _T6;

_T108 = _T6;

_T109 = _T6;

_T110 = _T6;

_T111 = _T6;

_T112 = _T6;

_T113 = _T6;

_T114 = _T6;

_T115 = _T6;

_T116 = _T6;

_T117 = _T6;

_T118 = _T6;

_T119 = _T6;

_T120 = _T6;

_T121 = _T6;

_T122 = _T6;

_T123 = _T6;

_T124 = _T6;

_T125 = _T6;

_T126 = _T6;

_T127 = _T6;

_T128 = _T6;

_T129 = _T6;

_T130 = _T6;

_T131 = _T6;

_T132 = procedure (p0 : TWordSelectionType) of object;

_T133 = _T6;

_T134 = _T6;

_T135 = _T6;

_T136 = _T6;

_T137 = _T6;

_T138 = _T6;

_T139 = _T6;

_T140 = _T6;

_T141 = _T6;

_T142 = _T6;

_T143 = _T6;

_T144 = _T6;

_T145 = _T6;

_T146 = _T6;

_T147 = function (p0 : Char;
p1 : Boolean;
const p2 : IDispatch): Boolean of object;

_T148 = _T147;

_T149 = _T30;

_T150 = procedure (p0 : TSelectionType;
p1 : Integer;
p2 : Integer;
p3 : Integer;
p4 : Integer) of object;

_T151 = _T6;

_T152 = _T4;

_T153 = _T4;

_T154 = _T6;

_T155 = _T6;

_T156 = _T6;

_T157 = _T6;

_T158 = _T6;

_T159 = _T30;

_T160 = _T30;

_T161 = _T80;

_T162 = _T80;

_T163 = _T6;

_T164 = _T6;

_T165 = _T4;

_T166 = _T6;

_T167 = _T6;

_T168 = _T6;

_T169 = _T6;

_T170 = _T6;

_T171 = _T6;

_T172 = _T6;

_T173 = _T6;

_T174 = _T6;

_T175 = _T6;

_T176 = _T6;

_T177 = _T6;

_T178 = _T6;

_T179 = _T6;

_T180 = _T6;

_T181 = _T6;

_T182 = _T83;

_T183 = _T30;

_T184 = _T6;

_T185 = _T6;

_T186 = _T6;

_T187 = _T6;

_T188 = _T6;

_T189 = _T6;

_T190 = _T6;

_T191 = _T6;

_T192 = _T6;

_T193 = _T6;

_T194 = _T6;

_T195 = _T6;

_T196 = _T6;

_T197 = _T6;

_T198 = _T6;

_T199 = _T6;

_T200 = _T6;

_T201 = _T6;

_T202 = _T6;

_T203 = _T6;

_T204 = _T6;

_T205 = _T6;

_T206 = _T6;

_T207 = _T6;

_T208 = _T6;

_T209 = _T6;

_T210 = _T6;

_T211 = _T4;

_T212 = _T4;

_T213 = _T4;

_T214 = _T6;

_T215 = _T6;

_T216 = procedure (p0 : TBookMarkNumber) of object;

_T217 = _T216;

_T218 = _T216;

_T219 = _T216;

_T220 = procedure (p0 : TBookMarkNumber;
p1 : Integer) of object;

_T221 = function (p0 : TBookMarkNumber;
const p1 : IDispatch): Boolean of object;

_T222 = function : Integer of object;

_T223 = _T6;

_T224 = _T6;

_T225 = _T6;

_T226 = _T6;

_T227 = _T6;

_T228 = _T6;

_T229 = _T6;

_T230 = _T6;

_T231 = _T6;

_T232 = _T6;

_T233 = _T6;

_T234 = _T6;

_T235 = _T6;

_T236 = _T6;

_T237 = _T6;

_T238 = _T6;

_T239 = _T6;

_T240 = _T6;

_T241 = _T6;

_T242 = _T6;

_T243 = _T63;

_T244 = function : string of object;

_T245 = function (p0 : Integer;
p1 : Integer): string of object;

_T246 = function (const p0 : IDispatch): Char of object;

_T247 = _T19;

_T248 = _T19;

_T249 = _T38;

_T250 = function (p0 : Integer): Integer of object;

_T251 = _T250;

_T252 = _T6;

_T253 = function (p0 : TMemoCodeTemplate): string of object;

_T254 = function (p0 : TStrings;
const p1 : string): Integer of object;

_T255 = _T6;

_T256 = _T49;

_T257 = function (p0 : TPosition): Boolean of object;

_T258 = _T6;

_T259 = _T6;

_T260 = _T6;

{_T261 = function : PUndoRecord of object;}

_T262 = _T63;

_T263 = function (p0 : Integer;
p1 : Boolean;
p2 : Boolean): Integer of object;

function __TRect__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TRect__Wrapper.setLeft(const val : Integer);
begin
TRect(GetRecordPtr^).Left := val;
end;
function __TRect__Wrapper.getLeft : Integer;
begin
result := TRect(GetRecordPtr^).Left;
end;
procedure __TRect__Wrapper.setTop(const val : Integer);
begin
TRect(GetRecordPtr^).Top := val;
end;
function __TRect__Wrapper.getTop : Integer;
begin
result := TRect(GetRecordPtr^).Top;
end;
procedure __TRect__Wrapper.setRight(const val : Integer);
begin
TRect(GetRecordPtr^).Right := val;
end;
function __TRect__Wrapper.getRight : Integer;
begin
result := TRect(GetRecordPtr^).Right;
end;
procedure __TRect__Wrapper.setBottom(const val : Integer);
begin
TRect(GetRecordPtr^).Bottom := val;
end;
function __TRect__Wrapper.getBottom : Integer;
begin
result := TRect(GetRecordPtr^).Bottom;
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
function __TBookMarkRec__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TBookMarkRec__Wrapper.setX(const val : Integer);
begin
TBookMarkRec(GetRecordPtr^).X := val;
end;
function __TBookMarkRec__Wrapper.getX : Integer;
begin
result := TBookMarkRec(GetRecordPtr^).X;
end;
procedure __TBookMarkRec__Wrapper.setY(const val : Integer);
begin
TBookMarkRec(GetRecordPtr^).Y := val;
end;
function __TBookMarkRec__Wrapper.getY : Integer;
begin
result := TBookMarkRec(GetRecordPtr^).Y;
end;
procedure __TBookMarkRec__Wrapper.setBookMark(const val : Integer);
begin
TBookMarkRec(GetRecordPtr^).BookMark := val;
end;
function __TBookMarkRec__Wrapper.getBookMark : Integer;
begin
result := TBookMarkRec(GetRecordPtr^).BookMark;
end;
function __TTemplateRec__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TTemplateRec__Wrapper.setAName(const val : AnsiString);
begin
TTemplateRec(GetRecordPtr^).AName := val;
end;
function __TTemplateRec__Wrapper.getAName : AnsiString;
begin
result := TTemplateRec(GetRecordPtr^).AName;
end;
procedure __TTemplateRec__Wrapper.setADesc(const val : AnsiString);
begin
TTemplateRec(GetRecordPtr^).ADesc := val;
end;
function __TTemplateRec__Wrapper.getADesc : AnsiString;
begin
result := TTemplateRec(GetRecordPtr^).ADesc;
end;
procedure __TTemplateRec__Wrapper.setACode(const val : AnsiString);
begin
TTemplateRec(GetRecordPtr^).ACode := val;
end;
function __TTemplateRec__Wrapper.getACode : AnsiString;
begin
result := TTemplateRec(GetRecordPtr^).ACode;
end;
function __TUndoRecord__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TUndoRecord__Wrapper.setFOperation(const val : TStringsOperation);
begin
TUndoRecord(GetRecordPtr^).FOperation := val;
end;
function __TUndoRecord__Wrapper.getFOperation : TStringsOperation;
begin
result := TUndoRecord(GetRecordPtr^).FOperation;
end;
procedure __TUndoRecord__Wrapper.setFDeltaLine(const val : Integer);
begin
TUndoRecord(GetRecordPtr^).FDeltaLine := val;
end;
function __TUndoRecord__Wrapper.getFDeltaLine : Integer;
begin
result := TUndoRecord(GetRecordPtr^).FDeltaLine;
end;
procedure __TUndoRecord__Wrapper.setFDeltaChar(const val : Integer);
begin
TUndoRecord(GetRecordPtr^).FDeltaChar := val;
end;
function __TUndoRecord__Wrapper.getFDeltaChar : Integer;
begin
result := TUndoRecord(GetRecordPtr^).FDeltaChar;
end;
procedure __TUndoRecord__Wrapper.setFString(const val : AnsiString);
begin
TUndoRecord(GetRecordPtr^).FString := val;
end;
function __TUndoRecord__Wrapper.getFString : AnsiString;
begin
result := TUndoRecord(GetRecordPtr^).FString;
end;
procedure __TUndoRecord__Wrapper.setFColorData(const val : AnsiString);
begin
TUndoRecord(GetRecordPtr^).FColorData := val;
end;
function __TUndoRecord__Wrapper.getFColorData : AnsiString;
begin
result := TUndoRecord(GetRecordPtr^).FColorData;
end;
procedure __TUndoRecord__Wrapper.setFirstRecord(const val : Boolean);
begin
TUndoRecord(GetRecordPtr^).FirstRecord := val;
end;
function __TUndoRecord__Wrapper.getFirstRecord : Boolean;
begin
result := TUndoRecord(GetRecordPtr^).FirstRecord;
end;
procedure __TUndoRecord__Wrapper.setFOpCode(const val : Byte);
begin
TUndoRecord(GetRecordPtr^).FOpCode := val;
end;
function __TUndoRecord__Wrapper.getFOpCode : Byte;
begin
result := TUndoRecord(GetRecordPtr^).FOpCode;
end;
procedure __TUndoRecord__Wrapper.setFInUndoBlock(const val : Boolean);
begin
TUndoRecord(GetRecordPtr^).FInUndoBlock := val;
end;
function __TUndoRecord__Wrapper.getFInUndoBlock : Boolean;
begin
result := TUndoRecord(GetRecordPtr^).FInUndoBlock;
end;
function _TBookMarkRec_ : IDispatch;
begin
  result := __TBookMarkRec__Wrapper.Create;
end;
function _TTemplateRec_ : IDispatch;
begin
  result := __TTemplateRec__Wrapper.Create;
end;
function _TUndoRecord_ : IDispatch;
begin
  result := __TUndoRecord__Wrapper.Create;
end;
function __TMethod__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
function __TMessage__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TMessage__Wrapper.setMsg(const val : Cardinal);
begin
TMessage(GetRecordPtr^).Msg := val;
end;
function __TMessage__Wrapper.getMsg : Cardinal;
begin
result := TMessage(GetRecordPtr^).Msg;
end;
procedure __TMessage__Wrapper.setWParam(const val : Longint);
begin
TMessage(GetRecordPtr^).WParam := val;
end;
function __TMessage__Wrapper.getWParam : Longint;
begin
result := TMessage(GetRecordPtr^).WParam;
end;
procedure __TMessage__Wrapper.setLParam(const val : Longint);
begin
TMessage(GetRecordPtr^).LParam := val;
end;
function __TMessage__Wrapper.getLParam : Longint;
begin
result := TMessage(GetRecordPtr^).LParam;
end;
procedure __TMessage__Wrapper.setResult(const val : Longint);
begin
TMessage(GetRecordPtr^).Result := val;
end;
function __TMessage__Wrapper.getResult : Longint;
begin
result := TMessage(GetRecordPtr^).Result;
end;
procedure __TMessage__Wrapper.setWParamLo(const val : Word);
begin
TMessage(GetRecordPtr^).WParamLo := val;
end;
function __TMessage__Wrapper.getWParamLo : Word;
begin
result := TMessage(GetRecordPtr^).WParamLo;
end;
procedure __TMessage__Wrapper.setWParamHi(const val : Word);
begin
TMessage(GetRecordPtr^).WParamHi := val;
end;
function __TMessage__Wrapper.getWParamHi : Word;
begin
result := TMessage(GetRecordPtr^).WParamHi;
end;
procedure __TMessage__Wrapper.setLParamLo(const val : Word);
begin
TMessage(GetRecordPtr^).LParamLo := val;
end;
function __TMessage__Wrapper.getLParamLo : Word;
begin
result := TMessage(GetRecordPtr^).LParamLo;
end;
procedure __TMessage__Wrapper.setLParamHi(const val : Word);
begin
TMessage(GetRecordPtr^).LParamHi := val;
end;
function __TMessage__Wrapper.getLParamHi : Word;
begin
result := TMessage(GetRecordPtr^).LParamHi;
end;
procedure __TMessage__Wrapper.setResultLo(const val : Word);
begin
TMessage(GetRecordPtr^).ResultLo := val;
end;
function __TMessage__Wrapper.getResultLo : Word;
begin
result := TMessage(GetRecordPtr^).ResultLo;
end;
procedure __TMessage__Wrapper.setResultHi(const val : Word);
begin
TMessage(GetRecordPtr^).ResultHi := val;
end;
function __TMessage__Wrapper.getResultHi : Word;
begin
result := TMessage(GetRecordPtr^).ResultHi;
end;
function ____SearchinStrings__Wrapper(p0 : TStrings;
p1 : TSearchOptions;
const p2 : IDispatch;
var p3 : Integer;
const p4 : TCharSet): Boolean;
var
__p2 : ^TPoint;
__i2 : IDispatch;
begin
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
result := SearchinStrings(p0,p1,__p2^,p3,p4);
end;

procedure ____TemplatesFromArray__Wrapper(p0 : TMemoCodeTemplates;
const p1 : IDispatch);
var
__p1 : ^TTemplateRec;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
TemplatesFromArray(p0,__p1^);
end;

function ____ReadIntegerDialog__Wrapper(const p0 : string;
const p1 : string;
p2 : Integer;
p3 : TObject;
const p4 : IDispatch;
var p5 : Integer): Boolean;
var
__p4 : ^TMethod;
__i4 : IDispatch;
begin
if p4 = nil then exit;
__p4 := (p4 as IDCRecordWrapper).GetRecordPtr;
result := ReadIntegerDialog(p0,p1,p2,p3,__p4^,p5);
end;

function __TCustomMemoSource__MemoNotify__Wrapper(__Instance : TCustomMemoSource;
p0 : TObject;
const p1 : IDispatch): Boolean;
var
__p1 : ^TMessage;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
result := __TCustomMemoSource__(__Instance).MemoNotify(p0,__p1^);
end;

function __TCustomMemoSource__PointToSelPoint__Wrapper(__Instance : TCustomMemoSource;
const p0 : IDispatch): IDispatch;
var
__result : TPoint;
__wrapper : __TPoint__Wrapper;
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
__result := TCustomMemoSource(__Instance).PointToSelPoint(__p0^);
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function __TCustomMemoSource__SelPointToPoint__Wrapper(__Instance : TCustomMemoSource;
const p0 : IDispatch): IDispatch;
var
__result : TPoint;
__wrapper : __TPoint__Wrapper;
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
__result := TCustomMemoSource(__Instance).SelPointToPoint(__p0^);
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function __TCustomMemoSource__GetCaretPoint__Wrapper(__Instance : TCustomMemoSource): IDispatch;
var
__result : TPoint;
__wrapper : __TPoint__Wrapper;
begin
__result := TCustomMemoSource(__Instance).GetCaretPoint;
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

procedure __TCustomMemoSource__SetCaretPoint__Wrapper(__Instance : TCustomMemoSource;
const p0 : IDispatch);
var
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TCustomMemoSource(__Instance).SetCaretPoint(__p0^);
end;

function __TCustomMemoSource__FindCloseBracket__Wrapper(__Instance : TCustomMemoSource;
p0 : Char;
p1 : Boolean;
const p2 : IDispatch): Boolean;
var
__p2 : ^TPoint;
__i2 : IDispatch;
begin
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
result := TCustomMemoSource(__Instance).FindCloseBracket(p0,p1,__p2^);
end;

function __TCustomMemoSource__FindOpenBracket__Wrapper(__Instance : TCustomMemoSource;
p0 : Char;
p1 : Boolean;
const p2 : IDispatch): Boolean;
var
__p2 : ^TPoint;
__i2 : IDispatch;
begin
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
result := TCustomMemoSource(__Instance).FindOpenBracket(p0,p1,__p2^);
end;

function __TCustomMemoSource__FindBookMark__Wrapper(__Instance : TCustomMemoSource;
p0 : TBookMarkNumber;
const p1 : IDispatch): Boolean;
var
__p1 : ^TPoint;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
result := TCustomMemoSource(__Instance).FindBookMark(p0,__p1^);
end;

function __TCustomMemoSource__CorrectCharUnderCursor__Wrapper(__Instance : TCustomMemoSource;
const p0 : IDispatch): Char;
var
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := TCustomMemoSource(__Instance).CorrectCharUnderCursor(__p0^);
end;


type __TBookMarkRec__Wrapper__ = class(__TBookMarkRec__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TBookMarkRec__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTBookMarkRecToVariant(var R : TBookMarkRec) : OleVariant;
var
__rw : __TBookMarkRec__Wrapper__;
begin
__rw := __TBookMarkRec__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTBookMarkRec(const V : OleVariant) : TBookMarkRec;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TBookMarkRec((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TMessage__Wrapper__ = class(__TMessage__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TMessage__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTMessageToVariant(var R : TMessage) : OleVariant;
var
__rw : __TMessage__Wrapper__;
begin
__rw := __TMessage__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTMessage(const V : OleVariant) : TMessage;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TMessage((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TMethod__Wrapper__ = class(__TMethod__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TMethod__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTMethodToVariant(var R : TMethod) : OleVariant;
var
__rw : __TMethod__Wrapper__;
begin
__rw := __TMethod__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTMethod(const V : OleVariant) : TMethod;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TMethod((_idisp as IDCRecordWrapper).GetRecordPtr^);
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

type __TRect__Wrapper__ = class(__TRect__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TRect__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTRectToVariant(var R : TRect) : OleVariant;
var
__rw : __TRect__Wrapper__;
begin
__rw := __TRect__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTRect(const V : OleVariant) : TRect;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TRect((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TTemplateRec__Wrapper__ = class(__TTemplateRec__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TTemplateRec__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTTemplateRecToVariant(var R : TTemplateRec) : OleVariant;
var
__rw : __TTemplateRec__Wrapper__;
begin
__rw := __TTemplateRec__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTTemplateRec(const V : OleVariant) : TTemplateRec;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TTemplateRec((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TUndoRecord__Wrapper__ = class(__TUndoRecord__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TUndoRecord__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTUndoRecordToVariant(var R : TUndoRecord) : OleVariant;
var
__rw : __TUndoRecord__Wrapper__;
begin
__rw := __TUndoRecord__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTUndoRecord(const V : OleVariant) : TUndoRecord;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TUndoRecord((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTCustomMemoSource__LeaveSpacesAndTabs(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).LeaveSpacesAndTabs;
end;

procedure __DC__SetTCustomMemoSource__LeaveSpacesAndTabs(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).LeaveSpacesAndTabs:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__ActiveMemo(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomMemoSource(Instance).ActiveMemo);
end;

procedure __DC__SetTCustomMemoSource__ActiveMemo(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).ActiveMemo:=TWinControl(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomMemoSource__BookMark(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).BookMark[OleVariant(Params^[0])];
end;

procedure __DC__SetTCustomMemoSource__BookMark(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).BookMark[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__LineTextStyle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).LineTextStyle[OleVariant(Params^[0])];
end;

procedure __DC__SetTCustomMemoSource__LineTextStyle(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).LineTextStyle[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__LineReadOnly(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).LineReadOnly[OleVariant(Params^[0])];
end;

procedure __DC__SetTCustomMemoSource__LineReadOnly(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).LineReadOnly[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__LineVisible(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).LineVisible[OleVariant(Params^[0])];
end;

procedure __DC__SetTCustomMemoSource__LineVisible(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).LineVisible[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__CollapseState(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).CollapseState[OleVariant(Params^[0])];
end;

procedure __DC__SetTCustomMemoSource__CollapseState(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).CollapseState[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__Strings(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomMemoSource(Instance).Strings);
end;

procedure __DC__SetTCustomMemoSource__Strings(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).Strings:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomMemoSource__CurCharPos(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).CurCharPos;
end;

procedure __DC__SetTCustomMemoSource__CurCharPos(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).CurCharPos:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__CurLinePos(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).CurLinePos;
end;

procedure __DC__SetTCustomMemoSource__CurLinePos(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).CurLinePos:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__SelectionRect(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TRect__Wrapper;
begin
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := TCustomMemoSource(Instance).SelectionRect;
result := IUnknown(__wrapper) as IDispatch;
end;

procedure __DC__SetTCustomMemoSource__SelectionRect(Instance : TObject; Params : PVariantArgList);
var
__idisp:IDispatch;
__iwrapper:IDCRecordWrapper;
begin
__idisp:=DCVarToInterface(OleVariant(Params^[0]));
if __idisp=nil then exit;
__idisp.QueryInterface(IDCRecordWrapper, __iwrapper);
TCustomMemoSource(Instance).SelectionRect:=TRect(__iwrapper.GetRecordPtr^);
end;

function __DC__GetTCustomMemoSource__StrCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).StrCount;
end;

function __DC__GetTCustomMemoSource__State(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TMemoStates;
begin
tmp := TCustomMemoSource(Instance).State;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTCustomMemoSource__State(Instance : TObject; Params : PVariantArgList);
var
  tmp : TMemoStates;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TCustomMemoSource(Instance).State:=tmp;
end;

function __DC__GetTCustomMemoSource__FirstChanged(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).FirstChanged;
end;

function __DC__GetTCustomMemoSource__LastChanged(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).LastChanged;
end;

function __DC__GetTCustomMemoSource__SelectionType(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).SelectionType;
end;

procedure __DC__SetTCustomMemoSource__SelectionType(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).SelectionType:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__ImageBit(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).ImageBit[OleVariant(Params^[1]), OleVariant(Params^[0])];
end;

procedure __DC__SetTCustomMemoSource__ImageBit(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).ImageBit[OleVariant(Params^[2]), OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__Modified(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).Modified;
end;

procedure __DC__SetTCustomMemoSource__Modified(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).Modified:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__Editors(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomMemoSource(Instance).Editors);
end;

function __DC__GetTCustomMemoSource__Overwrite(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).Overwrite;
end;

procedure __DC__SetTCustomMemoSource__Overwrite(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).Overwrite:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__SelStrings(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomMemoSource(Instance).SelStrings);
end;

function __DC__GetTCustomMemoSource__TextAtCursor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).TextAtCursor;
end;

function __DC__GetTCustomMemoSource__DelimSet(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TCharSet;
begin
tmp := TCustomMemoSource(Instance).DelimSet;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTCustomMemoSource__DelimSet(Instance : TObject; Params : PVariantArgList);
var
  tmp : TCharSet;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TCustomMemoSource(Instance).DelimSet:=tmp;
end;

function __DC__GetTCustomMemoSource__CaretPoint(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TPoint__Wrapper;
begin
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := TCustomMemoSource(Instance).CaretPoint;
result := IUnknown(__wrapper) as IDispatch;
end;

procedure __DC__SetTCustomMemoSource__CaretPoint(Instance : TObject; Params : PVariantArgList);
var
__idisp:IDispatch;
__iwrapper:IDCRecordWrapper;
begin
__idisp:=DCVarToInterface(OleVariant(Params^[0]));
if __idisp=nil then exit;
__idisp.QueryInterface(IDCRecordWrapper, __iwrapper);
TCustomMemoSource(Instance).CaretPoint:=TPoint(__iwrapper.GetRecordPtr^);
end;

function __DC__GetTCustomMemoSource__FoundRect(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TRect__Wrapper;
begin
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := TCustomMemoSource(Instance).FoundRect;
result := IUnknown(__wrapper) as IDispatch;
end;

procedure __DC__SetTCustomMemoSource__FoundRect(Instance : TObject; Params : PVariantArgList);
var
__idisp:IDispatch;
__iwrapper:IDCRecordWrapper;
begin
__idisp:=DCVarToInterface(OleVariant(Params^[0]));
if __idisp=nil then exit;
__idisp.QueryInterface(IDCRecordWrapper, __iwrapper);
TCustomMemoSource(Instance).FoundRect:=TRect(__iwrapper.GetRecordPtr^);
end;

function __DC__GetTCustomMemoSource__SearchOptions(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomMemoSource(Instance).SearchOptions);
end;

procedure __DC__SetTCustomMemoSource__SearchOptions(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).SearchOptions:=TSearchOptions(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomMemoSource__ObjectName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).ObjectName;
end;

procedure __DC__SetTCustomMemoSource__ObjectName(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).ObjectName:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__OldObjectName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).OldObjectName;
end;

function __DC__GetTCustomMemoSource__ShortObjectName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).ShortObjectName;
end;

function __DC__GetTCustomMemoSource__Options(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TStringsOptions;
begin
tmp := TCustomMemoSource(Instance).Options;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTCustomMemoSource__Options(Instance : TObject; Params : PVariantArgList);
var
  tmp : TStringsOptions;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TCustomMemoSource(Instance).Options:=tmp;
end;

function __DC__GetTCustomMemoSource__SyntaxParser(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomMemoSource(Instance).SyntaxParser);
end;

procedure __DC__SetTCustomMemoSource__SyntaxParser(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).SyntaxParser:=TSimpleParser(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomMemoSource__TabStops(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).TabStops;
end;

procedure __DC__SetTCustomMemoSource__TabStops(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).TabStops:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__Delimeters(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).Delimeters;
end;

procedure __DC__SetTCustomMemoSource__Delimeters(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).Delimeters:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__Lines(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomMemoSource(Instance).Lines);
end;

procedure __DC__SetTCustomMemoSource__Lines(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).Lines:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomMemoSource__ReadOnly(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).ReadOnly;
end;

procedure __DC__SetTCustomMemoSource__ReadOnly(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).ReadOnly:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__BlockIndent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).BlockIndent;
end;

procedure __DC__SetTCustomMemoSource__BlockIndent(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).BlockIndent:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__SpacesInTab(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).SpacesInTab;
end;

procedure __DC__SetTCustomMemoSource__SpacesInTab(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).SpacesInTab:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__UseGlobalOptions(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).UseGlobalOptions;
end;

procedure __DC__SetTCustomMemoSource__UseGlobalOptions(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).UseGlobalOptions:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__CodeTemplates(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomMemoSource(Instance).CodeTemplates);
end;

procedure __DC__SetTCustomMemoSource__CodeTemplates(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).CodeTemplates:=TMemoCodeTemplates(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomMemoSource__TemplatesType(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).TemplatesType;
end;

procedure __DC__SetTCustomMemoSource__TemplatesType(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).TemplatesType:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__HighlightUrls(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).HighlightUrls;
end;

procedure __DC__SetTCustomMemoSource__HighlightUrls(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).HighlightUrls:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__BlockOption(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).BlockOption;
end;

procedure __DC__SetTCustomMemoSource__BlockOption(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).BlockOption:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__OutFormat(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).OutFormat;
end;

procedure __DC__SetTCustomMemoSource__OutFormat(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).OutFormat:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__AllowUndo(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).AllowUndo;
end;

procedure __DC__SetTCustomMemoSource__AllowUndo(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).AllowUndo:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__UndoLimit(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).UndoLimit;
end;

procedure __DC__SetTCustomMemoSource__UndoLimit(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).UndoLimit:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMemoSource__MaxLineLen(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).MaxLineLen;
end;

function __DC__GetTCustomMemoSource__QuickLoad(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMemoSource(Instance).QuickLoad;
end;

procedure __DC__SetTCustomMemoSource__QuickLoad(Instance : TObject; Params : PVariantArgList);
begin
TCustomMemoSource(Instance).QuickLoad:=OleVariant(Params^[0]);
end;

function __DC__GetTMemoCodeTemplates__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TMemoCodeTemplates(Instance).Items[OleVariant(Params^[0])]);
end;

procedure __DC__SetTMemoCodeTemplates__Items(Instance : TObject; Params : PVariantArgList);
begin
TMemoCodeTemplates(Instance).Items[OleVariant(Params^[1])]:=TMemoCodeTemplate(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTSearchOptions__DisplayTextToFind(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TSearchOptions(Instance).DisplayTextToFind;
end;

function __DC__GetTStringItem__StrData(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStringItem(Instance).StrData;
end;

procedure __DC__SetTStringItem__StrData(Instance : TObject; Params : PVariantArgList);
begin
TStringItem(Instance).StrData:=OleVariant(Params^[0]);
end;

function __DC__GetTStringItem__ObjData(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TStringItem(Instance).ObjData);
end;

procedure __DC__SetTStringItem__ObjData(Instance : TObject; Params : PVariantArgList);
begin
TStringItem(Instance).ObjData:=TObject(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTStringItem__ColorData(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStringItem(Instance).ColorData;
end;

procedure __DC__SetTStringItem__ColorData(Instance : TObject; Params : PVariantArgList);
begin
TStringItem(Instance).ColorData:=OleVariant(Params^[0]);
end;

function __DC__GetTStringItem__ParserState(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStringItem(Instance).ParserState;
end;

function __DC__GetTStringItem__BeforeState(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStringItem(Instance).BeforeState;
end;

function __DC__GetTStringItem__ImageBits(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStringItem(Instance).ImageBits;
end;

function __DC__GetTStringItem__ItemState(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TStringItemStates;
begin
tmp := TStringItem(Instance).ItemState;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTStringItem__ItemState(Instance : TObject; Params : PVariantArgList);
var
  tmp : TStringItemStates;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TStringItem(Instance).ItemState:=tmp;
end;

function __DC__GetTStringItem__TextStyle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStringItem(Instance).TextStyle;
end;

procedure __DC__SetTStringItem__TextStyle(Instance : TObject; Params : PVariantArgList);
begin
TStringItem(Instance).TextStyle:=OleVariant(Params^[0]);
end;

function __DC__GetTStringItem__LineHeight(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStringItem(Instance).LineHeight;
end;

procedure __DC__SetTStringItem__LineHeight(Instance : TObject; Params : PVariantArgList);
begin
TStringItem(Instance).LineHeight:=OleVariant(Params^[0]);
end;

function __DC__GetTStringItem__LineWidth(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStringItem(Instance).LineWidth;
end;

procedure __DC__SetTStringItem__LineWidth(Instance : TObject; Params : PVariantArgList);
begin
TStringItem(Instance).LineWidth:=OleVariant(Params^[0]);
end;

function __DC__GetTStringItem__BaseLine(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStringItem(Instance).BaseLine;
end;

procedure __DC__SetTStringItem__BaseLine(Instance : TObject; Params : PVariantArgList);
begin
TStringItem(Instance).BaseLine:=OleVariant(Params^[0]);
end;

function __DC__GetTStringItem__OldString(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStringItem(Instance).OldString;
end;

procedure __DC__SetTStringItem__OldString(Instance : TObject; Params : PVariantArgList);
begin
TStringItem(Instance).OldString:=OleVariant(Params^[0]);
end;

function __DC__GetTVisibleLinesList__LineVisible(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TVisibleLinesList(Instance).LineVisible[OleVariant(Params^[0])];
end;

procedure __DC__SetTVisibleLinesList__LineVisible(Instance : TObject; Params : PVariantArgList);
begin
TVisibleLinesList(Instance).LineVisible[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
RegisterProperty(TCustomMemoSource,'LeaveSpacesAndTabs',__DC__GetTCustomMemoSource__LeaveSpacesAndTabs,__DC__SetTCustomMemoSource__LeaveSpacesAndTabs);
RegisterProperty(TCustomMemoSource,'ActiveMemo',__DC__GetTCustomMemoSource__ActiveMemo,__DC__SetTCustomMemoSource__ActiveMemo);
RegisterIndexedProperty(TCustomMemoSource,'BookMark',1,False,__DC__GetTCustomMemoSource__BookMark,__DC__SetTCustomMemoSource__BookMark);
RegisterIndexedProperty(TCustomMemoSource,'LineTextStyle',1,False,__DC__GetTCustomMemoSource__LineTextStyle,__DC__SetTCustomMemoSource__LineTextStyle);
RegisterIndexedProperty(TCustomMemoSource,'LineReadOnly',1,False,__DC__GetTCustomMemoSource__LineReadOnly,__DC__SetTCustomMemoSource__LineReadOnly);
RegisterIndexedProperty(TCustomMemoSource,'LineVisible',1,False,__DC__GetTCustomMemoSource__LineVisible,__DC__SetTCustomMemoSource__LineVisible);
RegisterIndexedProperty(TCustomMemoSource,'CollapseState',1,False,__DC__GetTCustomMemoSource__CollapseState,__DC__SetTCustomMemoSource__CollapseState);
RegisterProperty(TCustomMemoSource,'Strings',__DC__GetTCustomMemoSource__Strings,__DC__SetTCustomMemoSource__Strings);
RegisterProperty(TCustomMemoSource,'CurCharPos',__DC__GetTCustomMemoSource__CurCharPos,__DC__SetTCustomMemoSource__CurCharPos);
RegisterProperty(TCustomMemoSource,'CurLinePos',__DC__GetTCustomMemoSource__CurLinePos,__DC__SetTCustomMemoSource__CurLinePos);
RegisterProperty(TCustomMemoSource,'SelectionRect',__DC__GetTCustomMemoSource__SelectionRect,__DC__SetTCustomMemoSource__SelectionRect);
RegisterProperty(TCustomMemoSource,'StrCount',__DC__GetTCustomMemoSource__StrCount,nil);
RegisterProperty(TCustomMemoSource,'State',__DC__GetTCustomMemoSource__State,__DC__SetTCustomMemoSource__State);
RegisterProperty(TCustomMemoSource,'FirstChanged',__DC__GetTCustomMemoSource__FirstChanged,nil);
RegisterProperty(TCustomMemoSource,'LastChanged',__DC__GetTCustomMemoSource__LastChanged,nil);
RegisterProperty(TCustomMemoSource,'SelectionType',__DC__GetTCustomMemoSource__SelectionType,__DC__SetTCustomMemoSource__SelectionType);
RegisterIndexedProperty(TCustomMemoSource,'ImageBit',2,False,__DC__GetTCustomMemoSource__ImageBit,__DC__SetTCustomMemoSource__ImageBit);
RegisterProperty(TCustomMemoSource,'Modified',__DC__GetTCustomMemoSource__Modified,__DC__SetTCustomMemoSource__Modified);
RegisterProperty(TCustomMemoSource,'Editors',__DC__GetTCustomMemoSource__Editors,nil);
RegisterProperty(TCustomMemoSource,'Overwrite',__DC__GetTCustomMemoSource__Overwrite,__DC__SetTCustomMemoSource__Overwrite);
RegisterProperty(TCustomMemoSource,'SelStrings',__DC__GetTCustomMemoSource__SelStrings,nil);
RegisterProperty(TCustomMemoSource,'TextAtCursor',__DC__GetTCustomMemoSource__TextAtCursor,nil);
RegisterProperty(TCustomMemoSource,'DelimSet',__DC__GetTCustomMemoSource__DelimSet,__DC__SetTCustomMemoSource__DelimSet);
RegisterProperty(TCustomMemoSource,'CaretPoint',__DC__GetTCustomMemoSource__CaretPoint,__DC__SetTCustomMemoSource__CaretPoint);
RegisterProperty(TCustomMemoSource,'FoundRect',__DC__GetTCustomMemoSource__FoundRect,__DC__SetTCustomMemoSource__FoundRect);
RegisterProperty(TCustomMemoSource,'SearchOptions',__DC__GetTCustomMemoSource__SearchOptions,__DC__SetTCustomMemoSource__SearchOptions);
RegisterProperty(TCustomMemoSource,'ObjectName',__DC__GetTCustomMemoSource__ObjectName,__DC__SetTCustomMemoSource__ObjectName);
RegisterProperty(TCustomMemoSource,'OldObjectName',__DC__GetTCustomMemoSource__OldObjectName,nil);
RegisterProperty(TCustomMemoSource,'ShortObjectName',__DC__GetTCustomMemoSource__ShortObjectName,nil);
RegisterProperty(TCustomMemoSource,'Options',__DC__GetTCustomMemoSource__Options,__DC__SetTCustomMemoSource__Options);
RegisterProperty(TCustomMemoSource,'SyntaxParser',__DC__GetTCustomMemoSource__SyntaxParser,__DC__SetTCustomMemoSource__SyntaxParser);
RegisterProperty(TCustomMemoSource,'TabStops',__DC__GetTCustomMemoSource__TabStops,__DC__SetTCustomMemoSource__TabStops);
RegisterProperty(TCustomMemoSource,'Delimeters',__DC__GetTCustomMemoSource__Delimeters,__DC__SetTCustomMemoSource__Delimeters);
RegisterProperty(TCustomMemoSource,'Lines',__DC__GetTCustomMemoSource__Lines,__DC__SetTCustomMemoSource__Lines);
RegisterProperty(TCustomMemoSource,'ReadOnly',__DC__GetTCustomMemoSource__ReadOnly,__DC__SetTCustomMemoSource__ReadOnly);
RegisterProperty(TCustomMemoSource,'BlockIndent',__DC__GetTCustomMemoSource__BlockIndent,__DC__SetTCustomMemoSource__BlockIndent);
RegisterProperty(TCustomMemoSource,'SpacesInTab',__DC__GetTCustomMemoSource__SpacesInTab,__DC__SetTCustomMemoSource__SpacesInTab);
RegisterProperty(TCustomMemoSource,'UseGlobalOptions',__DC__GetTCustomMemoSource__UseGlobalOptions,__DC__SetTCustomMemoSource__UseGlobalOptions);
RegisterProperty(TCustomMemoSource,'CodeTemplates',__DC__GetTCustomMemoSource__CodeTemplates,__DC__SetTCustomMemoSource__CodeTemplates);
RegisterProperty(TCustomMemoSource,'TemplatesType',__DC__GetTCustomMemoSource__TemplatesType,__DC__SetTCustomMemoSource__TemplatesType);
RegisterProperty(TCustomMemoSource,'HighlightUrls',__DC__GetTCustomMemoSource__HighlightUrls,__DC__SetTCustomMemoSource__HighlightUrls);
RegisterProperty(TCustomMemoSource,'BlockOption',__DC__GetTCustomMemoSource__BlockOption,__DC__SetTCustomMemoSource__BlockOption);
RegisterProperty(TCustomMemoSource,'OutFormat',__DC__GetTCustomMemoSource__OutFormat,__DC__SetTCustomMemoSource__OutFormat);
RegisterProperty(TCustomMemoSource,'AllowUndo',__DC__GetTCustomMemoSource__AllowUndo,__DC__SetTCustomMemoSource__AllowUndo);
RegisterProperty(TCustomMemoSource,'UndoLimit',__DC__GetTCustomMemoSource__UndoLimit,__DC__SetTCustomMemoSource__UndoLimit);
RegisterProperty(TCustomMemoSource,'MaxLineLen',__DC__GetTCustomMemoSource__MaxLineLen,nil);
RegisterProperty(TCustomMemoSource,'QuickLoad',__DC__GetTCustomMemoSource__QuickLoad,__DC__SetTCustomMemoSource__QuickLoad);
RegisterIndexedProperty(TMemoCodeTemplates,'Items',1,False,__DC__GetTMemoCodeTemplates__Items,__DC__SetTMemoCodeTemplates__Items);
RegisterProperty(TSearchOptions,'DisplayTextToFind',__DC__GetTSearchOptions__DisplayTextToFind,nil);
RegisterProperty(TStringItem,'StrData',__DC__GetTStringItem__StrData,__DC__SetTStringItem__StrData);
RegisterProperty(TStringItem,'ObjData',__DC__GetTStringItem__ObjData,__DC__SetTStringItem__ObjData);
RegisterProperty(TStringItem,'ColorData',__DC__GetTStringItem__ColorData,__DC__SetTStringItem__ColorData);
RegisterProperty(TStringItem,'ParserState',__DC__GetTStringItem__ParserState,nil);
RegisterProperty(TStringItem,'BeforeState',__DC__GetTStringItem__BeforeState,nil);
RegisterProperty(TStringItem,'ImageBits',__DC__GetTStringItem__ImageBits,nil);
RegisterProperty(TStringItem,'ItemState',__DC__GetTStringItem__ItemState,__DC__SetTStringItem__ItemState);
RegisterProperty(TStringItem,'TextStyle',__DC__GetTStringItem__TextStyle,__DC__SetTStringItem__TextStyle);
RegisterProperty(TStringItem,'LineHeight',__DC__GetTStringItem__LineHeight,__DC__SetTStringItem__LineHeight);
RegisterProperty(TStringItem,'LineWidth',__DC__GetTStringItem__LineWidth,__DC__SetTStringItem__LineWidth);
RegisterProperty(TStringItem,'BaseLine',__DC__GetTStringItem__BaseLine,__DC__SetTStringItem__BaseLine);
RegisterProperty(TStringItem,'OldString',__DC__GetTStringItem__OldString,__DC__SetTStringItem__OldString);
RegisterIndexedProperty(TVisibleLinesList,'LineVisible',1,False,__DC__GetTVisibleLinesList__LineVisible,__DC__SetTVisibleLinesList__LineVisible);
end;

function __DC__Getdcstring__FLastSource(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(dcstring.FLastSource);
end;

procedure __DC__Setdcstring__FLastSource(Instance : TObject; Params : PVariantArgList);
begin
TObject(dcstring.FLastSource):=(VarToObject(OleVariant(Params^[0])));
end;

function __DC__Getdcstring__ModalSearchAndReplace(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := dcstring.ModalSearchAndReplace;
end;

procedure __DC__Setdcstring__ModalSearchAndReplace(Instance : TObject; Params : PVariantArgList);
begin
dcstring.ModalSearchAndReplace:=OleVariant(Params^[0]);
end;

var __RegisteredVars : TList;
procedure __RegisterVars;
begin
__RegisteredVars := TList.Create;
__RegisteredVars.Add(RegisterVar('FLastSource',__DC__Getdcstring__FLastSource,__DC__Setdcstring__FLastSource));
__RegisteredVars.Add(RegisterVar('ModalSearchAndReplace',__DC__Getdcstring__ModalSearchAndReplace,__DC__Setdcstring__ModalSearchAndReplace));
end;

procedure __UnregisterVars;
begin
__RegisteredVars.Free;
end;

const __ConstNames0 : array[0..149] of string = (
'acNavigate'
,'acJoinLines'
,'acBreakLine'
,'acInsert'
,'acDeleteRight'
,'acDeleteCharLeft'
,'acDeleteLine'
,'acDeleteToLineBegin'
,'acMarkBlockBegin'
,'acMarkBlockEnd'
,'acSetSelType'
,'acSetBlockAsLineBlock'
,'acSetBlockAsColBlock'
,'acUnivMark'
,'acSetSelRect'
,'acSelectAll'
,'acMarkLine'
,'acCutBlock'
,'acPasteBlock'
,'acDeleteBlock'
,'acMoveBlock'
,'acUppercaseLine'
,'acUpperCaseBlock'
,'acLowerCaseBlock'
,'acToggleBlockCase'
,'acLowerCaseLine'
,'acToggleLineCase'
,'acMarkWord'
,'acSetSelection'
,'acDeleteWord'
,'acDeleteWordRight'
,'acDeleteWordLeft'
,'acLowerCaseWord'
,'acUpperCaseWord'
,'acToggleWordCase'
,'acChangeBlockTo'
,'acInsertString'
,'acPressEnter'
,'acInsState'
,'acMouseDown'
,'acMouseMark'
,'acCancelDragging'
,'acSetBookmark'
,'acClearBookmark'
,'acResetPositions'
,'acLoadFromStrings'
,'acChangeModified'
,'acRegisterNotifier'
,'acCodeDesigner'
,'acPressTab'
,'acSetImageBit'
,'acReplace'
,'acFind'
,'acObjNameChanged'
,'acParserChanged'
,'acClear'
,'acPutString'
,'acStringsUpdate'
,'acLoaded'
,'acCapitalizeWord'
,'acCapitalizeLine'
,'acCapitalizeBlock'
,'acIndentBlock'
,'acOutdentBlock'
,'acQuoteBlock'
,'acChangeLineColor'
,'acDuplicateBlock'
,'acReadonlyChanged'
,'acLineChanged'
,'acImportRtf'
,'acItemStateChanged'
,'cfStreamSel'
,'cfBlockSel'
,'ofWindows'
,'ofMac'
,'ofUnix'
,'soNavigate'
,'soInsert'
,'soBreakLine'
,'soJoinLines'
,'soDeleteRight'
,'soUpdateColorData'
,'sdForward'
,'sdBackward'
,'ssGlobal'
,'ssSelectedText'
,'soFromCursor'
,'soEntireScope'
,'swProjectFiles'
,'swOpenFiles'
,'swDirectories'
,'swOther'
,'msPositionChanged'
,'msEdited'
,'msUndo'
,'msBlockChanged'
,'msInsState'
,'msCountChanged'
,'msModifiedChanged'
,'msFoundRectChanged'
,'msObjNameChanged'
,'msNeedInvalidate'
,'msParserChanged'
,'msReadOnlyChanged'
,'soBackUnindents'
,'soGroupUndo'
,'soBeyondFileEnd'
,'soForceCutCopy'
,'soAutoIndent'
,'soSmartTab'
,'soFindTextAtCursor'
,'soCreateBackups'
,'soPersistentBlocks'
,'soOverwriteBlocks'
,'soLimitEOL'
,'soUseTabCharacter'
,'soCursorOnTabs'
,'soOptimalFill'
,'soSelectFoundText'
,'soExcludeReadOnlyLines'
,'soCursorAlwaysOnTabs'
,'soUsePrevIndent'
,'soRetainColumn'
,'bkStreamSel'
,'bkBlockSel'
,'bkNone'
,'bkBoth'
,'stNotSelected'
,'stStreamSel'
,'stBlockSel'
,'wsWordOnly'
,'wsWordWithSpace'
,'wsUntilNextWord'
,'isWasParsed'
,'isReadOnly'
,'isHidden'
,'isExpanded'
,'isCollapsed'
,'csCollapsed'
,'csExpanded'
,'csNone'
,'ClipSelType'
,'msAllChanged'
,'cDefaultOptions'
,'tokUrl'
,'tokString'
,'tokComment'
,'cFloatDelta'
,'cMaxWrapDelta'
,'cdInsertWithData'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,acNavigate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,acJoinLines));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,acBreakLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,acInsert));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,acDeleteRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,acDeleteCharLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,acDeleteLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,acDeleteToLineBegin));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,acMarkBlockBegin));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,acMarkBlockEnd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,acSetSelType));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,acSetBlockAsLineBlock));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,acSetBlockAsColBlock));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,acUnivMark));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,acSetSelRect));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,acSelectAll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,acMarkLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,acCutBlock));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,acPasteBlock));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,acDeleteBlock));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,acMoveBlock));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,acUppercaseLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,acUpperCaseBlock));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,acLowerCaseBlock));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,acToggleBlockCase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,acLowerCaseLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,acToggleLineCase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,acMarkWord));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,acSetSelection));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,acDeleteWord));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,acDeleteWordRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,acDeleteWordLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,acLowerCaseWord));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,acUpperCaseWord));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,acToggleWordCase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,acChangeBlockTo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,acInsertString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,acPressEnter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,acInsState));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,acMouseDown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,acMouseMark));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,acCancelDragging));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,acSetBookmark));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,acClearBookmark));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,acResetPositions));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,acLoadFromStrings));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,acChangeModified));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,acRegisterNotifier));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[48] ,acCodeDesigner));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[49] ,acPressTab));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[50] ,acSetImageBit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[51] ,acReplace));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[52] ,acFind));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[53] ,acObjNameChanged));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[54] ,acParserChanged));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[55] ,acClear));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[56] ,acPutString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[57] ,acStringsUpdate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[58] ,acLoaded));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[59] ,acCapitalizeWord));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[60] ,acCapitalizeLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[61] ,acCapitalizeBlock));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[62] ,acIndentBlock));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[63] ,acOutdentBlock));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[64] ,acQuoteBlock));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[65] ,acChangeLineColor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[66] ,acDuplicateBlock));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[67] ,acReadonlyChanged));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[68] ,acLineChanged));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[69] ,acImportRtf));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[70] ,acItemStateChanged));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[71] ,cfStreamSel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[72] ,cfBlockSel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[73] ,ofWindows));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[74] ,ofMac));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[75] ,ofUnix));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[76] ,soNavigate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[77] ,soInsert));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[78] ,soBreakLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[79] ,soJoinLines));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[80] ,soDeleteRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[81] ,soUpdateColorData));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[82] ,sdForward));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[83] ,sdBackward));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[84] ,ssGlobal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[85] ,ssSelectedText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[86] ,soFromCursor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[87] ,soEntireScope));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[88] ,swProjectFiles));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[89] ,swOpenFiles));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[90] ,swDirectories));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[91] ,swOther));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[92] ,msPositionChanged));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[93] ,msEdited));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[94] ,msUndo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[95] ,msBlockChanged));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[96] ,msInsState));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[97] ,msCountChanged));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[98] ,msModifiedChanged));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[99] ,msFoundRectChanged));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[100] ,msObjNameChanged));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[101] ,msNeedInvalidate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[102] ,msParserChanged));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[103] ,msReadOnlyChanged));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[104] ,soBackUnindents));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[105] ,soGroupUndo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[106] ,soBeyondFileEnd));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[107] ,soForceCutCopy));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[108] ,soAutoIndent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[109] ,soSmartTab));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[110] ,soFindTextAtCursor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[111] ,soCreateBackups));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[112] ,soPersistentBlocks));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[113] ,soOverwriteBlocks));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[114] ,soLimitEOL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[115] ,soUseTabCharacter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[116] ,soCursorOnTabs));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[117] ,soOptimalFill));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[118] ,soSelectFoundText));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[119] ,soExcludeReadOnlyLines));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[120] ,soCursorAlwaysOnTabs));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[121] ,soUsePrevIndent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[122] ,soRetainColumn));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[123] ,bkStreamSel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[124] ,bkBlockSel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[125] ,bkNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[126] ,bkBoth));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[127] ,stNotSelected));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[128] ,stStreamSel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[129] ,stBlockSel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[130] ,wsWordOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[131] ,wsWordWithSpace));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[132] ,wsUntilNextWord));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[133] ,isWasParsed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[134] ,isReadOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[135] ,isHidden));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[136] ,isExpanded));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[137] ,isCollapsed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[138] ,csCollapsed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[139] ,csExpanded));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[140] ,csNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[141] ,ClipSelType));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[142] ,VarFromSet(msAllChanged, sizeof(msAllChanged))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[143] ,VarFromSet(cDefaultOptions, sizeof(cDefaultOptions))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[144] ,tokUrl));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[145] ,tokString));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[146] ,tokComment));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[147] ,cFloatDelta));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[148] ,cMaxWrapDelta));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[149] ,cdInsertWithData));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..13] of TClass = (
TClipBoardSource,
TClipbrdMemoSource,
TCustomMemoSource,
TMemoBookMarkList,
TMemoCodeTemplate,
TMemoCodeTemplates,
TMemoPositionList,
TMemoSource,
TMemoSourceOptions,
TPosition,
TSearchOptions,
TStringItem,
TUndoList,
TVisibleLinesList
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..30] of string = (
'TBookMarkRec'
,'TTemplateRec'
,'TUndoRecord'
,'SearchinStrings'
,'ExpandTabs'
,'ExpandTabsinStrings'
,'ClipboardToStrings'
,'GetOverwrite'
,'GetSearchOptions'
,'SetClipSelToStream'
,'MemoSourceByName'
,'MemoSources'
,'GlobalMemoSourceOptions'
,'FillWithDelphiTemplates'
,'FillWithCppTemplates'
,'FillWithClipperTemplates'
,'ExpandString'
,'ExpandStrings'
,'TemplatesFromArray'
,'ReadIntegerDialog'
,'_CharToByte'
,'_ByteToChar'
,'_GetStrDisplayIndex'
,'_Length'
,'_Copy'
,'_IsLeadByte'
,'_IsTrailByte'
,'_IsSingleByte'
,'_Delete'
,'_Insert'
,'Register'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TBookMarkRec_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(_TTemplateRec_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[2],Addr(_TUndoRecord_)));
RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T0),[
TypeInfo(TStrings),
TypeInfo(TSearchOptions),
TypeInfo(IDispatch),
TypeInfo(Integer),
TypeInfo(TCharSet),TypeInfo(Boolean)],Addr(____SearchinStrings__Wrapper),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T1),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(string)],Addr(ExpandTabs),cRegister);

RegisterProc(nil,MethodNames[5],mtProc,TypeInfo(_T2),[
TypeInfo(TStrings),
TypeInfo(TStrings),
TypeInfo(Integer)],Addr(ExpandTabsinStrings),cRegister);

RegisterProc(nil,MethodNames[6],mtProc,TypeInfo(_T3),[
TypeInfo(TStrings)],Addr(ClipboardToStrings),cRegister);

RegisterProc(nil,MethodNames[7],mtProc,TypeInfo(_T4),[TypeInfo(Boolean)],Addr(GetOverwrite),cRegister);

RegisterProc(nil,MethodNames[8],mtProc,TypeInfo(_T5),[TypeInfo(TSearchOptions)],Addr(GetSearchOptions),cRegister);

RegisterProc(nil,MethodNames[9],mtProc,TypeInfo(_T6),NoParams,Addr(SetClipSelToStream),cRegister);

RegisterProc(nil,MethodNames[10],mtProc,TypeInfo(_T7),[
TypeInfo(string),TypeInfo(TCustomMemoSource)],Addr(MemoSourceByName),cRegister);

RegisterProc(nil,MethodNames[11],mtProc,TypeInfo(_T8),[TypeInfo(TList)],Addr(MemoSources),cRegister);

RegisterProc(nil,MethodNames[12],mtProc,TypeInfo(_T9),[TypeInfo(TMemoSourceOptions)],Addr(GlobalMemoSourceOptions),cRegister);

RegisterProc(nil,MethodNames[13],mtProc,TypeInfo(_T10),[
TypeInfo(TMemoCodeTemplates)],Addr(FillWithDelphiTemplates),cRegister);

RegisterProc(nil,MethodNames[14],mtProc,TypeInfo(_T11),[
TypeInfo(TMemoCodeTemplates)],Addr(FillWithCppTemplates),cRegister);

RegisterProc(nil,MethodNames[15],mtProc,TypeInfo(_T12),[
TypeInfo(TMemoCodeTemplates)],Addr(FillWithClipperTemplates),cRegister);

RegisterProc(nil,MethodNames[16],mtProc,TypeInfo(_T13),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(string)],Addr(ExpandString),cRegister);

RegisterProc(nil,MethodNames[17],mtProc,TypeInfo(_T14),[
TypeInfo(TStrings),
TypeInfo(Integer),TypeInfo(string)],Addr(ExpandStrings),cRegister);

RegisterProc(nil,MethodNames[18],mtProc,TypeInfo(_T16),[
TypeInfo(TMemoCodeTemplates),
ArrayInfo(TypeInfo(IDispatch))],Addr(____TemplatesFromArray__Wrapper),cRegister);

RegisterProc(nil,MethodNames[19],mtProc,TypeInfo(_T17),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Integer),
TypeInfo(TObject),
TypeInfo(IDispatch),
TypeInfo(Integer),TypeInfo(Boolean)],Addr(____ReadIntegerDialog__Wrapper),cRegister);

RegisterProc(nil,MethodNames[20],mtProc,TypeInfo(_T19),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Integer)],Addr(_CharToByte),cRegister);

RegisterProc(nil,MethodNames[21],mtProc,TypeInfo(_T20),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Integer)],Addr(_ByteToChar),cRegister);

RegisterProc(nil,MethodNames[22],mtProc,TypeInfo(_T21),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Integer)],Addr(_GetStrDisplayIndex),cRegister);

RegisterProc(nil,MethodNames[23],mtProc,TypeInfo(_T22),[
TypeInfo(string),TypeInfo(Integer)],Addr(_Length),cRegister);

RegisterProc(nil,MethodNames[24],mtProc,TypeInfo(_T23),[
TypeInfo(string),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(string)],Addr(_Copy),cRegister);

RegisterProc(nil,MethodNames[25],mtProc,TypeInfo(_T24),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Boolean)],Addr(_IsLeadByte),cRegister);

RegisterProc(nil,MethodNames[26],mtProc,TypeInfo(_T25),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Boolean)],Addr(_IsTrailByte),cRegister);

RegisterProc(nil,MethodNames[27],mtProc,TypeInfo(_T26),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Boolean)],Addr(_IsSingleByte),cRegister);

RegisterProc(nil,MethodNames[28],mtProc,TypeInfo(_T27),[
TypeInfo(string),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(_Delete),cRegister);

RegisterProc(nil,MethodNames[29],mtProc,TypeInfo(_T28),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(Integer)],Addr(_Insert),cRegister);

RegisterProc(nil,MethodNames[30],mtProc,TypeInfo(_T29),NoParams,Addr(Register),cRegister);

RegRegisterMethod(TCustomMemoSource,'DoLoadFromFile',TypeInfo(_T30),[
TypeInfo(string)], pointer(40));

RegRegisterMethod(TCustomMemoSource,'DoSaveToFile',TypeInfo(_T31),[
TypeInfo(string)], pointer(44));

RegRegisterMethod(TCustomMemoSource,'SetObjectName',TypeInfo(_T33),[
TypeInfo(string)], pointer(52));

RegRegisterMethod(TCustomMemoSource,'MemoNotify',TypeInfo(_T34),[
TypeInfo(TObject),
TypeInfo(IDispatch),TypeInfo(Boolean)], pointer(56));

RegRegisterMethod(TCustomMemoSource,'GetReadOnly',TypeInfo(_T35),[TypeInfo(Boolean)], pointer(60));

RegRegisterMethod(TCustomMemoSource,'CheckSelectionType',TypeInfo(_T36),[
TypeInfo(TSelectionType)], pointer(64));

RegRegisterMethod(TCustomMemoSource,'GetStrings',TypeInfo(_T37),[TypeInfo(TStrings)], pointer(68));

RegRegisterMethod(TCustomMemoSource,'GetBackupName',TypeInfo(_T38),[
TypeInfo(string),TypeInfo(string)], pointer(72));

RegRegisterMethod(TCustomMemoSource,'CreateReplaceDialog',TypeInfo(_T39),[TypeInfo(TCustomForm)], pointer(76));

RegRegisterMethod(TCustomMemoSource,'CreateSearchDialog',TypeInfo(_T40),[TypeInfo(TCustomForm)], pointer(80));

RegRegisterMethod(TCustomMemoSource,'CreateNotModalSearchDialog',TypeInfo(_T41),[TypeInfo(TCustomForm)], pointer(84));

RegRegisterMethod(TCustomMemoSource,'HandleSearchException',TypeInfo(_T42),[
TypeInfo(string),TypeInfo(Boolean)], pointer(88));

RegRegisterMethod(TCustomMemoSource,'PasteFromClipboard',TypeInfo(_T43),[
TypeInfo(TStrings)], pointer(92));

RegRegisterMethod(TCustomMemoSource,'ParserOnChange',TypeInfo(_T44),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer)], pointer(96));

RegRegisterMethod(TCustomMemoSource,'SetUseGlobalOptions',TypeInfo(_T45),[
TypeInfo(Boolean)], pointer(100));

RegRegisterMethod(TCustomMemoSource,'SelAttributesUpdated',TypeInfo(_T46),NoParams, pointer(104));

RegRegisterMethod(TCustomMemoSource,'AfterParse',TypeInfo(_T47),[
TypeInfo(Integer),
TypeInfo(string),
TypeInfo(string)], pointer(108));

RegRegisterMethod(TCustomMemoSource,'IsSyntaxParser',TypeInfo(_T48),[TypeInfo(Boolean)], pointer(112));

RegRegisterMethod(TCustomMemoSource,'NotifyEvents',TypeInfo(_T49),[
TypeInfo(Integer),
TypeInfo(Integer)], pointer(116));

RegRegisterMethod(TCustomMemoSource,'BeforeFindReplace',TypeInfo(_T50),[
TypeInfo(Boolean)], pointer(120));

RegRegisterMethod(TCustomMemoSource,'LoadFromProp',TypeInfo(_T51),[
TypeInfo(TPersistent),
TypeInfo(string)],Addr(TCustomMemoSource.LoadFromProp));

RegRegisterMethod(TCustomMemoSource,'SaveToProp',TypeInfo(_T52),[
TypeInfo(TPersistent),
TypeInfo(string)],Addr(TCustomMemoSource.SaveToProp));

RegRegisterMethod(TCustomMemoSource,'CopyBlockToPos',TypeInfo(_T53),[TypeInfo(Boolean)],Addr(TCustomMemoSource.CopyBlockToPos));

RegRegisterMethod(TCustomMemoSource,'TempHighlightLine',TypeInfo(_T54),[
TypeInfo(Integer),
TypeInfo(Byte)], pointer(124));

RegRegisterMethod(TCustomMemoSource,'TempUnhighlightLine',TypeInfo(_T55),NoParams, pointer(128));

RegRegisterMethod(TCustomMemoSource,'CheckOverwriteBlock',TypeInfo(_T58),[TypeInfo(Boolean)],Addr(TCustomMemoSource.CheckOverwriteBlock));

RegRegisterMethod(TCustomMemoSource,'Navigate',TypeInfo(_T59),[
TypeInfo(Integer),
TypeInfo(Integer)], pointer(132));

RegRegisterMethod(TCustomMemoSource,'BreakLine',TypeInfo(_T60),NoParams, pointer(136));

RegRegisterMethod(TCustomMemoSource,'JoinLines',TypeInfo(_T61),NoParams, pointer(140));

RegRegisterMethod(TCustomMemoSource,'Insert',TypeInfo(_T62),[
TypeInfo(string),TypeInfo(Boolean)], pointer(144));

RegRegisterMethod(TCustomMemoSource,'DeleteRight',TypeInfo(_T63),[
TypeInfo(Integer)], pointer(148));

RegRegisterMethod(TCustomMemoSource,'IsValidBlockPos',TypeInfo(_T64),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Boolean)],Addr(TCustomMemoSource.IsValidBlockPos));

RegRegisterMethod(TCustomMemoSource,'SaveWithQuestion',TypeInfo(_T65),[TypeInfo(Boolean)],Addr(TCustomMemoSource.SaveWithQuestion));

RegRegisterMethod(TCustomMemoSource,'ChangeObjectName',TypeInfo(_T66),[
TypeInfo(string),TypeInfo(Boolean)], pointer(152));

RegRegisterMethod(TCustomMemoSource,'ParseToString',TypeInfo(_T67),[
TypeInfo(Integer),
TypeInfo(Boolean),TypeInfo(Integer)],Addr(TCustomMemoSource.ParseToString));

RegRegisterMethod(TCustomMemoSource,'ProcessEscape',TypeInfo(_T68),NoParams, pointer(156));

RegRegisterMethod(TCustomMemoSource,'JumpToChar',TypeInfo(_T69),[
TypeInfo(Integer)],Addr(TCustomMemoSource.JumpToChar));

RegRegisterMethod(TCustomMemoSource,'IsPosInBlock',TypeInfo(_T70),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Boolean)],Addr(TCustomMemoSource.IsPosInBlock));

RegRegisterMethod(TCustomMemoSource,'SelectionBounds',TypeInfo(_T71),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Boolean)],Addr(TCustomMemoSource.SelectionBounds));

RegRegisterMethod(TCustomMemoSource,'JumpToLine',TypeInfo(_T72),[
TypeInfo(Integer)],Addr(TCustomMemoSource.JumpToLine));

RegRegisterMethod(TCustomMemoSource,'ClearUndoBuffer',TypeInfo(_T73),NoParams,Addr(TCustomMemoSource.ClearUndoBuffer));

RegRegisterMethod(TCustomMemoSource,'GetStrAddr',TypeInfo(_T74),[
TypeInfo(Integer),TypeInfoPChar],Addr(TCustomMemoSource.GetStrAddr));

RegRegisterMethod(TCustomMemoSource,'GetColorData',TypeInfo(_T75),[
TypeInfo(Integer),TypeInfo(string)],Addr(TCustomMemoSource.GetColorData));

RegRegisterMethod(TCustomMemoSource,'LoadFromStrings',TypeInfo(_T79),[
TypeInfo(TStrings)],Addr(TCustomMemoSource.LoadFromStrings));

RegRegisterMethod(TCustomMemoSource,'LoadFromStream',TypeInfo(_T80),[
TypeInfo(TStream)],Addr(TCustomMemoSource.LoadFromStream));

RegRegisterMethod(TCustomMemoSource,'LoadFromFile',TypeInfo(_T81),[
TypeInfo(string)],Addr(TCustomMemoSource.LoadFromFile));

RegRegisterMethod(TCustomMemoSource,'QuickLoadFromFile',TypeInfo(_T82),[
TypeInfo(string)],Addr(TCustomMemoSource.QuickLoadFromFile));

RegRegisterMethod(TCustomMemoSource,'AssignLines',TypeInfo(_T83),[
TypeInfo(TStrings),
TypeInfo(Boolean)],Addr(TCustomMemoSource.AssignLines));

RegRegisterMethod(TCustomMemoSource,'SaveToStream',TypeInfo(_T84),[
TypeInfo(TStream)],Addr(TCustomMemoSource.SaveToStream));

RegRegisterMethod(TCustomMemoSource,'SaveToFile',TypeInfo(_T85),[
TypeInfo(string)],Addr(TCustomMemoSource.SaveToFile));

RegRegisterMethod(TCustomMemoSource,'Save',TypeInfo(_T86),[TypeInfo(Boolean)], pointer(160));

RegRegisterMethod(TCustomMemoSource,'BeginUpdate',TypeInfo(_T87),[
TypeInfo(Integer)],Addr(TCustomMemoSource.BeginUpdate));

RegRegisterMethod(TCustomMemoSource,'EndUpdate',TypeInfo(_T88),NoParams, pointer(164));

RegRegisterMethod(TCustomMemoSource,'BeginUndoBlock',TypeInfo(_T89),NoParams,Addr(TCustomMemoSource.BeginUndoBlock));

RegRegisterMethod(TCustomMemoSource,'EndUndoBlock',TypeInfo(_T90),NoParams,Addr(TCustomMemoSource.EndUndoBlock));

RegRegisterMethod(TCustomMemoSource,'BeginSafeUpdate',TypeInfo(_T91),[
TypeInfo(Integer)],Addr(TCustomMemoSource.BeginSafeUpdate));

RegRegisterMethod(TCustomMemoSource,'Undo',TypeInfo(_T92),NoParams,Addr(TCustomMemoSource.Undo));

RegRegisterMethod(TCustomMemoSource,'Redo',TypeInfo(_T93),NoParams,Addr(TCustomMemoSource.Redo));

RegRegisterMethod(TCustomMemoSource,'UndoAvailable',TypeInfo(_T94),[TypeInfo(Boolean)],Addr(TCustomMemoSource.UndoAvailable));

RegRegisterMethod(TCustomMemoSource,'RedoAvailable',TypeInfo(_T95),[TypeInfo(Boolean)],Addr(TCustomMemoSource.RedoAvailable));

RegRegisterMethod(TCustomMemoSource,'PointToSelPoint',TypeInfo(_T96),[
TypeInfo(IDispatch),TypeInfo(IDispatch)],Addr(__TCustomMemoSource__PointToSelPoint__Wrapper));

RegRegisterMethod(TCustomMemoSource,'SelPointToPoint',TypeInfo(_T97),[
TypeInfo(IDispatch),TypeInfo(IDispatch)],Addr(__TCustomMemoSource__SelPointToPoint__Wrapper));

RegRegisterMethod(TCustomMemoSource,'GetCaretPoint',TypeInfo(_T98),[TypeInfo(IDispatch)],Addr(__TCustomMemoSource__GetCaretPoint__Wrapper));

RegRegisterMethod(TCustomMemoSource,'SetCaretPoint',TypeInfo(_T99),[
TypeInfo(IDispatch)],Addr(__TCustomMemoSource__SetCaretPoint__Wrapper));

RegRegisterMethod(TCustomMemoSource,'JumpTo',TypeInfo(_T100),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TCustomMemoSource.JumpTo));

RegRegisterMethod(TCustomMemoSource,'CursorUp',TypeInfo(_T101),NoParams,Addr(TCustomMemoSource.CursorUp));

RegRegisterMethod(TCustomMemoSource,'CursorLeft',TypeInfo(_T102),NoParams,Addr(TCustomMemoSource.CursorLeft));

RegRegisterMethod(TCustomMemoSource,'CursorRight',TypeInfo(_T103),NoParams,Addr(TCustomMemoSource.CursorRight));

RegRegisterMethod(TCustomMemoSource,'TabCursorRight',TypeInfo(_T104),NoParams,Addr(TCustomMemoSource.TabCursorRight));

RegRegisterMethod(TCustomMemoSource,'TabCursorLeft',TypeInfo(_T105),NoParams,Addr(TCustomMemoSource.TabCursorLeft));

RegRegisterMethod(TCustomMemoSource,'CursorDown',TypeInfo(_T106),NoParams,Addr(TCustomMemoSource.CursorDown));

RegRegisterMethod(TCustomMemoSource,'JumpToBlockBegin',TypeInfo(_T107),NoParams,Addr(TCustomMemoSource.JumpToBlockBegin));

RegRegisterMethod(TCustomMemoSource,'JumpToBlockEnd',TypeInfo(_T108),NoParams,Addr(TCustomMemoSource.JumpToBlockEnd));

RegRegisterMethod(TCustomMemoSource,'JumpToFileBegin',TypeInfo(_T109),NoParams,Addr(TCustomMemoSource.JumpToFileBegin));

RegRegisterMethod(TCustomMemoSource,'JumpToFileEnd',TypeInfo(_T110),NoParams,Addr(TCustomMemoSource.JumpToFileEnd));

RegRegisterMethod(TCustomMemoSource,'JumpToLineBegin',TypeInfo(_T111),NoParams,Addr(TCustomMemoSource.JumpToLineBegin));

RegRegisterMethod(TCustomMemoSource,'JumpToLineEnd',TypeInfo(_T112),NoParams,Addr(TCustomMemoSource.JumpToLineEnd));

RegRegisterMethod(TCustomMemoSource,'JumpWordLeft',TypeInfo(_T113),NoParams,Addr(TCustomMemoSource.JumpWordLeft));

RegRegisterMethod(TCustomMemoSource,'JumpWordRight',TypeInfo(_T114),NoParams,Addr(TCustomMemoSource.JumpWordRight));

RegRegisterMethod(TCustomMemoSource,'MarkBlockBegin',TypeInfo(_T115),NoParams,Addr(TCustomMemoSource.MarkBlockBegin));

RegRegisterMethod(TCustomMemoSource,'MarkBlockEnd',TypeInfo(_T116),NoParams,Addr(TCustomMemoSource.MarkBlockEnd));

RegRegisterMethod(TCustomMemoSource,'MarkWord',TypeInfo(_T117),NoParams,Addr(TCustomMemoSource.MarkWord));

RegRegisterMethod(TCustomMemoSource,'MarkLeft',TypeInfo(_T118),NoParams,Addr(TCustomMemoSource.MarkLeft));

RegRegisterMethod(TCustomMemoSource,'MarkRight',TypeInfo(_T119),NoParams,Addr(TCustomMemoSource.MarkRight));

RegRegisterMethod(TCustomMemoSource,'MarkBriefColRight',TypeInfo(_T120),NoParams,Addr(TCustomMemoSource.MarkBriefColRight));

RegRegisterMethod(TCustomMemoSource,'MarkBriefRight',TypeInfo(_T121),NoParams,Addr(TCustomMemoSource.MarkBriefRight));

RegRegisterMethod(TCustomMemoSource,'MarkLine',TypeInfo(_T122),NoParams,Addr(TCustomMemoSource.MarkLine));

RegRegisterMethod(TCustomMemoSource,'MarkUp',TypeInfo(_T123),NoParams,Addr(TCustomMemoSource.MarkUp));

RegRegisterMethod(TCustomMemoSource,'MarkDown',TypeInfo(_T124),NoParams,Addr(TCustomMemoSource.MarkDown));

RegRegisterMethod(TCustomMemoSource,'MarkToLineEnd',TypeInfo(_T125),NoParams,Addr(TCustomMemoSource.MarkToLineEnd));

RegRegisterMethod(TCustomMemoSource,'MarkToLineBegin',TypeInfo(_T126),NoParams,Addr(TCustomMemoSource.MarkToLineBegin));

RegRegisterMethod(TCustomMemoSource,'MarkWordLeft',TypeInfo(_T127),NoParams,Addr(TCustomMemoSource.MarkWordLeft));

RegRegisterMethod(TCustomMemoSource,'MarkWordRight',TypeInfo(_T128),NoParams,Addr(TCustomMemoSource.MarkWordRight));

RegRegisterMethod(TCustomMemoSource,'MarkToFileBegin',TypeInfo(_T129),NoParams,Addr(TCustomMemoSource.MarkToFileBegin));

RegRegisterMethod(TCustomMemoSource,'MarkToFileEnd',TypeInfo(_T130),NoParams,Addr(TCustomMemoSource.MarkToFileEnd));

RegRegisterMethod(TCustomMemoSource,'SelectAll',TypeInfo(_T131),NoParams,Addr(TCustomMemoSource.SelectAll));

RegRegisterMethod(TCustomMemoSource,'MarkWordWithType',TypeInfo(_T132),[
TypeInfo(TWordSelectionType)],Addr(TCustomMemoSource.MarkWordWithType));

RegRegisterMethod(TCustomMemoSource,'MarkColLeft',TypeInfo(_T133),NoParams,Addr(TCustomMemoSource.MarkColLeft));

RegRegisterMethod(TCustomMemoSource,'MarkColRight',TypeInfo(_T134),NoParams,Addr(TCustomMemoSource.MarkColRight));

RegRegisterMethod(TCustomMemoSource,'MarkColUp',TypeInfo(_T135),NoParams,Addr(TCustomMemoSource.MarkColUp));

RegRegisterMethod(TCustomMemoSource,'MarkColDown',TypeInfo(_T136),NoParams,Addr(TCustomMemoSource.MarkColDown));

RegRegisterMethod(TCustomMemoSource,'MarkColToLineEnd',TypeInfo(_T137),NoParams,Addr(TCustomMemoSource.MarkColToLineEnd));

RegRegisterMethod(TCustomMemoSource,'MarkColToLineBegin',TypeInfo(_T138),NoParams,Addr(TCustomMemoSource.MarkColToLineBegin));

RegRegisterMethod(TCustomMemoSource,'MarkColWordLeft',TypeInfo(_T139),NoParams,Addr(TCustomMemoSource.MarkColWordLeft));

RegRegisterMethod(TCustomMemoSource,'MarkColWordRight',TypeInfo(_T140),NoParams,Addr(TCustomMemoSource.MarkColWordRight));

RegRegisterMethod(TCustomMemoSource,'MarkColToFileBegin',TypeInfo(_T141),NoParams,Addr(TCustomMemoSource.MarkColToFileBegin));

RegRegisterMethod(TCustomMemoSource,'MarkColToFileEnd',TypeInfo(_T142),NoParams,Addr(TCustomMemoSource.MarkColToFileEnd));

RegRegisterMethod(TCustomMemoSource,'ClearSelection',TypeInfo(_T143),NoParams,Addr(TCustomMemoSource.ClearSelection));

RegRegisterMethod(TCustomMemoSource,'FindNextBracket',TypeInfo(_T144),NoParams,Addr(TCustomMemoSource.FindNextBracket));

RegRegisterMethod(TCustomMemoSource,'NextBracket',TypeInfo(_T145),NoParams,Addr(TCustomMemoSource.NextBracket));

RegRegisterMethod(TCustomMemoSource,'PrevBracket',TypeInfo(_T146),NoParams,Addr(TCustomMemoSource.PrevBracket));

RegRegisterMethod(TCustomMemoSource,'FindCloseBracket',TypeInfo(_T147),[
TypeInfo(Char),
TypeInfo(Boolean),
TypeInfo(IDispatch),TypeInfo(Boolean)],Addr(__TCustomMemoSource__FindCloseBracket__Wrapper));

RegRegisterMethod(TCustomMemoSource,'FindOpenBracket',TypeInfo(_T148),[
TypeInfo(Char),
TypeInfo(Boolean),
TypeInfo(IDispatch),TypeInfo(Boolean)],Addr(__TCustomMemoSource__FindOpenBracket__Wrapper));

RegRegisterMethod(TCustomMemoSource,'ChangeBlockTo',TypeInfo(_T149),[
TypeInfo(string)],Addr(TCustomMemoSource.ChangeBlockTo));

RegRegisterMethod(TCustomMemoSource,'SetSelection',TypeInfo(_T150),[
TypeInfo(TSelectionType),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TCustomMemoSource.SetSelection));

RegRegisterMethod(TCustomMemoSource,'QuoteBlock',TypeInfo(_T151),NoParams,Addr(TCustomMemoSource.QuoteBlock));

RegRegisterMethod(TCustomMemoSource,'CanPaste',TypeInfo(_T152),[TypeInfo(Boolean)],Addr(TCustomMemoSource.CanPaste));

RegRegisterMethod(TCustomMemoSource,'CanCopy',TypeInfo(_T153),[TypeInfo(Boolean)],Addr(TCustomMemoSource.CanCopy));

RegRegisterMethod(TCustomMemoSource,'CopyBlock',TypeInfo(_T154),NoParams, pointer(168));

RegRegisterMethod(TCustomMemoSource,'CutBlock',TypeInfo(_T155),NoParams, pointer(172));

RegRegisterMethod(TCustomMemoSource,'PasteBlock',TypeInfo(_T156),NoParams, pointer(176));

RegRegisterMethod(TCustomMemoSource,'DeleteBlock',TypeInfo(_T157),NoParams,Addr(TCustomMemoSource.DeleteBlock));

RegRegisterMethod(TCustomMemoSource,'DuplicateBlock',TypeInfo(_T158),NoParams,Addr(TCustomMemoSource.DuplicateBlock));

RegRegisterMethod(TCustomMemoSource,'ReadBlockFromFile',TypeInfo(_T159),[
TypeInfo(string)],Addr(TCustomMemoSource.ReadBlockFromFile));

RegRegisterMethod(TCustomMemoSource,'WriteBlockToFile',TypeInfo(_T160),[
TypeInfo(string)],Addr(TCustomMemoSource.WriteBlockToFile));

RegRegisterMethod(TCustomMemoSource,'ReadBlockFromStream',TypeInfo(_T161),[
TypeInfo(TStream)],Addr(TCustomMemoSource.ReadBlockFromStream));

RegRegisterMethod(TCustomMemoSource,'WriteBlockToStream',TypeInfo(_T162),[
TypeInfo(TStream)],Addr(TCustomMemoSource.WriteBlockToStream));

RegRegisterMethod(TCustomMemoSource,'IndentBlock',TypeInfo(_T163),NoParams,Addr(TCustomMemoSource.IndentBlock));

RegRegisterMethod(TCustomMemoSource,'OutDentBlock',TypeInfo(_T164),NoParams,Addr(TCustomMemoSource.OutDentBlock));

RegRegisterMethod(TCustomMemoSource,'MoveBlock',TypeInfo(_T165),[TypeInfo(Boolean)],Addr(TCustomMemoSource.MoveBlock));

RegRegisterMethod(TCustomMemoSource,'KeyMoveBlock',TypeInfo(_T166),NoParams,Addr(TCustomMemoSource.KeyMoveBlock));

RegRegisterMethod(TCustomMemoSource,'JustifyBlock',TypeInfo(_T167),NoParams,Addr(TCustomMemoSource.JustifyBlock));

RegRegisterMethod(TCustomMemoSource,'JustifyText',TypeInfo(_T168),NoParams,Addr(TCustomMemoSource.JustifyText));

RegRegisterMethod(TCustomMemoSource,'SetBlockAsColBlock',TypeInfo(_T169),NoParams,Addr(TCustomMemoSource.SetBlockAsColBlock));

RegRegisterMethod(TCustomMemoSource,'SetBlockAsLineBlock',TypeInfo(_T170),NoParams,Addr(TCustomMemoSource.SetBlockAsLineBlock));

RegRegisterMethod(TCustomMemoSource,'DeleteCharRight',TypeInfo(_T171),NoParams,Addr(TCustomMemoSource.DeleteCharRight));

RegRegisterMethod(TCustomMemoSource,'DeleteCharLeft',TypeInfo(_T172),NoParams,Addr(TCustomMemoSource.DeleteCharLeft));

RegRegisterMethod(TCustomMemoSource,'DeleteWord',TypeInfo(_T173),NoParams,Addr(TCustomMemoSource.DeleteWord));

RegRegisterMethod(TCustomMemoSource,'Clear',TypeInfo(_T174),NoParams,Addr(TCustomMemoSource.Clear));

RegRegisterMethod(TCustomMemoSource,'DeleteWordRight',TypeInfo(_T175),NoParams,Addr(TCustomMemoSource.DeleteWordRight));

RegRegisterMethod(TCustomMemoSource,'CorrectMarkWordRight',TypeInfo(_T176),NoParams,Addr(TCustomMemoSource.CorrectMarkWordRight));

RegRegisterMethod(TCustomMemoSource,'CorrectDeleteWordRight',TypeInfo(_T177),NoParams,Addr(TCustomMemoSource.CorrectDeleteWordRight));

RegRegisterMethod(TCustomMemoSource,'DeleteWordLeft',TypeInfo(_T178),NoParams,Addr(TCustomMemoSource.DeleteWordLeft));

RegRegisterMethod(TCustomMemoSource,'DeleteLine',TypeInfo(_T179),NoParams,Addr(TCustomMemoSource.DeleteLine));

RegRegisterMethod(TCustomMemoSource,'DeleteToLineBegin',TypeInfo(_T180),NoParams,Addr(TCustomMemoSource.DeleteToLineBegin));

RegRegisterMethod(TCustomMemoSource,'DeleteToLineEnd',TypeInfo(_T181),NoParams,Addr(TCustomMemoSource.DeleteToLineEnd));

RegRegisterMethod(TCustomMemoSource,'InsertStrings',TypeInfo(_T182),[
TypeInfo(TStrings),
TypeInfo(Boolean)],Addr(TCustomMemoSource.InsertStrings));

RegRegisterMethod(TCustomMemoSource,'InsertString',TypeInfo(_T183),[
TypeInfo(string)],Addr(TCustomMemoSource.InsertString));

RegRegisterMethod(TCustomMemoSource,'InsertLine',TypeInfo(_T184),NoParams,Addr(TCustomMemoSource.InsertLine));

RegRegisterMethod(TCustomMemoSource,'PressTab',TypeInfo(_T185),NoParams,Addr(TCustomMemoSource.PressTab));

RegRegisterMethod(TCustomMemoSource,'PressShiftTab',TypeInfo(_T186),NoParams,Addr(TCustomMemoSource.PressShiftTab));

RegRegisterMethod(TCustomMemoSource,'PressEnter',TypeInfo(_T187),NoParams, pointer(180));

RegRegisterMethod(TCustomMemoSource,'ToggleInsMode',TypeInfo(_T188),NoParams,Addr(TCustomMemoSource.ToggleInsMode));

RegRegisterMethod(TCustomMemoSource,'SetInsertMode',TypeInfo(_T189),NoParams,Addr(TCustomMemoSource.SetInsertMode));

RegRegisterMethod(TCustomMemoSource,'SetOverwriteMode',TypeInfo(_T190),NoParams,Addr(TCustomMemoSource.SetOverwriteMode));

RegRegisterMethod(TCustomMemoSource,'InsertDate',TypeInfo(_T191),NoParams,Addr(TCustomMemoSource.InsertDate));

RegRegisterMethod(TCustomMemoSource,'InsertTime',TypeInfo(_T192),NoParams,Addr(TCustomMemoSource.InsertTime));

RegRegisterMethod(TCustomMemoSource,'InsertGUID',TypeInfo(_T193),NoParams,Addr(TCustomMemoSource.InsertGUID));

RegRegisterMethod(TCustomMemoSource,'UpperCaseLine',TypeInfo(_T194),NoParams,Addr(TCustomMemoSource.UpperCaseLine));

RegRegisterMethod(TCustomMemoSource,'LowerCaseLine',TypeInfo(_T195),NoParams,Addr(TCustomMemoSource.LowerCaseLine));

RegRegisterMethod(TCustomMemoSource,'ToggleLineCase',TypeInfo(_T196),NoParams,Addr(TCustomMemoSource.ToggleLineCase));

RegRegisterMethod(TCustomMemoSource,'CapitalizeWord',TypeInfo(_T197),NoParams,Addr(TCustomMemoSource.CapitalizeWord));

RegRegisterMethod(TCustomMemoSource,'CapitalizeLine',TypeInfo(_T198),NoParams,Addr(TCustomMemoSource.CapitalizeLine));

RegRegisterMethod(TCustomMemoSource,'CapitalizeBlock',TypeInfo(_T199),NoParams,Addr(TCustomMemoSource.CapitalizeBlock));

RegRegisterMethod(TCustomMemoSource,'UpperCaseBlock',TypeInfo(_T200),NoParams,Addr(TCustomMemoSource.UpperCaseBlock));

RegRegisterMethod(TCustomMemoSource,'LowerCaseBlock',TypeInfo(_T201),NoParams,Addr(TCustomMemoSource.LowerCaseBlock));

RegRegisterMethod(TCustomMemoSource,'ToggleBlockCase',TypeInfo(_T202),NoParams,Addr(TCustomMemoSource.ToggleBlockCase));

RegRegisterMethod(TCustomMemoSource,'LowerCaseWord',TypeInfo(_T203),NoParams,Addr(TCustomMemoSource.LowerCaseWord));

RegRegisterMethod(TCustomMemoSource,'UpperCaseWord',TypeInfo(_T204),NoParams,Addr(TCustomMemoSource.UpperCaseWord));

RegRegisterMethod(TCustomMemoSource,'ToggleWordCase',TypeInfo(_T205),NoParams,Addr(TCustomMemoSource.ToggleWordCase));

RegRegisterMethod(TCustomMemoSource,'ShowGoToLineDialog',TypeInfo(_T206),NoParams,Addr(TCustomMemoSource.ShowGoToLineDialog));

RegRegisterMethod(TCustomMemoSource,'ShowSearchDialog',TypeInfo(_T207),NoParams, pointer(184));

RegRegisterMethod(TCustomMemoSource,'ShowReplaceDialog',TypeInfo(_T208),NoParams, pointer(188));

RegRegisterMethod(TCustomMemoSource,'KeyFindNext',TypeInfo(_T209),NoParams,Addr(TCustomMemoSource.KeyFindNext));

RegRegisterMethod(TCustomMemoSource,'KeyReplace',TypeInfo(_T210),NoParams,Addr(TCustomMemoSource.KeyReplace));

RegRegisterMethod(TCustomMemoSource,'Find',TypeInfo(_T211),[TypeInfo(Boolean)], pointer(192));

RegRegisterMethod(TCustomMemoSource,'Replace',TypeInfo(_T212),[TypeInfo(Boolean)], pointer(196));

RegRegisterMethod(TCustomMemoSource,'FindNext',TypeInfo(_T213),[TypeInfo(Boolean)], pointer(200));

RegRegisterMethod(TCustomMemoSource,'ToggleCaseSensitiveSearch',TypeInfo(_T214),NoParams,Addr(TCustomMemoSource.ToggleCaseSensitiveSearch));

RegRegisterMethod(TCustomMemoSource,'ToggleRegularExprSearch',TypeInfo(_T215),NoParams,Addr(TCustomMemoSource.ToggleRegularExprSearch));

RegRegisterMethod(TCustomMemoSource,'ClearBookMark',TypeInfo(_T216),[
TypeInfo(TBookMarkNumber)],Addr(TCustomMemoSource.ClearBookMark));

RegRegisterMethod(TCustomMemoSource,'SetBookMark',TypeInfo(_T217),[
TypeInfo(TBookMarkNumber)],Addr(TCustomMemoSource.SetBookMark));

RegRegisterMethod(TCustomMemoSource,'GoToBookmark',TypeInfo(_T218),[
TypeInfo(TBookMarkNumber)],Addr(TCustomMemoSource.GoToBookmark));

RegRegisterMethod(TCustomMemoSource,'ToggleBookMark',TypeInfo(_T219),[
TypeInfo(TBookMarkNumber)],Addr(TCustomMemoSource.ToggleBookMark));

RegRegisterMethod(TCustomMemoSource,'ToggleBookMarkForLine',TypeInfo(_T220),[
TypeInfo(TBookMarkNumber),
TypeInfo(Integer)],Addr(TCustomMemoSource.ToggleBookMarkForLine));

RegRegisterMethod(TCustomMemoSource,'FindBookMark',TypeInfo(_T221),[
TypeInfo(TBookMarkNumber),
TypeInfo(IDispatch),TypeInfo(Boolean)],Addr(__TCustomMemoSource__FindBookMark__Wrapper));

RegRegisterMethod(TCustomMemoSource,'NextBookmarkNumber',TypeInfo(_T222),[TypeInfo(Integer)],Addr(TCustomMemoSource.NextBookmarkNumber));

RegRegisterMethod(TCustomMemoSource,'ToggleBookMark0',TypeInfo(_T223),NoParams,Addr(TCustomMemoSource.ToggleBookMark0));

RegRegisterMethod(TCustomMemoSource,'ToggleBookMark1',TypeInfo(_T224),NoParams,Addr(TCustomMemoSource.ToggleBookMark1));

RegRegisterMethod(TCustomMemoSource,'ToggleBookMark2',TypeInfo(_T225),NoParams,Addr(TCustomMemoSource.ToggleBookMark2));

RegRegisterMethod(TCustomMemoSource,'ToggleBookMark3',TypeInfo(_T226),NoParams,Addr(TCustomMemoSource.ToggleBookMark3));

RegRegisterMethod(TCustomMemoSource,'ToggleBookMark4',TypeInfo(_T227),NoParams,Addr(TCustomMemoSource.ToggleBookMark4));

RegRegisterMethod(TCustomMemoSource,'ToggleBookMark5',TypeInfo(_T228),NoParams,Addr(TCustomMemoSource.ToggleBookMark5));

RegRegisterMethod(TCustomMemoSource,'ToggleBookMark6',TypeInfo(_T229),NoParams,Addr(TCustomMemoSource.ToggleBookMark6));

RegRegisterMethod(TCustomMemoSource,'ToggleBookMark7',TypeInfo(_T230),NoParams,Addr(TCustomMemoSource.ToggleBookMark7));

RegRegisterMethod(TCustomMemoSource,'ToggleBookMark8',TypeInfo(_T231),NoParams,Addr(TCustomMemoSource.ToggleBookMark8));

RegRegisterMethod(TCustomMemoSource,'ToggleBookMark9',TypeInfo(_T232),NoParams,Addr(TCustomMemoSource.ToggleBookMark9));

RegRegisterMethod(TCustomMemoSource,'GoToBookMark0',TypeInfo(_T233),NoParams,Addr(TCustomMemoSource.GoToBookMark0));

RegRegisterMethod(TCustomMemoSource,'GoToBookMark1',TypeInfo(_T234),NoParams,Addr(TCustomMemoSource.GoToBookMark1));

RegRegisterMethod(TCustomMemoSource,'GoToBookMark2',TypeInfo(_T235),NoParams,Addr(TCustomMemoSource.GoToBookMark2));

RegRegisterMethod(TCustomMemoSource,'GoToBookMark3',TypeInfo(_T236),NoParams,Addr(TCustomMemoSource.GoToBookMark3));

RegRegisterMethod(TCustomMemoSource,'GoToBookMark4',TypeInfo(_T237),NoParams,Addr(TCustomMemoSource.GoToBookMark4));

RegRegisterMethod(TCustomMemoSource,'GoToBookMark5',TypeInfo(_T238),NoParams,Addr(TCustomMemoSource.GoToBookMark5));

RegRegisterMethod(TCustomMemoSource,'GoToBookMark6',TypeInfo(_T239),NoParams,Addr(TCustomMemoSource.GoToBookMark6));

RegRegisterMethod(TCustomMemoSource,'GoToBookMark7',TypeInfo(_T240),NoParams,Addr(TCustomMemoSource.GoToBookMark7));

RegRegisterMethod(TCustomMemoSource,'GoToBookMark8',TypeInfo(_T241),NoParams,Addr(TCustomMemoSource.GoToBookMark8));

RegRegisterMethod(TCustomMemoSource,'GoToBookMark9',TypeInfo(_T242),NoParams,Addr(TCustomMemoSource.GoToBookMark9));

RegRegisterMethod(TCustomMemoSource,'ClearImageBit',TypeInfo(_T243),[
TypeInfo(Integer)],Addr(TCustomMemoSource.ClearImageBit));

RegRegisterMethod(TCustomMemoSource,'CorrectTextAtCursor',TypeInfo(_T244),[TypeInfo(string)],Addr(TCustomMemoSource.CorrectTextAtCursor));

RegRegisterMethod(TCustomMemoSource,'CorrectTextAt',TypeInfo(_T245),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(string)],Addr(TCustomMemoSource.CorrectTextAt));

RegRegisterMethod(TCustomMemoSource,'CorrectCharUnderCursor',TypeInfo(_T246),[
TypeInfo(IDispatch),TypeInfo(Char)],Addr(__TCustomMemoSource__CorrectCharUnderCursor__Wrapper));

RegRegisterMethod(TCustomMemoSource,'GetRealTabIndex',TypeInfo(_T247),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Integer)],Addr(TCustomMemoSource.GetRealTabIndex));

RegRegisterMethod(TCustomMemoSource,'GetRelativeTabIndex',TypeInfo(_T248),[
TypeInfo(string),
TypeInfo(Integer),TypeInfo(Integer)],Addr(TCustomMemoSource.GetRelativeTabIndex));

RegRegisterMethod(TCustomMemoSource,'ExpandTabString',TypeInfo(_T249),[
TypeInfo(string),TypeInfo(string)],Addr(TCustomMemoSource.ExpandTabString));

RegRegisterMethod(TCustomMemoSource,'RealToVisibleIndex',TypeInfo(_T250),[
TypeInfo(Integer),TypeInfo(Integer)],Addr(TCustomMemoSource.RealToVisibleIndex));

RegRegisterMethod(TCustomMemoSource,'VisibleToRealIndex',TypeInfo(_T251),[
TypeInfo(Integer),TypeInfo(Integer)],Addr(TCustomMemoSource.VisibleToRealIndex));

RegRegisterMethod(TMemoBookMarkList,'Sort',TypeInfo(_T252),NoParams,Addr(TMemoBookMarkList.Sort));

RegRegisterMethod(TMemoCodeTemplates,'ConvertCodeTemplate',TypeInfo(_T253),[
TypeInfo(TMemoCodeTemplate),TypeInfo(string)],Addr(TMemoCodeTemplates.ConvertCodeTemplate));

RegRegisterMethod(TMemoCodeTemplates,'ConvertCodeTemplates',TypeInfo(_T254),[
TypeInfo(TStrings),
TypeInfo(string),TypeInfo(Integer)],Addr(TMemoCodeTemplates.ConvertCodeTemplates));

RegRegisterMethod(TMemoPositionList,'Clear',TypeInfo(_T255),NoParams,Addr(TMemoPositionList.Clear));

RegRegisterMethod(TPosition,'SetPosition',TypeInfo(_T256),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TPosition.SetPosition));

RegRegisterMethod(TPosition,'SameAs',TypeInfo(_T257),[
TypeInfo(TPosition),TypeInfo(Boolean)],Addr(TPosition.SameAs));

RegRegisterMethod(TUndoList,'DeleteLast',TypeInfo(_T258),NoParams,Addr(TUndoList.DeleteLast));

RegRegisterMethod(TUndoList,'Clear',TypeInfo(_T259),NoParams,Addr(TUndoList.Clear));

RegisterProc(TUndoList,'CreateNew',mtConstructor,TypeInfo(_T260),NoParams,Addr(TUndoList.CreateNew),cRegister);

RegRegisterMethod(TUndoList,'ClearToIndex',TypeInfo(_T262),[
TypeInfo(Integer)],Addr(TUndoList.ClearToIndex));

RegRegisterMethod(TVisibleLinesList,'FindNear',TypeInfo(_T263),[
TypeInfo(Integer),
TypeInfo(Boolean),
TypeInfo(Boolean),TypeInfo(Integer)],Addr(TVisibleLinesList.FindNear));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'RegisterTemplatesProc',mtProc,TypeInfo(_T15),[
TypeInfo(string),
TypeInfo(TCodeTemplateProc)],Addr(RegisterTemplatesProc),cRegister)}

{RegisterProc(nil,'StrFromIndex',mtProc,TypeInfo(_T18),[
TypeInfoPChar,
TypeInfo(Integer),TypeInfoPChar],Addr(StrFromIndex),cRegister)}

{RegRegisterMethod(TCustomMemoSource,'GetStrItemClass',TypeInfo(_T32),[TypeInfo(TStringItemClass)], pointer(48))}

{RegRegisterMethod(TCustomMemoSource,'DoWithBlockStr',TypeInfo(_T56),[
TypeInfo(Integer),
TypeInfo(TStrProc),
TypeInfo(Boolean)],Addr(TCustomMemoSource.DoWithBlockStr))}

{RegRegisterMethod(TCustomMemoSource,'DoWithBlock',TypeInfo(_T57),[
TypeInfo(Integer),
TypeInfo(TObjProc),
TypeInfo(TObjProc),
TypeInfo(Boolean)],Addr(TCustomMemoSource.DoWithBlock))}

{RegRegisterMethod(TCustomMemoSource,'UnivMark',TypeInfo(_T76),[
TypeInfo(TObjProc),
TypeInfo(TSelectionType)],Addr(TCustomMemoSource.UnivMark))}

{RegRegisterMethod(TCustomMemoSource,'RegisterNotifier',TypeInfo(_T77),[
TypeInfo(TNotifierProc),
TypeInfo(Boolean)],Addr(TCustomMemoSource.RegisterNotifier))}

{RegRegisterMethod(TCustomMemoSource,'UnregisterNotifier',TypeInfo(_T78),[
TypeInfo(TNotifierProc)],Addr(TCustomMemoSource.UnregisterNotifier))}

{RegRegisterMethod(TUndoList,'AddUndoRecord',TypeInfo(_T261),[TypeInfoPointer],Addr(TUndoList.AddUndoRecord))}

RegisterEvent(TypeInfo(TAfterParseEvent),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(string),
TypeInfo(string)]);

RegisterEvent(TypeInfo(TBeforeFindReplaceEvent),[
TypeInfo(TObject),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TCreateDialogEvent),[
TypeInfo(TObject),
TypeInfo(TCustomForm)]);

RegisterEvent(TypeInfo(TGetBackpNameEvent),[
TypeInfo(TObject),
TypeInfo(string),
TypeInfo(string)]);

RegisterEvent(TypeInfo(TGetPositionEvent),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer)]);

RegisterEvent(TypeInfo(TGetSelectionTypeEvent),[
TypeInfo(TObject),
TypeInfo(TSelectionType)]);

RegisterEvent(TypeInfo(TObjProc),NoParams);

RegisterEvent(TypeInfo(TOnAllowUpdate),[
TypeInfo(TObject),
TypeInfo(Boolean),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TOnGetLineHeightEvent),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(TStringItem)]);

RegisterEvent(TypeInfo(TSearchExceptionEvent),[
TypeInfo(TObject),
TypeInfo(string),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TStringsEvent),[
TypeInfo(TObject),
TypeInfo(TStrings)]);

RegisterEvent(TypeInfo(TStrProc),[
TypeInfo(string)]);

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
