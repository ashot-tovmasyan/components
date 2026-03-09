{*******************************************************}
{                                                       }
{         Delphi VCL Extensions (RX)                    }
{                                                       }
{         Copyright (c) 1995, 1996 AO ROSNO             }
{         Copyright (c) 1997, 1998 Master-Bank          }
{                                                       }
{*******************************************************}

unit RXConst;

interface

{$I RX.INC}

uses Controls;

const
  RX_VERSION = $0002004B;  { 2.75 }

const
{ Command message for Speedbar editor }
  CM_SPEEDBARCHANGED = CM_BASE + 80;
{ Command message for TRxSpeedButton }
  CM_RXBUTTONPRESSED = CM_BASE + 81;
{ Command messages for TRxWindowHook }
  CM_RECREATEWINDOW  = CM_BASE + 82;
  CM_DESTROYHOOK     = CM_BASE + 83;
{ Notify message for TRxTrayIcon }
  CM_TRAYICON        = CM_BASE + 84;

const
  crHand     = TCursor(14000);
  crDragHand = TCursor(14001);

const
{ TBitmap.GetTransparentColor from GRAPHICS.PAS use this value }
  PaletteMask = $02000000;

{$IFDEF VER90}
const
  SDelphiKey = 'Software\Borland\Delphi\2.0';
{$ENDIF}

{$IFDEF VER93}
const
  SDelphiKey = 'Software\Borland\C++Builder\1.0';
{$ENDIF}

{$IFDEF VER100}
const
  SDelphiKey = 'Software\Borland\Delphi\3.0';
{$ENDIF}

{$IFDEF VER110}
const
  SDelphiKey = 'Software\Borland\C++Builder\3.0';
{$ENDIF}

{$IFDEF VER120}
const
  SDelphiKey = 'Software\Borland\Delphi\4.0';
{$ENDIF}

{$IFDEF VER125}
const
  SDelphiKey = 'Software\Borland\C++Builder\4.0';
{$ENDIF}

{$IFDEF VER130}
const
 {$IFDEF BCB}
   SDelphiKey = 'Software\Borland\C++Builder\5.0';
 {$ELSE}
   SDelphiKey = 'Software\Borland\Delphi\5.0';
 {$ENDIF}
{$ENDIF}

{$IFDEF VER140}
const
 {$IFDEF BCB}
   SDelphiKey = 'Software\Borland\C++Builder\6.0';
 {$ELSE}
   SDelphiKey = 'Software\Borland\Delphi\6.0';
 {$ENDIF}
{$ENDIF}

{$IFDEF VER150}
const
 {$IFDEF BCB}
   SDelphiKey = 'Software\Borland\C++Builder\7.0';
 {$ELSE}
   SDelphiKey = 'Software\Borland\Delphi\7.0';
 {$ENDIF}
{$ENDIF}

{$IFDEF VER170}
const
   SDelphiKey = 'Software\Borland\BDS\3.0';
{$ENDIF}

{$IFDEF VER180}
const
   SDelphiKey = 'Software\Borland\BDS\4.0';
{$ENDIF}

{$IFDEF VER200}
const
  SDelphiKey = 'Software\CodeGear\BDS\6.0';
{$ENDIF}

{$IFDEF VER210}
const
  SDelphiKey = 'Software\CodeGear\BDS\7.0';
{$ENDIF}

{$IFDEF VER220}
const
  SDelphiKey = 'Software\Embarcadero\BDS\8.0';
{$ENDIF}

{$IFDEF VER230}
const
  SDelphiKey = 'Software\Embarcadero\BDS\9.0';
{$ENDIF}

{$IFDEF VER240}
const
  SDelphiKey = 'Software\Embarcadero\BDS\10.0';
{$ENDIF}

{$IFDEF VER250}
const
  SDelphiKey = 'Software\Embarcadero\BDS\11.0';
{$ENDIF}

{$IFDEF VER260}
const
  SDelphiKey = 'Software\Embarcadero\BDS\12.0';
{$ENDIF}

{$IFDEF VER270}
const
  SDelphiKey = 'Software\Embarcadero\BDS\14.0';
{$ENDIF}

{$IFDEF VER280}
const
  SDelphiKey = 'Software\Embarcadero\BDS\15.0';
{$ENDIF}

implementation

uses {$IFDEF WIN32} Windows, {$ELSE} WinProcs, {$ENDIF} Forms;

{$IFDEF WIN32}
 {$R *.R32}
{$ELSE}
 {$R *.R16}
{$ENDIF}

initialization
  Screen.Cursors[crHand] := LoadCursor(hInstance, 'RX_HANDCUR');
  Screen.Cursors[crDragHand] := LoadCursor(hInstance, 'RX_DRAGCUR');
end.
