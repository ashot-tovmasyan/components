{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit dcStdCtl_C3;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  activex,
  dcscript,
  consts,
  dcsystem,
  Messages,
  Windows,
  SysUtils,
  dcdreamlib,
  Classes,
  Controls,
  forms,
  stdctrls,
  extctrls,
  comctrls,
  Graphics,
  dccommon,
  dccontrols,
  dcconsts,
  checklst,
  dcstdctl;
function ConvertTSavePosToVariant(var R : TSavePos) : OleVariant;
function ConvertVariantToTSavePos(const V : OleVariant) : TSavePos;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TSavePos__Wrapper = class(TDCRecordWrapper)
private
fR : TSavePos;
public
function GetRecordPtr : pointer; override;
published
procedure setHeight(const val : Integer);
function getHeight : Integer;
property Height : Integer read getHeight write setHeight;
procedure setWidth(const val : Integer);
function getWidth : Integer;
property Width : Integer read getWidth write setWidth;
procedure setAlign(const val : TAlign);
function getAlign : TAlign;
property Align : TAlign read getAlign write setAlign;
end;
type
_T0 = procedure  of object;

function __TSavePos__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TSavePos__Wrapper.setHeight(const val : Integer);
begin
TSavePos(GetRecordPtr^).Height := val;
end;
function __TSavePos__Wrapper.getHeight : Integer;
begin
result := TSavePos(GetRecordPtr^).Height;
end;
procedure __TSavePos__Wrapper.setWidth(const val : Integer);
begin
TSavePos(GetRecordPtr^).Width := val;
end;
function __TSavePos__Wrapper.getWidth : Integer;
begin
result := TSavePos(GetRecordPtr^).Width;
end;
procedure __TSavePos__Wrapper.setAlign(const val : TAlign);
begin
TSavePos(GetRecordPtr^).Align := val;
end;
function __TSavePos__Wrapper.getAlign : TAlign;
begin
result := TSavePos(GetRecordPtr^).Align;
end;
function _TSavePos_ : IDispatch;
begin
  result := __TSavePos__Wrapper.Create;
end;

type __TSavePos__Wrapper__ = class(__TSavePos__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TSavePos__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTSavePosToVariant(var R : TSavePos) : OleVariant;
var
__rw : __TSavePos__Wrapper__;
begin
__rw := __TSavePos__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTSavePos(const V : OleVariant) : TSavePos;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TSavePos((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTCustomSplitterPanel__Panel1(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomSplitterPanel(Instance).Panel1);
end;

function __DC__GetTCustomSplitterPanel__Panel2(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomSplitterPanel(Instance).Panel2);
end;

function __DC__GetTDCFormPanel__Form(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCFormPanel(Instance).Form);
end;

procedure __DC__SetTDCFormPanel__Form(Instance : TObject; Params : PVariantArgList);
begin
TDCFormPanel(Instance).Form:=TCustomForm(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTDCFormParent__Form(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCFormParent(Instance).Form);
end;

procedure __DC__SetTDCFormParent__Form(Instance : TObject; Params : PVariantArgList);
begin
TDCFormParent(Instance).Form:=TCustomForm(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTDCFormTabSheet__Form(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCFormTabSheet(Instance).Form);
end;

procedure __DC__SetTDCFormTabSheet__Form(Instance : TObject; Params : PVariantArgList);
begin
TDCFormTabSheet(Instance).Form:=TCustomForm(VarToObject(OleVariant(Params^[0])));
end;

procedure __RegisterProps;
begin
RegisterProperty(TCustomSplitterPanel,'Panel1',__DC__GetTCustomSplitterPanel__Panel1,nil);
RegisterProperty(TCustomSplitterPanel,'Panel2',__DC__GetTCustomSplitterPanel__Panel2,nil);
RegisterProperty(TDCFormPanel,'Form',__DC__GetTDCFormPanel__Form,__DC__SetTDCFormPanel__Form);
RegisterProperty(TDCFormParent,'Form',__DC__GetTDCFormParent__Form,__DC__SetTDCFormParent__Form);
RegisterProperty(TDCFormTabSheet,'Form',__DC__GetTDCFormTabSheet__Form,__DC__SetTDCFormTabSheet__Form);
end;

const __ConstNames0 : array[0..3] of string = (
'spTop'
,'spBottom'
,'spLeft'
,'spRight'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,spTop));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,spBottom));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,spLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,spRight));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..8] of TClass = (
TCustomDCFormPanel,
TCustomSplitterPanel,
TDCCheckData,
TDCCheckListBox,
TDCFormPanel,
TDCFormParent,
TDCFormTabSheet,
TDCSplitPanel,
TDCSplitter
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
'TSavePos'
,'Register'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TSavePos_)));
RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T0),NoParams,Addr(Register),cRegister);

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
