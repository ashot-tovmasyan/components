{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit STDACTNS_D4;
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
  Classes,
  ActnList,
  StdCtrls,
  Forms,
  StdActns;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
_T0 = function (p0 : TObject): TCustomEdit of object;

_T1 = function (p0 : TObject): TForm of object;

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
RegisterProperty(TEditAction,'Control',__DC__GetTEditAction__Control,__DC__SetTEditAction__Control);
RegisterProperty(TWindowAction,'Form',__DC__GetTWindowAction__Form,__DC__SetTWindowAction__Form);
end;

procedure __RegisterConsts0;
begin
end;

procedure __UnregisterConsts0;
begin
end;

const ClassList : array[0..11] of TClass = (
TEditAction,
TEditCopy,
TEditCut,
TEditPaste,
THintAction,
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
RegRegisterMethod(TEditAction,'GetControl',TypeInfo(_T0),[
TypeInfo(TObject),TypeInfo(TCustomEdit)], pointer(72));

RegRegisterMethod(TWindowAction,'GetForm',TypeInfo(_T1),[
TypeInfo(TObject),TypeInfo(TForm)], pointer(72));

end;
initialization
_mreg_0;
__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
end.
