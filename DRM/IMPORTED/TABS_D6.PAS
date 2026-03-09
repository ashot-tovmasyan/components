{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit TABS_D6;
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
  Windows,
  Classes,
  Graphics,
  Forms,
  Controls,
  Messages,
  Tabs;
function ConvertTPointToVariant(var R : TPoint) : OleVariant;
function ConvertVariantToTPoint(const V : OleVariant) : TPoint;
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
type __TPoint__Wrapper = class(TDCRecordWrapper)
private
fR : TPoint;
public
function GetRecordPtr : pointer; override;
published
procedure setX(const val : Longint);
function getX : Longint;
property X : Longint read getX write setX;
procedure setY(const val : Longint);
function getY : Longint;
property Y : Longint read getY write setY;
end;
type __TTabSet__ = class(TTabSet);
type
_T0 = procedure (p0 : TCanvas;
const p1 : IDispatch;
p2 : Integer;
p3 : Boolean) of object;

_T1 = procedure (p0 : Integer;
var p1 : Integer) of object;

_T2 = function (const p0 : IDispatch): Integer of object;

_T3 = function (p0 : Integer): IDispatch of object;

_T4 = function (p0 : Integer): Integer of object;

_T5 = function : IDispatch of object;

_T6 = procedure (p0 : Boolean) of object;

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
function __TPoint__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TPoint__Wrapper.setX(const val : Longint);
begin
TPoint(GetRecordPtr^).X := val;
end;
function __TPoint__Wrapper.getX : Longint;
begin
result := TPoint(GetRecordPtr^).X;
end;
procedure __TPoint__Wrapper.setY(const val : Longint);
begin
TPoint(GetRecordPtr^).Y := val;
end;
function __TPoint__Wrapper.getY : Longint;
begin
result := TPoint(GetRecordPtr^).Y;
end;
procedure __TTabSet__DrawTab__Wrapper(__Instance : TTabSet;
p0 : TCanvas;
const p1 : IDispatch;
p2 : Integer;
p3 : Boolean);
var
__p1 : ^TRect;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
__TTabSet__(__Instance).DrawTab(p0,__p1^,p2,p3);
end;

function __TTabSet__ItemAtPos__Wrapper(__Instance : TTabSet;
const p0 : IDispatch): Integer;
var
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := TTabSet(__Instance).ItemAtPos(__p0^);
end;

function __TTabSet__ItemRect__Wrapper(__Instance : TTabSet;
p0 : Integer): IDispatch;
var
__result : TRect;
__wrapper : __TRect__Wrapper;
begin
__result := TTabSet(__Instance).ItemRect(p0);
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function __TTabSet__MinClientRect__Wrapper(__Instance : TTabSet): IDispatch;
var
__result : TRect;
__wrapper : __TRect__Wrapper;
begin
__result := TTabSet(__Instance).MinClientRect;
__wrapper := __TRect__Wrapper.Create;
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
function __DC__GetTTabSet__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TTabSet(Instance).Canvas);
end;

function __DC__GetTTabSet__FirstIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TTabSet(Instance).FirstIndex;
end;

procedure __DC__SetTTabSet__FirstIndex(Instance : TObject; Params : PVariantArgList);
begin
TTabSet(Instance).FirstIndex:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
RegisterProperty(TTabSet,'Canvas',__DC__GetTTabSet__Canvas,nil);
RegisterProperty(TTabSet,'FirstIndex',__DC__GetTTabSet__FirstIndex,__DC__SetTTabSet__FirstIndex);
end;

const __ConstNames0 : array[0..15] of string = (
'sbLeft'
,'sbRight'
,'epSelectedLeft'
,'epUnselectedLeft'
,'epSelectedRight'
,'epUnselectedRight'
,'etNone'
,'etFirstIsSel'
,'etFirstNotSel'
,'etLastIsSel'
,'etLastNotSel'
,'etNotSelToSel'
,'etSelToNotSel'
,'etNotSelToNotSel'
,'tsStandard'
,'tsOwnerDraw'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,sbLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,sbRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,epSelectedLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,epUnselectedLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,epSelectedRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,epUnselectedRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,etNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,etFirstIsSel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,etFirstNotSel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,etLastIsSel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,etLastNotSel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,etNotSelToSel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,etSelToNotSel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,etNotSelToNotSel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,tsStandard));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,tsOwnerDraw));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..2] of TClass = (
TScroller,
TTabList,
TTabSet
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
RegRegisterMethod(TTabSet,'DrawTab',TypeInfo(_T0),[
TypeInfo(TCanvas),
TypeInfo(IDispatch),
TypeInfo(Integer),
TypeInfo(Boolean)], pointer(200));

RegRegisterMethod(TTabSet,'MeasureTab',TypeInfo(_T1),[
TypeInfo(Integer),
TypeInfo(Integer)], pointer(204));

RegRegisterMethod(TTabSet,'ItemAtPos',TypeInfo(_T2),[
TypeInfo(IDispatch),TypeInfo(Integer)],Addr(__TTabSet__ItemAtPos__Wrapper));

RegRegisterMethod(TTabSet,'ItemRect',TypeInfo(_T3),[
TypeInfo(Integer),TypeInfo(IDispatch)],Addr(__TTabSet__ItemRect__Wrapper));

RegRegisterMethod(TTabSet,'ItemWidth',TypeInfo(_T4),[
TypeInfo(Integer),TypeInfo(Integer)],Addr(TTabSet.ItemWidth));

RegRegisterMethod(TTabSet,'MinClientRect',TypeInfo(_T5),[TypeInfo(IDispatch)],Addr(__TTabSet__MinClientRect__Wrapper));

RegRegisterMethod(TTabSet,'SelectNext',TypeInfo(_T6),[
TypeInfo(Boolean)],Addr(TTabSet.SelectNext));

end;
initialization
_mreg_0;
{RegisterEvent(TypeInfo(TDrawTabEvent),[
TypeInfo(TObject),
TypeInfo(TCanvas),
TypeInfo(IDispatch),
TypeInfo(Integer),
TypeInfo(Boolean)]);}

RegisterEvent(TypeInfo(TMeasureTabEvent),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer)]);

RegisterEvent(TypeInfo(TTabChangeEvent),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Boolean)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
end.
