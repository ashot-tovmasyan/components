{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit dcCalculator;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TDCBtnKind =
    (bBack, bCancel, bClear,
    bMC, bMR, bMS, bMP,
    bNum0, bNum1, bNum2, bNum3, bNum4, bNum5, bNum6, bNum7, bNum8, bNum9,
    bSign, bDecimal,
    bDiv, bMul, bSub, bAdd,
    bSqrt, bPercent, bRev, bEqual,
    bNone);

  TDCCalcState = (stFirst, stSecond, stError);

  TCalcBtn = class(TSpeedButton)
  private
  public
    Kind: TDCBtnKind;
    constructor Create(AOwner: TComponent); override;
  end;

  TDCCalcButtons = array[TDCBtnKind] of TCalcBtn;

  TDCCustomCalculator = class(TWinControl)
  private
    FMemory: Extended;
    FPrecision: Byte;

    FOperandA: Extended;
    FOperandB: Extended;
    FOperator0: TDCBtnKind;
    FOperator: TDCBtnKind;

    FStatus: TDCCalcState;

    procedure DoBtnDown(AKind: TDCBtnKind);
    procedure UpdateMemButtons;

    procedure Back;
    procedure Decimal;
    procedure Num0Num9(AKind: TDCBtnKind);
    procedure Percent;
    procedure Rev;
    procedure SqrtProc;
    procedure MC;
    procedure MR;
    procedure MS;
    procedure MP;
    procedure Sign;
    procedure _ResetCE;

  protected
    FButtons: TDCCalcButtons;

    sbBack: TCalcBtn;
    sbCancel: TCalcBtn;
    sbClear: TCalcBtn;

    sbMC: TCalcBtn;
    sbMR: TCalcBtn;
    sbMS: TCalcBtn;
    sbMP: TCalcBtn;

    sbNum0: TCalcBtn;
    sbNum1: TCalcBtn;
    sbNum2: TCalcBtn;
    sbNum3: TCalcBtn;
    sbNum4: TCalcBtn;
    sbNum5: TCalcBtn;
    sbNum6: TCalcBtn;
    sbNum7: TCalcBtn;
    sbNum8: TCalcBtn;
    sbNum9: TCalcBtn;

    sbSign: TCalcBtn;
    sbDecimal: TCalcBtn;

    sbDiv: TCalcBtn;
    sbMul: TCalcBtn;
    sbSub: TCalcBtn;
    sbAdd: TCalcBtn;

    sbSqrt: TCalcBtn;
    sbPercent: TCalcBtn;
    sbRev: TCalcBtn;
    sbEqual: TCalcBtn;

    function GetValue: Extended;
    procedure SetValue(Value: Extended);

    function GetValueText: string; virtual;
    procedure SetValueText(Value: string); virtual;

    function ButtonCreate(ALeft, ATop: Integer; AFontColor: TColor;
      ACaption: string; AKind: TDCBtnKind): TCalcBtn;

    procedure Error;
    procedure MathOp(AKind: TDCBtnKind);
    procedure DoBtnClick(Sender: TObject); virtual;
    procedure WMWindowPosChanging(var AMsg: TWMWindowPosChanging); message WM_WINDOWPOSCHANGING;

    function GetBtnKind(Ch: Char): TDCBtnKind;
    procedure KeyPress(var Key: Char); override;
    procedure BtnClick(AKind: TDCBtnKind); virtual;

  public
    property Status: TDCCalcState read FStatus write FStatus;
    property OperandA: Extended read FOperandA write FOperandA;
    property OperandB: Extended read FOperandB write FOperandB;
    property Operator: TDCBtnKind read FOperator write FOperator;

    property Memory: Extended read FMemory;
    property Precision: Byte read FPrecision write FPrecision default 17;

    procedure CalculateSize(var AWidth, AHeight: Integer); virtual;
    procedure InitValue(Value: Extended);

    procedure _Reset;
    constructor Create(AOwner: TComponent); override;
  end;

  TDCCalculator = class(TDCCustomCalculator)
  private
    FDisplay: TStaticText;
    FMemory: Extended;

    function GetText: string;
  protected
    function GetValueText: string; override;
    procedure SetValueText(Value: string); override;
    procedure DoBtnClick(Sender: TObject); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;

  public
    procedure CalculateSize(var AWidth, AHeight: Integer); override;
    constructor Create(AOwner: TComponent); override;
  published
    property Memory: Extended read FMemory;
    property Text: string read GetText;
    property Precision;

    property Color;
    property Enabled;
    property Font;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;

    property OnKeyDown;
  end;

implementation

function Max(const X, Y: Byte): Byte;
begin
  Result := Y;
  if X > Y then
    Result := X;
end;

{ TCalcBtn }

constructor TCalcBtn.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  if AOwner is TDCCustomCalculator then
  begin
    Parent := TDCCustomCalculator(AOwner);
    OnClick := TDCCustomCalculator(AOwner).DoBtnClick;
  end;

  Height := 27;
  Width := 35;
  AllowAllUp := True;
end;

function TDCCustomCalculator.ButtonCreate(ALeft, ATop: Integer;
  AFontColor: TColor; ACaption: string; AKind: TDCBtnKind): TCalcBtn;
begin
  Result := TCalcBtn.Create(Self);
  with Result do
  begin
    Left := ALeft;
    Top := ATop;
    Font.Color := AFontColor;
    Caption := ACaption;
    Kind := AKind;
  end;
end;

constructor TDCCustomCalculator.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPrecision := 17;
  Color := clBtnFace;

  FStatus := stFirst;
  FOperator0 := bEqual;
  FOperator := bEqual;
  FOperandA := 0;
  FOperandB := 0;
end;

function TDCCustomCalculator.GetValue: Extended;
var
  S: string;
begin
  if FStatus = stError then
    Result := 0.0
  else
  begin
    S := Trim(GetValueText);
    if S = '' then
      S := '0';

    Result := StrToFloat(S);
  end;
end;

procedure TDCCustomCalculator.SetValue(Value: Extended);
var
  S: string;
begin
  S := FloatToStrF(Value, ffGeneral, Max(2, FPrecision), 0);
  if GetValueText <> S then
    SetValueText(S);
end;

procedure TDCCustomCalculator.Error;
begin
  FStatus := stError;
  SetValueText('Error ');
end;

procedure TDCCustomCalculator.DoBtnClick(Sender: TObject);
begin
{}
end;

procedure TDCCustomCalculator.KeyPress(var Key: Char);
begin
  inherited;
  DoBtnDown(GetBtnKind(Key));
  BtnClick(GetBtnKind(Key));
end;

function TDCCustomCalculator.GetBtnKind(Ch: Char): TDCBtnKind;
begin
  Result := bNone;
  case Ch of
    '+': Result := bAdd;
    '-': Result := bSub;
    '*': Result := bMul;
    '/': Result := bDiv;
    '%': Result := bPercent;
    #8: Result := bBack;
    #27: Result := bClear;
    '0'..'9': Result := TDCBtnKind(Ord(bNum0) + Ord(Ch) - Ord('0'));
    '=', #13: Result := bEqual;
  else
    if DecimalSeparator = Ch then Result := bDecimal;
  end;
end;

procedure TDCCustomCalculator.DoBtnDown(AKind: TDCBtnKind);
begin
  if AKind <> bNone then
  begin
    FButtons[AKind].GroupIndex := 1;
    FButtons[AKind].Down := True;
    FButtons[AKind].UpDate;
    Sleep(30);
    FButtons[AKind].Down := False;
    FButtons[AKind].UpDate;
    FButtons[AKind].GroupIndex := 0;
  end;
end;

procedure TDCCustomCalculator.UpdateMemButtons;
begin
  if FMemory <> 0 then
  begin
    FButtons[bMC].Enabled := True;
    FButtons[bMR].Enabled := True;
  end
  else
  begin
    FButtons[bMC].Enabled := False;
    FButtons[bMR].Enabled := False;
  end;
end;

procedure TDCCustomCalculator._Reset;
begin
  FStatus := stFirst;
  SetValue(0);
  FOperator0 := bEqual;
  FOperator := bEqual;
  FOperandA := 0;
  FOperandB := 0;
end;

procedure TDCCustomCalculator._ResetCE;
begin
  FStatus := stFirst;
  SetValue(0);
  FOperator0 := bEqual;
  FOperator := bEqual;
  FOperandB := 0;
end;

procedure TDCCustomCalculator.Back;
var EditValue: string;
begin
  EditValue := GetValueText;
  if FStatus = stSecond then
    if (Length(EditValue) = 1) or ((Length(EditValue) = 2) and (EditValue[1] = '-')) then
      SetValue(0)
    else
      SetValueText(Copy(EditValue, 1, Length(GetValueText) - 1));
end;

procedure TDCCustomCalculator.Decimal;
begin
  if FStatus = stSecond then
    if Length(GetValueText) < 32 then
      if Pos(DecimalSeparator, GetValueText) = 0 then
        SetValueText(GetValueText + DecimalSeparator);
end;

procedure TDCCustomCalculator.Num0Num9(AKind: TDCBtnKind);
begin
  if (GetValueText = '0') and (FStatus = stSecond) then
    SetValueText('');

  if FStatus = stFirst then
  begin
    FStatus := stSecond;
    SetValueText('');
  end;

  if FStatus <> stError then
    if Length(GetValueText) < 32 then
      SetValueText(GetValueText + Char(Ord('0') + Byte(AKind) - Byte(bNum0)));
end;

procedure TDCCustomCalculator.Percent;
begin
  if FStatus <> stError then
  begin
    FStatus := stFirst;
    case FOperator of
      bAdd, bSub: FOperandB := FOperandA * GetValue / 100;
      bMul, bDiv: FOperandB := GetValue / 100;
    end;
    SetValue(FOperandB);
  end;
end;

procedure TDCCustomCalculator.Rev;
begin
  if FStatus <> stError then
  begin
    FStatus := stFirst;
    if GetValue = 0 then
      Error
    else
    begin
      FOperandB := 1 / GetValue;
      SetValue(FOperandB);
    end;
  end;
end;

procedure TDCCustomCalculator.Sign;
begin
  if FStatus <> stError then
    SetValue(-GetValue);
end;

procedure TDCCustomCalculator.SqrtProc;
begin
  if FStatus in [stFirst, stSecond] then
  begin
    FStatus := stFirst;
    if GetValue < 0 then
      Error
    else
    begin
      FOperandB := Sqrt(GetValue);
      SetValue(FOperandB);
    end;
  end;
end;

procedure TDCCustomCalculator.MC;
begin
  FStatus := stFirst;
  FMemory := 0;
  UpdateMemButtons;
end;

procedure TDCCustomCalculator.MP;
begin
  if FStatus in [stFirst, stSecond] then
  begin
    FStatus := stFirst;
    FMemory := FMemory + GetValue;
    UpdateMemButtons;
    FOperator:= bEqual;
  end;
end;

procedure TDCCustomCalculator.MR;
begin
  if FStatus in [stFirst, stSecond] then
  begin
    FStatus := stFirst;
    SetValue(FMemory);
  end;
end;

procedure TDCCustomCalculator.MS;
begin
  if FStatus in [stFirst, stSecond] then
  begin
    FStatus := stFirst;
    FMemory := GetValue;
    UpdateMemButtons;
    FOperator:= bEqual;
  end;
end;

procedure TDCCustomCalculator.MathOp(AKind: TDCBtnKind);
begin
  if FStatus = stError then Exit;

  if FStatus = stSecond then
  begin
    FStatus := stFirst;
    FOperandB := GetValue;
    case FOperator of
      bAdd: SetValue(FOperandA + FOperandB);
      bSub: SetValue(FOperandA - FOperandB);
      bMul: SetValue(FOperandA * FOperandB);
      bDiv: if FOperandB = 0 then
          Error
        else
          SetValue(FOperandA / FOperandB);
    end;

    FOperator0 := FOperator;
    FOperator := AKind;
  end
  else
    if AKind = bEqual then
    begin
      if FOperator <> bEqual then
        FOperator0 := FOperator;
      case FOperator0 of
        bAdd: SetValue(FOperandA + FOperandB);
        bSub: SetValue(FOperandA - FOperandB);
        bMul: SetValue(FOperandA * FOperandB);
        bDiv: if FOperandB = 0 then
            Error
          else
            SetValue(FOperandA / FOperandB);
      end;
    end
    else
    begin
      FOperator := AKind;
      FOperandB := GetValue;
    end;

  FOperandA := GetValue;
end;

procedure TDCCustomCalculator.BtnClick(AKind: TDCBtnKind);
begin
  case AKind of
    bClear: _Reset;
    bCancel: _ResetCE;
    bBack: Back;
    bDecimal: Decimal;
    bNum0..bNum9: Num0Num9(AKind);
    bPercent: Percent;
    bRev: Rev;
    bSqrt: SqrtProc;
    bSign: Sign;
    bMP: MP;
    bMS: MS;
    bMR: MR;
    bMC: MC;

    bAdd, bSub, bMul, bDiv, bEqual: MathOp(AKind);
  end;
end;

procedure TDCCustomCalculator.WMWindowPosChanging(var AMsg: TWMWindowPosChanging);
begin
  with AMsg.WindowPos^ do
    if Flags and SWP_NoSize = 0 then
      CalculateSize(cx, cy);
end;

procedure TDCCustomCalculator.CalculateSize(var AWidth, AHeight: Integer);
begin
{}
end;

function TDCCustomCalculator.GetValueText: string;
begin
  Result := '';
end;

procedure TDCCustomCalculator.SetValueText(Value: string);
begin
{}
end;

procedure TDCCustomCalculator.InitValue(Value: Extended);
var fValue: string;
begin
  FStatus := stSecond;
  try
    fValue := FloatToStr(Value);
  except
    fValue := '0';
  end;

  if Length(fValue) < 32 then
    SetValueText(fValue);

  MathOp(bEqual);
end;

{ TDCCalculator }

procedure TDCCalculator.CalculateSize(var AWidth, AHeight: Integer);
begin
  AWidth := 250;
  AHeight := 200;
end;

constructor TDCCalculator.Create(AOwner: TComponent);
begin
  inherited;
  FDisplay := TStaticText.Create(Self);
  with FDisplay do
  begin
    Parent := Self;
    Alignment := taRightJustify;
    AutoSize := False;
    BorderStyle := sbsSunken;
    Color := clWhite;
    Left := 5;
    Top := 5;
    Font.Size := 10;
    Height := 20;
    Width := 240;
    Caption := '0';
    OnClick := DoBtnClick;
  end;

  sbBack := ButtonCreate(50, 30, clRed, 'Back', bBack);
  sbBack.Width := 61;
  sbCancel := ButtonCreate(118, 30, clRed, 'CE', bCancel);
  sbCancel.Width := 60;
  sbClear := ButtonCreate(185, 30, clRed, 'C', bClear);
  sbClear.Width := 60;

  sbMC := ButtonCreate(5, 64, clRed, 'MC', bMC);
  sbMC.Enabled := False;
  sbMR := ButtonCreate(5, 98, clRed, 'MR', bMR);
  sbMR.Enabled := False;
  sbMS := ButtonCreate(5, 132, clRed, 'MS', bMS);
  sbMP := ButtonCreate(5, 166, clRed, 'M+', bMP);

  sbNum0 := ButtonCreate(50, 166, clBlue, '0', bNum0);
  sbNum1 := ButtonCreate(50, 132, clBlue, '1', bNum1);
  sbNum2 := ButtonCreate(90, 132, clBlue, '2', bNum2);
  sbNum3 := ButtonCreate(130, 132, clBlue, '3', bNum3);
  sbNum4 := ButtonCreate(50, 98, clBlue, '4', bNum4);
  sbNum5 := ButtonCreate(90, 98, clBlue, '5', bNum5);
  sbNum6 := ButtonCreate(130, 98, clBlue, '6', bNum6);
  sbNum7 := ButtonCreate(50, 64, clBlue, '7', bNum7);
  sbNum8 := ButtonCreate(90, 64, clBlue, '8', bNum8);
  sbNum9 := ButtonCreate(130, 64, clBlue, '9', bNum9);

  sbSign := ButtonCreate(90, 166, clBlue, '+/-', bSign);
  sbDecimal := ButtonCreate(130, 166, clBlue, ',', bDecimal);
  sbDiv := ButtonCreate(170, 64, clRed, '/', bDiv);
  sbMul := ButtonCreate(170, 98, clRed, '*', bMul);
  sbSub := ButtonCreate(170, 132, clRed, '-', bSub);
  sbAdd := ButtonCreate(170, 166, clRed, '+', bAdd);

  sbSqrt := ButtonCreate(210, 64, clBlue, 'sqrt', bSqrt);
  sbPercent := ButtonCreate(210, 98, clBlue, '%', bPercent);
  sbRev := ButtonCreate(210, 132, clBlue, '1/x', bRev);
  sbEqual := ButtonCreate(210, 166, clBlue, '=', bEqual);

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

  Width := 250;
  Height := 200;
end;

procedure TDCCalculator.DoBtnClick(Sender: TObject);
begin
  inherited;
  SetFocus;
  if Sender is TCalcBtn then
    BtnClick(TCalcBtn(Sender).Kind);
end;

function TDCCalculator.GetText: string;
begin
  Result := FDisplay.Caption;
end;

function TDCCalculator.GetValueText: string;
begin
  Result := FDisplay.Caption;
end;

procedure TDCCalculator.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited;
  SetFocus;
end;

procedure TDCCalculator.SetValueText(Value: string);
begin
  FDisplay.Caption := Value;
end;

end.

