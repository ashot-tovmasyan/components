{*******************************************************}
{                                                       }
{         Delphi VCL Extensions (RX)                    }
{                                                       }
{         Copyright (c) 1998 Master-Bank                }
{                                                       }
{*******************************************************}

(********************** Added by Claudio F. Zwitkovits (CFZ) **************************
 Property DataSet <== Attach any bi-directional DataSet (TTable,TQuery,etc)
 Property DataSetClosed <== True/False If After Load Structure and/or Records, Close the attached DataSet
 Property KeyFieldNames <== String with the names of the fields from the primary key / Index key
 Property ApplyMode <== The mode do Apply the changes in original DataSet
          amNone = Not Apply
          amAppend = Allow ONLY insert records, and edit/delete this records inserted
          amMerge = Allow ALL (Insert,Edit,Delete) records
 Property ExactApply <== If True, the RowsAffected (Applied) EQUAL FRowsChanged
          If False, Apply Tolerance
 Property LoadStructure <== If True, is NOT needed define the fields in design time
          the JvMemoryData load the fields from the original dataset
 Property LoadRecords <== TRUE/FALSE  Auto-load records from the original dataset.
 Property SaveLoadState <== Return if loading or saving from/to other dataset.
 Events   BeforeApply, AfterApply <== in the calling to the ApplyChanges public method.
          BeforeApplyRecord, AfterApplyRecord <== in the calling to the SaveChanges internal methods.
 Methods  (Public) ApplyChanges and CancelChanges <== Save / Discard the changes into
          the original DataSet.
 Methods  (Public) IsLoading <== True/False. If the JvMemData is loading data from external dataset
          (LoadFromDataSet or CopyFromDataSet)
 Methods  (Public) IsSaving <== True/False If the JvMemData is saving data to external dataset
          (SaveToDataSet or ApplyChanges)
 Methods  (Public) IsInserted, IsUpdated, IsOriginal, IsDeleted
          return the status from the current record
 Methods  (Public) GetValues <== Obtain the values from list of Fields or Key Fields

 IMPORTANT : This component, add a hidden field, in the last position ( in FieldDefs
             And Fields Lists ) and save the STATUS of the current record
             (rsOriginal, rsInserted, rsUpdated), in the hidden field.
             Likewise, have a private List (FDeletedValues) with the primary key values
             from the Deleted records (rsDeleted).

Implementation : 2004/03/03
Revisions : 1st = 2004/09/19
            2nd = 2004/10/19
            3th = 2004/10/25
            4th = 2005/01/05
            5th = 2005/12/20
            
Comments and Bugs : cfzwit@yahoo.com.ar
***************************************************************************************)

unit RxMemDS;

{$I RX.INC}

interface

{$IFDEF RX_D3}

uses                                                 
  Windows, SysUtils, Classes, Controls, DB, {$IFDEF RX_D6} Variants, {$ELSE} RxVar,{$ENDIF} DBUtils;

{ TRxMemoryData }

type
  TPVariant = ^Variant;
  TApplyMode = (amNone, amAppend, amMerge);
  TRecordStatus = (rsOriginal, rsUpdated, rsInserted, rsDeleted);
  TApplyRecordEvent = procedure(Dataset: TDataset; RecStatus: TRecordStatus; FoundApply: Boolean) of object;
  TMemBlobData = AnsiString;
  TMemBlobArray = array[0..0] of TMemBlobData;
  PMemBlobArray = ^TMemBlobArray;
  TMemoryRecord = class;
  TLoadMode = (lmCopy, lmAppend);
  TSaveLoadState = (slsNone, slsLoading, slsSaving);
  TCompareRecords = function (Item1, Item2: TMemoryRecord): Integer of object;

  TRxMemoryData = class(TDataSet)
  private
    FSaveLoadState: TSaveLoadState;
    FRecordPos: Integer;
    FRecordSize: Integer;
    FBookmarkOfs: Integer;
    FBlobOfs: Integer;
    FRecBufSize: Integer;
    FOffsets: PWordArray;
    FLastID: Integer;
    FAutoInc: Longint;
    FActive: Boolean;
    FRecords: TList;
    FIndexList: TList;
    FCaseInsensitiveSort: Boolean;
    FDescendingSort: Boolean;
    FAutoIncField: TField;
    FSrcAutoIncField: TField;
    FDataSet: TDataSet;
    FDatasetClosed: Boolean;
    FLoadStructure: Boolean;
    FLoadRecords: Boolean;
    FKeyFieldNames: string;
    FApplyMode: TApplyMode;
    FExactApply: Boolean;
    FAutoIncAsInteger: Boolean;
    FRowsOriginal: Integer;
    FRowsChanged: Integer;
    FRowsAffected: Integer;
    FDeletedValues: TList;
    FStatusName: string;
    FBeforeApply: TDatasetNotifyEvent;
    FAfterApply: TDatasetNotifyEvent;
    FBeforeApplyRecord: TApplyRecordEvent;
    FAfterApplyRecord: TApplyRecordEvent;
    function AddRecord: TMemoryRecord;
    function InsertRecord(Index: Integer): TMemoryRecord;
    function FindRecordID(ID: Integer): TMemoryRecord;
    procedure CreateIndexList(const FieldNames: string);
    procedure FreeIndexList;
    procedure QuickSort(L, R: Integer; Compare: TCompareRecords);
    procedure Sort;
    function CalcRecordSize: Integer;
    function GetMemoryRecord(Index: Integer): TMemoryRecord;
    function GetCapacity: Integer;
    function RecordFilter: Boolean;
    procedure SetCapacity(Value: Integer);
    procedure ClearRecords;
    procedure InitBufferPointers(GetProps: Boolean);
    procedure FixReadOnlyFields(MakeReadOnly: boolean);
    procedure SetDataSet(ADataSet: TDataSet);
    procedure SetDatasetClosed(Value: Boolean);
    procedure SetLoadStructure(Value: Boolean);
    procedure SetLoadRecords(Value: Boolean);
    procedure SetApplyMode(Value: TApplyMode);
    procedure SetExactApply(Value: Boolean);
    procedure CheckStructure(UseAutoIncAsInteger: Boolean {$IFDEF RX_D4}= False{$ENDIF});
    procedure AddStatusField;
    procedure HideStatusField;
    function CopyFromDataset: Integer;
    procedure ClearChanges;
    procedure DoBeforeApply;
    procedure DoAfterApply;
    procedure DoBeforeApplyRecord(ADataset: TDataset; RS: TRecordStatus; Found: Boolean);
    procedure DoAfterApplyRecord(ADataset: TDataset; RS: TRecordStatus; Apply: Boolean);
  protected
    function FindFieldData(Buffer: Pointer; Field: TField): Pointer;
    function CompareFields(Data1, Data2: Pointer; FieldType: TFieldType;
                           CaseInsensitive: Boolean): Integer; virtual;
    procedure DataConvert(Field: TField; Source, Dest: Pointer; 
      					  ToNative: Boolean); {$IFDEF RX_D5} override; {$ENDIF}
    procedure AssignMemoryRecord(Rec: TMemoryRecord; Buffer: TRecordBuffer);
    function GetActiveRecBuf(var RecBuf: TRecordBuffer): Boolean; virtual;
    procedure InitFieldDefsFromFields;
    procedure RecordToBuffer(Rec: TMemoryRecord; Buffer: TRecordBuffer);
    procedure SetMemoryRecordData(Buffer: TRecordBuffer; Pos: Integer); virtual;
    procedure SetAutoIncFields(Buffer: TRecordBuffer); virtual;
    function CompareRecords(Item1, Item2: TMemoryRecord): Integer; virtual;
    function GetBlobData(Field: TField; Buffer: TRecordBuffer): TMemBlobData;
    procedure SetBlobData(Field: TField; Buffer: TRecordBuffer; Value: TMemBlobData);
    function AllocRecordBuffer: TRecordBuffer; override;
    procedure FreeRecordBuffer(var Buffer: TRecordBuffer); override;
{$IFNDEF RX_D5}
    function BCDToCurr(BCD: Pointer; var Curr: Currency): Boolean; override;
    function CurrToBCD(const Curr: Currency; BCD: Pointer; Precision,
                       Decimals: Integer): Boolean; override;
{$ENDIF}
    procedure InternalInitRecord(Buffer: TRecordBuffer); override;
    procedure ClearCalcFields(Buffer: TRecordBuffer); override;
    function GetRecord(Buffer: TRecordBuffer; GetMode: TGetMode;
                       DoCheck: Boolean): TGetResult; override;
    function GetRecordSize: Word; override;
    procedure SetFiltered(Value: Boolean); override;
    procedure SetOnFilterRecord(const Value: TFilterRecordEvent); override;
    procedure SetFieldData(Field: TField; Buffer: Pointer); override;
    procedure CloseBlob(Field: TField); override;
    procedure GetBookmarkData(Buffer: TRecordBuffer; Data: Pointer); override;
    function GetBookmarkFlag(Buffer: TRecordBuffer): TBookmarkFlag; override;
    procedure InternalGotoBookmark(Bookmark: TBookmarkPointerType); override;
    procedure InternalSetToRecord(Buffer: TRecordBuffer); override;
    procedure SetBookmarkFlag(Buffer: TRecordBuffer; Value: TBookmarkFlag); override;
    procedure SetBookmarkData(Buffer: TRecordBuffer; Data: Pointer); override;
    function GetIsIndexField(Field: TField): Boolean; override;
    procedure InternalFirst; override;
    procedure InternalLast; override;
    procedure InitRecord(Buffer: TRecordBuffer); override;
    procedure InternalAddRecord(Buffer: Pointer; Append: Boolean); override;
    procedure InternalDelete; override;
    procedure InternalPost; override;
    procedure InternalClose; override;
    procedure InternalHandleException; override;
    procedure InternalInitFieldDefs; override;
    procedure InternalOpen; override;
    procedure OpenCursor(InfoQuery: Boolean); override;
    function IsCursorOpen: Boolean; override;
    function GetRecordCount: Integer; override;
    function GetRecNo: Integer; override;
    procedure SetRecNo(Value: Integer); override;
    procedure DoAfterOpen; Override;
    property Records[Index: Integer]: TMemoryRecord read GetMemoryRecord;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function BookmarkValid(Bookmark: TBookmark): Boolean; override;
    function CompareBookmarks(Bookmark1, Bookmark2: TBookmark): Integer; override;
    function CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream; override;
    function GetFieldData(Field: TField; Buffer: Pointer): Boolean; override;
    function GetCurrentRecord(Buffer: TRecordBuffer): Boolean; override;
    function IsSequenced: Boolean; override;
    function Locate(const KeyFields: string; const KeyValues: Variant; Options: TLocateOptions): Boolean; override;
    {$IFDEF RX_D4}
    procedure SortOnFields(const FieldNames: string = '';
                           CaseInsensitive: Boolean = True; Descending: Boolean = False);
    {$ELSE}
    procedure SortOnFields(const FieldNames: string; CaseInsensitive, Descending: Boolean);
    {$ENDIF}
    procedure EmptyTable;
    procedure CopyStructure(Source: TDataSet; UseAutoIncAsInteger: Boolean{$IFDEF RX_D4} = False{$ENDIF});
    function LoadFromDataSet(Source: TDataSet; RecordCount: Integer; Mode: TLoadMode;
                             DisableAllControls: Boolean{$IFDEF RX_D4} = True{$ENDIF}): Integer;
    function SaveToDataSet(Dest: TDataSet; RecordCount: Integer; DisableAllControls: Boolean{$IFDEF RX_D4} = True{$ENDIF}): Integer;
    property SaveLoadState: TSaveLoadState read FSaveLoadState;
    function GetValues(FldNames: String{$IFDEF RX_D4} = ''{$ENDIF}): Variant;
    function FindDeleted(KeyValues: Variant): Integer;
    function IsDeleted(out Index: Integer): Boolean;
    function IsInserted: Boolean;
    function IsUpdated: Boolean;
    function IsOriginal: Boolean;
    procedure CancelChanges;
    function ApplyChanges: Boolean;
    function IsLoading: Boolean;
    function IsSaving: Boolean;
    property RowsOriginal: Integer read FRowsOriginal;
    property RowsChanged: Integer read FRowsChanged;
    property RowsAffected: Integer read FRowsAffected;
  published
    property Capacity: Integer read GetCapacity write SetCapacity default 0;
    property Active;
    property AutoCalcFields;
    property Filtered;
{$IFDEF RX_D4}
    property FieldDefs;
    property ObjectView default False;
{$ENDIF}
    property DataSet: TDataSet read FDataSet write SetDataSet;
    property DatasetClosed: Boolean read FDatasetClosed write SetDatasetClosed default True;
    property KeyFieldNames: string read FKeyFieldNames write FKeyFieldNames;
    property LoadStructure: Boolean read FLoadStructure write SetLoadStructure default False;
    property LoadRecords: Boolean read FLoadRecords write SetLoadRecords default False;
    property ApplyMode: TApplyMode read FApplyMode write SetApplyMode default amNone;
    property ExactApply: Boolean read FExactApply write SetExactApply default False;
    property AutoIncAsInteger: Boolean read FAutoIncAsInteger write FAutoIncAsInteger default False;
    property BeforeOpen;
    property AfterOpen;
    property BeforeClose;
    property AfterClose;
    property BeforeInsert;
    property AfterInsert;
    property BeforeEdit;
    property AfterEdit;
    property BeforePost;
    property AfterPost;
    property BeforeCancel;
    property AfterCancel;
    property BeforeDelete;
    property AfterDelete;
    property BeforeScroll;
    property AfterScroll;
    property OnCalcFields;
    property OnDeleteError;
    property OnEditError;
    property OnFilterRecord;
    property OnNewRecord;
    property OnPostError;
    property BeforeApply: TDatasetNotifyEvent Read FBeforeApply Write FBeforeApply;
    property AfterApply: TDatasetNotifyEvent Read FAfterApply Write FAfterApply;
    property BeforeApplyRecord: TApplyRecordEvent Read FBeforeApplyRecord Write FBeforeApplyRecord;
    property AfterApplyRecord: TApplyRecordEvent Read FAfterApplyRecord Write FAfterApplyRecord;
  end;

