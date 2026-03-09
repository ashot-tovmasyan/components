'USEUNIT Db
'USEUNIT DBTables
'USEUNIT Menus
'USEUNIT DBGrids
'USEUNIT DBCtrls
'USEUNIT StdCtrls
'USEUNIT About
dim eKeyViol
dim eRequiredFieldMissing
dim eForeignKey
dim eDetailsExist

'-------------------------------------------------------------------
sub GridOrdersEnter(Sender)
  DBNavigator1.DataSource = OrdersSource
End Sub

'-------------------------------------------------------------------

sub GridCustomersEnter(Sender)
  DBNavigator1.DataSource = CustomerSource
End Sub

'-------------------------------------------------------------------

sub GridItemsEnter(Sender)
  DBNavigator1.DataSource = ItemsSource
End Sub

'-------------------------------------------------------------------

sub GridCustomersExit(Sender)
  Customer.CheckBrowseMode
End Sub

'-------------------------------------------------------------------

sub About1Click(Sender)
  FmAboutBox.ShowModal
End Sub

'-------------------------------------------------------------------

sub CustomerPostError(DataSet, E, Action)
'  if (E.InheritsFrom(EDBEngineError))
    if E.Errors(0).Errorcode = eKeyViol then
      call MessageDlg("Unable to post: Duplicate Customer ID.", mtWarning, mbOK, 0)
      Abort
    End If
End Sub

'-------------------------------------------------------------------

sub CustomerDeleteError(DataSet,E,Action)
'  if (E.InheritsFrom(EDBEngineError))
    if (E.Errors(0).Errorcode = eDetailsExist) then
       call MessageDlg("To delete this record, first delete related orders and items.",mtWarning, MkSet(mbOK), 0)
      Abort
    End If
End Sub

'-------------------------------------------------------------------

sub CustomerCustNoChange(Sender)
  Orders.DisableControls
  Items.DisableControls
End Sub

'-------------------------------------------------------------------

sub CustomerAfterPost(DataSet)
  Orders.Refresh
  Items.Refresh
  Orders.EnableControls
  Items.EnableControls
End Sub

'-------------------------------------------------------------------

sub ItemsPostError(DataSet,E,Action)
' if (E.InheritsFrom(EDBEngineError))
  if (E.Errors(0).Errorcode = eForeignKey ) then
   call MessageDlg("Part number is invalid", mtWarning,MkSet(mbOK),0)
    Abort
  End If
End Sub

'-------------------------------------------------------------------

sub OrdersPostError(DataSet,E,Action)
'  if (E.InheritsFrom(EDBEngineError))
    iDBIError = E.Errors(0).Errorcode
    select case iDBIError
      case eRequiredFieldMissing:
         call MessageDlg("Please provide an Employee ID", mtWarning, MkSet(mbOK), 0)
         Abort
      case eKeyViol:
         call MessageDlg("Unable to post. Duplicate Order Number", mtWarning,MkSet(mbOK), 0)
         Abort
    End Select
End Sub

'-------------------------------------------------------------------

sub OrdersDeleteError(DataSet,E, Action)
 ' if (E.InheritsFrom(EDBEngineError))
    if (E.Errors(0).Errorcode = eDetailsExist) then
      if ( MessageDlg("Delete this order and related items?", mtConfirmation,MkSet(mbYes, mbNo), 0) = mrYes ) then
       while Items.RecordCount > 0
          Items.Delete
       wend
        Action = daRetry
      else
        Abort
      End If
    End IF
End Sub

'-------------------------------------------------------------------

Sub FormCreate(Sender)
  eKeyViol = 9729
  eRequiredFieldMissing = 9732
  eForeignKey = 9733
  eDetailsExist = 9734
End Sub