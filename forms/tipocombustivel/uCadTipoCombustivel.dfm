inherited frmCadTipoCombustivel: TfrmCadTipoCombustivel
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlTitulo: TPanel
    inherited lblTitulo: TLabel
      Width = 229
      Caption = 'TIPOS DE COMBUST'#205'VEL'
      ExplicitWidth = 229
    end
    inherited imgIcon: TImage
      Picture.Data = {
        055449636F6E0000010001002020100000000000E80200001600000028000000
        2000000040000000010004000000000080020000000000000000000000000000
        0000000000000000000080000080000000808000800000008000800080800000
        80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF0000000000000000000000000000000000000000000000000000000000
        0000000000000000000008888800000000000000000000000008844444880000
        0000000000000000008447777744800000000000000000000844444444444800
        0000000000000000844444444444448000000000000000008444444444444480
        000000000000000844444E444444444800000000000000084444E44444444448
        0000000000000008444E6E44444444480000000000000008444CECECCCCC4448
        00000000000000084CCE6ECCCCCCCC4800000000000000008CCCE6ECCCCCCC80
        000000000000000088FCCECCCCCCF8800000000000000000088F8F8F8F8F8800
        00000000000000000088FFF8F8F88000000000000000000000088FFF8F880000
        0000000000000000000088FFF8800000000000000000000000007F8F8F700000
        0000000000000000000008FFF800000000000000000000000000088F88000000
        0000000000000000000008FFF800000000000000000000000000088F88000000
        0000000000000000000008FFF800000000000000000000000000088F88000000
        0000000000000000000008F87700000000000000000000000007888888870000
        0000000000000000000887777788000000000000000000000007788888770000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000FFFFFFFFFFF83FFFFFE00FFFFFC007FFFF8003FFFF0001FFFE0000FF
        FE0000FFFC00007FFC00007FFC00007FFC00007FFC00007FFE0000FFFE0000FF
        FF0001FFFF8003FFFFC007FFFFE00FFFFFE00FFFFFF01FFFFFF01FFFFFF01FFF
        FFF01FFFFFF01FFFFFF01FFFFFE00FFFFFC007FFFFC007FFFFC007FFFFE00FFF
        FFFFFFFF}
    end
  end
  inherited pnlBotoes: TPanel
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgcPrincipal: TPageControl
    inherited tabManutencao: TTabSheet
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
      object fld_valorlitro: TLabeledEdit
        Tag = 3
        Left = 40
        Top = 103
        Width = 97
        Height = 24
        EditLabel.Width = 60
        EditLabel.Height = 13
        EditLabel.Caption = 'Pre'#231'o (R$)'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        TabOrder = 1
        OnKeyPress = LabeledEdit1KeyPress
      end
    end
  end
  inherited qryListagem: TFDQuery
    Connection = dtmPrincipal.conDatabase
    SQL.Strings = (
      'SELECT'
      '  TIPOCOMBUSTIVEL.DESCRICAO,'
      '  TIPOCOMBUSTIVEL.VALORLITRO,'
      '  TIPOCOMBUSTIVEL.ID'
      'FROM'
      '  TIPOCOMBUSTIVEL')
  end
end