{ TMemBlobStream }

  TMemBlobStream = class(TStream)
  private
    FField: TBlobField;
    FDataSet: TRxMemoryData;
    FBuffer: TRecordBuffer;
    FMode: TBlobStreamMode;
    FOpened: Boolean;
    FModified: Boolean;
    FPosition: Longint;
    FCached: Boolean;
    function GetBlobSize: Longint;
    function GetBlobFromRecord(Field: TField): TMemBlobData;
  public
    constructor Create(Field: TBlobField; Mode: TBlobStreamMode);
    destructor Destroy; override;
    function Read(var Buffer; Count: Longint): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    function Seek(Offset: Longint; Origin: Word): Longint; override;
    procedure Truncate;
  end;

{ TMemoryRecord }

  TMemoryRecord = class(TPersistent)
  private
    FMemoryData: TRxMemoryData;
    FID: Integer;
    FData: Pointer;
    FBlobs: Pointer;
    function GetIndex: Integer;
    procedure SetMemoryData(Value: TRxMemoryData; UpdateParent: Boolean);
  protected
    procedure SetIndex(Value: Integer); virtual;
  public
    constructor Create(MemoryData: TRxMemoryData); virtual;
    constructor CreateEx(MemoryData: TRxMemoryData; UpdateParent: Boolean); virtual;
    destructor Destroy; override;
    property MemoryData: TRxMemoryData read FMemoryData;
    property ID: Integer read FID write FID;
    property Index: Integer read GetIndex write SetIndex;
    property Data: Pointer read FData;
  end;

{$ENDIF RX_D3}

implementation

{$IFDEF RX_D3}

uses Forms, {$IFDEF RX_D5} ComObj,Math, {$ELSE} MaxMin, {$ENDIF} DbConsts;

resourcestring
  SMemNoRecords = 'No data found';
{$IFNDEF RX_D4}
  SInvalidFields = 'No fields defined';
{$ENDIF}
  // 'Registro ya existente.';
  SRecordDuplicate = 'Record already exists.';
  // 'Registro no encontrado.';
  SRecordInexistent = 'Record not found.';
  // 'No se pudo agregar el registro.';
  SInsertError = 'Impossible append the record.';
  // 'No se pudo modificar el registro.';
  SUpdateError = 'Impossible modify the record.';
  // 'No se pudo eliminar el registro.';
  SDeleteError = 'Impossible erase the record.';

const
  ftBlobTypes = [ftBlob, ftMemo, ftGraphic, ftFmtMemo, ftParadoxOle,
    ftDBaseOle, ftTypedBinary {$IFDEF RX_D5}, ftOraBlob, ftOraClob {$ENDIF}];

  ftSupported = [ftString, ftSmallint, ftInteger, ftWord, ftBoolean, ftFloat,
    ftCurrency, ftDate, ftTime, ftDateTime, ftAutoInc, ftBCD, ftBytes,
    ftVarBytes {$IFDEF RX_D4}, ftADT, ftFixedChar, ftWideString,
    ftLargeint {$ENDIF} {$IFDEF RX_D5}, ftVariant, ftGuid {$ENDIF}] +
    ftBlobTypes;

  fkStoredFields = [fkData];

{$IFDEF RX_D5}
  GuidSize = 38;
{$ENDIF}

  STATUSNAME = 'C67F70Z90'; (* Magic *)

//=== { Utility routines } ====================================================

{$IFNDEF RX_D5}
procedure FreeAndNil(var Obj);
var
  Temp: TObject;
begin
  Temp := TObject(Obj);
  Pointer(Obj) := nil;
  Temp.Free;
end;
{$ENDIF}

function CalcFieldLen(FieldType: TFieldType; Size: Word): Word;
begin
  if not (FieldType in ftSupported) then
    Result := 0
  else if (FieldType in ftBlobTypes) then
    Result := SizeOf(Longint)
  else
  begin
    Result := Size;
    case FieldType of
      ftString:
        Inc(Result);
      ftSmallint:
        Result := SizeOf(SmallInt);
      ftInteger:
        Result := SizeOf(Longint);
      ftWord:
        Result := SizeOf(Word);
      ftBoolean:
        Result := SizeOf(WordBool);
      ftFloat:
        Result := SizeOf(Double);
      ftCurrency:
        Result := SizeOf(Double);
      ftBCD:
        Result := 34;
      ftDate, ftTime:
        Result := SizeOf(Longint);
      ftDateTime:
        Result := SizeOf(TDateTime);
      ftBytes:
        Result := Size;
      ftVarBytes:
        Result := Size + 2;
      ftAutoInc:
        Result := SizeOf(Longint);
{$IFDEF RX_D4}
      ftADT:
        Result := 0;
      ftFixedChar:
        Inc(Result);
      ftWideString:
        Result := (Result + 1) * 2;
      ftLargeint:
        Result := SizeOf(Int64);
{$ENDIF}
{$IFDEF RX_D5}
      ftVariant:
        Result := SizeOf(Variant);
      ftGuid:
        Result := GuidSize + 1;
{$ENDIF}
    end;
  end;
end;

procedure CalcDataSize(FieldDef: TFieldDef; var DataSize: Integer);
{$IFDEF RX_D4}
var
  I: Integer;
{$ENDIF}
begin
  with FieldDef do
  begin
    if (DataType in ftSupported - ftBlobTypes) then
      Inc(DataSize, CalcFieldLen(DataType, Size) + 1);
{$IFDEF RX_D4}
    for I := 0 to ChildDefs.Count - 1 do
      CalcDataSize(ChildDefs[I], DataSize);
{$ENDIF}
  end;
end;

procedure Error(const Msg: string);
begin
  DatabaseError(Msg);
end;

procedure ErrorFmt(const Msg: string; const Args: array of const);
begin
  DatabaseErrorFmt(Msg, Args);
end;

type
  TBookmarkData = Integer;
  PMemBookmarkInfo = ^TMemBookmarkInfo;
  TMemBookmarkInfo = record
    BookmarkData: TBookmarkData;
    BookmarkFlag: TBookmarkFlag;
  end;

{ TMemoryRecord }

constructor TMemoryRecord.Create(MemoryData: TRxMemoryData);
begin
  CreateEx(MemoryData, True);
end;

constructor TMemoryRecord.CreateEx(MemoryData: TRxMemoryData;
  UpdateParent: Boolean);
begin
  inherited Create;
  SetMemoryData(MemoryData, UpdateParent);
end;

destructor TMemoryRecord.Destroy;
begin
  SetMemoryData(nil, True);
  inherited Destroy;
end;

function TMemoryRecord.GetIndex: Integer;
begin
  if FMemoryData <> nil then
    Result := FMemoryData.FRecords.IndexOf(Self)
  else
    Result := -1;
end;

procedure TMemoryRecord.SetMemoryData(Value: TRxMemoryData; UpdateParent: Boolean);
var
  I: Integer;
  DataSize: Integer;
