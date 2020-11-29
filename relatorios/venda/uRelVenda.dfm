inherited frmRelVenda: TfrmRelVenda
  ClientHeight = 374
  ClientWidth = 564
  ExplicitTop = 8
  ExplicitWidth = 570
  ExplicitHeight = 403
  PixelsPerInch = 96
  TextHeight = 16
  inherited pgcPrincipal: TPageControl
    Width = 564
    ExplicitWidth = 556
    inherited tsRelatorio: TTabSheet
      ExplicitWidth = 548
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
    Width = 564
    ExplicitWidth = 556
    inherited Label1: TLabel
      Width = 256
      Caption = 'Relat'#243'rio - Vendas por per'#237'odo'
      ExplicitWidth = 256
    end
  end
  inherited Panel2: TPanel
    Width = 564
    ExplicitWidth = 556
  end
  inherited rlRelatorio: TRLReport
    Margins.LeftMargin = 5.000000000000000000
    Margins.TopMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Margins.BottomMargin = 5.000000000000000000
    Title = 'Relat'#243'rio - Vendas por per'#237'odo'
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
      Top = 183
      ExplicitTop = 183
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
      Height = 98
      DataFields = 'bomba'
      ExplicitHeight = 98
      inherited RLBand3: TRLBand
        Height = 46
        ExplicitHeight = 46
        inherited RLDraw2: TRLDraw
          Left = 7
          Top = 40
          Height = 6
          Align = faCenterBottom
        end
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
        Top = 46
        Height = 18
        ExplicitTop = 46
        ExplicitHeight = 18
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
          Top = 2
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
          Top = 2
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
          Top = 2
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
          Top = 2
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
          Top = 2
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
      object RLBand5: TRLBand
        Left = 0
        Top = 64
        Width = 756
        Height = 22
        BandType = btSummary
        object RLDBResult2: TRLDBResult
          Left = 286
          Top = 3
          Width = 70
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'valorlitro'
          DataSource = dtsListagem
          DisplayMask = '0.00'
          Holder = RLLabel7
          SecondHoldStyle = hsVertically
          Text = ''
        end
        object RLDBResult3: TRLDBResult
          Left = 357
          Top = 3
          Width = 70
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'percimposto'
          DataSource = dtsListagem
          DisplayMask = '0.00'
          Holder = RLLabel8
          SecondHoldStyle = hsVertically
          Text = ''
        end
        object RLDBResult4: TRLDBResult
          Left = 428
          Top = 3
          Width = 70
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'totalimposto'
          DataSource = dtsListagem
          DisplayMask = '0.00'
          Holder = RLLabel9
          Info = riSum
          SecondHoldStyle = hsVertically
          Text = ''
        end
        object RLDBResult5: TRLDBResult
          Left = 499
          Top = 3
          Width = 79
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'totalvenda'
          DataSource = dtsListagem
          DisplayMask = '0.00'
          Holder = RLLabel11
          Info = riSum
          SecondHoldStyle = hsVertically
          Text = ''
        end
        object RLLabel12: TRLLabel
          Left = 175
          Top = 3
          Width = 36
          Height = 16
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult1: TRLDBResult
          Left = 215
          Top = 6
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
      end
    end
  end
  inherited qryListagem: TFDQuery
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
