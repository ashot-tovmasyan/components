{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit qrprntr_D5;
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
  winspool,
  Sysutils,
  Messages,
  Classes,
  Controls,
  StdCtrls,
  ExtCtrls,
  ComCtrls,
  Buttons,
  Printers,
  Graphics,
  Forms,
  DB,
  DBTables,
  QR3Const,
  Dialogs,
  QRPrntr;
function ConvertTCM_QRPageAvailableToVariant(var R : TCM_QRPageAvailable) : OleVariant;
function ConvertVariantToTCM_QRPageAvailable(const V : OleVariant) : TCM_QRPageAvailable;
function ConvertTCM_QRPreviewCloseToVariant(var R : TCM_QRPreviewClose) : OleVariant;
function ConvertVariantToTCM_QRPreviewClose(const V : OleVariant) : TCM_QRPreviewClose;
function ConvertTCM_QRPrintToVariant(var R : TCM_QRPrint) : OleVariant;
function ConvertVariantToTCM_QRPrint(const V : OleVariant) : TCM_QRPrint;
function ConvertTCM_QRPRogressUpdateToVariant(var R : TCM_QRPRogressUpdate) : OleVariant;
function ConvertVariantToTCM_QRPRogressUpdate(const V : OleVariant) : TCM_QRPRogressUpdate;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TCM_QRPageAvailable__Wrapper = class(TDCRecordWrapper)
private
fR : TCM_QRPageAvailable;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setPageCount(const val : Word);
function getPageCount : Word;
property PageCount : Word read getPageCount write setPageCount;
procedure setQRPrinter(const val : TQRPrinter);
function getQRPrinter : TQRPrinter;
property QRPrinter : TQRPrinter read getQRPrinter write setQRPrinter;
end;
type __TCM_QRPreviewClose__Wrapper = class(TDCRecordWrapper)
private
fR : TCM_QRPreviewClose;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setDummy(const val : Word);
function getDummy : Word;
property Dummy : Word read getDummy write setDummy;
procedure setQRPrinter(const val : TQRPrinter);
function getQRPrinter : TQRPrinter;
property QRPrinter : TQRPrinter read getQRPrinter write setQRPrinter;
end;
type __TCM_QRPrint__Wrapper = class(TDCRecordWrapper)
private
fR : TCM_QRPrint;
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
type __TCM_QRPRogressUpdate__Wrapper = class(TDCRecordWrapper)
private
fR : TCM_QRPRogressUpdate;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setPosition(const val : Word);
function getPosition : Word;
property Position : Word read getPosition write setPosition;
procedure setQRPrinter(const val : TQRPrinter);
function getQRPrinter : TQRPrinter;
property QRPrinter : TQRPrinter read getQRPrinter write setQRPrinter;
end;
type
_T0 = function : TStrings of object;

_T1 = function : string of object;

_T2 = function (p0 : TQRPaperSize): string of object;

{_T3 = procedure (p0 : TQRPreviewInterfaceClass) of object;}

_T4 = function : TQRPrinter of object;

_T5 = procedure  of object;

_T6 = _T5;

_T7 = procedure (p0 : TStream;
p1 : Boolean) of object;

_T8 = procedure (var p0 : Byte) of object;

_T9 = procedure (p0 : CodeType) of object;

_T10 = _T1;

_T11 = _T1;

_T12 = _T1;

_T13 = _T1;

_T14 = function : Boolean of object;

_T15 = procedure (p0 : string) of object;

_T16 = procedure (p0 : Integer;
p1 : Integer;
p2 : TFont) of object;

_T17 = _T5;

_T18 = _T5;

_T19 = _T5;

_T20 = procedure (p0 : Extended;
p1 : Extended;
p2 : TFont;
p3 : TColor;
p4 : TAlignment;
p5 : string) of object;

_T21 = _T5;

{_T22 = procedure (p0 : TQRExportFilterClass) of object;}

{_T23 = procedure (p0 : TQRExportFilterClass) of object;}

_T24 = _T5;

_T25 = function (p0 : Integer): TMetafile of object;

_T26 = procedure (p0 : TMetafile) of object;

_T27 = _T5;

_T28 = _T5;

_T29 = _T15;

_T30 = _T5;

_T31 = _T15;

_T32 = _T5;

_T33 = _T5;

_T34 = _T5;

_T35 = _T5;

_T36 = _T5;

_T37 = function (p0 : TQRPrinter): TWinControl of object;

_T38 = _T37;

_T39 = _T5;

_T40 = _T25;

_T41 = function (p0 : Extended): Integer of object;

_T42 = _T41;

_T43 = _T41;

_T44 = _T41;

_T45 = function : Integer of object;

_T46 = _T45;

_T47 = _T5;

_T48 = _T5;

_T49 = _T5;

_T50 = _T5;

_T51 = procedure (p0 : TWinControl) of object;

_T52 = _T5;

_T53 = procedure (p0 : TQRExportFilter) of object;

_T54 = _T15;

_T55 = _T5;

_T56 = _T5;

_T57 = _T5;

_T58 = _T5;

_T59 = _T5;

_T60 = _T15;

_T61 = _T5;

_T62 = procedure (p0 : TQRPrinter) of object;

_T63 = procedure (p0 : Longint) of object;

_T64 = _T15;

_T65 = _T5;

_T66 = _T5;

_T67 = procedure (p0 : TStream) of object;

function __TCM_QRPageAvailable__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCM_QRPageAvailable__Wrapper.setMsg(const val : Cardinal);
begin
TCM_QRPageAvailable(GetRecordPtr^).Msg := val;
end;
function __TCM_QRPageAvailable__Wrapper.getMsg : Cardinal;
begin
result := TCM_QRPageAvailable(GetRecordPtr^).Msg;
end;
procedure __TCM_QRPageAvailable__Wrapper.setPageCount(const val : Word);
begin
TCM_QRPageAvailable(GetRecordPtr^).PageCount := val;
end;
function __TCM_QRPageAvailable__Wrapper.getPageCount : Word;
begin
result := TCM_QRPageAvailable(GetRecordPtr^).PageCount;
end;
procedure __TCM_QRPageAvailable__Wrapper.setQRPrinter(const val : TQRPrinter);
begin
TCM_QRPageAvailable(GetRecordPtr^).QRPrinter := val;
end;
function __TCM_QRPageAvailable__Wrapper.getQRPrinter : TQRPrinter;
begin
result := TCM_QRPageAvailable(GetRecordPtr^).QRPrinter;
end;
function __TCM_QRPreviewClose__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCM_QRPreviewClose__Wrapper.setMsg(const val : Cardinal);
begin
TCM_QRPreviewClose(GetRecordPtr^).Msg := val;
end;
function __TCM_QRPreviewClose__Wrapper.getMsg : Cardinal;
begin
result := TCM_QRPreviewClose(GetRecordPtr^).Msg;
end;
procedure __TCM_QRPreviewClose__Wrapper.setDummy(const val : Word);
begin
TCM_QRPreviewClose(GetRecordPtr^).Dummy := val;
end;
function __TCM_QRPreviewClose__Wrapper.getDummy : Word;
begin
result := TCM_QRPreviewClose(GetRecordPtr^).Dummy;
end;
procedure __TCM_QRPreviewClose__Wrapper.setQRPrinter(const val : TQRPrinter);
begin
TCM_QRPreviewClose(GetRecordPtr^).QRPrinter := val;
end;
function __TCM_QRPreviewClose__Wrapper.getQRPrinter : TQRPrinter;
begin
result := TCM_QRPreviewClose(GetRecordPtr^).QRPrinter;
end;
function __TCM_QRPrint__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCM_QRPrint__Wrapper.setMsg(const val : Cardinal);
begin
TCM_QRPrint(GetRecordPtr^).Msg := val;
end;
function __TCM_QRPrint__Wrapper.getMsg : Cardinal;
begin
result := TCM_QRPrint(GetRecordPtr^).Msg;
end;
procedure __TCM_QRPrint__Wrapper.setWParam(const val : Longint);
begin
TCM_QRPrint(GetRecordPtr^).WParam := val;
end;
function __TCM_QRPrint__Wrapper.getWParam : Longint;
begin
result := TCM_QRPrint(GetRecordPtr^).WParam;
end;
procedure __TCM_QRPrint__Wrapper.setLParam(const val : Longint);
begin
TCM_QRPrint(GetRecordPtr^).LParam := val;
end;
function __TCM_QRPrint__Wrapper.getLParam : Longint;
begin
result := TCM_QRPrint(GetRecordPtr^).LParam;
end;
procedure __TCM_QRPrint__Wrapper.setResult(const val : Longint);
begin
TCM_QRPrint(GetRecordPtr^).Result := val;
end;
function __TCM_QRPrint__Wrapper.getResult : Longint;
begin
result := TCM_QRPrint(GetRecordPtr^).Result;
end;
procedure __TCM_QRPrint__Wrapper.setWParamLo(const val : Word);
begin
TCM_QRPrint(GetRecordPtr^).WParamLo := val;
end;
function __TCM_QRPrint__Wrapper.getWParamLo : Word;
begin
result := TCM_QRPrint(GetRecordPtr^).WParamLo;
end;
procedure __TCM_QRPrint__Wrapper.setWParamHi(const val : Word);
begin
TCM_QRPrint(GetRecordPtr^).WParamHi := val;
end;
function __TCM_QRPrint__Wrapper.getWParamHi : Word;
begin
result := TCM_QRPrint(GetRecordPtr^).WParamHi;
end;
procedure __TCM_QRPrint__Wrapper.setLParamLo(const val : Word);
begin
TCM_QRPrint(GetRecordPtr^).LParamLo := val;
end;
function __TCM_QRPrint__Wrapper.getLParamLo : Word;
begin
result := TCM_QRPrint(GetRecordPtr^).LParamLo;
end;
procedure __TCM_QRPrint__Wrapper.setLParamHi(const val : Word);
begin
TCM_QRPrint(GetRecordPtr^).LParamHi := val;
end;
function __TCM_QRPrint__Wrapper.getLParamHi : Word;
begin
result := TCM_QRPrint(GetRecordPtr^).LParamHi;
end;
procedure __TCM_QRPrint__Wrapper.setResultLo(const val : Word);
begin
TCM_QRPrint(GetRecordPtr^).ResultLo := val;
end;
function __TCM_QRPrint__Wrapper.getResultLo : Word;
begin
result := TCM_QRPrint(GetRecordPtr^).ResultLo;
end;
procedure __TCM_QRPrint__Wrapper.setResultHi(const val : Word);
begin
TCM_QRPrint(GetRecordPtr^).ResultHi := val;
end;
function __TCM_QRPrint__Wrapper.getResultHi : Word;
begin
result := TCM_QRPrint(GetRecordPtr^).ResultHi;
end;
function __TCM_QRPRogressUpdate__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCM_QRPRogressUpdate__Wrapper.setMsg(const val : Cardinal);
begin
TCM_QRPRogressUpdate(GetRecordPtr^).Msg := val;
end;
function __TCM_QRPRogressUpdate__Wrapper.getMsg : Cardinal;
begin
result := TCM_QRPRogressUpdate(GetRecordPtr^).Msg;
end;
procedure __TCM_QRPRogressUpdate__Wrapper.setPosition(const val : Word);
begin
TCM_QRPRogressUpdate(GetRecordPtr^).Position := val;
end;
function __TCM_QRPRogressUpdate__Wrapper.getPosition : Word;
begin
result := TCM_QRPRogressUpdate(GetRecordPtr^).Position;
end;
procedure __TCM_QRPRogressUpdate__Wrapper.setQRPrinter(const val : TQRPrinter);
begin
TCM_QRPRogressUpdate(GetRecordPtr^).QRPrinter := val;
end;
function __TCM_QRPRogressUpdate__Wrapper.getQRPrinter : TQRPrinter;
begin
result := TCM_QRPRogressUpdate(GetRecordPtr^).QRPrinter;
end;
function _TCM_QRPageAvailable_ : IDispatch;
begin
  result := __TCM_QRPageAvailable__Wrapper.Create;
end;
function _TCM_QRPreviewClose_ : IDispatch;
begin
  result := __TCM_QRPreviewClose__Wrapper.Create;
end;
function _TCM_QRPrint_ : IDispatch;
begin
  result := __TCM_QRPrint__Wrapper.Create;
end;
function _TCM_QRPRogressUpdate_ : IDispatch;
begin
  result := __TCM_QRPRogressUpdate__Wrapper.Create;
end;

type __TCM_QRPageAvailable__Wrapper__ = class(__TCM_QRPageAvailable__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCM_QRPageAvailable__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCM_QRPageAvailableToVariant(var R : TCM_QRPageAvailable) : OleVariant;
var
__rw : __TCM_QRPageAvailable__Wrapper__;
begin
__rw := __TCM_QRPageAvailable__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCM_QRPageAvailable(const V : OleVariant) : TCM_QRPageAvailable;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCM_QRPageAvailable((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCM_QRPreviewClose__Wrapper__ = class(__TCM_QRPreviewClose__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCM_QRPreviewClose__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCM_QRPreviewCloseToVariant(var R : TCM_QRPreviewClose) : OleVariant;
var
__rw : __TCM_QRPreviewClose__Wrapper__;
begin
__rw := __TCM_QRPreviewClose__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCM_QRPreviewClose(const V : OleVariant) : TCM_QRPreviewClose;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCM_QRPreviewClose((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCM_QRPrint__Wrapper__ = class(__TCM_QRPrint__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCM_QRPrint__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCM_QRPrintToVariant(var R : TCM_QRPrint) : OleVariant;
var
__rw : __TCM_QRPrint__Wrapper__;
begin
__rw := __TCM_QRPrint__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCM_QRPrint(const V : OleVariant) : TCM_QRPrint;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCM_QRPrint((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCM_QRPRogressUpdate__Wrapper__ = class(__TCM_QRPRogressUpdate__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCM_QRPRogressUpdate__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCM_QRPRogressUpdateToVariant(var R : TCM_QRPRogressUpdate) : OleVariant;
var
__rw : __TCM_QRPRogressUpdate__Wrapper__;
begin
__rw := __TCM_QRPRogressUpdate__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCM_QRPRogressUpdate(const V : OleVariant) : TCM_QRPRogressUpdate;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCM_QRPRogressUpdate((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTPrinterSettings__Device(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinterSettings(Instance).Device;
end;

function __DC__GetTPrinterSettings__Driver(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinterSettings(Instance).Driver;
end;

function __DC__GetTPrinterSettings__LeftOffset(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinterSettings(Instance).LeftOffset;
end;

function __DC__GetTPrinterSettings__MaxExtentX(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinterSettings(Instance).MaxExtentX;
end;

function __DC__GetTPrinterSettings__MaxExtentY(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinterSettings(Instance).MaxExtentY;
end;

function __DC__GetTPrinterSettings__MinExtentX(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinterSettings(Instance).MinExtentX;
end;

function __DC__GetTPrinterSettings__MinExtentY(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinterSettings(Instance).MinExtentY;
end;

function __DC__GetTPrinterSettings__PaperSizeSupported(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinterSettings(Instance).PaperSizeSupported[OleVariant(Params^[0])];
end;

function __DC__GetTPrinterSettings__PixelsPerX(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinterSettings(Instance).PixelsPerX;
end;

function __DC__GetTPrinterSettings__PixelsPerY(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinterSettings(Instance).PixelsPerY;
end;

function __DC__GetTPrinterSettings__Port(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinterSettings(Instance).Port;
end;

function __DC__GetTPrinterSettings__TopOffset(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinterSettings(Instance).TopOffset;
end;

function __DC__GetTPrinterSettings__Copies(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinterSettings(Instance).Copies;
end;

procedure __DC__SetTPrinterSettings__Copies(Instance : TObject; Params : PVariantArgList);
begin
TPrinterSettings(Instance).Copies:=OleVariant(Params^[0]);
end;

function __DC__GetTPrinterSettings__Duplex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinterSettings(Instance).Duplex;
end;

procedure __DC__SetTPrinterSettings__Duplex(Instance : TObject; Params : PVariantArgList);
begin
TPrinterSettings(Instance).Duplex:=OleVariant(Params^[0]);
end;

function __DC__GetTPrinterSettings__Orientation(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinterSettings(Instance).Orientation;
end;

procedure __DC__SetTPrinterSettings__Orientation(Instance : TObject; Params : PVariantArgList);
begin
TPrinterSettings(Instance).Orientation:=OleVariant(Params^[0]);
end;

function __DC__GetTPrinterSettings__OutputBin(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinterSettings(Instance).OutputBin;
end;

procedure __DC__SetTPrinterSettings__OutputBin(Instance : TObject; Params : PVariantArgList);
begin
TPrinterSettings(Instance).OutputBin:=OleVariant(Params^[0]);
end;

function __DC__GetTPrinterSettings__PaperLength(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinterSettings(Instance).PaperLength;
end;

procedure __DC__SetTPrinterSettings__PaperLength(Instance : TObject; Params : PVariantArgList);
begin
TPrinterSettings(Instance).PaperLength:=OleVariant(Params^[0]);
end;

function __DC__GetTPrinterSettings__PaperSize(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinterSettings(Instance).PaperSize;
end;

procedure __DC__SetTPrinterSettings__PaperSize(Instance : TObject; Params : PVariantArgList);
begin
TPrinterSettings(Instance).PaperSize:=OleVariant(Params^[0]);
end;

function __DC__GetTPrinterSettings__PaperWidth(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinterSettings(Instance).PaperWidth;
end;

procedure __DC__SetTPrinterSettings__PaperWidth(Instance : TObject; Params : PVariantArgList);
begin
TPrinterSettings(Instance).PaperWidth:=OleVariant(Params^[0]);
end;

function __DC__GetTPrinterSettings__Printer(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TPrinterSettings(Instance).Printer);
end;

procedure __DC__SetTPrinterSettings__Printer(Instance : TObject; Params : PVariantArgList);
begin
TPrinterSettings(Instance).Printer:=TPrinter(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTPrinterSettings__Title(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinterSettings(Instance).Title;
end;

procedure __DC__SetTPrinterSettings__Title(Instance : TObject; Params : PVariantArgList);
begin
TPrinterSettings(Instance).Title:=OleVariant(Params^[0]);
end;

function __DC__GetTQRExportFilter__Active(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRExportFilter(Instance).Active;
end;

procedure __DC__SetTQRExportFilter__Active(Instance : TObject; Params : PVariantArgList);
begin
TQRExportFilter(Instance).Active:=OleVariant(Params^[0]);
end;

function __DC__GetTQRExportFilter__Description(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRExportFilter(Instance).Description;
end;

function __DC__GetTQRExportFilter__FileExtension(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRExportFilter(Instance).FileExtension;
end;

function __DC__GetTQRExportFilter__Filename(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRExportFilter(Instance).Filename;
end;

function __DC__GetTQRExportFilter__Name(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRExportFilter(Instance).Name;
end;

function __DC__GetTQRExportFilter__Owner(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRExportFilter(Instance).Owner);
end;

procedure __DC__SetTQRExportFilter__Owner(Instance : TObject; Params : PVariantArgList);
begin
TQRExportFilter(Instance).Owner:=TComponent(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRExportFilter__Streaming(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRExportFilter(Instance).Streaming;
end;

function __DC__GetTQRExportFilter__Vendor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRExportFilter(Instance).Vendor;
end;

function __DC__GetTQRExportFilter__OriginalQRPrinter(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRExportFilter(Instance).OriginalQRPrinter);
end;

procedure __DC__SetTQRExportFilter__OriginalQRPrinter(Instance : TObject; Params : PVariantArgList);
begin
TQRExportFilter(Instance).OriginalQRPrinter:=TQRPrinter(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRExportFilterLibrary__Filters(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRExportFilterLibrary(Instance).Filters);
end;

function __DC__GetTQRExportFilterLibrary__SaveDialogFilterString(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRExportFilterLibrary(Instance).SaveDialogFilterString;
end;

function __DC__GetTQRExportFilterLibraryEntry__FilterName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRExportFilterLibraryEntry(Instance).FilterName;
end;

procedure __DC__SetTQRExportFilterLibraryEntry__FilterName(Instance : TObject; Params : PVariantArgList);
begin
TQRExportFilterLibraryEntry(Instance).FilterName:=OleVariant(Params^[0]);
end;

function __DC__GetTQRExportFilterLibraryEntry__Extension(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRExportFilterLibraryEntry(Instance).Extension;
end;

procedure __DC__SetTQRExportFilterLibraryEntry__Extension(Instance : TObject; Params : PVariantArgList);
begin
TQRExportFilterLibraryEntry(Instance).Extension:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPageList__Compression(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPageList(Instance).Compression;
end;

procedure __DC__SetTQRPageList__Compression(Instance : TObject; Params : PVariantArgList);
begin
TQRPageList(Instance).Compression:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPageList__PageCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPageList(Instance).PageCount;
end;

function __DC__GetTQRPageList__Stream(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRPageList(Instance).Stream);
end;

procedure __DC__SetTQRPageList__Stream(Instance : TObject; Params : PVariantArgList);
begin
TQRPageList(Instance).Stream:=TQRStream(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRPreview__PreviewImage(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRPreview(Instance).PreviewImage);
end;

function __DC__GetTQRPreview__QRPrinter(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRPreview(Instance).QRPrinter);
end;

procedure __DC__SetTQRPreview__QRPrinter(Instance : TObject; Params : PVariantArgList);
begin
TQRPreview(Instance).QRPrinter:=TQRPrinter(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRPreview__ZoomState(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPreview(Instance).ZoomState;
end;

procedure __DC__SetTQRPreview__ZoomState(Instance : TObject; Params : PVariantArgList);
begin
TQRPreview(Instance).ZoomState:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPreviewImage__ImageOK(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPreviewImage(Instance).ImageOK;
end;

procedure __DC__SetTQRPreviewImage__ImageOK(Instance : TObject; Params : PVariantArgList);
begin
TQRPreviewImage(Instance).ImageOK:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPreviewImage__PageNumber(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPreviewImage(Instance).PageNumber;
end;

procedure __DC__SetTQRPreviewImage__PageNumber(Instance : TObject; Params : PVariantArgList);
begin
TQRPreviewImage(Instance).PageNumber:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPreviewImage__QRPrinter(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRPreviewImage(Instance).QRPrinter);
end;

procedure __DC__SetTQRPreviewImage__QRPrinter(Instance : TObject; Params : PVariantArgList);
begin
TQRPreviewImage(Instance).QRPrinter:=TQRPrinter(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRPrinter__ReportLoaded(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).ReportLoaded;
end;

procedure __DC__SetTQRPrinter__ReportLoaded(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).ReportLoaded:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinter__AvailablePages(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).AvailablePages;
end;

procedure __DC__SetTQRPrinter__AvailablePages(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).AvailablePages:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinter__OutputBin(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).OutputBin;
end;

procedure __DC__SetTQRPrinter__OutputBin(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).OutputBin:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinter__Cancelled(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).Cancelled;
end;

procedure __DC__SetTQRPrinter__Cancelled(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).Cancelled:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinter__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRPrinter(Instance).Canvas);
end;

function __DC__GetTQRPrinter__Client(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRPrinter(Instance).Client);
end;

procedure __DC__SetTQRPrinter__Client(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).Client:=TWinControl(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRPrinter__Compression(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).Compression;
end;

procedure __DC__SetTQRPrinter__Compression(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).Compression:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinter__Copies(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).Copies;
end;

procedure __DC__SetTQRPrinter__Copies(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).Copies:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinter__Destination(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).Destination;
end;

procedure __DC__SetTQRPrinter__Destination(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).Destination:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinter__Duplex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).Duplex;
end;

procedure __DC__SetTQRPrinter__Duplex(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).Duplex:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinter__FirstPage(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).FirstPage;
end;

procedure __DC__SetTQRPrinter__FirstPage(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).FirstPage:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinter__LastPage(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).LastPage;
end;

procedure __DC__SetTQRPrinter__LastPage(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).LastPage:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinter__LeftWaste(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).LeftWaste;
end;

function __DC__GetTQRPrinter__Master(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRPrinter(Instance).Master);
end;

procedure __DC__SetTQRPrinter__Master(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).Master:=TWinControl(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRPrinter__Orientation(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).Orientation;
end;

procedure __DC__SetTQRPrinter__Orientation(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).Orientation:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinter__PaperLength(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).PaperLength;
end;

procedure __DC__SetTQRPrinter__PaperLength(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).PaperLength:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinter__Page(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRPrinter(Instance).Page);
end;

function __DC__GetTQRPrinter__PageCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).PageCount;
end;

procedure __DC__SetTQRPrinter__PageCount(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).PageCount:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinter__PageNumber(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).PageNumber;
end;

procedure __DC__SetTQRPrinter__PageNumber(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).PageNumber:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinter__PaperWidth(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).PaperWidth;
end;

procedure __DC__SetTQRPrinter__PaperWidth(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).PaperWidth:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinter__PaperSize(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).PaperSize;
end;

procedure __DC__SetTQRPrinter__PaperSize(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).PaperSize:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinter__PrinterIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).PrinterIndex;
end;

procedure __DC__SetTQRPrinter__PrinterIndex(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).PrinterIndex:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinter__PrinterOK(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).PrinterOK;
end;

function __DC__GetTQRPrinter__Printers(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRPrinter(Instance).Printers);
end;

function __DC__GetTQRPrinter__Progress(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).Progress;
end;

procedure __DC__SetTQRPrinter__Progress(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).Progress:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinter__ShowingPreview(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).ShowingPreview;
end;

procedure __DC__SetTQRPrinter__ShowingPreview(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).ShowingPreview:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinter__Status(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).Status;
end;

function __DC__GetTQRPrinter__Title(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).Title;
end;

procedure __DC__SetTQRPrinter__Title(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).Title:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinter__TopWaste(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).TopWaste;
end;

function __DC__GetTQRPrinter__XFactor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).XFactor;
end;

procedure __DC__SetTQRPrinter__XFactor(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).XFactor:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinter__YFactor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinter(Instance).YFactor;
end;

procedure __DC__SetTQRPrinter__YFactor(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinter(Instance).YFactor:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinterSettings__Copies(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinterSettings(Instance).Copies;
end;

procedure __DC__SetTQRPrinterSettings__Copies(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinterSettings(Instance).Copies:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinterSettings__Duplex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinterSettings(Instance).Duplex;
end;

procedure __DC__SetTQRPrinterSettings__Duplex(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinterSettings(Instance).Duplex:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinterSettings__FirstPage(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinterSettings(Instance).FirstPage;
end;

procedure __DC__SetTQRPrinterSettings__FirstPage(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinterSettings(Instance).FirstPage:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinterSettings__LastPage(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinterSettings(Instance).LastPage;
end;

procedure __DC__SetTQRPrinterSettings__LastPage(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinterSettings(Instance).LastPage:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinterSettings__Orientation(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinterSettings(Instance).Orientation;
end;

procedure __DC__SetTQRPrinterSettings__Orientation(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinterSettings(Instance).Orientation:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinterSettings__OutputBin(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinterSettings(Instance).OutputBin;
end;

procedure __DC__SetTQRPrinterSettings__OutputBin(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinterSettings(Instance).OutputBin:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinterSettings__PaperSize(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinterSettings(Instance).PaperSize;
end;

procedure __DC__SetTQRPrinterSettings__PaperSize(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinterSettings(Instance).PaperSize:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinterSettings__PrinterIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinterSettings(Instance).PrinterIndex;
end;

procedure __DC__SetTQRPrinterSettings__PrinterIndex(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinterSettings(Instance).PrinterIndex:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrinterSettings__Title(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrinterSettings(Instance).Title;
end;

procedure __DC__SetTQRPrinterSettings__Title(Instance : TObject; Params : PVariantArgList);
begin
TQRPrinterSettings(Instance).Title:=OleVariant(Params^[0]);
end;

function __DC__GetTQRStream__InMemory(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRStream(Instance).InMemory;
end;

procedure __RegisterProps;
begin
RegisterProperty(TPrinterSettings,'Device',__DC__GetTPrinterSettings__Device,nil);
RegisterProperty(TPrinterSettings,'Driver',__DC__GetTPrinterSettings__Driver,nil);
RegisterProperty(TPrinterSettings,'LeftOffset',__DC__GetTPrinterSettings__LeftOffset,nil);
RegisterProperty(TPrinterSettings,'MaxExtentX',__DC__GetTPrinterSettings__MaxExtentX,nil);
RegisterProperty(TPrinterSettings,'MaxExtentY',__DC__GetTPrinterSettings__MaxExtentY,nil);
RegisterProperty(TPrinterSettings,'MinExtentX',__DC__GetTPrinterSettings__MinExtentX,nil);
RegisterProperty(TPrinterSettings,'MinExtentY',__DC__GetTPrinterSettings__MinExtentY,nil);
RegisterIndexedProperty(TPrinterSettings,'PaperSizeSupported',1,False,__DC__GetTPrinterSettings__PaperSizeSupported,nil);
RegisterProperty(TPrinterSettings,'PixelsPerX',__DC__GetTPrinterSettings__PixelsPerX,nil);
RegisterProperty(TPrinterSettings,'PixelsPerY',__DC__GetTPrinterSettings__PixelsPerY,nil);
RegisterProperty(TPrinterSettings,'Port',__DC__GetTPrinterSettings__Port,nil);
RegisterProperty(TPrinterSettings,'TopOffset',__DC__GetTPrinterSettings__TopOffset,nil);
RegisterProperty(TPrinterSettings,'Copies',__DC__GetTPrinterSettings__Copies,__DC__SetTPrinterSettings__Copies);
RegisterProperty(TPrinterSettings,'Duplex',__DC__GetTPrinterSettings__Duplex,__DC__SetTPrinterSettings__Duplex);
RegisterProperty(TPrinterSettings,'Orientation',__DC__GetTPrinterSettings__Orientation,__DC__SetTPrinterSettings__Orientation);
RegisterProperty(TPrinterSettings,'OutputBin',__DC__GetTPrinterSettings__OutputBin,__DC__SetTPrinterSettings__OutputBin);
RegisterProperty(TPrinterSettings,'PaperLength',__DC__GetTPrinterSettings__PaperLength,__DC__SetTPrinterSettings__PaperLength);
RegisterProperty(TPrinterSettings,'PaperSize',__DC__GetTPrinterSettings__PaperSize,__DC__SetTPrinterSettings__PaperSize);
RegisterProperty(TPrinterSettings,'PaperWidth',__DC__GetTPrinterSettings__PaperWidth,__DC__SetTPrinterSettings__PaperWidth);
RegisterProperty(TPrinterSettings,'Printer',__DC__GetTPrinterSettings__Printer,__DC__SetTPrinterSettings__Printer);
RegisterProperty(TPrinterSettings,'Title',__DC__GetTPrinterSettings__Title,__DC__SetTPrinterSettings__Title);
RegisterProperty(TQRExportFilter,'Active',__DC__GetTQRExportFilter__Active,__DC__SetTQRExportFilter__Active);
RegisterProperty(TQRExportFilter,'Description',__DC__GetTQRExportFilter__Description,nil);
RegisterProperty(TQRExportFilter,'FileExtension',__DC__GetTQRExportFilter__FileExtension,nil);
RegisterProperty(TQRExportFilter,'Filename',__DC__GetTQRExportFilter__Filename,nil);
RegisterProperty(TQRExportFilter,'Name',__DC__GetTQRExportFilter__Name,nil);
RegisterProperty(TQRExportFilter,'Owner',__DC__GetTQRExportFilter__Owner,__DC__SetTQRExportFilter__Owner);
RegisterProperty(TQRExportFilter,'Streaming',__DC__GetTQRExportFilter__Streaming,nil);
RegisterProperty(TQRExportFilter,'Vendor',__DC__GetTQRExportFilter__Vendor,nil);
RegisterProperty(TQRExportFilter,'OriginalQRPrinter',__DC__GetTQRExportFilter__OriginalQRPrinter,__DC__SetTQRExportFilter__OriginalQRPrinter);
RegisterProperty(TQRExportFilterLibrary,'Filters',__DC__GetTQRExportFilterLibrary__Filters,nil);
RegisterProperty(TQRExportFilterLibrary,'SaveDialogFilterString',__DC__GetTQRExportFilterLibrary__SaveDialogFilterString,nil);
RegisterProperty(TQRExportFilterLibraryEntry,'FilterName',__DC__GetTQRExportFilterLibraryEntry__FilterName,__DC__SetTQRExportFilterLibraryEntry__FilterName);
RegisterProperty(TQRExportFilterLibraryEntry,'Extension',__DC__GetTQRExportFilterLibraryEntry__Extension,__DC__SetTQRExportFilterLibraryEntry__Extension);
RegisterProperty(TQRPageList,'Compression',__DC__GetTQRPageList__Compression,__DC__SetTQRPageList__Compression);
RegisterProperty(TQRPageList,'PageCount',__DC__GetTQRPageList__PageCount,nil);
RegisterProperty(TQRPageList,'Stream',__DC__GetTQRPageList__Stream,__DC__SetTQRPageList__Stream);
RegisterProperty(TQRPreview,'PreviewImage',__DC__GetTQRPreview__PreviewImage,nil);
RegisterProperty(TQRPreview,'QRPrinter',__DC__GetTQRPreview__QRPrinter,__DC__SetTQRPreview__QRPrinter);
RegisterProperty(TQRPreview,'ZoomState',__DC__GetTQRPreview__ZoomState,__DC__SetTQRPreview__ZoomState);
RegisterProperty(TQRPreviewImage,'ImageOK',__DC__GetTQRPreviewImage__ImageOK,__DC__SetTQRPreviewImage__ImageOK);
RegisterProperty(TQRPreviewImage,'PageNumber',__DC__GetTQRPreviewImage__PageNumber,__DC__SetTQRPreviewImage__PageNumber);
RegisterProperty(TQRPreviewImage,'QRPrinter',__DC__GetTQRPreviewImage__QRPrinter,__DC__SetTQRPreviewImage__QRPrinter);
RegisterProperty(TQRPrinter,'ReportLoaded',__DC__GetTQRPrinter__ReportLoaded,__DC__SetTQRPrinter__ReportLoaded);
RegisterProperty(TQRPrinter,'AvailablePages',__DC__GetTQRPrinter__AvailablePages,__DC__SetTQRPrinter__AvailablePages);
RegisterProperty(TQRPrinter,'OutputBin',__DC__GetTQRPrinter__OutputBin,__DC__SetTQRPrinter__OutputBin);
RegisterProperty(TQRPrinter,'Cancelled',__DC__GetTQRPrinter__Cancelled,__DC__SetTQRPrinter__Cancelled);
RegisterProperty(TQRPrinter,'Canvas',__DC__GetTQRPrinter__Canvas,nil);
RegisterProperty(TQRPrinter,'Client',__DC__GetTQRPrinter__Client,__DC__SetTQRPrinter__Client);
RegisterProperty(TQRPrinter,'Compression',__DC__GetTQRPrinter__Compression,__DC__SetTQRPrinter__Compression);
RegisterProperty(TQRPrinter,'Copies',__DC__GetTQRPrinter__Copies,__DC__SetTQRPrinter__Copies);
RegisterProperty(TQRPrinter,'Destination',__DC__GetTQRPrinter__Destination,__DC__SetTQRPrinter__Destination);
RegisterProperty(TQRPrinter,'Duplex',__DC__GetTQRPrinter__Duplex,__DC__SetTQRPrinter__Duplex);
RegisterProperty(TQRPrinter,'FirstPage',__DC__GetTQRPrinter__FirstPage,__DC__SetTQRPrinter__FirstPage);
RegisterProperty(TQRPrinter,'LastPage',__DC__GetTQRPrinter__LastPage,__DC__SetTQRPrinter__LastPage);
RegisterProperty(TQRPrinter,'LeftWaste',__DC__GetTQRPrinter__LeftWaste,nil);
RegisterProperty(TQRPrinter,'Master',__DC__GetTQRPrinter__Master,__DC__SetTQRPrinter__Master);
RegisterProperty(TQRPrinter,'Orientation',__DC__GetTQRPrinter__Orientation,__DC__SetTQRPrinter__Orientation);
RegisterProperty(TQRPrinter,'PaperLength',__DC__GetTQRPrinter__PaperLength,__DC__SetTQRPrinter__PaperLength);
RegisterProperty(TQRPrinter,'Page',__DC__GetTQRPrinter__Page,nil);
RegisterProperty(TQRPrinter,'PageCount',__DC__GetTQRPrinter__PageCount,__DC__SetTQRPrinter__PageCount);
RegisterProperty(TQRPrinter,'PageNumber',__DC__GetTQRPrinter__PageNumber,__DC__SetTQRPrinter__PageNumber);
RegisterProperty(TQRPrinter,'PaperWidth',__DC__GetTQRPrinter__PaperWidth,__DC__SetTQRPrinter__PaperWidth);
RegisterProperty(TQRPrinter,'PaperSize',__DC__GetTQRPrinter__PaperSize,__DC__SetTQRPrinter__PaperSize);
RegisterProperty(TQRPrinter,'PrinterIndex',__DC__GetTQRPrinter__PrinterIndex,__DC__SetTQRPrinter__PrinterIndex);
RegisterProperty(TQRPrinter,'PrinterOK',__DC__GetTQRPrinter__PrinterOK,nil);
RegisterProperty(TQRPrinter,'Printers',__DC__GetTQRPrinter__Printers,nil);
RegisterProperty(TQRPrinter,'Progress',__DC__GetTQRPrinter__Progress,__DC__SetTQRPrinter__Progress);
RegisterProperty(TQRPrinter,'ShowingPreview',__DC__GetTQRPrinter__ShowingPreview,__DC__SetTQRPrinter__ShowingPreview);
RegisterProperty(TQRPrinter,'Status',__DC__GetTQRPrinter__Status,nil);
RegisterProperty(TQRPrinter,'Title',__DC__GetTQRPrinter__Title,__DC__SetTQRPrinter__Title);
RegisterProperty(TQRPrinter,'TopWaste',__DC__GetTQRPrinter__TopWaste,nil);
RegisterProperty(TQRPrinter,'XFactor',__DC__GetTQRPrinter__XFactor,__DC__SetTQRPrinter__XFactor);
RegisterProperty(TQRPrinter,'YFactor',__DC__GetTQRPrinter__YFactor,__DC__SetTQRPrinter__YFactor);
RegisterProperty(TQRPrinterSettings,'Copies',__DC__GetTQRPrinterSettings__Copies,__DC__SetTQRPrinterSettings__Copies);
RegisterProperty(TQRPrinterSettings,'Duplex',__DC__GetTQRPrinterSettings__Duplex,__DC__SetTQRPrinterSettings__Duplex);
RegisterProperty(TQRPrinterSettings,'FirstPage',__DC__GetTQRPrinterSettings__FirstPage,__DC__SetTQRPrinterSettings__FirstPage);
RegisterProperty(TQRPrinterSettings,'LastPage',__DC__GetTQRPrinterSettings__LastPage,__DC__SetTQRPrinterSettings__LastPage);
RegisterProperty(TQRPrinterSettings,'Orientation',__DC__GetTQRPrinterSettings__Orientation,__DC__SetTQRPrinterSettings__Orientation);
RegisterProperty(TQRPrinterSettings,'OutputBin',__DC__GetTQRPrinterSettings__OutputBin,__DC__SetTQRPrinterSettings__OutputBin);
RegisterProperty(TQRPrinterSettings,'PaperSize',__DC__GetTQRPrinterSettings__PaperSize,__DC__SetTQRPrinterSettings__PaperSize);
RegisterProperty(TQRPrinterSettings,'PrinterIndex',__DC__GetTQRPrinterSettings__PrinterIndex,__DC__SetTQRPrinterSettings__PrinterIndex);
RegisterProperty(TQRPrinterSettings,'Title',__DC__GetTQRPrinterSettings__Title,__DC__SetTQRPrinterSettings__Title);
RegisterProperty(TQRStream,'InMemory',__DC__GetTQRStream__InMemory,nil);
end;

function __DC__GetQRPrntr__QRExportFilterLibrary(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(QRPrntr.QRExportFilterLibrary);
end;

procedure __DC__SetQRPrntr__QRExportFilterLibrary(Instance : TObject; Params : PVariantArgList);
begin
TObject(QRPrntr.QRExportFilterLibrary):=(VarToObject(OleVariant(Params^[0])));
end;

var __RegisteredVars : TList;
procedure __RegisterVars;
begin
__RegisteredVars := TList.Create;
__RegisteredVars.Add(RegisterVar('QRExportFilterLibrary',__DC__GetQRPrntr__QRExportFilterLibrary,__DC__SetQRPrntr__QRExportFilterLibrary));
end;

procedure __UnregisterVars;
begin
__RegisteredVars.Free;
end;

const __ConstNames0 : array[0..78] of string = (
'Default'
,'Letter'
,'LetterSmall'
,'Tabloid'
,'Ledger'
,'Legal'
,'Statement'
,'Executive'
,'A3'
,'A4'
,'A4Small'
,'A5'
,'B4'
,'B5'
,'Folio'
,'Quarto'
,'qr10X14'
,'qr11X17'
,'Note'
,'Env9'
,'Env10'
,'Env11'
,'Env12'
,'Env14'
,'CSheet'
,'DSheet'
,'ESheet'
,'Custom'
,'First'
,'Upper'
,'Lower'
,'Middle'
,'Manual'
,'Envelope'
,'EnvManual'
,'Auto'
,'Tractor'
,'SmallFormat'
,'LargeFormat'
,'LargeCapacity'
,'Cassette'
,'Last'
,'cQRName'
,'cQRVersion'
,'cQRPDefaultExt'
,'cQRDefaultExt'
,'rbTitle'
,'rbPageHeader'
,'rbDetail'
,'rbPageFooter'
,'rbSummary'
,'rbGroupHeader'
,'rbGroupFooter'
,'rbSubDetail'
,'rbColumnHeader'
,'rbOverlay'
,'rbChild'
,'cQRPageShadowWidth'
,'cQRPageFrameWidth'
,'cQRPageShadowColor'
,'cQRCornerSize'
,'MaxChar'
,'EofChar'
,'PredMax'
,'TwiceMax'
,'ROOT'
,'CM_QRPROGRESSUPDATE'
,'CM_QRPAGEAVAILABLE'
,'CM_QRPRINT'
,'CM_QRPRINTSETUP'
,'CM_QRPREVIEWCLOSE'
,'qrZoomToFit'
,'qrZoomToWidth'
,'qrZoomOther'
,'qrdMetafile'
,'qrdPrinter'
,'mpReady'
,'mpBusy'
,'mpFinished'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,Default));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,Letter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,LetterSmall));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,Tabloid));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,Ledger));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,Legal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,Statement));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,Executive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,A3));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,A4));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,A4Small));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,A5));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,B4));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,B5));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,Folio));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,Quarto));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,qr10X14));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,qr11X17));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,Note));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,Env9));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,Env10));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,Env11));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,Env12));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,Env14));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,CSheet));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,DSheet));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,ESheet));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,Custom));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,First));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,Upper));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,Lower));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,Middle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,Manual));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,Envelope));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,EnvManual));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,Auto));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,Tractor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,SmallFormat));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,LargeFormat));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,LargeCapacity));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,Cassette));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,Last));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,cQRName));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,cQRVersion));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,cQRPDefaultExt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,cQRDefaultExt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,rbTitle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,rbPageHeader));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[48] ,rbDetail));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[49] ,rbPageFooter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[50] ,rbSummary));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[51] ,rbGroupHeader));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[52] ,rbGroupFooter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[53] ,rbSubDetail));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[54] ,rbColumnHeader));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[55] ,rbOverlay));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[56] ,rbChild));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[57] ,cQRPageShadowWidth));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[58] ,cQRPageFrameWidth));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[59] ,cQRPageShadowColor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[60] ,cQRCornerSize));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[61] ,MaxChar));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[62] ,EofChar));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[63] ,PredMax));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[64] ,TwiceMax));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[65] ,ROOT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[66] ,CM_QRPROGRESSUPDATE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[67] ,CM_QRPAGEAVAILABLE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[68] ,CM_QRPRINT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[69] ,CM_QRPRINTSETUP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[70] ,CM_QRPREVIEWCLOSE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[71] ,qrZoomToFit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[72] ,qrZoomToWidth));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[73] ,qrZoomOther));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[74] ,qrdMetafile));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[75] ,qrdPrinter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[76] ,mpReady));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[77] ,mpBusy));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[78] ,mpFinished));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..13] of TClass = (
EQRError,
TPrinterSettings,
TQRCompress,
TQRExportFilter,
TQRExportFilterLibrary,
TQRExportFilterLibraryEntry,
TQRPageList,
TQRPreview,
TQRPreviewImage,
TQRPreviewInterface,
TQRPrinter,
TQRPrinterSettings,
TQRStandardPreviewInterface,
TQRStream
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..7] of string = (
'TCM_QRPageAvailable'
,'TCM_QRPreviewClose'
,'TCM_QRPrint'
,'TCM_QRPRogressUpdate'
,'GetFonts'
,'TempFilename'
,'QRPaperName'
,'QRPrinter'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TCM_QRPageAvailable_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(_TCM_QRPreviewClose_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[2],Addr(_TCM_QRPrint_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[3],Addr(_TCM_QRPRogressUpdate_)));
RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T0),[TypeInfo(TStrings)],Addr(GetFonts),cRegister);