begin
  if FMemoryData <> Value then
  begin
    if FMemoryData <> nil then
    begin
      FMemoryData.FRecords.Remove(Self);
      if FMemoryData.BlobFieldCount > 0 then
        Finalize(PMemBlobArray(FBlobs)[0], FMemoryData.BlobFieldCount);
      ReallocMem(FBlobs, 0);
      ReallocMem(FData, 0);
      FMemoryData := nil;
    end;
    if Value <> nil then
    begin
      if UpdateParent then
      begin
        Value.FRecords.Add(Self);
        Inc(Value.FLastID);
        FID := Value.FLastID;
      end;
      FMemoryData := Value;
      if Value.BlobFieldCount > 0 then
      begin
        ReallocMem(FBlobs, Value.BlobFieldCount * SizeOf(Pointer));
        Initialize(PMemBlobArray(FBlobs)[0], Value.BlobFieldCount);
      end;
      DataSize := 0;
      for I := 0 to Value.FieldDefs.Count - 1 do
        CalcDataSize(Value.FieldDefs[I], DataSize);
      ReallocMem(FData, DataSize);
    end;
  end;
end;

procedure TMemoryRecord.SetIndex(Value: Integer);
var
  CurIndex: Integer;
begin
  CurIndex := GetIndex;
  if (CurIndex >= 0) and (CurIndex <> Value) then
    FMemoryData.FRecords.Move(CurIndex, Value);
end;

{ TRxMemoryData }

constructor TRxMemoryData.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FRecordPos := -1;
  FLastID := Low(Integer);
  FAutoInc := 1;
  FRecords := TList.Create;
  FStatusName    := STATUSNAME;
  FDeletedValues := TList.Create;
  FRowsOriginal  := 0;
  FRowsChanged   := 0;
  FRowsAffected  := 0;
  FSaveLoadState := slsNone;
  FDatasetClosed := True;
end;

destructor TRxMemoryData.Destroy;
Var
  I: Integer;
  PFValues : TPVariant;
begin
  if Active then
    Close;
  If Assigned(FDeletedValues) Then
  Begin
    If FDeletedValues.Count > 0 Then
      For I := 0 To (FDeletedValues.Count-1) Do
      Begin
        PFValues := FDeletedValues[I];
        Dispose(PFValues);
      End;
    FreeAndNil(FDeletedValues);
  End;
  FreeIndexList;
  ClearRecords;
  FRecords.Free;
  ReallocMem(FOffsets, 0);
  inherited Destroy;
end;

{ Records Management }

function TRxMemoryData.CompareFields(Data1, Data2: Pointer; FieldType: TFieldType;
  CaseInsensitive: Boolean): Integer;
begin
  Result := 0;
  case FieldType of
    ftString:
      if CaseInsensitive then
        Result := AnsiCompareText(PChar(Data1), PChar(Data2))
      else
        Result := AnsiCompareStr(PChar(Data1), PChar(Data2));
    ftSmallint:
      if SmallInt(Data1^) > SmallInt(Data2^) then
        Result := 1
      else if SmallInt(Data1^) < SmallInt(Data2^) then
        Result := -1;
    ftInteger, ftDate, ftTime, ftAutoInc:
      if Longint(Data1^) > Longint(Data2^) then
        Result := 1
      else if Longint(Data1^) < Longint(Data2^) then
        Result := -1;
    ftWord:
      if Word(Data1^) > Word(Data2^) then
        Result := 1
      else if Word(Data1^) < Word(Data2^) then
        Result := -1;
    ftBoolean:
      if WordBool(Data1^) and not WordBool(Data2^) then
        Result := 1
      else if not WordBool(Data1^) and WordBool(Data2^) then
        Result := -1;
    ftFloat, ftCurrency:
      if Double(Data1^) > Double(Data2^) then
        Result := 1
      else if Double(Data1^) < Double(Data2^) then
        Result := -1;
    ftDateTime:
      if TDateTime(Data1^) > TDateTime(Data2^) then
        Result := 1
      else if TDateTime(Data1^) < TDateTime(Data2^) then
        Result := -1;
{$IFDEF RX_D4}
    ftFixedChar:
      if CaseInsensitive then
        Result := AnsiCompareText(PChar(Data1), PChar(Data2))
      else
        Result := AnsiCompareStr(PChar(Data1), PChar(Data2));
    ftWideString:
      if CaseInsensitive then
        Result := AnsiCompareText(WideCharToString(PWideChar(Data1)),
          WideCharToString(PWideChar(Data2)))
      else
        Result := AnsiCompareStr(WideCharToString(PWideChar(Data1)),
          WideCharToString(PWideChar(Data2)));
    ftLargeint:
      if Int64(Data1^) > Int64(Data2^) then
        Result := 1
      else if Int64(Data1^) < Int64(Data2^) then
        Result := -1;
{$ENDIF}
{$IFDEF RX_D5}
    ftVariant:
      Result := 0;
    ftGuid:
      Result := AnsiCompareText(PChar(Data1), PChar(Data2));
{$ENDIF}
  end;
end;

function TRxMemoryData.GetCapacity: Integer;
begin
  if FRecords <> nil then
    Result := FRecords.Capacity
  else
    Result := 0;
end;

procedure TRxMemoryData.SetCapacity(Value: Integer);
begin
  if FRecords <> nil then
    FRecords.Capacity := Value;
end;

function TRxMemoryData.AddRecord: TMemoryRecord;
begin
  Result := TMemoryRecord.Create(Self);
end;

function TRxMemoryData.FindRecordID(ID: Integer): TMemoryRecord;
var
  I: Integer;
begin
  for I := 0 to FRecords.Count - 1 do
  begin
    Result := TMemoryRecord(FRecords[I]);
    if Result.ID = ID then
      Exit;
  end;
  Result := nil;
end;

function TRxMemoryData.InsertRecord(Index: Integer): TMemoryRecord;
begin
  Result := AddRecord;
  Result.Index := Index;
end;

function TRxMemoryData.GetMemoryRecord(Index: Integer): TMemoryRecord;
begin
  Result := TMemoryRecord(FRecords[Index]);
end;

{ Field Management }

procedure TRxMemoryData.InitFieldDefsFromFields;
var
  I: Integer;
  Offset: Word;
begin
  if FieldDefs.Count = 0 then
  begin
    for I := 0 to FieldCount - 1 do
    begin
      with Fields[I] do
        if (FieldKind in fkStoredFields) and not (DataType in ftSupported) then
          ErrorFmt(SUnknownFieldType, [DisplayName]);
    end;
    FreeIndexList;
  end;
  Offset := 0;
{$IFDEF RX_D4}
  inherited InitFieldDefsFromFields;
  { Calculate fields offsets }
  ReallocMem(FOffsets, FieldDefList.Count * SizeOf(Word));
  for I := 0 to FieldDefList.Count - 1 do
  begin
    FOffsets^[I] := Offset;
    with FieldDefList[I] do
    begin
      if (DataType in ftSupported - ftBlobTypes) then
        Inc(Offset, CalcFieldLen(DataType, Size) + 1);
    end;
  end;
{$ELSE}
  { Create FieldDefs from persistent fields if needed }
  if FieldDefs.Count = 0 then
    for I := 0 to FieldCount - 1 do
    begin
      with Fields[I] do
        if (FieldKind = fkData) then
          FieldDefs.Add(FieldName, DataType, Size, Required);
    end;
  { Calculate fields offsets }
  ReallocMem(FOffsets, FieldDefs.Count * SizeOf(Word));
  for I := 0 to FieldDefs.Count - 1 do
  begin
    FOffsets^[I] := Offset;
    with FieldDefs[I] do
    begin
      if (DataType in ftSupported - ftBlobTypes) then
        Inc(Offset, CalcFieldLen(DataType, Size) + 1);
    end;
  end;
{$ENDIF}
end;

function TRxMemoryData.FindFieldData(Buffer: Pointer; Field: TField): Pointer;
var
  Index: Integer;
  DataType: TFieldType;
begin
  Result := nil;
{$IFDEF RX_D4}
  Index := FieldDefList.IndexOf(Field.FullName);
{$ELSE}
  Index := FieldDefs.IndexOf(Field.FieldName);
{$ENDIF}
  if (Index >= 0) and (Buffer <> nil) Then
  begin
{$IFDEF RX_D4}
    DataType := FieldDefList[Index].DataType;
{$ELSE}
    DataType := FieldDefs[Index].DataType;
{$ENDIF}
    if DataType in ftSupported then
      if DataType in ftBlobTypes then
        Result := Pointer(GetBlobData(Field, Buffer))
      else
        Result := Pointer(Integer(Buffer) + FOffsets[Index]);
  end;
end;

{$IFNDEF RX_D5}

function TRxMemoryData.BCDToCurr(BCD: Pointer; var Curr: Currency): Boolean;
begin
  Move(BCD^, Curr, SizeOf(Currency));
  Result := True;
end;

function TRxMemoryData.CurrToBCD(const Curr: Currency; BCD: Pointer; Precision,
  Decimals: Integer): Boolean;
begin
  Move(Curr, BCD^, SizeOf(Currency));
  Result := True;
end;

{$ENDIF RX_D5}

{ Buffer Manipulation }

function TRxMemoryData.CalcRecordSize: Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to FieldDefs.Count - 1 do
    CalcDataSize(FieldDefs[I], Result);
end;

procedure TRxMemoryData.InitBufferPointers(GetProps: Boolean);
begin
  if GetProps then
    FRecordSize := CalcRecordSize;
  FBookmarkOfs := FRecordSize + CalcFieldsSize;
  FBlobOfs := FBookmarkOfs + SizeOf(TMemBookmarkInfo);
  FRecBufSize := FBlobOfs + BlobFieldCount * SizeOf(Pointer);
end;

procedure TRxMemoryData.ClearRecords;
begin
  while FRecords.Count > 0 do
    TObject(FRecords.Last).Free;
  FLastID := Low(Integer);
  FRecordPos := -1;
end;

function TRxMemoryData.AllocRecordBuffer: TRecordBuffer;
begin
{$IFDEF RX_D12}
  Result := AllocMem(FRecBufSize);
{$ELSE}
  Result := StrAlloc(FRecBufSize);
  if BlobFieldCount > 0 then
    Initialize(PMemBlobArray(Result + FBlobOfs)[0], BlobFieldCount);
{$ENDIF}
end;

