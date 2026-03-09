{*****************************************************************************
Copyright:    Copywrite © by Max Evans, 2002
Unit Name:    RouteMapSteps
Author:       Max Evans
Email:        max@codecraft.com.au
Date:         February 11, 2002
Last Updated: February 12, 2002 by Yu Wei
Purpose:      Step style route map for TKWizardRouteMap
History:
---------------------------------------------------------------------------
Date(mm/dd/yy)   Comments
---------------------------------------------------------------------------
11/02/2002       Initial release
******************************************************************************}
unit RouteMapSteps;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  KWizard;

type
  TKWizardRouteMapSteps = class(TKWizardRouteMapControl)
  private
    FIndent: Integer;
    FNextStepText: string;
    FPreviousStepText: string;
    FShowDivider: Boolean;
    FShowNavigators: Boolean;
    function  GetActiveStepRect:TRect;
    function  GetPreviousStepRect:TRect;
    function  GetNextStepRect:TRect;
    function  GetPreviousArrowRect:TRect;
    function  GetNextArrowRect:TRect;
    procedure SetIndent(const Value: Integer);
    procedure SetNextStepText(const Value: string);
    procedure SetPreviousStepText(const Value: string);
    procedure SetShowDivider(const Value: Boolean);
    procedure SetShowNavigators(const Value: Boolean);
    function  DetectPageCount(var ActivePageIndex: Integer): Integer; // Add by Yu Wei
    function  DetectPage(Pt: TPoint): TKWizardCustomPage; // Add by Yu Wei
  protected
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    function PageAtPos(Pt: TPoint): TKWizardCustomPage; override;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Color;
    property Font;
    property Indent:Integer read FIndent write SetIndent;
    property PreviousStepText: string
      read FPreviousStepText write SetPreviousStepText;
    property NextStepText: string read FNextStepText write SetNextStepText;
    property ShowDivider: Boolean read FShowDivider write SetShowDivider;
    property ShowNavigators:Boolean read FShowNavigators write SetShowNavigators;
  end;

procedure Register;

implementation

resourcestring

  rsActiveStepFormat = 'Step %d of %d';

procedure Register;
begin
  RegisterComponents('K Wizard', [TKWizardRouteMapSteps]);
end;

{ TKWizardRouteMapSteps }

constructor TKWizardRouteMapSteps.Create(AOwner: TComponent);
begin
  inherited;
  FIndent := 5;
  Color := clBackground;
  Font.Color := clWhite;
  FPreviousStepText := 'Back to';
  FNextStepText := 'Next Step';
  FShowNavigators := True;
  FShowDivider := True;
end;

function TKWizardRouteMapSteps.DetectPage(Pt: TPoint): TKWizardCustomPage;
begin
  // Ignore all disabled pages at run time.
  Result := nil;
  if PtInRect(GetPreviousArrowRect, Pt) then
  begin
    Result := Wizard.FindNextPage(PageIndex, -1, not (csDesigning in ComponentState));
  end
  else if PtInRect(GetNextArrowRect, Pt) then
  begin
    Result := Wizard.FindNextPage(PageIndex, 1, not (csDesigning in ComponentState));
  end;
end;

function TKWizardRouteMapSteps.GetActiveStepRect: TRect;
begin
  Result := Rect(Left + FIndent,(ClientHeight div 2 - Canvas.TextHeight('Yy')),
    Width, ClientHeight div 2);
end;

function TKWizardRouteMapSteps.GetNextArrowRect: TRect;
begin
  Result := Rect(Left + FIndent, Height - Indent - 32, Left + FIndent + 16,
    (Height - FIndent) - 16);
end;

function TKWizardRouteMapSteps.GetNextStepRect: TRect;
begin
  Result := Rect(Left + FIndent, Height - FIndent - 32, Width,
    Height - FIndent - 32  +  Canvas.TextHeight('Yy'));
end;

function TKWizardRouteMapSteps.DetectPageCount(
  var ActivePageIndex: Integer): Integer;
var
  i: Integer;
begin
  // Ignore all disabled pages at run time.
  ActivePageIndex := 0;
  Result := 0;
  for i := 0 to PageCount - 1 do
  begin
    if (csDesigning in ComponentState) or Pages[i].Enabled then
    begin
      if i <= PageIndex then Inc(ActivePageIndex);
      Inc(Result);
    end;
  end;
end;

function TKWizardRouteMapSteps.GetPreviousArrowRect: TRect;
begin
  Result := Rect(Left + FIndent, Top + FIndent, Left + FIndent + 16,
    Top + FIndent + 16);
end;

function TKWizardRouteMapSteps.GetPreviousStepRect: TRect;
begin
  Result := Rect(Left + FIndent, Top + FIndent, Width,
    Top + FIndent + Canvas.TextHeight('Yy'));
end;

procedure TKWizardRouteMapSteps.MouseMove(Shift: TShiftState; X,Y: Integer);
var
  Pt: TPoint;
  APage: TKWizardCustomPage;
begin
  inherited;
  Pt := Point(X, Y);
  if PtInRect(ClientRect, Pt) and ShowNavigators then
  begin
    APage := DetectPage(Pt);
    if Assigned(APage) then
      Screen.Cursor := crHandPoint
    else
      Screen.Cursor := crDefault;
  end;
