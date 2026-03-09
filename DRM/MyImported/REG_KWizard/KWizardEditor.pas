{*****************************************************************************
  Copyright: Copyright © by yuwei, 2002
  Unit Name: KWizardEditor
  Author:    yuwei
  Email:     william_yuwei@yahoo.com
  Date:      January 29, 2002
  Time:      20:40:30
  Purpose:   K Wizard Component Editor

  History:
  ---------------------------------------------------------------------------
  Date(mm/dd/yy)   Comments
  ---------------------------------------------------------------------------
  01/29/2002       Initial create
                   1) Move TKWizardActivePageProperty, TKWizardComponentEditor
                      class from KWizardReg to here
                   2) TKWizardPageListProperty added
                      TKWizardPageList dialog form added
******************************************************************************}

unit KWizardEditor;

interface

{$I KOMPONENTS.INC}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Menus {я добавил},
  KWizard, ActnList, ImgList, ComCtrls, StdCtrls, ToolWin,
  dcdsgnstuff
  {$IFDEF DELPHI6}
//  DesignIntf, DesignEditors, DesignWindows, DesignMenus
  {$ELSE}
//  DsgnIntf, DsgnWnds
  {$ENDIF}
  ;

type
  TKWizardActivePageProperty = class(TComponentProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

  // KWizard Component Local Menu Editor
  TKWizardComponentEditor = class(TComponentEditor)
  protected
    function GetWizard: TKWizard; virtual;
    procedure AddPage(Page: TKWizardCustomPage);
    procedure AddWelcomePage;
    procedure AddInteriorPage;
    procedure NextPage(Step: Integer);
    property Wizard: TKWizard read GetWizard;
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
    procedure PrepareItem(Index: Integer; const AItem: IMenuItem);override; //это я добавил
  end;

  TKWizardPageListProperty = class(TPropertyEditor)
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
  end;

  TKWizardPageListEditor = class(TDesignWindow)
    tbrWizardPages: TToolBar;
    lbxWizardPages: TListBox;
    btnAddWelcomePage: TToolButton;
    btnAddInteriorPage: TToolButton;
    btnDeletePages: TToolButton;
    ToolButton1: TToolButton;
    imgWizardPages: TImageList;
    actWizardPages: TActionList;
    actAddWelcomePage: TAction;
    actAddInteriorPage: TAction;
    actDeletePages: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actAddWelcomePageExecute(Sender: TObject);
    procedure actAddInteriorPageExecute(Sender: TObject);
    procedure actDeletePagesExecute(Sender: TObject);
    procedure actDeletePagesUpdate(Sender: TObject);
    procedure lbxWizardPagesClick(Sender: TObject);
    procedure lbxWizardPagesMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure lbxWizardPagesDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure lbxWizardPagesDragDrop(Sender, Source: TObject; X,
      Y: Integer);
  private
    FWizard: TKWizard;
    procedure SetWizard(const Value: TKWizard);
    procedure UpdatePageList(const CurrItemIndex: Integer);
    procedure SelectWizardPage(const Index: Integer);
  protected
    procedure AddPage(Page: TKWizardCustomPage);
    procedure AddWelcomePage;
    procedure AddInteriorPage;
    property Wizard: TKWizard
      read FWizard write SetWizard;
  public
    procedure Activated; override;
    {$IFDEF DELPHI6}
    procedure ItemDeleted(const ADesigner: IDesigner; Item: TPersistent); override;
    procedure DesignerClosed(const Designer: IDesigner; AGoingDormant: Boolean); override;
    procedure ItemsModified(const Designer: IDesigner); override;
    {$ELSE}
    procedure ComponentDeleted(Component: IPersistent); override;
    function UniqueName(Component: TComponent): string; override;
    procedure FormClosed(AForm: TCustomForm); override;
    procedure FormModified; override;
    {$ENDIF}
    function GetEditState: TEditState; override;
  end;

implementation

{$R *.DFM}

resourcestring

  rsPageList = 'Page List ...';
  rsNewWelcomePage = 'New Welcome Page';
  rsNewInteriorPage = 'New Interior Page';
  rsNextPage = 'Next Page';
  rsPreviousPage = 'Previous Page';
  rsDeletePage = 'Delete Page';
  rsNone = '(None)';

procedure ShowWizardPageListEditor(Designer: IDesigner; AWizard: TKWizard);
var
  i: Integer;
  AWizardPageListEditor: TKWizardPageListEditor;
begin
  exit; //это я добавил
  // because the page list editor is not show modal, so
  // we need to find it rather than create a new instance.
  AWizardPageListEditor := nil;
  for i := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[i] is TKWizardPageListEditor then
    begin
      if TKWizardPageListEditor(Screen.Forms[i]).Wizard = AWizard then
      begin
        AWizardPageListEditor := TKWizardPageListEditor(Screen.Forms[i]);
        Break;
      end;
    end;
  end;
  // Show the wizard editor
  if Assigned(AWizardPageListEditor) then
  begin
    AWizardPageListEditor.Show;
    if AWizardPageListEditor.WindowState = wsMinimized then
    begin
      AWizardPageListEditor.WindowState := wsNormal;
    end;
  end
  else
  begin
    AWizardPageListEditor := TKWizardPageListEditor.Create(Application);
    try
      {$IFDEF DELPHI6}
      AWizardPageListEditor.Designer := Designer;
      {$ELSE}
      AWizardPageListEditor.Designer := IFormDesigner(Designer);
      {$ENDIF}
      AWizardPageListEditor.Wizard := AWizard;
      AWizardPageListEditor.Show;
    except
      if Assigned(AWizardPageListEditor) then
      begin
        AWizardPageListEditor.Free;
      end;
      raise;
    end;
  end;
end;

{ TKWizardActivePageProperty }

function TKWizardActivePageProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList];
end;

