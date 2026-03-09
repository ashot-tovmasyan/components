object Form1: TForm1
  Left = 360
  Top = 144
  Width = 198
  Height = 238
  BorderIcons = [biSystemMenu]
  Caption = 'Calculator'
  Color = clMenu
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 0
    Top = 0
    Width = 116
    Height = 21
    Ctl3D = True
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 0
  end
  object Dig7: TButton
    Left = 0
    Top = 32
    Width = 31
    Height = 20
    Cancel = True
    Caption = '7'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Dig7Click
  end
  object Dig8: TButton
    Left = 40
    Top = 32
    Width = 31
    Height = 20
    Caption = '8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Dig8Click
  end
  object Dig9: TButton
    Left = 80
    Top = 32
    Width = 31
    Height = 20
    Caption = '9'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Dig9Click
  end
  object SlashButton: TButton
    Left = 120
    Top = 32
    Width = 31
    Height = 20
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = SlashButtonClick
  end
  object Dig4: TButton
    Left = 0
    Top = 64
    Width = 31
    Height = 20
    Cancel = True
    Caption = '4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = Dig4Click
  end
  object Dig5: TButton
    Left = 40
    Top = 64
    Width = 31
    Height = 20
    Caption = '5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = Dig5Click
  end
  object Dig6: TButton
    Left = 80
    Top = 64
    Width = 31
    Height = 20
    Caption = '6'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = Dig6Click
  end
  object StarButton: TButton
    Left = 120
    Top = 64
    Width = 31
    Height = 20
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = StarButtonClick
  end
  object Dig1: TButton
    Left = 0
    Top = 96
    Width = 31
    Height = 20
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = Dig1Click
  end
  object Dig2: TButton
    Left = 40
    Top = 96
    Width = 31
    Height = 20
    Caption = '2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = Dig2Click
  end
  object Dig3: TButton
    Left = 80
    Top = 96
    Width = 31
    Height = 20
    Caption = '3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = Dig3Click
  end
  object MinusButton: TButton
    Left = 120
    Top = 96
    Width = 31
    Height = 20
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    OnClick = MinusButtonClick
  end
  object Dig0: TButton
    Left = 0
    Top = 128
    Width = 31
    Height = 20
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    OnClick = Dig0Click
  end
  object DigPlusMinus: TButton
    Left = 40
    Top = 128
    Width = 31
    Height = 20
    Caption = '+/-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    OnClick = DigPlusMinusClick
  end
  object DelimButton: TButton
    Left = 80
    Top = 128
    Width = 31
    Height = 20
    Caption = ','
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
    OnClick = DelimButtonClick
  end
  object PlusButton: TButton
    Left = 120
    Top = 128
    Width = 31
    Height = 20
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
    OnClick = PlusButtonClick
  end
  object ClearButton: TButton
    Left = 120
    Top = 0
    Width = 31
    Height = 20
    Caption = 'C'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 17
    OnClick = ClearButtonClick
  end
  object EnterButton: TButton
    Left = 32
    Top = 160
    Width = 89
    Height = 21
    Caption = '='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 18
    OnClick = EnterButtonClick
  end
end
