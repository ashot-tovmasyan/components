{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit MIDASCON_C4;
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
  MConnect,
  SConnect,
  MidasCon;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
_T0 = procedure (p0 : TConnectType) of object;

_T1 = procedure (p0 : Boolean) of object;

procedure __RegisterProps;
begin
end;

const __ConstNames0 : array[0..2] of string = (
'ctDCOM'
,'ctSockets'
,'ctOLEnterprise'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,ctDCOM));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,ctSockets));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,ctOLEnterprise));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..1] of TClass = (
TMidasConnection,
TRemoteServer
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
RegRegisterMethod(TMidasConnection,'SetConnectType',TypeInfo(_T0),[
TypeInfo(TConnectType)], pointer(88));

RegRegisterMethod(TMidasConnection,'SetUseBroker',TypeInfo(_T1),[
TypeInfo(Boolean)], pointer(92));

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
