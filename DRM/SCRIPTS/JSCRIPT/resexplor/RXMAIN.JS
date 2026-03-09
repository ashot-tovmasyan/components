//USEUNIT dctsrc
//USEUNIT Dialogs
//USEUNIT Menus
//USEUNIT DcTree
//USEUNIT ExtCtrls
//USEUNIT ComCtrls
//USEUNIT dcstdctl
//USEUNIT About

function miFileOpenClick(Sender)
{
  if (FileOpenDialog.Execute)
  {
    Source.FileName = FileOpenDialog.FileName ;
    StatusBar.Panels(0).Text = FileOpenDialog.FileName ;
 }
}

// ------------------------------------------------------------------

function miViewLargeIconsClick(Sender)
{
  DcListView1.ViewStyle = Sender.Tag;
  Sender.Checked = true;
}

// ------------------------------------------------------------------

function miViewStatusBarClick(Sender)
{
 StatusBar.Visible = !StatusBar.Visible;
 miViewStatusBar.Checked = StatusBar.Visible;
}

// ------------------------------------------------------------------

function miFileExitClick(Sender)
{
  close;
}

// ------------------------------------------------------------------


function miHelpAboutClick(Sender)
{
  Formabout.ShowModal;
}

// ------------------------------------------------------------------