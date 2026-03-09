{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit dciset;

interface
{$I dc.inc}

uses
  windows, activex, classes, typinfo, comctrls,
  dcInfoLib, dcdreamlib, 
  controls{$IFDEF D4},imglist{$ENDIF}, menus, dchook, dcconsts
  {$IFDEF D6} ,Variants {$ENDIF}
  ;

type
  TObjectWrapper = class(TPersistent)
  private
    fInstance : TObject;
  public

    property Instance : TObject read fInstance write fInstance;
  end;

  TObjectWrapperClass = class of TObjectWrapper;

  TDCObjectProperty = class(TInterfacedObject, IDCColumn, IDCProperty)
  private
    fPropInfo : PPropInfo;
    fInstance : TPersistent;
    fOwner    : IUnknown;

    fOnChange : TNotifyEvent;

    {IDCProperty}
    Function  GetAttributes:TPropAttributes;
    Function  GetPropType:TDCPropType;
    Function  GetName : string;
    Function  GetSize:Integer;
    Function  GetValue:Variant;
    Function  GetString:String;
    Function  GetText:String;
    Procedure SetValue(const Value:Variant);
  public
    constructor Create(Instance : TPersistent; PropInfo : PPropInfo; const Owner : IUnknown);
    destructor  Destroy; override;

    property PropInfo : PPropInfo read fPropInfo write fPropInfo;
    property Instance : TPersistent read fInstance write fInstance;

    property OnChange : TNotifyEvent read fOnChange write fOnChange;
  end;

  TDCLinkProperties = class(TDCInterfacedObject, IDCProperties)
  private
    fLink  : TPersistent;
    fRealLink : TPersistent;
    fProps : TList;
    fWrapper : TObjectWrapper;

    fOnChange : TPropChangeEvent;

    procedure AddPropInfo(Instance : TPersistent; PropInfo : PPropInfo; UserData : Integer);
    procedure SetLink(val : TPersistent);

    procedure PropChanged(Prop : TObject);
    procedure Notification(Instance : TObject);
  protected
    {IUnknown}

    {IDCProperties}
    Function GetItem(Index:Integer) : IUnknown;
    Function GetCount : Integer;

  public
    constructor Create(ALink : TPersistent);
    destructor  Destroy; override;

    function QueryInterface(const IID: TGUID; out Obj): HRESULT; override;stdcall;

    property Link : TPersistent read fLink write SetLink;

    property OnChange : TPropChangeEvent read fOnChange write fOnChange;
  end;

  TIndexedInfoSet = class(TCustomInfoSet, IDCBookmark, IDCNavigation, IDCRowSet,
                          IDCRowChange, IDCCanRowChange, IDCConnect, IDCLink)
  private
    fCurIndex : integer;
    fLink     : TPersistent;
    fLinkedComp : TDCLinkedComponent;
    fLinkClass : TClass;

    fAllowAppend : boolean;
    fAllowInsert : boolean;

    procedure SetLink(val : TPersistent);
    procedure AfterInsert(item : pointer);
    procedure Notification(AComponent : TComponent; Operation : TOperation);
  protected
    procedure PropsChanged(Sender : TObject; const PropName : string);

    {IDCBookmark}
    function  GetBookmark : TDCBookMark;
    Procedure GotoBookmark(const Bookmark:TDCBookMark);

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

    {IDCRowChange}
    Procedure Append;
    Procedure Cancel;
    Procedure Delete;
    Procedure Edit;
    Procedure Insert;
    Procedure Post;

    {IDCCanRowChange}
    Function CanAppend:Boolean;
    Function CanEdit:Boolean;
    Function CanDelete:Boolean;
    Function CanInsert:Boolean;
    Function CanView:Boolean;

    {IDCConnect}
    Function GetConnected:Boolean;
    Procedure SetConnected(Value:Boolean);

    {IDCLink}
    function GetLink : TPersistent;

    function ValidIndex(index : integer) : boolean; virtual;

    function ItemByIndex(index : integer) : pointer;

    function IndexToItem(index : integer) : pointer; virtual; abstract;
    function ItemToIndex(item : pointer) : integer; virtual; abstract;
    function GetItemsCount : integer; virtual; abstract;
    function InsertNewItem(index : integer) : pointer; virtual;
    function AddNewItem : pointer; virtual;
    function GetItemClass : TClass; virtual;

    procedure RowChanged;
    procedure ValidateIndex(var index : integer);

    procedure LinkDestroyed; virtual;
//    procedure LinkChanged; virtual;
    procedure NotifyDelete(Instance : TObject);
    function  ValidLink : TPersistent;

    property CurIndex:Integer read FCurIndex;
    property LinkClass : TClass read fLinkClass;
  public
    constructor Create; override;
    destructor  Destroy; override;

    property Link : TPersistent read GetLink write SetLink;
  end;

  TIndexedInfoSetClass = class of TIndexedInfoSet;

  TCollectionInfoSet = class(TIndexedInfoSet)
  protected
    function IndexToItem(index : integer) : pointer; override;
    function ItemToIndex(item : pointer) : integer; override;
    function GetItemsCount : integer; override;
    function InsertNewItem(index : integer) : pointer; override;
    function AddNewItem : pointer; override;
    function GetItemClass : TClass; override;
  end;

  TDCMultiInfoSetItem = class(TDCNamedItem, IUnknown, IDCDisplayField, IDCEventHandler,
                              IDCEvents)
  private
    fLinkedComp : TDCLinkedComponent;
    fCaption    : string;
    fDisplayField : string;
    fRefCount   : integer;
    fiInfoSet   : IUnknown;
    fNotifiers : IDCEventsEx;


    function  GetInfoSet : TComponent;
    procedure SetInfoSet(val : TComponent);
    procedure SetInfoSetI(const Value:IUnknown);

    {IUnknown}
    function QueryInterface(const IID: TGUID; out Obj): HRESULT; stdcall;

    {IDCDisplayField}
    function GetDisplayFieldName : string;

    {IDCEventHandler}
    Procedure HandleEvent(const EventRec:PEventRec);

    {IDCEventsEx}
    procedure CallHandlers(const EventRec:PEventRec);
    Procedure RegisterHandler(const EventHandler : IDCEventHandler; EventTypes, UserData : DWORD);
    Procedure UnregisterHandler(const EventHandler : IDCEventHandler);

    procedure SetCaption(const val : string);
    procedure SetDisplayField(const val : string);

    procedure DeleteNotification(AComponent : TComponent; Operation : TOperation);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;

    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;

    property InfoSeti:IUnknown read FiInfoSet write SetInfoSeti;
  published
    property Caption : string read fCaption write SetCaption;
    property InfoSet : TComponent read GetInfoSet write SetInfoSet;
    property DisplayField : string read fDisplayField write SetDisplayField;
  end;

  TDCMultiInfoSetItems = class(TCustomDCNamedItems)
  private
    FCollectionSet:TCollectionInfoSet;
    function GetItem(index : integer) : TDCMultiInfoSetItem;
    Procedure SetCollectionSet(const Value:TCollectionInfoSet);
    procedure SetItem(index : integer; val : TDCMultiInfoSetItem);
  protected   
    procedure Update(Item : TCollectionItem); override;
  public
    Constructor Create(AOwner:TComponent;ItemClass: TDCNamedItemClass);override;

    Property CollectionSet:TCollectionInfoSet read FCollectionSet write SetCollectionSet;
    property Items[index : integer] : TDCMultiInfoSetItem read GetItem write SetItem; default;
  end;

  TDCMultiInfoSet = class(TComponent, IUnknown)
  private
    fInfoSets : TDCMultiInfoSetItems;
    fColSet   : TCollectionInfoSet;

    FVersion  : TDCInfoTreeVersion;
    procedure SetSources(val : TDCMultiInfoSetItems);
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  published
    property InfoSets : TDCMultiInfoSetItems read fInfoSets write SetSources;
    property Version : TDCInfoTreeVersion read FVersion write FVersion stored false;
  end;

  TListViewInfoSet = class(TIndexedInfoSet, IDCImages)
  private
    function ListItems : TListItems;
  protected
    {IDCImages}
    function GetLargeImages : TCustomImageList;
    function GetSmallImages : TCustomImageList;
    function GetStateImages : TCustomImageList;

    function IndexToItem(index : integer) : pointer; override;
    function ItemToIndex(item : pointer) : integer; override;
    function GetItemsCount : integer; override;
    function InsertNewItem(index : integer) : pointer; override;
    function AddNewItem : pointer; override;
    function GetItemClass : TClass; override;
  public
    constructor Create; override;
  end;

  TRemoteIndexedInfoSet = class(TIndexedInfoSet)
  private
    fList : TList;
    fNoUpdates : boolean;

  protected
    procedure ClearItems;
    procedure FillList; virtual; abstract;

    function IndexToItem(index : integer) : pointer; override;
    function ItemToIndex(item : pointer) : integer; override;
    function GetItemsCount : integer; override;

    procedure ActiveChanged; override;

    property List : TList read fList;
    property NoUpdates : boolean read fNoUpdates;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

(*
  TDistinctInfoSet = class(TRemoteIndexedInfoSet)
  private
    fDistinctFields : TStrings;

    procedure SetInfoSet(const val : IUnknown);
  protected
    procedure FillList; override;
  public
    constructor Create; override;
    destructor  Destroy; override;

    property InfoSet : IUnknown read fInfoSet write SetInfoSet;
    property DistinctFields : TStrings read fDistinctFields write SetDistinctFields;
  end;
*)
  TStringsInfoSet = class(TRemoteIndexedInfoSet)
  private
    procedure DeleteItem(index : integer);
    procedure ShiftItems(startindex : integer; delta : integer);
  protected
    function CreateItem(index : integer) : TObject; virtual;
    function InsertNewItem(index : integer) : pointer; override;
    function AddNewItem : pointer; override;
    function GetItemClass : TClass; override;

    procedure FillList; override;
  end;

  TMenuInfoSet = class(TRemoteIndexedInfoSet)
  private
    fParentInfoSet : TMenuInfoSet;

    function GetMenuItem(var item : TMenuItem) : boolean;
    function CreateItem(Item : TMenuItem) : TMenuInfoSet;
    function _insertitem(index : integer) : pointer;
  protected
    function InsertNewItem(index : integer) : pointer; override;
    function AddNewItem : pointer; override;
    function GetItemClass : TClass; override;

    procedure FillList; override;
  public
    destructor Destroy; override;
  end;

  TTreeInfoSet = class(TRemoteIndexedInfoSet, IDCImages)
  private
    fParentInfoSet : TTreeInfoSet;

    function CreateNode(Item : TTreeNode) : TTreeInfoSet;
    function _insertitem(index : integer) : pointer;
    function GetNodes(var nodes : TTreeNodes) : boolean;

    {IDCImages}
    function GetLargeImages : TCustomImageList;
    function GetSmallImages : TCustomImageList;
    function GetStateImages : TCustomImageList;

  protected
    function InsertNewItem(index : integer) : pointer; override;
    function AddNewItem : pointer; override;
    function GetItemClass : TClass; override;

    procedure FillList; override;
    procedure LinkDestroyed; override;
  public
    constructor Create; override;
    destructor  Destroy; override;
  end;

  TDCCustomInfoSet = class(TComponent, IUnknown)
  private
    fInfoSet    : TIndexedInfoSet;

    procedure SetLink(val : TPersistent);
    function GetLink : TPersistent;

  protected
    function  GetInfoSetClass : TIndexedInfoSetClass; virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner : TComponent); override;

    property InfoLink : TPersistent read GetLink write SetLink;
  end;

  TDCLinkInfoSet = class(TDCCustomInfoSet)
  private
    fLink       : TPersistent;
    fPropName   : string;

    function  GetLink : TComponent;
    procedure SetLink(val : TComponent);
    procedure SetPropName(const val : string);

  protected
    procedure ResetData;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

  published
    property Link : TComponent read GetLink write SetLink;
    property PropName : string read fPropName write SetPropName;
  end;

  TDCMenuInfoSet = class(TDCCustomInfoSet)
  private
    procedure SetMenu(val : TMenu);
    function  GetMenu : TMenu;

    procedure SetLink(val : TComponent);
    function  GetLink : TComponent;
  protected
    function  GetInfoSetClass : TIndexedInfoSetClass; override;

    property Menu : TMenu read GetMenu write SetMenu;
  published
    property Link : TComponent read GetLink write SetLink;
  end;

  TDCStringsInfoSet = class(TDCLinkInfoSet)
  private
    function  GetStrings : TStrings;
    procedure SetStrings(val : TStrings);
  protected
    function GetInfoSetClass : TIndexedInfoSetClass; override;
  public
    property Strings : TStrings read GetStrings write SetStrings;
  end;

  TDCCollectionInfoSet = class(TDCLinkInfoSet)
  private
    function  GetCollection : TCollection;
    procedure SetCollection(val : TCollection);
  protected
    function GetInfoSetClass : TIndexedInfoSetClass; override;
  public
    property Collection : TCollection read GetCollection write SetCollection;
  end;

  TDCListViewInfoSet = class(TDCCustomInfoSet)
  private
    function GetListView : TCustomListView;
    procedure SetListView(val : TCustomListView);
  protected
    function GetInfoSetClass : TIndexedInfoSetClass; override;
  published
    property ListView : TCustomListView read GetListView write SetListView;
  end;

  TDCTreeViewInfoSet = class(TDCCustomInfoSet)
  private
    function GetTreeView : TCustomTreeView;
    procedure SetTreeView(val : TCustomTreeView);
  protected
    function GetInfoSetClass : TIndexedInfoSetClass; override;
  published
    property TreeView : TCustomTreeView read GetTreeView write SetTreeView;
  end;

