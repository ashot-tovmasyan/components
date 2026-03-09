{*****************************************}
{  TeeChart Pro                           }
{  Copyright (c) 1996-2001 David Berneda  }
{                                         }
{  Component Registration Unit            }
{                                         }
{ Funcs:   TCountTeeFunction              }
{          TCurveFittingTeeFunction       }
{          TAverageTeeFunction            }
{          TMovingAverageTeeFunction      }
{          TExpMovAveFunction             }
{          TExpAverageTeeFunction         }
{          TMomentumTeeFunction           }
{          TRSITeeFunction                }
{          TStdDeviationTeeFunction       }
{          TMACDFunction                  }
{          TRootMeanSquareFunction        }
{          TCumulative                    }
{                                         }
{ Series:  TCandleSeries                  }
{          TVolumeSeries                  }
{          TSurfaceSeries                 }
{          TContourSeries                 }
{          TWaterFallSeries               }
{          TErrorBarSeries                }
{          TPolarSeries                   }
{          TBezierSeries                  }
{          TPoint3DSeries                 }
{          TDonutSeries                   }
{          TBoxPlotSeries                 }
{          THistogramSeries               }
{          TSmithSeries                   }
{          TPyramidSeries                 }
{          TMapSeries                     }
{                                         }
{ Tools:   TCursorTool                    }
{          TDragMarksTool                 }
{          TDrawLineTool                  }
{          THintsTool                     }
{          TRotateTool                    }
{          TAxisArrowTool                 }
{          TColorLineTool                 }
{          TColorBandTool                 }
{          TImageTool                     }
{          TPageNumTool                   }
{                                         }
{ Other:   TDraw3D                        }
{          TTeeCommander                  }
{          TChartEditor                   }
{          TChartPreviewer                }
{          TChartScrollBar                }
{          TChartListBox                  }
{          TSeriesDataSet*                }
{          TChartGalleryPanel             }
{          TTeePreviewPanel               }
{          TChartGrid                     }
{          TChartGridNavigator            }
{          TChartPageNavigator            }
{          TChartWebSource                }
{          TSeriesTextSource              }
{                                         }
{ Sample Series:                          }
{          TMyPointSeries                 }
{          TBar3DSeries                   }
{          TBigCandleSeries               }
{          TImagePointSeries              }
{          TDeltaPoint                    }
{          TImageBarSeries                }
{          TWindRoseSeries                }
{          TClockSeries                   }
{          TBarJoinSeries                 }
{          TCalendarSeries                }
{                                         }
{ TeeChart Actions (not in Delphi 3)      }
{          *Many*                         }
{                                         }
{ * TSeriesDataSet not available in       }
{   STANDARD versions of Delphi/CBuilder  }
{                                         }
{*****************************************}
{$I TeeDefs.inc}
unit TeeChartPro;

interface

procedure Register;

implementation

Uses Classes,
     dcdsgnstuff,
     {$IFDEF CLX}
//     DesignIntf, DesignEditors,
     QControls, QGraphics, QDialogs, QActnList, QForms,
     {$ELSE}
      {$IFDEF D6}
//      DesignIntf, DesignEditors,
      {$ELSE}
//      DsgnIntf,
      {$ENDIF}
     Controls, Graphics, Dialogs, {$IFDEF D4}ActnList,{$ENDIF} Forms,
     {$ENDIF}
     CandleCh, CurvFitt, ErrorBar, TeeErrBarEd,
     TeeSurfa, TeeNavigator,
     TeeSurfEdit, TeePolar, TeePolarEditor, TeeCandlEdi, StatChar,
     TeEngine,
     {$IFNDEF CLX}
     {$IFDEF D4}
     {$IFNDEF BCB}
     TeeSeriesDesign,
     {$ENDIF}
     {$ENDIF}
     {$ENDIF}
     Chart,
     TeeProcs, TeeChartReg, TeeEditPro, TeeConst, TeeProCo,
     TeeBezie, TeePoin3, TeCanvas, TeeScroB, TeeEdit, TeeComma, TeeVolEd,
     TeeLisB,
     TeeCount, TeeCumu, TeeDonut, TeeTools, TeeTriSurface, 
     TeeGalleryPanel, TeePrevi, TeePreviewPanel, TeePreviewPanelEditor,
     MyPoint, Bar3D, BigCandl, ImaPoint, ImageBar, TeeImaEd, TeeRose,
     TeeChartGrid, TeeBoxPlot, TeeDraw3D, TeeURL, TeeSeriesTextEd,     
     {$IFDEF D4}
     TeeMapSeries,
     TeeChartActions,
     {$ENDIF}
     TeeSmith, TeeCalendar

     {$IFDEF TEETRANSLATE}
     ,TeeTranslate, 
     TeeSpanish, TeeGerman, TeeDanish, TeeSwedish, TeeDutch, TeeCatalan, 
     TeeChinese, TeeChineseSimp, TeeFrench, TeeBrazil, TeePortuguese,
     TeeRussian, TeeItalian
     {$ENDIF}
     ;

