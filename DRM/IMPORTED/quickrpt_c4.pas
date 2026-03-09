{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit QuickRpt_C4;
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
  Controls,
  StdCtrls,
  Sysutils,
  Graphics,
  Buttons,
  Dsgnintf,
  Forms,
  ExtCtrls,
  Dialogs,
  Printers,
  DB,
  DBTables,
  QRPrntr,
  QR3Const,
  QRPrgres,
  QRExpr,
  QRExpbld,
  QuickRpt;
function ConvertTQREvResultToVariant(var R : TQREvResult) : OleVariant;
function ConvertVariantToTQREvResult(const V : OleVariant) : TQREvResult;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TQREvResult__Wrapper = class(TDCRecordWrapper)
private
fR : TQREvResult;
public
function GetRecordPtr : pointer; override;
published
procedure setintResult(const val : Longint);
function getintResult : Longint;
property intResult : Longint read getintResult write setintResult;
procedure setdblResult(const val : Double);
function getdblResult : Double;
property dblResult : Double read getdblResult write setdblResult;
procedure setbooResult(const val : Boolean);
function getbooResult : Boolean;
property booResult : Boolean read getbooResult write setbooResult;
end;
type __TQRCustomController__ = class(TQRCustomController);
type
_T0 = procedure (p0 : TQuery;
p1 : TQREvEnvironment) of object;

_T1 = procedure  of object;

_T2 = _T1;

_T3 = function (p0 : TComponent;
p1 : string): string of object;

_T4 = procedure (p0 : TQRUnit) of object;

_T5 = _T1;

_T6 = procedure (p0 : Boolean) of object;

_T7 = _T1;

_T8 = _T1;

_T9 = _T1;

_T10 = _T1;

_T11 = _T6;

_T12 = procedure (p0 : TComponent;
p1 : Integer) of object;

_T13 = function (p0 : TQRBandType): TQRBand of object;

_T14 = function (p0 : TFont;
p1 : string): Integer of object;

_T15 = _T14;

_T16 = procedure (p0 : TQRCustomBand) of object;

_T17 = procedure (p0 : TQRPrintable) of object;

_T18 = _T1;

_T19 = procedure (p0 : TQRExportFilter) of object;

_T20 = _T1;

_T21 = _T1;

_T22 = _T1;

_T23 = _T1;

_T24 = _T1;

_T25 = _T1;

_T26 = _T1;

_T27 = _T1;

_T28 = _T1;

_T29 = _T1;

_T30 = _T1;

_T31 = _T1;

_T32 = _T16;

_T33 = _T1;

_T34 = _T16;

_T35 = procedure (p0 : Integer) of object;

_T36 = _T4;

_T37 = _T1;

_T38 = _T1;

_T39 = _T1;

_T40 = _T1;

_T41 = _T1;

_T42 = _T1;

_T43 = procedure (p0 : TComponent) of object;

_T44 = _T1;

_T45 = _T1;

_T46 = function : string of object;

_T47 = procedure (p0 : TCustomQuickRep) of object;

_T48 = _T46;

_T49 = _T46;

_T50 = _T47;

_T51 = procedure (p0 : TWriter) of object;

{_T52 = function (p0 : TQRNewComponentClass): TQRPrintable of object;}

_T53 = function (p0 : Extended): Boolean of object;

_T54 = function (p0 : Extended;
var p1 : Extended;
var p2 : Boolean): Boolean of object;

_T55 = function : IDispatch of object;

_T56 = _T1;

_T57 = _T1;

_T58 = _T1;

_T59 = _T1;

_T60 = _T1;

_T61 = _T1;

_T62 = _T1;

_T63 = _T1;

_T64 = _T1;

_T65 = _T6;

_T66 = _T1;

_T67 = _T17;

_T68 = _T1;

_T69 = function : Boolean of object;

_T70 = _T47;

_T71 = _T47;

_T72 = _T69;

{_T73 = function : TQRPrintableEditorClass of object;}

_T74 = _T1;

_T75 = _T1;

_T76 = procedure (p0 : Integer;
p1 : Integer) of object;

_T77 = procedure (p0 : TObject;
p1 : TQRNotifyOperation) of object;

_T78 = procedure (p0 : TAlignment) of object;

_T79 = _T1;

_T80 = function : TColor of object;

_T81 = function : TFont of object;

{_T82 = function : TQRPrintableClass of object;}

_T83 = _T46;

_T84 = _T46;

_T85 = _T46;

_T86 = function : TAlignment of object;

_T87 = _T78;

_T88 = procedure (p0 : TColor) of object;

_T89 = procedure (p0 : TFont) of object;

_T90 = procedure (p0 : string) of object;

_T91 = _T17;

_T92 = _T69;

_T93 = _T17;

_T94 = _T17;

_T95 = procedure (p0 : TQRSubDetail) of object;

_T96 = function (p0 : Extended;
p1 : TQRUnit;
p2 : Boolean): Extended of object;

_T97 = _T96;

_T98 = function : TQRUnit of object;

_T99 = _T1;

_T100 = procedure (p0 : TReader) of object;

_T101 = _T1;

_T102 = _T4;

_T103 = _T51;

_T104 = _T1;

_T105 = _T47;

function __TQREvResult__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TQREvResult__Wrapper.setintResult(const val : Longint);
begin
TQREvResult(GetRecordPtr^).intResult := val;
end;
function __TQREvResult__Wrapper.getintResult : Longint;
begin
result := TQREvResult(GetRecordPtr^).intResult;
end;
procedure __TQREvResult__Wrapper.setdblResult(const val : Double);
begin
TQREvResult(GetRecordPtr^).dblResult := val;
end;
function __TQREvResult__Wrapper.getdblResult : Double;
begin
result := TQREvResult(GetRecordPtr^).dblResult;
end;
procedure __TQREvResult__Wrapper.setbooResult(const val : Boolean);
begin
TQREvResult(GetRecordPtr^).booResult := val;
end;
function __TQREvResult__Wrapper.getbooResult : Boolean;
begin
result := TQREvResult(GetRecordPtr^).booResult;
end;
function __TQRCustomController__LocalVarValue__Wrapper(__Instance : TQRCustomController): IDispatch;
var
__result : TQREvResult;
__wrapper : __TQREvResult__Wrapper;
begin
__result := __TQRCustomController__(__Instance).LocalVarValue;
__wrapper := __TQREvResult__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;


type __TQREvResult__Wrapper__ = class(__TQREvResult__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TQREvResult__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTQREvResultToVariant(var R : TQREvResult) : OleVariant;
var
__rw : __TQREvResult__Wrapper__;
begin
__rw := __TQREvResult__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTQREvResult(const V : OleVariant) : TQREvResult;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TQREvResult((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTCustomQuickRep__Available(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomQuickRep(Instance).Available;
end;

function __DC__GetTCustomQuickRep__AllDataSets(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomQuickRep(Instance).AllDataSets);
end;

procedure __DC__SetTCustomQuickRep__AllDataSets(Instance : TObject; Params : PVariantArgList);
begin
TCustomQuickRep(Instance).AllDataSets:=TList(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomQuickRep__BandList(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomQuickRep(Instance).BandList);
end;

function __DC__GetTCustomQuickRep__Cancelled(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomQuickRep(Instance).Cancelled;
end;

function __DC__GetTCustomQuickRep__ColumnTopPosition(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomQuickRep(Instance).ColumnTopPosition;
end;

procedure __DC__SetTCustomQuickRep__ColumnTopPosition(Instance : TObject; Params : PVariantArgList);
begin
TCustomQuickRep(Instance).ColumnTopPosition:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomQuickRep__CurrentColumn(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomQuickRep(Instance).CurrentColumn;
end;

function __DC__GetTCustomQuickRep__CurrentX(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomQuickRep(Instance).CurrentX;
end;

procedure __DC__SetTCustomQuickRep__CurrentX(Instance : TObject; Params : PVariantArgList);
begin
TCustomQuickRep(Instance).CurrentX:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomQuickRep__CurrentY(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomQuickRep(Instance).CurrentY;
end;

procedure __DC__SetTCustomQuickRep__CurrentY(Instance : TObject; Params : PVariantArgList);
begin
TCustomQuickRep(Instance).CurrentY:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomQuickRep__ExportFilter(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomQuickRep(Instance).ExportFilter);
end;

procedure __DC__SetTCustomQuickRep__ExportFilter(Instance : TObject; Params : PVariantArgList);
begin
TCustomQuickRep(Instance).ExportFilter:=TQRExportFilter(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomQuickRep__Exporting(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomQuickRep(Instance).Exporting;
end;

function __DC__GetTCustomQuickRep__FinalPass(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomQuickRep(Instance).FinalPass;
end;

function __DC__GetTCustomQuickRep__HideBands(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomQuickRep(Instance).HideBands;
end;

procedure __DC__SetTCustomQuickRep__HideBands(Instance : TObject; Params : PVariantArgList);
begin
TCustomQuickRep(Instance).HideBands:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomQuickRep__PageNumber(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomQuickRep(Instance).PageNumber;
end;

function __DC__GetTCustomQuickRep__Printer(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomQuickRep(Instance).Printer);
end;

function __DC__GetTCustomQuickRep__QRPrinter(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomQuickRep(Instance).QRPrinter);
end;

procedure __DC__SetTCustomQuickRep__QRPrinter(Instance : TObject; Params : PVariantArgList);
begin
TCustomQuickRep(Instance).QRPrinter:=TQRPrinter(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomQuickRep__RotateBands(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomQuickRep(Instance).RotateBands;
end;

procedure __DC__SetTCustomQuickRep__RotateBands(Instance : TObject; Params : PVariantArgList);
begin
TCustomQuickRep(Instance).RotateBands:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomQuickRep__State(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomQuickRep(Instance).State;
end;

procedure __DC__SetTCustomQuickRep__State(Instance : TObject; Params : PVariantArgList);
begin
TCustomQuickRep(Instance).State:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomQuickRep__Bands(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomQuickRep(Instance).Bands);
end;

procedure __DC__SetTCustomQuickRep__Bands(Instance : TObject; Params : PVariantArgList);
begin
TCustomQuickRep(Instance).Bands:=TQuickRepBands(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomQuickRep__Description(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomQuickRep(Instance).Description);
end;

procedure __DC__SetTCustomQuickRep__Description(Instance : TObject; Params : PVariantArgList);
begin
TCustomQuickRep(Instance).Description:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomQuickRep__Font(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomQuickRep(Instance).Font);
end;

procedure __DC__SetTCustomQuickRep__Font(Instance : TObject; Params : PVariantArgList);
begin
TCustomQuickRep(Instance).Font:=TFont(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomQuickRep__Functions(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomQuickRep(Instance).Functions);
end;

procedure __DC__SetTCustomQuickRep__Functions(Instance : TObject; Params : PVariantArgList);
begin
TCustomQuickRep(Instance).Functions:=TQREvEnvironment(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomQuickRep__Options(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TQuickReportOptions;
begin
tmp := TCustomQuickRep(Instance).Options;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTCustomQuickRep__Options(Instance : TObject; Params : PVariantArgList);
var
  tmp : TQuickReportOptions;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TCustomQuickRep(Instance).Options:=tmp;
end;

function __DC__GetTCustomQuickRep__Page(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomQuickRep(Instance).Page);
end;

procedure __DC__SetTCustomQuickRep__Page(Instance : TObject; Params : PVariantArgList);
begin
TCustomQuickRep(Instance).Page:=TQRPage(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomQuickRep__PrintIfEmpty(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomQuickRep(Instance).PrintIfEmpty;
end;

procedure __DC__SetTCustomQuickRep__PrintIfEmpty(Instance : TObject; Params : PVariantArgList);
begin
TCustomQuickRep(Instance).PrintIfEmpty:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomQuickRep__PrinterSettings(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomQuickRep(Instance).PrinterSettings);
end;

procedure __DC__SetTCustomQuickRep__PrinterSettings(Instance : TObject; Params : PVariantArgList);
begin
TCustomQuickRep(Instance).PrinterSettings:=TQuickRepPrinterSettings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomQuickRep__ReportTitle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomQuickRep(Instance).ReportTitle;
end;

procedure __DC__SetTCustomQuickRep__ReportTitle(Instance : TObject; Params : PVariantArgList);
begin
TCustomQuickRep(Instance).ReportTitle:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomQuickRep__ShowProgress(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomQuickRep(Instance).ShowProgress;
end;

procedure __DC__SetTCustomQuickRep__ShowProgress(Instance : TObject; Params : PVariantArgList);
begin
TCustomQuickRep(Instance).ShowProgress:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomQuickRep__SnapToGrid(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomQuickRep(Instance).SnapToGrid;
end;

procedure __DC__SetTCustomQuickRep__SnapToGrid(Instance : TObject; Params : PVariantArgList);
begin
TCustomQuickRep(Instance).SnapToGrid:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomQuickRep__Units(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomQuickRep(Instance).Units;
end;

procedure __DC__SetTCustomQuickRep__Units(Instance : TObject; Params : PVariantArgList);
begin
TCustomQuickRep(Instance).Units:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomQuickRep__Zoom(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomQuickRep(Instance).Zoom;
end;

procedure __DC__SetTCustomQuickRep__Zoom(Instance : TObject; Params : PVariantArgList);
begin
TCustomQuickRep(Instance).Zoom:=OleVariant(Params^[0]);
end;

function __DC__GetTQRBandSize__Length(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRBandSize(Instance).Length;
end;

procedure __DC__SetTQRBandSize__Length(Instance : TObject; Params : PVariantArgList);
begin
TQRBandSize(Instance).Length:=OleVariant(Params^[0]);
end;

function __DC__GetTQRBasePanel__Zoom(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRBasePanel(Instance).Zoom;
end;

procedure __DC__SetTQRBasePanel__Zoom(Instance : TObject; Params : PVariantArgList);
begin
TQRBasePanel(Instance).Zoom:=OleVariant(Params^[0]);
end;

function __DC__GetTQRBasePanel__FontSize(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRBasePanel(Instance).FontSize;
end;

procedure __DC__SetTQRBasePanel__FontSize(Instance : TObject; Params : PVariantArgList);
begin
TQRBasePanel(Instance).FontSize:=OleVariant(Params^[0]);
end;

function __DC__GetTQRCompositeReport__index(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRCompositeReport(Instance).index;
end;

function __DC__GetTQRCompositeReport__Reports(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRCompositeReport(Instance).Reports);
end;

procedure __DC__SetTQRCompositeReport__Reports(Instance : TObject; Params : PVariantArgList);
begin
TQRCompositeReport(Instance).Reports:=TList(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRController__DataSet(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRController(Instance).DataSet);
end;

procedure __DC__SetTQRController__DataSet(Instance : TObject; Params : PVariantArgList);
begin
TQRController(Instance).DataSet:=TDataSet(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRController__DetailNumber(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRController(Instance).DetailNumber;
end;

function __DC__GetTQRController__Detail(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRController(Instance).Detail);
end;

procedure __DC__SetTQRController__Detail(Instance : TObject; Params : PVariantArgList);
begin
TQRController(Instance).Detail:=TQRCustomBand(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRController__Footer(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRController(Instance).Footer);
end;

procedure __DC__SetTQRController__Footer(Instance : TObject; Params : PVariantArgList);
begin
TQRController(Instance).Footer:=TQRCustomBand(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRController__Header(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRController(Instance).Header);
end;

procedure __DC__SetTQRController__Header(Instance : TObject; Params : PVariantArgList);
begin
TQRController(Instance).Header:=TQRCustomBand(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRControllerBand__PrintIfEmpty(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRControllerBand(Instance).PrintIfEmpty;
end;

procedure __DC__SetTQRControllerBand__PrintIfEmpty(Instance : TObject; Params : PVariantArgList);
begin
TQRControllerBand(Instance).PrintIfEmpty:=OleVariant(Params^[0]);
end;

function __DC__GetTQRControllerBand__PrintBefore(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRControllerBand(Instance).PrintBefore;
end;

procedure __DC__SetTQRControllerBand__PrintBefore(Instance : TObject; Params : PVariantArgList);
begin
TQRControllerBand(Instance).PrintBefore:=OleVariant(Params^[0]);
end;

function __DC__GetTQRCreateReportThread__QuickRep(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRCreateReportThread(Instance).QuickRep);
end;

procedure __DC__SetTQRCreateReportThread__QuickRep(Instance : TObject; Params : PVariantArgList);
begin
TQRCreateReportThread(Instance).QuickRep:=TCustomQuickRep(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRCustomBand__Expanded(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRCustomBand(Instance).Expanded;
end;

function __DC__GetTQRCustomBand__BandType(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRCustomBand(Instance).BandType;
end;

procedure __DC__SetTQRCustomBand__BandType(Instance : TObject; Params : PVariantArgList);
begin
TQRCustomBand(Instance).BandType:=OleVariant(Params^[0]);
end;

function __DC__GetTQRCustomBand__ChildBand(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRCustomBand(Instance).ChildBand);
end;

function __DC__GetTQRCustomBand__ParentReport(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRCustomBand(Instance).ParentReport);
end;

procedure __DC__SetTQRCustomBand__ParentReport(Instance : TObject; Params : PVariantArgList);
begin
TQRCustomBand(Instance).ParentReport:=TCustomQuickRep(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRCustomController__Master(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRCustomController(Instance).Master);
end;

procedure __DC__SetTQRCustomController__Master(Instance : TObject; Params : PVariantArgList);
begin
TQRCustomController(Instance).Master:=TComponent(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRCustomController__ParentReport(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRCustomController(Instance).ParentReport);
end;

procedure __DC__SetTQRCustomController__ParentReport(Instance : TObject; Params : PVariantArgList);
begin
TQRCustomController(Instance).ParentReport:=TCustomQuickRep(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRCustomController__PrintBefore(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRCustomController(Instance).PrintBefore;
end;

procedure __DC__SetTQRCustomController__PrintBefore(Instance : TObject; Params : PVariantArgList);
begin
TQRCustomController(Instance).PrintBefore:=OleVariant(Params^[0]);
end;

function __DC__GetTQRCustomController__PrintIfEmpty(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRCustomController(Instance).PrintIfEmpty;
end;

procedure __DC__SetTQRCustomController__PrintIfEmpty(Instance : TObject; Params : PVariantArgList);
begin
TQRCustomController(Instance).PrintIfEmpty:=OleVariant(Params^[0]);
end;

function __DC__GetTQRCustomController__SelfCheck(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRCustomController(Instance).SelfCheck);
end;

procedure __DC__SetTQRCustomController__SelfCheck(Instance : TObject; Params : PVariantArgList);
begin
TQRCustomController(Instance).SelfCheck:=TComponent(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRFrame__Parent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRFrame(Instance).Parent);
end;

procedure __DC__SetTQRFrame__Parent(Instance : TObject; Params : PVariantArgList);
begin
TQRFrame(Instance).Parent:=TControl(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRLoopBand__Count(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRLoopBand(Instance).Count;
end;

function __DC__GetTQRLoopController__Detail(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRLoopController(Instance).Detail);
end;

procedure __DC__SetTQRLoopController__Detail(Instance : TObject; Params : PVariantArgList);
begin
TQRLoopController(Instance).Detail:=TQRCustomBand(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRLoopController__PrintCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRLoopController(Instance).PrintCount;
end;

procedure __DC__SetTQRLoopController__PrintCount(Instance : TObject; Params : PVariantArgList);
begin
TQRLoopController(Instance).PrintCount:=OleVariant(Params^[0]);
end;

function __DC__GetTQRLoopController__Count(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRLoopController(Instance).Count;
end;

procedure __DC__SetTQRLoopController__Count(Instance : TObject; Params : PVariantArgList);
begin
TQRLoopController(Instance).Count:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrintable__ParentReport(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRPrintable(Instance).ParentReport);
end;

procedure __DC__SetTQRPrintable__ParentReport(Instance : TObject; Params : PVariantArgList);
begin
TQRPrintable(Instance).ParentReport:=TCustomQuickRep(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRPrintable__Zoom(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrintable(Instance).Zoom;
end;

procedure __DC__SetTQRPrintable__Zoom(Instance : TObject; Params : PVariantArgList);
begin
TQRPrintable(Instance).Zoom:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrintableEditor__Alignment(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrintableEditor(Instance).Alignment;
end;

procedure __DC__SetTQRPrintableEditor__Alignment(Instance : TObject; Params : PVariantArgList);
begin
TQRPrintableEditor(Instance).Alignment:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrintableEditor__Control(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRPrintableEditor(Instance).Control);
end;

procedure __DC__SetTQRPrintableEditor__Control(Instance : TObject; Params : PVariantArgList);
begin
TQRPrintableEditor(Instance).Control:=TQRPrintable(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRPrintableEditor__Color(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrintableEditor(Instance).Color;
end;

procedure __DC__SetTQRPrintableEditor__Color(Instance : TObject; Params : PVariantArgList);
begin
TQRPrintableEditor(Instance).Color:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrintableEditor__Font(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRPrintableEditor(Instance).Font);
end;

procedure __DC__SetTQRPrintableEditor__Font(Instance : TObject; Params : PVariantArgList);
begin
TQRPrintableEditor(Instance).Font:=TFont(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRPrintableEditor__Value(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrintableEditor(Instance).Value;
end;

procedure __DC__SetTQRPrintableEditor__Value(Instance : TObject; Params : PVariantArgList);
begin
TQRPrintableEditor(Instance).Value:=OleVariant(Params^[0]);
end;

function __DC__GetTQRPrintableEditor__GlyphResName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrintableEditor(Instance).GlyphResName;
end;

function __DC__GetTQRPrintableEditor__ControlName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRPrintableEditor(Instance).ControlName;
end;

function __DC__GetTQRStringsBand__Item(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRStringsBand(Instance).Item;
end;

function __DC__GetTQRStringsBand__index(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRStringsBand(Instance).index;
end;

function __DC__GetTQRStringsController__Detail(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRStringsController(Instance).Detail);
end;

procedure __DC__SetTQRStringsController__Detail(Instance : TObject; Params : PVariantArgList);
begin
TQRStringsController(Instance).Detail:=TQRCustomBand(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRStringsController__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRStringsController(Instance).Items);
end;

procedure __DC__SetTQRStringsController__Items(Instance : TObject; Params : PVariantArgList);
begin
TQRStringsController(Instance).Items:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRStringsController__index(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRStringsController(Instance).index;
end;

procedure __DC__SetTQRStringsController__index(Instance : TObject; Params : PVariantArgList);
begin
TQRStringsController(Instance).index:=OleVariant(Params^[0]);
end;

function __DC__GetTQRSubDetailGroupBands__FooterBand(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRSubDetailGroupBands(Instance).FooterBand);
end;

function __DC__GetTQRSubDetailGroupBands__HeaderBand(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRSubDetailGroupBands(Instance).HeaderBand);
end;

function __DC__GetTQRUnitBase__ParentReport(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRUnitBase(Instance).ParentReport);
end;

procedure __DC__SetTQRUnitBase__ParentReport(Instance : TObject; Params : PVariantArgList);
begin
TQRUnitBase(Instance).ParentReport:=TCustomQuickRep(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRUnitBase__ParentUpdating(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRUnitBase(Instance).ParentUpdating;
end;

procedure __DC__SetTQRUnitBase__ParentUpdating(Instance : TObject; Params : PVariantArgList);
begin
TQRUnitBase(Instance).ParentUpdating:=OleVariant(Params^[0]);
end;

function __DC__GetTQRUnitBase__Resolution(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRUnitBase(Instance).Resolution;
end;

function __DC__GetTQRUnitBase__Units(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRUnitBase(Instance).Units;
end;

procedure __DC__SetTQRUnitBase__Units(Instance : TObject; Params : PVariantArgList);
begin
TQRUnitBase(Instance).Units:=OleVariant(Params^[0]);
end;

function __DC__GetTQRUnitBase__Zoom(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRUnitBase(Instance).Zoom;
end;

procedure __DC__SetTQRUnitBase__Zoom(Instance : TObject; Params : PVariantArgList);
begin
TQRUnitBase(Instance).Zoom:=OleVariant(Params^[0]);
end;

function __DC__GetTQuickRep__RecordCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQuickRep(Instance).RecordCount;
end;

function __DC__GetTQuickRep__RecordNumber(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQuickRep(Instance).RecordNumber;
end;

function __DC__GetTQuickRepBands__TitleBand(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQuickRepBands(Instance).TitleBand);
end;

function __DC__GetTQuickRepBands__PageHeaderBand(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQuickRepBands(Instance).PageHeaderBand);
end;

function __DC__GetTQuickRepBands__ColumnHeaderBand(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQuickRepBands(Instance).ColumnHeaderBand);
end;

function __DC__GetTQuickRepBands__DetailBand(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQuickRepBands(Instance).DetailBand);
end;

function __DC__GetTQuickRepBands__ColumnFooterBand(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQuickRepBands(Instance).ColumnFooterBand);
end;

function __DC__GetTQuickRepBands__PageFooterBand(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQuickRepBands(Instance).PageFooterBand);
end;

function __DC__GetTQuickRepBands__SummaryBand(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQuickRepBands(Instance).SummaryBand);
end;

procedure __RegisterProps;
begin
RegisterProperty(TCustomQuickRep,'Available',__DC__GetTCustomQuickRep__Available,nil);
RegisterProperty(TCustomQuickRep,'AllDataSets',__DC__GetTCustomQuickRep__AllDataSets,__DC__SetTCustomQuickRep__AllDataSets);
RegisterProperty(TCustomQuickRep,'BandList',__DC__GetTCustomQuickRep__BandList,nil);
RegisterProperty(TCustomQuickRep,'Cancelled',__DC__GetTCustomQuickRep__Cancelled,nil);
RegisterProperty(TCustomQuickRep,'ColumnTopPosition',__DC__GetTCustomQuickRep__ColumnTopPosition,__DC__SetTCustomQuickRep__ColumnTopPosition);
RegisterProperty(TCustomQuickRep,'CurrentColumn',__DC__GetTCustomQuickRep__CurrentColumn,nil);
RegisterProperty(TCustomQuickRep,'CurrentX',__DC__GetTCustomQuickRep__CurrentX,__DC__SetTCustomQuickRep__CurrentX);
RegisterProperty(TCustomQuickRep,'CurrentY',__DC__GetTCustomQuickRep__CurrentY,__DC__SetTCustomQuickRep__CurrentY);
RegisterProperty(TCustomQuickRep,'ExportFilter',__DC__GetTCustomQuickRep__ExportFilter,__DC__SetTCustomQuickRep__ExportFilter);
RegisterProperty(TCustomQuickRep,'Exporting',__DC__GetTCustomQuickRep__Exporting,nil);
RegisterProperty(TCustomQuickRep,'FinalPass',__DC__GetTCustomQuickRep__FinalPass,nil);
RegisterProperty(TCustomQuickRep,'HideBands',__DC__GetTCustomQuickRep__HideBands,__DC__SetTCustomQuickRep__HideBands);
RegisterProperty(TCustomQuickRep,'PageNumber',__DC__GetTCustomQuickRep__PageNumber,nil);
RegisterProperty(TCustomQuickRep,'Printer',__DC__GetTCustomQuickRep__Printer,nil);
RegisterProperty(TCustomQuickRep,'QRPrinter',__DC__GetTCustomQuickRep__QRPrinter,__DC__SetTCustomQuickRep__QRPrinter);
RegisterProperty(TCustomQuickRep,'RotateBands',__DC__GetTCustomQuickRep__RotateBands,__DC__SetTCustomQuickRep__RotateBands);
RegisterProperty(TCustomQuickRep,'State',__DC__GetTCustomQuickRep__State,__DC__SetTCustomQuickRep__State);
RegisterProperty(TCustomQuickRep,'Bands',__DC__GetTCustomQuickRep__Bands,__DC__SetTCustomQuickRep__Bands);
RegisterProperty(TCustomQuickRep,'Description',__DC__GetTCustomQuickRep__Description,__DC__SetTCustomQuickRep__Description);
RegisterProperty(TCustomQuickRep,'Font',__DC__GetTCustomQuickRep__Font,__DC__SetTCustomQuickRep__Font);
RegisterProperty(TCustomQuickRep,'Functions',__DC__GetTCustomQuickRep__Functions,__DC__SetTCustomQuickRep__Functions);
RegisterProperty(TCustomQuickRep,'Options',__DC__GetTCustomQuickRep__Options,__DC__SetTCustomQuickRep__Options);
RegisterProperty(TCustomQuickRep,'Page',__DC__GetTCustomQuickRep__Page,__DC__SetTCustomQuickRep__Page);
RegisterProperty(TCustomQuickRep,'PrintIfEmpty',__DC__GetTCustomQuickRep__PrintIfEmpty,__DC__SetTCustomQuickRep__PrintIfEmpty);
RegisterProperty(TCustomQuickRep,'PrinterSettings',__DC__GetTCustomQuickRep__PrinterSettings,__DC__SetTCustomQuickRep__PrinterSettings);
RegisterProperty(TCustomQuickRep,'ReportTitle',__DC__GetTCustomQuickRep__ReportTitle,__DC__SetTCustomQuickRep__ReportTitle);
RegisterProperty(TCustomQuickRep,'ShowProgress',__DC__GetTCustomQuickRep__ShowProgress,__DC__SetTCustomQuickRep__ShowProgress);
RegisterProperty(TCustomQuickRep,'SnapToGrid',__DC__GetTCustomQuickRep__SnapToGrid,__DC__SetTCustomQuickRep__SnapToGrid);
RegisterProperty(TCustomQuickRep,'Units',__DC__GetTCustomQuickRep__Units,__DC__SetTCustomQuickRep__Units);
RegisterProperty(TCustomQuickRep,'Zoom',__DC__GetTCustomQuickRep__Zoom,__DC__SetTCustomQuickRep__Zoom);
RegisterProperty(TQRBandSize,'Length',__DC__GetTQRBandSize__Length,__DC__SetTQRBandSize__Length);
RegisterProperty(TQRBasePanel,'Zoom',__DC__GetTQRBasePanel__Zoom,__DC__SetTQRBasePanel__Zoom);
RegisterProperty(TQRBasePanel,'FontSize',__DC__GetTQRBasePanel__FontSize,__DC__SetTQRBasePanel__FontSize);
RegisterProperty(TQRCompositeReport,'index',__DC__GetTQRCompositeReport__index,nil);
RegisterProperty(TQRCompositeReport,'Reports',__DC__GetTQRCompositeReport__Reports,__DC__SetTQRCompositeReport__Reports);
RegisterProperty(TQRController,'DataSet',__DC__GetTQRController__DataSet,__DC__SetTQRController__DataSet);
RegisterProperty(TQRController,'DetailNumber',__DC__GetTQRController__DetailNumber,nil);
RegisterProperty(TQRController,'Detail',__DC__GetTQRController__Detail,__DC__SetTQRController__Detail);
RegisterProperty(TQRController,'Footer',__DC__GetTQRController__Footer,__DC__SetTQRController__Footer);
RegisterProperty(TQRController,'Header',__DC__GetTQRController__Header,__DC__SetTQRController__Header);
RegisterProperty(TQRControllerBand,'PrintIfEmpty',__DC__GetTQRControllerBand__PrintIfEmpty,__DC__SetTQRControllerBand__PrintIfEmpty);
RegisterProperty(TQRControllerBand,'PrintBefore',__DC__GetTQRControllerBand__PrintBefore,__DC__SetTQRControllerBand__PrintBefore);
RegisterProperty(TQRCreateReportThread,'QuickRep',__DC__GetTQRCreateReportThread__QuickRep,__DC__SetTQRCreateReportThread__QuickRep);
RegisterProperty(TQRCustomBand,'Expanded',__DC__GetTQRCustomBand__Expanded,nil);
RegisterProperty(TQRCustomBand,'BandType',__DC__GetTQRCustomBand__BandType,__DC__SetTQRCustomBand__BandType);
RegisterProperty(TQRCustomBand,'ChildBand',__DC__GetTQRCustomBand__ChildBand,nil);
RegisterProperty(TQRCustomBand,'ParentReport',__DC__GetTQRCustomBand__ParentReport,__DC__SetTQRCustomBand__ParentReport);
RegisterProperty(TQRCustomController,'Master',__DC__GetTQRCustomController__Master,__DC__SetTQRCustomController__Master);
RegisterProperty(TQRCustomController,'ParentReport',__DC__GetTQRCustomController__ParentReport,__DC__SetTQRCustomController__ParentReport);
RegisterProperty(TQRCustomController,'PrintBefore',__DC__GetTQRCustomController__PrintBefore,__DC__SetTQRCustomController__PrintBefore);
RegisterProperty(TQRCustomController,'PrintIfEmpty',__DC__GetTQRCustomController__PrintIfEmpty,__DC__SetTQRCustomController__PrintIfEmpty);
RegisterProperty(TQRCustomController,'SelfCheck',__DC__GetTQRCustomController__SelfCheck,__DC__SetTQRCustomController__SelfCheck);
RegisterProperty(TQRFrame,'Parent',__DC__GetTQRFrame__Parent,__DC__SetTQRFrame__Parent);
RegisterProperty(TQRLoopBand,'Count',__DC__GetTQRLoopBand__Count,nil);
RegisterProperty(TQRLoopController,'Detail',__DC__GetTQRLoopController__Detail,__DC__SetTQRLoopController__Detail);
RegisterProperty(TQRLoopController,'PrintCount',__DC__GetTQRLoopController__PrintCount,__DC__SetTQRLoopController__PrintCount);
RegisterProperty(TQRLoopController,'Count',__DC__GetTQRLoopController__Count,__DC__SetTQRLoopController__Count);
RegisterProperty(TQRPrintable,'ParentReport',__DC__GetTQRPrintable__ParentReport,__DC__SetTQRPrintable__ParentReport);
RegisterProperty(TQRPrintable,'Zoom',__DC__GetTQRPrintable__Zoom,__DC__SetTQRPrintable__Zoom);
RegisterProperty(TQRPrintableEditor,'Alignment',__DC__GetTQRPrintableEditor__Alignment,__DC__SetTQRPrintableEditor__Alignment);
RegisterProperty(TQRPrintableEditor,'Control',__DC__GetTQRPrintableEditor__Control,__DC__SetTQRPrintableEditor__Control);
RegisterProperty(TQRPrintableEditor,'Color',__DC__GetTQRPrintableEditor__Color,__DC__SetTQRPrintableEditor__Color);
RegisterProperty(TQRPrintableEditor,'Font',__DC__GetTQRPrintableEditor__Font,__DC__SetTQRPrintableEditor__Font);
RegisterProperty(TQRPrintableEditor,'Value',__DC__GetTQRPrintableEditor__Value,__DC__SetTQRPrintableEditor__Value);
RegisterProperty(TQRPrintableEditor,'GlyphResName',__DC__GetTQRPrintableEditor__GlyphResName,nil);
RegisterProperty(TQRPrintableEditor,'ControlName',__DC__GetTQRPrintableEditor__ControlName,nil);
RegisterProperty(TQRStringsBand,'Item',__DC__GetTQRStringsBand__Item,nil);
RegisterProperty(TQRStringsBand,'index',__DC__GetTQRStringsBand__index,nil);
RegisterProperty(TQRStringsController,'Detail',__DC__GetTQRStringsController__Detail,__DC__SetTQRStringsController__Detail);
RegisterProperty(TQRStringsController,'Items',__DC__GetTQRStringsController__Items,__DC__SetTQRStringsController__Items);
RegisterProperty(TQRStringsController,'index',__DC__GetTQRStringsController__index,__DC__SetTQRStringsController__index);
RegisterProperty(TQRSubDetailGroupBands,'FooterBand',__DC__GetTQRSubDetailGroupBands__FooterBand,nil);
RegisterProperty(TQRSubDetailGroupBands,'HeaderBand',__DC__GetTQRSubDetailGroupBands__HeaderBand,nil);
RegisterProperty(TQRUnitBase,'ParentReport',__DC__GetTQRUnitBase__ParentReport,__DC__SetTQRUnitBase__ParentReport);
RegisterProperty(TQRUnitBase,'ParentUpdating',__DC__GetTQRUnitBase__ParentUpdating,__DC__SetTQRUnitBase__ParentUpdating);
RegisterProperty(TQRUnitBase,'Resolution',__DC__GetTQRUnitBase__Resolution,nil);
RegisterProperty(TQRUnitBase,'Units',__DC__GetTQRUnitBase__Units,__DC__SetTQRUnitBase__Units);
RegisterProperty(TQRUnitBase,'Zoom',__DC__GetTQRUnitBase__Zoom,__DC__SetTQRUnitBase__Zoom);
RegisterProperty(TQuickRep,'RecordCount',__DC__GetTQuickRep__RecordCount,nil);
RegisterProperty(TQuickRep,'RecordNumber',__DC__GetTQuickRep__RecordNumber,nil);
RegisterProperty(TQuickRepBands,'TitleBand',__DC__GetTQuickRepBands__TitleBand,nil);
RegisterProperty(TQuickRepBands,'PageHeaderBand',__DC__GetTQuickRepBands__PageHeaderBand,nil);
RegisterProperty(TQuickRepBands,'ColumnHeaderBand',__DC__GetTQuickRepBands__ColumnHeaderBand,nil);
RegisterProperty(TQuickRepBands,'DetailBand',__DC__GetTQuickRepBands__DetailBand,nil);
RegisterProperty(TQuickRepBands,'ColumnFooterBand',__DC__GetTQuickRepBands__ColumnFooterBand,nil);
RegisterProperty(TQuickRepBands,'PageFooterBand',__DC__GetTQuickRepBands__PageFooterBand,nil);
RegisterProperty(TQuickRepBands,'SummaryBand',__DC__GetTQuickRepBands__SummaryBand,nil);
end;

const __ConstNames0 : array[0..17] of string = (
'qrMasterDataAdvance'
,'qrBandPrinted'
,'qrBandSizeChange'
,'MM'
,'Inches'
,'Pixels'
,'Characters'
,'Native'
,'ColByCol'
,'RowByRow'
,'qrAvailable'
,'qrPrepare'
,'qrPreview'
,'qrPrint'
,'qrEdit'
,'FirstPageHeader'
,'LastPageFooter'
,'Compression'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,qrMasterDataAdvance));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,qrBandPrinted));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,qrBandSizeChange));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,MM));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,Inches));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,Pixels));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,Characters));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,Native));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,ColByCol));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,RowByRow));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,qrAvailable));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,qrPrepare));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,qrPreview));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,qrPrint));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,qrEdit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,FirstPageHeader));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,LastPageFooter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,Compression));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..31] of TClass = (
TCustomQuickRep,
TQRBand,
TQRBandSize,
TQRBasePanel,
TQRChildBand,
TQRCompositePrinterSettings,
TQRCompositeReport,
TQRCompositeWinControl,
TQRController,
TQRControllerBand,
TQRCreateReportThread,
TQRCustomBand,
TQRCustomController,
TQRFrame,
TQRGroup,
TQRLabelSetup,
TQRLoopBand,
TQRLoopController,
TQRPage,
TQRPrintable,
TQRPrintableEditor,
TQRPrintableSize,
TQRStringsBand,
TQRStringsController,
TQRSubDetail,
TQRSubDetailGroupBands,
TQRUnitBase,
TQuickAbstractRep,
TQuickLabelReport,
TQuickRep,
TQuickRepBands,
TQuickRepPrinterSettings
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..3] of string = (
'PerformSQLParamsUpdate'
,'SetQRHiColor'
,'SetQRLoColor'
,'UniqueName'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T0),[
TypeInfo(TQuery),
TypeInfo(TQREvEnvironment)],Addr(PerformSQLParamsUpdate),cRegister);

RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T1),NoParams,Addr(SetQRHiColor),cRegister);

RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T2),NoParams,Addr(SetQRLoColor),cRegister);

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T3),[
TypeInfo(TComponent),
TypeInfo(string),TypeInfo(string)],Addr(UniqueName),cRegister);

RegRegisterMethod(TCustomQuickRep,'SetUnits',TypeInfo(_T4),[
TypeInfo(TQRUnit)], pointer(196));

RegRegisterMethod(TCustomQuickRep,'Execute',TypeInfo(_T5),NoParams, pointer(200));

RegRegisterMethod(TCustomQuickRep,'CreateReport',TypeInfo(_T6),[
TypeInfo(Boolean)], pointer(204));

RegRegisterMethod(TCustomQuickRep,'PaintColumns',TypeInfo(_T7),NoParams, pointer(208));

RegRegisterMethod(TCustomQuickRep,'PaintMargins',TypeInfo(_T8),NoParams, pointer(212));

RegRegisterMethod(TCustomQuickRep,'PaintFrame',TypeInfo(_T9),NoParams, pointer(216));

RegRegisterMethod(TCustomQuickRep,'SetControllerBands',TypeInfo(_T10),NoParams, pointer(220));

RegRegisterMethod(TCustomQuickRep,'SetPrintIfEmpty',TypeInfo(_T11),[
TypeInfo(Boolean)], pointer(224));

RegisterProc(TCustomQuickRep,'CreateNew',mtConstructor,TypeInfo(_T12),[
TypeInfo(TComponent),
TypeInfo(Integer)], pointer(228),cRegister);

RegRegisterMethod(TCustomQuickRep,'CreateBand',TypeInfo(_T13),[
TypeInfo(TQRBandType),TypeInfo(TQRBand)],Addr(TCustomQuickRep.CreateBand));

RegRegisterMethod(TCustomQuickRep,'TextHeight',TypeInfo(_T14),[
TypeInfo(TFont),
TypeInfo(string),TypeInfo(Integer)],Addr(TCustomQuickRep.TextHeight));

RegRegisterMethod(TCustomQuickRep,'TextWidth',TypeInfo(_T15),[
TypeInfo(TFont),
TypeInfo(string),TypeInfo(Integer)],Addr(TCustomQuickRep.TextWidth));

RegRegisterMethod(TCustomQuickRep,'AddBand',TypeInfo(_T16),[
TypeInfo(TQRCustomBand)],Addr(TCustomQuickRep.AddBand));

RegRegisterMethod(TCustomQuickRep,'AddNotifyClient',TypeInfo(_T17),[
TypeInfo(TQRPrintable)], pointer(232));

RegRegisterMethod(TCustomQuickRep,'Cancel',TypeInfo(_T18),NoParams,Addr(TCustomQuickRep.Cancel));

RegRegisterMethod(TCustomQuickRep,'ExportToFilter',TypeInfo(_T19),[
TypeInfo(TQRExportFilter)],Addr(TCustomQuickRep.ExportToFilter));

RegRegisterMethod(TCustomQuickRep,'EndPage',TypeInfo(_T20),NoParams,Addr(TCustomQuickRep.EndPage));

RegRegisterMethod(TCustomQuickRep,'Modify',TypeInfo(_T21),NoParams,Addr(TCustomQuickRep.Modify));

RegRegisterMethod(TCustomQuickRep,'NewColumn',TypeInfo(_T22),NoParams,Addr(TCustomQuickRep.NewColumn));

RegRegisterMethod(TCustomQuickRep,'NewPage',TypeInfo(_T23),NoParams,Addr(TCustomQuickRep.NewPage));

RegRegisterMethod(TCustomQuickRep,'Print',TypeInfo(_T24),NoParams,Addr(TCustomQuickRep.Print));

RegRegisterMethod(TCustomQuickRep,'PrintBackground',TypeInfo(_T25),NoParams,Addr(TCustomQuickRep.PrintBackground));

RegRegisterMethod(TCustomQuickRep,'PrinterSetup',TypeInfo(_T26),NoParams,Addr(TCustomQuickRep.PrinterSetup));

RegRegisterMethod(TCustomQuickRep,'Prepare',TypeInfo(_T27),NoParams,Addr(TCustomQuickRep.Prepare));

RegRegisterMethod(TCustomQuickRep,'Preview',TypeInfo(_T28),NoParams,Addr(TCustomQuickRep.Preview));

RegRegisterMethod(TCustomQuickRep,'PreviewModeless',TypeInfo(_T29),NoParams,Addr(TCustomQuickRep.PreviewModeless));

RegRegisterMethod(TCustomQuickRep,'PreviewModal',TypeInfo(_T30),NoParams,Addr(TCustomQuickRep.PreviewModal));

RegRegisterMethod(TCustomQuickRep,'ResetPageFooterSize',TypeInfo(_T31),NoParams,Addr(TCustomQuickRep.ResetPageFooterSize));

RegRegisterMethod(TCustomQuickRep,'RemoveBand',TypeInfo(_T32),[
TypeInfo(TQRCustomBand)],Addr(TCustomQuickRep.RemoveBand));

RegRegisterMethod(TCustomQuickRep,'SetBandValues',TypeInfo(_T33),NoParams,Addr(TCustomQuickRep.SetBandValues));

RegisterProc(TQRBandSize,'Create',mtConstructor,TypeInfo(_T34),[
TypeInfo(TQRCustomBand)],Addr(TQRBandSize.Create),cRegister);

RegRegisterMethod(TQRBasePanel,'SetZoom',TypeInfo(_T35),[
TypeInfo(Integer)], pointer(188));

RegRegisterMethod(TQRBasePanel,'PaintRuler',TypeInfo(_T36),[
TypeInfo(TQRUnit)], pointer(192));

RegRegisterMethod(TQRCompositeReport,'Prepare',TypeInfo(_T37),NoParams,Addr(TQRCompositeReport.Prepare));

RegRegisterMethod(TQRCompositeReport,'PrinterSetup',TypeInfo(_T38),NoParams,Addr(TQRCompositeReport.PrinterSetup));

RegRegisterMethod(TQRCompositeReport,'Preview',TypeInfo(_T39),NoParams,Addr(TQRCompositeReport.Preview));

RegRegisterMethod(TQRCompositeReport,'Print',TypeInfo(_T40),NoParams,Addr(TQRCompositeReport.Print));

RegRegisterMethod(TQRControllerBand,'CreateController',TypeInfo(_T41),NoParams, pointer(212));

RegRegisterMethod(TQRControllerBand,'RegisterBands',TypeInfo(_T42),NoParams, pointer(216));

RegRegisterMethod(TQRControllerBand,'SetMaster',TypeInfo(_T43),[
TypeInfo(TComponent)], pointer(220));

RegRegisterMethod(TQRControllerBand,'CreateLocalVar',TypeInfo(_T44),NoParams, pointer(224));

RegRegisterMethod(TQRControllerBand,'RemoveLocalVar',TypeInfo(_T45),NoParams, pointer(228));

RegRegisterMethod(TQRControllerBand,'LocalVarExpression',TypeInfo(_T46),[TypeInfo(string)], pointer(232));

RegisterProc(TQRCreateReportThread,'Create',mtConstructor,TypeInfo(_T47),[
TypeInfo(TCustomQuickRep)],Addr(TQRCreateReportThread.Create),cRegister);

RegRegisterMethod(TQRCustomBand,'BandTypeName',TypeInfo(_T48),[TypeInfo(string)], pointer(196));

RegRegisterMethod(TQRCustomBand,'BandComponentName',TypeInfo(_T49),[TypeInfo(string)], pointer(200));

RegRegisterMethod(TQRCustomBand,'SetParentReport',TypeInfo(_T50),[
TypeInfo(TCustomQuickRep)], pointer(204));

RegRegisterMethod(TQRCustomBand,'WriteDummy',TypeInfo(_T51),[
TypeInfo(TWriter)], pointer(208));

RegRegisterMethod(TQRCustomBand,'CanExpand',TypeInfo(_T53),[
TypeInfo(Extended),TypeInfo(Boolean)],Addr(TQRCustomBand.CanExpand));

RegRegisterMethod(TQRCustomBand,'ExpandBand',TypeInfo(_T54),[
TypeInfo(Extended),
TypeInfo(Extended),
TypeInfo(Boolean),TypeInfo(Boolean)],Addr(TQRCustomBand.ExpandBand));

RegRegisterMethod(TQRCustomController,'LocalVarValue',TypeInfo(_T55),[TypeInfo(IDispatch)], pointer(48));

RegRegisterMethod(TQRCustomController,'BuildTree',TypeInfo(_T56),NoParams, pointer(52));

RegRegisterMethod(TQRCustomController,'Execute',TypeInfo(_T57),NoParams, pointer(56));

RegRegisterMethod(TQRCustomController,'Prepare',TypeInfo(_T58),NoParams, pointer(60));

RegRegisterMethod(TQRCustomController,'Unprepare',TypeInfo(_T59),NoParams, pointer(64));

RegRegisterMethod(TQRCustomController,'PrintAfterControllers',TypeInfo(_T60),NoParams, pointer(68));

RegRegisterMethod(TQRCustomController,'PrintBeforeControllers',TypeInfo(_T61),NoParams, pointer(72));

RegRegisterMethod(TQRCustomController,'PrintEmptyController',TypeInfo(_T62),NoParams, pointer(76));

RegRegisterMethod(TQRCustomController,'RegisterBands',TypeInfo(_T63),NoParams, pointer(80));

RegRegisterMethod(TQRCustomController,'RegisterDatasets',TypeInfo(_T64),NoParams, pointer(84));

RegRegisterMethod(TQRCustomController,'SetPrintBefore',TypeInfo(_T65),[
TypeInfo(Boolean)], pointer(88));

RegRegisterMethod(TQRCustomController,'UpdateLocalVar',TypeInfo(_T66),NoParams, pointer(92));

RegRegisterMethod(TQRCustomController,'AddNotifyClient',TypeInfo(_T67),[
TypeInfo(TQRPrintable)],Addr(TQRCustomController.AddNotifyClient));

RegisterProc(TQRFrame,'Create',mtConstructor,TypeInfo(_T68),NoParams,Addr(TQRFrame.Create),cRegister);

RegRegisterMethod(TQRFrame,'AnyFrame',TypeInfo(_T69),[TypeInfo(Boolean)],Addr(TQRFrame.AnyFrame));

RegisterProc(TQRLabelSetup,'Create',mtConstructor,TypeInfo(_T70),[
TypeInfo(TCustomQuickRep)],Addr(TQRLabelSetup.Create),cRegister);

RegisterProc(TQRPage,'Create',mtConstructor,TypeInfo(_T71),[
TypeInfo(TCustomQuickRep)],Addr(TQRPage.Create),cRegister);

RegRegisterMethod(TQRPrintable,'IsEnabled',TypeInfo(_T72),[TypeInfo(Boolean)], pointer(188));

RegRegisterMethod(TQRPrintable,'AlignIt',TypeInfo(_T74),NoParams, pointer(196));

RegRegisterMethod(TQRPrintable,'Prepare',TypeInfo(_T75),NoParams, pointer(200));

RegRegisterMethod(TQRPrintable,'Print',TypeInfo(_T76),[
TypeInfo(Integer),
TypeInfo(Integer)], pointer(204));

RegRegisterMethod(TQRPrintable,'QRNotification',TypeInfo(_T77),[
TypeInfo(TObject),
TypeInfo(TQRNotifyOperation)], pointer(208));

RegRegisterMethod(TQRPrintable,'SetAlignment',TypeInfo(_T78),[
TypeInfo(TAlignment)], pointer(212));

RegRegisterMethod(TQRPrintable,'Unprepare',TypeInfo(_T79),NoParams, pointer(216));

RegRegisterMethod(TQRPrintableEditor,'GetColor',TypeInfo(_T80),[TypeInfo(TColor)], pointer(0));

RegRegisterMethod(TQRPrintableEditor,'GetFont',TypeInfo(_T81),[TypeInfo(TFont)], pointer(4));

RegRegisterMethod(TQRPrintableEditor,'GetValue',TypeInfo(_T83),[TypeInfo(string)], pointer(12));

RegRegisterMethod(TQRPrintableEditor,'GetGlyphResName',TypeInfo(_T84),[TypeInfo(string)], pointer(16));

RegRegisterMethod(TQRPrintableEditor,'GetControlName',TypeInfo(_T85),[TypeInfo(string)], pointer(20));

RegRegisterMethod(TQRPrintableEditor,'GetAlignment',TypeInfo(_T86),[TypeInfo(TAlignment)], pointer(24));

RegRegisterMethod(TQRPrintableEditor,'SetAlignment',TypeInfo(_T87),[
TypeInfo(TAlignment)], pointer(28));

RegRegisterMethod(TQRPrintableEditor,'SetColor',TypeInfo(_T88),[
TypeInfo(TColor)], pointer(32));

RegRegisterMethod(TQRPrintableEditor,'SetFont',TypeInfo(_T89),[
TypeInfo(TFont)], pointer(36));

RegRegisterMethod(TQRPrintableEditor,'SetValue',TypeInfo(_T90),[
TypeInfo(string)], pointer(40));

RegisterProc(TQRPrintableEditor,'Create',mtConstructor,TypeInfo(_T91),[
TypeInfo(TQRPrintable)], pointer(44),cRegister);

RegRegisterMethod(TQRPrintableEditor,'ShowEditor',TypeInfo(_T92),[TypeInfo(Boolean)], pointer(48));

RegisterProc(TQRPrintableSize,'Create',mtConstructor,TypeInfo(_T93),[
TypeInfo(TQRPrintable)],Addr(TQRPrintableSize.Create),cRegister);

RegRegisterMethod(TQRSubDetail,'AddNotifyClient',TypeInfo(_T94),[
TypeInfo(TQRPrintable)],Addr(TQRSubDetail.AddNotifyClient));

RegisterProc(TQRSubDetailGroupBands,'Create',mtConstructor,TypeInfo(_T95),[
TypeInfo(TQRSubDetail)],Addr(TQRSubDetailGroupBands.Create),cRegister);

RegRegisterMethod(TQRUnitBase,'LoadUnit',TypeInfo(_T96),[
TypeInfo(Extended),
TypeInfo(TQRUnit),
TypeInfo(Boolean),TypeInfo(Extended)], pointer(12));

RegRegisterMethod(TQRUnitBase,'SaveUnit',TypeInfo(_T97),[
TypeInfo(Extended),
TypeInfo(TQRUnit),
TypeInfo(Boolean),TypeInfo(Extended)], pointer(16));

RegRegisterMethod(TQRUnitBase,'GetUnits',TypeInfo(_T98),[TypeInfo(TQRUnit)], pointer(20));

RegRegisterMethod(TQRUnitBase,'Loaded',TypeInfo(_T99),NoParams, pointer(24));

RegRegisterMethod(TQRUnitBase,'ReadValues',TypeInfo(_T100),[
TypeInfo(TReader)], pointer(28));

RegRegisterMethod(TQRUnitBase,'SetParentSizes',TypeInfo(_T101),NoParams, pointer(32));

RegRegisterMethod(TQRUnitBase,'SetUnits',TypeInfo(_T102),[
TypeInfo(TQRUnit)], pointer(36));

RegRegisterMethod(TQRUnitBase,'WriteValues',TypeInfo(_T103),[
TypeInfo(TWriter)], pointer(40));

RegisterProc(TQRUnitBase,'Create',mtConstructor,TypeInfo(_T104),NoParams,Addr(TQRUnitBase.Create),cRegister);

RegisterProc(TQuickRepBands,'Create',mtConstructor,TypeInfo(_T105),[
TypeInfo(TCustomQuickRep)],Addr(TQuickRepBands.Create),cRegister);

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegRegisterMethod(TQRCustomBand,'AddPrintable',TypeInfo(_T52),[
TypeInfo(TQRNewComponentClass),TypeInfo(TQRPrintable)],Addr(TQRCustomBand.AddPrintable))}

{RegRegisterMethod(TQRPrintable,'GetEditorClass',TypeInfo(_T73),[TypeInfo(TQRPrintableEditorClass)], pointer(192))}

{RegRegisterMethod(TQRPrintableEditor,'GetPrintableClass',TypeInfo(_T82),[TypeInfo(TQRPrintableClass)], pointer(8))}

RegisterEvent(TypeInfo(TQRBandAfterPrintEvent),[
TypeInfo(TQRCustomBand),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TQRBandBeforePrintEvent),[
TypeInfo(TQRCustomBand),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TQRNotifyEvent),[
TypeInfo(TCustomQuickRep)]);

RegisterEvent(TypeInfo(TQRNotifyOperationEvent),[
TypeInfo(TObject),
TypeInfo(TQRNotifyOperation)]);

RegisterEvent(TypeInfo(TQROnNeedDataEvent),[
TypeInfo(TObject),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TQRReportBeforePrintEvent),[
TypeInfo(TCustomQuickRep),
TypeInfo(Boolean)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
