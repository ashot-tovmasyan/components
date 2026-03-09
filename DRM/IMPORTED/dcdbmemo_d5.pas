{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit dcdbmemo_D5;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  activex,
  dcscript,
  windows,
  classes,
  sysutils,
  controls,
  messages,
  db,
  dbctrls,
  dcsystem,
  dcstring,
  dcmemo,
  dcdreamlib,
  dcconsts,
  dcdbmemo;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
_T0 = procedure  of object;

_T1 = _T0;

function __DC__GetTCustomDBMemoSource__Field(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDBMemoSource(Instance).Field);
end;

function __DC__GetTCustomDBMemoSource__AutoDisplay(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDBMemoSource(Instance).AutoDisplay;
end;

procedure __DC__SetTCustomDBMemoSource__AutoDisplay(Instance : TObject; Params : PVariantArgList);
begin
TCustomDBMemoSource(Instance).AutoDisplay:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDBMemoSource__DataField(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDBMemoSource(Instance).DataField;
end;

procedure __DC__SetTCustomDBMemoSource__DataField(Instance : TObject; Params : PVariantArgList);
begin
TCustomDBMemoSource(Instance).DataField:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDBMemoSource__DataSource(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDBMemoSource(Instance).DataSource);
end;

procedure __DC__SetTCustomDBMemoSource__DataSource(Instance : TObject; Params : PVariantArgList);
begin
TCustomDBMemoSource(Instance).DataSource:=TDataSource(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCustomDBMemoSource__ReadOnly(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDBMemoSource(Instance).ReadOnly;
end;

procedure __DC__SetTCustomDBMemoSource__ReadOnly(Instance : TObject; Params : PVariantArgList);
begin
TCustomDBMemoSource(Instance).ReadOnly:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCDBMemo__AutoDisplay(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCDBMemo(Instance).AutoDisplay;
end;

procedure __DC__SetTCustomDCDBMemo__AutoDisplay(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCDBMemo(Instance).AutoDisplay:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCDBMemo__DataField(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomDCDBMemo(Instance).DataField;
end;

procedure __DC__SetTCustomDCDBMemo__DataField(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCDBMemo(Instance).DataField:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomDCDBMemo__DataSource(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCustomDCDBMemo(Instance).DataSource);
end;

procedure __DC__SetTCustomDCDBMemo__DataSource(Instance : TObject; Params : PVariantArgList);
begin
TCustomDCDBMemo(Instance).DataSource:=TDataSource(VarToObject(OleVariant(Params^[0])));
end;

procedure __RegisterProps;
begin
RegisterProperty(TCustomDBMemoSource,'Field',__DC__GetTCustomDBMemoSource__Field,nil);
RegisterProperty(TCustomDBMemoSource,'AutoDisplay',__DC__GetTCustomDBMemoSource__AutoDisplay,__DC__SetTCustomDBMemoSource__AutoDisplay);
RegisterProperty(TCustomDBMemoSource,'DataField',__DC__GetTCustomDBMemoSource__DataField,__DC__SetTCustomDBMemoSource__DataField);
RegisterProperty(TCustomDBMemoSource,'DataSource',__DC__GetTCustomDBMemoSource__DataSource,__DC__SetTCustomDBMemoSource__DataSource);
RegisterProperty(TCustomDBMemoSource,'ReadOnly',__DC__GetTCustomDBMemoSource__ReadOnly,__DC__SetTCustomDBMemoSource__ReadOnly);
RegisterProperty(TCustomDCDBMemo,'AutoDisplay',__DC__GetTCustomDCDBMemo__AutoDisplay,__DC__SetTCustomDCDBMemo__AutoDisplay);
RegisterProperty(TCustomDCDBMemo,'DataField',__DC__GetTCustomDCDBMemo__DataField,__DC__SetTCustomDCDBMemo__DataField);
RegisterProperty(TCustomDCDBMemo,'DataSource',__DC__GetTCustomDCDBMemo__DataSource,__DC__SetTCustomDCDBMemo__DataSource);
end;

procedure __RegisterConsts0;
begin
end;

procedure __UnregisterConsts0;
begin
end;

const ClassList : array[0..3] of TClass = (
TCustomDBMemoSource,
TCustomDCDBMemo,
TDBMemoSource,
TDCDBMemo
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
'Register'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T0),NoParams,Addr(Register),cRegister);

RegRegisterMethod(TCustomDBMemoSource,'LoadMemo',TypeInfo(_T1),NoParams,Addr(TCustomDBMemoSource.LoadMemo));

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
