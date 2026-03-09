{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit TOOLWIN_D3;
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
  ToolWin;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
function __DC__GetTToolWindow__BorderWidth(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TToolWindow(Instance).BorderWidth;
end;

procedure __DC__SetTToolWindow__BorderWidth(Instance : TObject; Params : PVariantArgList);
begin
TToolWindow(Instance).BorderWidth:=OleVariant(Params^[0]);
end;

function __DC__GetTToolWindow__EdgeBorders(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TEdgeBorders;
begin
tmp := TToolWindow(Instance).EdgeBorders;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTToolWindow__EdgeBorders(Instance : TObject; Params : PVariantArgList);
var
  tmp : TEdgeBorders;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TToolWindow(Instance).EdgeBorders:=tmp;
end;

function __DC__GetTToolWindow__EdgeInner(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TToolWindow(Instance).EdgeInner;
end;

procedure __DC__SetTToolWindow__EdgeInner(Instance : TObject; Params : PVariantArgList);
begin
TToolWindow(Instance).EdgeInner:=OleVariant(Params^[0]);
end;

function __DC__GetTToolWindow__EdgeOuter(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TToolWindow(Instance).EdgeOuter;
end;

procedure __DC__SetTToolWindow__EdgeOuter(Instance : TObject; Params : PVariantArgList);
begin
TToolWindow(Instance).EdgeOuter:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
RegisterProperty(TToolWindow,'BorderWidth',__DC__GetTToolWindow__BorderWidth,__DC__SetTToolWindow__BorderWidth);
RegisterProperty(TToolWindow,'EdgeBorders',__DC__GetTToolWindow__EdgeBorders,__DC__SetTToolWindow__EdgeBorders);
RegisterProperty(TToolWindow,'EdgeInner',__DC__GetTToolWindow__EdgeInner,__DC__SetTToolWindow__EdgeInner);
RegisterProperty(TToolWindow,'EdgeOuter',__DC__GetTToolWindow__EdgeOuter,__DC__SetTToolWindow__EdgeOuter);
end;

const __ConstNames0 : array[0..6] of string = (
'ebLeft'
,'ebTop'
,'ebRight'
,'ebBottom'
,'esNone'
,'esRaised'
,'esLowered'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,ebLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,ebTop));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,ebRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,ebBottom));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,esNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,esRaised));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,esLowered));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..0] of TClass = (
TToolWindow
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

procedure _mreg_0;
begin
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