procedure RegisterObjectWrapper(AObjectClass : TClass; AWrapperClass : TObjectWrapperClass);

implementation

{------------------------------------------------------------------}

type
  TWrapperInfo = class
    ObjectClass : TClass;
    WrapperClass : TObjectWrapperClass;
  end;

  TWrappersList = class(TSortedKeyList)
  protected
    function KeyByItem(Item:Pointer) : pointer; override;
  end;


  TClassFields = class(TInterfacedObject, IDCColumns, IDCProperties)
  private
    fPropList : TList;
    {IDCColumns}
    Function GetCount : integer;
    Function GetItem(Index : integer) : IUnknown;
  public
    constructor Create(C : TClass);
  end;

function TWrappersList.KeyByItem(Item : Pointer) : pointer;
begin
  result := TWrapperInfo(Item).ObjectClass;
end;


{******************************************************************}

var
  fObjectWrappers : TWrappersList;

function ObjectWrappers : TWrappersList;
begin
  if fObjectWrappers = nil then
    fObjectWrappers := TWrappersList.Create;

  result := fObjectWrappers;
end;

{******************************************************************}

function  GetWrapperClass(ObjectClass : TClass) : TObjectWrapperClass;
var
  info : TWrapperInfo;
begin
  info := TWrapperInfo(ObjectWrappers.ItemByKey(ObjectClass));
  if info <> nil then
    result := info.WrapperClass
  else
    result := nil;
