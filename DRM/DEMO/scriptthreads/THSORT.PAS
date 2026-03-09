{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit ThSort;

interface

uses
  Forms, Controls, StdCtrls, ExtCtrls, Classes, dcsystem, dcscript,
  ComCtrls, Graphics;

type
  TThreadSortForm = class(TForm)
    DCScripter1: TDCScripter;
    Panel1: TPanel;
    Image1: TImage;
    Label4: TLabel;
    lblWWW: TLabel;
    lblEMail: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Bevel2: TBevel;
    BubbleSortBox: TPaintBox;
    SelectionSortBox: TPaintBox;
    QuickSortBox: TPaintBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    StartBtn: TButton;
    Button1: TButton;
    procedure BubbleSortBoxPaint(Sender: TObject);
    procedure SelectionSortBoxPaint(Sender: TObject);
    procedure QuickSortBoxPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StartBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lblWWWClick(Sender: TObject);
    procedure lblEMailClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    ThreadsRunning: Integer;
    fThread1 : TThread;
    fThread2 : TThread;
    fThread3 : TThread;
    procedure RandomizeArrays;
    procedure ThreadDone(Sender: TObject);
  public
    procedure PaintArray(Box: TPaintBox; const A: array of Integer);
  end;

var
  ThreadSortForm: TThreadSortForm;

implementation

uses
  SortThds, dcpascal, dccommon, Unit2;

{$R *.DFM}

type
  PSortArray = ^TSortArray;
  TSortArray =  array[0..114] of Integer;

var
  ArraysRandom: Boolean;
  BubbleSortArray, SelectionSortArray, QuickSortArray: TSortArray;

{ TThreadSortForm }

procedure TThreadSortForm.PaintArray(Box: TPaintBox; const A: array of Integer);
var
  I: Integer;
begin
  with Box do
  begin
    Canvas.Pen.Color := clRed;
    for I := Low(A) to High(A) do PaintLine(Canvas, I, A[I]);
  end;
end;

procedure TThreadSortForm.BubbleSortBoxPaint(Sender: TObject);
begin
  PaintArray(BubbleSortBox, BubbleSortArray);
end;

procedure TThreadSortForm.SelectionSortBoxPaint(Sender: TObject);
begin
  PaintArray(SelectionSortBox, SelectionSortArray);
end;

procedure TThreadSortForm.QuickSortBoxPaint(Sender: TObject);
begin
  PaintArray(QuickSortBox, QuickSortArray);
end;

type
  TSwapProc = procedure (A, B, I, J: Integer) of object;

function GetTerminated(Instance: TObject; Index: PArgList): OleVariant;
begin
  Result := TSortThread(Instance).Terminated;
end;

procedure TThreadSortForm.FormCreate(Sender: TObject);
begin
  RandomizeArrays;
  RegisterProc(TSortThread, 'VisualSwap', mtMethod, TypeInfo(TSwapProc),
    [TypeInfo(integer), TypeInfo(integer), TypeInfo(integer), TypeInfo(integer)],
    Addr(TSortThread.VisualSwap), cRegister);
  RegisterProperty(TSortThread, 'Terminated', GetTerminated, nil);
end;

procedure TThreadSortForm.StartBtnClick(Sender: TObject);
begin
  RandomizeArrays;
  ThreadsRunning := 3;
  DCScripter1.CreateScriptRunner;
  fThread1 := TBubbleSort.Create(DCScripter1, BubbleSortBox, BubbleSortArray);
  fThread1.OnTerminate := ThreadDone;
  fThread2 := TSelectionSort.Create(DCScripter1, SelectionSortBox, SelectionSortArray);
  fThread2.OnTerminate := ThreadDone;
  fThread3 := TQuickSort.Create(DCScripter1, QuickSortBox, QuickSortArray);
  fThread3.OnTerminate := ThreadDone;
  StartBtn.Enabled := False;
end;

procedure TThreadSortForm.RandomizeArrays;
var
  I: Integer;
begin
  if not ArraysRandom then
  begin
    Randomize;
    for I := Low(BubbleSortArray) to High(BubbleSortArray) do
      BubbleSortArray[I] := Random(170);
    SelectionSortArray := BubbleSortArray;
    QuickSortArray := BubbleSortArray;
    ArraysRandom := True;
    Repaint;
  end;
end;

procedure TThreadSortForm.ThreadDone(Sender: TObject);
begin
  Dec(ThreadsRunning);
  if ThreadsRunning = 0 then
  begin
    StartBtn.Enabled := True;
    StartBtn.SetFocus;
    ArraysRandom := False;
  end;
end;

procedure TThreadSortForm.FormDestroy(Sender: TObject);
begin
  if fThread1 <> nil then
    fThread1.Terminate;
  if fThread2 <> nil then
    fThread2.Terminate;
  if fThread3 <> nil then
    fThread3.Terminate;
end;

procedure TThreadSortForm.lblWWWClick(Sender: TObject);
begin
  JumpToURL('http://www.dream-com.com');
end;

procedure TThreadSortForm.lblEMailClick(Sender: TObject);
begin
  JumpToURL('mailto:contact@dream-com.com');
end;

procedure TThreadSortForm.Button1Click(Sender: TObject);
begin
  Form1.ShowModal;
end;

end.
