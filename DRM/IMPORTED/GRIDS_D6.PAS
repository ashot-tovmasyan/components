{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit GRIDS_D6;
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
  Variants,
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
type __TCustomGrid__ = class(TCustomGrid);
type
_T0 = function (p0 : Longint;
p1 : Longint): IDispatch of object;

_T1 = procedure (p0 : Integer;
p1 : Integer;
var p2 : Longint;
var p3 : Longint) of object;

_T2 = procedure (p0 : Integer;
p1 : Integer;
var p2 : TGridState;
var p3 : Longint;
var p4 : Integer;
var p5 : Integer;
const p6 : IDispatch) of object;

_T3 = function : TInplaceEdit of object;

_T4 = procedure (p0 : Longint;
p1 : Longint;
p2 : Boolean) of object;

_T5 = function (p0 : Char): Boolean of object;

_T6 = function (p0 : Word;
p1 : TShiftState): Boolean of object;

_T7 = function : Boolean of object;

_T8 = _T7;

_T9 = function (p0 : Longint;
p1 : Longint): string of object;

_T10 = procedure (p0 : Longint;
p1 : Longint;
const p2 : string) of object;

_T11 = function : Integer of object;

_T12 = _T9;

_T13 = function (p0 : Longint;
p1 : Longint): TEditStyle of object;

_T14 = procedure (p0 : Longint;
p1 : Longint) of object;

_T15 = _T14;

_T16 = procedure (p0 : Longint;
p1 : Longint;
const p2 : IDispatch;
p3 : TGridDrawState) of object;

_T17 = function (p0 : Longint;
p1 : Longint): Boolean of object;

_T18 = _T14;

_T19 = procedure  of object;

_T20 = procedure (p0 : TGridScrollDirection) of object;

_T21 = _T19;

_T22 = _T19;

_T23 = procedure (p0 : Longint) of object;

_T24 = _T23;

_T25 = function (var p0 : Integer;
var p1 : Integer;
const p2 : IDispatch): Boolean of object;

_T26 = _T25;

_T27 = _T25;

_T28 = _T25;

_T29 = _T25;

_T30 = _T25;

_T31 = function (p0 : Integer;
p1 : Integer): IDispatch of object;

_T32 = _T19;

_T33 = _T19;

_T34 = _T19;

_T35 = _T19;

_T36 = _T19;

_T37 = procedure (const p0 : IDispatch) of object;

_T38 = function (const p0 : IDispatch): Boolean of object;

_T39 = _T19;

_T40 = _T37;

_T41 = _T7;

_T42 = procedure (p0 : Boolean) of object;

_T43 = procedure (var p0 : Word;
p1 : TShiftState) of object;

_T44 = _T19;

_T45 = _T19;

_T46 = _T19;

_T47 = _T19;

_T48 = procedure (p0 : TStringGrid;
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
function __TCustomDrawGrid__CellRect__Wrapper(__Instance : TCustomDrawGrid;
p0 : Longint;
p1 : Longint): IDispatch;
var
__result : TRect;
__wrapper : __TRect__Wrapper;
begin
__result := TCustomDrawGrid(__Instance).CellRect(p0,p1);
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
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
function __DC__GetTCustomDrawGrid__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDrawGrid(Instance).Canvas);
end;

function __DC__GetTCustomDrawGrid__Col(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDrawGrid(Instance).Col;
end;

procedure __DC__SetTCustomDrawGrid__Col(Instance : TObject; Params : PVariantArgList);
begin
TCustomDrawGrid(Instance).Col:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDrawGrid__ColWidths(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDrawGrid(Instance).ColWidths[OleVariant(Params^[0])];
end;

procedure __DC__SetTCustomDrawGrid__ColWidths(Instance : TObject; Params : PVariantArgList);
begin
TCustomDrawGrid(Instance).ColWidths[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDrawGrid__EditorMode(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDrawGrid(Instance).EditorMode;
end;

procedure __DC__SetTCustomDrawGrid__EditorMode(Instance : TObject; Params : PVariantArgList);
begin
TCustomDrawGrid(Instance).EditorMode:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDrawGrid__GridHeight(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDrawGrid(Instance).GridHeight;
end;

function __DC__GetTCustomDrawGrid__GridWidth(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDrawGrid(Instance).GridWidth;
end;

function __DC__GetTCustomDrawGrid__LeftCol(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDrawGrid(Instance).LeftCol;
end;

procedure __DC__SetTCustomDrawGrid__LeftCol(Instance : TObject; Params : PVariantArgList);
begin
TCustomDrawGrid(Instance).LeftCol:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDrawGrid__Selection(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TGridRect__Wrapper;
begin
__wrapper := __TGridRect__Wrapper.Create;
__wrapper.fR := TCustomDrawGrid(Instance).Selection;
result := IUnknown(__wrapper) as IDispatch;
end;

procedure __DC__SetTCustomDrawGrid__Selection(Instance : TObject; Params : PVariantArgList);
var
__idisp:IDispatch;
__iwrapper:IDCRecordWrapper;
begin
__idisp:=DCVarToInterface(OleVariant(Params^[0]));
if __idisp=nil then exit;
__idisp.QueryInterface(IDCRecordWrapper, __iwrapper);
TCustomDrawGrid(Instance).Selection:=TGridRect(__iwrapper.GetRecordPtr^);
end;

function __DC__GetTCustomDrawGrid__Row(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDrawGrid(Instance).Row;
end;

procedure __DC__SetTCustomDrawGrid__Row(Instance : TObject; Params : PVariantArgList);
begin
TCustomDrawGrid(Instance).Row:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDrawGrid__RowHeights(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDrawGrid(Instance).RowHeights[OleVariant(Params^[0])];
end;

procedure __DC__SetTCustomDrawGrid__RowHeights(Instance : TObject; Params : PVariantArgList);
begin
TCustomDrawGrid(Instance).RowHeights[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDrawGrid__TabStops(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDrawGrid(Instance).TabStops[OleVariant(Params^[0])];
end;

procedure __DC__SetTCustomDrawGrid__TabStops(Instance : TObject; Params : PVariantArgList);
begin
TCustomDrawGrid(Instance).TabStops[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDrawGrid__TopRow(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDrawGrid(Instance).TopRow;
end;

procedure __DC__SetTCustomDrawGrid__TopRow(Instance : TObject; Params : PVariantArgList);
begin
TCustomDrawGrid(Instance).TopRow:=OleVariant(Params^[0]);
end;

function __DC__GetTInplaceEditList__ActiveList(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TInplaceEditList(Instance).ActiveList);
end;

procedure __DC__SetTInplaceEditList__ActiveList(Instance : TObject; Params : PVariantArgList);
begin
TInplaceEditList(Instance).ActiveList:=TWinControl(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTInplaceEditList__ButtonWidth(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TInplaceEditList(Instance).ButtonWidth;
end;

procedure __DC__SetTInplaceEditList__ButtonWidth(Instance : TObject; Params : PVariantArgList);
begin
TInplaceEditList(Instance).ButtonWidth:=OleVariant(Params^[0]);
end;

function __DC__GetTInplaceEditList__DropDownRows(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TInplaceEditList(Instance).DropDownRows;
end;

procedure __DC__SetTInplaceEditList__DropDownRows(Instance : TObject; Params : PVariantArgList);
begin
TInplaceEditList(Instance).DropDownRows:=OleVariant(Params^[0]);
end;

function __DC__GetTInplaceEditList__EditStyle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TInplaceEditList(Instance).EditStyle;
end;

function __DC__GetTInplaceEditList__ListVisible(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TInplaceEditList(Instance).ListVisible;
end;

procedure __DC__SetTInplaceEditList__ListVisible(Instance : TObject; Params : PVariantArgList);
begin
TInplaceEditList(Instance).ListVisible:=OleVariant(Params^[0]);
end;

function __DC__GetTInplaceEditList__PickList(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TInplaceEditList(Instance).PickList);
end;

function __DC__GetTInplaceEditList__PickListLoaded(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TInplaceEditList(Instance).PickListLoaded;
end;

procedure __DC__SetTInplaceEditList__PickListLoaded(Instance : TObject; Params : PVariantArgList);
begin
TInplaceEditList(Instance).PickListLoaded:=OleVariant(Params^[0]);
end;

function __DC__GetTInplaceEditList__Pressed(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TInplaceEditList(Instance).Pressed;
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
RegisterProperty(TCustomDrawGrid,'Canvas',__DC__GetTCustomDrawGrid__Canvas,nil);
RegisterProperty(TCustomDrawGrid,'Col',__DC__GetTCustomDrawGrid__Col,__DC__SetTCustomDrawGrid__Col);
RegisterIndexedProperty(TCustomDrawGrid,'ColWidths',1,False,__DC__GetTCustomDrawGrid__ColWidths,__DC__SetTCustomDrawGrid__ColWidths);
RegisterProperty(TCustomDrawGrid,'EditorMode',__DC__GetTCustomDrawGrid__EditorMode,__DC__SetTCustomDrawGrid__EditorMode);
RegisterProperty(TCustomDrawGrid,'GridHeight',__DC__GetTCustomDrawGrid__GridHeight,nil);
RegisterProperty(TCustomDrawGrid,'GridWidth',__DC__GetTCustomDrawGrid__GridWidth,nil);
RegisterProperty(TCustomDrawGrid,'LeftCol',__DC__GetTCustomDrawGrid__LeftCol,__DC__SetTCustomDrawGrid__LeftCol);
RegisterProperty(TCustomDrawGrid,'Selection',__DC__GetTCustomDrawGrid__Selection,__DC__SetTCustomDrawGrid__Selection);
RegisterProperty(TCustomDrawGrid,'Row',__DC__GetTCustomDrawGrid__Row,__DC__SetTCustomDrawGrid__Row);
RegisterIndexedProperty(TCustomDrawGrid,'RowHeights',1,False,__DC__GetTCustomDrawGrid__RowHeights,__DC__SetTCustomDrawGrid__RowHeights);
RegisterIndexedProperty(TCustomDrawGrid,'TabStops',1,False,__DC__GetTCustomDrawGrid__TabStops,__DC__SetTCustomDrawGrid__TabStops);
RegisterProperty(TCustomDrawGrid,'TopRow',__DC__GetTCustomDrawGrid__TopRow,__DC__SetTCustomDrawGrid__TopRow);
RegisterProperty(TInplaceEditList,'ActiveList',__DC__GetTInplaceEditList__ActiveList,__DC__SetTInplaceEditList__ActiveList);
RegisterProperty(TInplaceEditList,'ButtonWidth',__DC__GetTInplaceEditList__ButtonWidth,__DC__SetTInplaceEditList__ButtonWidth);
RegisterProperty(TInplaceEditList,'DropDownRows',__DC__GetTInplaceEditList__DropDownRows,__DC__SetTInplaceEditList__DropDownRows);
RegisterProperty(TInplaceEditList,'EditStyle',__DC__GetTInplaceEditList__EditStyle,nil);
RegisterProperty(TInplaceEditList,'ListVisible',__DC__GetTInplaceEditList__ListVisible,__DC__SetTInplaceEditList__ListVisible);
RegisterProperty(TInplaceEditList,'PickList',__DC__GetTInplaceEditList__PickList,nil);
RegisterProperty(TInplaceEditList,'PickListLoaded',__DC__GetTInplaceEditList__PickListLoaded,__DC__SetTInplaceEditList__PickListLoaded);
RegisterProperty(TInplaceEditList,'Pressed',__DC__GetTInplaceEditList__Pressed,nil);
RegisterIndexedProperty(TStringGrid,'Cells',2,False,__DC__GetTStringGrid__Cells,__DC__SetTStringGrid__Cells);
RegisterIndexedProperty(TStringGrid,'Cols',1,False,__DC__GetTStringGrid__Cols,__DC__SetTStringGrid__Cols);
RegisterIndexedProperty(TStringGrid,'Objects',2,False,__DC__GetTStringGrid__Objects,__DC__SetTStringGrid__Objects);
RegisterIndexedProperty(TStringGrid,'Rows',1,False,__DC__GetTStringGrid__Rows,__DC__SetTStringGrid__Rows);
end;

const __ConstNames0 : array[0..32] of string = (
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
,'esSimple'
,'esEllipsis'
,'esPickList'
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
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,esSimple));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,esEllipsis));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,esPickList));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..7] of TClass = (
EInvalidGridOperation,
TCustomDrawGrid,
TCustomGrid,
TDrawGrid,
TInplaceEdit,
TInplaceEditList,
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
RegRegisterMethod(TCustomDrawGrid,'CellRect',TypeInfo(_T0),[
TypeInfo(Longint),
TypeInfo(Longint),TypeInfo(IDispatch)],Addr(__TCustomDrawGrid__CellRect__Wrapper));

RegRegisterMethod(TCustomDrawGrid,'MouseToCell',TypeInfo(_T1),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Longint),
TypeInfo(Longint)],Addr(TCustomDrawGrid.MouseToCell));

RegRegisterMethod(TCustomGrid,'CalcSizingState',TypeInfo(_T2),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TGridState),
TypeInfo(Longint),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(IDispatch)], pointer(200));

RegRegisterMethod(TCustomGrid,'CreateEditor',TypeInfo(_T3),[TypeInfo(TInplaceEdit)], pointer(204));

RegRegisterMethod(TCustomGrid,'AdjustSize',TypeInfo(_T4),[
TypeInfo(Longint),
TypeInfo(Longint),
TypeInfo(Boolean)], pointer(MinVMTOffset - 76));

RegRegisterMethod(TCustomGrid,'CanEditAcceptKey',TypeInfo(_T5),[
TypeInfo(Char),TypeInfo(Boolean)], pointer(MinVMTOffset - 77));

RegRegisterMethod(TCustomGrid,'CanGridAcceptKey',TypeInfo(_T6),[
TypeInfo(Word),
TypeInfo(TShiftState),TypeInfo(Boolean)], pointer(MinVMTOffset - 78));

RegRegisterMethod(TCustomGrid,'CanEditModify',TypeInfo(_T7),[TypeInfo(Boolean)], pointer(MinVMTOffset - 79));

RegRegisterMethod(TCustomGrid,'CanEditShow',TypeInfo(_T8),[TypeInfo(Boolean)], pointer(208));

RegRegisterMethod(TCustomGrid,'GetEditText',TypeInfo(_T9),[
TypeInfo(Longint),
TypeInfo(Longint),TypeInfo(string)], pointer(MinVMTOffset - 80));

RegRegisterMethod(TCustomGrid,'SetEditText',TypeInfo(_T10),[
TypeInfo(Longint),
TypeInfo(Longint),
TypeInfo(string)], pointer(MinVMTOffset - 81));

RegRegisterMethod(TCustomGrid,'GetEditLimit',TypeInfo(_T11),[TypeInfo(Integer)], pointer(MinVMTOffset - 82));

RegRegisterMethod(TCustomGrid,'GetEditMask',TypeInfo(_T12),[
TypeInfo(Longint),
TypeInfo(Longint),TypeInfo(string)], pointer(MinVMTOffset - 83));

RegRegisterMethod(TCustomGrid,'GetEditStyle',TypeInfo(_T13),[
TypeInfo(Longint),
TypeInfo(Longint),TypeInfo(TEditStyle)], pointer(MinVMTOffset - 84));

RegRegisterMethod(TCustomGrid,'ColumnMoved',TypeInfo(_T14),[
TypeInfo(Longint),
TypeInfo(Longint)], pointer(MinVMTOffset - 85));

RegRegisterMethod(TCustomGrid,'RowMoved',TypeInfo(_T15),[
TypeInfo(Longint),
TypeInfo(Longint)], pointer(MinVMTOffset - 86));

RegRegisterMethod(TCustomGrid,'DrawCell',TypeInfo(_T16),[
TypeInfo(Longint),
TypeInfo(Longint),
TypeInfo(IDispatch),
TypeInfo(TGridDrawState)], pointer(212));

RegRegisterMethod(TCustomGrid,'SelectCell',TypeInfo(_T17),[
TypeInfo(Longint),
TypeInfo(Longint),TypeInfo(Boolean)], pointer(216));

RegRegisterMethod(TCustomGrid,'SizeChanged',TypeInfo(_T18),[
TypeInfo(Longint),
TypeInfo(Longint)], pointer(MinVMTOffset - 87));

RegRegisterMethod(TCustomGrid,'TopLeftChanged',TypeInfo(_T19),NoParams, pointer(MinVMTOffset - 88));

RegRegisterMethod(TCustomGrid,'TimedScroll',TypeInfo(_T20),[
TypeInfo(TGridScrollDirection)], pointer(MinVMTOffset - 89));

RegRegisterMethod(TCustomGrid,'ColWidthsChanged',TypeInfo(_T21),NoParams, pointer(MinVMTOffset - 90));

RegRegisterMethod(TCustomGrid,'RowHeightsChanged',TypeInfo(_T22),NoParams, pointer(MinVMTOffset - 91));

RegRegisterMethod(TCustomGrid,'DeleteColumn',TypeInfo(_T23),[
TypeInfo(Longint)], pointer(220));

RegRegisterMethod(TCustomGrid,'DeleteRow',TypeInfo(_T24),[
TypeInfo(Longint)], pointer(224));

RegRegisterMethod(TCustomGrid,'BeginColumnDrag',TypeInfo(_T25),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(IDispatch),TypeInfo(Boolean)], pointer(MinVMTOffset - 92));

RegRegisterMethod(TCustomGrid,'BeginRowDrag',TypeInfo(_T26),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(IDispatch),TypeInfo(Boolean)], pointer(MinVMTOffset - 93));

RegRegisterMethod(TCustomGrid,'CheckColumnDrag',TypeInfo(_T27),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(IDispatch),TypeInfo(Boolean)], pointer(MinVMTOffset - 94));

RegRegisterMethod(TCustomGrid,'CheckRowDrag',TypeInfo(_T28),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(IDispatch),TypeInfo(Boolean)], pointer(MinVMTOffset - 95));

RegRegisterMethod(TCustomGrid,'EndColumnDrag',TypeInfo(_T29),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(IDispatch),TypeInfo(Boolean)], pointer(MinVMTOffset - 96));

RegRegisterMethod(TCustomGrid,'EndRowDrag',TypeInfo(_T30),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(IDispatch),TypeInfo(Boolean)], pointer(MinVMTOffset - 97));

RegRegisterMethod(TCustomGrid,'MouseCoord',TypeInfo(_T31),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(IDispatch)],Addr(__TCustomGrid__MouseCoord__Wrapper));

RegRegisterMethod(TInplaceEdit,'BoundsChanged',TypeInfo(_T32),NoParams, pointer(248));

RegRegisterMethod(TInplaceEdit,'UpdateContents',TypeInfo(_T33),NoParams, pointer(252));

RegRegisterMethod(TInplaceEdit,'Deselect',TypeInfo(_T34),NoParams,Addr(TInplaceEdit.Deselect));

RegRegisterMethod(TInplaceEdit,'Hide',TypeInfo(_T35),NoParams,Addr(TInplaceEdit.Hide));

RegRegisterMethod(TInplaceEdit,'Invalidate',TypeInfo(_T36),NoParams,Addr(TInplaceEdit.Invalidate));

RegRegisterMethod(TInplaceEdit,'Move',TypeInfo(_T37),[
TypeInfo(IDispatch)],Addr(__TInplaceEdit__Move__Wrapper));

RegRegisterMethod(TInplaceEdit,'PosEqual',TypeInfo(_T38),[
TypeInfo(IDispatch),TypeInfo(Boolean)],Addr(__TInplaceEdit__PosEqual__Wrapper));

RegRegisterMethod(TInplaceEdit,'SetFocus',TypeInfo(_T39),NoParams,Addr(TInplaceEdit.SetFocus));

RegRegisterMethod(TInplaceEdit,'UpdateLoc',TypeInfo(_T40),[
TypeInfo(IDispatch)],Addr(__TInplaceEdit__UpdateLoc__Wrapper));

RegRegisterMethod(TInplaceEdit,'Visible',TypeInfo(_T41),[TypeInfo(Boolean)],Addr(TInplaceEdit.Visible));

RegRegisterMethod(TInplaceEditList,'CloseUp',TypeInfo(_T42),[
TypeInfo(Boolean)], pointer(MinVMTOffset - 77));

RegRegisterMethod(TInplaceEditList,'DoDropDownKeys',TypeInfo(_T43),[
TypeInfo(Word),
TypeInfo(TShiftState)], pointer(256));

RegRegisterMethod(TInplaceEditList,'DoEditButtonClick',TypeInfo(_T44),NoParams, pointer(260));

RegRegisterMethod(TInplaceEditList,'DoGetPickListItems',TypeInfo(_T45),NoParams, pointer(MinVMTOffset - 78));

RegRegisterMethod(TInplaceEditList,'DropDown',TypeInfo(_T46),NoParams, pointer(MinVMTOffset - 79));

RegRegisterMethod(TInplaceEditList,'RestoreContents',TypeInfo(_T47),NoParams,Addr(TInplaceEditList.RestoreContents));

RegisterProc(TStringGridStrings,'Create',mtConstructor,TypeInfo(_T48),[
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

RegisterEvent(TypeInfo(TOnGetPickListItems),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TStrings)]);

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
