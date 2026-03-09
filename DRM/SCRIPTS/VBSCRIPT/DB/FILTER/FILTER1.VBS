'USEUNIT StdCtrls
'USEUNIT Custview

'-------------------------------------------------------------------

sub AddFieldName(Sender)
  if (Memo1.Text <> "") then  Memo1.Text = Memo1.Text + " "
  Memo1.Text = Memo1.Text + ListBox1.Items(ListBox1.ItemIndex)
End Sub

'-------------------------------------------------------------------

sub ListBox2DblClick(Sender)
  if (Memo1.Text <> "") then Memo1.Text = Memo1.Text + " "+ ListBox2.Items(ListBox2.ItemIndex)
End Sub

'-------------------------------------------------------------------

sub ApplyFilter(Sender)
  if (ComboBox1.Text <> "") then
    fmCustView.CustomerSource.Dataset.Filter = ComboBox1.Text
    fmCustView.CustomerSource.Dataset.Filtered = true
    fmCustView.Caption = "Customers - Filtered"
  else
    fmCustView.CustomerSource.Dataset.Filter = ""
    fmCustView.CustomerSource.Dataset.Filtered = false
    fmCustView.Caption = "Customers - Unfiltered"
  End If
End Sub

'-------------------------------------------------------------------

sub Memo1Change(Sender)
  ComboBox1.Text = Memo1.Lines(0)
  for i = 1 to  i<= Memo1.Lines.Count - 1
    ComboBox1.Text = ComboBox1.Text + " " + Memo1.Lines(i)
  next
End Sub

'-------------------------------------------------------------------

sub cbCaseSensitiveClick(Sender)
  if cbCaseSensitive.checked then
    fmCustView.CustomerSource.Dataset.FilterOptions = fmCustView.CustomerSource.Dataset.FilterOptions and not mkset(foCaseInSensitive)
  else
    fmCustView.CustomerSource.Dataset.FilterOptions = fmCustView.CustomerSource.Dataset.FilterOptions or mkset(foCaseInSensitive)
  end If
End Sub

'-------------------------------------------------------------------

sub cbNoPartialCompareClick(Sender)
  if cbCaseSensitive.checked then
    fmCustView.CustomerSource.Dataset.FilterOptions = fmCustView.CustomerSource.Dataset.FilterOptions and not mkset(foNoPartialCompare)
  else
    fmCustView.CustomerSource.Dataset.FilterOptions = fmCustView.CustomerSource.Dataset.FilterOptions or mkset(foNoPartialCompare)
  end If
End Sub

'-------------------------------------------------------------------

sub SBtnClearClick(Sender)
  Memo1.Lines = ""
  st = ComboBox1.Text
  ComboBox1.Text = ""
  if ComboBox1.Items.IndexOf(st) = -1 then   ComboBox1.Items.Add(st)
End Sub

'-------------------------------------------------------------------

sub ComboBox1Change(Sender)
  Memo1.Text = ""
  Memo1.Lines.Add(ComboBox1.Text)
End Sub

'-------------------------------------------------------------------

sub SBtnCloseClick(Sender)
  Close
End Sub

'-------------------------------------------------------------------

sub FormShow(Sender)
  for i = 0  to fmCustView.CustomerSource.Dataset.FieldCount - 1
    ListBox1.Items.Add(fmCustView.CustomerSource.Dataset.Fields(i).FieldName)
  next
  ComboBox1.Items.Add("LastInvoiceDate >= ' " + DateToStr(EncodeDate(1994, 9, 30))+"'")
  ComboBox1.Items.Add("Country = 'US' and LastInvoiceDate > '" + DateToStr(EncodeDate(1994, 6, 30)) + "'")
End Sub
