object FrmSettings: TFrmSettings
  Left = 0
  Top = 0
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
  ClientHeight = 447
  ClientWidth = 637
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
  object GrBoxTheme: TGroupBox
    Left = 8
    Top = 8
    Width = 617
    Height = 73
    Caption = #1042#1085#1077#1096#1085#1080#1081' '#1074#1080#1076': '#1058#1077#1084#1099' '
    TabOrder = 0
    DesignSize = (
      617
      73)
    object CmBoxVclStyle: TComboBox
      Left = 14
      Top = 35
      Width = 267
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      TabOrder = 0
      OnSelect = CmBoxVclStyleSelect
    end
  end
  object BBtnCancel: TBitBtn
    Left = 520
    Top = 414
    Width = 105
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
end
