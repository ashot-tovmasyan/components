unit Unit1;

interface
{$I Outbar.inc}
{$R dcoutbmp.res}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, dcOutBar, commctrl,ComCtrls, {$IFDEF D4} ImgList, {$ENDIF}
  Buttons, shellapi, ExtCtrls, Menus, dcOutPanel, dcOutCommon;

type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    Icon1: TMenuItem;
    List1: TMenuItem;
    N2: TMenuItem;
    Addnewgroup1: TMenuItem;
    DeleteGroup1: TMenuItem;
    EditCaption1: TMenuItem;
    N1: TMenuItem;
    AddIcon1: TMenuItem;
    DeleteIcon1: TMenuItem;
    Edit: TMenuItem;
    SmallImageList: TImageList;
    LargeImageList: TImageList;
    DCGroupBar1: TDCGroupBar;
    DCOutBarGroup2: TDCOutBarGroup;
    DCOutBarGroup4: TDCOutBarGroup;
    TreeView1: TTreeView;
    Memo1: TMemo;
    Label6: TLabel;
    DCGroupBar2: TDCGroupBar;
    DCOutBarGroup5: TDCOutBarGroup;
    DCOutBarGroup6: TDCOutBarGroup;
    Label2: TLabel;
    Label8: TLabel;
    DCOutBar1: TDCOutBar;
    DCOutBarGroup1: TDCOutBarGroup;
    DCOutBarVertListView1: TDCOutBarVertListView;
    DCOutBarGroup3: TDCOutBarGroup;
    Button1: TButton;
    Button3: TButton;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    OpenDialog1: TOpenDialog;
    DCOutBarGroup8: TDCOutBarGroup;
    DCSplitterPanel1: TDCSplitterPanel;
    OutlookBarPanel: TDCSplitterPanel;
    DCOutBar: TDCOutBar;
    DCOutBarGroup9: TDCOutBarGroup;
    DCOutBarVertListView2: TDCOutBarVertListView;
    DCOutBarGroup10: TDCOutBarGroup;
    DCOutBarVertListView4: TDCOutBarVertListView;
    DCSplitterPanel3: TDCSplitterPanel;
    DCSplitterPanel2: TDCSplitterPanel;
    DCOutHeader: TDCOutHeader;
    TreeListPanel: TDCSplitterPanel;
    FolderListPanel: TDCSplitterPanel;
    hpFolderList: TDCHeaderPanel;
    TreeView2: TTreeView;
    tvFolderList: TTreeView;
    DCSplitterPanel6: TDCSplitterPanel;
    DCSplitterPanel5: TDCSplitterPanel;
    lvMessages: TListView;
    PreviewPanePanel: TDCSplitterPanel;
    Panel2: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    lblFrom: TLabel;
    lblSubject: TLabel;
    SmallImages: TImageList;
    LargeImages: TImageList;
    Panel1: TPanel;
    StatusPanel: TPanel;
    Panel3: TPanel;
    chkOutbar: TCheckBox;
    chkFolderList: TCheckBox;
    chkPreviewPane: TCheckBox;
    txtLetter: TMemo;
    GroupBox2: TGroupBox;
    chkFlat: TCheckBox;
    chkHotTrack: TCheckBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    cbxViewStyle: TComboBox;
    Label9: TLabel;
    cbxBackgroundStyle: TComboBox;
    chkOneSelected: TCheckBox;
    Label3: TLabel;
    lblWWW: TLabel;
    Label4: TLabel;
    lblEMail: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    cbxStartGradientColor: TComboBox;
    cbxStopGradientColor: TComboBox;
    CheckBox5: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox3: TCheckBox;
    cbxHighlightSelection: TCheckBox;
    procedure Addnewgroup1Click(Sender: TObject);
    procedure DeleteGroup1Click(Sender: TObject);
    procedure EditCaption1Click(Sender: TObject);
    procedure AddIcon1Click(Sender: TObject);
    procedure DeleteIcon1Click(Sender: TObject);
    procedure List1Click(Sender: TObject);
    procedure DCOutBar1Change(Sender: TObject);
    procedure cbxViewStyleClick(Sender: TObject);
    procedure EditClick(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure chkFlatClick(Sender: TObject);
    procedure chkHotTrackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DCOutBar1ButtonClick(Sender: TObject; Item: TListItem);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure cbxBackgroundStyleChange(Sender: TObject);
    procedure DCOutBarButtonClick(Sender: TObject; Item: TListItem);
    procedure hpFolderListRightButtonClick(Sender: TObject);
    procedure lvMessagesChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure tvFolderListChange(Sender: TObject; Node: TTreeNode);
    procedure chkOutbarClick(Sender: TObject);
    procedure chkFolderListClick(Sender: TObject);
    procedure chkPreviewPaneClick(Sender: TObject);
    procedure lblEMailClick(Sender: TObject);
    procedure chkOneSelectedClick(Sender: TObject);
    procedure cbxStartGradientColorChange(Sender: TObject);
    procedure cbxHighlightSelectionClick(Sender: TObject);
  private
    { Private declarations }
    FDisableUpdateCheckBox:Boolean;
    FNumber:Integer;
    FUpdateTree:Boolean;
    Procedure UpdateCaptions(Item:TListItem);
    Procedure UpdateOutBar(Node:TTreeNode);
    Procedure UpdateTree(Item:TListItem);
    Procedure FillComboBox(const s: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

const
  HelloText = 'Welcome to Dream Outbar - incredible pack of eight powerful controls that give you new exciting possibilities'+
              ' for creating highly customizable applications with user friendly interface. Product includes the following components:'+
        #13#10#13#10'� TDCOutbar implements functionality of Outlook Bar used in Microsoft Outlook, Microsoft Frontpage and Microsoft Office 2000. It has the same interface and features;'+
        #13#10#13#10'� TDCGroupBar can be considered as an advanced page control with Outlook Bar interface;'+
        #13#10#13#10'� TDCVertListView is a list view with real hottrack and vertically ordered items. TDCTranspScrollBar is a scroll bar that can be transparent and has the hidden thumb;'+
        #13#10#13#10'� TDCScrollButton is a scroll button that can be placed on the form and used without a scroll bar. Different standard Windows glyphs can be displayed in this control;'+
        #13#10#13#10'� TDCOutHeader is a control that implements functionality of the MS Outlook Header;'+
        #13#10#13#10'� TDCHeaderControl allows you to create nice MS Outlook style headers with highly customizabe parameters;'+
        #13#10#13#10'� TDCSplitterPanel provides an easy-in-use horizontal and vertiacal splitter panels.'+
        #13#10#13#10#13#10+
              'With these controls you will be able to create better programs faster and easier!';

procedure TForm1.FillComboBox(const s: string);
begin
  cbxStartGradientColor.Items.Add(s);
  cbxStopGradientColor.Items.Add(s);
end;

Procedure TForm1.UpdateCaptions(Item:TListItem);
Begin
  Caption:='Dream Outbar Demo "'+Item.Caption+'" Clicked';
  DCOutHeader.Caption:=Item.Caption;
  DCOutHeader.ImageIndex:=Item.ImageIndex;
  StatusPanel.Caption:=Item.Caption;
End;

Procedure TForm1.UpdateOutBar(Node:TTreeNode);
  Function SearchInGroup(Group:TDCOutBarGroup):Boolean;
  Var
    J:Integer;
  Begin
    With Group.ListView Do
      For J:=0 To Items.Count-1 Do
        If Items[J].ImageIndex=Node.ImageIndex Then
        Begin
          DCOutBar.ActiveGroup:=Group;
          Selected:=Items[J];
          Result:=True;
          Exit;
        End;
    Result:=False;
  End;
Var
  I:Integer;
Begin
  FUpdateTree:=False;
  Try
    If SearchInGroup(DCOutBar.ActiveGroup) Then
      Exit;
    For I:=0 To DCOutBar.GroupCount-1 Do
      If SearchInGroup(DCOutBar.Groups[I]) Then
        Exit;
  Finally
    FUpdateTree:=True;
  End;
End;

Procedure TForm1.UpdateTree(Item:TListItem);
Var
  I:Integer;
Begin
  If Not FUpdateTree Then
    Exit;
  If Item=Nil Then
    tvFolderList.Selected:=Nil
  Else
    For I:=0 To tvFolderList.Items.Count-1 Do
      If tvFolderList.Items[I].ImageIndex=Item.ImageIndex Then
      Begin
        tvFolderList.Selected:=tvFolderList.Items[I];
        Exit;
      End;
End;

procedure TForm1.Addnewgroup1Click(Sender: TObject);
Var
  ListView:TDCVertListView;
begin
  ListView:=DCOutBar1.AddNewgroup.ListView;
  If ListView<>nil then
  With ListView do
  begin
    LargeImages:=LargeImageList;
    SmallImages:=SmallImageList;
  end;
end;

procedure TForm1.DeleteGroup1Click(Sender: TObject);
begin
  if DCOutbar1.ActiveListView <> nil then
  with DCOutBar1 do
    RemoveGroup(ActiveGroup)
end;

procedure TForm1.EditCaption1Click(Sender: TObject);
begin
  if (DCOutBar1.ActiveListView <> nil) then
    DCOutBar1.EditActiveGroupCaption;
end;

procedure TForm1.AddIcon1Click(Sender: TObject);
Var
  Item:TListItem;
begin
  if (DCOutBar1.ActiveListView <> nil)
  then
    with DCOutBar1.ActiveListView do
    Begin
      Item:=Items.Add;
      Item.Caption:='New Item'+IntToStr(FNumber);
      Inc(FNumber);
    End;
end;

procedure TForm1.DeleteIcon1Click(Sender: TObject);
begin
  if DCOutBar1.ActiveListView <> nil then
  with DCOutBar1.ActiveListView do
    if HotItem <> nil then
      HotItem.Free;
end;

procedure TForm1.List1Click(Sender: TObject);
begin
  if (DCOutBar1.ActiveListView <> nil)
  then
    with DCOutBar1.ActiveListView, (Sender as TmenuItem) do
    begin
      ViewStyle := TViewStyle(Tag);
      cbxViewStyle.ItemIndex := Integer(ViewStyle);
      cbxViewStyleClick(Self);
    end;
end;

procedure TForm1.DCOutBar1Change(Sender: TObject);
begin
  if (DCOutBar1.ActiveListView <> nil)
  then
    with DCOutBar1.ActiveListView do
    begin
      Icon1.Checked := ViewStyle = vsIcon;
      List1.Checked := ViewStyle = vsSmallIcon;
      cbxViewStyle.ItemIndex := Integer(ViewStyle);
      cbxBackgroundStyle.ItemIndex := integer (BackGroundMode);
      cbxStartGradientColor.Text := ColorToString(GradientBeginColor);
      cbxStopGradientColor.Text := ColorToString(GradientEndColor);
      cbxStartGradientColor.Enabled :=
        (cbxBackGroundStyle.ItemIndex = integer(bkmGradientHorz)) or
        (cbxBackGroundStyle.ItemIndex = integer(bkmGradientVert));
      cbxStopGradientColor.Enabled := cbxStartGradientColor.Enabled;
    end;
end;

procedure TForm1.EditClick(Sender: TObject);
begin
  if (DCOutBar1.ActiveListView <> nil)
  then
    with DCOutBar1.ActiveListView do
      if HotItem <> nil then
        HotItem.EditCaption;
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
  JumpToURL('www.dream-com.com');
end;

procedure TForm1.lblEMailClick(Sender: TObject);
begin
  JumpToURL('mailto:contact@dream-com.com');
end;

procedure TForm1.chkFlatClick(Sender: TObject);
begin
  DCOutBar1.FlatGroups := not DCOutBar1.FlatGroups;
end;

procedure TForm1.chkHotTrackClick(Sender: TObject);
begin
  DCOutBar1.HotTrack := not DCOutBar1.HotTrack;
end;

procedure TForm1.FormCreate(Sender: TObject);
const s = 'You can put any control inside the TDCGroupBar. And not only one control - '
        + 'you may put as many controls as you need in every group. For example, place '
        + 'a TTreeView control in the one group and TMemo in the other. '
        + 'Possibilities that are opened before you now are really unlimited! '
        + 'TDCGroupBar is a control for the real programmers!';
var i : byte;
    Item : TListItem;
const    names : array [1..9] of string = ('Outlook', 'Text', 'Send', 'Address Book', 'Attach', 'Mail', 'Copy', 'Note', 'Letter');
begin

  with DCOutBar1.Groups[1].ListView do
    for i:=1 to 5 do
    begin
      Item := Items.Add;
      Item.Caption := names[i];
      Item.ImageIndex := i-1;
    end;

  with DCOutBar1.Groups[0].ListView do
    for i:=6 to 8 do
    begin
      Item := Items.Add;
      Item.Caption := names[i];
      Item.ImageIndex := i-1;
    end;

  LargeImageList.ResourceLoad(rtBitmap, 'BITMAP2', clFuchsia);
  SmallImageList.ResourceLoad(rtBitmap, 'BITMAP1', clFuchsia);

  TreeView1.FullExpand;
  DCGroupBar1.ActiveGroupIndex := 0;
  Memo1.Text := s;
  cbxBackgroundStyle.ItemIndex := integer (DCOutbar1.ActiveListView.BackGroundMode);
  DCGroupbar2.ActiveGroupIndex := 0;

  lblWWW.Cursor := crHandPoint;
  lblEMail.Cursor := crHandPoint;

  FNumber:=1;

  //Outbar Controls
  LargeImages.ResourceLoad(rtBitmap, 'LARGEIMAGES', clFuchsia);
  SmallImages.ResourceLoad(rtBitmap, 'SMALLIMAGES', clFuchsia);

  lvMessages.Selected:=lvMessages.Items[0];
  FUpdateTree:=True;
  txtLetter.WordWrap:=False;
  txtLetter.Lines.Text := HelloText;
  txtLetter.WordWrap:=True;
  GetColorValues(FillComboBox);
  cbxStartGradientColor.Text := ColorToString(DCOutbar1.GradientBeginColor);
  cbxStopGradientColor.Text := ColorToString(DCOutbar1.GradientEndColor);
  cbxStartGradientColor.Enabled := False;
  cbxStopGradientColor.Enabled := False;
end;

procedure TForm1.DCOutBar1ButtonClick(Sender: TObject; Item: TListItem);
begin
  Caption:='Dream Outbar Demo "'+Item.Caption+'" Clicked';
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
     if DCOutBar1.SelectionType = stStandard then
       DCOutBar1.SelectionType := stExpanded
     else DCOutBar1.SelectionType := stStandard;
end;

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
  DCOutBar1.SunkSelected:=Not DCOutBar1.SunkSelected;
end;

procedure TForm1.CheckBox5Click(Sender: TObject);
begin
  DCOutBar1.DragEnabled:=Not DCOutBar1.DragEnabled
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
     if (DCOutBar1.ActiveListView <> nil) then
     begin
       if OpenDialog1.Execute then
       begin
        DCOutBar1.ActiveListView.Background.LoadFromFile(OpenDialog1.FileName);
        if cbxBackgroundStyle.ItemIndex = 0 then
        begin
          DCOutbar1.ActiveListView.BackgroundMode := bkmCenter;
          cbxBackgroundStyle.ItemIndex := integer(DCOutbar1.ActiveListView.BackgroundMode);
        end;
       end;
     end;
end;

procedure TForm1.cbxViewStyleClick(Sender: TObject);
begin
  if (DCOutBar1.ActiveListView <> nil)
  then
    with DCOutBar1.ActiveListView do
    begin
      ViewStyle := TViewStyle(cbxViewStyle.ItemIndex);
      If cbxViewStyle.ItemIndex=0 Then
      Begin
        Icon1.Checked:=True;
        List1.Checked:=False;
      End
      Else
      Begin
        Icon1.Checked:=False;
        List1.Checked:=True;
      End;
    End;  
end;

procedure TForm1.cbxBackgroundStyleChange(Sender: TObject);
begin
  if (DCOutBar1.ActiveListView <> nil) then
    DCOutBar1.ActiveListView.BackgroundMode := TBackGroundMode(cbxBackgroundStyle.ItemIndex);
  cbxStartGradientColor.Enabled :=
    (cbxBackGroundStyle.ItemIndex = integer(bkmGradientHorz)) or
    (cbxBackGroundStyle.ItemIndex = integer(bkmGradientVert));
  cbxStopGradientColor.Enabled := cbxStartGradientColor.Enabled;
end;

procedure TForm1.DCOutBarButtonClick(Sender: TObject; Item: TListItem);
begin
  UpdateCaptions(Item);
  UpdateTree(Item);
end;

procedure TForm1.hpFolderListRightButtonClick(Sender: TObject);
begin
  If DCOutHeader.ButtonInCaption Then //already not switched
  Begin
    TreeListPanel.SmoothVisible:=False;
    FolderListPanel.Visible:=True;
    TreeListPanel.SmoothVisible:=True;
  End
  Else
  Begin
    TreeListPanel.SmoothVisible:=False;
    FolderListPanel.Visible:=False;
    TreeListPanel.SmoothVisible:=True;
  End;
  FDisableUpdateCheckBox:=True;
  chkFolderList.Checked:=DCOutHeader.ButtonInCaption;
  FDisableUpdateCheckBox:=False;
end;

procedure TForm1.lvMessagesChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  If Item=Nil Then
    Exit;
  lblFrom.Caption:=Item.Caption;
  lblSubject.Caption:=Item.SubItems[0];
end;

procedure TForm1.tvFolderListChange(Sender: TObject; Node: TTreeNode);
begin
  If tvFolderList.Showing Then
    UpdateOutBar(Node);
end;

procedure TForm1.chkOutbarClick(Sender: TObject);
begin
  OutlookBarPanel.Visible:=chkOutBar.Checked;
end;

procedure TForm1.chkFolderListClick(Sender: TObject);
begin
  If FDisableUpdateCheckBox Then
    Exit;
  If chkFolderList.Checked Then
  Begin
    hpFolderList.Visible:=chkFolderList.Checked;
    FolderListPanel.Visible:=chkFolderList.Checked;
  End
  Else
  Begin
    FolderListPanel.Visible:=chkFolderList.Checked;
    hpFolderList.Visible:=chkFolderList.Checked;
  End;
end;

procedure TForm1.chkPreviewPaneClick(Sender: TObject);
begin
  PreviewPanePanel.Visible:=chkPreviewPane.Checked;
end;

procedure TForm1.chkOneSelectedClick(Sender: TObject);
begin
  DCOutBar1.OneSelected:=chkOneSelected.Checked;
end;

procedure TForm1.cbxStartGradientColorChange(Sender: TObject);
begin
  if DCOutBar1.ActiveListView <> nil then
    with DCOutBar1.ActiveListView do
    begin
      GradientBeginColor := StringToColor(cbxStartGradientColor.Text);
      GradientEndColor := StringToColor(cbxStopGradientColor.Text);
    end;
end;

procedure TForm1.cbxHighlightSelectionClick(Sender: TObject);
begin
  DCOutBar1.HighlightSelection:=cbxHighlightSelection.Checked;
end;

end.

 