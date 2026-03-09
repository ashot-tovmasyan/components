{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit dcTreeGridEditorsReg;

interface

uses Classes, Controls, dctreegrid;

procedure RegisterTreeGridEditor(EditorClass: TControlClass; const EditorName: string);
function GetTreeGridEditorByName(const EditorName: string): TControlClass;
procedure EnumTreeGridEditors(AProc: TGetStrProc);
//procedure UnRegisterTreeGridEditor(PropType: TDCPropType);
procedure RegisterEditorPropsClass(const EditorName: string;
  EditorPropsClass: TEditorPropsClass);
function GetEditorPropsClass(const EditorName: string): TEditorPropsClass;

const
  CBooleanEditor = 'Boolean Editor';
  CCalculatorEditor = 'Calculator Editor';
  CCurrencyEditor = 'Currency Editor';
  CDateEditor = 'Date Editor';
  CDateTimeEditor = 'Date-Time Editor';
  CImageEditor = 'Image Editor';
  CMemoEditor = 'Memo Editor';
  CPickListEditor = 'PickList Editor';
  CTextEditor = 'Text Editor';
  CTimeEditor = 'Time Editor';

implementation

uses dcCalcEditor, dcntree, dcTreeGridEditors;

var
  EditorClasses: TList;
  DisplayNames: TStringList;
  EditorPropsClasses: TStringList;

procedure RegisterTreeGridEditor(EditorClass: TControlClass; const EditorName: string);
var
  Index: Integer;
begin
  if EditorClasses = nil then
  begin
    EditorClasses := TList.Create;
    DisplayNames := TStringList.Create;
  end;
  Index := EditorClasses.IndexOf(Pointer(EditorClass));
  if Index >= 0 then
    DisplayNames[Index] := EditorName
  else
  begin
    EditorClasses.Add(EditorClass);
    DisplayNames.Add(EditorName);
  end;
end;

function GetTreeGridEditorByName(const EditorName: string): TControlClass;
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

procedure EnumTreeGridEditors(AProc: TGetStrProc);
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
procedure UnRegisterTreeGridEditor(PropType: TDCPropType);
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

function GetEditorPropsClass(const EditorName: string): TEditorPropsClass;
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
  RegisterTreeGridEditor(TDCCustomTreeSimpleEditor, CTextEditor);
  RegisterTreeGridEditor(TDCMemoTreeViewEditor, CMemoEditor);
  RegisterTreeGridEditor(TDCPickListTreeViewEditor, CPickListEditor);
  RegisterTreeGridEditor(TDCTreeViewImageEditor, CImageEditor);
  RegisterTreeGridEditor(TDCTreeViewCheckBox, CBooleanEditor);
  RegisterTreeGridEditor(TDCTreeViewDateEditor, CDateEditor);
  RegisterTreeGridEditor(TDCTreeViewTimeEditor, CTimeEditor);
  RegisterTreeGridEditor(TDCTreeViewDateTimeEditor, CDateTimeEditor);
  RegisterTreeGridEditor(TDCTreeViewCalcEditor, CCalculatorEditor);
  RegisterTreeGridEditor(TDCTreeViewCurrencyEditor, CCurrencyEditor);

  RegisterEditorPropsClass(CMemoEditor, TDCMemoEditorProps);
  RegisterEditorPropsClass(CPickListEditor, TDCPickListEditorProps);
  RegisterEditorPropsClass(CImageEditor, TDCImageEditorProps);
finalization
  EditorClasses.Free;
  DisplayNames.Free;
  EditorPropsClasses.Free;
end.
