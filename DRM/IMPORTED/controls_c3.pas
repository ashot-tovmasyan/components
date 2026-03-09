{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit CONTROLS_C3;
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
  Classes,
  Sysutils,
  Graphics,
  Menus,
  CommCtrl,
  Imm,
  Controls;
function ConvertTCMActivateToVariant(var R : TCMActivate) : OleVariant;
function ConvertVariantToTCMActivate(const V : OleVariant) : TCMActivate;
function ConvertTCMCancelModeToVariant(var R : TCMCancelMode) : OleVariant;
function ConvertVariantToTCMCancelMode(const V : OleVariant) : TCMCancelMode;
function ConvertTCMChangedToVariant(var R : TCMChanged) : OleVariant;
function ConvertVariantToTCMChanged(const V : OleVariant) : TCMChanged;
function ConvertTCMChildKeyToVariant(var R : TCMChildKey) : OleVariant;
function ConvertVariantToTCMChildKey(const V : OleVariant) : TCMChildKey;
function ConvertTCMControlChangeToVariant(var R : TCMControlChange) : OleVariant;
function ConvertVariantToTCMControlChange(const V : OleVariant) : TCMControlChange;
function ConvertTCMControlListChangeToVariant(var R : TCMControlListChange) : OleVariant;
function ConvertVariantToTCMControlListChange(const V : OleVariant) : TCMControlListChange;
function ConvertTCMDeactivateToVariant(var R : TCMDeactivate) : OleVariant;
function ConvertVariantToTCMDeactivate(const V : OleVariant) : TCMDeactivate;
function ConvertTCMDesignHitTestToVariant(var R : TCMDesignHitTest) : OleVariant;
function ConvertVariantToTCMDesignHitTest(const V : OleVariant) : TCMDesignHitTest;
function ConvertTCMDialogCharToVariant(var R : TCMDialogChar) : OleVariant;
function ConvertVariantToTCMDialogChar(const V : OleVariant) : TCMDialogChar;
function ConvertTCMDialogKeyToVariant(var R : TCMDialogKey) : OleVariant;
function ConvertVariantToTCMDialogKey(const V : OleVariant) : TCMDialogKey;
function ConvertTCMDragToVariant(var R : TCMDrag) : OleVariant;
function ConvertVariantToTCMDrag(const V : OleVariant) : TCMDrag;
function ConvertTCMEnterToVariant(var R : TCMEnter) : OleVariant;
function ConvertVariantToTCMEnter(const V : OleVariant) : TCMEnter;
function ConvertTCMExitToVariant(var R : TCMExit) : OleVariant;
function ConvertVariantToTCMExit(const V : OleVariant) : TCMExit;
function ConvertTCMFocusChangedToVariant(var R : TCMFocusChanged) : OleVariant;
function ConvertVariantToTCMFocusChanged(const V : OleVariant) : TCMFocusChanged;
function ConvertTCMGotFocusToVariant(var R : TCMGotFocus) : OleVariant;
function ConvertVariantToTCMGotFocus(const V : OleVariant) : TCMGotFocus;
function ConvertTCMHitTestToVariant(var R : TCMHitTest) : OleVariant;
function ConvertVariantToTCMHitTest(const V : OleVariant) : TCMHitTest;
function ConvertTCMLostFocusToVariant(var R : TCMLostFocus) : OleVariant;
function ConvertVariantToTCMLostFocus(const V : OleVariant) : TCMLostFocus;
function ConvertTCMWantSpecialKeyToVariant(var R : TCMWantSpecialKey) : OleVariant;
function ConvertVariantToTCMWantSpecialKey(const V : OleVariant) : TCMWantSpecialKey;
function ConvertTCreateParamsToVariant(var R : TCreateParams) : OleVariant;
function ConvertVariantToTCreateParams(const V : OleVariant) : TCreateParams;
function ConvertTDragRecToVariant(var R : TDragRec) : OleVariant;
function ConvertVariantToTDragRec(const V : OleVariant) : TDragRec;
function ConvertTMessageToVariant(var R : TMessage) : OleVariant;
function ConvertVariantToTMessage(const V : OleVariant) : TMessage;
function ConvertTMsgToVariant(var R : TMsg) : OleVariant;
function ConvertVariantToTMsg(const V : OleVariant) : TMsg;
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
type __TCMActivate__Wrapper = class(TDCRecordWrapper)
private
fR : TCMActivate;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TCMCancelMode__Wrapper = class(TDCRecordWrapper)
private
fR : TCMCancelMode;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Integer);
function getUnused : Integer;
property Unused : Integer read getUnused write setUnused;
procedure setSender(const val : TControl);
function getSender : TControl;
property Sender : TControl read getSender write setSender;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TCMChanged__Wrapper = class(TDCRecordWrapper)
private
fR : TCMChanged;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setChild(const val : TControl);
function getChild : TControl;
property Child : TControl read getChild write setChild;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TCMChildKey__Wrapper = class(TDCRecordWrapper)
private
fR : TCMChildKey;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setCharCode(const val : Word);
function getCharCode : Word;
property CharCode : Word read getCharCode write setCharCode;
procedure setUnused(const val : Word);
function getUnused : Word;
property Unused : Word read getUnused write setUnused;
procedure setSender(const val : TWinControl);
function getSender : TWinControl;
property Sender : TWinControl read getSender write setSender;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TCMControlChange__Wrapper = class(TDCRecordWrapper)
private
fR : TCMControlChange;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setControl(const val : TControl);
function getControl : TControl;
property Control : TControl read getControl write setControl;
procedure setInserting(const val : LongBool);
function getInserting : LongBool;
property Inserting : LongBool read getInserting write setInserting;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TCMControlListChange__Wrapper = class(TDCRecordWrapper)
private
fR : TCMControlListChange;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setControl(const val : TControl);
function getControl : TControl;
property Control : TControl read getControl write setControl;
procedure setInserting(const val : LongBool);
function getInserting : LongBool;
property Inserting : LongBool read getInserting write setInserting;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TCMDeactivate__Wrapper = class(TDCRecordWrapper)
private
fR : TCMDeactivate;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TCMDesignHitTest__Wrapper = class(TDCRecordWrapper)
private
fR : TCMDesignHitTest;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setKeys(const val : Longint);
function getKeys : Longint;
property Keys : Longint read getKeys write setKeys;
procedure setXPos(const val : SmallInt);
function getXPos : SmallInt;
property XPos : SmallInt read getXPos write setXPos;
procedure setYPos(const val : SmallInt);
function getYPos : SmallInt;
property YPos : SmallInt read getYPos write setYPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TCMDialogChar__Wrapper = class(TDCRecordWrapper)
private
fR : TCMDialogChar;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setCharCode(const val : Word);
function getCharCode : Word;
property CharCode : Word read getCharCode write setCharCode;
procedure setUnused(const val : Word);
function getUnused : Word;
property Unused : Word read getUnused write setUnused;
procedure setKeyData(const val : Longint);
function getKeyData : Longint;
property KeyData : Longint read getKeyData write setKeyData;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TCMDialogKey__Wrapper = class(TDCRecordWrapper)
private
fR : TCMDialogKey;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setCharCode(const val : Word);
function getCharCode : Word;
property CharCode : Word read getCharCode write setCharCode;
procedure setUnused(const val : Word);
function getUnused : Word;
property Unused : Word read getUnused write setUnused;
procedure setKeyData(const val : Longint);
function getKeyData : Longint;
property KeyData : Longint read getKeyData write setKeyData;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TCMDrag__Wrapper = class(TDCRecordWrapper)
private
fR : TCMDrag;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setDragMessage(const val : TDragMessage);
function getDragMessage : TDragMessage;
property DragMessage : TDragMessage read getDragMessage write setDragMessage;
procedure setReserved1(const val : Byte);
function getReserved1 : Byte;
property Reserved1 : Byte read getReserved1 write setReserved1;
procedure setReserved2(const val : Word);
function getReserved2 : Word;
property Reserved2 : Word read getReserved2 write setReserved2;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TCMEnter__Wrapper = class(TDCRecordWrapper)
private
fR : TCMEnter;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TCMExit__Wrapper = class(TDCRecordWrapper)
private
fR : TCMExit;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TCMFocusChanged__Wrapper = class(TDCRecordWrapper)
private
fR : TCMFocusChanged;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Integer);
function getUnused : Integer;
property Unused : Integer read getUnused write setUnused;
procedure setSender(const val : TWinControl);
function getSender : TWinControl;
property Sender : TWinControl read getSender write setSender;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TCMGotFocus__Wrapper = class(TDCRecordWrapper)
private
fR : TCMGotFocus;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TCMHitTest__Wrapper = class(TDCRecordWrapper)
private
fR : TCMHitTest;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setXPos(const val : SmallInt);
function getXPos : SmallInt;
property XPos : SmallInt read getXPos write setXPos;
procedure setYPos(const val : SmallInt);
function getYPos : SmallInt;
property YPos : SmallInt read getYPos write setYPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TCMLostFocus__Wrapper = class(TDCRecordWrapper)
private
fR : TCMLostFocus;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TCMWantSpecialKey__Wrapper = class(TDCRecordWrapper)
private
fR : TCMWantSpecialKey;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setCharCode(const val : Word);
function getCharCode : Word;
property CharCode : Word read getCharCode write setCharCode;
procedure setUnused(const val : Word);
function getUnused : Word;
property Unused : Word read getUnused write setUnused;
procedure setKeyData(const val : Longint);
function getKeyData : Longint;
property KeyData : Longint read getKeyData write setKeyData;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TCreateParams__Wrapper = class(TDCRecordWrapper)
private
fR : TCreateParams;
public
function GetRecordPtr : pointer; override;
published
procedure setStyle(const val : Longint);
function getStyle : Longint;
property Style : Longint read getStyle write setStyle;
procedure setExStyle(const val : Longint);
function getExStyle : Longint;
property ExStyle : Longint read getExStyle write setExStyle;
procedure setX(const val : Integer);
function getX : Integer;
property X : Integer read getX write setX;
procedure setY(const val : Integer);
function getY : Integer;
property Y : Integer read getY write setY;
procedure setWidth(const val : Integer);
function getWidth : Integer;
property Width : Integer read getWidth write setWidth;
procedure setHeight(const val : Integer);
function getHeight : Integer;
property Height : Integer read getHeight write setHeight;
end;
type __TDragRec__Wrapper = class(TDCRecordWrapper)
private
fR : TDragRec;
public
function GetRecordPtr : pointer; override;
published
procedure setSource(const val : TDragObject);
function getSource : TDragObject;
property Source : TDragObject read getSource write setSource;
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
type __TMsg__Wrapper = class(TDCRecordWrapper)
private
fR : TMsg;
public
function GetRecordPtr : pointer; override;
published
procedure setmessage(const val : UINT);
function getmessage : UINT;
property message : UINT read getmessage write setmessage;
procedure setWPARAM(const val : WPARAM);
function getWPARAM : WPARAM;
property WPARAM : WPARAM read getWPARAM write setWPARAM;
procedure setLPARAM(const val : LPARAM);
function getLPARAM : LPARAM;
property LPARAM : LPARAM read getLPARAM write setLPARAM;
procedure settime(const val : DWORD);
function gettime : DWORD;
property time : DWORD read gettime write settime;
end;
type __TControl__ = class(TControl);
type __TWinControl__ = class(TWinControl);
type
_T0 = function (p0 : TObject): Boolean of object;

_T1 = function (p0 : HWND): TWinControl of object;

_T2 = function (const p0 : IDispatch): TWinControl of object;

_T3 = function (const p0 : IDispatch;
p1 : Boolean): TControl of object;

_T4 = function : TControl of object;

_T5 = procedure (p0 : TControl) of object;

_T6 = procedure  of object;

_T7 = function (p0 : TCursor): string of object;

_T8 = function (const p0 : string): TCursor of object;

{_T9 = procedure (p0 : TGetStrProc) of object;}

_T10 = function (p0 : Longint;
var p1 : string): Boolean of object;

_T11 = function (const p0 : string;
var p1 : Longint): Boolean of object;

_T12 = function (const p0 : string): string of object;

_T13 = _T12;

_T14 = function (p0 : HWND;
p1 : Longint;
p2 : Longint;
p3 : Longint): Longint of object;

_T15 = function (p0 : Cardinal;
p1 : Longint;
p2 : Longint): Longint of object;

_T16 = procedure (p0 : HDC;
p1 : Integer;
p2 : Integer) of object;

_T17 = procedure (p0 : HWND;
p1 : TImeMode) of object;

_T18 = procedure (p0 : TImeName) of object;

_T19 = function (p0 : HWND;
p1 : Boolean): Boolean of object;

_T20 = function (p0 : HWND): HIMC of object;

_T21 = function (p0 : HWND;
p1 : HIMC): Boolean of object;

_T22 = function (p0 : HIMC;
var p1 : DWORD;
var p2 : DWORD): Boolean of object;

_T23 = function (p0 : HIMC;
p1 : DWORD;
p2 : DWORD): Boolean of object;

_T24 = function (p0 : HIMC;
p1 : Boolean): Boolean of object;

{_T25 = function (p0 : HIMC;
p1 : PCOMPOSITIONFORM): Boolean of object;}

{_T26 = function (p0 : HIMC;
p1 : PLOGFONTA): Boolean of object;}

_T27 = function (p0 : HIMC;
p1 : DWORD;
p2 : Pointer;
p3 : DWORD): Longint of object;

_T28 = function (p0 : hKl): Boolean of object;

_T29 = function (p0 : HIMC;
p1 : DWORD;
p2 : DWORD;
p3 : DWORD): Boolean of object;

_T30 = _T6;

_T31 = procedure (p0 : Integer;
p1 : Integer) of object;

_T32 = _T6;

_T33 = _T6;

_T34 = _T6;

_T35 = procedure (p0 : TObject;
p1 : Integer;
p2 : Integer;
p3 : TDragState;
var p4 : Boolean) of object;

