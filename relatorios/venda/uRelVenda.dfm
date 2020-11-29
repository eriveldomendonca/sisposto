inherited frmRelVenda: TfrmRelVenda
  ClientHeight = 365
  ClientWidth = 559
  ExplicitWidth = 565
  ExplicitHeight = 394
  PixelsPerInch = 96
  TextHeight = 16
  inherited pgcPrincipal: TPageControl
    Width = 559
    ExplicitWidth = 564
    inherited tsRelatorio: TTabSheet
      ExplicitWidth = 556
      object Label2: TLabel
        Left = 125
        Top = 48
        Width = 62
        Height = 13
        Caption = 'Data inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 294
        Top = 48
        Width = 54
        Height = 13
        Caption = 'Data final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtDataInicial: TMaskEdit
        Left = 125
        Top = 64
        Width = 120
        Height = 24
        EditMask = '!00/00/0000;0; '
        MaxLength = 10
        TabOrder = 0
        Text = ''
        OnExit = edtDataInicialExit
      end
      object edtDataFinal: TMaskEdit
        Left = 294
        Top = 64
        Width = 120
        Height = 24
        EditMask = '!00/00/0000;0; '
        MaxLength = 10
        TabOrder = 1
        Text = ''
        OnExit = edtDataInicialExit
      end
    end
  end
  inherited Panel1: TPanel
    Width = 559
    ExplicitWidth = 564
    inherited Label1: TLabel
      Width = 256
      Caption = 'Relat'#243'rio - Vendas por per'#237'odo'
      ExplicitWidth = 256
    end
  end
  inherited Panel2: TPanel
    Width = 559
    ExplicitWidth = 564
  end
  inherited rlRelatorio: TRLReport
    Left = 8
    Top = 379
    Margins.LeftMargin = 5.000000000000000000
    Margins.TopMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Margins.BottomMargin = 5.000000000000000000
    Title = 'Relat'#243'rio - Vendas por per'#237'odo'
    ExplicitLeft = 8
    ExplicitTop = 379
    inherited RLBand1: TRLBand
      inherited RLDBText5: TRLDBText
        Left = 7
        ExplicitLeft = 7
      end
      inherited RLLabel10: TRLLabel
        Left = 7
        Width = 247
        Caption = 'Relat'#243'rio - Vendas por per'#237'odo'
        ExplicitLeft = 7
        ExplicitWidth = 247
      end
    end
    inherited RLBand2: TRLBand
      Top = 217
      ExplicitTop = 217
      inherited RLDraw3: TRLDraw
        Width = 751
      end
      inherited RLSystemInfo2: TRLSystemInfo
        Left = 308
        Width = 110
        Text = 'P'#225'gina: '
        ExplicitLeft = 308
        ExplicitWidth = 110
      end
    end
    inherited RLGroup1: TRLGroup
      Height = 132
      DataFields = 'DATAVENDA'
      ExplicitHeight = 132
      inherited RLGroup2: TRLGroup
        Top = 21
        Height = 86
        DataFields = 'bomba'
        ExplicitTop = 21
        ExplicitHeight = 86
        inherited RLBand3: TRLBand
          Height = 46
          ExplicitHeight = 46
          object RLDBText1: TRLDBText
            Left = 62
            Top = 6
            Width = 43
            Height = 16
            DataField = 'bomba'
            DataSource = dtsListagem
            Text = ''
          end
          object RLLabel3: TRLLabel
            Left = 9
            Top = 6
            Width = 53
            Height = 16
            Caption = 'Bomba:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel4: TRLLabel
            Left = 7
            Top = 25
            Width = 81
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Data'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel5: TRLLabel
            Left = 90
            Top = 25
            Width = 124
            Height = 16
            AutoSize = False
            Caption = 'Combust'#237'vel'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            HoldStyle = hsVertically
            ParentFont = False
          end
          object RLLabel6: TRLLabel
            Left = 215
            Top = 25
            Width = 70
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Qtde (L)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            HoldStyle = hsVertically
            ParentFont = False
          end
          object RLLabel7: TRLLabel
            Left = 286
            Top = 25
            Width = 70
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Valor (R$)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            HoldStyle = hsVertically
            ParentFont = False
          end
          object RLLabel8: TRLLabel
            Left = 357
            Top = 25
            Width = 70
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Imp. (%)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            HoldStyle = hsVertically
            ParentFont = False
          end
          object RLLabel9: TRLLabel
            Left = 428
            Top = 25
            Width = 70
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Imp. (R$)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            HoldStyle = hsVertically
            ParentFont = False
          end
          object RLLabel11: TRLLabel
            Left = 499
            Top = 25
            Width = 79
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Total (R$)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            HoldStyle = hsVertically
            ParentFont = False
          end
        end
        inherited RLBand4: TRLBand
          Top = 62
          Height = 18
          BandType = btSummary
          ExplicitTop = 62
          ExplicitHeight = 18
          object RLDBResult1: TRLDBResult
            Left = 499
            Top = 2
            Width = 79
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'totalvenda'
            DataSource = dtsListagem
            DisplayMask = '0.00'
            Holder = RLLabel11
            Info = riSum
            Text = ''
          end
          object RLDBResult2: TRLDBResult
            Left = 428
            Top = 2
            Width = 70
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'totalimposto'
            DataSource = dtsListagem
            DisplayMask = '0.00'
            Holder = RLLabel9
            Info = riSum
            Text = ''
          end
          object RLDBResult3: TRLDBResult
            Left = 357
            Top = 2
            Width = 70
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'totalimposto'
            DataSource = dtsListagem
            DisplayMask = '0.00'
            Holder = RLLabel8
            Text = ''
          end
          object RLDBResult4: TRLDBResult
            Left = 286
            Top = 2
            Width = 70
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'valorlitro'
            DataSource = dtsListagem
            DisplayMask = '0.00'
            Holder = RLLabel7
            Text = ''
          end
          object RLDBResult5: TRLDBResult
            Left = 215
            Top = 2
            Width = 70
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'qtdlitro'
            DataSource = dtsListagem
            DisplayMask = '0.00'
            Holder = RLLabel6
            Info = riSum
            Text = ''
          end
          object RLLabel13: TRLLabel
            Left = 112
            Top = 2
            Width = 99
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Total Bomba:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            HoldStyle = hsVertically
            ParentFont = False
          end
          object RLDraw4: TRLDraw
            Left = 0
            Top = 0
            Width = 756
            Height = 4
            Align = faTop
            DrawKind = dkLine
          end
        end
        inherited RLBand6: TRLBand
          Top = 46
          ExplicitTop = 46
          object RLDBText2: TRLDBText
            Left = 7
            Top = 0
            Width = 81
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'DATAVENDA'
            DataSource = dtsListagem
            Holder = RLLabel4
            Text = ''
          end
          object RLDBText3: TRLDBText
            Left = 90
            Top = 0
            Width = 124
            Height = 16
            AutoSize = False
            DataField = 'combustivel'
            DataSource = dtsListagem
            Holder = RLLabel5
            SecondHolder = RLDBText2
            SecondHoldStyle = hsVertically
            Text = ''
          end
          object RLDBText4: TRLDBText
            Left = 215
            Top = 0
            Width = 70
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'qtdlitro'
            DataSource = dtsListagem
            DisplayMask = '0.00'
            Holder = RLLabel6
            SecondHolder = RLDBText2
            SecondHoldStyle = hsVertically
            Text = ''
          end
          object RLDBText6: TRLDBText
            Left = 286
            Top = 0
            Width = 70
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'valorlitro'
            DataSource = dtsListagem
            DisplayMask = '0.00'
            Holder = RLLabel7
            SecondHolder = RLDBText2
            SecondHoldStyle = hsVertically
            Text = ''
          end
          object RLDBText7: TRLDBText
            Left = 357
            Top = 0
            Width = 70
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'percimposto'
            DataSource = dtsListagem
            DisplayMask = '0.00'
            Holder = RLLabel8
            SecondHolder = RLDBText2
            SecondHoldStyle = hsVertically
            Text = ''
          end
          object RLDBText8: TRLDBText
            Left = 428
            Top = 0
            Width = 70
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'totalimposto'
            DataSource = dtsListagem
            DisplayMask = '0.00'
            Holder = RLLabel9
            SecondHolder = RLDBText2
            SecondHoldStyle = hsVertically
            Text = ''
          end
          object RLDBText10: TRLDBText
            Left = 499
            Top = 0
            Width = 79
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'totalvenda'
            DataSource = dtsListagem
            DisplayMask = '0.00'
            Holder = RLLabel11
            SecondHolder = RLDBText2
            SecondHoldStyle = hsVertically
            Text = ''
          end
        end
      end
      inherited RLBand5: TRLBand
        Top = 107
        Height = 21
        ExplicitTop = 107
        ExplicitHeight = 21
        object RLDraw2: TRLDraw
          Left = 0
          Top = 0
          Width = 756
          Height = 4
          Align = faTop
          DrawKind = dkLine
        end
        object RLDBResult7: TRLDBResult
          Left = 499
          Top = 5
          Width = 79
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'totalvenda'
          DataSource = dtsListagem
          DisplayMask = '0.00'
          Holder = RLLabel11
          Info = riSum
          Text = ''
        end
        object RLDBResult11: TRLDBResult
          Left = 428
          Top = 5
          Width = 70
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'totalimposto'
          DataSource = dtsListagem
          DisplayMask = '0.00'
          Holder = RLLabel9
          Info = riSum
          Text = ''
        end
        object RLDBResult12: TRLDBResult
          Left = 357
          Top = 5
          Width = 70
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'totalimposto'
          DataSource = dtsListagem
          DisplayMask = '0.00'
          Holder = RLLabel8
          Text = ''
        end
        object RLDBResult13: TRLDBResult
          Left = 286
          Top = 5
          Width = 70
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'valorlitro'
          DataSource = dtsListagem
          DisplayMask = '0.00'
          Holder = RLLabel7
          Text = ''
        end
        object RLDBResult14: TRLDBResult
          Left = 215
          Top = 5
          Width = 70
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'qtdlitro'
          DataSource = dtsListagem
          DisplayMask = '0.00'
          Holder = RLLabel6
          Info = riSum
          Text = ''
        end
        object RLLabel15: TRLLabel
          Left = 112
          Top = 5
          Width = 99
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Total Dia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HoldStyle = hsVertically
          ParentFont = False
        end
      end
      object RLBand7: TRLBand
        Left = 0
        Top = 0
        Width = 756
        Height = 21
        BandType = btColumnHeader
        object RLLabel12: TRLLabel
          Left = 9
          Top = 3
          Width = 53
          Height = 16
          Alignment = taRightJustify
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText9: TRLDBText
          Left = 62
          Top = 3
          Width = 83
          Height = 16
          DataField = 'DATAVENDA'
          DataSource = dtsListagem
          Text = ''
        end
      end
    end
  end
  inherited qryListagem: TFDQuery
    Active = True
    SQL.Strings = (
      'SELECT'
      '  VENDA.DATAVENDA,'
      '  BOMBA.DESCRICAO AS "bomba",'
      '  TIPOCOMBUSTIVEL.DESCRICAO AS "combustivel",'
      '  VENDA.QTDLITRO as "qtdlitro",'
      '  VENDA.VALORLITRO as "valorlitro",'
      '  VENDA.PERCIMPOSTO as "percimposto",'
      '  VENDA.QTDLITRO * VENDA.VALORLITRO AS "totalvenda",'
      
        '  (VENDA.QTDLITRO * VENDA.VALORLITRO) * (VENDA.PERCIMPOSTO / 100' +
        ') AS "totalimposto"'
      'FROM'
      '  VENDA'
      '  LEFT JOIN BOMBA ON VENDA.BOMBA_ID = BOMBA.ID'
      '  LEFT JOIN TANQUE ON BOMBA.TANQUE_ID = TANQUE.ID'
      
        '  LEFT JOIN TIPOCOMBUSTIVEL ON TANQUE.TIPOCOMBUSTIVEL_ID = TIPOC' +
        'OMBUSTIVEL.ID')
  end
end
