{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit dcinfotree;

interface
{$I dc.inc}

{$DEFINE NEWTREE}
uses
  Windows, Messages, SysUtils, Classes, Controls,
  ComCtrls, commctrl,

  dcconsts, dcInfoLib, dchook, dcdreamlib, dcdtree,
  extctrls{$IFDEF NEWTREE}, dcnTree{$ENDIF}
  {$IFDEF D4},imglist{$ENDIF};

type

  {$IFDEF NEWTREE}
   TBaseInfoNode = dcntree.TDCTreeNode;
  {$ELSE}
   TBaseInfoNode = TTreeNode;
  {$ENDIF}

  TInsertType = TNodeAttachMode;

  TInfoNode = class;
  TInfoListItem = class;

  TGetNodeParams = procedure(Sender : TObject; Node : TInfoNode; const InfoSet : IUnknown) of object;
  TGetItemParams = procedure(Sender : TObject; Item : TInfoListItem; const InfoSet : IUnknown) of object;

  TNodeLoadedEvent  = procedure (Sender : TObject; Node : TBaseInfoNode) of object;
  TModifyInfoEvent  = procedure (Sender : TObject; Node : TBaseInfoNode; var Processed : boolean) of object;
  TInfoInsertEvent  = procedure (Sender : TObject; Node : TBaseInfoNode; DoAppend : boolean; var processed : boolean) of object;
  TModifyFieldEvent =  procedure (Sender : TObject; Node : TBaseInfoNode; const FieldName : string; const NewValue : string; var processed : boolean) of object;

  TLModifyInfoEvent  = procedure (Sender : TObject; Item : TInfoListItem; var Processed : boolean) of object;
  TLInfoInsertEvent  = procedure (Sender : TObject; Item : TInfoListItem; DoAppend : boolean; var processed : boolean) of object;
  TLModifyFieldEvent = procedure (Sender : TObject; Item : TInfoListItem; const FieldName : string; const NewValue : string; var processed : boolean) of object;

  TSortedNodeList = class(TSortedBookMarkList)
  protected
    function BookMarkByItem(Item : pointer) : PDCBookMark; override;
  end;
(*
  TNodeListInfo = class
    iRowset  : IUnknown;
    Nodelist : TSortedNodeList;
  end;

  TNodelistList = class(TSortedList)
    function  CompareWithKey(Item, Key : Pointer) : integer; override;
    function  Compare(Item1, Item2 : Pointer) : integer; override;

    procedure AddNode(node : TInfoNode);
    procedure RemoveNode(node : TInfoNode);
  end;

  TEvSourcesList = class(TSortedList)
    function  CompareWithKey(Item, Key : Pointer) : integer; override;
    function  Compare(Item1, Item2 : Pointer) : integer; override;

    procedure RegisterHandler(const EventsSource : IUnknown; const Handler : IDCEventHandler; EventTypes, UserData : DWORD);
    procedure UnRegisterHandler(const EventsSource : IUnknown; const Handler : IDCEventHandler );
  end;
*)
  TCustomDCInfoTree = class;
  TCustomDCInfoListView = class;

  TInfoNode = class({$IFDEF NEWTREE}TDCTreeNode{$ELSE}TDrawNode{$ENDIF})
  private
    fBookMark   : TDCBookMark;
    fNodeList_  : TSortedNodeList;
    fField      : IDCProperty;
    fRow        : IUnknown;
    fImageField : IDCProperty;
    fStateImageField : IDCProperty;
    fDisplayField    : string;

    fLoaded   : boolean;
    fNoSort   : boolean;

    procedure SetBookMark(const val : TDCBookMark);
    procedure SetRow(const val : IUnknown);
    function  TreeView : TCustomDCInfoTree;
    function  _BookMarkToNode(const BookMark : TDCBookMark) : TBaseInfoNode;
    function  GetNodeLst : TSortedNodeList;
  protected

    property NodeList : TSortedNodeList read GetNodeLst;
    property DisplayField : string read fDisplayField write fDisplayField;

  public
    constructor Create(AOwner: {$IFDEF NEWTREE}TDCTreeNodes{$ELSE}TTreeNodes{$ENDIF});{$IFDEF NEWTREE}override;{$ENDIF}
    destructor Destroy; override;

    property BookMark : TDCBookMark read fBookMark write SetBookMark;
    property Field : IDCProperty read fField write fField;
    property Row : IUnknown read fRow write SetRow;
    property ImageField : IDCProperty read fImageField write fImageField;
    property StateImageField : IDCProperty read fStateImageField write fStateImageField;
    property Loaded : boolean read fLoaded write fLoaded;
  end;

  TDCInfoTreeNodes = class({$IFDEF NEWTREE}TDCTreeNodes{$ELSE}TDrawTreeNodes{$ENDIF})
  private
    function GetTree : TCustomDCInfoTree;
  protected
    function  InternalAdd(Node : TBaseInfoNode; const S : string; Ptr : Pointer; InsertType : TInsertType) : TBaseInfoNode; override;
  public
    procedure   Clear; override;
    procedure   Delete(Node: TBaseInfoNode); override;
    property    Tree : TCustomDCInfoTree read GetTree;
  end;

  TInfoListItem = class(TListItem)
  private
    fBookMark : TDCBookMark;
    fFields   : TInterfaceList;
    fCheckField : IDCProperty;
    fRow        : IUnknown;
    fImageField : IDCProperty;
    fStateImageField : IDCProperty;

    function  GetField(index : integer) : IDCProperty;
    procedure SetField(index : integer; const Field : IDCProperty);
    function  GetFieldCount : integer;
    procedure SetBookMark(const val : TDCBookMark);
  public
    constructor Create(AOwner: TListItems);
    destructor Destroy; override;

    property BookMark : TDCBookMark read fBookMark write SetBookMark;
    property Fields[index : integer] : IDCProperty read GetField write SetField;
    property CheckField : IDCProperty read fCheckField write fCheckField;
    property ImageField : IDCProperty read fImageField write fImageField;
    property StateImageField : IDCProperty read fStateImageField write fStateImageField;
    property Row : IUnknown read fRow write fRow;
    property FieldCount : integer read GetFieldCount;
  end;

  TDCInfoListItems = class(TDrawListItems)
  private
    function GetListView : TCustomDCInfoListView;
  protected
    function InternalAdd(Index : integer; const S : String; InsertType : TNodeAttachMode) : TListItem; override;
  public
    procedure Clear; override;
    procedure Delete(Index: Integer); override;

    property ListView : TCustomDCInfoListView read GetListView;
  end;

  TSortedItemList = class(TSortedBookMarkList)
  protected
    function BookMarkByItem(Item : pointer) : PDCBookMark; override;
  end;

  TInfoTreeOption  = (itoTrackRow, itoConfirmDelete, itoOnlyFolders, itoCheckChilds, itoSmartLoad, itoLocateParent);
  TInfoTreeOptions = set of TInfoTreeOption;

  TInfoListOption  = (iloTrackRow, iloConfirmDelete);
  TInfoListOptions = set of TInfoListOption;

  TLevelLoadingEvent = procedure (Sender : TObject; Node : TBaseInfoNode) of object;

  TCustomDCInfoTree = class({$IFDEF NEWTREE}TDCCustomTreeView{$ELSE}TCustomMSTreeView{$ENDIF}, IUnknown, IDCEventHandler,IDCEvents, IDCMasterInfoset, IInfoControl)
  private
    fInfoSet : TComponent;
    fInfoField : string;
    fOptions   : TInfoTreeOptions;

    fInDelete : integer;

    fUnk         : IUnknown;
    fRowChange   : IDCRowChange;
    fRowSet      : IDCRowSet;

    fNodeList    : TSortedNodeList;
    fInUpdate    : integer;
    fIgnoreMasterChange : integer;

    fEventSource   : IUnknown;

    fLastSelectedNode : TBaseInfoNode;
    fOldBookMark      : TDCBookMark;
    fLastInsertedNode : TBaseInfoNode;
    fDisplayName      : string;
    fNotifiersHolder  : IDCEventsEx;
    fEditedNode       : TBaseInfoNode;
    fDataEditedNodes  : TList;

    fNeedSelect       : TBaseInfoNode;
    fTimer            : TTimer;
    fIgnoreRowChange  : integer;
    fItems            : TDCInfoTreeNodes;
    fExpandedNodes    : TList;

    fOnConfirmDelete  : TConfirmDeleteEvent;
    fOnActivateLevel  : TLevelLoadingEvent;
    fOnNodeLoaded     : TNodeLoadedEvent;

//    fEventSources     : TEvSourcesList;

    fLargeImages :{$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF};
    fStateImages :{$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF};

    fImageField       : string;
    fStateImageField  : string;

    fFreeNodeCount    : integer;
    fIgnoreImages       : integer;

    fOnGetNodeParams  : TGetNodeParams;
    fInsertedBookMark : TDCBookMark;
    fOnTrackError     : TNotifyEvent;
    fOnStartLoading   : TNotifyEvent;
    fOnEndLoading     : TNotifyEvent;

    fOnInfoDelete     : TModifyInfoEvent;
    fOnInfoCancelEdit : TModifyInfoEvent;
    fOnInfoUpdate     : TModifyInfoEvent;
    fOnInfoStartEdit  : TModifyInfoEvent;
    fOnInfoInsert     : TInfoInsertEvent;
    fOnInfoFieldSet   : TModifyFieldEvent;

    FVersion          : TDCInfoTreeVersion;

    fLoadAll            : boolean;
    fInCreateWnd        : boolean;
    fIgnoreNodeChange   : boolean;
    fSelectInsert       : boolean;
    fUseInfoImages      : boolean;
    fInTrackError       : boolean;
    fTracked            : boolean;

    {IDCEvents}
    Procedure RegisterHandler(const EventHandler : IDCEventHandler; EventTypes, UserData : DWORD);
    Procedure UnregisterHandler(const EventHandler : IDCEventHandler);

    {IDCMasterInfoset}
    function GetDetailsRowSet : IDCRowSet;

    procedure SetInfoSet(val : TComponent);
    procedure SetInfoField(const val : string);
    procedure SetOptions(val : TInfoTreeOptions);
    procedure RemoveSubItems(RootItem : TBaseInfoNode);
    function  AddNode(RootItem : TBaseInfoNode; const Text : string) : TBaseInfoNode;
    procedure NodeChanged(AItem : TInfoNode; const NewText : string);
    function  GetIBookMark(Item : TBaseInfoNode) : IDCBookMark;
    function  GetIRowChange(Item : TBaseInfoNode) : IDCRowChange;
    function  DeleteNode(Item : TBaseInfoNode) : boolean;

    procedure ReReadItems(RootItem : TBaseInfoNode; ForceLoad : boolean; NodeToReread : TBaseInfoNode);
    procedure HandleEvent(const EventRec:PEventRec);
    procedure RowDeleted(node : TInfoNode);
    procedure RowChanged(node : TInfoNode);
    procedure RecordChanged(RootItem : TBaseInfoNode);

    procedure RowInserted(const iRowSet : IDCRowSet; ParentNode : TBaseInfoNode);

    procedure GetImages(const iRowSet : IDCRowSet);
    function  GetDisplayName(node : TBaseInfoNode) : string;
    procedure ChangeNode(node : TInfoNode; const iBookMark : IDCBookMark;
                        const iField : IDCProperty; const iRow : IUnknown);

    procedure ChangeNode2(node : TInfoNode; const iBookMark : IDCBookMark;
                          const iRow : IUnknown);

    procedure ChangeNodeImages(node : TInfoNode; const iRow : IUnknown);

    procedure SetLargeImages(val : {$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF});
    procedure SetStateImages(val : {$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF});

    procedure SetImageField(const val : string);
    procedure SetStateImageField(const val : string);

    function  _BookMarkToNode(const BookMark : TDCBookMark) : TBaseInfoNode;
    procedure TimedSelection(Sender : TObject);
    function  GetEventNode(RootItem : TBaseInfoNode; const EventSource : IUnknown; EventType : Integer; const EventData : Variant) : TInfoNode;
//    function  GetRowChangedNode(const EventSource : IUnknown; const EventData : Variant) : TInfoNode;
    function  ObtainDisplayName(const iDisplayField : IDCDisplayField) : string;
    procedure GetRowSetAndBookMark(Item : TBaseInfoNode; var iRowSet : IDCRowSet; var iBookMark : IDCBookMark);
    procedure FreeNode(node : TBaseInfoNode);
    function  CheckFolder(const Folder : IUnknown) : boolean;
    procedure RereadNode(node : TInfoNode; ReadText : boolean);
    procedure ClearNodeList(RootItem : TBaseInfoNode);
    procedure ClearLevel(RootItem : TBaseInfoNode);
    procedure RemoveExtraNodes(node : TBaseInfoNode);
    procedure ActivateLevel(node : TBaseInfoNode);

    procedure AddHandler(const EventsSource : IUnknown; UserData : DWORD);
    procedure RemoveHandler(const EventsSource : IUnknown);

    procedure SetUseInfoImages(val : boolean);
    procedure TrackError;
    procedure LoadNode(RootItem : TInfoNode; var node : TInfoNode; const iBookMark : IDCBookMark;
                       const iField : IDCProperty; const iRow : IUnknown);

  protected
    {IUnknown}
    function  QueryInterface(const IID: TGUID; out Obj): HResult; {$IFDEF D4}override;{$ENDIF}stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;

    function  StoreDrawData : boolean; override;

    procedure CancelEdit;{$IFDEF NEWTREE}override;{$ENDIF}
    function  CanEdit(Item : TBaseInfoNode) : boolean;override;
    Procedure DoExpandNode(Node:TBaseInfoNode);{$IFDEF NEWTREE}override;{$ENDIF}
    {$IFDEF NEWTREE}
    Procedure Edit(Node:TBaseInfoNode;Var NewText:String);override;
    {$ENDIF}
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure CreateWnd; override;

    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;

    function  CreateNode : {$IFDEF NEWTREE}TDCTreeNode{$ELSE}TBaseInfoNode{$ENDIF} ; override;

    function  GetIDCNavigation(Item : TBaseInfoNode) : IDCNavigation;
    function  GetIUnknown(Item : TBaseInfoNode) : IUnknown;
    {$IFNDEF NEWTREE}
    procedure CNNotify(var Message: TWMNotify); message CN_NOTIFY;
    {$ENDIF}

    procedure CMTrackError(var Message : TMessage); message CM_TRACKERROR;

    function  BookMarkToNode(ParentNode : TBaseInfoNode; const BookMark : TDCBookMark) : TBaseInfoNode;

    procedure DelayedSelect(node : TBaseInfoNode);
    function  LocateNode(AItem : TBaseInfoNode; DoNotifyDetails : boolean) : boolean;

    procedure SelectionChanged; override;
    function  DoInsertNode(node, parentnode : TBaseInfoNode) : TBaseInfoNode;
    procedure DoMasterChange;

  public
    procedure UpdateSelection;
    {$IFDEF NEWTREE}
    procedure FullExpand; override;
    {$ENDIF}
    procedure RescanItems(RootItem : TBaseInfoNode);
    procedure RescanNodeWithChildren(Item : TBaseInfoNode);    
    procedure RefreshData;
    function  SetToNode(Item : TBaseInfoNode) : boolean;
    procedure SetToNodeAndSelect(Item : TBaseInfoNode);    
    function  InsertNewNode : TBaseInfoNode;
    function  InsertNewSubNode(ParentNode, Node : TBaseInfoNode) : TBaseInfoNode;
    procedure DeleteSelectedNodes;
    procedure EditSelected;
    function  GetRowSet(Item : TBaseInfoNode) : IDCRowSet;

    constructor Create(AOwner : TComponent); override;
    destructor  Destroy; override;

    property LargeImages : {$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF} read fLargeImages write SetLargeImages;
    property StateImages : {$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF} read fStateImages write SetStateImages;

    property Items : TDCInfoTreeNodes read fItems;
    property InfoSet : TComponent read fInfoSet write SetInfoSet;
    property InfoField : string read fInfoField write SetInfoField;
    property Options : TInfoTreeOptions read fOptions write SetOptions;
    property ImageField      : string read fImageField write SetImageField;
    property StateImageField : string read fStateImageField write SetStateImageField;
    property UseInfoImages : boolean read fUseInfoImages write SetUseInfoImages default False;

    property OnConfirmDelete  : TConfirmDeleteEvent read fOnConfirmDelete write fOnConfirmDelete;
    property OnGetNodeParams  : TGetNodeParams read fOnGetNodeParams write fOnGetNodeParams;
    property OnActivateLevel : TLevelLoadingEvent read fOnActivateLevel write fOnActivateLevel;
    property OnTrackError    : TNotifyEvent read fOnTrackError write fOnTrackError;
    property OnNodeLoaded : TNodeLoadedEvent read fOnNodeLoaded write fOnNodeLoaded;
    property OnStartLoading   : TNotifyEvent read fOnStartLoading write fOnStartLoading;
    property OnEndLoading     : TNotifyEvent read fOnEndLoading write fOnEndLoading;
    property OnInfoDelete     : TModifyInfoEvent read fOnInfoDelete write fOnInfoDelete;
    property OnInfoCancelEdit : TModifyInfoEvent read fOnInfoCancelEdit write fOnInfoCancelEdit;
    property OnInfoStartEdit  : TModifyInfoEvent read fOnInfoStartEdit write fOnInfoStartEdit;
    property OnInfoUpdate     : TModifyInfoEvent read fOnInfoUpdate     write fOnInfoUpdate    ;
    property OnInfoInsert     : TInfoInsertEvent read fOnInfoInsert write fOnInfoInsert;
    property OnInfoFieldSet   : TModifyFieldEvent read fOnInfoFieldSet write fOnInfoFieldSet;
  published
    Property Version:TDCInfoTreeVersion read FVersion write FVersion stored False;
  end;


  TDCInfoTree = class(TCustomDCInfoTree)
  published
    //Std properties
    property BorderStyle;
    property DragCursor;
    property DragMode;
    property Align;
    property Enabled;
    property Font;
    property Color;
    property ParentColor;
    property ParentCtl3D;
    property Ctl3D;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnEnter;
    property OnExit;
    property OnDragDrop;
    property OnDragOver;
    property OnStartDrag;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnDblClick;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property PopupMenu;
    property ParentFont;
    property ParentShowHint;
    property ShowHint;

    //All tree
    property AutoScroll;
    property HideSelection;
    property Indent;
    property MultiSelect;
    property ReadOnly;
    property SelectOnlySiblings;
    property ShowButtons;
    property ShowLines;
    property ShowRoot;
    property SortType;
    Property Version;

    property OnEditing;
    property OnEdited;
    property OnExpanding;
    property OnExpanded;
    property OnChanging;
    property OnChange;
    property OnCollapsing;
    property OnCollapsed;
    property OnDeletion;
    property OnSelectionChanged;

    property Images;
    property StateImages;
    property InfoSet;
    property InfoField;
    property Options;
    property ExpandOnDrag;
    property DragExpandDelay;

    property ImageField;
    property StateImageField;
    property UseInfoImages;

    property OnConfirmDelete;
    property OnGetNodeParams;
    property OnActivateLevel;
    property OnTrackError;
    property OnNodeLoaded;
    property OnStartLoading;
    property OnEndLoading;

    property ToolTips;
    property HotTrack;

    // New in TDCTree
    {$IFDEF NEWTREE}
    property ActiveSelectedColor;
    property ActiveSelectedFontColor;

    property AutoCheck;
    property AllowMultiDrag;
    property CheckBoxesType;
    property DragButtons;
    property DropTargetKind;
    property FlatChecks;
    property InactiveSelectedColor;
    property InactiveSelectedFontColor;
    Property LinesColor;
    property OnCheckClick;
    property OnCompare;
    Property OnGetEditorClass;
    Property OnGetImageIndex;
    Property OnGetSelectedIndex;
    Property OnGetToolTipInfo;
    Property OnRightClickNode;
    Property OnStateChanged;
    Property OnStateChanging;
    property RowSelect;
    property RowSelectType;
    {$IFDEF D4}
    property ScrollBarsStyle;
    {$ENDIF}
    {$ELSE}
    property AllowGrayed;
    property CheckBoxes;
    property SelectDelay;
    property OnClickCheck;
    {$ENDIF}

    {$IFNDEF NEWTREE}
      {$IFDEF D3}
    property RightClickSelect;
      {$ENDIF}
    {$ELSE}
    property RightClickSelect;
    {$ENDIF}

    {$IFDEF D4}
    property Anchors;
    property AutoExpand;
    property BiDiMode;
    property BorderWidth;
    property ChangeDelay;
    property Constraints;
    property DragKind;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;

      {$IFNDEF NEWTREE}
    property OnCompare;
    property OnGetImageIndex;
    property OnGetSelectedIndex;
    property RowSelect;
    property OnCustomDraw;
    property OnCustomDrawItem;
      {$ENDIF}
    {$ENDIF}

    property OnInfoDelete;
    property OnInfoCancelEdit;
    property OnInfoStartEdit;
    property OnInfoUpdate;
    property OnInfoInsert;
    property OnInfoFieldSet;

    {$IFDEF D5}
    property OnContextPopup;
    {$ENDIF}
    property MultiLineNodes;
    property WordWrap;
  end;

  TCustomDCInfoListView = class(TCustomDrawListView, IUnknown, IDCEvents, IDCMasterInfoset, IInfoControl)
  private
    fInfoSet     : TComponent;
    fUnk         : IUnknown;
    fRowSet      : IDCRowSet;
    fComObject   : IDCEventHandler;
    fRoot        : IDCRowSet;
    fFields      : TStrings;
    fDataFields  : TStrings;
    fItemList    : TSortedItemList;
    fRowChange   : IDCRowChange;
    fCheckField  : string;
    fImageField  : string;
    fStateImageField : string;
    fOptions         : TInfoListOptions;
    fMasterInfoSet   : IDCMasterInfoSet;
    fMaster          : IUnknown;
    fItems           : TDCInfoListItems;

    fLargeImages :{$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF};
    fSmallImages :{$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF};
    fStateImages :{$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF};

    fInReading   : integer;
    fInDelete    : integer;

    fEventSource : IUnknown;
    fNotifiersHolder  : IDCEventsEx;
    fLastSelectedItem : TListItem;
    fLastInsertedItem : TListItem;
    fOldBookMark      : TDCBookMark;
    fMasterControl    : TComponent;
    fEditedItem       : TListItem;
    fDataEditItem     : TListItem;
    fOnConfirmDelete  : TConfirmDeleteEvent;
    fOnStartLoading   : TNotifyEvent;
    fOnEndLoading     : TNotifyEvent;

    fOnGetItemParams  : TGetItemParams;
    _Fields           : TInterfaceList;
    _CheckField       : IDCProperty;
    _ImageField       : IDCProperty;
    _StateImageField  : IDCProperty;
    FVersion          : TDCInfoTreeVersion;

    fOnInfoDelete     : TLModifyInfoEvent;
    fOnInfoCancelEdit : TLModifyInfoEvent;
    fOnInfoUpdate     : TLModifyInfoEvent;
    fOnInfoStartEdit  : TLModifyInfoEvent;
    fOnInfoInsert     : TLInfoInsertEvent;
    fOnInfoFieldSet   : TLModifyFieldEvent;

    fWndCreating      : boolean;
    fHomogeneous      : boolean;
    fUseInfoImages    : boolean;
    fIgnoreEvents     : boolean;
    fUpdateColumns    : boolean;

    {IDCEvents}
    Procedure RegisterHandler(const EventHandler : IDCEventHandler; EventTypes, UserData : DWORD);
    Procedure UnregisterHandler(const EventHandler : IDCEventHandler);

    {IDCMasterInfoset}
    function GetDetailsRowSet : IDCRowSet;

    procedure SetInfoSet(val : TComponent);
    procedure SetFields(val : TStrings);
    procedure FieldsChanged(Sender : TObject);
    procedure SetRoot(const ARoot : IDCRowSet);
    procedure SetCheckField(const val : string);
    procedure SetImageField(const val : string);
    procedure SetStateImageField(const val : string);
    procedure SetMasterControl(val : TComponent);

    procedure HandleEvent(const EventRec:PEventRec);
    procedure ItemChanged(Item : TListItem; const NewText : string);
    procedure CancelEdit;
    procedure RowDeleted(item : TListItem);
    procedure RowChanged(item : TListItem);
    procedure FieldChanged(item : TListItem);
    procedure RowInserted(const iRowSet : IDCRowSet);
    procedure RecordChanged(const NewBookMark : TDCBookMark);

    procedure GetImages(const iRowSet : IDCRowSet);
    function  DeleteItem(Item : TListItem) : boolean;

    procedure SetOptions(val : TInfoListOptions);
    procedure SetUpdateColumns(val : boolean);
    procedure SetLargeImages(val : {$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF});
    procedure SetSmallImages(val : {$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF});
    procedure SetStateImages(val : {$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF});

    function  CanModify(Item : TListItem) : boolean;
    procedure ChangeItem(Item : TListItem; const iBookMark : IDCBookMark; const iRow : IUnknown);
    function  GetUsedFields : TStrings;
    procedure GetFieldList(const iRowSet : IDCRowSet);
    procedure MasterChanged;
    procedure UpdateColumnsCaptions;
    procedure InitListItem(Item : TListItem);
    procedure _SetImages(Large, Small, State : TCustomImageList);
    procedure FillFields(const iRow : IUnknown);

    procedure AddHandler(const EventsSource : IUnknown; UserData : DWORD);
    procedure RemoveHandler(const EventsSource : IUnknown);

    procedure SetUseInfoImages(val : boolean);
    procedure CheckChanged(Item : TInfoListItem);
  protected
    procedure CNNotify(var Message: TWMNotify); message CN_NOTIFY;
    procedure LVMINSERTCOLUMN(var Message : TMessage); message LVM_INSERTCOLUMN;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function  CreateListItem: TListItem; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Change(Item: TListItem; Change: Integer); override;
    procedure CreateWnd; override;
    function  QueryInterface(const IID: TGUID; out Obj): HResult; {$IFDEF D4}override;{$ENDIF}stdcall;

    function  StartItemEdit(Item : TListItem) : boolean;
    function  GetRootRowSet : IDCRowSet;
  public
    constructor Create(AOwner : TComponent); override;
    destructor  Destroy; override;
    procedure   RefreshData;
    function    BookMarkToItem(const BookMark : TDCBookMark) : TListItem;
    procedure   ReReadItem(Item : TListItem);
    procedure   DeleteSelectedItems;
    procedure   InsertNewItem;
    procedure   EditSelected;
    function    SetToItem(Item : TListItem) : boolean;
    procedure   SetToItemAndSelect(Item : TListItem);

    property CheckField : string read fCheckField write SetCheckField;
    property Fields : TStrings read fFields write SetFields;
    property UsedFields : TStrings read GetUsedFields;
    property InfoSet : TComponent read fInfoSet write SetInfoSet;
    property Root : IDCRowSet read fRoot write SetRoot;
    property ImageField : string read fImageField write SetImageField;
    property StateImageField : string read fStateImageField write SetStateImageField;
    property Options : TInfoListOptions read fOptions write SetOptions;

    property LargeImages : {$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF} read fLargeImages write SetLargeImages;
    property SmallImages : {$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF} read fSmallImages write SetSmallImages;
    property StateImages : {$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF} read fStateImages write SetStateImages;

    property MasterControl : TComponent read fMasterControl write SetMasterControl;
    property UseInfoImages : boolean read fUseInfoImages write SetUseInfoImages default False;
    property OnConfirmDelete  : TConfirmDeleteEvent read fOnConfirmDelete write fOnConfirmDelete;
    property Items : TDCInfoListItems read fItems stored false;
    property AutoUpdateColumns : boolean read fUpdateColumns write SetUpdateColumns;
    property OnGetItemParams  : TGetItemParams read fOnGetItemParams write fOnGetItemParams;
    property OnStartLoading   : TNotifyEvent read fOnStartLoading write fOnStartLoading;
    property OnEndLoading     : TNotifyEvent read fOnEndLoading write fOnEndLoading;

    property OnInfoDelete     : TLModifyInfoEvent read fOnInfoDelete write fOnInfoDelete;
    property OnInfoCancelEdit : TLModifyInfoEvent read fOnInfoCancelEdit write fOnInfoCancelEdit;
    property OnInfoStartEdit  : TLModifyInfoEvent read fOnInfoStartEdit write fOnInfoStartEdit;
    property OnInfoUpdate     : TLModifyInfoEvent read fOnInfoUpdate     write fOnInfoUpdate    ;
    property OnInfoInsert     : TLInfoInsertEvent read fOnInfoInsert write fOnInfoInsert;
    property OnInfoFieldSet   : TLModifyFieldEvent read fOnInfoFieldSet write fOnInfoFieldSet;
  published
    property Version : TDCInfoTreeVersion read FVersion write FVersion stored false;
  end;

  TDCInfoListView = class(TCustomDCInfoListView)
  private
  published
    property AutoUpdateColumns;
    property Fields;
    property CheckField;
    property InfoSet;
    property MasterControl;
    property Options;
    property ImageField;
    property StateImageField;

    property Align;
    property BorderStyle;
    property Color;
    property ColumnClick;
    property OnClick;
    property OnDblClick;
    property Columns;
    property Ctl3D;
    property DragMode;
    property ReadOnly default False;
    property Enabled;
    property Font;
    property GridLines;
    property HotTrack;
    property Checkboxes;
    property RowSelect;
    property HideSelection;
    property IconOptions;
    property AllocBy;
    property MultiSelect;
    property OnChange;
    property OnChanging;
    property OnColumnClick;
    property OnCompare;
    property OnDeletion;
    property OnEdited;
    property OnEditing;
    property OnEnter;
    property OnExit;
    property OnInsert;
    property OnDragDrop;
    property OnDragOver;
    property DragCursor;
    property OnStartDrag;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property ParentColor default False;
    property ParentFont;
    property ParentShowHint;
    property ShowHint;
    property PopupMenu;
    property ShowColumnHeaders;
    property SortType;
    property TabOrder;
    property TabStop default True;
    property ViewStyle;
    property Visible;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property FlatScrollBars;
    property FullDrag;
    property HotTrackStyles;
    property LargeImages;
    property SmallImages;
    property StateImages;
    property UseInfoImages;
    property Version;
    {$IFDEF D4}
    property Anchors;
    property BiDiMode;
    property BorderWidth;
    property Constraints;
    property DragKind;
    property OwnerDraw;
    property ParentBiDiMode;
    property OnCustomDraw;
    property OnCustomDrawItem;
    property OnCustomDrawSubItem;
    property OnData;
    property OnDataFind;
    property OnDataHint;
    property OnDataStateChange;
    property OnDrawItem;
    property OnEndDock;
    property OnResize;
    property OnSelectItem;
    property OnStartDock;
    {$ENDIF}

    property OnConfirmDelete;
    property OnGetItemParams;

    property OnInfoDelete;
    property OnInfoCancelEdit;
    property OnInfoStartEdit;
    property OnInfoUpdate;
    property OnInfoInsert;
    property OnInfoFieldSet;
  end;

function GetNodeFieldValue(Node : TBaseInfoNode; const FieldName : string) : Variant;
function GetItemFieldValue(Item : TListItem; const FieldName : string) : Variant;

const
  DefaultTreeOptions : TInfoTreeOptions = [itoConfirmDelete, itoCheckChilds, itoSmartLoad];
  DefaultListOptions : TInfoListOptions = [iloTrackRow, iloConfirmDelete];
  RescanTreeOptions = [itoOnlyFolders, itoCheckChilds];

const
  TreeUpdateInterval : integer = 100;

implementation

function GetNodeFieldValue(Node : TBaseInfoNode;const FieldName : string) : Variant;
var
  iProps : IDCProperties;
  iProp  : IDCProperty;
  ITree  : TCustomDCInfoTree;
  iRowSet : IDCRowSet;
  iBookMark : IDCBookMark;
  SaveBookMark : TDCBookMark;
begin
  if Node = nil then
    begin
      VarClear(result);
      exit;
    end;

  ITree := Node.TreeView as TCustomDCInfoTree;
  iTree.GetRowSetAndBookMark(node.Parent, iRowSet, iBookMark);
  SaveBookMark := StartUpdates(iRowSet, iBookMark);
  inc(iTree.fIgnoreMasterChange);
  try
    iProps := TInfoNode(Node).Row as IDCProperties;
    iProp := DCPropByName(iProps, FieldName);
    ITree.SetToNode(node);
    if iProp <> nil then
      Result := iProp.GetValue
    else
      VarClear(Result);
  finally
    dec(iTree.fIgnoreMasterChange);
    FinishUpdates(iRowSet, iBookMark, SaveBookMark);
  end;
end;

{------------------------------------------------------------------}

function GetItemFieldValue(Item : TListItem; const FieldName : string) : Variant;
var
  iProps : IDCProperties;
  iProp  : IDCProperty;
  iRowSet : IDCRowSet;
  iBookMark : IDCBookMark;
  SaveBookMark : TDCBookMark;
begin
  if Item = nil then
    begin
      VarClear(result);
      exit;
    end;

  with TDCInfoListView(Item.ListView) do
    begin
      iRowSet := GetRootRowSet;
      iRowSet.QueryInterface(IDCBookMark, iBookMark);
      SaveBookMark := StartUpdates(iRowSet, iBookMark);
      fIgnoreEvents := true;
      try
        SetToItem(Item);
        iProps := TInfoListItem(Item).Row as IDCProperties;
        iProp := DCPropByName(iProps, FieldName);
        if iProp <> nil then
          result := iProp.GetValue
        else
          VarClear(result);
      finally
        FinishUpdates(iRowSet, iBookMark, SaveBookMark);
        fIgnoreEvents := false;
      end;
    end;
end;

(*
function  TNodeListList.CompareWithKey(Item, Key : Pointer) : integer;
begin

end;

{------------------------------------------------------------------}

function  TNodeListList.Compare(Item1, Item2 : Pointer) : integer;
begin

end;

{------------------------------------------------------------------}

procedure TNodeListList.AddNode(node : TInfoNode);
begin

end;

{------------------------------------------------------------------}

procedure TNodeListList.RemoveNode(node : TInfoNode);
begin

end;

{------------------------------------------------------------------}

type
  TEvSourceInfo = class
    EvSource   : IUnknown;
    UseCount   : integer;
    EventTypes : integer;
    UserDatas  : TList;

    constructor Create;
    destructor  Destroy; override;
  end;

{------------------------------------------------------------------}

constructor TEvSourceInfo.Create;
begin
  inherited;
  UserDatas := TList.Create;
end;

{------------------------------------------------------------------}

destructor  TEvSourceInfo.Destroy;
begin
  UserDatas.Free;
  inherited;
end;

{******************************************************************}

type
  PSearchInfo = ^TSearchInfo;
  TSearchInfo = record
    iSource : IUnknown;
    EventTypes : integer;
  end;

function  TEvSourcesList.CompareWithKey(Item, Key : Pointer) : integer;
begin
  result := TEvSourceInfo(Item).EventTypes - PSearchInfo(Key).EventTypes;

  if result = 0 then
    result := CompareEventSources(TEvSourceInfo(Item).EvSource, PSearchInfo(Key).iSource);
end;

{------------------------------------------------------------------}

function  TEvSourcesList.Compare(Item1, Item2 : Pointer) : integer;
begin
  result := TEvSourceInfo(Item1).EventTypes - TEvSourceInfo(Item2).EventTypes;

  if result = 0 then
    result := CompareEventSources(TEvSourceInfo(Item1).EvSource, TEvSourceInfo(Item2).EvSource);
end;

{------------------------------------------------------------------}

procedure TEvSourcesList.RegisterHandler(const EventsSource : IUnknown; const Handler : IDCEventHandler; EventTypes, UserData : DWORD);
var
  info  : TEvSourceInfo;
  sinfo : TSearchInfo;
begin
  sinfo.iSource := EventsSource;
  sinfo.EventTypes := EventTypes;
  info := ItemByKey(@sinfo);

  if info = nil then
    begin
      info := TEvSourceInfo.Create;
      try
        info.EvSource := EventsSource;
        info.EventTypes := EventTypes;
        RegisterEventsHandler(EventsSource, Handler, EventTypes, DWORD(info));
        Add(info);
      except
        info.Free;
        raise;
      end;
    end;

  inc(info.UseCount);
  info.UserDatas.Add(pointer(UserData));
end;

{------------------------------------------------------------------}

procedure TEvSourcesList.UnRegisterHandler(const EventsSource : IUnknown; const Handler : IDCEventHandler);
var
  i    : integer;
begin
  i := IndexOfKey(pointer(EventsSource));
  if i >= 0 then
    with TEvSourceInfo(Items[i]) do
    begin
      dec(UseCount);
      if UseCount = 0 then
        begin
          Delete(i);
          Free;
        end;
    end;
end;
*)
{******************************************************************}

procedure NotifyDetails(const EventSource : IUnknown; const Notifiers : IDCEventsEx);
Var
  EventRec:TEventRec;
begin
  BuildEventRec(EventRec,EventSource, evMasterChanged, NullBookMark);
  Notifiers.CallHandlers(@EventRec);
end;

{------------------------------------------------------------------}

procedure DoInsert(const iRowSet : IDCRowSet; Selected : TObject; var fRowChange : IDCRowChange;
                   DoAppend : boolean; const FieldName, FieldValue : string; ForceOperation : boolean);
var
  iCanRowChange : IDCCanRowChange;
  iRowChange    : IDCRowChange;
begin
  if iRowSet.QueryInterface(IDCRowChange, iRowChange) <> S_OK then
    exit;

  iRowSet.QueryInterface(IDCCanRowChange, iCanRowChange);

  try
    if not DoAppend and (Selected <> nil) and (ForceOperation or ((iCanRowChange <> nil) and iCanRowChange.CanInsert)) then
      iRowChange.Insert
    else if (iCanRowChange = nil) or ForceOperation or iCanRowChange.CanAppend then
      iRowChange.Append
    else
      exit;

    try
      if FieldValue <> '' then
        SetRowSetFieldValue(iRowSet, FieldName, FieldValue);

      iRowChange.Post;

    except
      iRowChange.Cancel;

      raise;
    end;

  finally
    iRowChange := nil;
  end;
end;

{******************************************************************}

type
  TBookMarkToItemProc = function (const BookMark : TDCBookMark) : TObject of object;

{------------------------------------------------------------------}

function GetInsertedItem(const iRowSet : IDCRowSet; const iBookMark : IDCBookMark; BookMarkToItem : TMethod{TBookMarkToItemProc}) : pointer;
var
  iNavigation : IDCNavigation;
  fSaveBookMark : TDCBookMark;
begin
  iRowSet.QueryInterface(IDCNavigation, iNavigation);
  result := nil;

  fSaveBookMark := StartUpdates(iRowSet, iBookMark);
  try
    with iNavigation do
{
      if BOF then             //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        result := nil
      else
}
      while not EOF do
        begin
          Next;
          result := TBookMarkToItemProc(BookMarkToItem)(iBookMark.GetBookMark);
          if result <> nil then
            break;
        end;
  finally
    FinishUpdates(iRowSet, iBookMark, fSaveBookMark);
  end;
end;

{------------------------------------------------------------------}

var
  fNodeListLock : TRTLCriticalSection;
  fRereadLock : TRTLCriticalSection;

function GetNodeList(TreeView : TCustomDCInfoTree; node : TBaseInfoNode) : TSortedNodeList;
begin
  EnterCriticalSection(fNodeListLock);
  try
    if node <> nil then
      result := TInfoNode(node).NodeList
    else
      result := TreeView.fNodeList;
  finally
    LeaveCriticalSection(fNodeListLock);
  end;
end;

{------------------------------------------------------------------}

function GetNodeList_(TreeView : TCustomDCInfoTree; node : TBaseInfoNode) : TSortedNodeList;
begin
  if node <> nil then
    result := TInfoNode(node).fNodeList_
  else
    result := TreeView.fNodeList;
end;

{------------------------------------------------------------------}

procedure BeginNodelistUpdate(TreeView : TCustomDCInfoTree; node : TInfoNode);
var
  nodelist : TSortedNodeList;
begin
  exit;
  nodelist := GetNodeList_(TreeView, node);
  if nodelist <> nil then
    nodelist.Sorted := false
  else if node <> nil then
    node.fNoSort := true;
end;

{------------------------------------------------------------------}

procedure EndNodelistUpdate(TreeView : TCustomDCInfoTree; node : TInfoNode);
var
  nodelist : TSortedNodeList;
begin
  exit;
  nodelist := GetNodeList_(TreeView, node);
  if nodelist <> nil then
    nodelist.Sorted := true;
end;

{******************************************************************}

constructor TInfoNode.Create(AOwner: {$IFDEF NEWTREE}TDCTreeNodes{$ELSE}TTreeNodes{$ENDIF});
begin
  inherited Create(AOwner);
end;

{------------------------------------------------------------------}

destructor TInfoNode.Destroy;
var
  Tree : TCustomDCInfoTree;
begin
  Tree := TreeView;
  with Tree do
    begin
      if not (csDestroying in ComponentState) then
        begin
          if self = fNeedSelect then
            fNeedSelect := nil;

            GetNodeList(Tree, self.Parent).Remove(self);
            fDataEditedNodes.Remove(self);
        end;

      RemoveHandler(fRow);
    end;

  FreeObject(fNodeList_,fNodeList_);
  inherited;
end;

{------------------------------------------------------------------}

function TInfoNode.TreeView : TCustomDCInfoTree;
begin
   result := TCustomDCInfoTree(Owner.Owner);
end;

{------------------------------------------------------------------}

function TInfoNode.GetNodeLst : TSortedNodeList;
begin
  if fNodeList_ = nil then
    begin
      fNodeList_ := TSortedNodeList.Create;
      if fNoSort then
        fNodeList_.Sorted := false;
      fNodeList_.iBookMarks := fRow;
    end;

  result := fNodeList_;
end;

{------------------------------------------------------------------}

function TInfoNode._BookMarkToNode(const BookMark : TDCBookMark) : TBaseInfoNode;
begin
  if fNodeList_ = nil then
    result := nil
  else
    result := fNodeList_.ItemByKey(@BookMark);
end;

{------------------------------------------------------------------}

procedure TInfoNode.SetRow(const val : IUnknown);
begin
  if val = fRow then
    exit;

  fRow := val as IUnknown;
  if fNodeList_ <> nil then
    fNodeList_.iBookMarks := val;
end;

{------------------------------------------------------------------}

procedure TInfoNode.SetBookMark(const val : TDCBookMark);
begin
//  if val <> fBookMark then
    with GetNodeList(TreeView, self.Parent) do
      begin
        if fBookMark <> '' then
          Remove(self);
        fBookMark := val;
        Add(self);
      end;
end;

{******************************************************************}

function TDCInfoTreeNodes.GetTree : TCustomDCInfoTree;
begin
  result := TCustomDCInfoTree(Owner);
end;

{------------------------------------------------------------------}

function TDCInfoTreeNodes.InternalAdd(Node : TBaseInfoNode; const S : string; Ptr : Pointer; InsertType : TInsertType) : TBaseInfoNode;
const
  RootInsertTypes : array[TInsertType] of TInsertType =
    (naAddChild, naAddChildFirst, naAddChild, naAddChildFirst, naAddChildFirst);
var
  iRowSet    : IDCRowSet;
  iRowChange : IDCRowChange;
  pnode      : TBaseInfoNode;
  iDisplayField : IDCDisplayField;
  DisplayName   : string;
  processed     : boolean;
begin
  result := nil;

  if (Node = nil) then
    InsertType := RootInsertTypes[InsertType];

  if (Node <> nil) then
    begin
      if (InsertType in [naAddChild, naAddChildFirst]) then
        pnode := Node
      else
        pnode := Node.Parent;

      if not Tree.SetToNode(Node) then
        exit;
    end
  else
    pnode := nil;

  iRowSet := Tree.GetRowSet(pnode);

  if (iRowSet = nil) or (iRowSet.QueryInterface(IDCRowChange, iRowChange) <> S_OK) then
    begin
      Error(SErrChangesNotSupported);
      exit;
    end;

  Tree.fLastInsertedNode := nil;
  Tree.GetIUnknown(pnode).QueryInterface(IDCDisplayField, iDisplayField);
  DisplayName := Tree.ObtainDisplayName(iDisplayField);

  processed := false;

  if Assigned(Tree.OnInfoInsert) then
    Tree.OnInfoInsert(self, pnode, InsertType <> naInsert, processed);

  if not processed then
    DoInsert(iRowSet, node, iRowChange, InsertType <> naInsert, DisplayName, S, true);

  result := Tree.fLastInsertedNode;

  if result = nil then
    Error(SErrInsert);
end;

{------------------------------------------------------------------}

procedure   TDCInfoTreeNodes.Clear;
var
  node : TBaseInfoNode;
begin
  while Count > 0 do
    begin
      node := Item[0];
      Delete(Item[0]);
      if (Item[0] = node) then
        node.Free;
    end;
end;

{------------------------------------------------------------------}

procedure   TDCInfoTreeNodes.Delete(Node: TBaseInfoNode);
begin
  Tree.DeleteNode(node);
end;

{******************************************************************}

constructor TInfoListItem.Create(AOwner: TListItems);
begin
  inherited;
  fFields := TInterfaceList.Create;
end;

{------------------------------------------------------------------}

procedure TInfoListItem.SetBookMark(const val : TDCBookMark);
begin
  with TCustomDCInfoListView(ListView).fItemList do
    begin
      Remove(self);
      fBookMark := val;
      Add(self);
    end;
end;

{------------------------------------------------------------------}

function  TInfoListItem.GetField(index : integer) : IDCProperty;
begin
  result := fFields[index] as IDCProperty;
end;

{------------------------------------------------------------------}

procedure TInfoListItem.SetField(index : integer; const Field : IDCProperty);
begin
  with fFields do
    if index >= Count then
      fFields.Add(Field)
    else
      fFields[index] := Field;
end;

{------------------------------------------------------------------}

function  TInfoListItem.GetFieldCount : integer;
begin
  result := fFields.Count;
end;

{------------------------------------------------------------------}

destructor TInfoListItem.Destroy;
begin
  with TCustomDCInfoListView(ListView) do
    begin
      if fDataEditItem = self then
        fDataEditItem := nil;

      if not (csDestroying in ComponentState) then
        fItemList.Remove(self);
    end;

  fBookMark := NullBookMark;
  fFields.Free;
  inherited;
end;

{******************************************************************}

function TDCInfoListItems.GetListView : TCustomDCInfoListView;
begin
  result := TCustomDCInfoListView(Owner);
end;

{------------------------------------------------------------------}

function TDCInfoListItems.InternalAdd(Index : integer; const S : String; InsertType : TNodeAttachMode) : TListItem;
var
  iRowSet : IDCRowSet;
  iRowChange : IDCRowChange;
  FieldList : TStrings;
  DisplayName : string;
  processed   : boolean;
begin
  result := nil;

  with ListView do
    begin
      if (InsertType = naInsert) then
        if not SetToItem(Items[Index]) then
          exit;

      iRowSet := GetRootRowSet;
      iRowSet.QueryInterface(IDCRowChange, iRowChange);
      if iRowChange = nil then
        exit;

      fLastInsertedItem := nil;
      FieldList := UsedFields;
      with FieldList do
        if Count > 0 then
          DisplayName := Strings[0]
        else
          DisplayName := '';

      processed := false;

      if Assigned(OnInfoInsert) then
        OnInfoInsert(self, nil, InsertType <> naInsert, processed);

      if not processed then
        DoInsert(iRowSet, nil, iRowChange, InsertType <> naInsert, DisplayName, S, true);

      result := fLastInsertedItem;
    end;
end;

{------------------------------------------------------------------}

procedure TDCInfoListItems.Clear;
begin
  while Count > 0 do
    Delete(0);
end;

{------------------------------------------------------------------}

procedure TDCInfoListItems.Delete(Index: Integer);
begin
  ListView.DeleteItem(Item[index]);
end;

{******************************************************************}

function TSortedNodeList.BookMarkByItem(Item : pointer) : PDCBookMark;
begin
  result := @(TInfoNode(Item).BookMark);
end;

{******************************************************************}

function  TSortedItemList.BookMarkByItem(Item : pointer) : PDCBookMark;
begin
  result := @(TInfoListItem(Item).BookMark);
end;

{******************************************************************}

constructor TCustomDCInfoTree.Create(AOwner : TComponent);
begin
  inherited;
  fDataEditedNodes  := TList.Create;
  fNodeList    := TSortedNodeList.Create;
  fOptions     := DefaultTreeOptions;
  fNotifiersHolder := TNotifiersHolder.Create;
  fItems := TDCInfoTreeNodes.Create(self);
  fTimer := TTimer.Create(nil);
  fTimer.Interval := TreeUpdateInterval;
  fTimer.OnTimer := TimedSelection;
  fExpandedNodes := TList.Create;
//  fEventSources := TEvSourcesList.Create;
end;

{------------------------------------------------------------------}

destructor  TCustomDCInfoTree.Destroy;
begin
  fTimer.Free;
  RemoveHandler(fEventSource);
  fNodeList.Free;
  fExpandedNodes.Free;
  fDataEditedNodes.Free;
  Destroying;
  fItems.Free;
//  fEventSources.Free;
  inherited;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.FullExpand;
begin
  inherited;
end;

{------------------------------------------------------------------}

function  TCustomDCInfoTree.StoreDrawData : boolean;
begin
  result := false;
end;

{------------------------------------------------------------------}

procedure SplitEvents(const EventsSource : IUnknown; var ptEvents : DWORD; var iSource);
var
  iEventsEx : IDCEventsEx;
begin
  pointer(iSource) := nil;

  if (EventsSource <> nil) and (EventsSource.QueryInterface(IDCEventsEx, iEventsEx) = S_OK) then
    begin
      ptEvents := iEventsEx.GetPassThroughEvents;
      if ptEvents <> 0 then
        IUnknown(iSource) := iEventsEx.GetEventsSource;

      if pointer(iSource) = nil then
        ptEvents := 0;
    end
  else
    ptEvents := 0;
end;

{******************************************************************}

function TCustomDCInfoTree.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    result := S_OK
  else
    {$IFNDEF D4}
    result := E_NOINTERFACE
    {$ELSE}
    result := inherited QueryInterface(IID, Obj);
    {$ENDIF}
end;

{------------------------------------------------------------------}

function TCustomDCInfoTree._AddRef: Integer;
begin
  result := 1;
end;

{------------------------------------------------------------------}

function TCustomDCInfoTree._Release: Integer;
begin
  result := 1;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.AddHandler(const EventsSource : IUnknown; UserData : DWORD);
{var
  ptEvents  : DWORD;
  iSource   : IUnknown;}
begin
//  SplitEvents(EventsSource, ptEvents, iSource);
(*
  if ptEvents <> 0 then
    begin
//      fEventSources.RegisterHandler(EventsSource, fComObject, evAll and not ptEvents, UserData);
      RegisterEventsHandler(EventsSource, fComObject, evAll and not ptEvents, UserData);
//      fEventSources.RegisterHandler(iSource, fComObject, ptEvents, UserData);
      RegisterEventsHandler(iSource, fComObject, ptEvents, UserData);
    end
  else
//    fEventSources.RegisterHandler(EventsSource, fComObject, evAll, UserData);
*)
    RegisterEventsHandler(EventsSource, Self, evAll, UserData);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.RemoveHandler(const EventsSource : IUnknown);
{var
  ptEvents  : DWORD;
  iSource   : IUnknown;}
begin
  if EventsSource <> nil then
    begin
//      SplitEvents(EventsSource, ptEvents, iSource);

{      if ptEvents <> 0 then
        begin
          UnRegisterEventsHandler(EventsSource, fComObject);
          UnRegisterEventsHandler(iSource, fComObject);
        end
      else}
        UnRegisterEventsHandler(EventsSource, Self);
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.SetUseInfoImages(val : boolean);
begin
  if val <> fUseInfoImages then
    begin
      fUseInfoImages := val;
      GetImages(fRowSet);
    end;
end;

{------------------------------------------------------------------}

function TCustomDCInfoTree.DeleteNode(Item : TBaseInfoNode) : boolean;
var
  iRowChange    : IDCRowChange;
  iBookMark     : IDCBookMark;
  SaveBookMark  : TDCBookMark;
  iCanRowChange : IDCCanRowChange;
  processed     : boolean;
begin
  result := item <> nil;

  if not result then
    exit;

  if Not LocateNode(Item, false) then
    Exit;
  iRowChange := GetIRowChange(Item.Parent);
  result := iRowChange <> nil;

  if result then
    if iRowChange.QueryInterface(IDCCanRowChange, iCanRowChange) = S_OK then
      result := iCanRowChange.CanDelete;
  If Result Then
    begin
      processed := false;
      if Assigned(OnInfoDelete) then
        OnInfoDelete(self, Item, processed);

      if processed then
        exit;

      iBookMark := GetIBookMark(Item.Parent);
      SaveBookMark := iBookMark.GetBookmark;
      ClearRowSet(GetRowSet(Item));

      if BookMarkValid(iBookMark, SaveBookMark) then
        begin
          if (SaveBookMark <> iBookMark.GetBookMark) then
            iBookMark.GotoBookmark(SaveBookMark);

          iRowChange.Delete;
        end;
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.DeleteSelectedNodes;
var
  sel    : TBaseInfoNode;
  node   : TBaseInfoNode;
begin
  sel := Selected;

  if ((sel = nil) and ({$IFDEF NEWTREE}FSelectedItems{$ELSE}fItemsSelected{$ENDIF}.Count = 0)) or
     ((itoConfirmDelete in Options) and not ConfirmDeleteEx(self, OnConfirmDelete)) then
    exit;

  inc(fInDelete);
  Items.BeginUpdate;
  try
    if {$IFDEF NEWTREE}FSelectedItems{$ELSE}fItemsSelected{$ENDIF}.IndexOf(sel) >= 0 then
      sel := nil;

    with {$IFDEF NEWTREE}FSelectedItems{$ELSE}fItemsSelected{$ENDIF} do
      while Count > 0 do
        begin
          node := List[0];
          if not DeleteNode(node) then
            exit;

          if node = List[0] then
            exit;
        end;

    if Selected = sel then
      DeleteNode(sel);

  finally
    Items.EndUpdate;
    dec(fInDelete);
  end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.SetLargeImages(val : {$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF});
begin
  if val <> fLargeImages then
    begin
      fLargeImages := val;
      if val <> nil then
        val.FreeNotification(self);

      GetImages(fRowSet);
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.SetStateImages(val : {$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF});
begin
  if val <> fStateImages then
    begin
      fStateImages := val;
      if val <> nil then
        val.FreeNotification(self);

      GetImages(fRowSet);
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.SetImageField(const val : string);
var
  fOldImageField : string;
begin
  if val <> fImageField then
    begin
      fOldImageField := fImageField;
      fImageField := val;
      try
        RefreshData;
      except
        fImageField := fOldImageField;
        RefreshData;
        raise;
      end;
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.SetStateImageField(const val : string);
var
  fOldStateImageField : string;
begin
  if val <> fStateImageField then
    begin
      fOldStateImageField := fStateImageField;
      fStateImageField := val;
      try
        RefreshData;
      except
        fStateImageField := fOldStateImageField;
        RefreshData;
        raise;
      end;
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.EditSelected;
var
  selnode : TBaseInfoNode;
begin
  selnode := Selected;
  if (selnode <> nil) then
    begin
      SetFocus;
      selnode.EditText;
    end;
end;

{------------------------------------------------------------------}

function TCustomDCInfoTree.DoInsertNode(node, parentnode : TBaseInfoNode) : TBaseInfoNode;
var
  iRowSet       : IDCRowSet;
  nnode         : TBaseInfoNode;
  processed     : boolean;
begin
  result := nil;

  try
    inc(fIgnoreRowChange);

    iRowSet := GetRowSet(parentnode);

    if iRowSet = nil then
      exit;

    if (node <> nil) and not SetToNode(node) then
      exit;

    processed := false;

    if Assigned(OnInfoInsert) then
      OnInfoInsert(self, node, false, processed);

    if not processed then
      DoInsert(iRowSet, node, fRowChange, false, '', '', false);

    nnode := fLastInsertedNode;

    if nnode <> nil then
      begin
        Selected := nnode;
        nnode.EditText;
      end;
    result := nnode; // added in V4.1
  finally
    dec(fIgnoreRowChange);
  end;
end;

{------------------------------------------------------------------}

function TCustomDCInfoTree.InsertNewSubNode(ParentNode, Node : TBaseInfoNode) : TBaseInfoNode;
begin
  result := DoInsertNode(Node, ParentNode);
end;

{------------------------------------------------------------------}

function TCustomDCInfoTree.InsertNewNode : TBaseInfoNode;
var
  node, pnode : TBaseInfoNode;
begin
  pnode := nil;
  node := Selected;
  if node <> nil then
    pnode := node.Parent;

  result := DoInsertNode(node, pnode);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if fEditedNode <> nil then
    CheckChar(IsEditing, TInfoNode(fEditedNode).Field, Key);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if not (ReadOnly or IsEditing) then
    case key of
      VK_DELETE : DeleteSelectedNodes;
      VK_F2     : EditSelected;
      VK_INSERT : InsertNewNode;
    end;

  inherited;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.CreateWnd;
{$IFNDEF NEWTREE}
var
  i : integer;
begin
  fInCreateWnd := true;
  try
    fExpandedNodes.Count := 0;
    inherited;
  finally
    fInCreateWnd := false;
  end;

  RefreshData;

  with fExpandedNodes do
    for i := 0 to Count - 1 do
      ReReadItems(TBaseInfoNode(List[i]), true, nil);
{$ELSE}
begin
  inherited;
{$ENDIF}
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) then
    begin
      if (AComponent = fInfoSet) then
        InfoSet := nil;
      if (AComponent = fLargeImages) then
        LargeImages := nil;
      if (AComponent = fStateImages) then
        StateImages := nil;
    end;
