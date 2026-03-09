{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit IMGLIST_C5;
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
  Graphics,
  CommCtrl,
  ImgList;
function ConvertTPointToVariant(var R : TPoint) : OleVariant;
function ConvertVariantToTPoint(const V : OleVariant) : TPoint;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
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
type
_T0 = procedure  of object;

_T1 = _T0;

_T2 = procedure (p0 : Integer;
p1 : TCanvas;
p2 : Integer;
p3 : Integer;
p4 : Cardinal;
p5 : Boolean) of object;

_T3 = _T0;

_T4 = procedure (p0 : Integer;
p1 : Integer) of object;

_T5 = function (p0 : TBitmap;
p1 : TBitmap): Integer of object;

_T6 = function (p0 : TIcon): Integer of object;

_T7 = procedure (p0 : TCustomImageList) of object;

_T8 = function (p0 : TBitmap;
p1 : TColor): Integer of object;

_T9 = _T0;

_T10 = procedure (p0 : Integer) of object;

_T11 = procedure (p0 : TCanvas;
p1 : Integer;
p2 : Integer;
p3 : Integer;
p4 : Boolean) of object;

_T12 = procedure (p0 : TCanvas;
p1 : Integer;
p2 : Integer;
p3 : Integer;
p4 : TOverlay;
p5 : Boolean) of object;

_T13 = function (p0 : TResType;
p1 : string;
p2 : TColor): Boolean of object;

_T14 = procedure (p0 : Integer;
p1 : TBitmap) of object;

_T15 = function : IDispatch of object;

_T16 = procedure (p0 : Integer;
p1 : TIcon) of object;

_T17 = function : HBITMAP of object;

_T18 = _T17;

_T19 = function (p0 : TResType;
p1 : string;
p2 : Integer;
p3 : TLoadResources;
p4 : TColor): Boolean of object;

_T20 = function (p0 : THandle;
p1 : TResType;
p2 : string;
p3 : Integer;
p4 : TLoadResources;
p5 : TColor): Boolean of object;

_T21 = function : Boolean of object;

_T22 = procedure (p0 : Integer;
p1 : TBitmap;
p2 : TBitmap) of object;

_T23 = _T16;

_T24 = procedure (p0 : Integer;
p1 : TBitmap;
p2 : TColor) of object;

_T25 = _T4;

_T26 = function (p0 : Integer;
p1 : TOverlay): Boolean of object;

_T27 = procedure (p0 : TChangeLink) of object;

_T28 = _T13;

_T29 = function (p0 : THandle;
p1 : TResType;
p2 : string;
p3 : TColor): Boolean of object;

_T30 = _T22;

_T31 = _T16;

_T32 = _T24;

_T33 = _T27;

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
procedure __TCustomImageList__Draw__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
4:
begin
TCustomImageList(__Instance).Draw(TCanvas(VarToObject(OleVariant(pargs^[3]))),OleVariant(pargs^[2]),OleVariant(pargs^[1]),OleVariant(pargs^[0]));
end;
5:
begin
TCustomImageList(__Instance).Draw(TCanvas(VarToObject(OleVariant(pargs^[4]))),OleVariant(pargs^[3]),OleVariant(pargs^[2]),OleVariant(pargs^[1]),OleVariant(pargs^[0]));
end;
end
end;

procedure __TCustomImageList__DrawOverlay__Wrapper(__Instance : TObject; cArgs : integer; pArgs : PArgList);
begin
case cArgs of
5:
begin
TCustomImageList(__Instance).DrawOverlay(TCanvas(VarToObject(OleVariant(pargs^[4]))),OleVariant(pargs^[3]),OleVariant(pargs^[2]),OleVariant(pargs^[1]),OleVariant(pargs^[0]));
end;
6:
begin
TCustomImageList(__Instance).DrawOverlay(TCanvas(VarToObject(OleVariant(pargs^[5]))),OleVariant(pargs^[4]),OleVariant(pargs^[3]),OleVariant(pargs^[2]),OleVariant(pargs^[1]),OleVariant(pargs^[0]));
end;
end
end;

function __TCustomImageList__GetHotSpot__Wrapper(__Instance : TCustomImageList): IDispatch;
var
__result : TPoint;
__wrapper : __TPoint__Wrapper;
begin
__result := TCustomImageList(__Instance).GetHotSpot;
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
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
function __DC__GetTChangeLink__Sender(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TChangeLink(Instance).Sender);
end;

procedure __DC__SetTChangeLink__Sender(Instance : TObject; Params : PVariantArgList);
begin
TChangeLink(Instance).Sender:=TCustomImageList(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomImageList__Count(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomImageList(Instance).Count;
end;

function __DC__GetTCustomImageList__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomImageList(Instance).Handle;
end;

procedure __DC__SetTCustomImageList__Handle(Instance : TObject; Params : PVariantArgList);
begin
TCustomImageList(Instance).Handle:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomImageList__AllocBy(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomImageList(Instance).AllocBy;
end;

procedure __DC__SetTCustomImageList__AllocBy(Instance : TObject; Params : PVariantArgList);
begin
TCustomImageList(Instance).AllocBy:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomImageList__BlendColor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomImageList(Instance).BlendColor;
end;

procedure __DC__SetTCustomImageList__BlendColor(Instance : TObject; Params : PVariantArgList);
begin
TCustomImageList(Instance).BlendColor:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomImageList__BkColor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomImageList(Instance).BkColor;
end;

procedure __DC__SetTCustomImageList__BkColor(Instance : TObject; Params : PVariantArgList);
begin
TCustomImageList(Instance).BkColor:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomImageList__DrawingStyle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomImageList(Instance).DrawingStyle;
end;

procedure __DC__SetTCustomImageList__DrawingStyle(Instance : TObject; Params : PVariantArgList);
begin
TCustomImageList(Instance).DrawingStyle:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomImageList__Height(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomImageList(Instance).Height;
end;

procedure __DC__SetTCustomImageList__Height(Instance : TObject; Params : PVariantArgList);
begin
TCustomImageList(Instance).Height:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomImageList__ImageType(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomImageList(Instance).ImageType;
end;

procedure __DC__SetTCustomImageList__ImageType(Instance : TObject; Params : PVariantArgList);
begin
TCustomImageList(Instance).ImageType:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomImageList__Masked(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomImageList(Instance).Masked;
end;

procedure __DC__SetTCustomImageList__Masked(Instance : TObject; Params : PVariantArgList);
begin
TCustomImageList(Instance).Masked:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomImageList__ShareImages(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomImageList(Instance).ShareImages;
end;

procedure __DC__SetTCustomImageList__ShareImages(Instance : TObject; Params : PVariantArgList);
begin
TCustomImageList(Instance).ShareImages:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomImageList__Width(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomImageList(Instance).Width;
end;

procedure __DC__SetTCustomImageList__Width(Instance : TObject; Params : PVariantArgList);
begin
TCustomImageList(Instance).Width:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
RegisterProperty(TChangeLink,'Sender',__DC__GetTChangeLink__Sender,__DC__SetTChangeLink__Sender);
RegisterProperty(TCustomImageList,'Count',__DC__GetTCustomImageList__Count,nil);
RegisterProperty(TCustomImageList,'Handle',__DC__GetTCustomImageList__Handle,__DC__SetTCustomImageList__Handle);
RegisterProperty(TCustomImageList,'AllocBy',__DC__GetTCustomImageList__AllocBy,__DC__SetTCustomImageList__AllocBy);
RegisterProperty(TCustomImageList,'BlendColor',__DC__GetTCustomImageList__BlendColor,__DC__SetTCustomImageList__BlendColor);
RegisterProperty(TCustomImageList,'BkColor',__DC__GetTCustomImageList__BkColor,__DC__SetTCustomImageList__BkColor);
RegisterProperty(TCustomImageList,'DrawingStyle',__DC__GetTCustomImageList__DrawingStyle,__DC__SetTCustomImageList__DrawingStyle);
RegisterProperty(TCustomImageList,'Height',__DC__GetTCustomImageList__Height,__DC__SetTCustomImageList__Height);
RegisterProperty(TCustomImageList,'ImageType',__DC__GetTCustomImageList__ImageType,__DC__SetTCustomImageList__ImageType);
RegisterProperty(TCustomImageList,'Masked',__DC__GetTCustomImageList__Masked,__DC__SetTCustomImageList__Masked);
RegisterProperty(TCustomImageList,'ShareImages',__DC__GetTCustomImageList__ShareImages,__DC__SetTCustomImageList__ShareImages);
RegisterProperty(TCustomImageList,'Width',__DC__GetTCustomImageList__Width,__DC__SetTCustomImageList__Width);
end;

const __ConstNames0 : array[0..14] of string = (
'dsFocus'
,'dsSelected'
,'dsNormal'
,'dsTransparent'
,'itImage'
,'itMask'
,'rtBitmap'
,'rtCursor'
,'rtIcon'
,'lrDefaultColor'
,'lrDefaultSize'
,'lrFromFile'
,'lrMap3DColors'
,'lrTransparent'
,'lrMonoChrome'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,dsFocus));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,dsSelected));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,dsNormal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,dsTransparent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,itImage));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,itMask));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,rtBitmap));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,rtCursor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,rtIcon));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,lrDefaultColor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,lrDefaultSize));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,lrFromFile));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,lrMap3DColors));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,lrTransparent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,lrMonoChrome));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..1] of TClass = (
TChangeLink,
TCustomImageList
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
RegRegisterMethod(TChangeLink,'Change',TypeInfo(_T0),NoParams, pointer(MinVMTOffset - 0));

RegRegisterMethod(TCustomImageList,'Change',TypeInfo(_T1),NoParams, pointer(MinVMTOffset - 15));

RegRegisterMethod(TCustomImageList,'DoDraw',TypeInfo(_T2),[
TypeInfo(Integer),
TypeInfo(TCanvas),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Cardinal),
TypeInfo(Boolean)], pointer(48));

