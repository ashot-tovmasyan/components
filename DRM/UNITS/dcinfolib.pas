{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit dcInfoLib;

interface

{$I dc.inc}
uses
  ActiveX, Classes, Controls, Dialogs
  {$IFDEF D4}, ImgList{$ENDIF}, SysUtils, TypInfo,
  Windows, dcconsts, dcHook, dcdreamLib, dcClasses
  {$IFDEF D6} ,Variants {$ENDIF}
  ;

Const
// Status of the field.
  DBSTATUS_EMPTY   = 0;
  DBSTATUS_NULL    = 1;
  DBSTATUS_CHANGED = 2;
  DBSTATUS_DEFAULT = 4;

// Data types.
  DBTYPE_EMPTY       = $00000000;
  DBTYPE_NULL        = $00000001;
  DBTYPE_I2          = $00000002;
  DBTYPE_I4          = $00000003;
  DBTYPE_R4          = $00000004;
  DBTYPE_R8          = $00000005;
  DBTYPE_CY          = $00000006;
  DBTYPE_DATE        = $00000007;
  DBTYPE_BSTR        = $00000008;
  DBTYPE_IDISPATCH   = $00000009;
  DBTYPE_ERROR       = $0000000A;
  DBTYPE_BOOL        = $0000000B;
  DBTYPE_VARIANT     = $0000000C;
  DBTYPE_IUNKNOWN    = $0000000D;
  DBTYPE_DECIMAL     = $0000000E;
  DBTYPE_UI1         = $00000011;
  DBTYPE_ARRAY       = $00002000;
  DBTYPE_BYREF       = $00004000;
  DBTYPE_I1          = $00000010;
  DBTYPE_UI2         = $00000012;
  DBTYPE_UI4         = $00000013;
  DBTYPE_I8          = $00000014;
  DBTYPE_UI8         = $00000015;
  DBTYPE_GUID        = $00000048;
  DBTYPE_VECTOR      = $00001000;
  DBTYPE_RESERVED    = $00008000;
  DBTYPE_BYTES       = $00000080;
  DBTYPE_STR         = $00000081;
  DBTYPE_WSTR        = $00000082;
  DBTYPE_NUMERIC     = $00000083;
  DBTYPE_UDT         = $00000084;
  DBTYPE_DBDATE      = $00000085;
  DBTYPE_DBTIME      = $00000086;
  DBTYPE_DBTIMESTAMP = $00000087;

// Event types
  evActiveChanged     = 1   ;                     //EventData = True if object is active; otherwise it is False
  evFieldListChange   = evActiveChanged     * 2;  //EventData = Null.
  evRowChanged        = evFieldListChange   * 2;  //EventData = bookmark of current row.
  evFieldChanged      = evRowChanged        * 2;  //EventData = IDCField which has been changed or Null.
  evRowDeleted        = evFieldChanged      * 2;  //EventData = bookmark of deleted row.
  evRowInserted       = evRowDeleted        * 2;  //EventData = bookmark of inserted row.
  evRecordChanged     = evRowInserted       * 2;  // After Post. EventData = bookmark
  evEditStarted       = evRecordChanged     * 2;  // EventData = Bookmark
  evMasterChanged     = evEditStarted       * 2;  //EventData = NULL
  evEditCanceled      = evMasterChanged     * 2;  //EventData = Bookmark. If Insert is canceled EventData = NullBookMark
  evAfterInternalPost = evEditCanceled      * 2;  //EventData = Null
  evBeforePost        = evAfterInternalPost * 2;  // EventData = Null
  evFieldsChanged     = evBeforePost        * 2;  // EventData - bookmark of changed row

  evAll               = DWORD(-1);

  NullBookMark = '';

  EventsWithBookMark = evRowChanged + evRowDeleted + evRowInserted + evRecordChanged +
                       evEditStarted + evEditCanceled + evFieldsChanged;
Type
  TDCBookMark = string;
  PDCBookMark = PString;

  TDBType=Word;
  TBlobOpenMode=(omRead,omWrite,omReadWrite);

  TBindMode=(bmByName,bmByNumber);

  TEditState=(esBrowse,esAppend,esInsert,esEdit);

  TMSecs=Double;

  TDBStatus=Integer;

  TDCPropType=Word;

  TConfirmDeleteEvent = procedure(Sender : TObject; var Confirm : boolean) of object;

  TInfoFilterEvent = procedure(const InfoSet : IUnknown; var Accept: Boolean) of object;

  TPropChangeEvent = procedure (Sender : TObject; const PropName : string) of object;

  TEventRec=Record
    EventType:Integer;
    EventSource:Pointer;
    EventData:PVariant;
    UserData:DWord;
  End;

  PEventRec=^TEventRec;

  IDCEventHandler=Interface
    ['{62FF0F09-8099-11D2-A95B-00400544EBC0}']
    Procedure HandleEvent(Const EventRec:PEventRec);
  End;

  IDCEvents=Interface
    ['{62FF0F0A-8099-11D2-A95B-00400544EBC0}']
    procedure RegisterHandler(const EventHandler : IDCEventHandler; EventTypes, UserData : DWORD);
    procedure UnregisterHandler(const EventHandler : IDCEventHandler);
  End;

  IDCEventsEx=Interface(IDCEvents)
  ['{2FC8CF12-891B-11D2-9D6A-0000E8DC209E}']
    procedure CallHandlers(const EventRec:PEventRec);
    function  GetEventsSource : IUnknown;
    function  GetPassThroughEvents : DWORD;
  End;

  IDCGetParentBookmark=Interface
    ['{4AF8A7B1-494C-11D2-B35A-0000E861CD17}']
    Function GetParentBookmark(Var Bookmark:TDCBookmark):TDCBookmark;
  End;

  IDCSequentialStream=Interface
    ['{62FF0F02-8099-11D2-A95B-00400544EBC0}']
    Function Read(Var Data:Variant;cbSize:Integer):Integer;//array of byte
    Function Write(const Data:Variant;cbSize:Integer):Integer;//array of byte
  End;

  IDCUpdates = interface
  ['{2FC8CF13-891B-11D2-9D6A-0000E8DC209E}']
    procedure BeginUpdate;
    procedure EndUpdate;
  end;

  IDCSafeUpdates = interface
  ['{1C06A712-B2C1-11D2-88EB-0000E8DC5099}']
    procedure SafeBeginUpdate;
    procedure SafeEndUpdate;
  end;

  TPropAttribute=(atCanRead,atCanWrite,atRequired);
  TPropAttributes=Set Of TPropAttribute;

  // Note: GetPropType return only
  // DBTYPE_BSTR,DBTYPE_I2,DBTYPE_I4,DBTYPE_UI2,DBTYPE_BOOL,DBTYPE_R8,DBTYPE_DATE,
  // DBTYPE_IUNKNOWN constants.

  IDCColumn=Interface
    ['{0522F6F1-8DBA-11D2-88AD-0000E8DC5099}']
    Function GetAttributes:TPropAttributes;
    Function GetPropType:TDCPropType;
    Function GetName : string;
    Function GetSize:Integer;

    Property Attributes:TPropAttributes read GetAttributes;
    Property Name : string read GetName;
    Property PropType:TDCPropType read GetPropType;
    Property Size:Integer read GetSize;
  End;

  IDCProperty=Interface(IDCColumn)
    ['{5954FC13-82A7-11D2-889A-0000E8DC5099}']
    Function GetValue:Variant;
    Procedure SetValue(const Value:Variant);

    Function GetString:String;
    Function GetText:String;
  End;

  IDCField = interface(IDCProperty)
  ['{9897F9F1-A94C-11D2-97C6-0000E8DC209E}']
    function IsValidChar(InputChar : char): boolean;
    function GetDisplayName : string;
    function GetDisplayWidth : integer;
  end;

  IDCCollection=Interface
    ['{5954FC12-82A7-11D2-889A-0000E8DC5099}']
    Function GetItem(Index:Integer):IUnknown;
    Function GetCount:Integer;

    Property Items[Index:Integer]:IUnknown read GetItem;default;
    Property Count:Integer read GetCount;
  End;

  IDCColumns=Interface(IDCCollection)
    ['{0522F6F2-8DBA-11D2-88AD-0000E8DC5099}']
  End;

  IDCProperties=Interface(IDCCollection)
    ['{5954FC14-82A7-11D2-889A-0000E8DC5099}']
  End;

  IDCRowSet=Interface
    ['{1ECB7700-8559-11D2-A95B-00400544EBC0}']
    Function GetRow:IUnknown;
    Function GetFields:IDCColumns;

    Property Row:IUnknown read GetRow;
    Property Fields:IDCColumns read GetFields;
  End;

  IDCBookmark=Interface
    ['{62FF0F03-8099-11D2-A95B-00400544EBC0}']
    Function GetBookmark:TDCBookMark;
    Procedure GotoBookmark(const Bookmark:TDCBookMark);

    Property Bookmark:TDCBookMark read GetBookmark write GotoBookmark;
  End;

  IDCBookMarkEx = interface(IDCBookMark)
  ['{616FF182-9CAA-11D2-97B4-0000E8DC209E}']
    function CompareBookMarks(const B1, B2 : TDCBookMark) : integer;
    function BookMarkValid(const BookMark : TDCBookMark) : boolean;
  end;

  IDCCanRowChange=Interface
    ['{5954FC11-82A7-11D2-889A-0000E8DC5099}']
    Function CanAppend:Boolean;
    Function CanEdit:Boolean;
    Function CanDelete:Boolean;
    Function CanInsert:Boolean;
    Function CanView:Boolean;
  End;

  IDCConnect=Interface
    ['{62FF0F04-8099-11D2-A95B-00400544EBC0}']
    Function GetConnected:Boolean;
    Procedure SetConnected(Value:Boolean);

    Property Connected:Boolean read GetConnected write SetConnected;
  End;

  IDCLocate=Interface
    ['{B6CA8E71-844B-11D2-889C-0000E8DC5099}']
    Function Locate(const KeyFields: string;const KeyValues:Variant):Boolean;
    Function Lookup(const KeyFields : string;const KeyValues:Variant;
                    const ResultFields : string):Variant;
  End;

  IDCNavigation=Interface
    ['{62FF0F05-8099-11D2-A95B-00400544EBC0}']
    Function GetBof:Boolean;
    Function GetEof:Boolean;
    Procedure First;
    Procedure Last;
    Procedure Next;
    Procedure Prev;

    Property Bof:Boolean read GetBof;
    Property Eof:Boolean read GetEof;
  End;

  IDCPassThroughLevel=Interface
    ['{5B0DC792-F977-11D2-B65B-0000E8DC5099}']
    Function IsPassThrough:Boolean;
  End;

  IDCRowBlob=Interface
    ['{62FF0F06-8099-11D2-A95B-00400544EBC0}']
    Function CreateBlobStream(const Prop:IDCProperty;BlobMode:TBlobOpenMode):IDCSequentialStream;
  End;

  IDCRowChange=Interface
    ['{62FF0F07-8099-11D2-A95B-00400544EBC0}']
    Procedure Append;
    Procedure Cancel;
    Procedure Delete;
    Procedure Edit;
    Procedure Insert;
    Procedure Post;
  End;

  // Record in memory
  // FieldStatus1,FieldData1, FieldStatus2,FieldData2, ...  RecordBookmark,BookmarkFlag.
  // Size of FieldStatus is one byte and may be DBSTATUS_EMPTY or
  //  combination of flags DBSTATUS_NULL and DBSTATUS_CHANGED.
  //  DBSTATUS_CHANGED is for internal use only.
  // Note: TDateTime fields must be in MSecs format.

  IDCRowData=Interface
    ['{62FF0F08-8099-11D2-A95B-00400544EBC0}']
    Function GetData(Var RowCount:Integer):Variant;//array of byte
    Procedure SetData(const Data:Variant);//array of byte
  End;

  //InfoSet save bookmark on SavePosition and GotoBookmark on RestoredPosition;
  IDCSavePosition=Interface
    ['{161DE482-D97B-11D3-B41A-0000E861CD17}']
    Procedure SavePosition;
    Procedure RestorePosition;
  End;

  IDCFilter=Interface
    ['{78E2B1F8-997F-11D2-88C4-0000E8DC5099}']
    Function GetFilter : string;
    Function GetFiltered:Boolean;
    Procedure SetFilter(const Value : string);
    Procedure SetFiltered(Value:Boolean);

    Property Filter : string read GetFilter write SetFilter;
    Property Filtered:Boolean read GetFiltered write SetFiltered;
  End;

  IDCDelayedFilter=Interface
    ['{B4026971-AC84-11D2-88E2-0000E8DC5099}']
    Function ApplyFilter:Boolean;
    Procedure RemoveFilter;
  End;

  IDCRowSetEmpty=Interface
    ['{9F73E511-AC6E-11D2-88E2-0000E8DC5099}']
    Function GetIsEmpty:Boolean;

    Property IsEmpty:Boolean read GetIsEmpty;
  End;

  IDCRowSetEmpty2=Interface
    ['{6EA535D2-4AE5-11D2-B35B-0000E861CD17}']
    Function GetIsEmpty2:Boolean;

    Property IsEmpty2:Boolean read GetIsEmpty2;
  End;

  IDCRowSetFolder=Interface
    ['{28610962-B430-11D2-97D5-0000E8DC209E}']
    Function IsFolder:Boolean;
  End;

  IDCRowSetRefresh=Interface
    ['{62FF0F0E-8099-11D2-A95B-00400544EBC0}']
    Procedure Refresh;
  End;

  IDCDisplayField = interface
  ['{E583BC42-86D0-11D2-9D65-0000E8DC209E}']

    function GetDisplayFieldName : string;

    property DisplayFieldName : string read GetDisplayFieldName;
  end;

  IDCImages = interface
  ['{36F45C90-8AC7-11D2-9D6D-0000E8DC209E}']
    function GetLargeImages : TCustomImageList;
    function GetSmallImages : TCustomImageList;
    function GetStateImages : TCustomImageList;
  end;

  IDCLink = interface
  ['{5A13D2AA-9339-11D2-9D8B-0000E8DC209E}']
    function GetLink : TPersistent;
  end;

  IDCMasterInfoset = interface(IDCEvents)
  ['{2A5820C1-A622-11D2-97C2-0000E8DC209E}']
    function GetDetailsRowSet : IDCRowSet;
  end;

  IDCStackFilter=Interface
    ['{1387A061-BF6D-11D2-88FD-0000E8DC5099}']
    Procedure AddFilter(const Filter:String);
    Procedure RemoveFilter;
  End;

  IDCHomogeneous = interface
  ['{E862C902-CBD9-11D2-97FA-0000E8DC209E}']
    function IsHomogeneous : boolean;
  end;

  IDCEventsSource = interface
  ['{C6AFC151-CFE1-11D2-97FF-0000E8DC209E}']
    function GetEventSourceID:Integer;
  end;

  IDCLocateRecord = Interface
  ['{878B5281-D071-11D2-8916-0000E8DC5099}']
    Function LocateFirst:Boolean;
    Function LocateNext:Boolean;
  End;

  IDCDetailRowSet = interface
  ['{A3F4B802-077B-11D3-AE48-0000E8DC209E}']
    function GetParentNode(var iParentRowSet : IUnknown; var BookMark : TDCBookMark) : boolean;
  end;

  IInfoControl = interface
  ['{EC7C7EF1-CFD1-11D2-97FF-0000E8DC209E}']
    procedure AddHandler(const EventsSource : IUnknown; UserData : DWORD);
    procedure RemoveHandler(const EventsSource : IUnknown);
  end;

  TDCInterfacedObject=Class(TObject,IUnknown)
  Protected
    FDestroying:Boolean;
    FRefCount: Integer;
  Public
    Destructor Destroy; override;

    Function _AddRef:Integer; stdcall;
    Function _Release:Integer; stdcall;
    Function QueryInterface(const IID:TGUID; out Obj):HResult;virtual;stdcall;

    Property Destroying:Boolean read FDestroying write FDestroying;
    Property RefCount: Integer read FRefCount;
  End;

  TSafeInterfacedObject=Class(TDCInterfacedObject)
  Public
    Function SafeCallException(ExceptObject:TObject;ExceptAddr:Pointer):HResult;override;
  End;

  TDCInfoTreeVersion=Type String;

  {$IFNDEF D4}
  TInterfaceList=class
  private
    fList : TFastList;

    function GetCount : integer;
    procedure SetCount(val : integer);
  protected
    procedure ReleaseItem(index : integer);
    function  Get(Index: Integer): IUnknown;
    procedure Put(Index: Integer; const Item: IUnknown);
  public
    constructor Create;
    destructor  Destroy; override;

    function  Add(const Item : IUnknown) : integer;
    procedure Clear;
    procedure Delete(Index: Integer);
    function  First: IUnknown;
    function  IndexOf(const Item: IUnknown): Integer;
    procedure Insert(Index: Integer; const Item: IUnknown);
    function  Last: IUnknown;
    function  Remove(const Item : IUnknown): Integer;
    procedure Move(CurIndex, NewIndex: Integer);
    property  Count: Integer read GetCount write SetCount;
    property  Items[Index: Integer]: IUnknown read Get write Put; default;
  end;
  {$ENDIF}

  TNotifiersHolder = class(TSafeInterfacedObject, IDCEvents, IDCEventsEx)
  private
    fList     : TFastList;
    fMaskList : TFastList;
    fUserData : TFastList;

    {IDCEvents}
    procedure RegisterHandler(const EventHandler : IDCEventHandler; EventTypes, UserData : DWORD); virtual;
    procedure UnregisterHandler(const EventHandler : IDCEventHandler);

    {IDCEventsEx}
    procedure CallHandlers(const EventRec:PEventRec);
    function  GetEventsSource : IUnknown;
    function  GetPassThroughEvents : DWORD;

  public
    constructor Create;
    destructor  Destroy; override;
  end;

  THandleEventProc = procedure (const EventRec:PEventRec) of object;

  TCompareBookMarksProc = function(const B1, B2 : TDCBookMark) : integer of object;

  TEventHandleComObject = class(TSafeInterfacedObject, IDCEventHandler)
  private
    fHandler : THandleEventProc;

    procedure HandleEvent(Const EventRec:PEventRec);
  public
    constructor Create(Handler : THandleEventProc);
  end;

  TSortedBookMarkList = class(TSortedList)
  private
    fBookMarks : IUnknown;

    function DoCompare(s1, s2 : PString) : integer;
  protected
    function BookMarkByItem(Item : pointer) : PDCBookMark; virtual; abstract;
  public
    function  CompareWithKey(Item,Key:Pointer) : integer; override;
    function  Compare(Item1, Item2: Pointer) : integer; override;

    property iBookMarks : IUnknown read fBookMarks write fBookMarks;
  end;

  TCustomInfoSet = class(TDCInterfacedObject, IDCUpdates, IDCEvents)
  private
    fNotifiers : IDCEventsEx;
    fUpdateCount : integer;

  protected
    procedure InfoSetChanged(ChangeType:Integer;const ChangeData:Variant);
    procedure ActiveChanged; virtual;

    {IDCEvents}
    procedure RegisterHandler(const EventHandler : IDCEventHandler; EventTypes, UserData : DWORD); virtual;
    procedure UnregisterHandler(const EventHandler : IDCEventHandler); virtual;

  public
    constructor Create; virtual;
    destructor  Destroy; override;

    {IDCUpdates}
    procedure BeginUpdate;
    procedure EndUpdate;

    property Notifiers : IDCEventsEx read FNotifiers;
    property UpdateCount : integer read fUpdateCount;
  end;

  TFilteredInfoSet = class(TCustomInfoSet, IUnknown, IDCNavigation, IDCRowSet,
                           IDCConnect, IDCEventHandler, IDCEventsEx, IDCEventsSource)
  private
    fInfoSet : IUnknown;
    fEvents  : IDCEvents;
    fOnFilter : TInfoFilterEvent;

    fOldBookMark : TDCBookMark;

    fBOF    : boolean;
    fEOF    : boolean;
    fWasOk  : boolean;
    fWasOk2 : boolean;

    fDirectNavigation : boolean;

    {IDCNavigation}
    Function  GetBof:Boolean;
    Function  GetEof:Boolean;
    Procedure First;
    Procedure Last;
    Procedure Next;
    Procedure Prev;

    {IDCRowSet}
    Function GetRow:IUnknown;
    Function GetFields:IDCColumns;

    {IDCConnect}
    Function GetConnected:Boolean;
    Procedure SetConnected(Value:Boolean);

    {IDCEventsSource}
    Function GetEventSourceID:Integer;

    procedure SetOnFilter(val : TInfoFilterEvent);
    procedure SetInfoSet(const val : IUnknown);
    procedure RecordChanged(WasOkNow, OkNow : boolean; EventType : integer;
                                        const EventData : Variant);
  protected
    function  AcceptRecord : boolean;
    procedure HandleEvent(const EventRec:PEventRec); virtual;
    procedure NotifyHandlers(EventType : integer; const EventData : Variant);

    {IDCEvents}
    Procedure RegisterHandler(const EventHandler : IDCEventHandler; EventTypes, UserData : DWORD); override;
    Procedure UnregisterHandler(const EventHandler : IDCEventHandler); override;

    {IDCEventsEx}
    procedure CallHandlers(Const EventRec:PEventRec);
    function  GetEventsSource : IUnknown;
    function  GetPassThroughEvents : DWORD;

  public
    constructor Create; override;
    destructor Destroy; override;

    function QueryInterface(const IID: TGUID; out Obj): HRESULT; override;stdcall;

    property DirectNavigation : Boolean read fDirectNavigation write fDirectNavigation;
    property InfoSet : IUnknown read fInfoSet write SetInfoSet;
    property OnFilter : TInfoFilterEvent read fOnFilter write SetOnFilter;
  end;

  TDCFilterInfoSet = class(TComponent, IUnknown)
  private
    fInfoSet : TComponent;
    fFilterInfoSet : TFilteredInfoSet;
    fOnFilter : TInfoFilterEvent;
    FVersion : TDCInfoTreeVersion;
    procedure SetInfoSet(val : TComponent);
    procedure SetOnFilter(val : TInfoFilterEvent);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner : TComponent); override;
    destructor  Destroy; override;
  published
    property InfoSet : TComponent read fInfoSet write SetInfoSet;
    property OnFilter : TInfoFilterEvent read fOnFilter write SetOnFilter;
    property Version : TDCInfoTreeVersion read FVersion write FVersion stored false;  
  end;


