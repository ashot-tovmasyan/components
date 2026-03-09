{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit Unit1;

interface
{$I dc.inc}
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBTables, StdCtrls, Grids, DBGrids, shellapi, ExtCtrls,
  ComCtrls, dcDTree, dcinfotree, DBCtrls, dcinfodb, Buttons, dcnTree;

const
  BigTableRecordCount = 10000;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    DirTableBut: TButton;
    BigTableBut: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    DCInfoListView2: TDCInfoListView;
    DCInfoTree2: TDCInfoTree;
    GroupBox1: TGroupBox;
    OnlyFoldersCheck: TCheckBox;
    SmartLoadCheck: TCheckBox;
    DBNavigator1: TDBNavigator;
    MultiColumnCheck: TCheckBox;
    MultiSelectCheck: TCheckBox;
    Panel4: TPanel;
    DCInfoTree1: TDCInfoTree;
    DCInfoListView1: TDCInfoListView;
    Splitter1: TSplitter;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel5: TPanel;
    Desc: TLabel;
    Url: TLabel;
    Label8: TLabel;
    ColorDialog1: TColorDialog;
    OnlySiblings: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure EditButClick(Sender: TObject);
    procedure BigTableButClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DirTableButClick(Sender: TObject);
    procedure NilButClick(Sender: TObject);
    procedure OnlyFoldersCheckClick(Sender: TObject);
    procedure SmartLoadCheckClick(Sender: TObject);
    procedure MultiColumnCheckClick(Sender: TObject);
    procedure MultiSelectCheckClick(Sender: TObject);
    procedure DCInfoTree2GetNodeParams(Sender: TObject; Node: TInfoNode;
      const InfoSet: IUnknown);
    procedure PageControl1Change(Sender: TObject);
    procedure OnlySiblingsClick(Sender: TObject);
    procedure DCInfoListView1Change(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure TreeViewDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure UrlClick(Sender: TObject);
    procedure DCInfoTree1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure DCInfoTree1DragDrop(Sender, Source: TObject; X, Y: Integer);
  private
    firsttime: boolean;

    procedure OpenDirTable;
    procedure SetInfoSet(InfoSet: TComponent);
    function ActiveTree: TDCInfoTree;
    function ActiveListView: TDCInfoListView;
  end;

var
  Form1: TForm1;

const
  Descriptions: array[0..2] of string =
  (
    'This page illustrates how InfoTree can be used to work with master/detail tables. ' +
    #13#10#13#10'Event handler is used to customize each node - all companies ' +
    'from the US are displayed with the blue color.',

    'Here Dream InfoTree is used to display data from the self-referenced table. ' +
    #13#10#13#10'Dream Info List View situated to the' +
    ' right of the InfoTree shows the details of ' +
    'the currently selected in tree-view record.' +
    #13#10#13#10'Drag and drop can be easily implemented' +
    ' with Dream InfoTree!',

    'Use Shift + Arrows or Ctrl  + Mouse buttons to select items in tree.' +
    ' Or select them with mouse like you do it in ListView.' +
    #13#10#13#10'Don''t miss radio buttons and check boxes, ' +
    'different font styles for tree nodes'
    );

implementation

uses datamod{$IFDEF D4}, imglist{$ENDIF};

{$R *.DFM}
{$R *.DCR}

procedure FillTable(Table: TTable);
var
  i: integer;
  parent: integer;
  DirIDField: TField;
  ParentIDField: TField;
  DirNameField: TField;
  ImageIndexField: TField;
begin
  with Table do
  try
    CreateTable;
    AddIndex('DirID', 'DirID', [ixPrimary, ixUnique]);
    AddIndex('ParentID', 'ParentID', []);
    Open;

    Screen.Cursor := crHourGlass;
    DisableControls;
    DirIDField := FieldByName('DirID');
    ParentIDField := FieldByName('ParentID');
    DirNameField := FieldByName('DirName');
    ImageIndexField := FieldByName('ImageIndex');

    for i := 1 to BigTableRecordCount - 1 do
    begin
      Append;
      parent := i div 10;
      if parent = 0 then
        dec(parent);
      DirIDField.AsInteger := i;
      ParentIDField.AsInteger := parent;
      ImageIndexField.AsInteger := ord(i < BigTableRecordCount div 10);
      DirNameField.AsString := 'Item No ' + IntToStr(i) + ' Parent No ' + IntToStr(Parent);
      Post;
    end;

    IndexFieldNames := 'ParentID';
  finally
    EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure SetTable(Table: TTable);
begin
  with DataModule2.DataSource1 do
    if Dataset <> Table then
      Dataset := Table;
end;

const
  TreeDBName = 'tree.db';

procedure TForm1.OpenDirTable;
var
  AppFolder: string;
begin
  if not DataModule2.DirTable.Active then
  begin
    AppFolder := ExtractFilePath(ParamStr(0));
    if (Length(AppFolder) > 0) and (AppFolder[length(AppFolder)] <> '\') then
      AppFolder := AppFolder + '\';

    with DataModule2.DirTable do
      if FileExists(AppFolder + TreeDBName) then
        DataBaseName := AppFolder
      else if FileExists(AppFolder + '..\' + TreeDBName) then
        DataBaseName := AppFolder + '..\'
      else
        raise Exception.Create('Can''t find ' + TreeDBName);
    with DataModule2 do
      BigTable.DataBaseName := DirTable.DataBaseName;
    DataModule2.DirTable.Open;
  end;

  SetTable(DataModule2.DirTable);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  firsttime := true;
  OpenDirTable;
  DataModule2.ImageList1.ResourceLoad(rtBitmap, 'IMAGES', clSilver);
  with DataModule2 do
    DataSetsChangeActive([DirTable, Cust, OrdByCust, ItemsByOrd, Parts], true);
  PageControl1.ActivePage := TabSheet2;
  PageControl1Change(nil);
end;

procedure TForm1.EditButClick(Sender: TObject);
begin
  DcInfoTree1.EditSelected;
end;

procedure TForm1.BigTableButClick(Sender: TObject);
begin
  if firsttime then
  begin
    if Messagedlg('Create table with ' + IntToStr(BigTableRecordCount) + ' records and load it in TreeView?', mtConfirmation, [mbYes, mbNo], 0) <> idYes then
      exit;

    FillTable(DataModule2.BigTable);

    firsttime := false;
  end;

  SetInfoSet(DataModule2.BigRelISet);
  SetTable(DataModule2.BigTable);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  with DataModule2 do
    DataSetsChangeActive([DirTable, {BioTable, } Cust, OrdByCust, ItemsByOrd, Parts], false);

  if not firsttime then
    with DataModule2.BigTable do
    begin
      Close;
      DeleteTable;
    end;
end;

procedure TForm1.DirTableButClick(Sender: TObject);
begin
  OpenDirTable;
  SetInfoSet(DataModule2.DirRelISet);
end;

procedure TForm1.NilButClick(Sender: TObject);
begin
  SetInfoSet(nil);
  DataModule2.DataSource1.Dataset := nil;
end;

procedure TForm1.SetInfoSet(InfoSet: TComponent);
begin
  DCInfoTree1.InfoSet := InfoSet;
  //  DCInfoListView1.InfoSet := InfoSet;
end;

procedure SetOption(InfoTree: TDCInfoTree; Option: TInfoTreeOption; IsSet: boolean);
var
  NewOptions: TInfoTreeOptions;
begin
  DisableDataSets([DataModule2.OrdByCust, DataModule2.ItemsByOrd]);
  try
    with InfoTree do
    begin
      NewOptions := Options;

      if IsSet then
        Include(NewOptions, Option)
      else
        Exclude(NewOptions, Option);

      Options := NewOptions;
    end;
  finally
    EnableDataSets([DataModule2.OrdByCust, DataModule2.ItemsByOrd]);
  end;
end;

procedure SetListOption(LView: TDCInfoListView; Option: TInfoListOption; IsSet: boolean);
var
  NewOptions: TInfoListOptions;
begin
  with LView do
  begin
    NewOptions := Options;

    if IsSet then
      Include(NewOptions, Option)
    else
      Exclude(NewOptions, Option);

    Options := NewOptions;
  end;
end;

function TForm1.ActiveTree: TDCInfoTree;
begin
  case PageControl1.ActivePage.TabIndex of
    0: result := DCInfoTree2;
    1: result := DCInfoTree1;
    else
      result := nil;
  end;
end;

function TForm1.ActiveListView: TDCInfoListView;
begin
  if PageControl1.ActivePage = TabSheet1 then
    result := DCInfoListView1
  else
    result := DCInfoListView2;
end;

procedure TForm1.OnlyFoldersCheckClick(Sender: TObject);
begin
  SetOption(TDCInfoTree(ActiveTree), itoOnlyFolders, OnlyFoldersCheck.Checked)
end;

procedure TForm1.SmartLoadCheckClick(Sender: TObject);
begin
  SetOption(TDCInfoTree(ActiveTree), itoSmartLoad, SmartLoadCheck.Checked);
end;

procedure TForm1.MultiColumnCheckClick(Sender: TObject);
const
  VStyles: array[boolean] of TViewStyle = (vsList, vsReport);
begin
  ActiveListView.ViewStyle := VStyles[MultiColumnCheck.Checked];
end;

procedure TForm1.MultiSelectCheckClick(Sender: TObject);
begin
  with MultiSelectCheck do
  begin
    ActiveListView.MultiSelect := Checked;
    ActiveTree.MultiSelect := Checked;
  end;
end;

procedure TForm1.DCInfoTree2GetNodeParams(Sender: TObject; Node: TInfoNode;
  const InfoSet: IUnknown);
var
  DataSet: TDataSet;
begin
  DataSet := InfoSetToDataSet(InfoSet);

  Node.ImageIndex := Node.Level + 3;
  Node.SelectedIndex := Node.Level + 3;

  if (DataSet = DataModule2.Cust) and (DataModule2.CustCountry.AsString = 'US') then
  begin
    Node.FontStyle := [fsBold];
    Node.FontColor := clBlue;
  end
  else
  begin
    Node.FontStyle := [];
    Node.FontColor := clBlack;
  end;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
var
  Tree: TDCInfoTree;
  TreeOptions: TInfoTreeOptions;
  ListOptions: TInfoListOptions;
  LView: TDCInfoListView;
  InfoOpt: boolean;
begin
  Tree := ActiveTree;
  LView := ActiveListView;

  InfoOpt := true {PageControl1.ActivePage <> TabSheet3};

  if InfoOpt then
  begin
    TreeOptions := TDCInfoTree(Tree).Options;
    ListOptions := LView.Options;

    OnlyFoldersCheck.Checked := itoOnlyFolders in TreeOptions;
    SmartLoadCheck.Checked := itoSmartLoad in TreeOptions;
    MultiColumnCheck.Checked := LView.ViewStyle = vsReport;
  end;

  MultiSelectCheck.Checked := Tree.MultiSelect;
  OnlySiblings.Checked := Tree.SelectOnlySiblings;
  Desc.Caption := Descriptions[PageControl1.ActivePage.PageIndex];

  OnlyFoldersCheck.Enabled := InfoOpt;
  SmartLoadCheck.Enabled := InfoOpt;
  MultiColumnCheck.Enabled := InfoOpt;

end;

procedure TForm1.OnlySiblingsClick(Sender: TObject);
begin
  ActiveTree.SelectOnlySiblings := OnlySiblings.Checked;
end;

procedure TForm1.DCInfoListView1Change(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  ;
end;

procedure TForm1.TreeViewDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := true;
end;

procedure TForm1.UrlClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar(Url.Caption), nil, nil, SW_SHOW);
end;

procedure TForm1.DCInfoTree1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  TargetNode, Selected: TDCTreeNode;
begin
  Accept := Sender = Source;

  if Accept then
  begin
    Accept := False;
    TargetNode := DCInfoTree1.GetNodeAt(X, Y);
    if TargetNode = nil then
      Exit;
    Selected := DCInfoTree1.Selected;
    while TargetNode <> nil do
    begin
      if TargetNode = Selected then
        Exit;
      TargetNode := TargetNode.Parent;
    end;
    Accept := True;
  end;
end;

procedure TForm1.DCInfoTree1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  TargetNode: TDCTreeNode;
  id: integer;
begin
  TargetNode := DCInfoTree1.GetNodeAt(X, Y);
  if TargetNode = nil then
    exit;
  DCInfoTree1.SetToNode(TargetNode);
  id := GetNodeFieldValue(TargetNode, 'DirID');
  DCInfoTree1.SetToNode(DCInfoTree1.Selected);
  with DataModule2.DataSource1.DataSet do
  begin
    Edit;
    FieldByName('ParentID').AsInteger := id;
    Post;
  end;
end;

end.