procedure TRxMemoryData.FreeRecordBuffer(var Buffer: TRecordBuffer);
begin
{$IFDEF RX_D12}
  FreeMem(Buffer);
{$ELSE}
  if BlobFieldCount > 0 then
    Finalize(PMemBlobArray(Buffer + FBlobOfs)[0], BlobFieldCount);
  StrDispose(Buffer);
{$ENDIF}
  Buffer := nil;
end;

procedure TRxMemoryData.ClearCalcFields(Buffer: TRecordBuffer);
begin
  FillChar(Buffer[FRecordSize], CalcFieldsSize, 0);
end;

procedure TRxMemoryData.InternalInitRecord(Buffer: TRecordBuffer);
var
  I: Integer;
begin
  FillChar(Buffer^, FBlobOfs, 0);
  for I := 0 to BlobFieldCount - 1 do
    PMemBlobArray(Buffer + FBlobOfs)[I] := '';
end;

procedure TRxMemoryData.InitRecord(Buffer: TRecordBuffer);
begin
  inherited InitRecord(Buffer);
  with PMemBookmarkInfo(Buffer + FBookmarkOfs)^ do
  begin
    BookmarkData := Low(Integer);
    BookmarkFlag := bfInserted;
  end;
end;

function TRxMemoryData.GetCurrentRecord(Buffer: TRecordBuffer): Boolean;
begin
  Result := False;
  if not IsEmpty and (GetBookmarkFlag(ActiveBuffer) = bfCurrent) then
  begin
    UpdateCursorPos;
    if (FRecordPos >= 0) and (FRecordPos < RecordCount) then
    begin
      Move(Records[FRecordPos].Data^, Buffer^, FRecordSize);
      Result := True;
    end;
  end;
end;

procedure TRxMemoryData.RecordToBuffer(Rec: TMemoryRecord; Buffer: TRecordBuffer);
var
  I: Integer;
begin
  Move(Rec.Data^, Buffer^, FRecordSize);
  with PMemBookmarkInfo(Buffer + FBookmarkOfs)^ do
  begin
    BookmarkData := Rec.ID;
    BookmarkFlag := bfCurrent;
  end;
  for I := 0 to BlobFieldCount - 1 do
    PMemBlobArray(Buffer + FBlobOfs)[I] := PMemBlobArray(Rec.FBlobs)[I];
  GetCalcFields(Buffer);
end;

function TRxMemoryData.GetRecord(Buffer: TRecordBuffer; GetMode: TGetMode;
  DoCheck: Boolean): TGetResult;
var
  Accept: Boolean;
begin
  Result := grOk;
  Accept := True;
  case GetMode of
    gmPrior:
      if FRecordPos <= 0 then
      begin
        Result := grBOF;
        FRecordPos := -1;
      end
      else
      begin
        repeat
          Dec(FRecordPos);
          if Filtered then
            Accept := RecordFilter;
        until Accept or (FRecordPos < 0);
        if not Accept then
        begin
          Result := grBOF;
          FRecordPos := -1;
        end;
      end;
    gmCurrent:
      if (FRecordPos < 0) or (FRecordPos >= RecordCount) then
        Result := grError
      else if Filtered then
      begin
        if not RecordFilter then
          Result := grError;
      end;
    gmNext:
      if FRecordPos >= RecordCount - 1 then
        Result := grEOF
      else
      begin
        repeat
          Inc(FRecordPos);
          if Filtered then
            Accept := RecordFilter;
        until Accept or (FRecordPos > RecordCount - 1);
        if not Accept then
        begin
          Result := grEOF;
          FRecordPos := RecordCount - 1;
        end;
      end;
  end;
  if Result = grOk then
    RecordToBuffer(Records[FRecordPos], Buffer)
  else if (Result = grError) and DoCheck then
    Error(SMemNoRecords);
end;

function TRxMemoryData.GetRecordSize: Word;
begin
  Result := FRecordSize;
end;

function TRxMemoryData.GetActiveRecBuf(var RecBuf: TRecordBuffer): Boolean;
begin
  case State of
    dsBrowse:
      if IsEmpty then
        RecBuf := nil
      else
        RecBuf := TRecordBuffer(ActiveBuffer);
    dsEdit, dsInsert:
      RecBuf := TRecordBuffer(ActiveBuffer);
    dsCalcFields:
      RecBuf := TRecordBuffer(CalcBuffer);
    dsFilter:
      RecBuf := TRecordBuffer(TempBuffer);
    else
      RecBuf := nil;
  end;
  Result := RecBuf <> nil;
end;

function TRxMemoryData.GetFieldData(Field: TField; Buffer: Pointer): Boolean;
var
  RecBuf, Data: TRecordBuffer;
{$IFDEF RX_D5}
  VarData: Variant;
{$ENDIF}
begin
  Result := False;
  if not GetActiveRecBuf(RecBuf) then
    Exit;
  if Field.FieldNo > 0 then
  begin
    Data := FindFieldData(RecBuf, Field);
    if Data <> nil then
    begin
      if Field is TBlobField then
        Result := Data <> nil
      else
        Result := Byte(Data[0]) <> 0;
      Inc(Data);
      if Field.DataType in [ftString {$IFDEF RX_D4}, ftFixedChar,
        ftWideString {$ENDIF} {$IFDEF RX_D5}, ftGuid {$ENDIF}] then
        Result := Result and (Byte(Data[0]) <> 0);
      if Result and (Buffer <> nil) then
			{$IFDEF RX_D5}
        if Field.DataType = ftVariant then
        begin
          VarData := PVariant(Data)^;
          PVariant(Buffer)^ := VarData;
        end
        else
			{$ENDIF}
        Move(Data^, Buffer^, CalcFieldLen(Field.DataType, Field.Size));
    end;
  end
  else if State in [dsBrowse, dsEdit, dsInsert, dsCalcFields] then
  begin
    Inc(RecBuf, FRecordSize + Field.Offset);
    Result := Byte(RecBuf[0]) <> 0;
    if Result and (Buffer <> nil) then
      Move(RecBuf[1], Buffer^, Field.DataSize);
  end;
end;

procedure TRxMemoryData.SetFieldData(Field: TField; Buffer: Pointer);
var
  RecBuf, Data: TRecordBuffer;
{$IFDEF RX_D5}
  VarData: Variant;
{$ENDIF}
begin
  if not (State in dsWriteModes) then
    Error(SNotEditing);
  GetActiveRecBuf(RecBuf);
  with Field do
  begin
    if FieldNo > 0 then
    begin
      if State in [dsCalcFields, dsFilter] then
        Error(SNotEditing);
      if ReadOnly and not (State in [dsSetKey, dsFilter]) then
        ErrorFmt(SFieldReadOnly, [DisplayName]);
      Validate(Buffer);
      if FieldKind <> fkInternalCalc then
      begin
        Data := FindFieldData(RecBuf, Field);
        if Data <> nil then
        begin
				{$IFDEF RX_D5}
          if DataType = ftVariant then
          begin
            if Buffer <> nil then
              VarData := PVariant(Buffer)^
            else
              VarData := EmptyParam;
            Byte(Data[0]) := Ord((Buffer <> nil) and not
              (VarIsNull(VarData) or VarIsEmpty(VarData)));
            if Byte(Data[0]) <> 0 then
            begin
              Inc(Data);
              PVariant(Data)^ := VarData;
            end
            else
              FillChar(Data^, CalcFieldLen(DataType, Size), 0);
          end
          else
				{$ENDIF}
          begin
            Byte(Data[0]) := Ord(Buffer <> nil);
            Inc(Data);
            if Buffer <> nil then
              Move(Buffer^, Data^, CalcFieldLen(DataType, Size))
            else
              FillChar(Data^, CalcFieldLen(DataType, Size), 0);
          end;
        end;
      end;
    end
    else {fkCalculated, fkLookup}
    begin
      Inc(RecBuf, FRecordSize + Offset);
      Byte(RecBuf[0]) := Ord(Buffer <> nil);
      if Byte(RecBuf[0]) <> 0 then
        Move(Buffer^, RecBuf[1], DataSize);
    end;
    if not (State in [dsCalcFields, dsFilter, dsNewValue]) then
      DataEvent(deFieldChange, Longint(Field));
  end;
end;

{ Filter }

procedure TRxMemoryData.SetFiltered(Value: Boolean);
begin
  if Active then
  begin
    CheckBrowseMode;
    if Filtered <> Value then
      inherited SetFiltered(Value);
    First;
  end
  else
    inherited SetFiltered(Value);
end;

procedure TRxMemoryData.SetOnFilterRecord(const Value: TFilterRecordEvent);
begin
  if Active then
  begin
    CheckBrowseMode;
    inherited SetOnFilterRecord(Value);
    if Filtered then
      First;
  end
  else
    inherited SetOnFilterRecord(Value);
end;

function TRxMemoryData.RecordFilter: Boolean;
var
  SaveState: TDataSetState;
begin
  Result := True;
  if Assigned(OnFilterRecord) then
  begin
    if (FRecordPos >= 0) and (FRecordPos < RecordCount) then
    begin
      SaveState := SetTempState(dsFilter);
      try
        RecordToBuffer(Records[FRecordPos], TRecordBuffer(TempBuffer));
        OnFilterRecord(Self, Result);
      except
        Application.HandleException(Self);
      end;
      RestoreState(SaveState);
    end
    else
      Result := False;
  end;
end;

{ Blobs }

function TRxMemoryData.GetBlobData(Field: TField; Buffer: TRecordBuffer): TMemBlobData;
begin
  Result := PMemBlobArray(Buffer + FBlobOfs)[Field.Offset];
end;

procedure TRxMemoryData.SetBlobData(Field: TField; Buffer: TRecordBuffer;
  Value: TMemBlobData);
begin
  if (Buffer = TRecordBuffer(ActiveBuffer)) then
  begin
    if State = dsFilter then
      Error(SNotEditing);
    PMemBlobArray(Buffer + FBlobOfs)[Field.Offset] := Value;
  end;
end;

procedure TRxMemoryData.CloseBlob(Field: TField);
begin
  if (FRecordPos >= 0) and (FRecordPos < FRecords.Count) and (State = dsEdit) then
    PMemBlobArray(ActiveBuffer + FBlobOfs)[Field.Offset] :=
    PMemBlobArray(Records[FRecordPos].FBlobs)[Field.Offset]
  else
    PMemBlobArray(ActiveBuffer + FBlobOfs)[Field.Offset] := '';
end;

function TRxMemoryData.CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream;
begin
  Result := TMemBlobStream.Create(Field as TBlobField, Mode);
end;

{ Bookmarks }

