{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit datamod;

interface
{$I dc.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, dcInfoDbRel, dcInfoRel
  {$IFDEF D4}, ImgList{$ENDIF};

type
  TDataModule2 = class(TDataModule)
    Database: TDatabase;
    Cust: TTable;
    ItemsByOrd: TTable;
    CustSource: TDataSource;
    OrdersSource: TDataSource;
    ItemsSource: TDataSource;
    OrdByCust: TTable;
    MDReliSet: TDCDBRelInfoSet;
    Parts: TTable;
    PartsSource: TDataSource;
    ItemsByOrdPartDesc: TStringField;
    ItemsByOrdPartNo: TFloatField;
    ItemsByOrdOrderNo: TFloatField;
    DirRelISet: TDCDBRelInfoSet;
    BigRelISet: TDCDBRelInfoSet;
    ImageList1: TImageList;
    DataSource1: TDataSource;
    BigTable: TTable;
    Table1id: TIntegerField;
    Table1parent: TIntegerField;
    Table1name: TStringField;
    DirTable: TTable;
    DirTableDirName: TStringField;
    DirTableDirID: TIntegerField;
    DirTableParentID: TIntegerField;
    DirTableImageIndex: TSmallintField;
    DirTableSelectedIndex: TSmallintField;
    DirTableStateIndex: TSmallintField;
    CustCustNo: TFloatField;
    CustCompany: TStringField;
    CustCountry: TStringField;
    OrdByCustOrderNo: TFloatField;
    OrdByCustCustNo: TFloatField;
    OrdByCustSaleDate: TDateTimeField;
    BigTableImageIndex: TIntegerField;
    OrdByCustEmpNo: TIntegerField;
    NextCust: TTable;
    NextCustNewCust: TFloatField;
    NextOrd: TTable;
    NextOrdNewKey: TFloatField;
    LastItemQuery: TQuery;
    ItemsByOrdItemNo: TFloatField;
    procedure OrdByCustNewRecord(DataSet: TDataSet);
    procedure CustBeforePost(DataSet: TDataSet);
    procedure ItemsByOrdBeforePost(DataSet: TDataSet);
    procedure DataModule2Create(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{$R *.DFM}

procedure TDataModule2.OrdByCustNewRecord(DataSet: TDataSet);
begin
  with NextOrd do
  begin
    Open;
    try
      Edit;
      OrdByCustOrderNo.Value := NextOrdNewKey.Value;
      NextOrdNewKey.Value := NextOrdNewKey.Value + 1;
      Post;
    finally
      Close;
    end;
  end;

  OrdByCustEmpNo.Value := 1;
end;

procedure TDataModule2.CustBeforePost(DataSet: TDataSet);
begin
  if Cust.State = dsInsert then
    with NextCust do
    begin
      Open;
      try
        Edit;
        CustCustNo.Value := NextCustNewCust.Value;
        NextCustNewCust.Value := NextCustNewCust.Value + 1;
        Post;
      finally
        Close;
      end;
    end;
end;

procedure TDataModule2.ItemsByOrdBeforePost(DataSet: TDataSet);
Var
 FItemNo:Integer;
begin
  if ItemsByOrdItemNo.IsNull then
  begin
    LastItemQuery.Close;
    LastItemQuery.Open;
    { SQL servers return Null for some aggregates if no items are present }
    with LastItemQuery.Fields[0] do
      if IsNull then FItemNo := 1
      else FItemNo := AsInteger + 1;

    ItemsByOrdItemNo.Value := FItemNo;
  end;
end;

procedure TDataModule2.DataModule2Create(Sender: TObject);
begin
  LastItemQuery.SQL.Text:='select max(ItemNo)  from Items where OrderNo = :OrderNo';
  LastItemQuery.DataSource:=OrdersSource;
end;

end.

