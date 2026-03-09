{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit SortThds;

interface
{$I dc.inc}
uses
  {$IFDEF D6}
  Variants,
  {$ENDIF}
  Classes, Graphics, ExtCtrls, dcscript;

type

{ TSortThread }

  PSortArray = ^TSortArray;
  TSortArray = array[0..MaxInt div SizeOf(Integer) - 1] of Integer;

  TSortThread = class(TThread)
  private
    FScripter: TDCScripter; //pointer
    FBox: TPaintBox;
    FSortArray: PSortArray;
    FSize: Integer;
    FA, FB, FI, FJ: Integer;
    procedure DoVisualSwap;
  protected
    procedure Execute; override;
    procedure Sort(var A: Variant); virtual; abstract;
  public
    constructor Create(AScripter: TDCScripter; Box: TPaintBox;
      var SortArray: array of Integer);
    procedure VisualSwap(A, B, I, J: Integer);
    property Terminated;
  end;

{ TBubbleSort }

  TBubbleSort = class(TSortThread)
  protected
    procedure Sort(var A: Variant); override;
  end;

{ TSelectionSort }

  TSelectionSort = class(TSortThread)
  protected
    procedure Sort(var A: Variant); override;
  end;

{ TQuickSort }

  TQuickSort = class(TSortThread)
  protected
    procedure Sort(var A: Variant); override;
  end;

procedure PaintLine(Canvas: TCanvas; I, Len: Integer);

implementation

uses Dialogs;

procedure PaintLine(Canvas: TCanvas; I, Len: Integer);
begin
  Canvas.PolyLine([Point(0, I * 2 + 1), Point(Len, I * 2 + 1)]);
end;

{ TSortThread }

constructor TSortThread.Create(AScripter: TDCScripter; Box: TPaintBox;
  var SortArray: array of Integer);
begin
  FScripter := AScripter;
  FBox := Box;
  FSortArray := @SortArray;
  FSize := High(SortArray) - Low(SortArray) + 1;
  FreeOnTerminate := True;
  inherited Create(False);
end;

procedure TSortThread.DoVisualSwap;
begin
  with FBox do
  begin
    Canvas.Pen.Color := clBtnFace;
    PaintLine(Canvas, FI, FA);
    PaintLine(Canvas, FJ, FB);
    Canvas.Pen.Color := clRed;
    PaintLine(Canvas, FI, FB);
    PaintLine(Canvas, FJ, FA);
  end;
end;

procedure TSortThread.VisualSwap(A, B, I, J: Integer);
begin
  FA := A;
  FB := B;
  FI := I;
  FJ := J;
  Synchronize(DoVisualSwap);
end;

procedure TSortThread.Execute;
var
  A: Variant;
  i: integer;
begin
  A := VarArrayCreate([0, FSize - 1], varInteger);
  for i := 0 to FSize - 1 do
    A[i] := FSortArray^[i];
  Sort(A);
  for i := 0 to FSize - 1 do
    FSortArray^[i] := A[i];
end;

{ TBubbleSort }

procedure TBubbleSort.Sort(var A: Variant);
begin
  FScripter.DispatchMethod('BubbleSort', [A, VarFromObject(Self)]);
end;

{ TSelectionSort }

procedure TSelectionSort.Sort(var A: Variant);
begin
  FScripter.DispatchMethod('SelectionSort', [A, VarFromObject(Self)]);
end;

{ TQuickSort }

procedure TQuickSort.Sort(var A: Variant);
begin
  FScripter.DispatchMethod('QuickSort', [A, VarFromObject(Self)]);
end;

end.
