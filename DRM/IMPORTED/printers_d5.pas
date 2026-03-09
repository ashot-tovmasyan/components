{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit PRINTERS_D5;
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
  WinSpool,
  SysUtils,
  Classes,
  Graphics,
  Forms,
  Printers;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
_T0 = function : TPrinter of object;

_T1 = function (p0 : TPrinter): TPrinter of object;

{_T2 = procedure (var p0 : Text) of object;}

_T3 = procedure  of object;

_T4 = _T3;

_T5 = _T3;

_T6 = _T3;

_T7 = _T3;

{_T8 = procedure (p0 : PChar;
p1 : PChar;
p2 : PChar;
var p3 : THandle) of object;}

{_T9 = procedure (p0 : PChar;
p1 : PChar;
p2 : PChar;
p3 : THandle) of object;}

_T10 = _T3;

function __DC__GetTPrinter__Aborted(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinter(Instance).Aborted;
end;

function __DC__GetTPrinter__Canvas(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TPrinter(Instance).Canvas);
end;

function __DC__GetTPrinter__Capabilities(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TPrinterCapabilities;
begin
tmp := TPrinter(Instance).Capabilities;
result := VarFromSet(tmp, sizeof(tmp));
end;

function __DC__GetTPrinter__Copies(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinter(Instance).Copies;
end;

procedure __DC__SetTPrinter__Copies(Instance : TObject; Params : PVariantArgList);
begin
TPrinter(Instance).Copies:=OleVariant(Params^[0]);
end;

function __DC__GetTPrinter__Fonts(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TPrinter(Instance).Fonts);
end;

function __DC__GetTPrinter__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinter(Instance).Handle;
end;

function __DC__GetTPrinter__Orientation(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinter(Instance).Orientation;
end;

procedure __DC__SetTPrinter__Orientation(Instance : TObject; Params : PVariantArgList);
begin
TPrinter(Instance).Orientation:=OleVariant(Params^[0]);
end;

function __DC__GetTPrinter__PageHeight(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinter(Instance).PageHeight;
end;

function __DC__GetTPrinter__PageWidth(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinter(Instance).PageWidth;
end;

function __DC__GetTPrinter__PageNumber(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinter(Instance).PageNumber;
end;

function __DC__GetTPrinter__PrinterIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinter(Instance).PrinterIndex;
end;

procedure __DC__SetTPrinter__PrinterIndex(Instance : TObject; Params : PVariantArgList);
begin
TPrinter(Instance).PrinterIndex:=OleVariant(Params^[0]);
end;

function __DC__GetTPrinter__Printing(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinter(Instance).Printing;
end;

function __DC__GetTPrinter__Printers(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TPrinter(Instance).Printers);
end;

function __DC__GetTPrinter__Title(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPrinter(Instance).Title;
end;

procedure __DC__SetTPrinter__Title(Instance : TObject; Params : PVariantArgList);
begin
TPrinter(Instance).Title:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
RegisterProperty(TPrinter,'Aborted',__DC__GetTPrinter__Aborted,nil);
RegisterProperty(TPrinter,'Canvas',__DC__GetTPrinter__Canvas,nil);
RegisterProperty(TPrinter,'Capabilities',__DC__GetTPrinter__Capabilities,nil);
RegisterProperty(TPrinter,'Copies',__DC__GetTPrinter__Copies,__DC__SetTPrinter__Copies);
RegisterProperty(TPrinter,'Fonts',__DC__GetTPrinter__Fonts,nil);
RegisterProperty(TPrinter,'Handle',__DC__GetTPrinter__Handle,nil);
RegisterProperty(TPrinter,'Orientation',__DC__GetTPrinter__Orientation,__DC__SetTPrinter__Orientation);
RegisterProperty(TPrinter,'PageHeight',__DC__GetTPrinter__PageHeight,nil);
RegisterProperty(TPrinter,'PageWidth',__DC__GetTPrinter__PageWidth,nil);
RegisterProperty(TPrinter,'PageNumber',__DC__GetTPrinter__PageNumber,nil);
RegisterProperty(TPrinter,'PrinterIndex',__DC__GetTPrinter__PrinterIndex,__DC__SetTPrinter__PrinterIndex);
RegisterProperty(TPrinter,'Printing',__DC__GetTPrinter__Printing,nil);
RegisterProperty(TPrinter,'Printers',__DC__GetTPrinter__Printers,nil);
RegisterProperty(TPrinter,'Title',__DC__GetTPrinter__Title,__DC__SetTPrinter__Title);
end;

const __ConstNames0 : array[0..7] of string = (
'psNoHandle'
,'psHandleIC'
,'psHandleDC'
,'poPortrait'
,'poLandscape'
,'pcCopies'
,'pcOrientation'
,'pcCollation'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,psNoHandle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,psHandleIC));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,psHandleDC));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,poPortrait));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,poLandscape));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,pcCopies));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,pcOrientation));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,pcCollation));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..1] of TClass = (
EPrinter,
TPrinter
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
'Printer'
,'SetPrinter'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T0),[TypeInfo(TPrinter)],Addr(Printer),cRegister);

RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T1),[
TypeInfo(TPrinter),TypeInfo(TPrinter)],Addr(SetPrinter),cRegister);

RegisterProc(TPrinter,'Create',mtConstructor,TypeInfo(_T3),NoParams,Addr(TPrinter.Create),cRegister);

RegRegisterMethod(TPrinter,'Abort',TypeInfo(_T4),NoParams,Addr(TPrinter.Abort));

RegRegisterMethod(TPrinter,'BeginDoc',TypeInfo(_T5),NoParams,Addr(TPrinter.BeginDoc));

RegRegisterMethod(TPrinter,'EndDoc',TypeInfo(_T6),NoParams,Addr(TPrinter.EndDoc));

RegRegisterMethod(TPrinter,'NewPage',TypeInfo(_T7),NoParams,Addr(TPrinter.NewPage));

RegRegisterMethod(TPrinter,'Refresh',TypeInfo(_T10),NoParams,Addr(TPrinter.Refresh));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'AssignPrn',mtProc,TypeInfo(_T2),[
TypeInfo(Text)],Addr(AssignPrn),cRegister)}

{RegRegisterMethod(TPrinter,'GetPrinter',TypeInfo(_T8),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(THandle)],Addr(TPrinter.GetPrinter))}

{RegRegisterMethod(TPrinter,'SetPrinter',TypeInfo(_T9),[
TypeInfoPChar,
TypeInfoPChar,
TypeInfoPChar,
TypeInfo(THandle)],Addr(TPrinter.SetPrinter))}

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