function TRxMemoryData.BookmarkValid(Bookmark: TBookmark): Boolean;
begin
  Result := (Bookmark <> nil) and FActive and
    (TBookmarkData(PInteger(Bookmark)^) > Low(Integer)) and
    (TBookmarkData(PInteger(Bookmark)^) <= FLastID);
end;

function TRxMemoryData.CompareBookmarks(Bookmark1, Bookmark2: TBookmark): Integer;
begin
  if (Bookmark1 = nil) and (Bookmark2 = nil) then
    Result := 0
  else if (Bookmark1 <> nil) and (Bookmark2 = nil) then
    Result := 1
  else if (Bookmark1 = nil) and (Bookmark2 <> nil) then
    Result := -1
  else if TBookmarkData(PInteger(Bookmark1)^) > TBookmarkData(PInteger(Bookmark2)^) then
    Result := 1
  else if TBookmarkData(PInteger(Bookmark1)^) < TBookmarkData(PInteger(Bookmark2)^) then
    Result := -1
  else
    Result := 0;
end;

procedure TRxMemoryData.GetBookmarkData(Buffer: TRecordBuffer; Data: Pointer);
begin
  Move(PMemBookmarkInfo(Buffer + FBookmarkOfs)^.BookmarkData, Data^,
    SizeOf(TBookmarkData));
end;

procedure TRxMemoryData.SetBookmarkData(Buffer: TRecordBuffer; Data: Pointer);
begin
  Move(Data^, PMemBookmarkInfo(Buffer + FBookmarkOfs)^.BookmarkData,
    SizeOf(TBookmarkData));
end;

function TRxMemoryData.GetBookmarkFlag(Buffer: TRecordBuffer): TBookmarkFlag;
begin
  Result := PMemBookmarkInfo(Buffer + FBookmarkOfs)^.BookmarkFlag;
end;

procedure TRxMemoryData.SetBookmarkFlag(Buffer: TRecordBuffer; Value: TBookmarkFlag);
begin
  PMemBookmarkInfo(Buffer + FBookmarkOfs)^.BookmarkFlag := Value;
end;

procedure TRxMemoryData.InternalGotoBookmark(Bookmark: TBookmarkPointerType);
var
  Rec: TMemoryRecord;
  SavePos: Integer;
  Accept: Boolean;
begin
  Rec := FindRecordID(TBookmarkData(Bookmark^));
  if Rec <> nil then
  begin
    Accept := True;
    SavePos := FRecordPos;
    try
      FRecordPos := Rec.Index;
      if Filtered then
        Accept := RecordFilter;
    finally
      if not Accept then
        FRecordPos := SavePos;
    end;
  end;
end;

{ Navigation }

procedure TRxMemoryData.InternalSetToRecord(Buffer: TRecordBuffer);
begin
  InternalGotoBookmark(@PMemBookmarkInfo(Buffer + FBookmarkOfs)^.BookmarkData);
end;

procedure TRxMemoryData.InternalFirst;
begin
  FRecordPos := -1;
end;

procedure TRxMemoryData.InternalLast;
begin
  FRecordPos := FRecords.Count;
end;

{ Data Manipulation }

procedure TRxMemoryData.DataConvert(Field: TField; Source, Dest: Pointer; ToNative: Boolean);
begin
  {$IFDEF RX_D4}
  if Field.DataType = ftWideString then
  begin
    if ToNative then
    begin
      Word(Dest^) := Length(PWideString(Source)^) * 2;
      Move(PWideChar(Source^)^, (PWideChar(Dest) + 1)^, Word(Dest^));
    end
    else
      SetString(WideString(Dest^), PWideChar(PAnsiChar(Source) + 2), Word(Source^) div 2);
  end
  {$ENDIF}
  {$IFDEF RX_D5}
  else
    inherited DataConvert(Field, Source, Dest, ToNative);
  {$ENDIF}
end;

procedure TRxMemoryData.AssignMemoryRecord(Rec: TMemoryRecord; Buffer: TRecordBuffer);
var
  I: Integer;
begin
  Move(Buffer^, Rec.Data^, FRecordSize);
  for I := 0 to BlobFieldCount - 1 do
    PMemBlobArray(Rec.FBlobs)[I] := PMemBlobArray(Buffer + FBlobOfs)[I];
end;

procedure TRxMemoryData.SetMemoryRecordData(Buffer: TRecordBuffer; Pos: Integer);
var
  Rec: TMemoryRecord;
begin
  if State = dsFilter then
    Error(SNotEditing);
  Rec := Records[Pos];
  AssignMemoryRecord(Rec, Buffer);
end;

procedure TRxMemoryData.SetAutoIncFields(Buffer: TRecordBuffer);
var
  I, Count: Integer;
  Data: TRecordBuffer;
begin
  Count := 0;
  for I := 0 to FieldCount - 1 do
    if (Fields[I].FieldKind in fkStoredFields) and 
       (Fields[I].DataType = ftAutoInc) then
    begin
      Data := FindFieldData(Buffer, Fields[I]);
      if Data <> nil then
      begin
        Byte(Data[0]) := Ord(True);
        Inc(Data);
        Move(FAutoInc, Data^, SizeOf(Longint));
        Inc(Count);
      end;
    end;
  if Count > 0 then
    Inc(FAutoInc);
end;

procedure TRxMemoryData.InternalAddRecord(Buffer: Pointer; Append: Boolean);
var
  RecPos: Integer;
  Rec: TMemoryRecord;
begin
  if Append then
  begin
    Rec := AddRecord;
    FRecordPos := FRecords.Count - 1;
  end
  else
  begin
    if FRecordPos = -1 then
      RecPos := 0
    else
      RecPos := FRecordPos;
    Rec := InsertRecord(RecPos);
    FRecordPos := RecPos;
  end;
  SetAutoIncFields(Buffer);
  SetMemoryRecordData(Buffer, Rec.Index);
end;

procedure TRxMemoryData.InternalDelete;
var
  Accept: Boolean;
  Status : TRecordStatus;
  PFValues : TPVariant;
begin
    // Disable warnings
  Status := rsOriginal;
  PFValues := NIL;
  If FApplyMode <> amNone Then
  begin
    Status := TRecordStatus(FieldByName(FStatusName).AsInteger);
    If Status <> rsInserted Then
    begin
      If FApplyMode = amAppend Then
      begin
        Cancel;
        Exit;
      End
      Else
      begin
        New(PFValues);
        PFValues^ := GetValues{$IFNDEF RX_D4}(''){$ENDIF};
      End;
    End;
  End;

  Records[FRecordPos].Free;
  if FRecordPos >= FRecords.Count then
    Dec(FRecordPos);
  Accept := True;
  repeat
    if Filtered then
      Accept := RecordFilter;
    if not Accept then
      Dec(FRecordPos);
  until Accept or (FRecordPos < 0);
  if FRecords.Count = 0 then
    FLastID := Low(Integer);

	if FApplyMode <> amNone then
  begin
	  if Status = rsInserted then
	    Dec(FRowsChanged)
	  else
	    FDeletedValues.Add(PFValues);
	  if Status = rsOriginal then
	    Inc(FRowsChanged);
	end;
end;

procedure TRxMemoryData.InternalPost;
var
  RecPos: Integer;
  Index : Integer;
  Status : TRecordStatus;
  NewChange : Boolean;
begin
  {$IFDEF RX_D6}
  inherited InternalPost;
  {$ENDIF RX_D6}
  
  NewChange := False;
  If (FApplyMode <> amNone) And Not IsLoading Then
  begin
    Status := TRecordStatus(FieldByName(FStatusName).AsInteger);
    (* If (State = dsEdit) And (Status In [rsInserted,rsUpdated]) Then NewChange := False; *)
    If (State = dsEdit) And (Status = rsOriginal) Then
    begin
      If FApplyMode = amAppend Then
      begin
	      Cancel;
	      Exit;
      End
      Else
      begin
        NewChange := True;
        FieldByName(FStatusName).AsInteger := Integer(rsUpdated);
      End;
    End;
    If State = dsInsert Then
    begin
      If IsDeleted(Index) Then
      begin
        FDeletedValues.Delete(Index);
        If FApplyMode = amAppend Then
          FieldByName(FStatusName).AsInteger := Integer(rsInserted)
        Else
          FieldByName(FStatusName).AsInteger := Integer(rsUpdated);
      End
      Else
      begin
        NewChange := True;
        FieldByName(FStatusName).AsInteger := Integer(rsInserted);
      End;
    End;
  End;

  if State = dsEdit then
    SetMemoryRecordData(TRecordBuffer(ActiveBuffer), FRecordPos)
  else
  begin
    if State in [dsInsert] then
      SetAutoIncFields(TRecordBuffer(ActiveBuffer));
    if FRecordPos >= FRecords.Count then
    begin
      SetMemoryRecordData(TRecordBuffer(ActiveBuffer), AddRecord.Index);
      FRecordPos := FRecords.Count - 1;
    end
    else
    begin
      if FRecordPos = -1 then
        RecPos := 0
      else
        RecPos := FRecordPos;
      SetMemoryRecordData(TRecordBuffer(ActiveBuffer), InsertRecord(RecPos).Index);
      FRecordPos := RecPos;
    end;
  end;

	if NewChange Then
	  Inc(FRowsChanged)
end;

procedure TRxMemoryData.OpenCursor(InfoQuery: Boolean);
begin
  try
    if FDataSet <> nil then
    begin
      if FLoadStructure then
        CopyStructure(FDataSet,FAutoIncAsInteger)
      else if FApplyMode <> amNone Then
      begin
        AddStatusField;
        HideStatusField;
      end;
    end;
  except
    SysUtils.Abort;
    Exit;
  end;

  if not InfoQuery then
  begin
    if FieldCount > 0 then
      FieldDefs.Clear;
    InitFieldDefsFromFields;
  end;
  FActive := True;
  inherited OpenCursor(InfoQuery);
end;

procedure TRxMemoryData.InternalOpen;
begin
  BookmarkSize := SizeOf(TBookmarkData);
{$IFDEF RX_D4}
  if DefaultFields then
    CreateFields;
{$ELSE}
  if DefaultFields then
    Error(SInvalidFields);
{$ENDIF}
  BindFields(True);
  InitBufferPointers(True);
  InternalFirst;
end;