end;

{------------------------------------------------------------------}

function  TCustomDCInfoTree.CreateNode : TBaseInfoNode;
begin
  result := TInfoNode.Create(  {$IFNDEF NEWTREE}inherited {$ENDIF}Items);
  {$IFNDEF NEWTREE}
  InitNode(result);
  {$ENDIF}
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.CMTrackError(var Message : TMessage);
begin
  if not fTracked then
    begin
      if Assigned(OnTrackError) then
        OnTrackError(self);

      fInTrackError := false;
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.TrackError;
begin
  if fInTrackError then
    exit;

  fInTrackError := true;
  PostMessage(Handle, CM_TRACKERROR, 0, 0);
end;

{------------------------------------------------------------------}

function TCustomDCInfoTree.GetDetailsRowSet : IDCRowSet;
var
  selnode : TBaseInfoNode;
begin
  selnode := Selected;
  if selnode <> nil then
    result := GetRowSet(selnode)
  else
    result := nil;
end;

{------------------------------------------------------------------}

Procedure TCustomDCInfoTree.RegisterHandler(const EventHandler : IDCEventHandler; EventTypes, UserData : DWORD);
begin
  fNotifiersHolder.RegisterHandler(EventHandler, EventTypes, UserData);
end;

{------------------------------------------------------------------}

