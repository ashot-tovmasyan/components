{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit EdDWUnit;

interface

uses
  Forms, Controls, StdCtrls, ExtCtrls, Classes;

type
  TEdDWordForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtName: TEdit;
    edtData: TEdit;
    Button1: TButton;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edtDataExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  public
    function GetDataValue: integer;
  end;

var
  EdDWordForm: TEdDWordForm;

implementation

uses SysUtils;

{$R *.DFM}

procedure TEdDWordForm.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
    edtData.Text := IntToHex(StrToInt(edtData.Text), 0)
  else
    edtData.Text := IntToStr(StrToInt('$' + edtData.Text));
end;

procedure TEdDWordForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrCancel then
    exit;
  try
    GetDataValue;
  except
    CanClose := False;
    edtData.SetFocus;
  end;
end;

procedure TEdDWordForm.edtDataExit(Sender: TObject);
begin
  try
    GetDataValue;
  except
    edtData.SetFocus;
  end;
end;

function TEdDWordForm.GetDataValue: integer;
begin
  if RadioGroup1.ItemIndex = 0 then
    Result := StrToInt('$' + edtData.Text)
  else
    Result := StrToInt(edtData.Text);
end;

procedure TEdDWordForm.FormShow(Sender: TObject);
begin
  edtData.SetFocus;
end;

end.
