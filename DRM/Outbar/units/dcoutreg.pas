{**************************************************}
{                                                  }
{  Dream OutBar                                    }
{  Copyright (c) 1997-2001 Dream Company           }
{  http://www.dream-com.com                        }
{  e-mail: contact@dream-com.com                   }
{                                                  }
{**************************************************}
unit dcoutreg;
interface
{$I Outbar.Inc}
{$R dcoutbar.dcr}

Procedure Register;

implementation

Uses
  {$IFDEF D6}
  DesignIntf,DesignEditors,VCLEditors,
  {$ELSE}
  DsgnIntf,
  {$ENDIF}

  SysUtils,Windows, Classes, Controls, Forms,TypInfo,
  dcOutBar, dcOutPanel, dcOutConst, dcOutCommon;
     
const
  SOutbarVersion='2.22';

Type
  TVertListViewEditor=Class(TDefaultEditor)
  Private
    {$IFDEF D6}
    Procedure FindProperty(const Prop: IProperty);
    {$ELSE}
    Procedure FindProperty(PropertyEditor:TPropertyEditor);
    {$ENDIF}
  Public
    Procedure ExecuteVerb(Verb:Integer);override;
    Function GetVerb(Index:Integer):String;override;
    Function GetVerbCount:Integer;override;
  End;

  TDCOutBarEditor = Class (TComponentEditor)
    Function  GetVerbCount : Integer ; Override ;
    Function  GetVerb (Index : Integer) : String ; Override ;
    Procedure ExecuteVerb (Index : Integer) ; Override ;
    Procedure Edit ; Override ;
  End ;

  TPanelEditor=Class(TDefaultEditor)
  Public
    Procedure ExecuteVerb(Index:Integer);override;
    Function GetVerb(Index:Integer):String;override;
    Function GetVerbCount:Integer;override;
  End;

{ TVertListViewEditor }

Procedure TVertListViewEditor.ExecuteVerb(Verb:Integer);
Var
  ComponentList:
    {$IFDEF D6}
      IDesignerSelections
    {$ELSE}
      {$IFDEF D5}
      TDesignerSelectionList
      {$ELSE}
      TComponentList
      {$ENDIF}
    {$ENDIF}
  ;
Begin
  ComponentList:=
    {$IFDEF D6}
      CreateSelectionList;
    {$ELSE}
      {$IFDEF D5}
      TDesignerSelectionList.Create;
      {$ELSE}
      TComponentList.Create;
      {$ENDIF}
    {$ENDIF}

  Try
    ComponentList.Add(Component);
    GetComponentProperties(ComponentList,[tkClass],Designer,FindProperty
      {$IFDEF D6},nil{$ENDIF});
  Finally
    {$IFNDEF D6}
    ComponentList.Free;
    {$ENDIF}
  End;
End;

{---------------------------------------------------------}

{$IFDEF D6}
Procedure TVertListViewEditor.FindProperty(const Prop: IProperty);
Begin
  If Prop.GetName='Items' Then  //don't resource
    Prop.Edit;
End;
{$ELSE}
Procedure TVertListViewEditor.FindProperty(PropertyEditor:TPropertyEditor);
Begin
  If PropertyEditor.GetName='Items' Then  //don't resource
    PropertyEditor.Edit;
  PropertyEditor.Free;
End;
{$ENDIF}

{---------------------------------------------------------}

Function TVertListViewEditor.GetVerb(Index:Integer):String;
Begin
  Result:=SVertListViewItems;
End;

{---------------------------------------------------------}

Function TVertListViewEditor.GetVerbCount:Integer;
Begin
  Result:=1;
End;

{---------------------------------------------------------}

Function TDCOutBarEditor.GetVerbCount : Integer ;
Begin
  Result := 4;
End ;

{-----------------------------------------------------------}

Function TDCOutBarEditor.GetVerb(Index:Integer):String;
Begin
  Case Index of
    0:Result:=SNewGroup;
    1:Result:=SDeleteGroup;
    2:Result:=SNextGroup;
    3:Result:=SPrevGroup;
  End;
End;

{-----------------------------------------------------------}

Procedure TDCOutBarEditor.ExecuteVerb (Index : Integer) ;
Begin
  With TDCGroupBar (Component) do
    Case Index of
      0:Begin
          With NewGroup do
            begin
              Name := Designer.UniqueName (System.Copy (ClassName, 2, MaxInt)) ;
              If Component Is TDCOutBar Then
                ListView.Name := Designer.UniqueName(System.Copy(ListView.ClassName,2,MaxInt));
            end;
//          ActiveGroupIndex := GroupCount - 1 ;
        End ;
      1: RemoveGroup(ActiveGroup);
      2: SelectNextGroup(true);
      3: SelectNextGroup(false);
    End ;

  Designer.Modified ;
End ;

{-----------------------------------------------------------}

Procedure TDCOutBarEditor.Edit ;
Begin
End ;

{ TPanelEditor }

Type
  TDummy=Class(TCustomDCSplitterPanel);

Procedure TPanelEditor.ExecuteVerb(Index:Integer);
Var
  Control1,Control2:TCustomDCSplitterPanel;
  CtrlName:String;
Begin
  If Not TCustomDCSplitterPanel(Component).AcceptControls Then
    Exit;
  Control2:=Nil;
  Case Index Of
    0:Control2:=TDummy(Component).Split(alTop);
    1:Control2:=TDummy(Component).Split(alLeft);
  End;
  If Index<2 Then
  Begin
    Control1:=TCustomDCSplitterPanel(Component).AllPanels[0];
    If Control1=Nil Then
      Control1:=TCustomDCSplitterPanel(TCustomDCSplitterPanel(Component).Parent).AllPanels[0];
    If Control1.Name='' Then
      Control1.Name:=Designer.UniqueName(System.Copy(Control1.ClassName,2,Length(Control1.ClassName)-1));
    If Control2.Name='' Then
    Begin
      CtrlName:=System.Copy(Control2.ClassName,2,Length(Control2.ClassName)-1);
      CtrlName:=Designer.UniqueName(CtrlName);
      Control2.Name:=CtrlName;
    End;
  End;
End;

{---------------------------------------------------------}

Function TPanelEditor.GetVerb(Index:Integer):String;
Begin
  If Not TCustomDCSplitterPanel(Component).AcceptControls Then
    Exit;
  Case Index Of
    0:Result:='Split horizontally';
    1:Result:='Split vertically';
  End;
End;

{---------------------------------------------------------}

Function TPanelEditor.GetVerbCount:Integer;
Begin
  Result:=0;
  If TCustomDCSplitterPanel(Component).AcceptControls Then
    Result:=2;
End;

{***********************************************************}

Type
  TDCVersionEditor = class(TStringProperty)
    function  GetAttributes: TPropertyAttributes; override;
    function  GetValue : string; override;
    procedure Edit; override;
  end;

{-------TDCVersionEditor--------------------------------------------}

function TDCVersionEditor.GetAttributes: TPropertyAttributes;
begin
  result := inherited GetAttributes + [paReadOnly, paDialog];
end;

{-----------------------------------------------------------}

function TDCVersionEditor.GetValue : string;
begin
  result := SOutbarVersion;
end;

{-----------------------------------------------------------}

procedure TDCVersionEditor.Edit;
var
  Message: string;
begin
  Message:='Dream Outbar Version '+SOutbarVersion+#13#10+
           'e-mail: contact@dream-com.com'#13#10+
           'WWW: http://www.dream-com.com'#13#10;
  MessageBox(0,PChar(Message),PChar('About'),MB_ICONINFORMATION);
end;

{-----------------------------------------------------------}
(*
{$IFDEF D4}
Function GetComponentDesigner(AComponent:TComponent):{$IFDEF D6}IDesignerHook{$ELSE}IDesigner{$ENDIF};
{$ELSE}
Function GetComponentDesigner(AComponent:TComponent):TDesigner;
{$ENDIF}
Begin
  Result:=Nil;
  While AComponent<>Nil Do
  Begin
    If AComponent Is TCustomForm Then
      Break;
    AComponent:=AComponent.Owner;
  End;

  If AComponent<>Nil then
    Result:=TCustomForm(AComponent).Designer;
End;
*)
{-----------------------------------------------------------}
(*
Procedure SelectComponentInDesigner(AComponent:TComponent);
{$IFDEF D6}
var
  LDesigner:IDesigner;
begin
  if Supports(FindRootDesigner(AComponent), IDesigner, LDesigner) then
    LDesigner.SelectComponent(AComponent);
end;
{$ELSE}
Var
{$IFDEF D4}
  Designer:IDesignerNotify;
  DesignerIntf:IFormDesigner;
{$ELSE}
  Designer:TDesigner;
{$ENDIF}
begin
  If AComponent=Nil Then
    Exit;
  If Not (csDesigning In AComponent.ComponentState) Then
    Exit;
  Designer:=GetComponentDesigner(AComponent);
  If (Designer<>Nil) Then
  Begin
     {$IFDEF D4}
     Designer.QueryInterface(IFormDesigner,DesignerIntf);
     If DesignerIntf<>Nil Then
       DesignerIntf.SelectComponent(AComponent);
     {$ELSE}
     If (Designer Is TFormDesigner) Then
      (Designer As TFormDesigner).SelectComponent(AComponent);
     {$ENDIF}
  End;
end;
{$ENDIF}
*)
{-----------------------------------------------------------}

Procedure Register ;
Begin
  RegisterComponents(SPalDreamOutBar, [TDCGroupBar, TDCVertListView,
                      TDCTranspScrollBar, TDCOutBar, TDCScrollButton]);
  RegisterComponentEditor (TDCGroupBar, TDCOutBarEditor);
  RegisterComponentEditor (TDCVertListView, TVertListViewEditor) ;
  RegisterComponents(SPalDreamOutBar,[TDCOutHeader,TDCHeaderPanel,TDCBorderedPanel,TDCSplitterPanel]);
  RegisterComponentEditor(TCustomDCSplitterPanel,TPanelEditor);
  RegisterPropertyEditor(TypeInfo(TDCVersion),Nil,'',TDCVersionEditor);
End ;

{-----------------------------------------------------------}
{
Initialization
  SelectComponentInDesignerProc:=SelectComponentInDesigner;
}  
end.
