inherited frmCadBomba: TfrmCadBomba
  ExplicitTop = -28
  ExplicitWidth = 846
  ExplicitHeight = 471
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlTitulo: TPanel
    inherited lblTitulo: TLabel
      Left = 56
      Width = 84
      Caption = 'BOMBAS'
      ExplicitLeft = 56
      ExplicitWidth = 84
    end
    inherited imgIcon: TImage
      Picture.Data = {
        055449636F6E0000010001002020100000000000E80200001600000028000000
        2000000040000000010004000000000080020000000000000000000000000000
        0000000000000000000080000080000000808000800000008000800080800000
        80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF0000000000000000000000000000000000000000000000007777770000
        0000000000000000000000000007000000000000000000000000000000070000
        0000000000000000000000777007000000000000000000077070007770070000
        7000000000000077000700787000000007000000000007708000077877000070
        00700000000007088807777777770777000700000000008F88877FFFFF077887
        70070000000000088888F88888FF08870070000000000000880888877778F070
        00700000000777088888880007778F770077777000700008F088007777077F07
        000000700700008F08880800077778F7700000700708888F0880F08F807078F7
        777700700708F88F0780F070F07078F7887700700708888F0780F077807088F7
        777700700700008F0788FF00080888F77000007000000008F0780FFFF0088F77
        0070000000000008F07788000888887700700000000000008F07788888880870
        00700000000000088FF0077788088887000700000000008F888FF00000F87887
        7007000000000708F8088FFFFF88078700700000000007708000088888000070
        0700000000000077007000888007000070000000000000077700008F80070007
        0000000000000000000000888007000000000000000000000000000000070000
        0000000000000000000007777777000000000000000000000000000000000000
        00000000FFFFFFFFFFFC0FFFFFFC0FFFFFF80FFFFFF80FFFFE180E7FFC00043F
        F800001FF800000FF800000FFC00001FFE00001FE0000001C000000180000001
        80000001800000018000000180000001FC00001FFC00001FFE00001FFC00000F
        F800000FF800001FF800003FFC180C7FFE380EFFFFF80FFFFFF80FFFFFF80FFF
        FFFFFFFF}
    end
  end
  inherited pnlBotoes: TPanel
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgcPrincipal: TPageControl
    inherited tabListagem: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 27
      ExplicitWidth = 832
      ExplicitHeight = 311
    end
    inherited tabManutencao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 27
      ExplicitWidth = 832
      ExplicitHeight = 311
      object Label1: TLabel
        Left = 40
        Top = 84
        Width = 38
        Height = 13
        Caption = 'Tanque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object fld_descricao: TLabeledEdit
        Tag = 2
        Left = 40
        Top = 40
        Width = 289
        Height = 24
        EditLabel.Width = 49
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        MaxLength = 50
        TabOrder = 0
      end
      object fld_tanque: TDBLookupComboBox
        Tag = 2
        Left = 40
        Top = 100
        Width = 209
        Height = 24
        Hint = 'Tanque'
        KeyField = 'ID'
        ListField = 'DESCRICAO'
        ListSource = dtsTanque
        TabOrder = 1
      end
    end
  end
  inherited qryListagem: TFDQuery
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
  object dtsTanque: TDataSource
    DataSet = qryTanque
    Left = 544
    Top = 8
  end
  object qryTanque: TFDQuery
    Connection = dtmPrincipal.conDatabase
    SQL.Strings = (
      'SELECT *'
      'FROM'
      'TANQUE')
    Left = 464
    Top = 8
  end
end