_T36 = procedure (p0 : TObject;
p1 : Integer;
p2 : Integer) of object;

_T37 = procedure (var p0 : TDragObject) of object;

_T38 = function : IDispatch of object;

_T39 = _T38;

_T40 = function (var p0 : HWND): HDC of object;

_T41 = function : TCustomImageList of object;

_T42 = function : HPALETTE of object;

_T43 = function : TPopupMenu of object;

_T44 = procedure (p0 : TMouseButton;
p1 : TShiftState;
p2 : Integer;
p3 : Integer) of object;

_T45 = procedure (p0 : TShiftState;
p1 : Integer;
p2 : Integer) of object;

_T46 = _T44;

_T47 = function (p0 : Boolean): Boolean of object;

_T48 = _T6;

_T49 = procedure (p0 : TDragMode) of object;

_T50 = procedure (p0 : TWinControl) of object;

_T51 = procedure (p0 : Boolean) of object;

_T52 = _T6;

_T53 = procedure (const p0 : IDispatch) of object;

_T54 = _T51;

_T55 = _T6;

_T56 = function (const p0 : IDispatch): IDispatch of object;

_T57 = function : Boolean of object;

_T58 = _T36;

_T59 = _T51;

{_T60 = function (p0 : PChar;
p1 : Integer): Integer of object;}

_T61 = function : Integer of object;

_T62 = _T6;

_T63 = _T6;

_T64 = _T15;

_T65 = _T6;

_T66 = _T6;

_T67 = _T56;

_T68 = _T6;

_T69 = procedure (p0 : Integer;
p1 : Integer;
p2 : Integer;
p3 : Integer) of object;

{_T70 = procedure (p0 : PChar) of object;}

_T71 = _T6;

_T72 = _T6;

_T73 = _T6;

_T74 = _T6;

_T75 = _T6;

_T76 = _T31;

_T77 = function (p0 : TBitmap;
p1 : TBitmap): Integer of object;

_T78 = function (p0 : TIcon): Integer of object;

_T79 = procedure (p0 : TCustomImageList) of object;

_T80 = function (p0 : TBitmap;
p1 : TColor): Integer of object;

_T81 = function (p0 : HWND;
p1 : Integer;
p2 : Integer): Boolean of object;

_T82 = _T6;

_T83 = procedure (p0 : Integer) of object;

_T84 = _T81;

_T85 = function (p0 : Integer;
p1 : Integer): Boolean of object;

_T86 = _T6;

_T87 = procedure (p0 : TCanvas;
p1 : Integer;
p2 : Integer;
p3 : Integer) of object;

_T88 = procedure (p0 : TCanvas;
p1 : Integer;
p2 : Integer;
p3 : Integer;
p4 : TOverlay) of object;

_T89 = _T57;

_T90 = function (p0 : TResType;
p1 : string;
p2 : TColor): Boolean of object;

_T91 = procedure (p0 : Integer;
p1 : TBitmap) of object;

_T92 = _T38;

_T93 = procedure (p0 : Integer;
p1 : TIcon) of object;

_T94 = function : HBITMAP of object;

_T95 = _T94;

_T96 = function (p0 : TResType;
p1 : string;
p2 : Integer;
p3 : TLoadResources;
p4 : TColor): Boolean of object;

_T97 = function (p0 : THandle;
p1 : TResType;
p2 : string;
p3 : Integer;
p4 : TLoadResources;
p5 : TColor): Boolean of object;

_T98 = _T57;

_T99 = _T6;

_T100 = procedure (p0 : Integer;
p1 : TBitmap;
p2 : TBitmap) of object;

_T101 = _T93;

_T102 = procedure (p0 : Integer;
p1 : TBitmap;
p2 : TColor) of object;

_T103 = _T31;

_T104 = function (p0 : Integer;
p1 : TOverlay): Boolean of object;

_T105 = procedure (p0 : TChangeLink) of object;

_T106 = _T90;

_T107 = function (p0 : THandle;
p1 : TResType;
p2 : string;
p3 : TColor): Boolean of object;

_T108 = _T100;

_T109 = _T93;

_T110 = _T102;

_T111 = function (p0 : Integer;
p1 : Integer;
p2 : Integer): Boolean of object;

_T112 = _T6;

_T113 = _T105;

_T114 = _T5;

_T115 = _T41;

_T116 = function (p0 : Boolean;
p1 : Integer;
p2 : Integer): TCursor of object;

_T117 = procedure (p0 : TObject;
p1 : Integer;
p2 : Integer;
p3 : Boolean) of object;

_T118 = function : THandle of object;

_T119 = function : string of object;

_T120 = _T6;

_T121 = _T6;

_T122 = _T6;

_T123 = procedure (const p0 : IDispatch;
const p1 : string) of object;

_T124 = procedure (const p0 : IDispatch;
const p1 : string;
p2 : Pointer) of object;

_T125 = function (p0 : Integer;
const p1 : string;
p2 : Pointer): IDispatch of object;

_T126 = function (const p0 : IDispatch): Boolean of object;

_T127 = _T6;

_T128 = procedure (p0 : TControl;
const p1 : IDispatch) of object;

_T129 = _T6;

_T130 = _T53;

_T131 = _T53;

_T132 = _T6;

_T133 = _T6;

_T134 = _T6;

_T135 = _T6;

_T136 = _T6;

_T137 = procedure (var p0 : Word;
p1 : TShiftState) of object;

_T138 = _T137;

_T139 = procedure (var p0 : Char) of object;

_T140 = procedure (p0 : HDC) of object;

_T141 = _T5;

_T142 = procedure (p0 : HWND) of object;

_T143 = _T1;

_T144 = procedure (var p0) of object;

_T145 = _T57;

_T146 = function (p0 : TControl): Boolean of object;

_T147 = _T3;

_T148 = _T6;

_T149 = _T6;

_T150 = _T57;

_T151 = procedure (p0 : TList) of object;

_T152 = _T57;

_T153 = _T6;

_T154 = _T5;

_T155 = _T16;

_T156 = _T5;

_T157 = _T6;

_T158 = _T31;

_T159 = _T31;

_T160 = _T6;

