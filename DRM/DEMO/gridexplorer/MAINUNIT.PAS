{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit MainUnit;

interface
{$I dc.inc}
{$IFDEF D6}
{$WARN UNIT_PLATFORM OFF}
{$ENDIF}
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dcntree, dcTreeGrid, {$IFDEF D4}ImgList, {$ENDIF}ComCtrls, ExtCtrls, StdCtrls,
  Menus, FileCtrl;

type
  TForm1 = class(TForm)
    DCTreeGrid1: TDCTreeGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    ImageList2: TImageList;

    procedure FormCreate(Sender: TObject);
    procedure DCTreeGrid1Expanding(Sender: TObject; Node: TDCTreeNode;
      var AllowExpansion: Boolean);
    procedure DCTreeGrid1Compare(Sender: TObject; Node1,
      Node2: TDCTreeNode; Data: Integer; var Compare: Integer);
    procedure DCTreeGrid1DblClick(Sender: TObject);
    procedure DCTreeGrid1Change(Sender: TObject; Node: TDCTreeNode);
    procedure DCTreeGrid1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure DCTreeGrid1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure DCTreeGrid1RightClickNode(Sender: TObject; Node: TDCTreeNode;
      var Action: TRightClickAction);

    procedure StatusBar1Resize(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure DCTreeGrid1KeyPress(Sender: TObject; var Key: Char);
  private
  public
  end;

var
  Form1: TForm1;

implementation
uses ActiveX, ShlObj, ComObj, ShellAPI, CommCtrl;
const
  crCtrlDrag = 100;

{$IFNDEF D4}
type
  IContextMenu2 = interface(IContextMenu)
    ['{000214F4-0000-0000-C000-000000000046}']
    function HandleMenuMsg(uMsg: UINT; WParam, LParam: Integer): HResult; stdcall;
  end;
{$ENDIF}

{$R *.DFM}
{------------------------------------------------------------------------------}
type
  TNodeEx = class(TDCTreeGridNode)
  private
    nIShellFolder: IShellFolder;
    nPIDL: PItemIDList;
    rPIDL: PItemIDList;
    fSizeEx: Integer;
    fTypeName: string;
    fTimeEx: TDateTime;
    fFolder: Boolean;
  public
    destructor Destroy; override;
  end;
{------------------------------------------------------------------------------}
  TDTrecord = record
    stDateTime: string;
    dtDateTime: TDateTime;
  end;
{------------------------------------------------------------------------------}
var
  pMalloc: IMalloc;
  desktop: IShellFolder;
  desktoppidl: PItemIDList;

{ TNodeEx }
{------------------------------------------------------------------------------}

destructor TNodeEx.Destroy;
begin
  pMalloc.Free(nPIDL);
  pMalloc.Free(rPIDL);
  inherited;
end;
{------------------------------------------------------------------------------}
//                    ***** THE WORK FUNCTIONS *****
{------------------------------------------------------------------------------}
// Processing of PIDL
{------------------------------------------------------------------------------}

function NextPIDL(IDList: PItemIDList): PItemIDList;
begin
  Result := IDList;
  Inc(PChar(Result), IDList^.mkid.cb);
end;
{------------------------------------------------------------------------------}

function GetPIDLSize(IDList: PItemIDList): Integer;
begin
  Result := 0;
  if Assigned(IDList) then
  begin
    Result := SizeOf(IDList^.mkid.cb);
    while IDList^.mkid.cb <> 0 do
    begin
      Result := Result + IDList^.mkid.cb;
      IDList := NextPIDL(IDList);
    end;
  end;
end;
{------------------------------------------------------------------------------}

function CreatePIDL(Size: Integer): PItemIDList;
var
  Malloc: IMalloc;
  HR: HResult;
begin
  Result := nil;

  HR := SHGetMalloc(Malloc);
  if Failed(HR) then Exit;

  try
    Result := Malloc.Alloc(Size);
    if Assigned(Result) then
      FillChar(Result^, Size, 0);
  finally
  end;
end;
{------------------------------------------------------------------------------}

function ConcatPIDLs(IDList1, IDList2: PItemIDList): PItemIDList;
var
  cb1, cb2: Integer;
begin
  if Assigned(IDList1) then
    cb1 := GetPIDLSize(IDList1) - SizeOf(IDList1^.mkid.cb)
  else
    cb1 := 0;

  cb2 := GetPIDLSize(IDList2);

  Result := CreatePIDL(cb1 + cb2);
  if Assigned(Result) then
  begin
    if Assigned(IDList1) then
      CopyMemory(Result, IDList1, cb1);
    CopyMemory(PChar(Result) + cb1, IDList2, cb2);
  end;
end;
{------------------------------------------------------------------------------}
//Processing of Node parameters
{-----------------------------------------------------------------------------}

function GetObjectPath(ANode: TDCTreeNode): string;
var
  pNodePath: array[0..Max_Path] of Char;
begin
  FillChar(pNodePath, SizeOf(pNodePath), #0);
  SHGetPathFromIDList(TNodeEx(ANode).nPIDL, pNodePath);
  SetLength(result, StrLen(PChar(Result)));
  Result := StrPas(pNodePath);
end;
{-----------------------------------------------------------------------------}

function GetObjectFullName(ANode: TDCTreeNode): string;
begin
  Result := ExtractFileName(GetObjectPath(ANode));
end;
{-----------------------------------------------------------------------------}

function GetDisplayName(AShellFolder: IShellFolder; pidl: PItemIDList; flag: Cardinal): string;
var
  Value: TStrRet;
begin
  AShellFolder.GetDisplayNameOf(pidl, flag, Value);

  with Value do
    case uType of
      STRRET_CSTR: Result := PChar(@cStr[0]);
      STRRET_WSTR:
        begin
          Result := pOleStr;
          pMalloc.Free(pOleStr);
        end;
      STRRET_OFFSET: Result := PChar(DWord(pidl) + uOffset);
    end;
end;
{------------------------------------------------------------------------------}

function IsShortCutF(ShellFolder: IShellFolder; ID: PItemIDList): Boolean;
var
  Flags: UINT;
begin
  Flags := SFGAO_LINK;
  ShellFolder.GetAttributesOf(1, ID, Flags);
  Result := SFGAO_LINK and Flags <> 0;
end;
{------------------------------------------------------------------------------}

function IsFolder(ShellFolder: IShellFolder; ID: PItemIDList): Boolean;
var
  Flags: UINT;
begin
  Flags := SFGAO_FOLDER;
  ShellFolder.GetAttributesOf(1, ID, Flags);
  Result := SFGAO_FOLDER and Flags <> 0;
end;
{------------------------------------------------------------------------------}

function GetShellImage(PIDL: PItemIDList; Open: Boolean): Integer;
var
  FileInfo: TSHFileInfo;
  Flags: Integer;
begin
  FillChar(FileInfo, SizeOf(FileInfo), #0);
  Flags := SHGFI_PIDL or SHGFI_SYSICONINDEX or SHGFI_ICON;
  if Open then
    Flags := Flags or SHGFI_OPENICON;

  Flags := Flags or SHGFI_SMALLICON;

  if SHGetFileInfo(PChar(PIDL), 0, FileInfo, SizeOf(FileInfo), Flags) <> 0 then
    Result := FileInfo.iIcon
  else Result := 0;
end;
{------------------------------------------------------------------------------}
// Processing of grid fields
{------------------------------------------------------------------------------}

function GetSizeString(Size: Integer): string;
begin
  if Size < 1024 then
  begin
    Result := '1KB';
    exit;
  end;

  if (Size >= 1024) and (Size < 1024 * 1024) then
  begin
    Result := Format('%.3f KB', [Size / 1024]);
    exit;
  end;

  if Size >= 1024 * 1024 then
  begin
    Result := Format('%.3f MB', [Size / (1024 * 1024)]);
    exit;
  end;

  Result := IntToStr(Size);
end;
{------------------------------------------------------------------------------}

function GetObjectInfo(FShellFolder: IShellFolder; PIDL: PItemIDList): TWin32FindData;
var
  FFileData: TWin32FindData;
begin
  FillChar(FFileData, SizeOf(FFileData), 0);

  SHGetDataFromIDList(FShellFolder,
    PIDL,
    SHGDFIL_FINDData,
    @FFileData,
    SizeOf(FFileData));

  Result := FFileData;
end;
{------------------------------------------------------------------------------}

function GetObjectDateInfo(FIShellFolder: IShellFolder; PIDL: PItemIDList): TDTrecord;
var
  fFileData: TWin32FindData;

  SysTime: TSystemTime;
  LocalFileTime: TFileTime;
//-----------------------------------------
  function ValidFileTime(FileTime: TFileTime): Boolean;
  begin
    Result := (FileTime.dwLowDateTime <> 0) or (FileTime.dwHighDateTime <> 0);
  end;
//-----------------------------------------
begin
  FillChar(fFileData, SizeOf(fFileData), 0);

  SHGetDataFromIDList(
    FIShellFolder,
    PIDL,
    SHGDFIL_FINDDATA,
    @fFileData,
    SizeOf(fFileData)
    );

  FillChar(LocalFileTime, SizeOf(TFileTime), 0);
  with fFileData do
    if ValidFileTime(ftLastWriteTime)
      and FileTimeToLocalFileTime(ftLastWriteTime, LocalFileTime)
      and FileTimeToSystemTime(LocalFileTime, SysTime) then
    try
      Result.stDateTime := DateTimeToStr(SystemTimeToDateTime(SysTime));
      Result.dtDateTime := SystemTimeToDateTime(SysTime)
    except
      on EConvertError do Result.stDateTime := '';
    end
    else
      Result.stDateTime := '';
end;
{------------------------------------------------------------------------------}

function GetTypeName(PIDL: PItemIDList): string;
var
  FileInfo: TSHFileInfo;
begin
  SHGetFileInfo(
    PChar(PIDL),
    0,
    FileInfo,
    SizeOf(FileInfo),
    SHGFI_TYPENAME or SHGFI_PIDL
    );
  Result := FileInfo.szTypeName;
end;
{------------------------------------------------------------------------------}
//Procesing Context menu
{-----------------------------------------------------------------------------}

function MenuCallback(Wnd: HWND; Msg: UINT; WParam: WPARAM;
  LParam: LPARAM): LRESULT; stdcall;
var
  ContextMenu2: IContextMenu2;
begin
  case Msg of
    WM_CREATE:
      begin
        ContextMenu2 := IContextMenu2(PCreateStruct(LParam).lpCreateParams);
        SetWindowLong(Wnd, GWL_USERDATA, Longint(ContextMenu2));
        Result := DefWindowProc(Wnd, Msg, WParam, LParam);
      end;
    WM_INITMENUPOPUP:
      begin
        ContextMenu2 := IContextMenu2(GetWindowLong(Wnd, GWL_USERDATA));
        ContextMenu2.HandleMenuMsg(Msg, WParam, LParam);
        Result := 0;
      end;
    WM_DRAWITEM, WM_MEASUREITEM:
      begin
        ContextMenu2 := IContextMenu2(GetWindowLong(Wnd, GWL_USERDATA));
        ContextMenu2.HandleMenuMsg(Msg, WParam, LParam);
        Result := 1;
      end;
  else
    Result := DefWindowProc(Wnd, Msg, wParam, lParam);
  end;
end;
{------------------------------------------------------------------------------}

function CreateMenuCallbackWnd(const ContextMenu: IContextMenu2): HWND;
const
  IcmCallbackWnd = 'ICMCALLBACKWND';
var
  WndClass: TWndClass;
begin
  FillChar(WndClass, SizeOf(WndClass), #0);
  WndClass.lpszClassName := PChar(IcmCallbackWnd);
  WndClass.lpfnWndProc := @MenuCallback;
  WndClass.hInstance := HInstance;
  Windows.RegisterClass(WndClass);
  Result := CreateWindow(IcmCallbackWnd, IcmCallbackWnd, WS_POPUPWINDOW, 0,
    0, 0, 0, 0, 0, HInstance, Pointer(ContextMenu));
end;
{------------------------------------------------------------------------------}

function DisplayContextMenuPidl(const Handle: HWND; const Folder: IShellFolder;
  Item: PItemIdList; Pos: TPoint): Boolean;
var
  Cmd: Cardinal;
  ContextMenu: IContextMenu;
  ContextMenu2: IContextMenu2;
  Menu: HMENU;
  CommandInfo: TCMInvokeCommandInfo;
  CallbackWindow: HWND;
begin
  Result := False;

  if (Item = nil) or (Folder = nil) then
    Exit;
  Folder.GetUIObjectOf(Handle, 1, Item, IID_IContextMenu, nil,
    Pointer(ContextMenu));
  if ContextMenu <> nil then
  begin
    Menu := CreatePopupMenu;
    if Menu <> 0 then
    begin
      if Succeeded(ContextMenu.QueryContextMenu(Menu, 0, 1, $7FFF, CMF_EXPLORE)) then
      begin
        CallbackWindow := 0;
        if Succeeded(ContextMenu.QueryInterface(IContextMenu2, ContextMenu2)) then
        begin
          CallbackWindow := CreateMenuCallbackWnd(ContextMenu2);
        end;
        ClientToScreen(Handle, Pos);
        Cmd := Cardinal(TrackPopupMenu(Menu, TPM_LEFTALIGN or TPM_LEFTBUTTON or
          TPM_RIGHTBUTTON or TPM_RETURNCMD, Pos.X, Pos.Y, 0, CallbackWindow, nil));
        if Cmd <> 0 then
        begin
          FillChar(CommandInfo, SizeOf(CommandInfo), #0);
          CommandInfo.cbSize := SizeOf(TCMInvokeCommandInfo);
          CommandInfo.hwnd := Handle;
          CommandInfo.lpVerb := MakeIntResource(Cmd - 1);
          CommandInfo.nShow := SW_SHOWNORMAL;
          Result := Succeeded(ContextMenu.InvokeCommand(CommandInfo));
        end;
        if CallbackWindow <> 0 then
          DestroyWindow(CallbackWindow);
      end;
      DestroyMenu(Menu);
    end;
  end;
end;
{------------------------------------------------------------------------------}

function ObjectExists(APath: string): Boolean;
begin
  Result := DirectoryExists(APath) or FileExists(APath);
end;
{------------------------------------------------------------------------------}

function GetPathFromShortCut(AIShellFolder: IShellFolder; APIDL: PItemIdList): string;
var
  IShortObject: IShellLink;
  fBuff: array[0..Max_Path] of Char;
  FFileData: TWin32FindData;
begin
  FillChar(fBuff, SizeOf(fBuff), #0);
  FillChar(FFileData, SizeOf(FFileData), 0);

  AIShellFolder.BindToObject(
    APIDL,
    nil,
    IID_IShellLinkA,
    Pointer(IShortObject)
    );

  FFileData := GetObjectInfo(AIShellFolder, APIDL);
  IShortObject.GetPath(fBuff, Max_Path, FFileData, 0);

  Result := StrPas(fBuff);
end;
{------------------------------------------------------------------------------}
{------------------------------------------------------------------------------}
// The Form methods processing
{------------------------------------------------------------------------------}

procedure TForm1.FormCreate(Sender: TObject);
var
  Node: TDCTreeNode;
  Name: string;

  ImageListHandle: THandle;
  FileInfo: TSHFileInfo;
begin
  with DCTreeGrid1 do
  begin
    DefaultNodeClass := TNodeEx;

    Columns[1].Options := [coDisableEditing, coUseEllipsis];
    Columns[2].Options := [coDisableEditing, coUseEllipsis];
    Columns[3].Options := [coDisableEditing, coUseEllipsis];
  end;
  TDCSortedColumn(DCTreeGrid1.SortedColumns.Add).Column := DCtreeGrid1.Columns[0];

  SHGetDesktopFolder(desktop);
  SHGetSpecialFolderLocation(0, CSIDL_DESKTOP, desktoppidl);

  Name := GetDisplayName(desktop, desktoppidl, SHGDN_NORMAL);

  Node := DCTreeGrid1.Items.Add(nil, Name);

  ImageListHandle := SHGetFileInfo('C:\',
    0,
    FileInfo,
    SizeOf(FileInfo),
    SHGFI_SYSICONINDEX or SHGFI_SMALLICON
    );

  ImageList1.Handle := ImageListHandle;


  Node.HasChildren := True;

  with TNodeEx(Node) do
  begin
    nIShellFolder := desktop;
    nPIDL := desktoppidl;
    rPIDL := nil;
    fFolder := True;
  end;

  Node.ImageIndex := GetShellImage(desktoppidl, False);
  Node.SelectedIndex := GetShellImage(desktoppidl, True);

  Node.Expand(False);
  DCTreeGrid1.Selected := Node;
end;
{------------------------------------------------------------------------------}

procedure TForm1.DCTreeGrid1Expanding(Sender: TObject; Node: TDCTreeNode;
  var AllowExpansion: Boolean);
var
  Iterator: IEnumIDList;
  NewPIDL: PItemIDList;

  SubNode: TDCTreeNode;
  NodeText: string;
  IObject: IShellFolder;
  Count: {$IFDEF C3}Cardinal{$ELSE}integer{$ENDIF};

  fSPWidth0: Integer;

  hr: HResult;

  fDT: TDTrecord;
begin
  Screen.Cursor := crHourGlass;
  try
    fSPWidth0 := StatusBar1.Panels[0].Width;
    StatusBar1.Panels[0].Width := StatusBar1.Width;

    if GetObjectPath(Node) <> '' then
      StatusBar1.Panels[0].Text := 'Reading: ' + GetObjectPath(Node)
    else
      StatusBar1.Panels[0].Text := 'Reading: ' + Node.Text;

    StatusBar1.Update;

    if Node.Count = 0 then
    begin
      hr := TNodeEx(Node).nIShellFolder.EnumObjects(0, SHCONTF_FOLDERS
        or SHCONTF_NONFOLDERS or SHCONTF_INCLUDEHIDDEN, Iterator);

      if SUCCEEDED(hr) then
      begin

        while Iterator.Next(1, NewPIDL, Count) = NOERROR do
        begin
          NodeText := GetDisplayName(TNodeEx(Node).nIShellFolder, NewPIDL, SHGDN_INFOLDER);

          SubNode := DCTreeGrid1.Items.AddChild(Node, '');
          TNodeEx(SubNode).Columns[0]:= NodeText;

          TNodeEx(SubNode).nPIDL := ConcatPIDLs(TNodeEx(Node).nPIDL, NewPIDL);
          TNodeEx(SubNode).rPIDL := NewPIDL;

          SubNode.ImageIndex := GetShellImage(TNodeEx(SubNode).nPIDL, False);

          if IsFolder(TNodeEx(Node).nIShellFolder, NewPIDL) then
          begin
            TNodeEx(SubNode).fFolder := True;

            SubNode.SelectedIndex := GetShellImage(TNodeEx(SubNode).nPIDL, True);

            TNodeEx(Node).nIShellFolder.BindToObject(NewPIDL,
              nil,
              IID_IShellFolder,
              Pointer(IObject)
              );
            TNodeEx(SubNode).nIShellFolder := IObject;
            SubNode.HasChildren := True;
          end
          else
          begin
            TNodeEx(SubNode).fFolder := False;
            TNodeEx(SubNode).fSizeEx := GetObjectInfo(TNodeEx(Node).nIShellFolder, NewPIDL).nFileSizeLow;
            TNodeEx(SubNode).Columns[1] := GetSizeString(TNodeEx(SubNode).fSizeEx);

            SubNode.SelectedIndex := SubNode.ImageIndex; 

            SubNode.HasChildren := False;
          end;

          TNodeEx(SubNode).fTypeName := GetTypeName(TNodeEx(SubNode).nPIDL);

          fDT := GetObjectDateInfo(TNodeEx(Node).nIShellFolder, NewPIDL);
          if fDT.stDateTime <> '' then
            TNodeEx(SubNode).fTimeEx := fDT.dtDateTime;

          TNodeEx(SubNode).Columns[2] := ' ' + TNodeEx(SubNode).fTypeName;
          TNodeEx(SubNode).Columns[3] := fDT.stDateTime;

        end;
      end;
    end;

    if Node.Count = 0 then
      Node.HasChildren := False;

    StatusBar1.Panels[0].Width := fSPWidth0;
    if DCTreeGrid1.Selected <> nil then
      StatusBar1.Panels[0].Text := 'Selected:  ' + DCTreeGrid1.Selected.Text
    else
      StatusBar1.Panels[0].Text := 'Selected:  ';
  finally
    Screen.Cursor := crDefault;
  end;
end;
{------------------------------------------------------------------------------}

procedure TForm1.DCTreeGrid1Compare(Sender: TObject; Node1,
  Node2: TDCTreeNode; Data: Integer; var Compare: Integer);
var
  SortedColumn: TDCSortedColumn;
  I: Integer;
  Index: Integer;
//---------------------
  function GetIndexInColumnList(Node: TDCTreeColumn): Integer;
  var
    I: Integer;

  begin
    Result := -1;

    with DCTreeGrid1 do
    begin
      for I := 0 to Columns.Count - 1 do
        if Columns[I] = SortedColumn.Column then
        begin
          Result := I;
          Exit;
        end;
    end;
  end;
//---------------------
begin

  if TNodeEx(Node2).fFolder = TNodeEx(Node1).fFolder then
    Compare := 0
  else
    if not TNodeEx(Node2).fFolder and TNodeEx(Node1).fFolder then
      Compare := -1
    else
      Compare := 1;

  if Compare = 0 then
    for I := 0 to DCTreeGrid1.SortedColumns.Count - 1 do
    begin
      SortedColumn := DCTreeGrid1.SortedColumns[I];
      if SortedColumn.Column <> nil then
      begin
        Index := GetIndexInColumnList(SortedColumn.Column);

        case Index of
          0, 2: Compare := CompareText(TNodeEx(Node1).Columns[Index],
              TNodeEx(Node2).Columns[Index]);

          1: Compare := TNodeEx(Node1).FSizeEx - TNodeEx(Node2).FSizeEx;

          3: begin
              if TNodeEx(Node1).FTimeEx = TNodeEx(Node2).FTimeEx then
                Compare := 0
              else
                if TNodeEx(Node1).FTimeEx > TNodeEx(Node2).FTimeEx then
                  Compare := 1
                else
                  Compare := -1;
            end;

        else Break
        end;

        if SortedColumn.Descending then
          Compare := -Compare;
      end;
    end;

end;
{------------------------------------------------------------------------------}

procedure TForm1.DCTreeGrid1DblClick(Sender: TObject);
var
  FNode: TDCTreeNode;
  fInfoRec: TSHELLEXECUTEINFO;
begin
  FNode := DCTreeGrid1.GetNodeAtCursor;

  if FNode <> nil then
  begin
    if not TNodeEx(FNode).fFolder then
    begin
      if GetObjectPath(FNode) = '' then
      begin
        MessageDlg('Use the context menu to start this program.', mtInformation, [mbOk], 0);
        Exit;
      end;

      with fInfoRec do
      begin
        cbSize := SizeOf(fInfoRec);
        fMask := SEE_MASK_FLAG_NO_UI or SEE_MASK_INVOKEIDLIST;
        Wnd := 0;
        lpVerb := 'open';
        lpFile := '';
        lpParameters := nil;
        lpDirectory := nil;
        nShow := SW_SHOW;
        hInstApp := HINSTANCE;

        lpIDList := TNodeEx(FNode).nPIDL;
        lpClass := nil;
        hkeyClass := 0;
        dwHotKey := 0;
        hIcon := 0;
        hProcess := 0;
      end;
      DCTreeGrid1.Cursor := crHourGlass;
      try
        ShellExecuteEx(@fInfoRec);
      finally
        DCTreeGrid1.Cursor := crDefault;
      end;
    end;
  end;
end;
{------------------------------------------------------------------------------}

procedure TForm1.DCTreeGrid1Change(Sender: TObject; Node: TDCTreeNode);
const
  p0 = 'Selected: ';
  p1 = 'Size: ';
  p2 = 'Type: ';
  p3 = 'Date/Time: ';

begin
  with StatusBar1 do
  begin
    if Node <> nil then
    begin
      Panels[0].Text := p0 + ' ' + TDCTreeGridNode(Node).Columns[0];
      Panels[1].Text := p1 + TDCTreeGridNode(Node).Columns[1];
      Panels[2].Text := p2 + TDCTreeGridNode(Node).Columns[2];
      Panels[3].Text := p3 + TDCTreeGridNode(Node).Columns[3];
    end
    else
    begin
      Panels[0].Text := p0;
      Panels[1].Text := p1;
      Panels[2].Text := p2;
      Panels[3].Text := p3;
    end;
  end;
end;
{------------------------------------------------------------------------------}

procedure TForm1.DCTreeGrid1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  TargetNode, SourceNode: TDCTreeNode;
begin
  TargetNode := DCTreeGrid1.GetNodeAt(X, Y);

  if (Source = Sender) and (TargetNode <> nil) then
  begin
    Accept := True;
    SourceNode := DCTreeGrid1.Selected;

    if (not TNodeEx(TargetNode).fFolder)
      or (TargetNode = SourceNode.Parent)
      or (TargetNode = SourceNode)
      or (TargetNode.HasAsParent(SourceNode))
      or (GetObjectPath(TargetNode) = '') then
    begin
      Accept := False;
      Exit;
    end;
  end

  else
    Accept := False;

  if Accept and (GetAsyncKeyState(vk_Control) < 0) then
    DCTreeGrid1.DragCursor := crCtrlDrag
  else
    DCTreeGrid1.DragCursor := crDrag;
end;
{-----------------------------------------------------------------------------}

procedure TForm1.DCTreeGrid1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  TargetNode, SourceNode: TDCTreeNode;

  fSHFileOpStruct: TSHFileOpStruct;
  pToStr: string;

  fOperation: Integer;
begin
  Screen.Cursor := crHourGlass;
  fOperation := 0;
  try
    TargetNode := DCTreeGrid1.GetNodeAt(X, Y);

    if (TargetNode <> nil) then
    begin
      SourceNode := DCTreeGrid1.Selected;

      if (GetAsyncKeyState(vk_Control) < 0) then
      begin
        if MessageDlg('Are you sure you want to copy '
          + GetObjectFullName(SourceNode) + ' and all its contents ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
          then
          fOperation := FO_COPY;
      end
      else
        if MessageDlg('Are you sure you want to move '
          + GetObjectFullName(SourceNode) + ' and all its contents ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
          then
          fOperation := FO_MOVE;


      if fOperation <> 0 then
      begin
        if IsShortCutF(TNodeEx(TargetNode.Parent).nIShellFolder, TNodeEx(TargetNode).rPIDL) then
          pToStr := GetPathFromShortCut(TNodeEx(TargetNode.Parent).nIShellFolder, TNodeEx(TargetNode).rPIDL)
        else
          pToStr := GetObjectPath(TargetNode);

        with fSHFileOpStruct do
        begin
          Wnd := 0;
          wFunc := fOperation;
          pFrom := PChar(GetObjectPath(SourceNode));
          pTo := PChar(pToStr);
          fFlags := 0;
          fAnyOPerationsAborted := False;
          hNameMappings := nil;
          lpszProgressTitle := nil;
        end;

        if SHFileOperation(fSHFileOpStruct) = 0 then
        begin
          DCTreeGrid1.Selected := TargetNode;

          if fOperation = FO_MOVE then
            if not SourceNode.HasAsParent(TargetNode) then
              if (GetObjectPath(SourceNode) <> '') and
                (not ObjectExists(GetObjectPath(SourceNode))) then
                SourceNode.Free;
        end;


        DCTreeGrid1.Items.BeginUpdate;
        try
          with TargetNode do
          begin
            DeleteChildren;
            HasChildren := True;
            Expanded := False;
            Expand(False);
          end;
        finally
          DCTreeGrid1.Items.EndUpdate;
        end;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;
{-----------------------------------------------------------------------------}

procedure TForm1.DCTreeGrid1RightClickNode(Sender: TObject;
  Node: TDCTreeNode; var Action: TRightClickAction);
var
  fPos: TPoint;
begin
  fPos := DCTreeGrid1.GetCursorPos;
  if Node.Parent <> nil then
  begin
    DCTreeGrid1.Selected := Node;

    DisplayContextMenuPidl(DCTreeGrid1.Handle, TNodeEx(Node.Parent).nIShellFolder, TNodeEx(Node).rPIDL, fPos);

    if (GetObjectPath(Node) <> '') and (not ObjectExists(GetObjectPath(Node))) then
    begin
      DCTreeGrid1.Selected := nil;
      TNodeEx(Node).Free;
    end
    else
      DCTreeGrid1.Selected := Node;
  end;
end;
{------------------------------------------------------------------------------}

procedure TForm1.StatusBar1Resize(Sender: TObject);
var
  fMiddleWidth: Integer;
begin
  fMiddleWidth := StatusBar1.Width div 4;
  with StatusBar1.Panels do
  begin
    Items[0].Width := fMiddleWidth + 50;
    Items[1].Width := fMiddleWidth - 50;
    Items[2].Width := fMiddleWidth;
    Items[3].Width := fMiddleWidth;
  end;
end;
{------------------------------------------------------------------------------}

procedure TForm1.Panel1Resize(Sender: TObject);
var
  fEdge: Integer;
begin
  fEdge := Panel1.Width - 260;
  Label3.Left := fEdge + 3;
  Label4.Left := fEdge;
  Label5.Left := fEdge;
end;
{------------------------------------------------------------------------------}

procedure TForm1.Label5Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar(Label5.Caption), nil, nil, SW_SHOW);
end;

procedure TForm1.DCTreeGrid1KeyPress(Sender: TObject; var Key: Char);
var
  FNode: TDCTreeNode;
  fInfoRec: TSHELLEXECUTEINFO;
begin
  if Key <> #13 then Exit;

  FNode := DCTreeGrid1.Selected;

  if FNode <> nil then
  begin
    if not TNodeEx(FNode).fFolder then
    begin
      if GetObjectPath(FNode) = '' then
      begin
        MessageDlg('Use the context menu to start this program.', mtInformation, [mbOk], 0);
        Exit;
      end;

      with fInfoRec do
      begin
        cbSize := SizeOf(fInfoRec);
        fMask := SEE_MASK_FLAG_NO_UI or SEE_MASK_INVOKEIDLIST;
        Wnd := 0;
        lpVerb := 'open';
        lpFile := '';
        lpParameters := nil;
        lpDirectory := nil;
        nShow := SW_SHOW;
        hInstApp := HINSTANCE;

        lpIDList := TNodeEx(FNode).nPIDL;
        lpClass := nil;
        hkeyClass := 0;
        dwHotKey := 0;
        hIcon := 0;
        hProcess := 0;
      end;
      DCTreeGrid1.Cursor := crHourGlass;
      try
        ShellExecuteEx(@fInfoRec);
      finally
        DCTreeGrid1.Cursor := crDefault;
      end;
    end
    else
      FNode.Expand(False);
  end;
end;

initialization
  SHGetMalloc(pMalloc);
  Screen.Cursors[crCtrlDrag] := LoadCursor(HInstance, 'TREEDRAGCOPY');
end.

