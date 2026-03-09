{*****************************************************************************
Copyright:    Copywrite © by Steve Forbes, 2001 - 2002
Unit Name:    RouteMapNodes
Author:       Steve Forbes
Email:        ozmosys@mira.net
Date:         February 05, 2002
Last Updated: February 12, 2002 by Yu Wei
Time:         17:00:00
Purpose:      Nodes style route map for TKWizardRouteMap
History:
---------------------------------------------------------------------------
Date(mm/dd/yy)   Comments
---------------------------------------------------------------------------
05/02/2002       Initial create
******************************************************************************}

unit RouteMapNodes;

interface

uses
  Windows, Classes, Messages, Graphics, StdCtrls, KWizard;

type
  TKWizardRouteMapNodes = class;

  TWizardRouteMapNodeColors = class(TPersistent)
  private
    FSelected: TColor;
    FUnselected: TColor;
    FDisabled: TColor;
    FLine: TColor;
    FRouteMap: TKWizardRouteMapNodes;
  protected
    procedure SetLine(Value: TColor);
    procedure SetSelected(Value: TColor);
    procedure SetUnselected(Value: TColor);
    procedure SetDisabled(Value: TColor);
    procedure DoChange;
  public
    constructor Create(ARouteMap: TKWizardRouteMapNodes);
  published
    property Selected: TColor read FSelected write SetSelected;
    property Unselected: TColor read FUnselected write SetUnselected;
    property Line: TColor read FLine write SetLine;
    property Disabled: TColor read FDisabled write SetDisabled;
  end;

  TKWizardRouteMapNodes = class(TKWizardRouteMapControl)
  private
    FItemHeight: Integer;
    FUsePageTitle: Boolean;
    FNodeColors: TWizardRouteMapNodeColors;
    FIndent: Integer;
    procedure SetItemHeight(Value: Integer);
    procedure SetUsePageTitle(Value: Boolean);
    procedure SetIndent(Value: Integer);
  protected
    function PageAtPos(Pt: TPoint): TKWizardCustomPage; override;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property ItemHeight: Integer read FItemHeight write SetItemHeight;
    property Align;
    property Color;
    property Font;
    property Indent: Integer read FIndent write SetIndent;
    property NodeColors: TWizardRouteMapNodeColors
      read FNodeColors write FNodeColors;
    property UsePageTitle: Boolean read FUsePageTitle write SetUsePageTitle;
    property OnDisplaying;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('K Wizard', [TKWizardRouteMapNodes]);
end;

{ TWizardRouteMapNodeColors }

constructor TWizardRouteMapNodeColors.Create(ARouteMap: TKWizardRouteMapNodes);
begin
  FRouteMap := ARouteMap;
  FSelected := clLime;
  FUnselected := clWhite;
  FDisabled := clBtnFace;
  FLine := clBtnShadow;
end;

procedure TWizardRouteMapNodeColors.DoChange;
begin
  if Assigned(FRouteMap) then
  begin
    FRouteMap.Invalidate;
  end;
end;

procedure TWizardRouteMapNodeColors.SetDisabled(Value: TColor);
begin
  if FDisabled <> Value then
  begin
    FDisabled := Value;
    DoChange;
  end;
end;

procedure TWizardRouteMapNodeColors.SetLine(Value: TColor);
begin
  if FLine <> Value then
  begin
    FLine := Value;
    DoChange;
  end;
end;

procedure TWizardRouteMapNodeColors.SetSelected(Value: TColor);
begin
  if FSelected <> Value then
  begin
    FSelected := Value;
    DoChange;
  end;
end;

procedure TWizardRouteMapNodeColors.SetUnselected(Value: TColor);
begin
  if FUnselected <> Value then
  begin
    FUnselected := Value;
    DoChange;
  end;
end;

{ TKWizardRouteMapNodes }

constructor TKWizardRouteMapNodes.Create(AOwner: TComponent);
begin
  inherited;
  FItemHeight := 20;
  Color := clBackground;
  Font.Color := clWhite;
  FUsePageTitle := True;
  FIndent := 8;
  FNodeColors := TWizardRouteMapNodeColors.Create(Self);
end;

destructor TKWizardRouteMapNodes.Destroy;
begin
  FNodeColors.Free;
  inherited;
end;

function TKWizardRouteMapNodes.PageAtPos(Pt: TPoint): TKWizardCustomPage;
var
  i, Count: Integer;
  ARect: TRect;
begin
  ARect := ClientRect;
  InflateRect(ARect, -1, -1);
  if PtInRect(ARect, Pt) then
  begin
    Count := PageCount;
    ARect := Bounds(ARect.Left, ARect.Top + Trunc((FItemHeight - 12) / 2),
               ARect.Right - ARect.Left, FItemHeight);
    i := 0;
    while i < Count do
    begin
      if CanDisplay(Pages[i]) then
      begin
        if PtInRect(ARect, Pt) then
        begin
          Result := Pages[i];
          Exit;
        end;
        OffsetRect(ARect, 0, FItemHeight);
      end;
      Inc(i);
    end;
  end;
  Result := nil;
end;

procedure TKWizardRouteMapNodes.Paint;
var
  ARect, ATextRect, NodeRect: TRect;
  i: Integer;
  AColor: TColor;
  AFont: TFont;
  IsFirstPage, IsLastPage: Boolean;
