object frmPadraoRelatorioGroup: TfrmPadraoRelatorioGroup
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 615
  ClientWidth = 1079
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 68
    Width = 1079
    Height = 188
    ActivePage = tsRelatorio
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 574
    object tsRelatorio: TTabSheet
      Caption = 'Configura'#231#227'o'
      ExplicitWidth = 566
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1079
    Height = 68
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 574
    object Label1: TLabel
      Left = 32
      Top = 22
      Width = 54
      Height = 23
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5066061
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 256
    Width = 1079
    Height = 117
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 574
    object btnImprimir: TBitBtn
      Left = 40
      Top = 23
      Width = 80
      Height = 70
      Caption = '&Imprimir'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnImprimirClick
    end
    object btnVisualizar: TBitBtn
      Left = 139
      Top = 23
      Width = 80
      Height = 70
      Caption = '&Visualizar Impress'#227'o'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F33F333F3337F330FF0FFF0FFF
        F03337F37F337F3337F330FF0FFF0FFFF03337F37FFF7FFF37F330F00000000F
        F03337F77777777337F330FFF0FFF0FFF03337F337F337F337F330FFF0FFF0FF
        F03337F337FFF7FFF7F330FF00000000F03337F37777777737F330FFFF0FFF0F
        F03337F3337F337F37F330FFFF0FFF0FF03337F33373337337F330FFFFFFFFFF
        F03337F33333333FF7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      Layout = blGlyphTop
      NumGlyphs = 2
      TabOrder = 1
      WordWrap = True
      OnClick = btnVisualizarClick
    end
    object btnFechar: TBitBtn
      Left = 440
      Top = 23
      Width = 80
      Height = 70
      Caption = '&Fechar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      Layout = blGlyphTop
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnFecharClick
    end
  end
  object rlRelatorio: TRLReport
    Left = 16
    Top = 400
    Width = 794
    Height = 1123
    Margins.LeftMargin = 5.000000000000000000
    Margins.TopMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Margins.BottomMargin = 5.000000000000000000
    DataSource = dtsListagem
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 19
      Top = 19
      Width = 756
      Height = 66
      BandType = btHeader
      object RLDraw1: TRLDraw
        Left = 7
        Top = 53
        Width = 742
        Height = 13
        Align = faCenterBottom
        DrawKind = dkLine
      end
      object RLDBText5: TRLDBText
        Left = 16
        Top = 8
        Width = 88
        Height = 16
        DataField = 'NOMEPOSTO'
        DataSource = dtsSistema
        Text = ''
      end
      object RLLabel10: TRLLabel
        Left = 16
        Top = 30
        Width = 87
        Height = 19
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 19
      Top = 158
      Width = 756
      Height = 16
      BandType = btFooter
      object RLDraw3: TRLDraw
        Left = 3
        Top = -6
        Width = 742
        Height = 13
        DrawKind = dkLine
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 707
        Top = 1
        Width = 49
        Height = 14
        Align = faCenterRight
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Info = itFullDate
        ParentFont = False
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 346
        Top = 0
        Width = 72
        Height = 14
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        HoldStyle = hsVertically
        Info = itPageNumber
        ParentFont = False
        Text = ''
      end
      object RLLabel1: TRLLabel
        Left = 417
        Top = 0
        Width = 6
        Height = 14
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        HoldStyle = hsRelatively
        ParentFont = False
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 422
        Top = 0
        Width = 72
        Height = 14
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        HoldStyle = hsVertically
        Info = itPageNumber
        ParentFont = False
        SecondHoldStyle = hsVertically
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 0
        Top = 0
        Width = 69
        Height = 16
        Align = faLeft
        Caption = 'SisPosto v0.1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 19
      Top = 85
      Width = 756
      Height = 73
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 756
        Height = 30
        BandType = btColumnHeader
        object RLDraw2: TRLDraw
          Left = 3
          Top = 22
          Width = 742
          Height = 13
          DrawKind = dkLine
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 30
        Width = 756
        Height = 16
      end
    end
  end
  object qryListagem: TFDQuery
    Connection = dtmPrincipal.conDatabase
    Left = 466
    Top = 8
  end
  object dtsListagem: TDataSource
    DataSet = qryListagem
    Left = 530
    Top = 8
  end
  object qrySistema: TFDQuery
    Connection = dtmPrincipal.conDatabase
    SQL.Strings = (
      'SELECT *'
      'FROM SISTEMA')
    Left = 322
    Top = 16
  end
  object dtsSistema: TDataSource
    DataSet = qrySistema
    Left = 386
    Top = 16
  end
end
