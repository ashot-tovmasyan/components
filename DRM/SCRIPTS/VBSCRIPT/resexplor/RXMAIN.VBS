'USEUNIT dctsrc
'USEUNIT Dialogs
'USEUNIT Menus
'USEUNIT DcTree
'USEUNIT ExtCtrls
'USEUNIT ComCtrls
'USEUNIT dcstdctl
'USEUNIT About


sub miFileOpenClick(Sender)
  if FileOpenDialog.Execute then
    Source.FileName = FileOpenDialog.FileName
    StatusBar.Panels(0).Text = FileOpenDialog.FileName
  End If
End Sub

' ------------------------------------------------------------------

sub miViewLargeIconsClick(Sender)
  DcListView1.ViewStyle = Sender.Tag
  Sender.Checked = true
End Sub

' ------------------------------------------------------------------

sub miViewStatusBarClick(Sender)
 StatusBar.Visible = not StatusBar.Visible
 miViewStatusBar.Checked = StatusBar.Visible
End Sub

' ------------------------------------------------------------------

sub miFileExitClick(Sender)
  Close
End Sub

' ------------------------------------------------------------------


sub miHelpAboutClick(Sender)
  Formabout.ShowModal
End Sub

' ------------------------------------------------------------------