type TChartEditorCompEditor=class(TComponentEditor)
     public
       procedure ExecuteVerb( Index : Integer ); override;
       function GetVerbCount : Integer; override;
       function GetVerb( Index : Integer ) : string; override;
     end;

     TPreviewPanelCompEditor=class(TComponentEditor)
     public
       procedure ExecuteVerb( Index : Integer ); override;
       function GetVerbCount : Integer; override;
       function GetVerb( Index : Integer ) : string; override;
     end;

{ TChartEditorCompEditor }
procedure TChartEditorCompEditor.ExecuteVerb( Index : Integer );
begin
  if Index=0 then TCustomChartEditor(Component).Execute
             else inherited;
end;

function TChartEditorCompEditor.GetVerbCount : Integer;
begin
  Result := inherited GetVerbCount+1;
end;

function TChartEditorCompEditor.GetVerb( Index : Integer ) : string;
begin
  if Index=0 then result:=TeeMsg_Test
             else result:=inherited GetVerb(Index);
end;

{ TPreviewPanelCompEditor }
procedure TPreviewPanelCompEditor.ExecuteVerb( Index : Integer );
begin
  if Index=0 then
  With TFormPreviewPanelEditor.CreatePanel(nil,TTeePreviewPanel(Component)) do
  try
    ShowModal;
  finally
    Free;
  end
  else inherited;
end;

function TPreviewPanelCompEditor.GetVerbCount : Integer;
begin
  Result:=inherited GetVerbCount+1;
end;

function TPreviewPanelCompEditor.GetVerb( Index : Integer ) : string;
begin
  if Index=0 then result:=TeeMsg_Edit
             else result:=inherited GetVerb(Index);
end;

type
  TTeeCustomToolAxisProperty = class(TPropertyEditor)
  public
    function GetAttributes : TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
    function GetValue: string; override;
    procedure SetValue(const Value: string); override;
  end;

{ TTeeCustomToolAxisProperty }
function TTeeCustomToolAxisProperty.GetAttributes: TPropertyAttributes;
begin
  result:=[paValueList,paMultiSelect,paRevertable]
end;

function TTeeCustomToolAxisProperty.GetValue: string;
begin
  With TTeeCustomToolAxis(GetComponent(0)) do
       result:=TCustomChart(ParentChart).AxisTitleOrName(Axis);
end;

procedure TTeeCustomToolAxisProperty.GetValues(Proc: TGetStrProc);
begin
  inherited;
  Proc(TeeMsg_LeftAxis);
  Proc(TeeMsg_RightAxis);
  Proc(TeeMsg_TopAxis);
  Proc(TeeMsg_BottomAxis);
end;

procedure TTeeCustomToolAxisProperty.SetValue(const Value: string);
var tmp : TCustomAxisPanel;
begin
  tmp:=TTeeCustomToolAxis(GetComponent(0)).ParentChart;
  if Value=TeeMsg_LeftAxis then SetOrdValue(Integer(tmp.LeftAxis))
  else
  if Value=TeeMsg_RightAxis then SetOrdValue(Integer(tmp.RightAxis))
  else
  if Value=TeeMsg_TopAxis then SetOrdValue(Integer(tmp.TopAxis))
  else
  if Value=TeeMsg_BottomAxis then SetOrdValue(Integer(tmp.BottomAxis))
end;

type
  TChartWebCompEditor=class(TComponentEditor)
  public
    procedure ExecuteVerb(Index:Integer); override;
    function GetVerb(Index:Integer):string; override;
    function GetVerbCount:Integer; override;
  end;

{ TChartWebCompEditor }
procedure TChartWebCompEditor.ExecuteVerb(Index:Integer);
begin
  if Index=0 then
  begin
    Screen.Cursor:=crHourGlass;
    try
      TChartWebSource(Component).Execute;
    finally
      Screen.Cursor:=crDefault;
    end;
  end
  else inherited;
end;