RegRegisterMethod(TCustomImageList,'Initialize',TypeInfo(_T3),NoParams, pointer(52));

RegisterProc(TCustomImageList,'CreateSize',mtConstructor,TypeInfo(_T4),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TCustomImageList.CreateSize),cRegister);

RegRegisterMethod(TCustomImageList,'Add',TypeInfo(_T5),[
TypeInfo(TBitmap),
TypeInfo(TBitmap),TypeInfo(Integer)],Addr(TCustomImageList.Add));

RegRegisterMethod(TCustomImageList,'AddIcon',TypeInfo(_T6),[
TypeInfo(TIcon),TypeInfo(Integer)],Addr(TCustomImageList.AddIcon));

RegRegisterMethod(TCustomImageList,'AddImages',TypeInfo(_T7),[
TypeInfo(TCustomImageList)],Addr(TCustomImageList.AddImages));

RegRegisterMethod(TCustomImageList,'AddMasked',TypeInfo(_T8),[
TypeInfo(TBitmap),
TypeInfo(TColor),TypeInfo(Integer)],Addr(TCustomImageList.AddMasked));

RegRegisterMethod(TCustomImageList,'Clear',TypeInfo(_T9),NoParams,Addr(TCustomImageList.Clear));

RegRegisterMethod(TCustomImageList,'Delete',TypeInfo(_T10),[
TypeInfo(Integer)],Addr(TCustomImageList.Delete));

