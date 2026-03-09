{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit MIDPROD_C5;
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
  Messages,
  ImgList,
  HTTPApp,
  PagItems,
  XMLBrokr,
  CompProd,
  WebComp,
  SysUtils,
  MidProd;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
{_T0 = procedure (p0 : TStdIncludes;
p1 : IAddScriptElements) of object;}

_T1 = function (const p0 : string): string of object;

{_T2 = function (p0 : TComponent;
p1 : TClass): Boolean of object;}

_T3 = procedure  of object;

_T4 = function : string of object;

_T5 = function : Boolean of object;

_T6 = _T4;

_T7 = _T4;

_T8 = _T4;

_T9 = _T4;

_T10 = _T4;

_T11 = _T4;

_T12 = function (p0 : TStrings): string of object;

_T13 = function (p0 : Boolean): string of object;

_T14 = _T3;

_T15 = _T3;

_T16 = function (p0 : TWebContentOptions): TObject of object;

_T17 = function : TMidasPageElements of object;

_T18 = function (p0 : TStrings): TXMLBroker of object;

_T19 = _T12;

_T20 = function (p0 : TXMLBroker;
p1 : TXMLOptions): string of object;

_T21 = procedure (const p0 : string) of object;

_T22 = procedure (p0 : TStrings) of object;

_T23 = procedure (const p0 : TFileName) of object;

_T24 = _T4;

function __DC__GetTCustomMidasPageProducer__IncludePathURL(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMidasPageProducer(Instance).IncludePathURL;
end;

procedure __DC__SetTCustomMidasPageProducer__IncludePathURL(Instance : TObject; Params : PVariantArgList);
begin
TCustomMidasPageProducer(Instance).IncludePathURL:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMidasPageProducer__Styles(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomMidasPageProducer(Instance).Styles);
end;

procedure __DC__SetTCustomMidasPageProducer__Styles(Instance : TObject; Params : PVariantArgList);
begin
TCustomMidasPageProducer(Instance).Styles:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomMidasPageProducer__StylesFile(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMidasPageProducer(Instance).StylesFile;
end;

procedure __DC__SetTCustomMidasPageProducer__StylesFile(Instance : TObject; Params : PVariantArgList);
begin
TCustomMidasPageProducer(Instance).StylesFile:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMidasPageProducer__EnableXMLIslands(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMidasPageProducer(Instance).EnableXMLIslands;
end;

procedure __DC__SetTCustomMidasPageProducer__EnableXMLIslands(Instance : TObject; Params : PVariantArgList);
begin
TCustomMidasPageProducer(Instance).EnableXMLIslands:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
RegisterProperty(TCustomMidasPageProducer,'IncludePathURL',__DC__GetTCustomMidasPageProducer__IncludePathURL,__DC__SetTCustomMidasPageProducer__IncludePathURL);
RegisterProperty(TCustomMidasPageProducer,'Styles',__DC__GetTCustomMidasPageProducer__Styles,__DC__SetTCustomMidasPageProducer__Styles);
RegisterProperty(TCustomMidasPageProducer,'StylesFile',__DC__GetTCustomMidasPageProducer__StylesFile,__DC__SetTCustomMidasPageProducer__StylesFile);
RegisterProperty(TCustomMidasPageProducer,'EnableXMLIslands',__DC__GetTCustomMidasPageProducer__EnableXMLIslands,__DC__SetTCustomMidasPageProducer__EnableXMLIslands);
end;

const __ConstNames0 : array[0..7] of string = (
'jsDom'
,'jsDB'
,'jsDisp'
,'jsBind'
,'jsErrDisp'
,'jsShow'
,'sXMLBroker'
,'sXMLReadyVar'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,jsDom));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,jsDB));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,jsDisp));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,jsBind));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,jsErrDisp));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,jsShow));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,sXMLBroker));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,sXMLReadyVar));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..2] of TClass = (
TCustomMidasPageProducer,
TMidasPageElements,
TMidasPageProducer
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
'PathInfoToRelativePath'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T1),[
TypeInfo(string),TypeInfo(string)],Addr(PathInfoToRelativePath),cRegister);

RegRegisterMethod(TCustomMidasPageProducer,'GeneratePageElements',TypeInfo(_T3),NoParams, pointer(84));