procedure TKWizardActivePageProperty.GetValues(Proc: TGetStrProc);
var
  I: Integer;
  Component: TComponent;
begin
  for I := 0 to Designer.GetRoot.ComponentCount - 1 do
  begin
    Component := Designer.GetRoot.Components[I];
    if (Component.Name <> '') and (Component is TKWizardCustomPage) and
      (TKWizardCustomPage(Component).Wizard = GetComponent(0)) then
      Proc(Component.Name);
  end;
end;

{ TKWizardComponentEditor }

procedure TKWizardComponentEditor.AddPage(Page: TKWizardCustomPage);
begin
  Page.Parent := Wizard;
  Page.Wizard := Wizard;
  Designer.SelectComponent(Page);
  Wizard.ActivePage := Page;
  Designer.Modified;
end;

procedure TKWizardComponentEditor.AddInteriorPage;
var
  Page: TKWizardInteriorPage;
begin
  Page := TKWizardInteriorPage.Create(Designer.GetRoot);
  try
    Page.Name := Designer.UniqueName(TKWizardInteriorPage.ClassName);
    AddPage(Page);
  except
    Page.Free;
    raise;
  end;
end;

procedure TKWizardComponentEditor.AddWelcomePage;
var
  Page: TKWizardWelcomePage;
begin
  Page := TKWizardWelcomePage.Create(Designer.GetRoot);
  try
    Page.Name := Designer.UniqueName(TKWizardWelcomePage.ClassName);
    AddPage(Page);
  except
    Page.Free;
    raise;
  end;
end;

procedure TKWizardComponentEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0: ShowWizardPageListEditor(Designer, GetWizard);
    1: AddWelcomePage;
    2: AddInteriorPage;
    3: NextPage(1);
    4: NextPage(-1);
    5: if Assigned(Wizard.ActivePage) then
       begin
         Designer.SelectComponent(Wizard);
         Wizard.ActivePage.Free;
         Designer.Modified;
       end;
  end;
end;

function TKWizardComponentEditor.GetWizard: TKWizard;
begin
  if Component is TKWizard then
    Result := TKWizard(Component)
  else
    Result := TKWizard(TKWizardCustomPage(Component).Wizard);
end;

function TKWizardComponentEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := rsPageList;
    1: Result := rsNewWelcomePage;
    2: Result := rsNewInteriorPage;
    3: Result := rsNextPage;
    4: Result := rsPreviousPage;
    5: Result := rsDeletePage;
  end;
end;

