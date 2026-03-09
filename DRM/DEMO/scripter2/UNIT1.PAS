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
  dcparser, dcsystem, dcscript, StdCtrls,
  ComCtrls, Graphics, ExtCtrls, dccommon, Controls, Classes,
  {$IFDEF DREAMINSPECTOR}inspunit,{$ENDIF}
  {$IFDEF DREAMMEMO}dcmemo,{$ENDIF}
  {$IFDEF DREAMTREE}dctreeed,{$ENDIF}
  Windows, Messages, SysUtils, Forms, Dialogs,
  dcstdctl, DCGen,dcpascal,dcscriptReg,vclimp,dreamimp;

const C5_id = 100;
      A1_id = 101;
      B3_id = 102;

      NumPages = 9;

var   A1 : integer;
      B3 : integer;
      C5 : integer;


var scripts: array[1..NumPages] of string =
 ('(5+4)*2 - 9/3 + 10',

  'function CalcSum: integer;'#13#10+
  'var i: integer;'#13#10+
   'begin' + #13#10 +
     '  result:=0;' + #13#10 +
     '  for i:=1 to 10 do'+ #13#10 +
       '    result := result + i;'+ #13#10 +
   'end;',

   'procedure MyVCL;'#13#10+
   'var s: string;'#13#10+
   'begin'#13#10+
   '  s:=Form1.Caption;'#13#10+
   '  Form1.Caption := ''Caption is temporary modified.''; '#13#10+
   '  ShowMessage(''This message is displayed by the script. Form Caption is temporary modified.'');'#13#10+
   '  Form1.Caption:=s;'#13#10+
   'end;',

   'procedure ShowFontDialog;'#13#10+
   'var fd : TFontDialog;'#13#10+
   'begin'#13#10+
   '  fd := TFontDialog.Create(nil);'#13#10+
   '  try'#13#10+
   '    fd.Font := Font;'#13#10+
   '    if fd.Execute then'#13#10+
   '      Font := fd.Font;'#13#10+
   '    fd.Free;'#13#10+
   '  except'#13#10+
   '    fd.Free;'#13#10+
   '  end;'#13#10+
   'end;',

   'function UserVar : integer;'#13#10+
   'begin'#13#10+
     '  A1 := 7;'#13#10+
     '  B3 := 12;'#13#10+
     '  C5 := A1 + B3;'#13#10+
     '  result := C5;'#13#10+
   'end;',

   'procedure OpenArr;'#13#10+
   'var'#13#10+
   '  s : string;'#13#10+
   '  FmtStr : string;'#13#10+
   'begin'#13#10+
   '  FmtStr := ''Number : %d, string : %s'';'#13#10+
   '  s := Format(FmtStr, [1, ''Sample String'']);'#13#10+
   '  MessageDLG(s, mtInformation, MkSet(mbOK, mbCancel), 0);'#13#10+
   'end;',

   'Sub ClickEventButClick(Sender)'#13#10+
   '  ShowMessage(Sender.Name +" clicked")'#13#10+
   'end sub',

   'Sub VBSubroutine()'#13#10+
   '  ShowMessage("Today is  " + DateToStr(Now))'#13#10+
   'End Sub',

   'function ChangeFont()'#13#10+
   '{'#13#10+
   'var    FontDialog = TFontDialog.Create(NULL);'#13#10+
   '  FontDialog.Font.Assign(Font);'#13#10+
   '  if (FontDialog.Execute)'#13#10+
   '    Font.Assign(FontDialog.Font);'#13#10+
   '  FontDialog.Free;'#13#10+
   '}'
       );

    descriptions: array[1..NumPages] of string =
   ( 'This example illustrates how you can use Dream Scripter to calculate simple '+
     'expressions. You can modify the expression in the memo control and calculate its value '+
     'by pressing Run button. The result is shown in the right bottom corner of the window.',

     'We have implemented here a simple function that calculates the sum of the first ten '+
     'integers and returns this sum into the main application. This example demonstrates how '+
     'to execute script subroutines. The result is shown in the right bottom corner of the window.',

     'With Dream Scripter you can access VCL (or any custom objects) from the script. This simple '+
     'script changes the caption of the main form, shows the message box (by calling standard '+
     'ShowMessage procedure) and restores the old caption of the form.',

     'Here you can see how to create objects from the script and to use try..except constructions. '+
     'After you press Run button you should see standard Font dialog where you can select the font '+
     'and font size that are used to display text in the Dream Memo',

     'This example shows how to work with dynamic variables. These variables are not defined in the '+
     'script but still they can be processed by handing OnGetUserVarID, OnGetUserVar and OnSetUserVar events.',

     'Delphi Script interpreter is capable of working with open arrays. This example demonstrates how to '+
     'process open arrays.',

     'Dream Scripter gives the programmers an easy way to handle events in the script code. Just imagine '+
     'that you"ll be able implement event handlers using any of the supported scripting languages - VBScript, '+
     'JScript, Perl, etc. To try this mechanism press Assign Event button. You will be able to assign a new '+
     'event handler implemented in any of the supported script languages to any component or control of your application.',

     'Dream Scripter can execute scripts written in VB Script language. Moreover all Delphi objetcs and VCL are'+
     ' accessible from the script. In this example we determine the current date and display it using standard '+
     'ShowMessage procedure.',

     'JavaScript code as well as any of other supported Active Script languages can be executed by Dream Scripter. '+
     'In this exmaple we create standard Font Dialog and apply the font changes to the text that is edited in the memo.');

    functions: array[1..NumPages] of string =
    ('Calculate', 'CalcSum', 'MyVCL', 'ShowFontDialog', 'UserVar', 'OpenArr', '', 'VBSubroutine', 'ChangeFont');

