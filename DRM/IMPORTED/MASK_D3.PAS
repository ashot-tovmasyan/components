{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit MASK_D3;
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
  SysUtils,
  Classes,
  StdCtrls,
  Controls,
  Messages,
  Forms,
  Graphics,
  Menus,
  Mask;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
_T0 = function (const p0 : string;
const p1 : string): string of object;

_T1 = function (const p0 : string): Boolean of object;

_T2 = function (const p0 : string): Char of object;

_T3 = function (const p0 : string): Integer of object;

_T4 = function : Boolean of object;

_T5 = procedure  of object;

_T6 = _T5;

_T7 = _T5;

_T8 = function : Integer of object;

function __DC__GetTCustomMaskEdit__IsMasked(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMaskEdit(Instance).IsMasked;
end;

function __DC__GetTCustomMaskEdit__EditText(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMaskEdit(Instance).EditText;
end;

procedure __DC__SetTCustomMaskEdit__EditText(Instance : TObject; Params : PVariantArgList);
begin
TCustomMaskEdit(Instance).EditText:=OleVariant(Params^[0]);
end;

function __DC__GetTCustomMaskEdit__Text(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TCustomMaskEdit(Instance).Text;
end;

procedure __DC__SetTCustomMaskEdit__Text(Instance : TObject; Params : PVariantArgList);
begin
TCustomMaskEdit(Instance).Text:=OleVariant(Params^[0]);
end;

procedure __RegisterProps;
begin
RegisterProperty(TCustomMaskEdit,'IsMasked',__DC__GetTCustomMaskEdit__IsMasked,nil);
RegisterProperty(TCustomMaskEdit,'EditText',__DC__GetTCustomMaskEdit__EditText,__DC__SetTCustomMaskEdit__EditText);
RegisterProperty(TCustomMaskEdit,'Text',__DC__GetTCustomMaskEdit__Text,__DC__SetTCustomMaskEdit__Text);
end;

const __ConstNames0 : array[0..32] of string = (
'DefaultBlank'
,'MaskFieldSeparator'
,'MaskNoSave'
,'mDirReverse'
,'mDirUpperCase'
,'mDirLowerCase'
,'mDirLiteral'
,'mMskAlpha'
,'mMskAlphaOpt'
,'mMskAlphaNum'
,'mMskAlphaNumOpt'
,'mMskAscii'
,'mMskAsciiOpt'
,'mMskNumeric'
,'mMskNumericOpt'
,'mMskNumSymOpt'
,'mMskTimeSeparator'
,'mMskDateSeparator'
,'mcNone'
,'mcLiteral'
,'mcIntlLiteral'
,'mcDirective'
,'mcMask'
,'mcMaskOpt'
,'mcFieldSeparator'
,'mcField'
,'mdReverseDir'
,'mdUpperCase'
,'mdLowerCase'
,'mdLiteralChar'
,'msMasked'
,'msReEnter'
,'msDBSetText'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,DefaultBlank));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,MaskFieldSeparator));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,MaskNoSave));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,mDirReverse));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,mDirUpperCase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,mDirLowerCase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,mDirLiteral));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,mMskAlpha));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,mMskAlphaOpt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,mMskAlphaNum));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,mMskAlphaNumOpt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,mMskAscii));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,mMskAsciiOpt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,mMskNumeric));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,mMskNumericOpt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,mMskNumSymOpt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,mMskTimeSeparator));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,mMskDateSeparator));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,mcNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,mcLiteral));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,mcIntlLiteral));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,mcDirective));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,mcMask));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,mcMaskOpt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,mcFieldSeparator));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,mcField));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,mdReverseDir));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,mdUpperCase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,mdLowerCase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,mdLiteralChar));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,msMasked));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,msReEnter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,msDBSetText));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..2] of TClass = (
EDBEditError,
TCustomMaskEdit,
TMaskEdit
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..3] of string = (
'FormatMaskText'
,'MaskGetMaskSave'
,'MaskGetMaskBlank'
,'MaskGetFldSeparator'
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
TypeInfo(string),TypeInfo(string)],Addr(FormatMaskText),cRegister);

RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T1),[
TypeInfo(string),TypeInfo(Boolean)],Addr(MaskGetMaskSave),cRegister);

RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T2),[
TypeInfo(string),TypeInfo(Char)],Addr(MaskGetMaskBlank),cRegister);

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T3),[
TypeInfo(string),TypeInfo(Integer)],Addr(MaskGetFldSeparator),cRegister);

RegRegisterMethod(TCustomMaskEdit,'EditCanModify',TypeInfo(_T4),[TypeInfo(Boolean)], pointer(156));

RegRegisterMethod(TCustomMaskEdit,'Reset',TypeInfo(_T5),NoParams, pointer(160));

RegRegisterMethod(TCustomMaskEdit,'ValidateEdit',TypeInfo(_T6),NoParams,Addr(TCustomMaskEdit.ValidateEdit));

RegRegisterMethod(TCustomMaskEdit,'Clear',TypeInfo(_T7),NoParams,Addr(TCustomMaskEdit.Clear));

RegRegisterMethod(TCustomMaskEdit,'GetTextLen',TypeInfo(_T8),[TypeInfo(Integer)],Addr(TCustomMaskEdit.GetTextLen));

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
