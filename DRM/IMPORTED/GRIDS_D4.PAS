{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit GRIDS_D4;
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
  Messages,
  Windows,
  SysUtils,
  Classes,
  Graphics,
  Menus,
  Controls,
  Forms,
  StdCtrls,
  Mask,
  Grids;
function ConvertTGridAxisDrawInfoToVariant(var R : TGridAxisDrawInfo) : OleVariant;
function ConvertVariantToTGridAxisDrawInfo(const V : OleVariant) : TGridAxisDrawInfo;
function ConvertTGridCoordToVariant(var R : TGridCoord) : OleVariant;
function ConvertVariantToTGridCoord(const V : OleVariant) : TGridCoord;
function ConvertTGridDrawInfoToVariant(var R : TGridDrawInfo) : OleVariant;
function ConvertVariantToTGridDrawInfo(const V : OleVariant) : TGridDrawInfo;
function ConvertTGridRectToVariant(var R : TGridRect) : OleVariant;
function ConvertVariantToTGridRect(const V : OleVariant) : TGridRect;
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
type __TGridRect__Wrapper = class(TDCRecordWrapper)
private
fR : TGridRect;
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
type __TGridAxisDrawInfo__Wrapper = class(TDCRecordWrapper)
private
fR : TGridAxisDrawInfo;
public
function GetRecordPtr : pointer; override;
published
procedure setEffectiveLineWidth(const val : Integer);
function getEffectiveLineWidth : Integer;
property EffectiveLineWidth : Integer read getEffectiveLineWidth write setEffectiveLineWidth;
procedure setFixedBoundary(const val : Integer);
function getFixedBoundary : Integer;
property FixedBoundary : Integer read getFixedBoundary write setFixedBoundary;
procedure setGridBoundary(const val : Integer);
function getGridBoundary : Integer;
property GridBoundary : Integer read getGridBoundary write setGridBoundary;
procedure setGridExtent(const val : Integer);
function getGridExtent : Integer;
property GridExtent : Integer read getGridExtent write setGridExtent;
procedure setLastFullVisibleCell(const val : Longint);
function getLastFullVisibleCell : Longint;
property LastFullVisibleCell : Longint read getLastFullVisibleCell write setLastFullVisibleCell;
procedure setFullVisBoundary(const val : Integer);
function getFullVisBoundary : Integer;
property FullVisBoundary : Integer read getFullVisBoundary write setFullVisBoundary;
procedure setFixedCellCount(const val : Integer);
function getFixedCellCount : Integer;
property FixedCellCount : Integer read getFixedCellCount write setFixedCellCount;
procedure setFirstGridCell(const val : Integer);
function getFirstGridCell : Integer;
property FirstGridCell : Integer read getFirstGridCell write setFirstGridCell;
procedure setGridCellCount(const val : Integer);
function getGridCellCount : Integer;
property GridCellCount : Integer read getGridCellCount write setGridCellCount;
end;
type __TGridCoord__Wrapper = class(TDCRecordWrapper)
private
fR : TGridCoord;
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
type __TGridDrawInfo__Wrapper = class(TDCRecordWrapper)
private
fR : TGridDrawInfo;
public
function GetRecordPtr : pointer; override;
published
end;
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
type __TCustomGrid__ = class(TCustomGrid);
type
_T0 = procedure (p0 : Integer;
p1 : Integer;
var p2 : TGridState;
var p3 : Longint;
var p4 : Integer;
var p5 : Integer;
const p6 : IDispatch) of object;

_T1 = function : TInplaceEdit of object;

_T2 = procedure (p0 : Longint;
p1 : Longint;
p2 : Boolean) of object;

_T3 = function (p0 : Char): Boolean of object;

_T4 = function (p0 : Word;
p1 : TShiftState): Boolean of object;

_T5 = function : Boolean of object;

_T6 = _T5;

_T7 = function (p0 : Longint;
p1 : Longint): string of object;

_T8 = procedure (p0 : Longint;
p1 : Longint;
const p2 : string) of object;

_T9 = _T7;

_T10 = function : Integer of object;

_T11 = procedure (p0 : Longint;
p1 : Longint) of object;

_T12 = _T11;

_T13 = procedure (p0 : Longint;
p1 : Longint;
const p2 : IDispatch;
p3 : TGridDrawState) of object;

_T14 = function (p0 : Longint;
p1 : Longint): Boolean of object;

_T15 = _T11;

_T16 = procedure  of object;

_T17 = procedure (p0 : TGridScrollDirection) of object;

_T18 = _T16;

_T19 = _T16;

_T20 = procedure (p0 : Longint) of object;

_T21 = _T20;

_T22 = function (var p0 : Integer;
var p1 : Integer;
const p2 : IDispatch): Boolean of object;

_T23 = _T22;

_T24 = _T22;

_T25 = _T22;

_T26 = _T22;

_T27 = _T22;

_T28 = function (p0 : Integer;
p1 : Integer): IDispatch of object;

_T29 = function (p0 : Longint;
p1 : Longint): IDispatch of object;

_T30 = procedure (p0 : Integer;
p1 : Integer;
var p2 : Longint;
var p3 : Longint) of object;

_T31 = _T16;

_T32 = _T16;

_T33 = _T16;

_T34 = _T16;

_T35 = _T16;

_T36 = procedure (const p0 : IDispatch) of object;

_T37 = function (const p0 : IDispatch): Boolean of object;

_T38 = _T16;

_T39 = _T36;

_T40 = _T5;

_T41 = procedure (p0 : TStringGrid;
p1 : Longint) of object;

function __TGridRect__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TGridRect__Wrapper.setLeft(const val : Longint);
begin
TGridRect(GetRecordPtr^).Left := val;
end;
function __TGridRect__Wrapper.getLeft : Longint;
begin
result := TGridRect(GetRecordPtr^).Left;
end;
procedure __TGridRect__Wrapper.setTop(const val : Longint);
begin
TGridRect(GetRecordPtr^).Top := val;
end;
function __TGridRect__Wrapper.getTop : Longint;
begin
result := TGridRect(GetRecordPtr^).Top;
end;
procedure __TGridRect__Wrapper.setRight(const val : Longint);
begin
TGridRect(GetRecordPtr^).Right := val;
end;
function __TGridRect__Wrapper.getRight : Longint;
begin
result := TGridRect(GetRecordPtr^).Right;
end;
procedure __TGridRect__Wrapper.setBottom(const val : Longint);
begin
TGridRect(GetRecordPtr^).Bottom := val;
end;
function __TGridRect__Wrapper.getBottom : Longint;
begin
result := TGridRect(GetRecordPtr^).Bottom;
end;
function __TGridAxisDrawInfo__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TGridAxisDrawInfo__Wrapper.setEffectiveLineWidth(const val : Integer);
begin
TGridAxisDrawInfo(GetRecordPtr^).EffectiveLineWidth := val;
end;
function __TGridAxisDrawInfo__Wrapper.getEffectiveLineWidth : Integer;
begin
result := TGridAxisDrawInfo(GetRecordPtr^).EffectiveLineWidth;
end;
procedure __TGridAxisDrawInfo__Wrapper.setFixedBoundary(const val : Integer);
begin
TGridAxisDrawInfo(GetRecordPtr^).FixedBoundary := val;
end;
function __TGridAxisDrawInfo__Wrapper.getFixedBoundary : Integer;
begin
result := TGridAxisDrawInfo(GetRecordPtr^).FixedBoundary;
end;
procedure __TGridAxisDrawInfo__Wrapper.setGridBoundary(const val : Integer);
begin
TGridAxisDrawInfo(GetRecordPtr^).GridBoundary := val;
end;
function __TGridAxisDrawInfo__Wrapper.getGridBoundary : Integer;
begin
result := TGridAxisDrawInfo(GetRecordPtr^).GridBoundary;
end;
procedure __TGridAxisDrawInfo__Wrapper.setGridExtent(const val : Integer);
begin
TGridAxisDrawInfo(GetRecordPtr^).GridExtent := val;
end;
function __TGridAxisDrawInfo__Wrapper.getGridExtent : Integer;
begin
result := TGridAxisDrawInfo(GetRecordPtr^).GridExtent;
end;
procedure __TGridAxisDrawInfo__Wrapper.setLastFullVisibleCell(const val : Longint);
begin
TGridAxisDrawInfo(GetRecordPtr^).LastFullVisibleCell := val;
end;
function __TGridAxisDrawInfo__Wrapper.getLastFullVisibleCell : Longint;
begin
result := TGridAxisDrawInfo(GetRecordPtr^).LastFullVisibleCell;
end;
procedure __TGridAxisDrawInfo__Wrapper.setFullVisBoundary(const val : Integer);
begin
TGridAxisDrawInfo(GetRecordPtr^).FullVisBoundary := val;
end;
function __TGridAxisDrawInfo__Wrapper.getFullVisBoundary : Integer;
begin
result := TGridAxisDrawInfo(GetRecordPtr^).FullVisBoundary;
end;
procedure __TGridAxisDrawInfo__Wrapper.setFixedCellCount(const val : Integer);
begin
TGridAxisDrawInfo(GetRecordPtr^).FixedCellCount := val;
end;
function __TGridAxisDrawInfo__Wrapper.getFixedCellCount : Integer;
begin
result := TGridAxisDrawInfo(GetRecordPtr^).FixedCellCount;
end;
procedure __TGridAxisDrawInfo__Wrapper.setFirstGridCell(const val : Integer);
begin
TGridAxisDrawInfo(GetRecordPtr^).FirstGridCell := val;
end;
function __TGridAxisDrawInfo__Wrapper.getFirstGridCell : Integer;
begin
result := TGridAxisDrawInfo(GetRecordPtr^).FirstGridCell;
end;
procedure __TGridAxisDrawInfo__Wrapper.setGridCellCount(const val : Integer);
begin
TGridAxisDrawInfo(GetRecordPtr^).GridCellCount := val;
end;
function __TGridAxisDrawInfo__Wrapper.getGridCellCount : Integer;
begin
result := TGridAxisDrawInfo(GetRecordPtr^).GridCellCount;
end;
function __TGridCoord__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TGridCoord__Wrapper.setX(const val : Longint);
begin
TGridCoord(GetRecordPtr^).X := val;
end;
function __TGridCoord__Wrapper.getX : Longint;
begin
result := TGridCoord(GetRecordPtr^).X;
end;
procedure __TGridCoord__Wrapper.setY(const val : Longint);
begin
TGridCoord(GetRecordPtr^).Y := val;
end;
function __TGridCoord__Wrapper.getY : Longint;
begin
result := TGridCoord(GetRecordPtr^).Y;
end;
function __TGridDrawInfo__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
function _TGridAxisDrawInfo_ : IDispatch;
begin
  result := __TGridAxisDrawInfo__Wrapper.Create;
end;
function _TGridCoord_ : IDispatch;
begin
  result := __TGridCoord__Wrapper.Create;
end;
function _TGridDrawInfo_ : IDispatch;
begin
  result := __TGridDrawInfo__Wrapper.Create;
end;
function _TGridRect_ : IDispatch;
begin
  result := __TGridRect__Wrapper.Create;
end;
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
procedure __TCustomGrid__CalcSizingState__Wrapper(__Instance : TCustomGrid;
p0 : Integer;
p1 : Integer;
var p2 : TGridState;
var p3 : Longint;
var p4 : Integer;
var p5 : Integer;
const p6 : IDispatch);
var
__p6 : ^TGridDrawInfo;
__i6 : IDispatch;
begin
if p6 = nil then exit;
__p6 := (p6 as IDCRecordWrapper).GetRecordPtr;
__TCustomGrid__(__Instance).CalcSizingState(p0,p1,p2,p3,p4,p5,__p6^);
end;

procedure __TCustomGrid__DrawCell__Wrapper(__Instance : TCustomGrid;
p0 : Longint;
p1 : Longint;
const p2 : IDispatch;
p3 : TGridDrawState);
var
__p2 : ^TRect;
__i2 : IDispatch;
begin
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
__TCustomGrid__(__Instance).DrawCell(p0,p1,__p2^,p3);
end;

function __TCustomGrid__BeginColumnDrag__Wrapper(__Instance : TCustomGrid;
var p0 : Integer;
var p1 : Integer;
const p2 : IDispatch): Boolean;
var
__p2 : ^TPoint;
__i2 : IDispatch;
begin
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
result := __TCustomGrid__(__Instance).BeginColumnDrag(p0,p1,__p2^);
end;

function __TCustomGrid__BeginRowDrag__Wrapper(__Instance : TCustomGrid;
var p0 : Integer;
var p1 : Integer;
const p2 : IDispatch): Boolean;
var
__p2 : ^TPoint;
__i2 : IDispatch;
begin
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
result := __TCustomGrid__(__Instance).BeginRowDrag(p0,p1,__p2^);
end;

function __TCustomGrid__CheckColumnDrag__Wrapper(__Instance : TCustomGrid;
var p0 : Integer;
var p1 : Integer;
const p2 : IDispatch): Boolean;
var
__p2 : ^TPoint;
__i2 : IDispatch;
begin
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
result := __TCustomGrid__(__Instance).CheckColumnDrag(p0,p1,__p2^);
end;

function __TCustomGrid__CheckRowDrag__Wrapper(__Instance : TCustomGrid;
var p0 : Integer;
var p1 : Integer;
const p2 : IDispatch): Boolean;
var
__p2 : ^TPoint;
__i2 : IDispatch;
begin
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
result := __TCustomGrid__(__Instance).CheckRowDrag(p0,p1,__p2^);
end;

function __TCustomGrid__EndColumnDrag__Wrapper(__Instance : TCustomGrid;
var p0 : Integer;
var p1 : Integer;
const p2 : IDispatch): Boolean;
var
__p2 : ^TPoint;
__i2 : IDispatch;
begin
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
result := __TCustomGrid__(__Instance).EndColumnDrag(p0,p1,__p2^);
end;

function __TCustomGrid__EndRowDrag__Wrapper(__Instance : TCustomGrid;
var p0 : Integer;
var p1 : Integer;
const p2 : IDispatch): Boolean;
var
__p2 : ^TPoint;
__i2 : IDispatch;
begin
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
result := __TCustomGrid__(__Instance).EndRowDrag(p0,p1,__p2^);
end;

function __TCustomGrid__MouseCoord__Wrapper(__Instance : TCustomGrid;
p0 : Integer;
p1 : Integer): IDispatch;
var
__result : TGridCoord;
__wrapper : __TGridCoord__Wrapper;
begin
__result := TCustomGrid(__Instance).MouseCoord(p0,p1);
__wrapper := __TGridCoord__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function __TDrawGrid__CellRect__Wrapper(__Instance : TDrawGrid;
p0 : Longint;
p1 : Longint): IDispatch;
var
__result : TRect;
__wrapper : __TRect__Wrapper;
begin
__result := TDrawGrid(__Instance).CellRect(p0,p1);
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

procedure __TInplaceEdit__Move__Wrapper(__Instance : TInplaceEdit;
const p0 : IDispatch);
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TInplaceEdit(__Instance).Move(__p0^);
end;

function __TInplaceEdit__PosEqual__Wrapper(__Instance : TInplaceEdit;
const p0 : IDispatch): Boolean;
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := TInplaceEdit(__Instance).PosEqual(__p0^);
end;

procedure __TInplaceEdit__UpdateLoc__Wrapper(__Instance : TInplaceEdit;
const p0 : IDispatch);
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
TInplaceEdit(__Instance).UpdateLoc(__p0^);
end;


type __TGridAxisDrawInfo__Wrapper__ = class(__TGridAxisDrawInfo__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TGridAxisDrawInfo__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTGridAxisDrawInfoToVariant(var R : TGridAxisDrawInfo) : OleVariant;
var
__rw : __TGridAxisDrawInfo__Wrapper__;
begin
__rw := __TGridAxisDrawInfo__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTGridAxisDrawInfo(const V : OleVariant) : TGridAxisDrawInfo;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TGridAxisDrawInfo((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TGridCoord__Wrapper__ = class(__TGridCoord__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TGridCoord__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTGridCoordToVariant(var R : TGridCoord) : OleVariant;
var
__rw : __TGridCoord__Wrapper__;
begin
__rw := __TGridCoord__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTGridCoord(const V : OleVariant) : TGridCoord;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TGridCoord((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TGridDrawInfo__Wrapper__ = class(__TGridDrawInfo__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TGridDrawInfo__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTGridDrawInfoToVariant(var R : TGridDrawInfo) : OleVariant;
var
__rw : __TGridDrawInfo__Wrapper__;
begin
__rw := __TGridDrawInfo__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTGridDrawInfo(const V : OleVariant) : TGridDrawInfo;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TGridDrawInfo((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TGridRect__Wrapper__ = class(__TGridRect__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TGridRect__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTGridRectToVariant(var R : TGridRect) : OleVariant;
var
__rw : __TGridRect__Wrapper__;
begin
__rw := __TGridRect__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTGridRect(const V : OleVariant) : TGridRect;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TGridRect((_idisp as IDCRecordWrapper).GetRecordPtr^);
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
function __DC__GetTDrawGrid__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDrawGrid(Instance).Canvas);
end;

function __DC__GetTDrawGrid__Col(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDrawGrid(Instance).Col;
end;

procedure __DC__SetTDrawGrid__Col(Instance : TObject; Params : PVariantArgList);
begin
TDrawGrid(Instance).Col:=OleVariant(Params^[0]);
end;

function __DC__GetTDrawGrid__ColWidths(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDrawGrid(Instance).ColWidths[OleVariant(Params^[0])];
end;

procedure __DC__SetTDrawGrid__ColWidths(Instance : TObject; Params : PVariantArgList);
begin
TDrawGrid(Instance).ColWidths[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTDrawGrid__EditorMode(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDrawGrid(Instance).EditorMode;
end;

procedure __DC__SetTDrawGrid__EditorMode(Instance : TObject; Params : PVariantArgList);
begin
TDrawGrid(Instance).EditorMode:=OleVariant(Params^[0]);
end;

function __DC__GetTDrawGrid__GridHeight(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDrawGrid(Instance).GridHeight;
end;

function __DC__GetTDrawGrid__GridWidth(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDrawGrid(Instance).GridWidth;
end;

function __DC__GetTDrawGrid__LeftCol(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDrawGrid(Instance).LeftCol;
end;

procedure __DC__SetTDrawGrid__LeftCol(Instance : TObject; Params : PVariantArgList);
begin
TDrawGrid(Instance).LeftCol:=OleVariant(Params^[0]);
end;

function __DC__GetTDrawGrid__Selection(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TGridRect__Wrapper;
begin
__wrapper := __TGridRect__Wrapper.Create;
__wrapper.fR := TDrawGrid(Instance).Selection;
result := IUnknown(__wrapper) as IDispatch;
end;

procedure __DC__SetTDrawGrid__Selection(Instance : TObject; Params : PVariantArgList);
var
__idisp:IDispatch;
__iwrapper:IDCRecordWrapper;
begin
__idisp:=DCVarToInterface(OleVariant(Params^[0]));
if __idisp=nil then exit;
__idisp.QueryInterface(IDCRecordWrapper, __iwrapper);
TDrawGrid(Instance).Selection:=TGridRect(__iwrapper.GetRecordPtr^);
end;

function __DC__GetTDrawGrid__Row(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDrawGrid(Instance).Row;
end;

procedure __DC__SetTDrawGrid__Row(Instance : TObject; Params : PVariantArgList);
begin
TDrawGrid(Instance).Row:=OleVariant(Params^[0]);
end;

function __DC__GetTDrawGrid__RowHeights(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDrawGrid(Instance).RowHeights[OleVariant(Params^[0])];
end;

procedure __DC__SetTDrawGrid__RowHeights(Instance : TObject; Params : PVariantArgList);
begin
TDrawGrid(Instance).RowHeights[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTDrawGrid__TabStops(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDrawGrid(Instance).TabStops[OleVariant(Params^[0])];
end;

procedure __DC__SetTDrawGrid__TabStops(Instance : TObject; Params : PVariantArgList);
begin
TDrawGrid(Instance).TabStops[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTDrawGrid__TopRow(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDrawGrid(Instance).TopRow;
end;

procedure __DC__SetTDrawGrid__TopRow(Instance : TObject; Params : PVariantArgList);
begin
TDrawGrid(Instance).TopRow:=OleVariant(Params^[0]);
end;

function __DC__GetTStringGrid__Cells(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TStringGrid(Instance).Cells[OleVariant(Params^[1]), OleVariant(Params^[0])];
end;

procedure __DC__SetTStringGrid__Cells(Instance : TObject; Params : PVariantArgList);
begin
TStringGrid(Instance).Cells[OleVariant(Params^[2]), OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTStringGrid__Cols(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TStringGrid(Instance).Cols[OleVariant(Params^[0])]);
end;

procedure __DC__SetTStringGrid__Cols(Instance : TObject; Params : PVariantArgList);
begin
TStringGrid(Instance).Cols[OleVariant(Params^[1])]:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTStringGrid__Objects(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TStringGrid(Instance).Objects[OleVariant(Params^[1]), OleVariant(Params^[0])]);
end;

procedure __DC__SetTStringGrid__Objects(Instance : TObject; Params : PVariantArgList);
begin
TStringGrid(Instance).Objects[OleVariant(Params^[2]), OleVariant(Params^[1])]:=TObject(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTStringGrid__Rows(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TStringGrid(Instance).Rows[OleVariant(Params^[0])]);
end;

procedure __DC__SetTStringGrid__Rows(Instance : TObject; Params : PVariantArgList);
begin
TStringGrid(Instance).Rows[OleVariant(Params^[1])]:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

procedure __RegisterProps;
begin
RegisterProperty(TDrawGrid,'Canvas',__DC__GetTDrawGrid__Canvas,nil);
RegisterProperty(TDrawGrid,'Col',__DC__GetTDrawGrid__Col,__DC__SetTDrawGrid__Col);
RegisterIndexedProperty(TDrawGrid,'ColWidths',1,False,__DC__GetTDrawGrid__ColWidths,__DC__SetTDrawGrid__ColWidths);
RegisterProperty(TDrawGrid,'EditorMode',__DC__GetTDrawGrid__EditorMode,__DC__SetTDrawGrid__EditorMode);
RegisterProperty(TDrawGrid,'GridHeight',__DC__GetTDrawGrid__GridHeight,nil);
RegisterProperty(TDrawGrid,'GridWidth',__DC__GetTDrawGrid__GridWidth,nil);
RegisterProperty(TDrawGrid,'LeftCol',__DC__GetTDrawGrid__LeftCol,__DC__SetTDrawGrid__LeftCol);
RegisterProperty(TDrawGrid,'Selection',__DC__GetTDrawGrid__Selection,__DC__SetTDrawGrid__Selection);
RegisterProperty(TDrawGrid,'Row',__DC__GetTDrawGrid__Row,__DC__SetTDrawGrid__Row);
RegisterIndexedProperty(TDrawGrid,'RowHeights',1,False,__DC__GetTDrawGrid__RowHeights,__DC__SetTDrawGrid__RowHeights);
RegisterIndexedProperty(TDrawGrid,'TabStops',1,False,__DC__GetTDrawGrid__TabStops,__DC__SetTDrawGrid__TabStops);
RegisterProperty(TDrawGrid,'TopRow',__DC__GetTDrawGrid__TopRow,__DC__SetTDrawGrid__TopRow);
RegisterIndexedProperty(TStringGrid,'Cells',2,False,__DC__GetTStringGrid__Cells,__DC__SetTStringGrid__Cells);
RegisterIndexedProperty(TStringGrid,'Cols',1,False,__DC__GetTStringGrid__Cols,__DC__SetTStringGrid__Cols);
RegisterIndexedProperty(TStringGrid,'Objects',2,False,__DC__GetTStringGrid__Objects,__DC__SetTStringGrid__Objects);
RegisterIndexedProperty(TStringGrid,'Rows',1,False,__DC__GetTStringGrid__Rows,__DC__SetTStringGrid__Rows);
end;

const __ConstNames0 : array[0..29] of string = (
'MaxCustomExtents'
,'MaxShortInt'
,'gsNormal'
,'gsSelecting'
,'gsRowSizing'
,'gsColSizing'
,'gsRowMoving'
,'gsColMoving'
,'goFixedVertLine'
,'goFixedHorzLine'
,'goVertLine'
,'goHorzLine'
,'goRangeSelect'
,'goDrawFocusSelected'
,'goRowSizing'
,'goColSizing'
,'goRowMoving'
,'goColMoving'
,'goEditing'
,'goTabs'
,'goRowSelect'
,'goAlwaysShowEditor'
,'goThumbTracking'
,'gdSelected'
,'gdFocused'
,'gdFixed'
,'sdLeft'
,'sdRight'
,'sdUp'
,'sdDown'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,MaxCustomExtents));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,MaxShortInt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,gsNormal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,gsSelecting));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,gsRowSizing));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,gsColSizing));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,gsRowMoving));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,gsColMoving));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,goFixedVertLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,goFixedHorzLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,goVertLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,goHorzLine));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,goRangeSelect));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,goDrawFocusSelected));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,goRowSizing));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,goColSizing));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,goRowMoving));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,goColMoving));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,goEditing));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,goTabs));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,goRowSelect));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,goAlwaysShowEditor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,goThumbTracking));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,gdSelected));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,gdFocused));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,gdFixed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,sdLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,sdRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,sdUp));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,sdDown));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..5] of TClass = (
EInvalidGridOperation,
TCustomGrid,
TDrawGrid,
TInplaceEdit,
TStringGrid,
TStringGridStrings
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
'TGridAxisDrawInfo'
,'TGridCoord'
,'TGridDrawInfo'
,'TGridRect'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TGridAxisDrawInfo_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(_TGridCoord_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[2],Addr(_TGridDrawInfo_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[3],Addr(_TGridRect_)));
RegRegisterMethod(TCustomGrid,'CalcSizingState',TypeInfo(_T0),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TGridState),
TypeInfo(Longint),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(IDispatch)], pointer(188));

