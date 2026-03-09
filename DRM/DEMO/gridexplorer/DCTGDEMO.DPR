{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
program DCTGDemo;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'DCTreeGrid  Demo';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