RegisterProc(nil,MethodNames[5],mtProc,TypeInfo(_T1),[TypeInfo(string)],Addr(TempFilename),cRegister);

RegisterProc(nil,MethodNames[6],mtProc,TypeInfo(_T2),[
TypeInfo(TQRPaperSize),TypeInfo(string)],Addr(QRPaperName),cRegister);

RegisterProc(nil,MethodNames[7],mtProc,TypeInfo(_T4),[TypeInfo(TQRPrinter)],Addr(QRPrinter),cRegister);

RegisterProc(TPrinterSettings,'Create',mtConstructor,TypeInfo(_T5),NoParams,Addr(TPrinterSettings.Create),cRegister);

RegRegisterMethod(TPrinterSettings,'ApplySettings',TypeInfo(_T6),NoParams,Addr(TPrinterSettings.ApplySettings));

RegisterProc(TQRCompress,'Create',mtConstructor,TypeInfo(_T7),[
TypeInfo(TStream),
TypeInfo(Boolean)],Addr(TQRCompress.Create),cRegister);

RegRegisterMethod(TQRCompress,'Expand',TypeInfo(_T8),[
TypeInfo(Byte)],Addr(TQRCompress.Expand));

RegRegisterMethod(TQRCompress,'Compress',TypeInfo(_T9),[
TypeInfo(CodeType)],Addr(TQRCompress.Compress));

