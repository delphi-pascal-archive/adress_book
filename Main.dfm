object MainForm: TMainForm
  Left = 221
  Top = 132
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Adress Book'
  ClientHeight = 587
  ClientWidth = 951
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00CCC0
    000CCCC0000000000CCCC7777CCCCCCC0000CCCC00000000CCCC7777CCCCCCCC
    C0000CCCCCCCCCCCCCC7777CCCCC0CCCCC0000CCCCCCCCCCCC7777CCCCC700CC
    C00CCCC0000000000CCCC77CCC77000C0000CCCC00000000CCCC7777C7770000
    00000CCCC000000CCCC777777777C000C00000CCCC0000CCCC77777C777CCC00
    CC00000CCCCCCCCCC77777CC77CCCCC0CCC000CCCCC00CCCCC777CCC7CCCCCCC
    CCCC0CCCCCCCCCCCCCC7CCCCCCCCCCCC0CCCCCCCCCCCCCCCCCCCCCC7CCC70CCC
    00CCCCCCCC0CC0CCCCCCCC77CC7700CC000CCCCCC000000CCCCCC777CC7700CC
    0000CCCC00000000CCCC7777CC7700CC0000C0CCC000000CCC7C7777CC7700CC
    0000C0CCC000000CCC7C7777CC7700CC0000CCCC00000000CCCC7777CC7700CC
    000CCCCCC000000CCCCCC777CC7700CC00CCCCCCCC0CC0CCCCCCCC77CC770CCC
    0CCCCCCCCCCCCCCCCCCCCCC7CCC7CCCCCCCC0CCCCCCCCCCCCCC7CCCCCCCCCCC0
    CCC000CCCCC00CCCCC777CCC7CCCCC00CC00000CCCCCCCCCC77777CC77CCC000
    C00000CCCC0000CCCC77777C777C000000000CCCC000000CCCC777777777000C
    0000CCCC00000000CCCC7777C77700CCC00CCCC0000000000CCCC77CCC770CCC
    CC0000CCCCCCCCCCCC7777CCCCC7CCCCC0000CCCCCCCCCCCCCC7777CCCCCCCCC
    0000CCCC00000000CCCC7777CCCCCCC0000CCCC0000000000CCCC7777CCC0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 120
  TextHeight = 16
  object AdrSplitter: TSplitter
    Left = 326
    Top = 60
    Width = 4
    Height = 478
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 568
    Width = 951
    Height = 19
    Panels = <
      item
        Text = 'Count in base: 0, count in list: 0'
        Width = 250
      end
      item
        Text = 'Status: '
        Width = 542
      end>
  end
  object SpeedBarBottom: TPanel
    Left = 0
    Top = 538
    Width = 951
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btAdd: TButton
      Left = 8
      Top = 3
      Width = 145
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' (Ctrl+A)'
      TabOrder = 0
      OnClick = btAddClick
    end
    object btModify: TButton
      Left = 160
      Top = 3
      Width = 161
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' (Ctrl+M)'
      TabOrder = 1
      OnClick = btModifyClick
    end
    object btClear: TButton
      Left = 328
      Top = 3
      Width = 169
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' (Ctrl+Del)'
      TabOrder = 2
      OnClick = btClearClick
    end
    object btDelete: TButton
      Left = 502
      Top = 3
      Width = 191
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100' (Shift+Del)'
      TabOrder = 3
      OnClick = btDeleteClick
    end
    object btExit: TButton
      Left = 800
      Top = 3
      Width = 145
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100' (Alt+F4)'
      TabOrder = 4
      OnClick = FileExitClick
    end
  end
  object AdrPanel: TPanel
    Left = 330
    Top = 60
    Width = 621
    Height = 478
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object lbGroup: TLabel
      Left = 329
      Top = 167
      Width = 48
      Height = 16
      Caption = #1043#1088#1091#1087#1087#1072
    end
    object lbBirth: TLabel
      Left = 506
      Top = 167
      Width = 107
      Height = 16
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
    end
    object lbComment: TLabel
      Left = 10
      Top = 325
      Width = 97
      Height = 16
      Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
    end
    object lbMonth: TLabel
      Left = 10
      Top = 453
      Width = 94
      Height = 16
      Caption = #1047#1085#1072#1082' '#1079#1086#1076#1080#1072#1082#1072':'
    end
    object lbYear: TLabel
      Left = 10
      Top = 433
      Width = 205
      Height = 16
      Caption = #1043#1086#1076' '#1087#1086' '#1082#1080#1090#1072#1081#1089#1082#1086#1084#1091' '#1075#1086#1088#1086#1089#1082#1086#1087#1091':'
    end
    object edSurname: TLabeledEdit
      Left = 10
      Top = 30
      Width = 208
      Height = 24
      EditLabel.Width = 66
      EditLabel.Height = 16
      EditLabel.Caption = #1060#1072#1084#1080#1083#1080#1103
      TabOrder = 0
    end
    object edName: TLabeledEdit
      Left = 226
      Top = 30
      Width = 179
      Height = 24
      EditLabel.Width = 29
      EditLabel.Height = 16
      EditLabel.Caption = #1048#1084#1103
      TabOrder = 1
    end
    object edPatrName: TLabeledEdit
      Left = 414
      Top = 30
      Width = 203
      Height = 24
      EditLabel.Width = 67
      EditLabel.Height = 16
      EditLabel.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
      TabOrder = 2
    end
    object edHomeTel: TLabeledEdit
      Left = 10
      Top = 89
      Width = 208
      Height = 24
      EditLabel.Width = 139
      EditLabel.Height = 16
      EditLabel.Caption = #1044#1086#1084#1072#1096#1085#1080#1081' '#1090#1077#1083#1077#1092#1086#1085
      TabOrder = 3
    end
    object edHomeAdr: TLabeledEdit
      Left = 226
      Top = 89
      Width = 391
      Height = 24
      EditLabel.Width = 124
      EditLabel.Height = 16
      EditLabel.Caption = #1044#1086#1084#1072#1096#1085#1080#1081' '#1072#1076#1088#1077#1089#1089
      TabOrder = 4
    end
    object edWorkTel: TLabeledEdit
      Left = 10
      Top = 138
      Width = 208
      Height = 24
      EditLabel.Width = 124
      EditLabel.Height = 16
      EditLabel.Caption = #1056#1072#1073#1086#1095#1080#1081' '#1090#1077#1083#1077#1092#1086#1085
      TabOrder = 5
    end
    object edWorkAdr: TLabeledEdit
      Left = 226
      Top = 138
      Width = 391
      Height = 24
      EditLabel.Width = 109
      EditLabel.Height = 16
      EditLabel.Caption = #1056#1072#1073#1086#1095#1080#1081' '#1072#1076#1088#1077#1089#1089
      TabOrder = 6
    end
    object edMobiTel: TLabeledEdit
      Left = 10
      Top = 187
      Width = 208
      Height = 24
      EditLabel.Width = 144
      EditLabel.Height = 16
      EditLabel.Caption = #1052#1086#1073#1080#1083#1100#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085
      TabOrder = 7
    end
    object edGroup: TComboBox
      Left = 329
      Top = 187
      Width = 168
      Height = 24
      DropDownCount = 9
      ItemHeight = 16
      ItemIndex = 8
      TabOrder = 8
      Text = #1041#1077#1079' '#1075#1088#1091#1087#1087#1099
      Items.Strings = (
        #1043#1088#1091#1087#1087#1072' '#8470'1'
        #1043#1088#1091#1087#1087#1072' '#8470'2'
        #1043#1088#1091#1087#1087#1072' '#8470'3'
        #1043#1088#1091#1087#1087#1072' '#8470'4'
        #1043#1088#1091#1087#1087#1072' '#8470'5'
        #1043#1088#1091#1087#1087#1072' '#8470'6'
        #1055#1077#1088#1089#1086#1085#1072#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
        #1044#1088#1091#1075#1080#1077
        #1041#1077#1079' '#1075#1088#1091#1087#1087#1099)
    end
    object edCity: TLabeledEdit
      Left = 10
      Top = 236
      Width = 208
      Height = 24
      EditLabel.Width = 42
      EditLabel.Height = 16
      EditLabel.Caption = #1043#1086#1088#1086#1076
      TabOrder = 9
    end
    object edCountry: TLabeledEdit
      Left = 10
      Top = 286
      Width = 208
      Height = 24
      EditLabel.Width = 50
      EditLabel.Height = 16
      EditLabel.Caption = #1057#1090#1088#1072#1085#1072
      TabOrder = 10
    end
    object edBirth: TMaskEdit
      Left = 506
      Top = 187
      Width = 111
      Height = 24
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 11
      Text = '01.01.1000'
    end
    object edComment: TMemo
      Left = 10
      Top = 345
      Width = 607
      Height = 80
      TabOrder = 12
    end
    object edEMail: TLabeledEdit
      Left = 226
      Top = 236
      Width = 391
      Height = 24
      EditLabel.Width = 37
      EditLabel.Height = 16
      EditLabel.Caption = 'e-mail'
      TabOrder = 13
    end
    object edICQ: TLabeledEdit
      Left = 226
      Top = 187
      Width = 95
      Height = 24
      EditLabel.Width = 22
      EditLabel.Height = 16
      EditLabel.Caption = 'ICQ'
      TabOrder = 14
      Text = '000-000-000'
    end
    object edWeb: TLabeledEdit
      Left = 226
      Top = 286
      Width = 391
      Height = 24
      EditLabel.Width = 29
      EditLabel.Height = 16
      EditLabel.Caption = 'Web'
      TabOrder = 15
    end
  end
  object AdressList: TListBox
    Left = 0
    Top = 60
    Width = 326
    Height = 478
    Align = alLeft
    ItemHeight = 16
    TabOrder = 3
    OnClick = AdressListClick
  end
  object SpeedBarTopAdr: TPanel
    Left = 0
    Top = 0
    Width = 951
    Height = 60
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object Cancel: TSpeedButton
      Left = 768
      Top = 32
      Width = 89
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
    end
    object OK: TSpeedButton
      Left = 864
      Top = 32
      Width = 81
      Height = 25
      Caption = #1054#1050
      OnClick = OKClick
    end
    object edGroupArr: TComboBox
      Left = 768
      Top = 0
      Width = 177
      Height = 24
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 0
      Text = #1043#1088#1091#1087#1087#1072' '#8470'1'
      Items.Strings = (
        #1043#1088#1091#1087#1087#1072' '#8470'1'
        #1043#1088#1091#1087#1087#1072' '#8470'2'
        #1043#1088#1091#1087#1087#1072' '#8470'3'
        #1043#1088#1091#1087#1087#1072' '#8470'4'
        #1043#1088#1091#1087#1087#1072' '#8470'5'
        #1043#1088#1091#1087#1087#1072' '#8470'6')
    end
    object GroupsBox: TCheckListBox
      Left = 0
      Top = 0
      Width = 758
      Height = 60
      Align = alLeft
      Color = clSkyBlue
      Columns = 3
      HeaderBackgroundColor = clCaptionText
      ItemHeight = 16
      Items.Strings = (
        '0'
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8')
      TabOrder = 1
      OnClick = GroupsBoxClick
    end
  end
  object MainMenu: TMainMenu
    Left = 12
    Top = 288
    object FileMenu: TMenuItem
      Caption = '&'#1060#1072#1081#1083
      ShortCut = 16462
      object FileNew: TMenuItem
        Caption = '&'#1053#1086#1074#1099#1081
        ShortCut = 16462
        OnClick = FileNewClick
      end
      object FileOpen: TMenuItem
        Caption = '&'#1054#1090#1082#1088#1099#1090#1100'...'
        ShortCut = 16463
        OnClick = FileOpenClick
      end
      object FileSave: TMenuItem
        Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100
        ShortCut = 16467
        OnClick = FileSaveClick
      end
      object FileSaveAs: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' &'#1050#1072#1082'...'
        OnClick = FileSaveAsClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object FileExit: TMenuItem
        Caption = '&'#1047#1072#1082#1088#1099#1090#1100
        ShortCut = 32883
        OnClick = FileExitClick
      end
    end
    object BaseMenu: TMenuItem
      Caption = '&'#1041#1072#1079#1072
      object Add1: TMenuItem
        Caption = '&'#1044#1086#1073#1072#1074#1080#1090#1100
        ShortCut = 16449
        OnClick = btAddClick
      end
      object Modify1: TMenuItem
        Caption = '&'#1048#1079#1084#1077#1085#1080#1090#1100
        ShortCut = 16461
        OnClick = btModifyClick
      end
      object ClearFields1: TMenuItem
        Caption = '&'#1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1103
        ShortCut = 16430
        OnClick = btClearClick
      end
      object Delete1: TMenuItem
        Caption = '&'#1059#1076#1072#1083#1080#1090#1100
        ShortCut = 8238
        OnClick = btDeleteClick
      end
      object Find1: TMenuItem
        Caption = '&'#1053#1072#1081#1090#1080'...'
        ShortCut = 16454
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object SortAdr: TMenuItem
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
        OnClick = SortAdrClick
      end
    end
    object HelpMenu: TMenuItem
      Caption = '&'#1055#1086#1084#1086#1097#1100
      object HelpAbout: TMenuItem
        Caption = '&'#1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        ShortCut = 112
        OnClick = HelpAboutClick
      end
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'Adress Book (*.adb)|*.adb|Text|*.txt|All|*.*'
    Left = 48
    Top = 288
  end
  object SaveDialog: TSaveDialog
    Filter = 'Adress Book (*.adb)|*.adb|Text|*.txt|All|*.*'
    Left = 80
    Top = 288
  end
end
