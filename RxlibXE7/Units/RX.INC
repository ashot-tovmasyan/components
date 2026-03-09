{*******************************************************}
{                                                       }
{         RX Library include file                       }
{         Copyright (c) 1996 AO ROSNO                   }
{         Copyright (c) 1997, 1998 Master-Bank          }
{                                                       }
{*******************************************************}

{ RX.INC is included in all RX Library units so you can specify
  global compiler options here. RX.INC is included before each units'
  required compiler options and the options specified here can be
  overridden by hardcode options in the source files }

{ Conditional defines that affect compilation }

{$DEFINE DCS}
{ Client/Server or Enterprise version. Deactivate this define if you
  have Delphi Desktop, Standard or Professional Edition }

{.$DEFINE RX_MIDAS}
{ RX MIDAS components } 

{.$DEFINE RX_ADO}
{ RX ADO components } 

{$DEFINE USE_RX_GIF}
{ This define enables GIF image support. Deactivate this define
  if you are using another GIF image support library. See README.TXT
  for the legal aspects }

{$IFDEF WIN32}
{.$DEFINE USE_PROGRESSBAR}
{ Activate this define if you do not want to use TGauge Borland sample
  component in TDBProgress component and FileUtil routines. In this case
  TProgressBar component will be used }
{$ENDIF}

{$DEFINE USE_FOUR_DIGIT_YEAR}
{ This define controls whether FourDigitYear variable is used to control
  date format in TDateEdit, TDBDateEdit components. When this define is not
  active the ShortDateFormat variable is used instead }

{.$DEFINE USE_OLD_DBLISTS}
{ Activate this define to install old BDE lists components for backward
  compatibility with oldest RX versions }

{$DEFINE DEFAULT_POPUP_CALENDAR}
{ This define controls whether a popup calendar is used as default
  instead of a modal dialog in TDateEdit, TDBDateEdit components }

{.DEFINE USE_FORMATSETTINGS}
{ This define controls using of the FormatSetting global variable instead of
  separate format variables. Starting from XE3 it is required }

{ ------------ !! DO NOT CHANGE DEFINES BELOW THIS LINE !! ------------ }

{$B-} {- Complete Boolean Evaluation }
{$R-} {- Range-Checking }
{$V-} {- Var-String Checking }
{$T-} {- Typed @ operator }
{$X+} {- Extended syntax }
{$P+} {- Open string params }
{$IFDEF WIN32}
{$J+} {- Writeable structured consts }
{$H+} {- Use long strings by default }
{$ENDIF}

{$IFDEF VER93}  { Borland C++Builder 1.0 }
  {$DEFINE CBUILDER}
{$ENDIF}

{$IFDEF VER100} { Borland Delphi 3.0 }
  {$DEFINE RX_D3}
{$ENDIF}

{$IFDEF VER110} { Borland C++Builder 3.0 }
  {$DEFINE CBUILDER}
  {$ObjExportAll On}
  {$UNDEF DCS}
{$ENDIF}

{$IFDEF VER120} { Borland Delphi 4.0 }
  {$DEFINE RX_D3}
  {$DEFINE RX_D4}
{$ENDIF}

{$IFDEF VER125} { Borland C++Builder 4.0 }
  {$DEFINE CBUILDER}
  {$ObjExportAll On}
  {$UNDEF DCS}
{$ENDIF}

{$IFDEF VER130} { Borland Delphi 5.0 }
  {$IFDEF BCB}
    {$DEFINE CBUILDER}
    {$ObjExportAll On}
    {$UNDEF DCS}
  {$ELSE}
    {$DEFINE RX_D3}
    {$DEFINE RX_D4}
    {$DEFINE RX_D5}
  {$ENDIF}
{$ENDIF}

{$IFDEF VER140} { Borland Delphi 6.0 }
  {$IFDEF BCB}
    {$DEFINE CBUILDER}
    {$ObjExportAll On}
    {$UNDEF DCS}
  {$ELSE}
    {$DEFINE RX_D3}
    {$DEFINE RX_D4}
    {$DEFINE RX_D5}
    {$DEFINE RX_D6}
  {$ENDIF}
{$ENDIF}

{$IFDEF VER150} { Borland Delphi 7.0 }
  {$IFDEF BCB}
    {$DEFINE CBUILDER}
    {$ObjExportAll On}
    {$UNDEF DCS}
  {$ELSE}
    {$DEFINE RX_D3}
    {$DEFINE RX_D4}
    {$DEFINE RX_D5}
    {$DEFINE RX_D6}
    {$DEFINE RX_D7}
  {$ENDIF}
{$ENDIF}