RegRegisterMethod(TCustomGrid,'CreateEditor',TypeInfo(_T1),[TypeInfo(TInplaceEdit)], pointer(192));

RegRegisterMethod(TCustomGrid,'AdjustSize',TypeInfo(_T2),[
TypeInfo(Longint),
TypeInfo(Longint),
TypeInfo(Boolean)], pointer(MinVMTOffset - 71));

RegRegisterMethod(TCustomGrid,'CanEditAcceptKey',TypeInfo(_T3),[
TypeInfo(Char),TypeInfo(Boolean)], pointer(MinVMTOffset - 72));

RegRegisterMethod(TCustomGrid,'CanGridAcceptKey',TypeInfo(_T4),[
TypeInfo(Word),
TypeInfo(TShiftState),TypeInfo(Boolean)], pointer(MinVMTOffset - 73));

RegRegisterMethod(TCustomGrid,'CanEditModify',TypeInfo(_T5),[TypeInfo(Boolean)], pointer(MinVMTOffset - 74));

RegRegisterMethod(TCustomGrid,'CanEditShow',TypeInfo(_T6),[TypeInfo(Boolean)], pointer(196));

RegRegisterMethod(TCustomGrid,'GetEditText',TypeInfo(_T7),[
TypeInfo(Longint),
TypeInfo(Longint),TypeInfo(string)], pointer(MinVMTOffset - 75));