RegRegisterMethod(TQRExportFilter,'GetDescription',TypeInfo(_T10),[TypeInfo(string)], pointer(0));

RegRegisterMethod(TQRExportFilter,'GetExtension',TypeInfo(_T11),[TypeInfo(string)], pointer(4));

RegRegisterMethod(TQRExportFilter,'GetFilterName',TypeInfo(_T12),[TypeInfo(string)], pointer(8));

RegRegisterMethod(TQRExportFilter,'GetVendorName',TypeInfo(_T13),[TypeInfo(string)], pointer(12));

RegRegisterMethod(TQRExportFilter,'GetStreaming',TypeInfo(_T14),[TypeInfo(Boolean)], pointer(16));

RegisterProc(TQRExportFilter,'Create',mtConstructor,TypeInfo(_T15),[
TypeInfo(string)],Addr(TQRExportFilter.Create),cRegister);

RegRegisterMethod(TQRExportFilter,'Start',TypeInfo(_T16),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TFont)], pointer(20));

RegRegisterMethod(TQRExportFilter,'EndPage',TypeInfo(_T17),NoParams, pointer(24));

RegRegisterMethod(TQRExportFilter,'Finish',TypeInfo(_T18),NoParams, pointer(28));

RegRegisterMethod(TQRExportFilter,'NewPage',TypeInfo(_T19),NoParams, pointer(32));