RegRegisterMethod(TCustomMidasPageProducer,'GetDefaultTemplate',TypeInfo(_T4),[TypeInfo(string)], pointer(88));

RegRegisterMethod(TCustomMidasPageProducer,'GetUseXMLIslands',TypeInfo(_T5),[TypeInfo(Boolean)], pointer(92));

RegRegisterMethod(TCustomMidasPageProducer,'DeclareRowSets',TypeInfo(_T6),[TypeInfo(string)], pointer(96));

RegRegisterMethod(TCustomMidasPageProducer,'DeclareXMLDocuments',TypeInfo(_T7),[TypeInfo(string)], pointer(100));

RegRegisterMethod(TCustomMidasPageProducer,'DeclareXMLIslands',TypeInfo(_T8),[TypeInfo(string)], pointer(104));

RegRegisterMethod(TCustomMidasPageProducer,'DeclareIncludes',TypeInfo(_T9),[TypeInfo(string)], pointer(108));

RegRegisterMethod(TCustomMidasPageProducer,'DeclareStyles',TypeInfo(_T10),[TypeInfo(string)], pointer(112));

RegRegisterMethod(TCustomMidasPageProducer,'DeclareFunctions',TypeInfo(_T11),[TypeInfo(string)], pointer(116));

RegRegisterMethod(TCustomMidasPageProducer,'DeclareWarnings',TypeInfo(_T12),[
TypeInfo(TStrings),TypeInfo(string)], pointer(120));

RegRegisterMethod(TCustomMidasPageProducer,'DeclareScript',TypeInfo(_T13),[
TypeInfo(Boolean),TypeInfo(string)], pointer(124));

RegRegisterMethod(TCustomMidasPageProducer,'AddScriptComponents',TypeInfo(_T14),NoParams, pointer(128));

RegRegisterMethod(TCustomMidasPageProducer,'AddIncludes',TypeInfo(_T15),NoParams, pointer(132));

RegRegisterMethod(TCustomMidasPageProducer,'CreateScriptManager',TypeInfo(_T16),[
TypeInfo(TWebContentOptions),TypeInfo(TObject)], pointer(136));

RegRegisterMethod(TCustomMidasPageProducer,'CreatePageElements',TypeInfo(_T17),[TypeInfo(TMidasPageElements)], pointer(140));

RegRegisterMethod(TCustomMidasPageProducer,'FindXMLBroker',TypeInfo(_T18),[
TypeInfo(TStrings),TypeInfo(TXMLBroker)], pointer(144));

RegRegisterMethod(TCustomMidasPageProducer,'FindXMLBrokerName',TypeInfo(_T19),[
TypeInfo(TStrings),TypeInfo(string)], pointer(148));

RegRegisterMethod(TCustomMidasPageProducer,'GetXMLData',TypeInfo(_T20),[
TypeInfo(TXMLBroker),
TypeInfo(TXMLOptions),TypeInfo(string)], pointer(152));

RegRegisterMethod(TCustomMidasPageProducer,'SetIncludePathURL',TypeInfo(_T21),[
TypeInfo(string)],Addr(TCustomMidasPageProducer.SetIncludePathURL));

RegRegisterMethod(TCustomMidasPageProducer,'SetStyles',TypeInfo(_T22),[
TypeInfo(TStrings)],Addr(TCustomMidasPageProducer.SetStyles));

RegRegisterMethod(TCustomMidasPageProducer,'SetStylesFile',TypeInfo(_T23),[
TypeInfo(TFileName)],Addr(TCustomMidasPageProducer.SetStylesFile));

RegRegisterMethod(TMidasPageElements,'BodyContent',TypeInfo(_T24),[TypeInfo(string)], pointer(0));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'AddStdIncludes',mtProc,TypeInfo(_T0),[
TypeInfo(TStdIncludes),
TypeInfo(IAddScriptElements)],Addr(AddStdIncludes),cRegister)}

{RegRegisterMethod(TCustomMidasPageProducer,'ImplCanAddClass',TypeInfo(_T2),[
TypeInfo(TComponent),
TypeInfo(TClass),TypeInfo(Boolean)], pointer(80))}

RegisterEvent(TypeInfo(TXMLDataEvent),[
TypeInfo(TObject),
TypeInfo(TWebRequest),
TypeInfo(TXMLBroker),
TypeInfo(OleVariant)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
