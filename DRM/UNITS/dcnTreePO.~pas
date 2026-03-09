{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit dcnTreePO;

interface
{$I dc.inc}
uses
  Windows, SysUtils, Classes, Controls, Forms,
  StdCtrls, Consts, dcConsts, ExtCtrls, Dialogs;

type
  TfrmTreePrintSetup = class(TForm)
    gbxOptions: TGroupBox;
    chkHeader: TCheckBox;
    PrinterSetup: TPrinterSetupDialog;
    chkShowPrintProgress: TCheckBox;
    lblFileName: TLabel;
    chkFooter: TCheckBox;
    SetupBut: TButton;
    OkBut: TButton;
    CancelBut: TButton;
    HelpBut: TButton;
    procedure SetupButClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  frmTreePrintSetup: TfrmTreePrintSetup;

implementation

{$R *.DFM}

procedure TfrmTreePrintSetup.SetupButClick(Sender: TObject);
begin
  PrinterSetup.Execute;
end;

procedure TfrmTreePrintSetup.FormCreate(Sender: TObject);
begin
  Caption:=SPrintFormCaption;

  chkHeader.Caption:=SHeaderPage;
  chkFooter.Caption:=SFooterPage;
  chkShowPrintProgress.Caption:=SShowPrintProgress;

  //Buttons
  SetupBut.Caption:=SSetupButton;
  {if not boolShowHelpButton then
    SetupBut.Left := OkBut.Left;
  UpdateStandardButtons(OkBut, CancelBut, HelpBut);}
end;

end.
