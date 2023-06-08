object FrmEditGroups: TFrmEditGroups
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'FrmEditGroups'
  ClientHeight = 458
  ClientWidth = 548
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LblEditGroupName: TLabel
    Left = 8
    Top = 13
    Width = 63
    Height = 13
    Caption = #1048#1084#1103' '#1075#1088#1091#1087#1087#1099':'
  end
  object DBEditGroupName: TDBEdit
    Left = 8
    Top = 32
    Width = 528
    Height = 21
    DataField = 'group_name'
    DataSource = DSGroups
    TabOrder = 0
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 59
    Width = 240
    Height = 25
    DataSource = DSGroups
    TabOrder = 1
  end
  object DBG: TDBGrid
    Left = 8
    Top = 90
    Width = 532
    Height = 360
    DataSource = DSGroups
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'id'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'group_name'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1090#1086#1074#1072#1088#1086#1074
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 500
        Visible = True
      end>
  end
  object FDTGroups: TFDTable
    Connection = FrmMain.FDConnection
    Left = 256
    Top = 272
  end
  object DSGroups: TDataSource
    DataSet = FDTGroups
    Left = 336
    Top = 272
  end
end