RegRegisterMethod(TQRExportFilter,'TextOut',TypeInfo(_T20),[
TypeInfo(Extended),
TypeInfo(Extended),
TypeInfo(TFont),
TypeInfo(TColor),
TypeInfo(TAlignment),
TypeInfo(string)], pointer(36));

RegisterProc(TQRExportFilterLibrary,'Create',mtConstructor,TypeInfo(_T21),NoParams,Addr(TQRExportFilterLibrary.Create),cRegister);

RegisterProc(TQRPageList,'Create',mtConstructor,TypeInfo(_T24),NoParams,Addr(TQRPageList.Create),cRegister);

RegRegisterMethod(TQRPageList,'GetPage',TypeInfo(_T25),[
TypeInfo(Integer),TypeInfo(TMetafile)],Addr(TQRPageList.GetPage));

RegRegisterMethod(TQRPageList,'AddPage',TypeInfo(_T26),[
TypeInfo(TMetafile)],Addr(TQRPageList.AddPage));

RegRegisterMethod(TQRPageList,'Clear',TypeInfo(_T27),NoParams,Addr(TQRPageList.Clear));

RegRegisterMethod(TQRPageList,'Finish',TypeInfo(_T28),NoParams,Addr(TQRPageList.Finish));

RegRegisterMethod(TQRPageList,'LoadFromFile',TypeInfo(_T29),[
TypeInfo(string)],Addr(TQRPageList.LoadFromFile));

