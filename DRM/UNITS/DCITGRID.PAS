{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit dcitgrid;

interface
{$I dc.inc}

uses
  Windows, Messages, SysUtils, Classes, Controls,
  ComCtrls, commctrl,

  dcconsts, dcInfoLib, dchook, dcdreamlib, dcdtree,
  extctrls, dcntree, dcTreeGrid {$IFDEF D4}, imglist{$ENDIF};

type
  TSortedNodeList = class(TSortedBookMarkList)
  protected
    function BookMarkByItem(Item: pointer): PDCBookMark; override;
  end;

  TCustomDCInfoGrid = class;

  TInfoGridNode = class(TDCTreeGridNode)
  private
    fBookMark: TDCBookMark;
    fNodeList_: TSortedNodeList;
    fFields: TInterfaceList;
    fRow: IUnknown;
    fImageField: IDCProperty;
    fStateImageField: IDCProperty;
    fDisplayField: string;

    fLoaded: boolean;
    fNoSort: boolean;

    procedure SetBookMark(const val: TDCBookMark);
    procedure SetRow(const val: IUnknown);
    function InfoGrid: TCustomDCInfoGrid;
    function _BookMarkToNode(const BookMark: TDCBookMark): TDCTreeNode;
    function GetNodeLst: TSortedNodeList;
    function GetField(index: integer): IDCProperty;
    procedure SetField(index: integer; const Field: IDCProperty);
    function GetFieldCount: integer;
    function MaxColumnIndex: integer;
  protected

    property NodeList: TSortedNodeList read GetNodeLst;
    property DisplayField: string read fDisplayField write fDisplayField;

  public
    constructor Create(AOwner: TDCTreeNodes); override;
    destructor Destroy; override;

    property BookMark: TDCBookMark read fBookMark write SetBookMark;
    property Fields[index: integer]: IDCProperty read GetField write SetField;
    property FieldCount: integer read GetFieldCount;
    property Row: IUnknown read fRow write SetRow;
    property ImageField: IDCProperty read fImageField write fImageField;
    property StateImageField: IDCProperty read fStateImageField write fStateImageField;
    property Loaded: boolean read fLoaded write fLoaded;
  end;

  TDCInfoTreeNodes = class(TDCTreeNodes)
  private
    function GetInfoGrid: TCustomDCInfoGrid;
  protected
    function InternalAdd(Node: TDCTreeNode; const S: string; Ptr: Pointer; InsertType: TNodeAttachMode): TDCTreeNode; override;
  public
    procedure Clear; override;
    procedure Delete(Node: TDCTreeNode); override;
    property InfoGrid: TCustomDCInfoGrid read GetInfoGrid;
  end;

  TInfoGridOption = (
    igoAlwaysEdit,
    igoAutoFit,
    igoCheckChilds,
    igoConfirmDelete,
    igoFlat,
    igoHideHeader,
    igoHorzLines,
    igoLocateParent,
    igoOnlyFolders,
    igoSmartLoad,
    igoTrackRow,
    igoVertLines);

  TInfoGridOptions = set of TInfoGridOption;

  TGetIGNodeParams = procedure(Sender: TObject; Node: TDCTreeNode; const InfoSet: IUnknown) of object;
  TIGNodeLoadedEvent = procedure(Sender: TObject; Node: TDCTreeNode) of object;
  TModifyIGInfoEvent = procedure(Sender: TObject; Node: TDCTreeNode; var Processed: boolean) of object;
  TIGInfoInsertEvent = procedure(Sender: TObject; Node: TDCTreeNode; DoAppend: boolean; var processed: boolean) of object;
  TModifyIGFieldEvent = procedure(Sender: TObject; Node: TDCTreeNode; const FieldName: string; const NewValue: string; ColumnIndex: integer; var processed: boolean) of object;
  TIGLevelLoadingEvent = procedure(Sender: TObject; Node: TDCTreeNode) of object;

  TDCInfoGridColumn = class;

{------------------------------------------------------------------}

  TDCInfoGridColumn = class(TDCTreeColumn)
  private
    FDataField: string;
    fPreview : boolean;

    procedure SetDataField(const Value: string);
    procedure SetPreview(val : boolean);
  protected
    procedure ReCreateEditorProps; override;
  published
    property DataField   : string read FDataField write SetDataField;
    property Preview     : boolean read fPreview write SetPreview default False;
  end;

  TCustomDCInfoGrid = class(TDCCustomTreeGrid, IUnknown, IDCEventHandler, IDCEvents, IDCMasterInfoset, IInfoControl)
  private
    fInfoSet: TComponent;
    fOptions: TInfoGridOptions;

    fInDelete: integer;

    fUnk: IUnknown;
    fRowChange: IDCRowChange;
    fRowSet: IDCRowSet;

    fNodeList: TSortedNodeList;
    fInUpdate: integer;
    fIgnoreMasterChange: integer;

    fEventSource: IUnknown;

    fLastSelectedNode: TDCTreeNode;
    fOldBookMark: TDCBookMark;
    fLastInsertedNode: TDCTreeNode;
    fDisplayName: string;
    fNotifiersHolder: IDCEventsEx;
    fEditedNode: TDCTreeNode;
    fDataEditedNodes: TList;

    fNeedSelect: TDCTreeNode;
    fTimer: TTimer;
    fIgnoreRowChange: integer;
    fItems: TDCInfoTreeNodes;
    fExpandedNodes: TList;

    fOnConfirmDelete: TConfirmDeleteEvent;
    fOnActivateLevel: TIGLevelLoadingEvent;
    fOnNodeLoaded: TIGNodeLoadedEvent;

    //    fEventSources     : TEvSourcesList;

    fLargeImages: {$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF};
    fStateImages: {$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF};

    fImageField: string;
    fStateImageField: string;

    fFreeNodeCount: integer;
    fIgnoreImages: integer;
    fRefreshDataLock : integer;

    fOnGetNodeParams: TGetIGNodeParams;
    fInsertedBookMark: TDCBookMark;
    fOnStartLoading: TNotifyEvent;
    fOnEndLoading: TNotifyEvent;

    fOnInfoDelete: TModifyIGInfoEvent;
    fOnInfoCancelEdit: TModifyIGInfoEvent;
    fOnInfoUpdate: TModifyIGInfoEvent;
    fOnInfoStartEdit: TModifyIGInfoEvent;
    fOnInfoInsert: TIGInfoInsertEvent;
    fOnInfoFieldSet: TModifyIGFieldEvent;

    FVersion: TDCInfoTreeVersion;

    fLoadAll: boolean;
    fIgnoreNodeChange: boolean;
    fSelectInsert: boolean;
    fUseInfoImages: boolean;

    {IDCEvents}
    procedure RegisterHandler(const EventHandler: IDCEventHandler; EventTypes, UserData: DWORD);
    procedure UnregisterHandler(const EventHandler: IDCEventHandler);

    {IDCMasterInfoset}
    function GetDetailsRowSet: IDCRowSet;

    procedure SetInfoSet(val: TComponent);
    procedure SetOptions(val: TInfoGridOptions);
    procedure RemoveSubItems(RootItem: TDCTreeNode);
    function AddNode(RootItem: TDCTreeNode; const Text: string): TDCTreeNode;
    procedure NodeChanged(AItem: TDCTreeNode; const NewText: string);
    function GetIBookMark(Item: TDCTreeNode): IDCBookMark;
    function GetIRowChange(Item: TDCTreeNode): IDCRowChange;
    function DeleteNode(Item: TDCTreeNode): boolean;

    procedure ReReadItems(RootItem: TDCTreeNode; ForceLoad: boolean; NodeToReread: TDCTreeNode);
    procedure HandleEvent(const EventRec: PEventRec);
    procedure RowDeleted(node: TDCTreeNode);
    procedure RowChanged(node: TDCTreeNode);
    procedure RecordChanged(RootItem: TDCTreeNode);

    procedure RowInserted(const iRowSet: IDCRowSet; ParentNode: TDCTreeNode);

    procedure GetImages(const iRowSet: IDCRowSet);
    function GetDisplayName(node: TDCTreeNode): string;
    procedure ChangeNode(node: TDCTreeNode; const iBookMark: IDCBookMark;
      AFields: TInterfaceList; const iRow: IUnknown);

    procedure ChangeNode2(node: TDCTreeNode; const iBookMark: IDCBookMark;
      const iRow: IUnknown);

    procedure ChangeNodeImages(node: TDCTreeNode; const iRow: IUnknown);

    procedure SetLargeImages(val: {$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF});
    procedure SetStateImages(val: {$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF});

    procedure SetImageField(const val: string);
    procedure SetStateImageField(const val: string);

    function _BookMarkToNode(const BookMark: TDCBookMark): TDCTreeNode;
    procedure TimedSelection(Sender: TObject);
    function GetEventNode(RootItem: TDCTreeNode; const EventSource: IUnknown; EventType: Integer; const EventData: Variant): TDCTreeNode;
    //    function  GetRowChangedNode(const EventSource : IUnknown; const EventData : Variant) : TInfoNode;
    function ObtainDisplayName(const iDisplayField: IDCDisplayField): string;
    procedure GetRowSetAndBookMark(Item: TDCTreeNode; var iRowSet: IDCRowSet; var iBookMark: IDCBookMark);
    procedure FreeNode(node: TDCTreeNode);
    function CheckFolder(const Folder: IUnknown): boolean;
    procedure RereadNode(node: TDCTreeNode; ReadText: boolean);
    procedure ClearNodeList(RootItem: TDCTreeNode);
    procedure ClearLevel(RootItem: TDCTreeNode);
    procedure RemoveExtraNodes(node: TDCTreeNode);
    procedure ActivateLevel(node: TDCTreeNode);

    procedure AddHandler(const EventsSource: IUnknown; UserData: DWORD);
    procedure RemoveHandler(const EventsSource: IUnknown);

    procedure SetUseInfoImages(val: boolean);
    procedure LoadNode(RootItem: TDCTreeNode; var node: TDCTreeNode; const iBookMark: IDCBookMark;
      AFields: TInterfaceList; const iRow: IUnknown);

    procedure UpdateColumns;
    function  GetDefaultColumnWidth(FieldWidth : integer; Column : TDCTreeColumn) : integer;
    function  IsColumnsStored : boolean;
    procedure ReadColumns(node : TDCTreeNode);
  protected
    {IUnknown}
    function QueryInterface(const IID: TGUID; out Obj): HResult;
    {$IFDEF D4} override;
    {$ENDIF} stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;

    function StoreDrawData: boolean; override;

    procedure CancelEdit; override;
    function CanEdit(Item: TDCTreenode): boolean; override;
    procedure DoExpandNode(Node: TDCTreeNode); override;
    procedure Edit(Node: TDCTreeNode; var NewText: string); override;
    function GetEditorClass(Node: TDCTreeNode; AColumn: integer): TControlClass; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;

    function CreateNode: TDCTreeNode; override;
    procedure ColumnDeleted(Column : TDCTreeColumn); override;
    function GetIDCNavigation(Item: TDCTreeNode): IDCNavigation;
    function GetIUnknown(Item: TDCTreeNode): IUnknown;
    function BookMarkToNode(ParentNode: TDCTreeNode; const BookMark: TDCBookMark): TDCTreeNode;
    procedure DelayedSelect(node: TDCTreeNode);
    function LocateNode(AItem: TDCTreeNode; DoNotifyDetails: boolean): boolean;
    procedure SelectionChanged; override;
    function DoInsertNode(node, parentnode: TDCTreeNode): TDCTreeNode;

    function GetTreeColumnClass : TDCTreeColumnClass; override;
    procedure SetEditorRectAndText(Node : TDCTreeNode); override;

    procedure Loaded; override;
    function  GetTextForEditor(Node : TDCTreeNode) : string; override;
    function  CompareNodes(Node1, Node2 : TDCTreeGridNode; ColumnIndex : integer) : integer; override;
  public
    procedure UpdateSelection;
    procedure RescanItems(RootItem: TDCTreeNode);
    procedure RescanNodeWithChildren(Item: TDCTreeNode);
    procedure RefreshData;
    function SetToNode(Item: TDCTreeNode): boolean;
    procedure SetToNodeAndSelect(Item: TDCTreeNode);
    function InsertNewNode: TDCTreeNode;
    function InsertNewSubNode(ParentNode, Node: TDCTreeNode): TDCTreeNode;
    procedure DeleteSelectedNodes;
    procedure EditSelected;
    function GetRowSet(Item: TDCTreeNode): IDCRowSet;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property LargeImages: {$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF} read fLargeImages write SetLargeImages;
    property StateImages: {$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF} read fStateImages write SetStateImages;

    property Items: TDCInfoTreeNodes read fItems;
    property InfoSet: TComponent read fInfoSet write SetInfoSet;
    property Options: TInfoGridOptions read fOptions write SetOptions;
    property ImageField: string read fImageField write SetImageField;
    property StateImageField: string read fStateImageField write SetStateImageField;
    property UseInfoImages: boolean read fUseInfoImages write SetUseInfoImages default False;

    property Columns stored IsColumnsStored;

    property OnConfirmDelete: TConfirmDeleteEvent read fOnConfirmDelete write fOnConfirmDelete;
    property OnGetNodeParams: TGetIGNodeParams read fOnGetNodeParams write fOnGetNodeParams;
    property OnActivateLevel: TIGLevelLoadingEvent read fOnActivateLevel write fOnActivateLevel;
    property OnNodeLoaded: TIGNodeLoadedEvent read fOnNodeLoaded write fOnNodeLoaded;
    property OnStartLoading: TNotifyEvent read fOnStartLoading write fOnStartLoading;
    property OnEndLoading: TNotifyEvent read fOnEndLoading write fOnEndLoading;
    property OnInfoDelete: TModifyIGInfoEvent read fOnInfoDelete write fOnInfoDelete;
    property OnInfoCancelEdit: TModifyIGInfoEvent read fOnInfoCancelEdit write fOnInfoCancelEdit;
    property OnInfoStartEdit: TModifyIGInfoEvent read fOnInfoStartEdit write fOnInfoStartEdit;
    property OnInfoUpdate: TModifyIGInfoEvent read fOnInfoUpdate write fOnInfoUpdate;
    property OnInfoInsert: TIGInfoInsertEvent read fOnInfoInsert write fOnInfoInsert;
    property OnInfoFieldSet: TModifyIGFieldEvent read fOnInfoFieldSet write fOnInfoFieldSet;
  published
    property Version: TDCInfoTreeVersion read FVersion write FVersion stored False;
  end;

  TDCInfoGrid = class(TCustomDCInfoGrid)
  Public
    Property CurrentColumn;
  published
    //Std properties
    property BorderStyle;
    Property DragButtons;
    property DragCursor;
    property DragMode;
    property DropTargetKind;
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
    property Version;

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
    property Options;
    property ExpandOnDrag;
    property DragExpandDelay;

    property ImageField;
    property StateImageField;
    property UseInfoImages;

    property OnConfirmDelete;
    property OnGetNodeParams;
    property OnActivateLevel;
    property OnNodeLoaded;
    property OnStartLoading;
    property OnEndLoading;

    property ToolTips;
    property HotTrack;

    property ActiveSelectedColor;
    property ActiveSelectedFontColor;

    property AutoCheck;
    property AllowMultiDrag;
    property CheckBoxesType;
    property FlatChecks;
    property InactiveSelectedColor;
    property InactiveSelectedFontColor;
    property LinesColor;
    property OnCheckClick;

    property OnCompare;
    Property OnCurrentColumnChanged;
    Property OnCurrentColumnChanging;
    property OnGetEditorClass;
    Property OnGetImageIndex;
    Property OnGetSelectedIndex;
    Property OnGetToolTipInfo;
    Property OnRightClickNode;
    Property OnStateChanged;
    Property OnStateChanging;
    property RowSelect;
    property RowSelectType;
    property RightClickSelect;

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
    property ScrollBarsStyle;
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

    property Columns; //!
    property ColumnImages;
    property MultiLineNodes;
    property OnValidateEditText;
    property OnAssignEditorProps;
  end;

function GetNodeFieldValue(Node: TDCTreeNode; const FieldName: string): Variant;

const
  DefaultInfoGridOptions: TInfoGridOptions = [igoConfirmDelete, igoCheckChilds, igoSmartLoad];
  RescanGridOptions = [igoOnlyFolders, igoCheckChilds];

const
  TreeUpdateInterval: integer = 100;

implementation

uses dcInfoGridEditors, dcInfoGridEditorsReg;

type
  TMColumns = class(TDCTreeColumns);

{------------------------------------------------------------------}

function GetNodeFieldValue(Node: TDCTreeNode; const FieldName: string): Variant;
var
  iProps: IDCProperties;
  iProp: IDCProperty;
  ITree: TCustomDCInfoGrid;
  iRowSet: IDCRowSet;
  iBookMark: IDCBookMark;
  SaveBookMark: TDCBookMark;
begin
  if Node = nil then
    begin
      VarClear(result);
      exit;
    end;

  ITree := Node.TreeView as TCustomDCInfoGrid;
  iTree.GetRowSetAndBookMark(node.Parent, iRowSet, iBookMark);
  SaveBookMark := StartUpdates(iRowSet, iBookMark);
  inc(iTree.fIgnoreMasterChange);
  try
    iProps := TInfoGridNode(Node).Row as IDCProperties;
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

{******************************************************************}

procedure DoInsert(const iRowSet: IDCRowSet; Selected: TObject; var fRowChange: IDCRowChange;
  DoAppend: boolean; const FieldName, FieldValue: string; ForceOperation: boolean);
var
  iCanRowChange: IDCCanRowChange;
  iRowChange: IDCRowChange;
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
  TBookMarkToItemProc = function(const BookMark: TDCBookMark): TObject of object;

  {------------------------------------------------------------------}

function GetInsertedItem(const iRowSet: IDCRowSet; const iBookMark: IDCBookMark; BookMarkToItem: TMethod {TBookMarkToItemProc}): pointer;
var
  iNavigation: IDCNavigation;
  fSaveBookMark: TDCBookMark;
begin
  iRowSet.QueryInterface(IDCNavigation, iNavigation);
  result := nil;

  fSaveBookMark := StartUpdates(iRowSet, iBookMark);
  try
    with iNavigation do
      {
            if BOF then //!
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

function GetNodeList(TreeView: TCustomDCInfoGrid; node: TDCTreeNode): TSortedNodeList;
begin
  if node <> nil then
    result := TInfoGridNode(node).NodeList
  else
    result := TreeView.fNodeList;
end;

{------------------------------------------------------------------}

function GetNodeList_(TreeView: TCustomDCInfoGrid; node: TDCTreeNode): TSortedNodeList;
begin
  if node <> nil then
    result := TInfoGridNode(node).fNodeList_
  else
    result := TreeView.fNodeList;
end;

{******************************************************************}

constructor TInfoGridNode.Create(AOwner: TDCTreeNodes);
begin
  inherited Create(AOwner);
  fFields := TInterfaceList.Create;
end;

{------------------------------------------------------------------}

var
  _NodeInLoad: TDCTreeNode;

destructor TInfoGridNode.Destroy;
var
  ig: TCustomDCInfoGrid;
begin
  if _NodeInLoad = self then
    _NodeInLoad := nil;

  ig := InfoGrid;
  with ig do
    begin
      if not (csDestroying in ComponentState) then
        begin
          if self = fNeedSelect then
            fNeedSelect := nil;

          GetNodeList(ig, self.Parent).Remove(self);
          fDataEditedNodes.Remove(self);
        end;

      RemoveHandler(fRow);
    end;

  FreeObject(fNodeList_,fNodeList_);
  FreeObject(fFields,fFields);
  inherited;
end;

{------------------------------------------------------------------}

function TInfoGridNode.InfoGrid: TCustomDCInfoGrid;
begin
  result := TCustomDCInfoGrid(Owner.Owner);
end;

{------------------------------------------------------------------}

function TInfoGridNode.MaxColumnIndex: integer;
begin
  result := min(FieldCount, max(InfoGrid.Columns.Count, 1));
end;

{------------------------------------------------------------------}

function TInfoGridNode.GetNodeLst: TSortedNodeList;
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

function TInfoGridNode._BookMarkToNode(const BookMark: TDCBookMark): TDCTreeNode;
begin
  if fNodeList_ = nil then
    result := nil
  else
    result := fNodeList_.ItemByKey(@BookMark);
end;

{------------------------------------------------------------------}

procedure TInfoGridNode.SetRow(const val: IUnknown);
begin
  if val = fRow then
    exit;

  fRow := val as IUnknown;
  if fNodeList_ <> nil then
    fNodeList_.iBookMarks := val;
end;

{------------------------------------------------------------------}

procedure TInfoGridNode.SetBookMark(const val: TDCBookMark);
begin
  //  if val <> fBookMark then
  with GetNodeList(InfoGrid, self.Parent) do
  begin
    if fBookMark <> '' then
      Remove(self);
    fBookMark := val;
    Add(self);
  end;
end;

{------------------------------------------------------------------}

function TInfoGridNode.GetField(index: integer): IDCProperty;
begin
  if (FFields <> nil) and (Index < FFields.Count) then
    result := fFields[index] as IDCProperty;
end;

{------------------------------------------------------------------}

procedure TInfoGridNode.SetField(index: integer; const Field: IDCProperty);
begin
  with fFields do
    if index >= Count then
      fFields.Add(Field)
    else
      fFields[index] := Field;
end;

{------------------------------------------------------------------}

function TInfoGridNode.GetFieldCount: integer;
begin
  result := fFields.Count;
end;

{******************************************************************}

function TDCInfoTreeNodes.GetInfoGrid: TCustomDCInfoGrid;
begin
  result := TCustomDCInfoGrid(Owner);
end;

{------------------------------------------------------------------}

function TDCInfoTreeNodes.InternalAdd(Node: TDCTreeNode; const S: string; Ptr: Pointer; InsertType: TNodeAttachMode): TDCTreeNode;
const
  RootInsertTypes: array[TNodeAttachMode] of TNodeAttachMode =
  (naAddChild, naAddChildFirst, naAddChild, naAddChildFirst, naAddChildFirst);
var
  iRowSet: IDCRowSet;
  iRowChange: IDCRowChange;
  pnode: TDCTreeNode;
  iDisplayField: IDCDisplayField;
  DisplayName: string;
  processed: boolean;
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

      if not InfoGrid.SetToNode(Node) then
        exit;
    end
  else
    pnode := nil;

  iRowSet := InfoGrid.GetRowSet(pnode);

  if (iRowSet = nil) or (iRowSet.QueryInterface(IDCRowChange, iRowChange) <> S_OK) then
    begin
      Error(SErrChangesNotSupported);
      exit;
    end;

  InfoGrid.fLastInsertedNode := nil;
  InfoGrid.GetIUnknown(pnode).QueryInterface(IDCDisplayField, iDisplayField);

  if InfoGrid.Columns.Count > 0 then
    DisplayName := InfoGrid.ObtainDisplayName(iDisplayField)
  else
    DisplayName := '';

  processed := false;

  if Assigned(InfoGrid.OnInfoInsert) then
    InfoGrid.OnInfoInsert(self, TInfoGridNode(pnode), InsertType <> naInsert, processed);

  if not processed then
    DoInsert(iRowSet, node, iRowChange, InsertType <> naInsert, DisplayName, S, true);

  result := InfoGrid.fLastInsertedNode;

  if result = nil then
    Error(SErrInsert);
end;

{------------------------------------------------------------------}

procedure TDCInfoTreeNodes.Clear;
var
  node: TDCTreeNode;
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

procedure TDCInfoTreeNodes.Delete(Node: TDCTreeNode);
begin
  InfoGrid.DeleteNode(node);
end;

{******************************************************************}

function TSortedNodeList.BookMarkByItem(Item: pointer): PDCBookMark;
begin
  result := @(TInfoGridNode(Item).BookMark);
end;

{******************************************************************}

procedure TDCInfoGridColumn.SetDataField(const Value: string);
begin
  if Value <> FDataField then
    begin
      fDataField := Value;
      Changed(false);
      TCustomDCInfoGrid(TreeView).RefreshData;
    end;
end;

{------------------------------------------------------------------}

procedure TDCInfoGridColumn.SetPreview(val : boolean);
begin
  if val <> fPreview then
    begin
      fPreview := val;
      Changed(false);
    end;
end;

{------------------------------------------------------------------}

procedure TDCInfoGridColumn.ReCreateEditorProps;
var
  ps: TEditorPropsClass;
begin
  FEditorProps.Free;
  ps := GetInfoEditorPropsClass(FEditorClass);
  FEditorProps := ps.Create(Self);
end;

{******************************************************************}

constructor TCustomDCInfoGrid.Create(AOwner: TComponent);
begin
  inherited;
  fDataEditedNodes := TList.Create;
  fNodeList := TSortedNodeList.Create;
  fOptions := DefaultInfoGridOptions;
  fNotifiersHolder := TNotifiersHolder.Create;
  fItems := TDCInfoTreeNodes.Create(self);
  fTimer := TTimer.Create(nil);
  fTimer.Interval := TreeUpdateInterval;
  fTimer.OnTimer := TimedSelection;
  fExpandedNodes := TList.Create;
  //  fEventSources := TEvSourcesList.Create;
end;

{------------------------------------------------------------------}

destructor TCustomDCInfoGrid.Destroy;
begin
  Destroying;
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

function TCustomDCInfoGrid.GetTreeColumnClass: TDCTreeColumnClass;
begin
  Result := TDCInfoGridColumn;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.SetEditorRectAndText(Node: TDCTreeNode);
begin
  if CurrentColumn <> nil then
    with TDCInfoGridColumn(CurrentColumn) do
      begin
        if Assigned(EditorProps) and (EditorProps is TDCLookupEditorProps) then
          TDCLookupEditorProps(EditorProps).EditedField :=
            TInfoGridNode(Node).Fields[CurrentColumnCreateIndex];

        SetEditorData(EditorProps);
      end;
  inherited;
end;

{------------------------------------------------------------------}

function TCustomDCInfoGrid.StoreDrawData: boolean;
begin
  result := false;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.ColumnDeleted(Column : TDCTreeColumn);
begin
  inherited;
  if not (csDestroying in ComponentState) then
    RefreshData;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.Loaded;
begin
  inherited;
  UpdateColumns;
  RefreshData;
end;

{------------------------------------------------------------------}

function  TCustomDCInfoGrid.CompareNodes(Node1, Node2 : TDCTreeGridNode; ColumnIndex : integer) : integer;
var
  iField1 : IDCProperty;
  iField2 : IDCProperty;
begin
  iField1 := TInfoGridNode(Node1).Fields[ColumnIndex];
  iField2 := TInfoGridNode(Node2).Fields[ColumnIndex];
  if (iField1 <> nil) and (iField2 <> nil) then
    result := CompareFieldValues(Node1.Columns[ColumnIndex], Node2.Columns[ColumnIndex],
                                 iField1.PropType, iField2.PropType)
  else
    result := inherited CompareNodes(Node1, Node2, ColumnIndex);
end;

{------------------------------------------------------------------}

function  TCustomDCInfoGrid.GetTextForEditor(Node : TDCTreeNode) : string;
var
  iField : IDCProperty;
begin
  iField := TInfoGridNode(Node).Fields[CurrentColumnCreateIndex];
  result := '';
  if iField <> nil then
    result := iField.GetText;
end;

{------------------------------------------------------------------}

function TCustomDCInfoGrid.QueryInterface(const IID: TGUID; out Obj): HResult;
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

function TCustomDCInfoGrid._AddRef: Integer;
begin
  result := 1;
end;

{------------------------------------------------------------------}

function TCustomDCInfoGrid._Release: Integer;
begin
  result := 1;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.AddHandler(const EventsSource: IUnknown; UserData: DWORD);
begin
  RegisterEventsHandler(EventsSource, Self, evAll, UserData);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.RemoveHandler(const EventsSource: IUnknown);
begin
  if EventsSource <> nil then
    UnRegisterEventsHandler(EventsSource, Self);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.SetUseInfoImages(val: boolean);
begin
  if val <> fUseInfoImages then
    begin
      fUseInfoImages := val;
      GetImages(fRowSet);
    end;
end;

{------------------------------------------------------------------}

function TCustomDCInfoGrid.DeleteNode(Item: TDCTreeNode): boolean;
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

  if not LocateNode(Item, false) then
    exit;

  iRowChange := GetIRowChange(Item.Parent);
  result := iRowChange <> nil;

  if result then
    if iRowChange.QueryInterface(IDCCanRowChange, iCanRowChange) = S_OK then
      result := iCanRowChange.CanDelete;

  if result then
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

procedure TCustomDCInfoGrid.DeleteSelectedNodes;
var
  sel: TDCTreeNode;
  node: TDCTreeNode;
begin
  sel := Selected;

  if ((sel = nil) and (FSelectedItems.Count = 0)) or
    ((igoConfirmDelete in Options) and not ConfirmDeleteEx(self, OnConfirmDelete)) then
    exit;

  inc(fInDelete);
  Items.BeginUpdate;
  try
    if FSelectedItems.IndexOf(sel) >= 0 then
      sel := nil;

    with FSelectedItems do
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

procedure TCustomDCInfoGrid.SetLargeImages(val: {$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF});
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

procedure TCustomDCInfoGrid.SetStateImages(val: {$IFDEF D4}TCustomImageList{$ELSE}TImageList{$ENDIF});
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

procedure TCustomDCInfoGrid.SetImageField(const val: string);
var
  fOldImageField: string;
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

procedure TCustomDCInfoGrid.SetStateImageField(const val: string);
var
  fOldStateImageField: string;
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

procedure TCustomDCInfoGrid.EditSelected;
var
  selnode: TDCTreeNode;
begin
  selnode := Selected;
  if (selnode <> nil) then
    begin
      SetFocus;
      selnode.EditText;
    end;
end;

{------------------------------------------------------------------}

function TCustomDCInfoGrid.DoInsertNode(node, parentnode: TDCTreeNode): TDCTreeNode;
var
  iRowSet: IDCRowSet;
  nnode: TDCTreeNode;
  processed: boolean;
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
  finally
    dec(fIgnoreRowChange);
  end;
end;

{------------------------------------------------------------------}

function TCustomDCInfoGrid.InsertNewSubNode(ParentNode, Node: TDCTreeNode): TDCTreeNode;
begin
  result := DoInsertNode(Node, ParentNode);
end;

{------------------------------------------------------------------}

function TCustomDCInfoGrid.InsertNewNode: TDCTreeNode;
var
  node, pnode: TDCTreeNode;
begin
  pnode := nil;
  node := Selected;
  if node <> nil then
    pnode := node.Parent;

  result := DoInsertNode(node, pnode);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.KeyPress(var Key: Char);
var
  iField: IDCProperty;
begin
  if fEditedNode <> nil then
  begin
    iField := TInfoGridNode(fEditedNode).Fields[CurrentColumnCreateIndex];
    if iField <> nil then
      begin
        CheckChar(IsEditing, iField, Key);
        if (Key in [^H, ^V, ^X, #32..#255]) and not (atCanWrite in iField.GetAttributes) then
          Key := #0;
      end;
  end;
  inherited KeyPress(Key);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if not (ReadOnly or IsEditing) then
    case key of
      VK_DELETE: DeleteSelectedNodes;
      VK_F2: EditSelected;
      VK_INSERT: InsertNewNode;
    end;

  inherited;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.Notification(AComponent: TComponent; Operation: TOperation);
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

function TCustomDCInfoGrid.CreateNode: TDCTreeNode;
begin
  result := TInfoGridNode.Create(inherited Items);
end;

{------------------------------------------------------------------}

function TCustomDCInfoGrid.GetDetailsRowSet: IDCRowSet;
var
  selnode: TDCTreeNode;
begin
  selnode := Selected;
  if selnode <> nil then
    result := GetRowSet(selnode)
  else
    result := nil;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.RegisterHandler(const EventHandler: IDCEventHandler; EventTypes, UserData: DWORD);
begin
  fNotifiersHolder.RegisterHandler(EventHandler, EventTypes, UserData);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.UnregisterHandler(const EventHandler: IDCEventHandler);
begin
  fNotifiersHolder.UnRegisterHandler(EventHandler);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.SetInfoSet(val: TComponent);
begin
  if val = fInfoSet then
    exit;

  SetInfoSetProp(val, self, Self, fUnk, fRowSet);

  fEventSource := fRowSet;
  fNodeList.iBookMarks := fRowSet;

  fInfoSet := val;
  UpdateColumns;
  RefreshData;
end;

{------------------------------------------------------------------}

type
  TIGOpt2TGOpt = record
    igopt: integer;
    tgopt: integer;
  end;
const
  IGOpts2TGOptsCount = 6;
  IGOpts2TGOpts: array[0..IGOpts2TGOptsCount - 1] of TIGOpt2TGOpt =
  (
    (igopt: 1 shl ord(igoAlwaysEdit); tgopt: 1 shl ord(tgoAlwaysEdit)),
    (igopt: 1 shl ord(igoAutoFit); tgopt: 1 shl ord(tgoAutoFit)),
    (igopt: 1 shl ord(igoFlat); tgopt: 1 shl ord(tgoFlat)),
    (igopt: 1 shl ord(igoHideHeader); tgopt: 1 shl ord(tgoHideHeader)),
    (igopt: 1 shl ord(igoHorzLines); tgopt: 1 shl ord(tgoHorzLines)),
    (igopt: 1 shl ord(igoVertLines); tgopt: 1 shl ord(tgoVertLines))
    );

function InfoGridOptionsToTreeGridOptions(igopts: TInfoGridOptions): TDCTreeGridOptions;
var
  i: integer;
  res: byte;
  igo: integer;
begin
  res := 0;
  igo := word(igopts);
  for i := IGOpts2TGOptsCount - 1 downto 0 do
    if igo and IGOpts2TGOpts[i].igopt <> 0 then
      res := res or IGOpts2TGOpts[i].tgopt;
  result := TDCTreeGridOptions(res);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.SetOptions(val: TInfoGridOptions);
var
  needrescan: boolean;
begin
  if val = fOptions then
    exit;

  inherited Options := InfoGridOptionsToTreeGridOptions(val);

  needrescan := (igoSmartLoad in (val - Options)) or
    (((val + fOptions) - (val * fOptions)) * RescanGridOptions <> []);

  fOptions := val;

  fLoadAll := not (igoSmartLoad in Options);

  if needrescan then
    RefreshData;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.RemoveSubItems(RootItem: TDCTreeNode);
var
  NextNode: TDCTreeNode;
  Node: TDCTreeNode;
begin
  if RootItem = nil then
    begin
      (inherited Items).Clear;
      Items.ClearCache;
    end
  else
    begin
      NextNode := RootItem.GetFirstChild;
      while NextNode <> nil do
        begin
          Node := NextNode.GetNextSibling;
          NextNode.Free;
          NextNode := Node;
        end;
    end;
end;

{------------------------------------------------------------------}

function TCustomDCInfoGrid.GetIUnknown(Item: TDCTreeNode): IUnknown;
begin
  if Item = nil then
    result := fUnk
  else
    result := TInfoGridNode(Item).Row;
end;

{------------------------------------------------------------------}

function TCustomDCInfoGrid.GetRowSet(Item: TDCTreeNode): IDCRowSet;
begin
  if Item = nil then
    result := fRowSet
  else
    with TInfoGridNode(Item) do
      if Row <> nil then
        Row.QueryInterface(IDCRowSet, result)
      else
        result := nil;
end;

{------------------------------------------------------------------}

function TCustomDCInfoGrid.GetIDCNavigation(Item: TDCTreeNode): IDCNavigation;
var
  _rset: IDCRowSet;
begin
  _rset := GetRowSet(Item);
  if _rset <> nil then
    _rset.QueryInterface(IDCNavigation, result)
  else
    result := nil;
end;

{------------------------------------------------------------------}

function TCustomDCInfoGrid.AddNode(RootItem: TDCTreeNode; const Text: string): TDCTreeNode;
begin
  result := (inherited Items).AddChild(RootItem, Text);
end;

{------------------------------------------------------------------}

function TCustomDCInfoGrid._BookMarkToNode(const BookMark: TDCBookMark): TDCTreeNode;
begin
  result := fNodeList.ItemByKey(@BookMark);
end;

{------------------------------------------------------------------}

function TCustomDCInfoGrid.BookMarkToNode(ParentNode: TDCTreeNode; const BookMark: TDCBookMark): TDCTreeNode;
var
  nodelist: TSortedNodeList;
begin
  if ParentNode = nil then
    nodelist := fNodeList
  else
    nodelist := TInfoGridNode(ParentNode).fNodeList_;

  if nodelist <> nil then
    result := NodeList.ItemByKey(@BookMark)
  else
    result := nil;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.FreeNode(node: TDCTreeNode);
begin
  if node <> nil then
    try
      inc(fFreeNodeCount);
      node.Free;
    finally
      dec(fFreeNodeCount);
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.RowDeleted(node: TDCTreeNode);
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

procedure TCustomDCInfoGrid.UpdateSelection;
var
  selnode: TDCTreeNode;
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
        selnode.MakeVisible;

      fLastSelectedNode := selnode;
    end;

  fNeedSelect := nil;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.TimedSelection(Sender: TObject);
begin
  fTimer.Enabled := false;
  UpdateSelection;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.DelayedSelect(node: TDCTreeNode);
begin
  fNeedSelect := node;
  fTimer.Enabled := true;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.RowChanged(node: TDCTreeNode);
begin
  if (node <> nil) and (igoTrackRow in Options) then
    DelayedSelect(node);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.ReadColumns(node : TDCTreeNode);
var
  i : integer;
begin
  with TInfoGridNode(node) do
    for i := 0 to MaxColumnIndex - 1 do
      if TDCInfoGridColumn(self.CreateColumn[i]).PreView then
        Columns[i] := GetFieldText(Fields[i])
      else
        Columns[i] := GetFieldStringValue(Fields[i]);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.RereadNode(node: TDCTreeNode; ReadText: boolean);
var
  i: integer;
begin
  if node <> nil then
    with TInfoGridNode(node) do
      begin
        if Fields[0] = nil then
          exit;

        if ReadText then
          ReadColumns(TInfoGridNode(node));

        try
          i := -1;
          if ImageField <> nil then
            i := GetIntValue(ImageField);

          ImageIndex := i;
          SelectedIndex := i;

          i := -1;
          if StateImageField <> nil then
            i := GetIntValue(StateImageField);

          StateIndex := i;
        except
          Error(SErrInvalidFieldType);
        end;

        if Assigned(OnGetNodeParams) then
          OnGetNodeParams(self, node, GetRowSet(node.Parent));
      end;
end;

{------------------------------------------------------------------}

function Method(Code, Data: pointer): TMethod;
begin
  result.Code := Code;
  result.Data := Data;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.RowInserted(const iRowSet: IDCRowSet; ParentNode: TDCTreeNode);
var
  node: TDCTreeNode;
  iBookMark: IDCBookMark;
  m: TMethod;
  iRow: IUnknown;
begin
  iRowSet.QueryInterface(IDCBookMark, iBookMark);

  if BookMarkToNode(ParentNode, iBookMark.GetBookMark) <> nil then
    exit;

  iRow := GetRowSet(ParentNode).GetRow;

  if not CheckFolder(iRow) then
    exit;

  if ParentNode = nil then
    m := Method(Addr(TCustomDCInfoGrid._BookMarkToNode), self)
  else
    m := Method(Addr(TInfoGridNode._BookMarkToNode), ParentNode);

  node := GetInsertedItem(iRowSet, iBookMark, m);

  if node <> nil then
    node := (inherited Items).Insert(node, '')
  else
    node := (inherited Items).AddChild(ParentNode, '');

  ChangeNode2(TInfoGridNode(node), iBookMark, iRow);
  RereadNode(node, true);
  RereadItems(node, false, nil);
  fLastInsertedNode := node;

  if (ParentNode <> nil) and not TInfoGridNode(ParentNode).Loaded then
    begin
      fInsertedBookMark := TInfoGridNode(node).BookMark;
      fSelectInsert := true;
    end;

  DelayedSelect(node);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.RecordChanged(RootItem: TDCTreeNode);
var
  node: TDCTreeNode;
begin
  node := BookMarkToNode(RootItem, fOldBookMark);
  if node <> nil then
    begin
      TInfoGridNode(node).BookMark := GetIBookMark(node.Parent).BookMark;
      ReReadItems(node, false, nil);
    end;
end;

{------------------------------------------------------------------}

const
  EventsWithBookMark = evRowChanged + evRowDeleted + evRecordChanged +
    evEditStarted + evFieldsChanged;

function TCustomDCInfoGrid.GetEventNode(RootItem: TDCTreeNode; const EventSource: IUnknown; EventType: Integer; const EventData: Variant): TDCTreeNode;
var
  iBookMark: IDCBookMark;
  iParentBookMarkEx: IDCBookMarkEx;
  selnode: TDCTreeNode;
begin
  if EventType = evFieldChanged then
    result := BookMarkToNode(RootItem, (EventSource as IDCBookMark).GetBookMark)
  else if EventType and EventsWithBookMark <> 0 then
    begin
      result := BookMarkToNode(RootItem, EventData);

      if (EventType = evRowChanged) then
        if result = nil then
          begin
            selnode := Selected;
            if selnode <> nil then
              begin
                iBookMark := GetIBookMark(RootItem);
                if iBookMark.QueryInterface(IDCBookMarkEx, iParentBookMarkEx) = S_OK then
                  with iParentBookMarkEx do
                    if CompareBookMarks(TInfoGridNode(selnode).BookMark, EventData) = 0 then
                      exit;
              end;
          end;
    end
  else
    result := nil;
end;

{------------------------------------------------------------------}

function IsVarEqualToString(const v: Variant; const s: string): boolean;
begin
  result := v = s;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.HandleEvent(const EventRec: PEventRec);
var
  node: TDCTreeNode;
  i: integer;
  RootItem: TDCTreeNode;
begin
  if GlobalUpdateCount > 0 then
    exit;

  inc(fIgnoreImages);
  try
    with EventRec^ do
      begin
        if (EventType = evRowChanged) and (not (igoTrackRow in Options) or (fIgnoreRowChange > 0)) then
          exit;

        if (fInUpdate = 0) and not (csDestroying in ComponentState) and
          ((fInDelete = 0) or (EventType = evRowDeleted)) then
          begin
            RootItem := TDCTreeNode(UserData);
            node := GetEventNode(RootItem, IUnknown(EventSource), EventType, EventData^);

            case EventType of
              evActiveChanged:
                begin
                  if IsEditing then
                    TreeView_EndEditLabelNow(Handle, true);

                  CancelEdit;
                  if RootItem = nil then
                    UpdateColumns;
                    
                  ReReadItems(RootItem, (RootItem = nil) or TInfoGridNode(RootItem).Loaded, nil);

                  if (RootItem = nil) and (Items.Count > 0) and (Selected = nil) then
                    DelayedSelect(Items[0]);
                end;

              evFieldListChange: ;

              evRowChanged: RowChanged(node);

              evFieldChanged: ReReadNode(node, true);

              evRowDeleted: RowDeleted(node);

              evRowInserted:
                begin
                  fDataEditedNodes.Count := 0;

                  if not IsVarEqualToString(EventData^, NullBookMark) then
                    RowInserted(IUnknown(EventSource) as IDCRowSet, RootItem)
                  else
                    ReReadItems(RootItem, false, nil);
                end;

              evRecordChanged:
                begin
                  RecordChanged(RootItem);
                  fDataEditedNodes.Count := 0;
                end;

              evEditStarted:
                if node <> nil then
                  begin
                    if fDataEditedNodes.IndexOf(node) < 0 then
                      fDataEditedNodes.Add(node);

                    fOldBookMark := EventData^;
                  end
                else
                  fOldBookMark := NullBookMark;

              evEditCanceled:
                begin
                  TreeView_EndEditLabelNow(Handle, true);

                  with fDataEditedNodes do
                    begin
                      for i := 0 to Count - 1 do
                        ReReadNode(TInfoGridNode(fDataEditedNodes.List[i]), true);

                      Count := 0;
                    end;
                end;

              evBeforePost:
                begin
                  fIgnoreNodeChange := true;
                  try
                    TreeView_EndEditLabelNow(Handle, false);
                  finally
                    fIgnoreNodeChange := false;
                  end;
                end;

              evFieldsChanged:
                begin
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

function TCustomDCInfoGrid.GetDisplayName(node: TDCTreeNode): string;
begin
  if node = nil then
    result := fDisplayName
  else
    result := TInfoGridNode(node).DisplayField;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.ChangeNode2(node: TDCTreeNode; const iBookMark: IDCBookMark;
  const iRow: IUnknown);
var
  iProps: IDCProperties;
  _fields: TInterfaceList;
begin
  iRow.QueryInterface(IDCProperties, iProps);

  _fields := TInterfaceList.Create;
  try
    DCPropsByNames2(iProps, GetDisplayName(node.Parent), _fields);
    if _fields.Count > 0 then
      ChangeNode(node, iBookMark, _fields, iRow);
  finally
    _fields.Free;
  end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.ChangeNodeImages(node: TDCTreeNode; const iRow: IUnknown);
var
  iProps: IDCProperties;
begin
  iRow.QueryInterface(IDCProperties, iProps);
  with TInfoGridNode(node) do
    begin
      GetDCPropByName(iProps, self.ImageField, fImageField);
      GetDCPropByName(iProps, self.StateImageField, fStateImageField);
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.ChangeNode(node: TDCTreeNode; const iBookMark: IDCBookMark;
  AFields: TInterfaceList; const iRow: IUnknown);
var
  i: integer;
begin
  with TInfoGridNode(node) do
    begin
      fFields.Count := AFields.Count;
      for i := 0 to AFields.Count - 1 do
        fFields[i] := AFields[i];

      ReadColumns(node);

      BookMark := iBookMark.GetBookMark;

      if Row <> iRow then
        begin
          RemoveHandler(Row);
          AddHandler(iRow, DWORD(node));
        end;

      if (self.ImageField <> '') or (self.StateImageField <> '') then
        ChangeNodeImages(node, iRow);

      Row := iRow;
    end;
end;

{------------------------------------------------------------------}

function TCustomDCInfoGrid.ObtainDisplayName(const iDisplayField: IDCDisplayField): string;
var
  ccount : integer;
  i      : integer;
begin
  if iDisplayField <> nil then
    result := iDisplayField.DisplayFieldName
  else
    begin
      result := '';
      ccount := Columns.Count;
      if ccount > 0 then
        begin
          result := TDCInfoGridColumn(Columns.CreateItems[0]).DataField;
          for i := 1 to ccount - 1 do
            result := result + ';' + TDCInfoGridColumn(Columns.CreateItems[i]).DataField;
        end;
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.GetRowSetAndBookMark(Item: TDCTreeNode; var iRowSet: IDCRowSet; var iBookMark: IDCBookMark);
begin
  if Item = nil then
    iRowSet := fRowSet
  else
    with TInfoGridNode(Item) do
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

function TCustomDCInfoGrid.CheckFolder(const Folder: IUnknown): boolean;
begin
  result := (Folder <> nil) and (not (igoOnlyFolders in Options) or IsRowSetFolder(Folder));
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.ClearNodeList(RootItem: TDCTreeNode);
var
  nodelist: TSortedNodeList;
begin
  nodelist := GetNodeList_(self, RootItem);
  if nodelist <> nil then
    nodelist.Clear;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.ClearLevel(RootItem: TDCTreeNode);
begin
  if RootItem <> nil then
    RootItem.HasChildren := false;

  ClearNodeList(RootItem);
  RemoveSubItems(RootItem);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.RemoveExtraNodes(node: TDCTreeNode);
var
  _node: TDCTreeNode;
begin
  while node <> nil do
    begin
      _node := node.GetNextSibling;
      FreeNode(node);
      node := _node;
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.ActivateLevel(node: TDCTreeNode);
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

procedure TCustomDCInfoGrid.LoadNode(RootItem: TDCTreeNode; var node: TDCTreeNode;
  const iBookMark: IDCBookMark;
  AFields: TInterfaceList; const iRow: IUnknown);
begin
  if node = nil then
    node := AddNode(RootItem, '');

  _NodeInLoad := Node;
  ChangeNode(node, iBookMark, AFields, iRow);
  RereadNode(node, false);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.ReReadItems(RootItem: TDCTreeNode; ForceLoad: boolean; NodeToReread: TDCTreeNode);
var
  node: TInfoGridNode;
  IsLoaded: boolean;
  iNavigation: IDCNavigation;
  iDisplayField: IDCDisplayField;
  iRowSet: IDCRowSet;
  iProps: IDCProperties;
  emptynode: boolean;
  fLevelNodes: TList;
  DisplayName: string;
  ParentBookList: TStrings;
  iBookMark: IDCBookMark;
  iBookMarkEx: IDCBookMarkEx;
  fSaveSelBookMark: TDCBookMark;
  fNeedRestoreSel: boolean;
  {-----------------------------------}

  procedure InitNode;
  begin
    if RootItem = nil then
      begin
        node := TInfoGridNode(Items.GetFirstNode);
        IsLoaded := true;
      end
    else
      begin
        node := TInfoGridNode(RootItem.GetFirstChild);
        IsLoaded := TInfoGridNode(RootItem).Loaded;
      end;

    DisplayName := ObtainDisplayName(iDisplayField);

    if RootItem = nil then
      fDisplayName := DisplayName
    else
      TInfoGridNode(RootItem).DisplayField := DisplayName;
  end;

  {-----------------------------------}

  procedure StartParentUpdates(Item: TDCTreeNode);
  var
    iParentRowset: IDCRowSet;
    iParentBookMark: IDCBookMark;
    iParentBookMarkEx: IDCBookMarkEx;
  begin
    if Item <> nil then
    begin
      GetRowSetAndBookMark(Item.Parent, iParentRowset, iParentBookMark);
      if not RowsetConnected(iParentRowset) then
        exit;

      if IsPassThrough(TInfoGridNode(Item).Row) or not BookMarkValid(iParentBookMark, TInfoGridNode(Item).BookMark) then
        StartParentUpdates(Item.Parent);

      ParentBookList.Add(StartUpdates(iParentRowSet, iParentBookMark));

      //        if not BookMarkValid(iParentBookMark, TInfoNode(Item).BookMark) then
      ActivateLevel(Item.Parent);

      if iParentBookMark.QueryInterface(IDCBookMarkEx, iParentBookMarkEx) = S_OK then
        with iParentBookMarkEx do
          if CompareBookMarks(TInfoGridNode(Item).BookMark, GetBookMark) = 0 then
            exit;

      SafeGotoBookMark(iParentBookMark, TInfoGridNode(Item).BookMark);
    end;
  end;

  {-----------------------------------}

  procedure FinishParentUpdates(Item: TDCTreeNode);
  var
    iParentRowset: IDCRowSet;
    iParentBookMark: IDCBookMark;
    pcount: integer;
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
    _fields: TInterfaceList;
    iRow: IUnknown;
    NextNode: TInfoGridNode;
  begin
    _fields := TInterfaceList.Create;
    try
      with iNavigation do
        try
          ClearNodeList(RootItem);
          while not GetEOF do
            begin
              DisplayName := ObtainDisplayName(iDisplayField);
              iRow := iRowSet.GetRow;
              iRow.QueryInterface(IDCProperties, iProps);
              DCPropsByNames2(iProps, DisplayName, _fields);

              NextNode := nil;
              if node <> nil then
                NextNode := TInfoGridNode(node.GetNextSibling);

              if _Fields.Count > 0 then
                begin
                  LoadNode(RootItem, TDCTreeNode(node), iBookMark, _Fields, iRow);

                  if _NodeInLoad <> nil then
                    begin
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
                    end;

                  Node := NextNode;
                end;

              Next;
            end;
        except
          ClearLevel(RootItem);
          fLevelNodes.Clear;
          raise
        end;
    finally
      _fields.Free;
    end;
  end;

  {-----------------------------------}

  procedure FinishLevelLoading;
  begin
    if RootItem <> nil then
      with TInfoGridNode(RootItem) do
        Loaded := Loaded or ForceLoad;

    if emptynode or (RootItem = nil) or TInfoGridNode(RootItem).Loaded then
      RemoveExtraNodes(node);

    if emptynode and (RootItem <> nil) then
      RootItem.HasChildren := false;
  end;

  {-----------------------------------}

var
  fSaveBookMark   : TDCBookMark;
  i               : integer;
  callupdateevent : boolean;
  readchild       : boolean;
begin
  if csLoading in ComponentState then
    exit;
    
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
          fSaveSelBookMark := TInfoGridNode(Selected).BookMark;
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
              readchild := fLoadAll or (igoCheckChilds in Options);
              for i := 0 to Count - 1 do
                begin
                  if (NodeToReread = nil) or (NodeToReread = List[i]) then
                    begin
                      if readchild then
                        ReReadItems(List[i], false, nil)
                      else
                        TDCTreeNode(List[i]).HasChildren := true;
                    end;

                  if Assigned(OnNodeLoaded) then
                    OnNodeLoaded(self, TDCTreeNode(List[i]));
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

procedure TCustomDCInfoGrid.RescanItems(RootItem: TDCTreeNode);
begin
  ReReadItems(RootItem, true, nil);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.RescanNodeWithChildren(Item: TDCTreeNode);
begin
  if Item <> nil then
    ReReadItems(Item.Parent, true, Item);
end;

{------------------------------------------------------------------}

function TCustomDCInfoGrid.IsColumnsStored : boolean;
begin
  result := TMColumns(Columns).UpdatedByUser;
end;

{------------------------------------------------------------------}

function TCustomDCInfoGrid.GetDefaultColumnWidth(FieldWidth : integer; Column : TDCTreeColumn) : integer;
var
  hAllocated : boolean;
  tm         : TTextMetric;
  cwidth     : integer;
begin
  hAllocated := HandleAllocated;
  if not hAllocated then
    Canvas.Handle := GetDC(0);
  try
    Canvas.Font := Font;
    GetTextMetrics(Canvas.Handle, tm);
    result := FieldWidth * (Canvas.TextWidth('0') - tm.tmOverhang) + tm.tmOverhang;
    Canvas.Font := Column.Font;
    cwidth := Canvas.TextWidth(Column.Caption) + (ColumnTextSpaceLeft + ColumnTextSpaceRight);
    if result < cwidth then
      result := cwidth;
    inc(result, 4);
  finally
    if not hAllocated then
      begin
        ReleaseDC(0, Canvas.Handle);
        Canvas.Handle := 0;
      end;
  end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.UpdateColumns;
var
  iFields : IDCColumns;
  column  : TDCInfoGridColumn;
  iProp   : IDCProperty;
  iField  : IDCField;
  i       : integer;
begin
  if (fRefreshDataLock > 0) or (csLoading in ComponentState) then
    exit;

  inc(fRefreshDataLock);
  try
    with TMColumns(Columns) do
      if not UpdatedByUser then
        if RowsetConnected(fRowSet) then
          try
            BeginSelfUpdates;
            BeginUpdate;
            Clear;
            iFields := fRowSet.GetFields;
            for i := 0 to iFields.Count - 1 do
              begin
                column := TDCInfoGridColumn(Add);
                iProp := iFields[i] as IDCProperty;
                column.fDataField := iProp.Name;
                if iProp.QueryInterface(IDCField, iField) = S_OK then
                  begin
                    column.Caption := iField.GetDisplayName;
                    column.Width := GetDefaultColumnWidth(iField.GetDisplayWidth, column);
                  end;
              end;
          finally
            EndUpdate;
            EndSelfUpdates;
          end
        else
          Columns.Clear;
  finally
    dec(fRefreshDataLock);
  end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.RefreshData;
begin
  if fRefreshDataLock = 0 then
    try
      inc(fRefreshDataLock);

      if fRowSet = nil then
        begin
          (inherited Items).Clear;
          UpdateColumns;
        end
      else
        begin
          GetImages(fRowSet);
          UpdateColumns;
          ReScanItems(nil);
        end;
    finally
      dec(fRefreshDataLock);
    end;
end;

{------------------------------------------------------------------}

function TCustomDCInfoGrid.GetIBookMark(Item: TDCTreeNode): IDCBookMark;
var
  _rset: IDCRowSet;
begin
  _rset := GetRowSet(Item);
  if _rset <> nil then
    _rset.QueryInterface(IDCBookMark, result)
  else
    result := nil;
end;

{------------------------------------------------------------------}

function TCustomDCInfoGrid.GetIRowChange(Item: TDCTreeNode): IDCRowChange;
begin
  result := GetIDCRowChange(GetIUnknown(Item));
end;

{------------------------------------------------------------------}

function TCustomDCInfoGrid.LocateNode(AItem: TDCTreeNode; DoNotifyDetails: boolean): boolean;
var
  iBookMark: IDCBookMark;
  iRowSet: IDCRowSet;
  iBookMarkEx: IDCBookMarkEx;
  pnode: TDCTreeNode;

  {-----------------------------------}

  procedure CheckValid;
  begin
    result := BookMarkValid(iBookMark, TInfoGridNode(AItem).BookMark);
  end;

  {-----------------------------------}

begin
  result := AItem <> nil;

  if result then
    with TInfoGridNode(AItem) do
    begin
      fTimer.Enabled := false;
      pnode := Parent;
      GetRowSetAndBookMark(pnode, iRowSet, iBookMark);
      result := RowSetConnected(iBookMark);

      if result then
        begin
          if iBookMark.QueryInterface(IDCBookMarkEx, iBookMarkEx) = S_OK then
            with iBookMarkEx do
              if CompareBookMarks(TInfoGridNode(AItem).BookMark, GetBookMark) = 0 then
                exit;

          try
            inc(fIgnoreRowChange);

            CheckValid;

            if not result or (igoLocateParent in Options) then
              begin
                LocateNode(pnode, false);

                CheckValid;
                if not result then
                  begin
                    ActivateLevel(pnode);

                    CheckValid;

                    if not result then
                      exit;
                  end;
              end;

            iBookMark.GotoBookmark(BookMark);

          finally
            dec(fIgnoreRowChange);
          end;
        end;
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.SetToNodeAndSelect(Item: TDCTreeNode);
begin
  if SetToNode(Item) then
    Selected := Item;
end;

{------------------------------------------------------------------}

function TCustomDCInfoGrid.SetToNode(Item: TDCTreeNode): boolean;
begin
  result := LocateNode(Item, true);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.NodeChanged(AItem: TDCTreeNode; const NewText: string);
var
  processed: boolean;
  iField: IDCProperty;
  _fieldname: string;
begin
  if (AItem <> nil) and (fRowChange <> nil) then
  try
    inc(fIgnoreRowChange);
    try
      processed := false;
      iField := TInfoGridNode(AItem).Fields[CurrentColumnCreateIndex];
      if iField <> nil then
        _fieldname := iField.Name
      else
        _fieldname := '';

      if Assigned(fOnInfoFieldSet) then
        fOnInfoFieldSet(self, AItem, _fieldname, NewText, CurrentColumnCreateIndex, processed);

      if (not processed) and (iField <> nil) then
        iField.SetValue(NewText);

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

function TCustomDCInfoGrid.CanEdit(Item: TDCTreeNode): boolean;
var
  iCanRowChange: IDCCanRowChange;
  processed: boolean;
  //iField: IDCProperty;
begin
  Result := inherited CanEdit(Item);
  if not Result then
    Exit;
  fRowChange := GetIRowChange(Item.Parent);

  FlushDelayedSelection;

  result := (fRowChange <> nil) and SetToNode(Item);

  if result then
    begin
      fRowChange.QueryInterface(IDCCanRowChange, iCanRowChange);
      if iCanRowChange <> nil then
        Result := iCanRowChange.CanEdit;
    end;

  if result then
    begin
      processed := false;
      if Assigned(OnInfoStartEdit) then
        OnInfoStartEdit(self, Item, processed);

      if not processed then
        fRowChange.Edit;

      fEditedNode := Item;
    end;

  if not result then
    fRowChange := nil;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.CancelEdit;
var
  processed: boolean;
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

procedure TCustomDCInfoGrid.SelectionChanged;
var
  sel: TDCTreeNode;
begin
  if (fInUpdate = 0) then
  begin
    sel := Selected;
    if sel <> fLastSelectedNode then
      begin
        try
          LocateNode(sel, false);
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

procedure TCustomDCInfoGrid.DoExpandNode(Node: TDCTreeNode);
var
  newsel: TDCTreeNode;
begin
  if not TInfoGridNode(node).Loaded then
    begin
      ReReadItems(node, true, nil);
      if fSelectInsert then
        begin
          fSelectInsert := false;
          newsel := TInfoGridNode(node)._BookMarkToNode(fInsertedBookMark);
          if newsel <> nil then
            begin
              fTimer.Enabled := false;
              Selected := newsel;
            end;
        end;
    end;
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.Edit(Node: TDCTreeNode; var NewText: string);
begin
  NodeChanged(Node, NewText);
end;

{------------------------------------------------------------------}

function TCustomDCInfoGrid.GetEditorClass(Node: TDCTreeNode; AColumn: integer): TControlClass;
var
  Prop    : IDCProperty;
  edclass : string;
  Column  : TDCInfoGridColumn;
begin
  result := nil;
  if (AColumn < Columns.Count) and (Node is TInfoGridNode) then
    begin
      Column := TDCInfoGridColumn(Columns[AColumn]);
      edclass := Column.EditorClass;
      if edclass <> '' then
        result := GetInfoGridEditorByName(edclass)
      else
        begin
          if Column <> nil then
            Prop := TInfoGridNode(Node).Fields[Column.CreateIndex];

          if Prop <> nil then
            Result := GetInfoGridEditorByType(Prop.GetPropType);
        end;
    end;

  if Result = nil then
    Result := inherited GetEditorClass(Node, AColumn);
end;

{------------------------------------------------------------------}

procedure TCustomDCInfoGrid.GetImages(const iRowSet: IDCRowSet);

  procedure SetImages(Images, State: TCustomImageList);
  begin
    inherited Images := TImageList(Images);
    inherited StateImages := TImageList(State);
  end;

var
  iImages: IDCImages;
begin
  if UseInfoImages and (iRowSet.QueryInterface(IDCImages, iImages) = S_OK) then
    with iImages do
      SetImages(GetSmallImages, GetStateImages)
  else
    SetImages(Images, StateImages);
end;

end.
