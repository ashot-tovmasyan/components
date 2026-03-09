{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit dcJoinInfoSet;

interface
Uses Windows, Classes, SysUtils,
     dcInfoDB, dcConsts, dcdreamLib, dcInfoLib;

Type
  TCustomDCJoinRelation=Class(TDCNamedItem,IUnknown,IDCEventHandler)
  Private
    FActive:Boolean;
    FBookmark:IDCBookmark;
    FDelayedFilter:IDCDelayedFilter;
    FDisplayField:String;
    FInfoSet:TDCLinkedComponent;
    FInfoSeti:IUnknown;
    FInterfacesChecked:Boolean;
    FNavigation:IDCNavigation;
    FRowSet:IDCRowSet;
    FSaveBookmarks:TStringList;
    Procedure AfterChange(OldCompleted:Boolean);
    Procedure CheckInterfaces;
    Function GetInfoSet:TComponent;
    Function IsAccepted(CheckEmpty:Boolean):Boolean;
    Function IsComplete:Boolean;
    Procedure PulseConnected;
    Procedure SetActive(Value:Boolean);
    Procedure SetDisplayField(Const Value:String);
    Procedure SetInfoSet(Value:TComponent);
    Procedure SetInfoSeti(const Value:IUnknown);
  Protected
    //IUnknown only for IDCEventHandler support
    {IUnknown}
    Function _AddRef:Integer; stdcall;
    Function _Release:Integer; stdcall;
    Function QueryInterface(const IID:TGUID; out Obj):HResult;virtual;stdcall;
    {IDCEventHandler}
    Procedure HandleEvent(const EventRec:PEventRec);virtual;
  Public
    Constructor Create(Collection:TCollection);override;
    Destructor Destroy;override;

    Property InfoSet:TComponent read GetInfoSet write SetInfoSet;
    Property InfoSeti:IUnknown read FInfoSeti write SetInfoSeti;
  Published
    Property Active:Boolean read FActive write SetActive default True;
    Property DisplayField:String read FDisplayField write SetDisplayField;
  End;

  TDCJoinRelations=Class(TCustomDCNamedItems)
  Private
    FInfoSet:TObject;
    Function GetItems(Index:Integer):TCustomDCJoinRelation;
  Protected
    Procedure Updated;virtual;
    
    Property InfoSet:TObject read FInfoSet write FInfoSet;
  Public
    Property Items[Index:Integer]:TCustomDCJoinRelation read GetItems;default;
  End;

  TDCJoinRelation=Class(TCustomDCJoinRelation)
  Published
    Property InfoSet;
  End;

  TDBJoinRelation=Class(TCustomDCJoinRelation)
  Private
    FDataSet:TDCLinkedComponent;
    Function GetDataSet:TComponent;
    Procedure SetDataSet(Value:TComponent);
  Public
    Constructor Create(Collection:TCollection);override;
    Destructor Destroy;override;
  Published
    Property DataSet:TComponent read GetDataSet write SetDataSet;
  End;

  TDBJoinRelations=Class(TDCJoinRelations)
  Private
    Function GetItems(Index:Integer):TDBJoinRelation;
  Public
    Property Items[Index:Integer]:TDBJoinRelation read GetItems;default;
  End;

  TJoinInfoSet=Class;
  
  { TNavigationWrapper }

  TNavigationWrapper=Class(TDCInterfacedObject,IUnknown,IDCNavigation)
  Private
    FNeedFirst:Boolean;
    FOwner:TJoinInfoSet;
  Protected
    Procedure PsevdoFirst;
    {IDCNaviagtion}
    Function GetBof:Boolean;
    Function GetEof:Boolean;
    Procedure First;
    Procedure Last;
    Procedure Next;
    Procedure Prev;
  Public
    Constructor Create(AOwner:TJoinInfoSet);
  End;

  { TJoinInfoSet }

  TJoinInfoSet=Class(TDCInterfacedObject,IDCBookmark,IDCBookmarkEx,IDCConnect,
                     IDCDelayedFilter,IDCDisplayField,IDCEvents,IDCEventHandler,IDCRowSet,
                     IDCSafeUpdates,IDCSavePosition,IDCUpdates)
  Private
    FActive:Boolean;
    FCurrentRel:Integer;
    FCurrentRelation:TCustomDCJoinRelation;
    FNavigation:TNavigationWrapper;
    FNotifiers:IDCEventsEx;
    FOwner:TComponent;
    FRelations:TDCJoinRelations;
    FRowChangeLock:Integer;
    Function CanConnect:Boolean;
    Function CreateBookmark(Const Bookmark:String):String;
    Function CreateBookmarkEx(Const Bookmark:String;Relation:TCustomDCJoinRelation):String;
    Procedure ExtractBookmark(Var Bookmark:String;Var Relation:TCustomDCJoinRelation);
    Procedure Event(EventType:Integer;const EventData:OleVariant);
    Function FindNextConnected(ACurrentRel:Integer;CheckEmpty:Boolean):Integer;
    Function FindPrevConnected(ACurrentRel:Integer;CheckEmpty:Boolean):Integer;
    Function GetNavigation:TNavigationWrapper;
    Procedure NotifyHandlers(EventType:Integer;const EventData:OleVariant);
    Procedure RowChangeLock;
    Function  RowChangeLocked:Boolean;
    Procedure RowChangeUnLock;
    Procedure SetCurrentRel(Value:Integer);
    Procedure SetRelations(Value:TDCJoinRelations);
  Protected
    Function CreateRelations:TDCJoinRelations;virtual;
    {IDCBookmark}
    Function CompareBookMarks(const B1,B2:TDCBookMark):Integer;
    Function BookMarkValid(const BookMark:TDCBookMark):Boolean;
    {IDCBookmarkEx}
    Function GetBookmark:TDCBookMark;
    Procedure GotoBookmark(const Bookmark:TDCBookMark);
    {IDConnect}
    Function GetConnected:Boolean;
    Procedure SetConnected(Value:Boolean);
    {IDCDelayedFiler}
    Function ApplyFilter:Boolean;
    Procedure RemoveFilter;
    {IDCDisplayField}
    Function GetDisplayFieldName:String;
    {IDCEventHandler}
    Procedure HandleEvent(const EventRec:PEventRec);virtual;
    {IDCEvents}
    Procedure RegisterHandler(const EventHandler:IDCEventHandler;EventTypes, UserData:DWORD);
    Procedure UnregisterHandler(const EventHandler:IDCEventHandler);
    {IDCRowSet}
    Function GetRow:IUnknown;
    Function GetFields:IDCColumns;

    {IDCSafeUpdates}
    procedure SafeBeginUpdate;
    procedure SafeEndUpdate;

    {IDCSavePosition}
    Procedure SavePosition;
    Procedure RestorePosition;

    {IDCUpdates}
    procedure BeginUpdate;
    procedure EndUpdate;

    Property CurrentRel:Integer read FCurrentRel write SetCurrentRel;
    Property Owner:TComponent read FOwner;
  Public
    Constructor Create(AOwner:TComponent);virtual;
    Destructor  Destroy;override;

    {IUnknown}
    Function QueryInterface(Const IID:TGuid;Out Obj):HResult;override;stdcall;

    Property Relations:TDCJoinRelations read FRelations write SetRelations;
  End;

  TCustomDCJoinInfoSet=Class(TComponent,IUnknown)
  Private
    FIntfObj:TObject;
    FInterface:IUnknown;
    Function GetRelations:TDCJoinRelations;
    Procedure SetRelations(Value:TDCJoinRelations);
  Protected
    Property IntfObj:TObject read FIntfObj write FIntfObj;
    Property ObjInterface:IUnknown read FInterface write FInterface;
    Property Relations:TDCJoinRelations read GetRelations write SetRelations;
  End;

  TDCDBJoinInfoSet=Class(TCustomDCJoinInfoSet)
  Private
    FVersion:TDCInfoTreeVersion;
    Function GetRelations:TDBJoinRelations;
    Procedure SetRelations(Value:TDBJoinRelations);
  Public
    Constructor Create(AOwner:TComponent);override;
  Published
    Property Relations:TDBJoinRelations read GetRelations write SetRelations;
    Property Version:TDCInfoTreeVersion read FVersion write FVersion stored False;
  End;

implementation
Uses ActiveX, ComObj;

Type
  { TRowSetWrapper }

  TRowSetWrapper=Class(TDCInterfacedObject)
  Private
    FIntf:IUnknown;
    FOwner:TJoinInfoSet;
  Protected
    Function QueryInterface(const IID:TGuid;Out Obj):HResult;override;stdcall;
  Public
    Constructor Create(AOwner:TJoinInfoSet;Const Intf:IUnknown);
  End;

  { TBookmarkWrapper }

  TBookmarkWrapper=Class(TDCInterfacedObject,IDCBookmark,IDCBookmarkEx)
  Private
    FIntf:IUnknown;
    FOwner:TJoinInfoSet;
  Protected
    {IDCBookmark}
    Function GetBookmark:TDCBookMark;
    Procedure GotoBookmark(const Bookmark:TDCBookMark);
    {IDCBookmarkEx}
    function CompareBookMarks(const B1, B2 : TDCBookMark) : integer;
    function BookMarkValid(const BookMark : TDCBookMark) : boolean;
    {IUnknown}
    Function QueryInterface(Const IID:TGuid;Out Obj):HResult;override;stdcall;
  Public
    Constructor Create(AOwner:TJoinInfoSet;Const AIntf:IUnknown);
  End;

  { TRowChangeWrapper}

  TRowChangeWrapper=Class(TDCInterfacedObject,IUnknown,IDCRowChange)
  Private
    FIntf:IUnknown;
    FOwner:TJoinInfoSet;
    FRowChange:IDCRowChange;
  Protected
    {IDCRowChange}
    Procedure Append;
    Procedure Cancel;
    Procedure Delete;
    Procedure Edit;
    Procedure Insert;
    Procedure Post;
    {IUnknown}
    Function QueryInterface(Const IID:TGuid;Out Obj):HResult;override;stdcall;
  Public
    Constructor Create(AOwner:TJoinInfoSet;Const AIntf:IUnknown);
  End;

  TDBJoinInfoSet=Class(TJoinInfoSet)
  Protected
    Function CreateRelations:TDCJoinRelations;override;
  End;

{ TCustomDCJoinRelation }

Constructor TCustomDCJoinRelation.Create(Collection:TCollection);
Begin
  Inherited;
  FInfoSet:=TDCLinkedComponent.Create(Nil);
  FActive:=True;
End;

{---------------------------------------------------------}

Destructor TCustomDCJoinRelation.Destroy;
Begin
  With TJoinInfoSet(TDCJoinRelations(Collection).InfoSet) Do
  Begin
    InfoSeti:=Nil;
    If FInfoSeti<>Nil Then
      SetConnected(False);
    Self.FInfoSet.Free;
    Self.FSaveBookmarks.Free;
    Inherited;
    If CanConnect Then
      SetConnected(True);
  End;
End;

{---------------------------------------------------------}

Function TCustomDCJoinRelation._AddRef:Integer;
Begin
  Result:=1;
End;

{---------------------------------------------------------}

Function TCustomDCJoinRelation._Release:Integer;
Begin
  Result:=1;
End;

{---------------------------------------------------------}

Procedure TCustomDCJoinRelation.AfterChange(OldCompleted:Boolean);
Begin
  If Not OldCompleted And Not IsComplete Then
    Exit;
  PulseConnected;
End;

{---------------------------------------------------------}

Function TCustomDCJoinRelation.GetInfoSet:TComponent;
Begin
  Result:=TComponent(FInfoSet.Link);
End;

{---------------------------------------------------------}

Procedure TCustomDCJoinRelation.CheckInterfaces;
Begin
  If Not FInterfacesChecked And (FInfoSeti<>Nil) Then
  Begin
    FInfoSeti.QueryInterface(IDCBookmark,FBookmark);
    FInfoSeti.QueryInterface(IDCDelayedFilter,FDelayedFilter);
    FInfoSeti.QueryInterface(IDCNavigation,FNavigation);
    FInfoSeti.QueryInterface(IDCRowSet,FRowSet);
    FInterfacesChecked:=True;
  End;
End;

{---------------------------------------------------------}

Procedure TCustomDCJoinRelation.HandleEvent(const EventRec:PEventRec);
Var
  InfoSet:TJoinInfoSet;
  NewBookmark:OleVariant;
  Bookmark:String;
  NewEventRec:TEventRec;
Begin
  NewEventRec:=EventRec^;
  With NewEventRec Do
  Begin
    If (EventType=evActiveChanged) And (IUnknown(EventSource)=FInfoSeti) Then
      PulseConnected;
    InfoSet:=TJoinInfoSet(TDCJoinRelations(Collection).InfoSet);
    If EventType And EventsWithBookMark<>0 Then
    Begin
      Bookmark:=EventData^;
      Case EventType Of
        evRowChanged:
          If Not InfoSet.RowChangeLocked Then
            InfoSet.CurrentRel:=Index;
        evRowInserted:
          Begin
            InfoSet.RowChangeLock;
            FBookmark.GotoBookmark(Bookmark);
          End;
      End;
      NewBookmark:=InfoSet.CreateBookmarkEx(Bookmark,Self);
      EventData:=@NewBookmark;
    End;
    If (EventType And (evFieldChanged Or evRowInserted Or evRowDeleted))<>0 Then
      EventSource:=TBookmarkWrapper.Create(InfoSet,IUnknown(EventSource));
    InfoSet.HandleEvent(@NewEventRec);
    If EventType=evRowInserted Then
      InfoSet.RowChangeUnLock;
  End;
End;

{---------------------------------------------------------}

Function TCustomDCJoinRelation.IsAccepted(CheckEmpty:Boolean):Boolean;
Begin
  Result:=IsComplete;
  CheckInterfaces;
  If CheckEmpty Then
    Result:=Result And Not (FNavigation.Bof And FNavigation.Eof);
End;

{---------------------------------------------------------}

Function TCustomDCJoinRelation.IsComplete;
Var
  Connect:IDCConnect;
Begin
  Result:=(FDisplayField<>'') And (FInfoSetI<>Nil) And Active And
          ((InfoSetI.QueryInterface(IDCConnect,Connect)<>S_OK) Or Connect.GetConnected);
End;

{---------------------------------------------------------}

Function TCustomDCJoinRelation.QueryInterface(const IID:TGUID; out Obj):HResult;
Begin
  If GetInterface(IID,Obj) Then
    Result:=S_OK
  Else
    Result:=E_NOINTERFACE;
End;

{---------------------------------------------------------}

Procedure TCustomDCJoinRelation.PulseConnected;
Begin
  With TJoinInfoSet(TDCJoinRelations(Collection).InfoSet) Do
  Begin
    SetConnected(False);
    SetConnected(True);
  End;
End;

{---------------------------------------------------------}

Procedure TCustomDCJoinRelation.SetActive(Value:Boolean);
Begin
  If FActive=Value Then
    Exit;
  FActive:=Value;
  PulseConnected;
End;

{---------------------------------------------------------}

Procedure TCustomDCJoinRelation.SetDisplayField(const Value: String);
Var
  Completed:Boolean;
Begin
  If FDisplayField=Value Then
    Exit;
  Completed:=IsComplete;
  FDisplayField:=Value;
  AfterChange(Completed);
end;

{---------------------------------------------------------}

Procedure TCustomDCJoinRelation.SetInfoSet(Value:TComponent);
Begin
  If InfoSet=Value Then
    Exit;
  FInfoSet.Link:=Value;
  InfoSeti:=QueryUnknown(Value);
End;

{---------------------------------------------------------}

Procedure TCustomDCJoinRelation.SetInfoSeti(const Value:IUnknown);
Var
  Completed:Boolean;
  Events:IDCEvents;
Begin
  If FInfoSeti=Value Then
    Exit;
  Completed:=IsComplete;
  If FInfoSeti<>Nil Then
    If FInfoSeti.QueryInterface(IDCEvents,Events)=S_OK Then
      Events.UnregisterHandler(IDCEventHandler(Self));
  FBookmark:=Nil;
  FNavigation:=Nil;
  FRowSet:=Nil;
  FInfoSeti:=Value;
  If FInfoSeti<>Nil Then
  Begin
    If FInfoSeti.QueryInterface(IDCEvents,Events)=S_OK Then
      Events.RegisterHandler(IDCEventHandler(Self),evAll,0);
    FInterfacesChecked:=False;
  End;
  AfterChange(Completed);
End;

{ TDBJoinRelation }

Constructor TDBJoinRelation.Create(Collection:TCollection);
Begin
  Inherited;
  FDataSet:=TDCLinkedComponent.Create(Nil);
End;

{------------------------------------------------------------------}

Destructor TDBJoinRelation.Destroy;
Begin
  FreeObject(FDataSet,FDataSet);
  Inherited;
End;

{------------------------------------------------------------------}

Function TDBJoinRelation.GetDataSet:TComponent;
Begin
  Result:=TComponent(FDataSet.Link);
End;

{------------------------------------------------------------------}

Procedure TDBJoinRelation.SetDataSet(Value:TComponent);
Begin
  FDataSet.Link:=Value;
  InfoSeti:=ResetInfoSet(InfoSeti,Value);
End;

{ TDCJoinRelations }

Function TDCJoinRelations.GetItems(Index:Integer):TCustomDCJoinRelation;
Begin
  Result:=TCustomDCJoinRelation(Inherited Items[Index]);
End;

{------------------------------------------------------------------}

Procedure TDCJoinRelations.Updated;
Begin
  Inherited;
  With TJoinInfoSet(InfoSet) Do
  Begin
    SetConnected(False);
    SetConnected(True);
  End;
End;

{ TDBJoinRelations }

Function TDBJoinRelations.GetItems(Index:Integer):TDBJoinRelation;
Begin
  Result:=TDBJoinRelation(Inherited Items[Index]);
End;

{ TRowSetWrapper }

Constructor TRowSetWrapper.Create(AOwner:TJoinInfoset;Const Intf:IUnknown);
Begin
  Inherited Create;
  FIntf:=Intf;
  FOwner:=AOwner;
End;

{------------------------------------------------------------------}

Function TRowSetWrapper.QueryInterface(Const IID:TGuid;Out Obj):HResult;
Begin
  Result:=FIntf.QueryInterface(IID,Obj);
  If (IsEqualGUID(IID,IDCBookmark) Or IsEqualGuid(IID,IDCBookmarkEx)) And (Result=S_OK) Then
    IUnknown(Obj):=TBookmarkWrapper.Create(FOwner,IUnknown(Obj)) As IDCBookmarkEx
  Else
    If IsEqualGuid(IDCNavigation,IID) Then
    Begin
      IUnknown(Obj):=FOwner.GetNavigation;
      Result:=S_OK;
    End;  
End;

{ TBookmarkWrapper }

Constructor TBookmarkWrapper.Create(AOwner:TJoinInfoSet;Const AIntf:IUnknown);
Begin
  Inherited Create;
  FIntf:=AIntf;
  FOwner:=AOwner;
End;

{------------------------------------------------------------------}

Function TBookmarkWrapper.GetBookmark:TDCBookMark;
Begin
  If Fowner.FCurrentRelation<>Nil Then
    Result:=FOwner.CreateBookmark(FOwner.FCurrentRelation.FBookmark.GetBookmark);
End;

{------------------------------------------------------------------}

Procedure TBookmarkWrapper.GotoBookmark(const Bookmark:TDCBookMark);
Var
  Bkmk:String;
  Rel:TCustomDCJoinRelation;
Begin
  Bkmk:=Bookmark;
  FOwner.ExtractBookmark(Bkmk,Rel);
  FOwner.CurrentRel:=Rel.Index;
  FOwner.FCurrentRelation.FBookmark.GotoBookmark(Bkmk);
End;

{------------------------------------------------------------------}

function TBookmarkWrapper.CompareBookMarks(const B1, B2 : TDCBookMark) : integer;
Var
  Rel1,Rel2:TCustomDCJoinRelation;
  Bkmk1:String;
  Bkmk2:String;
  BookmarkEx:IDCBookmarkEx;
Begin
  FOwner.FCurrentRelation.QueryInterface(IDCBookmarkEx,BookmarkEx);
  If (BookmarkEx<>Nil) And (B1<>'') And (B2<>'') Then
  Begin
    Bkmk1:=B1;
    Bkmk2:=B2;
    FOwner.ExtractBookmark(Bkmk1,Rel1);
    FOwner.ExtractBookmark(Bkmk2,Rel2);
    If Rel1<>Rel2 Then
    Begin
      Result:=Integer(Rel1)-Integer(Rel2);
      Exit;
    End;
    Result:=BookmarkEx.CompareBookmarks(Bkmk1,Bkmk2)
  End
  Else
    Result:=0;
End;

{------------------------------------------------------------------}

function TBookmarkWrapper.BookMarkValid(const BookMark : TDCBookMark) : boolean;
Var
  Bkmk:String;
  Rel:TCustomDCJoinRelation;
  BookmarkEx:IDCBookmarkEx;
Begin
  FOwner.FCurrentRelation.QueryInterface(IDCBookmarkEx,BookmarkEx);
  If BookmarkEx=Nil Then
    Result:=True
  Else
  Begin
    Bkmk:=Bookmark;
    FOwner.ExtractBookmark(Bkmk,Rel);
    Result:=BookmarkEx.BookMarkValid(Bkmk);
  End;
End;

{------------------------------------------------------------------}

Function TBookmarkWrapper.QueryInterface(Const IID:TGuid;Out Obj):HResult;
Begin
  If IsEqualGuid(IDCBookmark,IID) Or IsEqualGuid(IDCBookmarkEx,IID) Then
    Result:=Inherited QueryInterface(IID,Obj)
  Else
    If IsEqualGuid(IDCNavigation,IID) Then
    Begin
      IUnknown(Obj):=FOwner.GetNavigation;
      Result:=S_OK;
    End
    Else
    Begin
      Result:=FIntf.QueryInterface(IID,Obj);
      If IsEqualGuid(IDCRowSet,IID) Then
        IUnknown(Obj):=TBookmarkWrapper.Create(FOwner,IUnknown(Obj));
    End    
End;

{ TRowChangeWrapper }

Constructor TRowChangeWrapper.Create(AOwner:TJoinInfoSet;Const AIntf:IUnknown);
Begin
  Inherited Create;
  FIntf:=AIntf;
  FOwner:=AOwner;
  FIntf.QueryInterface(IDCRowChange,FRowChange);
End;

{------------------------------------------------------------------}

Procedure TRowChangeWrapper.Append;
Begin
  FRowChange.Append;
End;

{------------------------------------------------------------------}

Procedure TRowChangeWrapper.Cancel;
Begin
  FRowChange.Cancel;
End;

{------------------------------------------------------------------}

Procedure TRowChangeWrapper.Delete;
Var
  Navigation:IDCNavigation;
  NextRel:Integer;
Begin
  FRowChange.Delete;
  FIntf.QueryInterface(IDCNavigation,Navigation);
  If Navigation.Bof And Navigation.Eof Then
  Begin
    NextRel:=FOwner.FindNextConnected(FOwner.CurrentRel,True);
    If NextRel=-1 Then
    Begin
      FOwner.CurrentRel:=FOwner.FindPrevConnected(FOwner.CurrentRel,True);
      If FOwner.FCurrentRelation<>Nil Then
        FOwner.FCurrentRelation.FNavigation.Last;
    End
    Else
    Begin
      FOwner.CurrentRel:=NextRel;
      If FOwner.FCurrentRelation<>Nil Then
        FOwner.FCurrentRelation.FNavigation.First;
    End;
  End;
End;

{------------------------------------------------------------------}

Procedure TRowChangeWrapper.Edit;
Begin
  FRowChange.Edit;
End;

{------------------------------------------------------------------}

Procedure TRowChangeWrapper.Insert;
Begin
  FRowChange.Insert;
End;

{------------------------------------------------------------------}

Function TRowChangeWrapper.QueryInterface(Const IID:TGuid;Out Obj):HResult;
Begin
  Result:=Inherited QueryInterface(IID,Obj);
  If Result<>S_OK Then
    Result:=FIntf.QueryInterface(IID,Obj);
End;

{------------------------------------------------------------------}

Procedure TRowChangeWrapper.Post;
Begin
  FRowChange.Post;
End;

{ TNavigationWrapper }

Constructor TNavigationWrapper.Create(AOwner:TJoinInfoSet);
Begin
  Inherited Create;
  FOwner:=AOwner;
End;

{------------------------------------------------------------------}

Procedure TNavigationWrapper.First;
Var
  CurRel:Integer;
Begin
  With FOwner Do
  Begin
    CurRel:=-1;
    Repeat
      CurrentRel:=FindNextConnected(CurRel,False);
      If FCurrentRelation<>Nil Then
      Begin
        FCurrentRelation.CheckInterfaces;
        FCurrentRelation.FNavigation.First;
        If Not FCurrentRelation.FNavigation.Eof Then
          Break;
      End
      Else
        Break;
      CurRel:=CurrentRel;    
    Until False;
  End;
  FNeedFirst:=False;
End;

{------------------------------------------------------------------}

Function TNavigationWrapper.GetBof:Boolean;
Begin
  If FNeedFirst Then
    First;
  With FOwner Do
    If (FindNextConnected(-1,True)=CurrentRel) Then
      If FCurrentRelation<>Nil Then
        Result:=FCurrentRelation.FNavigation.Bof
      Else
        Result:=True
    Else
      Result:=False
End;

{---------------------------------------------------------}

Function TNavigationWrapper.GetEof:Boolean;
Begin
  If FNeedFirst Then
    First;
  With FOwner Do
    If FindPrevConnected(FRelations.Count,True)=CurrentRel Then
      If (FCurrentRelation<>Nil) And (FCurrentRelation.FNavigation<>Nil) Then
        Result:=FCurrentRelation.FNavigation.Eof
      Else
        Result:=True
    Else
      Result:=False
End;

{---------------------------------------------------------}

Procedure TNavigationWrapper.Last;
Var
  CurRel:Integer;
Begin
  With FOwner Do
  Begin
    CurRel:=FRelations.Count;
    Repeat
      CurrentRel:=FindPrevConnected(CurRel,False);
      If FCurrentRelation.FNavigation<>Nil Then
      Begin
        FCurrentRelation.FNavigation.Last;
        If Not FCurrentRelation.FNavigation.Bof Then
          Break;
      End
      Else
        Break;
      CurRel:=CurrentRel;    
    Until False;    
  End;
  FNeedFirst:=False;    
End;

{---------------------------------------------------------}

Procedure TNavigationWrapper.Next;
Var
  NextRel:Integer;
Begin
  If FNeedFirst Then
    First;
  With FOwner Do
    If FCurrentRelation.FNavigation<>Nil Then
    Begin
      FCurrentRelation.FNavigation.Next;
      NextRel:=CurrentRel;
      While FRelations[NextRel].FNavigation.Eof Do
      Begin
        NextRel:=FindNextConnected(NextRel,False);
        RowChangeLock;
        Try
          If NextRel>0 Then
            FRelations[NextRel].FNavigation.First
          Else
            Exit;
        Finally
          RowChangeUnLock;
        End;
      End;
      CurrentRel:=NextRel;
    End;
End;

{---------------------------------------------------------}

Procedure TNavigationWrapper.Prev;
Var
  PrevRel:Integer;
Begin
  If FNeedFirst Then
    First;
  With FOwner Do
    If FCurrentRelation.FNavigation<>Nil Then
    Begin
      FCurrentRelation.FNavigation.Prev;
      PrevRel:=CurrentRel;
      While FRelations[PrevRel].FNavigation.Bof Do
      Begin
        PrevRel:=FindPrevConnected(PrevRel,True);
        If PrevRel>0 Then
          FRelations[PrevRel].FNavigation.Last
        Else
          Exit;
      End;
      CurrentRel:=PrevRel;
    End;
End;

{------------------------------------------------------------------}

Procedure TNavigationWrapper.PsevdoFirst;
Begin
  FNeedFirst:=True;
End;

{ TJoinInfoSet }

Constructor TJoinInfoSet.Create(AOwner:TComponent);
Begin
  Inherited Create;
  FActive:=True;
  FOwner:=AOwner;
  FNotifiers:=TNotifiersHolder.Create;
  FRelations:=CreateRelations;
  FRelations.FInfoSet:=Self;
  FCurrentRel:=-1;
End;

{------------------------------------------------------------------}

Destructor TJoinInfoSet.Destroy;
Begin
  If FNavigation<>Nil Then
    FNavigation._Release;
  FRelations.Free;
  Inherited;
End;

{------------------------------------------------------------------}

Function TJoinInfoSet.ApplyFilter:Boolean;
Var
  I:Integer;
Begin
  Result:=False;
  For I:=0 To FRelations.Count-1 Do
    With FRelations[I] Do
      Begin
        CheckInterfaces;
        If IsComplete And (FDelayedFilter<>Nil) Then
          FDelayedFilter.ApplyFilter;
      End;
End;

{------------------------------------------------------------------}

Procedure TJoinInfoSet.BeginUpdate;
Var
  I:Integer;
  Updates:IDCUpdates;
Begin
  For I:=0 To FRelations.Count-1 Do
    With FRelations[I] Do
      If FInfoSetI.QueryInterface(IDCUpdates,Updates)=S_OK Then
        Updates.BeginUpdate;
End;

{------------------------------------------------------------------}

Function TJoinInfoSet.BookMarkValid(const BookMark:TDCBookMark):Boolean;
Var
  Bkmk:String;
  Rel:TCustomDCJoinRelation;
  BookmarkEx:IDCBookmarkEx;
Begin
  If (FCurrentRelation<>Nil) And (Bookmark<>'') Then
  Begin
    Bkmk:=BookMark;
    ExtractBookmark(Bkmk,Rel);
    If Rel.InfoSetI.QueryInterface(IDCBookmarkEx,BookmarkEx)=S_OK Then
      Result:=BookmarkEx.BookMarkValid(Bkmk)
    Else
      Result:=True;
  End
  Else
    Result:=True; 
End;

{------------------------------------------------------------------}

Function TJoinInfoSet.CanConnect:Boolean;
Var
  Connect:IDCConnect;
  I:Integer;
Begin
  Result:=False;
  For I:=0 To FRelations.Count-1 Do
    With FRelations[I] Do
      If (FInfoSeti<>Nil) And (FInfoSeti.QueryInterface(IDCConnect,Connect)=S_OK) Then
        Result:=Result Or Connect.GetConnected;
End;

{---------------------------------------------------------}

Function TJoinInfoSet.CompareBookMarks(const B1,B2:TDCBookMark):Integer;
Var
  Rel1,Rel2:TCustomDCJoinRelation;
  Bkmk1:String;
  Bkmk2:String;
  BookmarkEx:IDCBookmarkEx;
Begin
  If (FCurrentRelation<>Nil) And (B1<>'') And (B2<>'') Then
  Begin
    Bkmk1:=B1;
    Bkmk2:=B2;
    ExtractBookmark(Bkmk1,Rel1);
    ExtractBookmark(Bkmk2,Rel2);
    If Rel1<>Rel2 Then
    Begin
      Result:=Integer(Rel1)-Integer(Rel2);
      Exit;
    End;
    If Rel1.FBookmark.QueryInterface(IDCBookmarkEx,BookmarkEx)=S_OK Then
      Result:=BookmarkEx.CompareBookmarks(Bkmk1,Bkmk2)
    Else
      Result:=0;
  End
  Else
    Result:=0;
End;

{---------------------------------------------------------}

Function TJoinInfoSet.CreateBookmark(Const Bookmark:String):String;
Begin
  Result:=CreateBookmarkEx(Bookmark,FCurrentRelation);
End;

{---------------------------------------------------------}

Function TJoinInfoSet.CreateBookmarkEx(Const Bookmark:String;Relation:TCustomDCJoinRelation):String;
Begin
  If Bookmark<>'' Then
  Begin
    SetLength(Result,Length(Bookmark)+SizeOf(Pointer));
    Pointer(Pointer(@Result[1])^):=Pointer(Relation);
    Move(Bookmark[1],Result[SizeOf(Pointer)+1],Length(Bookmark));
  End
  Else
    Result:='';
End;

{---------------------------------------------------------}

Function TJoinInfoSet.CreateRelations:TDCJoinRelations;
Begin
  Result:=TDCJoinRelations.Create(FOwner,TDCJoinRelation);
End;

{---------------------------------------------------------}

Procedure TJoinInfoSet.ExtractBookmark(Var Bookmark:String;Var Relation:TCustomDCJoinRelation);
Var
  Result:String;
Begin
  Relation:=Pointer(Pointer(@Bookmark[1])^);
  SetLength(Result,Length(Bookmark)-SizeOf(Pointer));
  Move(Bookmark[SizeOf(Pointer)+1],Result[1],Length(Result));
  Bookmark:=Result;
End;

{---------------------------------------------------------}

Procedure TJoinInfoSet.EndUpdate;
Var
  I:Integer;
  Updates:IDCUpdates;
Begin
  For I:=0 To FRelations.Count-1 Do
    With FRelations[I] Do
      If FInfoSetI.QueryInterface(IDCUpdates,Updates)=S_OK Then
        Updates.EndUpdate;
End;

{------------------------------------------------------------------}

Procedure TJoinInfoSet.Event(EventType:Integer;const EventData:OleVariant);
Begin
  NotifyHandlers(EventType,EventData);
End;

{---------------------------------------------------------}

Function TJoinInfoSet.FindNextConnected(ACurrentRel:Integer;CheckEmpty:Boolean):Integer;
Var
  I:Integer;
Begin
  For I:=ACurrentRel+1 To FRelations.Count-1 Do
    If FRelations[I].IsAccepted(CheckEmpty) Then
    Begin
      Result:=I;
      Exit;
    End;
  Result:=-1;
End;

{---------------------------------------------------------}

Function TJoinInfoSet.FindPrevConnected(ACurrentRel:Integer;CheckEmpty:Boolean):Integer;
Var
  I:Integer;
Begin
  For I:=ACurrentRel-1 DownTo 0 Do
    If FRelations[I].IsAccepted(CheckEmpty) Then
    Begin
      Result:=I;
      Exit;
    End;
  Result:=-1;
End;

{---------------------------------------------------------}

Function TJoinInfoSet.GetBookmark:TDCBookmark;
Begin
  If FCurrentRelation<>Nil Then
    Result:=CreateBookmark(FCurrentRelation.FBookmark.GetBookmark)
  Else
    Result:='';
End;

{---------------------------------------------------------}

Function TJoinInfoSet.GetConnected:Boolean;
Begin
  Result:=FActive;
End;

{---------------------------------------------------------}

Function TJoinInfoSet.GetDisplayFieldName:String;
Begin
  If FCurrentRelation<>Nil Then
    Result:=FCurrentRelation.DisplayField;
End;

{---------------------------------------------------------}

Function TJoinInfoSet.GetFields:IDCColumns;
Begin
  Result:=FCurrentRelation.FRowSet.GetFields;
End;

{---------------------------------------------------------}

Function TJoinInfoSet.GetNavigation:TNavigationWrapper;
Begin
  If FNavigation=Nil Then
  Begin
    FNavigation:=TNavigationWrapper.Create(Self);
    FNavigation._AddRef;
  End;  
  Result:=FNavigation;  
End;

{---------------------------------------------------------}

Function TJoinInfoSet.GetRow:IUnknown;
Begin
  Result:=TRowSetWrapper.Create(Self,FCurrentRelation.FRowSet.GetRow)
End;

{---------------------------------------------------------}

Procedure TJoinInfoSet.GotoBookmark(const Bookmark:TDCBookMark);
Var
  Bkmk:String;
  Rel:TCustomDCJoinRelation;
Begin
  If (FCurrentRelation<>Nil) And (Bookmark<>'') Then
  Begin
    Bkmk:=Bookmark;
    ExtractBookmark(Bkmk,Rel);
    CurrentRel:=Rel.Index;
    If Bkmk<>'' Then
      Rel.FBookmark.GotoBookmark(Bkmk);
  End;
End;

{---------------------------------------------------------}

Procedure TJoinInfoSet.HandleEvent(const EventRec:PEventRec);
Begin
  FNotifiers.CallHandlers(EventRec);
End;

{---------------------------------------------------------}

Procedure TJoinInfoSet.NotifyHandlers(EventType:Integer;const EventData:OleVariant);
Var
  EventRec:TEventRec;
begin
  BuildEventRec(EventRec,Self,EventType,EventData);
  FNotifiers.CallHandlers(@EventRec);
end;

{------------------------------------------------------------------}

Function TJoinInfoSet.QueryInterface(Const IID:TGuid;Out Obj):HResult;
Begin
  Result:=Inherited QueryInterface(IID,Obj);
  If Result<>S_OK Then
    If IsEqualGuid(IDCNavigation,IID) Then
    Begin
      IUnknown(Obj):=GetNavigation As IDCNavigation;
      Result:=S_OK
    End
    Else
      If FCurrentRelation<>Nil Then
      Begin
        Result:=FCurrentRelation.InfoSeti.QueryInterface(IID,Obj);
        If (Result=S_OK) And IsEqualGuid(IID,IDCRowChange) Then
          IUnknown(Obj):=TRowChangeWrapper.Create(Self,IUnknown(Obj))
      End;
End;

{------------------------------------------------------------------}

Procedure TJoinInfoSet.RegisterHandler(const EventHandler:IDCEventHandler;EventTypes, UserData:DWORD);
Begin
  FNotifiers.RegisterHandler(EventHandler, EventTypes, UserData);
End;

{------------------------------------------------------------------}

Procedure TJoinInfoSet.RemoveFilter;
Var
  I:Integer;
Begin
  For I:=0 To FRelations.Count-1 Do
    With FRelations[I] Do
      If IsComplete And (FDelayedFilter<>Nil) Then
        FDelayedFilter.RemoveFilter;
End;

{------------------------------------------------------------------}

Procedure TJoinInfoSet.RestorePosition;
Var
  I:Integer;
  BookmarkEx:IDCBookmarkEx;
  Bookmark:String;
  BookmarkCount:Integer;
Begin
  For I:=0 To FRelations.Count-1 Do
    With FRelations[I] Do
      If IsComplete Then
      Begin
        RowChangeLock;
        Try
          BookmarkCount:=FSaveBookmarks.Count;
          Bookmark:=FSaveBookMarks[FSaveBookmarks.Count-1];
          If FBookmark.QueryInterface(IDCBookmarkEx,BookmarkEx)=S_OK Then
            If Not BookmarkEx.BookmarkValid(Bookmark) Then
              Continue;
          FBookmark.GotoBookmark(Bookmark);
          FSaveBookmarks.Delete(BookmarkCount-1);
        Finally
          RowChangeUnLock;
        End;
      End;
End;

{------------------------------------------------------------------}

Procedure TJoinInfoSet.RowChangeLock;
Begin
  Inc(FRowChangeLock);
End;

{------------------------------------------------------------------}

Function TJoinInfoSet.RowChangeLocked:Boolean;
Begin
  Result:=FRowChangeLock<>0;
End;

{------------------------------------------------------------------}

Procedure TJoinInfoSet.RowChangeUnLock;
Begin
  Dec(FRowChangeLock);
End;

{------------------------------------------------------------------}

Procedure TJoinInfoSet.SafeBeginUpdate;
Var
  I:Integer;
  SafeUpdates:IDCSafeUpdates;
  Updates:IDCUpdates;
Begin
  For I:=0 To FRelations.Count-1 Do
    With FRelations[I] Do
      If IsComplete Then
        If FInfoSetI.QueryInterface(IDCSafeUpdates,SafeUpdates)=S_OK Then
          SafeUpdates.SafeBeginUpdate
        Else
          If FInfoSetI.QueryInterface(IDCUpdates,Updates)=S_OK Then
            Updates.BeginUpdate
End;

{------------------------------------------------------------------}

Procedure TJoinInfoSet.SafeEndUpdate;
Var
  I:Integer;
  Updates:IDCUpdates;
  SafeUpdates:IDCSafeUpdates;
Begin
  For I:=0 To FRelations.Count-1 Do
    With FRelations[I] Do
      If IsComplete Then
        If FInfoSetI.QueryInterface(IDCSafeUpdates,SafeUpdates)=S_OK Then
          SafeUpdates.SafeEndUpdate
        Else
          If FInfoSetI.QueryInterface(IDCUpdates,Updates)=S_OK Then
            Updates.EndUpdate
End;

{------------------------------------------------------------------}

Procedure TJoinInfoSet.SavePosition;
Var
  I:Integer;
Begin
  For I:=0 To FRelations.Count-1 Do
    With FRelations[I] Do
      If IsComplete Then
      Begin
        If FSaveBookmarks=Nil Then
          FSaveBookmarks:=TStringList.Create;
        CheckInterfaces;
        FSaveBookmarks.Add(FBookmark.GetBookmark);
      End;
End;

{------------------------------------------------------------------}

Procedure TJoinInfoSet.SetConnected(Value:Boolean);
Begin
  FActive:=Value;
  If Value Then
    GetNavigation.PsevdoFirst
  Else
    CurrentRel:=-1;
  Event(evActiveChanged,Value);
End;

{---------------------------------------------------------}

Procedure TJoinInfoSet.SetCurrentRel(Value:Integer);
Begin
  If FCurrentRel=Value Then
    Exit;
  FCurrentRel:=Value;
  If (FCurrentRel<0) And (Value<FRelations.Count) Then
    FCurrentRelation:=Nil
  Else
    FCurrentRelation:=FRelations[FCurrentRel];
End;

{---------------------------------------------------------}

Procedure TJoinInfoSet.SetRelations(Value:TDCJoinRelations);
Begin
  FRelations.Assign(Value);
End;

{------------------------------------------------------------------}

Procedure TJoinInfoSet.UnregisterHandler(const EventHandler:IDCEventHandler);
Begin
  If FNotifiers<>Nil Then
    FNotifiers.UnregisterHandler(EventHandler);
End;

{ TDBJoinInfoSet }

Function TDBJoinInfoSet.CreateRelations:TDCJoinRelations;
Begin
  Result:=TDBJoinRelations.Create(Owner,TDBJoinRelation);
End;

{ TCustomDCJoinInfoSet }

Function TCustomDCJoinInfoSet.GetRelations:TDCJoinRelations;
Begin
  Result:=TJoinInfoSet(FIntfObj).Relations;
End;

{---------------------------------------------------------}

Procedure TCustomDCJoinInfoSet.SetRelations(Value:TDCJoinRelations);
Begin
  TJoinInfoSet(FIntfObj).Relations.Assign(Value);
End;

{ TDCJoinInfoSet }

constructor TDCDBJoinInfoSet.Create(AOwner:TComponent);
Var
  IntObj:TJoinInfoSet;
begin
  Inherited;
  IntObj:= TDBJoinInfoSet.Create(AOwner);
  ObjInterface:=IntObj;
  VCLComObject:=Pointer(ObjInterface);
  IntfObj:=IntObj;
end;

{---------------------------------------------------------}

Function TDCDBJoinInfoSet.GetRelations:TDBJoinRelations;
Begin
  Result:=TDBJoinRelations(Inherited Relations);
End;

{---------------------------------------------------------}

Procedure TDCDBJoinInfoSet.SetRelations(Value:TDBJoinRelations);
Begin
  Inherited Relations:=Value
End;

end.
