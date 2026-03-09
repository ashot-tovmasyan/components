{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit Unit1;

interface
{$I dc.inc}
uses
  Windows, ShellAPI, Registry, Forms, {$IFDEF D4}ImgList,{$ENDIF} Controls,
  Menus, dcntree, dcTreeGrid, ComCtrls, StdCtrls, Classes, ExtCtrls;

type
  TRegistryNodeType = (rntRoot, rntKey, rntString, rntBinary, rntDWord);

  TRegistryNode = class(TDCTreeGridNode)
  private
    FType: TRegistryNodeType;
    FKey: HKEY;
    FPath: string;
  end;

  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    StatusBar1: TStatusBar;
    DCTreeGrid1: TDCTreeGrid;
    ImageList1: TImageList;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    PopupMenu1: TPopupMenu;
    New1: TMenuItem;
    N1: TMenuItem;
    Delete1: TMenuItem;
    Rename1: TMenuItem;
    N2: TMenuItem;
    CopyKeyName1: TMenuItem;
    Key1: TMenuItem;
    N3: TMenuItem;
    StringValue1: TMenuItem;
    BinaryValue1: TMenuItem;
    DWORDValue1: TMenuItem;
    Modify1: TMenuItem;
    N4: TMenuItem;
    Refresh1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure DCTreeGrid1Expanding(Sender: TObject; Node: TDCTreeNode;
      var AllowExpansion: Boolean);
    procedure DCTreeGrid1SelectionChanged(Sender: TObject;
      Node: TDCTreeNode);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Key1Click(Sender: TObject);
    procedure StringValue1Click(Sender: TObject);
    procedure BinaryValue1Click(Sender: TObject);
    procedure DWORDValue1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Rename1Click(Sender: TObject);
    procedure CopyKeyName1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DCTreeGrid1RightClickNode(Sender: TObject; Node: TDCTreeNode;
      var Action: TRightClickAction);
    procedure Modify1Click(Sender: TObject);
    procedure DCTreeGrid1Editing(Sender: TObject; Node: TDCTreeNode;
      var AllowEdit: Boolean);
    procedure DCTreeGrid1Edited(Sender: TObject; Node: TDCTreeNode;
      var NewText: string);
    procedure DCTreeGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DCTreeGrid1DblClick(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
  private
    FRegistry: TRegistry;
    procedure AssignBasicNodeParams(ANode: TRegistryNode);
    function GetFullPath(const APath: PChar): string;
    function AddNewNode(const AText: string): TRegistryNode;
    procedure EditNewNode(ANode: TRegistryNode);
    procedure AddNewValue(AType: TRegDataType);
    function GetIntValue(AValue: integer): string;
    function GetKeyPath(var AName: string): string;
    procedure DeleteAllSubs(ANode: TDCTreeNode);
  end;

var
  Form1: TForm1;

implementation

uses SysUtils, Clipbrd, Dialogs, dcdreamlib, EdStrUnit, EdDWUnit;

{$R *.DFM}

const
  SDefaultKeyValue = '(Default)';
  HKEY_ROOT_Names: array[HKEY_CLASSES_ROOT..HKEY_DYN_DATA] of string =
  ('HKEY_CLASSES_ROOT', 'HKEY_CURRENT_USER', 'HKEY_LOCAL_MACHINE', 'HKEY_USERS',
    'HKEY_PERFORMANCE_DATA', 'HKEY_CURRENT_CONFIG', 'HKEY_DYN_DATA');
  RegDataTypeNames: array[TRegDataType] of string =
  ('REG_SZ', 'REG_SZ', 'REG_SZ', 'REG_DWORD', 'REG_BINARY');
  RegDataTypeIndexes: array[TRegDataType] of integer = (2, 2, 2, 3, 3);
  RegNodeTypes: array[TRegDataType] of TRegistryNodeType =
  (rntString, rntString, rntString, rntDWord, rntBinary);

function TForm1.GetIntValue(AValue: integer): string;
begin
  Result := Format('0x%0:x (%0:d)', [AValue]);
end;

function TForm1.GetFullPath(const APath: PChar): string;
var
  p: integer;
  pc: PChar;
begin
  pc := APath;
  p := Pos('\', pc);
  Inc(pc, p);
  p := Pos('\', pc);
  if p > 0 then
    Result := Copy(pc, p + 1, Length(APath))
  else
    Result := '';
end;

function TForm1.GetKeyPath(var AName: string): string;
var
  p: integer;
begin
  p := BackPosEx('\', AName, Length(AName));
  if p > 0 then
  begin
    Result := Copy(AName, 1, p - 1);
    AName := Copy(AName, p + 1, Length(AName));
  end
  else
    Result := '';
end;

procedure TForm1.AssignBasicNodeParams(ANode: TRegistryNode);
begin
  with ANode do
  begin
    FType := rntKey;
    StateIndex := 1;
    FKey := TRegistryNode(Parent).FKey;
    FPath := TRegistryNode(Parent).FPath + '\' + Text;
    HasChildren := True;
  end;
end;

procedure TForm1.DeleteAllSubs(ANode: TDCTreeNode);
var
  rki: TRegKeyInfo;
  _Path: string;
begin
  with FRegistry, TRegistryNode(ANode) do
  begin
    Collapse(False);
    DeleteChildren;
    _Path := GetFullPath(Pointer(FPath));
    HasChildren := (FType = rntKey) and ((_Path = '') or
      OpenKey(_Path + '\', False) and GetKeyInfo(rki) and
      (rki.NumSubKeys + rki.NumValues > 0));
    CloseKey;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  _RootNode: TRegistryNode;

  procedure AddRootRegNode(ARootKey: HKEY);
  var
    _Node: TRegistryNode;
  begin
    with FRegistry do
    begin
      RootKey := ARootKey;
      if OpenKey('', False) then
      begin
        _Node := TRegistryNode(DCTreeGrid1.Items.AddChild(
          _RootNode, HKEY_ROOT_Names[ARootKey]));
        AssignBasicNodeParams(_Node);
        _Node.FKey := ARootKey;
        CloseKey;
      end;
    end;
  end;

begin
  FRegistry := TRegistry.Create;
  //FRegistry.LazyWrite := False;
  with DCTreeGrid1 do
  begin
    DefaultNodeClass := TRegistryNode;
    _RootNode := TRegistryNode(Items.Add(nil, 'My Computer'));
  end;
  with _RootNode do
  begin
    FType := rntRoot;
    StateIndex := 0;
    FKey := 0;
    FPath := Text;

    AddRootRegNode(HKEY_CLASSES_ROOT);
    AddRootRegNode(HKEY_CURRENT_USER);
    AddRootRegNode(HKEY_LOCAL_MACHINE);
    AddRootRegNode(HKEY_USERS);
    AddRootRegNode(HKEY_PERFORMANCE_DATA);
    AddRootRegNode(HKEY_CURRENT_CONFIG);
    AddRootRegNode(HKEY_DYN_DATA);

    Expand(False);
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FRegistry.Free;
end;

procedure TForm1.DCTreeGrid1Expanding(Sender: TObject; Node: TDCTreeNode;
  var AllowExpansion: Boolean);
var
  _Node: TRegistryNode;
  SubKeys: TStringList;
  _RootPath, sData: string;
  rdi: TRegDataInfo;
  rki: TRegKeyInfo;
  bData: Pointer;
  i, j: integer;
begin
  if Node.Count > 0 then
    exit;
  Screen.Cursor := crHourGlass;
  try
    with FRegistry, TRegistryNode(Node) do
    begin
      RootKey := FKey;
      SubKeys := TStringList.Create;
      try
        _RootPath := GetFullPath(Pointer(FPath)) + '\';
        if OpenKey(_RootPath, False) then
        begin
          GetKeyNames(SubKeys);
          CloseKey;
          for i := 0 to SubKeys.Count - 1 do
          begin
            RootKey := FKey;
            if OpenKey(_RootPath + SubKeys[i] + '\', False) then
            begin
              _Node := TRegistryNode(DCTreeGrid1.Items.AddChild(Node, SubKeys[i]));
              AssignBasicNodeParams(_Node);
              _Node.HasChildren := GetKeyInfo(rki) and (rki.NumSubKeys + rki.NumValues > 0);
              CloseKey;
            end;
          end;
        end;
        SubKeys.Clear;
        if OpenKey(_RootPath, False) then
        begin
          GetValueNames(SubKeys);
          for i := 0 to SubKeys.Count - 1 do
          begin
            if SubKeys[i] = '' then
              sData := SDefaultKeyValue
            else
              sData := SubKeys[i];
            _Node := TRegistryNode(DCTreeGrid1.Items.AddChild(Node, sData));
            AssignBasicNodeParams(_Node);
            with _Node, rdi do
            begin
              if not GetDataInfo(SubKeys[i], rdi) then
              begin
                RegData := rdUnknown;
                DataSize := 0;
              end;
              HasChildren := False;
              case RegData of
                rdUnknown, rdString, rdExpandString: FType := rntString;
                rdInteger: FType := rntDword;
                rdBinary: FType := rntBinary;
              end;
              StateIndex := RegDataTypeIndexes[RegData];
              Columns[1] := RegDataTypeNames[RegData];
              case RegData of
                rdString, rdExpandString: Columns[2] := ReadString(SubKeys[i]);
                rdInteger: Columns[2] := GetIntValue(ReadInteger(SubKeys[i]));
                rdBinary:
                  begin
                    GetMem(bData, Datasize);
                    try
                      ReadBinaryData(SubKeys[i], bData^, DataSize);
                      sData := '';
                      if Datasize > 256 then
                        DataSize := 256;
                      for j := 0 to DataSize - 1 do
                        sData := sData + Format('%.2x', [Ord(PChar(bData)[j])]) + ' ';
                      Columns[2] := sData;
                    finally
                      FreeMem(bData);
                    end;
                  end;
              end;
            end;
          end;
          CloseKey;
        end;
      finally
        SubKeys.Free;
      end;
    end;
    if Node.Count = 0 then
      Node.HasChildren := False;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TForm1.DCTreeGrid1SelectionChanged(Sender: TObject;
  Node: TDCTreeNode);
begin
  if Node <> nil then
    StatusBar1.SimpleText := TRegistryNode(Node).FPath
  else
    StatusBar1.SimpleText := '';
end;

function TForm1.AddNewNode(const AText: string): TRegistryNode;
begin
  with FRegistry, TRegistryNode(DCTreeGrid1.Selected) do
  begin
    Expand(False);
    Result := TRegistryNode(DCTreeGrid1.Items.AddChild(DCTreeGrid1.Selected, AText));
    AssignBasicNodeParams(Result);
  end;
end;

procedure TForm1.EditNewNode(ANode: TRegistryNode);
begin
  ANode.HasChildren := False;
  DCTreeGrid1.Selected := ANode;
  ANode.EditText;
end;

procedure TForm1.AddNewValue(AType: TRegDataType);
const
  CNewName = 'New Value #';
var
  _Node: TRegistryNode;
  _Path, _Value: string;
  i: integer;
begin
  with FRegistry, TRegistryNode(DCTreeGrid1.Selected) do
  begin
    Expand(False);
    RootKey := FKey;
    _Path := GetFullPath(Pointer(FPath));
    if OpenKey(_Path, False) then
    begin
      i := 1;
      repeat
        _Value := CNewName + IntToStr(i);
        Inc(i);
      until not ValueExists(_Value);
      _Node := AddNewNode(_Value);
      _Node.FType := RegNodeTypes[AType];
      _Node.StateIndex := RegDataTypeIndexes[AType];
      case AType of
        rdString: WriteString(_Value, '');
        rdInteger:
          begin
            WriteInteger(_Value, 0);
            _Node.Columns[2] := GetIntValue(0);
          end;
        rdBinary: WriteBinaryData(_Value, _Value, 0);
      end;
      _Node.Columns[1] := RegDataTypeNames[AType];
      EditNewNode(_Node);
    end
    else
      MessageDlg('Cannot create value.', mtError, [mbOK], 0);
    CloseKey;
  end;
end;

procedure TForm1.Key1Click(Sender: TObject);
const
  CNewName = 'New Key #';
var
  _Value: string;
  i: integer;
begin
  with FRegistry, TRegistryNode(DCTreeGrid1.Selected) do
  begin
    Expand(False);
    RootKey := FKey;
    i := 1;
    repeat
      _Value := CNewName + IntToStr(i);
      Inc(i);
    until not KeyExists(_Value);
    if CreateKey(GetFullPath(Pointer(FPath)) + '\' + _Value + '\') then
    begin
      EditNewNode(AddNewNode(_Value));
      CloseKey;
    end
    else
      MessageDlg('Cannot create key.', mtError, [mbOK], 0);
  end;
end;

procedure TForm1.StringValue1Click(Sender: TObject);
begin
  AddNewValue(rdString);
end;

procedure TForm1.BinaryValue1Click(Sender: TObject);
begin
  AddNewValue(rdBinary);
end;

procedure TForm1.DWORDValue1Click(Sender: TObject);
begin
  AddNewValue(rdInteger);
end;

procedure TForm1.Modify1Click(Sender: TObject);
var
  _Name, _Path: string;
  _Form: TForm;
  i: integer;
begin
  with FRegistry, TRegistryNode(DCTreeGrid1.Selected) do
  begin
    if (DCTreeGrid1.Selected = nil) or
      not (FType in [rntString, {rntBinary,} rntDWord]) then
      exit;
    RootKey := FKey;
    _Name := GetFullPath(Pointer(FPath));
    _Path := GetKeyPath(_Name);
    if OpenKey(_Path, False) then
    begin
      case FType of
        rntString: _Form := EdStrForm;
        //rntBinary: _Form := nil;
        rntDWord:
          begin
            _Form := EdDWordForm;
            EdDWordForm.edtData.Text := '0';
            EdDWordForm.RadioGroup1.ItemIndex := 0;
          end;
        else _Form := nil;
      end;
      case FType of
        rntString:
          with TEdStrForm(_Form) do
          begin
            edtName.Text := _Name;
            if _Name = SDefaultKeyValue then
              edtData.Text := ReadString('')
            else
              edtData.Text := ReadString(_Name);
          end;
        rntDWord:
          with TEdDWordForm(_Form) do
          begin
            edtName.Text := _Name;
            edtData.Text := IntToHex(ReadInteger(_Name),0);
          end;
      end;
      if _Form.ShowModal = mrOK then
        case FType of
          rntString:
            with TEdStrForm(_Form) do
            begin
              if _Name = SDefaultKeyValue then
                WriteString('', edtData.Text)
              else
                WriteString(_Name, edtData.Text);
              Columns[2] := edtData.Text;
            end;
          rntDWord:
            with TEdDWordForm(_Form) do
            begin
              i := EdDWordForm.GetDataValue;
              WriteInteger(_Name, i);
              Columns[2] := GetIntValue(i);
            end;
        end;
      CloseKey;
    end
    else
      MessageDlg('Cannot access value ' + Text + '.', mtError, [mbOK], 0);
  end;
end;

type
  TDeleteFunc = function(const Str: string): Boolean of object;

procedure TForm1.Delete1Click(Sender: TObject);
var
  DeleteFunc: TDeleteFunc;
  SObject, _Name, _Path: string;
begin
  if DCTreeGrid1.IsEditing then
    exit;
  with FRegistry, TRegistryNode(DCTreeGrid1.Selected) do
  begin
    _Name := GetFullPath(Pointer(FPath));
    if FType = rntKey then
    begin
      DeleteFunc := DeleteKey;
      SObject := 'key';
    end
    else
    begin
      DeleteFunc := DeleteValue;
      SObject := 'value';
    end;
    if FType <> rntKey then
      _Path := GetKeyPath(_Name);
    if _Name = SDefaultKeyValue then
      _Name := '';
    if MessageDlg('Are you sure you want to delete this ' + SObject + '?',
      mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      exit;
    RootKey := FKey;
    if ((FType = rntKey) or OpenKey(_Path, False)) and DeleteFunc(_Name) then
      Free
    else
    begin
      MessageDlg('Unable to delete specified ' + SObject, mtError, [mbOK], 0);
      DeleteAllSubs(DCTreeGrid1.Selected);
    end;
    CloseKey;
  end;
end;

procedure TForm1.Rename1Click(Sender: TObject);
begin
  with DCTreeGrid1 do
  begin
    CurrentColumn := Columns[0];
    Selected.EditText;
  end;
end;

procedure TForm1.CopyKeyName1Click(Sender: TObject);
begin
  with TRegistryNode(DCTreeGrid1.Selected) do
    Clipboard.AsText := HKEY_ROOT_Names[FKey] + '\' + GetFullPath(Pointer(FPath));
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
  if DCTreeGrid1.Selected <> nil then
    with TRegistryNode(DCTreeGrid1.Selected) do
    begin
      New1.Visible := FType = rntKey;
      Modify1.Visible := FType in [rntString, rntBinary, rntDWord];
      N4.Visible := New1.Visible or Modify1.Visible;
      Delete1.Visible := FType <> rntRoot;
      Delete1.Enabled := Level > 1;
      Rename1.Visible := FType <> rntRoot;
      Rename1.Enabled := (Level > 1) and (Text <> SDefaultKeyValue);
      N1.Visible := Delete1.Visible or Rename1.Visible;
      CopyKeyName1.Visible := FType = rntKey;
      N2.Visible := CopyKeyName1.Visible;
    end;
end;

procedure TForm1.DCTreeGrid1RightClickNode(Sender: TObject;
  Node: TDCTreeNode; var Action: TRightClickAction);
begin
  Action := raMakeSelected;
end;

procedure TForm1.DCTreeGrid1Editing(Sender: TObject; Node: TDCTreeNode;
  var AllowEdit: Boolean);
begin
  with TRegistryNode(Node) do
    AllowEdit := (Level > 1) and (Text <> SDefaultKeyValue);
end;

procedure TForm1.DCTreeGrid1Edited(Sender: TObject; Node: TDCTreeNode;
  var NewText: string);
var
  _Name, _Path, OldText: string;
begin
  with FRegistry, TRegistryNode(DCTreeGrid1.Selected) do
  begin
    _Name := GetFullPath(Pointer(FPath));
    _Path := GetKeyPath(_Name);
    OldText := Text;
    RootKey := FKey;
    if OpenKey(_Path, False) and (Trim(NewText) <> '') and
      (FType = rntKey) and KeyExists(OldText) and not KeyExists(NewText) or
      (FType <> rntKey) and ValueExists(OldText) and not ValueExists(NewText) then
    begin
      if FType = rntKey then
        MoveKey(OldText, NewText, True)
      else
        RenameValue(OldText, NewText);
      FPath := GetKeyPath(FPath) + '\' + NewText;
    end
    else
    begin
      NewText := OldText;
      MessageDlg('Cannot rename "' + OldText + '".', mtError, [mbOK], 0);
    end;
    CloseKey;
  end;
end;

procedure TForm1.DCTreeGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_DELETE: Delete1Click(Sender);
    VK_RETURN: Modify1Click(Sender);
    //VK_F5: Refresh1Click(Sender);
  end;
end;

procedure TForm1.DCTreeGrid1DblClick(Sender: TObject);
begin
  Modify1Click(Sender);
end;

procedure TForm1.Refresh1Click(Sender: TObject);
var
  _Path: string;
  _Node: TDCTreeNode;

  procedure SelectSubNode;
  var
    _Save, _Node: TDCTreeNode;
    _Text: string;
    p: integer;
  begin
    p := Pos('\', _Path);
    if p = 0 then
      p := Length(_Path) + 1;
    _Text := Copy(_Path, 1, p - 1);
    Delete(_Path, 1, p);
    with DCTreeGrid1 do
    begin
      _Save := Selected;
      Selected.Expand(False);
      _Node := Selected.GetFirstChild;
      while _Node <> nil do
      begin
        if _Node.Text = _Text then
        begin
          Selected := _Node;
          break;
        end;
        _Node := _Node.GetNextSibling;
      end;
    end;
    if DCTreeGrid1.Selected = _Save then
      _Path := '';
  end;

begin
  with FRegistry, DCTreeGrid1.Items do
  begin
    with TRegistryNode(DCTreeGrid1.Selected) do
    begin
      _Path := GetFullPath(Pointer(FPath));
      if FKey <> 0 then
        _Path := HKEY_ROOT_Names[FKey] + '\' + _Path;
    end;
    with GetFirstNode do
    begin
      _Node := GetFirstChild;
      while _Node <> nil do
      begin
        DeleteAllSubs(_Node);
        _Node := _Node.GetNextSibling;
      end;
    end;
    DCTreeGrid1.Selected := GetFirstNode;
    while _Path <> '' do
      SelectSubNode;
  end;
end;

procedure TForm1.Label5Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar(Label5.Caption), nil, nil, SW_SHOW);
end;

end.
