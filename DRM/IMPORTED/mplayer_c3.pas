{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit MPLAYER_C3;
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
  Controls,
  Forms,
  Graphics,
  Messages,
  MMSystem,
  Dialogs,
  SysUtils,
  MPlayer;
function ConvertTMPButtonToVariant(var R : TMPButton) : OleVariant;
function ConvertVariantToTMPButton(const V : OleVariant) : TMPButton;
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
type __TMPButton__Wrapper = class(TDCRecordWrapper)
private
fR : TMPButton;
public
function GetRecordPtr : pointer; override;
published
procedure setVisible(const val : Boolean);
function getVisible : Boolean;
property Visible : Boolean read getVisible write setVisible;
procedure setEnabled(const val : Boolean);
function getEnabled : Boolean;
property Enabled : Boolean read getEnabled write setEnabled;
procedure setColored(const val : Boolean);
function getColored : Boolean;
property Colored : Boolean read getColored write setColored;
procedure setAuto(const val : Boolean);
function getAuto : Boolean;
property Auto : Boolean read getAuto write setAuto;
end;
type
_T0 = procedure (p0 : TMPBtnType) of object;

_T1 = procedure (p0 : TMPBtnType;
var p1 : Boolean) of object;

_T2 = _T0;

_T3 = procedure  of object;

_T4 = _T3;

_T5 = _T3;

_T6 = _T3;

_T7 = _T3;

_T8 = _T3;

_T9 = _T3;

_T10 = _T3;

_T11 = _T3;

_T12 = _T3;

_T13 = _T3;

_T14 = _T3;

_T15 = _T3;

_T16 = _T3;

_T17 = _T3;

_T18 = _T3;

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
function __TMPButton__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TMPButton__Wrapper.setVisible(const val : Boolean);
begin
TMPButton(GetRecordPtr^).Visible := val;
end;
function __TMPButton__Wrapper.getVisible : Boolean;
begin
result := TMPButton(GetRecordPtr^).Visible;
end;
procedure __TMPButton__Wrapper.setEnabled(const val : Boolean);
begin
TMPButton(GetRecordPtr^).Enabled := val;
end;
function __TMPButton__Wrapper.getEnabled : Boolean;
begin
result := TMPButton(GetRecordPtr^).Enabled;
end;
procedure __TMPButton__Wrapper.setColored(const val : Boolean);
begin
TMPButton(GetRecordPtr^).Colored := val;
end;
function __TMPButton__Wrapper.getColored : Boolean;
begin
result := TMPButton(GetRecordPtr^).Colored;
end;
procedure __TMPButton__Wrapper.setAuto(const val : Boolean);
begin
TMPButton(GetRecordPtr^).Auto := val;
end;
function __TMPButton__Wrapper.getAuto : Boolean;
begin
result := TMPButton(GetRecordPtr^).Auto;
end;
function _TMPButton_ : IDispatch;
begin
  result := __TMPButton__Wrapper.Create;
end;

type __TMPButton__Wrapper__ = class(__TMPButton__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TMPButton__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTMPButtonToVariant(var R : TMPButton) : OleVariant;
var
__rw : __TMPButton__Wrapper__;
begin
__rw := __TMPButton__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTMPButton(const V : OleVariant) : TMPButton;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TMPButton((_idisp as IDCRecordWrapper).GetRecordPtr^);
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
function __DC__GetTMediaPlayer__TrackLength(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMediaPlayer(Instance).TrackLength[OleVariant(Params^[0])];
end;

function __DC__GetTMediaPlayer__TrackPosition(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMediaPlayer(Instance).TrackPosition[OleVariant(Params^[0])];
end;

function __DC__GetTMediaPlayer__Capabilities(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TMPDevCapsSet;
begin
tmp := TMediaPlayer(Instance).Capabilities;
result := VarFromSet(tmp, sizeof(tmp));
end;

function __DC__GetTMediaPlayer__Error(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMediaPlayer(Instance).Error;
end;

function __DC__GetTMediaPlayer__ErrorMessage(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMediaPlayer(Instance).ErrorMessage;
end;

function __DC__GetTMediaPlayer__Start(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMediaPlayer(Instance).Start;
end;

function __DC__GetTMediaPlayer__Length(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMediaPlayer(Instance).Length;
end;

function __DC__GetTMediaPlayer__Tracks(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMediaPlayer(Instance).Tracks;
end;

function __DC__GetTMediaPlayer__Frames(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMediaPlayer(Instance).Frames;
end;

procedure __DC__SetTMediaPlayer__Frames(Instance : TObject; Params : PVariantArgList);
begin
TMediaPlayer(Instance).Frames:=OleVariant(Params^[0]);
end;

function __DC__GetTMediaPlayer__Mode(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMediaPlayer(Instance).Mode;
end;

function __DC__GetTMediaPlayer__Position(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMediaPlayer(Instance).Position;
end;

procedure __DC__SetTMediaPlayer__Position(Instance : TObject; Params : PVariantArgList);
begin
TMediaPlayer(Instance).Position:=OleVariant(Params^[0]);
end;

function __DC__GetTMediaPlayer__Wait(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMediaPlayer(Instance).Wait;
end;

procedure __DC__SetTMediaPlayer__Wait(Instance : TObject; Params : PVariantArgList);
begin
TMediaPlayer(Instance).Wait:=OleVariant(Params^[0]);
end;

function __DC__GetTMediaPlayer__Notify(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMediaPlayer(Instance).Notify;
end;

procedure __DC__SetTMediaPlayer__Notify(Instance : TObject; Params : PVariantArgList);
begin
TMediaPlayer(Instance).Notify:=OleVariant(Params^[0]);
end;

function __DC__GetTMediaPlayer__NotifyValue(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMediaPlayer(Instance).NotifyValue;
end;

function __DC__GetTMediaPlayer__StartPos(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMediaPlayer(Instance).StartPos;
end;

procedure __DC__SetTMediaPlayer__StartPos(Instance : TObject; Params : PVariantArgList);
begin
TMediaPlayer(Instance).StartPos:=OleVariant(Params^[0]);
end;

function __DC__GetTMediaPlayer__EndPos(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMediaPlayer(Instance).EndPos;
end;

procedure __DC__SetTMediaPlayer__EndPos(Instance : TObject; Params : PVariantArgList);
begin
TMediaPlayer(Instance).EndPos:=OleVariant(Params^[0]);
end;

function __DC__GetTMediaPlayer__DeviceID(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMediaPlayer(Instance).DeviceID;
end;

function __DC__GetTMediaPlayer__TimeFormat(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TMediaPlayer(Instance).TimeFormat;
end;

procedure __DC__SetTMediaPlayer__TimeFormat(Instance : TObject; Params : PVariantArgList);
begin
TMediaPlayer(Instance).TimeFormat:=OleVariant(Params^[0]);
end;

function __DC__GetTMediaPlayer__DisplayRect(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
__wrapper : __TRect__Wrapper;
begin
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := TMediaPlayer(Instance).DisplayRect;
result := IUnknown(__wrapper) as IDispatch;
end;

procedure __DC__SetTMediaPlayer__DisplayRect(Instance : TObject; Params : PVariantArgList);
var
__idisp:IDispatch;
__iwrapper:IDCRecordWrapper;
begin
__idisp:=DCVarToInterface(OleVariant(Params^[0]));
if __idisp=nil then exit;
__idisp.QueryInterface(IDCRecordWrapper, __iwrapper);
TMediaPlayer(Instance).DisplayRect:=TRect(__iwrapper.GetRecordPtr^);
end;

procedure __RegisterProps;
begin
RegisterIndexedProperty(TMediaPlayer,'TrackLength',1,False,__DC__GetTMediaPlayer__TrackLength,nil);
RegisterIndexedProperty(TMediaPlayer,'TrackPosition',1,False,__DC__GetTMediaPlayer__TrackPosition,nil);
RegisterProperty(TMediaPlayer,'Capabilities',__DC__GetTMediaPlayer__Capabilities,nil);
RegisterProperty(TMediaPlayer,'Error',__DC__GetTMediaPlayer__Error,nil);
RegisterProperty(TMediaPlayer,'ErrorMessage',__DC__GetTMediaPlayer__ErrorMessage,nil);
RegisterProperty(TMediaPlayer,'Start',__DC__GetTMediaPlayer__Start,nil);
RegisterProperty(TMediaPlayer,'Length',__DC__GetTMediaPlayer__Length,nil);
RegisterProperty(TMediaPlayer,'Tracks',__DC__GetTMediaPlayer__Tracks,nil);
RegisterProperty(TMediaPlayer,'Frames',__DC__GetTMediaPlayer__Frames,__DC__SetTMediaPlayer__Frames);
RegisterProperty(TMediaPlayer,'Mode',__DC__GetTMediaPlayer__Mode,nil);
RegisterProperty(TMediaPlayer,'Position',__DC__GetTMediaPlayer__Position,__DC__SetTMediaPlayer__Position);
RegisterProperty(TMediaPlayer,'Wait',__DC__GetTMediaPlayer__Wait,__DC__SetTMediaPlayer__Wait);
RegisterProperty(TMediaPlayer,'Notify',__DC__GetTMediaPlayer__Notify,__DC__SetTMediaPlayer__Notify);
RegisterProperty(TMediaPlayer,'NotifyValue',__DC__GetTMediaPlayer__NotifyValue,nil);
RegisterProperty(TMediaPlayer,'StartPos',__DC__GetTMediaPlayer__StartPos,__DC__SetTMediaPlayer__StartPos);
RegisterProperty(TMediaPlayer,'EndPos',__DC__GetTMediaPlayer__EndPos,__DC__SetTMediaPlayer__EndPos);
RegisterProperty(TMediaPlayer,'DeviceID',__DC__GetTMediaPlayer__DeviceID,nil);
RegisterProperty(TMediaPlayer,'TimeFormat',__DC__GetTMediaPlayer__TimeFormat,__DC__SetTMediaPlayer__TimeFormat);
RegisterProperty(TMediaPlayer,'DisplayRect',__DC__GetTMediaPlayer__DisplayRect,__DC__SetTMediaPlayer__DisplayRect);
end;

const __ConstNames0 : array[0..51] of string = (
'btPlay'
,'btPause'
,'btStop'
,'btNext'
,'btPrev'
,'btStep'
,'btBack'
,'btRecord'
,'btEject'
,'mgEnabled'
,'mgDisabled'
,'mgColored'
,'dtAutoSelect'
,'dtAVIVideo'
,'dtCDAudio'
,'dtDAT'
,'dtDigitalVideo'
,'dtMMMovie'
,'dtOther'
,'dtOverlay'
,'dtScanner'
,'dtSequencer'
,'dtVCR'
,'dtVideodisc'
,'dtWaveAudio'
,'tfMilliseconds'
,'tfHMS'
,'tfMSF'
,'tfFrames'
,'tfSMPTE24'
,'tfSMPTE25'
,'tfSMPTE30'
,'tfSMPTE30Drop'
,'tfBytes'
,'tfSamples'
,'tfTMSF'
,'mpNotReady'
,'mpStopped'
,'mpPlaying'
,'mpRecording'
,'mpSeeking'
,'mpPaused'
,'mpOpen'
,'nvSuccessful'
,'nvSuperseded'
,'nvAborted'
,'nvFailure'
,'mpCanStep'
,'mpCanEject'
,'mpCanPlay'
,'mpCanRecord'
,'mpUsesWindow'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,btPlay));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,btPause));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,btStop));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,btNext));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,btPrev));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,btStep));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,btBack));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,btRecord));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,btEject));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,mgEnabled));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,mgDisabled));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,mgColored));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,dtAutoSelect));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,dtAVIVideo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,dtCDAudio));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,dtDAT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,dtDigitalVideo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,dtMMMovie));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,dtOther));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,dtOverlay));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,dtScanner));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,dtSequencer));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,dtVCR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,dtVideodisc));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,dtWaveAudio));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,tfMilliseconds));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,tfHMS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,tfMSF));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,tfFrames));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,tfSMPTE24));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,tfSMPTE25));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,tfSMPTE30));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,tfSMPTE30Drop));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,tfBytes));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,tfSamples));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,tfTMSF));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,mpNotReady));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,mpStopped));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,mpPlaying));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,mpRecording));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,mpSeeking));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,mpPaused));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,mpOpen));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,nvSuccessful));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,nvSuperseded));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,nvAborted));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,nvFailure));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,mpCanStep));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[48] ,mpCanEject));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[49] ,mpCanPlay));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[50] ,mpCanRecord));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[51] ,mpUsesWindow));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..1] of TClass = (
EMCIDeviceError,
TMediaPlayer
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
'TMPButton'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TMPButton_)));
RegRegisterMethod(TMediaPlayer,'AutoButtonSet',TypeInfo(_T0),[
TypeInfo(TMPBtnType)], pointer(MinVMTOffset - 36));