Procedure TCustomDCInfoTree.UnregisterHandler(const EventHandler : IDCEventHandler);
begin
  fNotifiersHolder.UnRegisterHandler(EventHandler);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.SetInfoSet(val : TComponent);
begin
  if val = fInfoSet then
    exit;

  SetInfoSetProp(val, self, Self, fUnk, fRowSet);

  fEventSource := fRowSet;
  fNodeList.iBookMarks := fRowSet;

  fInfoSet := val;
  If fInfoSet<>Nil Then
  Begin
    RefreshData;
    DoMasterChange;
  End;  
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.SetOptions(val : TInfoTreeOptions);
var
  needrescan : boolean;
begin
  if val = fOptions then
    exit;

  needrescan := (itoSmartLoad in (val - Options)) or
                (((val + fOptions) - (val * fOptions)) * RescanTreeOptions <> []);

  fOptions := val;

  fLoadAll := not (itoSmartLoad in Options);

  if needrescan then
    RefreshData;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.SetInfoField(const val : string);
begin
  if val = fInfoField then
    exit;

  fInfoField := val;
  RefreshData;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.RemoveSubItems(RootItem : TBaseInfoNode);
Var
  NextNode:TBaseInfoNode;
  Node:TBaseInfoNode;
begin
  if RootItem = nil then
    (inherited Items).Clear
  else
  Begin
    NextNode:=RootItem.GetFirstChild;
    While NextNode<>Nil Do
    Begin
      Node:=NextNode.GetNextSibling;
      NextNode.Free;
      NextNode:=Node;
    End;
  End;  
