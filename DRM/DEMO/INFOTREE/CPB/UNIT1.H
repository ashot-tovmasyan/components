//---------------------------------------------------------------------------
#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "dcDTree.hpp"
#include "dcinfotree.hpp"
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <DBCtrls.hpp>
#include <DBGrids.hpp>
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include "dcntree.hpp"
//#include <signal.h>

//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
    TPageControl *PageControl1;
    TTabSheet *TabSheet2;
    TLabel *Label3;
    TLabel *Label4;
    TLabel *Label5;
    TLabel *Label6;
    TLabel *Label7;
    TDBGrid *DBGrid2;
    TDBGrid *DBGrid3;
    TDBGrid *DBGrid4;
    TDCInfoListView *DCInfoListView2;
    TDCInfoTree *DCInfoTree2;
    TTabSheet *TabSheet1;
    TPanel *Panel1;
    TDBGrid *DBGrid1;
    TPanel *Panel3;
    TButton *DirTableBut;
    TButton *BigTableBut;
    TDBNavigator *DBNavigator1;
    TPanel *Panel2;
    TLabel *Label1;
    TLabel *Label2;
    TPanel *Panel4;
    TSplitter *Splitter1;
    TDCInfoTree *DCInfoTree1;
    TDCInfoListView *DCInfoListView1;
    TGroupBox *GroupBox1;
    TLabel *Url;
    TLabel *Label8;
    TCheckBox *OnlyFoldersCheck;
    TCheckBox *SmartLoadCheck;
    TCheckBox *MultiColumnCheck;
    TCheckBox *MultiSelectCheck;
    TCheckBox *OnlySiblings;
    TPanel *Panel5;
    TLabel *Desc;
    TColorDialog *ColorDialog1;

    void __fastcall FormCreate(TObject *Sender);
    void __fastcall BigTableButClick(TObject *Sender);
    void __fastcall PageControl1Change(TObject *Sender);
    void __fastcall FormDestroy(TObject *Sender);
    void __fastcall DirTableButClick(TObject *Sender);
    void __fastcall OnlyFoldersCheckClick(TObject *Sender);
    void __fastcall SmartLoadCheckClick(TObject *Sender);
    void __fastcall MultiColumnCheckClick(TObject *Sender);
    void __fastcall MultiSelectCheckClick(TObject *Sender);

    void __fastcall DCInfoTree2GetNodeParams(TObject *Sender,
          TInfoNode *Node, const IUnknown *InfoSet);
    void __fastcall OnlySiblingsClick(TObject *Sender);
    void __fastcall UrlClick(TObject *Sender);
    void __fastcall DCInfoTree1DragOver(TObject *Sender, TObject *Source,
          int X, int Y, TDragState State, bool &Accept);
    void __fastcall DCInfoTree1DragDrop(TObject *Sender, TObject *Source,
          int X, int Y);
private:	// User declarations
    BOOL firsttime;
    void __fastcall OpenDirTable();
    void __fastcall SetInfoSet(TComponent *InfoSet);

    TDCInfoTree *ActiveTree();
    TDCInfoListView  *ActiveListView();
public:		// User declarations
    __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
