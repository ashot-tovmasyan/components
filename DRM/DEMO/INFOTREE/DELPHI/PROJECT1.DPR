{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
program project1;

uses
  Forms,
  classes,
  Unit1 in 'Unit1.pas' {Form1},
  datamod in 'datamod.pas' {DataModule2: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