RegRegisterMethod(TCustomGrid,'SetEditText',TypeInfo(_T8),[
TypeInfo(Longint),
TypeInfo(Longint),
TypeInfo(string)], pointer(MinVMTOffset - 76));

RegRegisterMethod(TCustomGrid,'GetEditMask',TypeInfo(_T9),[
TypeInfo(Longint),
TypeInfo(Longint),TypeInfo(string)], pointer(MinVMTOffset - 77));

RegRegisterMethod(TCustomGrid,'GetEditLimit',TypeInfo(_T10),[TypeInfo(Integer)], pointer(MinVMTOffset - 78));

RegRegisterMethod(TCustomGrid,'ColumnMoved',TypeInfo(_T11),[
TypeInfo(Longint),
TypeInfo(Longint)], pointer(MinVMTOffset - 79));

RegRegisterMethod(TCustomGrid,'RowMoved',TypeInfo(_T12),[
TypeInfo(Longint),
TypeInfo(Longint)], pointer(MinVMTOffset - 80));

RegRegisterMethod(TCustomGrid,'DrawCell',TypeInfo(_T13),[
TypeInfo(Longint),
TypeInfo(Longint),
TypeInfo(IDispatch),
TypeInfo(TGridDrawState)], pointer(200));

RegRegisterMethod(TCustomGrid,'SelectCell',TypeInfo(_T14),[
TypeInfo(Longint),
TypeInfo(Longint),TypeInfo(Boolean)], pointer(204));

