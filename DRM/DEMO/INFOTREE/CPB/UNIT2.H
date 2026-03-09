//---------------------------------------------------------------------------
#ifndef Unit2H
#define Unit2H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "dcInfoDBRel.hpp"
#include "dcInfoRel.hpp"
#include <Db.hpp>
#include <DBTables.hpp>
#include <ImgList.hpp>
//---------------------------------------------------------------------------
class TDataModule2 : public TDataModule
{
__published:	// IDE-managed Components
    TDatabase *Database;
    TTable *Cust;
    TFloatField *CustCustNo;
    TStringField *CustCompany;
    TStringField *CustCountry;
    TTable *ItemsByOrd;
    TStringField *ItemsByOrdPartDesc;
    TFloatField *ItemsByOrdPartNo;
    TFloatField *ItemsByOrdOrderNo;
    TFloatField *ItemsByOrdItemNo;
    TDataSource *CustSource;
    TDataSource *OrdersSource;
    TDataSource *ItemsSource;
    TTable *OrdByCust;
    TFloatField *OrdByCustOrderNo;
    TFloatField *OrdByCustCustNo;
    TDateTimeField *OrdByCustSaleDate;
    TIntegerField *OrdByCustEmpNo;
    TDCDBRelInfoSet *MDReliSet;
    TTable *Parts;
    TDataSource *PartsSource;
    TDCDBRelInfoSet *DirRelISet;
    TDCDBRelInfoSet *BigRelISet;
    TImageList *ImageList1;
    TDataSource *DataSource1;
    TTable *BigTable;
    TIntegerField *Table1id;
    TIntegerField *Table1parent;
    TStringField *Table1name;
    TIntegerField *BigTableImageIndex;
    TTable *DirTable;
    TStringField *DirTableDirName;
    TIntegerField *DirTableDirID;
    TIntegerField *DirTableParentID;
    TSmallintField *DirTableImageIndex;
    TSmallintField *DirTableSelectedIndex;
    TSmallintField *DirTableStateIndex;
    TTable *NextCust;
    TFloatField *NextCustNewCust;
    TTable *NextOrd;
    TFloatField *NextOrdNewKey;
    TQuery *LastItemQuery;
    void __fastcall OrdByCustNewRecord(TDataSet *DataSet);
    void __fastcall CustBeforePost(TDataSet *DataSet);
    void __fastcall ItemsByOrdBeforePost(TDataSet *DataSet);
    void __fastcall DataModule2Create(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TDataModule2(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDataModule2 *DataModule2;
//---------------------------------------------------------------------------
#endif
 