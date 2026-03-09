'USEUNIT StdCtrls
'USEUNIT Dialogs
'USEUNIT Menus
'USEUNIT Forms
'USEUNIT ComCtrls
'USEUNIT dcedit
'USEUNIT DCGen
'USEUNIT ExtCtrls
'USEUNIT About
'USEUNIT Bmpdlg
dim  dtLine
dim  dtRectangle
dim  dtEllipse
dim  dtRoundRect

dim  BrushStyle
dim  PenStyle
dim  PenWide
dim  Drawing
dim  OriginX
dim  OriginY
dim  MovePtX
dim  MovePtY
dim  DrawingTool
dim  CurrentFile
CurrentFile=""
dim  CF_BITMAP

'-------------------------------------------------------------------

Sub FormMouseDown(Sender, Button, Shift, X, Y)
  Drawing = true
  call Image.Canvas.MoveTo(X, Y)
  OriginX = X
  OriginY = Y
  MovePtX = X
  MovePtY = Y
  StatusBar1.Panels(0).Text = "Origin: " + IntToStr(X) + " " + IntToStr(Y)
End Sub

'-------------------------------------------------------------------

Sub FormMouseUp(Sender, Button, Shift, X, Y)
  if Drawing then
    call DrawShape(OriginX,OriginY, X, Y, pmCopy)
    Drawing = false
  End If
End Sub

'-------------------------------------------------------------------

Sub FormMouseMove(Sender, Shift, X, Y)
  if Drawing then
    call DrawShape(OriginX, OriginY,MovePtX, MovePtY, pmNotXor)
    MovePtX = X
    MovePtY = Y
    call DrawShape(OriginX, OriginY, MovePtX,MovePtY ,pmNotXor)
  End If
  StatusBar1.Panels(1).Text = "Current: " + IntToStr(X) + " " + IntToStr(Y)
End Sub

'-------------------------------------------------------------------

Sub LineButtonClick(Sender)
  DrawingTool = dtLine
End Sub

'-------------------------------------------------------------------

sub RectangleButtonClick(Sender)
  DrawingTool = dtRectangle
End Sub

'-------------------------------------------------------------------

sub EllipseButtonClick(Sender)
  DrawingTool = dtEllipse
End Sub

'-------------------------------------------------------------------

Sub RoundRectButtonClick(Sender)
  DrawingTool = dtRoundRect
End Sub

'-------------------------------------------------------------------

Sub DrawShape(TopLeftX, TopLeftY ,BottomRightX,BottomRightY, AMode)

  Image.Canvas.Pen.Mode = AMode
  Select Case  DrawingTool
    case dtLine
      call Image.Canvas.MoveTo(TopLeftX, TopLeftY)
      call Image.Canvas.LineTo(BottomRightX, BottomRightY)
    case dtRectangle
      call Image.Canvas.Rectangle(TopLeftX, TopLeftY, BottomRightX, BottomRightY)
    case dtEllipse
      call Image.Canvas.Ellipse(TopLeftX, TopLeftY, BottomRightX, BottomRightY)
    case dtRoundRect:
      call Image.Canvas.RoundRect(TopLeftX, TopLeftY, BottomRightX, BottomRightY,(TopLeftX - BottomRightX) / 2,(TopLeftY - BottomRightY) / 2)
   End Select
End Sub

'-------------------------------------------------------------------

sub PenStyleEditChange(Sender)
  Image.Canvas.Pen.Style = PenStyleEdit.PenStyle
End Sub

sub BrushStyleEditChange(Sender)
  Image.Canvas.Brush.Style = BrushStyleEdit.BrushStyle
End Sub

'-------------------------------------------------------------------

sub PenColorEditChange(Sender)
  Image.Canvas.Pen.Color = PenColorEdit.SelectedColor
End Sub

'-------------------------------------------------------------------

sub BrushColorEditChange(Sender)
  Image.Canvas.Brush.Color = BrushColorEdit.SelectedColor
End Sub

'-------------------------------------------------------------------

sub PenSizeChange(Sender)
  If PenSizeEdit.Text <> "" then
    Image.Canvas.Pen.Width = StrToInt(PenSizeEdit.Text)
  End If
