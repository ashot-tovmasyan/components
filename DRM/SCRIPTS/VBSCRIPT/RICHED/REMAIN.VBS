'USEUNIT Dialogs
'USEUNIT Menus
'USEUNIT dcedit
'USEUNIT DCGen
'USEUNIT ComCtrls
'USEUNIT StdCtrls
'USEUNIT ExtCtrls
'USEUNIT reabout
dim FFileName
dim FUpdating
dim RulerAdj
dim GutterWid
dim FDragOfs
dim FDragging

' ------------------------------------------------------------------

Sub SetFileName(FileName)
  FFileName = FileName
  Caption = ExtractFileName(FileName)
End Sub

' ------------------------------------------------------------------

Sub  SetModified(Value)
  stext=""
  if Value  then stext = "Modified"
  StatusBar.Panels.Items(1).Text = stext
End Sub

' ------------------------------------------------------------------

Sub PerformFileOpen(AFileName)
  Editor.Lines.LoadFromFile(AFileName)
  SetFileName(AFileName)
  Editor.SetFocus
  Editor.Modified = false
  SetModified(false)
End Sub

' ------------------------------------------------------------------

function CheckFileSave()
  if not (Editor.Modified) then
    CheckFileSave = true
  else
   res = MessageDlg("Save changes to " + FFileName + "?",  mtConfirmation, mbYesNoCancel, 0)
   if res = mrYes then FileSave(MainForm)
   if res = mrCancel then
     CheckFileSave = false
   else
     CheckFileSave = true
   end if
  end if
End function

' ------------------------------------------------------------------

function CurrText()
  CurrText = Editor.SelAttributes
End function

' ------------------------------------------------------------------

Sub UpdateCursorPos()
  CharPosY = Editor.Perform(EM_LINEFROMCHAR, Editor.SelStart, 0)
  CharPosX = (Editor.SelStart - Editor.Perform(EM_LINEINDEX, CharPosY, 0))
  CharPosY = CharPosY + 1
  CharPosX = CharPosX + 1
  StatusBar.Panels(0).Text = "Line: "+  IntToStr(CharPosY) + " Col: "+ IntToStr(CharPosX)
  CopyButton.Enabled = (Editor.SelLength > 0)
  EditCopyItem.Enabled = CopyButton.Enabled
  CutButton.Enabled = CopyButton.Enabled
  EditCutItem.Enabled = CopyButton.Enabled
End Sub

' ------------------------------------------------------------------

Sub SetupRuler()
  T = chr(9) +  "|"
  for i = 1  to 100
    S = S + T
  Next
  Ruler.Caption = S
End Sub


' ------------------------------------------------------------------

sub FileSave(Sender)
  if FFileName = "Untitled" then
     FileSaveAs(MainForm)
  else
    Editor.Lines.SaveToFile(FFileName)
    Editor.Modified = false
    SetModified(false)
  End If
End Sub

' ------------------------------------------------------------------

sub FileSaveAs(Sender)
  if SaveDialog.Execute then
    if  FileExists(SaveDialog.FileName)  and ( MessageDlg( "OK to overwrite "+ SaveDialog.FileName,  mtConfirmation, mbYesNoCancel, 0) <> mrYes ) then
       exit Sub
    End if
    else
      exit Sub
  End If
  Editor.Lines.SaveToFile(SaveDialog.FileName)
  SetFileName(SaveDialog.FileName)
  Editor.Modified = false
  SetModified(false)
end Sub


' ------------------------------------------------------------------

Sub FileOpen(Sender)
  if CheckFileSave() then
    if OpenDialog.Execute then
      PerformFileOpen(OpenDialog.FileName)
      Editor.ReadOnly = (ofReadOnly & OpenDialog.Options)
    End If
  End If
End Sub

' ------------------------------------------------------------------

Sub FileNew(Sender)
  if  CheckFileSave() then
    SetFileName("Untitled")
    Editor.Lines.Text =""
    Editor.Modified = false
    SetModified(false)
  end if
End Sub

' ------------------------------------------------------------------

Sub FilePrint(Sender)
  if PrintDialog.Execute then
    Editor.Print(FFileName)
  End If
End Sub


' ------------------------------------------------------------------

Sub FileExit(Sender)
  MainForm.Close
End Sub


' ------------------------------------------------------------------

Sub EditUndo(Sender)
  if Editor.HandleAllocated then
   call Editor.Perform(EM_UNDO, 0, 0)
  end If

End Sub

' ------------------------------------------------------------------

Sub EditCut(Sender)

  Editor.CutToClipboard
End Sub

' ------------------------------------------------------------------

Sub EditCopy(Sender)
  Editor.CopyToClipboard
End Sub

' ------------------------------------------------------------------

Sub EditPaste(Sender)
  Editor.PasteFromClipboard
End Sub

' ------------------------------------------------------------------

Sub SelectFont(Sender)
  FontDialog1.Font.Assign(Editor.SelAttributes)
  if FontDialog1.Execute then  CurrText().Assign(FontDialog1.Font)
  Editor.SetFocus
End Sub

' ------------------------------------------------------------------

Sub FontNameChange(Sender)
  if not (FUpdating) then  CurrText().Name = FontName.Text
End Sub

' ------------------------------------------------------------------

Sub FontSizeExit(Sender)
  if not FUpdating then  CurrText().Size = StrToInt(FontSize.Text)
End Sub

' ------------------------------------------------------------------

Sub BoldButtonClick(Sender)

  if not FUpdating then
    if BoldButton.Down then
      CurrText().Style = CurrText().Style  or  mkset(fsBold)
    else
      CurrText().Style =  CurrText().Style and not mkset(fsBold)
    end if
  end if
