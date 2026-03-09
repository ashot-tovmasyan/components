//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include "Unit2.h"
#include <dialogs.hpp>
#include <ShellApi.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "dcDTree"
#pragma link "dcinfotree"
#pragma link "dcntree"
#pragma resource "*.dfm"
#pragma resource "*.dcr"

#define BigTableRecordCount 10000

TForm1 *Form1;

const char TreeDBName[] = "tree.db";

const char Descriptions[][300] =

  {
   {"This page illustrates how InfoTree can be used to work with master/detail tables." 
   "\n\nEvent handler is used to customize each node - all companies" 
   "\n\nfrom the US are displayed with the blue color."},

   {"Here Dream InfoTree is used to display data from the self-referenced table." 
   "\n\nDream Info List View situated to the"
   "right of the InfoTree shows the details of" 
   "the currently selected in tree-view record."
   "\n\nDrag and drop can be easily implemented with Dream InfoTree!"},

   {"Use Shift + Arrows or Ctrl  + Mouse buttons to select items in tree."
   "Or select them with mouse like you do it in ListView."
   "\n\nDon't miss radio buttons and check boxes, "
   "different font styles for tree nodes"}
  };


//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall  FillTable(TTable *Table)
{
  int i;
  int parent;
  TField *DirIDField;
  TField *ParentIDField;
  TField *DirNameField;
  TField *ImageIndexField;
  TIndexOptions Opt;
  Opt.Clear();

  try
     {Table->CreateTable();
      #if __BCPLUSPLUS__>0x0530
      Table->AddIndex("DirID", "DirID", TIndexOptions() << ixUnique << ixUnique,"");
      #else
      Table->AddIndex("DirID", "DirID", TIndexOptions() << ixUnique << ixUnique);
      #endif
      #if __BCPLUSPLUS__>0x0530
      Table->AddIndex("ParentID", "ParentID", Opt,"");
      #else
      Table->AddIndex("ParentID", "ParentID", Opt);
      #endif
      Table->Open();

      Screen->Cursor = crHourGlass;
      Table->DisableControls();
      DirIDField = Table->FieldByName("DirID");
      ParentIDField = Table->FieldByName("ParentID");
      DirNameField = Table->FieldByName("DirName");
      ImageIndexField = Table->FieldByName("ImageIndex");

      for (i=1; i<BigTableRecordCount - 1; i++)
        {
          Table->Append();
          parent = i / 10;
          if (!parent)
            parent--;
          DirIDField->AsInteger = i;
          ParentIDField->AsInteger = parent;
          ImageIndexField->AsInteger = ((i < BigTableRecordCount) / 10);
          DirNameField->AsString = "Item No " + IntToStr(i) + " Parent No " + IntToStr(parent);
          Table->Post();
        };

      Table->IndexFieldNames = "ParentID";
     } 
     __finally
     {Table->EnableControls();
      Screen->Cursor = crDefault;
     };
}

//--------------------------------------------------------------------------

void __fastcall SetTable(TTable *Table)
{
  if (DataModule2->DataSource1->DataSet != Table)
      DataModule2->DataSource1->DataSet != Table;
}

//--------------------------------------------------------------------------

void __fastcall TForm1::SetInfoSet(TComponent *InfoSet)
{
  DCInfoTree1->InfoSet = InfoSet;
}
//--------------------------------------------------------------------------

TDCInfoTree *TForm1::ActiveTree()
{
  switch (PageControl1->ActivePage->TabIndex)
    {
    case 0 : return DCInfoTree2;
    case 1 : return DCInfoTree1;
    default: return NULL;
    }
}

//--------------------------------------------------------------------------

TDCInfoListView *TForm1::ActiveListView()
{
  if (PageControl1->ActivePage == TabSheet1) 
    return DCInfoListView1;
  else
    return DCInfoListView2;
}

//--------------------------------------------------------------------------

void __fastcall TForm1::OpenDirTable()
{ AnsiString AppFolder;
  int AppL;

  if (!DataModule2->DirTable->Active) 
    {
      AppFolder = ExtractFilePath(ParamStr(0));
      AppL = AppFolder.Length();
      if ((AppL > 0) && (AppFolder[AppL] != '\\')) 
        AppFolder += '\\';
            
        if (FileExists(AppFolder + TreeDBName))
          DataModule2->DirTable->DatabaseName = AppFolder;
        else if (FileExists(AppFolder + "..\\" + TreeDBName)) 
          DataModule2->DirTable->DatabaseName += "..\\";
        else
          throw Exception("Can't find Database");

        DataModule2->BigTable->DatabaseName = DataModule2->DirTable->DatabaseName;
      DataModule2->DirTable->Open();
    }

  SetTable(DataModule2->DirTable);
}

//--------------------------------------------------------------------------

