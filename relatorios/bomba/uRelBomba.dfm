inherited frmRelBomba: TfrmRelBomba
  ClientHeight = 356
  ClientWidth = 565
  ExplicitWidth = 571
  ExplicitHeight = 385
  PixelsPerInch = 96
  TextHeight = 16
  inherited pgcPrincipal: TPageControl
    Top = 67
    Width = 565
    Height = 173
    ExplicitTop = 67
    ExplicitWidth = 565
    ExplicitHeight = 173
    inherited tsRelatorio: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 27
      ExplicitWidth = 557
      ExplicitHeight = 142
      object edtInicial: TLabeledEdit
        Left = 66
        Top = 64
        Width = 121
        Height = 24
        Alignment = taRightJustify
        EditLabel.Width = 108
        EditLabel.Height = 13
        EditLabel.Caption = 'Identificador inicial'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        TabOrder = 0
        Text = '1'
        OnExit = edtInicialExit
        OnKeyPress = edtInicialKeyPress
      end
      object edtFinal: TLabeledEdit
        Left = 282
        Top = 64
        Width = 121
        Height = 24
        Alignment = taRightJustify
        EditLabel.Width = 100
        EditLabel.Height = 13
        EditLabel.Caption = 'Identificador final'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        TabOrder = 1
        Text = '99999'
        OnExit = edtFinalExit
        OnKeyPress = edtInicialKeyPress
      end
    end
  end
  inherited Panel1: TPanel
    Width = 565
    Height = 67
    ExplicitWidth = 565
    ExplicitHeight = 67
    inherited Label1: TLabel
      Left = 27
      Top = 21
      Width = 304
      Caption = 'Listagem de Bombas de combust'#237'vel'
      ExplicitLeft = 27
      ExplicitTop = 21
      ExplicitWidth = 304
    end
  end
  inherited Panel2: TPanel
    Top = 240
    Width = 565
    ExplicitTop = 240
    ExplicitWidth = 565
  end
  inherited rlRelatorio: TRLReport
    Margins.LeftMargin = 5.000000000000000000
    Margins.TopMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Margins.BottomMargin = 5.000000000000000000
    Title = 'Listagem - Bombas de combust'#237'vel'
    ExpressionParser = RLExpressionParser1
    inherited RLBand1: TRLBand
      inherited RLDBText5: TRLDBText
        Left = 7
        ExplicitLeft = 7
      end
      inherited RLLabel10: TRLLabel
        Left = 7
        Width = 292
        Caption = 'Listagem de Bombas de combust'#237'vel'
        ExplicitLeft = 7
        ExplicitWidth = 292
      end
    end
    inherited RLBand2: TRLBand
      Top = 134
      ExplicitTop = 134
      inherited RLSystemInfo1: TRLSystemInfo
        Alignment = taRightJustify
      end
    end
    inherited RLBand3: TRLBand
      object RLLabel3: TRLLabel
        Left = 5
        Top = 8
        Width = 225
        Height = 16
        AutoSize = False
        Caption = 'Bomba'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 233
        Top = 8
        Width = 211
        Height = 16
        AutoSize = False
        Caption = 'Tanque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 448
        Top = 8
        Width = 169
        Height = 16
        AutoSize = False
        Caption = 'Combust'#237'vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 621
        Top = 8
        Width = 108
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    inherited RLBand4: TRLBand
      Height = 18
      ExplicitHeight = 18
      object RLDBText1: TRLDBText
        Left = 5
        Top = 0
        Width = 225
        Height = 16
        AutoSize = False
        DataField = 'DESCRICAO'
        DataSource = dtsListagem
        Holder = RLLabel3
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 233
        Top = -1
        Width = 211
        Height = 16
        AutoSize = False
        DataField = 'Tanque'
        DataSource = dtsListagem
        Holder = RLLabel4
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 448
        Top = 0
        Width = 169
        Height = 16
        AutoSize = False
        DataField = 'TipoCombustivel'
        DataSource = dtsListagem
        Holder = RLLabel5
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 621
        Top = -1
        Width = 108
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VALORLITRO'
        DataSource = dtsListagem
        Holder = RLLabel6
        Text = ''
      end
    end
  end
  inherited qryListagem: TFDQuery
    Connection = dtmPrincipal.conDatabase
    SQL.Strings = (
      'SELECT'
      '  BOMBA.DESCRICAO,'
      '  TANQUE.DESCRICAO AS "Tanque",'
      '  TIPOCOMBUSTIVEL.DESCRICAO AS "TipoCombustivel",'
      '  TIPOCOMBUSTIVEL.VALORLITRO,'
      '  BOMBA.ID'
      'FROM'
      '  TANQUE'
      '  RIGHT JOIN BOMBA ON BOMBA.TANQUE_ID = TANQUE.ID'
      
        '  LEFT JOIN TIPOCOMBUSTIVEL ON TANQUE.TIPOCOMBUSTIVEL_ID = TIPOC' +
        'OMBUSTIVEL.ID')
  end
  object RLExpressionParser1: TRLExpressionParser
    Left = 304
    Top = 376
  end
end
