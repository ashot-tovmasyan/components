{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit DBCTRLS_C3;
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
  Messages,
  Classes,
  Controls,
  Forms,
  Graphics,
  Menus,
  StdCtrls,
  ExtCtrls,
  Mask,
  Buttons,
  ComCtrls,
  Db,
  DBCtrls;
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

_T2 = _T0;

_T3 = _T0;

_T4 = procedure (p0 : Boolean) of object;

_T5 = _T0;

_T6 = _T0;

_T7 = _T0;

_T8 = _T0;

_T9 = _T0;

_T10 = procedure (p0 : TNavigateBtn) of object;

_T11 = _T0;

_T12 = _T0;

_T13 = function : Boolean of object;

_T14 = _T0;

_T15 = _T0;

_T16 = procedure (p0 : TDBNavigator) of object;

_T17 = procedure (p0 : TWinControl;
const p1 : string) of object;

_T18 = _T0;

function __DC__GetTDBCheckBox__Checked(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDBCheckBox(Instance).Checked;
end;

procedure __DC__SetTDBCheckBox__Checked(Instance : TObject; Params : PVariantArgList);
begin
TDBCheckBox(Instance).Checked:=OleVariant(Params^[0]);
end;

function __DC__GetTDBCheckBox__Field(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDBCheckBox(Instance).Field);
end;

function __DC__GetTDBCheckBox__State(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDBCheckBox(Instance).State;
end;

procedure __DC__SetTDBCheckBox__State(Instance : TObject; Params : PVariantArgList);
begin
TDBCheckBox(Instance).State:=OleVariant(Params^[0]);
end;

function __DC__GetTDBComboBox__Field(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDBComboBox(Instance).Field);
end;

function __DC__GetTDBComboBox__Text(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDBComboBox(Instance).Text;
end;

procedure __DC__SetTDBComboBox__Text(Instance : TObject; Params : PVariantArgList);
begin
TDBComboBox(Instance).Text:=OleVariant(Params^[0]);
end;

function __DC__GetTDBEdit__Field(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDBEdit(Instance).Field);
end;

function __DC__GetTDBImage__Field(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDBImage(Instance).Field);
end;

function __DC__GetTDBImage__Picture(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDBImage(Instance).Picture);
end;

procedure __DC__SetTDBImage__Picture(Instance : TObject; Params : PVariantArgList);
begin
TDBImage(Instance).Picture:=TPicture(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTDBListBox__Field(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDBListBox(Instance).Field);
end;

function __DC__GetTDBLookupComboBox__KeyValue(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDBLookupComboBox(Instance).KeyValue;
end;

procedure __DC__SetTDBLookupComboBox__KeyValue(Instance : TObject; Params : PVariantArgList);
begin
TDBLookupComboBox(Instance).KeyValue:=OleVariant(Params^[0]);
end;

function __DC__GetTDBLookupComboBox__ListVisible(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDBLookupComboBox(Instance).ListVisible;
end;

function __DC__GetTDBLookupComboBox__Text(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDBLookupComboBox(Instance).Text;
end;

function __DC__GetTDBLookupControl__Field(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDBLookupControl(Instance).Field);
end;

function __DC__GetTDBLookupListBox__KeyValue(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDBLookupListBox(Instance).KeyValue;
end;

procedure __DC__SetTDBLookupListBox__KeyValue(Instance : TObject; Params : PVariantArgList);
begin
TDBLookupListBox(Instance).KeyValue:=OleVariant(Params^[0]);
end;

function __DC__GetTDBLookupListBox__SelectedItem(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDBLookupListBox(Instance).SelectedItem;
end;

function __DC__GetTDBMemo__Field(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDBMemo(Instance).Field);
end;

function __DC__GetTDBRadioGroup__Field(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDBRadioGroup(Instance).Field);
end;

function __DC__GetTDBRadioGroup__ItemIndex(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDBRadioGroup(Instance).ItemIndex;
end;

procedure __DC__SetTDBRadioGroup__ItemIndex(Instance : TObject; Params : PVariantArgList);
begin
TDBRadioGroup(Instance).ItemIndex:=OleVariant(Params^[0]);
end;

function __DC__GetTDBRadioGroup__Value(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDBRadioGroup(Instance).Value;
end;

procedure __DC__SetTDBRadioGroup__Value(Instance : TObject; Params : PVariantArgList);
begin
TDBRadioGroup(Instance).Value:=OleVariant(Params^[0]);
end;

function __DC__GetTDBRichEdit__Field(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDBRichEdit(Instance).Field);
end;

function __DC__GetTDBText__Field(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDBText(Instance).Field);
end;

function __DC__GetTFieldDataLink__CanModify(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFieldDataLink(Instance).CanModify;
end;

function __DC__GetTFieldDataLink__Control(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TFieldDataLink(Instance).Control);
end;

procedure __DC__SetTFieldDataLink__Control(Instance : TObject; Params : PVariantArgList);
begin
TFieldDataLink(Instance).Control:=TComponent(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTFieldDataLink__Editing(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFieldDataLink(Instance).Editing;
end;

function __DC__GetTFieldDataLink__Field(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TFieldDataLink(Instance).Field);
end;

function __DC__GetTFieldDataLink__FieldName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFieldDataLink(Instance).FieldName;
end;

procedure __DC__SetTFieldDataLink__FieldName(Instance : TObject; Params : PVariantArgList);
begin
TFieldDataLink(Instance).FieldName:=OleVariant(Params^[0]);
end;

function __DC__GetTNavButton__NavStyle(Instance : TObject; Params : PVariantArgList) : OleVariant;
var
  tmp : TNavButtonStyle;
begin
tmp := TNavButton(Instance).NavStyle;
result := VarFromSet(tmp, sizeof(tmp));
end;

procedure __DC__SetTNavButton__NavStyle(Instance : TObject; Params : PVariantArgList);
var
  tmp : TNavButtonStyle;
begin
VarToSet(tmp, sizeof(tmp), Variant(Params^[0]));
TNavButton(Instance).NavStyle:=tmp;
end;

function __DC__GetTNavButton__Index(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TNavButton(Instance).Index;
end;

procedure __DC__SetTNavButton__Index(Instance : TObject; Params : PVariantArgList);
begin
TNavButton(Instance).Index:=OleVariant(Params^[0]);
end;

function __DC__GetTPaintControl__Ctl3DButton(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPaintControl(Instance).Ctl3DButton;
end;

procedure __DC__SetTPaintControl__Ctl3DButton(Instance : TObject; Params : PVariantArgList);
begin
TPaintControl(Instance).Ctl3DButton:=OleVariant(Params^[0]);
end;

function __DC__GetTPaintControl__Handle(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TPaintControl(Instance).Handle;
end;

procedure __RegisterProps;
begin
RegisterProperty(TDBCheckBox,'Checked',__DC__GetTDBCheckBox__Checked,__DC__SetTDBCheckBox__Checked);
RegisterProperty(TDBCheckBox,'Field',__DC__GetTDBCheckBox__Field,nil);
RegisterProperty(TDBCheckBox,'State',__DC__GetTDBCheckBox__State,__DC__SetTDBCheckBox__State);
RegisterProperty(TDBComboBox,'Field',__DC__GetTDBComboBox__Field,nil);
RegisterProperty(TDBComboBox,'Text',__DC__GetTDBComboBox__Text,__DC__SetTDBComboBox__Text);
RegisterProperty(TDBEdit,'Field',__DC__GetTDBEdit__Field,nil);
RegisterProperty(TDBImage,'Field',__DC__GetTDBImage__Field,nil);
RegisterProperty(TDBImage,'Picture',__DC__GetTDBImage__Picture,__DC__SetTDBImage__Picture);
RegisterProperty(TDBListBox,'Field',__DC__GetTDBListBox__Field,nil);
RegisterProperty(TDBLookupComboBox,'KeyValue',__DC__GetTDBLookupComboBox__KeyValue,__DC__SetTDBLookupComboBox__KeyValue);
RegisterProperty(TDBLookupComboBox,'ListVisible',__DC__GetTDBLookupComboBox__ListVisible,nil);
RegisterProperty(TDBLookupComboBox,'Text',__DC__GetTDBLookupComboBox__Text,nil);
RegisterProperty(TDBLookupControl,'Field',__DC__GetTDBLookupControl__Field,nil);
RegisterProperty(TDBLookupListBox,'KeyValue',__DC__GetTDBLookupListBox__KeyValue,__DC__SetTDBLookupListBox__KeyValue);
RegisterProperty(TDBLookupListBox,'SelectedItem',__DC__GetTDBLookupListBox__SelectedItem,nil);
RegisterProperty(TDBMemo,'Field',__DC__GetTDBMemo__Field,nil);
RegisterProperty(TDBRadioGroup,'Field',__DC__GetTDBRadioGroup__Field,nil);
RegisterProperty(TDBRadioGroup,'ItemIndex',__DC__GetTDBRadioGroup__ItemIndex,__DC__SetTDBRadioGroup__ItemIndex);
RegisterProperty(TDBRadioGroup,'Value',__DC__GetTDBRadioGroup__Value,__DC__SetTDBRadioGroup__Value);
RegisterProperty(TDBRichEdit,'Field',__DC__GetTDBRichEdit__Field,nil);
RegisterProperty(TDBText,'Field',__DC__GetTDBText__Field,nil);
RegisterProperty(TFieldDataLink,'CanModify',__DC__GetTFieldDataLink__CanModify,nil);
RegisterProperty(TFieldDataLink,'Control',__DC__GetTFieldDataLink__Control,__DC__SetTFieldDataLink__Control);
RegisterProperty(TFieldDataLink,'Editing',__DC__GetTFieldDataLink__Editing,nil);
RegisterProperty(TFieldDataLink,'Field',__DC__GetTFieldDataLink__Field,nil);
RegisterProperty(TFieldDataLink,'FieldName',__DC__GetTFieldDataLink__FieldName,__DC__SetTFieldDataLink__FieldName);
RegisterProperty(TNavButton,'NavStyle',__DC__GetTNavButton__NavStyle,__DC__SetTNavButton__NavStyle);
RegisterProperty(TNavButton,'Index',__DC__GetTNavButton__Index,__DC__SetTNavButton__Index);
RegisterProperty(TPaintControl,'Ctl3DButton',__DC__GetTPaintControl__Ctl3DButton,__DC__SetTPaintControl__Ctl3DButton);
RegisterProperty(TPaintControl,'Handle',__DC__GetTPaintControl__Handle,nil);
end;

const __ConstNames0 : array[0..19] of string = (
'InitRepeatPause'
,'RepeatPause'
,'SpaceSize'
,'ngEnabled'
,'ngDisabled'
,'nbFirst'
,'nbPrior'
,'nbNext'
,'nbLast'
,'nbInsert'
,'nbDelete'
,'nbEdit'
,'nbPost'
,'nbCancel'
,'nbRefresh'
,'nsAllowTimer'
,'nsFocusRect'
,'daLeft'
,'daRight'
,'daCenter'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,InitRepeatPause));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,RepeatPause));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,SpaceSize));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,ngEnabled));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,ngDisabled));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,nbFirst));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,nbPrior));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,nbNext));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,nbLast));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,nbInsert));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,nbDelete));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,nbEdit));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,nbPost));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,nbCancel));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,nbRefresh));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,nsAllowTimer));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,nsFocusRect));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,daLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,daRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,daCenter));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..19] of TClass = (
TDataSourceLink,
TDBCheckBox,
TDBComboBox,
TDBEdit,
TDBImage,
TDBListBox,
TDBLookupComboBox,
TDBLookupControl,
TDBLookupListBox,
TDBMemo,
TDBNavigator,
TDBRadioGroup,
TDBRichEdit,
TDBText,
TFieldDataLink,
TListSourceLink,
TNavButton,
TNavDataLink,
TPaintControl,
TPopupDataList
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
RegRegisterMethod(TDBImage,'CopyToClipboard',TypeInfo(_T0),NoParams,Addr(TDBImage.CopyToClipboard));

RegRegisterMethod(TDBImage,'CutToClipboard',TypeInfo(_T1),NoParams,Addr(TDBImage.CutToClipboard));

RegRegisterMethod(TDBImage,'LoadPicture',TypeInfo(_T2),NoParams,Addr(TDBImage.LoadPicture));

RegRegisterMethod(TDBImage,'PasteFromClipboard',TypeInfo(_T3),NoParams,Addr(TDBImage.PasteFromClipboard));

RegRegisterMethod(TDBLookupComboBox,'CloseUp',TypeInfo(_T4),[
TypeInfo(Boolean)],Addr(TDBLookupComboBox.CloseUp));

RegRegisterMethod(TDBLookupComboBox,'DropDown',TypeInfo(_T5),NoParams,Addr(TDBLookupComboBox.DropDown));

RegRegisterMethod(TDBLookupControl,'KeyValueChanged',TypeInfo(_T6),NoParams, pointer(132));

RegRegisterMethod(TDBLookupControl,'ListLinkActiveChanged',TypeInfo(_T7),NoParams, pointer(136));

RegRegisterMethod(TDBLookupControl,'ListLinkDataChanged',TypeInfo(_T8),NoParams, pointer(140));

RegRegisterMethod(TDBMemo,'LoadMemo',TypeInfo(_T9),NoParams,Addr(TDBMemo.LoadMemo));

RegRegisterMethod(TDBNavigator,'BtnClick',TypeInfo(_T10),[
TypeInfo(TNavigateBtn)],Addr(TDBNavigator.BtnClick));

RegRegisterMethod(TDBRadioGroup,'Change',TypeInfo(_T11),NoParams, pointer(MinVMTOffset - 36));

RegRegisterMethod(TDBRichEdit,'LoadMemo',TypeInfo(_T12),NoParams,Addr(TDBRichEdit.LoadMemo));

RegRegisterMethod(TFieldDataLink,'Edit',TypeInfo(_T13),[TypeInfo(Boolean)],Addr(TFieldDataLink.Edit));

RegRegisterMethod(TFieldDataLink,'Modified',TypeInfo(_T14),NoParams,Addr(TFieldDataLink.Modified));

RegRegisterMethod(TFieldDataLink,'Reset',TypeInfo(_T15),NoParams,Addr(TFieldDataLink.Reset));

RegisterProc(TNavDataLink,'Create',mtConstructor,TypeInfo(_T16),[
TypeInfo(TDBNavigator)],Addr(TNavDataLink.Create),cRegister);

RegisterProc(TPaintControl,'Create',mtConstructor,TypeInfo(_T17),[
TypeInfo(TWinControl),
TypeInfo(string)],Addr(TPaintControl.Create),cRegister);

RegRegisterMethod(TPaintControl,'DestroyHandle',TypeInfo(_T18),NoParams,Addr(TPaintControl.DestroyHandle));

end;
initialization
_mreg_0;
RegisterEvent(TypeInfo(ENavClick),[
TypeInfo(TObject),
TypeInfo(TNavigateBtn)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
end.
