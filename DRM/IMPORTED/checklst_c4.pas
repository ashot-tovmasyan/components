{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit CHECKLST_C4;
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
  Graphics,
  Controls,
  StdCtrls,
  CheckLst;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
_T0 = procedure  of object;

function __DC__GetTCheckListBox__Checked(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCheckListBox(Instance).Checked[OleVariant(Params^[0])];
end;

procedure __DC__SetTCheckListBox__Checked(Instance : TObject; Params : PVariantArgList);
begin
TCheckListBox(Instance).Checked[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTCheckListBox__State(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCheckListBox(Instance).State[OleVariant(Params^[0])];
end;

procedure __DC__SetTCheckListBox__State(Instance : TObject; Params : PVariantArgList);
begin
TCheckListBox(Instance).State[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
RegisterIndexedProperty(TCheckListBox,'Checked',1,False,__DC__GetTCheckListBox__Checked,__DC__SetTCheckListBox__Checked);
RegisterIndexedProperty(TCheckListBox,'State',1,False,__DC__GetTCheckListBox__State,__DC__SetTCheckListBox__State);
end;

procedure __RegisterConsts0;
begin
end;

procedure __UnregisterConsts0;
begin
end;

const ClassList : array[0..0] of TClass = (
TCheckListBox
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
RegRegisterMethod(TCheckListBox,'ClickCheck',TypeInfo(_T0),NoParams, pointer(MinVMTOffset - 75));

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