procedure TRxMemoryData.DoAfterOpen;
Begin
  if (FDataSet <> nil) and FLoadRecords then
  begin
    if not FDataSet.Active then
      FDataSet.Open;
    FRowsOriginal := CopyFromDataset;
    if FRowsOriginal > 0 then
    begin
      SortOnFields({$IFNDEF RX_D4}'',True,False{$ENDIF});
      if FApplyMode = amAppend then
        Last
      else
        First;
    end;
    if FDataset.Active And FDatasetClosed Then
      FDataset.Close;
  end
  Else If Not IsEmpty Then
    SortOnFields({$IFNDEF RX_D4}'',True,False{$ENDIF});
  Inherited DoAfterOpen;
End;

procedure TRxMemoryData.InternalClose;
begin
  ClearRecords;
  FAutoInc := 1;
  BindFields(False);
{$IFDEF RX_D4}
  if DefaultFields then
    DestroyFields;
{$ENDIF}
  FreeIndexList;
  FActive := False;
end;

procedure TRxMemoryData.InternalHandleException;
begin
  Application.HandleException(Self);
end;

procedure TRxMemoryData.InternalInitFieldDefs;
begin
  // InitFieldDefsFromFields
end;

function TRxMemoryData.IsCursorOpen: Boolean;
begin
  Result := FActive;
end;

{ Informational }

function TRxMemoryData.GetRecordCount: Integer;
begin
  Result := FRecords.Count;
end;

function TRxMemoryData.GetRecNo: Integer;
begin
  CheckActive;
  UpdateCursorPos;
  if (FRecordPos = -1) and (RecordCount > 0) then
    Result := 1
  else
    Result := FRecordPos + 1;
end;

procedure TRxMemoryData.SetRecNo(Value: Integer);
begin
  if (Value > 0) and (Value <= FRecords.Count) then
  begin
    FRecordPos := Value - 1;
    Resync([]);
  end;
end;

function TRxMemoryData.IsSequenced: Boolean;
begin
  Result := not Filtered;
end;

function TRxMemoryData.Locate(const KeyFields: string;
  const KeyValues: Variant; Options: TLocateOptions): Boolean;
begin
  DoBeforeScroll;
  Result := DataSetLocateThrough(Self, KeyFields, KeyValues, Options);
  if Result then
  begin
    DataEvent(deDataSetChange, 0);
    DoAfterScroll;
  end;
end;

{ Table Manipulation }

procedure TRxMemoryData.EmptyTable;
begin
  if Active then
  begin
    CheckBrowseMode;
    ClearRecords;
    ClearBuffers;
    DataEvent(deDataSetChange, 0);
  end;
end;

procedure TRxMemoryData.AddStatusField;
begin
  // Check if FieldStatus not exists in FieldDefs
	If (FieldDefs.Count > 0) And Not(FieldDefs[FieldDefs.Count-1].Name = FStatusName) Then
  	FieldDefs.Add(FStatusName, ftSmallint, 0, False);
end;

procedure TRxMemoryData.HideStatusField;
begin
  // Check if FieldStatus already exists in FieldDefs
  If (FieldDefs.Count > 0) And (FieldDefs[FieldDefs.Count-1].Name = FStatusName) Then
  Begin
    {$IFDEF RX_D4}
    FieldDefs[FieldDefs.Count-1].Attributes := [faHiddenCol]; // Hide in FieldDefs
    {$ENDIF}
    // Check if FieldStatus not exists in Fields
    If Not(Fields[FieldCount-1].FieldName = FStatusName) Then
      FieldDefs[FieldDefs.Count-1].CreateField(Self);
    Fields[FieldCount-1].Visible := False; // Hide in Fields
  End;
end;

procedure TRxMemoryData.CheckStructure(UseAutoIncAsInteger: boolean);
{$IFNDEF RX_D4}
var I: Integer;
{$ENDIF}
  procedure CheckDataTypes(FieldDefs: TFieldDefs);
  var
    J: Integer;
  begin
    for J := FieldDefs.Count - 1 downto 0 do
    begin
      {$IFDEF RX_D4}
      if (FieldDefs.Items[J].DataType = ftAutoInc) and UseAutoIncAsInteger then
        FieldDefs.Items[J].DataType := ftInteger;
      {$ENDIF}
      if not (FieldDefs.Items[J].DataType in ftSupported) then
        FieldDefs.Items[J].Free
      {$IFDEF RX_D4}
      else
        CheckDataTypes(FieldDefs[J].ChildDefs);
      {$ENDIF}
    end;
  end;
begin
  CheckDataTypes(FieldDefs);
  {$IFDEF RX_D4}
  CreateFields;
  {$ELSE}
  for I := 0 to FieldDefs.Count - 1 do
    if (csDesigning in ComponentState) and (Owner <> nil) then
      FieldDefs.Items[I].CreateField(Owner)
    else
      FieldDefs.Items[I].CreateField(Self);
  {$ENDIF}
end;

procedure TRxMemoryData.SetDataSet(ADataSet: TDataSet);
begin
  FDataSet := ADataSet;
end;

procedure TRxMemoryData.SetDatasetClosed(Value: Boolean);
begin
  if (csDesigning in ComponentState) and (FDataSet = nil) then
    FDatasetClosed := True
  else
    FDatasetClosed := Value;
end;

procedure TRxMemoryData.SetLoadStructure(Value: Boolean);
begin
  if (csDesigning in ComponentState) and (FDataSet = nil) then
    FLoadStructure := False
  else
    FLoadStructure := Value;
end;

procedure TRxMemoryData.SetLoadRecords(Value: Boolean);
begin
  if (csDesigning in ComponentState) and (FDataSet = nil) then
    FLoadRecords := False
  else
    FLoadRecords := Value;
end;

procedure TRxMemoryData.SetApplyMode(Value: TApplyMode);
begin
  if (csDesigning in ComponentState) and (FDataSet = nil) then
    FApplyMode := amNone
  else
    FApplyMode := Value;
end;

procedure TRxMemoryData.SetExactApply(Value: Boolean);
begin
  if (csDesigning in ComponentState) and (FDataSet = nil) then
    FExactApply := False
  else
    FExactApply := Value;
end;

procedure TRxMemoryData.FixReadOnlyFields(MakeReadOnly: boolean);
var
  i: integer;
begin
  if MakeReadOnly then
    for i := 0 to FieldCount - 1 do
      Fields[i].ReadOnly := (Fields[i].Tag = 1)
  else
    for i := 0 to FieldCount - 1 do
    begin
      Fields[i].Tag := Ord(Fields[i].ReadOnly);
      Fields[i].ReadOnly := false;
      if Fields[i].DataType = ftAutoInc then
        FAutoIncField := Fields[i];
    end;
end;

procedure TRxMemoryData.CopyStructure(Source: TDataSet;  UseAutoIncAsInteger: boolean);
var
  I: Integer;
begin
  if Source = nil then
    Exit;
  CheckInactive;
  for I := FieldCount - 1 downto 0 do
    Fields[I].Free;
  Source.FieldDefs.Update;
  FieldDefs := Source.FieldDefs;
  If (FApplyMode <> amNone) Then
    AddStatusField;
  CheckStructure(UseAutoIncAsInteger);
  If (FApplyMode <> amNone) Then
    HideStatusField;
end;

function TRxMemoryData.LoadFromDataSet(Source: TDataSet; RecordCount: Integer;
         Mode: TLoadMode; DisableAllControls: Boolean {$IFDEF RX_D4}= True{$ENDIF}): Integer;
var
  SourceActive: Boolean;
  MovedCount, I: Integer;
  SB, DB: TBookmark;
begin
  Result := 0;
  if Source = Self then
    Exit;
  FSaveLoadState := slsLoading;
  SourceActive := Source.Active;
  if DisableAllControls then
    Source.DisableControls;
  SB := Source.GetBookmark;
  try
    if DisableAllControls then
      Self.DisableControls;
    DB := GetBookmark;
    try
      Filtered := False;
      with Source do
      begin
        Open;
        CheckBrowseMode;
        UpdateCursorPos;
      end;
      if Mode = lmCopy then
      begin
        Close;
        CopyStructure(Source, AutoIncAsInteger);
      end;
      FreeIndexList;
      if not Active then
        Open;
      CheckBrowseMode;
      if RecordCount > 0 then
        MovedCount := RecordCount
      else
      begin
        Source.First;
        MovedCount := MaxInt;
      end;
      FAutoIncField := nil;
      // FixReadOnlyFields also sets FAutoIncField if there is any
      FixReadOnlyFields(False);
      // find first source autoinc field
      FSrcAutoIncField := nil;
      if Mode = lmCopy then
        for I := 0 to Source.FieldCount - 1 do
          if Source.Fields[I].DataType = ftAutoInc then
          begin
            FSrcAutoIncField := Source.Fields[I];
            Break;
          end;
      try
        while not Source.Eof do
        begin
          Append;
          AssignRecord(Source, Self, True);
          // assign AutoInc value manually (make user keep largest if source isn't sorted by autoinc field)
          if (FAutoIncField <> nil) and (FSrcAutoIncField <> nil) then
            FAutoInc := Max(FAutoInc, FSrcAutoIncField.AsInteger);
          Post;
          Inc(Result);
          if Result >= MovedCount then
            Break;
          Source.Next;
        end;
      finally
        FixReadOnlyFields(True);
        FAutoIncField := nil;
        FSrcAutoIncField := nil;
        First;
      end;
      // move back to where we started from
      if (DB <> nil) and BookmarkValid(DB) then
      begin
        GotoBookmark(DB);
        FreeBookmark(DB);
      end;
    finally
      if DisableAllControls then
        EnableControls;
    end;
  finally
    // move back to where we started from
    if (SB <> nil) and Source.BookmarkValid(SB) and not Source.IsEmpty then
    begin
      Source.GotoBookmark(SB);
      Source.FreeBookmark(SB);
    end;
    if not SourceActive then
      Source.Close;
    if DisableAllControls then
      Source.EnableControls;
    FSaveLoadState := slsNone;
  end;
end;

function TRxMemoryData.SaveToDataSet(Dest: TDataSet; RecordCount: Integer;
         DisableAllControls: Boolean {$IFDEF RX_D4}= True{$ENDIF}): Integer;
var
  MovedCount: Integer;
  SB, DB: TBookmark;
