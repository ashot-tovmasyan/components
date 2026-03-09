{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit EXTCTRLS_D6;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  Types,
  activex,
  dcscript,
  dcsystem,
  dcdreamlib,
  Messages,
  Windows,
  SysUtils,
  Classes,
  Controls,
  Forms,
  Menus,
  Graphics,
  StdCtrls,
  ExtCtrls;
function ConvertTRectToVariant(var R : TRect) : OleVariant;
function ConvertVariantToTRect(const V : OleVariant) : TRect;
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
procedure setLeft(const val : Longint);
function getLeft : Longint;
property Left : Longint read getLeft write setLeft;
procedure setTop(const val : Longint);
function getTop : Longint;
property Top : Longint read getTop write setTop;
procedure setRight(const val : Longint);
function getRight : Longint;
property Right : Longint read getRight write setRight;
procedure setBottom(const val : Longint);
function getBottom : Longint;
property Bottom : Longint read getBottom write setBottom;
end;
type __TCustomControlBar__ = class(TCustomControlBar);
type __TImage__ = class(TImage);
type
_T0 = procedure (p0 : TCanvas;
const p1 : IDispatch;
p2 : TColor;
p3 : TColor;
p4 : Integer) of object;

_T1 = procedure (p0 : TNotebook) of object;

_T2 = function : Boolean of object;

_T3 = procedure (p0 : TControl;
const p1 : IDispatch) of object;

_T4 = procedure (p0 : TControl;
p1 : TCanvas;
const p2 : IDispatch;
var p3 : TBandPaintOptions) of object;

_T5 = function (p0 : TControl;
p1 : Integer;
p2 : Integer;
p3 : Boolean): Boolean of object;

_T6 = procedure (p0 : TControl;
const p1 : IDispatch;
var p2 : Integer;
var p3 : Integer) of object;

_T7 = procedure (p0 : TCanvas;
p1 : TControl;
const p2 : IDispatch) of object;

_T8 = procedure  of object;

_T9 = _T8;

_T10 = _T2;

_T11 = procedure (p0 : Integer;
p1 : Integer) of object;

_T12 = _T11;

_T13 = procedure (p0 : TObject;
p1 : TProgressStage;
p2 : Byte;
p3 : Boolean;
const p4 : IDispatch;
const p5 : string) of object;

_T14 = procedure (p0 : TObject) of object;

_T15 = function (var p0 : Integer): Boolean of object;

_T16 = _T15;

_T17 = _T8;

_T18 = _T8;

function __TRect__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TRect__Wrapper.setLeft(const val : Longint);
begin
TRect(GetRecordPtr^).Left := val;
end;
function __TRect__Wrapper.getLeft : Longint;
begin
result := TRect(GetRecordPtr^).Left;
end;
procedure __TRect__Wrapper.setTop(const val : Longint);
begin
TRect(GetRecordPtr^).Top := val;
end;
function __TRect__Wrapper.getTop : Longint;
begin
result := TRect(GetRecordPtr^).Top;
end;
procedure __TRect__Wrapper.setRight(const val : Longint);
begin
TRect(GetRecordPtr^).Right := val;
end;
function __TRect__Wrapper.getRight : Longint;
begin
result := TRect(GetRecordPtr^).Right;
end;
procedure __TRect__Wrapper.setBottom(const val : Longint);
begin
TRect(GetRecordPtr^).Bottom := val;
end;
function __TRect__Wrapper.getBottom : Longint;
begin
result := TRect(GetRecordPtr^).Bottom;
end;
procedure ____Frame3D__Wrapper(p0 : TCanvas;
const p1 : IDispatch;
p2 : TColor;
p3 : TColor;
p4 : Integer);
var
__p1 : ^TRect;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
Frame3D(p0,__p1^,p2,p3,p4);
end;

procedure __TCustomControlBar__DoBandMove__Wrapper(__Instance : TCustomControlBar;
p0 : TControl;
const p1 : IDispatch);
var
__p1 : ^TRect;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
__TCustomControlBar__(__Instance).DoBandMove(p0,__p1^);
end;

procedure __TCustomControlBar__DoBandPaint__Wrapper(__Instance : TCustomControlBar;
p0 : TControl;
p1 : TCanvas;
const p2 : IDispatch;
var p3 : TBandPaintOptions);
var
__p2 : ^TRect;
__i2 : IDispatch;
begin
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
__TCustomControlBar__(__Instance).DoBandPaint(p0,p1,__p2^,p3);
end;

function __TCustomControlBar__DragControl__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList) : OleVariant;
begin
case cArgs of
3:
begin
result := __TCustomControlBar__(__Instance).DragControl(TControl(VarToObject(OleVariant(pargs^[2]))),OleVariant(pargs^[1]),OleVariant(pargs^[0]));
end;
4:
begin
result := __TCustomControlBar__(__Instance).DragControl(TControl(VarToObject(OleVariant(pargs^[3]))),OleVariant(pargs^[2]),OleVariant(pargs^[1]),OleVariant(pargs^[0]));
end;
end
end;

