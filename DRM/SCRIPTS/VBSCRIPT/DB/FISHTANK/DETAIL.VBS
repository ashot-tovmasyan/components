'USEUNIT Buttons
'USEUNIT ExtCtrls
'USEUNIT Main

'-------------------------------------------------------------------

sub OpenButClick(Sender)
dim Dialog
    Dialog = TOpenDialog.Create(NULL)
    Dialog.Filename = "*.bmp"
    if Dialog.Execute then
      MainForm.Table1.Edit
      Image1.Picture.LoadFromFile(Dialog.Filename)
      MainForm.dbimage1.Picture.Assign(Image1.Picture)
      MainForm.Table1.Post
      showmessage("Image Loaded")
    End If
    Dialog.Free
End Sub

'-------------------------------------------------------------------

sub SaveButClick(Sender)
dim Dialog
    Dialog= TSaveDialog.Create(NULL)
    Dialog.Filename = "*.bmp"
    if Dialog.Execute then
      Image1.Picture.SaveToFile(Dialog.Filename)
      showmessage("Image Saved")
    End If
    Dialog.Free
End Sub

'-------------------------------------------------------------------

sub CloseButClick(Sender)
  Close
End Sub