end;

{------------------------------------------------------------------}

function TCustomDCInfoTree.GetIUnknown(Item : TBaseInfoNode) : IUnknown;
begin
  if Item = nil then
    result := fUnk
  else
    result := TInfoNode(Item).Row;
end;

{------------------------------------------------------------------}

function TCustomDCInfoTree.GetRowSet(Item : TBaseInfoNode) : IDCRowSet;
begin
  if Item = nil then
    result := fRowSet
  else
    with TInfoNode(Item) do
      if Row <> nil then
        Row.QueryInterface(IDCRowSet, result)
      else
        result := nil;
end;

{------------------------------------------------------------------}

function TCustomDCInfoTree.GetIDCNavigation(Item : TBaseInfoNode) : IDCNavigation;
var
  _rset : IDCRowSet;
begin
  _rset := GetRowSet(Item);
  if _rset <> nil then
    _rset.QueryInterface(IDCNavigation, result)
  else
    result := nil;
end;

{------------------------------------------------------------------}

function TCustomDCInfoTree.AddNode(RootItem : TBaseInfoNode; const Text : string) : TBaseInfoNode;
begin
  result := (inherited Items).AddChild(RootItem, Text);
end;

{------------------------------------------------------------------}

function TCustomDCInfoTree._BookMarkToNode(const BookMark : TDCBookMark) : TBaseInfoNode;
begin
  result := fNodeList.ItemByKey(@BookMark);