_T161 = _T6;

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
function __TCMActivate__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCMActivate__Wrapper.setMsg(const val : Cardinal);
begin
TCMActivate(GetRecordPtr^).Msg := val;
end;
function __TCMActivate__Wrapper.getMsg : Cardinal;
begin
result := TCMActivate(GetRecordPtr^).Msg;
end;
procedure __TCMActivate__Wrapper.setResult(const val : Longint);
begin
TCMActivate(GetRecordPtr^).Result := val;
end;
function __TCMActivate__Wrapper.getResult : Longint;
begin
result := TCMActivate(GetRecordPtr^).Result;
end;
function __TCMCancelMode__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCMCancelMode__Wrapper.setMsg(const val : Cardinal);
begin
TCMCancelMode(GetRecordPtr^).Msg := val;
end;
function __TCMCancelMode__Wrapper.getMsg : Cardinal;
begin
result := TCMCancelMode(GetRecordPtr^).Msg;
end;
procedure __TCMCancelMode__Wrapper.setUnused(const val : Integer);
begin
TCMCancelMode(GetRecordPtr^).Unused := val;
end;
function __TCMCancelMode__Wrapper.getUnused : Integer;
begin
result := TCMCancelMode(GetRecordPtr^).Unused;
end;
procedure __TCMCancelMode__Wrapper.setSender(const val : TControl);
begin
TCMCancelMode(GetRecordPtr^).Sender := val;
end;
function __TCMCancelMode__Wrapper.getSender : TControl;
begin
result := TCMCancelMode(GetRecordPtr^).Sender;
end;
procedure __TCMCancelMode__Wrapper.setResult(const val : Longint);
begin
TCMCancelMode(GetRecordPtr^).Result := val;
end;
function __TCMCancelMode__Wrapper.getResult : Longint;
begin
result := TCMCancelMode(GetRecordPtr^).Result;
end;
function __TCMChanged__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCMChanged__Wrapper.setMsg(const val : Cardinal);
begin
TCMChanged(GetRecordPtr^).Msg := val;
end;
function __TCMChanged__Wrapper.getMsg : Cardinal;
begin
result := TCMChanged(GetRecordPtr^).Msg;
end;
procedure __TCMChanged__Wrapper.setUnused(const val : Longint);
begin
TCMChanged(GetRecordPtr^).Unused := val;
end;
function __TCMChanged__Wrapper.getUnused : Longint;
begin
result := TCMChanged(GetRecordPtr^).Unused;
end;
procedure __TCMChanged__Wrapper.setChild(const val : TControl);
begin
TCMChanged(GetRecordPtr^).Child := val;
end;
function __TCMChanged__Wrapper.getChild : TControl;
begin
result := TCMChanged(GetRecordPtr^).Child;
end;
procedure __TCMChanged__Wrapper.setResult(const val : Longint);
begin
TCMChanged(GetRecordPtr^).Result := val;
end;
function __TCMChanged__Wrapper.getResult : Longint;
begin
result := TCMChanged(GetRecordPtr^).Result;
end;
function __TCMChildKey__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCMChildKey__Wrapper.setMsg(const val : Cardinal);
begin
TCMChildKey(GetRecordPtr^).Msg := val;
end;
function __TCMChildKey__Wrapper.getMsg : Cardinal;
begin
result := TCMChildKey(GetRecordPtr^).Msg;
end;
procedure __TCMChildKey__Wrapper.setCharCode(const val : Word);
begin
TCMChildKey(GetRecordPtr^).CharCode := val;
end;
function __TCMChildKey__Wrapper.getCharCode : Word;
begin
result := TCMChildKey(GetRecordPtr^).CharCode;
end;
procedure __TCMChildKey__Wrapper.setUnused(const val : Word);
begin
TCMChildKey(GetRecordPtr^).Unused := val;
end;
function __TCMChildKey__Wrapper.getUnused : Word;
begin
result := TCMChildKey(GetRecordPtr^).Unused;
end;
procedure __TCMChildKey__Wrapper.setSender(const val : TWinControl);
begin
TCMChildKey(GetRecordPtr^).Sender := val;
end;
function __TCMChildKey__Wrapper.getSender : TWinControl;
begin
result := TCMChildKey(GetRecordPtr^).Sender;
end;
procedure __TCMChildKey__Wrapper.setResult(const val : Longint);
begin
TCMChildKey(GetRecordPtr^).Result := val;
end;
function __TCMChildKey__Wrapper.getResult : Longint;
begin
result := TCMChildKey(GetRecordPtr^).Result;
end;
function __TCMControlChange__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCMControlChange__Wrapper.setMsg(const val : Cardinal);
begin
TCMControlChange(GetRecordPtr^).Msg := val;
end;
function __TCMControlChange__Wrapper.getMsg : Cardinal;
begin
result := TCMControlChange(GetRecordPtr^).Msg;
end;
procedure __TCMControlChange__Wrapper.setControl(const val : TControl);
begin
TCMControlChange(GetRecordPtr^).Control := val;
end;
function __TCMControlChange__Wrapper.getControl : TControl;
begin
result := TCMControlChange(GetRecordPtr^).Control;
end;
procedure __TCMControlChange__Wrapper.setInserting(const val : LongBool);
begin
TCMControlChange(GetRecordPtr^).Inserting := val;
end;
function __TCMControlChange__Wrapper.getInserting : LongBool;
begin
result := TCMControlChange(GetRecordPtr^).Inserting;
end;
procedure __TCMControlChange__Wrapper.setResult(const val : Longint);
begin
TCMControlChange(GetRecordPtr^).Result := val;
end;
function __TCMControlChange__Wrapper.getResult : Longint;
begin
result := TCMControlChange(GetRecordPtr^).Result;
end;
function __TCMControlListChange__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCMControlListChange__Wrapper.setMsg(const val : Cardinal);
begin
TCMControlListChange(GetRecordPtr^).Msg := val;
end;
function __TCMControlListChange__Wrapper.getMsg : Cardinal;
begin
result := TCMControlListChange(GetRecordPtr^).Msg;
end;
procedure __TCMControlListChange__Wrapper.setControl(const val : TControl);
begin
TCMControlListChange(GetRecordPtr^).Control := val;
end;
function __TCMControlListChange__Wrapper.getControl : TControl;
begin
result := TCMControlListChange(GetRecordPtr^).Control;
end;
procedure __TCMControlListChange__Wrapper.setInserting(const val : LongBool);
begin
TCMControlListChange(GetRecordPtr^).Inserting := val;
end;
function __TCMControlListChange__Wrapper.getInserting : LongBool;
begin
result := TCMControlListChange(GetRecordPtr^).Inserting;
end;
procedure __TCMControlListChange__Wrapper.setResult(const val : Longint);
begin
TCMControlListChange(GetRecordPtr^).Result := val;
end;
function __TCMControlListChange__Wrapper.getResult : Longint;
begin
result := TCMControlListChange(GetRecordPtr^).Result;
end;
function __TCMDeactivate__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCMDeactivate__Wrapper.setMsg(const val : Cardinal);
begin
TCMDeactivate(GetRecordPtr^).Msg := val;
end;
function __TCMDeactivate__Wrapper.getMsg : Cardinal;
begin
result := TCMDeactivate(GetRecordPtr^).Msg;
end;
procedure __TCMDeactivate__Wrapper.setResult(const val : Longint);
begin
TCMDeactivate(GetRecordPtr^).Result := val;
end;
function __TCMDeactivate__Wrapper.getResult : Longint;
begin
result := TCMDeactivate(GetRecordPtr^).Result;
end;
function __TCMDesignHitTest__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCMDesignHitTest__Wrapper.setMsg(const val : Cardinal);
begin
TCMDesignHitTest(GetRecordPtr^).Msg := val;
end;
function __TCMDesignHitTest__Wrapper.getMsg : Cardinal;
begin
result := TCMDesignHitTest(GetRecordPtr^).Msg;
end;
procedure __TCMDesignHitTest__Wrapper.setKeys(const val : Longint);
begin
TCMDesignHitTest(GetRecordPtr^).Keys := val;
end;
function __TCMDesignHitTest__Wrapper.getKeys : Longint;
begin
result := TCMDesignHitTest(GetRecordPtr^).Keys;
end;
procedure __TCMDesignHitTest__Wrapper.setXPos(const val : SmallInt);
begin
TCMDesignHitTest(GetRecordPtr^).XPos := val;
end;
function __TCMDesignHitTest__Wrapper.getXPos : SmallInt;
begin
result := TCMDesignHitTest(GetRecordPtr^).XPos;
end;
procedure __TCMDesignHitTest__Wrapper.setYPos(const val : SmallInt);
begin
TCMDesignHitTest(GetRecordPtr^).YPos := val;
end;
function __TCMDesignHitTest__Wrapper.getYPos : SmallInt;
begin
result := TCMDesignHitTest(GetRecordPtr^).YPos;
end;
procedure __TCMDesignHitTest__Wrapper.setResult(const val : Longint);
begin
TCMDesignHitTest(GetRecordPtr^).Result := val;
end;
function __TCMDesignHitTest__Wrapper.getResult : Longint;
begin
result := TCMDesignHitTest(GetRecordPtr^).Result;
end;
function __TCMDialogChar__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCMDialogChar__Wrapper.setMsg(const val : Cardinal);
begin
TCMDialogChar(GetRecordPtr^).Msg := val;
end;
function __TCMDialogChar__Wrapper.getMsg : Cardinal;
begin
result := TCMDialogChar(GetRecordPtr^).Msg;
end;
procedure __TCMDialogChar__Wrapper.setCharCode(const val : Word);
begin
TCMDialogChar(GetRecordPtr^).CharCode := val;
end;
function __TCMDialogChar__Wrapper.getCharCode : Word;
begin
result := TCMDialogChar(GetRecordPtr^).CharCode;
end;
procedure __TCMDialogChar__Wrapper.setUnused(const val : Word);
begin
TCMDialogChar(GetRecordPtr^).Unused := val;
end;
function __TCMDialogChar__Wrapper.getUnused : Word;
begin
result := TCMDialogChar(GetRecordPtr^).Unused;
end;
procedure __TCMDialogChar__Wrapper.setKeyData(const val : Longint);
begin
TCMDialogChar(GetRecordPtr^).KeyData := val;
end;
function __TCMDialogChar__Wrapper.getKeyData : Longint;
begin
result := TCMDialogChar(GetRecordPtr^).KeyData;
end;
procedure __TCMDialogChar__Wrapper.setResult(const val : Longint);
begin
TCMDialogChar(GetRecordPtr^).Result := val;
end;
function __TCMDialogChar__Wrapper.getResult : Longint;
begin
result := TCMDialogChar(GetRecordPtr^).Result;
end;
function __TCMDialogKey__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCMDialogKey__Wrapper.setMsg(const val : Cardinal);
begin
TCMDialogKey(GetRecordPtr^).Msg := val;
end;
function __TCMDialogKey__Wrapper.getMsg : Cardinal;
begin
result := TCMDialogKey(GetRecordPtr^).Msg;
end;
procedure __TCMDialogKey__Wrapper.setCharCode(const val : Word);
begin
TCMDialogKey(GetRecordPtr^).CharCode := val;
end;
function __TCMDialogKey__Wrapper.getCharCode : Word;
begin
result := TCMDialogKey(GetRecordPtr^).CharCode;
end;
procedure __TCMDialogKey__Wrapper.setUnused(const val : Word);
begin
TCMDialogKey(GetRecordPtr^).Unused := val;
end;
function __TCMDialogKey__Wrapper.getUnused : Word;
begin
result := TCMDialogKey(GetRecordPtr^).Unused;
end;
procedure __TCMDialogKey__Wrapper.setKeyData(const val : Longint);
begin
TCMDialogKey(GetRecordPtr^).KeyData := val;
end;
function __TCMDialogKey__Wrapper.getKeyData : Longint;
begin
result := TCMDialogKey(GetRecordPtr^).KeyData;
end;
procedure __TCMDialogKey__Wrapper.setResult(const val : Longint);
begin
TCMDialogKey(GetRecordPtr^).Result := val;
end;
function __TCMDialogKey__Wrapper.getResult : Longint;
begin
result := TCMDialogKey(GetRecordPtr^).Result;
end;
function __TCMDrag__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCMDrag__Wrapper.setMsg(const val : Cardinal);
begin
TCMDrag(GetRecordPtr^).Msg := val;
end;
function __TCMDrag__Wrapper.getMsg : Cardinal;
begin
result := TCMDrag(GetRecordPtr^).Msg;
end;
procedure __TCMDrag__Wrapper.setDragMessage(const val : TDragMessage);
begin
TCMDrag(GetRecordPtr^).DragMessage := val;
end;
function __TCMDrag__Wrapper.getDragMessage : TDragMessage;
begin
result := TCMDrag(GetRecordPtr^).DragMessage;
end;
procedure __TCMDrag__Wrapper.setReserved1(const val : Byte);
begin
TCMDrag(GetRecordPtr^).Reserved1 := val;
end;
function __TCMDrag__Wrapper.getReserved1 : Byte;
begin
result := TCMDrag(GetRecordPtr^).Reserved1;
end;
procedure __TCMDrag__Wrapper.setReserved2(const val : Word);
begin
TCMDrag(GetRecordPtr^).Reserved2 := val;
end;
function __TCMDrag__Wrapper.getReserved2 : Word;
begin
result := TCMDrag(GetRecordPtr^).Reserved2;
end;
procedure __TCMDrag__Wrapper.setResult(const val : Longint);
begin
TCMDrag(GetRecordPtr^).Result := val;
end;
function __TCMDrag__Wrapper.getResult : Longint;
begin
result := TCMDrag(GetRecordPtr^).Result;
end;
function __TCMEnter__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCMEnter__Wrapper.setMsg(const val : Cardinal);
begin
TCMEnter(GetRecordPtr^).Msg := val;
end;
function __TCMEnter__Wrapper.getMsg : Cardinal;
begin
result := TCMEnter(GetRecordPtr^).Msg;
end;
procedure __TCMEnter__Wrapper.setResult(const val : Longint);
begin
TCMEnter(GetRecordPtr^).Result := val;
end;
function __TCMEnter__Wrapper.getResult : Longint;
begin
result := TCMEnter(GetRecordPtr^).Result;
end;
function __TCMExit__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCMExit__Wrapper.setMsg(const val : Cardinal);
begin
TCMExit(GetRecordPtr^).Msg := val;
end;
function __TCMExit__Wrapper.getMsg : Cardinal;
begin
result := TCMExit(GetRecordPtr^).Msg;
end;
procedure __TCMExit__Wrapper.setResult(const val : Longint);
begin
TCMExit(GetRecordPtr^).Result := val;
end;
function __TCMExit__Wrapper.getResult : Longint;
begin
result := TCMExit(GetRecordPtr^).Result;
end;
function __TCMFocusChanged__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCMFocusChanged__Wrapper.setMsg(const val : Cardinal);
begin
TCMFocusChanged(GetRecordPtr^).Msg := val;
end;
function __TCMFocusChanged__Wrapper.getMsg : Cardinal;
begin
result := TCMFocusChanged(GetRecordPtr^).Msg;
end;
procedure __TCMFocusChanged__Wrapper.setUnused(const val : Integer);
begin
TCMFocusChanged(GetRecordPtr^).Unused := val;
end;
function __TCMFocusChanged__Wrapper.getUnused : Integer;
begin
result := TCMFocusChanged(GetRecordPtr^).Unused;
end;
procedure __TCMFocusChanged__Wrapper.setSender(const val : TWinControl);
begin
TCMFocusChanged(GetRecordPtr^).Sender := val;
end;
function __TCMFocusChanged__Wrapper.getSender : TWinControl;
begin
result := TCMFocusChanged(GetRecordPtr^).Sender;
end;
procedure __TCMFocusChanged__Wrapper.setResult(const val : Longint);
begin
TCMFocusChanged(GetRecordPtr^).Result := val;
end;
function __TCMFocusChanged__Wrapper.getResult : Longint;
begin
result := TCMFocusChanged(GetRecordPtr^).Result;
end;
function __TCMGotFocus__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCMGotFocus__Wrapper.setMsg(const val : Cardinal);
begin
TCMGotFocus(GetRecordPtr^).Msg := val;
end;
function __TCMGotFocus__Wrapper.getMsg : Cardinal;
begin
result := TCMGotFocus(GetRecordPtr^).Msg;
end;
procedure __TCMGotFocus__Wrapper.setResult(const val : Longint);
begin
TCMGotFocus(GetRecordPtr^).Result := val;
end;
function __TCMGotFocus__Wrapper.getResult : Longint;
begin
result := TCMGotFocus(GetRecordPtr^).Result;
end;
function __TCMHitTest__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCMHitTest__Wrapper.setMsg(const val : Cardinal);
begin
TCMHitTest(GetRecordPtr^).Msg := val;
end;
function __TCMHitTest__Wrapper.getMsg : Cardinal;
begin
result := TCMHitTest(GetRecordPtr^).Msg;
end;
procedure __TCMHitTest__Wrapper.setUnused(const val : Longint);
begin
TCMHitTest(GetRecordPtr^).Unused := val;
end;
function __TCMHitTest__Wrapper.getUnused : Longint;
begin
result := TCMHitTest(GetRecordPtr^).Unused;
end;
procedure __TCMHitTest__Wrapper.setXPos(const val : SmallInt);
begin
TCMHitTest(GetRecordPtr^).XPos := val;
end;
function __TCMHitTest__Wrapper.getXPos : SmallInt;
begin
result := TCMHitTest(GetRecordPtr^).XPos;
end;
procedure __TCMHitTest__Wrapper.setYPos(const val : SmallInt);
begin
TCMHitTest(GetRecordPtr^).YPos := val;
end;
function __TCMHitTest__Wrapper.getYPos : SmallInt;
begin
result := TCMHitTest(GetRecordPtr^).YPos;
end;
procedure __TCMHitTest__Wrapper.setResult(const val : Longint);
begin
TCMHitTest(GetRecordPtr^).Result := val;
end;
function __TCMHitTest__Wrapper.getResult : Longint;
begin
result := TCMHitTest(GetRecordPtr^).Result;
end;
function __TCMLostFocus__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCMLostFocus__Wrapper.setMsg(const val : Cardinal);
begin
TCMLostFocus(GetRecordPtr^).Msg := val;
end;
function __TCMLostFocus__Wrapper.getMsg : Cardinal;
begin
result := TCMLostFocus(GetRecordPtr^).Msg;
end;
procedure __TCMLostFocus__Wrapper.setResult(const val : Longint);
begin
TCMLostFocus(GetRecordPtr^).Result := val;
end;
function __TCMLostFocus__Wrapper.getResult : Longint;
begin
result := TCMLostFocus(GetRecordPtr^).Result;
end;
function __TCMWantSpecialKey__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCMWantSpecialKey__Wrapper.setMsg(const val : Cardinal);
begin
TCMWantSpecialKey(GetRecordPtr^).Msg := val;
end;
function __TCMWantSpecialKey__Wrapper.getMsg : Cardinal;
begin
result := TCMWantSpecialKey(GetRecordPtr^).Msg;
end;
procedure __TCMWantSpecialKey__Wrapper.setCharCode(const val : Word);
begin
TCMWantSpecialKey(GetRecordPtr^).CharCode := val;
end;
function __TCMWantSpecialKey__Wrapper.getCharCode : Word;
begin
result := TCMWantSpecialKey(GetRecordPtr^).CharCode;
end;
procedure __TCMWantSpecialKey__Wrapper.setUnused(const val : Word);
begin
TCMWantSpecialKey(GetRecordPtr^).Unused := val;
end;
function __TCMWantSpecialKey__Wrapper.getUnused : Word;
begin
result := TCMWantSpecialKey(GetRecordPtr^).Unused;
end;
procedure __TCMWantSpecialKey__Wrapper.setKeyData(const val : Longint);
begin
TCMWantSpecialKey(GetRecordPtr^).KeyData := val;
end;
function __TCMWantSpecialKey__Wrapper.getKeyData : Longint;
begin
result := TCMWantSpecialKey(GetRecordPtr^).KeyData;
end;
procedure __TCMWantSpecialKey__Wrapper.setResult(const val : Longint);
begin
TCMWantSpecialKey(GetRecordPtr^).Result := val;
end;
function __TCMWantSpecialKey__Wrapper.getResult : Longint;
begin
result := TCMWantSpecialKey(GetRecordPtr^).Result;
end;
function __TCreateParams__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCreateParams__Wrapper.setStyle(const val : Longint);
begin
TCreateParams(GetRecordPtr^).Style := val;
end;
function __TCreateParams__Wrapper.getStyle : Longint;
begin
result := TCreateParams(GetRecordPtr^).Style;
end;
procedure __TCreateParams__Wrapper.setExStyle(const val : Longint);
begin
TCreateParams(GetRecordPtr^).ExStyle := val;
end;
function __TCreateParams__Wrapper.getExStyle : Longint;
begin
result := TCreateParams(GetRecordPtr^).ExStyle;
end;
procedure __TCreateParams__Wrapper.setX(const val : Integer);
begin
TCreateParams(GetRecordPtr^).X := val;
end;
function __TCreateParams__Wrapper.getX : Integer;
begin
result := TCreateParams(GetRecordPtr^).X;
end;
procedure __TCreateParams__Wrapper.setY(const val : Integer);
begin
TCreateParams(GetRecordPtr^).Y := val;
end;
function __TCreateParams__Wrapper.getY : Integer;
begin
result := TCreateParams(GetRecordPtr^).Y;
end;
procedure __TCreateParams__Wrapper.setWidth(const val : Integer);
begin
TCreateParams(GetRecordPtr^).Width := val;
end;
function __TCreateParams__Wrapper.getWidth : Integer;
begin
result := TCreateParams(GetRecordPtr^).Width;
end;
procedure __TCreateParams__Wrapper.setHeight(const val : Integer);
begin
TCreateParams(GetRecordPtr^).Height := val;
end;
function __TCreateParams__Wrapper.getHeight : Integer;
begin
result := TCreateParams(GetRecordPtr^).Height;
end;
function __TDragRec__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TDragRec__Wrapper.setSource(const val : TDragObject);
begin
TDragRec(GetRecordPtr^).Source := val;
end;
function __TDragRec__Wrapper.getSource : TDragObject;
begin
result := TDragRec(GetRecordPtr^).Source;
end;
function _TCMActivate_ : IDispatch;
begin
  result := __TCMActivate__Wrapper.Create;
