{*****************************************************************************
  Copyright: Copyright© by Steve Forbes, Yu Wei 2001-2002
  Unit Name:    KWizardAboutInfo
  Author:       Steve Forbes
  Date:         January 25, 2002
  Last Updated: January 25, 2002
  Purpose:      a wizard about form to display copyright,
                author, version information.

  History:
  ---------------------------------------------------------------------------
  Date(mm/dd/yy)   Comments
  ---------------------------------------------------------------------------
  01/25/2002       Initial create
******************************************************************************}

unit KWizardAboutInfo;

interface

{$I KOMPONENTS.INC}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,
  {$IFDEF DELPHI6}
  dcdsgnstuff;
//  DesignIntf, DesignEditors;
  {$ELSE}
//  DsgnIntf;
  {$ENDIF}

const
  KWIZARD_VERSIONSTRING = 'Version 1.70';

type
  TKWizardAboutDialogProperty = class(TPropertyEditor)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
  end;

  TKWizardAboutDialog = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lblVersion: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    lblCopyRight: TLabel;
    Label3: TLabel;
    btnOK: TButton;
    Panel1: TPanel;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    protected
      procedure CreateParams(var Params: TCreateParams); override;
    end;

implementation

{$R *.DFM}

procedure TKWizardAboutDialogProperty.Edit;
var
  Dialog: TKWizardAboutDialog;
begin
  Dialog := TKWizardAboutDialog.Create(nil);
  try
    Dialog.ShowModal;
  finally
    Dialog.Free;
  end;
end;

function TKWizardAboutDialogProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly];
end;

function TKWizardAboutDialogProperty.GetValue: string;
begin
  Result := KWIZARD_VERSIONSTRING;
end;

{ TKWizardAboutDialog }

procedure TKWizardAboutDialog.btnOKClick(Sender: TObject);
begin
  Close;
end;

procedure TKWizardAboutDialog.FormShow(Sender: TObject);
begin
  lblVersion.Caption := KWIZARD_VERSIONSTRING;
  lblCopyRight.Caption := 'Copyright© yuwei, 2001 - ' + FormatDateTime('yyyy', Now);
end;

procedure TKWizardAboutDialog.CreateParams(var Params: TCreateParams);
begin
	inherited CreateParams(Params);
  with Params do
  begin
    Style := (Style or WS_POPUP) and (not WS_DLGFRAME);
  end;
end;

procedure TKWizardAboutDialog.Panel1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, SC_MOVE + 2, 0);
end;

end.
