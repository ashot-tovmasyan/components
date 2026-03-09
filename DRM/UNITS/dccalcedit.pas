{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit dcCalcEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,

  dcCalculator;

type
  TDCCalcEdit = class(TDCCustomCalculator)
  private
    FDisplay: TWinControl;
    FOnEqualClick: TNotifyEvent;

    function GetText: string;
    procedure SetDisplay(Value: TWinControl);

  protected
    function GetValueText: string; override;
    procedure SetValueText(Value: string); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure BtnClick(AKind: TDCBtnKind); override;
//    
    procedure DoBtnClick(Sender: TObject); override;
//
  public

    property Display: TWinControl read FDisplay write SetDisplay;
    property Text: string read GetText;

    procedure CalculateSize(var AWidth, AHeight: Integer); override;
    constructor Create(AOwner: TComponent); override;
  published
    property Memory;
    property Precision;

    property Enabled;
    property Font;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;

    property OnEqualClick: TNotifyEvent read FOnEqualClick write FOnEqualClick;
    property OnKeyDown;
  end;

implementation
type
  TWinControlTxt = class(TWinControl)
  public
    property Text;
  end;

  { TDCCalcEdit }

function TDCCalcEdit.GetValueText: string;
begin
  if Assigned(Display) then
    Result := TWinControlTxt(Display).Text
  else
    Result := '0';
end;

procedure TDCCalcEdit.SetValueText(Value: string);
begin
  if Assigned(Display) then
    TWinControlTxt(Display).Text := Value;
end;

procedure TDCCalcEdit.SetDisplay(Value: TWinControl);
begin
  FDisplay := Value;
  if Value <> nil then
    Value.FreeNotification(Self);
{
  try
    StrToFloat(GetValueText);
  except
    SetValueText('0');
  end;
}
end;

procedure TDCCalcEdit.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if Operation = opRemove then
    if AComponent = FDisplay then
      Display := nil;
end;

function TDCCalcEdit.GetText: string;
begin
  Result := TWinControlTxt(Display).Text;
end;

procedure TDCCalcEdit.BtnClick(AKind: TDCBtnKind);
begin
  inherited;
  if AKind = bEqual then
    if Assigned(OnEqualClick) then FOnEqualClick(Self);
end;

constructor TDCCalcEdit.Create(AOwner: TComponent);
begin
  inherited;
  Width := 250;
  Height := 173;

  sbBack := ButtonCreate(50, 5, clRed, 'Back', bBack);
  sbBack.Width := 61;
  sbCancel := ButtonCreate(118, 5, clRed, 'CE', bCancel);
  sbCancel.Width := 60;
  sbClear := ButtonCreate(185, 5, clRed, 'C', bClear);
  sbClear.Width := 60;

  sbMC := ButtonCreate(5, 39, clRed, 'MC', bMC);
  sbMC.Enabled := False;
  sbMR := ButtonCreate(5, 73, clRed, 'MR', bMR);
  sbMR.Enabled := False;
  sbMS := ButtonCreate(5, 107, clRed, 'MS', bMS);
  sbMP := ButtonCreate(5, 141, clRed, 'M+', bMP);

  sbNum0 := ButtonCreate(50, 141, clBlue, '0', bNum0);
  sbNum1 := ButtonCreate(50, 107, clBlue, '1', bNum1);
  sbNum2 := ButtonCreate(90, 107, clBlue, '2', bNum2);
  sbNum3 := ButtonCreate(130, 107, clBlue, '3', bNum3);
  sbNum4 := ButtonCreate(50, 73, clBlue, '4', bNum4);
  sbNum5 := ButtonCreate(90, 73, clBlue, '5', bNum5);
  sbNum6 := ButtonCreate(130, 73, clBlue, '6', bNum6);
  sbNum7 := ButtonCreate(50, 39, clBlue, '7', bNum7);
  sbNum8 := ButtonCreate(90, 39, clBlue, '8', bNum8);
  sbNum9 := ButtonCreate(130, 39, clBlue, '9', bNum9);


  sbSign := ButtonCreate(90, 141, clBlue, '+/-', bSign);
  sbDecimal := ButtonCreate(130, 141, clBlue, ',', bDecimal);
  sbDiv := ButtonCreate(170, 39, clRed, '/', bDiv);
  sbMul := ButtonCreate(170, 73, clRed, '*', bMul);
  sbSub := ButtonCreate(170, 107, clRed, '-', bSub);
  sbAdd := ButtonCreate(170, 141, clRed, '+', bAdd);

  sbSqrt := ButtonCreate(210, 39, clBlue, 'sqrt', bSqrt);
  sbPercent := ButtonCreate(210, 73, clBlue, '%', bPercent);
  sbRev := ButtonCreate(210, 107, clBlue, '1/x', bRev);
  sbEqual := ButtonCreate(210, 141, clBlue, '=', bEqual);

  FButtons[bBack] := sbBack;
  FButtons[bCancel] := sbCancel;
  FButtons[bClear] := sbClear;
  FButtons[bMC] := sbMC;
  FButtons[bMR] := sbMR;
  FButtons[bMS] := sbMS;
  FButtons[bMP] := sbMP;
  FButtons[bNum0] := sbNum0;
  FButtons[bNum1] := sbNum1;
  FButtons[bNum2] := sbNum2;
  FButtons[bNum3] := sbNum3;
  FButtons[bNum4] := sbNum4;
  FButtons[bNum5] := sbNum5;
  FButtons[bNum6] := sbNum6;
  FButtons[bNum7] := sbNum7;
  FButtons[bNum8] := sbNum8;
  FButtons[bNum9] := sbNum9;
  FButtons[bSign] := sbSign;
  FButtons[bDecimal] := sbDecimal;
  FButtons[bDiv] := sbDiv;
  FButtons[bMul] := sbMul;
  FButtons[bSub] := sbSub;
  FButtons[bAdd] := sbAdd;
  FButtons[bSqrt] := sbSqrt;
  FButtons[bPercent] := sbPercent;
  FButtons[bRev] := sbReV;
  FButtons[bEqual] := sbEqual;
  FButtons[bNone] := nil;
end;

procedure TDCCalcEdit.CalculateSize(var AWidth, AHeight: Integer);
begin
  AWidth := 250;
  AHeight := 173;
end;

procedure TDCCalcEdit.DoBtnClick(Sender: TObject);
begin
  inherited;
  if Sender is TCalcBtn then
    BtnClick(TCalcBtn(Sender).Kind);
end;

end.