end;
function _TCMCancelMode_ : IDispatch;
begin
  result := __TCMCancelMode__Wrapper.Create;
end;
function _TCMChanged_ : IDispatch;
begin
  result := __TCMChanged__Wrapper.Create;
end;
function _TCMChildKey_ : IDispatch;
begin
  result := __TCMChildKey__Wrapper.Create;
end;
function _TCMControlChange_ : IDispatch;
begin
  result := __TCMControlChange__Wrapper.Create;
end;
function _TCMControlListChange_ : IDispatch;
begin
  result := __TCMControlListChange__Wrapper.Create;
end;
function _TCMDeactivate_ : IDispatch;
begin
  result := __TCMDeactivate__Wrapper.Create;
end;
function _TCMDesignHitTest_ : IDispatch;
begin
  result := __TCMDesignHitTest__Wrapper.Create;
end;
function _TCMDialogChar_ : IDispatch;
begin
  result := __TCMDialogChar__Wrapper.Create;
end;
function _TCMDialogKey_ : IDispatch;
begin
  result := __TCMDialogKey__Wrapper.Create;
end;
function _TCMDrag_ : IDispatch;
begin
  result := __TCMDrag__Wrapper.Create;
end;
function _TCMEnter_ : IDispatch;
begin
  result := __TCMEnter__Wrapper.Create;
end;
function _TCMExit_ : IDispatch;
begin
  result := __TCMExit__Wrapper.Create;
end;
function _TCMFocusChanged_ : IDispatch;
begin
  result := __TCMFocusChanged__Wrapper.Create;
end;
function _TCMGotFocus_ : IDispatch;
begin
  result := __TCMGotFocus__Wrapper.Create;
end;
function _TCMHitTest_ : IDispatch;
begin
  result := __TCMHitTest__Wrapper.Create;
end;
function _TCMLostFocus_ : IDispatch;
begin
  result := __TCMLostFocus__Wrapper.Create;
end;
function _TCMWantSpecialKey_ : IDispatch;
begin
  result := __TCMWantSpecialKey__Wrapper.Create;
end;
function _TCreateParams_ : IDispatch;
begin
  result := __TCreateParams__Wrapper.Create;
end;
function _TDragRec_ : IDispatch;
begin
  result := __TDragRec__Wrapper.Create;
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
function __TMsg__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TMsg__Wrapper.setmessage(const val : UINT);
begin
TMsg(GetRecordPtr^).message := val;
end;
function __TMsg__Wrapper.getmessage : UINT;
begin
result := TMsg(GetRecordPtr^).message;
end;
procedure __TMsg__Wrapper.setWPARAM(const val : WPARAM);
begin
TMsg(GetRecordPtr^).WPARAM := val;
end;
function __TMsg__Wrapper.getWPARAM : WPARAM;
begin
result := TMsg(GetRecordPtr^).WPARAM;
end;
procedure __TMsg__Wrapper.setLPARAM(const val : LPARAM);
begin
TMsg(GetRecordPtr^).LPARAM := val;
end;
function __TMsg__Wrapper.getLPARAM : LPARAM;
begin
result := TMsg(GetRecordPtr^).LPARAM;
end;
procedure __TMsg__Wrapper.settime(const val : DWORD);
begin
TMsg(GetRecordPtr^).time := val;
end;
function __TMsg__Wrapper.gettime : DWORD;
begin
result := TMsg(GetRecordPtr^).time;
end;
function ____FindVCLWindow__Wrapper(const p0 : IDispatch): TWinControl;
var
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := FindVCLWindow(__p0^);
end;

function ____FindDragTarget__Wrapper(const p0 : IDispatch;
p1 : Boolean): TControl;
var
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := FindDragTarget(__p0^,p1);
end;

function __TControl__GetClientOrigin__Wrapper(__Instance : TControl): IDispatch;
var
__result : TPoint;
__wrapper : __TPoint__Wrapper;
begin
__result := __TControl__(__Instance).GetClientOrigin;
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function __TControl__GetClientRect__Wrapper(__Instance : TControl): IDispatch;
var
__result : TRect;
__wrapper : __TRect__Wrapper;
begin
__result := __TControl__(__Instance).GetClientRect;
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

procedure __TControl__WndProc__Wrapper(__Instance : TControl;
const p0 : IDispatch);
var
__p0 : ^TMessage;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
__TControl__(__Instance).WndProc(__p0^);
end;

function __TControl__ClientToScreen__Wrapper(__Instance : TControl;
const p0 : IDispatch): IDispatch;
var
__result : TPoint;
__wrapper : __TPoint__Wrapper;
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
__result := TControl(__Instance).ClientToScreen(__p0^);
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function __TControl__ScreenToClient__Wrapper(__Instance : TControl;
const p0 : IDispatch): IDispatch;
var
__result : TPoint;
__wrapper : __TPoint__Wrapper;
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
__result := TControl(__Instance).ScreenToClient(__p0^);
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
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

procedure __THintWindow__ActivateHint__Wrapper(__Instance : THintWindow;
const p0 : IDispatch;
const p1 : string);
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
THintWindow(__Instance).ActivateHint(__p0^,p1);
end;

procedure __THintWindow__ActivateHintData__Wrapper(__Instance : THintWindow;
const p0 : IDispatch;
const p1 : string;
p2 : Pointer);
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
THintWindow(__Instance).ActivateHintData(__p0^,p1,p2);
end;

function __THintWindow__CalcHintRect__Wrapper(__Instance : THintWindow;
p0 : Integer;
const p1 : string;
p2 : Pointer): IDispatch;
var
__result : TRect;
__wrapper : __TRect__Wrapper;
begin
__result := THintWindow(__Instance).CalcHintRect(p0,p1,p2);
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function __THintWindow__IsHintMsg__Wrapper(__Instance : THintWindow;
const p0 : IDispatch): Boolean;
var
__p0 : ^TMsg;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := THintWindow(__Instance).IsHintMsg(__p0^);
end;

procedure __TWinControl__AlignControls__Wrapper(__Instance : TWinControl;
p0 : TControl;
const p1 : IDispatch);
var
__p1 : ^TRect;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
__TWinControl__(__Instance).AlignControls(p0,__p1^);
end;

procedure __TWinControl__CreateParams__Wrapper(__Instance : TWinControl;
const p0 : IDispatch);
var
__p0 : ^TCreateParams;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
__TWinControl__(__Instance).CreateParams(__p0^);
end;

procedure __TWinControl__CreateWindowHandle__Wrapper(__Instance : TWinControl;
const p0 : IDispatch);
var
__p0 : ^TCreateParams;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
__TWinControl__(__Instance).CreateWindowHandle(__p0^);
end;

function __TWinControl__ControlAtPos__Wrapper(__Instance : TWinControl;
const p0 : IDispatch;
p1 : Boolean): TControl;
var
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := TWinControl(__Instance).ControlAtPos(__p0^,p1);
end;