void __fastcall TForm1::FormCreate(TObject *Sender)
{
  firsttime = TRUE;
  OpenDirTable();
  DataModule2->ImageList1->ResourceLoad(rtBitmap,"IMAGES",clSilver);

  DataModule2->DirTable->Open();
  DataModule2->Cust->Open();
  DataModule2->OrdByCust->Open();
  DataModule2->ItemsByOrd->Open();
  DataModule2->Parts->Open();

  PageControl1Change(NULL);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::BigTableButClick(TObject *Sender)
{
  if (firsttime) 
    {
      if (MessageDlg("Create table with " + IntToStr(BigTableRecordCount) + " records and load it in TreeView?",mtConfirmation,TMsgDlgButtons() << mbYes << mbNo,0) != 6 )
        return;

      FillTable(DataModule2->BigTable);

      firsttime = FALSE;
    }

  SetInfoSet(DataModule2->BigRelISet);
  SetTable(DataModule2->BigTable);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::PageControl1Change(TObject *Sender)
{

  TDCInfoTree *Tree;
  TInfoTreeOptions TreeOptions;
  TInfoListOptions ListOptions;
  TDCInfoListView *LView;
  BOOL InfoOpt;

  Tree = ActiveTree();
  LView = ActiveListView();

  InfoOpt = True;

  if (InfoOpt)
    {
      TreeOptions = ((TDCInfoTree*) (Tree))->Options;
      ListOptions = LView->Options;

      OnlyFoldersCheck->Checked = TreeOptions.Contains(itoOnlyFolders);
      SmartLoadCheck->Checked = TreeOptions.Contains(itoSmartLoad);
      MultiColumnCheck->Checked = vsReport;
      LView->ViewStyle = vsReport;
    }

  MultiSelectCheck->Checked = Tree->MultiSelect;
  OnlySiblings->Checked = Tree->SelectOnlySiblings;
  Desc->Caption = Descriptions[PageControl1->ActivePage->PageIndex];

  OnlyFoldersCheck->Enabled = InfoOpt;
  SmartLoadCheck->Enabled = InfoOpt;
  MultiColumnCheck->Enabled = InfoOpt;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormDestroy(TObject *Sender)
{
    DataModule2->DirTable->Close();
    DataModule2->Cust->Close();
    DataModule2->OrdByCust->Close();
    DataModule2->ItemsByOrd->Close();
    DataModule2->Parts->Close();

    if (!firsttime) 
    {
        DataModule2->BigTable->Close();
        DataModule2->BigTable->DeleteTable();
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::DirTableButClick(TObject *Sender)
{
  OpenDirTable();
  SetInfoSet(DataModule2->DirRelISet);    
}
//---------------------------------------------------------------------------

void __fastcall SetOption(TDCInfoTree* InfoTree, TInfoTreeOption Option, BOOL IsSet)
{
  TInfoTreeOptions NewOptions;

  DataModule2->OrdByCust->DisableControls();
  DataModule2->ItemsByOrd->DisableControls();

  try
    { NewOptions = InfoTree->Options;

        if (IsSet)
          NewOptions << Option;
        else
          NewOptions >> Option;

        InfoTree->Options = NewOptions;
    }
  __finally
    {
      DataModule2->OrdByCust->EnableControls();
      DataModule2->ItemsByOrd->EnableControls();
    }  
}

void __fastcall SetListOption(TDCInfoListView *LView, TInfoListOption Option, BOOL IsSet)
{
  TInfoListOptions NewOptions;

  NewOptions = LView->Options;

  if (IsSet) 
    NewOptions << Option;
  else
    NewOptions >> Option;
  LView->Options = NewOptions;
}

//---------------------------------------------------------------------------

void __fastcall TForm1::OnlyFoldersCheckClick(TObject *Sender)
{
  SetOption((TDCInfoTree*) (ActiveTree()), itoOnlyFolders, OnlyFoldersCheck->Checked);
}

//---------------------------------------------------------------------------

void __fastcall TForm1::SmartLoadCheckClick(TObject *Sender)
{
  SetOption((TDCInfoTree*) (ActiveTree()), itoSmartLoad, SmartLoadCheck->Checked);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::MultiColumnCheckClick(TObject *Sender)
{ TViewStyle VStyles[2] = {{vsList}, {vsReport}};

  ActiveListView()->ViewStyle = VStyles[MultiColumnCheck->Checked];
}
//---------------------------------------------------------------------------

void __fastcall TForm1::MultiSelectCheckClick(TObject *Sender)
{
      ActiveListView()->MultiSelect =  MultiSelectCheck->Checked;
      ActiveTree()->MultiSelect = MultiSelectCheck->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::DCInfoTree2GetNodeParams(TObject *Sender,
      TInfoNode *Node, const IUnknown *InfoSet)
{
  TDataSet *DataSet;

  DataSet = InfoSetToDataSet((IUnknown*) (InfoSet));

  Node->ImageIndex = Node->Level + 3;
  Node->SelectedIndex = Node->Level + 3;

  if ((DataSet == DataModule2->Cust) && (DataModule2->CustCountry->AsString == "US"))
    {
      Node->FontStyle << fsBold;
      Node->FontColor = clBlue;
    }
  else
    {
      Node->FontStyle.Clear();
      Node->FontColor = clBlack;
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::OnlySiblingsClick(TObject *Sender)
{
  ActiveTree()->SelectOnlySiblings = OnlySiblings->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::UrlClick(TObject *Sender)
{ char a[50] = "dfldsfhkfh";
  StrPCopy(a, Url->Caption);
  ShellExecute(Application->Handle, NULL, a, NULL, NULL, SW_SHOW);    
}
//---------------------------------------------------------------------------

void __fastcall TForm1::DCInfoTree1DragOver(TObject *Sender,
      TObject *Source, int X, int Y, TDragState State, bool &Accept)
{
  Accept = (Sender == Source);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::DCInfoTree1DragDrop(TObject *Sender,
      TObject *Source, int X, int Y)
{
  TDCTreeNode *TargetNode;
  int id;

  TargetNode = DCInfoTree1->GetNodeAt(X, Y);
  if (TargetNode == NULL) 
    return;
  DCInfoTree1->SetToNode(TargetNode);
  id = GetNodeFieldValue(TargetNode,"DirID");
  DCInfoTree1->SetToNode(DCInfoTree1->Selected);
  DataModule2->DataSource1->DataSet->Edit();
  DataModule2->DataSource1->DataSet->FieldByName("ParentID")->AsInteger = id;
  DataModule2->DataSource1->DataSet->Post();
}
//---------------------------------------------------------------------------

