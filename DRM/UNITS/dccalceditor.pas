{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit dcCalcEditor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, dcCalcEdit, dcCalculator, dcTreeGridEditors;

type
  TDCCalcPopup = class(TDCCalcEdit)
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

  TDCTreeViewCalcEditor = class(TDCCustomTreeViewBtnEditor)
  private
    FEditCancel: double;
    procedure Close_(Sender: TObject);
  protected
    function GetEditorValue: double; virtual;
    procedure SetEditorValue(Value: double); virtual;

    function ProcessKey(var AMsg: TMessage): Boolean; override;
    function GetPopupWindowClass: TWinControlClass; override;
    procedure CancelPopupValue; override;
    function DoShowPopup: Boolean; override;
    procedure ValidatePopupValue; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TDCTreeViewCurrencyEditor = class(TDCTreeViewCalcEditor)
  protected
    function GetEditorValue: double; override;
    procedure SetEditorValue(Value: double); override;
  end;

implementation

{ TDCCalcPopup }

procedure TDCCalcPopup.CreateParams(var Params: TCreateParams);
begin
  inherited;
  with Params do
  begin
    Style := Style or WS_CHILD or WS_BORDER;
    ExStyle := WS_EX_TOOLWINDOW;
    WindowClass.Style := WindowClass.Style or CS_SAVEBITS;
  end;
end;

{ TDCTreeViewCalcEditor }

procedure TDCTreeViewCalcEditor.CancelPopupValue;
begin
  inherited;
  SetEditorValue(FEditCancel);
end;

procedure TDCTreeViewCalcEditor.Close_(Sender: TObject);
begin
  PopupLostFocus(False);
end;

constructor TDCTreeViewCalcEditor.Create(AOwner: TComponent);
begin
  inherited;
  TDCCalcPopup(PopupWindow).OnEqualClick := Close_;
end;

function TDCTreeViewCalcEditor.DoShowPopup;
var
  fTemp: double;
begin
  Result := True;
  try
    FEditCancel := GetEditorValue;
  except
    FEditCancel := 0;
  end;
  fTemp := FEditCancel;
  with TDCCalcPopup(PopupWindow) do
  begin
    Display := Editor;
    _Reset;
    InitValue(fTemp);
  end;
end;

function TDCTreeViewCalcEditor.GetEditorValue: double;
begin
  Result := StrToFloat(Editor.Text);
end;

function TDCTreeViewCalcEditor.GetPopupWindowClass: TWinControlClass;
begin
  Result := TDCCalcPopup;
end;

function TDCTreeViewCalcEditor.ProcessKey(var AMsg: TMessage): Boolean;
begin
  if PopupWindow.Visible and (AMsg.Msg = WM_KeyDown) and (AMsg.wParam = VK_Return) then
    TDCCalcPopup(PopupWindow).BtnClick(bEqual);
  Result := inherited ProcessKey(AMsg);
end;

procedure TDCTreeViewCalcEditor.SetEditorValue(Value: double);
begin
  Editor.Text := FloatToStr(Value);
end;

procedure TDCTreeViewCalcEditor.ValidatePopupValue;
begin
  if Trim(TDCCalcPopup(PopupWindow).Text) <> 'Error' then
    SetEditorValue(StrToFloat(TDCCalcPopup(PopupWindow).Text))
  else
  begin
    MessageDlg('Value is not valid ', mtError, [mbOk], 0);
    SetEditorValue(FEditCancel);
  end;
end;

{ TDCTreeViewCurrencyEditor }

function TDCTreeViewCurrencyEditor.GetEditorValue: double;
var
  s: string;
  p: integer;
begin
  s := Editor.Text;
  p := Pos(CurrencyString, s);
  if p > 0 then
    Delete(s, p, Length(CurrencyString));
  Result := StrToCurr(s);
end;

procedure TDCTreeViewCurrencyEditor.SetEditorValue(Value: double);
begin
  Editor.Text := CurrToStr(Value);
end;

end.