RegRegisterMethod(TQRPageList,'LockList',TypeInfo(_T30),NoParams,Addr(TQRPageList.LockList));

RegRegisterMethod(TQRPageList,'SaveToFile',TypeInfo(_T31),[
TypeInfo(string)],Addr(TQRPageList.SaveToFile));

RegRegisterMethod(TQRPageList,'UnlockList',TypeInfo(_T32),NoParams,Addr(TQRPageList.UnlockList));

RegRegisterMethod(TQRPreview,'UpdateImage',TypeInfo(_T33),NoParams,Addr(TQRPreview.UpdateImage));

RegRegisterMethod(TQRPreview,'UpdateZoom',TypeInfo(_T34),NoParams,Addr(TQRPreview.UpdateZoom));

RegRegisterMethod(TQRPreview,'ZoomToWidth',TypeInfo(_T35),NoParams,Addr(TQRPreview.ZoomToWidth));

RegRegisterMethod(TQRPreview,'ZoomToFit',TypeInfo(_T36),NoParams,Addr(TQRPreview.ZoomToFit));

RegRegisterMethod(TQRPreviewInterface,'Show',TypeInfo(_T37),[
TypeInfo(TQRPrinter),TypeInfo(TWinControl)], pointer(48));

RegRegisterMethod(TQRPreviewInterface,'ShowModal',TypeInfo(_T38),[
TypeInfo(TQRPrinter),TypeInfo(TWinControl)], pointer(52));

