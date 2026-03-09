{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit dcTrEd;

interface
{$I dc.inc}
uses
  Windows, Graphics, dcntree, Forms, Dialogs, StdCtrls, Controls,
  Classes, ExtCtrls, DCColorCombo;

type
  TDCCustomTreeViewClass = class of TDCCustomTreeView;

  TfrmTreeNodesEditor = class(TForm)
    Panel3: TPanel;
    Panel4: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    btnApply: TButton;
    FontDialog: TFontDialog;
    Panel2: TPanel;
    btnNewItem: TButton;
    btnNewSubItem: TButton;
    btnDelete: TButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label6: TLabel;
    txtText: TEdit;
    txtImageIndex: TEdit;
    txtSelectedIndex: TEdit;
    txtStateIndex: TEdit;
    txtOverlayIndex: TEdit;
    chkParentFont: TCheckBox;
    chkAllowGrayed: TCheckBox;
    txtFont: TEdit;
    btnSelectFont: TButton;
    cbxNodeType: TComboBox;
    chkReadOnly: TCheckBox;
    chkParentColor: TCheckBox;
    btnImageIndex: TButton;
    btnSelectedIndex: TButton;
    btnStateIndex: TButton;
    btnOverlayIndex: TButton;
    lbxImages: TListBox;
    btnMoveUp: TButton;
    btnMoveDn: TButton;
    btnClear: TButton;
    cbxState: TComboBox;
    btnLoad: TButton;
    btnSave: TButton;
    Label7: TLabel;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    chkDragAddChild: TCheckBox;
    Label8: TLabel;
    cbxFontColor: TDCColorCombo;
    cbxColor: TDCColorCombo;
    btnFontColor: TButton;
    btnColor: TButton;
    ColorDialog: TColorDialog;
    procedure btnSelectFontClick(Sender: TObject);
    procedure btnNewItemClick(Sender: TObject);
    procedure btnNewSubItemClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure chkParentFontClick(Sender: TObject);
    procedure chkAllowGrayedClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure chkReadOnlyClick(Sender: TObject);
    procedure chkParentColorClick(Sender: TObject);
    procedure btnIndexClick(Sender: TObject);
    procedure lbxImagesDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure lbxImagesMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnMoveUpClick(Sender: TObject);
    procedure btnMoveDnClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure txtTextChange(Sender: TObject);
    procedure txtImageIndexChange(Sender: TObject);
    procedure txtSelectedIndexChange(Sender: TObject);
    procedure txtStateIndexChange(Sender: TObject);
    procedure txtOverlayIndexChange(Sender: TObject);
    procedure cbxNodeTypeChange(Sender: TObject);
    procedure cbxStateChange(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxFontColorChange(Sender: TObject);
    procedure cbxColorChange(Sender: TObject);
    procedure btnFontColorClick(Sender: TObject);
    procedure btnColorClick(Sender: TObject);
    procedure txtIndexKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    FFont: TFont;
    FOriginalTree: TDCCustomTreeView;
    FImagesAssigned, FStateImagesAssigned, FMousePressed: Boolean;
    CurImages: TImageList;

    procedure On_SelectionChanged(Sender: TObject; Node: TDCTreeNode);
    procedure On_CheckClick(Sender: TObject; Node: TDCTreeNode);
    procedure On_Edited(Sender: TObject; Node: TDCTreeNode; var S: string);
    procedure On_KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure On_DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure On_DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure On_MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure On_MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    //procedure On_StartDrag(Sender: TObject; var DragObject: TDragObject);

    procedure UpdateUpDnButtons;
    procedure UpdateDelButtons;
    procedure ChangeGrayed(Add: Boolean);
  protected
    FTreeView: TDCCustomTreeView;

    procedure SetControlsEnabled(Value: Boolean); virtual;
    function GetNodeText(ATree: TDCCustomTreeView; ANode: TDCTreeNode): string; virtual;
    procedure GetItemProps; virtual;
    procedure UpdateTextEdit(const NewText: string); virtual;
  public
    ApplyWasClicked: Boolean;

    constructor Create2(AOwner: TComponent; ATreeViewClass: TDCCustomTreeViewClass);
    destructor Destroy; override;

    function Execute(TreeView: TDCCustomTreeView): Boolean;
    procedure AssignBefore(SrcTree, DstTree: TDCCustomTreeView); virtual;
    procedure AssignAfter(SrcTree, DstTree: TDCCustomTreeView); virtual;
  end;

  TfrmTreeNodesEditorClass = class of TfrmTreeNodesEditor;

var
  frmTreeNodesEditor: TfrmTreeNodesEditor;

function EditItems(TreeView: TDCTree): Boolean;
function _EditItems(TreeView: TDCCustomTreeView;
  frmEditorClass: TfrmTreeNodesEditorClass): Boolean;

implementation

uses
  Messages, SysUtils, ComCtrls, {$IFDEF D4}ImgList,{$ENDIF} dcPopup, dcconsts;

{$R *.DFM}

const
  CBadColor = TColor(-1);
  CNewItem = 'NewItem';

type
  TPublicNode = class(TDCTreeNode);
  TPublicTree = class(TDCCustomTreeView);

constructor TfrmTreeNodesEditor.Create2(AOwner: TComponent;
  ATreeViewClass: TDCCustomTreeViewClass);
begin
  inherited Create(AOwner);
  FFont := TFont.Create;
  FTreeView := ATreeViewClass.Create(Self);
  FTreeView.Parent := Self;
  FTreeView.Align := alClient;
  ApplyWasClicked := False;
end;

destructor TfrmTreeNodesEditor.Destroy;
begin
  FTreeView.Free;
  FFont.Free;
  inherited;
end;

function TfrmTreeNodesEditor.Execute(TreeView: TDCCustomTreeView): Boolean;
var
  PublicTreeView: TPublicTree;
begin
  Caption := TreeView.Name + STrEdCaption;
  FOriginalTree := TreeView;
  PublicTreeView := TPublicTree(TreeView);
  with TPublicTree(FTreeView) do
  begin
    AssignBefore(PublicTreeView, FTreeView);

    with cbxNodeType.Items do
    begin
      AddObject(SNodeTypeNone, Pointer(ntNone));
      AddObject(SNodeTypeCheckBox, Pointer(ntCheckBox));
      AddObject(SNodeTypeRadioButton, Pointer(ntRadioButton));
    end;
    with cbxState.Items do
    begin
      AddObject(SStateUnchecked, Pointer(cbUnchecked));
      AddObject(SStateChecked, Pointer(cbChecked));
    end;
    FImagesAssigned := Assigned(Images);
    FStateImagesAssigned := Assigned(StateImages);
    GetItemProps;
    UpdateUpDnButtons;
    UpdateDelButtons;
    Result := ShowModal = mrOk;
    if Result then
      AssignAfter(FTreeView, PublicTreeView);
  end;
end;

procedure TfrmTreeNodesEditor.AssignBefore(SrcTree, DstTree: TDCCustomTreeView);
begin
  with TPublicTree(DstTree) do
  begin
    Color := TPublicTree(SrcTree).Color;
    Images := TPublicTree(SrcTree).Images;
    StateImages := TPublicTree(SrcTree).StateImages;
    CheckBoxesType := TPublicTree(SrcTree).CheckBoxesType;
    ShowButtons := TPublicTree(SrcTree).ShowButtons;
    ShowLines := TPublicTree(SrcTree).ShowLines;
    ShowRoot := TPublicTree(SrcTree).ShowRoot;
    MultiLineNodes := TPublicTree(SrcTree).MultiLineNodes;
    Font := TPublicTree(SrcTree).Font;
    HideSelection := False;
    DragMode := dmAutomatic;
    MultiSelect := True;
    ChangeDelay := 1;
    Items.Assign(TPublicTree(SrcTree).Items);
    OnDragOver := On_DragOver;
    OnDragDrop := On_DragDrop;
    //OnStartDrag := On_StartDrag;
    OnMouseDown := On_MouseDown;
    OnMouseUp := On_MouseUp;
    OnKeyDown := On_KeyDown;
    OnCheckClick := On_CheckClick;
    OnEdited := On_Edited;
    OnSelectionChanged := On_SelectionChanged;
    Selected := Items.GetFirstNode;
  end;
end;

procedure TfrmTreeNodesEditor.AssignAfter(SrcTree, DstTree: TDCCustomTreeView);
begin
  TPublicTree(DstTree).Items.Assign(TPublicTree(SrcTree).Items);
end;

procedure TfrmTreeNodesEditor.On_SelectionChanged(Sender: TObject;
  Node: TDCTreeNode);
begin
  GetItemProps;
  UpdateUpDnButtons;
  UpdateDelButtons;
end;

procedure TfrmTreeNodesEditor.On_CheckClick(Sender: TObject; Node: TDCTreeNode);
begin
  GetItemProps;
end;

procedure TfrmTreeNodesEditor.UpdateTextEdit(const NewText: string);
begin
  txtText.Text := NewText;
end;

procedure TfrmTreeNodesEditor.On_Edited(Sender: TObject; Node: TDCTreeNode;
  var S: string);
begin
  UpdateTextEdit(S);
end;

procedure TfrmTreeNodesEditor.On_KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_INSERT:
      if ssCtrl in Shift then
        btnNewSubItemClick(Self);
    VK_DELETE: btnDeleteClick(Self);
  end;
end;

procedure TfrmTreeNodesEditor.SetControlsEnabled(Value: Boolean);
var
  CustomChecks: Boolean;
begin
  txtText.Enabled := Value;
  txtImageIndex.Enabled := Value {and FImagesAssigned};
  btnImageIndex.Enabled := Value and FImagesAssigned;
  txtSelectedIndex.Enabled := Value {and FImagesAssigned};
  btnSelectedIndex.Enabled := Value and FImagesAssigned;
  txtStateIndex.Enabled := Value {and FStateImagesAssigned};
  btnStateIndex.Enabled := Value and FStateImagesAssigned;
  txtOverlayIndex.Enabled := Value {and FImagesAssigned};
  btnOverlayIndex.Enabled := Value and FImagesAssigned;
  chkParentFont.Enabled := Value;
  txtFont.Enabled := Value;
  cbxFontColor.Enabled := Value;
  btnFontColor.Enabled := Value;
  btnSelectFont.Enabled := Value;
  chkParentColor.Enabled := Value;
  cbxColor.Enabled := Value;
  btnColor.Enabled := Value;
  CustomChecks := TPublicTree(FOriginalTree).CheckBoxesType <> ctNone;
  cbxNodeType.Enabled := Value and CustomChecks;
  chkAllowGrayed.Enabled := Value and CustomChecks;
  cbxState.Enabled := Value and CustomChecks;
  chkReadOnly.Enabled := Value;
end;

procedure TfrmTreeNodesEditor.UpdateUpDnButtons;
var
  GoodTime: Boolean;
begin
  with FTreeView do
  begin
    GoodTime := (SelectedCount = 1) and (Selected <> nil);
    btnMoveUp.Enabled := GoodTime and (Selected.GetPrevSibling <> nil);
    btnMoveDn.Enabled := GoodTime and (Selected.GetNextSibling <> nil);
  end;
end;

procedure TfrmTreeNodesEditor.UpdateDelButtons;
begin
  with TPublicTree(FTreeView) do
  begin
    btnDelete.Enabled := (Items.Count > 0) and (SelectedCount > 0);
    btnClear.Enabled := Items.Count > 0;
  end;
end;

function TfrmTreeNodesEditor.GetNodeText(ATree: TDCCustomTreeView;
  ANode: TDCTreeNode): string;
begin
  Result := ANode.Text;
end;  

procedure TfrmTreeNodesEditor.GetItemProps;
var
  i: integer;
  equText, equImageIndex, equSelectedIndex, equStateIndex, equOverlayIndex,
    equFont, equFontColor, equColor, equNodeType, equAllowGrayed, equParentColor,
    equParentFont, equReadOnly, equState: Boolean;
  cmnText: string;
  cmnImageIndex, cmnSelectedIndex, cmnStateIndex, cmnOverlayIndex: integer;
  cmnFontColor, cmnColor: TColor;
  cmnNodeType: TDCNodeType;
  cmnAllowGrayed, cmnParentColor, cmnParentFont, cmnReadOnly: Boolean;
  cmnState: TCheckBoxState;
begin
  if FTreeView.SelectedCount = 0 then
  begin
    txtText.Text := '';
    txtImageIndex.Text := '';
    txtSelectedIndex.Text := '';
    txtStateIndex.Text := '';
    txtOverlayIndex.Text := '';
    txtFont.Text := '';
    cbxFontColor.SelectedColor := CBadColor;
    cbxColor.SelectedColor := CBadColor;
    cbxNodeType.ItemIndex := -1;
    cbxState.ItemIndex := -1;
    chkAllowGrayed.State := cbGrayed;
    chkParentColor.State := cbGrayed;
    chkParentFont.State := cbGrayed;
    chkReadOnly.State := cbGrayed;
    SetControlsEnabled(False);
  end
  else
    with FTreeView.SelectedItems[0] do
    begin
      equText := True;
      equImageIndex := True;
      equSelectedIndex := True;
      equStateIndex := True;
      equOverlayIndex := True;
      equFont := True;
      equFontColor := True;
      equColor := True;
      equNodeType := True;
      equAllowGrayed := True;
      equParentColor := True;
      equParentFont := True;
      equReadOnly := True;
      equState := True;
      cmnText := GetNodeText(FTreeView, FTreeView.SelectedItems[0]);
      cmnImageIndex := ImageIndex;
      cmnSelectedIndex := SelectedIndex;
      cmnStateIndex := StateIndex;
      cmnOverlayIndex := OverlayIndex;
      FFont.Assign(Font);
      cmnFontColor := Font.Color;
      cmnColor := Color;
      cmnNodeType := NodeType;
      cmnAllowGrayed := AllowGrayed;
      cmnParentColor := ParentColor;
      cmnParentFont := ParentFont;
      cmnReadOnly := ReadOnly;
      cmnState := State;
      for i := 1 to FTreeView.SelectedCount - 1 do
      with FTreeView.SelectedItems[i] do
      begin
        if equText then
          equText := GetNodeText(FTreeView, FTreeView.SelectedItems[i]) = cmnText;
        if equImageIndex then
          equImageIndex := ImageIndex = cmnImageIndex;
        if equSelectedIndex then
          equSelectedIndex := SelectedIndex = cmnSelectedIndex;
        if equStateIndex then
          equStateIndex := StateIndex = cmnStateIndex;
        if equOverlayIndex then
          equOverlayIndex := OverlayIndex = cmnOverlayIndex;
        if equFont then
          equFont := Font.Handle = FFont.Handle;
        if equFontColor then
          equFontColor := Font.Color = cmnFontColor;
        if equColor then
          equColor := Color = cmnColor;
        if equNodeType then
          equNodeType := NodeType = cmnNodeType;
        if equAllowGrayed then
          equAllowGrayed := AllowGrayed = cmnAllowGrayed;
        if equParentColor then
          equParentColor := ParentColor = cmnParentColor;
        if equParentFont then
          equParentFont := ParentFont = cmnParentFont;
        if equReadOnly then
          equReadOnly := ReadOnly = cmnReadOnly;
        if equState then
          equState := State = cmnState;
      end;

      if equText then
        txtText.Text := cmnText
      else
        txtText.Text := '';
      if equImageIndex then
        txtImageIndex.Text := IntToStr(cmnImageIndex)
      else
        txtImageIndex.Text := '';
      if equSelectedIndex then
        txtSelectedIndex.Text := IntToStr(cmnSelectedIndex)
      else
        txtSelectedIndex.Text := '';
      if equStateIndex then
        txtStateIndex.Text := IntToStr(cmnStateIndex)
      else
        txtStateIndex.Text := '';
      if equOverlayIndex then
        txtOverlayIndex.Text := IntToStr(cmnOverlayIndex)
      else
        txtOverlayIndex.Text := '';
      if equFont then
        txtFont.Text := FFont.Name
      else
        txtFont.Text := '';
      if equFontColor then
        cbxFontColor.SelectedColor := cmnFontColor
      else
        cbxFontColor.SelectedColor := CBadColor;
      if equColor then
        cbxColor.SelectedColor := cmnColor
      else
        cbxColor.SelectedColor := CBadColor;
      if equNodeType then
        cbxNodeType.ItemIndex := cbxNodeType.Items.IndexOfObject(Pointer(cmnNodeType))
      else
        cbxNodeType.ItemIndex := -1;
      if equAllowGrayed then
        chkAllowGrayed.Checked := cmnAllowGrayed
      else
        chkAllowGrayed.State := cbGrayed;
      if equParentColor then
        chkParentColor.Checked := cmnParentColor
      else
        chkParentColor.State := cbGrayed;
      if equParentFont then
        chkParentFont.Checked := cmnParentFont
      else
        chkParentFont.State := cbGrayed;
      if equReadOnly then
        chkReadOnly.Checked := cmnReadOnly
      else
        chkReadOnly.State := cbGrayed;
      if equState then
        cbxState.ItemIndex := cbxState.Items.IndexOfObject(Pointer(cmnState))
      else
        cbxState.ItemIndex := -1;
      SetControlsEnabled(True);
    end;
end;

procedure TfrmTreeNodesEditor.btnSelectFontClick(Sender: TObject);
var
  i: integer;
begin
  with FontDialog do
  begin
    FFont.Assign(FTreeView.SelectedItems[0].Font);
    Font.Assign(FFont);
    if Execute then
    begin
      FFont.Assign(Font);
      txtFont.Text := FFont.Name;
      with FTreeView do
        for i := 0 to SelectedCount - 1 do
          SelectedItems[i].Font.Assign(FFont);
      chkParentFont.Checked := False;
    end;
  end;
end;

procedure TfrmTreeNodesEditor.chkParentFontClick(Sender: TObject);
var
  i: integer;
begin
  if chkParentFont.State <> cbGrayed then
    with FTreeView do
    begin
      for i := 0 to SelectedCount - 1 do
        SelectedItems[i].ParentFont := chkParentFont.Checked;
      FFont.Assign(SelectedItems[0].Font);
      txtFont.Text := FFont.Name;
      cbxFontColor.SelectedColor := FFont.Color;
    end;
end;

procedure TfrmTreeNodesEditor.chkParentColorClick(Sender: TObject);
var
  i: integer;
begin
  if chkParentColor.State <> cbGrayed then
    with FTreeView do
    begin
      for i := 0 to SelectedCount - 1 do
        SelectedItems[i].ParentColor := chkParentColor.Checked;
      cbxColor.SelectedColor := SelectedItems[0].Color;
    end;
end;

procedure TfrmTreeNodesEditor.chkReadOnlyClick(Sender: TObject);
var
  i: integer;
begin
  if chkReadOnly.State <> cbGrayed then
    with FTreeView do
      for i := 0 to SelectedCount - 1 do
        SelectedItems[i].ReadOnly := chkReadOnly.Checked;
end;

procedure TfrmTreeNodesEditor.btnNewItemClick(Sender: TObject);
begin
  with TPublicTree(FTreeView) do
    Selected := Items.Add(Selected, CNewItem);
  GetItemProps;
  UpdateDelButtons;
  txtText.SetFocus;
  txtText.SelectAll;
end;

procedure TfrmTreeNodesEditor.btnNewSubItemClick(Sender: TObject);
var
  NewNode: TDCTreeNode;
begin
  with TPublicTree(FTreeView) do
  begin
    NewNode := Items.AddChild(Selected, CNewItem);
    if Selected <> nil then
      Selected.Expand(False);
    Selected := NewNode;
  end;
  GetItemProps;
  UpdateDelButtons;
  txtText.SetFocus;
  txtText.SelectAll;
end;

procedure TfrmTreeNodesEditor.btnDeleteClick(Sender: TObject);
begin
  FTreeView.DeleteSelectedItems;
  GetItemProps;
  UpdateDelButtons;
end;

procedure TfrmTreeNodesEditor.btnClearClick(Sender: TObject);
begin
  TPublicTree(FTreeView).Items.Clear;
  GetItemProps;
  UpdateDelButtons;
end;

function _EditItems(TreeView: TDCCustomTreeView;
  frmEditorClass: TfrmTreeNodesEditorClass): Boolean;
var
  frmEditor: TfrmTreeNodesEditor;
begin
  frmEditor := frmEditorClass.Create2(nil, TDCCustomTreeViewClass(TreeView.ClassType));
  try
    Result := frmEditor.Execute(TreeView);
  finally
    frmEditor.Free;
  end;
end;

function EditItems(TreeView: TDCTree): Boolean;
begin
  Result := _EditItems(TreeView, TfrmTreeNodesEditor);
end;

procedure TfrmTreeNodesEditor.btnApplyClick(Sender: TObject);
begin
  AssignAfter(FTreeView, FOriginalTree);
  ApplyWasClicked := True;
end;

procedure TfrmTreeNodesEditor.ChangeGrayed(Add: Boolean);
begin
  if Add then
  begin
    if (cbxState.Items.IndexOfObject(Pointer(cbGrayed)) < 0) and
      chkAllowGrayed.Checked then
      cbxState.Items.AddObject(SStateGrayed, Pointer(cbGrayed));
  end
  else
  begin
    cbxState.Items.Delete(cbxState.Items.IndexOfObject(Pointer(cbGrayed)));
    if cbxState.ItemIndex < 0 then
      cbxState.ItemIndex := cbxState.Items.IndexOfObject(Pointer(cbUnchecked));
    cbxStateChange(nil);
  end;
end;

procedure TfrmTreeNodesEditor.cbxNodeTypeChange(Sender: TObject);
var
  i: integer;
begin
  if cbxNodeType.ItemIndex > -1 then
  begin
    ChangeGrayed(TDCNodeType(cbxNodeType.Items.Objects[cbxNodeType.ItemIndex])
      <> ntRadioButton);
    with FTreeView do
      for i := 0 to SelectedCount - 1 do
        SelectedItems[i].NodeType :=
          TDCNodeType(cbxNodeType.Items.Objects[cbxNodeType.ItemIndex]);
  end;
end;

procedure TfrmTreeNodesEditor.cbxStateChange(Sender: TObject);
var
  i: integer;
begin
  if cbxState.ItemIndex > -1 then
    with FTreeView do
      for i := 0 to SelectedCount - 1 do
        SelectedItems[i].State :=
          TCheckBoxState(cbxState.Items.Objects[cbxState.ItemIndex]);
end;

procedure TfrmTreeNodesEditor.chkAllowGrayedClick(Sender: TObject);
var
  i: integer;
begin
  if (chkAllowGrayed.State <> cbGrayed) and ((cbxNodeType.ItemIndex < 0) or
    (TDCNodeType(cbxNodeType.Items.Objects[cbxNodeType.ItemIndex]) <> ntRadioButton)) then
  begin
    ChangeGrayed(chkAllowGrayed.Checked);
    with FTreeView do
      for i := 0 to SelectedCount - 1 do
        SelectedItems[i].AllowGrayed := chkAllowGrayed.Checked;
    GetItemProps;
  end;
end;

procedure TfrmTreeNodesEditor.On_DragDrop(Sender, Source: TObject; X, Y: Integer);
var
  ANode: TDCTreeNode;
begin
  with TPublicTree(FTreeView) do
  begin
    if SelectedCount > 1 then
      exit;
    if GetKeyState(VK_CONTROL) < 0 then
    begin
      if chkDragAddChild.Checked then
      begin
        ANode := Items.AddChild(DropTarget, '');
        ANode.Assign(Selected);
        ANode.HasChildren := False;
        if DropTarget <> nil then
          DropTarget.Expand(False);
      end
      else
      begin
        ANode := Items.Add(DropTarget, '');
        ANode.Assign(Selected);
        ANode.HasChildren := False;
      end;
    end
    else
    begin
      if chkDragAddChild.Checked then
      begin
        Selected.MoveTo(DropTarget, naAddChild);
        if DropTarget <> nil then
          DropTarget.Expand(False);
      end
      else
        Selected.MoveTo(DropTarget, naInsert);
    end;
  end;
  GetItemProps;
  UpdateUpDnButtons;
  FMousePressed := False;
end;

procedure TfrmTreeNodesEditor.On_DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  with FTreeView do
  begin
    Accept := (SelectedCount = 1) and (DropTarget <> nil) and
      not ((DropTarget = Selected) or DropTarget.HasAsParent(Selected));
  end;
end;

procedure TfrmTreeNodesEditor.On_MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FMousePressed := True;
end;

procedure TfrmTreeNodesEditor.On_MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if not FTreeView.Dragging then
    FMousePressed := False;
end;
{
type
  T_DCTree = class(TDCCustomTreeView)
  end;

procedure TfrmTreeNodesEditor.On_StartDrag(Sender: TObject;
  var DragObject: TDragObject);
var
  di: TImageList;
begin
  di := TImageList(T_DCTree(FTreeView).GetDragImages);
  if GetKeyState(VK_CONTROL) < 0 then
    di.DragCursor := crHourGlass
  else
    di.DragCursor := crMultiDrag;
  Windows.SetCursor(Screen.Cursors[di.DragCursor]);
end;
}
procedure TfrmTreeNodesEditor.btnIndexClick(Sender: TObject);
var
  i: integer;
  edt: TEdit;
begin
  with TPublicTree(FTreeView) do
    if Sender = btnStateIndex then
      CurImages := TImageList(StateImages)
    else
      CurImages := TImageList(Images);
  if Sender = btnImageIndex then
    edt := txtImageIndex
  else if Sender = btnSelectedIndex then
    edt := txtSelectedIndex
  else if Sender = btnStateIndex then
    edt := txtStateIndex
  else
    edt := txtOverlayIndex;
  with lbxImages do
  begin
    Clear;
    ItemHeight := CurImages.Height + 2;
    for i := 0 to CurImages.Count - 1 do
      lbxImages.Items.Add(IntToStr(i));
    if edt.Text = '' then
      ItemIndex := -1
    else
      ItemIndex := StrToInt(edt.Text);
  end;
  with edt do
    if SizeablePopup(lbxImages, GroupBox2, Left, Top + Height{$IFNDEF D4}, True{$ENDIF}) then
      Text := lbxImages.Items[lbxImages.ItemIndex]
end;

procedure TfrmTreeNodesEditor.lbxImagesDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  with TListBox(Control) do
  begin
    Canvas.FillRect(Rect);
    CurImages.Draw(Canvas, Rect.Left + 1, Rect.Top + 1, Index);
  end;
end;

procedure TfrmTreeNodesEditor.lbxImagesMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    SendMessage(lbxImages.Handle, WM_LBUTTONDBLCLK, 0, word(X) + word(y) shl 16);
end;

procedure TfrmTreeNodesEditor.btnMoveUpClick(Sender: TObject);
var
  FPrevNode: TDCTreeNode;
begin
  with FTreeView do
    if Selected <> nil then
    begin
      FPrevNode := Selected.GetPrevSibling;
      if FPrevNode <> nil then
        Selected.MoveTo(FPrevNode, naInsert);
    end;
  GetItemProps;
  UpdateUpDnButtons;
end;

procedure TfrmTreeNodesEditor.btnMoveDnClick(Sender: TObject);
var
  FNextNode: TDCTreeNode;
begin
  with FTreeView do
    if Selected <> nil then
    begin
      FNextNode := Selected.GetNextSibling;
      if FNextNode <> nil then
      begin
        if FNextNode.GetNextSibling <> nil then
          Selected.MoveTo(FNextNode.GetNextSibling, naInsert)
        else
          Selected.MoveTo(FNextNode, naAdd)
      end;
    end;
  GetItemProps;
  UpdateUpDnButtons;
end;

procedure TfrmTreeNodesEditor.txtTextChange(Sender: TObject);
var
  i: integer;
begin
  if (txtText.Text <> '') or txtText.Focused then
    with FTreeView do
      for i := 0 to SelectedCount - 1 do
        SelectedItems[i].Text := txtText.Text;
end;

procedure TfrmTreeNodesEditor.txtImageIndexChange(Sender: TObject);
var
  i, Idx: integer;
begin
  if txtImageIndex.Text <> '' then
  try
    Idx := StrToInt(txtImageIndex.Text);
    with FTreeView do
      for i := 0 to SelectedCount - 1 do
        SelectedItems[i].ImageIndex := Idx;
  except
    exit; //process non-numbers
  end;
end;

procedure TfrmTreeNodesEditor.txtSelectedIndexChange(Sender: TObject);
var
  i, Idx: integer;
begin
  if txtSelectedIndex.Text <> '' then
  try
    Idx := StrToInt(txtSelectedIndex.Text);
    with FTreeView do
      for i := 0 to SelectedCount - 1 do
        SelectedItems[i].SelectedIndex := Idx;
  except
    exit; //process non-numbers
  end;
end;

procedure TfrmTreeNodesEditor.txtStateIndexChange(Sender: TObject);
var
  i, Idx: integer;
begin
  if txtStateIndex.Text <> '' then
  try
    Idx := StrToInt(txtStateIndex.Text);
    with FTreeView do
      for i := 0 to SelectedCount - 1 do
        SelectedItems[i].StateIndex := Idx;
  except
    exit; //process non-numbers
  end;
end;

procedure TfrmTreeNodesEditor.txtOverlayIndexChange(Sender: TObject);
var
  i, Idx: integer;
begin
  if txtOverlayIndex.Text <> '' then
  try
    Idx := StrToInt(txtOverlayIndex.Text);
    with FTreeView do
      for i := 0 to SelectedCount - 1 do
        SelectedItems[i].OverlayIndex := Idx;
  except
    exit; //process non-numbers
  end;
end;

procedure TfrmTreeNodesEditor.btnLoadClick(Sender: TObject);
begin
  with OpenDialog do
    if Execute then
    begin
      FTreeView.LoadFromFile(FileName);
      txtText.SelectAll;
    end;
end;

procedure TfrmTreeNodesEditor.btnSaveClick(Sender: TObject);
begin
  with SaveDialog do
    if Execute then
      FTreeView.SaveToFile(FileName);
end;

procedure TfrmTreeNodesEditor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift <> [] then
    exit;
  case Key of
    VK_INSERT: btnNewItemClick(Self);
    VK_ESCAPE:
      if FMousePressed then
        CancelDrag
      else
        ModalResult := mrCancel;
  end;
end;

procedure TfrmTreeNodesEditor.cbxFontColorChange(Sender: TObject);
var
  i: integer;
begin
  with cbxFontColor, FTreeView do
  if ItemIndex >= 0 then
  begin
    for i := 0 to SelectedCount - 1 do
      SelectedItems[i].Font.Color := SelectedColor;
    chkParentFont.Checked := False;
  end;
end;

procedure TfrmTreeNodesEditor.cbxColorChange(Sender: TObject);
var
  i: integer;
begin
  with cbxColor, FTreeView do
  if ItemIndex >= 0 then
  begin
    for i := 0 to SelectedCount - 1 do
      SelectedItems[i].Color := SelectedColor;
    chkParentColor.Checked := False;
  end;
end;

procedure TfrmTreeNodesEditor.btnFontColorClick(Sender: TObject);
var
  i: integer;
begin
  if cbxFontColor.SelectedColor <> CBadColor then
    ColorDialog.Color := cbxFontColor.SelectedColor;
  if ColorDialog.Execute then
  begin
    cbxFontColor.SelectedColor := ColorDialog.Color;
    with FTreeView do
      for i := 0 to SelectedCount - 1 do
        SelectedItems[i].Font.Color := ColorDialog.Color;
    chkParentFont.Checked := False;
  end;
end;

procedure TfrmTreeNodesEditor.btnColorClick(Sender: TObject);
var
  i: integer;
begin
  if cbxColor.SelectedColor <> CBadColor then
    ColorDialog.Color := cbxColor.SelectedColor;
  if ColorDialog.Execute then
  begin
    cbxColor.SelectedColor := ColorDialog.Color;
    with FTreeView do
      for i := 0 to SelectedCount - 1 do
        SelectedItems[i].Color := ColorDialog.Color;
    chkParentColor.Checked := False;
  end;
end;

procedure TfrmTreeNodesEditor.txtIndexKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in [#8, '-', '0'..'9']) then
    Key := #0;
end;

{to do:
- disabling 'apply'
- selecting 'no image' from popup
}
procedure TfrmTreeNodesEditor.FormCreate(Sender: TObject);
begin
  btnNewItem.Caption := STrEdNewItem;
  btnNewSubItem.Caption := STrEdNewSubItem;
  btnDelete.Caption := SDelete;
  btnClear.Caption := STrEdClear;
  btnMoveUp.Caption := STrEdMoveUp;
  btnMoveDn.Caption := STrEdMoveDown;
  btnLoad.Caption := SLoad1;
  btnSave.Caption := SSave1;
  chkDragAddChild.Caption := STrEdDragNDropAsChild;
  btnOK.Caption := SOkButton;
  btnCancel.Caption := SCancelButton;
  btnApply.Caption := SApply0;
  GroupBox2.Caption := STrEdItemProperties;
  Label1.Caption := STrEdText;
  Label8.Caption := STrEdIndexes;
  Label2.Caption := STrEdImage;
  Label3.Caption := STrEdSelected;
  Label4.Caption := STrEdStateIndex;
  Label5.Caption := STrEdOverlay;
  chkParentFont.Caption := STrEdParentFont;
  Label9.Caption := STrEdFont;
  chkParentColor.Caption := STrEdParentColor;
  Label6.Caption := STrEdColor;
  Label10.Caption := STrEdType;
  chkAllowGrayed.Caption := STrEdAllowGrayed;
  Label7.Caption := STrEdState;
  chkReadOnly.Caption := STrEdReadOnly;
end;

initialization
  RegisterClass(TfrmTreeNodesEditor);
end.
