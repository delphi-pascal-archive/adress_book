object AboutBox: TAboutBox
  Left = 200
  Top = 108
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 107
  ClientWidth = 244
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ProductName: TLabel
    Left = 8
    Top = 8
    Width = 60
    Height = 13
    Caption = 'Adress Book'
    IsControl = True
  end
  object Version: TLabel
    Left = 8
    Top = 32
    Width = 62
    Height = 13
    Caption = 'Version: 1.00'
    IsControl = True
  end
  object Copyright: TLabel
    Left = 8
    Top = 56
    Width = 213
    Height = 13
    Caption = 'Copyright by U'#39'djin Corporation (c) 2003-2006'
    IsControl = True
  end
  object OKButton: TButton
    Left = 79
    Top = 76
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = OKButtonClick
  end
end