RegRegisterMethod(TCustomGrid,'SizeChanged',TypeInfo(_T15),[
TypeInfo(Longint),
TypeInfo(Longint)], pointer(MinVMTOffset - 81));

RegRegisterMethod(TCustomGrid,'TopLeftChanged',TypeInfo(_T16),NoParams, pointer(MinVMTOffset - 82));

RegRegisterMethod(TCustomGrid,'TimedScroll',TypeInfo(_T17),[
TypeInfo(TGridScrollDirection)], pointer(MinVMTOffset - 83));

RegRegisterMethod(TCustomGrid,'ColWidthsChanged',TypeInfo(_T18),NoParams, pointer(MinVMTOffset - 84));

RegRegisterMethod(TCustomGrid,'RowHeightsChanged',TypeInfo(_T19),NoParams, pointer(MinVMTOffset - 85));

RegRegisterMethod(TCustomGrid,'DeleteColumn',TypeInfo(_T20),[
TypeInfo(Longint)], pointer(208));

RegRegisterMethod(TCustomGrid,'DeleteRow',TypeInfo(_T21),[
TypeInfo(Longint)], pointer(212));

RegRegisterMethod(TCustomGrid,'BeginColumnDrag',TypeInfo(_T22),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(IDispatch),TypeInfo(Boolean)], pointer(MinVMTOffset - 86));