RegisterProc(TCustomImageList,'Draw',mtScriptMethod,TypeInfo(_T11),[
TypeInfo(TCanvas),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Boolean)],Addr(__TCustomImageList__Draw__Wrapper),cRegister);

RegisterProc(TCustomImageList,'DrawOverlay',mtScriptMethod,TypeInfo(_T12),[
TypeInfo(TCanvas),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TOverlay),
TypeInfo(Boolean)],Addr(__TCustomImageList__DrawOverlay__Wrapper),cRegister);

RegRegisterMethod(TCustomImageList,'FileLoad',TypeInfo(_T13),[
TypeInfo(TResType),
TypeInfo(string),
TypeInfo(TColor),TypeInfo(Boolean)],Addr(TCustomImageList.FileLoad));

RegRegisterMethod(TCustomImageList,'GetBitmap',TypeInfo(_T14),[
TypeInfo(Integer),
TypeInfo(TBitmap)],Addr(TCustomImageList.GetBitmap));

RegRegisterMethod(TCustomImageList,'GetHotSpot',TypeInfo(_T15),[TypeInfo(IDispatch)], pointer(56));

RegRegisterMethod(TCustomImageList,'GetIcon',TypeInfo(_T16),[
TypeInfo(Integer),
TypeInfo(TIcon)],Addr(TCustomImageList.GetIcon));

