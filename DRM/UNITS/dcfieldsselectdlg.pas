{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit DCFieldsSelectDlg;

interface
{.$I dc.inc}
{$I dcprod.inc}
  
uses
  StdCtrls, Controls, Buttons, Classes, Forms,
(*
  {$IFDEF USEOWNDSGNSTUFF}
  dcdsgnstuff,
  {$ELSE}
    {$IFDEF D6}
    DesignIntf,DesignEditors,VCLEditors,
    {$ELSE}
    dsgnintf,
    {$ENDIF}
  {$ENDIF}
*)
  Dialogs, SysUtils,

  DCConsts, DCdreamLib;

type
  TDCFieldsSelection = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    SrcList: TListBox;
    DstList: TListBox;
    SrcLabel: TLabel;
    DstLabel: TLabel;
    IncludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    MoveUpBtn: TSpeedButton;
    MoveDownBtn: TSpeedButton;
    procedure IncludeBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcAllBtnClick(Sender: TObject);
    procedure MoveUpBtnClick(Sender: TObject);
    procedure MoveDownBtnClick(Sender: TObject);
    procedure DstListClick(Sender: TObject);
    procedure DstListDblClick(Sender: TObject);
    procedure SrcListDblClick(Sender: TObject);
  private
    Function  GetChosenFields : String;
    Procedure SetChosenFields( Const AValue : String );
  public
    Constructor Create( AOwner : TComponent ); override;

    Procedure MoveSelected( List : TCustomListBox; Items : TStrings );
    Procedure SetItem( List : TListBox; Index : Integer );
    Function  GetFirstSelection( List : TCustomListBox ) : Integer;
    Procedure SetButtons;

    Property ChosenFields : String Read GetChosenFields Write SetChosenFields;
  end;

{------------------------------------------------------------------}

Function DCShowFieldsDialog( Const ADialogCaption : String; Var AFieldsList : String; AAvailableList : TStrings ) : Boolean;

{------------------------------------------------------------------}

implementation

{$R *.DFM}

{------------------------------------------------------------------}

Function DCShowFieldsDialog( Const ADialogCaption : String; Var AFieldsList : String;
  AAvailableList : TStrings ) : Boolean;
begin
  Result := False;
  With TDCFieldsSelection.Create( Nil ) Do
  try
    Caption := ADialogCaption;
    SrcList.Items.Assign( AAvailableList );
    If SrcList.Items.Count > 0 Then
    begin
      ChosenFields := AFieldsList;
      Result := ShowModal = mrOk;
      If Result Then
        AFieldsList := ChosenFields;
    end
    Else
      MessageDlg( sDCNoFieldsAreAvailable, mtError, [mbOk], 0 );
  finally
    Free;
  end;
end;

{------------------------------------------------------------------}

{ TDCFieldsSelection }

procedure TDCFieldsSelection.IncludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(SrcList);
  MoveSelected(SrcList, DstList.Items);
  SetItem(SrcList, Index);
end;

{------------------------------------------------------------------}

procedure TDCFieldsSelection.ExcludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(DstList);
  MoveSelected(DstList, SrcList.Items);
  SetItem(DstList, Index);
end;

{------------------------------------------------------------------}

procedure TDCFieldsSelection.IncAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to SrcList.Items.Count - 1 do
    DstList.Items.AddObject(SrcList.Items[I],
      SrcList.Items.Objects[I]);
  SrcList.Items.Clear;
  SetItem(SrcList, 0);
end;

{------------------------------------------------------------------}

procedure TDCFieldsSelection.ExcAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  For I := DstList.Items.Count - 1 DownTo 0 Do
    If SrcList.Items.IndexOf( DstList.Items[I] ) < 0 Then 
      SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
  DstList.Items.Clear;
  SetItem(DstList, 0);
end;

{------------------------------------------------------------------}

Procedure TDCFieldsSelection.MoveSelected( List : TCustomListBox; Items : TStrings );
Var
  I : Integer;
begin
  For I := 0 To List.Items.Count - 1 Do
    If List.Selected[I] Then
      If Items.IndexOf( List.Items[I] ) < 0 Then
        Items.AddObject( List.Items[I], List.Items.Objects[I] );
      
  For I := List.Items.Count - 1 DownTo 0 Do
    If List.Selected[I] Then
      List.Items.Delete(I);
end;

{------------------------------------------------------------------}

Procedure TDCFieldsSelection.SetButtons;
Var
  SrcEmpty, DstEmpty: Boolean;
begin
  SrcEmpty := SrcList.Items.Count = 0;
  DstEmpty := DstList.Items.Count = 0;
  IncludeBtn.Enabled := not SrcEmpty;
  IncAllBtn.Enabled := not SrcEmpty;
  ExcludeBtn.Enabled := not DstEmpty;
  ExAllBtn.Enabled := not DstEmpty;
  MoveUpBtn.Enabled := ( DstList.SelCount > 0 ) And Not DstList.Selected[0];
  MoveDownBtn.Enabled := ( DstList.SelCount > 0 ) And Not DstList.Selected[ DstList.Items.Count - 1 ];
end;

{------------------------------------------------------------------}

Function TDCFieldsSelection.GetFirstSelection( List : TCustomListBox ) : Integer;
begin
  For Result := 0 To List.Items.Count - 1 Do
    If List.Selected[Result] Then
      Exit;
  Result := -1;
end;

{------------------------------------------------------------------}

Procedure TDCFieldsSelection.SetItem( List : TListBox; Index : Integer );
Var
  MaxIndex : Integer;
begin
  With List Do
  begin
    SetFocus;
    MaxIndex := List.Items.Count - 1;
    If Index = -1 Then
      Index := 0
    Else
      If Index > MaxIndex Then
        Index := MaxIndex;
    Selected[Index] := True;
  end;
  SetButtons;
end;

{------------------------------------------------------------------}

procedure TDCFieldsSelection.MoveDownBtnClick(Sender: TObject);
Var
  I : Integer;
begin
  If ( DstList.SelCount = 0 ) Or DstList.Selected[ DstList.Items.Count - 1 ] Then
    Exit;

  For I := DstList.Items.Count - 2 DownTo 0 Do
    If DstList.Selected[ I ] Then
    begin
      DstList.Items.Move( I, I + 1 );
      DstList.Selected[ I + 1 ] := True;
    end;
  SetButtons;
end;

{------------------------------------------------------------------}

procedure TDCFieldsSelection.MoveUpBtnClick(Sender: TObject);
Var
  I : Integer;
begin
  If ( DstList.SelCount = 0 ) Or DstList.Selected[0] Then
    Exit;

  For I := 1 To DstList.Items.Count - 1 Do
    If DstList.Selected[ I ] Then
    begin
      DstList.Items.Move( I, I - 1 );
      DstList.Selected[ I - 1 ] := True;
    end;
  SetButtons;
end;

{------------------------------------------------------------------}

function TDCFieldsSelection.GetChosenFields: String;
Var
  I : Integer;
begin
  Result := '';
  With DstList.Items Do
    For I := 0 To Count - 1 Do
      Result := Result + Strings[I] + ';';
  SetLength( Result, Length( Result ) - 1 );
end;

{------------------------------------------------------------------}

procedure TDCFieldsSelection.SetChosenFields(const AValue: String);
Var
  I, Idx : Integer;
begin
  DstList.Items.BeginUpdate;
  try
    DstList.Clear;
    If SrcList.Items.Count = 0 Then
      Exit;
    ParseString( AValue, ';', DstList.Items );
    With DstList.Items Do
      For I := Count - 1 DownTo 0 Do
      begin
        Strings[I] := Trim( Strings[I] );
        Idx := SrcList.Items.IndexOf( Strings[I] );
        If ( Strings[I] = '' ) Or ( Idx < 0 ) Then
          Delete( I )
        Else
          SrcList.Items.Delete( Idx );
      end;
  finally
    DstList.Items.EndUpdate;
  end;
  SetButtons;
end;

{------------------------------------------------------------------}

Constructor TDCFieldsSelection.Create( AOwner : TComponent );
begin
  Inherited;
  SrcLabel.Caption := sDCSourceLabel;
  DstLabel.Caption := sDCDestinationLabel;
  CancelBtn.Caption := sCancelButton; 
end;

{------------------------------------------------------------------}

procedure TDCFieldsSelection.DstListClick(Sender: TObject);
begin
  SetButtons;
end;

{------------------------------------------------------------------}

procedure TDCFieldsSelection.DstListDblClick(Sender: TObject);
begin
  ExcludeBtnClick( ExcludeBtn );
end;

{------------------------------------------------------------------}

procedure TDCFieldsSelection.SrcListDblClick(Sender: TObject);
begin
  IncludeBtnClick( IncludeBtn );
end;

{------------------------------------------------------------------}

end.