end;


{******************************************************************}


procedure RegisterObjectWrapper(AObjectClass : TClass; AWrapperClass : TObjectWrapperClass);
var
  info : TWrapperInfo;
begin
  info := TWrapperInfo(ObjectWrappers.ItemByKey(AObjectClass));
  if info <> nil then
    info.WrapperClass := AWrapperClass
  else
    begin
      info := TWrapperInfo.Create;
      info.ObjectClass := AObjectClass;
      info.WrapperClass := AWrapperClass;
      ObjectWrappers.Add(info);
    end;
end;

{------------------------------------------------------------------}

{******************************************************************}

type
  TListItemWrapper = class(TObjectWrapper)
  private
    function  ListItem : TListItem;

    function  GetCaption : string;
    procedure SetCaption(const val : string);
    function  GetImageIndex : integer;
    procedure SetImageIndex(val : integer);
    function  GetStateIndex : Integer;
    procedure SetStateIndex(val : integer);
    function  GetSubItems : TStrings;
    procedure SetSubItems(val : TStrings);

  public
    destructor Destroy; override;
  published
    property Caption:string read GetCaption write SetCaption;
    property ImageIndex:Integer read GetImageIndex write SetImageIndex;
    property StateIndex :integer read GetStateIndex write SetStateIndex;
    property SubItems: TStrings read GetSubItems write SetSubItems;
  end;


destructor TListItemWrapper.Destroy;
begin
  inherited;
end;

{------------------------------------------------------------------}

function TListItemWrapper.ListItem : TListItem;
begin
  result := TListItem(Instance);
end;

{------------------------------------------------------------------}

function  TListItemWrapper.GetCaption : string;
begin
  result := ListItem.Caption;
end;

{------------------------------------------------------------------}

procedure TListItemWrapper.SetCaption(const val : string);
begin
  ListItem.Caption := val;
end;

{------------------------------------------------------------------}

function  TListItemWrapper.GetImageIndex : integer;
begin
  result := ListItem.ImageIndex;
end;

{------------------------------------------------------------------}

procedure TListItemWrapper.SetImageIndex(val : integer);
begin
  ListItem.ImageIndex := val;
end;

{------------------------------------------------------------------}

function  TListItemWrapper.GetStateIndex : Integer;
begin
  result := ListItem.StateIndex;
end;

{------------------------------------------------------------------}

procedure TListItemWrapper.SetStateIndex(val : integer);
begin
  ListItem.StateIndex := val;
end;

{------------------------------------------------------------------}

function  TListItemWrapper.GetSubItems : TStrings;
begin
  result := ListItem.SubItems;
end;

{------------------------------------------------------------------}

procedure TListItemWrapper.SetSubItems(val : TStrings);
begin
  ListItem.SubItems := val;
end;

{******************************************************************}

type
  TTreeNodeWrapper = class(TObjectWrapper)
   private
    function  TreeNode : TTreeNode;
    function  GetImageIndex : integer;
    procedure SetImageIndex(val : integer);
    function  GetSelectedIndex : integer;
    procedure SetSelectedIndex(val : integer);
    function  GetStateIndex : integer;
    procedure SetStateIndex(val : Integer);
    function  GetText : string;
    procedure SetText(const val : string);
  published
    property ImageIndex : integer read GetImageIndex write SetImageIndex;
    property SelectedIndex : integer read GetSelectedIndex write SetSelectedIndex;
    property StateIndex : integer read GetStateIndex write SetStateIndex;
    property Text : string read GetText write SetText;
  end;

function TTreeNodeWrapper.TreeNode : TTreeNode;
begin
  result := TTreeNode(Instance);
end;

{------------------------------------------------------------------}

function  TTreeNodeWrapper.GetImageIndex : integer;
begin
  result := TreeNode.ImageIndex;
end;

{------------------------------------------------------------------}

procedure TTreeNodeWrapper.SetImageIndex(val : integer);
begin
  TreeNode.ImageIndex := val;
end;

{------------------------------------------------------------------}

function  TTreeNodeWrapper.GetSelectedIndex : integer;
begin
  result := TreeNode.SelectedIndex;
end;

{------------------------------------------------------------------}

procedure TTreeNodeWrapper.SetSelectedIndex(val : integer);
begin
  TreeNode.SelectedIndex := val;
end;

{------------------------------------------------------------------}

function  TTreeNodeWrapper.GetStateIndex : integer;
begin
  result := TreeNode.StateIndex;
end;

{------------------------------------------------------------------}

procedure TTreeNodeWrapper.SetStateIndex(val : Integer);
begin
  TreeNode.StateIndex := val;
end;

{------------------------------------------------------------------}

function  TTreeNodeWrapper.GetText : string;
begin
  result := TreeNode.Text;
end;

{------------------------------------------------------------------}

procedure TTreeNodeWrapper.SetText(const val : string);
begin
  TreeNode.Text := val;
end;

{******************************************************************}



{******************************************************************}

type
  TStringItem = class(TPersistent)
  private
    fStringsInfoSet : TStringsInfoSet;
    fStringIndex    : integer;

    function  GetText : string;
    procedure SetText(const val : string);
    function  GetStrings : TStrings;
  public
    constructor Create(Owner : TStringsInfoSet; index : integer);
    destructor  Destroy; override;

    property Strings : TStrings read GetStrings;
    property StringIndex : integer read fStringIndex write fStringIndex;
  published
    property Text : string read GetText write SetText;
  end;

constructor TStringItem.Create(Owner : TStringsInfoSet; index : integer);
begin
  inherited Create;
  fStringsInfoSet := Owner;
  fStringIndex := index;
end;

{------------------------------------------------------------------}

destructor  TStringItem.Destroy;
begin
  fStringsInfoSet.DeleteItem(StringIndex);
  inherited;
end;

{------------------------------------------------------------------}

function TStringItem.GetStrings : TStrings;
begin
  result := TStrings(fStringsInfoSet.Link);
end;

{------------------------------------------------------------------}

function TStringItem.GetText : string;
begin
  result := Strings[StringIndex];
end;

{------------------------------------------------------------------}

procedure TStringItem.SetText(const val : string);
begin
  Strings[StringIndex] := val;
end;

{******************************************************************}

constructor TRemoteIndexedInfoSet.Create;
begin
  inherited;
  fList := TList.Create;
end;

{------------------------------------------------------------------}

destructor TRemoteIndexedInfoSet.Destroy;
begin
//  Link := nil;
  inherited;
end;

{------------------------------------------------------------------}

procedure TRemoteIndexedInfoSet.ClearItems;
begin
  fNoUpdates := true;
  try
    ClearList2(fList);
  finally
    fNoUpdates := false;
  end;
end;

{------------------------------------------------------------------}

function TRemoteIndexedInfoSet.GetItemsCount : integer;
begin
  result := fList.Count
end;

{------------------------------------------------------------------}

function TRemoteIndexedInfoSet.IndexToItem(index : integer) : pointer;
begin
  result := fList[index];
end;

{------------------------------------------------------------------}

function TRemoteIndexedInfoSet.ItemToIndex(item : pointer) : integer;
begin
  result := fList.IndexOf(item);
end;

{------------------------------------------------------------------}

procedure TRemoteIndexedInfoSet.ActiveChanged;
begin
  FillList;
  inherited;
end;

{******************************************************************}

function TStringsInfoSet.CreateItem(index : integer) : TObject;
begin
  result := TStringItem.Create(self, index);
  List.Insert(index, result);
end;

{------------------------------------------------------------------}

