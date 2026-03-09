{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  EdDWUnit in 'EdDWUnit.pas' {EdDWordForm},
  EdStrUnit in 'EdStrUnit.pas' {EdStrForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TEdDWordForm, EdDWordForm);
  Application.CreateForm(TEdStrForm, EdStrForm);
  Application.Run;
end.
