'USEUNIT dcstdctl
'USEUNIT Db
'USEUNIT DBTables
'USEUNIT Buttons
'USEUNIT DBCtrls
'USEUNIT DBGrids
'USEUNIT ExtCtrls
'USEUNIT Detail
sub AssignImages
  DetailForm.Image1.Picture.Assign(Dbimage1.Picture)
end sub

sub ViewButClick(Sender)
 DetailForm.Visible = not (DetailForm.Visible)
 call AssignImages
End Sub

sub CloseButClick(Sender)
  close
End Sub

Sub DataSource1DataChange(Sender, Field)
 call AssignImages
End Sub