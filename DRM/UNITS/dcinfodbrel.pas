{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit dcInfoDBRel;

interface
uses Classes, Db, SysUtils,
     dcConsts, dcInfoDB, dcInfoRel, dcdreamLib, dcInfoLib, 
     typinfo, dbcommon, dcDBFilter;

Const
  SRelDisplayName='%s - %s (Level=%d)'; //don't resource
  SRelDisplayNameStr='%s - %s (Level=%s)'; //don't resource
  SInfoRelAll='All'; //don't resource
Type

  { TDataRelation }

  TDataRelation=Class(TCustomDCRelation)
  Private
    FDetailDataSet:TDCLinkedComponent;
    FMasterDataSet:TDCLinkedComponent;
    Function GetDetailDataSet:TComponent;
    Procedure SetDetailDataSet(Value:TComponent);
    Function GetMasterDataSet:TComponent;
    Procedure SetMasterDataSet(Value:TComponent);
  Protected
    Function GetDisplayName:String;override;
  Public
    Constructor Create(Collection:TCollection);override;
    Destructor Destroy;override;
  Published
    Property DetailDataSet:TComponent read GetDetailDataSet write SetDetailDataSet;
    Property MasterDataSet:TComponent read GetMasterDataSet write SetMasterDataSet;
  End;

  { TDataRelations }

  TDataRelations=Class(TDCRelations)
  Private
    Function GetItem(Index:Integer):TDataRelation;
  Public
    Property Items[Index:Integer]:TDataRelation read GetItem;default;
  End;

  { TDBRelInfoSet }

  TDBRelInfoSet=Class(TInfoSetRelInfoSet)
    FDataSet:TDataSet;
    FExprParser:TExprParser;
  Protected
    Function CanEvaluateFilter:Boolean;override;
    Procedure CheckActive;override;
    Function CreateRelations:TDCRelations;override;
    Function EvaluateFilter:Boolean;override;
    Function InternalCheckFilter:Boolean;override;
  Public
    Destructor Destroy;override;
  End;

  TDCDBRelInfoSet=Class(TCustomDCRelInfoSet)
  Private
    FDataSet : TComponent;
    FVersion : TDCInfoTreeVersion;
    Function GetRelations:TDataRelations;
    Procedure SetRelations(Value:TDataRelations);
    Procedure SetDataSet(Value:TComponent);
  Protected
    Procedure Notification(Component:TComponent;Operation:TOperation);override;
  Public
    Constructor Create(AOwner:TComponent);override;
    Destructor Destroy;override;
  Published
    Property RootDataSet:TComponent read FDataSet write SetDataSet;

    Property Relations:TDataRelations read GetRelations write SetRelations;
    property Version : TDCInfoTreeVersion read FVersion write FVersion stored false;
  End;

implementation

{ TDataRelation }

Constructor TDataRelation.Create(Collection:TCollection);
Begin
  Inherited;
  ResetInfoSet(DetailInfoSeti,Nil);
  ResetInfoSet(MasterInfoSeti,Nil);
  FDetailDataSet:=TDCLinkedComponent.Create(Nil);
  FMasterDataSet:=TDCLinkedComponent.Create(Nil);
End;

{---------------------------------------------------------}

Destructor TDataRelation.Destroy;
Begin
  DetailDataSet:=Nil;
  MasterDataSet:=Nil;
  FreeObject(FMasterDataSet,FMasterDataSet);
  FreeObject(FDetailDataSet,FDetailDataSet);
  Inherited;
End;

{---------------------------------------------------------}

Function TDataRelation.GetDetailDataSet:TComponent;
Begin
  Result:=TComponent(FDetailDataSet.Link);
End;

{---------------------------------------------------------}

Function TDataRelation.GetMasterDataSet:TComponent;
Begin
  Result:=TComponent(FMasterDataSet.Link);
End;

{---------------------------------------------------------}

Procedure TDataRelation.SetDetailDataSet(Value:TComponent);
Begin
  FDetailDataSet.Link:=Value;
  DetailInfoSeti:=ResetInfoSet(DetailInfoSeti,Value);
End;

{---------------------------------------------------------}

Procedure TDataRelation.SetMasterDataSet(Value:TComponent);
Begin
  FMasterDataSet.Link:=Value;
  MasterInfoSeti:=ResetInfoSet(MasterInfoSeti,Value);
End;

{---------------------------------------------------------}

Function TDataRelations.GetItem(Index:Integer):TDataRelation;
Begin
  Result:=TDataRelation(Inherited Items[Index]);
End;

{---------------------------------------------------------}

Function TDataRelation.GetDisplayName:String;
Begin
  If (MasterDataSet<>Nil) And (DetailDataSet<>Nil) Then
    If ActiveOnLevel<>-1 Then
      Result:=Format(SRelDisplayName,[MasterDataSet.Name,DetailDataSet.Name,ActiveOnLevel])
    Else
      Result:=Format(SRelDisplayNameStr,[MasterDataSet.Name,DetailDataSet.Name,SInfoRelAll])
  Else
    Result:=Inherited GetDisplayName;
End;

{ TDBRelInfoSet }

Destructor TDBRelInfoSet.Destroy;
Begin
  FExprParser.Free;
  Inherited;
End;

{---------------------------------------------------------}

Function TDBRelInfoSet.CanEvaluateFilter:Boolean;
Begin
  Result:=FDataSet<>Nil;
End;

{---------------------------------------------------------}

Procedure TDBRelInfoSet.CheckActive;
Begin
  If InfoSet=Nil Then
    ErrorFmt(SErrSetRootDataSet,[Owner.Name]);
End;

{---------------------------------------------------------}

Function TDBRelInfoSet.CreateRelations:TDCRelations;
begin
  Result:=TDataRelations.Create(Owner,TDataRelation);
end;

{---------------------------------------------------------}

Function TDBRelInfoSet.EvaluateFilter:Boolean;
Begin
  Result:=dcDBFilter.EvaluateFilter(FDataSet,FExprParser);
End;

{---------------------------------------------------------}

Function TDBRelInfoSet.InternalCheckFilter:Boolean;
Var
  Unk:IUnknown;
Begin
  Result:=False;
  If Not GetInterface(IUnknown,Unk) Then
    Exit;
  FDataSet:=InfoSetToDataSet(Unk);
  FExprParser.Free;
  FExprParser:=ParseFilter(FDataSet,Filter,[]);
  Result:=True;
End;

{ TDCDBRelInfoSet }

Constructor TDCDBRelInfoSet.Create(AOwner: TComponent);
Var
  IntObj:TCustomRelInfoSet;
Begin
  Inherited;
  IntObj:=TDBRelInfoSet.CreateWithOwner(Self);
  ObjInterface:=IntObj;
  VCLComObject:=Pointer(ObjInterface);
  IntfObj:=IntObj;
End;

{---------------------------------------------------------}

Destructor TDCDBRelInfoSet.Destroy;
Begin
  RootDataSet:=Nil;
  Inherited;
End;

{---------------------------------------------------------}

Function TDCDBRelInfoSet.GetRelations:TDataRelations;
Begin
  Result:=TDataRelations(Inherited Relations);
End;

{---------------------------------------------------------}

Procedure TDCDBRelInfoSet.Notification(Component: TComponent;
  Operation: TOperation);
Begin
  Inherited;
  If (Component=FDataSet) And (Operation=opRemove) Then
    RootDataSet:=Nil;
End;

{---------------------------------------------------------}

Procedure TDCDBRelInfoSet.SetDataSet(Value:TComponent);
Begin
  FDataSet:=Value;
  RootInfoSeti:=ResetInfoSet(RootInfoSeti,Value);
End;

{---------------------------------------------------------}

Procedure TDCDBRelInfoSet.SetRelations(Value:TDataRelations);
Begin
  Inherited Relations:=Value;
End;

end.