end;

function TKWizardRouteMapSteps.PageAtPos(Pt: TPoint): TKWizardCustomPage;
begin
  Result := DetectPage(Pt);
end;

procedure TKWizardRouteMapSteps.Paint;
var
  ARect, TextRect, ArrowRect, DividerRect: TRect;
  ActivePageIndex, TotalPageCount: Integer;
  StepHeight: Integer;
  APage: TKWizardCustomPage;
begin
  ARect := ClientRect;
  TotalPageCount := DetectPageCount(ActivePageIndex);

  TextRect := GetActiveStepRect;
  Canvas.Font.Assign(Font);
  Canvas.Font.Style:= [fsBold];
  Canvas.Brush.Style:= bsClear;

  StepHeight := DrawText(Canvas.Handle, PChar(Format(rsActiveStepFormat,
     [ActivePageIndex, TotalPageCount])), -1, TextRect,
     DT_LEFT or DT_SINGLELINE or DT_END_ELLIPSIS or DT_VCENTER);

  //Display Active Page Description
  Canvas.Font.Style:= [];
  OffsetRect(TextRect, 0, StepHeight);
  DrawText(Canvas.Handle, PChar(Pages[PageIndex].Caption), -1, TextRect,
           DT_LEFT or DT_SINGLELINE or DT_END_ELLIPSIS or DT_VCENTER);
  Canvas.Font.Style:= [];
  if FShowDivider then
  begin
    SetRect(DividerRect, Left + FIndent, TextRect.Bottom + 5, Width - FIndent,
      TextRect.Bottom + 6);
    DrawEdge(Canvas.Handle, DividerRect, EDGE_RAISED, BF_FLAT OR BF_BOTTOM);
  end;

  { do the prevous step}
  
  // YW - Ignore all disabled pages at run time
  APage := Wizard.FindNextPage(PageIndex, -1, not (csDesigning in ComponentState));
  if Assigned(APage) then
  begin
    TextRect := GetPreviousStepRect;
    ArrowRect := GetPreviousArrowRect;
    Canvas.Font.Style:= [];
    if ShowNavigators then
    begin
      if TextRect.Left + FIndent + ArrowRect.Right - ArrowRect.Left < Width then
        OffSetRect(TextRect, ArrowRect.Right, 0);
      DrawFrameControl(Canvas.Handle, ArrowRect, DFC_SCROLL,
        DFCS_SCROLLLEFT or DFCS_FLAT);
    end;
    StepHeight := DrawText(Canvas.Handle, PChar(FPreviousStepText), -1, TextRect,
      DT_LEFT or DT_SINGLELINE or DT_END_ELLIPSIS or DT_VCENTER);
    OffsetRect(TextRect, 0, StepHeight);
    DrawText(Canvas.Handle, PChar(APage.Caption), -1, TextRect,
      DT_LEFT or DT_SINGLELINE or DT_END_ELLIPSIS or DT_VCENTER);
  end;

  { do the next step}

  // YW - Ignore all disabled pages at run time
  APage := Wizard.FindNextPage(PageIndex, 1, not (csDesigning in ComponentState));
  if Assigned(APage) then
  begin
    TextRect := GetNextStepRect;
    ArrowRect := GetNextArrowRect;
    Canvas.Font.Style := [];
    if ShowNavigators then
    begin
      OffsetRect(TextRect, ArrowRect.Right, 0);
      DrawFrameControl(Canvas.Handle, ArrowRect, DFC_SCROLL,
        DFCS_SCROLLRIGHT or DFCS_FLAT);
    end;
    StepHeight := DrawText(Canvas.Handle, PChar(FNextStepText), -1, TextRect,
      DT_LEFT or DT_SINGLELINE or DT_END_ELLIPSIS or DT_VCENTER);
    OffsetRect(TextRect, 0, StepHeight);
    DrawText(Canvas.Handle, PChar(APage.Caption), -1, TextRect,
      DT_LEFT or DT_SINGLELINE or DT_END_ELLIPSIS or DT_VCENTER);
  end;
end;

procedure TKWizardRouteMapSteps.SetShowDivider(const Value: Boolean);
begin
  if FShowDivider <> Value then
  begin
    FShowDivider := Value;
    Invalidate;
  end;
end;

procedure TKWizardRouteMapSteps.SetIndent(const Value: Integer);
begin
  if FIndent <> Value then
  begin
    FIndent := Value;
    Invalidate;
  end;
end;

procedure TKWizardRouteMapSteps.SetNextStepText(const Value: string);
begin
  if FNextStepText <> Value then
  begin
    FNextStepText := Value;
    Invalidate;
  end;
end;

procedure TKWizardRouteMapSteps.SetPreviousStepText(const Value: string);
begin
  if FPreviousStepText <> Value then
  begin
    FPreviousStepText := Value;
    Invalidate;
  end;
end;

procedure TKWizardRouteMapSteps.SetShowNavigators(const Value: Boolean);
begin
  if FShowNavigators <> Value then
  begin
    FShowNavigators := Value;
    Invalidate;
  end;
end;

end.
