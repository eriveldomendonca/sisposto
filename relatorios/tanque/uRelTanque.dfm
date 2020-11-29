inherited frmRelTanque: TfrmRelTanque
  ClientHeight = 365
  ClientWidth = 567
  ExplicitWidth = 573
  ExplicitHeight = 394
  PixelsPerInch = 96
  TextHeight = 16
  inherited pgcPrincipal: TPageControl
    Top = 64
    Width = 567
    ExplicitTop = 64
    ExplicitWidth = 567
    inherited tsRelatorio: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 27
      ExplicitWidth = 559
      ExplicitHeight = 157
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
    Width = 567
    Height = 64
    ExplicitWidth = 567
    ExplicitHeight = 64
    inherited Label1: TLabel
      Width = 310
      Caption = 'Listagem de Tanques de combust'#237'vel'
      ExplicitWidth = 310
    end
  end
  inherited Panel2: TPanel
    Top = 252
    Width = 567
    ExplicitTop = 252
    ExplicitWidth = 567
  end
  inherited rlRelatorio: TRLReport
    Left = 8
    Top = 384
    Margins.LeftMargin = 5.000000000000000000
    Margins.TopMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Margins.BottomMargin = 5.000000000000000000
    Title = 'Listagem de Tanques de combust'#237'vel'
    ExplicitLeft = 8
    ExplicitTop = 384
    inherited RLBand1: TRLBand
      inherited RLDBText5: TRLDBText
        Left = 7
        ExplicitLeft = 7
      end
      inherited RLLabel10: TRLLabel
        Left = 7
        Width = 295
        Caption = 'Listagem de Tanques de combust'#237'vel'
        ExplicitLeft = 7
        ExplicitWidth = 295
      end
    end
    inherited RLBand2: TRLBand
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
        Caption = 'Tanque'
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
        Caption = 'Combust'#237'vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    inherited RLBand4: TRLBand
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
        DataField = 'TipoCombustivel'
        DataSource = dtsListagem
        Holder = RLLabel4
        Text = ''
      end
    end
  end
  inherited qryListagem: TFDQuery
    Connection = dtmPrincipal.conDatabase
    SQL.Strings = (
      'SELECT'
      '  TANQUE.DESCRICAO,'
      '  TIPOCOMBUSTIVEL.DESCRICAO AS "TipoCombustivel",'
      '  TANQUE.ID'
      'FROM'
      '  TANQUE'
      
        '  LEFT JOIN TIPOCOMBUSTIVEL ON TANQUE.TIPOCOMBUSTIVEL_ID = TIPOC' +
        'OMBUSTIVEL.ID')
  end
end