type __TCMActivate__Wrapper__ = class(__TCMActivate__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCMActivate__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCMActivateToVariant(var R : TCMActivate) : OleVariant;
var
__rw : __TCMActivate__Wrapper__;
begin
__rw := __TCMActivate__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCMActivate(const V : OleVariant) : TCMActivate;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCMActivate((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCMCancelMode__Wrapper__ = class(__TCMCancelMode__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCMCancelMode__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCMCancelModeToVariant(var R : TCMCancelMode) : OleVariant;
var
__rw : __TCMCancelMode__Wrapper__;
begin
__rw := __TCMCancelMode__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCMCancelMode(const V : OleVariant) : TCMCancelMode;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCMCancelMode((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCMChanged__Wrapper__ = class(__TCMChanged__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCMChanged__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCMChangedToVariant(var R : TCMChanged) : OleVariant;
var
__rw : __TCMChanged__Wrapper__;
begin
__rw := __TCMChanged__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCMChanged(const V : OleVariant) : TCMChanged;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCMChanged((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCMChildKey__Wrapper__ = class(__TCMChildKey__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCMChildKey__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCMChildKeyToVariant(var R : TCMChildKey) : OleVariant;
var
__rw : __TCMChildKey__Wrapper__;
begin
__rw := __TCMChildKey__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCMChildKey(const V : OleVariant) : TCMChildKey;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCMChildKey((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCMControlChange__Wrapper__ = class(__TCMControlChange__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCMControlChange__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCMControlChangeToVariant(var R : TCMControlChange) : OleVariant;
var
__rw : __TCMControlChange__Wrapper__;
begin
__rw := __TCMControlChange__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCMControlChange(const V : OleVariant) : TCMControlChange;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCMControlChange((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCMControlListChange__Wrapper__ = class(__TCMControlListChange__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCMControlListChange__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCMControlListChangeToVariant(var R : TCMControlListChange) : OleVariant;
var
__rw : __TCMControlListChange__Wrapper__;
begin
__rw := __TCMControlListChange__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCMControlListChange(const V : OleVariant) : TCMControlListChange;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCMControlListChange((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCMDeactivate__Wrapper__ = class(__TCMDeactivate__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCMDeactivate__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCMDeactivateToVariant(var R : TCMDeactivate) : OleVariant;
var
__rw : __TCMDeactivate__Wrapper__;
begin
__rw := __TCMDeactivate__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCMDeactivate(const V : OleVariant) : TCMDeactivate;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCMDeactivate((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCMDesignHitTest__Wrapper__ = class(__TCMDesignHitTest__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCMDesignHitTest__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCMDesignHitTestToVariant(var R : TCMDesignHitTest) : OleVariant;
var
__rw : __TCMDesignHitTest__Wrapper__;
begin
__rw := __TCMDesignHitTest__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCMDesignHitTest(const V : OleVariant) : TCMDesignHitTest;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCMDesignHitTest((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCMDialogChar__Wrapper__ = class(__TCMDialogChar__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCMDialogChar__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCMDialogCharToVariant(var R : TCMDialogChar) : OleVariant;
var
__rw : __TCMDialogChar__Wrapper__;
begin
__rw := __TCMDialogChar__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCMDialogChar(const V : OleVariant) : TCMDialogChar;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCMDialogChar((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCMDialogKey__Wrapper__ = class(__TCMDialogKey__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCMDialogKey__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCMDialogKeyToVariant(var R : TCMDialogKey) : OleVariant;
var
__rw : __TCMDialogKey__Wrapper__;
begin
__rw := __TCMDialogKey__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCMDialogKey(const V : OleVariant) : TCMDialogKey;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCMDialogKey((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCMDrag__Wrapper__ = class(__TCMDrag__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCMDrag__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCMDragToVariant(var R : TCMDrag) : OleVariant;
var
__rw : __TCMDrag__Wrapper__;
begin
__rw := __TCMDrag__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCMDrag(const V : OleVariant) : TCMDrag;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCMDrag((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCMEnter__Wrapper__ = class(__TCMEnter__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCMEnter__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCMEnterToVariant(var R : TCMEnter) : OleVariant;
var
__rw : __TCMEnter__Wrapper__;
begin
__rw := __TCMEnter__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCMEnter(const V : OleVariant) : TCMEnter;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCMEnter((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCMExit__Wrapper__ = class(__TCMExit__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCMExit__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCMExitToVariant(var R : TCMExit) : OleVariant;
var
__rw : __TCMExit__Wrapper__;
begin
__rw := __TCMExit__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCMExit(const V : OleVariant) : TCMExit;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCMExit((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCMFocusChanged__Wrapper__ = class(__TCMFocusChanged__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCMFocusChanged__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCMFocusChangedToVariant(var R : TCMFocusChanged) : OleVariant;
var
__rw : __TCMFocusChanged__Wrapper__;
begin
__rw := __TCMFocusChanged__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCMFocusChanged(const V : OleVariant) : TCMFocusChanged;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCMFocusChanged((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCMGotFocus__Wrapper__ = class(__TCMGotFocus__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCMGotFocus__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCMGotFocusToVariant(var R : TCMGotFocus) : OleVariant;
var
__rw : __TCMGotFocus__Wrapper__;
begin
__rw := __TCMGotFocus__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCMGotFocus(const V : OleVariant) : TCMGotFocus;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCMGotFocus((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCMHitTest__Wrapper__ = class(__TCMHitTest__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCMHitTest__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCMHitTestToVariant(var R : TCMHitTest) : OleVariant;
var
__rw : __TCMHitTest__Wrapper__;
begin
__rw := __TCMHitTest__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCMHitTest(const V : OleVariant) : TCMHitTest;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCMHitTest((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCMLostFocus__Wrapper__ = class(__TCMLostFocus__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCMLostFocus__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCMLostFocusToVariant(var R : TCMLostFocus) : OleVariant;
var
__rw : __TCMLostFocus__Wrapper__;
begin
__rw := __TCMLostFocus__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCMLostFocus(const V : OleVariant) : TCMLostFocus;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCMLostFocus((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCMWantSpecialKey__Wrapper__ = class(__TCMWantSpecialKey__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCMWantSpecialKey__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCMWantSpecialKeyToVariant(var R : TCMWantSpecialKey) : OleVariant;
var
__rw : __TCMWantSpecialKey__Wrapper__;
begin
__rw := __TCMWantSpecialKey__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCMWantSpecialKey(const V : OleVariant) : TCMWantSpecialKey;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCMWantSpecialKey((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCreateParams__Wrapper__ = class(__TCreateParams__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCreateParams__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCreateParamsToVariant(var R : TCreateParams) : OleVariant;
var
__rw : __TCreateParams__Wrapper__;
begin
__rw := __TCreateParams__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCreateParams(const V : OleVariant) : TCreateParams;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCreateParams((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TDragRec__Wrapper__ = class(__TDragRec__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TDragRec__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTDragRecToVariant(var R : TDragRec) : OleVariant;
var
__rw : __TDragRec__Wrapper__;
begin
__rw := __TDragRec__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTDragRec(const V : OleVariant) : TDragRec;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TDragRec((_idisp as IDCRecordWrapper).GetRecordPtr^);
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

type __TMsg__Wrapper__ = class(__TMsg__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TMsg__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTMsgToVariant(var R : TMsg) : OleVariant;
var
__rw : __TMsg__Wrapper__;
begin
__rw := __TMsg__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTMsg(const V : OleVariant) : TMsg;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TMsg((_idisp as IDCRecordWrapper).GetRecordPtr^);
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
function __DC__GetTChangeLink__Sender(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TChangeLink(Instance).Sender);
end;

procedure __DC__SetTChangeLink__Sender(Instance : TObject; Params : PVariantArgList);
begin
TChangeLink(Instance).Sender:=TCustomImageList(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTControl__Align(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TControl(Instance).Align;
end;

procedure __DC__SetTControl__Align(Instance : TObject; Params : PVariantArgList);
begin
TControl(Instance).Align:=OleVariant(Params^[0]);
end;

function __DC__GetTControl__BoundsRect(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TRect__Wrapper;
begin
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := TControl(Instance).BoundsRect;
result := IUnknown(__wrapper) as IDispatch;
end;

procedure __DC__SetTControl__BoundsRect(Instance : TObject; Params : PVariantArgList);
var
__idisp:IDispatch;
__iwrapper:IDCRecordWrapper;
begin
__idisp:=DCVarToInterface(OleVariant(Params^[0]));
if __idisp=nil then exit;
__idisp.QueryInterface(IDCRecordWrapper, __iwrapper);
TControl(Instance).BoundsRect:=TRect(__iwrapper.GetRecordPtr^);
end;

function __DC__GetTControl__ClientHeight(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TControl(Instance).ClientHeight;
end;

procedure __DC__SetTControl__ClientHeight(Instance : TObject; Params : PVariantArgList);
begin
TControl(Instance).ClientHeight:=OleVariant(Params^[0]);
end;

function __DC__GetTControl__ClientOrigin(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TPoint__Wrapper;
begin
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := TControl(Instance).ClientOrigin;
result := IUnknown(__wrapper) as IDispatch;
end;

function __DC__GetTControl__ClientRect(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TRect__Wrapper;
begin
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := TControl(Instance).ClientRect;
result := IUnknown(__wrapper) as IDispatch;
end;

function __DC__GetTControl__ClientWidth(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TControl(Instance).ClientWidth;
end;

procedure __DC__SetTControl__ClientWidth(Instance : TObject; Params : PVariantArgList);
begin
TControl(Instance).ClientWidth:=OleVariant(Params^[0]);
end;

function __DC__GetTControl__ControlState(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TControlState;
begin
tmp := TControl(Instance).ControlState;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTControl__ControlState(Instance : TObject; Params : PVariantArgList);
var
  tmp : TControlState;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TControl(Instance).ControlState:=tmp;
end;

function __DC__GetTControl__ControlStyle(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TControlStyle;
begin
tmp := TControl(Instance).ControlStyle;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTControl__ControlStyle(Instance : TObject; Params : PVariantArgList);
var
  tmp : TControlStyle;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TControl(Instance).ControlStyle:=tmp;
end;

function __DC__GetTControl__Parent(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TControl(Instance).Parent);
end;

procedure __DC__SetTControl__Parent(Instance : TObject; Params : PVariantArgList);
begin
TControl(Instance).Parent:=TWinControl(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTControl__ShowHint(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TControl(Instance).ShowHint;
end;

procedure __DC__SetTControl__ShowHint(Instance : TObject; Params : PVariantArgList);
begin
TControl(Instance).ShowHint:=OleVariant(Params^[0]);
end;

function __DC__GetTControl__Visible(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TControl(Instance).Visible;
end;

procedure __DC__SetTControl__Visible(Instance : TObject; Params : PVariantArgList);
begin
TControl(Instance).Visible:=OleVariant(Params^[0]);
end;

function __DC__GetTControl__Enabled(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TControl(Instance).Enabled;
end;

procedure __DC__SetTControl__Enabled(Instance : TObject; Params : PVariantArgList);
begin
TControl(Instance).Enabled:=OleVariant(Params^[0]);
end;

function __DC__GetTControlCanvas__Control(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TControlCanvas(Instance).Control);
end;

procedure __DC__SetTControlCanvas__Control(Instance : TObject; Params : PVariantArgList);
begin
TControlCanvas(Instance).Control:=TControl(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomImageList__Count(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomImageList(Instance).Count;
end;

function __DC__GetTCustomImageList__DragCursor(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomImageList(Instance).DragCursor;
end;

procedure __DC__SetTCustomImageList__DragCursor(Instance : TObject; Params : PVariantArgList);
begin
TCustomImageList(Instance).DragCursor:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomImageList__Dragging(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomImageList(Instance).Dragging;
end;

function __DC__GetTCustomImageList__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomImageList(Instance).Handle;
end;

procedure __DC__SetTCustomImageList__Handle(Instance : TObject; Params : PVariantArgList);
begin
TCustomImageList(Instance).Handle:=OleVariant(Params^[0]);
end;

function __DC__GetTDragControlObject__Control(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDragControlObject(Instance).Control);
end;

function __DC__GetTHintWindow__Caption(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := THintWindow(Instance).Caption;
end;

procedure __DC__SetTHintWindow__Caption(Instance : TObject; Params : PVariantArgList);
begin
THintWindow(Instance).Caption:=OleVariant(Params^[0]);
end;

function __DC__GetTHintWindow__Color(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := THintWindow(Instance).Color;
end;

procedure __DC__SetTHintWindow__Color(Instance : TObject; Params : PVariantArgList);
begin
THintWindow(Instance).Color:=OleVariant(Params^[0]);
end;

function __DC__GetTHintWindow__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(THintWindow(Instance).Canvas);
end;

function __DC__GetTWinControl__Brush(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TWinControl(Instance).Brush);
end;

function __DC__GetTWinControl__Controls(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TWinControl(Instance).Controls[OleVariant(Params^[0])]);
end;

function __DC__GetTWinControl__ControlCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWinControl(Instance).ControlCount;
end;

function __DC__GetTWinControl__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWinControl(Instance).Handle;
end;

function __DC__GetTWinControl__ParentWindow(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWinControl(Instance).ParentWindow;
end;

procedure __DC__SetTWinControl__ParentWindow(Instance : TObject; Params : PVariantArgList);
begin
TWinControl(Instance).ParentWindow:=OleVariant(Params^[0]);
end;

function __DC__GetTWinControl__Showing(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWinControl(Instance).Showing;
end;

function __DC__GetTWinControl__TabOrder(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWinControl(Instance).TabOrder;
end;

procedure __DC__SetTWinControl__TabOrder(Instance : TObject; Params : PVariantArgList);
begin
TWinControl(Instance).TabOrder:=OleVariant(Params^[0]);
end;

function __DC__GetTWinControl__TabStop(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TWinControl(Instance).TabStop;
end;

procedure __DC__SetTWinControl__TabStop(Instance : TObject; Params : PVariantArgList);
begin
TWinControl(Instance).TabStop:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
RegisterProperty(TChangeLink,'Sender',__DC__GetTChangeLink__Sender,__DC__SetTChangeLink__Sender);
RegisterProperty(TControl,'Align',__DC__GetTControl__Align,__DC__SetTControl__Align);
RegisterProperty(TControl,'BoundsRect',__DC__GetTControl__BoundsRect,__DC__SetTControl__BoundsRect);
RegisterProperty(TControl,'ClientHeight',__DC__GetTControl__ClientHeight,__DC__SetTControl__ClientHeight);
RegisterProperty(TControl,'ClientOrigin',__DC__GetTControl__ClientOrigin,nil);
RegisterProperty(TControl,'ClientRect',__DC__GetTControl__ClientRect,nil);
RegisterProperty(TControl,'ClientWidth',__DC__GetTControl__ClientWidth,__DC__SetTControl__ClientWidth);
RegisterProperty(TControl,'ControlState',__DC__GetTControl__ControlState,__DC__SetTControl__ControlState);
RegisterProperty(TControl,'ControlStyle',__DC__GetTControl__ControlStyle,__DC__SetTControl__ControlStyle);
RegisterProperty(TControl,'Parent',__DC__GetTControl__Parent,__DC__SetTControl__Parent);
RegisterProperty(TControl,'ShowHint',__DC__GetTControl__ShowHint,__DC__SetTControl__ShowHint);
RegisterProperty(TControl,'Visible',__DC__GetTControl__Visible,__DC__SetTControl__Visible);
RegisterProperty(TControl,'Enabled',__DC__GetTControl__Enabled,__DC__SetTControl__Enabled);
RegisterProperty(TControlCanvas,'Control',__DC__GetTControlCanvas__Control,__DC__SetTControlCanvas__Control);
RegisterProperty(TCustomImageList,'Count',__DC__GetTCustomImageList__Count,nil);
RegisterProperty(TCustomImageList,'DragCursor',__DC__GetTCustomImageList__DragCursor,__DC__SetTCustomImageList__DragCursor);
RegisterProperty(TCustomImageList,'Dragging',__DC__GetTCustomImageList__Dragging,nil);
RegisterProperty(TCustomImageList,'Handle',__DC__GetTCustomImageList__Handle,__DC__SetTCustomImageList__Handle);
RegisterProperty(TDragControlObject,'Control',__DC__GetTDragControlObject__Control,nil);
RegisterProperty(THintWindow,'Caption',__DC__GetTHintWindow__Caption,__DC__SetTHintWindow__Caption);
RegisterProperty(THintWindow,'Color',__DC__GetTHintWindow__Color,__DC__SetTHintWindow__Color);
RegisterProperty(THintWindow,'Canvas',__DC__GetTHintWindow__Canvas,nil);
RegisterProperty(TWinControl,'Brush',__DC__GetTWinControl__Brush,nil);
RegisterIndexedProperty(TWinControl,'Controls',1,False,__DC__GetTWinControl__Controls,nil);
RegisterProperty(TWinControl,'ControlCount',__DC__GetTWinControl__ControlCount,nil);
RegisterProperty(TWinControl,'Handle',__DC__GetTWinControl__Handle,nil);
RegisterProperty(TWinControl,'ParentWindow',__DC__GetTWinControl__ParentWindow,__DC__SetTWinControl__ParentWindow);
RegisterProperty(TWinControl,'Showing',__DC__GetTWinControl__Showing,nil);
RegisterProperty(TWinControl,'TabOrder',__DC__GetTWinControl__TabOrder,__DC__SetTWinControl__TabOrder);
RegisterProperty(TWinControl,'TabStop',__DC__GetTWinControl__TabStop,__DC__SetTWinControl__TabStop);
end;

function __DC__GetControls__CreationControl(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(Controls.CreationControl);
end;

procedure __DC__SetControls__CreationControl(Instance : TObject; Params : PVariantArgList);
begin
TObject(Controls.CreationControl):=(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetControls__NewStyleControls(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := Controls.NewStyleControls;
end;

procedure __DC__SetControls__NewStyleControls(Instance : TObject; Params : PVariantArgList);
begin
Controls.NewStyleControls:=OleVariant(Params^[0]);
end;

var __RegisteredVars : TList;
procedure __RegisterVars;
begin
__RegisteredVars := TList.Create;
__RegisteredVars.Add(RegisterVar('CreationControl',__DC__GetControls__CreationControl,__DC__SetControls__CreationControl));
__RegisteredVars.Add(RegisterVar('NewStyleControls',__DC__GetControls__NewStyleControls,__DC__SetControls__NewStyleControls));
end;

procedure __UnregisterVars;
begin
__RegisteredVars.Free;
end;

const __ConstNames0 : array[0..190] of string = (
'CM_BASE'
,'CM_ACTIVATE'
,'CM_DEACTIVATE'
,'CM_GOTFOCUS'
,'CM_LOSTFOCUS'
,'CM_CANCELMODE'
,'CM_DIALOGKEY'
,'CM_DIALOGCHAR'
,'CM_FOCUSCHANGED'
,'CM_PARENTFONTCHANGED'
,'CM_PARENTCOLORCHANGED'
,'CM_HITTEST'
,'CM_VISIBLECHANGED'
,'CM_ENABLEDCHANGED'
,'CM_COLORCHANGED'
,'CM_FONTCHANGED'
,'CM_CURSORCHANGED'
,'CM_CTL3DCHANGED'
,'CM_PARENTCTL3DCHANGED'
,'CM_TEXTCHANGED'
,'CM_MOUSEENTER'
,'CM_MOUSELEAVE'
,'CM_MENUCHANGED'
,'CM_APPKEYDOWN'
,'CM_APPSYSCOMMAND'
,'CM_BUTTONPRESSED'
,'CM_SHOWINGCHANGED'
,'CM_ENTER'
,'CM_EXIT'
,'CM_DESIGNHITTEST'
,'CM_ICONCHANGED'
,'CM_WANTSPECIALKEY'
,'CM_INVOKEHELP'
,'CM_WINDOWHOOK'
,'CM_RELEASE'
,'CM_SHOWHINTCHANGED'
,'CM_PARENTSHOWHINTCHANGED'
,'CM_SYSCOLORCHANGE'
,'CM_WININICHANGE'
,'CM_FONTCHANGE'
,'CM_TIMECHANGE'
,'CM_TABSTOPCHANGED'
,'CM_UIACTIVATE'
,'CM_UIDEACTIVATE'
,'CM_DOCWINDOWACTIVATE'
,'CM_CONTROLLISTCHANGE'
,'CM_GETDATALINK'
,'CM_CHILDKEY'
,'CM_DRAG'
,'CM_HINTSHOW'
,'CM_DIALOGHANDLE'
,'CM_ISTOOLCONTROL'
,'CM_RECREATEWND'
,'CM_INVALIDATE'
,'CM_SYSFONTCHANGED'
,'CM_CONTROLCHANGE'
,'CM_CHANGED'
,'CN_BASE'
,'CN_CHARTOITEM'
,'CN_COMMAND'
,'CN_COMPAREITEM'
,'CN_CTLCOLORBTN'
,'CN_CTLCOLORDLG'
,'CN_CTLCOLOREDIT'
,'CN_CTLCOLORLISTBOX'
,'CN_CTLCOLORMSGBOX'
,'CN_CTLCOLORSCROLLBAR'
,'CN_CTLCOLORSTATIC'
,'CN_DELETEITEM'
,'CN_DRAWITEM'
,'CN_HSCROLL'
,'CN_MEASUREITEM'
,'CN_PARENTNOTIFY'
,'CN_VKEYTOITEM'
,'CN_VSCROLL'
,'CN_KEYDOWN'
,'CN_KEYUP'
,'CN_CHAR'
,'CN_SYSKEYDOWN'
,'CN_SYSCHAR'
,'CN_NOTIFY'
,'mrNone'
,'mrOk'
,'mrCancel'
,'mrAbort'
,'mrRetry'
,'mrIgnore'
,'mrYes'
,'mrNo'
,'mrAll'
,'mrNoToAll'
,'mrYesToAll'
,'crDefault'
,'crNone'
,'crArrow'
,'crCross'
,'crIBeam'
,'crSize'
,'crSizeNESW'
,'crSizeNS'
,'crSizeNWSE'
,'crSizeWE'
,'crUpArrow'
,'crHourGlass'
,'crDrag'
,'crNoDrop'
,'crHSplit'
,'crVSplit'
,'crMultiDrag'
,'crSQLWait'
,'crNo'
,'crAppStart'
,'crHelp'
,'crHandPoint'
,'crSizeAll'
,'dmDragEnter'
,'dmDragLeave'
,'dmDragMove'
,'dmDragDrop'
,'dmDragCancel'
,'dmFindTarget'
,'alNone'
,'alTop'
,'alBottom'
,'alLeft'
,'alRight'
,'alClient'
,'csLButtonDown'
,'csClicked'
,'csPalette'
,'csReadingState'
,'csAlignmentNeeded'
,'csFocusing'
,'csCreating'
,'csPaintCopy'
,'csAcceptsControls'
,'csCaptureMouse'
,'csDesignInteractive'
,'csClickEvents'
,'csFramed'
,'csSetCaption'
,'csOpaque'
,'csDoubleClicks'
,'csFixedWidth'
,'csFixedHeight'
,'csNoDesignVisible'
,'csReplicatable'
,'csNoStdEvents'
,'csDisplayDragImage'
,'csReflector'
,'mbLeft'
,'mbRight'
,'mbMiddle'
,'dmManual'
,'dmAutomatic'
,'dsDragEnter'
,'dsDragLeave'
,'dsDragMove'
,'sfLeft'
,'sfTop'
,'sfWidth'
,'sfHeight'
,'sfFont'
,'imDisable'
,'imClose'
,'imOpen'
,'imDontCare'
,'imSAlpha'
,'imAlpha'
,'imHira'
,'imSKata'
,'imKata'
,'imChinese'
,'imSHanguel'
,'imHanguel'
,'dsFocus'
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
,'CTL3D_ALL'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,CM_BASE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,CM_ACTIVATE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,CM_DEACTIVATE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,CM_GOTFOCUS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,CM_LOSTFOCUS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,CM_CANCELMODE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,CM_DIALOGKEY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,CM_DIALOGCHAR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,CM_FOCUSCHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,CM_PARENTFONTCHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,CM_PARENTCOLORCHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,CM_HITTEST));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,CM_VISIBLECHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,CM_ENABLEDCHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,CM_COLORCHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,CM_FONTCHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,CM_CURSORCHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,CM_CTL3DCHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,CM_PARENTCTL3DCHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,CM_TEXTCHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,CM_MOUSEENTER));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,CM_MOUSELEAVE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,CM_MENUCHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,CM_APPKEYDOWN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,CM_APPSYSCOMMAND));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,CM_BUTTONPRESSED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,CM_SHOWINGCHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,CM_ENTER));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,CM_EXIT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,CM_DESIGNHITTEST));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,CM_ICONCHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,CM_WANTSPECIALKEY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,CM_INVOKEHELP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,CM_WINDOWHOOK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,CM_RELEASE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,CM_SHOWHINTCHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,CM_PARENTSHOWHINTCHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,CM_SYSCOLORCHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,CM_WININICHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,CM_FONTCHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,CM_TIMECHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,CM_TABSTOPCHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,CM_UIACTIVATE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,CM_UIDEACTIVATE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,CM_DOCWINDOWACTIVATE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,CM_CONTROLLISTCHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,CM_GETDATALINK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,CM_CHILDKEY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[48] ,CM_DRAG));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[49] ,CM_HINTSHOW));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[50] ,CM_DIALOGHANDLE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[51] ,CM_ISTOOLCONTROL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[52] ,CM_RECREATEWND));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[53] ,CM_INVALIDATE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[54] ,CM_SYSFONTCHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[55] ,CM_CONTROLCHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[56] ,CM_CHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[57] ,CN_BASE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[58] ,CN_CHARTOITEM));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[59] ,CN_COMMAND));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[60] ,CN_COMPAREITEM));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[61] ,CN_CTLCOLORBTN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[62] ,CN_CTLCOLORDLG));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[63] ,CN_CTLCOLOREDIT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[64] ,CN_CTLCOLORLISTBOX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[65] ,CN_CTLCOLORMSGBOX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[66] ,CN_CTLCOLORSCROLLBAR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[67] ,CN_CTLCOLORSTATIC));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[68] ,CN_DELETEITEM));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[69] ,CN_DRAWITEM));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[70] ,CN_HSCROLL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[71] ,CN_MEASUREITEM));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[72] ,CN_PARENTNOTIFY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[73] ,CN_VKEYTOITEM));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[74] ,CN_VSCROLL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[75] ,CN_KEYDOWN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[76] ,CN_KEYUP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[77] ,CN_CHAR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[78] ,CN_SYSKEYDOWN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[79] ,CN_SYSCHAR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[80] ,CN_NOTIFY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[81] ,mrNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[82] ,mrOk));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[83] ,mrCancel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[84] ,mrAbort));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[85] ,mrRetry));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[86] ,mrIgnore));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[87] ,mrYes));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[88] ,mrNo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[89] ,mrAll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[90] ,mrNoToAll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[91] ,mrYesToAll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[92] ,crDefault));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[93] ,crNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[94] ,crArrow));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[95] ,crCross));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[96] ,crIBeam));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[97] ,crSize));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[98] ,crSizeNESW));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[99] ,crSizeNS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[100] ,crSizeNWSE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[101] ,crSizeWE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[102] ,crUpArrow));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[103] ,crHourGlass));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[104] ,crDrag));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[105] ,crNoDrop));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[106] ,crHSplit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[107] ,crVSplit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[108] ,crMultiDrag));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[109] ,crSQLWait));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[110] ,crNo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[111] ,crAppStart));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[112] ,crHelp));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[113] ,crHandPoint));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[114] ,crSizeAll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[115] ,dmDragEnter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[116] ,dmDragLeave));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[117] ,dmDragMove));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[118] ,dmDragDrop));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[119] ,dmDragCancel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[120] ,dmFindTarget));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[121] ,alNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[122] ,alTop));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[123] ,alBottom));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[124] ,alLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[125] ,alRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[126] ,alClient));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[127] ,csLButtonDown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[128] ,csClicked));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[129] ,csPalette));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[130] ,csReadingState));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[131] ,csAlignmentNeeded));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[132] ,csFocusing));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[133] ,csCreating));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[134] ,csPaintCopy));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[135] ,csAcceptsControls));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[136] ,csCaptureMouse));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[137] ,csDesignInteractive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[138] ,csClickEvents));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[139] ,csFramed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[140] ,csSetCaption));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[141] ,csOpaque));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[142] ,csDoubleClicks));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[143] ,csFixedWidth));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[144] ,csFixedHeight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[145] ,csNoDesignVisible));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[146] ,csReplicatable));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[147] ,csNoStdEvents));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[148] ,csDisplayDragImage));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[149] ,csReflector));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[150] ,mbLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[151] ,mbRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[152] ,mbMiddle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[153] ,dmManual));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[154] ,dmAutomatic));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[155] ,dsDragEnter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[156] ,dsDragLeave));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[157] ,dsDragMove));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[158] ,sfLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[159] ,sfTop));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[160] ,sfWidth));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[161] ,sfHeight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[162] ,sfFont));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[163] ,imDisable));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[164] ,imClose));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[165] ,imOpen));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[166] ,imDontCare));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[167] ,imSAlpha));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[168] ,imAlpha));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[169] ,imHira));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[170] ,imSKata));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[171] ,imKata));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[172] ,imChinese));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[173] ,imSHanguel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[174] ,imHanguel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[175] ,dsFocus));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[176] ,dsSelected));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[177] ,dsNormal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[178] ,dsTransparent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[179] ,itImage));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[180] ,itMask));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[181] ,rtBitmap));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[182] ,rtCursor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[183] ,rtIcon));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[184] ,lrDefaultColor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[185] ,lrDefaultSize));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[186] ,lrFromFile));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[187] ,lrMap3DColors));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[188] ,lrTransparent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[189] ,lrMonoChrome));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[190] ,CTL3D_ALL));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..10] of TClass = (
TChangeLink,
TControl,
TControlCanvas,
TCustomControl,
TCustomImageList,
TDragControlObject,
TDragObject,
TGraphicControl,
THintWindow,
TImageList,
TWinControl
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..46] of string = (
'TCMActivate'
,'TCMCancelMode'
,'TCMChanged'
,'TCMChildKey'
,'TCMControlChange'
,'TCMControlListChange'
,'TCMDeactivate'
,'TCMDesignHitTest'
,'TCMDialogChar'
,'TCMDialogKey'
,'TCMDrag'
,'TCMEnter'
,'TCMExit'
,'TCMFocusChanged'
,'TCMGotFocus'
,'TCMHitTest'
,'TCMLostFocus'
,'TCMWantSpecialKey'
,'TCreateParams'
,'TDragRec'
,'IsDragObject'
,'FindControl'
,'FindVCLWindow'
,'FindDragTarget'
,'GetCaptureControl'
,'SetCaptureControl'
,'CancelDrag'
,'CursorToString'
,'StringToCursor'
,'CursorToIdent'
,'IdentToCursor'
,'GetShortHint'
,'GetLongHint'
,'InitWndProc'
,'SendAppMessage'
,'MoveWindowOrg'
,'SetImeMode'
,'SetImeName'
,'Win32NLSEnableIME'
,'Imm32GetContext'
,'Imm32ReleaseContext'
,'Imm32GetConversionStatus'
,'Imm32SetConversionStatus'
,'Imm32SetOpenStatus'
,'Imm32GetCompositionString'
,'Imm32IsIME'
,'Imm32NotifyIME'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TCMActivate_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(_TCMCancelMode_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[2],Addr(_TCMChanged_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[3],Addr(_TCMChildKey_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[4],Addr(_TCMControlChange_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[5],Addr(_TCMControlListChange_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[6],Addr(_TCMDeactivate_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[7],Addr(_TCMDesignHitTest_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[8],Addr(_TCMDialogChar_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[9],Addr(_TCMDialogKey_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[10],Addr(_TCMDrag_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[11],Addr(_TCMEnter_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[12],Addr(_TCMExit_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[13],Addr(_TCMFocusChanged_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[14],Addr(_TCMGotFocus_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[15],Addr(_TCMHitTest_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[16],Addr(_TCMLostFocus_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[17],Addr(_TCMWantSpecialKey_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[18],Addr(_TCreateParams_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[19],Addr(_TDragRec_)));
RegisterProc(nil,MethodNames[20],mtProc,TypeInfo(_T0),[
TypeInfo(TObject),TypeInfo(Boolean)],Addr(IsDragObject),cRegister);

RegisterProc(nil,MethodNames[21],mtProc,TypeInfo(_T1),[
TypeInfo(HWND),TypeInfo(TWinControl)],Addr(FindControl),cRegister);

RegisterProc(nil,MethodNames[22],mtProc,TypeInfo(_T2),[
TypeInfo(IDispatch),TypeInfo(TWinControl)],Addr(____FindVCLWindow__Wrapper),cRegister);

RegisterProc(nil,MethodNames[23],mtProc,TypeInfo(_T3),[
TypeInfo(IDispatch),
TypeInfo(Boolean),TypeInfo(TControl)],Addr(____FindDragTarget__Wrapper),cRegister);

RegisterProc(nil,MethodNames[24],mtProc,TypeInfo(_T4),[TypeInfo(TControl)],Addr(GetCaptureControl),cRegister);

RegisterProc(nil,MethodNames[25],mtProc,TypeInfo(_T5),[
TypeInfo(TControl)],Addr(SetCaptureControl),cRegister);

RegisterProc(nil,MethodNames[26],mtProc,TypeInfo(_T6),NoParams,Addr(CancelDrag),cRegister);

RegisterProc(nil,MethodNames[27],mtProc,TypeInfo(_T7),[
TypeInfo(TCursor),TypeInfo(string)],Addr(CursorToString),cRegister);

RegisterProc(nil,MethodNames[28],mtProc,TypeInfo(_T8),[
TypeInfo(string),TypeInfo(TCursor)],Addr(StringToCursor),cRegister);

RegisterProc(nil,MethodNames[29],mtProc,TypeInfo(_T10),[
TypeInfo(Longint),
TypeInfo(string),TypeInfo(Boolean)],Addr(CursorToIdent),cRegister);

RegisterProc(nil,MethodNames[30],mtProc,TypeInfo(_T11),[
TypeInfo(string),
TypeInfo(Longint),TypeInfo(Boolean)],Addr(IdentToCursor),cRegister);

RegisterProc(nil,MethodNames[31],mtProc,TypeInfo(_T12),[
TypeInfo(string),TypeInfo(string)],Addr(GetShortHint),cRegister);

RegisterProc(nil,MethodNames[32],mtProc,TypeInfo(_T13),[
TypeInfo(string),TypeInfo(string)],Addr(GetLongHint),cRegister);

RegisterProc(nil,MethodNames[33],mtProc,TypeInfo(_T14),[
TypeInfo(HWND),
TypeInfo(Longint),
TypeInfo(Longint),
TypeInfo(Longint),TypeInfo(Longint)],Addr(InitWndProc),cStdCall);

RegisterProc(nil,MethodNames[34],mtProc,TypeInfo(_T15),[
TypeInfo(Cardinal),
TypeInfo(Longint),
TypeInfo(Longint),TypeInfo(Longint)],Addr(SendAppMessage),cRegister);

RegisterProc(nil,MethodNames[35],mtProc,TypeInfo(_T16),[
TypeInfo(HDC),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(MoveWindowOrg),cRegister);

RegisterProc(nil,MethodNames[36],mtProc,TypeInfo(_T17),[
TypeInfo(HWND),
TypeInfo(TImeMode)],Addr(SetImeMode),cRegister);

RegisterProc(nil,MethodNames[37],mtProc,TypeInfo(_T18),[
TypeInfo(TImeName)],Addr(SetImeName),cRegister);

RegisterProc(nil,MethodNames[38],mtProc,TypeInfo(_T19),[
TypeInfo(HWND),
TypeInfo(Boolean),TypeInfo(Boolean)],Addr(Win32NLSEnableIME),cRegister);

RegisterProc(nil,MethodNames[39],mtProc,TypeInfo(_T20),[
TypeInfo(HWND),TypeInfo(HIMC)],Addr(Imm32GetContext),cRegister);

RegisterProc(nil,MethodNames[40],mtProc,TypeInfo(_T21),[
TypeInfo(HWND),
TypeInfo(HIMC),TypeInfo(Boolean)],Addr(Imm32ReleaseContext),cRegister);

RegisterProc(nil,MethodNames[41],mtProc,TypeInfo(_T22),[
TypeInfo(HIMC),
TypeInfo(DWORD),
TypeInfo(DWORD),TypeInfo(Boolean)],Addr(Imm32GetConversionStatus),cRegister);

RegisterProc(nil,MethodNames[42],mtProc,TypeInfo(_T23),[
TypeInfo(HIMC),
TypeInfo(DWORD),
TypeInfo(DWORD),TypeInfo(Boolean)],Addr(Imm32SetConversionStatus),cRegister);

RegisterProc(nil,MethodNames[43],mtProc,TypeInfo(_T24),[
TypeInfo(HIMC),
TypeInfo(Boolean),TypeInfo(Boolean)],Addr(Imm32SetOpenStatus),cRegister);

RegisterProc(nil,MethodNames[44],mtProc,TypeInfo(_T27),[
TypeInfo(HIMC),
TypeInfo(DWORD),
TypeInfoPointer,
TypeInfo(DWORD),TypeInfo(Longint)],Addr(Imm32GetCompositionString),cRegister);

RegisterProc(nil,MethodNames[45],mtProc,TypeInfo(_T28),[
TypeInfo(hKl),TypeInfo(Boolean)],Addr(Imm32IsIME),cRegister);

RegisterProc(nil,MethodNames[46],mtProc,TypeInfo(_T29),[
TypeInfo(HIMC),
TypeInfo(DWORD),
TypeInfo(DWORD),
TypeInfo(DWORD),TypeInfo(Boolean)],Addr(Imm32NotifyIME),cRegister);

RegRegisterMethod(TChangeLink,'Change',TypeInfo(_T30),NoParams, pointer(MinVMTOffset - 0));

RegRegisterMethod(TControl,'ChangeScale',TypeInfo(_T31),[
TypeInfo(Integer),
TypeInfo(Integer)], pointer(MinVMTOffset - 13));

RegRegisterMethod(TControl,'Click',TypeInfo(_T32),NoParams, pointer(MinVMTOffset - 14));

RegRegisterMethod(TControl,'DblClick',TypeInfo(_T33),NoParams, pointer(MinVMTOffset - 15));

RegRegisterMethod(TControl,'DragCanceled',TypeInfo(_T34),NoParams, pointer(MinVMTOffset - 16));

RegRegisterMethod(TControl,'DragOver',TypeInfo(_T35),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TDragState),
TypeInfo(Boolean)], pointer(MinVMTOffset - 17));

RegRegisterMethod(TControl,'DoEndDrag',TypeInfo(_T36),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer)], pointer(MinVMTOffset - 18));

RegRegisterMethod(TControl,'DoStartDrag',TypeInfo(_T37),[
TypeInfo(TDragObject)], pointer(MinVMTOffset - 19));

RegRegisterMethod(TControl,'GetClientOrigin',TypeInfo(_T38),[TypeInfo(IDispatch)], pointer(44));

RegRegisterMethod(TControl,'GetClientRect',TypeInfo(_T39),[TypeInfo(IDispatch)], pointer(48));

RegRegisterMethod(TControl,'GetDeviceContext',TypeInfo(_T40),[
TypeInfo(HWND),TypeInfo(HDC)], pointer(52));

RegRegisterMethod(TControl,'GetDragImages',TypeInfo(_T41),[TypeInfo(TCustomImageList)], pointer(56));

RegRegisterMethod(TControl,'GetPalette',TypeInfo(_T42),[TypeInfo(HPALETTE)], pointer(MinVMTOffset - 20));

RegRegisterMethod(TControl,'GetPopupMenu',TypeInfo(_T43),[TypeInfo(TPopupMenu)], pointer(MinVMTOffset - 21));

RegRegisterMethod(TControl,'MouseDown',TypeInfo(_T44),[
TypeInfo(TMouseButton),
TypeInfo(TShiftState),
TypeInfo(Integer),
TypeInfo(Integer)], pointer(MinVMTOffset - 22));

RegRegisterMethod(TControl,'MouseMove',TypeInfo(_T45),[
TypeInfo(TShiftState),
TypeInfo(Integer),
TypeInfo(Integer)], pointer(MinVMTOffset - 23));

RegRegisterMethod(TControl,'MouseUp',TypeInfo(_T46),[
TypeInfo(TMouseButton),
TypeInfo(TShiftState),
TypeInfo(Integer),
TypeInfo(Integer)], pointer(MinVMTOffset - 24));

RegRegisterMethod(TControl,'PaletteChanged',TypeInfo(_T47),[
TypeInfo(Boolean),TypeInfo(Boolean)], pointer(MinVMTOffset - 25));

RegRegisterMethod(TControl,'RequestAlign',TypeInfo(_T48),NoParams, pointer(MinVMTOffset - 26));

RegRegisterMethod(TControl,'SetDragMode',TypeInfo(_T49),[
TypeInfo(TDragMode)], pointer(60));

RegRegisterMethod(TControl,'SetParent',TypeInfo(_T50),[
TypeInfo(TWinControl)], pointer(64));

RegRegisterMethod(TControl,'SetZOrder',TypeInfo(_T51),[
TypeInfo(Boolean)], pointer(MinVMTOffset - 27));

RegRegisterMethod(TControl,'VisibleChanging',TypeInfo(_T52),NoParams, pointer(MinVMTOffset - 28));

RegRegisterMethod(TControl,'WndProc',TypeInfo(_T53),[
TypeInfo(IDispatch)], pointer(68));

RegRegisterMethod(TControl,'BeginDrag',TypeInfo(_T54),[
TypeInfo(Boolean)],Addr(TControl.BeginDrag));

RegRegisterMethod(TControl,'BringToFront',TypeInfo(_T55),NoParams,Addr(TControl.BringToFront));

RegRegisterMethod(TControl,'ClientToScreen',TypeInfo(_T56),[
TypeInfo(IDispatch),TypeInfo(IDispatch)],Addr(__TControl__ClientToScreen__Wrapper));

RegRegisterMethod(TControl,'Dragging',TypeInfo(_T57),[TypeInfo(Boolean)],Addr(TControl.Dragging));

RegRegisterMethod(TControl,'DragDrop',TypeInfo(_T58),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer)], pointer(MinVMTOffset - 29));

RegRegisterMethod(TControl,'EndDrag',TypeInfo(_T59),[
TypeInfo(Boolean)],Addr(TControl.EndDrag));

RegRegisterMethod(TControl,'GetTextLen',TypeInfo(_T61),[TypeInfo(Integer)],Addr(TControl.GetTextLen));

RegRegisterMethod(TControl,'Hide',TypeInfo(_T62),NoParams,Addr(TControl.Hide));

RegRegisterMethod(TControl,'Invalidate',TypeInfo(_T63),NoParams, pointer(72));

RegRegisterMethod(TControl,'Perform',TypeInfo(_T64),[
TypeInfo(Cardinal),
TypeInfo(Longint),
TypeInfo(Longint),TypeInfo(Longint)],Addr(TControl.Perform));

RegRegisterMethod(TControl,'Refresh',TypeInfo(_T65),NoParams,Addr(TControl.Refresh));

RegRegisterMethod(TControl,'Repaint',TypeInfo(_T66),NoParams, pointer(76));

RegRegisterMethod(TControl,'ScreenToClient',TypeInfo(_T67),[
TypeInfo(IDispatch),TypeInfo(IDispatch)],Addr(__TControl__ScreenToClient__Wrapper));

RegRegisterMethod(TControl,'SendToBack',TypeInfo(_T68),NoParams,Addr(TControl.SendToBack));

RegRegisterMethod(TControl,'SetBounds',TypeInfo(_T69),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer)], pointer(80));

RegRegisterMethod(TControl,'Show',TypeInfo(_T71),NoParams,Addr(TControl.Show));

RegRegisterMethod(TControl,'Update',TypeInfo(_T72),NoParams, pointer(84));

RegRegisterMethod(TControlCanvas,'FreeHandle',TypeInfo(_T73),NoParams,Addr(TControlCanvas.FreeHandle));

RegRegisterMethod(TCustomControl,'Paint',TypeInfo(_T74),NoParams, pointer(128));

RegRegisterMethod(TCustomImageList,'Change',TypeInfo(_T75),NoParams, pointer(MinVMTOffset - 13));

RegisterProc(TCustomImageList,'CreateSize',mtConstructor,TypeInfo(_T76),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TCustomImageList.CreateSize),cRegister);

RegRegisterMethod(TCustomImageList,'Add',TypeInfo(_T77),[
TypeInfo(TBitmap),
TypeInfo(TBitmap),TypeInfo(Integer)],Addr(TCustomImageList.Add));

RegRegisterMethod(TCustomImageList,'AddIcon',TypeInfo(_T78),[
TypeInfo(TIcon),TypeInfo(Integer)],Addr(TCustomImageList.AddIcon));

RegRegisterMethod(TCustomImageList,'AddImages',TypeInfo(_T79),[
TypeInfo(TCustomImageList)],Addr(TCustomImageList.AddImages));

RegRegisterMethod(TCustomImageList,'AddMasked',TypeInfo(_T80),[
TypeInfo(TBitmap),
TypeInfo(TColor),TypeInfo(Integer)],Addr(TCustomImageList.AddMasked));

RegRegisterMethod(TCustomImageList,'BeginDrag',TypeInfo(_T81),[
TypeInfo(HWND),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Boolean)],Addr(TCustomImageList.BeginDrag));

RegRegisterMethod(TCustomImageList,'Clear',TypeInfo(_T82),NoParams,Addr(TCustomImageList.Clear));

RegRegisterMethod(TCustomImageList,'Delete',TypeInfo(_T83),[
TypeInfo(Integer)],Addr(TCustomImageList.Delete));

RegRegisterMethod(TCustomImageList,'DragLock',TypeInfo(_T84),[
TypeInfo(HWND),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Boolean)],Addr(TCustomImageList.DragLock));

RegRegisterMethod(TCustomImageList,'DragMove',TypeInfo(_T85),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Boolean)],Addr(TCustomImageList.DragMove));

RegRegisterMethod(TCustomImageList,'DragUnlock',TypeInfo(_T86),NoParams,Addr(TCustomImageList.DragUnlock));

RegRegisterMethod(TCustomImageList,'Draw',TypeInfo(_T87),[
TypeInfo(TCanvas),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TCustomImageList.Draw));

RegRegisterMethod(TCustomImageList,'DrawOverlay',TypeInfo(_T88),[
TypeInfo(TCanvas),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TOverlay)],Addr(TCustomImageList.DrawOverlay));

RegRegisterMethod(TCustomImageList,'EndDrag',TypeInfo(_T89),[TypeInfo(Boolean)],Addr(TCustomImageList.EndDrag));

RegRegisterMethod(TCustomImageList,'FileLoad',TypeInfo(_T90),[
TypeInfo(TResType),
TypeInfo(string),
TypeInfo(TColor),TypeInfo(Boolean)],Addr(TCustomImageList.FileLoad));

RegRegisterMethod(TCustomImageList,'GetBitmap',TypeInfo(_T91),[
TypeInfo(Integer),
TypeInfo(TBitmap)],Addr(TCustomImageList.GetBitmap));

RegRegisterMethod(TCustomImageList,'GetHotSpot',TypeInfo(_T92),[TypeInfo(IDispatch)],Addr(__TCustomImageList__GetHotSpot__Wrapper));

RegRegisterMethod(TCustomImageList,'GetIcon',TypeInfo(_T93),[
TypeInfo(Integer),
TypeInfo(TIcon)],Addr(TCustomImageList.GetIcon));

RegRegisterMethod(TCustomImageList,'GetImageBitmap',TypeInfo(_T94),[TypeInfo(HBITMAP)],Addr(TCustomImageList.GetImageBitmap));

RegRegisterMethod(TCustomImageList,'GetMaskBitmap',TypeInfo(_T95),[TypeInfo(HBITMAP)],Addr(TCustomImageList.GetMaskBitmap));

RegRegisterMethod(TCustomImageList,'GetResource',TypeInfo(_T96),[
TypeInfo(TResType),
TypeInfo(string),
TypeInfo(Integer),
TypeInfo(TLoadResources),
TypeInfo(TColor),TypeInfo(Boolean)],Addr(TCustomImageList.GetResource));

RegRegisterMethod(TCustomImageList,'GetInstRes',TypeInfo(_T97),[
TypeInfo(THandle),
TypeInfo(TResType),
TypeInfo(string),
TypeInfo(Integer),
TypeInfo(TLoadResources),
TypeInfo(TColor),TypeInfo(Boolean)],Addr(TCustomImageList.GetInstRes));

RegRegisterMethod(TCustomImageList,'HandleAllocated',TypeInfo(_T98),[TypeInfo(Boolean)],Addr(TCustomImageList.HandleAllocated));

RegRegisterMethod(TCustomImageList,'HideDragImage',TypeInfo(_T99),NoParams,Addr(TCustomImageList.HideDragImage));

RegRegisterMethod(TCustomImageList,'Insert',TypeInfo(_T100),[
TypeInfo(Integer),
TypeInfo(TBitmap),
TypeInfo(TBitmap)],Addr(TCustomImageList.Insert));

RegRegisterMethod(TCustomImageList,'InsertIcon',TypeInfo(_T101),[
TypeInfo(Integer),
TypeInfo(TIcon)],Addr(TCustomImageList.InsertIcon));

RegRegisterMethod(TCustomImageList,'InsertMasked',TypeInfo(_T102),[
TypeInfo(Integer),
TypeInfo(TBitmap),
TypeInfo(TColor)],Addr(TCustomImageList.InsertMasked));

RegRegisterMethod(TCustomImageList,'Move',TypeInfo(_T103),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TCustomImageList.Move));

RegRegisterMethod(TCustomImageList,'Overlay',TypeInfo(_T104),[
TypeInfo(Integer),
TypeInfo(TOverlay),TypeInfo(Boolean)],Addr(TCustomImageList.Overlay));

RegRegisterMethod(TCustomImageList,'RegisterChanges',TypeInfo(_T105),[
TypeInfo(TChangeLink)],Addr(TCustomImageList.RegisterChanges));

RegRegisterMethod(TCustomImageList,'ResourceLoad',TypeInfo(_T106),[
TypeInfo(TResType),
TypeInfo(string),
TypeInfo(TColor),TypeInfo(Boolean)],Addr(TCustomImageList.ResourceLoad));

RegRegisterMethod(TCustomImageList,'ResInstLoad',TypeInfo(_T107),[
TypeInfo(THandle),
TypeInfo(TResType),
TypeInfo(string),
TypeInfo(TColor),TypeInfo(Boolean)],Addr(TCustomImageList.ResInstLoad));

RegRegisterMethod(TCustomImageList,'Replace',TypeInfo(_T108),[
TypeInfo(Integer),
TypeInfo(TBitmap),
TypeInfo(TBitmap)],Addr(TCustomImageList.Replace));

RegRegisterMethod(TCustomImageList,'ReplaceIcon',TypeInfo(_T109),[
TypeInfo(Integer),
TypeInfo(TIcon)],Addr(TCustomImageList.ReplaceIcon));

RegRegisterMethod(TCustomImageList,'ReplaceMasked',TypeInfo(_T110),[
TypeInfo(Integer),
TypeInfo(TBitmap),
TypeInfo(TColor)],Addr(TCustomImageList.ReplaceMasked));

RegRegisterMethod(TCustomImageList,'SetDragImage',TypeInfo(_T111),[
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Boolean)],Addr(TCustomImageList.SetDragImage));

RegRegisterMethod(TCustomImageList,'ShowDragImage',TypeInfo(_T112),NoParams,Addr(TCustomImageList.ShowDragImage));

RegRegisterMethod(TCustomImageList,'UnRegisterChanges',TypeInfo(_T113),[
TypeInfo(TChangeLink)],Addr(TCustomImageList.UnRegisterChanges));

RegisterProc(TDragControlObject,'Create',mtConstructor,TypeInfo(_T114),[
TypeInfo(TControl)],Addr(TDragControlObject.Create),cRegister);

RegRegisterMethod(TDragObject,'GetDragImages',TypeInfo(_T115),[TypeInfo(TCustomImageList)], pointer(0));

RegRegisterMethod(TDragObject,'GetDragCursor',TypeInfo(_T116),[
TypeInfo(Boolean),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(TCursor)], pointer(4));

RegRegisterMethod(TDragObject,'Finished',TypeInfo(_T117),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Boolean)], pointer(8));

