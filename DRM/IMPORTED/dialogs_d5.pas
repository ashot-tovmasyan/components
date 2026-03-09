{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit DIALOGS_D5;
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
  Messages,
  SysUtils,
  CommDlg,
  Classes,
  Graphics,
  Controls,
  Forms,
  StdCtrls,
  Dialogs;
function ConvertTMessageToVariant(var R : TMessage) : OleVariant;
function ConvertVariantToTMessage(const V : OleVariant) : TMessage;
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
type __TCommonDialog__ = class(TCommonDialog);
type __TOpenDialog__ = class(TOpenDialog);
type
_T0 = function (const p0 : string;
p1 : TMsgDlgType;
p2 : TMsgDlgButtons): TForm of object;

_T1 = function (const p0 : string;
p1 : TMsgDlgType;
p2 : TMsgDlgButtons;
p3 : Longint): Integer of object;

_T2 = function (const p0 : string;
p1 : TMsgDlgType;
p2 : TMsgDlgButtons;
p3 : Longint;
p4 : Integer;
p5 : Integer): Integer of object;

_T3 = function (const p0 : string;
p1 : TMsgDlgType;
p2 : TMsgDlgButtons;
p3 : Longint;
p4 : Integer;
p5 : Integer;
const p6 : string): Integer of object;

_T4 = procedure (const p0 : string) of object;

_T5 = procedure (const p0 : string;
p1 : Array of Const) of object;

_T6 = procedure (const p0 : string;
p1 : Integer;
p2 : Integer) of object;

_T7 = function (const p0 : string;
const p1 : string;
const p2 : string): string of object;

_T8 = function (const p0 : string;
const p1 : string;
var p2 : string): Boolean of object;

_T9 = procedure  of object;

_T10 = _T9;

_T11 = procedure (const p0 : IDispatch) of object;

_T12 = function (const p0 : IDispatch): Boolean of object;

_T13 = function (p0 : Pointer;
var p1): Bool of object;

_T14 = function : Boolean of object;

_T15 = _T9;

_T16 = _T9;

_T17 = _T9;

_T18 = procedure (p0 : HWnd) of object;

_T19 = _T14;

_T20 = _T9;

_T21 = _T9;

_T22 = _T9;

{_T23 = procedure (const p0 : TOFNotifyEx;
var p1 : Boolean) of object;}

_T24 = function : IDispatch of object;

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
procedure __TCommonDialog__WndProc__Wrapper(__Instance : TCommonDialog;
const p0 : IDispatch);
var
__p0 : ^TMessage;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
__TCommonDialog__(__Instance).WndProc(__p0^);
end;

function __TCommonDialog__MessageHook__Wrapper(__Instance : TCommonDialog;
const p0 : IDispatch): Boolean;
var
__p0 : ^TMessage;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := __TCommonDialog__(__Instance).MessageHook(__p0^);
end;

function __TOpenDialog__GetStaticRect__Wrapper(__Instance : TOpenDialog): IDispatch;
var
__result : TRect;
__wrapper : __TRect__Wrapper;
begin
__result := __TOpenDialog__(__Instance).GetStaticRect;
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
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
function __DC__GetTCommonDialog__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCommonDialog(Instance).Handle;
end;

function __DC__GetTFindDialog__Left(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFindDialog(Instance).Left;
end;

procedure __DC__SetTFindDialog__Left(Instance : TObject; Params : PVariantArgList);
begin
TFindDialog(Instance).Left:=OleVariant(Params^[0]);
end;

function __DC__GetTFindDialog__Position(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TPoint__Wrapper;
begin
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := TFindDialog(Instance).Position;
result := IUnknown(__wrapper) as IDispatch;
end;

procedure __DC__SetTFindDialog__Position(Instance : TObject; Params : PVariantArgList);
var
__idisp:IDispatch;
__iwrapper:IDCRecordWrapper;
begin
__idisp:=DCVarToInterface(OleVariant(Params^[0]));
if __idisp=nil then exit;
__idisp.QueryInterface(IDCRecordWrapper, __iwrapper);
TFindDialog(Instance).Position:=TPoint(__iwrapper.GetRecordPtr^);
end;

function __DC__GetTFindDialog__Top(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFindDialog(Instance).Top;
end;

procedure __DC__SetTFindDialog__Top(Instance : TObject; Params : PVariantArgList);
begin
TFindDialog(Instance).Top:=OleVariant(Params^[0]);
end;

function __DC__GetTOpenDialog__FileEditStyle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TOpenDialog(Instance).FileEditStyle;
end;

procedure __DC__SetTOpenDialog__FileEditStyle(Instance : TObject; Params : PVariantArgList);
begin
TOpenDialog(Instance).FileEditStyle:=OleVariant(Params^[0]);
end;

function __DC__GetTOpenDialog__Files(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TOpenDialog(Instance).Files);
end;

function __DC__GetTOpenDialog__HistoryList(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TOpenDialog(Instance).HistoryList);
end;

procedure __DC__SetTOpenDialog__HistoryList(Instance : TObject; Params : PVariantArgList);
begin
TOpenDialog(Instance).HistoryList:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

procedure __RegisterProps;
begin
RegisterProperty(TCommonDialog,'Handle',__DC__GetTCommonDialog__Handle,nil);
RegisterProperty(TFindDialog,'Left',__DC__GetTFindDialog__Left,__DC__SetTFindDialog__Left);
RegisterProperty(TFindDialog,'Position',__DC__GetTFindDialog__Position,__DC__SetTFindDialog__Position);
RegisterProperty(TFindDialog,'Top',__DC__GetTFindDialog__Top,__DC__SetTFindDialog__Top);
RegisterProperty(TOpenDialog,'FileEditStyle',__DC__GetTOpenDialog__FileEditStyle,__DC__SetTOpenDialog__FileEditStyle);
RegisterProperty(TOpenDialog,'Files',__DC__GetTOpenDialog__Files,nil);
RegisterProperty(TOpenDialog,'HistoryList',__DC__GetTOpenDialog__HistoryList,__DC__SetTOpenDialog__HistoryList);
end;

function __DC__GetDialogs__ForceCurrentDirectory(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := Dialogs.ForceCurrentDirectory;
end;

procedure __DC__SetDialogs__ForceCurrentDirectory(Instance : TObject; Params : PVariantArgList);
begin
Dialogs.ForceCurrentDirectory:=OleVariant(Params^[0]);
end;

var __RegisteredVars : TList;
procedure __RegisterVars;
begin
__RegisteredVars := TList.Create;
__RegisteredVars.Add(RegisterVar('ForceCurrentDirectory',__DC__GetDialogs__ForceCurrentDirectory,__DC__SetDialogs__ForceCurrentDirectory));
end;

procedure __UnregisterVars;
begin
__RegisteredVars.Free;
end;

const __ConstNames0 : array[0..87] of string = (
'MaxCustomColors'
,'ofReadOnly'
,'ofOverwritePrompt'
,'ofHideReadOnly'
,'ofNoChangeDir'
,'ofShowHelp'
,'ofNoValidate'
,'ofAllowMultiSelect'
,'ofExtensionDifferent'
,'ofPathMustExist'
,'ofFileMustExist'
,'ofCreatePrompt'
,'ofShareAware'
,'ofNoReadOnlyReturn'
,'ofNoTestFileCreate'
,'ofNoNetworkButton'
,'ofNoLongNames'
,'ofOldStyleDialog'
,'ofNoDereferenceLinks'
,'ofEnableIncludeNotify'
,'ofEnableSizing'
,'fsEdit'
,'fsComboBox'
,'cdFullOpen'
,'cdPreventFullOpen'
,'cdShowHelp'
,'cdSolidColor'
,'cdAnyColor'
,'fdAnsiOnly'
,'fdTrueTypeOnly'
,'fdEffects'
,'fdFixedPitchOnly'
,'fdForceFontExist'
,'fdNoFaceSel'
,'fdNoOEMFonts'
,'fdNoSimulations'
,'fdNoSizeSel'
,'fdNoStyleSel'
,'fdNoVectorFonts'
,'fdShowHelp'
,'fdWysiwyg'
,'fdLimitSize'
,'fdScalableOnly'
,'fdApplyButton'
,'fdScreen'
,'fdPrinter'
,'fdBoth'
,'prAllPages'
,'prSelection'
,'prPageNums'
,'poPrintToFile'
,'poPageNums'
,'poSelection'
,'poWarning'
,'poHelp'
,'poDisablePrintToFile'
,'frDown'
,'frFindNext'
,'frHideMatchCase'
,'frHideWholeWord'
,'frHideUpDown'
,'frMatchCase'
,'frDisableMatchCase'
,'frDisableUpDown'
,'frDisableWholeWord'
,'frReplace'
,'frReplaceAll'
,'frWholeWord'
,'frShowHelp'
,'mtWarning'
,'mtError'
,'mtInformation'
,'mtConfirmation'
,'mtCustom'
,'mbYes'
,'mbNo'
,'mbOK'
,'mbCancel'
,'mbAbort'
,'mbRetry'
,'mbIgnore'
,'mbAll'
,'mbNoToAll'
,'mbYesToAll'
,'mbHelp'
,'mbYesNoCancel'
,'mbOKCancel'
,'mbAbortRetryIgnore'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,MaxCustomColors));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,ofReadOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,ofOverwritePrompt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,ofHideReadOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,ofNoChangeDir));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,ofShowHelp));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,ofNoValidate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,ofAllowMultiSelect));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,ofExtensionDifferent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,ofPathMustExist));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,ofFileMustExist));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,ofCreatePrompt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,ofShareAware));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,ofNoReadOnlyReturn));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,ofNoTestFileCreate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,ofNoNetworkButton));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,ofNoLongNames));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,ofOldStyleDialog));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,ofNoDereferenceLinks));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,ofEnableIncludeNotify));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,ofEnableSizing));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,fsEdit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,fsComboBox));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,cdFullOpen));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,cdPreventFullOpen));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,cdShowHelp));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,cdSolidColor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,cdAnyColor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,fdAnsiOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,fdTrueTypeOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,fdEffects));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,fdFixedPitchOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,fdForceFontExist));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,fdNoFaceSel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,fdNoOEMFonts));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,fdNoSimulations));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,fdNoSizeSel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,fdNoStyleSel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,fdNoVectorFonts));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,fdShowHelp));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,fdWysiwyg));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,fdLimitSize));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,fdScalableOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,fdApplyButton));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,fdScreen));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,fdPrinter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,fdBoth));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,prAllPages));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[48] ,prSelection));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[49] ,prPageNums));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[50] ,poPrintToFile));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[51] ,poPageNums));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[52] ,poSelection));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[53] ,poWarning));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[54] ,poHelp));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[55] ,poDisablePrintToFile));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[56] ,frDown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[57] ,frFindNext));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[58] ,frHideMatchCase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[59] ,frHideWholeWord));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[60] ,frHideUpDown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[61] ,frMatchCase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[62] ,frDisableMatchCase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[63] ,frDisableUpDown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[64] ,frDisableWholeWord));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[65] ,frReplace));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[66] ,frReplaceAll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[67] ,frWholeWord));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[68] ,frShowHelp));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[69] ,mtWarning));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[70] ,mtError));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[71] ,mtInformation));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[72] ,mtConfirmation));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[73] ,mtCustom));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[74] ,mbYes));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[75] ,mbNo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[76] ,mbOK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[77] ,mbCancel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[78] ,mbAbort));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[79] ,mbRetry));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[80] ,mbIgnore));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[81] ,mbAll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[82] ,mbNoToAll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[83] ,mbYesToAll));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[84] ,mbHelp));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[85] ,VarFromSet(mbYesNoCancel, sizeof(mbYesNoCancel))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[86] ,VarFromSet(mbOKCancel, sizeof(mbOKCancel))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[87] ,VarFromSet(mbAbortRetryIgnore, sizeof(mbAbortRetryIgnore))));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..8] of TClass = (
TColorDialog,
TCommonDialog,
TFindDialog,
TFontDialog,
TOpenDialog,
TPrintDialog,
TPrinterSetupDialog,
TReplaceDialog,
TSaveDialog
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..8] of string = (
'CreateMessageDialog'
,'MessageDlg'
,'MessageDlgPos'
,'MessageDlgPosHelp'
,'ShowMessage'
,'ShowMessageFmt'
,'ShowMessagePos'
,'InputBox'
,'InputQuery'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T0),[
TypeInfo(string),
TypeInfo(TMsgDlgType),
TypeInfo(TMsgDlgButtons),TypeInfo(TForm)],Addr(CreateMessageDialog),cRegister);

RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T1),[
TypeInfo(string),
TypeInfo(TMsgDlgType),
TypeInfo(TMsgDlgButtons),
TypeInfo(Longint),TypeInfo(Integer)],Addr(MessageDlg),cRegister);

RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T2),[
TypeInfo(string),
TypeInfo(TMsgDlgType),
TypeInfo(TMsgDlgButtons),
TypeInfo(Longint),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Integer)],Addr(MessageDlgPos),cRegister);

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T3),[
TypeInfo(string),
TypeInfo(TMsgDlgType),
TypeInfo(TMsgDlgButtons),
TypeInfo(Longint),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(string),TypeInfo(Integer)],Addr(MessageDlgPosHelp),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T4),[
TypeInfo(string)],Addr(ShowMessage),cRegister);

RegisterProc(nil,MethodNames[5],mtProc,TypeInfo(_T5),[
TypeInfo(string),
TypeInfoArrayOfConst],Addr(ShowMessageFmt),cRegister);

RegisterProc(nil,MethodNames[6],mtProc,TypeInfo(_T6),[
TypeInfo(string),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(ShowMessagePos),cRegister);

RegisterProc(nil,MethodNames[7],mtProc,TypeInfo(_T7),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(string),TypeInfo(string)],Addr(InputBox),cRegister);