function TChartWebCompEditor.GetVerbCount:Integer;
begin
  Result:=inherited GetVerbCount+1;
end;

function TChartWebCompEditor.GetVerb(Index:Integer):string;
begin
  if Index=0 then result:=TeeMsg_Load
             else result:=inherited GetVerb(Index);
end;

type
  TSeriesTextCompEditor=class(TComponentEditor)
  public
    procedure ExecuteVerb(Index:Integer); override;
    function GetVerb(Index:Integer):string; override;
    function GetVerbCount:Integer; override;
  end;

{ TSeriesTextCompEditor }
procedure TSeriesTextCompEditor.ExecuteVerb(Index:Integer);
begin
  if Index=0 then
  begin
    TeeEditSeriesTextSource(TSeriesTextSource(Component));
    Designer.Modified;
  end
  else inherited;
end;

function TSeriesTextCompEditor.GetVerbCount:Integer;
begin
  Result:=inherited GetVerbCount+1;
end;

function TSeriesTextCompEditor.GetVerb(Index:Integer):string;
begin
  if Index=0 then result:=TeeMsg_Edit
             else result:=inherited GetVerb(Index);
end;

{$IFDEF TEETRANSLATE}
Procedure TeeSetLanguage(English:Boolean);
begin
  Case TeeLanguageRegistry of
    1: TeeSetBrazil;
    2: TeeSetCatalan;
    3: TeeSetChineseSimp;
    4: TeeSetChinese;
    5: TeeSetDanish;
    6: TeeSetDutch;
    7: TeeSetFrench;
    8: TeeSetGerman;
    9: TeeSetItalian;
   10: TeeSetPortuguese;
   11: TeeSetRussian;
   12: TeeSetSpanish;
   13: TeeSetSwedish;
  else
    if English then TeeSetEnglish;
  end;
end;

Procedure TeeAskLanguageHook;
begin
  if TeeAskLanguage then TeeSetLanguage(True);
end;
{$ENDIF}

procedure Register;
begin
  { Pro Components }
  RegisterComponents(TeeMsg_TeeChartPalette, [ TChartEditor,
                                               TChartPreviewer,
                                               TDraw3D,
                                               TChartScrollBar,
                                               TTeeCommander,
                                               TChartListBox,
                                               TChartEditorPanel,
                                               TChartGalleryPanel,
                                               TTeePreviewPanel,
                                               TChartGrid,
                                               TChartGridNavigator,
                                               TChartPageNavigator,
                                               TChartWebSource,
                                               TSeriesTextSource ]);

  { Pro Editors }
  RegisterComponentEditor(  TChartEditor,TChartEditorCompEditor);
  RegisterComponentEditor(  TChartPreviewer,TChartEditorCompEditor);
  RegisterComponentEditor(  TTeePreviewPanel,TPreviewPanelCompEditor);
  RegisterComponentEditor(  TChartWebSource,TChartWebCompEditor);
  RegisterComponentEditor(  TSeriesTextSource,TSeriesTextCompEditor);
  RegisterPropertyEditor(TypeInfo(TChartAxis), TTeeCustomToolAxis, '',TTeeCustomToolAxisProperty);

  {$IFDEF D4}
  { Chart Actions }
  RegisterActions(TeeMsg_CategoryChartActions,
                  [ TChartAction3D,TChartActionEdit,
                    TChartActionCopy,TChartActionPrint,
                    TChartActionAxes,TChartActionGrid,
                    TChartActionLegend,
                    TChartActionSave ],nil);

  { Series Actions }
  RegisterActions(TeeMsg_CategorySeriesActions,
                  [ TSeriesActionActive,TSeriesActionEdit,
                    TSeriesActionMarks ], nil);
  {$ENDIF}

  {$IFDEF TEETRANSLATE}
  TeeSetLanguage(False);
  {$ENDIF}
end;

initialization
  {$IFNDEF CLX}
  {$IFDEF D4}
  {$IFNDEF BCB}
  TeeChartEditorHook:=TeeShowSeriesEditor;
  {$ENDIF}
  {$ENDIF}
  {$ENDIF}

  {$IFDEF TEETRANSLATE}
  TeeChartLanguageHook:=TeeAskLanguageHook;
  {$ENDIF}

finalization
  TeeChartEditorHook:=nil; { For TeeChartReg "Series..." menu item }
  TeeChartLanguageHook:=nil; { For TeeChartReg "Language..." menu item }
  if TeeLanguage<>TeeEnglishLanguage then { reset language }
     TeeSetEnglish;
end.