Procedure DateTimeToMSecs(DataIn,DataOut:Pointer);
Function IsCompatibleDataTypes(DataType1,DataType2:TDBType):Boolean;
Function IsIntegerType(DataType:TDBType):Boolean;
Function IsNumeric(DataType:TDBType):Boolean;
Function IsStringType(FieldType:Word):Boolean;
function IsDateType(DataType : TDBType) : boolean;

function CompareFieldValues(Value1, Value2: string;
  DataType1, DataType2: TDBType): integer;

Procedure MSecsToDateTime(DataIn,DataOut:Pointer);

procedure RegisterEventsHandler(const EventsSource : IUnknown; const EventHandler : IDCEventHandler; EventTypes, UserData : DWORD);
procedure UnRegisterEventsHandler(const EventsSource : IUnknown; const EventHandler : IDCEventHandler);

function RowSetConnected(const iRowSet : IUnknown) : boolean;

function  DCPropByName(const Fields : IDCProperties; const FieldName : string) : IDCProperty;
procedure GetDCPropByName(const Fields : IDCProperties; const FieldName : string; var iProp : IDCProperty);
procedure DCPropsByNames(const iProps : IDCProperties; Fields : TStrings; FieldList : TInterfaceList);
procedure DCPropsByNames2(const iProps : IDCProperties; Fields : string; FieldList : TInterfaceList);

