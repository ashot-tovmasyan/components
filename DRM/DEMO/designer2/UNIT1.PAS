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
{$I dcprod.inc}
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, dcfdes, dcddes, StdCtrls, dcpalet, dcedit, Grids,
  {$IFDEF DREAMINSPECTOR}oinspect, {$ENDIF}Buttons, dcgen, dccommon, DCPalette;

const
  fp_Inside = true;
  fp_OutSide = false;

type
  TForm1 = class(TForm)
    DreamDesigner1: TDreamDesigner;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    InspectorTab: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    ReadOnlyButton: TButton;
    Edit1: TEdit;
    Button1: TButton;
    Button3: TButton;
    Label1: TLabel;
    InsertPanel1: TPanel;
    ChangeStateButton: TButton;
    Label2: TLabel;
    DCCompPalette1: TDCCompPalette;
    Panel4: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Memo3: TMemo;
    InsertPanel2: TPanel;
    InsertPanel3: TPanel;
    Panel5: TPanel;
    LoadButton: TButton;
    SaveButton: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Panel6: TPanel;
    Memo5: TMemo;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Button2: TButton;
    GroupBox1: TGroupBox;
    URL: TLabel;
    TabSheet6: TTabSheet;
    Panel7: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Panel8: TPanel;
    Label9: TLabel;
    Panel9: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    HelpFilesURL: TLabel;
    ManualURL: TLabel;
    DownloadURL: TLabel;
    Label16: TLabel;
    DreamDesignerURL: TLabel;
    Label3: TLabel;
    CtrlF12: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    SpeedButton1: TSpeedButton;
    Panel10: TPanel;
    Label6: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    TabSheet7: TTabSheet;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Image1: TImage;
    Label21: TLabel;
    lblWWW: TLabel;
    lblEMail: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label29: TLabel;
    TreeView1: TTreeView;
    Panel3: TPanel;
    Button4: TButton;
    procedure Button3Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DreamDesigner1ActiveChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure ChangeStateButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure DreamDesigner1SelectionChanged(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DreamDesignerURLClick(Sender: TObject);
    procedure DownloadURLClick(Sender: TObject);
    procedure lblEMailClick(Sender: TObject);
    procedure lblWWWClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    fFormPosition:boolean;
    {$IFDEF DREAMINSPECTOR}
    FObjectInspector1:TObjectInspector;
    {$ENDIF}
    procedure ChangeFormState(AForm: TForm; TargetPanel: TPanel; Position: Boolean);
    procedure ChangeFirstPageStyle;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, DCPalettePropUnit, dcenvopt;

{$R *.DFM}

procedure TForm1.ChangeFormState(AForm: TForm; TargetPanel: TPanel; Position: Boolean);
begin

  case Position of
    fp_Outside:
      AForm.BorderStyle := bsSizeable;
    fp_Inside:
      AForm.BorderStyle := bsNone;
  end;

  AForm.Parent := TargetPanel;
  fFormPosition := Position;
end;

procedure TForm1.ChangeFirstPageStyle;
var
  condition: boolean;
begin
  condition := (PageControl1.ActivePage.PageIndex = 0) or (PageControl1.ActivePage.PageIndex = 6);
  Button3.Visible := not condition;
  Button2.Visible := not condition;
  CtrlF12.Visible := not condition;
  HelpFilesURL.Visible := condition;
  Label16.Visible := condition;
  DreamDesignerURL.Visible := condition;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  DreamDesigner1.Active := True;
end;

{type
  TMForm = class(TForm)
  end;}

procedure TForm1.PageControl1Change(Sender: TObject);
begin
  DreamDesigner1.Active := false;
  case PageControl1.ActivePage.PageIndex of
    0, 1: Form2.Visible := False;
    2:
      begin
        Form2.Visible := False;
        ChangeFormState(Form2, nil, fp_Outside);
        Form2.Visible := True;
        Label2.Visible := True;
        ChangeStateButton.Visible := True;
        Form1.SetFocus;
      end;
    3:
      begin
        Form2.Visible := False;
        ChangeFormState(Form2, InsertPanel2, fp_Inside);
        Form2.Visible := True;
      end;
    4:
      begin
        Form2.Visible := False;
        ChangeFormState(Form2, InsertPanel3, fp_Inside);
        Form2.Visible := True;
      end;
    6: TreeView1.FullExpand;
  end;
  ChangeFirstPageStyle;
end;

procedure TForm1.DreamDesigner1ActiveChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := False;
  if (PageControl1.ActivePage.PageIndex <> 0) or (PageControl1.ActivePage.PageIndex <> 7) then
  begin
    with DreamDesigner1 do
    begin
      case PageControl1.ActivePage.PageIndex of
        1:
          begin
            DesignedComponent := Form1;
            LimitControl := Panel2;
          end;
        2:
          begin
            Label2.Visible := DreamDesigner1.Active;
            ChangeStateButton.Visible := DreamDesigner1.Active;
            DesignedComponent := Form2;
            LimitControl := nil;
          end;
        3, 4:
          begin
            DesignedComponent := Form2;
            LimitControl := nil;
          end;
      end;
    end;
    AllowChange := True;
  end;
end;

procedure TForm1.ChangeStateButtonClick(Sender: TObject);
begin
  Form2.Visible := False;
  if fFormPosition = fp_Inside then
    ChangeFormState(Form2, nil, not fFormPosition)
  else
    ChangeFormState(Form2, InsertPanel1, not fFormPosition);
  Form2.Visible := True;
  Form1.SetFocus;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  {$IFDEF DREAMINSPECTOR}
  FObjectInspector1:=TObjectInspector.Create(Self);
  FObjectInspector1.Align:=alClient;
  FObjectInspector1.Parent:=InspectorTab;
  FObjectInspector1.HiddenProps.Text:='Name'#13#10'Font'#13#10'TabOrder';
  FObjectInspector1.CurrentControl := Form1;
  {$ELSE}
  InspectorTab.TabVisible:=False;
  {$ENDIF}
  TreeView1.FullExpand;
  PageControl1.ActivePage := TabSheet6;
end;

procedure TForm1.LoadButtonClick(Sender: TObject);
begin
  DreamDesigner1.DesignedComponent := Form2;
  if OpenDialog1.Execute then
  begin
    ClearComponent(Form2); 
    DreamDesigner1.LoadFromFile(Form2, OpenDialog1.FileName);
  end;
end;

procedure TForm1.SaveButtonClick(Sender: TObject);
begin
  DreamDesigner1.DesignedComponent := Form2;
  if SaveDialog1.Execute then
    DreamDesigner1.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm1.DreamDesigner1SelectionChanged(Sender: TObject);
begin
{$IFDEF DREAMINSPECTOR}
  if PageControl1.ActivePage.PageIndex = 5 then
    if DreamDesigner1.Designer.SelectedComponents = nil then
      FObjectInspector1.CurrentControl := Form1
    else
      FObjectInspector1.CurrentControls := DreamDesigner1.Designer.SelectedComponents;
{$ENDIF}
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  DreamDesigner1.Active := False;
end;

procedure TForm1.DreamDesignerURLClick(Sender: TObject);
begin
  JumpToURL('www.dream-com.com/designer.html');
end;

procedure TForm1.DownloadURLClick(Sender: TObject);
begin
  JumpToURL('www.dream-com.com/download.html');
end;

procedure TForm1.lblEMailClick(Sender: TObject);
begin
  JumpToURL('mailto:contact@dream-com.com');
end;

procedure TForm1.lblWWWClick(Sender: TObject);
begin
  JumpToURL('www.dream-com.com');
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  EnvOpts: TList;
begin
  EnvOpts := TList.Create;
  try
    EnvOpts.Add(TDCPalettePropForm);
    ShowEnvOptions(EnvOpts);
  finally
    EnvOpts.Free;
  end;
end;

end.