begin
  ARect := ClientRect;
  with Canvas do
  begin
    Brush.Color := Color;
    Brush.Style := bsSolid;
    Pen.Color := clBtnShadow;
    Pen.Width := 1;
    Pen.Style := psSolid;
    Rectangle(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom);
    InflateRect(ARect, -1, -1);
    AFont := TFont.Create;
    try
      AFont.Assign(Self.Font);
      ARect := Bounds(ARect.Left + FIndent, ARect.Top + FIndent,
        ARect.Right - ARect.Left - FIndent, FItemHeight);
      for i := 0 to PageCount - 1 do
      begin
        IsFirstPage := Wizard.IsFirstPage(Pages[i], not (csDesigning in ComponentState));
        IsLastPage := Wizard.IsLastPage(Pages[i], not (csDesigning in ComponentState));
        if CanDisplay(Pages[i]) then
        begin
          AColor := Color;
          if i = PageIndex then
          begin
            AFont.Color := Self.Font.Color;
            AFont.Style := AFont.Style + [fsBold]
          end
          else if not Pages[i].Enabled then
          begin
            AFont.Color := clBtnShadow;
            AFont.Style := AFont.Style - [fsBold];
          end
          else
          begin
            AFont.Color := Self.Font.Color;
            AFont.Style := AFont.Style - [fsBold]
          end;

          ATextRect := ARect;
          if not (IsFirstPage or IsLastPage) then
          begin
            ATextRect.Left := ATextRect.Left + 18;
          end;

          NodeRect := ATextRect;
          NodeRect.Right := NodeRect.Left + 12;
          NodeRect.Top := NodeRect.Top + Trunc((FItemHeight - 12) / 2);
          NodeRect.Bottom := NodeRect.Top + 12;

          if not (IsFirstPage or IsLastPage) then
            ATextRect.Left := ATextRect.Left + 20
          else
            ATextRect.Left := ATextRect.Left + 18 + 20;

          try
            Pen.Color := FNodeColors.Line;
            if i = PageIndex then
              Brush.Color := FNodeColors.Selected
            else if Pages[i].Enabled then
              Brush.Color := FNodeColors.Unselected
            else
              Brush.Color := FNodeColors.Disabled;
            Rectangle(NodeRect.Left, NodeRect.Top, NodeRect.Right,
              NodeRect.Bottom);

            Brush.Color := FNodeColors.Line;
            if IsFirstPage or IsLastPage then
            begin
              MoveTo(NodeRect.Right, NodeRect.Top + 5);
              LineTo(NodeRect.Right + 13, NodeRect.Top + 5);
              MoveTo(NodeRect.Right, NodeRect.Top + 6);
              LineTo(NodeRect.Right + 13, NodeRect.Top + 6);
              if IsFirstPage then
              begin
                MoveTo(NodeRect.Right + 11, NodeRect.Top + 6);
                LineTo(NodeRect.Right + 11, ATextRect.Bottom);
                MoveTo(NodeRect.Right + 12, NodeRect.Top + 6);
                LineTo(NodeRect.Right + 12, ATextRect.Bottom);
              end
              else
              begin
                MoveTo(NodeRect.Right + 11, NodeRect.Top + 5);
                LineTo(NodeRect.Right + 11, ATextRect.Top);
                MoveTo(NodeRect.Right + 12, NodeRect.Top + 5);
                LineTo(NodeRect.Right + 12, ATextRect.Top);
              end;
            end
            else
            begin
              MoveTo(NodeRect.Left + 5, NodeRect.Top);
              LineTo(NodeRect.Left + 5, ATextRect.Top - 1);
              MoveTo(NodeRect.Left + 6, NodeRect.Top);
              LineTo(NodeRect.Left + 6, ATextRect.Top - 1);
              MoveTo(NodeRect.Left + 5, NodeRect.Bottom);
              LineTo(NodeRect.Left + 5, ATextRect.Bottom + 1);
              MoveTo(NodeRect.Left + 6, NodeRect.Bottom);
              LineTo(NodeRect.Left + 6, ATextRect.Bottom + 1);
            end;

            Brush.Color := AColor;
            FillRect(ATextRect);
            Brush.Style := bsClear;
            Font.Assign(AFont);

            if FUsePageTitle then
              DrawText(Canvas.Handle,
                PChar((Pages[i] as TKWizardCustomPage).Header.Title.Text), -1,
                ATextRect, DT_LEFT or DT_SINGLELINE or DT_VCENTER)
            else
              DrawText(Canvas.Handle, PChar(Pages[i].Caption), -1, ATextRect,
                DT_LEFT or DT_SINGLELINE or DT_VCENTER);
          finally
            OffsetRect(ARect, 0, FItemHeight);
          end;
        end;
      end;
    finally
        AFont.Free;
    end;
  end;
end;

procedure TKWizardRouteMapNodes.SetItemHeight(Value: Integer);
begin
  if FItemHeight <> Value then
  begin
    FItemHeight := Value;
    Invalidate;
  end;
end;

procedure TKWizardRouteMapNodes.SetUsePageTitle(Value: Boolean);
begin
  if FUsePageTitle <> Value then
  begin
    FUsePageTitle := Value;
    Invalidate;
  end;
end;

procedure TKWizardRouteMapNodes.SetIndent(Value: Integer);
begin
  if FIndent <> Value then
  begin
    FIndent := Value;
    Invalidate;
  end;
end;

end.
