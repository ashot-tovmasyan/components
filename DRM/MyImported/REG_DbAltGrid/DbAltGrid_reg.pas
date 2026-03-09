unit DbAltGrid_reg;

interface

{$R DbAltGrid.dcr}
implementation

uses
  Classes
  ,dcdsgnstuff
// , dsgnintf
  ,TypInfo, dcGenReg, dbagrids, dagTmplt;

resourcestring
  res_ResFilesFilter = 'Файлы ресурсов (*.res)|*.res|Все файлы (*.*)|*.*';
  res_TxtFilesFilter = 'Текстовые файлы (*.txt)|*.txt|Все файлы (*.*)|*.*';

const
  HKEY_CURRENT_USER = Longint(-1);
  HKEY_LOCAL_MACHINE = Longint(-2);

type
//  TRegRootKeys = (HKEY_CURRENT_USER, HKEY_LOCAL_MACHINE);
  { TIBTableNameProperty}
  TRegistryRootKeyProperty = class(TIntegerProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure SetValue(const Value: string); override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

  TResFileNameEdit = class(TFileNameEdit)
    function  GetDefaultExtension : string; override;
    function  GetFilter : string; override;
  end;

  TTxtFileNameEdit = class(TFileNameEdit)
    function  GetDefaultExtension : string; override;
    function  GetFilter : string; override;
  end;

{ TRegistryRootKeyProperty }

function TRegistryRootKeyProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList];
end;

function TRegistryRootKeyProperty.GetValue: string;
begin
  if HKEY_CURRENT_USER = GetOrdValue then
    Result := 'HKEY_CURRENT_USER'
  else
    Result := 'HKEY_LOCAL_MACHINE';
end;

procedure TRegistryRootKeyProperty.GetValues(Proc: TGetStrProc);
begin
  Proc('HKEY_CURRENT_USER');
  Proc('HKEY_LOCAL_MACHINE');
end;

procedure TRegistryRootKeyProperty.SetValue(const Value: string);
begin
  if Value = 'HKEY_CURRENT_USER' then
    SetOrdValue(HKEY_CURRENT_USER)
  else
    SetOrdValue(HKEY_LOCAL_MACHINE);
end;

{ TResFileNameEdit }

function TResFileNameEdit.GetDefaultExtension: string;
begin
  result := 'res'; //don't resource
end;

function TResFileNameEdit.GetFilter: string;
begin
  result := res_ResFilesFilter;
end;

{ TTxtFileNameEdit }

function TTxtFileNameEdit.GetDefaultExtension: string;
begin
  result := 'txt'; //don't resource
end;

function TTxtFileNameEdit.GetFilter: string;
begin
  result := res_TxtFilesFilter;
end;

initialization
  RegisterComponents('QuasiData',
    [TDbAltGrid, TdagCalendar, TdagClock, TdagNumPad,
     TdagCalculator, TdagBoolean, TdagMemo, TdagRichMemo, TdagGraphic,
     TdagHyperLink, TdagParent, TdagBackup]);

  RegisterPropertyEditor(TypeInfo(string), TdagBackup, 'ResourceFileName', TResFileNameEdit); //don't resource
  RegisterPropertyEditor(TypeInfo(string), TdagBackup, 'TextFileName', TTxtFileNameEdit); //don't resource
  RegisterPropertyEditor(TypeInfo(Longint), TdagBackup, 'RegistryRootKey', TRegistryRootKeyProperty);
end.