begin
  Result := 0;
  if Dest = Self then
    Exit;
  CheckBrowseMode;
  UpdateCursorPos;
  if DisableAllControls then
  begin
    DisableControls;
    Dest.DisableControls;
  end;
  FSaveLoadState := slsSaving;
  try
    SB := GetBookmark;
    DB := Dest.GetBookmark;
    try
      if not Dest.Active then
        Dest.Open
      else
        Dest.CheckBrowseMode;
      if RecordCount > 0 then
        MovedCount := RecordCount
      else
      begin
        First;
        MovedCount := MaxInt;
      end;
      try
        while not Eof do
        begin
          Dest.Append;
          AssignRecord(Self, Dest, True);
          Dest.Post;
          Inc(Result);
          if Result >= MovedCount then
            Break;
          Next;
        end;
      finally
        Dest.First;
      end;
    finally
      if (SB <> nil) and BookmarkValid(SB) then
      begin
        GotoBookmark(SB);
        FreeBookmark(SB);
      end;
      if (DB <> nil) and Dest.BookmarkValid(DB) then
      begin
        Dest.GotoBookmark(DB);
        Dest.FreeBookmark(DB);
      end;
    end;
  finally
    if DisableAllControls then
    begin
      EnableControls;
      Dest.EnableControls;
    end;
    FSaveLoadState := slsNone;
  end;
end;

{ Index Related }

{$IFDEF RX_D4}
procedure TRxMemoryData.SortOnFields(const FieldNames: string = ''; CaseInsensitive: Boolean = True; Descending: Boolean = False);
{$ELSE}
procedure TRxMemoryData.SortOnFields(const FieldNames: string; CaseInsensitive, Descending: Boolean);
{$ENDIF}
begin
  If (FieldNames <> '') Then
  	CreateIndexList(FieldNames)
  Else If (FKeyFieldNames <> '') then
    CreateIndexList(FKeyFieldNames)
  Else
    Exit;
  FCaseInsensitiveSort := CaseInsensitive;
  FDescendingSort := Descending;
  try
    Sort;
  except
    FreeIndexList;
    raise;
  end;
end;

procedure TRxMemoryData.Sort;
var
  Pos: TBookmarkType;
begin
  if Active and (FRecords <> nil) and (FRecords.Count > 0) then
  begin
    Pos := Bookmark;
    try
      QuickSort(0, FRecords.Count - 1, CompareRecords);
      SetBufListSize(0);
      InitBufferPointers(False);
      try
        SetBufListSize(BufferCount + 1);
      except
        SetState(dsInactive);
        CloseCursor;
        raise;
      end;
    finally
      Bookmark := Pos;
    end;
    Resync([]);
  end;
end;

procedure TRxMemoryData.QuickSort(L, R: Integer; Compare: TCompareRecords);
var
  I, J: Integer;
  P: TMemoryRecord;
begin
  repeat
    I := L;
    J := R;
    P := Records[(L + R) shr 1];
    repeat
      while Compare(Records[I], P) < 0 do
        Inc(I);
      while Compare(Records[J], P) > 0 do
        Dec(J);
      if I <= J then
      begin
        FRecords.Exchange(I, J);
        Inc(I);
        Dec(J);
      end;
    until I > J;
    if L < J then
      QuickSort(L, J, Compare);
    L := I;
  until I >= R;
end;

function TRxMemoryData.CompareRecords(Item1, Item2: TMemoryRecord): Integer;
var
  Data1, Data2: PByte;
  F: TField;
  I: Integer;
begin
  Result := 0;
  if FIndexList <> nil then
  begin
    for I := 0 to FIndexList.Count - 1 do
    begin
      F := TField(FIndexList[I]);
      Data1 := FindFieldData(Item1.Data, F);
      if Data1 <> nil then
      begin
        Data2 := FindFieldData(Item2.Data, F);
        if Data2 <> nil then
        begin
          if (Data1^ <> 0) and (Data2^ <> 0) then
          begin
            Inc(Data1);
            Inc(Data2);
            Result := CompareFields(Data1, Data2, F.DataType,
              FCaseInsensitiveSort);
          end
          Else if Data1^ <> 0 then
            Result := 1
          else if Data2^ <> 0 then
            Result := -1;
          if FDescendingSort then
            Result := -Result;
        end;
      end;
      if Result <> 0 then
        Exit;
    end;
  end;
  if (Result = 0) then
  begin
    if Item1.ID > Item2.ID then
      Result := 1
    else if Item1.ID < Item2.ID then
      Result := -1;
    if FDescendingSort then
      Result := -Result;
  end;
end;

function TRxMemoryData.GetIsIndexField(Field: TField): Boolean;
begin
  if FIndexList <> nil then
    Result := FIndexList.IndexOf(Field) >= 0
  else
    Result := False;
end;

procedure TRxMemoryData.CreateIndexList(const FieldNames: string);
var
  Pos: Integer;
  F: TField;
begin
  if FIndexList = nil then
    FIndexList := TList.Create
  else
    FIndexList.Clear;
  Pos := 1;
  while Pos <= Length(FieldNames) do
  begin
    F := FieldByName(ExtractFieldName(FieldNames, Pos));
    if (F.FieldKind = fkData) and (F.DataType in ftSupported - ftBlobTypes) then
      FIndexList.Add(F)
    else
      ErrorFmt(SFieldTypeMismatch, [F.DisplayName]);
  end;
end;

procedure TRxMemoryData.FreeIndexList;
begin
  FIndexList.Free;
  FIndexList := nil;
end;

function TRxMemoryData.GetValues(FldNames: String{$IFDEF RX_D4} = ''{$ENDIF}): Variant;
var
  List : TList;
  I: Integer;
begin
  Result := Null;
  if FldNames = '' then
    FldNames := FKeyFieldNames;
  If FldNames = '' Then Exit;
  If Pos(';',FldNames) > 0 Then
  Begin
    List := TList.Create;
    GetFieldList(List,FldNames);
    Result := VarArrayCreate([0, List.Count - 1], varVariant);
    for I := 0 to List.Count - 1 do
      Result[I] := TField(List[I]).Value;
    FreeAndNil(List);
  End
  Else
  Begin
    Result := VarArrayCreate([0,0],VarVariant);
    Result[0] := FieldByName(FldNames).Value;
  End;
end;

function TRxMemoryData.CopyFromDataset: Integer;
var
  bOpen: Boolean;
  I, Len: Integer;
  FOriginal, FClient: TField;
begin
  Result := 0;
  if FDataSet = nil then 
    Exit;
  if FApplyMode <> amNone then
    Len := FieldDefs.Count - 2
  else
    Len := FieldDefs.Count - 1;
  if Len < 1 then 
    Exit;
  bOpen := FDataSet.Active;
  try
    if not bOpen then
      FDataSet.Open;
  except
    Exit;
  end;
  if FDataSet.IsEmpty then
  begin
    if not bOpen And FDatasetClosed then
      FDataSet.Close;
    Exit;
  end;

  FDataSet.DisableControls;
  DisableControls;
  FSaveLoadState := slsLoading;
  try
    FDataSet.First;
    while not FDataSet.Eof do
    begin
      Append;
      for I := 0 to Len do
      begin
        FClient := Fields[I];
        FOriginal := FDataSet.FindField(FClient.FieldName);
        if (FClient <> nil) and (FOriginal <> nil) then
        begin
          if FOriginal.IsNull then
            Fields[I].Clear
          else
            Fields[I].Value := FOriginal.Value;
        end;
      end;
      If FApplyMode <> amNone then
        FieldByName(FStatusName).AsInteger := Integer(rsOriginal);
      Post;
      Inc(Result);
      FDataSet.Next;
    end;
  finally
    FSaveLoadState := slsNone;
    EnableControls;
    FDataSet.EnableControls;
    if not bOpen And FDatasetClosed then
      FDataSet.Close;
  end;
end;

procedure TRxMemoryData.DoBeforeApply;
begin
  if Assigned(FBeforeApply) then
    FBeforeApply(Self);
end;

procedure TRxMemoryData.DoAfterApply;
begin
  if Assigned(FAfterApply) then
    FAfterApply(Self);
end;

procedure TRxMemoryData.DoBeforeApplyRecord(ADataset: TDataset; RS: TRecordStatus; Found: Boolean);
begin
  if Assigned(FBeforeApplyRecord) then
    FBeforeApplyRecord(ADataset,RS,Found);
end;

procedure TRxMemoryData.DoAfterApplyRecord(ADataset: TDataset; RS: TRecordStatus; Apply: Boolean);
begin
  if Assigned(FAfterApplyRecord) then
    FAfterApplyRecord(ADataset,RS,Apply);
end;

procedure TRxMemoryData.ClearChanges;
Var
  I: Integer;
  PFValues: TPVariant;
begin
  If FDeletedValues.Count > 0 Then
  Begin
    For I := 0 To (FDeletedValues.Count-1) Do
    Begin
      PFValues := FDeletedValues[I];
      Dispose(PFValues);
    End;
    FDeletedValues.Clear;
  End;

  EmptyTable;

  if FLoadRecords then
  begin
    FRowsOriginal := CopyFromDataset;
    if FRowsOriginal > 0 Then
    begin
      if FKeyFieldNames <> '' then
        SortOnFields({$IFNDEF RX_D4}'',True,False{$ENDIF});
      if FApplyMode = amAppend then
        Last
      else
        First;
    end;
  end;
end;

procedure TRxMemoryData.CancelChanges;
begin
  CheckBrowseMode;
  if (FDataSet = nil) or (FApplyMode = amNone) then
    Exit;
  if (FApplyMode <> amNone) and (FKeyFieldNames = '') then
    Exit;
  ClearChanges;
  FRowsChanged := 0;
  FRowsAffected := 0;
end;