end;

{------------------------------------------------------------------}

function TCustomDCInfoTree.BookMarkToNode(ParentNode : TBaseInfoNode; const BookMark : TDCBookMark) : TBaseInfoNode;
var
  nodelist : TSortedNodeList;
begin
  if ParentNode = nil then
    nodelist := fNodeList
  else
    nodelist := TInfoNode(ParentNode).fNodeList_;

  if nodelist <> nil then
    result := NodeList.ItemByKey(@BookMark)
  else
    result := nil;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.FreeNode(node : TBaseInfoNode);
begin
  try
    inc(fFreeNodeCount);
    node.Free;
  finally
    dec(fFreeNodeCount);
  end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.DoMasterChange;
begin
  inc(GlobalUpdateCount);
  try
    if fIgnoreMasterChange = 0 then
      NotifyDetails(self, fNotifiersHolder);
  finally
    dec(GlobalUpdateCount);
  end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.RowDeleted(node : TInfoNode);
begin
  if node = nil then
    exit;

  inc(fInUpdate);
  try
    FreeNode(node);
  finally
    dec(fInUpdate);
  end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.UpdateSelection;
var
  selnode : TBaseInfoNode;
begin
  if fNeedSelect = nil then
    exit;

  if (fNeedSelect <> Selected) then
    begin
      if IsEditing then
        TreeView_EndEditLabelNow(Handle, true);

      Selected := fNeedSelect;
      selnode := Selected;
      if selnode <> nil then
      {$IFDEF NEWTREE}
      selnode.MakeVisible;
      {$ELSE}
      MakeVisible(selnode);
      {$ENDIF}
      DoMasterChange;
      fLastSelectedNode := selnode;
    end;

  fNeedSelect := nil;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.TimedSelection(Sender : TObject);
begin
  fTimer.Enabled := false;
  UpdateSelection;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.DelayedSelect(node : TBaseInfoNode);
begin
  fNeedSelect := node;
  fTimer.Enabled := true;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.RowChanged(node : TInfoNode);
begin
  if (node <> nil) and (itoTrackRow in Options) then
    DelayedSelect(node);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.RereadNode(node : TInfoNode; ReadText : boolean);
var
  i : integer;
begin
  if node <> nil then
    with node do
      begin
        if Field = nil then
          exit;

//        Text := VariantToString(Field.GetValue);
        if ReadText then
          Text := GetFieldStringValue(Field);

        try
          i := -1;
          if ImageField <> nil then
            i := GetIntValue(ImageField);

          {$IFNDEF NEWTREE}
          if ImageIndex <> i then
          {$ENDIF}
            ImageIndex := i;

          {$IFNDEF NEWTREE}
          if SelectedIndex <> i then
          {$ENDIF}
            SelectedIndex := i;

          i := -1;
          if StateImageField <> nil then
            i := GetIntValue(StateImageField);

          {$IFNDEF NEWTREE}
          if StateIndex <> i then
          {$ENDIF}
            StateIndex := i;
        except
          Error(SErrInvalidFieldType);
        end;

        if Assigned(OnGetNodeParams) then
          OnGetNodeParams(self, node, GetRowSet(node.Parent));
      end;
end;

{------------------------------------------------------------------}

function Method(Code, Data : pointer) : TMethod;
begin
  result.Code := Code;
  result.Data := Data;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.RowInserted(const iRowSet : IDCRowSet; ParentNode : TBaseInfoNode);
var
  node      : TBaseInfoNode;
  iBookMark : IDCBookMark;
  m         : TMethod;
  iRow      : IUnknown;
begin
  iRowSet.QueryInterface(IDCBookMark, iBookMark);

  if BookMarkToNode(ParentNode, iBookMark.GetBookMark) <> nil then
    exit;

  iRow := GetRowSet(ParentNode).GetRow;
  
  if not CheckFolder(iRow) then
    exit;

  if ParentNode = nil then
    m := Method(Addr(TCustomDCInfoTree._BookMarkToNode), self)
  else
    m := Method(Addr(TInfoNode._BookMarkToNode), ParentNode);

  node := GetInsertedItem(iRowSet, iBookMark, m);

  if node <> nil then
    node := (inherited Items).Insert(node, '')
  else
    node := (inherited Items).AddChild(ParentNode, '');

  ChangeNode2(TInfoNode(node), iBookMark, iRow);
  RereadNode(TInfoNode(node), true);
  RereadItems(node, false, nil);
  fLastInsertedNode := node;

  if (ParentNode <> nil) and not TInfoNode(ParentNode).Loaded then
    begin
      fInsertedBookMark := TInfoNode(node).BookMark;
      fSelectInsert := true;
    end;

  DelayedSelect(node);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.RecordChanged(RootItem : TBaseInfoNode);
var
  node : TBaseInfoNode;
begin
  node := BookMarkToNode(RootItem, fOldBookMark);
  if node <> nil then
    begin
      TInfoNode(node).BookMark := GetIBookMark(node.Parent).BookMark;
      ReReadItems(node, false, nil);
      if node = Selected then
        DoMasterChange;
    end;
end;

{------------------------------------------------------------------}
{
function TCustomDCInfoTree.GetRowChangedNode(const EventSource : IUnknown; const EventData : Variant) : TInfoNode;
var
  iRow     : IUnknown;
  BookMark : TDCBookMark;
  node     : TInfoNode;
  index    : integer;
begin
  iRow := EventSource as IDCRowSet;

  if NodeListByRow.Find(pointer(iRow), index) then
    begin
      result := TInfoNode(NodeListByRow[index]);
    end;

  while GetParentNode(iRow, iRow, BookMark) do
    begin
      if not NodeListByRow.Find(pointer(iRow), index) then
        break;

      result := TInfoNode(NodeListByRow[index]);
    end;

  result := nil;
end;
}
{------------------------------------------------------------------}

Const
  EventsWithBookMark = evRowChanged + evRowDeleted + evRecordChanged +
                       evEditStarted + evFieldsChanged;


function TCustomDCInfoTree.GetEventNode(RootItem : TBaseInfoNode; const EventSource : IUnknown; EventType : Integer; const EventData : Variant) : TInfoNode;
var
  iBookMark : IDCBookMark;
  iParentBookMarkEx : IDCBookMarkEx;
  selnode   : TBaseInfoNode;
begin
  if EventType = evFieldChanged then
    result := TInfoNode(BookMarkToNode(RootItem, (EventSource as IDCBookMark).GetBookMark))
  else if EventType and EventsWithBookMark <> 0 then
    begin
      result := TInfoNode(BookMarkToNode(RootItem, EventData));

      if (EventType = evRowChanged) then
        if result = nil then
          begin
            selnode := Selected;
            if selnode <> nil then
              begin
                iBookMark := GetIBookMark(RootItem);
                if iBookMark.QueryInterface(IDCBookMarkEx, iParentBookMarkEx) = S_OK then
                  with iParentBookMarkEx do
                    if CompareBookMarks(TInfoNode(selnode).BookMark, EventData) = 0 then
                      exit;
              end;
            TrackError;
          end
        else
          fTracked := true;
{
      if (result = nil) and (EventType = evRowChanged) then
        result := GetRowChangedNode(EventSource, EventData);
}
    end
  else
    result := nil;
end;

{------------------------------------------------------------------}

function IsVarEqualToString(const v : Variant; const s : string) : boolean;
begin
  result := v = s;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.HandleEvent(const EventRec:PEventRec);
var
  node     : TInfoNode;
  i        : integer;
  RootItem : TBaseInfoNode;
begin
  if GlobalUpdateCount > 0 then
    exit;

  inc(fIgnoreImages);
  try
    with EventRec^ do
      begin
        if (EventType = evRowChanged) and (not (itoTrackRow in Options) or (fIgnoreRowChange > 0))  then
          exit;

        if (fInUpdate = 0) and not (csDestroying in ComponentState) and
           ((fInDelete = 0) or (EventType = evRowDeleted)) then
          begin
            RootItem:=TBaseInfoNode(UserData);
            node := GetEventNode(RootItem, IUnknown(EventSource), EventType, EventData^);

            case EventType of
              evActiveChanged : begin
                                  if IsEditing then
                                    TreeView_EndEditLabelNow(Handle, true);

                                  CancelEdit;
                                  ReReadItems(RootItem, (RootItem = nil) or TInfoNode(RootItem).Loaded, nil);

                                  if (RootItem = nil) and (Items.Count > 0) and (Selected = nil) then
                                    DelayedSelect(Items[0]);
                                end;

              evFieldListChange : ;

              evRowChanged    : RowChanged(node);

              evFieldChanged  : ReReadNode(node, true);

              evRowDeleted    : RowDeleted(node);

              evRowInserted   : begin
                                  fDataEditedNodes.Count := 0;

                                  if not IsVarEqualToString(EventData^, NullBookMark) then
                                    RowInserted(IUnknown(EventSource) as IDCRowSet, RootItem)
                                  else
                                    ReReadItems(RootItem, false, nil);
                                end;

              evRecordChanged : begin
                                  RecordChanged(RootItem);
                                  fDataEditedNodes.Count := 0;
                                end;

              evEditStarted   : if node <> nil then
                                  begin
                                    if fDataEditedNodes.IndexOf(node) < 0 then
                                      fDataEditedNodes.Add(node);

                                    fOldBookMark := EventData^;
                                  end
                                else
                                  fOldBookMark := NullBookMark;

              evEditCanceled  : begin
                                  TreeView_EndEditLabelNow(Handle, true);

                                  with fDataEditedNodes do
                                    begin
                                      for i := 0 to Count - 1 do
                                        ReReadNode(TInfoNode(fDataEditedNodes.List[i]), true);

                                      Count := 0;
                                    end;
                                end;

              evBeforePost    : begin
                                  fIgnoreNodeChange := true;
                                  try
                                    TreeView_EndEditLabelNow(Handle, false);
                                  finally
                                    fIgnoreNodeChange := false;
                                  end;
                                end;

              evFieldsChanged : begin
                                  ReReadNode(node, true);
                                  ReReadItems(node, false, nil);
                                end;
            end;
          end;
      end;
   finally
     dec(fIgnoreImages);
   end;
end;

{------------------------------------------------------------------}

function TCustomDCInfoTree.GetDisplayName(node : TBaseInfoNode) : string;
begin
  if node = nil then
    result := fDisplayName
  else
    result := TInfoNode(node).DisplayField;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.ChangeNode2(node : TInfoNode; const iBookMark : IDCBookMark;
                                      const iRow : IUnknown);
var
  iProps      : IDCProperties;
  iField2     : IDCProperty;
begin
  iRow.QueryInterface(IDCProperties, iProps);

  iField2 := DCPropByName(iProps, GetDisplayName(node.Parent));
  if iField2 <> nil then
    ChangeNode(node, iBookMark, iField2, iRow);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.ChangeNodeImages(node : TInfoNode; const iRow : IUnknown);
var
  iProps      : IDCProperties;
begin
  iRow.QueryInterface(IDCProperties, iProps);
  GetDCPropByName(iProps, self.ImageField, node.fImageField);
  GetDCPropByName(iProps, self.StateImageField, node.fStateImageField);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.ChangeNode(node : TInfoNode; const iBookMark : IDCBookMark;
                                      const iField : IDCProperty; const iRow : IUnknown);
begin
  with node do
    begin
      Text := GetFieldStringValue(iField);
//      OutputDebugString(Pchar(Text));
      BookMark := iBookMark.GetBookMark;

      if Row <> iRow then
        begin
          RemoveHandler(Row);
          AddHandler(iRow, DWORD(node));
        end;

      if (self.ImageField <> '') or (self.StateImageField <> '') then
        ChangeNodeImages(node, iRow);

      Row := iRow;
      Field := iField;
    end;
end;

{------------------------------------------------------------------}

function TCustomDCInfoTree.ObtainDisplayName(const iDisplayField : IDCDisplayField) : string;
begin
  if (iDisplayField <> nil) then
    result := iDisplayField.DisplayFieldName
  else
    result := InfoField;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.GetRowSetAndBookMark(Item : TBaseInfoNode; var iRowSet : IDCRowSet; var iBookMark : IDCBookMark);
begin
  if Item = nil then
    iRowSet := fRowSet
  else
    with TInfoNode(Item) do
      if Row <> nil then
        Row.QueryInterface(IDCRowSet, iRowSet)
      else
        iRowSet := nil;

  if iRowSet <> nil then
    iRowSet.QueryInterface(IDCBookMark, iBookMark)
  else
    iBookMark := nil;  
end;

{------------------------------------------------------------------}