procedure __TCustomControlBar__GetControlInfo__Wrapper(__Instance : TCustomControlBar;
p0 : TControl;
const p1 : IDispatch;
var p2 : Integer;
var p3 : Integer);
var
__p1 : ^TRect;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
__TCustomControlBar__(__Instance).GetControlInfo(p0,__p1^,p2,p3);
end;

procedure __TCustomControlBar__PaintControlFrame__Wrapper(__Instance : TCustomControlBar;
p0 : TCanvas;
p1 : TControl;
const p2 : IDispatch);
var
__p2 : ^TRect;
__i2 : IDispatch;
begin
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
__TCustomControlBar__(__Instance).PaintControlFrame(p0,p1,__p2^);
end;

procedure __TImage__Progress__Wrapper(__Instance : TImage;
p0 : TObject;
p1 : TProgressStage;
p2 : Byte;
p3 : Boolean;
const p4 : IDispatch;
const p5 : string);
var
__p4 : ^TRect;
__i4 : IDispatch;
begin
if p4 = nil then exit;
__p4 := (p4 as IDCRecordWrapper).GetRecordPtr;
__TImage__(__Instance).Progress(p0,p1,p2,p3,__p4^,p5);
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
function __DC__GetTControlBar__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TControlBar(Instance).Canvas);
end;