RegRegisterMethod(TCustomGrid,'BeginRowDrag',TypeInfo(_T23),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(IDispatch),TypeInfo(Boolean)], pointer(MinVMTOffset - 87));

RegRegisterMethod(TCustomGrid,'CheckColumnDrag',TypeInfo(_T24),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(IDispatch),TypeInfo(Boolean)], pointer(MinVMTOffset - 88));

RegRegisterMethod(TCustomGrid,'CheckRowDrag',TypeInfo(_T25),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(IDispatch),TypeInfo(Boolean)], pointer(MinVMTOffset - 89));

RegRegisterMethod(TCustomGrid,'EndColumnDrag',TypeInfo(_T26),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(IDispatch),TypeInfo(Boolean)], pointer(MinVMTOffset - 90));

RegRegisterMethod(TCustomGrid,'EndRowDrag',TypeInfo(_T27),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(IDispatch),TypeInfo(Boolean)], pointer(MinVMTOffset - 91));

RegRegisterMethod(TCustomGrid,'MouseCoord',TypeInfo(_T28),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(IDispatch)],Addr(__TCustomGrid__MouseCoord__Wrapper));

RegRegisterMethod(TDrawGrid,'CellRect',TypeInfo(_T29),[
TypeInfo(Longint),
TypeInfo(Longint),TypeInfo(IDispatch)],Addr(__TDrawGrid__CellRect__Wrapper));