RegisterProc(TQRPrinter,'Create',mtConstructor,TypeInfo(_T39),NoParams,Addr(TQRPrinter.Create),cRegister);

RegRegisterMethod(TQRPrinter,'GetPage',TypeInfo(_T40),[
TypeInfo(Integer),TypeInfo(TMetafile)],Addr(TQRPrinter.GetPage));

RegRegisterMethod(TQRPrinter,'XPos',TypeInfo(_T41),[
TypeInfo(Extended),TypeInfo(Integer)],Addr(TQRPrinter.XPos));

RegRegisterMethod(TQRPrinter,'XSize',TypeInfo(_T42),[
TypeInfo(Extended),TypeInfo(Integer)],Addr(TQRPrinter.XSize));

RegRegisterMethod(TQRPrinter,'YPos',TypeInfo(_T43),[
TypeInfo(Extended),TypeInfo(Integer)],Addr(TQRPrinter.YPos));

RegRegisterMethod(TQRPrinter,'YSize',TypeInfo(_T44),[
TypeInfo(Extended),TypeInfo(Integer)],Addr(TQRPrinter.YSize));

RegRegisterMethod(TQRPrinter,'PaperLengthValue',TypeInfo(_T45),[TypeInfo(Integer)],Addr(TQRPrinter.PaperLengthValue));