procedure BeginUpdates(const iRowSet : IDCRowSet);
procedure EndUpdates(const iRowSet : IDCRowSet);

procedure BeginSafeUpdates(const iRowSet : IDCRowSet);
procedure EndSafeUpdates(const iRowSet : IDCRowSet);

function StartSafeUpdates(const iRowSet : IDCRowSet; const iBookMark : IDCBookMark) : TDCBookMark;
procedure FinishSafeUpdates(const iRowSet : IDCRowSet; const iBookMark : IDCBookMark; const BookMark : TDCBookMark);

function StartUpdates(const iRowSet : IDCRowSet; const iBookMark : IDCBookMark) : TDCBookMark;
procedure FinishUpdates(const iRowSet : IDCRowSet; const iBookMark : IDCBookMark; const BookMark : TDCBookMark);

function StartSafeFilterUpdates(const iRowSet : IDCRowSet; const iBookMark : IDCBookMark; var BookMark : TDCBookMark) : boolean;
procedure FinishSafeFilterUpdates(const iRowSet : IDCRowSet; const iBookMark : IDCBookMark; const BookMark : TDCBookMark);

function StartFilterUpdates(const iRowSet : IDCRowSet; const iBookMark : IDCBookMark; var BookMark : TDCBookMark) : boolean;
procedure FinishFilterUpdates(const iRowSet : IDCRowSet; const iBookMark : IDCBookMark; const BookMark : TDCBookMark);

function GetIProp(const iRowSet : IDCRowSet; const InfoField : string) : IDCProperty;
procedure SetRowSetFieldValue(const iRowSet : IDCRowSet; const InfoField : string; const Value : Variant);
function GetRowSetFieldValue(const iRowSet : IDCRowSet; const InfoField : string) : Variant;
function GetFieldValue(const iField : IDCProperty) : Variant;
function GetFieldStringValue(const iField : IDCProperty) : string;
function GetFieldText(const iField : IDCProperty) : string;

function IsPassThrough(const Unk:IUnknown):boolean;
function BookMarkValid(const BookMarks : IDCBookMark; const BookMark : TDCBookMark) : boolean;
procedure SafeGoToBookMark(const BookMarks : IDCBookMark; const ABookMark : TDCBookMark);

function VariantToString(const v : Variant) : string;
function VariantToBoolean(const v : Variant) : boolean;
function VariantToInt(const v : Variant) : integer;

function PointerToBookMark(p : pointer) : TDCBookMark;
function BookMarkToPointer(const BookMark : TDCBookMark) : pointer;

procedure DestroyObject(Obj : TObject);
procedure ClearList2(List : TList);

procedure ClearRowSet(const RowSet : IDCRowSet);

function ValidChar(const iUnk : IUnknown; InputChar : char) : boolean;
procedure CheckChar(IsEditing : boolean; const iUnk : IUnknown; var Key : Char);
function IsRowSetEmpty(const iRowSet : IDCRowSet) : boolean;
function IsRowSetFolder(const iUnk : IUnknown) : boolean;
function IsRowsetHomogeneous(const iUnk : IUnknown) : boolean;
procedure PropsToStrings(const Props : IDCColumns; S : TStrings);
function GetIDCRowChange(const iUnk : IUnknown) : IDCRowChange;
function GetParentNode (const iUnk : IUnknown; var iParentRowSet : IUnknown;
                        var BookMark : TDCBookMark) : boolean;
//function ListIndexOf(List : TList; Item : pointer) : integer;

{ Hooks support }
Procedure AddHook(Obj:TObject;ObjClass:TClass;Handler:TMethod;Proc,NewProc:Pointer);
Procedure DeleteHook(Obj:TObject;ObjVMT:Pointer;Handler:TMethod;Proc:Pointer);
Function GetOldProc(Obj:TObject;Proc:Pointer):Pointer;
Function GetHandlersList(Obj:TObject;Proc:Pointer):TList;

function ConfirmDelete : boolean;
function ConfirmDeleteEx(Sender : TObject; ConfirmEvent : TConfirmDeleteEvent) : boolean;

Function QueryUnknown(Comp:TComponent):IUnknown;

function GetIntValue(const iProp : IDCProperty) : integer;

function EqualEventSources(const Source, Dest : IUnknown) : boolean;
function CompareEventSources(const Source, Dest : IUnknown) : integer;

procedure SetInfoSetProp(InfoSet, InfoControl : TComponent; const fComObject : IDCEventHandler;
                     {const IControl : IInfoControl;}
                     var fUnk : IUnknown; var fRowSet : IDCRowSet);

procedure _DisableEvents;
procedure _EnableEvents;
function  _EventsEnabled : boolean;

procedure SetBoolFieldValue(const iField : IDCProperty; val : boolean);

Procedure BuildEventRec(Var Result:TEventRec;Const AEventSource:IUnknown;AEventType:Integer;Const AEventData:Variant);

Var                       
  NullBookMarkVar:Variant;
  GlobalUpdateCount : integer = 0;

implementation
Uses ComObj;

{------------------------------------------------------------------}

procedure SetBoolFieldValue(const iField : IDCProperty; val : boolean);
begin
  iField.SetValue(val);
end;

{------------------------------------------------------------------}
var
  _DisableEventsCount : integer = 0;

procedure _DisableEvents;
begin
  inc(_DisableEventsCount);
end;

{------------------------------------------------------------------}

procedure _EnableEvents;
begin
  if _DisableEventsCount > 0 then
    dec(_DisableEventsCount);
end;

{------------------------------------------------------------------}

function  _EventsEnabled : boolean;
begin
  result := _DisableEventsCount = 0;
end;

{------------------------------------------------------------------}

procedure SetInfoSetProp(InfoSet, InfoControl : TComponent; const fComObject : IDCEventHandler;
                     {const IControl : IInfoControl;}
                     var fUnk : IUnknown; var fRowSet : IDCRowSet);
var
  _unk : IUnknown;
  _rowset : IDCRowSet;
begin
  if InfoSet <> nil then
    begin
      if not InfoSet.GetInterface(IUnknown, _Unk) then
        Error(SIUnknownNotSupported);

      if _Unk.QueryInterface(IDCRowSet, _rowset) <> S_OK then
        Error(SIDCRowSetNotSupported);

      InfoSet.FreeNotification(InfoControl);

{
      IControl.RemoveHandler(fRowSet);
      IControl.AddHandler(_rowset, 0);
}
      UnRegisterEventsHandler(frowset, fComObject);
      RegisterEventsHandler(_rowset, fComObject, evAll, 0);

      fUnk := _unk;
      fRowSet := _rowset;
    end
  else
    begin
      UnRegisterEventsHandler(frowset, fComObject);
      fUnk := nil;
      fRowSet := nil;
    end;
end;

{------------------------------------------------------------------}

function CompareEventSources(const Source, Dest : IUnknown) : integer;
begin
  if EqualEventSources(Source, Dest) then
    result := 0
  else
    result := integer(Source) - integer(Dest);
end;

{------------------------------------------------------------------}

function EqualEventSources(const Source, Dest : IUnknown) : boolean;
var
  iEventsSource1 : IDCEventsSource;
  iEventsSource2 : IDCEventsSource;
  EventID1       : integer;
  EventID2       : integer;
begin
  result := Source = Dest;

  if result then
    exit;

  If (Source.QueryInterface(IDCEventsSource, iEventsSource1) = S_OK) and
     (Dest.QueryInterface(IDCEventsSource, iEventsSource2) = S_OK) Then
  Begin
    EventID1:=iEventsSource1.GetEventSourceID;
    EventID2:=iEventsSource2.GetEventSourceID;
    Result:=(EventID1=EventID2) And (EventID1<>0);
  End;
end;

{------------------------------------------------------------------}

function GetIntValue(const iProp : IDCProperty) : integer;
begin
  if iProp <> nil then
    result := VariantToInt(iProp.GetValue)
  else
    result := -1;
end;

{******************************************************************}

Type
  THookData=Record
    Key:Pointer;
    Data:Pointer;
  End;
  PHookData=^THookData;

{******************************************************************}
{
function ListIndexOf(List : TList; Item : pointer) : integer;
asm
  push  edi
  push  ebx
  mov   ecx, [eax + 8] // List.Count
  mov   ebx, ecx
  jcxz  @notfound
  mov   edi, [eax + 4] // List.List
  mov   eax, edx
  repne scasd
  jne   @notfound
  mov   eax, ebx
  dec   eax
  sub   eax, ecx
  jmp   @q
@notfound:
  mov   eax, 0FFFFFFFFH
@q:
  pop   ebx
  pop   edi
end;
}
(*
function ListIndexOf(List : TList; Item : pointer) : integer;
var
  lcount : integer;
  llist  : pointer;
begin
  lcount := List.Count;
  llist := List.List;
  asm
    push  edi
    mov   ecx, lcount
    jcxz  @notfound
    mov   eax, Item
    mov   edi, dword ptr llist
    repne scasd
    jne   @notfound
    mov   eax, lcount
    dec   eax
    sub   eax, ecx
    jmp   @quit
@notfound:
    mov   eax, 0FFFFFFFFH
@quit:
    pop   edi
    mov   @result, eax
  end;
end;
*)
{------------------------------------------------------------------}

function GetIDCRowChange(const iUnk : IUnknown) : IDCRowChange;
begin
  if iunk <> nil then
    iunk.QueryInterface(IDCRowChange, result)
  else
    result := nil;
end;

{------------------------------------------------------------------}

function GetParentNode (const iUnk : IUnknown; var iParentRowSet : IUnknown;
                        var BookMark : TDCBookMark) : boolean;
var
  iDetailRowSet : IDCDetailRowSet;
begin
  result := iUnk.QueryInterface(IDCDetailRowSet, iDetailRowSet) = S_OK;

  if not result then
    begin
      iParentRowSet := nil;
      exit;
    end;

  result := iDetailRowSet.GetParentNode(iParentRowSet, BookMark);  
end;

{------------------------------------------------------------------}

procedure PropsToStrings(const Props : IDCColumns; S : TStrings);
var
  i : integer;
begin
  S.BeginUpdate;
  try
    S.Clear;
    if Props <> nil then
      with Props do
        for i := 0 to Count - 1 do
          S.Add((Items[i] as IDCColumn).Name);
  finally
    S.EndUpdate;
  end;
end;

{------------------------------------------------------------------}

