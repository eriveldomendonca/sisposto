inherited frmCadVenda: TfrmCadVenda
  ClientWidth = 897
  ExplicitWidth = 903
  ExplicitHeight = 471
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlTitulo: TPanel
    Width = 897
    ExplicitWidth = 897
    inherited lblTitulo: TLabel
      Width = 79
      Caption = 'VENDAS'
      ExplicitWidth = 79
    end
    inherited imgIcon: TImage
      Picture.Data = {
        055449636F6E0000010001002020100000000000E80200001600000028000000
        2000000040000000010004000000000080020000000000000000000000000000
        0000000000000000000080000080000000808000800000008000800080800000
        80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF00999999999999999999999999999999999CC000000000000000000000
        00000CC99CC000000000B00000000B0000000CC99CC000000000400008000400
        08080CC99CC00000000030000000030000000CC99CC008080000C00000000C00
        08080CC99CC000000000C00008080C0000000CC99CC008080800C00000000C00
        00000CC99CC000000000C0080C00CC0000000CC99CCCC00C0000C0000C00CC00
        00000CC99CCCC00C0000C0000C00CC00000CCCC99CCCC00C0000C0000CCCCC00
        000CCCC99CCCCCCC0000C0030CCCCC00000CCCC99CCCCCCC0300C0000CCCCC00
        000CCCC99CCCCC9C0000CC00CCCCCC00000CCCC99CCCCCCC0300CCCCCCCCCC00
        000CCCC99CCCCCCC0000CCCFCCCCCC00080CCCC99CCCFCCC0808CCCCCCCCCCCC
        000CCCC99CCCCCCC0000CCCCCCCCFCCC080CCCC99CCCCCCC0808CCCCCCCCCCCC
        000CCFC99CCCCCCC0000CCCCCCCCCCCCC0CCCCC99CCCCCCC0808CCCCCCCCCCCC
        C0CCCCC99CCCCCCC0000CCCCFCCCCCCCC0CCCCC99CCCCCCCC00CCCCCCCCCCCCC
        CCCCCCC99CCCFCCCC00CCCCCCCCCFCCCCCCCCCC99CCCCCCCCCCCCCCCCCCCCCCC
        CC9CCCC99CCCCCCCCCCCCCCCCFCCCCCCCCCCCCC99CCCCCCCCCCCCCCCCCCCCFCC
        CCCCCCC99CCCCCCC6FCCCCCCCCCCCCCCCCCCFCC99CCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCC99CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC9999999999999999999999999
        9999999900000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000}
    end
  end
  inherited pnlBotoes: TPanel
    Width = 897
    ExplicitWidth = 897
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
    inherited btnFechar: TBitBtn
      Left = 803
      ExplicitLeft = 803
    end
  end
  inherited pgcPrincipal: TPageControl
    Width = 897
    ExplicitWidth = 897
    inherited tabListagem: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 27
      ExplicitWidth = 889
      ExplicitHeight = 311
      inherited pnlListagemTopo: TPanel
        Width = 889
        ExplicitWidth = 889
      end
      inherited pnlListagemCentro: TPanel
        Width = 889
        ExplicitWidth = 889
        inherited grdListagem: TDBGrid
          Width = 887
          Columns = <
            item
              Expanded = False
              FieldName = 'DATAVENDA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'bomba'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'combustivel'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTDLITRO'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALORLITRO'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERCIMPOSTO'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'totalimposto'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'totalvenda'
              Width = 100
              Visible = True
            end>
        end
        inherited sbaListagem: TStatusBar
          Width = 887
          ExplicitWidth = 887
        end
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 27
      ExplicitWidth = 889
      ExplicitHeight = 311
      object Label1: TLabel
        Left = 40
        Top = 25
        Width = 75
        Height = 13
        Caption = 'Data da venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 40
        Top = 80
        Width = 37
        Height = 13
        Caption = 'Bomba'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 380
        Top = 77
        Width = 77
        Height = 13
        Caption = 'Pre'#231'o litro (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 497
        Top = 77
        Width = 64
        Height = 13
        Caption = 'Imposto (%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 609
        Top = 77
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Pre'#231'o total (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object fld_datavenda: TMaskEdit
        Tag = 2
        Left = 40
        Top = 41
        Width = 120
        Height = 24
        EditMask = '!00/00/0000;1; '
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
      object fld_bomba: TDBLookupComboBox
        Tag = 2
        Left = 40
        Top = 96
        Width = 209
        Height = 24
        Hint = 'Bomba'
        KeyField = 'ID'
        ListField = 'DESCRICAO'
        ListSource = dtsBomba
        TabOrder = 1
        OnExit = fld_bombaExit
      end
      object fld_valorlitro: TMaskEdit
        Left = 376
        Top = 96
        Width = 81
        Height = 24
        Hint = 'Valor do litro'
        Alignment = taRightJustify
        Color = clMoneyGreen
        EditMask = '!99999,99;1; '
        MaxLength = 8
        ReadOnly = True
        TabOrder = 3
        Text = '     ,  '
      end
      object fld_percimposto: TMaskEdit
        Left = 486
        Top = 96
        Width = 75
        Height = 24
        Hint = 'Valor do litro'
        Alignment = taRightJustify
        Color = clMoneyGreen
        EditMask = '!99999,99;1; '
        MaxLength = 8
        ReadOnly = True
        TabOrder = 4
        Text = '     ,  '
      end
      object fld_valortotal: TMaskEdit
        Left = 586
        Top = 96
        Width = 103
        Height = 24
        Hint = 'Valor do litro'
        Alignment = taRightJustify
        Color = clMoneyGreen
        EditMask = '!99999,99;1; '
        MaxLength = 8
        ReadOnly = True
        TabOrder = 5
        Text = '     ,  '
      end
      object fld_qtdlitro: TLabeledEdit
        Tag = 3
        Left = 275
        Top = 96
        Width = 70
        Height = 24
        Alignment = taRightJustify
        EditLabel.Width = 64
        EditLabel.Height = 13
        EditLabel.Caption = 'Litros (qtd)'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        TabOrder = 2
        OnExit = fld_qtdlitroExit
        OnKeyPress = fld_qtdlitroKeyPress
      end
    end
  end
  inherited qryListagem: TFDQuery
    Connection = dtmPrincipal.conDatabase
    SQL.Strings = (
      'SELECT'
      '  VENDA.DATAVENDA,'
      '  BOMBA.DESCRICAO AS "bomba",'
      '  TIPOCOMBUSTIVEL.DESCRICAO AS "combustivel",'
      '  VENDA.QTDLITRO,'
      '  VENDA.VALORLITRO,'
      '  VENDA.PERCIMPOSTO,'
      
        '  (VENDA.QTDLITRO * VENDA.VALORLITRO) * (VENDA.PERCIMPOSTO / 100' +
        ') AS "totalimposto",'
      '  VENDA.QTDLITRO * VENDA.VALORLITRO AS "totalvenda",'
      '  VENDA.ID'
      'FROM'
      '  VENDA'
      '  LEFT JOIN BOMBA ON VENDA.BOMBA_ID = BOMBA.ID'
      '  LEFT JOIN TANQUE ON BOMBA.TANQUE_ID = TANQUE.ID'
      
        '  LEFT JOIN TIPOCOMBUSTIVEL ON TANQUE.TIPOCOMBUSTIVEL_ID = TIPOC' +
        'OMBUSTIVEL.ID')
    object qryListagemDATAVENDA: TDateField
      FieldName = 'DATAVENDA'
      Origin = 'DATAVENDA'
      Required = True
    end
    object qryListagembomba: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'bomba'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryListagemcombustivel: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'combustivel'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryListagemQTDLITRO: TSingleField
      FieldName = 'QTDLITRO'
      Origin = 'QTDLITRO'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryListagemVALORLITRO: TSingleField
      FieldName = 'VALORLITRO'
      Origin = 'VALORLITRO'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryListagemPERCIMPOSTO: TSingleField
      FieldName = 'PERCIMPOSTO'
      Origin = 'PERCIMPOSTO'
      Required = True
    end
    object qryListagemtotalimposto: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'totalimposto'
      Origin = '"totalimposto"'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object qryListagemtotalvenda: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'totalvenda'
      Origin = '"totalvenda"'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object qryListagemID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object qryBomba: TFDQuery
    Connection = dtmPrincipal.conDatabase
    SQL.Strings = (
      'SELECT *'
      'FROM'
      'BOMBA')
    Left = 464
    Top = 8
  end
  object dtsBomba: TDataSource
    DataSet = qryBomba
    Left = 544
    Top = 8
  end
end
