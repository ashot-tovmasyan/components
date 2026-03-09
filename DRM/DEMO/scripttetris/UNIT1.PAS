{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit unit1;

{$I dc.inc}
interface

uses
  ShellAPI, Windows, Forms, Classes, Controls, StdCtrls, Buttons, Menus, ExtCtrls, Graphics,
  DCScript, DCSystem, DCPascal, vclimp,dcconsts,dcapi,sysutils,dialogs;

Type
  TForm1 = class(TForm)
    StartBtn: TBitBtn;
    InfoPanel: TPanel;
    Image: TImage;
    InfoLabel: TLabel;
    CompanyPanel: TPanel;
    Image1: TImage;
    Label24: TLabel;
    Label21: TLabel;
    Label29: TLabel;
    lblWWW: TLabel;
    Label22: TLabel;
    lblEMail: TLabel;
    procedure StartBtnClick(Sender: TObject);
    procedure lblWWWClick(Sender: TObject);
    procedure lblEMailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Var
  Form1 : TForm1;

implementation

{$R *.DFM}

const
  SDCScriptFileName='TetrisScript.pas';

procedure TForm1.StartBtnClick(Sender: TObject);
var
  AppFolder,AppFolderAndUp:String;
begin
  AppFolder:=AddSlash(ExtractFilePath(ParamStr(0)));
  AppFolderAndUp:=AddSlash(DCUpFolder(AppFolder));
  If FileExists(SDCScriptFileName) then
    RunUnitModal(SDCScriptFileName)
  else
  If FileExists(AppFolder+SDCScriptFileName) then
    RunUnitModal(AppFolder+SDCScriptFileName)
  else
  If FileExists(AppFolderAndUp+SDCScriptFileName) then
    RunUnitModal(AppFolderAndUp+SDCScriptFileName)
  else
    ShowMessage(Format(SErrFileNotFound,[SDCScriptFileName]));
end;

procedure JumpToURL(const s : string);
begin
  ShellExecute( 0, Nil, PChar(s), Nil, Nil, SW_SHOW );
end;

procedure TForm1.lblWWWClick(Sender: TObject);
begin
  JumpToURL('http://www.dream-com.com');
end;

procedure TForm1.lblEMailClick(Sender: TObject);
begin
  JumpToUrl('mailto:' + lblEMail.Caption);
end;

initialization
  RegisterClass(TMainMenu);
  RegisterClass(TMenuItem);
  RegisterClass(TTimer);
end.
