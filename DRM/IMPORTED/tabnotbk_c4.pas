{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit TABNOTBK_C4;
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
  Stdctrls,
  Forms,
  Messages,
  Graphics,
  Controls,
  ComCtrls,
  Tabnotbk;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
_T0 = function (const p0 : string): Integer of object;

_T1 = procedure (p0 : TObject) of object;

function __DC__GetTTabbedNotebook__TopFont(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TTabbedNotebook(Instance).TopFont);
end;

procedure __RegisterProps;
begin
RegisterProperty(TTabbedNotebook,'TopFont',__DC__GetTTabbedNotebook__TopFont,nil);
end;

const __ConstNames0 : array[0..0] of string = (
'CM_TABFONTCHANGED'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,CM_TABFONTCHANGED));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..1] of TClass = (
TTabbedNotebook,
TTabPage
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
RegRegisterMethod(TTabbedNotebook,'GetIndexForPage',TypeInfo(_T0),[
TypeInfo(string),TypeInfo(Integer)],Addr(TTabbedNotebook.GetIndexForPage));

RegRegisterMethod(TTabbedNotebook,'TabFontChanged',TypeInfo(_T1),[
TypeInfo(TObject)],Addr(TTabbedNotebook.TabFontChanged));

end;
initialization
_mreg_0;
RegisterEvent(TypeInfo(TPageChangeEvent),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Boolean)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
end.