RegRegisterMethod(TDrawGrid,'MouseToCell',TypeInfo(_T30),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Longint),
TypeInfo(Longint)],Addr(TDrawGrid.MouseToCell));

RegRegisterMethod(TInplaceEdit,'BoundsChanged',TypeInfo(_T31),NoParams, pointer(236));

RegRegisterMethod(TInplaceEdit,'UpdateContents',TypeInfo(_T32),NoParams, pointer(240));

RegRegisterMethod(TInplaceEdit,'Deselect',TypeInfo(_T33),NoParams,Addr(TInplaceEdit.Deselect));

RegRegisterMethod(TInplaceEdit,'Hide',TypeInfo(_T34),NoParams,Addr(TInplaceEdit.Hide));

RegRegisterMethod(TInplaceEdit,'Invalidate',TypeInfo(_T35),NoParams,Addr(TInplaceEdit.Invalidate));

RegRegisterMethod(TInplaceEdit,'Move',TypeInfo(_T36),[
TypeInfo(IDispatch)],Addr(__TInplaceEdit__Move__Wrapper));

RegRegisterMethod(TInplaceEdit,'PosEqual',TypeInfo(_T37),[
TypeInfo(IDispatch),TypeInfo(Boolean)],Addr(__TInplaceEdit__PosEqual__Wrapper));

