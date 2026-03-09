{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit EdStrUnit;

interface

uses
  Forms, StdCtrls, Controls, Classes, Mask;

type
  TEdStrForm = class(TForm)
    Label1: TLabel;
    edtName: TEdit;
    Label2: TLabel;
    edtData: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
  end;

var
  EdStrForm: TEdStrForm;

implementation

{$R *.DFM}

procedure TEdStrForm.FormShow(Sender: TObject);
begin
  edtData.SetFocus;
end;

end.