RegRegisterMethod(TQRPrinter,'PaperWidthValue',TypeInfo(_T46),[TypeInfo(Integer)],Addr(TQRPrinter.PaperWidthValue));

RegRegisterMethod(TQRPrinter,'AbortDoc',TypeInfo(_T47),NoParams,Addr(TQRPrinter.AbortDoc));

RegRegisterMethod(TQRPrinter,'BeginDoc',TypeInfo(_T48),NoParams,Addr(TQRPrinter.BeginDoc));

RegRegisterMethod(TQRPrinter,'Cancel',TypeInfo(_T49),NoParams,Addr(TQRPrinter.Cancel));

RegRegisterMethod(TQRPrinter,'Cleanup',TypeInfo(_T50),NoParams,Addr(TQRPrinter.Cleanup));

RegRegisterMethod(TQRPrinter,'ClosePreview',TypeInfo(_T51),[
TypeInfo(TWinControl)],Addr(TQRPrinter.ClosePreview));

RegRegisterMethod(TQRPrinter,'EndDoc',TypeInfo(_T52),NoParams,Addr(TQRPrinter.EndDoc));

RegRegisterMethod(TQRPrinter,'ExportToFilter',TypeInfo(_T53),[
TypeInfo(TQRExportFilter)],Addr(TQRPrinter.ExportToFilter));

