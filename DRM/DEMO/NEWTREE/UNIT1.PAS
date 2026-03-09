{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit unit1;

interface

{$I DC.INC}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Menus, Buttons, dcntree, dctred, {$IFDEF D4}ImgList,{$ENDIF} ExtCtrls, shellapi;


type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Demo1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    ImageList1: TImageList;
    Tree: TDCTree;
    Label1: TLabel;
    TreeView1: TMenuItem;
    Label3: TLabel;
    Button1: TButton;
    ColorDialog1: TColorDialog;
    Button2: TButton;
    FontDialog1: TFontDialog;
    CheckBox1: TCheckBox;
    TabSheet2: TTabSheet;
    CheckBox2: TCheckBox;
    Panel1: TPanel;
    TreeView2: TTreeView;
    DCTree1: TDCTree;
    LargeView1: TMenuItem;
    TabSheet3: TTabSheet;
    Panel17: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    DownloadURL: TLabel;
    HelpFilesURL: TLabel;
    ManualURL: TLabel;
    SellAllBut: TButton;
    DeSelAllBut: TButton;
    EditTreeBut: TButton;
    TreeView3: TDCTree;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    DreamCompany1: TMenuItem;
    Label6: TLabel;
    Edit2: TEdit;
    Splitter1: TSplitter;
    Button5: TButton;
    Button6: TButton;
    CheckBox3: TCheckBox;
    Button7: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label24: TLabel;
    Image1: TImage;
    Label21: TLabel;
    Label29: TLabel;
    lblWWW: TLabel;
    Label22: TLabel;
    lblEMail: TLabel;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure LargeView1Click(Sender: TObject);
    procedure SellAllButClick(Sender: TObject);
    procedure DeSelAllButClick(Sender: TObject);
    procedure EditTreeButClick(Sender: TObject);
    procedure DownloadURLClick(Sender: TObject);
    procedure lblEMailClick(Sender: TObject);
    procedure DreamCompany1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure lblWWWClick(Sender: TObject);
  private
    Time : DWord;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.DFM}

procedure JumpToURL(const s : string);
begin
  ShellExecute(Application.Handle, nil, PChar(s), nil, nil, SW_SHOW);
end;

function Log10(X: Extended): Extended;
  { Log.10(X) := Log.2(X) * Log.10(2) }
asm
        FLDLG2     { Log base ten of 2 }
        FLD     X
        FYL2X
        FWAIT
end;

procedure AddTreeNodes(Tree : TTreeView; ARecords : integer; AddToRoot : boolean);
var
  i       : integer;
  ANode   : TTreeNode;
  X       : extended;
  ALevels : integer;


  procedure AddNode(Node : TTreeNode);
  var
    count : integer;
  begin
    if (i >= ARecords) or ((Node <> nil) and (Node.Level = ALevels)) then
      exit;
    for count := 1 to 10 do
    begin
      if (count = 10) and (Node = nil) then
        break;
      inc(i);
      ANode := Tree.Items.AddChild(Node, 'New Node' + IntToStr(i));
      AddNode(ANode);
    end;
  end;
begin

  with Tree do
  begin
    if AddToRoot then
      for i := 0 to ARecords - 1 do
        Items.AddChild(nil, 'New Node' + IntToStr(i))
      else
      begin
        i := 0;
        X := Log10(ARecords) - 1;
        if X = trunc(X) then
          ALevels := trunc(X)
        else
          ALevels := trunc(X) + 1;
        AddNode(nil);
      end;
  end;
end;


procedure AddDCTreeNodes(Tree : TDCTree; ARecords : integer; AddToRoot : boolean);
var
  i       : integer;
  ANode   : TDCTreeNode;
  X       : extended;
  ALevels : integer;


  procedure AddNode(Node : TDCTreeNode);
  var
    count : integer;
  begin
    if (i >= ARecords) or ((Node <> nil) and (Node.Level = ALevels)) then
      exit;
    for count := 1 to 10 do
    begin
      if (count = 10) and (Node = nil) or (i >= ARecords) then
        break;
      inc(i);
      ANode := Tree.Items.AddChild(Node, 'New Node' + IntToStr(i));
      AddNode(ANode);
    end;
  end;