End Sub

'-------------------------------------------------------------------

sub FormCreate(Sender)
  dtLine = 0
  dtRectangle = 1
  dtEllipse = 2
  dtRoundRect = 3
  DrawingTool = dtLine
  CF_BITMAP = 2
  Bitmap = TBitmap.Create
  Bitmap.Width = 200
  Bitmap.Height = 200
  Image.Picture.Bitmap.Assign(Bitmap)
  Bitmap.Free
  PenStyleEdit.PenStyle = Image.Canvas.Pen.Style
  BrushStyleEdit.BrushStyle = Image.Canvas.Brush.Style
  PenColorEdit.SelectedColor = Image.Canvas.Pen.Color
  BrushColorEdit.SelectedColor = Image.Canvas.Brush.Color
End Sub

'-------------------------------------------------------------------

sub Exit1Click(Sender)
  Close
End Sub

'-------------------------------------------------------------------

sub miAboutClick(Sender)
  Formabout.ShowModal
End Sub

'-------------------------------------------------------------------

sub Open1Click(Sender)
  if OpenDialog1.Execute then
    CurrentFile = OpenDialog1.FileName
    call SaveStyles()
    Image.Picture.LoadFromFile(CurrentFile)
    call RestoreStyles()
  End If
End Sub

'-------------------------------------------------------------------

sub Save1Click(Sender)
  if CurrentFile <> "" then
    Image.Picture.SaveToFile(CurrentFile)
  else
    SaveAs1Click(Sender)
  End IF
End Sub

'-------------------------------------------------------------------

sub Saveas1Click(Sender)
  if SaveDialog1.Execute then
    CurrentFile = SaveDialog1.FileName
    Save1Click(Sender)
  End If
End Sub

'-------------------------------------------------------------------

sub New1Click(Sender)
 ' NewBMPForm.ActiveControl = WidthEdit
  NewBMPForm.WidthEdit.Text = IntToStr(Image.Picture.Graphic.Width)
  NewBMPForm.HeightEdit.Text = IntToStr(Image.Picture.Graphic.Height)
  if NewBMPForm.ShowModal = mrOk then
    Bitmap = TBitmap.Create
    Bitmap.Width = StrToInt(NewBMPForm.WidthEdit.Text)
    Bitmap.Height = StrToInt(NewBMPForm.HeightEdit.Text)
    call SaveStyles()
    Image.Picture.Bitmap.Assign(Bitmap)
    Bitmap.Free
    call RestoreStyles()
    CurrentFile = ""
  End If
End Sub

'-------------------------------------------------------------------

sub Copy1Click(Sender)
  Clipboard.Assign(Image.Picture)
End Sub

'-------------------------------------------------------------------

sub Cut1Click(Sender)
  call Copy1Click(Sender)
  OldBrushColor = Image.Canvas.Brush.Color
  OldBrushStyle= Image.Canvas.Brush.Style
  OldPenColor = Image.Canvas.Pen.Color
  Image.Canvas.Brush.Color = clWhite
  Image.Canvas.Pen.Color = clWhite
  call Image.Canvas.Rectangle(0,0,Image.Width,Image.Height)
  Image.Canvas.Brush.Color = OldBrushColor
  Image.Canvas.Brush.Style  = OldBrushStyle
  Image.Canvas.Pen.Color =OldPenColor
End Sub

'-------------------------------------------------------------------

sub Paste1Click(Sender)
  if Clipboard.HasFormat(CF_BITMAP) then
    Bitmap = TBitmap.Create
    Bitmap.Assign(Clipboard)
    call Image.Canvas.Draw(0, 0, Bitmap)
    Bitmap.Free
  End IF
End Sub

'-------------------------------------------------------------------

sub SaveStyles()
  BrushStyle = Image.Canvas.Brush.Style
  PenStyle = Image.Canvas.Pen.Style
  PenWide = Image.Canvas.Pen.Width
End Sub

'-------------------------------------------------------------------

sub RestoreStyles()
  Image.Canvas.Brush.Style = BrushStyle
  Image.Canvas.Pen.Style = PenStyle
  Image.Canvas.Pen.Width = PenWide
End Sub