{$IFDEF VER160} { Borland Delphi 8.0 }

  Version not supported

{$ENDIF}

{$IFDEF VER170} { Borland Delphi 9.0 (Studio 2005) }
  {$IFDEF BCB}
    {$DEFINE CBUILDER}
    {$ObjExportAll On}
    {$UNDEF DCS}
  {$ELSE}
    {$DEFINE RX_D3}
    {$DEFINE RX_D4}
    {$DEFINE RX_D5}
    {$DEFINE RX_D6}
    {$DEFINE RX_D7}
    {$DEFINE RX_D9}
  {$ENDIF}
{$ENDIF}

{$IFDEF VER180} { Borland Delphi 10.0 (Studio 2006) }
  {$IFDEF BCB}
    {$DEFINE CBUILDER}
    {$ObjExportAll On}
    {$UNDEF DCS}
  {$ENDIF}
  {$DEFINE RX_D3}
  {$DEFINE RX_D4}
  {$DEFINE RX_D5}
  {$DEFINE RX_D6}
  {$DEFINE RX_D7}
  {$DEFINE RX_D9}
  {$DEFINE RX_D10}
  {$DEFINE RX_D2006}
{$ENDIF}

{$IFDEF VER200} { Borland Delphi 12.0 (Studio 2009) }
  {$IFDEF BCB}
    {$DEFINE CBUILDER}
    {$ObjExportAll On}
    {$UNDEF DCS}
  {$ENDIF}
  {$DEFINE RX_D3}
  {$DEFINE RX_D4}
  {$DEFINE RX_D5}
  {$DEFINE RX_D6}
  {$DEFINE RX_D7}
  {$DEFINE RX_D9}
  {$DEFINE RX_D10}
  {$DEFINE RX_D2006}
  {$DEFINE RX_D12}
  {$DEFINE RX_D2009}
  {$IFDEF UNICODE}
    {$DEFINE RX_UNICODE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VER210} { Borland Delphi 14.0 (Studio 2010) }
  {$IFDEF BCB}
    {$DEFINE CBUILDER}
    {$ObjExportAll On}
    {$UNDEF DCS}
  {$ENDIF}
  {$DEFINE RX_D3}
  {$DEFINE RX_D4}
  {$DEFINE RX_D5}
  {$DEFINE RX_D6}
  {$DEFINE RX_D7}
  {$DEFINE RX_D9}
  {$DEFINE RX_D10}
  {$DEFINE RX_D2006}
  {$DEFINE RX_D12}
  {$DEFINE RX_D2009}
  {$DEFINE RX_D14}
  {$DEFINE RX_D2010}
  {$IFDEF UNICODE}
    {$DEFINE RX_UNICODE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VER220} { Borland Delphi 15.0 (Studio XE) }
  {$IFDEF BCB}
    {$DEFINE CBUILDER}
    {$ObjExportAll On}
    {$UNDEF DCS}
  {$ENDIF}
  {$DEFINE RX_D3}
  {$DEFINE RX_D4}
  {$DEFINE RX_D5}
  {$DEFINE RX_D6}
  {$DEFINE RX_D7}
  {$DEFINE RX_D9}
  {$DEFINE RX_D10}
  {$DEFINE RX_D2006}
  {$DEFINE RX_D12}
  {$DEFINE RX_D2009}
  {$DEFINE RX_D14}
  {$DEFINE RX_D2010}
  {$DEFINE RX_DXE}
  {$IFDEF UNICODE}
    {$DEFINE RX_UNICODE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VER230} { Borland Delphi 16.0 (Studio XE 2) }
  {$IFDEF BCB}
    {$DEFINE CBUILDER}
    {$ObjExportAll On}
    {$UNDEF DCS}
  {$ENDIF}
  {$DEFINE RX_D3}
  {$DEFINE RX_D4}
  {$DEFINE RX_D5}
  {$DEFINE RX_D6}
  {$DEFINE RX_D7}
  {$DEFINE RX_D9}
  {$DEFINE RX_D10}
  {$DEFINE RX_D2006}
  {$DEFINE RX_D12}
  {$DEFINE RX_D2009}
  {$DEFINE RX_D14}
  {$DEFINE RX_D2010}
  {$DEFINE RX_D15}
  {$DEFINE RX_DXE}
  {$DEFINE RX_D16}
  {$DEFINE RX_DXE2}
  {$IFDEF UNICODE}
    {$DEFINE RX_UNICODE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VER240} { Borland Delphi 17.0 (Studio XE 3) }
  {$IFDEF BCB}
    {$DEFINE CBUILDER}
    {$ObjExportAll On}
    {$UNDEF DCS}
  {$ENDIF}
  {$DEFINE RX_D3}
  {$DEFINE RX_D4}
  {$DEFINE RX_D5}
  {$DEFINE RX_D6}
  {$DEFINE RX_D7}
  {$DEFINE RX_D9}
  {$DEFINE RX_D10}
  {$DEFINE RX_D2006}
  {$DEFINE RX_D12}
  {$DEFINE RX_D2009}
  {$DEFINE RX_D14}
  {$DEFINE RX_D2010}
  {$DEFINE RX_D15}
  {$DEFINE RX_DXE}
  {$DEFINE RX_D16}
  {$DEFINE RX_DXE2}
  {$DEFINE RX_D17}
  {$DEFINE RX_DXE3}
  {$IFDEF UNICODE}
    {$DEFINE RX_UNICODE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VER250} { Borland Delphi 18.0 (Studio XE 4) }
  {$IFDEF BCB}
    {$DEFINE CBUILDER}
    {$ObjExportAll On}
    {$UNDEF DCS}
  {$ENDIF}
  {$DEFINE RX_D3}
  {$DEFINE RX_D4}
  {$DEFINE RX_D5}
  {$DEFINE RX_D6}
  {$DEFINE RX_D7}
  {$DEFINE RX_D9}
  {$DEFINE RX_D10}
  {$DEFINE RX_D2006}
  {$DEFINE RX_D12}
  {$DEFINE RX_D2009}
  {$DEFINE RX_D14}
  {$DEFINE RX_D2010}
  {$DEFINE RX_D15}
  {$DEFINE RX_DXE}
  {$DEFINE RX_D16}
  {$DEFINE RX_DXE2}
  {$DEFINE RX_D17}
  {$DEFINE RX_DXE3}
  {$DEFINE RX_D18}
  {$DEFINE RX_DXE4}
  {$IFDEF UNICODE}
    {$DEFINE RX_UNICODE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VER260} { Borland Delphi 19.0 (Studio XE 5) }
  {$IFDEF BCB}
    {$DEFINE CBUILDER}
    {$ObjExportAll On}
    {$UNDEF DCS}
  {$ENDIF}
  {$DEFINE RX_D3}
  {$DEFINE RX_D4}
  {$DEFINE RX_D5}
  {$DEFINE RX_D6}
  {$DEFINE RX_D7}
  {$DEFINE RX_D9}
  {$DEFINE RX_D10}
  {$DEFINE RX_D2006}
  {$DEFINE RX_D12}
  {$DEFINE RX_D2009}
  {$DEFINE RX_D14}
  {$DEFINE RX_D2010}
  {$DEFINE RX_D15}
  {$DEFINE RX_DXE}
  {$DEFINE RX_D16}
  {$DEFINE RX_DXE2}
  {$DEFINE RX_D17}
  {$DEFINE RX_DXE3}
  {$DEFINE RX_D18}
  {$DEFINE RX_DXE4}
  {$DEFINE RX_D19}
  {$DEFINE RX_DXE5}
  {$IFDEF UNICODE}
    {$DEFINE RX_UNICODE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VER270} { Borland Delphi 20.0 (Studio XE 6) }
  {$IFDEF BCB}
    {$DEFINE CBUILDER}
    {$ObjExportAll On}
    {$UNDEF DCS}
  {$ENDIF}
  {$DEFINE RX_D3}
  {$DEFINE RX_D4}
  {$DEFINE RX_D5}
  {$DEFINE RX_D6}
  {$DEFINE RX_D7}
  {$DEFINE RX_D9}
  {$DEFINE RX_D10}
  {$DEFINE RX_D2006}
  {$DEFINE RX_D12}
  {$DEFINE RX_D2009}
  {$DEFINE RX_D14}
  {$DEFINE RX_D2010}
  {$DEFINE RX_D15}
  {$DEFINE RX_DXE}
  {$DEFINE RX_D16}
  {$DEFINE RX_DXE2}
  {$DEFINE RX_D17}
  {$DEFINE RX_DXE3}
  {$DEFINE RX_D18}
  {$DEFINE RX_DXE4}
  {$DEFINE RX_D19}
  {$DEFINE RX_DXE5}
  {$DEFINE RX_D20}
  {$DEFINE RX_DXE6}
  {$IFDEF UNICODE}
    {$DEFINE RX_UNICODE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VER280} { Borland Delphi 21.0 (Studio XE 7) }
  {$IFDEF BCB}
    {$DEFINE CBUILDER}
    {$ObjExportAll On}
    {$UNDEF DCS}
  {$ENDIF}
  {$DEFINE RX_D3}
  {$DEFINE RX_D4}
  {$DEFINE RX_D5}
  {$DEFINE RX_D6}
  {$DEFINE RX_D7}
  {$DEFINE RX_D9}
  {$DEFINE RX_D10}
  {$DEFINE RX_D2006}
  {$DEFINE RX_D12}
  {$DEFINE RX_D2009}
  {$DEFINE RX_D14}
  {$DEFINE RX_D2010}
  {$DEFINE RX_D15}
  {$DEFINE RX_DXE}
  {$DEFINE RX_D16}
  {$DEFINE RX_DXE2}
  {$DEFINE RX_D17}
  {$DEFINE RX_DXE3}
  {$DEFINE RX_D18}
  {$DEFINE RX_DXE4}
  {$DEFINE RX_D19}
  {$DEFINE RX_DXE5}
  {$DEFINE RX_D20}
  {$DEFINE RX_DXE6}
  {$DEFINE RX_D21}
  {$DEFINE RX_DXE7}
  {$IFDEF UNICODE}
    {$DEFINE RX_UNICODE}
  {$ENDIF}
{$ENDIF}

