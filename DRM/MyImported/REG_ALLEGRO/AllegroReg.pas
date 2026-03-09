unit AllegroReg;

interface

uses
  SysUtils, Classes, db, IBQuery, RefQueryFr,
  RefQuery, AccTreeGrid, DocDirTreeView, DBGridA, AlgIBScript, IBDatabase,
  AlgCtrls, Bal, Controls,
  dcdsgnstuff, IBUpdateSQLW
//  DesignIntf, DesignEditors
  ;

procedure Register;

implementation

uses CachedData, AllegroEventNamesEdit, RubricPropertyEdit;

type
  { TClassTableNameProperty}
  TClassTableNameProperty = class(TStringProperty)
  public
    procedure GetValues(Proc: TGetStrProc); override;
    function GetAttributes: TPropertyAttributes; override;
  end;
  {TDetailFieldNameProperty}
  TDetailFieldNameProperty = class(TStringProperty)
  public
    procedure GetValues(Proc: TGetStrProc); override;
    function GetAttributes: TPropertyAttributes; override;
  end;
  {TMasterFieldNameProperty}
  TMasterFieldNameProperty = class(TStringProperty)
  public
    procedure GetValues(Proc: TGetStrProc); override;
    function GetAttributes: TPropertyAttributes; override;
  end;
  {TNamesTypeProperty}
  TNamesTypeProperty = class(TStringProperty)
  public
    procedure GetValues(Proc: TGetStrProc); override;
    function GetAttributes: TPropertyAttributes; override;
  end;
  { TDocTableNameProperty}
  TDocTableNameProperty = class(TStringProperty)
  public
    procedure GetValues(Proc: TGetStrProc); override;
    function GetAttributes: TPropertyAttributes; override;
  end;
  { TSettingTableNameProperty}
  TSettingTableNameProperty = class(TStringProperty)
  public
    procedure GetValues(Proc: TGetStrProc); override;
    function GetAttributes: TPropertyAttributes; override;
  end;


type
  {TRSDClassTableNameProperty}
  TRSDClassTableNameProperty = class(TStringProperty)
  public
    procedure GetValues(Proc: TGetStrProc); override;
    function GetAttributes: TPropertyAttributes; override;
  end;

  TRSDSubClassTableNameProperty = class(TStringProperty)
  public
    procedure GetValues(Proc: TGetStrProc); override;
    function GetAttributes: TPropertyAttributes; override;
  end;

  {TShortNameFieldProperty}
  TShortNameFieldProperty = class(TStringProperty)
  public
    procedure GetValues(Proc: TGetStrProc); override;
    function GetAttributes: TPropertyAttributes; override;
  end;

type
  {TAllegroEventNamesProperty}
  TAllegroEventNamesProperty = class(TPropertyEditor)
  public
    function  GetAttributes : TPropertyAttributes; override;
    function  GetValue : string; override;
    procedure SetValue(const val : string); override;
    procedure Edit; override;
  end;

  {TRubric_IDProperty}
  TRubric_IDProperty = class(TIntegerProperty)
  public
    function  GetAttributes : TPropertyAttributes; override;
    procedure Edit; override;
  end;

{ TClassTableNameProperty }

function TClassTableNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList];
end;

procedure TClassTableNameProperty.GetValues(Proc: TGetStrProc);
var
  comp: TRefQuery;
begin
  comp := GetComponent(0) as TRefQuery;
  if Assigned(comp.DataBase) then
  with TIBQuery.Create(nil) do
  try
    Transaction := comp.Transaction;
    SQL.Text := 'SELECT TABLE_NAME FROM CLASS';
    Open;
    while not Eof do
    begin
      proc(Fields[0].AsString);
      Next;
    end;
  finally
    Free;
  end;
end;

{ TDetailFieldNameProperty }

function TDetailFieldNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList];
end;

procedure TDetailFieldNameProperty.GetValues(Proc: TGetStrProc);
var
  comp: TRefQuery;
  i: integer;
begin
  comp := GetComponent(0) as TRefQuery;
  comp.LoadExFieldDefs;
  with comp do
  for i := 0 to ExFieldDefs.Count - 1 do
  with ExFieldDefs[i] do
  if (ref_table_name <> '') and not is_lookup_field then
    proc(Field_alias);
