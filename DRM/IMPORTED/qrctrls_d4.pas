{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit Qrctrls_D4;
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
  messages,
  windows,
  classes,
  controls,
  stdctrls,
  sysutils,
  graphics,
  buttons,
  forms,
  extctrls,
  dialogs,
  printers,
  db,
  DBtables,
  ComCtrls,
  RichEdit,
  QRPrntr,
  Quickrpt,
  QR3Const,
  qrexpr,
  Qrctrls;
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
type
_T0 = function : Boolean of object;

_T1 = procedure  of object;

_T2 = procedure (p0 : TReader) of object;

_T3 = procedure (p0 : TWriter) of object;

_T4 = _T1;

_T5 = _T1;

_T6 = _T1;

_T7 = _T1;

_T8 = _T1;

_T9 = _T1;

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
function __DC__GetTQRCustomLabel__CaptionBased(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRCustomLabel(Instance).CaptionBased;
end;

function __DC__GetTQRCustomLabel__Alignment(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRCustomLabel(Instance).Alignment;
end;

procedure __DC__SetTQRCustomLabel__Alignment(Instance : TObject; Params : PVariantArgList);
begin
TQRCustomLabel(Instance).Alignment:=OleVariant(Params^[0]);
end;

function __DC__GetTQRCustomLabel__AutoSize(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRCustomLabel(Instance).AutoSize;
end;

procedure __DC__SetTQRCustomLabel__AutoSize(Instance : TObject; Params : PVariantArgList);
begin
TQRCustomLabel(Instance).AutoSize:=OleVariant(Params^[0]);
end;

function __DC__GetTQRCustomLabel__AutoStretch(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRCustomLabel(Instance).AutoStretch;
end;

procedure __DC__SetTQRCustomLabel__AutoStretch(Instance : TObject; Params : PVariantArgList);
begin
TQRCustomLabel(Instance).AutoStretch:=OleVariant(Params^[0]);
end;

function __DC__GetTQRCustomLabel__Caption(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRCustomLabel(Instance).Caption;
end;

procedure __DC__SetTQRCustomLabel__Caption(Instance : TObject; Params : PVariantArgList);
begin
TQRCustomLabel(Instance).Caption:=OleVariant(Params^[0]);
end;

function __DC__GetTQRCustomLabel__Color(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRCustomLabel(Instance).Color;
end;

procedure __DC__SetTQRCustomLabel__Color(Instance : TObject; Params : PVariantArgList);
begin
TQRCustomLabel(Instance).Color:=OleVariant(Params^[0]);
end;

function __DC__GetTQRCustomLabel__Font(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRCustomLabel(Instance).Font);
end;

procedure __DC__SetTQRCustomLabel__Font(Instance : TObject; Params : PVariantArgList);
begin
TQRCustomLabel(Instance).Font:=TFont(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRCustomLabel__Lines(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRCustomLabel(Instance).Lines);
end;

procedure __DC__SetTQRCustomLabel__Lines(Instance : TObject; Params : PVariantArgList);
begin
TQRCustomLabel(Instance).Lines:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRCustomLabel__WordWrap(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRCustomLabel(Instance).WordWrap;
end;

procedure __DC__SetTQRCustomLabel__WordWrap(Instance : TObject; Params : PVariantArgList);
begin
TQRCustomLabel(Instance).WordWrap:=OleVariant(Params^[0]);
end;

function __DC__GetTQRDBImage__Field(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRDBImage(Instance).Field);
end;

function __DC__GetTQRDBImage__Picture(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRDBImage(Instance).Picture);
end;

procedure __DC__SetTQRDBImage__Picture(Instance : TObject; Params : PVariantArgList);
begin
TQRDBImage(Instance).Picture:=TPicture(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRExpr__Value(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TQREvResult__Wrapper;
begin
__wrapper := __TQREvResult__Wrapper.Create;
__wrapper.fR := TQRExpr(Instance).Value;
result := IUnknown(__wrapper) as IDispatch;
end;

function __DC__GetTQRImage__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRImage(Instance).Canvas);
end;

function __DC__GetTQRMerger__Lines(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRMerger(Instance).Lines);
end;

procedure __DC__SetTQRMerger__Lines(Instance : TObject; Params : PVariantArgList);
begin
TQRMerger(Instance).Lines:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRMerger__MergedLines(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRMerger(Instance).MergedLines);
end;

function __DC__GetTQRMerger__Merged(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRMerger(Instance).Merged;
end;

function __DC__GetTQRMerger__Prepared(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRMerger(Instance).Prepared;
end;

function __DC__GetTQRMerger__DataSets(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TQRMerger(Instance).DataSets);
end;

procedure __DC__SetTQRMerger__DataSets(Instance : TObject; Params : PVariantArgList);
begin
TQRMerger(Instance).DataSets:=TList(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTQRRichEdit__BorderStyle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TQRRichEdit(Instance).BorderStyle;
end;

procedure __DC__SetTQRRichEdit__BorderStyle(Instance : TObject; Params : PVariantArgList);
begin
TQRRichEdit(Instance).BorderStyle:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
RegisterProperty(TQRCustomLabel,'CaptionBased',__DC__GetTQRCustomLabel__CaptionBased,nil);
RegisterProperty(TQRCustomLabel,'Alignment',__DC__GetTQRCustomLabel__Alignment,__DC__SetTQRCustomLabel__Alignment);
RegisterProperty(TQRCustomLabel,'AutoSize',__DC__GetTQRCustomLabel__AutoSize,__DC__SetTQRCustomLabel__AutoSize);
RegisterProperty(TQRCustomLabel,'AutoStretch',__DC__GetTQRCustomLabel__AutoStretch,__DC__SetTQRCustomLabel__AutoStretch);
RegisterProperty(TQRCustomLabel,'Caption',__DC__GetTQRCustomLabel__Caption,__DC__SetTQRCustomLabel__Caption);
RegisterProperty(TQRCustomLabel,'Color',__DC__GetTQRCustomLabel__Color,__DC__SetTQRCustomLabel__Color);
RegisterProperty(TQRCustomLabel,'Font',__DC__GetTQRCustomLabel__Font,__DC__SetTQRCustomLabel__Font);
RegisterProperty(TQRCustomLabel,'Lines',__DC__GetTQRCustomLabel__Lines,__DC__SetTQRCustomLabel__Lines);
RegisterProperty(TQRCustomLabel,'WordWrap',__DC__GetTQRCustomLabel__WordWrap,__DC__SetTQRCustomLabel__WordWrap);
RegisterProperty(TQRDBImage,'Field',__DC__GetTQRDBImage__Field,nil);
RegisterProperty(TQRDBImage,'Picture',__DC__GetTQRDBImage__Picture,__DC__SetTQRDBImage__Picture);
RegisterProperty(TQRExpr,'Value',__DC__GetTQRExpr__Value,nil);
RegisterProperty(TQRImage,'Canvas',__DC__GetTQRImage__Canvas,nil);
RegisterProperty(TQRMerger,'Lines',__DC__GetTQRMerger__Lines,__DC__SetTQRMerger__Lines);
RegisterProperty(TQRMerger,'MergedLines',__DC__GetTQRMerger__MergedLines,nil);
RegisterProperty(TQRMerger,'Merged',__DC__GetTQRMerger__Merged,nil);
RegisterProperty(TQRMerger,'Prepared',__DC__GetTQRMerger__Prepared,nil);
RegisterProperty(TQRMerger,'DataSets',__DC__GetTQRMerger__DataSets,__DC__SetTQRMerger__DataSets);
RegisterProperty(TQRRichEdit,'BorderStyle',__DC__GetTQRRichEdit__BorderStyle,__DC__SetTQRRichEdit__BorderStyle);
end;

const __ConstNames0 : array[0..17] of string = (
'qrsTime'
,'qrsDate'
,'qrsDateTime'
,'qrsPageNumber'
,'qrsReportTitle'
,'qrsDetailCount'
,'qrsDetailNo'
,'qrsRectangle'
,'qrsCircle'
,'qrsVertLine'
,'qrsHorLine'
,'qrsTopAndBottom'
,'qrsRightAndLeft'
,'qrcSum'
,'qrcCount'
,'qrcMax'
,'qrcMin'
,'qrcAverage'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,qrsTime));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,qrsDate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,qrsDateTime));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,qrsPageNumber));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,qrsReportTitle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,qrsDetailCount));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,qrsDetailNo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,qrsRectangle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,qrsCircle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,qrsVertLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,qrsHorLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,qrsTopAndBottom));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,qrsRightAndLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,qrcSum));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,qrcCount));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,qrcMax));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,qrcMin));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,qrcAverage));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..15] of TClass = (
TQRCustomLabel,
TQRCustomRichText,
TQRDBCalc,
TQRDBImage,
TQRDBRichText,
TQRDBText,
TQRExpr,
TQRExprMemo,
TQRImage,
TQRLabel,
TQRMemo,
TQRMerger,
TQRRichEdit,
TQRRichText,
TQRShape,
TQRSysData
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
procedure _mreg_0;
begin
RegRegisterMethod(TQRCustomLabel,'GetCaptionBased',TypeInfo(_T0),[TypeInfo(Boolean)], pointer(220));

RegRegisterMethod(TQRCustomLabel,'FormatLines',TypeInfo(_T1),NoParams, pointer(224));

RegRegisterMethod(TQRCustomLabel,'ReadFontSize',TypeInfo(_T2),[
TypeInfo(TReader)], pointer(228));

RegRegisterMethod(TQRCustomLabel,'WriteFontSize',TypeInfo(_T3),[
TypeInfo(TWriter)], pointer(232));

RegRegisterMethod(TQRDBImage,'LoadPicture',TypeInfo(_T4),NoParams,Addr(TQRDBImage.LoadPicture));

RegRegisterMethod(TQRExpr,'Reset',TypeInfo(_T5),NoParams,Addr(TQRExpr.Reset));

RegisterProc(TQRMerger,'Create',mtConstructor,TypeInfo(_T6),NoParams,Addr(TQRMerger.Create),cRegister);

RegRegisterMethod(TQRMerger,'Prepare',TypeInfo(_T7),NoParams,Addr(TQRMerger.Prepare));

RegRegisterMethod(TQRMerger,'Merge',TypeInfo(_T8),NoParams,Addr(TQRMerger.Merge));

RegRegisterMethod(TQRMerger,'Unprepare',TypeInfo(_T9),NoParams,Addr(TQRMerger.Unprepare));

end;
initialization
_mreg_0;
RegisterEvent(TypeInfo(TQRLabelOnPrintEvent),[
TypeInfo(TObject),
TypeInfo(string)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
end.
