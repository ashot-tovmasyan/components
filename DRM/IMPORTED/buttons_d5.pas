{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit BUTTONS_D5;
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
  Classes,
  Controls,
  Forms,
  Graphics,
  StdCtrls,
  ExtCtrls,
  CommCtrl,
  Buttons;
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
type
_T0 = function (p0 : TCanvas;
const p1 : IDispatch;
p2 : Integer;
p3 : TButtonStyle;
p4 : Boolean;
p5 : Boolean;
p6 : Boolean): IDispatch of object;

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
function ____DrawButtonFace__Wrapper(p0 : TCanvas;
const p1 : IDispatch;
p2 : Integer;
p3 : TButtonStyle;
p4 : Boolean;
p5 : Boolean;
p6 : Boolean): IDispatch;
var
__result : TRect;
__wrapper : __TRect__Wrapper;
__p1 : ^TRect;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
__result := DrawButtonFace(p0,__p1^,p2,p3,p4,p5,p6);
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
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
procedure __RegisterProps;
begin
end;

const __ConstNames0 : array[0..21] of string = (
'blGlyphLeft'
,'blGlyphRight'
,'blGlyphTop'
,'blGlyphBottom'
,'bsUp'
,'bsDisabled'
,'bsDown'
,'bsExclusive'
,'bsAutoDetect'
,'bsWin31'
,'bsNew'
,'bkCustom'
,'bkOK'
,'bkCancel'
,'bkHelp'
,'bkYes'
,'bkNo'
,'bkClose'
,'bkAbort'
,'bkRetry'
,'bkIgnore'
,'bkAll'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,blGlyphLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,blGlyphRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,blGlyphTop));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,blGlyphBottom));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,bsUp));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,bsDisabled));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,bsDown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,bsExclusive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,bsAutoDetect));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,bsWin31));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,bsNew));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,bkCustom));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,bkOK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,bkCancel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,bkHelp));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,bkYes));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,bkNo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,bkClose));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,bkAbort));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,bkRetry));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,bkIgnore));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,bkAll));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..1] of TClass = (
TBitBtn,
TSpeedButton
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..0] of string = (
'DrawButtonFace'
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
TypeInfo(Integer),
TypeInfo(TButtonStyle),
TypeInfo(Boolean),
TypeInfo(Boolean),
TypeInfo(Boolean),TypeInfo(IDispatch)],Addr(____DrawButtonFace__Wrapper),cRegister);

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