end;

{ TMasterFieldNameProperty }

function TMasterFieldNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList];
end;

procedure TMasterFieldNameProperty.GetValues(Proc: TGetStrProc);
var
  I: Integer;
  Values: TStringList;
  comp: TRefQuery;
begin
  Values := TStringList.Create;
  try
    comp := GetComponent(0) as TRefQuery;
    with comp do
    if (DataSource <> nil) and (DataSource.DataSet <> nil) then
    begin
      comp.DataSource.DataSet.GetFieldNames(Values);
      for I := 0 to Values.Count - 1 do
      with comp.DataSource.DataSet do
      if (Fields.Count > 0) and (FieldByName(Values[I]) is TIntegerField) or
         (FieldDefs.Find(Values[I]).DataType = ftInteger)  then
         Proc(Values[I]);
    end
    else
      proc(MASTER_VALUE);
  finally
    Values.Free;
  end;
end;

{ TNamesTypeProperty }

function TNamesTypeProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList];
end;

procedure TNamesTypeProperty.GetValues(Proc: TGetStrProc);
var
  comp: TPersistent;
  tr: TIBTransaction;
begin
  proc(NAMES_TYPE_ATTRIBUTES);

  comp := GetComponent(0);

  tr := nil;

  if comp is TRefQuery then
    tr := TRefQuery(comp).Transaction
  else if comp is TRefDialog then
    tr := TRefDialog(comp).Transaction
  else if comp is TRefEdit then
    tr := TRefEdit(comp).Transaction;

  if (tr <> nil) then
  with TIBQuery.Create(nil) do
  try
    Transaction := tr;
    SQL.Text := 'SELECT FIELD_NAME FROM OBJECT_NAME_TYPE';
    Open;
    while not Eof do
    begin
      proc(Fields[0].AsString);
      Next;
    end;
  finally
    Free;
  end;
end;

{ TDocTableNameProperty }

function TDocTableNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList];
end;

procedure TDocTableNameProperty.GetValues(Proc: TGetStrProc);
var
  comp: TPersistent;
  tr: TIBTransaction;
  s: string;
begin
  comp := GetComponent(0);

  tr := nil;

  s := 'WHERE IS_DETAIL = %d';

  if comp is TDocQuery then
  begin
    tr := TDocQuery(comp).Transaction;
    s := '';
  end
  else if comp is TDocDialog then
  begin
    tr := TDocDialog(comp).Transaction;
    s := Format(s, [0]);
  end
  else if comp is TDocEdit then
  begin
    tr := TDocEdit(comp).Transaction;
    s := Format(s, [0]);
  end
  else if comp is TDocItemDialog then
  begin
    tr := TDocItemDialog(comp).Transaction;
    s := Format(s, [1]);
  end
  else if comp is TDocItemEdit then
  begin
    tr := TDocItemEdit(comp).Transaction;
    s := Format(s, [1]);
  end
  else if comp is TDBDocItemEdit then
  begin
    tr := TDBDocItemEdit(comp).Transaction;
    s := Format(s, [1]);
  end;


  if tr <> nil then
  with TIBQuery.Create(nil) do
  try
    Transaction := tr;
    SQL.Text := Format('SELECT TABLE_NAME FROM DOC_TABLES %s', [s]);
    Open;
    while not Eof do
    begin
      proc(Fields[0].AsString);
      Next;
    end;
  finally
    Free;
  end;
end;

{ TSettingTableNameProperty }

function TSettingTableNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList];
end;

procedure TSettingTableNameProperty.GetValues(Proc: TGetStrProc);
var
  comp: TPersistent;
  tr: TIBTransaction;
begin
  comp := GetComponent(0);

  tr := nil;

  if comp is TSettingQuery then
    tr := TSettingQuery(comp).Transaction;

  if tr <> nil then
  with TIBQuery.Create(nil) do
  try
    Transaction := tr;
    SQL.Text := 'SELECT TABLE_NAME FROM SETTING';
    Open;
    while not Eof do
    begin
      proc(Fields[0].AsString);
      Next;
    end;
  finally
    Free;
  end;
end;

{ TRSDClassTableNameProperty }

function TRSDClassTableNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList];
end;

procedure TRSDClassTableNameProperty.GetValues(Proc: TGetStrProc);
var
  comp: TPersistent;
  tr: TIBTransaction;
begin
  comp := GetComponent(0);

  tr := nil;

  if comp is TRefQuery then
    tr := TRefQuery(comp).Transaction
  else if comp is TRefDialog then
    tr := TRefDialog(comp).Transaction
  else if comp is TRefEdit then
    tr := TRefEdit(comp).Transaction;

  if Assigned(tr) then
  with TIBQuery.Create(nil) do
  try
    Transaction := tr;
    SQL.Text := 'SELECT TABLE_NAME FROM CLASS';
    Open;
    while not Eof do
    begin
      proc(Fields[0].AsString);
      Next;
    end;
  finally
    Free;
  end;
end;

{ TRSDSubClassTableNameProperty }

function TRSDSubClassTableNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList];
end;

procedure TRSDSubClassTableNameProperty.GetValues(Proc: TGetStrProc);
var
  comp: TPersistent;
  tr: TIBTransaction;
  ClassTableName: string;
begin
  comp := GetComponent(0);

  tr := nil;

  if comp is TRefQuery then
  begin
    tr := TRefQuery(comp).Transaction;
    ClassTableName := TRefQuery(comp).ClassTableName;
  end
  else if comp is TRefDialog then
  begin
    tr := TRefDialog(comp).Transaction;
    ClassTableName := TRefDialog(comp).ClassTableName;
  end
  else if comp is TRefEdit then
  begin
    tr := TRefEdit(comp).Transaction;
    ClassTableName := TRefEdit(comp).ClassTableName;
  end;

  if Assigned(tr) then
  with TIBQuery.Create(nil) do
  try
    Transaction := tr;
    SQL.Text := 'SELECT'#13+
                '  C.TABLE_NAME'#13+
                'FROM'#13+
                '  CLASS_ALL_SUBMITTINGS(:CLASS_TABLE_NAME) CAS,'#13+
                '  CLASS C'#13+
                'WHERE'#13+
                '  C.CLASS_ID = CAS.CLASS_ID';
    ParamByName('CLASS_TABLE_NAME').AsString := ClassTableName;
    Open;
    while not Eof do
    begin
      proc(FieldByName('TABLE_NAME').AsString);
      Next;
    end;
  finally
    Free;
  end;
end;

{ TShortNameFieldProperty }

function TShortNameFieldProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList];
end;

procedure TShortNameFieldProperty.GetValues(Proc: TGetStrProc);
var
  comp: TDBRefEdit;
  I: integer;
begin
  comp := GetComponent(0) as TDBRefEdit;
  if assigned(comp.DataSource) and (comp.DataSource.DataSet <> nil) then
  with comp.DataSource.DataSet do
  for I := 0 to FieldDefs.Count - 1 do
    proc(FieldDefs[I].Name);
end;

{ TAllegroEventNamesProperty }

procedure TAllegroEventNamesProperty.Edit;
begin
  with TAllegroEventNamesEditor.Create(nil) do
  try
    EventNames := GetStrValue;
    if ShowModal = mrOK then
      SetStrValue(EventNames);
  finally
    Free;
  end;
end;

function TAllegroEventNamesProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

function TAllegroEventNamesProperty.GetValue: string;
begin
  result := GetStrValue;
end;

procedure TAllegroEventNamesProperty.SetValue(const val: string);
begin
  SetStrValue(val);
end;

{ TRubric_IDProperty }

procedure TRubric_IDProperty.Edit;
var
  comp: TPersistent;
  tr: TIBTransaction;
begin
  comp := GetComponent(0);

  tr := nil;

  if comp is TRefDialog then
    tr := TRefDialog(comp).Transaction
  else if comp is TRefEdit then
    tr := TRefEdit(comp).Transaction;

  if Assigned(tr) then
  with TRubricPropertyEditForm.Create(nil) do
  try
    RubricTreeGrid.Transaction := tr;
    RubricTreeGrid.Open(0);
    RubricTreeGrid.SelectedRubric_id := StrToIntDef(GetValue, -1);
    if ShowModal = mrOK then
      SetValue(IntToStr(RubricTreeGrid.SelectedRubric_id));
  finally
    Free;
  end;
