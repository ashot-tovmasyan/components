{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit STDACTNS_D6;
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
  SysUtils,
  Classes,
  ActnList,
  StdCtrls,
  Forms,
  Dialogs,
  StdActns;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
{_T0 = function : TCommonDialogClass of object;}

_T1 = function (p0 : TObject): TCustomEdit of object;

_T2 = procedure (p0 : TObject) of object;

_T3 = function (p0 : TObject): TForm of object;

function __DC__GetTCommonDialogAction__ExecuteResult(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCommonDialogAction(Instance).ExecuteResult;
end;

function __DC__GetTEditAction__Control(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TEditAction(Instance).Control);
end;

procedure __DC__SetTEditAction__Control(Instance : TObject; Params : PVariantArgList);
begin
TEditAction(Instance).Control:=TCustomEdit(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTWindowAction__Form(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TWindowAction(Instance).Form);
end;

procedure __DC__SetTWindowAction__Form(Instance : TObject; Params : PVariantArgList);
begin
TWindowAction(Instance).Form:=TForm(VarToObject(OleVariant(Params^[0])));
end;

procedure __RegisterProps;
begin
RegisterProperty(TCommonDialogAction,'ExecuteResult',__DC__GetTCommonDialogAction__ExecuteResult,nil);
RegisterProperty(TEditAction,'Control',__DC__GetTEditAction__Control,__DC__SetTEditAction__Control);
RegisterProperty(TWindowAction,'Form',__DC__GetTWindowAction__Form,__DC__SetTWindowAction__Form);
end;

procedure __RegisterConsts0;
begin
end;

procedure __UnregisterConsts0;
begin
end;

const ClassList : array[0..34] of TClass = (
TColorSelect,
TCommonDialogAction,
TEditAction,
TEditCopy,
TEditCut,
TEditDelete,
TEditPaste,
TEditSelectAll,
TEditUndo,
TFileAction,
TFileExit,
TFileOpen,
TFileOpenWith,
TFilePrintSetup,
TFileSaveAs,
TFontEdit,
THelpAction,
THelpContents,
THelpContextAction,
THelpOnHelp,
THelpTopicSearch,
THintAction,
TPrintDlg,
TSearchAction,
TSearchFind,
TSearchFindFirst,
TSearchFindNext,
TSearchReplace,
TWindowAction,
TWindowArrange,
TWindowCascade,
TWindowClose,
TWindowMinimizeAll,
TWindowTileHorizontal,
TWindowTileVertical
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
RegRegisterMethod(TEditAction,'GetControl',TypeInfo(_T1),[
TypeInfo(TObject),TypeInfo(TCustomEdit)], pointer(84));

RegRegisterMethod(TSearchAction,'Search',TypeInfo(_T2),[
TypeInfo(TObject)], pointer(88));

RegRegisterMethod(TWindowAction,'GetForm',TypeInfo(_T3),[
TypeInfo(TObject),TypeInfo(TForm)], pointer(84));

end;
initialization
_mreg_0;
{RegRegisterMethod(TCommonDialogAction,'GetDialogClass',TypeInfo(_T0),[TypeInfo(TCommonDialogClass)], pointer(84))}

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
end.
