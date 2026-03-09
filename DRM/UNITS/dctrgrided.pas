{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit dcTrGridEd;

interface

uses
  dcntree, dcTreeGrid, dcTrEd, Dialogs, DCColorCombo, StdCtrls, Controls,
  Classes, ExtCtrls;

type
  TfrmTreeGridNodesEditor = class(TfrmTreeNodesEditor)
    procedure txtTextChange(Sender: TObject);
  private
    procedure On_CurrentColumnChanged(Sender: TObject; Column: TDCTreeColumn);
    procedure On_Editing(Sender: TObject; Node: TDCTreeNode; var AllowEdit: Boolean);
  protected
    function GetNodeText(ATree: TDCCustomTreeView; ANode: TDCTreeNode): string; override;
    procedure UpdateTextEdit(const NewText: string); override;
  public
    procedure AssignBefore(SrcTree, DstTree: TDCCustomTreeView); override;
    procedure AssignAfter(SrcTree, DstTree: TDCCustomTreeView); override;
  end;

var
  frmTreeGridNodesEditor: TfrmTreeGridNodesEditor;

function EditItems(TreeGrid: TDCTreeGrid): Boolean;

implementation

{$R *.DFM}

function EditItems(TreeGrid: TDCTreeGrid): Boolean;
begin
  Result := _EditItems(TreeGrid, TfrmTreeGridNodesEditor);
end;

function TfrmTreeGridNodesEditor.GetNodeText(ATree: TDCCustomTreeView;
  ANode: TDCTreeNode): string;
begin
  with TDCTreeGrid(ATree), TDCTreeGridNode(ANode) do
    if CurrentColumn <> nil then
      Result := Columns[CurrentColumn.CreateIndex]
    else
      Result := Text;
end;

procedure TfrmTreeGridNodesEditor.AssignBefore(SrcTree, DstTree: TDCCustomTreeView);
begin
  with TDCTreeGrid(DstTree) do
  begin
    Options := Options + [tgoAlwaysEdit];
    Columns.Assign(TDCTreeGrid(SrcTree).Columns);
    ColumnImages := TDCTreeGrid(SrcTree).ColumnImages;
    SortedColumns.Assign(TDCTreeGrid(SrcTree).SortedColumns);
    OnCurrentColumnChanged := On_CurrentColumnChanged;
    OnEditing := On_Editing;
  end;
  inherited;
end;

procedure TfrmTreeGridNodesEditor.AssignAfter(SrcTree, DstTree: TDCCustomTreeView);
begin
  with TDCTreeGrid(DstTree) do
  begin
    Columns.Assign(TDCTreeGrid(SrcTree).Columns);
    SortedColumns.Assign(TDCTreeGrid(SrcTree).SortedColumns);
  end;
  inherited;
end;

procedure TfrmTreeGridNodesEditor.txtTextChange(Sender: TObject);
var
  i, Index: integer;
begin
  if (txtText.Text <> '') or txtText.Focused then
    with TDCTreeGrid(FTreeView) do
      if CurrentColumn <> nil then
      begin
        Index := CurrentColumn.CreateIndex;
        for i := 0 to SelectedCount - 1 do
          TDCTreeGridNode(SelectedItems[i]).Columns[Index] := txtText.Text;
      end
      else inherited;
end;

procedure TfrmTreeGridNodesEditor.UpdateTextEdit(const NewText: string);
var
  cmnText: string;
  i: integer;
  equText: Boolean;
begin
  with FTreeView do
    if SelectedCount = 0 then
      txtText.Text := ''
    else with SelectedItems[0] do
      begin
        equText := True;
        if SelectedItems[0] = FTreeView.Selected then
          cmnText := NewText
        else
          cmnText := GetNodeText(FTreeView, SelectedItems[0]);
        for i := 1 to SelectedCount - 1 do
          with SelectedItems[i] do
            if equText then
              if SelectedItems[i] = FTreeView.Selected then
                equText := GetNodeText(FTreeView, SelectedItems[i]) = NewText
              else
                equText := GetNodeText(FTreeView, SelectedItems[i]) = cmnText
            else
              break;
        if equText then
          txtText.Text := cmnText
        else
          txtText.Text := '';
      end;
end;

procedure TfrmTreeGridNodesEditor.On_CurrentColumnChanged(Sender: TObject;
  Column: TDCTreeColumn);
begin
  UpdateTextEdit(GetNodeText(FTreeView, FTreeView.Selected));
end;

procedure TfrmTreeGridNodesEditor.On_Editing(Sender: TObject; Node: TDCTreeNode;
  var AllowEdit: Boolean);
begin
  AllowEdit := True;
end;

end.