procedure TStringsInfoSet.FillList;
var
  i : integer;
begin
  ClearItems;
  if Link <> nil then
    with TStrings(Link) do
      for i := 0 to Count - 1 do
        CreateItem(i);
end;

{------------------------------------------------------------------}

procedure TStringsInfoSet.ShiftItems(startindex : integer; delta : integer);
var
  i : integer;
begin
  for i := startindex to fList.Count - 1 do
    inc(TStringItem(List[i]).fStringIndex, delta);
end;

{------------------------------------------------------------------}

procedure TStringsInfoSet.DeleteItem(index : integer);
begin
  if not fNoUpdates then
    begin
      TStrings(ValidLink).Delete(index);
      ShiftItems(index + 1, -1);
      List.Delete(index);      
    end;
end;

{------------------------------------------------------------------}

function TStringsInfoSet.InsertNewItem(index : integer) : pointer;
begin
  ShiftItems(index, 1);
  TStrings(ValidLink).Insert(index, '');
  result := CreateItem(index);
end;

{------------------------------------------------------------------}

function TStringsInfoSet.AddNewItem : pointer;
begin
  result := CreateItem(TStrings(ValidLink).Add(''));
end;

{------------------------------------------------------------------}

function TStringsInfoSet.GetItemClass : TClass;
begin
  result := TStringItem;
end;

{******************************************************************}

function  TDCCollectionInfoSet.GetCollection : TCollection;
begin
  result := TCollection(fInfoSet.Link);
end;

{------------------------------------------------------------------}

procedure TDCCollectionInfoSet.SetCollection(val : TCollection);
begin
  fInfoSet.Link := val;
end;

{------------------------------------------------------------------}

function TDCCollectionInfoSet.GetInfoSetClass : TIndexedInfoSetClass;
begin
  result := TCollectionInfoset;
end;

{******************************************************************}

function  TDCStringsInfoSet.GetStrings : TStrings;
begin
  result := TStrings(fInfoSet.Link);
end;

{------------------------------------------------------------------}

procedure TDCStringsInfoSet.SetStrings(val : TStrings);
begin
  fInfoSet.Link := val;
end;

{------------------------------------------------------------------}

function TDCStringsInfoSet.GetInfoSetClass : TIndexedInfoSetClass;
begin
  result := TStringsInfoset;
end;

{******************************************************************}

procedure TDCMenuInfoSet.SetMenu(val : TMenu);
begin
  InfoLink := val;
end;

{------------------------------------------------------------------}

function  TDCMenuInfoSet.GetMenu : TMenu;
begin
  result := TMenu(InfoLink);
end;

{------------------------------------------------------------------}

procedure TDCMenuInfoSet.SetLink(val : TComponent);
begin
  InfoLink := val;
end;

{------------------------------------------------------------------}

function  TDCMenuInfoSet.GetLink : TComponent;
begin
  result := TComponent(InfoLink);
end;

{------------------------------------------------------------------}

function  TDCMenuInfoSet.GetInfoSetClass : TIndexedInfoSetClass;
begin
  result := TMenuInfoSet;
end;

{******************************************************************}

constructor TDCCustomInfoSet.Create(AOwner : TComponent);
var
  infoclass : TIndexedInfoSetClass;
  unk       : IUnknown;
begin
  inherited;
  infoclass := GetInfoSetClass;
  if infoclass <> nil then
    begin
      fInfoSet := infoclass.Create;
      fInfoSet.QueryInterface(IUnknown, unk);
      unk._AddRef;
      VCLComObject := pointer(unk);
    end;
end;

{------------------------------------------------------------------}

function  TDCCustomInfoSet.GetInfoSetClass : TIndexedInfoSetClass;
begin
  result := nil;
end;

{------------------------------------------------------------------}

function  TDCCustomInfoSet.GetLink : TPersistent;
begin
  result := fInfoSet.Link;
end;

{------------------------------------------------------------------}

procedure TDCCustomInfoSet.SetLink(val : TPersistent);
begin
  fInfoSet.Link := val;
  if val is TComponent then
    TComponent(val).FreeNotification(self);
end;

{------------------------------------------------------------------}

procedure TDCCustomInfoSet.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = InfoLink) then
    InfoLink := nil;
end;

{******************************************************************}

procedure TDCLinkInfoSet.ResetData;
begin
  fInfoSet.Link := TPersistent(GetClassProperty(Link, PropName));
end;

{------------------------------------------------------------------}

function  TDCLinkInfoSet.GetLink : TComponent;
begin
  result := TComponent(fLink);
end;

{------------------------------------------------------------------}

procedure TDCLinkInfoSet.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = Link) then
    Link := nil;
end;

{------------------------------------------------------------------}

procedure TDCLinkInfoSet.SetLink(val : TComponent);
begin
  if val <> fLink then
    begin
      fLink := val;
      if val is TComponent then
        val.FreeNotification(self);

      ResetData;
    end;
end;

{------------------------------------------------------------------}

procedure TDCLinkInfoSet.SetPropName(const val : string);
begin
  if val <> fPropName then
    begin
      fPropName := val;
      ResetData;
    end;
end;

{******************************************************************}

destructor TMenuInfoSet.Destroy;
begin
  if (Link is TMenuItem) and (fParentInfoSet <> nil) then
    with fParentInfoSet do
      begin
        if (UpdateCount = 0) and not fNoUpdates then
          with TComponent(self.Link) do
            if not (csDestroying in ComponentState) then
              Free;

        List.Remove(self);
      end;

  inherited;
end;

{------------------------------------------------------------------}

function TMenuInfoSet.CreateItem(Item : TMenuItem) : TMenuInfoSet;
begin
  result := TMenuInfoSet.Create;
  with result do
    begin
      _AddRef;
      fParentInfoSet := self;
      Link := Item;
    end;

  List.Insert(item.MenuIndex, result);
end;

{------------------------------------------------------------------}

procedure TMenuInfoSet.FillList;
var
  i : integer;
  mitem : TMenuItem;
begin
  ClearItems;
  if GetMenuItem(mitem) then
    with mitem do
      for i := 0 to Count - 1 do
        CreateItem(Items[i]);
end;

{------------------------------------------------------------------}

function TMenuInfoSet.GetMenuItem(var item : TMenuItem) : boolean;
begin
  result := Link <> nil;
  if result then
    if Link is TMenu then
      item := TMenu(Link).Items
    else
      item := TMenuItem(Link);
end;

{------------------------------------------------------------------}

function TMenuInfoSet._insertitem(index : integer) : pointer;
var
  item : TMenuItem;
  nitem : TMenuItem;
begin
  if GetMenuItem(item) then
    begin
      nitem := TMenuItem.Create(item.Owner);
      if index >= 0 then
        item.Insert(index, nitem)
      else
        item.Add(nitem);

      result := CreateItem(nitem);
    end
  else
    result := nil;
end;

{------------------------------------------------------------------}

function TMenuInfoSet.InsertNewItem(index : integer) : pointer;
begin
  result := _insertitem(index);
end;

{------------------------------------------------------------------}

function TMenuInfoSet.AddNewItem : pointer;
begin
  result := _insertitem(-1);
end;

{------------------------------------------------------------------}

function TMenuInfoSet.GetItemClass : TClass;
begin
  result := TMenuItem;
end;

{******************************************************************}

constructor TTreeInfoSet.Create;
begin
  inherited;
  RegisterObjectWrapper(TTreeNode, TTreeNodeWrapper);
end;

{------------------------------------------------------------------}