RegisterProc(nil,MethodNames[8],mtProc,TypeInfo(_T8),[
TypeInfo(string),
TypeInfo(string),
TypeInfo(string),TypeInfo(Boolean)],Addr(InputQuery),cRegister);

RegRegisterMethod(TCommonDialog,'DoClose',TypeInfo(_T9),NoParams, pointer(MinVMTOffset - 15));

RegRegisterMethod(TCommonDialog,'DoShow',TypeInfo(_T10),NoParams, pointer(MinVMTOffset - 16));

RegRegisterMethod(TCommonDialog,'WndProc',TypeInfo(_T11),[
TypeInfo(IDispatch)], pointer(48));

RegRegisterMethod(TCommonDialog,'MessageHook',TypeInfo(_T12),[
TypeInfo(IDispatch),TypeInfo(Boolean)], pointer(52));

RegRegisterMethod(TCommonDialog,'TaskModalDialog',TypeInfo(_T13),[
TypeInfoPointer,
TypeInfoUntyped,TypeInfo(Bool)], pointer(56));

RegRegisterMethod(TCommonDialog,'Execute',TypeInfo(_T14),[TypeInfo(Boolean)], pointer(60));

RegRegisterMethod(TFindDialog,'Find',TypeInfo(_T15),NoParams, pointer(MinVMTOffset - 17));

