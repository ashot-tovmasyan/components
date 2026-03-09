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

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DIFFMAKE, dcedit,dcconsts;

type
  TForm1 = class(TForm)
    DiffMaker1: TDiffMaker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ExtractButton: TButton;
    CompressButton: TButton;
    Button3: TButton;
    InFileEdit: TDCFileNameEdit;
    OutFileEdit: TDCFileNameEdit;
    UseFileEdit: TDCFileNameEdit;
    procedure Button3Click(Sender: TObject);
    procedure CompressButtonClick(Sender: TObject);
    procedure ExtractButtonClick(Sender: TObject);
    procedure InFileEditChange(Sender: TObject);
  private
    { Private declarations }
    procedure CheckFiles;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

procedure MainProc;

implementation

{$R *.DFM}


procedure ShowHelp;
begin
  Writeln;
  Writeln('Use: Diff <a|e> <In_file> <out_file> <use_file> [comp_level]');
  Writeln;
  Writeln('Comp_level - 10..1000  (25 by default)');
  Writeln('            (10   - max. speed, min. comp. ratio)');
  Writeln('            (1000 - min. speed, max. comp. ratio)');
  Writeln;
  Writeln('Use_file   - old file name');
  Writeln('In_file    - input file name');
  Writeln('Out_file   - output file name');
  Writeln;
  Writeln('a - compress  e - extract');

  Writeln;
  Writeln('Press ENTER');
  Readln;
end;

{---------------------------------------}

procedure MainProc;
begin

  Writeln('Difference Maker  Version '+SDreamControlsVersion);
  Writeln(SCopyrightDream);
  if ParamCount = 0 then
  begin
    Application.CreateForm(TForm1,Form1);
    with Form1 do
    try
      ShowModal;
    finally
      free;
    end;
    exit;
  end;
  If (ParamCount<4) or (not (paramstr(1)[1] in ['a','A','e','E','X','x'])) then
  begin
    ShowHelp;
    exit;
  end;

  With TDIffMaker.Create(nil) do
  try
    InFile:=Paramstr(2);
    OutFile:=Paramstr(3);
    UseFile:=Paramstr(4);
    if paramcount>4 then
      CompLevel:=strtoint(paramstr(5));
    Case AnsiUpperCase(paramstr(1))[1] of
    'A':
      begin
        Writeln('Compressing...');
        Compress;
      end;
    'E','X':
      begin
        Writeln('Extracting...');
        Extract;
      end;
    end;
    Writeln;Writeln('Ok');
  finally
    Free;
  end;
end;


procedure TForm1.CheckFiles;
begin
  with DiffMaker1 do
  begin
    infile  := InFileEdit.FileName;
    outfile := OutFileEdit.FileName;
    usefile := UseFileEdit.FileName;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.CompressButtonClick(Sender: TObject);
begin
  CheckFiles;
  DiffMaker1.Compress;
end;

procedure TForm1.ExtractButtonClick(Sender: TObject);
begin
  CheckFiles;
  DiffMaker1.Extract;
end;

procedure TForm1.InFileEditChange(Sender: TObject);
begin
  CheckFiles;
  with DiffMaker1 do
    CompressButton.Enabled := (infile <>'') and (outfile <>'') and (usefile <> '');
  ExtractButton.Enabled := CompressButton.Enabled ;
end;

end.