function __DC__GetTCustomColorBox__Style(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TColorBoxStyle;
begin
tmp := TCustomColorBox(Instance).Style;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTCustomColorBox__Style(Instance : TObject; Params : PVariantArgList);
var
  tmp : TColorBoxStyle;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TCustomColorBox(Instance).Style:=tmp;
end;

function __DC__GetTCustomColorBox__Colors(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomColorBox(Instance).Colors[OleVariant(Params^[0])];
end;

function __DC__GetTCustomColorBox__ColorNames(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomColorBox(Instance).ColorNames[OleVariant(Params^[0])];
end;

function __DC__GetTCustomColorBox__Selected(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomColorBox(Instance).Selected;
end;

procedure __DC__SetTCustomColorBox__Selected(Instance : TObject; Params : PVariantArgList);
begin
TCustomColorBox(Instance).Selected:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomColorBox__DefaultColorColor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomColorBox(Instance).DefaultColorColor;
end;

procedure __DC__SetTCustomColorBox__DefaultColorColor(Instance : TObject; Params : PVariantArgList);
begin
TCustomColorBox(Instance).DefaultColorColor:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomColorBox__NoneColorColor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomColorBox(Instance).NoneColorColor;
end;

procedure __DC__SetTCustomColorBox__NoneColorColor(Instance : TObject; Params : PVariantArgList);
begin
TCustomColorBox(Instance).NoneColorColor:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomControlBar__Picture(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomControlBar(Instance).Picture);
end;

procedure __DC__SetTCustomControlBar__Picture(Instance : TObject; Params : PVariantArgList);
begin
TCustomControlBar(Instance).Picture:=TPicture(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomLabeledEdit__EditLabel(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomLabeledEdit(Instance).EditLabel);
end;

function __DC__GetTCustomLabeledEdit__LabelPosition(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomLabeledEdit(Instance).LabelPosition;
end;

procedure __DC__SetTCustomLabeledEdit__LabelPosition(Instance : TObject; Params : PVariantArgList);
begin
TCustomLabeledEdit(Instance).LabelPosition:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomLabeledEdit__LabelSpacing(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomLabeledEdit(Instance).LabelSpacing;
end;

procedure __DC__SetTCustomLabeledEdit__LabelSpacing(Instance : TObject; Params : PVariantArgList);
begin
TCustomLabeledEdit(Instance).LabelSpacing:=OleVariant(Params^[0]);
end;

function __DC__GetTHeader__SectionWidth(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := THeader(Instance).SectionWidth[OleVariant(Params^[0])];
end;

procedure __DC__SetTHeader__SectionWidth(Instance : TObject; Params : PVariantArgList);
begin
THeader(Instance).SectionWidth[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTImage__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TImage(Instance).Canvas);
end;

function __DC__GetTPaintBox__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TPaintBox(Instance).Canvas);
end;

function __DC__GetTSplitter__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TSplitter(Instance).Canvas);
end;

procedure __RegisterProps;
begin
RegisterProperty(TControlBar,'Canvas',__DC__GetTControlBar__Canvas,nil);
RegisterProperty(TCustomColorBox,'Style',__DC__GetTCustomColorBox__Style,__DC__SetTCustomColorBox__Style);
RegisterIndexedProperty(TCustomColorBox,'Colors',1,False,__DC__GetTCustomColorBox__Colors,nil);
RegisterIndexedProperty(TCustomColorBox,'ColorNames',1,False,__DC__GetTCustomColorBox__ColorNames,nil);
RegisterProperty(TCustomColorBox,'Selected',__DC__GetTCustomColorBox__Selected,__DC__SetTCustomColorBox__Selected);
RegisterProperty(TCustomColorBox,'DefaultColorColor',__DC__GetTCustomColorBox__DefaultColorColor,__DC__SetTCustomColorBox__DefaultColorColor);
RegisterProperty(TCustomColorBox,'NoneColorColor',__DC__GetTCustomColorBox__NoneColorColor,__DC__SetTCustomColorBox__NoneColorColor);
RegisterProperty(TCustomControlBar,'Picture',__DC__GetTCustomControlBar__Picture,__DC__SetTCustomControlBar__Picture);
RegisterProperty(TCustomLabeledEdit,'EditLabel',__DC__GetTCustomLabeledEdit__EditLabel,nil);
RegisterProperty(TCustomLabeledEdit,'LabelPosition',__DC__GetTCustomLabeledEdit__LabelPosition,__DC__SetTCustomLabeledEdit__LabelPosition);
RegisterProperty(TCustomLabeledEdit,'LabelSpacing',__DC__GetTCustomLabeledEdit__LabelSpacing,__DC__SetTCustomLabeledEdit__LabelSpacing);
RegisterIndexedProperty(THeader,'SectionWidth',1,False,__DC__GetTHeader__SectionWidth,__DC__SetTHeader__SectionWidth);
RegisterProperty(TImage,'Canvas',__DC__GetTImage__Canvas,nil);
RegisterProperty(TPaintBox,'Canvas',__DC__GetTPaintBox__Canvas,nil);
RegisterProperty(TSplitter,'Canvas',__DC__GetTSplitter__Canvas,nil);
end;

const __ConstNames0 : array[0..32] of string = (
'stRectangle'
,'stSquare'
,'stRoundRect'
,'stRoundSquare'
,'stEllipse'
,'stCircle'
,'bsLowered'
,'bsRaised'
,'bsBox'
,'bsFrame'
,'bsTopLine'
,'bsBottomLine'
,'bsLeftLine'
,'bsRightLine'
,'bsSpacer'
,'rsNone'
,'rsLine'
,'rsUpdate'
,'rsPattern'
,'bpoGrabber'
,'bpoFrame'
,'lpAbove'
,'lpBelow'
,'lpLeft'
,'lpRight'
,'NoColorSelected'
,'cbStandardColors'
,'cbExtendedColors'
,'cbSystemColors'
,'cbIncludeNone'
,'cbIncludeDefault'
,'cbCustomColor'
,'cbPrettyNames'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,stRectangle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,stSquare));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,stRoundRect));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,stRoundSquare));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,stEllipse));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,stCircle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,bsLowered));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,bsRaised));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,bsBox));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,bsFrame));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,bsTopLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,bsBottomLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,bsLeftLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,bsRightLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,bsSpacer));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,rsNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,rsLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,rsUpdate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,rsPattern));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,bpoGrabber));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,bpoFrame));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,lpAbove));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,lpBelow));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,lpLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,lpRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,NoColorSelected));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,cbStandardColors));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,cbExtendedColors));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,cbSystemColors));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,cbIncludeNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,cbIncludeDefault));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,cbCustomColor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,cbPrettyNames));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..19] of TClass = (
TBevel,
TBoundLabel,
TColorBox,
TControlBar,
TCustomColorBox,
TCustomControlBar,
TCustomLabeledEdit,
TCustomPanel,
TCustomRadioGroup,
THeader,
TImage,
TLabeledEdit,
TNotebook,
TPage,
TPaintBox,
TPanel,
TRadioGroup,
TShape,
TSplitter,
TTimer
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..1] of string = (
'Frame3D'
,'NotebookHandlesNeeded'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T0),[
TypeInfo(TCanvas),
TypeInfo(IDispatch),
TypeInfo(TColor),
TypeInfo(TColor),
TypeInfo(Integer)],Addr(____Frame3D__Wrapper),cRegister);

RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T1),[
TypeInfo(TNotebook)],Addr(NotebookHandlesNeeded),cRegister);

RegRegisterMethod(TCustomColorBox,'PickCustomColor',TypeInfo(_T2),[TypeInfo(Boolean)], pointer(280));

RegRegisterMethod(TCustomControlBar,'DoBandMove',TypeInfo(_T3),[
TypeInfo(TControl),
TypeInfo(IDispatch)], pointer(200));

RegRegisterMethod(TCustomControlBar,'DoBandPaint',TypeInfo(_T4),[
TypeInfo(TControl),
TypeInfo(TCanvas),
TypeInfo(IDispatch),
TypeInfo(TBandPaintOptions)], pointer(204));

RegisterProc(TCustomControlBar,'DragControl',mtScriptMethod,TypeInfo(_T5),[
TypeInfo(TControl),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Boolean),TypeInfo(Boolean)],Addr(__TCustomControlBar__DragControl__Wrapper),cRegister);

RegRegisterMethod(TCustomControlBar,'GetControlInfo',TypeInfo(_T6),[
TypeInfo(TControl),
TypeInfo(IDispatch),
TypeInfo(Integer),
TypeInfo(Integer)], pointer(212));

RegRegisterMethod(TCustomControlBar,'PaintControlFrame',TypeInfo(_T7),[
TypeInfo(TCanvas),
TypeInfo(TControl),
TypeInfo(IDispatch)], pointer(216));

RegRegisterMethod(TCustomControlBar,'StickControls',TypeInfo(_T8),NoParams, pointer(220));

RegRegisterMethod(TCustomLabeledEdit,'SetupInternalLabel',TypeInfo(_T9),NoParams,Addr(TCustomLabeledEdit.SetupInternalLabel));

RegRegisterMethod(TCustomRadioGroup,'CanModify',TypeInfo(_T10),[TypeInfo(Boolean)], pointer(200));

RegRegisterMethod(THeader,'Sizing',TypeInfo(_T11),[
TypeInfo(Integer),
TypeInfo(Integer)], pointer(MinVMTOffset - 76));

RegRegisterMethod(THeader,'Sized',TypeInfo(_T12),[
TypeInfo(Integer),
TypeInfo(Integer)], pointer(MinVMTOffset - 77));

RegRegisterMethod(TImage,'Progress',TypeInfo(_T13),[
TypeInfo(TObject),
TypeInfo(TProgressStage),
TypeInfo(Byte),
TypeInfo(Boolean),
TypeInfo(IDispatch),
TypeInfo(string)], pointer(MinVMTOffset - 56));

RegRegisterMethod(TShape,'StyleChanged',TypeInfo(_T14),[
TypeInfo(TObject)],Addr(TShape.StyleChanged));

RegRegisterMethod(TSplitter,'CanResize',TypeInfo(_T15),[
TypeInfo(Integer),TypeInfo(Boolean)], pointer(144));

RegRegisterMethod(TSplitter,'DoCanResize',TypeInfo(_T16),[
TypeInfo(Integer),TypeInfo(Boolean)], pointer(148));

RegRegisterMethod(TSplitter,'StopSizing',TypeInfo(_T17),NoParams, pointer(MinVMTOffset - 56));

RegRegisterMethod(TTimer,'Timer',TypeInfo(_T18),NoParams, pointer(MinVMTOffset - 16));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
RegisterEvent(TypeInfo(TBandDragEvent),[
TypeInfo(TObject),
TypeInfo(TControl),
TypeInfo(Boolean)]);

{RegisterEvent(TypeInfo(TBandInfoEvent),[
TypeInfo(TObject),
TypeInfo(TControl),
TypeInfo(IDispatch),
TypeInfo(Integer),
TypeInfo(Integer)]);}

{RegisterEvent(TypeInfo(TBandMoveEvent),[
TypeInfo(TObject),
TypeInfo(TControl),
TypeInfo(IDispatch)]);}

{RegisterEvent(TypeInfo(TBandPaintEvent),[
TypeInfo(TObject),
TypeInfo(TControl),
TypeInfo(TCanvas),
TypeInfo(IDispatch),
TypeInfo(TBandPaintOptions)]);}

RegisterEvent(TypeInfo(TCanResizeEvent),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TSectionEvent),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