procedure CheckChar(IsEditing : boolean; const iUnk : IUnknown; var Key : Char);
begin
  if IsEditing then
    if (Key in [#32..#255]) and not ValidChar(iUnk, Key) then
      begin
        MessageBeep(0);
        Key := #0;
      end;
end;

{------------------------------------------------------------------}

function ValidChar(const iUnk : IUnknown; InputChar : char) : boolean;
var
  iField : IDCField;
begin
  result := (iUnk.QueryInterface(IDCField, iField) <> S_OK) or iField.IsValidChar(InputChar);
end;

{------------------------------------------------------------------}

function IsRowsetHomogeneous(const iUnk : IUnknown) : boolean;
var
  iHomogeneous : IDCHomogeneous;
begin
  result := (iUnk <> nil) and (iUnk.QueryInterface(IDCHomogeneous, iHomogeneous) = S_OK) and
            iHomogeneous.IsHomogeneous;
end;

{------------------------------------------------------------------}

function IsRowSetFolder(const iUnk : IUnknown) : boolean;
var
  iRowSet : IDCRowSet;
  iRowSetFolder : IDCRowSetFolder;
begin
  result := (iUnk.QueryInterface(IDCRowSet, iRowSet) = S_OK) and
            ((iRowSet.QueryInterface(IDCRowSetFolder, iRowSetFolder) <> S_OK) or iRowSetFolder.IsFolder);
end;

{------------------------------------------------------------------}

function IsRowSetEmpty(const iRowSet : IDCRowSet) : boolean;
var
  iRowSetEmpty : IDCRowSetEmpty;
begin
  result := false;
  if (iRowSet.QueryInterface(IDCRowSetEmpty, iRowSetEmpty) = S_OK) then
    if iRowSetEmpty.IsEmpty then
      result := true;
end;

{------------------------------------------------------------------}

function IQuery(const iUnk : IUnknown; const GUID : TGUID; var iResult) : boolean;
begin
  result := iUnk.QueryInterface(GUID, IUnknown(iResult)) = S_OK;
end;

{------------------------------------------------------------------}

procedure ClearRowSet(const RowSet : IDCRowSet);
var
  iRowChange     : IDCRowChange;
  iNavigation    : IDCNavigation;
  iBookMark      : IDCBookMark;
  SaveBookMark   : TDCBookMark;
  iRowSet        : IDCRowSet;
  iLocateFirst   : IDCLocateRecord;

  procedure DeleteRecord;
  var
    iRow           : IUnknown;
  begin
    iRow := RowSet.GetRow;

    if iRow.QueryInterface(IDCRowSet, iRowSet) = S_OK then
      ClearRowSet(iRowSet);

    iRowChange.Delete;
  end;

begin
  if (RowSet <> nil) and 
     RowSetConnected(RowSet) and
     IQuery(RowSet, IDCRowChange, iRowChange) and
     IQuery(RowSet, IDCBookMark, iBookMark) then
    if IQuery(RowSet, IDCLocateRecord, iLocateFirst) then
      try
        BeginUpdates(RowSet);

        SaveBookMark := iBookMark.BookMark;

        with iLocateFirst do
          if LocateFirst then
            begin
              repeat
                DeleteRecord;
              until not LocateNext;

              SafeGotoBookMark(iBookMark, SaveBookMark);
            end;

      finally
        EndUpdates(RowSet);
      end
    else if IQuery(RowSet, IDCNavigation, iNavigation) then
      try
        if not StartFilterUpdates(RowSet, iBookMark, SaveBookMark) then
          iNavigation.First;

        while not iNavigation.EOF do
          DeleteRecord;

      finally
        FinishFilterUpdates(RowSet, iBookMark, SaveBookMark);
      end;
end;

{******************************************************************}

procedure DestroyObject(Obj : TObject);
var
  iUnk : IUnknown;
begin
  if obj <> nil then
    if obj.GetInterface(IUnknown, iUnk) then
      begin
        iUnk._Release;
        iUnk := nil;
      end
    else
      obj.Free;
end;

{------------------------------------------------------------------}

procedure ClearList2(List : TList);
Var
  A:TObject;
begin
  if list <> nil then
    with List do
      while Count > 0 do
        begin
          A := TObject(List[0]);
          Delete(0);
          DestroyObject(A);
        end;
end;

{----------------------------------------------------------}

Function IsPassThrough(const Unk:IUnknown):Boolean;
Var
  PassThrough:IDCPassThroughLevel;
Begin
  Result:=(Unk.QueryInterface(IDCPassThroughLevel, PassThrough)=S_OK) And
          PassThrough.IsPassThrough;
End;

{----------------------------------------------------------}

function BookMarkValid(const BookMarks : IDCBookMark; const BookMark : TDCBookMark) : boolean;
var
  iBookMarkEx : IDCBookMarkEx;
begin
  result := (BookMarks.QueryInterface(IDCBookMarkEx, iBookMarkEx) <> S_OK) or
            iBookMarkEx.BookMarkValid(BookMark);
end;

{------------------------------------------------------------------}

procedure SafeGoToBookMark(const BookMarks : IDCBookMark; const ABookMark : TDCBookMark);
var
  iBookMarkEx : IDCBookMarkEx;
begin
  if ABookMark <> '' then
    if BookMarkValid(BookMarks, ABookMark) then
      if BookMarks.QueryInterface(IDCBookMarkEx, iBookMarkEx) = S_OK then
        with iBookMarkEx do
          if CompareBookMarks(GetBookMark, ABookMark) = 0 then
            exit;

  BookMarks.GoToBookMark(ABookMark);
end;

{------------------------------------------------------------------}

function PointerToBookMark(p : pointer) : TDCBookMark;
begin
  SetString(result, pchar(@p), sizeof(pointer));
end;

{------------------------------------------------------------------}

function BookMarkToPointer(const BookMark : TDCBookMark) : pointer;
type
  PPointer = ^Pointer;
var
  p : PPointer;
begin
  p := @BookMark[1];
  result := p^;
end;

{******************************************************************}

function TSortedBookMarkList.DoCompare(s1, s2 : pstring) : integer;
var
  iBookMarkEx : IDCBookMarkEx;
begin
  if (integer(s1^) = 0) or (integer(s2^) = 0) then
    result := integer(s1) - integer(s2)
  else if (fBookMarks <> nil) and (fBookMarks.QueryInterface(IDCBookMarkEx, iBookMarkEx) = S_OK) then
    result := iBookMarkEx.CompareBookMarks(s1^, s2^)
  else
    result := CompareStr(s1^, s2^);
end;

{------------------------------------------------------------------}

function  TSortedBookMarkList.CompareWithKey(Item, Key : Pointer) : integer;
begin
  result := DoCompare(BookMarkByItem(Item), PString(Key));
end;

{------------------------------------------------------------------}

function  TSortedBookMarkList.Compare(Item1, Item2 : Pointer) : integer;
begin
  result := DoCompare(BookMarkByItem(Item1), BookMarkByItem(Item2));
end;

{******************************************************************}

function VariantToString(const v : Variant) : string;
begin
  if TVarData(v).vType in [varEmpty, varNULL] then
    result := ''
  else
    result := v;
end;

{------------------------------------------------------------------}

function VariantToBoolean(const v : Variant) : boolean;
begin
  if TVarData(v).vType in [varEmpty, varNULL] then
    result := false
  else
    result := v;
end;

{------------------------------------------------------------------}

function VariantToInt(const v : Variant) : integer;
begin
  if TVarData(v).vType in [varEmpty, varNULL] then
    result := -1
  else
    result := v;
end;

{------------------------------------------------------------------}

{ TSafeInterfacedObject }

Function TSafeInterfacedObject.SafeCallException(ExceptObject:TObject;ExceptAddr:Pointer):HResult;
Begin
  Result:=HandleSafeCallException(ExceptObject,ExceptAddr,IUnknown,
                                  ClassName,'');
End;

{******************************************************************}

constructor TEventHandleComObject.Create(Handler : THandleEventProc);
begin
  inherited Create;
  fHandler := Handler;
end;

{------------------------------------------------------------------}

procedure TEventHandleComObject.HandleEvent(Const EventRec:PEventRec);
begin
  fHandler(EventRec);
end;

{******************************************************************}

function GetIProp(const iRowSet : IDCRowSet; const InfoField : string) : IDCProperty;
var
  iRow : IUnknown;
  iProps : IDCProperties;
begin
  result := nil;

  if (InfoField = '') or not RowsetConnected(iRowSet) then
    exit;

  iRow := iRowSet.GetRow;
  if iRow <> nil then
    begin
      iRow.QueryInterface(IDCProperties, iProps);
      result := DCPropByName(iProps, InfoField);
    end;
end;

{------------------------------------------------------------------}

procedure SetRowSetFieldValue(const iRowSet : IDCRowSet; const InfoField : string; const Value : Variant);
var
  iField  : IDCProperty;
begin
  iField := GetIProp(iRowSet, InfoField);

  if iField <> nil then
    iField.SetValue(Value);
end;

{------------------------------------------------------------------}

function GetFieldText(const iField : IDCProperty) : string;
begin
  if iField <> nil then
    result := iField.GetText
  else
    result := '';
end;

{------------------------------------------------------------------}

function GetFieldStringValue(const iField : IDCProperty) : string;
begin
  if iField <> nil then
    result := iField.GetString
  else
    result := '';
end;

{------------------------------------------------------------------}

function GetFieldValue(const iField : IDCProperty) : Variant;
begin
  if iField <> nil then
    result := iField.GetValue
  else
    result := NULL;
end;

{------------------------------------------------------------------}

function GetRowsetFieldValue(const iRowSet : IDCRowSet; const InfoField : string) : Variant;
begin
  result := GetFieldValue(GetIProp(iRowSet, InfoField));
end;

{------------------------------------------------------------------}

procedure BeginUpdates(const iRowSet : IDCRowSet);
var
  iUpdates : IDCUpdates;
begin
  if iRowSet.QueryInterface(IDCUpdates, iUpdates) = S_OK then
    iUpdates.BeginUpdate;
end;

{------------------------------------------------------------------}

procedure EndUpdates(const iRowSet : IDCRowSet);
var
  iUpdates : IDCUpdates;
begin
  if iRowSet.QueryInterface(IDCUpdates, iUpdates) = S_OK then
    iUpdates.EndUpdate;
end;

{------------------------------------------------------------------}

procedure BeginSafeUpdates(const iRowSet : IDCRowSet);
var
  iUpdates : IDCUpdates;
  iSafeUpdates : IDCSafeUpdates;
begin
  if iRowSet.QueryInterface(IDCSafeUpdates, iSafeUpdates) = S_OK then
    iSafeUpdates.SafeBeginUpdate
  else if iRowSet.QueryInterface(IDCUpdates, iUpdates) = S_OK then
    iUpdates.BeginUpdate;
end;

{------------------------------------------------------------------}

procedure EndSafeUpdates(const iRowSet : IDCRowSet);
var
  iUpdates : IDCUpdates;
  iSafeUpdates : IDCSafeUpdates;
begin
  if iRowSet.QueryInterface(IDCSafeUpdates, iSafeUpdates) = S_OK then
    iSafeUpdates.SafeEndUpdate
  else if iRowSet.QueryInterface(IDCUpdates, iUpdates) = S_OK then
    iUpdates.EndUpdate;
end;

{------------------------------------------------------------------}

function StartUpdates(const iRowSet : IDCRowSet; const iBookMark : IDCBookMark) : TDCBookMark;
var
  iUpdates : IDCUpdates;
  SavePosition : IDCSavePosition;
begin
  if iRowSet.QueryInterface(IDCSavePosition, SavePosition) = S_OK then
    SavePosition.SavePosition
  Else
    result := iBookMark.GetBookMark;

  if iRowSet.QueryInterface(IDCUpdates, iUpdates) = S_OK then
    iUpdates.BeginUpdate;
end;

{------------------------------------------------------------------}

procedure FinishUpdates(const iRowSet : IDCRowSet; const iBookMark : IDCBookMark; const BookMark : TDCBookMark);
var
  iUpdates : IDCUpdates;
  SavePosition : IDCSavePosition; 
begin
  if iRowSet.QueryInterface(IDCSavePosition, SavePosition) = S_OK then
    SavePosition.RestorePosition
  Else
    SafeGotoBookMark(iBookMark, BookMark);

  if iRowSet.QueryInterface(IDCUpdates, iUpdates) = S_OK then
    iUpdates.EndUpdate;
end;

{------------------------------------------------------------------}

function StartSafeUpdates(const iRowSet : IDCRowSet; const iBookMark : IDCBookMark) : TDCBookMark;
begin
  result := iBookMark.GetBookMark;
  BeginSafeUpdates(iRowSet);
end;

{------------------------------------------------------------------}

procedure FinishSafeUpdates(const iRowSet : IDCRowSet; const iBookMark : IDCBookMark; const BookMark : TDCBookMark);
begin
  iBookMark.GoToBookMark(BookMark);
  EndSafeUpdates(iRowSet);
end;

{------------------------------------------------------------------}

function _StartSafeFilterUpdates(const iRowSet : IDCRowSet; const iBookMark : IDCBookMark; Safe : boolean; var BookMark : TDCBookMark) : boolean;
var
  iDelayedFilter : IDCDelayedFilter;
  SavePosition   : IDCSavePosition;
begin
  if iRowSet.QueryInterface(IDCSavePosition, SavePosition) = S_OK then
    SavePosition.SavePosition
  Else
    BookMark := iBookMark.GetBookMark;

  if Safe then
    BeginSafeUpdates(iRowSet)
  else
    BeginUpdates(iRowSet);

  result := (iRowSet.QueryInterface(IDCDelayedFilter, iDelayedFilter) = S_OK) and iDelayedFilter.ApplyFilter;
end;

{------------------------------------------------------------------}

procedure _FinishSafeFilterUpdates(const iRowSet : IDCRowSet; const iBookMark : IDCBookMark; const BookMark : TDCBookMark; Safe : boolean);
var
  iDelayedFilter : IDCDelayedFilter;
  SavePosition   : IDCSavePosition;
begin
  if iRowSet.QueryInterface(IDCDelayedFilter, iDelayedFilter) = S_OK then
    iDelayedFilter.RemoveFilter;

  if iRowSet.QueryInterface(IDCSavePosition, SavePosition) = S_OK then
    SavePosition.RestorePosition
  Else
    if iBookMark <> nil then
      SafeGotoBookMark(iBookMark, BookMark);

  if Safe then
    EndSafeUpdates(iRowSet)
  else
    EndUpdates(iRowSet);
end;

{------------------------------------------------------------------}

function StartSafeFilterUpdates(const iRowSet : IDCRowSet; const iBookMark : IDCBookMark; var BookMark : TDCBookMark) : boolean;
begin
  result := _StartSafeFilterUpdates(iRowSet, iBookMark, true, BookMark);
end;

{------------------------------------------------------------------}

procedure FinishSafeFilterUpdates(const iRowSet : IDCRowSet; const iBookMark : IDCBookMark; const BookMark : TDCBookMark);
begin
  _FinishSafeFilterUpdates(iRowSet, iBookMark, BookMark, true);
end;

{------------------------------------------------------------------}

function StartFilterUpdates(const iRowSet : IDCRowSet; const iBookMark : IDCBookMark; var BookMark : TDCBookMark) : boolean;
begin
  result := _StartSafeFilterUpdates(iRowSet, iBookMark, false, BookMark);
end;

{------------------------------------------------------------------}

procedure FinishFilterUpdates(const iRowSet : IDCRowSet; const iBookMark : IDCBookMark; const BookMark : TDCBookMark);
begin
  _FinishSafeFilterUpdates(iRowSet, iBookMark, BookMark, false);
end;

{------------------------------------------------------------------}

procedure DCPropsByNames(const iProps : IDCProperties; Fields : TStrings; FieldList : TInterfaceList);
var
  iProp  : IDCProperty;
  pcount : integer;
  i      : integer;
  index  : integer;
begin
  if iProps = nil then
    exit;

  pcount := iProps.GetCount;
  FieldList.Count := Fields.Count;

  for i := 0 to FieldList.Count - 1 do
    FieldList[i] := nil;

  with iProps do
    for i := 0 to pcount - 1 do
      begin
        iProp := IUnknown(Items[i]) As IDCProperty;
        index := Fields.IndexOf(iProp.GetName);
        if index >= 0 then
          FieldList[index] := iProp;
      end;
end;

{------------------------------------------------------------------}

procedure DCPropsByNames2(const iProps : IDCProperties; Fields : string; FieldList : TInterfaceList);
var
  s : TStrings;
begin
  s := TStringList.Create;
  try
    ParseString(Fields, ';', s);
    DCPropsByNames(iProps, s, FieldList);
  finally
    s.Free;
  end;
end;

{------------------------------------------------------------------}

procedure GetDCPropByName(const Fields : IDCProperties; const FieldName : string; var iProp : IDCProperty);
begin
  iProp := DCPropByName(Fields, FieldName);
end;

{------------------------------------------------------------------}

function DCPropByName(const Fields : IDCProperties; const FieldName : string) : IDCProperty;
var
  i : integer;
begin
  if (Fields = nil) or (FieldName = '') then
    begin
      result := nil;
      exit;
    end;

  with Fields do
    for i := 0 to GetCount - 1 do
      begin
        result := IUnknown(Items[i]) As IDCProperty;
        if CompareText(result.GetName, FieldName) = 0 then
          exit;
      end;

  result := nil;
end;

{------------------------------------------------------------------}

function RowSetConnected(const iRowSet : IUnknown) : boolean;
var
  iConnect : IDCConnect;
begin
  result := (iRowSet <> nil) and
            ((iRowSet.QueryInterface(IDCConnect, iConnect) <> S_OK) or iConnect.Connected);
end;

{------------------------------------------------------------------}

procedure RegisterEventsHandler(const EventsSource : IUnknown; const EventHandler : IDCEventHandler; EventTypes, UserData : DWORD);
var
  iEvents : IDCEvents;
begin
  if (EventsSource <> nil) and (EventsSource.QueryInterface(IDCEvents, iEvents) = S_OK) then
    begin
      iEvents.RegisterHandler(EventHandler, EventTypes, UserData);
//      iEvents._AddRef;
    end;
end;

{------------------------------------------------------------------}

procedure UnRegisterEventsHandler(const EventsSource : IUnknown; const EventHandler : IDCEventHandler);
var
  iEvents : IDCEvents;
begin
  if (EventsSource <> nil) and (EventsSource.QueryInterface(IDCEvents, iEvents) = S_OK) then
    iEvents.UnRegisterHandler(EventHandler);
end;

{******************************************************************}

procedure   TNotifiersHolder.CallHandlers(const EventRec:PEventRec);
var
  i : integer;
begin
  With EventRec^ Do
    for i := fList.Count - 1 downto 0 do
      if DWORD(fMaskList.List[i]) and EventType <> 0 then
      Begin
        EventRec.UserData:=Cardinal(fUserData.List[i]);
        IDCEventHandler(fList.List[i]).HandleEvent(EventRec);
      End;
end;

{------------------------------------------------------------------}

function  TNotifiersHolder.GetEventsSource : IUnknown;
begin
  result := nil;
end;

{------------------------------------------------------------------}

function  TNotifiersHolder.GetPassThroughEvents : DWORD;
begin
  result := 0;
end;

{------------------------------------------------------------------}

procedure TNotifiersHolder.RegisterHandler(const EventHandler : IDCEventHandler; EventTypes, UserData : DWORD);
begin
  fList.Add(pointer(EventHandler));
  fMaskList.Add(pointer(EventTypes));
  fUserData.Add(pointer(UserData));
  _AddRef;
end;

{------------------------------------------------------------------}

procedure TNotifiersHolder.UnregisterHandler(const EventHandler : IDCEventHandler);
var
  i : integer;
begin
  i := fList.IndexOf(pointer(EventHandler));
  if i >= 0 then
    begin
      fList.Delete(i);
      fMaskList.Delete(i);
      fUserData.Delete(i);
      _Release;      
    end;
end;

{------------------------------------------------------------------}

constructor TNotifiersHolder.Create;
begin
  inherited;
  fList := TFastList.Create;
  fMaskList := TFastList.Create;
  fUserData := TFastList.Create;
end;

{------------------------------------------------------------------}

destructor  TNotifiersHolder.Destroy;
begin
  fList.Free;
  fMaskList.Free;
  fUserData.Free;
  inherited;
end;

{$IFNDEF D4}
{******************************************************************}

constructor TInterfaceList.Create;
begin
  inherited;
  fList := TFastList.Create;
end;

{------------------------------------------------------------------}

destructor  TInterfaceList.Destroy;
begin
  Clear;
  fList.Free;
  inherited;
end;

{------------------------------------------------------------------}

procedure TInterfaceList.SetCount(val : integer);
var
  i : integer;
begin
  for i := fList.Count - 1 downto val do
    if Assigned(fList.List[i]) then
      IUnknown(fList.List[i])._Release;

  fList.Count := val;
end;

{------------------------------------------------------------------}

function TInterfaceList.GetCount : integer;
begin
  result := fList.Count;
end;

{------------------------------------------------------------------}

function  TInterfaceList.Add(const Item : IUnknown) : integer;
begin
  result := IndexOf(Item);

  if result >= 0 then
    exit;

  if Assigned(Item) then
    Item._AddRef;

  result := fList.Add(pointer(Item as IUnknown));
end;

{------------------------------------------------------------------}

procedure TInterfaceList.Clear;
var
  i : integer;
begin
  for i := 0 to fList.Count - 1 do
    ReleaseItem(i);

  fList.Clear;
end;

{------------------------------------------------------------------}

procedure TInterfaceList.Delete(Index: Integer);
begin
  ReleaseItem(Index);
  fList.Delete(Index);
end;

{------------------------------------------------------------------}

function  TInterfaceList.First: IUnknown;
begin
  result := IUnknown(fList.First);
end;

{------------------------------------------------------------------}

function  TInterfaceList.IndexOf(const Item : IUnknown): Integer;
begin
  result := fList.IndexOf(pointer(Item as IUnknown));
end;

{------------------------------------------------------------------}

procedure TInterfaceList.Insert(Index : Integer; const Item : IUnknown);
begin
  if Assigned(Item) then
    Item._AddRef;

  fList.Insert(Index, pointer(Item as IUnknown));
end;

{------------------------------------------------------------------}

function  TInterfaceList.Last: IUnknown;
begin
  result := IUnknown(fList.Last);
end;

{------------------------------------------------------------------}

function  TInterfaceList.Remove(const Item : IUnknown): Integer;
begin
  if Assigned(Item) then
    Item._Release;

  result := flist.Remove(pointer(Item as IUnknown));
end;

{------------------------------------------------------------------}

procedure TInterfaceList.Move(CurIndex, NewIndex: Integer);
begin
  fList.Move(CurIndex, NewIndex);
end;

{------------------------------------------------------------------}

procedure TInterfaceList.ReleaseItem(index : integer);
begin
  if Items[index] <> nil then
    Items[index]._Release;
end;

{------------------------------------------------------------------}

function TInterfaceList.Get(Index: Integer): IUnknown;
begin
  result := IUnknown(fList.Items[Index]);
end;

{------------------------------------------------------------------}

procedure TInterfaceList.Put(Index: Integer; const Item: IUnknown);
begin
  if Assigned(Item) then
    Item._AddRef;

  fList[Index] := pointer(Item as IUnknown);
end;
{$ENDIF}

{******************************************************************}


Type
  TDCObjectHooks=Class;
  TDCVMTHooks=Class;

  TMethodHook=Record
    VMTHooks:TDCVMTHooks;
  End;
  PMethodHook=^TMethodHook;

  TVMTHook=Record
    OldProc:Pointer;
    VMTAddr:Pointer;
    Objects:TDCObjectHooks;
  End;
  PVMTHook=^TVMTHook;

  { TDCHookList }

  TDCHookList=Class(TSortedList)
  Protected
    Procedure Delete(Index:Integer);override;
    Procedure DestroyData(Data:Pointer);virtual;
  Public
    Constructor Create;
    Destructor Destroy;override;

    Function Compare(Item1,Item2:Pointer):Integer;override;
    Function CompareWithKey(Item,Key:Pointer):Integer;override;
    Function GetItemOfKey(Key:Pointer):Pointer;

    Property ItemOfKey[Key:Pointer]:Pointer read GetItemOfKey;
  End;

  { TDCMethodHooks}

  TDCMethodHooks=Class(TDCHookList)
  Private
    FUsageCount:Integer;
  Protected
    Procedure DestroyData(Data:Pointer);override;
  Public
    Procedure AddHook(Obj:TObject;ObjClass:TClass;Handler:TMethod;Proc,NewProc:Pointer);
    Procedure DeleteHook(Obj:TObject;ObjVMT:Pointer;Handler:TMethod;Proc:Pointer);
    Function GetHandlersList(Obj:TObject;Proc:Pointer):TList;
    Function GetOldProc(Obj:TObject;Proc:Pointer):Pointer;

    Property UsageCount:Integer read FUsageCount write FUsageCount;
  End;

  { TDCVMTHooks }

  TDCVMTHooks=Class(TDCHookList)
  Private
    Procedure SetHook(Obj:TObject;ObjClass:TClass;VMTHook:PVMTHook;Proc,NewProc:Pointer);
  Protected
    Procedure DestroyData(Data:Pointer);override;
  Public
    Procedure AddHook(Obj:TObject;ObjClass:TClass;Handler:TMethod;Proc,NewProc:Pointer);
    Procedure DeleteHook(Obj:TObject;ObjVMT:Pointer;Handler:TMethod);
  End;

  { TDCObjectHooks}

  TDCObjectHooks=Class(TDCHookList)
  Private
  Protected
    Procedure DestroyData(Data:Pointer);override;
  Public
    Procedure AddHook(Obj:TObject;Handler:TMethod);
    Procedure DeleteHook(Obj:TObject;Handler:TMethod);
    Function GetIndexOfMethod(List:TList;Handler:TMethod):Integer;
  End;

Var
  Hooks:TDCMethodHooks;

{ TDCHookList }

Constructor TDCHookList.Create;
Begin
  Inherited;
  Sorted:=True;
End;

{---------------------------------------------------------}

Destructor TDCHookList.Destroy;
Var
  I:Integer;
  Item:PHookData;
Begin
  For I:=0 To Count-1 Do
  Begin
    Item:=Items[I];
    DestroyData(Item.Data);
    FreeMem(Item);
  End;
  Inherited;
End;

{---------------------------------------------------------}

Function TDCHookList.Compare(Item1,Item2:Pointer):Integer;
Begin
  Result:=Inherited Compare(THookData(Item1^).Key,THookData(Item2^).Key);
End;

{---------------------------------------------------------}

Function TDCHookList.CompareWithKey(Item,Key:Pointer):Integer;
Begin
  Result:=Inherited Compare(THookData(Item^).Key,Key);
End;

{---------------------------------------------------------}

Procedure TDCHookList.Delete(Index:Integer);
Var
  HookData:PHookData;
Begin
  HookData:=Items[Index];
  DestroyData(HookData.Data);
  FreeMem(HookData);
  Inherited;
End;

{---------------------------------------------------------}

Procedure TDCHookList.DestroyData;
Begin
End;

{---------------------------------------------------------}

Function TDCHookList.GetItemOfKey(Key:Pointer):Pointer;
Var
  Index:Integer;
Begin
  Result:=Nil;
  Index:=IndexOfKey(Key);
  If Index=-1 Then Exit;
  Result:=THookData(Items[Index]^).Data;
End;

{ TDCObjectHooks }

Procedure TDCObjectHooks.DestroyData(Data:Pointer);
Var
  I:Integer;
  List:TList;
Begin
  List:=data;
  For I:=0 To List.Count-1 Do
    FreeMem(List[I]);
  List.Free;
End;

{---------------------------------------------------------}

Procedure TDCObjectHooks.AddHook(Obj:TObject;Handler:TMethod);
Var
  Index:Integer;
  MethodHandlers:TList;
  HookData:PHookData;
  NewHandler:^TMethod;
Begin
  Index:=IndexOfKey(Obj);
  If Index=-1 Then
  Begin
    GetMem(HookData,SizeOf(HookData^));
    MethodHandlers:=TList.Create;
    HookData.Data:=MethodHandlers;
    HookData.Key:=Obj;
    Add(HookData);
  End
  Else
  Begin
    MethodHandlers:=PHookData(Items[Index]).Data;
    If GetIndexOfMethod(MethodHandlers,Handler)<>-1 Then
      Error(SErrHandlerAlreadyExists);
  End;
  GetMem(NewHandler,SizeOf(NewHandler^));
  NewHandler^:=Handler;
  MethodHandlers.Add(NewHandler);
End;

{---------------------------------------------------------}

Procedure TDCObjectHooks.DeleteHook(Obj:TObject;Handler:TMethod);
Var
  Index:Integer;
  ObjectList:TList;
  MethodIndex:Integer;
Begin
  Index:=IndexOfKey(Obj);
  If Index=-1 Then
    Error(SErrHandlerNotExists);
  ObjectList:=PHookData(Items[Index]).Data;
  MethodIndex:=GetIndexOfMethod(ObjectList,Handler);
  If MethodIndex=-1 Then
    Error(SErrHandlerNotExists);
  FreeMem(ObjectList[MethodIndex]);
  ObjectList.Delete(MethodIndex);
  If ObjectList.Count=0 Then
    Delete(Index);
End;

{---------------------------------------------------------}

Function TDCObjectHooks.GetIndexOfMethod(List:TList;Handler:TMethod):Integer;
Begin
  For Result:=0 To List.Count-1 Do
    With TMethod(List[Result]^) Do
      If (Code=Handler.Code) And (Data=Handler.Data) Then Exit;
  Result:=-1;
End;

{TDCMethodHooks}

Procedure TDCMethodHooks.DestroyData(Data:Pointer);
Var
  MethodHook:PMethodHook;
Begin
  MethodHook:=Data;
  MethodHook.VMTHooks.Free;
  FreeMem(MethodHook);
End;

{---------------------------------------------------------}

Function TDCMethodHooks.GetHandlersList(Obj:TObject;Proc:Pointer):TList;
Var
  MethodHook:PMethodHook;
  VMTHooks:TDCVMTHooks;
  ObjectHooks:TDCObjectHooks;
Begin
  Result:=Nil;
  MethodHook:=PMethodHook(ItemOfKey[Proc]);
  If MethodHook=Nil Then Exit;
  VMTHooks:=MethodHook.VMTHooks;
  If VMTHooks=Nil Then Exit;
  ObjectHooks:=PVMTHook(VMTHooks.ItemOfKey[GetVMT(Obj)]).Objects;
  If ObjectHooks=Nil Then Exit;
  Result:=ObjectHooks.ItemOfKey[Obj];
End;

{---------------------------------------------------------}

Function TDCMethodHooks.GetOldProc(Obj:TObject;Proc:Pointer):Pointer;
Var
  MethodHook:PMethodHook;
Begin
  MethodHook:=PMethodHook(ItemOfKey[Proc]);
  Result:=PVMTHook(MethodHook.VMTHooks.ItemOfKey[GetVMT(Obj)]).OldProc;
End;

{---------------------------------------------------------}

Procedure TDCMethodHooks.AddHook(Obj:TObject;ObjClass:TClass;Handler:TMethod;Proc,NewProc:Pointer);
Var
  HookData:PHookData;
  Index:Integer;
  MethodHook:PMethodHook;
Begin
  Index:=IndexOfKey(Proc);
  If Index=-1 Then
  Begin
    GetMem(MethodHook,SizeOf(MethodHook^));
    MethodHook.VMTHooks:=TDCVMTHooks.Create;

    GetMem(HookData,SizeOf(HookData^));
    HookData.Key:=Proc;
    HookData.Data:=MethodHook;
    Add(HookData);
  End
  Else
    MethodHook:=PHookData(Items[Index]).Data;
  MethodHook.VMTHooks.AddHook(Obj,ObjClass,Handler,Proc,NewProc);
End;

{---------------------------------------------------------}

Procedure TDCMethodHooks.DeleteHook(Obj:TObject;ObjVMT:Pointer;Handler:TMethod;Proc:Pointer);
Var
  MethodHook:PMethodHook;
  IndexHook:Integer;
Begin
  IndexHook:=IndexOfKey(Proc);
  If IndexHook=-1 Then
    Error(SErrHandlerNotExists);
  MethodHook:=PHookData(Items[IndexHook]).Data;
  MethodHook.VMTHooks.DeleteHook(Obj,ObjVMT,Handler);
  If MethodHook.VMTHooks.Count=0 Then
    Delete(IndexHook);
End;

{ TDCVMTHooks }

Procedure TDCVMTHooks.DestroyData(Data:Pointer);
Var
  VMTHook:PVMTHook;
Begin
  VMTHook:=Data;
  VMTHook.Objects.Free;
  FreeMem(VMTHook);
End;

{---------------------------------------------------------}

Procedure TDCVMTHooks.AddHook(Obj:TObject;ObjClass:TClass;Handler:TMethod;Proc,NewProc:Pointer);
Var
  HookData:PHookData;
  Index:Integer;
  VMTHook:PVMTHook;
Begin
  Index:=IndexOfKey(GetVMT(Obj));
  If Index=-1 Then
  Begin
    GetMem(VMTHook,SizeOf(VMTHook^));
    VMTHook.Objects:=TDCObjectHooks.Create;

    GetMem(HookData,SizeOf(HookData^));
    HookData.Key:=GetVMT(Obj);
    HookData.Data:=VMTHook;
    Add(HookData);
  End
  Else
    VMTHook:=PHookData(Items[Index]).Data;
  VMTHook.Objects.AddHook(Obj,Handler);
  SetHook(Obj,ObjClass,VMTHook,Proc,NewProc);
End;

{---------------------------------------------------------}

Procedure TDCVMTHooks.DeleteHook(Obj:TObject;ObjVMT:Pointer;Handler:TMethod);

Var
  VMTHook:PVMTHook;
  IndexHook:Integer;
  Written:UInt;
Begin
  IndexHook:=IndexOfKey(ObjVMT);
  If IndexHook=-1 Then
    Error(SErrHandlerNotExists);
  VMTHook:=PHookData(Items[IndexHook]).Data;
  If VMTHook.Objects.Count=1 Then
    If TList(PHookData(VMTHook.Objects[0]).Data).Count=1 Then
      WriteProcessMemory(GetCurrentProcess,VMTHook.VMTAddr,@VMTHook.OldProc,
                         SizeOf(VMTHook.OldProc),Written);
  VMTHook.Objects.DeleteHook(Obj,Handler);
  If VMTHook.Objects.Count=0 Then
    Delete(IndexHook);
End;

Procedure TDCVMTHooks.SetHook(Obj:TObject;ObjClass:TClass;VMTHook:PVMTHook;Proc,NewProc:Pointer);
Var
  VMT:Pointer;
  Written:UInt;
  Offset:Integer;
Begin
  VMT:=ObjClass;
  Offset:=0;
  While (Pointer(VMT^)<>Proc) And (Pointer(VMT^)<>NewProc) Do
  Begin
    Inc(Integer(VMT),4);
    Inc(Offset,4);
  End;
  VMT:=GetVMT(Obj);
  Inc(Integer(VMT),Offset);
  If Pointer(VMT^)<>NewProc Then
  Begin
    VMTHook.OldProc:=Pointer(Integer(VMT^));
    VMTHook.VMTAddr:=VMT;
    WriteProcessMemory(GetCurrentProcess,VMT,@NewProc,SizeOf(NewProc),Written);
  End;
End;

{ TDCInterfacedObject }

Destructor TDCInterfacedObject.Destroy;
Begin
  If (RefCount<>0) And Not FDestroying Then
    Error(SErrReferencedObject);
  Inherited;
End;

{---------------------------------------------------------}

Function TDCInterfacedObject.QueryInterface(const IID:TGUID;out Obj):HResult;
Begin
  Result:=E_NOINTERFACE;
  If GetInterface(IID,Obj) Then
    Result:=0;
End;

{---------------------------------------------------------}

Function TDCInterfacedObject._AddRef:Integer;
Begin
  Inc(FRefCount);
  Result:=FRefCount;
End;

{---------------------------------------------------------}

Function TDCInterfacedObject._Release: Integer;
Begin
  Dec(FRefCount);
  If FRefCount = 0 then
  Begin
    Destroy;
    Result:=0;
    Exit;
  End;
  Result:=FRefCount;
End;

{******************************************************************}

constructor TCustomInfoSet.Create;
begin
  inherited;
  fNotifiers := TNotifiersHolder.Create;
end;

{------------------------------------------------------------------}

destructor  TCustomInfoSet.Destroy;
begin
  inherited;
end;

{------------------------------------------------------------------}

procedure TCustomInfoSet.RegisterHandler(const EventHandler : IDCEventHandler; EventTypes, UserData : DWORD);
begin
  fNotifiers.RegisterHandler(EventHandler, EventTypes, UserData);
  _AddRef;
end;

{------------------------------------------------------------------}

procedure TCustomInfoSet.UnregisterHandler(const EventHandler : IDCEventHandler);
begin
  fNotifiers.UnregisterHandler(EventHandler);
  _Release;
end;

{------------------------------------------------------------------}

procedure TCustomInfoSet.InfoSetChanged(ChangeType:Integer;const ChangeData:Variant);
Var
  EventRec:TEventRec;
begin
  if UpdateCount = 0 then
  Begin
    BuildEventRec(EventRec,Self,ChangeType,ChangeData);
    fNotifiers.CallHandlers(@EventRec);
  End;
end;

{------------------------------------------------------------------}

procedure TCustomInfoSet.ActiveChanged;
begin
  InfoSetChanged(evActiveChanged, RowsetConnected(self as IDCRowSet));
end;

{------------------------------------------------------------------}

procedure TCustomInfoSet.BeginUpdate;
begin
  inc(fUpdateCount);
end;

{------------------------------------------------------------------}

procedure TCustomInfoSet.EndUpdate;
begin
  if fUpdateCount > 0 then
    dec(fUpdateCount);
end;

{******************************************************************}

constructor TFilteredInfoSet.Create;
begin
  inherited;
end;

destructor TFilteredInfoSet.Destroy;
begin
  InfoSet := nil;
  inherited;
end;

{------------------------------------------------------------------}

function TFilteredInfoSet.AcceptRecord : boolean;
begin
  result := true;
  if Assigned(fOnFilter) then
    fOnFilter(fInfoSet, result);
end;

{------------------------------------------------------------------}

var
  VarFalse : Variant;

const
  FilterPassThrough = evActiveChanged + evRowChanged + evRowDeleted;

procedure TFilteredInfoSet.SetInfoSet(const val : IUnknown);
begin
  if fEvents <> nil then
    fEvents.UnRegisterHandler(self);

  fInfoSet := val;

  fEvents := nil;

  if val <> nil then
    begin
      if val.QueryInterface(IDCEvents, fEvents) = S_OK then
        fEvents.RegisterHandler(self, evAll {and not FilterPassThrough}, 0);

      ActiveChanged;
    end
  else
    InfoSetChanged(evActiveChanged, VarFalse);
end;

{------------------------------------------------------------------}

procedure TFilteredInfoSet.SetOnFilter(val : TInfoFilterEvent);
begin
  fOnFilter := val;
  ActiveChanged;
end;

{------------------------------------------------------------------}

procedure TFilteredInfoSet.NotifyHandlers(EventType : integer; const EventData : Variant);
Var
  EventRec:TEventRec;
begin
  if EventType = evRowInserted then
    begin
      fEOF := false;
      fBOF := false;
    end;
  BuildEventRec(EventRec, self, EventType, EventData);
  fNotifiers.CallHandlers(@EventRec);
end;

{------------------------------------------------------------------}

procedure TFilteredInfoSet.RecordChanged(WasOkNow, OkNow : boolean; EventType : integer;
                                        const EventData : Variant);
const
   EvTypes : array[boolean] of array [boolean] of integer = ((-1, evRowInserted), (evRowDeleted, evRecordChanged));
var
  evType : integer;
  evData : Variant;
begin
  evtype := EvTypes[fWasOk, WasOkNow];

  if evtype < 0 then
    exit;

  case evtype of
    evRowDeleted  : evData := fOldBookMark;
    evRowInserted : if OkNow then
                      evData := EventData
                    else
                      evData := NullBookMark;
  else
    evData := EventData;
  end;

  NotifyHandlers(evType, evData);
end;

{------------------------------------------------------------------}

procedure TFilteredInfoSet.HandleEvent(const EventRec:PEventRec);
var
  isOk : boolean;
begin
  if UpdateCount > 0 then
    exit;

  With EventRec^ Do
    if EventType and FilterPassThrough = 0 then
      begin
        isOk := AcceptRecord;

        case EventType of
          evRowInserted       : begin
                                  if fWasOk2 then
                                    if isOk then
                                      NotifyHandlers(EventType, EventData^)
                                    else
                                      NotifyHandlers(EventType, NullBookMarkVar);

                                  exit;
                                end;

          evRecordChanged     : begin
                                  RecordChanged(fWasOk2, isOk, EventType, EventData^);
                                  exit;
                                end;


          evEditStarted       : begin
                                  fWasOk := isOk;
                                  if isOk then
                                    fOldBookMark := EventData^;
                                end;

          evAfterInternalPost : begin
                                  fWasOk2 := isOk;
  //                                exit; //commented to correct work of JoinInfoSet (evRecordChanged of master FilteredInfoSet)
                                end;
        end;

        if not isOK then
          exit;
      end;

  NotifyHandlers(EventRec.EventType, EventRec.EventData^);
end;

{------------------------------------------------------------------}

function TFilteredInfoSet.GetConnected : boolean;
begin
  result := (fInfoSet <> nil) and RowSetConnected(fInfoSet as IDCRowSet);
end;

{------------------------------------------------------------------}

procedure TFilteredInfoSet.SetConnected(Value:Boolean);
begin

end;

{------------------------------------------------------------------}

function TFilteredInfoSet.GetEventSourceID : Integer;
begin
  result := integer(self);
end;

{------------------------------------------------------------------}

function  TFilteredInfoSet.GetBof : boolean;
begin
  result := (fBOF and not fDirectNavigation)
            or (fInfoSet <> nil) and (fInfoSet as IDCNavigation).BOF;
end;

{------------------------------------------------------------------}

function  TFilteredInfoSet.GetEof : boolean;
begin
  result := (fEOF and not fDirectNavigation)
            or (fInfoSet <> nil) and (fInfoSet as IDCNavigation).EOF;
end;

{------------------------------------------------------------------}

procedure TFilteredInfoSet.First;
begin
  if fInfoSet <> nil then
    with fInfoSet as IDCNavigation do
      begin
        First;

        if fDirectNavigation then
          exit;

        fBOF := true;
        fEOF := false;

        while true do
          begin
            if EOF then
              begin
                fEOF := true;
                break;
              end;

            if AcceptRecord then
              break;

            Next;
          end;
      end;
end;

{------------------------------------------------------------------}

procedure TFilteredInfoSet.Last;
begin
  if fInfoSet <> nil then
    with fInfoSet as IDCNavigation do
      begin
        Last;

        if fDirectNavigation then
          exit;

        fEOF := true;
        fBOF := false;

        while true do
          begin
            if BOF then
              begin
                fBOF := true;
                break;
              end;

            if AcceptRecord then
              break;

            Prev;
          end;
      end;
end;

{------------------------------------------------------------------}

procedure TFilteredInfoSet.Next;
var
  fBookMark : TDCBookMark;
  iNavigation : IDCNavigation;
begin
  if fInfoSet <> nil then
    begin
      iNavigation := fInfoSet as IDCNavigation;

      if fDirectNavigation then
        begin
          iNavigation.Next;
          exit;
        end;

      fEOF := false;
      fBOF := false;

      fBookMark := (fInfoSet as IDCBookmark).GetBookMark;

      with iNavigation do
        while not EOF do
          begin
            Next;

            if AcceptRecord then
              exit;
          end;

      fEOF := true;
      (fInfoSet as IDCBookmark).GoToBookMark(fBookMark);
    end;
end;

{------------------------------------------------------------------}

procedure TFilteredInfoSet.Prev;
var
  fBookMark : TDCBookMark;
  iNavigation : IDCNavigation;
begin
 if fInfoSet <> nil then
    begin
      iNavigation := fInfoSet as IDCNavigation;

      if fDirectNavigation then
        begin
          iNavigation.Prev;
          exit;
        end;

      fEOF := false;
      fBOF := false;

      fBookMark := (fInfoSet as IDCBookmark).GetBookMark;

      with fInfoSet as IDCNavigation do
        while not BOF do
          begin
            Prev;

            if AcceptRecord then
              exit;
          end;

      fBOF := true;
      (fInfoSet as IDCBookmark).GoToBookMark(fBookMark);
    end;
end;

{------------------------------------------------------------------}

function TFilteredInfoSet.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if (fInfoSet <> nil) and (IsEqualGUID(IID, IDCUpdates) Or IsEqualGuid(IID,IDCDelayedFilter)) then
    begin
      result := fInfoSet.QueryInterface(IID, Obj);
      if result = S_OK then
        exit;
    end;
  result := inherited QueryInterface(IID, Obj);
  if (Result<>S_OK) And (fInfoSet <> nil) then
    result := fInfoSet.QueryInterface(IID, Obj);
end;

{------------------------------------------------------------------}

procedure TFilteredInfoSet.RegisterHandler(const EventHandler : IDCEventHandler; EventTypes, UserData : DWORD);
begin
  fNotifiers.RegisterHandler(EventHandler, EventTypes, UserData);
end;

{------------------------------------------------------------------}

procedure TFilteredInfoSet.UnregisterHandler(const EventHandler : IDCEventHandler);
begin
  fNotifiers.UnRegisterHandler(EventHandler);
end;

{------------------------------------------------------------------}

procedure TFilteredInfoSet.CallHandlers(const EventRec:PEventRec);
begin
  fNotifiers.CallHandlers(EventRec);
end;

{------------------------------------------------------------------}

function  TFilteredInfoSet.GetEventsSource : IUnknown;
begin
  result := fEvents;
end;

{------------------------------------------------------------------}

function  TFilteredInfoSet.GetPassThroughEvents : DWORD;
begin
  result := 0{FilterPassThrough};
end;

{------------------------------------------------------------------}

function TFilteredInfoSet.GetRow : IUnknown;
begin
  if fInfoSet = nil then
    result := nil
  else
    result := (fInfoSet as IDCRowSet).GetRow;
end;

{------------------------------------------------------------------}

function TFilteredInfoSet.GetFields : IDCColumns;
begin
  if fInfoSet = nil then
    result := nil
  else
    result := (fInfoSet as IDCRowSet).GetFields;
end;

{******************************************************************}

constructor TDCFilterInfoSet.Create(AOwner : TComponent);
var
  unk       : IUnknown;
begin
  inherited;

  fFilterInfoSet := TFilteredInfoSet.Create;
  fFilterInfoSet.QueryInterface(IUnknown, unk);
  unk._AddRef;
  VCLComObject := pointer(unk);
end;

{------------------------------------------------------------------}

destructor  TDCFilterInfoSet.Destroy;
begin
  InfoSet := nil;
  inherited;
end;

{------------------------------------------------------------------}

procedure TDCFilterInfoSet.SetOnFilter(val : TInfoFilterEvent);
begin
  fOnFilter := val;
  fFilterInfoSet.OnFilter := val;
end;

{------------------------------------------------------------------}

procedure TDCFilterInfoSet.SetInfoSet(val : TComponent);
var
  unk : IUnknown;
begin
  if val <> fInfoSet then
    begin
      fInfoSet := val;
      if val <> nil then
        begin
          val.FreeNotification(self);
          val.GetInterface(IUnknown, unk)
        end
      else
        pointer(unk) := nil;

      fFilterInfoSet.InfoSet := unk;
    end;
end;

{------------------------------------------------------------------}

procedure TDCFilterInfoSet.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;

  if (Operation = opRemove) and (AComponent = fInfoSet) then
    InfoSet := nil;
end;

{******************************************************************}

Procedure DateTimeToMSecs(DataIn,DataOut:Pointer);
Var
  MSecs:TMSecs;
Begin
  MSecs:=TimeStampToMSecs(DateTimeToTimeStamp(TDateTime(DataIn^)));
  Move(MSecs,DataOut^,SizeOf(TMSecs));
End;

{---------------------------------------------------------}

Function IsCompatibleDataTypes(DataType1,DataType2:TDBType):Boolean;
Begin
  Result:=DataType1=DataType2;
  If Not Result Then
    Result:=IsNumeric(DataType1) And IsNumeric(DataType2);
End;

{---------------------------------------------------------}

Function IsIntegerType(DataType:TDBType):Boolean;
Begin
  Result:=DataType In [DBTYPE_I2,DBTYPE_I4,DBTYPE_UI1,DBTYPE_I1,DBTYPE_UI2,
                    DBTYPE_UI4,DBTYPE_I8,DBTYPE_UI8];
End;

{---------------------------------------------------------}

Function IsNumeric(DataType:TDBType):Boolean;
Begin
  Result:=DataType In [DBTYPE_I2,DBTYPE_I4,DBTYPE_R4,DBTYPE_R8,DBTYPE_CY,
                    DBTYPE_UI1,DBTYPE_I1,DBTYPE_UI2,DBTYPE_UI4,DBTYPE_I8,
                    DBTYPE_UI8];
End;

{---------------------------------------------------------}

Function IsStringType(FieldType:Word):Boolean;
Begin
  Result:=(FieldType=DBTYPE_STR) Or (FieldType=DBTYPE_BSTR) Or (FieldType=DBTYPE_GUID);
End;

{---------------------------------------------------------}

function IsDateType(DataType : TDBType) : boolean;
begin
  result := DataType in [DBTYPE_DATE, DBTYPE_DBDATE, DBTYPE_DBTIME];
end;

{---------------------------------------------------------}

type
  TGeneralizedDBType = (gdbInteger, gdbFloat, gdbBool, gdbDateTime, gdbString, gdbUncompared);

function CompareFieldValues(Value1, Value2: string;
  DataType1, DataType2: TDBType): integer;

  function GetGeneralizedDBType(AType: TDBType): TGeneralizedDBType;
  begin
    case AType of
      DBTYPE_I1, DBTYPE_I2, DBTYPE_I4, DBTYPE_I8,
      DBTYPE_UI1, DBTYPE_UI2, DBTYPE_UI4, DBTYPE_UI8:
        Result := gdbInteger;
      DBTYPE_R4, DBTYPE_R8, DBTYPE_CY:
        Result := gdbFloat;
      DBTYPE_BOOL:
        Result := gdbBool;
      DBTYPE_DATE, DBTYPE_DBDATE, DBTYPE_DBTIME:
        Result := gdbDateTime;
      DBTYPE_STR, DBTYPE_BSTR, DBTYPE_GUID:
        Result := gdbString;
      else
      { DBTYPE_EMPTY, DBTYPE_NULL, DBTYPE_IDISPATCH, DBTYPE_ERROR, DBTYPE_VARIANT,
        DBTYPE_IUNKNOWN, DBTYPE_DECIMAL, DBTYPE_ARRAY, DBTYPE_BYREF, DBTYPE_VECTOR,
        DBTYPE_RESERVED, DBTYPE_BYTES, DBTYPE_WSTR, DBTYPE_NUMERIC, DBTYPE_UDT,
        DBTYPE_DBTIMESTAMP }
        Result := gdbUncompared;
    end;
  end;

  procedure GetCurrValue(var Str: string);
  var
    p: integer;
  begin
    p := Pos(CurrencyString, Str);
    if p > 0 then
      Delete(Str, p, MaxInt);
    Str := Trim(Str);
  end;

var
  gType1, gType2: TGeneralizedDBType;
  i1 : integer;
  i2 : integer;
  d1 : extended;
  d2 : extended;
  dt1 : TDateTime;
  dt2 : TDateTime;
begin
  Result := 0;
  Value1 := Trim(Value1);
  Value2 := Trim(Value2);
  gType1 := GetGeneralizedDBType(DataType1);
  gType2 := GetGeneralizedDBType(DataType2);
  if (gType1 = gdbUncompared) or (gType2 = gdbUncompared) then
    exit;
  if (Value1 = '') and (Value2 = '') then
    exit;
  if Value1 = '' then
  begin
    Result := -1;
    exit;
  end;
  if Value2 = '' then
  begin
    Result := 1;
    exit;
  end;
  if (gType1 = gdbString) or (gType2 = gdbString) then
  begin
    result := AnsiCompareStr(Value1, Value2);
    exit;
  end;
  if (gType1 = gdbInteger) and (gType2 = gdbInteger) then
  begin
    i1 := StrToInt(Value1);
    i2 := StrToInt(Value2);
    result := i1 - i2;
    exit;
  end;
  if (gType1 in [gdbInteger, gdbFloat]) and (gType2 in [gdbInteger, gdbFloat]) then
  begin
    if DataType1 = DBTYPE_CY then
      GetCurrValue(Value1);
    if DataType2 = DBTYPE_CY then
      GetCurrValue(Value2);

    d1 := StrToFloat(Value1);
    d2 := StrToFloat(Value2);
    if d1 < d2 then
      Result := -1
    else if d1 > d2 then
      Result := 1;
    exit;
  end;
  if (gType1 = gdbDateTime) and (gType2 = gdbDateTime) then
  begin
    dt1 := StrToDateTime(Value1);
    dt2 := StrToDateTime(Value2);
    if dt1 < dt2 then
      Result := -1
    else if dt1 > dt2 then
      Result := 1;
    exit;
  end;
  if (gType1 = gdbBool) and (gType2 = gdbBool) then
  begin
    Result := CompareText(Value1, Value2); //'False' < 'True'
    exit;
  end;
end;

{---------------------------------------------------------}

Procedure MSecsToDateTime(DataIn,DataOut:Pointer);
Var
  DateTime:TDateTime;
Begin
  DateTime:=TimeStampToDateTime(MSecsToTimeStamp(TDateTime(DataIn^)));
  Move(DateTime,DataOut^,SizeOf(TDateTime));
End;

{------------------------------------------------------------------}

function ConfirmDelete : boolean;
begin
  result := MessageDlg(SConfirmDelete, mtConfirmation, [mbYes, mbNo], 0) = idYes;
end;

{------------------------------------------------------------------}

function ConfirmDeleteEx(Sender : TObject; ConfirmEvent : TConfirmDeleteEvent) : boolean;
begin
  result := Assigned(ConfirmEvent);
  if result then
    ConfirmEvent(Sender, result)
  else
    result := ConfirmDelete;
end;

{------------------------------------------------------------------}

Procedure DeInitHooks(var Hooks:TDCMethodHooks);
Begin
  Hooks.UsageCount:=Hooks.UsageCount-1;
  If Hooks.UsageCount<=0 Then
    FreeObject(Hooks,Hooks);
End;

{---------------------------------------------------------}

Procedure InitHooks(var Hooks:TDCMethodHooks);
Begin
  If Hooks=Nil Then
    Hooks:=TDCMethodHooks.Create;
  Hooks.UsageCount:=Hooks.UsageCount+1;
End;

{---------------------------------------------------------}

Procedure AddHook(Obj:TObject;ObjClass:TClass;Handler:TMethod;Proc,NewProc:Pointer);
Begin
  InitHooks(Hooks);
  Hooks.AddHook(Obj,ObjClass,Handler,Proc,NewProc);
End;

{---------------------------------------------------------}

Procedure DeleteHook(Obj:TObject;ObjVMT:Pointer;Handler:TMethod;Proc:Pointer);
Begin
  If Hooks=Nil Then Error(SErrHandlerNotExists);
  Hooks.DeleteHook(Obj,ObjVMT,Handler,Proc);
  DeInitHooks(Hooks);
End;

{---------------------------------------------------------}

Function GetOldProc(Obj:TObject;Proc:Pointer):Pointer;
Begin
  Result:=Hooks.GetOldProc(Obj,Proc)
End;

{---------------------------------------------------------}

Function GetHandlersList(Obj:TObject;Proc:Pointer):TList;
Begin
  If Hooks=Nil Then
    Result:=Nil
  Else
    Result:=Hooks.GetHandlersList(Obj,Proc)
End;

{---------------------------------------------------------}

Function QueryUnknown(Comp:TComponent):IUnknown;
Var
  Unk:IUnknown;
Begin
  If Not Comp.GetInterface(IUnknown,Unk) Then
    OleCheck(E_NOINTERFACE);
  OleCheck(Unk.QueryInterface(IUnknown,Result));
End;

{---------------------------------------------------------}

Procedure BuildEventRec(Var Result:TEventRec;Const AEventSource:IUnknown;AEventType:Integer;Const AEventData:Variant);
Begin
  With Result Do
  Begin
    EventType:=AEventType;
    EventSource:=Pointer(AEventSource);
    EventData:=@AEventData;
    UserData:=0;
  End;  
End;

initialization
  VarFalse := false;
  NullBookMarkVar:=NullBookmark;

end.