function TTreeInfoSet.CreateNode(Item : TTreeNode) : TTreeInfoSet;
begin
  result := TTreeInfoSet.Create;
  with result do
    begin
      fParentInfoSet := self;
      Link := Item;
      _AddRef;
    end;

  List.Insert(item.Index, result);
end;

{------------------------------------------------------------------}
type
  TMTreeView = class(TCustomTreeView)
  end;

function TTreeInfoSet.GetNodes(var nodes : TTreeNodes) : boolean;
begin
  result := Link <> nil;
  if not result then
    exit;

  if Link is TCustomTreeView then
    nodes := TMTreeView(Link).Items
  else
    nodes := TTreeNode(Link).Owner;
end;

{------------------------------------------------------------------}

function TTreeInfoSet._insertitem(index : integer) : pointer;
var
  nodes : TTreeNodes;
  rootlevel : boolean;
  nnode : TTreeNode;
begin
  if GetNodes(nodes) then
    begin
      rootlevel := Link is TCustomTreeView;

      if index >= 0 then
        nnode := nodes.Insert(TTreeNode(TTreeInfoSet(list[index]).link), '')
      else
        if rootlevel then
          nnode := nodes.Add(nil, '')
        else
          nnode := nodes.AddChild(TTreeNode(Link), '');

      result := CreateNode(nnode);
    end
  else
    result := nil;
end;

{------------------------------------------------------------------}

function TTreeInfoSet.InsertNewItem(index : integer) : pointer;
begin
  result := _insertitem(index);
end;

{------------------------------------------------------------------}

function TTreeInfoSet.AddNewItem : pointer;
begin
  result := _insertitem(-1);
end;

{------------------------------------------------------------------}

function TTreeInfoSet.GetItemClass : TClass;
begin
  result := TTreeNodeWrapper;
end;

{------------------------------------------------------------------}

procedure TTreeInfoSet.FillList;
var
  node  : TTreeNode;
begin
  ClearItems;

  if Link = nil then
    exit;

  if Link is TCustomTreeView then
    node := TMTreeView(Link).Items.GetFirstNode
  else
    node :=  TTreeNode(Link).GetFirstChild;

  while node <> nil do
    begin
      CreateNode(node);
      node := node.getNextSibling;
    end;
end;

{------------------------------------------------------------------}

procedure TTreeInfoSet.LinkDestroyed;
begin
  if fParentInfoSet <> nil then
    with fParentInfoSet do
      begin
        List.Remove(self);
        NotifyDelete(Link);
      end;
      
  inherited;
end;

{------------------------------------------------------------------}

destructor TTreeInfoSet.Destroy;
begin
  if {(LinkClass <> nil) and LinkClass.InheritsFrom(TTreeNode) and} (fParentInfoSet <> nil) then
    with fParentInfoSet do
      begin
        if (UpdateCount = 0) and not fNoUpdates then
          self.Link.Free;

        List.Remove(self);
      end;

  inherited;
end;

{------------------------------------------------------------------}

function TTreeInfoSet.GetLargeImages : TCustomImageList;
begin
  if Link is TCustomTreeView then
    result := TTreeView(Link).Images
  else
    result := nil;
end;

{------------------------------------------------------------------}

function TTreeInfoSet.GetSmallImages : TCustomImageList;
begin
  if Link is TCustomTreeView then
    result := TTreeView(Link).Images
  else
    result := nil;
end;

{------------------------------------------------------------------}

function TTreeInfoSet.GetStateImages : TCustomImageList;
begin
  if Link is TCustomTreeView then
    result := TTreeView(Link).StateImages
  else
    result := nil;
end;

{******************************************************************}

{type
  TMenuInfoSetLinkProperty = class(TLimitComponentProperty)
  public
    function AcceptComponent(AComponent : TComponent) : boolean; override;
  end;

function TMenuInfoSetLinkProperty.AcceptComponent(AComponent : TComponent) : boolean;
begin
  result := (AComponent is TMenu) or (AComponent is TMenuItem);
end;}

{******************************************************************}

constructor TListViewInfoSet.Create;
begin
  inherited;
  RegisterObjectWrapper(TListItem, TListItemWrapper);
end;

{------------------------------------------------------------------}

function TListViewInfoSet.ListItems : TListItems;
begin
  result := TListView(Link).Items;
end;

{------------------------------------------------------------------}

function TListViewInfoSet.GetLargeImages : TCustomImageList;
begin
  result := TListView(Link).LargeImages;
end;

{------------------------------------------------------------------}

function TListViewInfoSet.GetSmallImages : TCustomImageList;
begin
  result := TListView(Link).SmallImages;
end;

{------------------------------------------------------------------}

function TListViewInfoSet.GetStateImages : TCustomImageList;
begin
  result := TListView(Link).StateImages;
end;

{------------------------------------------------------------------}

function TListViewInfoSet.IndexToItem(index : integer) : pointer;
begin
  result := ListItems[index];
end;

{------------------------------------------------------------------}

function TListViewInfoSet.ItemToIndex(item : pointer) : integer;
begin
  result := ListItems.IndexOf(TListItem(item));
end;

{------------------------------------------------------------------}

function TListViewInfoSet.GetItemsCount : integer;
begin
  result := ListItems.Count;
end;

{------------------------------------------------------------------}

function TListViewInfoSet.InsertNewItem(index : integer) : pointer;
begin
  result := ListItems.Insert(index);
end;

{------------------------------------------------------------------}

function TListViewInfoSet.AddNewItem : pointer;
begin
  result := ListItems.Add;
end;

{------------------------------------------------------------------}

function TListViewInfoSet.GetItemClass : TClass;
begin
  result := TListItemWrapper;
end;

{******************************************************************}

function TDCListViewInfoSet.GetInfoSetClass : TIndexedInfoSetClass;
begin
  result := TListViewInfoSet;
end;

{------------------------------------------------------------------}

function TDCListViewInfoSet.GetListView : TCustomListView;
begin
  result := TCustomListView(InfoLink);
end;

{------------------------------------------------------------------}

procedure TDCListViewInfoSet.SetListView(val : TCustomListView);
begin
  InfoLink := val;
end;

{******************************************************************}

function TDCTreeViewInfoSet.GetInfoSetClass : TIndexedInfoSetClass;
begin
  result := TTreeInfoSet;
end;

{------------------------------------------------------------------}

function TDCTreeViewInfoSet.GetTreeView : TCustomTreeView;
begin
  result := TCustomTreeView(InfoLink);
end;

{------------------------------------------------------------------}

procedure TDCTreeViewInfoSet.SetTreeView(val : TCustomTreeView);
begin
  InfoLink := val;
end;

{******************************************************************}

(*
procedure TDistinctInfoSet.SetInfoSet(const val : IUnknown);
begin
  fInfoSet := val;
  ActiveChanged;
end;

{------------------------------------------------------------------}

procedure TDistinctInfoSet.FillList;
begin

end;

{------------------------------------------------------------------}

procedure TDistinctInfoSet.DistinctFieldsChanged;
begin
  ActiveChanged;
end;

{------------------------------------------------------------------}

constructor TDistinctInfoSet.Create;
begin
  fDistinctFields := TStringList.Create;
  fDistinctFields.OnChange := DistinctFieldsChanged;
  inherited;
end;

{------------------------------------------------------------------}

destructor  TDistinctInfoSet.Destroy;
begin
  fDistinctFields.Free;
  inherited;
end;
*)

constructor TIndexedInfoSet.Create;
begin
  inherited;
  fLinkedComp := TDCLinkedComponent.Create(nil);
  fLinkedComp.NotifyProc := Notification;
  fAllowAppend := true;
  fAllowInsert := true;
