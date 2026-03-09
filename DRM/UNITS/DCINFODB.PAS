{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit dcInfoDB;

Interface
{$I dc.inc}

{$O+} // otherwise will be an exception

Uses ActiveX, Classes, DB, Messages, SysUtils, Windows, ComObj,
     dcdreamLib, dcConsts, dcInfoLib, dcHook,
     dcDBFilter
     {$IFDEF D6} ,Variants {$ENDIF}
     ;

Type

  { TDataSetToInfoSet }

  TDataSetToInfoSet=Class(TComponent,IUnknown)
  Private
    FDataSet:TDataSet;
    FInterface:IUnknown;
    FVersion : TDCVersion;
    Procedure SetDataSet(Value:TDataSet);
  Published
    Property DataSet:TDataSet read FDataSet write SetDataSet;
    property Version : TDCVersion read FVersion write FVersion stored false;
  End;

  IDCDatasetField = interface
  ['{17A1FD81-FBB3-490F-B810-7A11964A7E20}']
    function GetDatasetField : TField;
  end;

procedure DisableDataSets(DataSets : array of TDataSet);
procedure EnableDataSets(DataSets : array of TDataSet);
procedure DataSetsChangeActive(DataSets : array of TDataSet; Value : boolean);

Function InfoSetToDataSet(const InfoSet:IUnknown):TDataSet;

Function DataSetToInfoSet(DataSet:TDataSet):IUnknown;
Procedure RemoveDataSet(DataSet:TDataSet);
Function ResetInfoSet(const DetailInfoSet:IUnknown;Value:TComponent):IUnknown;

Procedure RegisterUniqueField(DataSet:TDataSet;Const FieldName:String);
Procedure UnRegisterUniqueField(DataSet:TDataSet);

function GetDatasetField(const iField : IUnknown) : TField;

implementation

function GetDatasetField(const iField : IUnknown) : TField;
var
  iDatasetField : IDCDatasetField;
begin
  result := nil;
  if iField.QueryInterface(IDCDatasetField, iDatasetField) = S_OK then
    result := iDatasetField.GetDatasetField;
end;

Type

  TDataSetItem=Class(TSortedListData)
  Public
    InfoSet:IUnknown;
    RefCount:Integer;
  End;

  IDCGetDataSet=Interface
    ['{F2AD3C01-BF27-11D2-88FD-0000E8DC5099}']
    Function GetDataSet:TDataSet;
  End;


Var
  DataSetToInfoSetList:TSortedCompKeyList;

procedure DisableDataSets(DataSets : array of TDataSet);
var
  i : integer;
begin
  for i := Low(DataSets) to High(DataSets) do
    DataSets[i].DisableControls;
end;

{------------------------------------------------------------------}

procedure EnableDataSets(DataSets : array of TDataSet);
var
  i : integer;
begin
  for i := Low(DataSets) to High(DataSets) do
    DataSets[i].EnableControls;
end;

{------------------------------------------------------------------}

procedure DataSetsChangeActive(DataSets : array of TDataSet; Value : boolean);
var
  i : integer;
begin
  for i := Low(DataSets) to High(DataSets) do
    DataSets[i].Active := Value;
end;

{------------------------------------------------------------------}

function IsDetailDataLink(DataLink : TDataLink) : boolean;
begin
  {$IFDEF D4}
  result := DataLink is TDetailDataLink;
  {$ELSE}
  result := InheritsFromClassName(DataLink, 'TMasterDataLink'); //don't resource
  {$ENDIF}
end;

{------------------------------------------------------------------}

function InfoSetToDataSet(const InfoSet : IUnknown) : TDataSet;
var
  GetDataSet : IDCGetDataSet;
begin
  result := nil;
  if (InfoSet <> nil) and (InfoSet.QueryInterface(IDCGetDataSet,GetDataSet) = S_OK) then
    result := GetDataSet.GetDataSet;
end;

{------------------------------------------------------------------}

type
  TPublicDataLink=Class(TDataLink);
  TPublicDataSource=Class(TDataSource);

{  _TDataLink = class(TPersistent)
  private
    FDataSource: TDataSource;
    FNext: TDataLink;
    FBufferCount: Integer;
  End;}

  _TDataSource = class(TComponent)
  private
    FDataSet: TDataSet;
    FDataLinks: TList;
  end;

{$IFDEF D4}
  _TDataSet = class(TComponent)
  private
    FFields: TFields;
    FAggFields: TFields;
    FFieldDefs: TFieldDefs;
    FFieldDefList: TFieldDefList;
    FFieldList: TFieldList;
    FDataSources: TList;
    FFirstDataLink: TDataLink;
    FBufferCount: Integer;
    FRecordCount: Integer;
    FActiveRecord: Integer;
    FCurrentRecord: Integer;
    FBuffers: TBufferList;
    FCalcBuffer: PChar;
    FBookmarkSize: Integer;
    FCalcFieldsSize: Integer;
    FDesigner: TDataSetDesigner;
    FDisableCount: Integer;
  end;
{$ELSE}
  _TDataSet = class(TComponent)
  private
    FFields: TList;
    FFieldDefs: TFieldDefs;
    FDataSources: TList;
    FFirstDataLink: TDataLink;
    FBufferCount: Integer;
    FRecordCount: Integer;
    FActiveRecord: Integer;
    FCurrentRecord: Integer;
    FBuffers: PBufferList;
    FCalcBuffer: PChar;
    FBufListSize: Integer;
    FBookmarkSize: Integer;
    FCalcFieldsSize: Integer;
    FBOF: Boolean;
    FEOF: Boolean;
    FModified: Boolean;
    FStreamedActive: Boolean;
    FInternalCalcFields: Boolean;
    FState: TDataSetState;
    FEnableEvent: TDataEvent;
    FDisableState: TDataSetState;
    FDesigner: TDataSetDesigner;
    FDisableCount: Integer;
  end;
  _TMasterDataLink = class(TDataLink)
  private
    FDataSet: TDataSet;
  End;
{$ENDIF}

procedure _getdetails(AList, DataSources : TList);
var
  i : integer;
  j : integer;
  dlinks : TList;
  DataLink:TDataLink;
begin
  AList.Count := 0;
  with DataSources do
    for i := Count - 1 downto 0 do
      begin
        dlinks := _TDataSource(List[I]).fDataLinks;
        with dlinks do
          for j := Count - 1 downto 0 do
            begin
              DataLink:=List[J];
              if IsDetailDataLink(DataLink) then
                AList.Add(DataLink);
            end;
      end;
end;
procedure GetDetailDataLinks(Master : TDataSet; List : TList);
begin
  try
  if Master = nil then
    exit;
  _getdetails(List, _TDataSet(Master).fDataSources);

  exit;                                                           // Avoid warnings
  finally
  end;
  _TDataSource(nil).fDataSet := TDataSet(_TDataSet(nil).fFields);
  with _TDataSet(nil) do
    begin
      FFields:=Nil;
      fFieldDefs := nil;
      FDataSources:=Nil;
      FFirstDataLink:=Nil;
      FBufferCount:=0;
      FRecordCount:=0;
      FActiveRecord:=0;
      FCurrentRecord:=0;
      FBuffers:=Nil;
      FCalcBuffer:=Nil;
      FBookmarkSize:=0;
      FCalcFieldsSize:=0;
      FDisableCount:=0;
      FDesigner:=Nil;
{$IFDEF D4}
      FAggFields:=Nil;
      FFieldDefList:=Nil;
      FFieldList:=Nil;
{$ELSE}
      FBufListSize:=0;
      FBOF:=False;
      FEOF:=False;
      FModified:=False;
      FStreamedActive:=False;
      FInternalCalcFields:=False;
      FState:=dsInactive;
      FEnableEvent:=deRecordChange;
      FDisableState:=dsEdit;
      With _TMasterDataLink(Nil) Do
        FDataSet:=Nil;
{$ENDIF}
    end;
end;

Procedure GetDetailDataSets(Master : TDataSet; AList : TList);

  Procedure _getdetails(DataSources : TList);
  Var
    i : integer;
    j : integer;
    dlink : TDataLink;
  begin
    with DataSources do
      for i := Count - 1 downto 0 do
        with _TDataSource(List[I]).fDataLinks do
          for j := Count - 1 downto 0 do
            begin
              dlink := TDataLink(List[J]);
              if IsDetailDataLink(dlink) then
              {$IFDEF D4}
                AList.Add(TDetailDataLink(dlink).DetailDataSet);
              {$ELSE}
                AList.Add(_TMasterDataLink(dlink).fDataSet);
              {$ENDIF}
            end;
  end;

begin
  if Master = nil then
    exit;
  _getdetails(_TDataSet(Master).fDataSources);
End;

{Procedure GetDataLinks(Master : TDataSet; AList : TList);

  Procedure _getdetails(DataSources : TList);
  Var
    i : integer;
    j : integer;
  begin
    with DataSources do
      for i := Count - 1 downto 0 do
        with _TDataSource(List[I]).fDataLinks do
          for j := Count - 1 downto 0 do
                AList.Add(Items[J]);
  end;

begin
  if Master = nil then
    exit;
  _getdetails(_TDataSet(Master).fDataSources);
  Exit;
  With _TDataLink(Nil) Do
  Begin
    FDataSource:=Nil;
    FNext:=Nil;
    FBufferCount:=0;
  End;
End;}

Type
  TPublicDataSet=Class(TDataSet)
  Public
    Procedure InternalPost;override;
  End;

Procedure TPublicDataSet.InternalPost;
Begin
End;

Procedure IncDisableCount(DataSet:TDataSet;AList:TList;Index:Integer;Value:Integer);
Var
  I:Integer;
Begin
  If Not DataSet.Active Then
    Exit;
  Inc(_TDataSet(DataSet).FDisableCount,Value);
  GetDetailDataSets(DataSet, AList);
  with AList do
    For I := Index To Count - 1 Do
      IncDisableCount(List[I], AList, Count, Value);
End;

Type
  TDataSetIntf=Class;
  TDataSetField=Class;
  TFieldProps=Class;

  TDataInfo=Record
   ValueOffset:Integer;
   StatusOffset:Integer;
  End;

  TDataInfos=Array[0..MaxInt Div (SizeOf(TDataInfo)*2)] Of TDataInfo;
  PDataInfos=^TDataInfos;

  { TDCStreamAdapter }

  // Convert TStream to IDCStream

  TD2DCStream=Class(TInterfacedObject, IDCSequentialStream)
   Private
     FStream:TStream;
     Function Read(Var Data:Variant;cbSize:Integer):Integer;
     Function Write(const Data:Variant;cbSize:Integer):Integer;
   Public
     Constructor Create(Stream:TStream);
     Destructor Destroy;override;
  end;

  { TFieldsData }

  TFieldsData=Class
  Private
    FActiveBuffer:PChar;
    FDataInfos:PDataInfos;
    FDataSize:Integer;
    Procedure CreateDataInfo(Const Fields:IDCColumns);
    Function GetChanged(Index:Integer):Boolean;
//!    Function GetIsDefault(Index:Integer):Boolean;
    Function GetIsNull(Index:Integer):Boolean;
//!    Function GetStatusOffset(Index:Integer):Integer;
//!    Function GetStatusPtr(Index:Integer):Pointer;
//!    Function GetValueOffset(Index:Integer):Integer;
    Function GetValuePtr(Index:Integer):Pointer;

//!    Procedure SetChanged(Index:Integer;Value:Boolean);
//!    Procedure SetIsDefault(Index:Integer;Value:Boolean);
    Procedure SetIsNull(Index:Integer;Value:Boolean);
  Public
    Constructor Create(Fields:IDCColumns);
    Destructor Destroy;override;
//!    Procedure ClearStatus(Index:Integer);

    Property ActiveBuffer:PChar read FActiveBuffer write FActiveBuffer;
    Property DataSize:Integer read FDataSize;
    Property Changed[Index:Integer]:Boolean read GetChanged{ write SetChanged};
//!    Property IsDefault[Index:Integer]:Boolean read GetIsDefault write SetIsDefault;
    Property IsNull[Index:Integer]:Boolean read GetIsNull write SetIsNull;
//!    Property StatusOffset[Index:Integer]:Integer read GetStatusOffset;
//!    Property StatusPtr[Index:Integer]:Pointer read GetStatusPtr;
//!    Property ValueOffset[Index:Integer]:Integer read GetValueOffset;
    Property ValuePtr[Index:Integer]:Pointer read GetValuePtr;
  End;

  TDCCustomInfoSet=Class(TSafeInterfacedObject, IDCConnect, IDCEvents)
  Private
    FNotifiersHolder:IDCEventsEx;
    fActive : Boolean;
    FEnableEvents:Boolean;

    function GetEnableEvents : boolean;
  Protected
    function GetActive : boolean; virtual;

    Property EnableEvents:Boolean read GetEnableEvents write FEnableEvents;
    Procedure Connect;virtual;
    Procedure Disconnect;virtual;
    Procedure Event(const EventSource : IUnknown; EventType:Integer;const EventData:Variant);
    Procedure FieldChanged(const Field:IDCColumn);
    Procedure InternalConnect(Var IsSendNotification:Boolean);virtual;
    Procedure InternalDisconnect(Var IsSendNotification:Boolean);virtual;
    Procedure RowChanged;virtual;

    {IDCConnect}
    Function GetConnected:Boolean;
    Procedure SetConnected(Value:Boolean);

    {IDCEvents}
    Procedure RegisterHandler(const EventHandler:IDCEventHandler;EventTypes, UserData:DWORD);
    Procedure UnregisterHandler(const EventHandler:IDCEventHandler);
  Public
    Constructor Create;

    property Active : boolean read GetActive;
  End;

  TDCCustomProps=Class(TSafeInterfacedObject,IDCColumns)
  Private
    FFieldCount:Integer;
    FFields:TList;
    Function GetObject(Index:Integer):TObject;
  Protected
    Procedure AddProperty(AProperty:Pointer);virtual;
    Procedure DestroyProperty(AProperty:Pointer);virtual;

    Property FieldCount:Integer read FFieldCount write FFieldCount;

    {IDCProperties}
    Function GetCount:Integer;
    Function GetItem(Index:Integer):IUnknown;
  Public
    Constructor Create;
    Destructor Destroy;override;

    Property Objects[Index:Integer]:TObject read GetObject;
  End;

  { TDataSetDataLink }

  TDataSetDataLink=Class(TDataLink)
  Private
    FDataSetIntf:TDataSetIntf;
  Protected
    Procedure ActiveChanged;override;
    Procedure DataSetChanged;override;
//    Procedure LayoutChanged;override;
    Procedure RecordChanged(Field:TField);override;
  Public
    Constructor Create(ADataSetIntf:TDataSetIntf);
  End;

  { TDataSetField }

  TDataSetFields=Array [0..MaxInt Div (SizeOf(TDataSetField)*2)] of TDataSetField;
  PDataSetFields=^TDataSetFields;

  TDataSetField=Class(TSafeInterfacedObject,IDCColumn, IDCProperty, IDCField, IDCDatasetField)
  Private
    FAttributes:TPropAttributes;
    FDataSetIntf:TFieldProps;
    FField:TField;
    FFieldName: string;
    FPropType:TDCPropType;
    FSize:Integer;

    FDataSet:TDataSet;//remove this line{!!!}; //debug only

    Procedure CheckActive;
    Procedure CheckReadOnly;
    Procedure LinkTo(AField:TField);
  Protected

    {IDCColumn}
    Function GetAttributes:TPropAttributes;
    Function GetName : string;
    Function GetPropType:TDCPropType;
    Function GetSize:Integer;

    {IDCProperty}
    Function GetValue:Variant;
    Procedure SetValue(const Value:Variant);
    function GetString : string;
    Function GetText:String;

    {IDCField}
    function IsValidChar(InputChar: Char): Boolean;
    function GetDisplayName : string;
    function GetDisplayWidth : integer;

    {IDCDatasetField}
    function GetDatasetField : TField;
  Public
    Constructor Create(ADataSetProps:TFieldProps;ADataSet:TDataSet;AField:TField);virtual;
  End;

  { TFieldProps }

  TFieldProps=Class(TDCCustomProps, IDCProperties)
  Private
    fDataSet : TDataSet;
    FieldsCreated : boolean;

    Procedure CreateFields;
    Procedure UpdateFields(Field:TField);
  Protected
    Procedure Notification(Instance:TObject);
    Procedure DestroyProperty(AProperty:Pointer);override;
  Public
    Constructor Create(ADataSet:TDataSet);
    Destructor Destroy;override;
  End;

  TDataEventMethod=Procedure(Event: TDataEvent; Info: Longint) Of Object;

  TDataSetIntf=class(TDCCustomInfoSet, IDCBookmark, IDCBookMarkEx, IDCCanRowChange,
                     IDCEventsSource,IDCStackFilter,
                     IDCFilter, IDCGetDataSet, IDCLocate, IDCNavigation, IDCRowBlob,
                     IDCRowChange, IDCRowData, IDCRowSet, IDCRowSetRefresh,
                     IDCUpdates, IDCSafeUpdates, IDCHomogeneous)
  Private
    FChecked:Boolean;
    FDataLinks:TList;
    FDetailDataLinks:TList;
    FDetailDataSets:TList;
    FDataLink:TDataLink;
    FDataSet:TDataSet;
    FDataSetState:TDataSetState;
    FDataSetVMT:Pointer;
    FDataSource:TDataSource;
    FDataSources:TList;
    FFieldList:TList;
    FFieldProps:TFieldProps;
    FFieldPropsIntf:IDCProperties;
    FFieldsData:TFieldsData;
    FFilters:TStringList;
    FNotifyComp:TDCLinkedComponent;
    FIsInsert:Boolean;
    FIsNotifyDetails:Boolean;
    FIsSetHook:Boolean;
    FLastBookmark:Variant;
    FSavedBookmark:TDCBookmark;
    FSavedFiltered:Boolean;
    FUniqueField:TField;
    Procedure ActiveChanged(IsActive:Boolean);
    Procedure AfterCancel;
    Procedure AfterDelete;
    Procedure AfterInternalPost;
    Procedure AfterPost;
    Procedure AfterSetFiltered(Value:Boolean);
    Procedure AfterSetFilterText(const Value:String);
    Procedure BeforeDelete;
    Procedure BeforePost;
    Procedure CheckActive;
    Procedure CheckSetDataSet;
    Procedure CreateDataSetInfo;
    Procedure DataSetChanged;
    Procedure DestroyDataSetInfo;
    Procedure Event2(EventType : Integer; const EventData : string);
    Procedure Event3(EventType : Integer; const EventData : integer);    
    Procedure DataEvent(DataEvent:TDataEvent;Info:LongInt);
    Procedure InternalSetDataSet(Value:TDataSet);
//    Procedure LayoutChanged;
    Procedure Notification(Component:TComponent;Operation:TOperation);
    Procedure NotifyDataLinks(DataEvent:TDataEvent;Info:LongInt);
    Procedure NotifyDetailDataSets(DataEvent:TDataEvent;Info:LongInt);
    Procedure RecordChanged(Field:TField);
    Procedure RemoveHook;
    Procedure SetDataSet(Value:TDataSet);
    Procedure SetHook;
    Procedure UpdateDataSetState(OldState:TDataSetState;NewState:TDataSetState);
  Protected
    Procedure Connect;override;
    Procedure Disconnect;override;

    function GetActive : boolean; override;

    Procedure InternalConnect(Var IsSendNotification:Boolean);override;
    Procedure InternalDisconnect(Var IsSendNotification:Boolean);override;
    Procedure RowChanged;override;

    {IDCBookmark}
    Function GetBookmark:TDCBookMark;
    Procedure GotoBookmark(const Bookmark:TDCBookMark);

    {IDCCanRowChange}
    Function CanAppend:Boolean;
    Function CanEdit:Boolean;
    Function CanDelete:Boolean;
    Function CanInsert:Boolean;
    Function CanView:Boolean;

    {IDCEventsSource}
    Function GetEventSourceID:Integer;

    {IDCStackFilter}
    Procedure AddFilter(const AFilter:String);
    Procedure RemoveFilter;

    {IDCGetDatSet}
    Function GetDataSet:TDataSet;

    {IDCLocate}
    Function GetFilter : string;
    Function GetFiltered:Boolean;
    Procedure SetFilter(const Value : string);
    Procedure SetFiltered(Value:Boolean);

    {IDCLocate}
    Function Locate(const KeyFields : string;const KeyValues:Variant):Boolean;
    Function Lookup(const KeyFields : string;const KeyValues:Variant;
                    const ResultFields : string):Variant;

    {IDCNavigation}
    Procedure First;
    Function GetBof:Boolean;
    Function GetEof:Boolean;
    Procedure Last;
    Procedure Next;
    Procedure Prev;

    {IDCRowBlob}
    Function CreateBlobStream(const Prop:IDCProperty;BlobMode:TBlobOpenMode):IDCSequentialStream;

    {IDCRowChange}
    Procedure Append;
    Procedure Cancel;
    Procedure Delete;
    Procedure Edit;
    Procedure Insert;
    Procedure Post;

    {IDCRowData}
    Function GetData(Var RowCount:Integer):Variant;
    Procedure SetData(const Data:Variant);

    {IDCRowSet}
    Function GetRow:IUnknown;
    Function GetFields:IDCColumns;

    {IDCRowSetRefresh}
    Procedure Refresh;

    {IDCSafeUpdates}
    Procedure SafeBeginUpdate;
    Procedure SafeEndUpdate;

    {IDCUpdates}
    Procedure BeginUpdate;
    Procedure EndUpdate;

    {IUnknown}
    Function QueryInterface(const IID:TGuid;out Obj):HResult;override;stdcall;

    {IDCBookMarksEx}
    function CompareBookMarks(const B1, B2 : TDCBookMark) : integer;
    function BookMarkValid(const BookMark : TDCBookMark) : boolean;

    {IDCHomogeneous}
    function IsHomogeneous : boolean;
  Public
    Constructor Create;virtual;
    Destructor Destroy;override;

    Property DataSet:TDataSet read FDataSet write SetDataSet;
  End;

Function DataSetToInfoSet(DataSet:TDataSet):IUnknown;
Var
  Item:TDataSetItem;
  Index:Integer;
  InfoSet:TDataSetIntf;
begin
  If DataSet=Nil Then
  Begin
    Result:=Nil;
    Exit;
  End;
  If DataSetToInfoSetList=Nil Then
    DataSetToInfoSetList:=TSortedCompKeyList.Create(TDataSetItem);
  Index:=DataSetToInfoSetList.IndexOfKey(DataSet);
  If Index<0 Then
    Item:=Nil
  Else
    Item:=DataSetToInfoSetList[Index];
  If Item=Nil Then
  Begin
    InfoSet:=TDataSetIntf.Create;
    InfoSet.DataSet:=DataSet;
    Item:=TDataSetItem(DataSetToInfoSetList.Add(DataSet));
    Item.InfoSet:=InfoSet;
  End;
  Inc(Item.RefCount);
  Result:=Item.InfoSet;
end;

{---------------------------------------------------------}

Procedure RemoveDataSet(DataSet:TDataSet);
Var
  Item:TDataSetItem;
  Index:Integer;
Begin
  If DataSet=Nil Then
    Exit;
  If DataSetToInfoSetList=Nil Then
    Exit;
  Index:=DataSetToInfoSetList.IndexOfKey(DataSet);
  If Index<0 Then
    Item:=Nil
  Else
    Item:=DataSetToInfoSetList[Index];
  If Item<>Nil Then
  Begin
    Dec(Item.RefCount);
    If Item.RefCount=0 Then
      DataSetToInfoSetList.Remove(Item);
  End;
End;

Function ResetInfoSet(const DetailInfoSet:IUnknown;Value:TComponent):IUnknown;
Var
  GetDataSet:IDCGetDataSet;
  Unknown,Obj:IUnknown;
Begin
  If Value=Nil Then
    Result:=Nil
  Else
  Begin
    If Value Is TDataSet Then
    Begin
      If DetailInfoSet<>Nil Then
      Begin
        DetailInfoSet.QueryInterface(IDCGetDataSet,GetDataSet);
        If GetDataSet<>Nil Then
          RemoveDataSet(GetDataSet.GetDataSet);
      End;
      Result:=DataSetToInfoSet(TDataSet(Value));
    End
    Else
      If Value.GetInterface(IUnknown,Unknown) Then
        If Unknown.QueryInterface(IDCRowSet,Obj)=S_OK Then
          Result:=Obj
        Else
          Error(SErrNotInfoSetDataSet)
      Else
        Error(SErrNotInfoSetDataSet);
  End;
End;

Var
  UniqueFields:TList;

Type
  TUniqueField=Class
  Public
    DataSet:TDataSet;
    FieldName:String;
  End;

Function FindDataSet(DataSet:TDataSet):Integer;
Var
  I:Integer;
Begin
  If UniqueFields=Nil Then
    Result:=-1
  Else
  Begin
    For I:=0 To UniqueFields.Count-1 Do
      If TUniqueField(UniqueFields[I]).DataSet=DataSet Then
      Begin
        Result:=I;
        Exit;
      End;
    Result:=-1;    
  End;
End;

Function FindUniqueField(DataSet:TDataSet):TField;
Var
  Index:Integer;
  FieldName:String;
Begin
  Index:=FindDataSet(DataSet);
  If Index<0 Then
    Result:=Nil
  Else
  Begin
    FieldName:=TUniqueField(UniqueFields[Index]).FieldName;
    Result:=DataSet.FieldByname(FieldName);
    If Result<>Nil Then
    Begin
      If Result.DataSize=0 Then
        Result:=Nil
      Else
        If Not (Result.DataType In [ftString,ftSmallInt,ftAutoInc,ftInteger,ftWord,
                                    ftBoolean,ftFloat,ftCurrency{$IFDEF D4},ftWideString{$ENDIF}
                                    {$IFDEF D5},ftGUID{$ENDIF}]) Then
          Result:=Nil;
      If Result=Nil Then
        ErrorFmt(SErrUnsupportedDataType,[FieldName]);
    End;      
  End;
End;

Procedure RegisterUniqueField(DataSet:TDataSet;Const FieldName:String);
Var
  UniqueField:TUniqueField;
Begin
  If UniqueFields=Nil Then
    UniqueFields:=TList.Create;
  If FindDataSet(DataSet)>=0 Then
    Error(SErrUniqueFieldAlreadyRegistered);
  UniqueField:=TUniqueField.Create;
  UniqueField.DataSet:=DataSet;
  UniqueField.FieldName:=FieldName;
  UniqueFields.Add(UniqueField);
End;

Procedure UnRegisterUniqueField(DataSet:TDataSet);
Var
  Index:Integer;
Begin
  Index:=FindDataSet(DataSet);
  If Index<0 Then
    Error(SErrUniqueFieldIsNotRegistered);
  TObject(UniqueFields[Index]).Free;  
  UniqueFields.Delete(Index);
  If UniqueFields.Count=0 Then
  Begin
    UniqueFields.Free;
    UniqueFields:=Nil;
  End;
End;

{******************************************************************}

{ TD2DCStream }

Constructor TD2DCStream.Create(Stream:TStream);
Begin
  Inherited Create;
  FStream:=Stream;
End;

{---------------------------------------------------------}

Destructor TD2DCStream.Destroy;
Begin
  FStream.Free;
  Inherited;
End;

{---------------------------------------------------------}

Function TD2DCStream.Read(var Data:Variant;cbSize:Integer):Integer;
Var
  DataPtr:Pointer;
  DataReaded:Pointer;
Begin
  GetMem(DataReaded,cbSize);
  Try
    Result:=FStream.Read(DataReaded^,cbSize);
    Data:=VarArrayCreate([0,Result-1],varByte);
    DataPtr:=VarArrayLock(Data);
    Try
      Move(DataReaded^,DataPtr^,Result);
    Finally
      VarArrayUnlock(Data);
    End;
  Finally
    FreeMem(DataReaded);
  End;
End;

{---------------------------------------------------------}

Function TD2DCStream.Write(const Data:Variant;cbSize:Integer):Integer;
Var
  DataPtr:Pointer;
Begin
  DataPtr:=VarArrayLock(Data);
  Try
    Result:=FStream.Write(DataPtr^,cbSize);
  Finally
    VarArrayUnlock(Data);
  End;    
End;

{ TFieldsData }

Constructor TFieldsData.Create(Fields:IDCColumns);
Begin
  Inherited Create;
  CreateDataInfo(Fields);
End;

{---------------------------------------------------------}

Destructor TFieldsData.Destroy;
Begin
  FreePointer(Pointer(FDataInfos));
End;

{---------------------------------------------------------}

{Procedure TFieldsData.ClearStatus(Index:Integer);
Var
  Status:PByte;
Begin
  Status:=@ActiveBuffer[FDataInfos[Index].StatusOffset];
  Status^:=DBSTATUS_EMPTY;
End;}

{---------------------------------------------------------}

Procedure TFieldsData.CreateDataInfo(Const Fields:IDCColumns);
Var
  Field:IDCColumn;
  FieldSize:Integer;
  I:Integer;
  Count:Integer;
Begin
  FDataSize:=0;
  Count:=Fields.Count;
  GetMem(FDataInfos,SizeOf(TDataInfo)*Count);
  For I:=0 To Count-1 Do
    With FDataInfos[I] Do
    Begin
      Field:=Fields[I] As IDCColumn;
      StatusOffset:=FDataSize;
      Inc(FDataSize);
      ValueOffset:=FDataSize;
      FieldSize:=Field.GetSize;
      If Field.PropType=DBTYPE_STR Then Inc(FieldSize);
      Inc(FDataSize,FieldSize);
    End;
End;

{---------------------------------------------------------}

Function TFieldsData.GetChanged(Index:Integer):Boolean;
Var
  Status:PByte;
Begin
  Status:=@ActiveBuffer[FDataInfos[Index].StatusOffset];
  Result:=(Status^ And DBSTATUS_CHANGED)<>0;
End;

{---------------------------------------------------------}

{!Function TFieldsData.GetIsDefault(Index:Integer):Boolean;
Var
  Status:PByte;
Begin
  Status:=@ActiveBuffer[FDataInfos[Index].StatusOffset];
  Result:=(Status^ And DBSTATUS_DEFAULT)<>0;
End;}

{---------------------------------------------------------}

Function TFieldsData.GetIsNull(Index:Integer):Boolean;
Var
  Status:PByte;
Begin
  Status:=@ActiveBuffer[FDataInfos[Index].StatusOffset];
  Result:=(Status^ And DBSTATUS_NULL)<>0;
End;

{---------------------------------------------------------}

{Function TFieldsData.GetValueOffset(Index:Integer):Integer;
Begin
  Result:=FDataInfos[Index].ValueOffset;
End;}

{---------------------------------------------------------}

Function TFieldsData.GetValuePtr(Index:Integer):Pointer;
Begin
  Result:=@ActiveBuffer[FDataInfos[Index].ValueOffset];
End;

{---------------------------------------------------------}

{!Function TFieldsData.GetStatusOffset(Index:Integer):Integer;
Begin
  Result:=FDataInfos[Index].StatusOffset;
End;}

{---------------------------------------------------------}

{!Function TFieldsData.GetStatusPtr(Index:Integer):Pointer;
Begin
  Result:=@ActiveBuffer[FDataInfos[Index].StatusOffset];
End;}

{---------------------------------------------------------}

{!Procedure TFieldsData.SetChanged(Index:Integer;Value:Boolean);
Var
  Status:PByte;
Begin
  Status:=@ActiveBuffer[FDataInfos[Index].StatusOffset];
  If Value Then
    Status^:=Status^ Or DBSTATUS_CHANGED
  Else
    Status^:=Status^ And Not DBSTATUS_CHANGED;
End;}

{---------------------------------------------------------}

{!Procedure TFieldsData.SetIsDefault(Index:Integer;Value:Boolean);
Var
  Status:PByte;
Begin
  Status:=@ActiveBuffer[FDataInfos[Index].StatusOffset];
  If Value Then
    Status^:=Status^ Or DBSTATUS_DEFAULT
  Else
    Status^:=Status^ And Not DBSTATUS_DEFAULT;
End;}

{---------------------------------------------------------}

Procedure TFieldsData.SetIsNull(Index:Integer;Value:Boolean);
Var
  Status:PByte;
Begin
  Status:=@ActiveBuffer[FDataInfos[Index].StatusOffset];
  If Value Then
    Status^:=Status^ Or DBSTATUS_NULL
  Else
    Status^:=Status^ And Not DBSTATUS_NULL;
End;

{ TDCCustomInfoSet }

Constructor TDCCustomInfoSet.Create;
Begin
  Inherited;
  FNotifiersHolder:=TNotifiersHolder.Create;
  FEnableEvents:=True;
End;

{---------------------------------------------------------}

function TDCCustomInfoSet.GetEnableEvents : boolean;
begin
  result := True;//fEnableEvents and _EventsEnabled;
end;

{---------------------------------------------------------}

function TDCCustomInfoSet.GetActive : boolean;
begin
  result := fActive;
end;

{---------------------------------------------------------}

Procedure TDCCustomInfoSet.Connect;
Var
  IsSendNotification:Boolean;
Begin
  If Active Then
    Exit;

  fActive:=True;

  IsSendNotification:=True;
  Try
    InternalConnect(IsSendNotification);
  Except
    Try
      Disconnect;
    Finally
      fActive:=False;
    End;
  End;
  If IsSendNotification Then
    Event(Self,evActiveChanged,True);
End;

{---------------------------------------------------------}

Procedure TDCCustomInfoSet.Disconnect;
Var
  IsSendNotification:Boolean;
Begin
  Try
    InternalDisconnect(IsSendNotification);
  Finally
    fActive:=False;
  End;
  IsSendNotification:=True;
  If IsSendNotification Then
    Event(Self,evActiveChanged,False);
End;

{---------------------------------------------------------}

Procedure TDCCustomInfoSet.Event(const EventSource : IUnknown; EventType:Integer;const EventData:Variant);
Var
  EventRec:TEventRec;
Begin
  If EnableEvents Then
  Begin
    BuildEventRec(EventRec,EventSource,EventType,EventData);
    FNotifiersHolder.CallHandlers(@EventRec);
  End;  
End;

{---------------------------------------------------------}

Procedure TDCCustomInfoSet.FieldChanged(const Field:IDCColumn);
Var
  Data:Variant;
Begin
  If Field=Nil Then
    Data:=Null
  Else
    Data:=Field;  
  Event(Self,evFieldChanged,Data);
End;

{---------------------------------------------------------}

Function TDCCustomInfoSet.GetConnected:Boolean;
Begin
  Result := Active;
End;

{---------------------------------------------------------}

Procedure TDCCustomInfoSet.InternalConnect(Var IsSendNotification:Boolean);
Begin
End;

{---------------------------------------------------------}

Procedure TDCCustomInfoSet.InternalDisconnect(Var IsSendNotification:Boolean);
Begin
End;

{---------------------------------------------------------}

Procedure TDCCustomInfoSet.RegisterHandler(const EventHandler:IDCEventHandler;EventTypes, UserData : DWORD);
Begin
  FNotifiersHolder.RegisterHandler(EventHandler, EventTypes, UserData);
End;

{---------------------------------------------------------}

Procedure TDCCustomInfoSet.RowChanged;
Begin
  Event(Self,evRowChanged,Null);
End;

{---------------------------------------------------------}

Procedure TDCCustomInfoSet.SetConnected(Value:Boolean);
Begin
  If Value Then
    Connect
  Else
    Disconnect;  
End;

{---------------------------------------------------------}

Procedure TDCCustomInfoSet.UnregisterHandler(const EventHandler:IDCEventHandler);
Begin
  If FNotifiersHolder=Nil Then
    Exit;
  FNotifiersHolder.UnregisterHandler(EventHandler);
End;

{ TDCCustomProps }

Constructor TDCCustomProps.Create;
Begin
  Inherited Create;
  FFields:=TList.Create;
End;

{---------------------------------------------------------}

Destructor TDCCustomProps.Destroy;
Var
  I:Integer;
  Item:Pointer;
Begin
  For I:=0 To FFieldCount-1 Do
  Begin
    Item:=FFields[I];
    DestroyProperty(Item);
    TDCInterfacedObject(Item)._Release;
  End;
  FreeObject(FFields,FFields);
  Inherited;
End;

{---------------------------------------------------------}

Procedure TDCCustomProps.AddProperty(AProperty:Pointer);
Begin
  FFields.Add(AProperty);
End;

{---------------------------------------------------------}

Procedure TDCCustomProps.DestroyProperty(AProperty:Pointer);
Begin
End;

{---------------------------------------------------------}

Function TDCCustomProps.GetCount:Integer;
Begin
  Result:=FFieldCount;
End;

{---------------------------------------------------------}

Function TDCCustomProps.GetItem(Index:Integer):IUnknown;
Begin
  Result:=IUnknown(TDCInterfacedObject(FFields[Index])) As IDCColumn;
End;

{---------------------------------------------------------}

Function TDCCustomProps.GetObject(Index:Integer):TObject;
Begin
  Result:=FFields[Index];
End;

{ TDataSetDataLink }

Constructor TDataSetDataLink.Create(ADataSetIntf:TDataSetIntf);
Begin
  Inherited Create;
  FDataSetIntf:=ADataSetIntf;
End;

{---------------------------------------------------------}

Procedure TDataSetDataLink.ActiveChanged;
Begin
  FDataSetIntf.ActiveChanged(Active);
End;

{---------------------------------------------------------}

Procedure TDataSetDataLink.DataSetChanged;
Begin
  FDataSetIntf.DataSetChanged;
End;

{---------------------------------------------------------}

{Procedure TDataSetDataLink.LayoutChanged;
Begin
  FDataSetIntf.LayoutChanged;
End;}

{---------------------------------------------------------}

Procedure TDataSetDataLink.RecordChanged(Field:TField);
Begin
  FDataSetIntf.RecordChanged(Field);
End;

{------------------P R O C E D U R E S--------------------}

Procedure CallHandlers(Self:TObject;Proc:Pointer);
Type
  TProcWithoutParams=Procedure(Self:TObject);
Var
  I:Integer;
  List:TList;
Begin
  TProcWithoutParams(GetOldProc(Self,Proc))(Self);
  List:=GetHandlersList(Self,Proc);
  If List=Nil Then Exit;
  For I:=0 To List.Count-1 Do
    With TMethod(List.List[I]^) Do
      TProcWithoutParams(Code)(Data);
End;

{---------------------------------------------------------}

Procedure AfterCancelProc(Self:TObject);
Begin
  CallHandlers(Self,@TPublicDataSet.DoAfterCancel);
End;

{---------------------------------------------------------}

Procedure AfterDeleteProc(Self:TObject);
Begin
  CallHandlers(Self,@TPublicDataSet.DoAfterDelete);
End;

{---------------------------------------------------------}

Procedure AfterInternalPostProc(Self:TObject);
Begin
  CallHandlers(Self,@TPublicDataSet.InternalPost);
End;

{---------------------------------------------------------}

Procedure AfterPostProc(Self:TObject);
Begin
  CallHandlers(Self,@TPublicDataSet.DoAfterPost);
End;

{---------------------------------------------------------}

Procedure BeforeDeleteProc(Self:TObject);
Begin
  CallHandlers(Self,@TPublicDataSet.DoBeforeDelete);
End;

{---------------------------------------------------------}

Procedure BeforePostProc(Self:TObject);
Begin
  CallHandlers(Self,@TPublicDataSet.DoBeforePost);
End;

{---------------------------------------------------------}

Procedure DataEventProc(Self:TObject;DataEvent:TDataEvent;Info:LongInt);
Type
  TDataEventProc=Procedure(Self:TObject;DataEvent:TDataEvent;Info:LongInt);
Var
  I:Integer;
  List:TList;
  Data:Pointer;
Begin
  TDataEventProc(GetOldProc(Self,@TPublicDataSet.DataEvent))(Self,DataEvent,Info);
  If Not (DataEvent In [deUpdateState,deDataSetChange,deDataSetScroll]) Then
    Exit;
  List:=GetHandlersList(Self,@TPublicDataSet.DataEvent);
  If List=Nil Then Exit;
  Data:=List.List;
  For I:=0 To List.Count-1 Do
  Begin
    With TMethod(Pointer(Data^)^) Do
      TDataEventProc(Code)(Data,DataEvent,Info);
    Inc(Integer(Data),4);
  End;    
End;

{---------------------------------------------------------}

Procedure SetFilteredProc(Self:TObject;Value:Boolean);
Type
  TSetFilteredProc=Procedure(Self:TObject;Value:Boolean);
Var
  I:Integer;
  List:TList;
  Proc:Pointer;
  fOldFiltered : boolean;
Begin
  fOldFiltered := TDataSet(Self).Filtered;

  Proc:=@TPublicDataSet.SetFiltered;
  TSetFilteredProc(GetOldProc(Self,Proc))(Self,Value);

  If TDataSet(Self).Filtered = fOldFiltered Then
    Exit;

  List:=GetHandlersList(Self,Proc);
  If List=Nil Then Exit;
  For I:=0 To List.Count-1 Do
    With TMethod(List.List[I]^) Do
      TSetFilteredProc(Code)(Data,Value);
End;

{---------------------------------------------------------}

Procedure SetFilterTextProc(Self:TObject;const Value:String);
Type
  TSetFilterTextProc=Procedure(Self:TObject;const Value:String);
Var
  I:Integer;
  List:TList;
  Proc:Pointer;
  fOldFilter : string;
Begin
  fOldFilter := TDataSet(Self).Filter;

  Proc:=@TPublicDataSet.SetFilterText;
  TSetFilterTextProc(GetOldProc(Self,Proc))(Self,Value);

  If TDataSet(Self).Filter=fOldFilter Then
    Exit;

  List:=GetHandlersList(Self,Proc);
  If List=Nil Then Exit;
  For I:=0 To List.Count-1 Do
    With TMethod(List.List[I]^) Do
      TSetFilterTextProc(Code)(Data,Value);
End;

{---------------------------------------------------------}

function IsDataTypeSupported(Field : TField) : boolean;
begin
  case Field.DataType of
    {$IFDEF D4}
    ftWideString,
    ftLargeInt,
    {$IFDEF D5}
    ftGuid,
    {$ENDIF}
    {$ENDIF}
    ftString, ftSmallInt, ftAutoInc, ftInteger, ftWord, ftBoolean, ftFloat,
    ftBCD, ftDate, ftDateTime, ftTime, ftMemo, ftBlob, ftGraphic, ftFmtMemo,
    ftParadoxOle, ftDBaseOle, ftBytes, ftVarBytes, ftTypedBinary, ftCurrency:
      result := true
  else
    result := false;
  end;
end;

{---------------------------------------------------------}

function BDEToOleDataType(Field : TField) : Integer;
begin
  case Field.DataType of
    ftString   : Result := DBTYPE_STR;
    ftSmallInt : Result := DBTYPE_I2;

    ftAutoInc,
    ftInteger  : Result := DBTYPE_I4;

    ftWord     : Result := DBTYPE_UI2;
    ftBoolean  : Result := DBTYPE_BOOL;
    ftFloat    : Result := DBTYPE_R8;
    ftBCD      : Result := DBTYPE_DECIMAL;

    ftDate     : Result := DBTYPE_DBDATE;

    ftDateTime : Result := DBTYPE_DATE;

    ftTime     : Result := DBTYPE_DBTIME;

    ftMemo, ftBlob, ftGraphic, ftFmtMemo,
    ftParadoxOle, ftDBaseOle, ftBytes, ftVarBytes,
    ftTypedBinary : Result := DBTYPE_IUNKNOWN;

    ftCurrency : Result := DBTYPE_CY;
{$IFDEF D4}
    ftWideString : Result := DBTYPE_BSTR;
    ftLargeInt   : Result := DBTYPE_I8;
{$IFDEF D5}
    ftGuid       : Result := DBTYPE_GUID;
{$ENDIF}
{$ENDIF}
  else
    Result := DBTYPE_EMPTY;
    ErrorFmt(SErrUnsupportedDataType, [Field.FieldName]);
  end;
end;

{ TDataSetField }

Constructor TDataSetField.Create(ADataSetProps:TFieldProps;ADataSet:TDataSet;AField:TField);
Begin
  Inherited Create;
  FDataSet:=ADataSet;
  FDataSetIntf:=ADataSetProps;
  LinkTo(AField);
End;

{---------------------------------------------------------}

Procedure TDataSetField.CheckActive;
Begin
  If (FField=Nil) Or (FField.DataSet=Nil) Then
    ErrorFmt(SErrFieldDestroyed,[FFieldName]);
End;

{---------------------------------------------------------}

Procedure TDataSetField.CheckReadOnly;
Begin
  If Not (atCanWrite in GetAttributes) Then
    ErrorFmt(SErrFieldReadOnly,[GetName]);
End;

{---------------------------------------------------------}

Function TDataSetField.GetAttributes:TPropAttributes;
Begin
  If FField=Nil Then
  Begin
    result:=[atCanRead];
    Exit;
  End;
  If FField.CanModify Then
    Include(FAttributes,atCanWrite)
  Else
    Exclude(FAttributes,atCanWrite);
  Result:=FAttributes;
End;

{---------------------------------------------------------}

Function TDataSetField.GetName : String;
Begin
  Result:=FFieldName;
End;

{---------------------------------------------------------}

Function TDataSetField.GetPropType:TDCPropType;
Begin
  Result:=FPropType;
End;

{---------------------------------------------------------}

Function TDataSetField.GetSize:Integer;
Begin
  Result:=FSize;
End;

{---------------------------------------------------------}

Function TDataSetField.GetValue:Variant;
Begin
  CheckActive;
  Result:=FField.AsVariant;
End;

{---------------------------------------------------------}

function TDataSetField.GetString : string;
begin
//  result := fField.AsString;
  result := fField.DisplayText;
end;

{---------------------------------------------------------}

Function TDataSetField.GetText:String;
Begin
  Result:=FField.AsString;
End;

{---------------------------------------------------------}

Procedure TDataSetField.LinkTo(AField:TField);
Begin
  FField:=AField;

  FFieldName:=FField.FieldName;
  FAttributes:=[atCanRead];
  If FField.Required Then
    Include(FAttributes,atRequired);
  FPropType:=BDEToOleDataType(FField);
  FSize:=FField.DataSize;
  Case FField.DataType Of
    ftString:Inc(FSize);
    ftTime,ftDate:FSize:=SizeOf(TDateTime);
  End;
End;

{---------------------------------------------------------}

Procedure TDataSetField.SetValue(const Value:Variant);
Begin
  CheckActive;
  CheckReadOnly;
  FField.AsVariant:=Value;
End;

{---------------------------------------------------------}

function TDataSetField.IsValidChar(InputChar: Char): Boolean;
begin
  CheckActive;
  result := fField.IsValidChar(InputChar);
end;

{---------------------------------------------------------}

function TDataSetField.GetDisplayName : string;
begin
  CheckActive;
  result := fField.DisplayName;
end;

{---------------------------------------------------------}

function TDataSetField.GetDisplayWidth : integer;
begin
  CheckActive;
  result := fField.DisplayWidth;
end;

{---------------------------------------------------------}

Constructor TFieldProps.Create(ADataSet:TDataSet);
Begin
  Inherited Create;
  fDataSet := ADataSet;
  CreateFields;
End;

{---------------------------------------------------------}

Destructor TFieldProps.Destroy;
Begin
  if FieldsCreated and not (csDestroying in fDataSet.ComponentState) then
    TPublicDataSet(FDataSet).DestroyFields;

  Inherited;
End;

{---------------------------------------------------------}

procedure TFieldProps.CreateFields;
var
  i : integer;
  Field        : TField;
  DataSetField : TDataSetField;
begin
  FieldCount := 0;
  FieldsCreated := FDataSet.FieldCount = 0;
  if FieldsCreated then
    TPublicDataSet(FDataSet).CreateFields;

  for i := 0 to FDataSet.FieldCount - 1 do
    begin
      Field := fDataSet.Fields[I];
      if IsDataTypeSupported(Field) then
        begin
          DataSetField := TDataSetField.Create(Self, fDataSet, Field);
          FieldCount := FieldCount + 1;
          DataSetField._AddRef;
          AddProperty(DataSetField);
          dcAddFreeNotification(Field,Notification);
        end;
    end;
end;

{---------------------------------------------------------}

Procedure TFieldProps.DestroyProperty(AProperty:Pointer);
Begin
  dcRemoveFreeNotification(TDataSetField(AProperty).FField,Notification);
  TDataSetField(AProperty).FField:=Nil;
End;

{---------------------------------------------------------}

Procedure TFieldProps.Notification(Instance:TObject);
Begin
  UpdateFields(TField(Instance));
  dcRemoveFreeNotification(Instance,Notification);
End;

{---------------------------------------------------------}

Procedure TFieldProps.UpdateFields(Field:TField);
Var
  I:Integer;
Begin
  If FFields=Nil Then
    Exit;
  For I:=0 To FieldCount-1 Do
  With TDataSetField(Objects[I]) Do
    If FField=Field Then
      FField:=Nil;
End;

{---------------------------------------------------------}

function TDataSetField.GetDatasetField: TField;
begin
  result := fField;
end;

{ TDataSetIntf }

Constructor TDataSetIntf.Create;
Begin
  Inherited Create;
  FDataSource:=TDataSource.Create(Nil);
  FDataLink:=TDataSetDataLink.Create(Self);
  FDataLink.DataSource:=FDataSource;
  FNotifyComp:=TDCLinkedComponent.Create(Nil);
  FNotifyComp.NotifyProc:=Notification;
  FFilters:=TStringList.Create;
End;

{---------------------------------------------------------}

Destructor TDataSetIntf.Destroy;
Begin
  SetConnected(False);
  DataSet:=Nil;
  FreeObject(FNotifyComp,FNotifyComp);
  FreeObject(FDataLink,FDataLink);
  FreeObject(FDataSource,FDataSource);
  FreeObject(FFilters,FFilters);
  Inherited;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.AddFilter(const AFilter:String);
Var
  OldFilter:String;
Begin
  If FFilters.Count=0 Then
    FSavedFiltered:=FDataSet.Filtered;

  FFilters.Add(FDataSet.Filter);
  OldFilter:=FFilters[0];
  If Not FSavedFiltered Then
    OldFilter:='';

  if OldFilter <> '' then
    begin
      if AFilter <> '' then
        OldFilter := '('+OldFilter+') And ('+AFilter+')' //don't resource
    end
  else
    OldFilter := AFilter;

  Try
    FDataSet.Filter := OldFilter;
  Except
    FFilters.Delete(FFilters.Count-1);
    Raise;
  End;  
  FDataSet.Filtered := True;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.ActiveChanged(IsActive:Boolean);
Begin
  If IsActive Then
    Connect
  Else
    Disconnect;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.AfterCancel;
Var
  ABookmark:TDCBookmark;
Begin
  If FIsInsert Then
    ABookmark:=NullBookMark
  Else
    ABookmark:=GetBookmark;
  Event(Self,evEditCanceled,ABookmark);
  FIsInsert:=False;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.AfterDelete;
Begin
  Event(Self, evRowDeleted,FLastBookmark);
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.AfterInternalPost;
Begin
  Event(Self,evAfterInternalPost,Null);
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.AfterPost;
Begin
  If FIsInsert Then
    begin
      Event(Self,evRowInserted,GetBookmark);
      FIsInsert:=False;
    end
  Else
    Event(Self, evRecordChanged, FSavedBookMark);
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.AfterSetFiltered(Value:Boolean);
Begin
  If _TDataSet(FDataSet).FDisableCount=0 Then
    If FDataSet.Filter<>'' Then
      Event(Self,evActiveChanged,True);
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.AfterSetFilterText(const Value:String);
Begin
  If FDataSet.Filtered Then
    If _TDataSet(FDataSet).FDisableCount=0 Then
      Event(Self,evActiveChanged,True);
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.Append;
Begin
  CheckActive;
  DataSet.Append;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.BeforeDelete;
Begin
  FLastBookmark:=GetBookmark;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.BeginUpdate;
Begin
  If FDataSet=Nil Then
    Exit;
  FDataSet.DisableControls;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.BeforePost;
Begin
  FIsInsert := DataSet.State=dsInsert;

  If Not FIsInsert Then
    FSavedBookmark:=GetBookmark;

  Event(Self, evBeforePost, NULL);
End;

{---------------------------------------------------------}

Function TDataSetIntf.CanAppend:Boolean;
Begin
  Result:=False;
  If FDataSet=Nil Then
    Exit;
  Result:=FDataSet.CanModify;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.Cancel;
Begin
  CheckActive;
  DataSet.Cancel;
End;

{---------------------------------------------------------}

Function TDataSetIntf.CanEdit:Boolean;
Begin
  CheckActive;
  Result:=FDataSet.CanModify;
End;

{---------------------------------------------------------}

Function TDataSetIntf.CanDelete:Boolean;
Begin
  CheckActive;
  Result:=FDataSet.CanModify;
End;

{---------------------------------------------------------}

Function TDataSetIntf.CanInsert:Boolean;
Begin
  Result:=False;
End;

{---------------------------------------------------------}

Function TDataSetIntf.CanView:Boolean;
Begin
  CheckActive;
  Result:=FDataSet.CanModify;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.CheckActive;
Begin
  CheckSetDataSet;
  If Not FChecked Then
    CreateDataSetInfo;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.CheckSetDataSet;
Begin
  If DataSet=Nil Then
    Error(SErrSetInfoSet);
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.Connect;
Begin
  FUniqueField:=FindUniqueField(FDataSet);
  Inherited;
End;

{---------------------------------------------------------}

Function TDataSetIntf.CreateBlobStream(const Prop:IDCProperty;BlobMode:TBlobOpenMode):IDCSequentialStream;
Var
  BlobStream:TStream;
  Field:TField;
Begin
  CheckActive;
  Field:=DataSet.FieldByName(Prop.Name);
  BlobStream:=DataSet.CreateBlobStream(Field,TBlobStreamMode(BlobMode));
  Result:=IDCSequentialStream(TD2DCStream.Create(BlobStream));
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.CreateDataSetInfo;
Begin
  If FFieldPropsIntf=Nil Then
  Begin
    FFieldProps:=TFieldProps.Create(DataSet);
    FFieldPropsIntf:=FFieldProps;
  End;
  FFieldsData:=TFieldsData.Create(FFieldPropsIntf As IDCColumns);
  FDataLinks:=TList.Create;
  FDetailDataLinks:=TList.Create;
  FDetailDataSets:=TList.Create;
  FDataSources:=TList.Create;
  FFieldList:=TList.Create;
  FChecked:=True;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.Disconnect;
Begin
  Inherited;
  FUniqueField:=Nil;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.Event2(EventType : Integer; const EventData : string);
begin
  Event(self, EventType, EventData);
end;

{---------------------------------------------------------}

Procedure TDataSetIntf.Event3(EventType : Integer; const EventData : integer);
begin
  Event(self, EventType, EventData);
end;

{---------------------------------------------------------}

Procedure TDataSetIntf.DataEvent(DataEvent:TDataEvent;Info:LongInt);
Begin
  If FIsNotifyDetails Then
    Exit;
  Case DataEvent Of
    deUpdateState:
      Begin
        UpdateDataSetState(FDataSetState,FDataSet.State);
        FDataSetState:=FDataSet.State;
        If FDataSet.State in [dsEdit] Then
          Event2(evEditStarted, GetBookMark);
      End;
    deFieldListChange:
      Event3(evFieldListChange,0);
  End;
  NotifyDetailDataSets(DataEvent,Info);
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.DataSetChanged;
Begin
  If Not (FDataSet.State in [dsInsert]) Then
    RowChanged;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.Delete;
Begin
  CheckActive;
  DataSet.Delete;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.DestroyDataSetInfo;
Begin
  FreeObject(FFieldsData,FFieldsData);
  FFieldPropsIntf:=Nil;
  FChecked:=False;

  FreeObject(FDataSources,FDataSources);
  FreeObject(FDataLinks,FDataLinks);
  FreeObject(FDetailDataLinks,FDetailDataLinks);
  FreeObject(FDetailDataSets,FDetailDataSets);
  FreeObject(FFieldList,FFieldList);
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.Edit;
Begin
  CheckActive;
  DataSet.Edit;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.EndUpdate;
Begin
  If FDataSet=Nil Then
    Exit;
  FDataSet.EnableControls;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.First;
Begin
  CheckActive;
  DataSet.First;
End;

{---------------------------------------------------------}

Function TDataSetIntf.GetBof:Boolean;
Begin
  CheckActive;
  Result:=DataSet.Bof;
End;

{---------------------------------------------------------}

Function TDataSetIntf.GetBookmark:TDCBookMark;
Begin
  CheckActive;
  If FUniqueField<>Nil Then
  Begin
    If FDataSet.Bof And FDataSet.Eof Then
      Exit;
    SetLength(Result,FUniqueField.DataSize);
    FUniqueField.GetData(@Result[1]);
  End
  Else
    Result := fDataSet.Bookmark;
End;

{---------------------------------------------------------}

Function TDataSetIntf.GetData(Var RowCount:Integer):Variant;
Var
  I:Integer;
  Field:TField;
  Index:Integer;
  DateTime:TDateTime;
Begin
  CheckActive;
  Result:=VarArrayCreate([0,FFieldsData.DataSize-1],varByte);
  FFieldsData.ActiveBuffer:=VarArrayLock(Result);
  Try
    For I:=0 To DataSet.FieldCount-1 Do
    Begin
      Field:=DataSet.Fields[I];
      Index:=Field.Index;
      FFieldsData.IsNull[Index]:=Not Field.GetData(Nil);
      If Not Field.IsBlob Then
        If Field.DataType in [ftDate, ftDateTime, ftTime] Then
        Begin
          DateTime:=Field.AsDateTime;
          DateTimeToMSecs(@DateTime,FFieldsData.ValuePtr[Index]);
        End
        Else
          Field.GetData(FFieldsData.ValuePtr[Index]);
    End;
  Finally
    VarArrayUnlock(Result);
  End;
End;

{---------------------------------------------------------}

Function TDataSetIntf.GetDataSet:TDataSet;
Begin
  Result:=FDataSet;
End;

{---------------------------------------------------------}

Function TDataSetIntf.GetEof:Boolean;
Begin
  CheckActive;
  Result:=DataSet.Eof;
End;

{---------------------------------------------------------}

Function TDataSetIntf.GetEventSourceID:Integer;
Begin
  Result:=Integer(FDataSet);
End;

{---------------------------------------------------------}

Function TDataSetIntf.GetFields:IDCColumns;
Begin
  CheckSetDataSet;

  If FDataSet.Active Then
  Begin
    CheckActive;
    Result:=FFieldPropsIntf As IDCColumns;
  End
  Else
  Begin
    Try
      Try
        TPublicDataSet(FDataSet).OpenCursor(True);
        FFieldProps:=TFieldProps.Create(DataSet);
        FFieldPropsIntf:=FFieldProps;
      Finally
        TPublicDataSet(FDataSet).CloseCursor;
      End;
    Except
    End;
    Result:= FFieldPropsIntf As IDCColumns;
    FFieldProps:=Nil;//destroy fields
    FFieldPropsIntf:=Nil;
  End;
End;

{---------------------------------------------------------}

Function TDataSetIntf.GetFilter : String;
Begin
  CheckSetDataSet;
  Result:=FDataSet.Filter;
End;

{---------------------------------------------------------}

Function TDataSetIntf.GetFiltered:Boolean;
Begin
  CheckSetDataSet;
  Result:=FDataSet.Filtered;
End;

{---------------------------------------------------------}

Function TDataSetIntf.GetRow:IUnknown;
Begin
  CheckActive;
  Result:=FFieldPropsIntf;
End;

{---------------------------------------------------------}

Function TDataSetIntf.CompareBookMarks(const B1, B2 : TDCBookMark) : integer;
Begin
  CheckActive;
  If FUniqueField<>Nil Then
    Result:=CompareStr(B1,B2)
  Else
    result := fDataSet.CompareBookmarks(pointer(B1), pointer(B2));
//  Result:=fDataSet.CompareBookmarks(@B1[1], @B2[1]);
End;

{---------------------------------------------------------}

type
  TMD = class(TDataSet)
  public
    function BookmarkValid(Bookmark: TBookmark): Boolean; override;
  end;

function TMD.BookmarkValid(Bookmark: TBookmark): Boolean;
begin
  result := inherited BookmarkValid(Bookmark);
end;

{---------------------------------------------------------}

var
  BookMarkValidVMTOffset : integer;
  DefaultBMV : ^word;

{---------------------------------------------------------}

type
  PWord = ^word;

function GetRealAddr(p : PWord) : pointer;
begin
  if p^ = $25FF then //package thunk
    integer(result) := PInt(PInt(integer(p) + 2)^)^
  else
    result := p;
end;

{---------------------------------------------------------}

procedure CalcBookMarkValidVMTOffset;
var
  VMT : pointer;
  p   : pointer;
begin
  VMT := TMD;
  while pointer(VMT^) <> Addr(TMD.BookmarkValid) do
    inc(integer(VMT), 4);

  BookMarkValidVMTOffset := integer(VMT) - integer(TMD);
  p := Addr(TMD.BookmarkValid);
  inc(integer(p));
  DefaultBMV := GetRealAddr(pointer(PInt(p)^ + integer(p) + 4));
end;

{---------------------------------------------------------}

Function BookmarkToVariant(Field:TField;Const Bookmark:TDCBookmark):Variant;
Begin
  Case Field.DataType Of
    ftString:Result:=Bookmark;
    ftSmallInt,ftWord:Result:=SmallInt(Pointer(@Bookmark[1])^);
    ftAutoInc,ftInteger:Result:=Integer(Pointer(@Bookmark[1])^);
    ftBoolean:Result:=Boolean(Pointer(@Bookmark[1])^);
    ftFloat:Result:=Double(Pointer(@Bookmark[1])^);
    ftCurrency:Result:=Currency(Pointer(@Bookmark[1])^);
    {$IFDEF D4}ftWideString:Result:=WideString(Pointer(PChar(Bookmark)^));{$ENDIF}
  End;
End;

Function TDataSetIntf.BookMarkValid(const BookMark:TDCBookMark):Boolean;
Var
  Temp:Variant;
Begin
  CheckActive;

  If FUniqueField<>Nil Then
    If FDataSet.State In [dsInsert,dsEdit] Then
      Result:=False
    Else
    Begin
      Temp:=BookmarkToVariant(FUniqueField,Bookmark);
      With FUniqueField Do
        Temp:=FDataSet.LookUp(FieldName,Temp,FieldName);
      Result:=Not VarIsNull(Temp)
    End                        
  Else
    Try
      Result:=True;
      If GetRealAddr(pointer(pointer(integer(GetVMT(fDataSet)) + BookMarkValidVMTOffset)^)) <> DefaultBMV then
      Begin
        Result:=False;
        If Length(BookMark)<>0 Then
          Result:=FDataSet.BookMarkValid(Pointer(Bookmark));
      End;
    Except
      Result:=False;
    End;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.GotoBookmark(const Bookmark:TDCBookMark);
Begin
  CheckActive;
  If FUniqueField<>Nil Then
  Begin
    If Bookmark='' Then
      Exit;
    If Not Locate(FUniqueField.FieldName,BookmarkToVariant(FUniqueField,Bookmark)) Then
      Error(SErrInvalidBookmark);
  End
  Else
    TPublicDataSet(FDataSet).GotoBookmark(Pointer(BookMark));
End;

{---------------------------------------------------------}

function TDataSetIntf.IsHomogeneous : boolean;
begin
  result := true;
end;

{---------------------------------------------------------}

Procedure TDataSetIntf.Insert;
Begin
  CheckActive;
  DataSet.Insert;
End;

{---------------------------------------------------------}

function TDataSetIntf.GetActive : boolean;
begin
//  result := (fDataset <> nil) and fDataSet.Active;
  result := inherited GetActive;
end;

{---------------------------------------------------------}

Procedure TDataSetIntf.InternalConnect(Var IsSendNotification:Boolean);
Begin
  If DataSet=Nil Then
    Error(SErrSetInfoSet);
  UpdateDataSetState(FDataSetState,DataSet.State);
  FDataSetState:=DataSet.State;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.InternalDisconnect(Var IsSendNotification:Boolean);
Begin
  DestroyDataSetInfo;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.InternalSetDataSet(Value:TDataSet);
Begin
  If FDataSet<>Nil Then
  Begin
    DestroyDataSetInfo;
    Event(self,evActiveChanged,False);
    RemoveHook;
  End;
  FDataSet:=Value;
  If (FDataSet<>Nil)  Then
    SetHook;
  FDataSource.DataSet:=FDataSet;
  FNotifyComp.Link:=FDataSet;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.Last;
Begin
  CheckActive;
  If Not DataSet.Eof Then
    DataSet.Last;
End;

{---------------------------------------------------------}

{Procedure TDataSetIntf.LayoutChanged;
Begin
  DestroyDataSetInfo;
  CreateDataSetInfo;
  Event(self, evFieldListChange,Null);
End;}

{---------------------------------------------------------}

Function TDataSetIntf.Locate(const KeyFields : string;const KeyValues:Variant):Boolean;
Begin
  CheckActive;
  Result:=DataSet.Locate(KeyFields,KeyValues,[]);
End;

{---------------------------------------------------------}

Function TDataSetIntf.Lookup(const KeyFields : string;const KeyValues:Variant;
                             const ResultFields : string):Variant;
Var
  I:Integer;
  Data:Variant;
Begin
  CheckActive;
  If Not (VarIsNull(KeyValues) Or VarIsEmpty(KeyValues)) Then
  Begin
    fFieldList.Clear;
    FDataSet.GetFieldList(FFieldList,KeyFields);
    Result:=True;
    For I:=0 To FFieldList.Count-1 Do
    Begin
      With TField(FFieldList[I]) Do
        If DataType=ftString Then
        Begin
          If FFieldList.Count=1 Then
            Data:=KeyValues
          Else
            Data:=KeyValues[I];
          If VarIsNull(Data) Then
            Data:='';
          Result:=Length(Data)<=Size;
        End;
      If Not Result Then
      Begin
        Result:=Null;
        Exit;
      End;
    End;
    FFieldList.Clear;
  End;  
  Result:=DataSet.Lookup(KeyFields,KeyValues,ResultFields);
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.Next;
Begin
  CheckActive;
  If Not DataSet.Eof Then
    DataSet.Next;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.Notification(Component:TComponent;Operation:TOperation);
Begin
  If Operation=opRemove Then
    DataSet:=Nil;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.NotifyDataLinks(DataEvent:TDataEvent;Info:LongInt);
Var
  {$IFDEF D4}
  I:Integer;
  Data:Pointer;
  {$ELSE}
  OldDataLinks:TList;
  OldDataSources:TList;
  DataSource:TDataSource;
  SavedDisableCount:Integer;
  {$ENDIF}
Begin
  {$IFDEF D4}
    Data:=FDetailDataLinks.List;
    for i := 0 To FDetailDataLinks.Count - 1 Do
    Begin
      TPublicDataLink(Data^).DataEvent(DataEvent,Info);
      Inc(Integer(Data),4);
    End;
  {$ELSE}
  If (FDetailDataLinks.Count<>0) And (_TDataSet(FDataSet).FDisableCount<>0) Then
  Begin
    OldDataSources:=_TDataSet(FDataSet).FDataSources;
    DataSource:=TDataLink(FDetailDataLinks[0]).DataSource;
    OldDataLinks:=_TDataSource(DataSource).FDataLinks;
    FDataSources.Add(DataSource);
    SavedDisableCount:=_TDataSet(FDataSet).FDisableCount;
    Try
      FIsNotifyDetails:=True;
      _TDataSource(DataSource).FDataLinks:=FDetailDataLinks;
      _TDataSet(FDataSet).FDataSources:=FDataSources;
      _TDataSet(FDataSet).FDisableCount:=0;
      TPublicDataSet(FDataSet).DataEvent(DataEvent,Info);
    Finally
      _TDataSet(FDataSet).FDisableCount:=SavedDisableCount;
      _TDataSet(FDataSet).FDataSources:=OldDataSources;
      _TDataSource(DataSource).FDataLinks:=OldDataLinks;
      FIsNotifyDetails:=False;
      FDataSources.Clear;
    End;
  End;
  {$ENDIF}
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.NotifyDetailDataSets(DataEvent:TDataEvent;Info:LongInt);
Begin
  If FDetailDataLinks=Nil Then
    Exit;
  GetDetailDataLinks(FDataSet,FDetailDataLinks);
  NotifyDataLinks(DataEvent,Info);
  FDetailDataLinks.Count:=0;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.Prev;
Begin
  CheckActive;
  If Not DataSet.Bof Then
    DataSet.Prior;
End;

{---------------------------------------------------------}

Function TDataSetIntf.QueryInterface(const IID:TGuid;out Obj):HResult;
Begin
  If IsEqualGuid(IID,IDCProperties) Then
  Begin
    CheckActive;
    Result:=FFieldPropsIntf.QueryInterface(IID,Obj)
  End
  Else
    Result:=Inherited QueryInterface(IID,Obj);
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.Post;
Begin
  CheckActive;
  DataSet.Post;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.RecordChanged(Field:TField);
Var
  Data:IDCColumn;
Begin
  CheckActive;
  If Field=Nil Then
    Data:=Nil
  Else
    Data:=FFieldPropsIntf[Field.Index] As IDCColumn;
  FieldChanged(Data);
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.Refresh;
Begin
 DataSet.Close;
 DataSet.Open;
 DestroyDataSetInfo;
 CreateDataSetInfo;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.RemoveFilter;
Begin
  If FFilters.Count=0 Then
    Exit;
  If FFilters.Count=1 Then
    FDataSet.Filtered:=FSavedFiltered
  Else
    FDataSet.Filtered:=True;
  FDataSet.Filter:=FFilters[FFilters.Count-1];
  FFilters.Delete(FFilters.Count-1);
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.RemoveHook;
Var
  Method:TMethod;
Begin
  If Not FIsSetHook Then Exit;
  Method.Data:=Self;
  Method.Code:=@TDataSetIntf.BeforeDelete;
  DeleteHook(FDataSet,FDataSetVMT,Method,@TPublicDataSet.DoBeforeDelete);
  Method.Code:=@TDataSetIntf.AfterDelete;
  DeleteHook(FDataSet,FDataSetVMT,Method,@TPublicDataSet.DoAfterDelete);
  Method.Code:=@TDataSetIntf.BeforePost;
  DeleteHook(FDataSet,FDataSetVMT,Method,@TPublicDataSet.DoBeforePost);
  Method.Code:=@TDataSetIntf.AfterPost;
  DeleteHook(FDataSet,FDataSetVMT,Method,@TPublicDataSet.DoAfterPost);
  Method.Code:=@TDataSetIntf.DataEvent;
  DeleteHook(FDataSet,FDataSetVMT,Method,@TPublicDataSet.DataEvent);
  Method.Code:=@TDataSetIntf.AfterCancel;
  DeleteHook(FDataSet,FDataSetVMT,Method,@TPublicDataSet.DoAfterCancel);
  Method.Code:=@TDataSetIntf.AfterInternalPost;
  DeleteHook(FDataSet,FDataSetVMT,Method,@TPublicDataSet.InternalPost);
  Method.Code:=@TDataSetIntf.AfterSetFiltered;
  DeleteHook(FDataSet,FDataSetVMT,Method,@TPublicDataSet.SetFiltered);
  Method.Code:=@TDataSetIntf.AfterSetFilterText;
  DeleteHook(FDataSet,FDataSetVMT,Method,@TPublicDataSet.SetFilterText);
  FIsSetHook:=False;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.RowChanged;
Begin
  Event(Self,evRowChanged,GetBookMark);
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.SafeBeginUpdate;
Begin
  If Not Active Then
    Exit;
  CheckActive;
//  FDataSet.DisableControls;
  IncDisableCount(FDataSet,FDetailDataSets,0,1);
  FDetailDataSets.Count := 0;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.SafeEndUpdate;
Begin
  If Not Active Then
    Exit;
  CheckActive;
//  FDataSet.EnableControls;
  IncDisableCount(FDataSet,FDetailDataSets,0,-1);
  FDetailDataSets.Count := 0;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.SetDataSet(Value:TDataSet);
Begin
  If FDataSet=Value Then Exit;
  InternalSetDataSet(Value);
  If Value=Nil Then
    Exit;
  Event(Self,evActiveChanged,FDataSet.Active);
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.SetFilter(const Value : string);
Begin
  CheckSetDataSet;
  FDataSet.Filter:=Value;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.SetFiltered(Value:Boolean);
Begin
  CheckSetDataSet;
  FDataSet.Filtered:=Value;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.SetHook;
Var
  Method:TMethod;
Begin
  If FIsSetHook Then Exit;
  FDataSetVMT:=GetVMT(FDataSet);
  Method.Data:=Self;
  Method.Code:=@TDataSetIntf.BeforeDelete;
  AddHook(FDataSet,TPublicDataSet,Method,@TPublicDataSet.DoBeforeDelete,@BeforeDeleteProc);
  Method.Code:=@TDataSetIntf.AfterDelete;
  AddHook(FDataSet,TPublicDataSet,Method,@TPublicDataSet.DoAfterDelete,@AfterDeleteProc);
  Method.Code:=@TDataSetIntf.BeforePost;
  AddHook(FDataSet,TPublicDataSet,Method,@TPublicDataSet.DoBeforePost,@BeforePostProc);
  Method.Code:=@TDataSetIntf.AfterPost;
  AddHook(FDataSet,TPublicDataSet,Method,@TPublicDataSet.DoAfterPost,@AfterPostProc);
  Method.Code:=@TDataSetIntf.DataEvent;
  AddHook(FDataSet,TPublicDataSet,Method,@TPublicDataSet.DataEvent,@DataEventProc);
  Method.Code:=@TDataSetIntf.AfterCancel;
  AddHook(FDataSet,TPublicDataSet,Method,@TPublicDataSet.DoAfterCancel,@AfterCancelProc);
  Method.Code:=@TDataSetIntf.AfterInternalPost;
  AddHook(FDataSet,TPublicDataSet,Method,@TPublicDataSet.InternalPost,@AfterInternalPostProc);
  Method.Code:=@TDataSetIntf.AfterSetFiltered;
  AddHook(FDataSet,TPublicDataSet,Method,@TPublicDataSet.SetFiltered,@SetFilteredProc);
  Method.Code:=@TDataSetIntf.AfterSetFilterText;
  AddHook(FDataSet,TPublicDataSet,Method,@TPublicDataSet.SetFilterText,@SetFilterTextProc);
  FIsSetHook:=True;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.SetData(const Data:Variant);
Var
  I:Integer;
  Field:TField;
  Index:Integer;
  DateTime:TDateTime;
Begin
  CheckActive;
  FFieldsData.ActiveBuffer:=VarArrayLock(Data);
  Try
    For I:=0 To DataSet.FieldCount-1 Do
    Begin
      Field:=DataSet.Fields[I];
      Index:=Field.Index;
      If Field.IsBlob Then Continue;
      If FFieldsData.IsNull[Index] Then
        Field.SetData(Nil)
      Else
        If FFieldsData.Changed[Index] Then
          If Field.DataType in [ftDate,ftDateTime,ftTime] Then
          Begin
            MSecsToDateTime(FFieldsData.ValuePtr[Index],@DateTime);
            Field.AsDateTime:=DateTime;
          End
          Else
            Field.SetData(FFieldsData.ValuePtr[Index]);
    End;
  Finally
    VarArrayUnlock(Data);
  End;
End;

{---------------------------------------------------------}

Procedure TDataSetIntf.UpdateDataSetState(OldState:TDataSetState;NewState:TDataSetState);
Begin
  If _TDataSet(FDataSet).FDisableCount<>0 Then
    If (OldState=dsInactive) And (NewState<>dsInactive) Then
      ActiveChanged(True)
    Else
      If (OldState<>dsInactive) And (NewState=dsInactive) Then
        ActiveChanged(False);
End;

{ TDataSetToInfoSet }

Procedure TDataSetToInfoSet.SetDataSet(Value:TDataSet);
Begin
  If FDataSet=Value Then
    Exit;
  FDataSet:=Value;
  FInterface:=ResetInfoSet(FInterface,Value);
  VCLComObject:=Pointer(FInterface);
End;

{---------------------------------------------------------}

Initialization
  CalcBookMarkValidVMTOffset;
Finalization
  DataSetToInfoSetList.Free;
  DataSetToInfoSetList:=Nil;

End.
