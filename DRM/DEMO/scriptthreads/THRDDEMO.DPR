{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
program ThrdDemo;

uses
  Forms,
  ThSort in 'ThSort.pas' {ThreadSortForm},
  SortThds in 'SortThds.pas',
  Unit2 in 'Unit2.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TThreadSortForm, ThreadSortForm);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