RegRegisterMethod(TDragObject,'Instance',TypeInfo(_T118),[TypeInfo(THandle)], pointer(12));

RegRegisterMethod(TDragObject,'GetName',TypeInfo(_T119),[TypeInfo(string)], pointer(16));

RegRegisterMethod(TDragObject,'HideDragImage',TypeInfo(_T120),NoParams, pointer(20));

RegRegisterMethod(TDragObject,'ShowDragImage',TypeInfo(_T121),NoParams, pointer(24));

RegRegisterMethod(TGraphicControl,'Paint',TypeInfo(_T122),NoParams, pointer(88));

RegRegisterMethod(THintWindow,'ActivateHint',TypeInfo(_T123),[
TypeInfo(IDispatch),
TypeInfo(string)], pointer(132));

RegRegisterMethod(THintWindow,'ActivateHintData',TypeInfo(_T124),[
TypeInfo(IDispatch),
TypeInfo(string),
TypeInfoPointer], pointer(136));

RegRegisterMethod(THintWindow,'CalcHintRect',TypeInfo(_T125),[
TypeInfo(Integer),
TypeInfo(string),
TypeInfoPointer,TypeInfo(IDispatch)], pointer(140));

RegRegisterMethod(THintWindow,'IsHintMsg',TypeInfo(_T126),[
TypeInfo(IDispatch),TypeInfo(Boolean)], pointer(144));

