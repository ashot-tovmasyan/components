{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit dcInfoRel;
{$I dc.inc}

Interface
Uses
  ActiveX, Classes, SysUtils, Windows, Forms,
  dcInfoLib, dcISet, dcJoinInfoSet, dcdreamlib, dcconsts
  {$IFDEF D6} ,Variants {$ENDIF}
  ;

Type

  { TCustomDCRelation }

  TCustomDCRelation=Class(TDCNamedItem)
  Private
    FActive:Boolean;
    FActiveOnLevel:Integer;
    FAllRelations:Boolean;
    FCaption:String;
    FDetailDisplayField:String;
    FDetailFieldNames:String;
    FDetailFields:TStrings;
    FDetailInfoSet:TDCLinkedComponent;
    FDetailInfoSeti:IUnknown;
    FDetailProps:TInterfaceList;
    FIncludeAllRecords:Boolean;
    FMasterFieldNames:String;
    FMasterFields:TStrings;
    FMasterInfoSet:TDCLinkedComponent;
    FMasterInfoSeti:IUnknown;
    FMasterProps:TInterfaceList;
    FRefCount:Integer;
    FUseCaption:Boolean;
    Function CheckField(const Columns:IDCColumns;const FieldName:String):IDCColumn;
    Procedure CheckRelationPass1;
    Procedure CheckRelationPass2;
    Procedure ClearPropList(Props:TInterfaceList);
    Procedure ClearPropLists;
    Procedure FillPropList(Fields:TStrings;const InfoSet:IUnknown;Props:TInterfaceList);
    Function GetDetailInfoSet:TComponent;
    Function GetMasterInfoSet:TComponent;
    Function GetCheckPass1:Boolean;
    Function GetCheckPass2:Boolean;
    Function GetOwnerConnected:Boolean;
    Procedure AfterChange(OldConnected:Boolean);
    Function IsComplete:Boolean;
    Procedure OnNotification(Component:TComponent;Operation:TOperation);
    Procedure SetActive(Value:Boolean);
    Procedure SetActiveOnLevel(Value:Integer);
    Procedure SetAllRelations(Value:Boolean);
    Procedure SetCaption(const Value:String);
    Procedure SetDetailInfoSet(Value:TComponent);
    Procedure SetDetailInfoSeti(const Value:Iunknown);
    Procedure SetDetailFields(const Value:String);
    Procedure SetDetailDisplayField(const Value: String);
    Procedure SetIncludeAllRecords(Value:Boolean);
    Procedure SetMasterInfoSet(Value:TComponent);
    Procedure SetMasterInfoSeti(const Value:IUnknown);
    Procedure SetMasterFields(const Value:String);
    Procedure SetOwnerConnected(Value:Boolean);
    Procedure SetUseCaption(Value:Boolean);

    Property CheckPass1:Boolean read GetCheckPass1;
    Property CheckPass2:Boolean read GetCheckPass2;
  Protected
    Function CompareInfoSets(const InfoSet1,InfoSet2:IUnknown):Boolean;virtual;
    Property DetailInfoSet:TComponent read GetDetailInfoSet write SetDetailInfoSet;
    Property DetailInfoSeti:IUnknown read FDetailInfoSeti write SetDetailInfoSeti;
    Property MasterInfoSet:TComponent read GetMasterInfoSet write SetMasterInfoSet;
    Property MasterInfoSeti:IUnknown read FMasterInfoSeti write SetMasterInfoSeti;
    Property OwnerConnected:Boolean read GetOwnerConnected write SetOwnerConnected;
  Public
    Constructor Create(Collection:TCollection);override;
    Destructor Destroy;override;
  Published
    Property Active:Boolean read FActive write SetActive default True;
    Property ActiveOnLevel:Integer read FActiveOnLevel write SetActiveOnLevel default -1;
    Property AllRelations:Boolean read FAllRelations write SetAllRelations default False;
    Property Caption:String read FCaption write SetCaption;
    Property DetailDisplayField:String read FDetailDisplayField write SetDetailDisplayField;
    Property DetailFields:String read FDetailFieldNames write SetDetailFields;
    Property IncludeAllRecords:Boolean read FIncludeAllRecords write SetIncludeAllRecords default False;
    Property MasterFields:String read FMasterFieldNames write SetMasterFields;
    Property UseCaption:Boolean read FUseCaption write SetUseCaption default False;
  End;
  
  { TInfoSetRelation }

  TInfoSetRelation=Class(TCustomDCRelation)
  Published
    Property DetailInfoSet;
    Property MasterInfoSet;
  End;

  { TDCRelations}

  TDCRelations=Class(TCustomDCNamedItems)
  Private
    FInfoSet:TObject;
    Function GetItems(Index:Integer):TCustomDCRelation;
    Procedure ClearPropLists;
  Protected
    Property InfoSet:TObject read FInfoSet;
  Public
    destructor Destroy; override;

    Property Items[Index:Integer]:TCustomDCRelation read GetItems;default;
  End;

  TRelationActiveEvent=Procedure(InfoSet:TComponent;Relation:TCustomDCRelation;
                                 Level:Integer;Var Active:Boolean) Of Object;

  { TCustomRelInfoSet }

  TCustomRelInfoSet=Class(TFilteredInfoSet, IUnknown, IDCConnect, IDCEventHandler,
                          IDCEventsSource,
                          IDCUpdates, IDCRowSet, IDCRowChange, IDCRowSetFolder)
  Private
    FInfoSet:TComponent;
    FInfoSeti:IUnknown;
    FLockCount:Integer;
    FLevel:Integer;
    FOnFilterRecord:TInfoFilterEvent;
    FOnRelationActive:TRelationActiveEvent;
    FOwner:TComponent;
    FOwnFiltering:Boolean;
    FProps:IDCProperties;
    FRelations:TDCRelations;
    FActive:Boolean;
    Function GetActive:Boolean;
    Procedure Event(const EventSource:IUnknown;EventType:Integer;
                    const EventData:Variant);
    Function FindDetails(const InfoSet:IUnknown;InfoSetLevel:Integer):TList;
    Property Active:Boolean read GetActive;
  Protected
    function GetRelations:TDCRelations;
    function GetInfoSet:TComponent;
    function GetInfoSetI:IUnknown;
    Function CanEvaluateFilter:Boolean;virtual;
    Procedure CheckActive;virtual;
    Procedure DoNewRecord;virtual;
    Function EvaluateFilter:Boolean;virtual;

    {IDCConnect}
    Function GetConnected:Boolean;
    Procedure SetConnected(Value:Boolean);virtual;

    {IDCEventHandler}
    Procedure HandleEvent(const EventRec:PEventRec);override;

    {IDEventSource}
    Function GetEventSourceID:Integer;

    {IDCRowChange}
    Procedure Append;
    Procedure Cancel;
    Procedure Delete;
    Procedure Edit;
    Procedure Insert;virtual;
    Procedure Post;

    {IDCRowSet}
    Function GetRow:IUnknown;
    Function GetFields:IDCColumns;virtual;

    {IDCRowSetFolder}
    Function IsFolder:Boolean;

    {IDCUpdates}
    Procedure BeginUpdate;
    Procedure EndUpdate;

    {IUnknown}
  Public
    Constructor CreateWithOwner(AOwner:TComponent);
    Destructor Destroy;override;

    Function CanConnect:Boolean;
    Function QueryInterface(const IID:TGuid;out Obj):HResult;override;stdcall;
    Property OnFilterRecord:TInfoFilterEvent read FOnFilterRecord write FOnFilterRecord;
    Property OnRelationActive:TRelationActiveEvent read FOnRelationActive write FOnRelationActive;
    Property OwnFiltering:Boolean read FOwnFiltering write FOwnFiltering;

    Property Owner:TComponent read FOwner;
  End;

  { TInfoSetRelInfoSet }

  TInfoSetRelInfoSet=Class(TCustomRelInfoSet, IDCDelayedFilter)
  Private
    FFilter:String;
    FFiltered:Boolean;
    FFieldName:String;
    FInCheckFilter:Boolean;
    FProp:IDCProperty;
    FValue:Variant;
    Procedure CheckFilter;
    Procedure DoOnFilterRecord(const InfoSet:IUnknown;Var Accept:Boolean);
    Procedure SetFilter(const Value:String);
    Procedure SetFiltered(Value:Boolean);
    Procedure SetRelations(Value:TDCRelations);
    Procedure SetRootInfoSet(Value:TComponent);
    Procedure SetRootInfoSeti(const Value:IUnknown);
  Protected
    Function CreateRelations:TDCRelations;virtual;
    Procedure HandleEvent(const EventRec:PEventRec);override;
    Procedure DoNewRecord;override;
    Function InternalCheckFilter:Boolean;virtual;
    Procedure SetConnected(Value:Boolean);override;

    {IDCDelayedFilter}
    Function ApplyFilter:Boolean;
    Procedure RemoveFilter;
  Public
    Constructor CreateWithOwner(AOwner:TComponent);
    Destructor Destroy;override;

    Property Filter:String read FFilter write SetFilter;
    Property Filtered:Boolean read FFiltered write SetFiltered;
    Property Relations:TDCRelations read GetRelations write SetRelations;
    Property RootInfoSet:TComponent read GetInfoSet write SetRootInfoSet;
    Property RootInfoSeti:IUnknown read GetInfoSeti write SetRootInfoSeti;
  End;

  { TCustomDCRelInfoSet }

  TCustomDCRelInfoSet=Class(TComponent, IUnknown)
  Private
    FIntfObj:TObject;
    FInterface:IUnknown;
//    FVersion : TDCVersion;
    Function GetFilter:String;
    Function GetFiltered:Boolean;
//    Function GetOnFilterRecord:TInfoFilterEvent;
    Function GetOnRelationActive:TRelationActiveEvent;
    Function GetOwnFiltering:Boolean;
    Function GetRelations:TDCRelations;
    Function GetRootInfoSet:TComponent;
    Function GetRootInfoSeti:IUnknown;
    procedure SetFilter(const Value:String);
    Procedure SetFiltered(Value:Boolean);
//    Procedure SetOnFilterRecord(Value:TInfoFilterEvent);
    Procedure SetOnRelationActive(Value:TRelationActiveEvent);
    Procedure SetOwnFiltering(Value:Boolean);
    Procedure SetRelations(Value:TDCRelations);
    Procedure SetRootInfoSet(Value:TComponent);
    Procedure SetRootInfoSeti(const Value:IUnknown);
  Protected
    Property IntfObj:TObject read FIntfObj write FIntfObj;
    Property ObjInterface:IUnknown read FInterface write FInterface;
    Property Relations:TDCRelations read GetRelations write SetRelations;
    Property RootInfoSet:TComponent read GetRootInfoSet write SetRootInfoSet;
    Property RootInfoSeti:IUnknown read GetRootInfoSeti write SetRootInfoSeti;
  Published
    Property Filter:String read GetFilter write SetFilter;
    Property Filtered:Boolean read GetFiltered write SetFiltered default False;
//    Property OnFilterRecord:TInfoFilterEvent read GetOnFilterRecord write SetOnFilterRecord;
    Property OnRelationActive:TRelationActiveEvent read GetOnRelationActive write SetOnRelationActive;
    Property OwnFiltering:Boolean read GetOwnFiltering write SetOwnFiltering default False;
  End;

  TDCRelInfoSet=Class(TCustomDCRelInfoSet)
  Public
    Constructor Create(AOwner:TComponent);override;
  Published
    Property Relations;
    Property RootInfoSet;
//    property Version : TDCVersion read FVersion write FVersion stored false;
  End;

Implementation
Uses ComObj, TypInfo;

Const
  strUnAssigned='UNASSIGNED'; //don't resource
  strNull='NULL'; //don't resource
  strTrue='TRUE'; //don't resource
  strFalse='FALSE'; //don't resource

Function StrToVar(Value:String):Variant;
Var
  PStr:PChar;
Begin
  If Value='' Then
  Begin
    Result:=Null;
    Exit;
  End;
  If Value[1]='''' Then
  Begin
    PStr:=PChar(Value);
    Result:=AnsiExtractQuotedStr(PStr,'''');
    Exit
  End;
  Value:=UpperCase(Value);
  If Value=strUnAssigned Then
    Result:=UnAssigned
  Else
    If Value=strNull Then
      Result:=NULL
    Else
      If Value=strTrue Then
        Result:=True
      Else
        If Value=strFalse Then
          Result:=False
        Else
          If Pos(DecimalSeparator,Value)=0 Then
            Result:=StrToInt(Value)
          Else
            Result:=StrToFloat(Value);
End;

{---------------------------------------------------------}

Function DequoteFieldName(const FieldName:String):String;
Begin
  If FieldName='' Then
    Exit;
  If FieldName[1]='[' Then
    Result:=Copy(FieldName,2,Length(FieldName)-2)
  Else
    Result:=FieldName;
End;

{---------------------------------------------------------}

Function QuoteFieldName(const FieldName:String):String;
Begin
  If Pos(' ',FieldName)<>0 Then
    Result:='['+FieldName+']'
  Else
    Result:=FieldName;
End;

{---------------------------------------------------------}

Procedure ParseExpr(const Expr:String;Var FieldName:String;Var Value:Variant);
Var
  StrValue:String;
  Position:Integer;
Begin
  Position:=Pos('=',Expr);

  If Position<2 Then
    Error(SErrInvalidFilter);

  FieldName:=DequoteFieldName(Trim(Copy(Expr,1,Position-1)));
  StrValue:=Trim(Copy(Expr,Position+1,Length(Expr)-Position));
  Value:=StrToVar(StrValue);
End;

{---------------------------------------------------------}

Function QueryStackFilter(const InfoSet:IUnknown):IDCStackFilter;
Begin
  If InfoSet=Nil Then
    Exit;
  If InfoSet.QueryInterface(IDCStackFilter,Result)<>S_OK Then
    Result:=Nil;
End;

{---------------------------------------------------------}

Type
  TOleVarArray=Array[0..MaxInt div (SizeOf(Variant)*2)] Of Variant;
  POleVarArray=^TOleVarArray;

  TSecondInfoSet=Class(TCustomRelInfoSet, IDCDelayedFilter, IDCDisplayField,
                       IDCEventHandler, IDCLocateRecord, IDCRowSetEmpty)
  Private
    FRelation:TCustomDCRelation;
    FValueCount:Integer;
    FValues:POleVarArray;
    FMasterInfoSet:IUnknown;

    FAllRelations : boolean;
    FUseCaption   : boolean;

    Procedure CreateValues;
    Procedure FreeValues;
    Procedure DoOnFilterRecord(const InfoSet:IUnknown;Var Accept:Boolean);
    Procedure UnregisterFromMaster;
    Function UniLocate(IsLookup:Boolean;RereadValues:Boolean):Boolean;
  Protected
    Procedure HandleEvent(const EventRec:PEventRec);override;
    Procedure DoNewRecord;override;

    {IDCDelayedField}
    Function ApplyFilter:Boolean;
    Procedure RemoveFilter;

    {IDCDisplayField}
    Function GetDisplayFieldName:String;

    {IDCLocateRecord}
    Function LocateFirst:Boolean;
    Function LocateNext:Boolean;

    {IDCRowSetEmpty}
    Function GetIsEmpty:Boolean;

    {IUnknown}
    Function QueryInterface(const IID:TGuid;out Obj):HResult;override;stdcall;

  Public
    Destructor Destroy;override;
  End;

  TDCRelLinkProperties=Class(TDCLinkProperties, IDCPassThroughLevel)
  Private
    FInfoSet:IUnknown;
  Protected
    Function QueryInterface(const IID:TGUID;out Obj):HResult;override;stdcall;
    { IDCPassThroughLevel }
    Function IsPassThrough:Boolean;
  End;

  TRelCollectionInfoSet = class(TCollectionInfoSet, IDCCanRowChange,IDCDisplayField,
                                IDCRowSet)
  Protected
    Procedure UnRegisterFromAll;
    {IDCCanRowChange}
    Function CanAppend:Boolean;
    Function CanEdit:Boolean;
    Function CanDelete:Boolean;
    Function CanInsert:Boolean;
    Function CanView:Boolean;
    { IDCDisplayField }
    function GetDisplayFieldName : string;
    { IDCRowSet }
    Function GetRow:IUnknown;
  Public
    Destructor Destroy;override;
  End;

Function TDCRelLinkProperties.IsPassThrough:Boolean;
Begin
  Result:=True;
End;

{---------------------------------------------------------}

Function TDCRelLinkProperties.QueryInterface(const IID:TGUID;out Obj):HResult;
Begin
  Result:=Inherited QueryInterface(IID,Obj);
  If (Result<>S_OK) And (FInfoSet<>Nil) Then
    FInfoSet.QueryInterface(IID,Obj);
End;

{---------------------------------------------------------}

Function TRelCollectionInfoSet.CanAppend:Boolean;
Begin
  Result:=False;
End;

{---------------------------------------------------------}

Function TRelCollectionInfoSet.CanEdit:Boolean;
Begin
  Result:=False;
End;

{---------------------------------------------------------}

Function TRelCollectionInfoSet.CanDelete:Boolean;
Begin
  Result:=False;
End;

{---------------------------------------------------------}

Function TRelCollectionInfoSet.CanInsert:Boolean;
Begin
  Result:=False;
End;

{---------------------------------------------------------}

Function TRelCollectionInfoSet.CanView:Boolean;
Begin
  Result:=True;
End;

{---------------------------------------------------------}

function TRelCollectionInfoSet.GetDisplayFieldName : string;
begin
  result := 'Caption'; //don't resource
end;

{ TRelCollectionInfoSet }

Destructor TRelCollectionInfoSet.Destroy;
Begin
  BeginUpdate;
  _AddRef;
  FDestroying:=True;
  UnRegisterFromAll;
  Link.Free;
  EndUpdate;
  Inherited;
End;

{---------------------------------------------------------}

Function TRelCollectionInfoSet.GetRow:IUnknown;
Var
  Props:TDCRelLinkProperties;
  Temp:TDCMultiInfoSetItem;
Begin
  Props:=TDCRelLinkProperties.Create(ItemByIndex(CurIndex));
  Props.OnChange:=PropsChanged;
  Temp:=TDCMultiInfoSetItem(IndexToItem(CurIndex));
  Props.FInfoSet:=Temp.InfoSetI;
  Result:=Props As IUnknown;
End;

{---------------------------------------------------------}

Procedure TRelCollectionInfoSet.UnRegisterFromAll;
Var
  I:Integer;
  Events:IDCEvents;
  Item:TDCMultiInfoSetItem;
  InfoItems:TDCMultiInfoSetItems;
Begin
  InfoItems:=TDCMultiInfoSetItems(Link);
  If InfoItems<>Nil Then
    For I:=InfoItems.Count-1 Downto 0 Do
    Begin
      Item:=TDCMultiInfoSetItem(InfoItems.Items[I]);
      Item.InfoSetI.QueryInterface(IDCEvents,Events);
      Events.UnRegisterHandler(IDCEventHandler(Item));
    End;
End;

{ TCustomDCRelation }

Constructor TCustomDCRelation.Create(Collection:TCollection);
Begin
  Inherited;
  FDetailInfoSet:=TDCLinkedComponent.Create(Nil);
  FDetailInfoSet.NotifyProc:=OnNotification;
  FDetailFields:=TStringList.Create;
  FDetailProps:=TInterfaceList.Create;
  FMasterInfoSet:=TDCLinkedComponent.Create(Nil);
  FMasterInfoSet.NotifyProc:=OnNotification;
  FMasterFields:=TStringList.Create;
  FMasterProps:=TInterfaceList.Create;
  FActive:=True;
  FActiveOnLevel:=-1;
End;

{---------------------------------------------------------}

Destructor TCustomDCRelation.Destroy;
Begin
  With TInfoSetRelInfoSet(TDCRelations(Collection).InfoSet) Do
  Begin
    If FInfoSeti<>Nil Then
      SetConnected(False);
    Inherited;
    If CanConnect Then
      SetConnected(True);
  End;
  ClearPropLists;
  FreeObject(FDetailProps,FDetailProps);
  FreeObject(FDetailInfoSet,FDetailInfoSet);
  FreeObject(FDetailFields,FDetailFields);

  FreeObject(FMasterProps,FMasterProps);
  FreeObject(FMasterInfoSet,FMasterInfoSet);
  FreeObject(FMasterFields,FMasterFields);
//  Inherited;
End;

{---------------------------------------------------------}

Procedure TCustomDCRelation.AfterChange(OldConnected:Boolean);
Var
  NewConnected:Boolean;
Begin
  NewConnected:=OwnerConnected;
  If OldConnected Or NewConnected Then
  Begin
    OwnerConnected:=False;
    OwnerConnected:=True;
  End;
End;

{---------------------------------------------------------}

Function TCustomDCrelation.CheckField(const Columns:IDCColumns;const FieldName:String):IDCColumn;
Begin
  Result:=DCPropByName(Columns As IDCProperties,FieldName);
  If Result=Nil Then
    ErrorFmt(SErrRelFieldNotFoundIndex,[FieldName,Index]);
End;

{---------------------------------------------------------}

Procedure TCustomDCRelation.CheckRelationPass1;
Begin
  If FDetailDisplayField='' Then
    ErrorFmt(SErrEmptyDisplayFieldIndex,[Index]);
  If FDetailInfoSeti=Nil Then
    ErrorFmt(SErrSetReliItemIndex,['DetailInfoSet',Index]); //don't resource
  If FMasterInfoSeti=Nil Then
    ErrorFmt(SErrSetReliItemIndex,['MasterInfoSet',Index]); //don't resource
  If (FDetailFields.Count=0) And Not FIncludeAllRecords Then
    ErrorFmt(SErrSetReliItemIndex,['DetailFields',Index]); //don't resource
  If (FMasterFields.Count=0) And Not FIncludeAllRecords Then
    ErrorFmt(SErrSetReliItemIndex,['MasterFields',Index]); //don't resource
  If (FDetailFields.Count<>FMasterFields.Count) And Not FIncludeAllRecords Then
    ErrorFmt(SErrCMastAndDetDifferentIndex,[Index]);
  If FIncludeAllRecords Then
    Exit;
  FillPropList(FMasterFields,FMasterInfoSeti,FMasterProps);
  Inc(FRefCount);
End;

{---------------------------------------------------------}

Procedure TCustomDCRelation.CheckRelationPass2;
Var
  I:Integer;
Begin
  If FIncludeAllRecords Or Not CheckPass1 Then
    Exit;
  FillPropList(FDetailFields,FDetailInfoSeti,FDetailProps);
  For I:=0 To FDetailFields.Count-1 Do
    If Not IsCompatibleDataTypes((FDetailProps[I] As IDCProperty).GetPropType,(FMasterProps[I] As IDCProperty).GetPropType) Then
      ErrorFmt(SErrIncompatibleDataTypeIndex,[FMasterFields[I],FDetailFields[I],Index]);
End;

{---------------------------------------------------------}

Procedure TCustomDCRelation.ClearPropList(Props:TInterfaceList);
Begin
  If Props=Nil Then
    Exit;
  Props.Clear;
End;

{---------------------------------------------------------}

Procedure TCustomDCRelation.ClearPropLists;
Begin
  Dec(FRefCount);
  If FRefCount=0 Then
  Begin
    ClearPropList(FMasterProps);
    ClearPropList(FDetailProps);
  End;
  If FRefCount<0 Then
    FRefCount:=0;
End;

{---------------------------------------------------------}

Function TCustomDCRelation.CompareInfoSets(const InfoSet1,InfoSet2:IUnknown):Boolean;
Begin
  Result:=InfoSet1=InfoSet2;
End;

{---------------------------------------------------------}

Procedure TCustomDCRelation.FillPropList(Fields:TStrings;const InfoSet:IUnknown;Props:TInterfaceList);
Var
  I:Integer;
  RowSet:IDCRowSet;
  Columns:IDCColumns;
Begin
  IF Props.Count<>0 Then
    Exit;
  OleCheck(InfoSet.QueryInterface(IDCRowSet,RowSet));
  Columns:=RowSet.GetFields;
  For I:=0 To Fields.Count-1 Do
    Props.Add(CheckField(Columns,Fields[I]));
End;

{---------------------------------------------------------}

Function TCustomDCRelation.GetDetailInfoSet:TComponent;
Begin
  Result:=TComponent(FDetailInfoSet.Link);
End;

{---------------------------------------------------------}

Function TCustomDCRelation.GetMasterInfoSet:TComponent;
Begin
  Result:=TComponent(FMasterInfoSet.Link);
End;

{---------------------------------------------------------}

Function TCustomDCRelation.GetOwnerConnected:Boolean;
Begin
  With TInfoSetRelInfoSet(TDCRelations(Collection).InfoSet) Do
    If FInfoSeti=Nil Then
      Result:=False
    Else
      Result:=IsComplete;
End;

{---------------------------------------------------------}

Function TCustomDCRelation.GetCheckPass1:Boolean;
Begin
  Result:=FMasterProps.Count<>0;
End;

{---------------------------------------------------------}

Function TCustomDCRelation.GetCheckPass2:Boolean;
Begin
  Result:=FDetailProps.Count<>0;
End;

{---------------------------------------------------------}

Function TCustomDCRelation.IsComplete:Boolean;
Begin
  Result:=(((FDetailFieldNames<>'') And (FMasterFieldNames<>'')) Or FIncludeAllRecords)  And (FDetailInfoSeti<>Nil) And
          (FMasterInfoSeti<>Nil) And (FDetailDisplayField<>'');
End;

{---------------------------------------------------------}

Procedure TCustomDCRelation.OnNotification(Component:TComponent;Operation:TOperation);
Begin
  If Operation=opRemove Then
    OwnerConnected:=False;
End;

{---------------------------------------------------------}

Procedure TCustomDCRelation.SetActive(Value:Boolean);
Var
  Connected:Boolean;
Begin
  If FActive=Value Then
    Exit;
  FActive:=Value;
  Connected:=OwnerConnected;
  AfterChange(Connected);
End;

{---------------------------------------------------------}

Procedure TCustomDCRelation.SetActiveOnLevel(Value:Integer);
Var
  Connected:Boolean;
Begin
  If FActiveOnLevel=Value Then
    Exit;
  Connected:=OwnerConnected;
  FActiveOnLevel:=Value;
  AfterChange(Connected);
End;

{---------------------------------------------------------}

Procedure TCustomDCRelation.SetAllRelations(Value:Boolean);
Var
  Connected:Boolean;
Begin
  If FAllRelations=Value Then
    Exit;
  Connected:=OwnerConnected;
  FAllRelations:=Value;
  AfterChange(Connected);
End;

{---------------------------------------------------------}

Procedure TCustomDCRelation.SetCaption(const Value:String);
Var
  Connected:Boolean;
Begin
  If FCaption=Value Then
    Exit;
  Connected:=OwnerConnected;
  FCaption:=Value;
  AfterChange(Connected);
End;

{---------------------------------------------------------}

Procedure TCustomDCRelation.SetDetailDisplayField(const Value: String);
Var
  Connected:Boolean;
Begin
  If FDetailDisplayField=Value Then
    Exit;
  Connected:=OwnerConnected;
  FDetailDisplayField:=Value;
  AfterChange(Connected);
end;

{---------------------------------------------------------}

Procedure TCustomDCRelation.SetDetailFields(const Value:String);
Var
  Connected:Boolean;
Begin
  If FDetailFieldNames=Value Then
    Exit;
  Connected:=OwnerConnected;
  ClearPropList(FDetailProps);
  FDetailFieldNames:=Value;
  FDetailFields.Clear;
  ParseString(Value,';',FDetailFields);
  AfterChange(Connected);
End;

{---------------------------------------------------------}

Procedure TCustomDCRelation.SetDetailInfoSet(Value:TComponent);
Begin
  If DetailInfoSet=Value Then
    Exit;
  FDetailInfoSet.Link:=Value;
  DetailInfoSeti:=QueryUnknown(Value);
End;

{---------------------------------------------------------}

Procedure TCustomDCRelation.SetDetailInfoSeti(const Value:IUnknown);
Var
  Connected:Boolean;
Begin
  If FDetailInfoSeti=Value Then
    Exit;
  Connected:=OwnerConnected;
  FDetailInfoSeti:=Value;
  AfterChange(Connected);
End;

{---------------------------------------------------------}

Procedure TCustomDCRelation.SetIncludeAllRecords(Value:Boolean);
Var
  Connected:Boolean;
Begin
  If FIncludeAllRecords=Value Then
    Exit;
  ClearPropLists;
  Connected:=OwnerConnected;
  FIncludeAllRecords:=Value;
{  If Connected Then
  Begin
    CheckRelationPass1;
    CheckRelationPass2;
  End;}
  AfterChange(Connected);
End;

{---------------------------------------------------------}

Procedure TCustomDCRelation.SetMasterFields(const Value:String);
Var
  Connected:Boolean;
Begin
  If FMasterFieldNames=Value Then
    Exit;
  Connected:=OwnerConnected;
  ClearPropList(FMasterProps);
  FMasterFieldNames:=Value;
  FMasterFields.Clear;
  ParseString(Value,';',FMasterFields);
  AfterChange(Connected);
End;

{---------------------------------------------------------}

Procedure TCustomDCRelation.SetMasterInfoSet(Value:TComponent);
Begin
  If MasterInfoSet=Value Then
    Exit;
  FMasterInfoSet.Link:=Value;
  MasterInfoSeti:=QueryUnknown(Value);
End;

{---------------------------------------------------------}

Procedure TCustomDCRelation.SetMasterInfoSeti(const Value:IUnknown);
Var
  Connected:Boolean;
Begin
  If FMasterInfoSeti=Value Then
    Exit;
  Connected:=OwnerConnected;
  FMasterInfoSeti:=Value;
  AfterChange(Connected);
End;

{---------------------------------------------------------}

Procedure TCustomDCRelation.SetOwnerConnected(Value:Boolean);
Begin
  With TInfoSetRelInfoSet(TDCRelations(Collection).InfoSet) Do
    If FInfoSeti<>Nil Then
      If Value Then
      Begin
        If CanConnect Then
          SetConnected(True);
      End
      Else
        SetConnected(False);
End;

{---------------------------------------------------------}

Procedure TCustomDCRelation.SetUseCaption(Value:Boolean);
Var
  Connected:Boolean;
  OldValue:Boolean;
Begin
  If FUseCaption=Value Then
    Exit;
  Connected:=OwnerConnected;
  OldValue:=FUseCaption;
  FUseCaption:=Value;
  Try
    AfterChange(Connected);
  Except
    FUseCaption:=OldValue;
    Raise;
  End;  
End;

{ TDCRelations }

destructor TDCRelations.Destroy;
begin
  inherited;
end;

{---------------------------------------------------------}

Procedure TDCRelations.ClearPropLists;
Var
  I:Integer;
Begin
  For I:=0 To Count-1 Do
    With TCustomDCRelation(Items[I]) Do
    Begin
      ClearPropList(FDetailProps);
      ClearPropList(FMasterProps);
    End
End;

{---------------------------------------------------------}

Function TDCRelations.GetItems(Index:Integer):TCustomDCRelation;
Begin
  Result:=TCustomDCRelation(Inherited Items[Index]);
End;

{---------------------------------------------------------}

function TCustomRelInfoSet.GetInfoSet:TComponent;
begin
  Result:=FInfoSet;
end;

{---------------------------------------------------------}

function TCustomRelInfoSet.GetInfoSetI:IUnknown;
begin
  Result:=FInfoSeti;
end;

{---------------------------------------------------------}

function TCustomRelInfoSet.GetRelations:TDCRelations;
begin
  Result:=FRelations;
end;

{---------------------------------------------------------}

Constructor TCustomRelInfoSet.CreateWithOwner(AOwner:TComponent);
Begin
  Inherited Create;
  FOwner:=AOwner;
  FLevel:=0;
End;

{---------------------------------------------------------}

Destructor TCustomRelInfoSet.Destroy;
Begin
  Inherited;
End;

{---------------------------------------------------------}

Procedure TCustomRelInfoSet.Append;
Var
  RowChange:IDCRowChange;
Begin
  FInfoSeti.QueryInterface(IDCRowChange,RowChange);
  If RowChange<>Nil Then
    RowChange.Append;
  DoNewRecord;
End;

{---------------------------------------------------------}

Procedure TCustomRelInfoSet.BeginUpdate;
Var
  DCUpdate:IDCUpdates;
Begin
  If FInfoSeti.QueryInterface(IDCUpdates,DCUpdate)=S_OK Then
    DCUpdate.BeginUpdate
  Else
  Inc(FLockCount);
End;

{---------------------------------------------------------}

Procedure TCustomRelInfoSet.Cancel;
Var
  RowChange:IDCRowChange;
Begin
  FInfoSetI.QueryInterface(IDCRowChange,RowChange);
  If RowChange<>Nil Then
    RowChange.Cancel;
End;

{---------------------------------------------------------}

Function TCustomRelInfoSet.CanConnect:Boolean;
Var
  Connect:IDCConnect;
Begin
  Result:=False;
  If FInfoSeti=Nil Then
    Exit;
  Result:=True;
  If FInfoSeti.QueryInterface(IDCConnect,Connect)<>S_OK Then
    Exit;
  Result:=Connect.GetConnected;
End;

{---------------------------------------------------------}

Function TCustomRelInfoSet.CanEvaluateFilter:Boolean;
Begin
  Result:=False;
End;

{---------------------------------------------------------}

Procedure TCustomRelInfoSet.CheckActive;
Begin
  If FInfoSeti=Nil Then
    Error(SErrSetInfoSet);
End;

{---------------------------------------------------------}

Procedure TCustomRelInfoSet.Delete;
Var
  RowChange:IDCRowChange;
Begin
  FInfoSetI.QueryInterface(IDCRowChange,RowChange);
  If RowChange<>Nil Then
    RowChange.Delete;
End;

{---------------------------------------------------------}

Procedure TCustomRelInfoSet.DoNewRecord;
Begin
End;

{---------------------------------------------------------}

Procedure TCustomRelInfoSet.Edit;
Var
  RowChange:IDCRowChange;
Begin
  FInfoSetI.QueryInterface(IDCRowChange,RowChange);
  If RowChange<>Nil Then
    RowChange.Edit;
End;

{---------------------------------------------------------}

Procedure TCustomRelInfoSet.EndUpdate;
Var
  DCUpdate:IDCUpdates;
Begin
  If FInfoSeti.QueryInterface(IDCUpdates,DCUpdate)=S_OK Then
    DCUpdate.EndUpdate
  Else
    Dec(FLockCount);
End;

{---------------------------------------------------------}

Function TCustomRelInfoSet.EvaluateFilter:Boolean;
Begin
  Result:=False;
End;

{---------------------------------------------------------}

Procedure TCustomRelInfoSet.Event(const EventSource:IUnknown;EventType:Integer;
                             const EventData:Variant);
Begin
  If FLockCount<>0 Then
    Exit;
  NotifyHandlers(EventType,EventData);
End;

{---------------------------------------------------------}

Function TCustomRelInfoSet.FindDetails(const InfoSet:IUnknown;InfoSetLevel:Integer):TList;
  Function IsAccept(Relation:TCustomDCRelation):Boolean;
  Begin
    Result:=(Relation.ActiveOnLevel=-1) Or (Relation.ActiveOnLevel=InfoSetLevel);
    Result:=Result And Relation.FActive;
    If Assigned(FOnRelationActive) Then
      FOnRelationActive(Relation.MasterInfoSet,Relation,FLevel,Result);
  End;
Var
  I:Integer;
  Rel:TCustomDCRelation;
Begin
  if FRelations.Count = 0 then
    begin
      result := nil;
      exit;
    end;

  Result:=TList.Create;
  For I:=0 To FRelations.Count-1 Do
  Begin
    Rel:=TCustomDCRelation(FRelations.Items[I]);
    If Rel.IsComplete Then
      If Rel.CompareInfoSets(Rel.FMasterInfoSeti,InfoSet) Then
        If IsAccept(Rel) Then
          Result.Add(Rel);
  End;
End;

{---------------------------------------------------------}

Function TCustomRelInfoSet.GetActive:Boolean;
Var
  DCConnect:IDCConnect;
Begin
  Result:=False;
  If FInfoSeti=Nil Then
    Exit;
  Result:=True;
  If FInfoSeti.QueryInterface(IDCConnect,DCConnect)=S_OK Then
    Result:=DCConnect.GetConnected;
End;

{---------------------------------------------------------}

Function TCustomRelInfoSet.GetConnected:Boolean;
Var
  Connect:IDCConnect;
Begin
  If FInfoSeti=Nil Then
  Begin
    Result:=False;
    Exit;
  End;
  Result:=True;
  If FInfoSeti.QueryInterface(IDCConnect,Connect)<>S_OK Then
    Exit;
  Result:=Connect.GetConnected;
End;

{---------------------------------------------------------}

Function TCustomRelInfoSet.GetEventSourceID:Integer;
Var
  EventsSource:IDCEventsSource;
Begin
  Result:=0;
  If FInfoSeti<>Nil Then
    If FInfoSeti.QueryInterface(IDCEventsSource,EventsSource)=S_OK Then
      Result:=EventsSource.GetEventSourceID;
End;

{---------------------------------------------------------}

Function TCustomRelInfoSet.GetRow:IUnknown;

  Function CreateSecondInfoSet(Relations:TList;Relation:TCustomDCRelation;
                               Const Props:IDCProperties;
                               UseAllRelations,UseCaption:Boolean):TSecondInfoSet;

    Function GetMultiInfoSet(Relations:TList;const Props:IDCProperties;Var AConnected:Boolean):IUnknown;
    Var
      ColSet:TCollectionInfoSet;
      InfoItems:TDCMultiInfoSetItems;
      I:Integer;
      Relation:TCustomDCRelation;
      Item:TDCMultiInfoSetItem;
      Connect:IDCConnect;
      SecondInfoSet:TSecondInfoSet;
    Begin
      ColSet:=TRelCollectionInfoSet.Create;
      ColSet._AddRef;
      InfoItems:=TDCMultiInfoSetItems.Create(Nil,TDCMultiInfoSetItem);
      InfoItems.CollectionSet:=ColSet;
      ColSet.Link:=InfoItems;
      AConnected:=False;
      For I:=0 To Relations.Count-1 Do
      Begin
        Item:=TDCMultiInfoSetItem(InfoItems.Add);
        With Item Do
        Begin
          Relation:=TCustomDCRelation(Relations[I]);
          SecondInfoSet:=CreateSecondInfoSet(Nil,Relation,Props,False,False);
          InfoSetI:=SecondInfoSet;
          SecondInfoSet.FInfoSetI.QueryInterface(IDCConnect,Connect);
          AConnected:=AConnected Or ((Connect=Nil) Or Connect.Connected);
         //Commented to prevent double registration on InfoSetI._Release;
//          OleCheck(InfoSetI.QueryInterface(IDCEvents,Events));
//          Events.RegisterHandler(IDCEventHandler(Item),evAll, 0);
          InfoSetI._Release;
          DisplayField:=Relation.FDetailDisplayField;
          Caption:=Relation.Caption;
        End;
      End;
      Result:=ColSet;
    End;

    Function GetJoinInfoSet(Relations:TList;const Props:IDCProperties):IUnknown;
    Var
      JoinInfoSet:TJoinInfoSet;
      I:Integer;
      Relation:TCustomDCRelation;
      Item:TDCJoinRelation;
      SecondInfoSet:TSecondInfoSet;
    Begin
      JoinInfoSet:=TJoinInfoSet.Create(FOwner);
//      JoinInfoSet._AddRef;
      For I:=0 To Relations.Count-1 Do
      Begin
        Item:=TDCJoinRelation(JoinInfoSet.Relations.Add);
        With Item Do
        Begin
          Relation:=TCustomDCRelation(Relations[I]);
          SecondInfoSet:=CreateSecondInfoSet(Nil,Relation,Props,False,False);
          SecondInfoSet.OwnFiltering:=True;
          SecondInfoSet.DirectNavigation:=False;
          InfoSetI:=SecondInfoSet;
{          InfoSetI.QueryInterface(IDCEvents,Events);
          Events.RegisterHandler(IDCEventHandler(Item),evAll, 0);}
          InfoSetI._Release;
          DisplayField:=Relation.FDetailDisplayField;
        End;
      End;
      Result:=JoinInfoSet;
    End;

  Var
    Events:IDCEvents;
    Connect:IDCConnect;
    AConnected:Boolean;
  Begin
    Result:=TSecondInfoSet.CreateWithOwner(Nil);
    Try
      Result._AddRef;
      Result.FProps:=Props;
      Result.FRelations:=FRelations;
      Result.FAllRelations:=UseAllRelations;
      Result.FUseCaption:=UseCaption;

      If UseCaption Then
        Result.FRelation:=Nil
      Else
        Result.FRelation:=Relation;

      Result.FLevel:=FLevel+1;
      Result.OnRelationActive:=OnRelationActive;
      Relation.CheckRelationPass1;

      If UseAllRelations Then
      Begin
        Result.FInfoSeti:=GetJoinInfoSet(Relations,Props);
        Result.OwnFiltering:=True;
{        OleCheck(Result.FInfoSeti.QueryInterface(IDCEvents,Events));
        Events.RegisterHandler(Result,evAll,0);}
      End
      Else
      Begin
        Result.CreateValues;
        Result.OwnFiltering:=OwnFiltering;
        If OwnFiltering Then
          Result.DirectNavigation:=False
        Else
          Result.DirectNavigation:=QueryStackFilter(Relation.FDetailInfoSeti)<>Nil;

        If UseCaption Then
        Begin
          Result.FInfoSeti:=GetMultiInfoSet(Relations,Props,AConnected);
          Result.FInfoSeti._Release;
        End
        Else
        Begin
          OleCheck(Relation.DetailInfoSeti.QueryInterface(IUnknown,Result.FInfoSeti));
          Result.FInfoSeti.QueryInterface(IDCConnect,Connect);
          AConnected:=(Connect=Nil) Or Connect.Connected;
        End;
        Result.OnFilter:=Result.DoOnFilterRecord;
      End;
      //Commented to prevent double registration on Result.InfoSet:=Result.FInfoSeti;
//      OleCheck(FInfoSeti.QueryInterface(IDCEvents,Events));
//      Events.RegisterHandler(Result,evActiveChanged Or evFieldListChange,0);

      //Register master infoset events
      OleCheck(Relation.MasterInfoSeti.QueryInterface(IDCEvents,Events));
      Events.RegisterHandler(Result,evActiveChanged Or evFieldListChange,0);

      Result.FMasterInfoSet:=FInfoSeti;

      Result.InfoSet:=Result.FInfoSeti;
      If AConnected then
        Relation.CheckRelationPass2;
    Except
      Relation.ClearPropLists;
      Result.FreeValues;
      Result._Release;
      Raise;
    End;
  End;

  Procedure GetParams(Relations:TList;Var UsesAllRelations,UseCaptions:Boolean);
  Var
    I:Integer;
  Begin
    UsesAllRelations:=False;
    UseCaptions:=False;
    if Relations <> nil then
      For I:=0 To Relations.Count-1 Do
        With TCustomDCRelation(Relations[I]) Do
        Begin
          If AllRelations Then
          Begin
            UsesAllRelations:=True;
            Exit;
          End;
          If UseCaption Then
          Begin
            UseCaptions:=True;
            Exit;
          End;
        End;
  End;
Var
  RowSet:IDCRowSet;
  Props:IDCProperties;
  Relations:TList;
  UseAllRelations:Boolean;
  UseCaption:Boolean;
  NextRowSet:IUnknown;
Begin
  CheckActive;
  OleCheck(FInfoSeti.QueryInterface(IDCRowSet,RowSet));

  NextRowSet:=RowSet.GetRow;
  Props:=NextRowSet As IDCProperties;
  Relations:=FindDetails(FInfoSeti,FLevel);
  Try
    GetParams(Relations,UseAllRelations,UseCaption);
    If (Relations = nil) or (Relations.Count = 0) Then
      Result:=NextRowSet
    Else
      Begin
        Result:=CreateSecondInfoSet(Relations,TCustomDCRelation(Relations[0]),
                                    Props,UseAllRelations,UseCaption);
        Result._Release;
      End;
  Finally
    Relations.Free;
  End;
End;

{---------------------------------------------------------}

Function TCustomRelInfoSet.GetFields:IDCColumns;
Var
  RowSet:IDCRowSet;
Begin
  CheckActive;
  OleCheck(FInfoSeti.QueryInterface(IDCRowSet,RowSet));
  Result:=RowSet.GetFields;
End;

{---------------------------------------------------------}

Procedure TCustomRelInfoSet.HandleEvent(const EventRec:PEventRec);
Begin
  With EventRec^ Do
    If (EventType=evActiveChanged) And (IUnknown(EventSource)=FInfoSeti) Then
    Begin
      If EventData^ Then
        If FInfoSeti.QueryInterface(IDCProperties,FProps)<>S_OK Then
          FProps:=Nil;
      FActive:=EventData^;
    End;
  Inherited;
End;

{---------------------------------------------------------}

Procedure TCustomRelInfoSet.Insert;
Var
  RowChange:IDCRowChange;
Begin
  FInfoSetI.QueryInterface(IDCRowChange,RowChange);
  If RowChange<>Nil Then
    RowChange.Insert;
  DoNewRecord;
End;

{---------------------------------------------------------}

Function TCustomRelInfoSet.IsFolder:Boolean;
var
  details : TList;
Begin
//  Result:=(Self Is TInfoSetRelInfoSet);
  details := FindDetails(FInfoSeti,FLevel);
  result := (details <> nil) and (details.Count > 0);
  details.Free;
End;

{---------------------------------------------------------}

Procedure TCustomRelInfoSet.Post;
Var
  RowChange:IDCRowChange;
Begin
  FInfoSetI.QueryInterface(IDCRowChange,RowChange);
  If RowChange<>Nil Then
    RowChange.Post;
End;

{---------------------------------------------------------}

Procedure TCustomRelInfoSet.SetConnected(Value:Boolean);
Var
  EventRec:TEventRec;
Begin
  If FInfoSeti=Nil Then
    Exit;
  If FActive=Value Then
    Exit;
  FActive:=Value;
  Event(Self,evActiveChanged,Value);
  BuildEventRec(EventRec,Self,evActiveChanged,Value);
  HandleEvent(@EventRec);
End;

{---------------------------------------------------------}

Function TCustomRelInfoSet.QueryInterface(const IID:TGuid;out Obj):HResult;
Begin
  If IsEqualGUID(IID,IDCProperties) Then
  Begin
    // to prevent return properties of InfoSeti
    If FProps=Nil Then
    Begin
      Result:=E_NOINTERFACE;
      Exit;
    End;
    IUnknown(Obj):=FProps;
    Result:=S_OK;
    Exit;
  End
  Else
    //If own filtering then disable filtering
    If IsEqualGuid(IDCDelayedFilter,IID) And FOwnFiltering Then
      Result:=E_NOINTERFACE
    Else
      Result:=Inherited QueryInterface(IID,Obj);
  If Result<>S_OK Then
  Begin
    If FInfoSeti=Nil Then
    Begin
      Result:=E_NOINTERFACE;
      Exit;
    End;
    Result:=FInfoSeti.QueryInterface(IID,Obj);
  End;
End;

{ TSecondInfoSet }

Destructor TSecondInfoSet.Destroy;
Begin
  Destroying:=True;
  _AddRef;
  UnregisterFromMaster;
  Inherited;
End;

{---------------------------------------------------------}

Function TSecondInfoSet.ApplyFilter:Boolean;
Var
  Filter:String;
  I:Integer;
  FilterIntf:IDCStackFilter;
  Prop:IDCProperty;
  PropType:TDBType;
  Value:Variant;
  s : string;
Begin
  Result:=False;
  If FRelation=Nil Then
    Exit;
  If FRelation.IncludeAllRecords Then
    Exit;  
  CreateValues;
  FilterIntf:=Nil;
  If Not OwnFiltering Then
    FilterIntf:=QueryStackFilter(FInfoSeti);
  If FilterIntf=Nil Then
    Exit;
  Filter:='';

  For I:=0 To FRelation.FDetailProps.Count-1 Do
  Begin
    Prop:=(FRelation.FDetailProps[I] As IDCProperty);
    If Filter<>'' Then
      Filter:='('+Filter+') AND '; //don't resource
    Filter:=Filter+QuoteFieldName(Prop.GetName);
    PropType:=Prop.GetPropType;
    Value:=FValues[I];
    If VarIsNull(Value) Then
      {$IFDEF D4}
      Filter:=Filter+' IS NULL' //don't resource
      {$ELSE}
      Filter:=Filter+'=NULL' //don't resource
      {$ENDIF}
    Else
      begin
        if IsStringType(PropType) Then
          s := AnsiQuotedStr(Value,'''')
        else if IsDateType(PropType) then
          s := '''' + DateTimeToStr(Value) + ''''
        else If IsIntegerType(PropType) Then
          s := IntToStr(Value)
        else
          s := FloatToStrF(Value,ffGeneral,17,0);

        Filter := Filter + '=' + s;
      end;
  End;
  FilterIntf.AddFilter(Filter);
  Result:=True;
End;

{---------------------------------------------------------}

Procedure TSecondInfoSet.CreateValues;
Var
  I:Integer;
  msize : integer;
Begin
  If FRelation=Nil Then
    Exit;
  if (fValues = nil) And (FRelation.FMasterProps.Count<>0) then
    begin
      FValueCount:=FRelation.FMasterFields.Count;
      msize := SizeOf(Variant) * FValueCount;
      GetMem(FValues, msize);
      FillChar(fValues^, msize, 0);
    end;
  For I:=0 To FValueCount-1 Do
    FValues[I]:=(IUnknown(FRelation.FMasterProps[I]) As IDCProperty).GetValue;
End;

{---------------------------------------------------------}

Procedure TSecondInfoSet.DoNewRecord;
Var
  I:Integer;
  RowSet:IDCRowSet;
  Props:IDCProperties;
  Prop:IDCProperty;
Begin
  Inherited;
  If FRelation=Nil Then
    Exit;
  If FRelation.IncludeAllRecords Then
    Exit;
  OleCheck(FInfoSeti.QueryInterface(IDCRowSet,RowSet));
  OleCheck(RowSet.QueryInterface(IDCProperties,Props));
  For I:=0 To FRelation.FDetailFields.Count-1 Do
  Begin
    Prop:=DCPropByName(Props,FRelation.FDetailFields[I]);
    If (Prop<>Nil) And (FValues<>Nil) Then
      Prop.SetValue(FValues[I]);
  End;
End;

{---------------------------------------------------------}

Function TSecondInfoSet.GetDisplayFieldName:String;
Begin
  If FRelation=Nil Then
    Result:=''
  Else
    Result:=FRelation.FDetailDisplayField;
End;

{---------------------------------------------------------}

Procedure TSecondInfoSet.FreeValues;
Var
  I:Integer;
Begin
  If (FRelation<>Nil) And (FValues<>Nil) Then
  Begin
    For I:=0 To FValueCount-1 Do
      FValues[I]:=UnAssigned;
    FreeMem(FValues);
    FValues:=Nil;
    FValueCount:=0;
  End;
End;

{---------------------------------------------------------}

Function TSecondInfoSet.GetIsEmpty:Boolean;
var
  iNavigation : IDCNavigation;
Begin
  If FAllRelations Then
  Begin
    fInfoSetI.QueryInterface(IDCNavigation, iNavigation);
    Result:=iNavigation.Bof And iNavigation.Eof;
  End
  Else
  Begin
    result := not fUseCaption;

    if result then
      if FRelation.IncludeAllRecords then
        begin
          CheckActive;
          result := (fInfoSetI.QueryInterface(IDCNavigation, iNavigation) = S_OK) and
                     iNavigation.EOF and iNavigation.BOF;
        end
      else
        Result:=UniLocate(True,True);
  End;      
End;

{---------------------------------------------------------}

Procedure TSecondInfoSet.HandleEvent(const EventRec:PEventRec);
Begin
  With EventRec^ Do
  Begin
    If (EventType=evActiveChanged) And
       (FRelation<>Nil) And
       ((IUnknown(EventSource)=FRelation.MasterInfoSeti) Or
        (IUnknown(EventSource)=FRelation.DetailInfoSeti)) Then
      If EventData^ Then
      Begin
        If Not FRelation.CheckPass1 Then
          FRelation.CheckRelationPass1;
        If Not FRelation.CheckPass2 And (IUnknown(EventSource)=FRelation.DetailInfoSeti) Then
          FRelation.CheckRelationPass2;
      End
      Else
      Begin
        FRelation.ClearPropLists;
        FreeValues;
      End
    Else
    If (EventType=evFieldListChange) And (IUnknown(EventSource)=FInfoSeti) Then
      If FRelation<>Nil Then
      Begin
        FRelation.ClearPropLists;
        FreeValues;
        FRelation.CheckRelationPass1;
        If IUnknown(EventSource)=FRelation.DetailInfoSeti Then
          FRelation.CheckRelationPass2;
      End;
    If (IUnknown(EventSource)<>FInfoSeti) And Not FAllRelations Then
      Begin
  {     If (EventType=evActiveChanged) And (EventData=False) Then
        UnregisterFromMaster;}
      End
    Else
      Inherited;
  End;
End;

{---------------------------------------------------------}

Procedure TSecondInfoSet.DoOnFilterRecord(const InfoSet:IUnknown;Var Accept:Boolean);
Var
  I:Integer;
  Data:Variant;
Begin
  Accept:=True;
  If FRelation=Nil Then
    Exit;
  If FRelation.IncludeAllRecords Then
    Exit;
  For I:=0 To FValueCount-1 Do
  Begin
    Data:=(FRelation.FDetailProps[I] As IDCProperty).GetValue;
    If (FValues[I]<>Data) Then
      If Not (VarIsNull(Data) And VarIsNull(FValues[I])) Then
      Begin
        Accept:=False;
        Break;
      End;
  End;
  If Assigned(OnFilterRecord) Then
    FOnFilterRecord(InfoSet,Accept);
End;

{---------------------------------------------------------}

Function TSecondInfoSet.LocateFirst:Boolean;
Begin
  Result:=UniLocate(False,True);
End;

{---------------------------------------------------------}

Function TSecondInfoSet.LocateNext:Boolean;
Begin
  Result:=UniLocate(False,False);
End;

{---------------------------------------------------------}

Function TSecondInfoSet.QueryInterface(const IID:TGuid;Out Obj):HResult;
Begin
  If IsEqualGuid(IDCDisplayField,IID) Then
    If FInfoSeti<>Nil Then
    Begin
      Result:=FInfoSeti.QueryInterface(IID,Obj);
      If Result<>S_OK Then
        Result:=Inherited QueryInterface(IID,Obj);
    End
    Else
      Result:=E_NOINTERFACE
  Else
    Result:=Inherited QueryInterface(IID,Obj);
End;

{---------------------------------------------------------}

Procedure TSecondInfoSet.RemoveFilter;
Var
  FilterIntf:IDCStackFilter;
Begin
  Inherited;
  FilterIntf:=Nil;
  If Not OwnFiltering Then
    FilterIntf:=QueryStackFilter(FInfoSeti);
  If FilterIntf<>Nil Then
    FilterIntf.RemoveFilter;
End;

{---------------------------------------------------------}

Function TSecondInfoSet.UniLocate(IsLookup,RereadValues:Boolean):Boolean;
Var
  Locate:IDCLocate;
  Fields:String;
  I:Integer;
  V:Variant;
  Data:PVariant;
Begin
  CheckActive;
  Result:=False;
  If FRelation=Nil Then
    Exit;
  If FRelation.IncludeAllRecords Then
    Exit;
  If FInfoSeti.QueryInterface(IDCLocate,Locate)<>S_OK Then
    Exit;
  If Not FRelation.CheckPass1 Then
    FRelation.CheckRelationPass1;
  FRelation.CheckRelationPass2;{!!!}
  Fields:='';
  If RereadValues Then
    CreateValues;
  For I:=0 To FRelation.FDetailProps.Count-1 Do
  Begin
    If Fields<>'' Then
      Fields:=Fields+';';
    Fields:=Fields+(FRelation.FDetailProps[I] As IDCProperty).GetName;
  End;
  If FRelation.FDetailProps.Count=1 Then
    If IsLookup Then
      Result:=VarIsNull(Locate.Lookup(Fields,FValues[0],Fields))
    else
      Result:=Locate.Locate(Fields,FValues[0])
  Else
  Begin
    V:=VarArrayCreate([0,FRelation.FDetailProps.Count-1],varVariant);
    Data:=VarArrayLock(V);
    Try
      For I:=0 To FRelation.FDetailProps.Count-1 Do
      Begin
        Data^:=FValues[I];
        Data:=Pointer(PChar(Data)+SizeOf(Data^));
      End;
      If IsLookup Then
        Result:=VarIsNull(Locate.Lookup(Fields,V,Fields))
      Else
        Result:=Locate.Locate(Fields,V)
    Finally
      VarArrayUnLock(V);
      V:=UnAssigned;
    End;
  End;
End;

{---------------------------------------------------------}

Procedure TSecondInfoSet.UnregisterFromMaster;
Var
  Events:IDCEvents;
Begin
  If FRelation<>Nil Then
  Begin
    FRelation.ClearPropLists;
    FreeValues;
  End;
  If FMasterInfoSet=Nil Then
    Exit;
  IUnknown(FMasterInfoSet).QueryInterface(IDCEvents,Events);
  Events.UnRegisterHandler(Self);
  FMasterInfoSet:=Nil;
End;

{ TInfoSetRelInfoSet }

Constructor TInfoSetRelInfoSet.CreateWithOwner(AOwner:TComponent);
Begin
  Inherited;
  FRelations:=CreateRelations;
  FRelations.FInfoSet:=Self;
End;

{---------------------------------------------------------}

Destructor TInfoSetRelInfoSet.Destroy;
Begin
  Destroying:=True;
  _AddRef;
  FRelations.Free;
  Inherited;
End;

{---------------------------------------------------------}

Function TInfoSetRelInfoSet.ApplyFilter:Boolean;
Var
  Filter:IDCStackFilter;
Begin
  Result:=False;
  If Trim(FFilter)='' Then
    Exit;
  If Not Filtered Then
    Exit;
  CheckActive;
  Filter:=QueryStackFilter(FInfoSeti);
  Filter.AddFilter(FFilter);
  Event(Self,evActiveChanged,True);
  Result:=True;
End;

{---------------------------------------------------------}

Procedure TInfoSetRelInfoSet.CheckFilter;
Var
  Props:IDCProperties;
  RowSet:IDCRowSet;
  Connect:IDCConnect;
  FilterChecked:Boolean;
Begin
  If (FInfoSeti=Nil) Or (FFilter='') Or FInCheckFilter Then
    Exit;
  If Trim(FFilter)<>'' Then
  Begin
    FInfoSeti.QueryInterface(IDCConnect,Connect);
    If (Connect=Nil) Or Connect.Connected Then
    Begin
      FilterChecked:=InternalCheckFilter;
      If Not FilterChecked Then
        ParseExpr(FFilter,FFieldName,FValue);
      If Active And Not FilterChecked Then
      Begin
        If FInfoSeti.QueryInterface(IDCConnect,Connect)=S_OK Then
          If Not Connect.Connected Then
            Exit;
        OleCheck(FInfoSeti.QueryInterface(IDCRowSet,RowSet));
        Props:=RowSet.GetFields As IDCProperties;
        FProp:=DCPropByName(Props,FFieldName);
        If FProp=Nil Then
          ErrorFmt(SErrFieldNotFound,[FFieldName]);
      End;
    End
  End;
End;

{---------------------------------------------------------}

Function TInfoSetRelInfoSet.CreateRelations:TDCRelations;
Begin
  Result:=TDCRelations.Create(FOwner,TInfoSetRelation);
End;

{---------------------------------------------------------}

Procedure TInfoSetRelInfoSet.DoNewRecord;
Var
  RowSet:IDCRowSet;
  Props:IDCProperties;
  Prop:IDCProperty;
Begin
  Inherited;
  OleCheck(FInfoSeti.QueryInterface(IDCRowSet,RowSet));
  OleCheck(RowSet.QueryInterface(IDCProperties,Props));
  Prop:=DCPropByName(Props,FFieldName);
  If Prop<>Nil Then
    Prop.SetValue(FValue);
End;

{---------------------------------------------------------}

Procedure TInfoSetRelInfoSet.HandleEvent(const EventRec:PEventRec);

  Procedure FreeAll;
  Begin
        FRelations.ClearPropLists;
        FFieldName:='';
        FValue:=UnAssigned;
        FProp:=Nil;
  End;

Begin
  With EventRec^ Do
    Case EventType Of
     evActiveChanged:
      If EventData^ Then
      Begin
        If Filtered Then
          Try
            CheckFilter;
          Except
            If (FInfoSet<>Nil) And (csDesigning In FInfoSet.ComponentState) Then
              Application.HandleException(Nil)
            Else
              Raise;
          End;
        If Not EventData^ Then
          Relations.ClearPropLists;
      End
      Else
        FreeAll;
     evFieldListChange:
        FreeAll;
    End;
  Inherited;
End;

{---------------------------------------------------------}

Procedure TInfoSetRelInfoSet.DoOnFilterRecord(const InfoSet:IUnknown;Var Accept:Boolean);
Begin
  If Not FFiltered Then
    Exit;
  If CanEvaluateFilter Then
    Accept:=EvaluateFilter
  Else
  Begin
    If FProp=Nil Then
      Exit;
    If VarIsNull(FValue) Then
      Accept:=VarIsNull(FProp.GetValue)
    Else
      Accept := FValue = FProp.GetValue;
  End;
  If Assigned(FOnFilterRecord) Then
    FOnFilterRecord(Self,Accept);
End;

{---------------------------------------------------------}

Function TInfoSetRelInfoSet.InternalCheckFilter:Boolean;
Begin
  Result:=False;
End;

{---------------------------------------------------------}

Procedure TInfoSetRelInfoSet.RemoveFilter;
Var
  FilterIntf:IDCStackFilter;
Begin
  Inherited;
  FilterIntf:=QueryStackFilter(FInfoSeti);
  If FilterIntf<>Nil Then
    FilterIntf.RemoveFilter;
End;

{---------------------------------------------------------}

Procedure TInfoSetRelInfoSet.SetConnected(Value:Boolean);
Begin
  If FActive=Value Then
    Exit;
  Inherited;
  If Not Value Then
    Relations.ClearPropLists;
End;

{---------------------------------------------------------}

Procedure TInfoSetRelInfoSet.SetFilter(const Value:String);
Var
  OldFilter:String;
Begin
  If FFilter=Value Then
    Exit;
  OldFilter:=FFilter;
  FFilter:=Value;
  Try
    CheckFilter;
    If Filtered Then
      Event(Self,evActiveChanged,True);
  Except
    FFilter:=OldFilter;
    If (FInfoSet<>Nil) And (csDesigning In FInfoSet.ComponentState) Then
      Application.HandleException(Nil)
    Else
      Raise;
  End;
End;

{---------------------------------------------------------}

Procedure TInfoSetRelInfoSet.SetFiltered(Value:Boolean);
Begin
  If FFiltered=Value Then
    Exit;
  If Active Then
  Begin
    Try
      CheckFilter;
    Except
      If (FInfoSet<>Nil) And (csDesigning In FInfoSet.ComponentState) Then
        Application.HandleException(Nil)
      Else
        Raise;
    End;
    FFiltered:=Value;
    If FFilter<>'' Then
      Event(Self,evActiveChanged,True);
  End
  Else
    FFiltered:=Value;
End;

{---------------------------------------------------------}

Procedure TInfoSetRelInfoSet.SetRelations(Value:TDCRelations);
Begin
  FRelations.Assign(Value);
End;

{---------------------------------------------------------}

Procedure TInfoSetRelInfoSet.SetRootInfoSet(Value:TComponent);
Begin
  If FInfoSet=Value Then
    Exit;
  FInfoSet:=Value;
End;

{---------------------------------------------------------}

Procedure TInfoSetRelInfoSet.SetRootInfoSeti(const Value:IUnknown);
Var
  Connect:IDCConnect;
Begin
  If FInfoSeti=Value Then
    Exit;
  If FInfoSeti<>Nil Then
    SetConnected(False);
  FInfoSeti:=Value;
  Try
    CheckFilter;
  Except
    If (FInfoSet<>Nil) And (csDesigning In FInfoSet.ComponentState) Then
      Application.HandleException(Nil)
    Else
      Raise;
  End;

  Inherited InfoSet:=FInfoSeti;
  Inherited OnFilter:=DoOnFilterRecord;
  If FOwnFiltering Then
    DirectNavigation:=False
  Else
    DirectNavigation:=QueryStackFilter(FInfoSeti)<>Nil;

  If FInfoSeti<>Nil Then
    If FInfoSeti.QueryInterface(IDCConnect,Connect)=S_OK Then
      If Connect.GetConnected Then
        SetConnected(True);
End;

{ TCustomDCRelInfoSet }

Function TCustomDCRelInfoSet.GetFilter:String;
Begin
  Result:=TInfoSetRelInfoSet(FIntfObj).Filter;
End;

{---------------------------------------------------------}

Function TCustomDCRelInfoSet.GetFiltered:Boolean;
Begin
  Result:=TInfoSetRelInfoSet(FIntfObj).Filtered;
End;

{---------------------------------------------------------}

{Function TCustomDCRelInfoSet.GetOnFilterRecord:TInfoFilterEvent;
Begin
  Result:=TInfoSetRelInfoSet(FIntfObj).OnFilterRecord;
End;}

{---------------------------------------------------------}

Function TCustomDCRelInfoSet.GetOnRelationActive:TRelationActiveEvent;
Begin
  Result:=TInfoSetRelInfoSet(FIntfObj).OnRelationActive;
End;

{---------------------------------------------------------}

Function TCustomDCRelInfoSet.GetOwnFiltering:Boolean;
Begin
  Result:=TInfoSetRelInfoSet(FIntfObj).OwnFiltering;
End;

{---------------------------------------------------------}

Function TCustomDCRelInfoSet.GetRelations:TDCRelations;
Begin
  Result:=TInfoSetRelInfoSet(FIntfObj).Relations;
End;

{---------------------------------------------------------}

Function TCustomDCRelInfoSet.GetRootInfoSet:TComponent;
Begin
  Result:=TInfoSetRelInfoSet(FIntfObj).RootInfoSet;
End;

{---------------------------------------------------------}

Function TCustomDCRelInfoSet.GetRootInfoSeti:IUnknown;
Begin
  Result:=TInfoSetRelInfoSet(FIntfObj).RootInfoSeti;
End;

{---------------------------------------------------------}

Procedure TCustomDCRelInfoSet.SetFilter(const Value:String);
Begin
  TInfoSetRelInfoSet(FIntfObj).Filter:=Value;
End;

{---------------------------------------------------------}

Procedure TCustomDCRelInfoSet.SetFiltered(Value:Boolean);
Begin
  TInfoSetRelInfoSet(FIntfObj).Filtered:=Value;
End;

{---------------------------------------------------------}

{Procedure TCustomDCRelInfoSet.SetOnFilterRecord(Value:TInfoFilterEvent);
Begin
  TInfoSetRelInfoSet(FIntfObj).OnFilterRecord:=Value;
End;}

{---------------------------------------------------------}

Procedure TCustomDCRelInfoSet.SetOnRelationActive(Value:TRelationActiveEvent);
Begin
  TInfoSetRelInfoSet(FIntfObj).OnRelationActive:=Value;
End;

{---------------------------------------------------------}

Procedure TCustomDCRelInfoSet.SetOwnFiltering(Value:Boolean);
Begin
  TInfoSetRelInfoSet(FIntfObj).OwnFiltering:=Value;
End;

{---------------------------------------------------------}

Procedure TCustomDCRelInfoSet.SetRelations(Value:TDCRelations);
Begin
  TInfoSetRelInfoSet(FIntfObj).Relations.Assign(Value);
End;

{---------------------------------------------------------}

Procedure TCustomDCRelInfoSet.SetRootInfoSet(Value:TComponent);
Begin
  TInfoSetRelInfoSet(FIntfObj).RootInfoSet:=Value;
End;

{---------------------------------------------------------}

Procedure TCustomDCRelInfoSet.SetRootInfoSeti(const Value:Iunknown);
Begin
  TInfoSetRelInfoSet(FIntfObj).RootInfoSeti:=Value;
End;

{ TDCRelInfoSet }

constructor TDCRelInfoSet.Create(AOwner: TComponent);
Var
  IntObj:TCustomRelInfoSet;
begin
  Inherited;
  IntObj:= TInfoSetRelInfoSet.CreateWithOwner(AOwner);
  ObjInterface:=IntObj;
  VCLComObject:=Pointer(ObjInterface);
  IntfObj:=IntObj;
end;

End.