RegRegisterMethod(TMediaPlayer,'Click',TypeInfo(_T1),[
TypeInfo(TMPBtnType),
TypeInfo(Boolean)], pointer(MinVMTOffset - 37));

RegRegisterMethod(TMediaPlayer,'PostClick',TypeInfo(_T2),[
TypeInfo(TMPBtnType)], pointer(MinVMTOffset - 38));

RegRegisterMethod(TMediaPlayer,'DoNotify',TypeInfo(_T3),NoParams, pointer(MinVMTOffset - 39));

RegRegisterMethod(TMediaPlayer,'Open',TypeInfo(_T4),NoParams,Addr(TMediaPlayer.Open));

RegRegisterMethod(TMediaPlayer,'Close',TypeInfo(_T5),NoParams,Addr(TMediaPlayer.Close));

RegRegisterMethod(TMediaPlayer,'Play',TypeInfo(_T6),NoParams,Addr(TMediaPlayer.Play));

RegRegisterMethod(TMediaPlayer,'Stop',TypeInfo(_T7),NoParams,Addr(TMediaPlayer.Stop));

RegRegisterMethod(TMediaPlayer,'Pause',TypeInfo(_T8),NoParams,Addr(TMediaPlayer.Pause));

RegRegisterMethod(TMediaPlayer,'Step',TypeInfo(_T9),NoParams,Addr(TMediaPlayer.Step));