RegRegisterMethod(THintWindow,'ReleaseHandle',TypeInfo(_T127),NoParams,Addr(THintWindow.ReleaseHandle));

RegRegisterMethod(TWinControl,'AlignControls',TypeInfo(_T128),[
TypeInfo(TControl),
TypeInfo(IDispatch)], pointer(88));

RegRegisterMethod(TWinControl,'CreateHandle',TypeInfo(_T129),NoParams, pointer(92));

RegRegisterMethod(TWinControl,'CreateParams',TypeInfo(_T130),[
TypeInfo(IDispatch)], pointer(96));

RegRegisterMethod(TWinControl,'CreateWindowHandle',TypeInfo(_T131),[
TypeInfo(IDispatch)], pointer(100));

RegRegisterMethod(TWinControl,'CreateWnd',TypeInfo(_T132),NoParams, pointer(104));

RegRegisterMethod(TWinControl,'DestroyWindowHandle',TypeInfo(_T133),NoParams, pointer(108));

RegRegisterMethod(TWinControl,'DestroyWnd',TypeInfo(_T134),NoParams, pointer(112));

RegRegisterMethod(TWinControl,'DoEnter',TypeInfo(_T135),NoParams, pointer(MinVMTOffset - 30));

RegRegisterMethod(TWinControl,'DoExit',TypeInfo(_T136),NoParams, pointer(MinVMTOffset - 31));

