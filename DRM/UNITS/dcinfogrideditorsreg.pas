{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit dcInfoGridEditorsReg;

interface

uses Classes, Controls, dcInfoLib, dctreegrid;

procedure RegisterInfoGridEditor(PropType: TDCPropType;
  EditorClass: TControlClass; const EditorName: string);
function GetInfoGridEditorByType(PropType: TDCPropType): TControlClass;
function GetInfoGridEditorByName(const EditorName: string): TControlClass;
procedure EnumInfoGridEditors(AProc: TGetStrProc);
//procedure UnRegisterInfoGridEditor(PropType: TDCPropType);
procedure RegisterEditorPropsClass(const EditorName: string;
  EditorPropsClass: TEditorPropsClass);
function GetInfoEditorPropsClass(const EditorName: string): TEditorPropsClass;

const
  CBooleanEditor = 'Boolean Editor';
  CCalculatorEditor = 'Calculator Editor';
  CCurrencyEditor = 'Currency Editor';
  CDateEditor = 'Date Editor';
  CDateTimeEditor = 'Date-Time Editor';
  CImageEditor = 'Image Editor';
  CLookupEditor = 'Lookup Editor';
  CMemoEditor = 'Memo Editor';
  CPickListEditor = 'PickList Editor';
  CTextEditor = 'Text Editor';
  CTimeEditor = 'Time Editor';

implementation

uses dcCalcEditor, dcntree, dcTreeGridEditors, dcInfoGridEditors;

var
  FieldClasses: TList;
  EditorClasses: TList;
  DisplayNames: TStringList;
  EditorPropsClasses: TStringList;

procedure RegisterInfoGridEditor(PropType: TDCPropType;
  EditorClass: TControlClass; const EditorName: string);
var
  Index: Integer;
begin
  if FieldClasses = nil then
  begin
    FieldClasses := TList.Create;
    EditorClasses := TList.Create;
    DisplayNames := TStringList.Create;
  end;
  Index := FieldClasses.IndexOf(Pointer(PropType));
  if Index >= 0 then
  begin
    EditorClasses[Index] := EditorClass;
    DisplayNames[Index] := EditorName;
  end
  else
  begin
    FieldClasses.Add(Pointer(PropType));
    EditorClasses.Add(EditorClass);
    DisplayNames.Add(EditorName);
  end;
end;

function GetInfoGridEditorByType(PropType: TDCPropType): TControlClass;
var
  Index: Integer;
begin
  Result := nil;
  if FieldClasses = nil then
    Exit;
  Index := FieldClasses.IndexOf(Pointer(PropType));
  if Index >= 0 then
    Result := TControlClass(EditorClasses[Index]);
end;

function GetInfoGridEditorByName(const EditorName: string): TControlClass;
var
  Index: Integer;
begin
  Result := nil;
  if DisplayNames = nil then
    Exit;
  Index := DisplayNames.IndexOf(EditorName);
  if Index >= 0 then
    Result := TControlClass(EditorClasses[Index]);
end;

procedure EnumInfoGridEditors(AProc: TGetStrProc);
var
  s: string;
  i: integer;
begin
  if DisplayNames <> nil then
    with TStringList.Create do
    try
      Sorted := True;
      Duplicates := dupIgnore;
      for i := 0 to DisplayNames.Count - 1 do
      begin
        s := DisplayNames[i];
        if IndexOf(s) < 0 then
        begin
          Add(s);
          AProc(s);
        end;
      end;
    finally
      Free;
    end;
end;
{
procedure UnRegisterInfoGridEditor(PropType: TDCPropType);
var
  Index: Integer;
begin
  if FieldClasses <> nil then
  begin
    Index := FieldClasses.IndexOf(Pointer(PropType));
    if Index >= 0 then
    begin
      FieldClasses.Delete(Index);
      EditorClasses.Delete(Index);
      DisplayNames.Delete(Index);
      if FieldClasses.Count = 0 then
      begin
        FieldClasses.Free;
        EditorClasses.Free;
        DisplayNames.Free;
        FieldClasses := nil;
        EditorClasses := nil;
        DisplayNames := nil;
      end;
    end;
  end;
end;
}
procedure RegisterEditorPropsClass(const EditorName: string;
  EditorPropsClass: TEditorPropsClass);
var
 Index: integer;
begin
  if EditorPropsClasses = nil then
    EditorPropsClasses := TStringList.Create;
  Index := EditorPropsClasses.IndexOf(EditorName);
  if Index >= 0 then
  begin
    EditorPropsClasses[Index] := EditorName;
    EditorPropsClasses.Objects[Index] := TObject(EditorPropsClass);
  end
  else
    EditorPropsClasses.AddObject(EditorName, TObject(EditorPropsClass));
end;

function GetInfoEditorPropsClass(const EditorName: string): TEditorPropsClass;
var
  Index: Integer;
begin
  Result := TEditorProps;
  if EditorPropsClasses = nil then
    Exit;
  Index := EditorPropsClasses.IndexOf(EditorName);
  if Index >= 0 then
    Result := TEditorPropsClass(EditorPropsClasses.Objects[Index]);
end;

initialization
  RegisterInfoGridEditor(Word(-1), TDCCustomTreeSimpleEditor, CTextEditor);
  RegisterInfoGridEditor(Word(-2), TDCDBLookupTreeViewEditor, CLookupEditor);
  RegisterInfoGridEditor(Word(-3), TDCMemoTreeViewEditor, CMemoEditor);
  RegisterInfoGridEditor(Word(-4), TDCPickListTreeViewEditor, CPickListEditor);
  RegisterInfoGridEditor(Word(-5), TDCTreeViewImageEditor, CImageEditor);
  RegisterInfoGridEditor(DBTYPE_BOOL, TDCTreeViewCheckBox, CBooleanEditor);
  RegisterInfoGridEditor(DBTYPE_DBDATE, TDCTreeViewDateEditor, CDateEditor);
  RegisterInfoGridEditor(DBTYPE_DBTIME, TDCTreeViewTimeEditor, CTimeEditor);
  RegisterInfoGridEditor(DBTYPE_DATE, TDCTreeViewDateTimeEditor, CDateTimeEditor);
  RegisterInfoGridEditor(DBTYPE_I1, TDCTreeViewCalcEditor, CCalculatorEditor);
  RegisterInfoGridEditor(DBTYPE_I2, TDCTreeViewCalcEditor, CCalculatorEditor);
  RegisterInfoGridEditor(DBTYPE_I4, TDCTreeViewCalcEditor, CCalculatorEditor);
  RegisterInfoGridEditor(DBTYPE_I8, TDCTreeViewCalcEditor, CCalculatorEditor);
  RegisterInfoGridEditor(DBTYPE_UI1, TDCTreeViewCalcEditor, CCalculatorEditor);
  RegisterInfoGridEditor(DBTYPE_UI2, TDCTreeViewCalcEditor, CCalculatorEditor);
  RegisterInfoGridEditor(DBTYPE_UI4, TDCTreeViewCalcEditor, CCalculatorEditor);
  RegisterInfoGridEditor(DBTYPE_UI8, TDCTreeViewCalcEditor, CCalculatorEditor);
  RegisterInfoGridEditor(DBTYPE_R4, TDCTreeViewCalcEditor, CCalculatorEditor);
  RegisterInfoGridEditor(DBTYPE_R8, TDCTreeViewCalcEditor, CCalculatorEditor);
  RegisterInfoGridEditor(DBTYPE_CY, TDCTreeViewCurrencyEditor, CCurrencyEditor);

  RegisterEditorPropsClass(CLookupEditor, TDCLookupEditorProps);
  RegisterEditorPropsClass(CMemoEditor, TDCMemoEditorProps);
  RegisterEditorPropsClass(CPickListEditor, TDCPickListEditorProps);
  RegisterEditorPropsClass(CImageEditor, TDCImageEditorProps);
finalization
  FieldClasses.Free;
  EditorClasses.Free;
  DisplayNames.Free;
  EditorPropsClasses.Free;
end.