function TCustomDCInfoTree.CheckFolder(const Folder : IUnknown) : boolean;
begin
  result := (Folder <> nil) and (not (itoOnlyFolders in Options) or IsRowSetFolder(Folder));
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.ClearNodeList(RootItem : TBaseInfoNode);
var
  nodelist : TSortedNodeList;
begin
  nodelist := GetNodeList_(self, RootItem);
  if nodelist <> nil then
    nodelist.Clear;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.ClearLevel(RootItem : TBaseInfoNode);
begin
  if RootItem <> nil then
    RootItem.HasChildren := false;

  ClearNodeList(RootItem);
  RemoveSubItems(RootItem);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.RemoveExtraNodes(node : TBaseInfoNode);
var
  _node : TBaseInfoNode;
begin
  while node <> nil do
    begin
      _node := node.GetNextSibling;
      FreeNode(node);
      node := _node;
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.ActivateLevel(node : TBaseInfoNode);
begin
  if Assigned(OnActivateLevel) then
    try
      _DisableEvents;
      inc(fInUpdate);
      OnActivateLevel(self, node);
    finally
      _EnableEvents;
      dec(fInUpdate);
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.LoadNode(RootItem : TInfoNode; var node : TInfoNode;
                                     const iBookMark : IDCBookMark;
                                     const iField : IDCProperty; const iRow : IUnknown);
begin
  if node = nil then
    node := TInfoNode(AddNode(RootItem, ''))
  else
    {$IFNDEF NEWTREE}self.InitNode(node){$ENDIF};

  ChangeNode(node, iBookMark, iField, iRow);
  RereadNode(node, false);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.ReReadItems(RootItem : TBaseInfoNode; ForceLoad : boolean; NodeToReread : TBaseInfoNode);
var
  node        : TInfoNode;
  IsLoaded    : boolean;
  iNavigation : IDCNavigation;
  iDisplayField : IDCDisplayField;
  iRowSet           : IDCRowSet;
  iProps            : IDCProperties;
  emptynode         : boolean;
  fLevelNodes       : TList;
  DisplayName       : string;
  ParentBookList    : TStrings;
  iBookMark         : IDCBookMark;
  iBookMarkEx       : IDCBookMarkEx;
  fSaveSelBookMark  : TDCBookMark;
  fNeedRestoreSel   : boolean;
  {-----------------------------------}

  procedure InitNode;
  begin
    if RootItem = nil then
      begin
        node := TInfoNode(Items.GetFirstNode);
        IsLoaded := true;
      end
    else
      begin
        node := TInfoNode(RootItem.GetFirstChild);
        IsLoaded := TInfoNode(RootItem).Loaded;
      end;

    DisplayName := ObtainDisplayName(iDisplayField);

    if RootItem = nil then
      fDisplayName := DisplayName
    else
      TInfoNode(RootItem).DisplayField := DisplayName;
  end;

  {-----------------------------------}

  procedure StartParentUpdates(Item : TBaseInfoNode);
  var
    iParentRowset : IDCRowSet;
    iParentBookMark : IDCBookMark;
    iParentBookMarkEx : IDCBookMarkEx;
  begin
    if Item <> nil then
      begin
        GetRowSetAndBookMark(Item.Parent, iParentRowset, iParentBookMark);
        if not RowsetConnected(iParentRowset) then
          exit;

        if IsPassThrough(TInfoNode(Item).Row) or not BookMarkValid(iParentBookMark, TInfoNode(Item).BookMark) then
          StartParentUpdates(Item.Parent);

        ParentBookList.Add(StartUpdates(iParentRowSet, iParentBookMark));

//        if not BookMarkValid(iParentBookMark, TInfoNode(Item).BookMark) then
          ActivateLevel(Item.Parent);

        if iParentBookMark.QueryInterface(IDCBookMarkEx, iParentBookMarkEx) = S_OK then
          with iParentBookMarkEx do
            if CompareBookMarks(TInfoNode(Item).BookMark, GetBookMark) = 0 then
              exit;

        SafeGotoBookMark(iParentBookMark, TInfoNode(Item).BookMark);
      end;
  end;

  {-----------------------------------}

  procedure FinishParentUpdates(Item : TBaseInfoNode);
  var
    iParentRowset : IDCRowSet;
    iParentBookMark : IDCBookMark;
    pcount          : integer;
  begin
    if Item <> nil then
      begin
        pcount := ParentBookList.Count - 1;
        if pcount >= 0 then
          begin
            GetRowSetAndBookMark(Item.Parent, iParentRowset, iParentBookMark);
//            FinishSafeUpdates(iParentRowSet, iParentBookMark, ParentBookList[pcount]);
            FinishUpdates(iParentRowSet, iParentBookMark, ParentBookList.Strings[pcount]);
            ParentBookList.Delete(pcount);
          end;
        FinishParentUpdates(Item.Parent);
      end;
  end;

  {-----------------------------------}

  procedure LoadLevel;
  var
    iField      : IDCProperty;
    iRow        : IUnknown;
  begin
    with iNavigation do
      try
        ClearNodeList(RootItem);
        BeginNodelistUpdate(self, TInfoNode(RootItem));
        try
          while not GetEOF do
            begin
              DisplayName := ObtainDisplayName(iDisplayField);
              iRow := iRowSet.GetRow;
              iRow.QueryInterface(IDCProperties, iProps);
              iField := DCPropByName(iProps, DisplayName);

              if iField <> nil then
                begin
                  LoadNode(TInfoNode(RootItem), node, iBookMark, iField, iRow);

                  if fNeedRestoreSel then
                    if iBookMarkEx.CompareBookMarks(fSaveSelBookMark, node.BookMark) = 0 then
                      begin
                        Selected := node;
                        fNeedRestoreSel := false;
                      end;

                  fLevelNodes.Add(node);

                  emptynode := false;

                  if not (IsLoaded or ForceLoad) then
                    break;

                  node := TInfoNode(node.GetNextSibling);
                end;

              Next;
            end;
        finally
          EndNodelistUpdate(self, TInfoNode(RootItem));
        end;
      except
        ClearLevel(RootItem);
        fLevelNodes.Clear;
        raise
      end;
  end;

  {-----------------------------------}

  procedure FinishLevelLoading;
  begin
    if RootItem <> nil then
      with TInfoNode(RootItem) do
        Loaded := Loaded or ForceLoad;

    if emptynode or (RootItem = nil) or TInfoNode(RootItem).Loaded then
      RemoveExtraNodes(node);

    if emptynode and (RootItem <> nil) then
      RootItem.HasChildren := false;
  end;

  {-----------------------------------}

var
  fSaveBookMark  : TDCBookMark;
  i              : integer;
  callupdateevent : boolean;
  readchild       : boolean;
begin
  ForceLoad := ForceLoad or fLoadAll;
  inc(fInUpdate);
  callupdateevent := false;
  inc(GlobalUpdateCount);

  try
    iRowSet := GetRowSet(RootItem);

    if not CheckFolder(iRowSet) then
      begin
        ClearLevel(RootItem);
        exit;
      end;

    ParentBookList := TStringList.Create;
{    if iRowSet.QueryInterface(IDCRowSetEmpty2, iRowSetEmpty2) = S_OK then
      if iRowSetEmpty2.IsEmpty2 then
        begin
          ClearLevel(RootItem);
          exit;
        end;}

    try
      if RootItem <> nil then
        StartParentUpdates(RootItem);

      callupdateevent := fInUpdate = 1;

      if Assigned(OnStartLoading) and callupdateevent then
        OnStartLoading(self);

      ActivateLevel(RootItem);

      if not RowSetConnected(iRowSet) then
        begin
          ClearLevel(RootItem);
          exit;
        end;

      if IsRowSetEmpty(iRowSet) then
        begin
          ClearLevel(RootItem);
          exit;
        end;

      GetIUnknown(RootItem).QueryInterface(IDCDisplayField, iDisplayField);

      iRowSet.QueryInterface(IDCBookMark, iBookMark);
      iRowSet.QueryInterface(IDCNavigation, iNavigation);
      iBookMark.QueryInterface(IDCBookMarkEx, iBookMarkEx);

      fNeedRestoreSel := false;
      if (iBookMarkEx <> nil) and (Selected <> nil) and (Selected.Parent = RootItem) then
        begin
          fSaveSelBookMark := TInfoNode(Selected).BookMark;
          fNeedRestoreSel := true;
        end;

      InitNode;

      if not (IsLoaded or ForceLoad) then
        begin
          RootItem.HasChildren := true;
          exit;
        end;

      emptynode := true;

      fLevelNodes := TList.Create;

      {$IFDEF NEWTREE}
      Items.BeginUpdate;
      try
      {$ENDIF}
        try
          if not StartSafeFilterUpdates(iRowSet, iBookMark, fSaveBookMark) then
            iNavigation.First;

          LoadLevel;

        finally
          FinishSafeFilterUpdates(iRowSet, iBookMark, fSaveBookMark);

          with fLevelNodes do
            begin
              readchild := fLoadAll or (itoCheckChilds in Options);
              for i := 0 to Count - 1 do
                begin
                  if (NodeToReread = nil) or (NodeToReread = List[i]) then
                    begin
                      if readchild then
                        ReReadItems(List[i], false, nil)
                      else
                        TBaseInfoNode(List[i]).HasChildren := true;
                    end;

                  if Assigned(OnNodeLoaded) then
                    OnNodeLoaded(self, TBaseInfoNode(List[i]));
                end;

              Free;
            end;
        end;

        FinishLevelLoading;
      {$IFDEF NEWTREE}
      finally
        Items.EndUpdate;
      end;
      {$ENDIF}
    finally
      FinishParentUpdates(RootItem);
      ParentBookList.Free;

      if Assigned(OnEndLoading) and callupdateevent then
        OnEndLoading(self);
    end;
  finally
    dec(fInUpdate);
    dec(GlobalUpdateCount);
  end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.RescanItems(RootItem : TBaseInfoNode);
begin
  ReReadItems(RootItem, true, nil);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.RescanNodeWithChildren(Item : TBaseInfoNode);
begin
  if Item <> nil then
    ReReadItems(Item.Parent, true, Item);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.RefreshData;
begin
  if (fRowSet = nil){ or (InfoField = '') }then
    (inherited Items).Clear
  else
    begin
      GetImages(fRowSet);
      ReScanItems(nil);
    end;
end;

{------------------------------------------------------------------}

function TCustomDCInfoTree.GetIBookMark(Item : TBaseInfoNode) : IDCBookMark;
var
  _rset : IDCRowSet;
begin
  _rset := GetRowSet(Item);
  if _rset <> nil then
    _rset.QueryInterface(IDCBookMark, result)
  else
    result := nil;
end;

{------------------------------------------------------------------}

function TCustomDCInfoTree.GetIRowChange(Item : TBaseInfoNode) : IDCRowChange;
begin
  result := GetIDCRowChange(GetIUnknown(Item));
end;

{------------------------------------------------------------------}

function TCustomDCInfoTree.LocateNode(AItem : TBaseInfoNode; DoNotifyDetails : boolean) : boolean;
var
  iBookMark : IDCBookMark;
  iRowSet   : IDCRowSet;
  iBookMarkEx : IDCBookMarkEx;
  pnode       : TBaseInfoNode;

  {-----------------------------------}

  procedure CheckValid;
  begin
    result := BookMarkValid(iBookMark, TInfoNode(AItem).BookMark);
  end;

  {-----------------------------------}

begin
  result := AItem <> nil;

  if result then
    with TInfoNode(AItem) do
      begin
        fTimer.Enabled := false;
        pnode := Parent;
        GetRowSetAndBookMark(pnode, iRowSet, iBookMark);
        result := iBookMark <> nil;

        if result then
          begin
            if iBookMark.QueryInterface(IDCBookMarkEx, iBookMarkEx) = S_OK then
              with iBookMarkEx do
                if CompareBookMarks(TInfoNode(AItem).BookMark, GetBookMark) = 0 then
                  exit;

            try
              inc(fIgnoreRowChange);

              CheckValid;

              if not result or (itoLocateParent in Options) then
                begin
                  LocateNode(pnode, false);

                  CheckValid;
                  if not result or (itoLocateParent in Options) then
                    begin
                      ActivateLevel(pnode);

                      CheckValid;

                      if not result then
                        exit;
                    end;
                end;

              iBookMark.GotoBookmark(BookMark);

              if DoNotifyDetails then
                DoMasterChange;
            finally
              dec(fIgnoreRowChange);
            end;
          end;
      end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.SetToNodeAndSelect(Item : TBaseInfoNode);
begin
  if SetToNode(Item) then
    Selected := Item;
end;

{------------------------------------------------------------------}

function TCustomDCInfoTree.SetToNode(Item : TBaseInfoNode) : boolean;
begin
  result := LocateNode(Item, true);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.NodeChanged(AItem : TInfoNode; const NewText : string);
var
  processed : boolean;
begin
  if (AItem <> nil) and (fRowChange <> nil) then
    try
      inc(fIgnoreRowChange);
      try
        processed := false;
        if Assigned(fOnInfoFieldSet) then
          fOnInfoFieldSet(self, AItem, AItem.Field.Name, NewText, processed);

        if not processed then
          AItem.Field.SetValue(NewText);

        if not fIgnoreNodeChange then
          begin
            processed := false;

            if Assigned(OnInfoUpdate) then
              OnInfoUpdate(self, AItem, processed);

            if not processed then
              fRowChange.Post;
          end;

      except
        processed := false;
        if Assigned(OnInfoCancelEdit) then
          OnInfoCancelEdit(self, AItem, processed);

        if not processed then
          fRowChange.Cancel;
          
        ReReadNode(AItem, true);
        raise;
      end;
    finally
      fRowChange := nil;
      dec(fIgnoreRowChange);
    end;
end;

{------------------------------------------------------------------}

function TCustomDCInfoTree.CanEdit(Item : TBaseInfoNode) : boolean;
Var
  iCanRowChange:IDCCanRowChange;
  processed : boolean;                     
begin
  Result:=Inherited CanEdit(Item);
  If Not Result Then
    Exit;
  fRowChange := GetIRowChange(Item.Parent);

  FlushDelayedSelection;

  result := (fRowChange <> nil) and SetToNode(Item);

  if Result then
    begin
      fRowChange.QueryInterface(IDCCanRowChange, iCanRowChange);
      if iCanRowChange <> nil then
        Result:=iCanRowChange.CanEdit;
    end;

  if result then
    begin
      result := atCanWrite in TInfoNode(Item).Field.Attributes;
      if result then
        begin
          processed := false;
          if Assigned(OnInfoStartEdit) then
            OnInfoStartEdit(self, Item, processed);

          if not processed then
            fRowChange.Edit;

          fEditedNode := Item;
        end;
    end;

  if not result then
    fRowChange := nil;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.CancelEdit;
var
  processed : boolean;
begin
  if fRowChange <> nil then
    try
      inc(fIgnoreRowChange);
      processed := false;
      if Assigned(OnInfoCancelEdit) then
        OnInfoCancelEdit(self, fEditedNode, processed);

      if not processed then
        fRowChange.Cancel;
      fRowChange := nil;
    finally
      dec(fIgnoreRowChange);
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.SelectionChanged;
var
  sel : TBaseInfoNode;