end;

{------------------------------------------------------------------}

destructor  TIndexedInfoSet.Destroy;
begin
  {If Link is TDCMultiInfoSetItems Then
    TDCMultiInfoSetItems(Link).FCollectionSet:=Nil;}
  fLinkedComp.Free;
  inherited;
end;

{------------------------------------------------------------------}

procedure TIndexedInfoSet.LinkDestroyed;
begin
  Link := nil;
end;

{------------------------------------------------------------------}

procedure TIndexedInfoSet.Notification(AComponent : TComponent; Operation : TOperation);
begin
  if (Operation = opRemove) and (AComponent = Link) then
    LinkDestroyed;
end;

{------------------------------------------------------------------}

procedure TIndexedInfoSet.RowChanged;
begin
  InfoSetChanged(evRowChanged, GetBookMark);
end;

{------------------------------------------------------------------}

function  TIndexedInfoSet.GetBookmark : TDCBookMark;
var
  item : pointer;
begin
  item := ItemByIndex(fCurIndex);
  if item = nil then
    result := NullBookMark
  else
    result := PointerToBookMark(item);
//  result := integer(ItemByIndex(fCurIndex));
end;

{------------------------------------------------------------------}

Procedure TIndexedInfoSet.GotoBookmark(const Bookmark : TDCBookMark);
var
  fNewIndex : integer;
begin
  if BookMark = NullBookMark then
    exit;

  fNewIndex := ItemToIndex(BookMarkToPointer(BookMark));
  if fNewIndex <> fCurIndex then
    begin
      fCurIndex := fNewIndex;
      RowChanged;
    end;
end;

{------------------------------------------------------------------}

Function  TIndexedInfoSet.GetBof:Boolean;
begin
  result := fCurIndex <= 0;
end;

{------------------------------------------------------------------}

Function  TIndexedInfoSet.GetEof:Boolean;
begin
  result := fCurIndex >= GetItemsCount;
end;

{------------------------------------------------------------------}

Procedure TIndexedInfoSet.First;
begin
  fCurIndex := 0;
  RowChanged;
end;

{------------------------------------------------------------------}

Procedure TIndexedInfoSet.Last;
begin
  fCurIndex := GetItemsCount - 1;
  RowChanged;
end;

{------------------------------------------------------------------}

Procedure TIndexedInfoSet.Next;
begin
  if not GetEOF then
    begin
      inc(fCurIndex);
      RowChanged;
    end;
end;

{------------------------------------------------------------------}

Procedure TIndexedInfoSet.Prev;
begin
  if not GetBOF then
    begin
      dec(fCurIndex);
      RowChanged;
    end;
end;

{------------------------------------------------------------------}

procedure TIndexedInfoSet.SetLink(val : TPersistent);
begin
  if val <> fLink then
    begin
      fLink := val;
      if val <> nil then
        fLinkClass := val.ClassType
      else
        fLinkClass := nil;

      fLinkedComp.Link := val;
      ActiveChanged;
    end;
end;

{------------------------------------------------------------------}

procedure TIndexedInfoSet.PropsChanged(Sender : TObject; const PropName : string);
begin
  if UpdateCount = 0 then
    InfoSetChanged(evFieldsChanged, PointerToBookMark(Sender));
end;

{------------------------------------------------------------------}

Function  TIndexedInfoSet.GetRow:IUnknown;
var
  props : TDCLinkProperties;
begin
  props := TDCLinkProperties.Create(ItemByIndex(fCurIndex));
  props.OnChange := PropsChanged;
  result := props as IUnknown;
end;

{------------------------------------------------------------------}

function TIndexedInfoSet.GetFields : IDCColumns;
var
  c : TClass;
begin
  c := GetItemClass;
  if c <> nil then
    result := TClassFields.Create(c)
  else
    result := Nil;
end;

{------------------------------------------------------------------}

procedure TIndexedInfoSet.ValidateIndex(var index : integer);
begin
  if index <= 0 then
    index := 0
  else if index >= GetItemsCount then
    index := GetItemsCount - 1;
end;

{------------------------------------------------------------------}

function TIndexedInfoSet.ItemByIndex(index : integer) : pointer;
begin
  ValidateIndex(index);
  if index < GetItemsCount then
    result := indextoitem(index)
  else
    result := nil;
end;

{------------------------------------------------------------------}

function TIndexedInfoSet.InsertNewItem(index : integer) : pointer;
begin
  result := nil;
end;

{------------------------------------------------------------------}

function TIndexedInfoSet.AddNewItem : pointer;
begin
  result := nil;
end;

{------------------------------------------------------------------}

function TIndexedInfoSet.GetItemClass : TClass;
begin
  result := nil;
end;

{------------------------------------------------------------------}

function TIndexedInfoSet.ValidIndex(index : integer) : boolean;
begin
  result := (index >= 0) and (index < GetItemsCount)
end;

{------------------------------------------------------------------}

procedure TIndexedInfoSet.AfterInsert(item : pointer);
begin
  if item <> nil then
    GoToBookMark(PointerToBookMark(item));

  InfoSetChanged(evRowInserted, NULL);
end;

{------------------------------------------------------------------}

procedure TIndexedInfoSet.Append;
begin
  AfterInsert(AddNewItem);
end;

{------------------------------------------------------------------}

procedure TIndexedInfoSet.Cancel;
begin

end;

{------------------------------------------------------------------}

function  TIndexedInfoSet.ValidLink : TPersistent;
begin
  result := fLink;
  if result = nil then
    ErrorFmt(SErrEmptyLink, [ClassName]);
end;

{------------------------------------------------------------------}

procedure TIndexedInfoSet.NotifyDelete(Instance : TObject);
Var
  EventRec:TEventRec;
begin
//  if UpdateCount = 0 then
  BuildEventRec(EventRec,self, integer(evRowDeleted), PointerToBookMark(Instance));
  Notifiers.CallHandlers(@EventRec);
end;

{------------------------------------------------------------------}

procedure TIndexedInfoSet.Delete;
var
  iRowSet : IDCRowSet;
  obj     : TObject;
begin
  obj := TObject(ItemByIndex(fCurIndex));
  if obj.GetInterface(IDCRowSet, iRowSet) then
    ClearRowSet(iRowSet);

  iRowSet := nil;
  NotifyDelete(obj);  // ????
  DestroyObject(obj); // ????
end;

{------------------------------------------------------------------}

procedure TIndexedInfoSet.Edit;
begin
  InfosetChanged(evEditStarted, GetBookMark);
end;

{------------------------------------------------------------------}

procedure TIndexedInfoSet.Insert;
begin
  ValidateIndex(fCurIndex);
  AfterInsert(InsertNewItem(fCurIndex));
end;

{------------------------------------------------------------------}

procedure TIndexedInfoSet.Post;
begin
  InfosetChanged(evRecordChanged, GetBookMark);
end;

{------------------------------------------------------------------}

Function TIndexedInfoSet.CanAppend:Boolean;
begin
  result := fAllowAppend;
end;

{------------------------------------------------------------------}

Function TIndexedInfoSet.CanEdit:Boolean;
begin
  result := true;
end;

{------------------------------------------------------------------}

Function TIndexedInfoSet.CanDelete:Boolean;
begin
  result := true;
end;

{------------------------------------------------------------------}

Function TIndexedInfoSet.CanInsert:Boolean;
begin
  result := fAllowInsert;
end;

{------------------------------------------------------------------}

Function TIndexedInfoSet.CanView:Boolean;
begin
  result := true;
end;

{------------------------------------------------------------------}

function TIndexedInfoSet.GetConnected:Boolean;
begin
  result := Link <> nil;
