{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit TetrisScript;

interface
Uses
  ExtCtrls, Menus, Classes,Types;

Const
  cDCFieldWidth  = 10;
  cDCFieldHeight = 23;
  cDCFigureLength = 4;
  sDCFigureNumber = 28;

type
  TForm1 = class(TForm)
    GameTimer: TTimer;
    MainMenu1: TMainMenu;
    GameItems: TMenuItem;
    StartItem: TMenuItem;
    StopItem: TMenuItem;
    N4: TMenuItem;
    ExitItem: TMenuItem;
    PauseItem: TMenuItem;
    procedure StartItemClick(Sender: TObject);
    procedure GameTimerTimer(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure StopItemClick(Sender: TObject);
    procedure ExitItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure PauseItemClick(Sender: TObject);
  private
    FFigureTop  : Integer;
    FFigureLeft : Integer;
    FFirstTime  : Boolean;

    FFigureRotationCenterX : Integer;
    FFigureRotationCenterY : Integer;

    FFigure    : Array[ 1 .. cDCFigureLength, 1 .. cDCFigureLength ];
    FGameField : Array[ 1 .. cDCFieldWidth, 1 .. cDCFieldHeight ];

    FTransferring : Boolean;
    FNewFigure    : Integer;

    FStepX : Integer;
    FStepY : Integer;

    FBurnedLineNumber : Integer;
    FLineValue        : Integer;
    FScore            : Integer;
    FLevel            : Integer;

    FGamePaused  : Boolean;
    FGameStopped : Boolean;

    Procedure FindFigureCenter;
    Procedure GenerateNewFigure;
    Procedure DrawFigure;

    Procedure ValidateFigure;

    Function  CanMoveFigureDown : Boolean;
    Function  CanShiftFigure( ALeftShift : Boolean ) : Boolean;
    Procedure MoveFigureDown;
    Procedure ShiftFigure( ALeftShift : Boolean );
    Procedure TurnFigure( ALeftRotation : Boolean );
    Procedure PutFigure;

    Procedure CheckLine;
    Procedure BurnLine( ALine : Integer; ABeforeBurnedLines : Integer );

    Procedure ResetGameField;
    Procedure Remeasure;

    Procedure ValidateScore;
    Procedure RefreshScore;
  public
    Procedure InvalidateWorkArea( ABeforeGame : Boolean );
    Procedure DrawItem( ALeft, ATop : Integer; AStyle : Integer );

    Procedure StopGame;
    Procedure PauseGame;
  end;

var
  Form1 : TForm1;

implementation

Const
  sDCGameOver     = 'Game Over';
  sDCGameResume   = 'Resume game';
  sDCGamePause    = 'Pause';
  sDCPauseMessage = 'Pause';


  sDCFiguresList = '1110001000000000' +
                   '1110100000000000' +
                   '0100111000000000' +
                   '0110110000000000' +
                   '1100011000000000' +
                   '1111000000000000' +
                   '0000011001100000' +
                 // -------------------
                   '2220002000000000' +
                   '2220200000000000' +
                   '0200222000000000' +
                   '0220220000000000' +
                   '2200022000000000' +
                   '2222000000000000' +
                   '0000022002200000' +
                 // -------------------
                   '3330003000000000' +
                   '3330300000000000' +
                   '0300333000000000' +
                   '0330330000000000' +
                   '3300033000000000' +
                   '3333000000000000' +
                   '0000033003300000' +
                 // -------------------
                   '4440004000000000' +
                   '4440400000000000' +
                   '0400444000000000' +
                   '0440440000000000' +
                   '4400044000000000' +
                   '4444000000000000' +
                   '0000044004400000';

  cDCGameFieldColor = clBlack;

  cDCScoreSpace = 10;
  cDCScoreShift = 10;

  cDCStartInterval = 500;
  cDCMaxLevel = 10;
  cStartLineValue = 5;
  cDCLevelStep = 10;

  sDCScore = 'Score: ';
  sDCLines = 'Lines: ';
  sDCLevel = 'Level: ';
  sDCNewFigure = 'Next Figure:';

{$R *.DFM}

Procedure TForm1.ResetGameField;
Var
  I, J : Integer;
begin
  For I := 1 To cDCFieldWidth Do
    For J := 1 To cDCFieldHeight Do
      FGameField[ I, J ] := 0;
end;

Procedure TForm1.StartItemClick(Sender: TObject);
begin
  If FGamePaused Then
  begin
    PauseGame;
    Exit;
  end;

  FBurnedLineNumber := 0;
  FLineValue        := cStartLineValue;
  FScore            := 0;
  FLevel            := 1;
  FFirstTime        := False;
  FTransferring     := False;
  FGamePaused       := False;
  FGameStopped      := False;

  Randomize;
  Remeasure;
  ResetGameField;
  InvalidateWorkArea( True );

  FNewFigure := Random( sDCFigureNumber - 1 );
//  RefreshScore;
  GenerateNewFigure;

  GameTimer.Interval := cDCStartInterval;
  GameTimer.Enabled := True;
  StopItem.Enabled := True;
  PauseItem.Enabled := True;
end;

Procedure TForm1.DrawItem( ALeft, ATop : Integer; AStyle : Integer );
begin
  With Canvas Do
  begin
    Case AStyle Of
      0   : begin
              Pen.Color := cDCGameFieldColor;
              Brush.Color := cDCGameFieldColor;
            end
      2   : begin
              Pen.Color := clRed;
              Brush.Color := clFuchsia;
            end;
      3   : begin
              Pen.Color := clSilver;
              Brush.Color := clWhite;
            end;
      4   : begin
              Pen.Color := clGreen;
              Brush.Color := clLime;
            end;
      Else begin
             Pen.Color := clBlue;
             Brush.Color := clAqua;
           end;
    End;
//    If AStyle = 0 Then
      Rectangle( ALeft, ATop, ALeft + FStepX, ATop + FStepY )
{    Else
      Ellipse( ALeft, ATop, ALeft + FStepX, ATop + FStepY );}
  end;
end;

Procedure TForm1.InvalidateWorkArea( ABeforeGame : Boolean );
Var
  I, J              : Integer;
  RectLeft, RectTop : Integer;

  Procedure _OutMessage( Const AMessage : String );
  Var
    tWidth, tHeight, RectLeft, RectTop : Integer;
  begin
    With Canvas Do
    begin
      Font.Size := 14;
      tWidth := TextWidth( AMessage );
      tHeight := TextHeight( AMessage );
      RectLeft := ( cDCFieldWidth * FStepX - tWidth ) Div 2;
      RectTop  := ( cDCFieldHeight * FStepY - tHeight ) Div 2;
      Font.Color := clWhite;
      Brush.Color := cDCGameFieldColor;
      TextRect( Rect( RectLeft, RectTop, RectLeft + tWidth, RectTop + tHeight ), RectLeft, RectTop, AMessage );
    end;
  end;

begin
  If FFirstTime Or FGamePaused Then
    With Canvas Do
    begin
      Pen.Color := cDCGameFieldColor;
      Brush.Color := cDCGameFieldColor;
      Rectangle( 0, 0, cDCFieldWidth * FStepX, cDCFieldHeight * FStepX );
      If FGamePaused Then
        _OutMessage( sDCPauseMessage );
      Exit;
    end;

  RectLeft := 0;

  For I := 1 To cDCFieldWidth Do
  begin
    RectTop := 0;
    For J := 1 To cDCFieldHeight Do
    begin
      DrawItem( RectLeft, RectTop, FGameField[ I, J ] );
      Inc( RectTop, FStepY );
    end;
    Inc( RectLeft, FStepX );
  end;

  If Not ABeforeGame And FGameStopped Then
    _OutMessage( sDCGameOver );
end;

Procedure TForm1.FindFigureCenter;
Var
  I, J, Line, Fill : Integer;
begin
  FFigureRotationCenterX := 0;
  Fill := 0;
  For I := cDCFigureLength DownTo 1 Do
  begin
    Line := 0;
    For J := cDCFigureLength DownTo 1 Do
      If FFigure[ I, J ] <> 0 Then
        Inc( Line );
    Inc( FFigureRotationCenterX, Line * I );
    Inc( Fill, Line );
  end;
  If Fill = 0 Then
  begin
    StopGame;
    Exit;
  end;
  FFigureRotationCenterX := Round( FFigureRotationCenterX / Fill );

  FFigureRotationCenterY := 0;
  Fill := 0;
  For J := cDCFigureLength DownTo 1 Do
  begin
    Line := 0;
    For I := cDCFigureLength DownTo 1 Do
      If FFigure[ I, J ] <> 0 Then
        Inc( Line );
    Inc( FFigureRotationCenterY, Line * J );
    Inc( Fill, Line );
  end;
  FFigureRotationCenterY := Round( FFigureRotationCenterY / Fill );
end;

Procedure TForm1.GenerateNewFigure;
Var
  I, J, NewFigure : Integer;
begin
  FFigureLeft := cDCFieldWidth Div 2;

  NewFigure := FNewFigure * cDCFigureLength * cDCFigureLength;
  For I := cDCFigureLength DownTo 1 Do
    For J := cDCFigureLength DownTo 1 Do
      FFigure[ I, J ] := sDCFiguresList[ NewFigure + ( I - 1 ) * cDCFigureLength + J ];
  Randomize;
  FNewFigure := Random( sDCFigureNumber - 1 );

  For I := 1 To cDCFigureLength Do
  begin
    FFigureTop := 0;
    For J := cDCFigureLength DownTo 1 Do
      If FFigure[ I, J ] <> 0 Then
        Inc( FFigureTop );
    If FFigureTop <> 0 Then
    begin
      FFigureTop := 1 - I;
      break;
    end;
  end;

  FindFigureCenter;

  If Not CanMoveFigureDown Then
  begin
    Inc( FFigureTop );
    StopGame;
    Exit;
  end;

  Inc( FFigureTop );
  DrawFigure;
  RefreshScore;
end;

Function TForm1.CanMoveFigureDown : Boolean;
Var
  I, J : Integer;
begin
  Result := True;
  For I := 1 To cDCFigureLength Do
  begin
    For J := cDCFigureLength DownTo 1 Do
      If FFigure[ I, J ] <> 0 Then
      begin
        Result := ( FFigureTop + J <= cDCFieldHeight ) And
                  ( FGameField[ FFigureLeft + I - 1, FFigureTop + J ] = 0 );
        break;
      end;
    If Not Result Then
      Exit;
  end;
end;

Procedure TForm1.DrawFigure( AWithBorder : Boolean );
Var
  I, J                       : Integer;
  RectLeft, RectTop, SaveTop : Integer;
begin
  If FFigureLeft > 1 Then
    RectLeft := ( FFigureLeft - 2 ) * FStepX
  Else
    RectLeft := 0;
  If FFigureTop > 1 Then
    SaveTop := ( FFigureTop - 2 ) * FStepY
  Else
    SaveTop := 0;

  For I := 0 To cDCFigureLength + 1 Do
    If ( FFigureLeft + I > 1 ) And ( FFigureLeft + I - 1 <= cDCFieldWidth ) Then
    begin
      RectTop := SaveTop;
      For J := 0 To cDCFigureLength + 1 Do
        If ( FFigureTop + J > 1 ) And ( FFigureTop + J - 1 <= cDCFieldHeight ) Then
        begin
          If ( ( I <> 0 ) And ( I <> cDCFigureLength + 1 ) And
               ( J <> 0 ) And ( J <> cDCFigureLength + 1 ) And ( FFigure[ I, J ] <> 0 ) ) Then
            DrawItem( RectLeft, RectTop, FFigure[ I, J ] )
          Else
            DrawItem( RectLeft, RectTop, FGameField[ FFigureLeft + I - 1, FFigureTop + J - 1 ] );
          Inc( RectTop, FStepY );
        end;
      Inc( RectLeft, FStepX );
    end;
end;

Procedure TForm1.ValidateFigure;
Var
  I, J, RectLeft, RectTop, SaveTop : Integer;
begin
  RectLeft := ( FFigureLeft - 1 ) * FStepX;
  SaveTop := ( FFigureTop - 1 ) * FStepY;
  For I := 1 To cDCFigureLength Do
    If FFigureLeft + I - 1 <= cDCFieldWidth Then
    begin
      RectTop := SaveTop;
      For J := 1 To cDCFigureLength Do
        If FFigureTop + J - 1 <= cDCFieldHeight Then
        begin
          If FFigure[ I, J ] <> 0 Then
            FGameField[ FFigureLeft + I - 1, FFigureTop + J - 1 ] := FFigure[ I, J ];
          Inc( RectTop );
        end;
        Inc( RectLeft );
      end;
  CheckLine;
  GenerateNewFigure;
end;

Procedure TForm1.MoveFigureDown;
Var
  I, RectLeft, RectTop : Integer;
begin
  If FTransferring Then
    Exit;

  FTransferring := True;
  try
    RectLeft := ( FFigureLeft - 1 ) * FStepX;
    RectTop := ( FFigureTop - 1 ) * FStepY;
    If Not CanMoveFigureDown Then
    begin
      ValidateFigure;
      Exit;
    end;

    Inc( FFigureTop );

    For I := 1 To cDCFigureLength Do
    begin
      If FFigure[ I, 1 ] <> 0 Then
        DrawItem( RectLeft, RectTop, 0 );
      Inc( RectLeft, FStepX );
    end;
    DrawFigure;
  finally
    FTransferring := False;
  end;
end;

Function TForm1.CanShiftFigure( ALeftShift : Boolean ) : Boolean;
Var
  I, J : Integer;
begin
  Result := True;
  For J := 1 To cDCFigureLength Do
  begin
    If ALeftShift Then
    begin
      For I := 1 To cDCFigureLength Do
        If FFigure[ I, J ] <> 0 Then
        begin
          Result := ( FFigureLeft + I - 2 >= 1 ) And
                    ( FGameField[ FFigureLeft + I - 2, FFigureTop + J - 1 ] = 0 );
          break;
        end
    end
    Else
      For I := cDCFigureLength DownTo 1 Do
        If FFigure[ I, J ] <> 0 Then
        begin
          Result := ( FFigureLeft + I <= cDCFieldWidth ) And
                    ( FGameField[ FFigureLeft + I, FFigureTop + J - 1 ] = 0 );
          break;
        end;
    If Not Result Then
      Exit;
  end;
end;

Procedure TForm1.ShiftFigure( ALeftShift : Boolean );
Var
  I, SideIndex, RectLeft, RectTop : Integer;
begin
  If FTransferring Then
    Exit;

  FTransferring := True;
  try
    If Not CanShiftFigure( ALeftShift ) Then
      Exit;

    RectLeft := ( FFigureLeft - 1 ) * FStepX;
    RectTop := ( FFigureTop - 1 ) * FStepY;

    If ALeftShift Then
    begin
      SideIndex := cDCFigureLength;
      RectLeft := RectLeft + ( cDCFigureLength - 1 ) * FStepX;
    end
    Else
      SideIndex := 1;

    With Canvas Do
    begin
      Pen.Color := cDCGameFieldColor;
      Brush.Color := cDCGameFieldColor;
      For I := 1 To cDCFigureLength Do
      begin
        If FFigure[ SideIndex, I ] <> 0 Then
          Rectangle( RectLeft, RectTop, RectLeft + FStepX, RectTop + FStepY );
        Inc( RectTop, FStepY );
      end;
    end;

    If ALeftShift Then
      Dec( FFigureLeft )
    Else
      Inc( FFigureLeft );

    DrawFigure;
  finally
    FTransferring := False;
  end;
end;

Procedure TForm1.TurnFigure( ALeftRotation : Boolean );
Var
  I, J, OldX, OldY, RealLeft, RealTop, RectTop, RectLeft, Save : Integer;

  Procedure _Rotate( ALeftRotation : Boolean );
  Var
    I, J      : Integer;
    NewFigure : Array[ 1 .. cDCFigureLength, 1 .. cDCFigureLength ];
  begin
    For I := 1 To cDCFigureLength Do
      For J := 1 To cDCFigureLength Do
        If ALeftRotation Then
          NewFigure[ cDCFigureLength - J + 1, I ] := FFigure[ I, J ]
        Else
          NewFigure[ J, cDCFigureLength - I + 1 ] := FFigure[ I, J ];

    For I := 1 To cDCFigureLength Do
      For J := 1 To cDCFigureLength Do
        FFigure[ I, J ] := NewFigure[ I, J ];
  end;

begin
  If FTransferring Then
    Exit;

  FTransferring := True;
  try
    _Rotate( ALeftRotation );
    OldX := FFigureRotationCenterX;
    OldY := FFigureRotationCenterY;
    FindFigureCenter;
    RealLeft := FFigureLeft + OldX - FFigureRotationCenterX;
    RealTop := FFigureTop + OldY - FFigureRotationCenterY;
    For I := 1 To cDCFigureLength Do
      For J := 1 To cDCFigureLength Do
        If ( FFigure[ I, J ] <> 0 ) And
           ( ( RealLeft + I <= 1 ) Or ( RealLeft + I - 1 > cDCFieldWidth ) Or
             ( RealTop + J <= 1 ) Or ( RealTop + J - 1 > cDCFieldHeight ) Or
             ( FGameField[ RealLeft + I - 1, RealTop + J - 1 ] <> 0 ) ) Then
        begin
          _Rotate( Not ALeftRotation );
          FFigureRotationCenterX := OldX;
          FFigureRotationCenterY := OldY;
          Exit;
        end;

    Save := ( FFigureTop - 1 ) * FStepY;
    If OldX > FFigureRotationCenterX Then
    begin
      RectLeft := ( FFigureLeft - 1 ) * FStepX;
      I := FFigureLeft;
      OldX := RealLeft;
    end
      Else
    begin
      RectLeft := ( RealLeft + cDCFigureLength - 1 ) * FStepX;
      I := RealLeft + cDCFigureLength;
      OldX := FFigureLeft + cDCFigureLength;
    end;

    For I := I To OldX Do
    begin
      RectTop := Save;
      If ( I > 0 ) And ( I <= cDCFieldWidth ) Then
        For J := FFigureTop To FFigureTop + cDCFigureLength Do
          If ( J > 0 ) And ( J <= cDCFieldHeight ) Then
          begin
            DrawItem( RectLeft, RectTop, FGameField[ I, J ] );
            RectTop := RectTop + FStepY;
          end;
      RectLeft := RectLeft + FStepX;
    end;

    Save := ( FFigureLeft - 1 ) * FStepX;
    If OldY > FFigureRotationCenterY Then
    begin
      RectTop := ( FFigureTop - 1 ) * FStepY;
      I := FFigureTop;
      OldY := RealTop;
    end
      Else
    begin
      RectTop := ( RealTop + cDCFigureLength - 1 ) * FStepY;
      I := RealTop + cDCFigureLength;
      OldY := FFigureTop + cDCFigureLength;
    end;

    For J := I To OldY Do
    begin
      RectLeft := Save;
      If ( J > 0 ) And ( J <= cDCFieldHeight ) Then
        For I := FFigureLeft To FFigureLeft + cDCFigureLength Do
          If ( I > 0 ) And ( I <= cDCFieldWidth ) Then
          begin
            DrawItem( RectLeft, RectTop, FGameField[ I, J ] );
            RectLeft := RectLeft + FStepX;
          end;
      RectTop := RectTop + FStepY;
    end;

    FFigureLeft := RealLeft;
    FFigureTop := RealTop;
    DrawFigure;
  finally
    FTransferring := False;
  end;
end;

Procedure TForm1.PutFigure;
Var
  I, J, RectLeft, RectTop, SaveTop : Integer;
begin
  If FTransferring Then
    Exit;

  FTransferring := True;
  GameTimer.Enabled := False;
  try
    RectLeft := ( FFigureLeft - 1 ) * FStepX;
    SaveTop := ( FFigureTop - 1 ) * FStepY;
    While CanMoveFigureDown Do
      Inc( FFigureTop );
    RectTop := ( FFigureTop - 1 ) * FStepY;

    Canvas.Pen.Color := cDCGameFieldColor;
    Canvas.Brush.Color := cDCGameFieldColor;
    For I := 1 To cDCFigureLength Do
    begin
      For J := 1 To cDCFigureLength Do
        If FFigure[ I, J ] <> 0 Then
        begin
          Canvas.Rectangle( RectLeft, SaveTop, RectLeft + FStepX, RectTop );
          break;
        end;
      Inc( RectLeft, FStepX );
    end;

    DrawFigure;
    ValidateFigure;
  finally
    GameTimer.Enabled := Not FGameStopped;
    FTransferring := False;
  end;
end;

Procedure TForm1.StopGame;
begin
  FGameStopped := True;
  FGamePaused := False;
  GameTimer.Enabled := False;
  StopItem.Enabled := False;
  PauseItem.Enabled := False;
  PauseItem.Caption := sDCGamePause;
  InvalidateWorkArea( False );
end;

procedure TForm1.GameTimerTimer(Sender: TObject);
begin
  MoveFigureDown;
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
  InvalidateWorkArea( False );
  If Not ( FGameStopped Or FGamePaused ) Then
    DrawFigure;
  RefreshScore;
end;

procedure TForm1.StopItemClick(Sender: TObject);
begin
  StopGame;
end;

procedure TForm1.ExitItemClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FFirstTime := True;
  FGameStopped := True;
  FGamePaused := False;
  FTransferring := False;
  Remeasure;
  ResetGameField;
end;

Procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If FTransferring Or FGameStopped Then
    Exit;

  If ( Key = Ord( 'p' ) ) Or ( Key = Ord( 'P' ) ) Then
    PauseGame
  Else
    If Not FGamepaused Then
      Case Key Of
        37   : ShiftFigure( True );   // VK_Left
        39   : ShiftFigure( False );  // VK_Right
        32   : PutFigure;             // VK_Space
        38   : TurnFigure( False );   // VK_Up
        40   : MoveFigureDown;//TurnFigure( True );    // VK_Down
      End;
end;

Procedure TForm1.CheckLine;
Var
  FullLine                : Boolean;
  I, J, BeforeBurnedLines : Integer;
begin
  BeforeBurnedLines := 0;
  For J := FFigureTop To FFigureTop + cDCFigureLength Do
    If ( J > 0 ) And ( J <= cDCFieldHeight ) Then
    begin
      FullLine := True;
      For I := 1 To cDCFieldWidth Do
        If FGameField[ I, J ] = 0 Then
        begin
          FullLine := False;
          break;
        end;
      If FullLine Then
      begin
        BurnLine( J, BeforeBurnedLines );
        Inc( BeforeBurnedLines );
      end;
    end;
end;

Procedure TForm1.BurnLine( ALine, ABeforeBurnedLines : Integer );
Var
  I, J, RectTop, RectLeft : Integer;
begin
  GameTimer.Enabled := False;
  try
    Inc( FBurnedLineNumber );
    FScore := FScore + Round( FLineValue * ( ABeforeBurnedLines + 2 ) / 2 );
    ValidateScore;
    RectTop := FStepY * ( ALine - 1 );

    For J := ALine DownTo 2 Do
    begin
      RectLeft := 0;
      For I := 1 To cDCFieldWidth Do
      begin
        FGameField[ I, J ] := FGameField[ I, J - 1 ];
        DrawItem( RectLeft, RectTop, FGameField[ I, J ] );
        Inc( RectLeft, FStepX );
      end;
      Dec( RectTop, FStepY );
    end;
    For I := 1 To cDCFieldWidth Do
      FGameField[ I, 1 ] := 0;

    With Canvas Do
    begin
      Pen.Color := cDCGameFieldColor;
      Brush.Color := cDCGameFieldColor;
      Rectangle( 0, 0, cDCFieldWidth * FStepX, FStepY );
    end;
  finally
    GameTimer.Enabled := Not FGameStopped;
  end;
end;

Procedure TForm1.Remeasure;
begin
  FStepX := ClientWidth Div cDCFieldWidth;
  FStepY := ClientHeight Div cDCFieldHeight;
  If FStepX > FStepY Then
    FStepX := FStepY
  Else
    FStepY := FStepX;
end;

Procedure TForm1.FormResize(Sender: TObject);
begin
  Remeasure;
  Invalidate;
end;

Procedure TForm1.ValidateScore;
begin
  If ( FLevel < cDCMaxLevel ) And ( FBurnedLineNumber Mod cDCLevelStep = 0 ) Then
  begin
    FLineValue := FLineValue * 2;
    Inc( FLevel );
    GameTimer.Interval := cDCStartInterval * 2 / FLevel;//Round( ( GameTimer.Interval * 3 ) / 4 );
  end;
  RefreshScore;
end;

Procedure TForm1.RefreshScore;
Var
  I, J, Height, RectTop, RectLeft : Integer;
  DrawingRect                     : TRect;
begin
  With Canvas Do
  begin
    Pen.Color := clBtnFace;
    Brush.Color := clBtnFace;
    Font.Size := Self.Font.Size;
    Font.Color := clBtnText;

    Height := Canvas.TextHeight( '0' ) + cDCScoreSpace;
    DrawingRect := Rect( cDCFieldWidth * FStepX, 0, ClientWidth, Height );

    TextRect( DrawingRect, DrawingRect.Left + cDCScoreShift, DrawingRect.Top + cDCScoreSpace,
              sDCScore + IntToStr( FScore ) );
    DrawingRect.Top := DrawingRect.Bottom;
    DrawingRect.Bottom := DrawingRect.Bottom + Height;
    TextRect( DrawingRect, DrawingRect.Left + cDCScoreShift, DrawingRect.Top + cDCScoreSpace,
              sDCLines + IntToStr( FBurnedLineNumber ) );
    DrawingRect.Top := DrawingRect.Bottom;
    DrawingRect.Bottom := DrawingRect.Bottom + Height * 2;
    TextRect( DrawingRect, DrawingRect.Left + cDCScoreShift, DrawingRect.Top + cDCScoreSpace,
              sDCLevel + IntToStr( FLevel ) );
    DrawingRect.Top := DrawingRect.Bottom;
    DrawingRect.Bottom := DrawingRect.Bottom + Height;
    TextRect( DrawingRect, DrawingRect.Left + cDCScoreShift, DrawingRect.Top + cDCScoreSpace,
              sDCNewFigure );
  end;

  DrawingRect.Top := DrawingRect.Bottom + cDCScoreSpace;
  RectLeft := DrawingRect.Left + cDCScoreShift;
  If Not FGameStopped Then
  begin
    Height := FNewFigure * cDCFigureLength * cDCFigureLength;
    For I := 1 To cDCFigureLength Do
    begin
      RectTop := DrawingRect.Top;
      For J := 1 To cDCFigureLength Do
      begin
        DrawItem( RectLeft, RectTop, sDCFiguresList[ Height + ( I - 1 ) * cDCFigureLength + J ] );
        Inc( RectTop, FStepY );
      end;
      RectLeft := RectLeft + FStepX;
    end;
    With Canvas Do
    begin
      Pen.Color := clBtnFace;
      Brush.Color := clBtnFace;
      Rectangle( RectLeft, DrawingRect.Top, ClientWidth, RectTop );
    end;
    DrawingRect.Top := RectTop;
  end;
  Canvas.Rectangle( DrawingRect.Left, DrawingRect.Top, ClientWidth, ClientHeight );
end;

Procedure TForm1.PauseGame;
begin
  GameTimer.Enabled := FGamePaused;
  FGamePaused := Not FGamePaused;
  InvalidateWorkArea( False );
  If FGamePaused Then
    PauseItem.Caption := sDCGameResume
  Else
  begin
    PauseItem.Caption := sDCGamePause;
    DrawFigure;
  end;
end;

Procedure TForm1.PauseItemClick(Sender: TObject);
begin
  PauseGame;
end;

end.
