{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

uses ThSort;

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Lines.Assign(ThreadSortForm.DCScripter1.Script);
end;

end.