RegRegisterMethod(TInplaceEdit,'SetFocus',TypeInfo(_T38),NoParams,Addr(TInplaceEdit.SetFocus));

RegRegisterMethod(TInplaceEdit,'UpdateLoc',TypeInfo(_T39),[
TypeInfo(IDispatch)],Addr(__TInplaceEdit__UpdateLoc__Wrapper));

RegRegisterMethod(TInplaceEdit,'Visible',TypeInfo(_T40),[TypeInfo(Boolean)],Addr(TInplaceEdit.Visible));

RegisterProc(TStringGridStrings,'Create',mtConstructor,TypeInfo(_T41),[
TypeInfo(TStringGrid),
TypeInfo(Longint)],Addr(TStringGridStrings.Create),cRegister);

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterEvent(TypeInfo(TDrawCellEvent),[
TypeInfo(TObject),
TypeInfo(Longint),
TypeInfo(Longint),
TypeInfo(IDispatch),
TypeInfo(TGridDrawState)]);}

RegisterEvent(TypeInfo(TGetEditEvent),[
TypeInfo(TObject),
TypeInfo(Longint),
TypeInfo(Longint),
TypeInfo(string)]);

RegisterEvent(TypeInfo(TGetExtentsFunc),[
TypeInfo(Longint),TypeInfo(Integer)]);

RegisterEvent(TypeInfo(TMovedEvent),[
TypeInfo(TObject),
TypeInfo(Longint),
TypeInfo(Longint)]);

RegisterEvent(TypeInfo(TSelectCellEvent),[
TypeInfo(TObject),
TypeInfo(Longint),
TypeInfo(Longint),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TSetEditEvent),[
TypeInfo(TObject),
TypeInfo(Longint),
TypeInfo(Longint),
TypeInfo(string)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