begin
  if (fInUpdate = 0) then
    begin
      sel := Selected;
      if sel <> fLastSelectedNode then
        begin
          try
            LocateNode(sel, false);
            DoMasterChange;
          except
            Selected := fLastSelectedNode;
            raise;
          end;

          fLastSelectedNode := sel;
        end;
    end;

  inherited;
end;

{------------------------------------------------------------------}

Procedure TCustomDCInfoTree.DoExpandNode(Node:TBaseInfoNode);
var
  newsel : TBaseInfoNode;
Begin
  if not TInfoNode(node).Loaded then
   if fInCreateWnd then
     fExpandedNodes.Add(node)
   else
     begin
       ReReadItems(node, true, nil);
       if fSelectInsert then
         begin
           fSelectInsert := false;
           newsel := TInfoNode(node)._BookMarkToNode(fInsertedBookMark);
           if newsel <> nil then
             begin
               fTimer.Enabled := false;
               Selected := newsel;
             end;
         end;
     end;
End;

{------------------------------------------------------------------}

{$IFDEF NEWTREE}
Procedure TCustomDCInfoTree.Edit(Node:TBaseInfoNode;Var NewText:String);
Begin
//  Inherited;
  NodeChanged(TInfoNode(Node),NewText);
End;
{$ENDIF}
{------------------------------------------------------------------}

{$IFNDEF NEWTREE}
procedure TCustomDCInfoTree.CNNotify(var Message: TWMNotify);
var
  node : TBaseInfoNode;

  {-------------------------------}

  procedure _getnode;
  begin
    with Message, NMHdr^, PTVDispInfo(Pointer(NMHdr))^ do
      if (code = TVN_ENDLABELEDIT) or (code = TVN_BEGINLABELEDIT) then
        node := GetDrawNodeFromItem(item)
      else if code = TVN_ITEMEXPANDING then
        node := GetDrawNodeFromItem(PNMTreeView(Pointer(NMHdr))^.itemnew)
      else
        node := nil;
  end;

  {-------------------------------}
begin

//  if not fInCreateWnd then
    begin
      _getnode;
      with Message, NMHdr^, PTVDispInfo(Pointer(NMHdr))^ do
        case code of
          TVN_ENDLABELEDIT : begin
                              inherited;

                              if item.pszText <> nil then
                                NodeChanged(TInfoNode(node), item.pszText)
                              else
                                CancelEdit;

                              fEditedNode := nil;

                              exit;
                            end;

          TVN_ITEMEXPANDING : with PNMTreeView(Pointer(NMHdr))^ do
                                if ((Action and TVE_EXPAND) <> 0) then
                                  DoExpandNode(Node);
        end;
    end;

  inherited;
end;
{$ENDIF}

{------------------------------------------------------------------}

procedure TCustomDCInfoTree.GetImages(const iRowSet : IDCRowSet);

  procedure SetImages(Images, State : TCustomImageList);
  begin
    inherited Images := TImageList(Images);
    inherited StateImages := TImageList(State);
  end;

  {--------------------------------------------}

var
  iImages : IDCImages;
begin
  if UseInfoImages and (iRowSet.QueryInterface(IDCImages, iImages) = S_OK) then
    with iImages do
      SetImages(GetSmallImages, GetStateImages)
  else
    SetImages(Images, StateImages);
end;

{******************************************************************}

constructor TCustomDCInfoListView.Create(AOwner : TComponent);
begin
  inherited;

  _Fields   := TInterfaceList.Create;
  fItems    := TDCInfoListItems.Create(self);
  fItemList := TSortedItemList.Create;

  fComObject := TEventHandleComObject.Create(HandleEvent);
  VCLComObject := pointer(fComObject);

  fNotifiersHolder := TNotifiersHolder.Create;

  fDataFields  := TStringList.Create;
  fFields := TStringList.Create;
  TStringList(fFields).OnChange := FieldsChanged;
  fOptions := DefaultListOptions;
end;

{------------------------------------------------------------------}

destructor  TCustomDCInfoListView.Destroy;
begin
  MasterControl := nil;
  UnRegisterEventsHandler(fEventSource, fComObject);
  Destroying;
  fItems.Free;
  FreeObject(fItemList,fItemList);
  fDataFields.Free;
  fFields.Free;
  _Fields.Free;
//  fColumns.Free;

  inherited;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.SetInfoSet(val : TComponent);
begin
  if val = fInfoSet then
    exit;

  SetInfoSetProp(val, self, fComObject, fUnk, fRowSet);
  UnRegisterEventsHandler(fEventSource, fComObject);
  fEventSource := fRowSet;
  fItemList.iBookMarks := fRowSet;

  fInfoSet := val;
  RefreshData;
end;

{------------------------------------------------------------------}

function TCustomDCInfoListView.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    result := S_OK
  else
    result := inherited QueryInterface(IID, Obj);
end;

{------------------------------------------------------------------}

function TCustomDCInfoListView.GetDetailsRowSet : IDCRowSet;
var
  selitem : TListItem;
begin
  selitem := Selected;
  result := nil;

  if selitem <> nil then
    result := TInfoListItem(selitem).fRow as IDCRowSet
  else
    result := GetRootRowSet;
end;

{------------------------------------------------------------------}

Procedure TCustomDCInfoListView.RegisterHandler(const EventHandler : IDCEventHandler; EventTypes, UserData : DWORD);
begin
  fNotifiersHolder.RegisterHandler(EventHandler, EventTypes, UserData);
end;

{------------------------------------------------------------------}

Procedure TCustomDCInfoListView.UnregisterHandler(const EventHandler : IDCEventHandler);
begin
  fNotifiersHolder.UnRegisterHandler(EventHandler);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.GetFieldList(const iRowSet : IDCRowSet);
var
  iProps : IDCColumns;
begin
  if RowSetConnected(iRowSet) then
    iProps := iRowSet.GetFields
  else
    iProps := nil;

  PropsToStrings(iProps, fDataFields);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.FieldsChanged(Sender : TObject);
begin
  RefreshData;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.SetImageField(const val : string);
var
  fOldImageField : string;
begin
  if val <> fImageField then
    begin
      fOldImageField := fImageField;
      fImageField := val;
      try
        RefreshData;
      except
        fImageField := fOldImageField;
        raise;
      end;
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.SetStateImageField(const val : string);
var
  fOldStateImageField : string;
begin
  if val <> fStateImageField then
    begin
      fOldStateImageField := fStateImageField;
      fStateImageField := val;
      try
        RefreshData;
      except
        fStateImageField := fOldStateImageField;
        raise;
      end;
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.SetCheckField(const val : string);
begin
  if fCheckField <> val then
    begin
      fCheckField := val;
      RefreshData;
    end;
end;

{------------------------------------------------------------------}

procedure SetMasterControlProp(MasterControl, InfoControl : TComponent; const fComObject : IDCEventHandler;
                     var iUnk : IUnknown; var iMasterInfoset : IDCMasterInfoset);
var
  _unk : IUnknown;
  _master : IDCMasterInfoset;
begin
  if iMasterInfoset <> nil then
    iMasterInfoset.UnRegisterHandler(fComObject);

  if MasterControl <> nil then
    begin
      if not MasterControl.GetInterface(IUnknown, _Unk) then
        Error(SIUnknownNotSupported);

      if _Unk.QueryInterface(IDCMasterInfoSet, _master) <> S_OK then
        Error(SIDCMasterInfoSetNotSupported);

      MasterControl.FreeNotification(InfoControl);

      if _master <> nil then
        _master.RegisterHandler(fComObject, evAll, 0);

      iUnk := _unk;
      iMasterInfoSet := _master;
    end
  else
    begin
      if iMasterInfoSet <> nil then
        iMasterInfoSet.UnRegisterHandler(fComObject);
      iUnk := nil;
      iMasterInfoSet := nil;
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.SetMasterControl(val : TComponent);
begin
  if val = fMasterControl then
    exit;

  SetMasterControlProp(val, self, fComObject, fMaster, fMasterInfoSet);
  fMasterControl := val;
  MasterChanged;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.MasterChanged;
begin
  if fMasterInfoSet <> nil then
    Root := fMasterInfoSet.GetDetailsRowSet   
  else
    Root := nil;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.SetRoot(const ARoot : IDCRowSet);
begin
  fRoot := ARoot;
  RefreshData;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.SetFields(val : TStrings);
begin
  fFields.Assign(val);
end;

{------------------------------------------------------------------}

function TCustomDCInfoListView.GetRootRowSet : IDCRowSet;
begin
  if (fRoot <> nil) then
    result := fRoot
  else
    result := fRowSet;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.ReReadItem(Item : TListItem);
var
  fcount : integer;

  {-----------------------------------}

  procedure ReadFields;
  var
    i : integer;
    ftext : string;
  begin
    with TInfoListItem(Item) do
      begin
        if fcount = 0 then
          Caption := ''
        else
          for i := 0 to fcount - 1 do
            begin
              ftext := GetFieldStringValue(Fields[i]);

              if i = 0 then
                Caption := ftext
              else if i <= SubItems.Count then
                SubItems[i - 1] := fText
              else
                SubItems.Add(ftext);
            end;

        for i := SubItems.Count - 1 downto fcount do
          SubItems.Delete(i);
      end;
  end;

  {-----------------------------------}

  procedure ReadImages;
  var
    i : integer;
  begin
    with TInfoListItem(Item) do
      try
        i := GetIntValue(ImageField);

        if ImageIndex <> i then
          ImageIndex := i;

        i := GetIntValue(StateImageField);

        if StateIndex <> i then
          StateIndex := i;

      except
        Error(SErrInvalidFieldType);
      end;
  end;

  {-----------------------------------}

begin
  inc(fInReading);

  with TInfoListItem(Item) do
    try
      fcount := FieldCount;
//      SubItems.Clear;

      ReadFields;

      if CheckBoxes and (CheckField <> nil) then
        item.Checked := VariantToBoolean(CheckField.GetValue);

      ReadImages;

      if Assigned(OnGetItemParams) then
        OnGetItemParams(self, TInfoListItem(item), GetRootRowSet);

    finally
      dec(fInReading);
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView._SetImages(Large, Small, State : TCustomImageList);
begin
  if inherited LargeImages <> TImageList(Large) then
    inherited LargeImages := TImageList(Large);

  if inherited SmallImages <> TImageList(Small) then
    inherited SmallImages := TImageList(Small);

  if inherited StateImages <> TImageList(State) then
    inherited StateImages := TImageList(State);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.GetImages(const iRowSet : IDCRowSet);
var
  iImages : IDCImages;
begin
  if UseInfoImages and (iRowSet.QueryInterface(IDCImages, iImages) = S_OK) then
    with iImages do
      _SetImages(GetLargeImages, GetSmallImages, GetStateImages)
  else
    _SetImages(LargeImages, SmallImages, StateImages);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.AddHandler(const EventsSource : IUnknown; UserData : DWORD);
var
  ptEvents  : DWORD;
  iSource   : IUnknown;
begin
  SplitEvents(EventsSource, ptEvents, iSource);

  if ptEvents <> 0 then
    begin
      RegisterEventsHandler(EventsSource, fComObject, evAll and not ptEvents, UserData);
      RegisterEventsHandler(iSource, fComObject, ptEvents, UserData);
    end
  else
    RegisterEventsHandler(EventsSource, fComObject, evAll, UserData);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.RemoveHandler(const EventsSource : IUnknown);
var
  ptEvents  : DWORD;
  iSource   : IUnknown;
begin
  SplitEvents(EventsSource, ptEvents, iSource);

  if ptEvents <> 0 then
    begin
      UnRegisterEventsHandler(EventsSource, fComObject);
      UnRegisterEventsHandler(iSource, fComObject);
    end
  else
    UnRegisterEventsHandler(EventsSource, fComObject);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.SetUseInfoImages(val : boolean);
begin
  if val <> fUseInfoImages then
    begin
      fUseInfoImages := val;
      GetImages(GetRootRowSet);
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.FillFields(const iRow : IUnknown);
var
  iProps : IDCProperties;
begin
  iRow.QueryInterface(IDCProperties, iProps);

  _CheckField := DCPropByName(iProps, CheckField);
  _ImageField := DCPropByName(iProps, ImageField);
  _StateImageField := DCPropByName(iProps, StateImageField);

  DCPropsByNames(iProps, UsedFields, _Fields);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.ChangeItem(Item : TListItem; const iBookMark : IDCBookMark; const iRow : IUnknown);
var
  iProps      : IDCProperties;
  DFields     : TStrings;
  i           : integer;
begin
  if fHomoGeneous then
    with TInfoListItem(item) do
      begin
        CheckField := _CheckField;
        ImageField := _ImageField;
        StateImageField := _StateImageField;
        fFields.Clear;
        for i := 0 to _Fields.Count - 1 do
          fFields.Add(_Fields[i]);
      end
  else
    begin
      iRow.QueryInterface(IDCProperties, iProps);

      TInfoListItem(item).CheckField := DCPropByName(iProps, CheckField);
      TInfoListItem(item).ImageField := DCPropByName(iProps, ImageField);
      TInfoListItem(item).StateImageField := DCPropByName(iProps, StateImageField);

      DFields := UsedFields;

      DCPropsByNames(iProps, DFields, TInfoListItem(item).fFields);
    end;

//  TInfoListItem(item).fFields.Clear;
//  for i := 0 to DFields.Count - 1 do
//    TInfoListItem(item).Fields[i] := DCPropByName(iProps, DFields[i]);

  ReReadItem(item);

  with TInfoListItem(item) do
    begin
      BookMark := iBookMark.GetBookMark;
      Row      := iRow;
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.UpdateColumnsCaptions;
var
  Fields : TStrings;
  ccount : integer;
  i      : integer;     
begin
  if fUpdateColumns then
    begin
      Fields := UsedFields;
      ccount := min(Fields.Count, Columns.Count);
      with Fields do
        for i := 0 to ccount - 1 do
          Columns[i].Caption := Strings[i];
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.InitListItem(Item : TListItem);
begin
  with Item do
    begin
      Data := nil;
      Item.Selected := false;
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.RefreshData;
var
  iRowSet     : IDCRowSet;
  iBookMark   : IDCBookMark;
  iNavigation : IDCNavigation;
  i           : integer;
  item        : TListItem;
  itemindex   : integer;
  itemcount   : integer;
  fSaveBookMark : TDCBookMark;
