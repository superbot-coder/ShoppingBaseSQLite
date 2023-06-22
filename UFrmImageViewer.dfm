object FrmImageViewer: TFrmImageViewer
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1082#1072#1088#1090#1085#1082#1080
  ClientHeight = 744
  ClientWidth = 889
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  DesignSize = (
    889
    744)
  PixelsPerInch = 96
  TextHeight = 13
  object Image: TImage
    Left = 0
    Top = 0
    Width = 889
    Height = 673
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Center = True
    Proportional = True
    Stretch = True
  end
  object BitBtnCansel: TBitBtn
    Left = 776
    Top = 704
    Width = 99
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object PanelNavigation: TPanel
    Left = 368
    Top = 691
    Width = 169
    Height = 45
    Anchors = [akBottom]
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      169
      45)
    object BtnRight: TButton
      Left = 87
      Top = 12
      Width = 57
      Height = 25
      Anchors = [akBottom]
      Caption = '>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BtnRightClick
    end
    object BtnLeft: TButton
      Left = 24
      Top = 12
      Width = 57
      Height = 25
      Anchors = [akBottom]
      Caption = '<<'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BtnLeftClick
    end
  end
end
