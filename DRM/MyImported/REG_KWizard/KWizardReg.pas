{*****************************************************************************
  Copyright: Copyright© by yuwei, 2002
  Unit Name: KWizardReg
  Author:    yuwei
  Email:     william_yuwei@yahoo.com
  Date:      January 24, 2002
  Time:      21:07:22
  Purpose:   K Wizard Component Editor

  History:
  ---------------------------------------------------------------------------
  Date(mm/dd/yy)   Comments
  ---------------------------------------------------------------------------
  01/24/2002       First Create
  01/25/2002       TKWizardAboutDialogProperty, Added by <Steve Forbes>
******************************************************************************}

unit KWizardReg;

interface

{$I KOMPONENTS.INC}

uses KWizard, KWizardAboutInfo, KWizardEditor;

procedure Register;

implementation

{$R KWizard.dcr}

uses Classes,
  dcdsgnstuff;
  {$IFDEF DELPHI6}
//  DesignIntf, DesignEditors;
  {$ELSE}
//  DsgnIntf;
  {$ENDIF}

procedure Register;
begin
  RegisterComponents('K Wizard', [TKWizard]);
  RegisterClasses([TKWizardCustomPage, TKWizardWelcomePage, TKWizardInteriorPage]);
  RegisterComponentEditor(TKWizard, TKWizardComponentEditor);
  RegisterComponentEditor(TKWizardCustomPage, TKWizardComponentEditor);
  RegisterComponentEditor(TKWizardWelcomePage, TKWizardComponentEditor);
  RegisterComponentEditor(TKWizardInteriorPage, TKWizardComponentEditor);
  RegisterPropertyEditor(TypeInfo(TKWizardCustomPage), TKWizard, 'ActivePage',
    TKWizardActivePageProperty);
  RegisterPropertyEditor(TypeInfo(TKWizardWelcomePage), TKWizard, 'ActivePage',
    TKWizardActivePageProperty);
  RegisterPropertyEditor(TypeInfo(TKWizardInteriorPage), TKWizard, 'ActivePage',
    TKWizardActivePageProperty);
  // Added By Steve Forbes
  RegisterPropertyEditor(TypeInfo(TKWizardAboutInfo), nil, 'About',
    TKWizardAboutDialogProperty);
  // KWizard Page List Editor
  RegisterPropertyEditor(TypeInfo(TKWizardPageList), TKWizard, 'Pages',
    TKWizardPageListProperty);
end; {Register}

end.