{$IFNDEF VER80}                   { Delphi 1.0     }
 {$IFNDEF VER90}                  { Delphi 2.0     }
  {$IFNDEF VER93}                 { C++Builder 1.0 }
    {$DEFINE RX_D3}               { Delphi 3.0 or higher }
    {$IFNDEF VER100}
      {$DEFINE RX_V110}           { C++Builder 3.0 or higher }
      {$IFNDEF VER110}
        {$DEFINE RX_D4}           { Delphi 4.0 or higher }
        {$IFNDEF VER120}
          {$DEFINE RX_V125}       { C++Builder 4.0 or higher }
          {$IFNDEF VER125}
            {$DEFINE RX_D5}       { Delphi 5.0 or higher }
            {$IFNDEF VER130}
               {$DEFINE RX_D6}    { Delphi 6.0 or higher }
               {$IFNDEF VER140}
                  {$DEFINE RX_D7} { Delphi 7.0 or higher }
               {$ENDIF}
            {$ENDIF}
          {$ENDIF}
        {$ENDIF}
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
 {$ENDIF}
{$ENDIF}

{$IFDEF CBUILDER}
  {$DEFINE USE_PROGRESSBAR}
  {$UNDEF USE_OLD_DBLISTS}
  {$IFNDEF VER93}
    {$DEFINE RX_V110}    { C++Builder 3.0 or higher }
    {$IFNDEF VER110}
      {$DEFINE RX_V125}  { C++Builder 4.0 or higher }
    {$ENDIF}
  {$ENDIF}
{$ENDIF}

{$IFNDEF RX_D3}
  {$DEFINE DCS}
  {$UNDEF RX_MIDAS}
{$ENDIF}

{$IFNDEF RX_D5}
  {$UNDEF RX_ADO}
{$ENDIF}

{$IFNDEF DCS}
  {$UNDEF RX_MIDAS}
  {$UNDEF RX_ADO}
{$ENDIF}

{$IFDEF RX_D6}
  {$WARN SYMBOL_DEPRECATED OFF}
  {$WARN SYMBOL_PLATFORM OFF}
  {$WARN UNIT_DEPRECATED OFF}
  {$WARN UNIT_PLATFORM OFF}
{$ENDIF}

{$IFDEF RX_D7}
  {$WARN UNSAFE_TYPE OFF}
  {$WARN UNSAFE_CODE OFF}
  {$WARN UNSAFE_CAST OFF}
{$ENDIF}

{$IFDEF RX_D17}
  {$DEFINE USE_FORMATSETTINGS}
{$ENDIF}