RegRegisterMethod(TQRPrinter,'Load',TypeInfo(_T54),[
TypeInfo(string)],Addr(TQRPrinter.Load));

RegRegisterMethod(TQRPrinter,'NewPage',TypeInfo(_T55),NoParams,Addr(TQRPrinter.NewPage));

RegRegisterMethod(TQRPrinter,'Preview',TypeInfo(_T56),NoParams,Addr(TQRPrinter.Preview));

RegRegisterMethod(TQRPrinter,'PreviewModal',TypeInfo(_T57),NoParams,Addr(TQRPrinter.PreviewModal));

RegRegisterMethod(TQRPrinter,'Print',TypeInfo(_T58),NoParams,Addr(TQRPrinter.Print));

RegRegisterMethod(TQRPrinter,'PrintSetup',TypeInfo(_T59),NoParams,Addr(TQRPrinter.PrintSetup));

RegRegisterMethod(TQRPrinter,'Save',TypeInfo(_T60),[
TypeInfo(string)],Addr(TQRPrinter.Save));

RegisterProc(TQRPrinterSettings,'Create',mtConstructor,TypeInfo(_T61),NoParams,Addr(TQRPrinterSettings.Create),cRegister);

RegRegisterMethod(TQRPrinterSettings,'ApplySettings',TypeInfo(_T62),[
TypeInfo(TQRPrinter)],Addr(TQRPrinterSettings.ApplySettings));

RegisterProc(TQRStream,'Create',mtConstructor,TypeInfo(_T63),[
TypeInfo(Longint)],Addr(TQRStream.Create),cRegister);

RegisterProc(TQRStream,'CreateFromFile',mtConstructor,TypeInfo(_T64),[
TypeInfo(string)],Addr(TQRStream.CreateFromFile),cRegister);

RegRegisterMethod(TQRStream,'LockStream',TypeInfo(_T65),NoParams,Addr(TQRStream.LockStream));

RegRegisterMethod(TQRStream,'UnlockStream',TypeInfo(_T66),NoParams,Addr(TQRStream.UnlockStream));

RegRegisterMethod(TQRStream,'SaveToStream',TypeInfo(_T67),[
TypeInfo(TStream)],Addr(TQRStream.SaveToStream));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'RegisterPreviewClass',mtProc,TypeInfo(_T3),[
TypeInfo(TQRPreviewInterfaceClass)],Addr(RegisterPreviewClass),cRegister)}

{RegRegisterMethod(TQRExportFilterLibrary,'AddFilter',TypeInfo(_T22),[
TypeInfo(TQRExportFilterClass)],Addr(TQRExportFilterLibrary.AddFilter))}

{RegRegisterMethod(TQRExportFilterLibrary,'RemoveFilter',TypeInfo(_T23),[
TypeInfo(TQRExportFilterClass)],Addr(TQRExportFilterLibrary.RemoveFilter))}

RegisterEvent(TypeInfo(TQRAfterPreviewEvent),[
TypeInfo(TObject)]);

RegisterEvent(TypeInfo(TQRAfterPrintEvent),[
TypeInfo(TObject)]);

RegisterEvent(TypeInfo(TQRExportToFilterEvent),[
TypeInfo(TQRExportFilter)]);

RegisterEvent(TypeInfo(TQRGenerateToPrinterEvent),NoParams);

RegisterEvent(TypeInfo(TQRPageAvailableEvent),[
TypeInfo(TObject),
TypeInfo(Integer)]);

RegisterEvent(TypeInfo(TQRPreviewEvent),NoParams);

RegisterEvent(TypeInfo(TQRPrintSetupEvent),NoParams);

RegisterEvent(TypeInfo(TQRProgressUpdateEvent),[
TypeInfo(TObject),
TypeInfo(Integer)]);

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
