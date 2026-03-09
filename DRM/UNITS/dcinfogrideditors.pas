{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit DCInfoGridEditors;
{$I dc.inc}
Interface

Uses
  {$IFDEF D6}
  Variants,
  {$ENDIF}
  Windows, Messages, Graphics, Dialogs, SysUtils, Forms, Classes, Controls,
  StdCtrls, DB, DBConsts, DBGrids, CommCtrl,
  DCdreamLib, DCnTree, DCTreeGrid, DCTreeGridEditors, DCInfoDB, DCInfoLib;

Type
  TDCDBLookupTreeViewEditor = Class( TDCCustomTreeViewBtnEditor )
  private
    FKeyFields      : String;
    FListFields     : String;
    FKeyFieldValues : Variant;
    FDataField      : String;

    FEditingField       : TField;
    FEditingLookupField : Boolean;

    Procedure DMSetEditorData( Var AMsg : TMessage ); message DM_SETEDITORDATA;
    Procedure DMSaveChanges( Var AMsg : TMessage ); message DM_SAVECHANGES;

    //Procedure DMDraw( Var AMsg : TDMDraw ); message DM_DRAW;

    Function  GetLookupDataSet  : TDataSet;
    Procedure SetLookupDataSet( AValue : TDataSet );
    Procedure SetListFields( Const AValue : String );
    Procedure SetKeyFieldValues( Const AValue : Variant );
    Function  GetAutoSizedColumn : Integer;
    Procedure SetAutoSizedColumn( AValue : Integer );
    Function  GetMinAutoSizedWidth: Integer;
    Procedure SetMinAutoSizedWidth( AValue : Integer );

    Function InitFieldsList( Const AFields : String; AFieldsList : TStrings; ADataSet : TDataSet ) : Boolean;
  protected
    Function  GetNewNodeText : String; override;
    Procedure DoSetText( Var AText : String ); override;
    Function  GetNodeText : String; override;
    Function  DoShowPopup : Boolean; override;
    Procedure ValidatePopupValue; override;
    Function  GetPopupWindowClass : TWinControlClass; override;
    Function  GetModified : Boolean; override;

    Function  GetCurrentKeyFieldsValue : Variant;
    Procedure ValidateValue;
    Procedure ValidateDataSource;
  public
    Constructor Create( AOwner : TComponent ); override;

    Property LookupDataSet  : TDataSet Read GetLookupDataSet Write SetLookupDataSet;
    Property KeyFields      : String   Read FKeyFields Write FKeyFields;
    Property DataField      : String   Read FDataField Write FDataField;
    Property ListFields     : String   Read FListFields Write SetListFields;
    Property KeyFieldValues : Variant  Read FKeyFieldValues Write SetKeyFieldValues;

    Property EditingField       : TField  Read FEditingField Write FEditingField;
    Property EditingLookupField : Boolean Read FEditingLookupField Write FEditingLookupField;

    Property AutoSizedColumn   : Integer Read GetAutoSizedColumn Write SetAutoSizedColumn;
    Property MinAutoSizedWidth : Integer Read GetMinAutoSizedWidth Write SetMinAutoSizedWidth;
  end;

{------------------------------------------------------------------}

  TDCLookupEditorProps = class(TEditorProps)
  private
    FLookupDataset : TDataset;
    FKeyFields     : String;
    FDataField     : String;
    FListFields    : String;
    FAutoSizedColumn: Integer;
    FMinAutoSizedWidth: Integer;
    FComp: TComponent;

    procedure SetLookupDataset(Value: TDataSet);
    procedure SetKeyFields(const Value: string);
    procedure SetDataField( Const AValue : String );
    procedure SetListFields( Const AValue : String );
    procedure SetMinAutoSizedWidth( AValue : Integer );
    procedure SetAutoSizedColumn( AValue : Integer );
  public
    EditedField: IDCProperty;

    constructor Create(AColumn: TDCTreeColumn); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    Procedure CheckAutoSizeColumn;
  published
    property LookupDataset     : TDataset read FLookupDataset write SetLookupDataset;
    property KeyFields         : String read FKeyFields write SetKeyFields;
    property DataField         : String read FDataField write SetDataField;
    property ListFields        : String read FListFields write SetListFields;
    Property AutoSizedColumn   : Integer Read FAutoSizedColumn Write SetAutoSizedColumn;
    Property MinAutoSizedWidth : Integer Read FMinAutoSizedWidth Write SetMinAutoSizedWidth;
  end;

{------------------------------------------------------------------}

Implementation

Const
  sDCMinPopupWidth = 110;
  sDCMinPopupHeight = 40;

{------------------------------------------------------------------}

Type
  TDCDBGridPopup = Class( TCustomDBGrid )
  private
    FAutoSizedColumn   : Integer;
    FMinAutoSizedWidth : Integer;
    FColunmWidth       : Integer;

    Procedure WMWindowPosChanged( Var AMsg : TWMWindowPosChanged ); message WM_WINDOWPOSCHANGED;
    Procedure WMLButtonUp( Var AMsg : TWMLButtonUp ); message WM_LBUTTONUP;

    Procedure SetAutoSizedColumn( AValue : Integer );
    Procedure SetMinAutoSizedWidth( AValue : Integer );
  protected
    Procedure CreateParams( Var Params : TCreateParams ); override;

    Property ColunmWidth : Integer Read FColunmWidth;

    Procedure ResetAutoSizeMeasurement;
    Procedure AutoSizeColumn;
  public
    Constructor Create( AOwner : TComponent ); override;

    {$IFDEF D5}
    Function CanFocus          : Boolean; override;
    {$ENDIF}
    Property AutoSizedColumn   : Integer Read FAutoSizedColumn Write SetAutoSizedColumn;
    Property MinAutoSizedWidth : Integer Read FMinAutoSizedWidth Write SetMinAutoSizedWidth;
  end;

{------------------------------------------------------------------}

  TComponent2 = class(TComponent)
  private
    FLookupProps: TDCLookupEditorProps;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  end;

{------------------------------------------------------------------}

{ TDCDBLookupTreeViewEditor }

Constructor TDCDBLookupTreeViewEditor.Create( AOwner : TComponent );
begin
  Inherited;
  Editor.ReadOnly := True;
  TDCDBGridPopup( PopupWindow ).DataSource := TDataSource.Create( Self );
end;

{------------------------------------------------------------------}

Procedure TDCDBLookupTreeViewEditor.DMSaveChanges( Var AMsg : TMessage );
begin
  Inherited;
  If Editor.Modified Then
    ValidateValue;
end;

{------------------------------------------------------------------}

Procedure TDCDBLookupTreeViewEditor.DMSetEditorData( Var AMsg : TMessage );
begin
  With TDCLookupEditorProps( AMsg.WParam ) Do
  begin
    Self.LookupDataSet     := LookupDataset;
    Self.KeyFields         := KeyFields;
    Self.DataField         := DataField;
    Self.ListFields        := ListFields;
    Self.AutoSizedColumn   := AutoSizedColumn;
    Self.MinAutoSizedWidth := MinAutoSizedWidth;
    Self.EditingField      := GetDatasetField(EditedField);
  end;
  EditingLookupField := Assigned(EditingField) and (EditingField.FieldKind = fkLookup);
end;

{------------------------------------------------------------------}

Procedure TDCDBLookupTreeViewEditor.DoSetText( Var AText : String );
begin
  If EditingLookupField Then
    KeyFieldValues := GetCurrentKeyFieldsValue
  Else
    KeyFieldValues := AText;
  Editor.Modified := False;  
end;

{------------------------------------------------------------------}

Function TDCDBLookupTreeViewEditor.DoShowPopup : Boolean;
begin
  Result := Assigned( LookupDataSet );
end;

{------------------------------------------------------------------}

Function TDCDBLookupTreeViewEditor.GetAutoSizedColumn : Integer;
begin
  Result := TDCDBGridPopup( PopupWindow ).AutoSizedColumn;
end;

{------------------------------------------------------------------}

Function TDCDBLookupTreeViewEditor.GetCurrentKeyFieldsValue : Variant;
Var
  I               : Integer;
  SourceKeyFields : TStringList;
begin
  Result := Unassigned;
  SourceKeyFields := TStringList.Create;
  try
    If Not InitFieldsList( EditingField.KeyFields, SourceKeyFields, EditingField.DataSet ) Then
      Exit;
    Result := VarArrayCreate( [ 0, SourceKeyFields.Count - 1 ], varVariant );
    For I := SourceKeyFields.Count - 1 DownTo 0 Do
      Result := TField( SourceKeyFields.Objects[I] ).Value; 
  finally
  end;
end;

{------------------------------------------------------------------}

Function TDCDBLookupTreeViewEditor.GetLookupDataSet : TDataSet;
begin
  Result := TDCDBGridPopup( PopupWindow ).DataSource.DataSet;
end;

{------------------------------------------------------------------}

Function TDCDBLookupTreeViewEditor.GetMinAutoSizedWidth : Integer;
begin
  Result := TDCDBGridPopup( PopupWindow ).MinAutoSizedWidth;
end;

{------------------------------------------------------------------}

Function TDCDBLookupTreeViewEditor.GetModified : Boolean;
begin
  Result := Not EditingLookupField And Inherited GetModified;
end;

{------------------------------------------------------------------}

Function TDCDBLookupTreeViewEditor.GetNewNodeText : String;
begin
  Result := KeyFieldValues;
end;

{------------------------------------------------------------------}

Function TDCDBLookupTreeViewEditor.GetNodeText : String;
begin
  If Assigned( LookupDataSet ) Then
    Result := LookupDataSet.FieldByName( DataField ).AsString
  Else
    Result := FNodeText;
end;

{------------------------------------------------------------------}

Function TDCDBLookupTreeViewEditor.GetPopupWindowClass : TWinControlClass;
begin
  Result := TDCDBGridPopup;
end;

{------------------------------------------------------------------}

Function TDCDBLookupTreeViewEditor.InitFieldsList( Const AFields : String;
  AFieldsList : TStrings; ADataSet : TDataSet ) : Boolean;
Var
  I : Integer;
begin
  Result := False;
  ParseAndCompactString( AFields, ';', AFieldsList );
  For I := AFieldsList.Count - 1 DownTo 0 Do
  begin
    AFieldsList.Objects[I] := ADataSet.FindField( AFieldsList[I] );
    If AFieldsList.Objects[I] = Nil Then
      Exit;
  end;
  Result := True;
end;

{------------------------------------------------------------------}

Procedure TDCDBLookupTreeViewEditor.SetAutoSizedColumn( AValue : Integer );
begin
  TDCDBGridPopup( PopupWindow ).AutoSizedColumn := AValue;
end;

{------------------------------------------------------------------}

Procedure TDCDBLookupTreeViewEditor.SetKeyFieldValues( Const AValue : Variant );
begin
  FKeyFieldValues := AValue;

  If Not Assigned( LookupDataSet ) Then
  begin
    Editor.Text := AValue;
    Exit;
  end;

  try
    With LookupDataSet Do
      If Locate( KeyFields, KeyFieldValues, [loCaseInsensitive] ) Then
        Editor.Text := FieldByName( DataField ).AsString
      Else
        Editor.Text := '';
  except
    Editor.Text := AValue;
  end;
end;

{------------------------------------------------------------------}

Procedure TDCDBLookupTreeViewEditor.SetListFields( Const AValue : String );
begin
  If FListFields = AValue Then
    Exit;
  FListFields := AValue;
  ValidateDataSource;
end;

{------------------------------------------------------------------}

Procedure TDCDBLookupTreeViewEditor.SetLookupDataSet( AValue : TDataSet );
begin
  TDCDBGridPopup( PopupWindow ).DataSource.DataSet := AValue;
  ValidateDataSource;
end;

{------------------------------------------------------------------}

Procedure TDCDBLookupTreeViewEditor.SetMinAutoSizedWidth( AValue : Integer );
begin
  TDCDBGridPopup( PopupWindow ).MinAutoSizedWidth := AValue;
end;

{------------------------------------------------------------------}

Procedure TDCDBLookupTreeViewEditor.ValidateDataSource;
Var
  I          : Integer;
  FieldNames : TStringList;
  Field      : String;
begin
  TDCDBGridPopup( PopupWindow ).Columns.Clear;
  If Not Assigned( LookupDataSet ) Or ( ListFields = '' ) Then
  begin
    TDCDBGridPopup( PopupWindow ).ResetAutoSizeMeasurement;
    Exit;
  end;

  FieldNames := TStringList.Create;
  try
    ParseString( ListFields, ';', FieldNames );
    For I := FieldNames.Count - 1 Downto 0 Do
    begin
      Field := Trim( FieldNames[I] );
      If Field = '' Then
      begin
        FieldNames.Delete( I );
        continue;
      end;
      If Field[1] = '[' Then
      begin
        Delete( Field, 1, 1 );
        SetLength( Field, Length( Field ) - 1 );
      end;
      FieldNames[I] := Field;
    end;
    If FieldNames.Count = 0 Then
      Exit;

    With TDCDBGridPopup( PopupWindow ).Columns Do
      For I := 0 To FieldNames.Count - 1 Do
        Add.FieldName := FieldNames[I];

    TDCDBGridPopup( PopupWindow ).ResetAutoSizeMeasurement;
  finally
    FieldNames.Free;
  end;
end;

{------------------------------------------------------------------}

Procedure TDCDBLookupTreeViewEditor.ValidatePopupValue;
begin
  If Not Assigned( LookupDataSet ) Then
    Exit;
  With LookupDataSet Do
    If Not ( EOF And BOF ) Then
    begin
      Editor.Text := FieldByName( DataField ).AsString;
      Editor.Modified := True;
    end;
end;

{------------------------------------------------------------------}

procedure TDCDBLookupTreeViewEditor.ValidateValue;
Var
  I                                : Integer;
  SourceKeyFields, LookupKeyFields : TStringList;
begin
  If Not FEditingLookupField Then
    Exit;
  SourceKeyFields := TStringList.Create;
  LookupKeyFields := TStringList.Create;
  try
    If Not InitFieldsList( EditingField.KeyFields, SourceKeyFields, EditingField.DataSet ) Or
       Not InitFieldsList( KeyFields, LookupKeyFields, LookupDataSet ) Or
       ( SourceKeyFields.Count <> LookupKeyFields.Count ) Then
      Exit;

    EditingField.DataSet.Edit;
    try
      For I := SourceKeyFields.Count - 1 DownTo 0 Do
        TField( SourceKeyFields.Objects[I] ).Value := TField( LookupKeyFields.Objects[I] ).Value;
      EditingField.DataSet.Post;
    except
      EditingField.DataSet.Cancel;
      raise;
    end;
  finally
    LookupKeyFields.Free;
    SourceKeyFields.Free;
  end;
end;

{------------------------------------------------------------------}

{ TDCDBGridPopup }

Procedure TDCDBGridPopup.AutoSizeColumn;
Var
  NewWidth : Integer;
begin
  If ( AutoSizedColumn < 0 ) Or ( AutoSizedColumn >= Columns.Count ) Then
    Exit;
  NewWidth := ClientWidth - ColunmWidth;
  If NewWidth < MinAutoSizedWidth Then
    NewWidth := MinAutoSizedWidth;
  Columns[ AutoSizedColumn ].Width := NewWidth;
end;

{------------------------------------------------------------------}

{$IFDEF D5}
Function TDCDBGridPopup.CanFocus : Boolean;
begin
  Result := False;
end;
{$ENDIF}

{------------------------------------------------------------------}

Constructor TDCDBGridPopup.Create( AOwner : TComponent );
begin
  Inherited;
  ControlStyle := ControlStyle + [csNoDesignVisible];
  Options := [dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete];
  ReadOnly := True;
  FMinAutoSizedWidth := 10;
  FAcquireFocus := False;
end;

{------------------------------------------------------------------}

Procedure TDCDBGridPopup.CreateParams( Var Params : TCreateParams );
begin
  Inherited CreateParams( Params );
  With Params Do
  begin
    Style := Style Or ( WS_CHILD Or WS_ThickFrame );
    ExStyle := WS_EX_TOOLWINDOW;
    WindowClass.Style := WindowClass.Style Or CS_SAVEBITS;
  end;
end;

{------------------------------------------------------------------}

Procedure TDCDBGridPopup.ResetAutoSizeMeasurement;
Var
  I : Integer;
begin
  FColunmWidth := 0;
  For I := Columns.Count - 1 DownTo 0 Do
    If I <> AutoSizedColumn Then
      Inc( FColunmWidth, Columns[I].Width );

  AutoSizeColumn;
end;

{------------------------------------------------------------------}

Procedure TDCDBGridPopup.SetAutoSizedColumn( AValue : Integer );
begin
  If FAutoSizedColumn = AValue Then
    Exit;
  FAutoSizedColumn := AValue;
  ResetAutoSizeMeasurement;
end;

{------------------------------------------------------------------}

Procedure TDCDBGridPopup.SetMinAutoSizedWidth( AValue : Integer );
begin
  If FMinAutoSizedWidth = AValue Then
    Exit;
  FMinAutoSizedWidth := AValue;
  AutoSizeColumn;
end;

{------------------------------------------------------------------}

Procedure TDCDBGridPopup.WMLButtonUp( Var AMsg : TWMLButtonUp );
begin
  Inherited;
  TDCDBLookupTreeViewEditor( Owner ).PopupLostFocus( False );
end;

{------------------------------------------------------------------}

Procedure TDCDBGridPopup.WMWindowPosChanged( Var AMsg : TWMWindowPosChanged );
begin
  Inherited;
  If AMsg.WindowPos^.Flags And SWP_NoSize = 0 Then
    AutoSizeColumn;
end;

{------------------------------------------------------------------}

{ TDCLookupEditorProps }

Procedure TDCLookupEditorProps.Assign(Source: TPersistent);
begin
  if Source is TDCLookupEditorProps then
    with TDCLookupEditorProps(Source) do
    begin
      Self.EditedField    := EditedField;
      Self.FLookupDataset := FLookupDataset;
      Self.FKeyFields     := FKeyFields;
      Self.FDataField     := FDataField;
      Self.FListFields    := FListFields;
    end
  else
    inherited;
end;

{------------------------------------------------------------------}

procedure TDCLookupEditorProps.SetLookupDataset(Value: TDataSet);
begin
  if FLookupDataset <> Value then
  begin
    FLookupDataset := Value;
    if FLookupDataset <> nil then
      FLookupDataset.FreeNotification(FComp);
    UpdateColumn;
  end;
end;

{------------------------------------------------------------------}

Procedure TDCLookupEditorProps.SetKeyFields(const Value: string);
begin
  if FKeyFields <> Value then
  begin
    FKeyFields := Value;
    UpdateColumn;
  end;
end;

{------------------------------------------------------------------}

procedure TDCLookupEditorProps.SetDataField( Const AValue : String );
begin
  if FDataField <> AValue Then
  begin
    FDataField := AValue;
    UpdateColumn;
  end;
end;

{------------------------------------------------------------------}

Procedure TDCLookupEditorProps.SetListFields( Const AValue : string );
begin
  If FListFields <> AValue Then
  begin
    FListFields := AValue;
    CheckAutoSizeColumn;
    UpdateColumn;
  end;
end;

{------------------------------------------------------------------}

Procedure TDCLookupEditorProps.SetMinAutoSizedWidth( AValue : Integer );
begin
  If FMinAutoSizedWidth <> AValue Then
  begin
    If AValue < 0 Then
      AValue := 0;
    FMinAutoSizedWidth := AValue;
    UpdateColumn;
  end;
end;

{------------------------------------------------------------------}

Procedure TDCLookupEditorProps.SetAutoSizedColumn( AValue : Integer );
begin
  If AutoSizedColumn = AValue Then
  begin
    FAutoSizedColumn := AValue;
    CheckAutoSizeColumn;
    UpdateColumn;
  end;
end;

{------------------------------------------------------------------}

Procedure TDCLookupEditorProps.CheckAutoSizeColumn;
Var
  Lines : TStringList;
begin
  Lines := TStringList.Create;
  try
    ParseString( ListFields, ';', Lines );
    If FAutoSizedColumn >= Lines.Count Then
      FAutoSizedColumn := Lines.Count - 1;
    If FAutoSizedColumn < -1 Then
      FAutoSizedColumn := -1;
  finally
    Lines.Free;
  end;
end;

{------------------------------------------------------------------}

constructor TDCLookupEditorProps.Create(AColumn: TDCTreeColumn);
begin
  inherited;
  FComp := TComponent2.Create(nil);
  TComponent2(FComp).FLookupProps := Self;
end;

{------------------------------------------------------------------}

destructor TDCLookupEditorProps.Destroy;
begin
  FComp.Free;
  inherited;
end;

{------------------------------------------------------------------}

{ TComponent2 }

procedure TComponent2.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FLookupProps.LookupDataset) then
    FLookupProps.LookupDataset := nil;
end;

{------------------------------------------------------------------}

end.