RegRegisterMethod(TCustomImageList,'GetImageBitmap',TypeInfo(_T17),[TypeInfo(HBITMAP)],Addr(TCustomImageList.GetImageBitmap));

RegRegisterMethod(TCustomImageList,'GetMaskBitmap',TypeInfo(_T18),[TypeInfo(HBITMAP)],Addr(TCustomImageList.GetMaskBitmap));

RegRegisterMethod(TCustomImageList,'GetResource',TypeInfo(_T19),[
TypeInfo(TResType),
TypeInfo(string),
TypeInfo(Integer),
TypeInfo(TLoadResources),
TypeInfo(TColor),TypeInfo(Boolean)],Addr(TCustomImageList.GetResource));

RegRegisterMethod(TCustomImageList,'GetInstRes',TypeInfo(_T20),[
TypeInfo(THandle),
TypeInfo(TResType),
TypeInfo(string),
TypeInfo(Integer),
TypeInfo(TLoadResources),
TypeInfo(TColor),TypeInfo(Boolean)],Addr(TCustomImageList.GetInstRes));

RegRegisterMethod(TCustomImageList,'HandleAllocated',TypeInfo(_T21),[TypeInfo(Boolean)],Addr(TCustomImageList.HandleAllocated));

RegRegisterMethod(TCustomImageList,'Insert',TypeInfo(_T22),[
TypeInfo(Integer),
TypeInfo(TBitmap),
TypeInfo(TBitmap)],Addr(TCustomImageList.Insert));

RegRegisterMethod(TCustomImageList,'InsertIcon',TypeInfo(_T23),[
TypeInfo(Integer),
TypeInfo(TIcon)],Addr(TCustomImageList.InsertIcon));

RegRegisterMethod(TCustomImageList,'InsertMasked',TypeInfo(_T24),[
TypeInfo(Integer),
TypeInfo(TBitmap),
TypeInfo(TColor)],Addr(TCustomImageList.InsertMasked));

RegRegisterMethod(TCustomImageList,'Move',TypeInfo(_T25),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TCustomImageList.Move));

RegRegisterMethod(TCustomImageList,'Overlay',TypeInfo(_T26),[
TypeInfo(Integer),
TypeInfo(TOverlay),TypeInfo(Boolean)],Addr(TCustomImageList.Overlay));

RegRegisterMethod(TCustomImageList,'RegisterChanges',TypeInfo(_T27),[
TypeInfo(TChangeLink)],Addr(TCustomImageList.RegisterChanges));

RegRegisterMethod(TCustomImageList,'ResourceLoad',TypeInfo(_T28),[
TypeInfo(TResType),
TypeInfo(string),
TypeInfo(TColor),TypeInfo(Boolean)],Addr(TCustomImageList.ResourceLoad));

RegRegisterMethod(TCustomImageList,'ResInstLoad',TypeInfo(_T29),[
TypeInfo(THandle),
TypeInfo(TResType),
TypeInfo(string),
TypeInfo(TColor),TypeInfo(Boolean)],Addr(TCustomImageList.ResInstLoad));

RegRegisterMethod(TCustomImageList,'Replace',TypeInfo(_T30),[
TypeInfo(Integer),
TypeInfo(TBitmap),
TypeInfo(TBitmap)],Addr(TCustomImageList.Replace));

RegRegisterMethod(TCustomImageList,'ReplaceIcon',TypeInfo(_T31),[
TypeInfo(Integer),
TypeInfo(TIcon)],Addr(TCustomImageList.ReplaceIcon));

RegRegisterMethod(TCustomImageList,'ReplaceMasked',TypeInfo(_T32),[
TypeInfo(Integer),
TypeInfo(TBitmap),
TypeInfo(TColor)],Addr(TCustomImageList.ReplaceMasked));

RegRegisterMethod(TCustomImageList,'UnRegisterChanges',TypeInfo(_T33),[
TypeInfo(TChangeLink)],Addr(TCustomImageList.UnRegisterChanges));

end;
initialization
_mreg_0;
__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
end.