function TKWizardComponentEditor.GetVerbCount: Integer;
begin
  Result := 6;
end;

procedure TKWizardComponentEditor.NextPage(Step: Integer);
var
  Page: TKWizardCustomPage;
begin
  Page := Wizard.FindNextPage(Wizard.ActivePageIndex, Step, False);
  if Assigned(Page) and (Page <> Wizard.ActivePage) then
  begin
    if Component is TKWizardCustomPage then
    begin
      Designer.SelectComponent(Page);
    end;
    Wizard.ActivePage := Page;
    Designer.Modified;
  end;
end;

{это я добавил}
procedure TKWizardComponentEditor.PrepareItem(Index: Integer;
  const AItem: IMenuItem);
begin
  inherited;
    if Index = 0 then AItem.Enabled := False;
end;

{ TKWizardPageListEditor }

procedure TKWizardPageListProperty.Edit;
begin
  ShowWizardPageListEditor(Designer, TKWizard(GetComponent(0)));
end;

function TKWizardPageListProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly];
end;

function TKWizardPageListProperty.GetValue: string;
var
  APageList: TList;
begin
  APageList := TList(Pointer(GetOrdValue));
  if not Assigned(APageList) or (APageList.Count <= 0) then
    Result := rsNone
  else
    Result := Format('(%s)', [GetPropType^.Name]);
end;

{ TKWizardPageList Dialog Form}

procedure TKWizardPageListEditor.UpdatePageList(const CurrItemIndex: Integer);
var
  i: Integer;
begin
  if Assigned(FWizard) then
  begin
    lbxWizardPages.Items.BeginUpdate;
    try
      lbxWizardPages.Items.Clear;
      for i := 0 to FWizard.PageCount - 1 do
      begin
        lbxWizardPages.Items.Add(TKWizardCustomPage(FWizard.Pages[i]).Name);
      end;
      if (CurrItemIndex >= 0) and (CurrItemIndex < lbxWizardPages.Items.Count) then
        lbxWizardPages.ItemIndex := CurrItemIndex
      else
        lbxWizardPages.ItemIndex := -1;
    finally
      lbxWizardPages.Items.EndUpdate;
    end;
  end;
end;

procedure TKWizardPageListEditor.SelectWizardPage(const Index: Integer);
var
  Page: TKWizardCustomPage;
begin
  if Assigned(FWizard) and Active then
  begin
    Page := nil;
    if (Index >= 0) and (Index < FWizard.PageCount) then
    begin
      Page := TKWizardCustomPage(FWizard.Pages[Index]);
    end;
    Designer.SelectComponent(Page);
    Wizard.ActivePage := Page;
    Designer.Modified;
  end;
end;

procedure TKWizardPageListEditor.Activated;
begin
  if (lbxWizardPages.ItemIndex < 0) and (lbxWizardPages.Items.Count > 0) then
  begin
    lbxWizardPages.ItemIndex := 0;
  end;
  if Assigned(FWizard) and Assigned(FWizard.ActivePage) and
     (FWizard.ActivePage.PageIndex <> lbxWizardPages.ItemIndex) then
  begin
    lbxWizardPages.ItemIndex := FWizard.ActivePage.PageIndex;
  end;
  SelectWizardPage(lbxWizardPages.ItemIndex);
end;

{$IFDEF DELPHI6}

procedure TKWizardPageListEditor.DesignerClosed(const Designer: IDesigner;
  AGoingDormant: Boolean);
begin
  if Designer = Self.Designer then
  begin
    Close;
  end;
end;

procedure TKWizardPageListEditor.ItemDeleted(const ADesigner: IDesigner;
  Item: TPersistent);
begin
  if Item = FWizard then
  begin
    FWizard := nil;
    Close;
  end;
end;

procedure TKWizardPageListEditor.ItemsModified(const Designer: IDesigner);
begin
  if not (csDestroying in ComponentState) then
  begin
    UpdatePageList(lbxWizardPages.ItemIndex);
  end;
end;

{$ELSE}

procedure TKWizardPageListEditor.ComponentDeleted(Component: IPersistent);
begin
  if ExtractPersistent(Component) = FWizard then
  begin
    FWizard := nil;
    Close;
  end;