end;

{------------------------------------------------------------------}

procedure TIndexedInfoSet.SetConnected(Value:Boolean);
begin

end;

{------------------------------------------------------------------}

function TIndexedInfoSet.GetLink : TPersistent;
begin
  result := fLink;
end;

{******************************************************************}
function TCollectionInfoSet.IndexToItem(index : integer) : pointer;
begin
  result := TCollection(ValidLink).Items[index]
end;

{------------------------------------------------------------------}

function TCollectionInfoSet.ItemToIndex(item : pointer) : integer;
begin
  result := TCollectionItem(item).Index;
end;

{------------------------------------------------------------------}

function TCollectionInfoSet.GetItemsCount : integer;
begin
  result := TCollection(ValidLink).Count;
end;

{------------------------------------------------------------------}

function TCollectionInfoSet.InsertNewItem(index : integer) : pointer;
begin
{$IFDEF D4}
  result := TCollection(ValidLink).Insert(index);
{$ELSE}
  result := TCollection(ValidLink).Add;
  TCollectionItem(result).Index := index;
{$ENDIF}
end;

{------------------------------------------------------------------}

function TCollectionInfoSet.AddNewItem : pointer;
begin
  result := TCollection(ValidLink).Add;
end;

{------------------------------------------------------------------}

function TCollectionInfoSet.GetItemClass : TClass;
begin
  result := TCollection(ValidLink).ItemClass;
end;


{******************************************************************}

constructor TDCMultiInfoSetItem.Create(Collection: TCollection);
begin
  fLinkedComp := TDCLinkedComponent.Create(nil);
  fLinkedComp.NotifyProc := DeleteNotification;
  fNotifiers := TNotifiersHolder.Create;
  inherited;
end;

{------------------------------------------------------------------}

destructor TDCMultiInfoSetItem.Destroy;
begin
  InfoSet := nil;
  fLinkedComp.Free;
  inherited;
end;

{------------------------------------------------------------------}

procedure TDCMultiInfoSetItem.CallHandlers(Const EventRec:PEventRec);
begin
  fNotifiers.CallHandlers(EventRec);
end;

{------------------------------------------------------------------}

procedure TDCMultiInfoSetItem.DeleteNotification(AComponent : TComponent; Operation : TOperation);
begin
  if AComponent = InfoSet then
    begin
      FiInfoSet := nil;
      InfoSet := nil;
      pointer(fiInfoSet) := nil;
    end;
end;

{------------------------------------------------------------------}

function TDCMultiInfoSetItem.GetDisplayFieldName : string;
begin
  result := fDisplayField;
end;

{------------------------------------------------------------------}

procedure TDCMultiInfoSetItem.HandleEvent(const EventRec:PEventRec);
begin
  with TDCMultiInfoSetItems(Collection) do
    If FCollectionSet<>Nil Then
      CallHandlers(EventRec);
end;

{------------------------------------------------------------------}

procedure TDCMultiInfoSetItem.RegisterHandler(const EventHandler : IDCEventHandler; EventTypes, UserData : DWORD);
begin
  fNotifiers.RegisterHandler(EventHandler, EventTypes, UserData);
end;

{------------------------------------------------------------------}

procedure TDCMultiInfoSetItem.SetCaption(const val : string);
begin
  if val <> fCaption then
    begin
      fCaption := val;
      Changed(false);
    end;
end;

{------------------------------------------------------------------}

procedure TDCMultiInfoSetItem.SetDisplayField(const val : string);
begin
  if val <> fDisplayField then
    begin
      fDisplayField := val;
      Changed(false);
    end;
end;

{------------------------------------------------------------------}

procedure TDCMultiInfoSetItem.SetInfoSet(val : TComponent);
var
  _Unk : IUnknown;
begin
  if val <> nil then
  Begin
    if not val.GetInterface(IUnknown, _Unk) then
      Error(SIUnknownNotSupported)
  End
  else
    _Unk:=Nil;

  fLinkedComp.Link := val;
  InfoSeti:=_Unk;
end;

{------------------------------------------------------------------}

procedure TDCMultiInfoSetItem.SetInfoSeti(const Value:IUnknown);
begin
  If FiInfoSet<>Nil Then
    UnRegisterEventsHandler(fiInfoSet,Self);
  FiInfoSet:=Value;
  if FiInfoSet<>Nil then
    RegisterEventsHandler(FiInfoSet,Self,evAll{evActiveChanged},0);
  Changed(false);
end;

{------------------------------------------------------------------}

procedure TDCMultiInfoSetItem.UnregisterHandler(const EventHandler : IDCEventHandler);
begin
  fNotifiers.UnRegisterHandler(EventHandler);
end;

{------------------------------------------------------------------}

function TDCMultiInfoSetItem.GetInfoSet : TComponent;
begin
  result := TComponent(fLinkedComp.Link);
end;

{------------------------------------------------------------------}

function TDCMultiInfoSetItem._Release: Integer;
begin
  Result := InterlockedDecrement(FRefCount);
end;

{------------------------------------------------------------------}

function TDCMultiInfoSetItem.QueryInterface(const IID: TGUID; out Obj): HRESULT;
var
  unk : IUnknown;
begin
  result := E_NOINTERFACE;
  if GetInterface(IID, Obj) or
     ((InfoSet <> nil) and not IsEqualGUID(IID, IDCLink) and InfoSet.GetInterface(IUnknown, unk) and (unk.QueryInterface(IID, Obj) = S_OK)) then
    result := S_OK;
end;

{------------------------------------------------------------------}

function TDCMultiInfoSetItem._AddRef: Integer;
begin
  Result := InterlockedIncrement(fRefCount);
end;

{******************************************************************}

Constructor TDCMultiInfoSetItems.Create(AOwner:TComponent;ItemClass: TDCNamedItemClass);
Begin
  Inherited;
End;

{------------------------------------------------------------------}

function TDCMultiInfoSetItems.GetItem(index : integer) : TDCMultiInfoSetItem;
begin
  result := TDCMultiInfoSetItem(inherited Items[index]);
end;

{------------------------------------------------------------------}

Procedure TDCMultiInfoSetItems.SetCollectionSet(const Value:TCollectionInfoSet);
Begin
  FCollectionSet:=Value;
End;

{------------------------------------------------------------------}

procedure TDCMultiInfoSetItems.SetItem(index : integer; val : TDCMultiInfoSetItem);
begin
  inherited Items[index] := val;
end;

{------------------------------------------------------------------}

procedure TDCMultiInfoSetItems.Update(Item : TCollectionItem);
begin
  with FCollectionSet do
    if Item = nil then
      ActiveChanged
    else
      PropsChanged(Item, '');
end;

{******************************************************************}

function GetDCPropTypeByPropInfo(PropInfo : PPropInfo) : TDCPropType;
var
  pti : PTypeInfo;
const
  IntTypes : array[TOrdType] of TDCPropType = (VT_I1, VT_UI1, VT_I2, VT_UI2, VT_I4{$IFDEF D5},VT_UI4{$ENDIF});
  FloatTypes : array[TFloatType] of TDCPropType = (VT_R4, VT_R8, VT_R8, VT_I8, VT_CY);
begin
  result := VT_EMPTY;
  if PropInfo <> nil then
    begin
      pti := GetPTypeInfo(propinfo);
      with pti^, GetTypeData(pti)^ do
        case GetPTypeInfo(propinfo)^.Kind of
          tkInteger, tkEnumeration : result := IntTypes[OrdType];
          tkChar : result := VT_I1;
          tkFloat : result := FloatTypes[FloatType];
          tkString : result := VT_BSTR;
          tkSet : result := VT_I4;