End Sub

' ------------------------------------------------------------------

Sub ItalicButtonClick(Sender)
  if not FUpdating then
    if ItalicButton.Down then
       CurrText().Style = CurrText().Style or mkset(fsItalic)
    else
       CurrText().Style = CurrText().Style and not mkset(fsItalic)
    End If
  End If
End Sub

' ------------------------------------------------------------------

Sub UnderlineButtonClick(Sender)
  if not FUpdating then
    if (UnderlineButton.Down) then
       CurrText().Style = CurrText().Style or mkset(fsUnderline)
    else
       CurrText().Style = CurrText().Style and not mkset(fsUnderline)
    End If
  End If
End Sub

' ------------------------------------------------------------------

Sub AlignClick(Sender)
  if not FUpdating then  Editor.Paragraph.Alignment = Sender.Tag
End Sub

' ------------------------------------------------------------------

Sub BulletsButtonClick(Sender)
  if not FUpdating then
    if BulletsButton.Down then
      Editor.Paragraph.Numbering = nsBullet
    else
      Editor.Paragraph.Numbering = nsNone
    End If
  End IF
End Sub

' ------------------------------------------------------------------

Sub SelectionChange(Sender)
  FUpdating = true
  FirstInd.Left = (Editor.Paragraph.FirstIndent*RulerAdj) - 4 + GutterWid
  LeftInd.Left = ((Editor.Paragraph.LeftIndent+Editor.Paragraph.FirstIndent)*RulerAdj)-4+GutterWid
  RightInd.Left = Ruler.ClientWidth-6-((Editor.Paragraph.RightIndent+GutterWid)*RulerAdj)
  BoldButton.Down = inset(fsBold,Editor.SelAttributes.Style)
  ItalicButton.Down = inset(fsItalic, Editor.SelAttributes.Style)
  UnderlineButton.Down = inset(fsUnderline , Editor.SelAttributes.Style)
  BulletsButton.Down = (Editor.Paragraph.Numbering= nsBullet)
  FontSize.Text = Editor.SelAttributes.Size
  FontName.Text = Editor.SelAttributes.Name
  Select Case  Editor.Paragraph.Alignment
    case 0 LeftAlign.Down = true
    case 1 RightAlign.Down = true
    case 2 CenterAlign.Down = true
  End Select
  UpdateCursorPos()
  FUpdating = false
End Sub

' ------------------------------------------------------------------

Sub EditorChange(Sender)
  SetModified(Editor.Modified)
End Sub

' ------------------------------------------------------------------


Sub FormShow(Sender)
  FFileName = "Untitled"
  FUpdating = false
  RulerAdj = 4/3
  GutterWid = 6
  FDragOfs = 0
  FDragging = false
  OpenDialog.InitialDir = ExtractFilePath(ParamStr(0))
  SaveDialog.InitialDir = OpenDialog.InitialDir
  SetFileName("Untitled")
  GetFontNames(FontName.PopupWindow.Items)
  SetupRuler()
  SelectionChange(MainForm)
  UpdateCursorPos()
  Editor.SetFocus
End Sub

' ------------------------------------------------------------------

Sub HelpContents(Sender)
 call  Application.HelpCommand(HELP_CONTENTS, 0)
End Sub

' ------------------------------------------------------------------

Sub HelpSearch(Sender)
 call Application.HelpCommand(HELP_PARTIALKEY, 0)
End Sub

' ------------------------------------------------------------------

Sub HelpHowToUse(Sender)
 call Application.HelpCommand(HELP_HELPONHELP, 0)
End Sub

' ------------------------------------------------------------------

Sub HelpAbout(Sender)
 AboutBox.Showmodal
End Sub

' ------------------------------------------------------------------

Sub RulerResize(Sender)
  RulerLine.Width = Ruler.ClientWidth - (RulerLine.Left*2)
End Sub

' ------------------------------------------------------------------

Sub FormCloseQuery(Sender, CanClose)
  CheckFileSave()
End Sub

' ------------------------------------------------------------------

Sub RightIndMouseDown(Sender, Button, Shift, X, Y)
  FDragOfs = Sender.Width / 2
  Sender.Left = Sender.Left+X-FDragOfs
  FDragging = true
End Sub

' ------------------------------------------------------------------

Sub RightIndMouseMove(Sender, Shift, X, Y)
  if FDragging then  Sender.Left =  Sender.Left+X-FDragOfs
End Sub

' ------------------------------------------------------------------

Sub RightIndMouseUp(Sender, Button, Shift, X, Y)
  FDragging = false
  Editor.Paragraph.RightIndent = (Ruler.ClientWidth-RightInd.Left+FDragOfs-2) / RulerAdj-2*GutterWid
  SelectionChange(Sender)
End Sub

' ------------------------------------------------------------------

Sub LeftIndMouseUp(Sender, Button, Shift, X, Y)
  FDragging = false
  Editor.Paragraph.LeftIndent = (LeftInd.Left+FDragOfs-GutterWid) / RulerAdj - Editor.Paragraph.FirstIndent
  SelectionChange(Sender)
End Sub

' ------------------------------------------------------------------

Sub FirstIndMouseUp(Sender, Button, Shift, X, Y)
  FDragging = false
  Editor.Paragraph.FirstIndent = (FirstInd.Left+FDragOfs-GutterWid) / RulerAdj
  call LeftIndMouseUp(Sender, Button, Shift, X, Y)
End Sub

' ------------------------------------------------------------------

Sub FontSizeKeyPress(Sender, Key)
  if Key = chr(13) then
    call FontSizeExit(Sender)
  end if
End Sub