end;

function TRubric_IDProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

procedure Register;
begin
  RegisterComponents('Allegro', [TRefQuery, TDocQuery, TSettingQuery]);
  RegisterPropertyEditor(TypeInfo(string), TRefQuery, 'ClassTableName', TClassTableNameProperty); {do not localize}
  RegisterPropertyEditor(TypeInfo(string), TRefQuery, 'DetailFieldName', TDetailFieldNameProperty); {do not localize}
  RegisterPropertyEditor(TypeInfo(string), TRefQuery, 'MasterFieldName', TMasterFieldNameProperty); {do not localize}
  RegisterPropertyEditor(TypeInfo(string), TRefQuery, 'NamesType', TNamesTypeProperty); {do not localize}
  RegisterPropertyEditor(TypeInfo(string), TDocQuery, 'TableName', TDocTableNameProperty); {do not localize}
  RegisterPropertyEditor(TypeInfo(string), TSettingQuery, 'TableName', TSettingTableNameProperty); {do not localize}

//  RegisterComponents('Allegro', [TAccTreeGrid, TClassTreeGrid]);

  RegisterComponents('Allegro', [TDCTreeGridEx]);
  RegisterComponents('Allegro', [TDBGridA]);
//  RegisterComponents('Allegro', [TDocDirTreeView]);
  RegisterComponents('Allegro',
    [TDocDirDialog, TAccountDialog, TRefDialog, TDocDialog, TDocItemDialog,
     TDocDirEdit, TDBDocDirEdit,
     TAccountEdit, TDBAccountEdit,
     TRefEdit, TDBRefEdit,
     TDocEdit, TDBDocEdit,
     TDocItemEdit, TDBDocItemEdit,
     TLayerComboBox, TDBLayerComboBox,
     TBalance,
     TAllegroEvents,
     TClassSelectDialog, TClassSelectEdit, TDBClassSelectEdit, TRubricTreeGrid]);

  RegisterComponents('Allegro', [TGoogleDistanceMatrix]);

  RegisterPropertyEditor(TypeInfo(string), TRefDialog, 'ClassTableName', TRSDClassTableNameProperty); {do not localize}
  RegisterPropertyEditor(TypeInfo(string), TRefDialog, 'SubClassTableName', TRSDSubClassTableNameProperty); {do not localize}
  RegisterPropertyEditor(TypeInfo(string), TRefDialog, 'NamesType', TNamesTypeProperty); {do not localize}
  RegisterPropertyEditor(TypeInfo(integer), TRefDialog, 'RootRubric_ID', TRubric_IDProperty); {do not localize}
  RegisterPropertyEditor(TypeInfo(string), TRefEdit, 'ClassTableName', TRSDClassTableNameProperty); {do not localize}
  RegisterPropertyEditor(TypeInfo(string), TRefEdit, 'SubClassTableName', TRSDSubClassTableNameProperty); {do not localize}
  RegisterPropertyEditor(TypeInfo(string), TRefEdit, 'NamesType', TNamesTypeProperty); {do not localize}
  RegisterPropertyEditor(TypeInfo(integer), TRefEdit, 'RootRubric_ID', TRubric_IDProperty); {do not localize}
  RegisterPropertyEditor(TypeInfo(string), TDBRefEdit, 'ShortNameField', TShortNameFieldProperty); {do not localize}
  RegisterPropertyEditor(TypeInfo(string), TDocDialog, 'DocTableName', TDocTableNameProperty); {do not localize}
  RegisterPropertyEditor(TypeInfo(string), TDocItemDialog, 'DocTableName', TDocTableNameProperty); {do not localize}
  RegisterPropertyEditor(TypeInfo(string), TDocEdit, 'DocTableName', TDocTableNameProperty); {do not localize}
  RegisterPropertyEditor(TypeInfo(string), TDocItemEdit, 'DocTableName', TDocTableNameProperty); {do not localize}
  RegisterPropertyEditor(TypeInfo(string), TAllegroEvents,'EventNames',TAllegroEventNamesProperty); //don't resource
end;

end.
