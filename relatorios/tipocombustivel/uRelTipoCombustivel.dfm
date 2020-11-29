inherited frmRelTipoCombustivel: TfrmRelTipoCombustivel
  ClientHeight = 376
  ClientWidth = 554
  ExplicitWidth = 560
  ExplicitHeight = 405
  PixelsPerInch = 96
  TextHeight = 16
  inherited pgcPrincipal: TPageControl
    Width = 554
    ExplicitWidth = 554
    inherited tsRelatorio: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 27
      ExplicitWidth = 546
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
    Width = 554
    ExplicitWidth = 554
    inherited Label1: TLabel
      Width = 290
      Caption = 'Listagem dos Tipos de combust'#237'vel'
      ExplicitWidth = 290
    end
  end
  inherited Panel2: TPanel
    Width = 554
    ExplicitWidth = 554
  end
  inherited rlRelatorio: TRLReport
    Left = 0
    Top = 392
    Margins.LeftMargin = 5.000000000000000000
    Margins.TopMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Margins.BottomMargin = 5.000000000000000000
    Title = 'Listagem dos tipos de combust'#237'vel'
    ExplicitLeft = 0
    ExplicitTop = 392
    inherited RLBand1: TRLBand
      inherited RLDBText5: TRLDBText
        Left = 7
        ExplicitLeft = 7
      end
      inherited RLLabel10: TRLLabel
        Left = 7
        Width = 281
        Caption = 'Listagem dos Tipos de combust'#237'vel'
        ExplicitLeft = 7
        ExplicitWidth = 281
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
        Width = 88
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Valor (R$)'
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
        Width = 88
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VALORLITRO'
        DataSource = dtsListagem
        Holder = RLLabel4
        Text = ''
      end
    end
  end
  inherited qryListagem: TFDQuery
    IndexesActive = False
    Connection = dtmPrincipal.conDatabase
    SQL.Strings = (
      'SELECT'
      '  TIPOCOMBUSTIVEL.DESCRICAO,'
      '  TIPOCOMBUSTIVEL.VALORLITRO,'
      '  TIPOCOMBUSTIVEL.ID'
      'FROM'
      '  TIPOCOMBUSTIVEL')
  end
  inherited qrySistema: TFDQuery
    IndexesActive = False
  end
end