RegRegisterMethod(TMediaPlayer,'Back',TypeInfo(_T10),NoParams,Addr(TMediaPlayer.Back));

RegRegisterMethod(TMediaPlayer,'Previous',TypeInfo(_T11),NoParams,Addr(TMediaPlayer.Previous));

RegRegisterMethod(TMediaPlayer,'Next',TypeInfo(_T12),NoParams,Addr(TMediaPlayer.Next));

RegRegisterMethod(TMediaPlayer,'StartRecording',TypeInfo(_T13),NoParams,Addr(TMediaPlayer.StartRecording));

RegRegisterMethod(TMediaPlayer,'Eject',TypeInfo(_T14),NoParams,Addr(TMediaPlayer.Eject));

RegRegisterMethod(TMediaPlayer,'Save',TypeInfo(_T15),NoParams,Addr(TMediaPlayer.Save));

RegRegisterMethod(TMediaPlayer,'PauseOnly',TypeInfo(_T16),NoParams,Addr(TMediaPlayer.PauseOnly));

RegRegisterMethod(TMediaPlayer,'Resume',TypeInfo(_T17),NoParams,Addr(TMediaPlayer.Resume));

RegRegisterMethod(TMediaPlayer,'Rewind',TypeInfo(_T18),NoParams,Addr(TMediaPlayer.Rewind));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
RegisterEvent(TypeInfo(EMPNotify),[
TypeInfo(TObject),
TypeInfo(TMPBtnType),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(EMPPostNotify),[
TypeInfo(TObject),
TypeInfo(TMPBtnType)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
