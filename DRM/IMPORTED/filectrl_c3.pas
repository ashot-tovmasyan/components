{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit FILECTRL_C3;
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
  Classes,
  Controls,
  Graphics,
  Forms,
  Menus,
  StdCtrls,
  Buttons,
  FileCtrl;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
_T0 = procedure (const p0 : string;
var p1 : Char;
var p2 : string;
var p3 : string) of object;

_T1 = function (const p0 : TFileName;
p1 : TCanvas;
p2 : Integer): TFileName of object;

_T2 = function (var p0 : string;
p1 : TSelectDirOpts;
p2 : Longint): Boolean of object;

_T3 = function (const p0 : string): Boolean of object;

_T4 = procedure (p0 : string) of object;

_T5 = procedure (const p0 : string) of object;

_T6 = procedure  of object;

_T7 = _T6;

_T8 = _T6;

_T9 = function (const p0 : string): string of object;

_T10 = function (const p0 : string;
const p1 : string): Integer of object;

_T11 = function (p0 : Integer): string of object;

_T12 = _T6;

_T13 = _T6;

_T14 = _T6;

_T15 = _T6;

_T16 = _T6;

_T17 = _T6;

_T18 = function : string of object;

_T19 = _T6;

_T20 = _T5;

function __DC__GetTDirectoryListBox__Drive(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDirectoryListBox(Instance).Drive;
end;

procedure __DC__SetTDirectoryListBox__Drive(Instance : TObject; Params : PVariantArgList);
begin
TDirectoryListBox(Instance).Drive:=VarToChar(OleVariant(Params^[0]));
end;

function __DC__GetTDirectoryListBox__Directory(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDirectoryListBox(Instance).Directory;
end;

procedure __DC__SetTDirectoryListBox__Directory(Instance : TObject; Params : PVariantArgList);
begin
TDirectoryListBox(Instance).Directory:=OleVariant(Params^[0]);
end;

function __DC__GetTDirectoryListBox__PreserveCase(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDirectoryListBox(Instance).PreserveCase;
end;

function __DC__GetTDirectoryListBox__CaseSensitive(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDirectoryListBox(Instance).CaseSensitive;
end;

function __DC__GetTDriveComboBox__Text(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDriveComboBox(Instance).Text;
end;

procedure __DC__SetTDriveComboBox__Text(Instance : TObject; Params : PVariantArgList);
begin
TDriveComboBox(Instance).Text:=OleVariant(Params^[0]);
end;

function __DC__GetTDriveComboBox__Drive(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDriveComboBox(Instance).Drive;
end;

procedure __DC__SetTDriveComboBox__Drive(Instance : TObject; Params : PVariantArgList);
begin
TDriveComboBox(Instance).Drive:=VarToChar(OleVariant(Params^[0]));
end;

function __DC__GetTFileListBox__Drive(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFileListBox(Instance).Drive;
end;

procedure __DC__SetTFileListBox__Drive(Instance : TObject; Params : PVariantArgList);
begin
TFileListBox(Instance).Drive:=VarToChar(OleVariant(Params^[0]));
end;

function __DC__GetTFileListBox__Directory(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFileListBox(Instance).Directory;
end;

procedure __DC__SetTFileListBox__Directory(Instance : TObject; Params : PVariantArgList);
begin
TFileListBox(Instance).Directory:=OleVariant(Params^[0]);
end;

function __DC__GetTFileListBox__FileName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFileListBox(Instance).FileName;
end;

procedure __DC__SetTFileListBox__FileName(Instance : TObject; Params : PVariantArgList);
begin
TFileListBox(Instance).FileName:=OleVariant(Params^[0]);
end;

function __DC__GetTFilterComboBox__Mask(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFilterComboBox(Instance).Mask;
end;

function __DC__GetTFilterComboBox__Text(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFilterComboBox(Instance).Text;
end;

procedure __DC__SetTFilterComboBox__Text(Instance : TObject; Params : PVariantArgList);
begin
TFilterComboBox(Instance).Text:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
RegisterProperty(TDirectoryListBox,'Drive',__DC__GetTDirectoryListBox__Drive,__DC__SetTDirectoryListBox__Drive);
RegisterProperty(TDirectoryListBox,'Directory',__DC__GetTDirectoryListBox__Directory,__DC__SetTDirectoryListBox__Directory);
RegisterProperty(TDirectoryListBox,'PreserveCase',__DC__GetTDirectoryListBox__PreserveCase,nil);
RegisterProperty(TDirectoryListBox,'CaseSensitive',__DC__GetTDirectoryListBox__CaseSensitive,nil);
RegisterProperty(TDriveComboBox,'Text',__DC__GetTDriveComboBox__Text,__DC__SetTDriveComboBox__Text);
RegisterProperty(TDriveComboBox,'Drive',__DC__GetTDriveComboBox__Drive,__DC__SetTDriveComboBox__Drive);
RegisterProperty(TFileListBox,'Drive',__DC__GetTFileListBox__Drive,__DC__SetTFileListBox__Drive);
RegisterProperty(TFileListBox,'Directory',__DC__GetTFileListBox__Directory,__DC__SetTFileListBox__Directory);
RegisterProperty(TFileListBox,'FileName',__DC__GetTFileListBox__FileName,__DC__SetTFileListBox__FileName);
RegisterProperty(TFilterComboBox,'Mask',__DC__GetTFilterComboBox__Mask,nil);
RegisterProperty(TFilterComboBox,'Text',__DC__GetTFilterComboBox__Text,__DC__SetTFilterComboBox__Text);
end;

const __ConstNames0 : array[0..19] of string = (
'ftReadOnly'
,'ftHidden'
,'ftSystem'
,'ftVolumeID'
,'ftDirectory'
,'ftArchive'
,'ftNormal'
,'dtUnknown'
,'dtNoDrive'
,'dtFloppy'
,'dtFixed'
,'dtNetwork'
,'dtCDROM'
,'dtRAM'
,'tcLowerCase'
,'tcUpperCase'
,'WNTYPE_DRIVE'
,'sdAllowCreate'
,'sdPerformCreate'
,'sdPrompt'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,ftReadOnly));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,ftHidden));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,ftSystem));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,ftVolumeID));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,ftDirectory));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,ftArchive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,ftNormal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,dtUnknown));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,dtNoDrive));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,dtFloppy));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,dtFixed));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,dtNetwork));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,dtCDROM));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,dtRAM));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,tcLowerCase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,tcUpperCase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,WNTYPE_DRIVE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,sdAllowCreate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,sdPerformCreate));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,sdPrompt));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..3] of TClass = (
TDirectoryListBox,
TDriveComboBox,
TFileListBox,
TFilterComboBox
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..4] of string = (
'ProcessPath'
,'MinimizeName'
,'SelectDirectory'
,'DirectoryExists'
,'ForceDirectories'
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
TypeInfo(Char),
TypeInfo(string),
TypeInfo(string)],Addr(ProcessPath),cRegister);

RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T1),[
TypeInfo(TFileName),
TypeInfo(TCanvas),
TypeInfo(Integer),TypeInfo(TFileName)],Addr(MinimizeName),cRegister);

RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T2),[
TypeInfo(string),
TypeInfo(TSelectDirOpts),
TypeInfo(Longint),TypeInfo(Boolean)],Addr(SelectDirectory),cRegister);

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T3),[
TypeInfo(string),TypeInfo(Boolean)],Addr(DirectoryExists),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T4),[
TypeInfo(string)],Addr(ForceDirectories),cRegister);

RegRegisterMethod(TDirectoryListBox,'SetDirectory',TypeInfo(_T5),[
TypeInfo(string)], pointer(136));

RegRegisterMethod(TDirectoryListBox,'Change',TypeInfo(_T6),NoParams, pointer(140));

RegRegisterMethod(TDirectoryListBox,'ReadBitmaps',TypeInfo(_T7),NoParams, pointer(144));

RegRegisterMethod(TDirectoryListBox,'BuildList',TypeInfo(_T8),NoParams, pointer(148));

RegRegisterMethod(TDirectoryListBox,'DisplayCase',TypeInfo(_T9),[
TypeInfo(string),TypeInfo(string)],Addr(TDirectoryListBox.DisplayCase));

RegRegisterMethod(TDirectoryListBox,'FileCompareText',TypeInfo(_T10),[
TypeInfo(string),
TypeInfo(string),TypeInfo(Integer)],Addr(TDirectoryListBox.FileCompareText));

RegRegisterMethod(TDirectoryListBox,'GetItemPath',TypeInfo(_T11),[
TypeInfo(Integer),TypeInfo(string)],Addr(TDirectoryListBox.GetItemPath));

RegRegisterMethod(TDirectoryListBox,'OpenCurrent',TypeInfo(_T12),NoParams,Addr(TDirectoryListBox.OpenCurrent));

RegRegisterMethod(TDirectoryListBox,'Update',TypeInfo(_T13),NoParams,Addr(TDirectoryListBox.Update));

RegRegisterMethod(TDriveComboBox,'BuildList',TypeInfo(_T14),NoParams, pointer(144));

RegRegisterMethod(TFileListBox,'ReadBitmaps',TypeInfo(_T15),NoParams, pointer(136));

RegRegisterMethod(TFileListBox,'Change',TypeInfo(_T16),NoParams, pointer(140));

RegRegisterMethod(TFileListBox,'ReadFileNames',TypeInfo(_T17),NoParams, pointer(144));

RegRegisterMethod(TFileListBox,'GetFilePath',TypeInfo(_T18),[TypeInfo(string)], pointer(148));

RegRegisterMethod(TFileListBox,'Update',TypeInfo(_T19),NoParams,Addr(TFileListBox.Update));

RegRegisterMethod(TFileListBox,'ApplyFilePath',TypeInfo(_T20),[
TypeInfo(string)], pointer(152));

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