type
  TForm1 = class(TForm)
    DelphiParser1: TDelphiParser;
    DCScripter1: TDCScripter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    MemoTab: TTabSheet;
    Memo1: TMemo;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    Panel3: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Panel4: TPanel;
    Label6: TLabel;
    Panel5: TPanel;
    Label7: TLabel;
    Panel1: TPanel;
    IntroPanel: TPanel;
    Label12: TLabel;
    Label11: TLabel;
    DownloadURL: TLabel;
    HelpFilesURL: TLabel;
    ManualURL: TLabel;
    GroupBox1: TGroupBox;
    URL: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ResultLabel: TLabel;
    RunButton: TButton;
    TabSheet8: TTabSheet;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    VBScriptParser1: TVBScriptParser;
    JavaScriptParser1: TJavaScriptParser;
    TabSheet11: TTabSheet;
    Image1: TImage;
    Label24: TLabel;
    Label21: TLabel;
    Label29: TLabel;
    lblWWW: TLabel;
    Label22: TLabel;
    lblEMail: TLabel;
    TreeView1: TTreeView;
    procedure FormCreate(Sender: TObject);
    procedure RunButtonClick(Sender: TObject);
    procedure DCScripter1GetUserVarID(const VarName: String;
      var VarID: Integer);
    procedure DCScripter1GetUserVar(const VarName: String; VarID: Integer;
      var VarValue: OleVariant);
    procedure DCScripter1SetUserVar(const VarName: String; VarID: Integer;
      const VarValue: OleVariant);
    procedure PageControl1Change(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure DownloadURLClick(Sender: TObject);
    procedure lblEMailClick(Sender: TObject);
    procedure lblWWWClick(Sender: TObject);
  private
  {$IFDEF DREAMMEMO}
  FMemo:TDCMemo;
  {$ELSE}
  FMemo:TMemo;
  {$ENDIF}
    procedure FillMemos(index : integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FillMemos(index : integer);
begin
  FMemo.Text := scripts[index];
  Memo1.Text := descriptions[index];
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  {$IFDEF DREAMMEMO}
  FMemo:=TDCMemo.Create(Self);
  {$ELSE}
  FMemo:=TMemo.Create(Self);
  {$ENDIF}
  FMemo.Align:=AlClient;
  FMemo.Parent:=MemoTab;

  PageControl1.ActivePage := TabSheet1;
  Panel2.Parent := Panel1;
  FillMemos(PageControl1.ActivePage.PageIndex + 1);
  ResultLabel.Caption := '';
  TreeView1.FullExpand;
end;

procedure TForm1.RunButtonClick(Sender: TObject);
var res: integer;
    index : integer;
    s : string;
begin

  index := PageControl1.ActivePage.PageIndex;
  s := FMemo.Text;
  if index=1 then
    res := DCScripter1.Evaluate(FMemo.Text)
  else
  if index=7 then
  begin
    DCScripter1.Script.Text := s;
    CallPropertyEdit(DCScripter1,'Events');
    res := 0;
  end

  else
  with DCScripter1 do
  begin
    Script.Text := s;
    res := CallNoParamsMethod(functions[index]);
  end;

  if not DCScripter1.RunFailed then
    ResultLabel.Caption := 'Result: ' + IntToStr(res)
  else
    ResultLabel.Caption := '';
end;

procedure TForm1.DCScripter1GetUserVarID(const VarName: String;
  var VarID: Integer);
begin
  case VarName[1] of
    'C': VarID := C5_id;
    'A': VarID := A1_id;
    'B': VarID := B3_id;
  end;
end;

procedure TForm1.DCScripter1GetUserVar(const VarName: String;
  VarID: Integer; var VarValue: OleVariant);
begin
  case VarID of
    A1_id: VarValue := A1;
    B3_id: VarValue := B3;
    C5_id: VarValue := C5;
  end;
end;

procedure TForm1.DCScripter1SetUserVar(const VarName: String;
  VarID: Integer; const VarValue: OleVariant);
begin
  case VarID of
    C5_id: C5 := VarValue;
    A1_id: A1 := VarValue;
    B3_id: B3 := VarValue;
  end;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
var index : integer;
begin
  index := PageControl1.ActivePage.PageIndex;
  if index in [1..NumPages] then
  begin
    FMemo.Parent := PageControl1.Pages[index];
    Memo1.Parent := PageControl1.Pages[index];
    FillMemos(index);
    IntroPanel.Visible := False;
    Panel2.Visible := True;
  end
  else
  begin
    IntroPanel.Visible := True;
    Panel2.Visible := False;
  end;
  ResultLabel.Caption := '';
  ResultLabel.Visible := ((index = 1) or (index = 2) or (index = 5));
  if index = 4 then
  begin
    DCScripter1.Language := 'DelphiScript';
    {$IFDEF DREAMMEMO}
    FMemo.SyntaxParser := nil;
    FMemo.UseMonoFont := False;
    {$ENDIF}
  end
  else
  begin
    {$IFDEF DREAMMEMO}
    FMemo.UseMonoFont := True;
    {$ENDIF}
    case index of
      1..3,5,6 : begin
               DCScripter1.Language := 'DelphiScript';
               {$IFDEF DREAMMEMO}
               FMemo.SyntaxParser := DelphiParser1;
               {$ENDIF}
             end;
      7, 8 : begin
            DCScripter1.Language := 'VBScript';
           {$IFDEF DREAMMEMO}
            FMemo.SyntaxParser := VBScriptParser1;
           {$ENDIF}
          end;
      9: begin
            DCScripter1.Language := 'JavaScript';
           {$IFDEF DREAMMEMO}
            FMemo.SyntaxParser := JavaScriptParser1;
           {$ENDIF}
         end;
    end;
  end;
  if index=7 then
    RunButton.Caption := 'Assign events'
  else
    RunButton.Caption := 'Run';
end;

procedure TForm1.Label9Click(Sender: TObject);
begin
  JumpToURL('www.dream-com.com/scripter.html');
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
  JumpToURL('http://www.dream-com.com');
end;

initialization

  dcscriptReg.Register;

end.