begin
  if fWndCreating or (fInReading > 0) or (csDestroying in ComponentState) then
    exit;

  iRowSet := GetRootRowSet;

  fHomogeneous := IsRowsetHomogeneous(iRowSet);

  fItemList.Count := 0;

  inc(fInReading);
  try
    if iRowSet <> fEventSource then
      begin
        fItemList.iBookMarks := iRowSet;
        UnRegisterEventsHandler(fEventSource, fComObject);
        RegisterEventsHandler(iRowset, fComObject, evAll, 0);
        fEventSource := iRowSet;
      end;

    if not RowSetConnected(iRowSet) then
      begin
        (inherited Items).Clear;
        exit;
      end;

    GetFieldList(iRowSet);

    UpdateColumnsCaptions;

    GetImages(iRowSet);

    iRowSet.QueryInterface(IDCNavigation, iNavigation);
    iRowSet.QueryInterface(IDCBookMark, iBookMark);

    itemindex := 0;
    itemcount := Items.Count;

    if ViewStyle <> vsReport then
      Items.BeginUpdate;
    try
      if Assigned(OnStartLoading) then
        OnStartLoading(self);

      fItemList.Sorted := false;
      with iNavigation do
        begin
          if not StartFilterUpdates(iRowSet, iBookMark, fSaveBookMark) then
            First;

          if fHomogeneous then
            FillFields(iRowSet.GetRow);

          while not GetEOF do
            begin
              if itemindex < itemcount then
                begin
                  item := Items[itemindex];
                  InitListItem(item);
                end
              else
                item := (inherited Items).Add;

              ChangeItem(item, iBookMark, iRowSet.GetRow);

              inc(itemindex);
              Next;
            end;
        end;

      for i := itemcount - 1 downto itemindex do
        Items[i].Free;

    finally
      FinishFilterUpdates(iRowSet, iBookMark, fSaveBookMark);
      fItemList.Sorted := true;
      if ViewStyle <> vsReport then
        Items.EndUpdate;
    end;

  finally
    dec(fInReading);

    if Assigned(OnEndLoading) then
      OnEndLoading(self);
  end;
end;

{------------------------------------------------------------------}

function TCustomDCInfoListView.BookMarkToItem(const BookMark : TDCBookMark) : TListItem;
begin
  result := fItemList.ItemByKey(@BookMark);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.RowDeleted(item : TListItem);
begin
  if item <> nil then
    item.Free;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.RowChanged(item : TListItem);
begin
  if (item <> nil) and (item <> Selected) then
    begin
      ListView_EditLabel(Handle, -1);

      if not (item.Selected) then
        begin
          fLastSelectedItem := item;
          Selected := nil;
          Selected := item;
          item.Focused := true;
          item.MakeVisible(false);
        end;
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.FieldChanged(item : TListItem);
begin
  if item <> nil then
    ReReadItem(item);
end;

{------------------------------------------------------------------}

function  TCustomDCInfoListView.GetUsedFields : TStrings;
begin
  result := fFields;
  if result.Count = 0 then
    result := fDataFields;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.RowInserted(const iRowSet : IDCRowSet);
var
  item      : TListItem;
  iBookMark : IDCBookMark;
begin
  iRowSet.QueryInterface(IDCBookMark, iBookMark);

  if BookMarkToItem(iBookMark.GetBookMark) <> nil then
    exit;

  item := GetInsertedItem(iRowSet, iBookMark, Method(Addr(TCustomDCInfoListView.BookMarkToItem), self));

  if item <> nil then
    item := (inherited Items).Insert(item.index)
  else
    item := (inherited Items).Add;

  ChangeItem(item, iBookMark, iRowSet.GetRow);
  fLastInsertedItem := item;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.RecordChanged(const NewBookMark : TDCBookMark);
var
  item : TListItem;
begin
  item := BookMarkToItem(fOldBookMark);
  if item <> nil then
    TInfoListItem(item).BookMark := NewBookMark;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.HandleEvent(const EventRec:PEventRec);
var
  fRoot       : IDCRowSet;
  item        : TInfoListItem;
  NewBookMark : TDCBookMark;
begin
  With EventRec^ Do
  Begin
    if fIgnoreEvents or not (iloTrackRow in Options) and (EventType = evRowChanged) then
      exit;

    if (csDestroying in ComponentState) or
    (((fInDelete <> 0) and (EventType <> evRowDeleted))) then
      exit;

    if (EventType and (evFieldChanged + evRecordChanged) <> 0) then
      NewBookMark := (IUnknown(EventSource) as IDCBookMark).GetBookMark;

    if EventType = evFieldChanged then
      item := TInfoListItem(BookMarkToItem(NewBookMark))
    else if EventType and EventsWithBookMark <> 0 then
      item := TInfoListItem(BookMarkToItem(EventData^))
    else
      item := nil;

    fRoot := GetRootRowSet;
    case EventType of
      evActiveChanged : RefreshData;
      evFieldListChange : ;
      evRowChanged    : begin
                          FieldChanged(fDataEditItem);
                          RowChanged(item);
                          fDataEditItem := nil;
                        end;
      evFieldChanged  : FieldChanged(item);
      evRowDeleted    : RowDeleted(item);
      evRowInserted   : RowInserted(fRoot);
      evRecordChanged : RecordChanged(NewBookMark);
      evEditStarted   : begin
                          fOldBookMark := EventData^;
                          fDataEditItem := item;
                        end;
      evMasterChanged : MasterChanged;
      evFieldsChanged : FieldChanged(item);
    end;
  End;  
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) then
    begin
      if (AComponent = fInfoSet) then
        InfoSet := nil;
      if (AComponent = fLargeImages) then
        LargeImages := nil;
      if (AComponent = fSmallImages) then
        SmallImages := nil;
      if (AComponent = fStateImages) then
        StateImages := nil;
      if AComponent = fMasterControl then
        MasterControl := nil;
    end;
end;

{------------------------------------------------------------------}

function TCustomDCInfoListView.CreateListItem: TListItem;
begin
  result := TInfoListItem.Create(inherited Items);
end;

{------------------------------------------------------------------}

function TCustomDCInfoListView.SetToItem(Item : TListItem) : boolean;
var
  iBookMark : IDCBookMark;
begin
  result := Item <> nil;

  if result then
    with TInfoListItem(Item) do
      begin
        GetRootRowSet.QueryInterface(IDCBookMark, iBookMark);
        result := (iBookMark <> nil) and BookMarkValid(iBookMark, BookMark);
        if result then
          begin
            iBookMark.GotoBookmark(BookMark);
            NotifyDetails(self, fNotifiersHolder);
          end;
      end;
end;

{------------------------------------------------------------------}

procedure   TCustomDCInfoListView.SetToItemAndSelect(Item : TListItem);
begin
  if SetToItem(Item) then
    Selected := Item;
end;

{------------------------------------------------------------------}

function TCustomDCInfoListView.CanModify(Item : TListItem) : boolean;
begin
  result := atCanWrite in TInfoListItem(Item).Fields[0].Attributes;
end;

{------------------------------------------------------------------}

function TCustomDCInfoListView.StartItemEdit(Item : TListItem) : boolean;
var
  processed : boolean;
begin
  GetRootRowSet.QueryInterface(IDCRowChange, fRowChange);

  result := (fRowChange <> nil) and SetToItem(Item);
  if result then
    begin
      result := CanModify(Item);
      if result then
        begin
          processed := false;
          if Assigned(OnInfoStartEdit) then
            OnInfoStartEdit(self, TInfoListItem(Item), processed);

          if not processed then
            fRowChange.Edit;
          fEditedItem := Item;
        end;
    end;

  if not result then
    fRowChange := nil;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.ItemChanged(Item : TListItem; const NewText : string);
var
  processed : boolean;
begin
  if (Item <> nil) and (fRowChange <> nil) then
    try
      try
        processed := false;
        if Assigned(fOnInfoFieldSet) then
          fOnInfoFieldSet(self, TInfoListItem(Item), TInfoListItem(Item).Fields[0].Name, NewText, processed);

        if not processed then
          TInfoListItem(Item).Fields[0].SetValue(NewText);

        processed := false;

        if Assigned(OnInfoUpdate) then
          OnInfoUpdate(self, TInfoListItem(Item), processed);

        if not processed then
          fRowChange.Post;
      except
        processed := false;
        if Assigned(OnInfoCancelEdit) then
          OnInfoCancelEdit(self, TInfoListItem(Item), processed);

        if not processed then
          fRowChange.Cancel;
        ReReadItem(Item);
        raise;
      end;
    finally
      fRowChange := nil;
      fEditedItem := nil;
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.CancelEdit;
var
  processed : boolean;
begin
  if fRowChange <> nil then
    begin
      processed := false;
      if Assigned(OnInfoCancelEdit) then
        OnInfoCancelEdit(self, TInfoListItem(fEditedItem), processed);

      if not processed then
        fRowChange.Cancel;
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.Change(Item: TListItem; Change: Integer);
begin
  inherited;

  if (fInReading = 0) and (fInDelete = 0) and (fLastSelectedItem <> Item) and Item.Focused and Item.Selected then
    begin
      fLastSelectedItem := Item;
      SetToItem(Item);
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.CheckChanged(Item : TInfoListItem);
var
  processed  : boolean;
  newval     : boolean;
const
  BoolVals : array[boolean] of string = ('False', 'True');
begin
  if not fWndCreating and ([csDestroying, csLoading, csDesigning] * ComponentState = []) and (fInReading = 0) then
    with Item do
      if CheckBoxes and (CheckField <> nil) then
        begin
          if not SetToItem(Item) then
            exit;

          if CheckField.GetValue = Checked then
            exit;

          processed := false;
          if Assigned(fOnInfoFieldSet) then
            fOnInfoFieldSet(self, TInfoListItem(Item), CheckField.Name, BoolVals[Checked], processed);

          if not processed then
            begin
              GetRootRowSet.QueryInterface(IDCRowChange, fRowChange);
              if (fRowChange <> nil) then
                try
                  newval := Checked;
                  fRowChange.Edit;
                  SetBoolFieldValue(CheckField, newval);
                  fRowChange.Post;
                except
                  fRowChange.Cancel;
                end;
            end;
        end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.LVMINSERTCOLUMN(var Message : TMessage);
begin
  inherited;
  UpdateColumnsCaptions;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.CNNotify(var Message: TWMNotify);
var
  infoitem : TInfoListItem;
//  needrescan : boolean;
begin
//  needrescan := false;

  with Message, NMHdr^, PLVDispInfo(Pointer(NMHdr))^ do
    begin
      if (code = LVN_BEGINLABELEDIT) or (code = LVN_ENDLABELEDIT) then
        infoitem := TInfoListItem(Items[item.iItem])
      else
        infoitem := nil;

      case code of
        LVN_BEGINLABELEDIT:  Result := byte(not StartItemEdit(infoitem));

        LVN_ENDLABELEDIT: begin
                            if (item.pszText <> nil) then
                              begin
                                ItemChanged(infoitem, item.pszText);
//                                needrescan := true;
                              end
                            else
                              CancelEdit;

                            fEditedItem := nil;
                          end;

        LVN_DELETEALLITEMS : if fItemList <> nil then
                               fItemList.Clear;

        LVN_ITEMCHANGED:
          with PNMListView(NMHdr)^ do
            begin
              infoItem := TInfoListItem(Items[iItem]);
              if (uOldState and LVIS_STATEIMAGEMASK) xor
                (uNewState and LVIS_STATEIMAGEMASK) <> 0 then
                CheckChanged(infoItem);
            end;
        end;
    end;

  inherited;

{  if needrescan then
    ReReadItem(infoitem);}
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.EditSelected;
begin
  if not ReadOnly and (Selected <> nil) and StartItemEdit(Selected) then
    Selected.EditCaption;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.SetUpdateColumns(val : boolean);
begin
  if val <> fUpdateColumns then
    begin
      fUpdateColumns := val;
      UpdateColumnsCaptions;
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.SetOptions(val : TInfoListOptions);
begin
  if val = fOptions then
    exit;

  fOptions := val;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.SetLargeImages(val : {$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF});
begin
  if val <> fLargeImages then
    begin
      fLargeImages := val;
      if val <> nil then
        val.FreeNotification(self);
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.SetSmallImages(val : {$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF});
begin
  if val <> fSmallImages then
    begin
      fSmallImages := val;
      if val <> nil then
        val.FreeNotification(self);
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.SetStateImages(val : {$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF});
begin
  if val <> fStateImages then
    begin
      fStateImages := val;
      if val <> nil then
        val.FreeNotification(self);
    end;
end;

{------------------------------------------------------------------}

function TCustomDCInfoListView.DeleteItem(Item : TListItem) : boolean;
var
  iRowSet : IDCRowSet;
  processed : boolean;
begin
  result := SetToItem(Item);

  if result then
    begin
      processed := false;
      if Assigned(OnInfoDelete) then
        OnInfoDelete(self, TInfoListItem(Item), processed);

      if processed then
        exit;

      if TInfoListItem(Item).fRow.QueryInterface(IDCRowSet, iRowSet) = S_OK then
        ClearRowSet(iRowSet);

      fRowChange.Delete;
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.DeleteSelectedItems;
var
  item : TListItem;
  nitem : TListItem;
  sindex : integer;
  iRowSet : IDCRowSet;
begin
  item := Selected;
  if item = nil then
    exit;

  sindex := item.index;

  if (iloConfirmDelete in Options) and not ConfirmDeleteEx(self, OnConfirmDelete) then
    exit;

  iRowSet := GetRootRowSet;
  if iRowSet = nil then
    exit;

  inc(fInDelete);
  Items.BeginUpdate;
  try
    if iRowSet.QueryInterface(IDCRowChange, fRowChange) = S_OK then
      while item <> nil do
        begin
          nitem := GetNextItem(item, sdAll, [isSelected]);
          if not DeleteItem(item) then
            break;

          item := nitem;
        end;

    sindex := min(sindex, Items.Count - 1);

    if sindex >= 0 then
      Selected := Items[sindex];
  finally
    Items.EndUpdate;
    dec(fInDelete);
  end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.InsertNewItem;
var
  iRowSet       : IDCRowSet;
  nitem         : TListItem;
  iBookMark     : IDCBookMark;
  selitem       : TListItem;
  processed     : boolean;
begin
  iRowSet := GetRootRowSet;
  if iRowSet = nil then
    exit;

  selitem := Selected;

  if (iRowSet.QueryInterface(IDCRowChange, fRowChange) <> S_OK) or
     ((selitem <> nil) and not SetToItem(selitem)) then
    exit;

  processed := false;

  if Assigned(OnInfoInsert) then
    OnInfoInsert(self, TInfoListItem(selitem), false, processed);

  if not processed then
    DoInsert(iRowSet, selitem, fRowChange, false, '', '', false);

  nitem := fLastInsertedItem;

  if nitem <> nil then
    begin
      iRowSet.QueryInterface(IDCBookMark, iBookMark);

      ChangeItem(nitem, iBookMark, iRowSet.GetRow);
      Selected := nitem;

      if CanModify(nitem) then
        nitem.EditCaption;
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if fEditedItem <> nil then
    CheckChar(IsEditing, TInfoListItem(fEditedItem).Fields[0], Key);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if not (ReadOnly or IsEditing) then
    case Key of
      VK_F2     : EditSelected;
      VK_DELETE : DeleteSelectedItems;
      VK_INSERT : InsertNewItem;
    end;

  inherited;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoListView.CreateWnd;
begin
  fWndCreating := true;
  try
    inherited;
  finally
    fWndCreating := false;
    RefreshData;
  end;
end;

{******************************************************************}

initialization
  InitializeCriticalSection(fNodeListLock);
  InitializeCriticalSection(fRereadLock);
finalization
  DeleteCriticalSection(fNodeListLock);
  DeleteCriticalSection(fRereadLock);
end.