function TRxMemoryData.ApplyChanges: Boolean;
Var
  xKey : Variant;
  PxKey : TPVariant;
  Len,Row : Integer;
  Status : TRecordStatus;
  bOpen, bFound, bApply: Boolean;
  FOriginal,FClient: TField;

  function WriteFields: Boolean;
  Var J : Integer;
  Begin
    Try
      For J := 0 To Len Do
      begin
        If ( Fields[J].FieldKind = fkData ) Then
        begin
          FClient := Fields[J];
          FOriginal := FDataset.FindField(FClient.FieldName);
          If (FOriginal <> NIL) And (FClient <> NIL) Then
          begin
            If FClient.IsNull Then
              FOriginal.Clear
            Else
              FDataset.FieldByName(FOriginal.FieldName).Value := FClient.Value;
          End;
        End;
      End;
      Result := True;
    Except
      Result := False;
    End;
  End;

  Function InsertRec: Boolean;
  Begin
    Try
      FDataset.Append;
      WriteFields;
      FDataset.Post;
      Result := True;
    Except
      Result := False;
    End;
  End;

  Function UpdateRec: Boolean;
  Begin
    Try
      FDataset.Edit;
      WriteFields;
      FDataset.Post;
      Result := True;
    Except
      Result := False;
    End;
  End;

  Function DeleteRec: Boolean;
  Begin
    Try
      FDataset.Delete;
      Result := True;
    Except
      Result := False;
    End;
  End;

  function SaveChanges: Integer;
  var
    I: Integer;
  begin
    Result := 0;
    FDataset.DisableControls;
    DisableControls;
    Row := RecNo;
    FSaveLoadState := slsSaving;
    try
      if not IsEmpty Then
        First;
      while not EOF do
      begin
        Status := TRecordStatus(FieldByName(FStatusName).AsInteger);
        if (Status <> rsOriginal) then
        begin
          xKey := GetValues{$IFNDEF RX_D4}(''){$ENDIF};
          bFound := FDataset.Locate(FKeyFieldNames, xKey, []);
          DoBeforeApplyRecord(FDataset, Status, bFound);
          bApply := False;
          (********************* New Record ***********************)
          if IsInserted then
          begin
            if not bFound then // Not Exists in Original
            begin
              if InsertRec then
              begin
                Inc(Result);
                bApply := True;
              end
              else
              if FExactApply then
              begin
                Error(SInsertError);
                Break;
              end
              else
              if (FDataset.State in dsEditModes) then
                FDataset.Cancel;
            end
            else
            if FApplyMode = amMerge then // Exists in Original
            begin
              if UpdateRec then
              begin
                Inc(Result);
                bApply := True;
              end
              else
              if FExactApply then
              begin
                Error(SUpdateError);
                Break;
              end
              else
              if (FDataset.State in dsEditModes) then
                FDataset.Cancel;
            end
            else
            if FExactApply then
            begin
              Error(SRecordDuplicate);
              Break;
            end;
          end;
          (*********************** Modified Record ************************)
          if IsUpdated then
          begin
            if bFound then // Exists in Original
            begin
              if UpdateRec then
              begin
                Inc(Result);
                bApply := True;
              end
              else
              if FExactApply then
              begin
                Error(SUpdateError);
                Break;
              end
              else
              if (FDataset.State in dsEditModes) then
                FDataset.Cancel;
            end
            else
            if FApplyMode = amMerge then // Not exists in Original
            begin
              if InsertRec then
              begin
                Inc(Result);
                bApply := True;
              end
              else
              if FExactApply then
              begin
                Error(SInsertError);
                Break;
              end
              Else
              if FDataset.State in dsEditModes then
                FDataset.Cancel;
            end
            Else
            if FExactApply then
            begin
              Error(SRecordInexistent);
              Break;
            end;
          end;
          DoAfterApplyRecord(FDataset, Status, bApply);
        end;
        Next;
      end;
      (*********************** Deleted Records **************************)
      if (FApplyMode = amMerge) then
      begin
        for I := 0 to FDeletedValues.Count - 1 do
        begin
          Status := rsDeleted;
          PxKey := FDeletedValues[I];
          xKey := PxKey^;
          bFound := FDataset.Locate(FKeyFieldNames, xKey, []);
          DoBeforeApplyRecord(FDataset, Status, bFound);
          bApply := False;
          if bFound then // Exists in Original
          begin
            if DeleteRec then
            begin
              Inc(Result);
              bApply := True;
            end
            else
            if FExactApply then
            begin
              Error(SDeleteError);
              Break;
            end;
          end
          else
          if FExactApply then // Not exists in Original
          begin
            Error(SRecordInexistent);
            Break;
          end
          else
          begin
            Inc(Result);
            bApply := True;
          end;
          DoAfterApplyRecord(FDataset, Status, bApply);
        end;
      end;
    finally
      FSaveLoadState := slsNone;
      RecNo := Row;
      EnableControls;
      FDataset.EnableControls;
    end;
  end;
begin
  Result := False;

  If (FDataset = NIL) Or (FApplyMode = amNone) Then
    Exit;
  If (FApplyMode <> amNone) And (FKeyFieldNames = '') Then
    Exit;
  Len := FieldDefs.Count-2;
  If ( Len < 1)  Then
    Exit;

  bOpen := FDataSet.Active;
  try
    if not bOpen then
      FDataSet.Open;
  except
    Exit;
  end;

  CheckBrowseMode;
  DoBeforeApply;

  FSaveLoadState := slsSaving;
  If (FRowsChanged < 1) Or (IsEmpty And (FDeletedValues.Count < 1)) Then
  begin
    FRowsAffected := 0;
    Result := (FRowsAffected = FRowsChanged);
  End
  Else
  Begin
    FRowsAffected := SaveChanges;
    Result := (FRowsAffected = FRowsChanged) Or
              ( (FRowsAffected > 0) And (FRowsAffected < FRowsChanged) And Not FExactApply );
  End;
  FSaveLoadState := slsNone;

  If Result Then
    ClearChanges;
  DoAfterApply;

  FRowsAffected := 0;
  FRowsChanged := 0;

  if bOpen And FDatasetClosed then
     FDataset.Close;
end;

function TRxMemoryData.FindDeleted(KeyValues: Variant): Integer;
var
  I, J, Len, Equals: Integer;
  PxKey: TPVariant;
  xKey, ValRow, ValDel: Variant;
begin
  Result := -1;
  if VarIsNull(KeyValues) then
    Exit;
  PxKey := nil;
  Len := VarArrayHighBound(KeyValues, 1);
  try
    for I := 0 to FDeletedValues.Count - 1 do
    begin
      PxKey := FDeletedValues[I];
      xKey := PxKey^;
      Equals := -1;
      for J := 0 to Len - 1 do
      begin
        ValRow := KeyValues[J];
        ValDel := xKey[J];
        if VarCompareValue(ValRow, ValDel) = vrEqual then
        begin
          Inc(Equals);
          if Equals = (Len - 1) then
            Break;
        end;
      end;
      if Equals = (Len - 1) then
      begin
        Result := I;
        Break;
      end;
    end;
  finally
    if not (PxKey = nil) then
      Dispose(PxKey);
  end;
end;

function TRxMemoryData.IsDeleted(out Index: Integer): Boolean;
begin
  Index := FindDeleted(GetValues(''));
  Result := Index > -1;
end;

function TRxMemoryData.IsInserted: Boolean;
begin
  Result := TRecordStatus(FieldByName(FStatusName).AsInteger) = rsInserted;
end;

function TRxMemoryData.IsUpdated: Boolean;
begin
  Result := TRecordStatus(FieldByName(FStatusName).AsInteger) = rsUpdated;
end;

function TRxMemoryData.IsOriginal: Boolean;
begin
  Result := TRecordStatus(FieldByName(FStatusName).AsInteger) = rsOriginal;
end;

function TRxMemoryData.IsLoading: Boolean;
Begin
  Result := FSaveLoadState = slsLoading;
End;

function TRxMemoryData.IsSaving: Boolean;
Begin
  Result := FSaveLoadState = slsSaving;
End;

{ TMemBlobStream }

constructor TMemBlobStream.Create(Field: TBlobField; Mode: TBlobStreamMode);
begin
  inherited Create;
  FMode := Mode;
  FField := Field;
  FDataSet := FField.DataSet as TRxMemoryData;
  if not FDataSet.GetActiveRecBuf(FBuffer) then
     Exit;
  if not FField.Modified and (Mode <> bmRead) then
  begin
    if FField.ReadOnly then
      ErrorFmt(SFieldReadOnly, [FField.DisplayName]);
    if not (FDataSet.State in [dsEdit, dsInsert]) then
      Error(SNotEditing);
    FCached := True;
  end
  else
    FCached := (FBuffer = TRecordBuffer(FDataSet.ActiveBuffer));
  FOpened := True;
  if Mode = bmWrite then
    Truncate;
end;

destructor TMemBlobStream.Destroy;
begin
  if FOpened and FModified then
    FField.Modified := True;
  if FModified then
  try
    FDataSet.DataEvent(deFieldChange, Longint(FField));
  except
    Application.HandleException(Self);
  end;
  inherited Destroy;
end;

function TMemBlobStream.GetBlobFromRecord(Field: TField): TMemBlobData;
var
  Rec: TMemoryRecord;
  Pos: Integer;
begin
  Result := '';
  Pos := FDataSet.FRecordPos;
  if (Pos < 0) and (FDataSet.RecordCount > 0) then
    Pos := 0
  else if Pos >= FDataSet.RecordCount then
    Pos := FDataSet.RecordCount - 1;
  if (Pos >= 0) and (Pos < FDataSet.RecordCount) then
  begin
    Rec := FDataSet.Records[Pos];
    if Rec <> nil then
      Result := PMemBlobArray(Rec.FBlobs)[FField.Offset];
  end;
end;

function TMemBlobStream.Read(var Buffer; Count: Longint): Longint;
begin
  Result := 0;
  if FOpened then
  begin
    if Count > Size - FPosition then
      Result := Size - FPosition
    else
      Result := Count;
    if Result > 0 then
    begin
      if FCached then
      begin
        Move(FDataSet.GetBlobData(FField, FBuffer)[FPosition], Buffer,Result);
        Inc(FPosition, Result);
      end
      else
      begin
        Move(GetBlobFromRecord(FField)[FPosition], Buffer,Result);
        Inc(FPosition, Result);
      end;
    end;
  end;
end;

function TMemBlobStream.Write(const Buffer; Count: Longint): Longint;
var
  Temp: TMemBlobData;
begin
  Result := 0;
  if FOpened and FCached and (FMode <> bmRead) then
  begin
    Temp := FDataSet.GetBlobData(FField, FBuffer);
    if Length(Temp) < FPosition + Count then
      SetLength(Temp, FPosition + Count);
    Move(Buffer, Temp[FPosition], Count);
    FDataSet.SetBlobData(FField, FBuffer, Temp);
    Inc(FPosition, Count);
    Result := Count;
    FModified := True;
  end;
end;

function TMemBlobStream.Seek(Offset: Longint; Origin: Word): Longint;
begin
  case Origin of
    0: // soFromBeginning:
      FPosition := Offset;
    1: // soFromCurrent:
      Inc(FPosition, Offset);
    2: // soFromEnd:
      FPosition := GetBlobSize + Offset;
  end;
  Result := FPosition;
end;

procedure TMemBlobStream.Truncate;
begin
  if FOpened and FCached and (FMode <> bmRead) then
  begin
    FDataSet.SetBlobData(FField, FBuffer, '');
    FModified := True;
  end;
end;

function TMemBlobStream.GetBlobSize: Longint;
begin
  Result := 0;
  if FOpened then
    if FCached then
      Result := Length(FDataSet.GetBlobData(FField, FBuffer))
    else
      Result := Length(GetBlobFromRecord(FField))
end;

{$ENDIF RX_D3}

end.