begin

  with Tree do
  begin
    if AddToRoot then
      for i := 0 to ARecords - 1 do
        Items.AddChild(nil, 'New Node' + IntToStr(i))
      else
      begin
        i := 0;
        X := Log10(ARecords) - 1;
        if X = trunc(X) then
          ALevels := trunc(X)
        else
          ALevels := trunc(X) + 1;
        AddNode(nil);
      end;
  end;
end;


procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  ShowMessage('Dream Tree demo '#13#10'Copyright (c) 1999-2000 Dream Company');
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Tree.FullExpand;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Node : TDCTreeNode;
begin
  PageControl1.ActivePage := TabSheet1;

  with Tree, Items do
  begin
    Node := GetFirstNode;
    while Assigned(Node) do
    begin
      Node.NodeType := ntRadioButton;
      Node := Node.GetNextSibling;
    end;
    Selected := Items[0];
  end;
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
   with ColorDialog1 do
   begin
     Color := Tree.Color;
     if Execute then
       Tree.Color := Color;
   end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i : integer;
begin
  if Tree.Selected <> nil then
    with FontDialog1 do
    begin
      Font := Tree.Selected.Font;
      if Execute then
        for i := 0 to Tree.SelectedCount - 1 do
          Tree.SelectedItems[i].Font := Font;
    end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  Tree.MultiSelect := CheckBox1.Checked;
end;

procedure TForm1.TreeView1Click(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
    Tree.CheckBoxesType := ctCustom
  else
    Tree.CheckBoxesType := ctNone;
end;

procedure TForm1.LargeView1Click(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet2;
end;

procedure TForm1.SellAllButClick(Sender: TObject);
var
  Node : TDCTreeNode;
begin
  with Tree do
  begin
    Node := Items.GetFirstNode;
    while Node <> nil do
    begin
      Node.Selected := true;
      Node := Node.GetNext;
    end;
  end;
  Tree.SetFocus;
end;

procedure TForm1.DeSelAllButClick(Sender: TObject);
begin
  Tree.Selected := nil;
  Tree.SetFocus;
end;

procedure TForm1.EditTreeButClick(Sender: TObject);
begin
  EditItems(Tree);
end;

procedure TForm1.DownloadURLClick(Sender: TObject);
begin
  JumpToUrl('http://www.dream-com.com/download.html');
end;

procedure TForm1.lblEMailClick(Sender: TObject);
begin
  JumpToUrl('mailto:' + lblEMail.Caption);
end;

procedure TForm1.DreamCompany1Click(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet3;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Time := GetTickCount;
  Screen.Cursor := crHourGlass;
  if RadioButton1.Checked then
    with DCTree1, Items do
    begin
      BeginUpdate;
      try
        case (Sender as TButton).Tag of
          0 : AddDCTreeNodes(DCTree1, StrToInt(Edit2.Text), CheckBox3.Checked);
          1 : FullExpand;
          2 : Clear;
        end;
      finally
        EndUpdate;
      end;
    end
  else
    with TreeView2, Items do
    begin
      BeginUpdate;
      try
        case (Sender as TButton).Tag of
          0 : AddTreeNodes(TreeView2, StrToInt(Edit2.Text), CheckBox3.Checked);
          1 : FullExpand;
          2 : Clear;
        end;
      finally
        EndUpdate;
      end;
    end;
  Screen.Cursor := crDefault;
  ShowMessage(IntToStr((GetTickCount - Time)) + ' msec');
end;

procedure TForm1.lblWWWClick(Sender: TObject);
begin
  JumpToUrl((Sender as TLabel).Caption);
end;

end.