RegRegisterMethod(TWinControl,'KeyDown',TypeInfo(_T137),[
TypeInfo(Word),
TypeInfo(TShiftState)], pointer(MinVMTOffset - 32));

RegRegisterMethod(TWinControl,'KeyUp',TypeInfo(_T138),[
TypeInfo(Word),
TypeInfo(TShiftState)], pointer(MinVMTOffset - 33));

RegRegisterMethod(TWinControl,'KeyPress',TypeInfo(_T139),[
TypeInfo(Char)], pointer(MinVMTOffset - 34));

RegRegisterMethod(TWinControl,'PaintWindow',TypeInfo(_T140),[
TypeInfo(HDC)], pointer(116));

RegRegisterMethod(TWinControl,'ShowControl',TypeInfo(_T141),[
TypeInfo(TControl)], pointer(120));

RegisterProc(TWinControl,'CreateParented',mtConstructor,TypeInfo(_T142),[
TypeInfo(HWND)],Addr(TWinControl.CreateParented),cRegister);

RegisterProc(TWinControl,'CreateParentedControl',mtClassMethod,TypeInfo(_T143),[
TypeInfo(HWND),TypeInfo(TWinControl)],Addr(TWinControl.CreateParentedControl),cRegister);

RegRegisterMethod(TWinControl,'Broadcast',TypeInfo(_T144),[
TypeInfoUntyped],Addr(TWinControl.Broadcast));

RegRegisterMethod(TWinControl,'CanFocus',TypeInfo(_T145),[TypeInfo(Boolean)],Addr(TWinControl.CanFocus));

RegRegisterMethod(TWinControl,'ContainsControl',TypeInfo(_T146),[
TypeInfo(TControl),TypeInfo(Boolean)],Addr(TWinControl.ContainsControl));

RegRegisterMethod(TWinControl,'ControlAtPos',TypeInfo(_T147),[
TypeInfo(IDispatch),
TypeInfo(Boolean),TypeInfo(TControl)],Addr(__TWinControl__ControlAtPos__Wrapper));

RegRegisterMethod(TWinControl,'DisableAlign',TypeInfo(_T148),NoParams,Addr(TWinControl.DisableAlign));

RegRegisterMethod(TWinControl,'EnableAlign',TypeInfo(_T149),NoParams,Addr(TWinControl.EnableAlign));

RegRegisterMethod(TWinControl,'Focused',TypeInfo(_T150),[TypeInfo(Boolean)],Addr(TWinControl.Focused));

RegRegisterMethod(TWinControl,'GetTabOrderList',TypeInfo(_T151),[
TypeInfo(TList)], pointer(MinVMTOffset - 35));

RegRegisterMethod(TWinControl,'HandleAllocated',TypeInfo(_T152),[TypeInfo(Boolean)],Addr(TWinControl.HandleAllocated));

RegRegisterMethod(TWinControl,'HandleNeeded',TypeInfo(_T153),NoParams,Addr(TWinControl.HandleNeeded));

RegRegisterMethod(TWinControl,'InsertControl',TypeInfo(_T154),[
TypeInfo(TControl)],Addr(TWinControl.InsertControl));

RegRegisterMethod(TWinControl,'PaintTo',TypeInfo(_T155),[
TypeInfo(HDC),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TWinControl.PaintTo));

RegRegisterMethod(TWinControl,'RemoveControl',TypeInfo(_T156),[
TypeInfo(TControl)],Addr(TWinControl.RemoveControl));

RegRegisterMethod(TWinControl,'Realign',TypeInfo(_T157),NoParams,Addr(TWinControl.Realign));

RegRegisterMethod(TWinControl,'ScaleBy',TypeInfo(_T158),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TWinControl.ScaleBy));

RegRegisterMethod(TWinControl,'ScrollBy',TypeInfo(_T159),[
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TWinControl.ScrollBy));

RegRegisterMethod(TWinControl,'SetFocus',TypeInfo(_T160),NoParams, pointer(124));

RegRegisterMethod(TWinControl,'UpdateControlState',TypeInfo(_T161),NoParams,Addr(TWinControl.UpdateControlState));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'GetCursorValues',mtProc,TypeInfo(_T9),[
TypeInfo(TGetStrProc)],Addr(GetCursorValues),cRegister)}

{RegisterProc(nil,'Imm32SetCompositionWindow',mtProc,TypeInfo(_T25),[
TypeInfo(HIMC),
TypeInfoPointer,TypeInfo(Boolean)],Addr(Imm32SetCompositionWindow),cRegister)}

{RegisterProc(nil,'Imm32SetCompositionFont',mtProc,TypeInfo(_T26),[
TypeInfo(HIMC),
TypeInfoPointer,TypeInfo(Boolean)],Addr(Imm32SetCompositionFont),cRegister)}

{RegRegisterMethod(TControl,'GetTextBuf',TypeInfo(_T60),[
TypeInfoPChar,
TypeInfo(Integer),TypeInfo(Integer)],Addr(TControl.GetTextBuf))}

{RegRegisterMethod(TControl,'SetTextBuf',TypeInfo(_T70),[
TypeInfoPChar],Addr(TControl.SetTextBuf))}

RegisterEvent(TypeInfo(TDragDropEvent),[
TypeInfo(TObject),
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer)]);

RegisterEvent(TypeInfo(TDragOverEvent),[
TypeInfo(TObject),
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(TDragState),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TEndDragEvent),[
TypeInfo(TObject),
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer)]);

RegisterEvent(TypeInfo(TKeyEvent),[
TypeInfo(TObject),
TypeInfo(Word),
TypeInfo(TShiftState)]);

RegisterEvent(TypeInfo(TKeyPressEvent),[
TypeInfo(TObject),
TypeInfo(Char)]);

RegisterEvent(TypeInfo(TMouseEvent),[
TypeInfo(TObject),
TypeInfo(TMouseButton),
TypeInfo(TShiftState),
TypeInfo(Integer),
TypeInfo(Integer)]);

RegisterEvent(TypeInfo(TMouseMoveEvent),[
TypeInfo(TObject),
TypeInfo(TShiftState),
TypeInfo(Integer),
TypeInfo(Integer)]);

RegisterEvent(TypeInfo(TStartDragEvent),[
TypeInfo(TObject),
TypeInfo(TDragObject)]);

{RegisterEvent(TypeInfo(TWndMethod),[
TypeInfo(IDispatch)]);}

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