//          tkClass : result :=
//          tkMethod :
          tkWChar : result := VT_I2;
          tkLString, tkWString : result := VT_BSTR;
          tkVariant : result := VT_VARIANT;
//          tkArray :
//          tkRecord :
          tkInterface : result := VT_UNKNOWN;
{$IFDEF D4}
          tkInt64 : result := VT_I8;
{$ENDIF}
//          tkDynArray :
        end;
    end;
end;

{******************************************************************}

procedure FillPropList(CInfo : pointer; List : TList);
var
  Count    : integer;
  PropList : PPropList;
  i        : integer;
begin
  List.Clear;
  Count := GetTypeData(CInfo)^.PropCount;
  if Count > 0 then
    begin
      GetMem(PropList, Count * SizeOf(Pointer));
      try
        GetPropList(CInfo, tkAny, PropList);
        for I := 0 to Count - 1 do
          List.Add(PropList^[i]);
      finally
        FreeMem(PropList);
      end;
    end;
end;

{------------------------------------------------------------------}

Function TClassFields.GetCount : integer;
begin
  result := fPropList.Count;
end;

{------------------------------------------------------------------}

Function TClassFields.GetItem(Index : integer) : IUnknown;
begin
  result := TDCObjectProperty.Create(nil, fPropList[Index], self);
end;

{------------------------------------------------------------------}

constructor TClassFields.Create(C : TClass);
begin
  inherited Create;
  fPropList := TList.Create;
  FillPropList(C.ClassInfo, fPropList);
end;

{------------------------------------------------------------------}

constructor TDCMultiInfoSet.Create(AOwner : TComponent);
var
  unk : IUnknown;
begin
  inherited;
  fInfoSets := TDCMultiInfoSetItems.Create(self, TDCMultiInfoSetItem);
  fColSet := TCollectionInfoSet.Create;
  fInfoSets.CollectionSet := fColSet;
  fColSet.fAllowAppend := false;
  fColSet.fAllowInsert := false;

  fColSet.QueryInterface(IUnknown, unk);
  unk._AddRef;
  VCLComObject := pointer(unk);
  fColSet.Link := fInfoSets;
end;

{------------------------------------------------------------------}

destructor TDCMultiInfoSet.Destroy;
begin
  fInfoSets.Free;
  IUnknown(VCLComObject)._Release;
  inherited;
end;

{------------------------------------------------------------------}

procedure TDCMultiInfoSet.SetSources(val : TDCMultiInfoSetItems);
begin
  fInfoSets.Assign(val);
end;

{******************************************************************}

constructor TDCObjectProperty.Create(Instance : TPersistent; PropInfo : PPropInfo; const Owner : IUnknown);
begin
  inherited Create;
  fInstance := Instance;
  fPropInfo := PropInfo;
  fOwner := Owner;
end;

{------------------------------------------------------------------}

destructor  TDCObjectProperty.Destroy;
begin
  inherited;
end;

{------------------------------------------------------------------}

Function TDCObjectProperty.GetAttributes:TPropAttributes;
begin
  result := [];
  with PropInfo^ do
    begin
      if SetProc <> nil then
        include(result, atCanWrite);
      if GetProc <> nil then
        include(result, atCanRead);
    end;
end;

{------------------------------------------------------------------}

Function TDCObjectProperty.GetPropType:TDCPropType;
begin
  result := GetDCPropTypeByPropInfo(PropInfo);
end;

{------------------------------------------------------------------}

Function TDCObjectProperty.GetName : string;
begin
  result := PropInfo.Name;
end;

{------------------------------------------------------------------}

Function TDCObjectProperty.GetSize:Integer;
begin
  result := GetPropValueSize(Instance, Propinfo);
end;

{------------------------------------------------------------------}

Function TDCObjectProperty.GetValue:Variant;
begin
  result := GetPropValueByPropInfo(Instance, PropInfo);
end;

{------------------------------------------------------------------}

function TDCObjectProperty.GetString : string;
begin
  result := GetValue;
end;

{------------------------------------------------------------------}

Function TDCObjectProperty.GetText:String;
Begin
  Result:=GetValue;
End;

{------------------------------------------------------------------}

Procedure TDCObjectProperty.SetValue(const Value:Variant);
begin
  SetPropValueByPropInfo(Instance, PropInfo, Value);

  if Assigned(OnChange) then
    OnChange(self);
end;

{******************************************************************}

constructor TDCLinkProperties.Create(ALink : TPersistent);
begin
  inherited Create;
  fProps := TList.Create;
  Link := ALink;
end;

{------------------------------------------------------------------}

destructor  TDCLinkProperties.Destroy;
begin
  if fLink <> nil then
    begin
      dcRemoveFreeNotification(fLink, Notification);
      fLink := nil;
    end;

  fProps.Free;
  fWrapper.Free;
  inherited;
end;

{------------------------------------------------------------------}

function TDCLinkProperties.QueryInterface(const IID: TGUID; out Obj): HResult;
var
  unk : IUnknown;
begin
  result := inherited QueryInterface(IID, Obj);

  if (result <> S_OK) and (Link <> nil) and (pointer(Link) <> pointer(self)) then
    if Link.GetInterface(IUnknown, unk) then
      result := unk.QueryInterface(IID, Obj);
end;

{------------------------------------------------------------------}

procedure TDCLinkProperties.AddPropInfo(Instance : TPersistent; PropInfo : PPropInfo; UserData : Integer);
begin
  fProps.Add(PropInfo);
end;

{------------------------------------------------------------------}

procedure TDCLinkProperties.Notification(Instance : TObject);
begin
  if Instance = Link then
    Link := nil;
end;

{------------------------------------------------------------------}

procedure TDCLinkProperties.SetLink(val : TPersistent);
var
  unk : IUnknown;
  iLink : IDCLink;
  wclass : TObjectWrapperClass;
begin
  if val = fLink then
    exit;

  fProps.Clear;
  FreeObject(fWrapper,fWrapper);

  if fLink <> nil then
    dcRemoveFreeNotification(fLink, Notification);

  fLink := val;

  if (fLink <> nil) and fLink.GetInterface(IUnknown, unk) and (unk.QueryInterface(IDCLink, iLink) = S_OK) then
    fRealLink := iLink.GetLink
  else
    fRealLink := fLink;

  if fRealLink <> nil then
    dcAddFreeNotification(fRealLink, Notification);

  if fRealLink <> nil then
    begin
      wclass := GetWrapperClass(fRealLink.ClassType);
      if wclass <> nil then
        begin
          fWrapper := wclass.Create;
          fWrapper.Instance := fRealLink;
          fRealLink := fWrapper;
        end;
      ForEachProp(fRealLink, AddPropInfo, false, 0);
    end;
end;

{------------------------------------------------------------------}

procedure TDCLinkProperties.PropChanged(Prop : TObject);
begin
  if Assigned(OnChange) then
    OnChange(self, TDCObjectProperty(Prop).GetName);
end;

{------------------------------------------------------------------}

Function TDCLinkProperties.GetItem(Index:Integer) : IUnknown;
var
  o : TDCObjectProperty;
begin
  o := TDCObjectProperty.Create(fRealLink, PPropInfo(fProps[Index]), self);
  o.OnChange := PropChanged;
  result := IDCProperty(o);
end;

{------------------------------------------------------------------}

Function TDCLinkProperties.GetCount:Integer;
begin
  result := fProps.Count;
end;

initialization

finalization
  FreeSortedList(fObjectWrappers,fObjectWrappers);

end.
