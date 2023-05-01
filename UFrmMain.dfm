object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Shopping Base'
  ClientHeight = 805
  ClientWidth = 1288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    1288
    805)
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 786
    Width = 1288
    Height = 19
    Panels = <
      item
        Text = #1057#1090#1088#1086#1082':'
        Width = 150
      end
      item
        Text = #1057#1091#1084#1084#1072':'
        Width = 150
      end>
    ExplicitWidth = 967
  end
  object PanelEdit: TPanel
    Left = 0
    Top = 80
    Width = 1288
    Height = 113
    Align = alCustom
    Anchors = [akLeft, akTop, akRight]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    Visible = False
    ExplicitWidth = 1071
    DesignSize = (
      1284
      109)
    object Label1: TLabel
      Left = 16
      Top = 17
      Width = 75
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1086#1082#1091#1087#1082#1080':'
    end
    object Label2: TLabel
      Left = 137
      Top = 17
      Width = 91
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072':'
    end
    object Label3: TLabel
      Left = 409
      Top = 17
      Width = 49
      Height = 13
      Caption = #1045#1076#1080#1085#1080#1094#1099':'
    end
    object Label4: TLabel
      Left = 481
      Top = 17
      Width = 58
      Height = 13
      Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100':'
    end
    object Label5: TLabel
      Left = 553
      Top = 17
      Width = 52
      Height = 13
      Caption = #1043#1072#1088#1072#1085#1090#1080#1103':'
    end
    object Label6: TLabel
      Left = 733
      Top = 17
      Width = 46
      Height = 13
      Caption = #1052#1072#1075#1072#1079#1080#1085':'
    end
    object Label7: TLabel
      Left = 625
      Top = 17
      Width = 102
      Height = 13
      Caption = #1048#1089#1090#1077#1082#1072#1077#1090' '#1075#1072#1088#1072#1085#1090#1080#1103':'
    end
    object lblSellerPhone: TLabel
      Left = 988
      Top = 17
      Width = 78
      Height = 13
      Caption = #1058#1077#1083'. '#1087#1088#1086#1076#1072#1074#1094#1072':'
    end
    object LblSellerName: TLabel
      Left = 1083
      Top = 17
      Width = 76
      Height = 13
      Caption = #1048#1084#1103' '#1055#1088#1086#1076#1072#1074#1094#1072':'
    end
    object lblProductId: TLabel
      Left = 861
      Top = 17
      Width = 63
      Height = 13
      Caption = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072':'
    end
    object dbeProductName: TDBEdit
      Left = 137
      Top = 36
      Width = 266
      Height = 21
      DataField = 'product_name'
      DataSource = DSMain
      TabOrder = 0
    end
    object dbeCount: TDBEdit
      Left = 409
      Top = 36
      Width = 66
      Height = 21
      DataField = 'count'
      DataSource = DSMain
      TabOrder = 1
    end
    object dbeBuyPrice: TDBEdit
      Left = 481
      Top = 36
      Width = 66
      Height = 21
      DataField = 'buy_price'
      DataSource = DSMain
      TabOrder = 2
    end
    object dbeGuaranteePeriod: TDBEdit
      Left = 553
      Top = 36
      Width = 66
      Height = 21
      DataField = 'guarantee_period'
      DataSource = DSMain
      TabOrder = 3
    end
    object DBCmBoxSelectShop: TDBComboBox
      Left = 733
      Top = 36
      Width = 122
      Height = 21
      DataField = 'shop_name'
      DataSource = DSMain
      Items.Strings = (
        'DNS'
        'Technopoint')
      TabOrder = 4
    end
    object DBNavigator: TDBNavigator
      Left = 16
      Top = 68
      Width = 240
      Height = 25
      DataSource = DSMain
      Anchors = [akLeft, akBottom]
      Enabled = False
      TabOrder = 5
      ExplicitTop = 72
    end
    object dbeSellerPhone: TDBEdit
      Left = 988
      Top = 36
      Width = 89
      Height = 21
      DataField = 'seller_phone'
      DataSource = DSMain
      TabOrder = 6
    end
    object dbeSellerName: TDBEdit
      Left = 1083
      Top = 36
      Width = 134
      Height = 21
      DataField = 'seller_name'
      DataSource = DSMain
      TabOrder = 7
    end
    object dbeProductId: TDBEdit
      Left = 861
      Top = 36
      Width = 121
      Height = 21
      DataField = 'product_id'
      DataSource = DSMain
      TabOrder = 8
    end
    object jvdpeGuaranteeLastDate: TJvDBDatePickerEdit
      Left = 625
      Top = 36
      Width = 102
      Height = 21
      AllowNoDate = True
      DataField = 'guarantee_last_date'
      DataSource = DSMain
      TabOrder = 9
    end
    object JvdpeDateBuy: TJvDBDatePickerEdit
      Left = 14
      Top = 36
      Width = 102
      Height = 21
      AllowNoDate = True
      DataField = 'date_buy'
      DataSource = DSMain
      TabOrder = 10
    end
  end
  object PanelSearch: TPanel
    Left = 0
    Top = 8
    Width = 1065
    Height = 66
    Align = alCustom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      1065
      66)
    object lblEdSearch: TLabeledEdit
      Left = 16
      Top = 28
      Width = 225
      Height = 21
      EditLabel.Width = 34
      EditLabel.Height = 13
      EditLabel.Caption = #1055#1086#1080#1089#1082':'
      TabOrder = 0
    end
    object BtnSearch: TButton
      Left = 247
      Top = 26
      Width = 75
      Height = 25
      Caption = #1048#1089#1082#1072#1090#1100
      TabOrder = 1
      OnClick = BtnSearchClick
    end
    object ChBoxEditEnable: TCheckBox
      Left = 409
      Top = 30
      Width = 113
      Height = 17
      Caption = #1056#1077#1078#1080#1084' '#1074#1074#1086#1076#1072
      TabOrder = 2
      OnClick = ChBoxEditEnableClick
    end
    object BtnSearchClose: TButton
      Left = 328
      Top = 26
      Width = 75
      Height = 25
      Caption = #1057#1073#1088#1086#1089
      TabOrder = 3
      OnClick = BtnSearchCloseClick
    end
    object CmBoxVclStyle: TComboBox
      Left = 808
      Top = 23
      Width = 151
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      TabOrder = 4
      OnSelect = CmBoxVclStyleSelect
    end
    object Button1: TButton
      Left = 542
      Top = 21
      Width = 107
      Height = 25
      Caption = 'Button1'
      TabOrder = 5
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 675
      Top = 21
      Width = 82
      Height = 25
      Caption = 'Button2'
      TabOrder = 6
      OnClick = Button2Click
    end
  end
  object JvDBG: TJvDBGrid
    Left = 0
    Top = 199
    Width = 1288
    Height = 436
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DSMain
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    MultiSelect = True
    TitleArrow = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
  end
  object mm: TMemo
    Left = 0
    Top = 641
    Width = 1288
    Height = 139
    Anchors = [akLeft, akRight, akBottom]
    Lines.Strings = (
      'mm')
    ScrollBars = ssVertical
    TabOrder = 4
    ExplicitWidth = 1071
  end
  object OpenDialog: TOpenDialog
    Left = 528
    Top = 280
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      'CacheSize=1000'
      'DriverID=SQLite')
    Connected = True
    Left = 264
    Top = 432
  end
  object FDQ: TFDQuery
    Connection = FDConnection
    Left = 344
    Top = 432
  end
  object FDQMain: TFDQuery
    Connection = FDConnection
    Left = 416
    Top = 432
  end
  object DSMain: TDataSource
    DataSet = FDQMain
    Left = 488
    Top = 432
  end
end