end;

procedure TKWizardPageListEditor.FormClosed(AForm: TCustomForm);
begin
  if AForm = Designer.Form then
  begin
    Close;
  end;
end;

procedure TKWizardPageListEditor.FormModified;
begin
  if not (csDestroying in ComponentState) then
  begin
    UpdatePageList(lbxWizardPages.ItemIndex);
  end;
end;

function TKWizardPageListEditor.UniqueName(Component: TComponent): string;
begin
  Result := Designer.UniqueName(Component.ClassName);
end;

{$ENDIF}

function TKWizardPageListEditor.GetEditState: TEditState;
begin
  Result := [];
end;

procedure TKWizardPageListEditor.SetWizard(const Value: TKWizard);
begin
  if FWizard <> Value then
  begin
    FWizard := Value;
    UpdatePageList(0);
  end;
end;

procedure TKWizardPageListEditor.AddPage(Page: TKWizardCustomPage);
begin
  Page.Parent := Wizard;
  Page.Wizard := Wizard;
  Wizard.ActivePage := Page;
  Designer.SelectComponent(Page);
  //Designer.Modified; !!! otherwise for some reason, the last item of the
  //list box will show twice when adding either welcome page or interior page.
  lbxWizardPages.ItemIndex := lbxWizardPages.Items.Add(Page.Name);
end;

procedure TKWizardPageListEditor.AddInteriorPage;
var
  APage: TKWizardCustomPage;
begin
  APage := TKWizardInteriorPage.Create(Designer.GetRoot);
  try
    APage.Name := UniqueName(APage);
    AddPage(APage);
  except
    APage.Free;
    raise;
  end;
end;

procedure TKWizardPageListEditor.AddWelcomePage;
var
  APage: TKWizardCustomPage;
begin
  APage := TKWizardWelcomePage.Create(Designer.GetRoot);
  try
    APage.Name := UniqueName(APage);
    AddPage(APage);
  except
    APage.Free;
    raise;
  end;
end;

procedure TKWizardPageListEditor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TKWizardPageListEditor.actAddWelcomePageExecute(Sender: TObject);
begin
  AddWelcomePage;
end;

procedure TKWizardPageListEditor.actAddInteriorPageExecute(Sender: TObject);
begin
  AddInteriorPage;
end;

procedure TKWizardPageListEditor.actDeletePagesExecute(Sender: TObject);
begin
  if Assigned(Wizard.ActivePage) then
  begin
    if lbxWizardPages.ItemIndex >= 0 then
    begin
      lbxWizardPages.Items.Delete(Wizard.ActivePage.PageIndex);
    end;
    Designer.SelectComponent(Wizard);
    Wizard.ActivePage.Free;
    Designer.Modified;
  end;
end;

procedure TKWizardPageListEditor.actDeletePagesUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (lbxWizardPages.Items.Count > 0) and
                                 (lbxWizardPages.ItemIndex >= 0);
end;

procedure TKWizardPageListEditor.lbxWizardPagesClick(Sender: TObject);
begin
  SelectWizardPage(lbxWizardPages.ItemIndex);
end;

procedure TKWizardPageListEditor.lbxWizardPagesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  lbxWizardPages.BeginDrag(False);
end;

procedure TKWizardPageListEditor.lbxWizardPagesDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TListBox) and
            (lbxWizardPages.ItemAtPos(Point(X,Y), True) <> -1) and
            (lbxWizardPages.ItemAtPos(Point(X,Y), True) <> lbxWizardPages.ItemIndex);
end;

procedure TKWizardPageListEditor.lbxWizardPagesDragDrop(Sender, Source: TObject;
  X, Y: Integer);
var
  OldIndex, NewIndex: Integer;
begin
  OldIndex := lbxWizardPages.ItemIndex;
  NewIndex := lbxWizardPages.ItemAtPos(Point(X,Y), True);
  lbxWizardPages.Items.Move(OldIndex, NewIndex);
  if Assigned(FWizard) then
  begin
    TKWizardCustomPage(FWizard.Pages[OldIndex]).PageIndex := NewIndex;
    lbxWizardPages.ItemIndex := NewIndex;
  end;
end;

end.