RegRegisterMethod(TFindDialog,'Replace',TypeInfo(_T16),NoParams, pointer(MinVMTOffset - 18));

RegRegisterMethod(TFindDialog,'CloseDialog',TypeInfo(_T17),NoParams,Addr(TFindDialog.CloseDialog));

RegRegisterMethod(TFontDialog,'Apply',TypeInfo(_T18),[
TypeInfo(HWnd)], pointer(MinVMTOffset - 17));

RegRegisterMethod(TOpenDialog,'DoCanClose',TypeInfo(_T19),[TypeInfo(Boolean)], pointer(MinVMTOffset - 17));

RegRegisterMethod(TOpenDialog,'DoSelectionChange',TypeInfo(_T20),NoParams, pointer(MinVMTOffset - 18));

RegRegisterMethod(TOpenDialog,'DoFolderChange',TypeInfo(_T21),NoParams, pointer(MinVMTOffset - 19));

RegRegisterMethod(TOpenDialog,'DoTypeChange',TypeInfo(_T22),NoParams, pointer(MinVMTOffset - 20));

RegRegisterMethod(TOpenDialog,'GetStaticRect',TypeInfo(_T24),[TypeInfo(IDispatch)], pointer(64));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegRegisterMethod(TOpenDialog,'DoIncludeItem',TypeInfo(_T23),[
TypeInfo(TOFNotifyEx),
TypeInfo(Boolean)], pointer(MinVMTOffset - 21))}

RegisterEvent(TypeInfo(TFDApplyEvent),[
TypeInfo(TObject),
TypeInfo(HWnd)]);

{RegisterEvent(TypeInfo(TIncludeItemEvent),[
TypeInfo(TOFNotifyEx),
TypeInfo(Boolean)]);}

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
