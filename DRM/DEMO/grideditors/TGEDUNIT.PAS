{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit TGEdUnit;

interface
{$I dc.inc}
uses
  Windows, ShellAPI, Forms, dcInfoRel, dcInfoDBRel, Db, DBTables, Controls,
  StdCtrls, ExtCtrls, Classes, dcntree, dcTreeGrid, dcitgrid
  {$IFDEF D4}, ImgList{$ENDIF};

type
  TForm1 = class(TForm)
    tblEvents: TTable;
    tblVenues: TTable;
    DCDBRelInfoSet1: TDCDBRelInfoSet;
    DCInfoGrid1: TDCInfoGrid;
    tblEventsEventNo: TAutoIncField;
    tblEventsVenueNo: TIntegerField;
    tblEventsEvent_Name: TStringField;
    tblEventsEvent_Date: TDateField;
    tblEventsEvent_Time: TTimeField;
    tblEventsEvent_Description: TMemoField;
    tblEventsTicket_price: TCurrencyField;
    tblVenuesVenueNo: TAutoIncField;
    tblVenuesVenue: TStringField;
    tblVenuesCapacity: TIntegerField;
    tblVenuesVenue_Map: TGraphicField;
    tblVenuesRemarks: TMemoField;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    tblEventsIs_Sponsored: TBooleanField;
    tblEventsSponsor_Name: TStringField;
    tblEventsVenue: TStringField;
    tblEventsGlyphIndex: TSmallintField;
    ImageList1: TImageList;
    procedure Label5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Label5Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar(Label5.Caption), nil, nil, SW_SHOW);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  tblEvents.Active := True;
  tblVenues.Active := True;
end;

end.
