object frmMenu: TfrmMenu
  Left = 0
  Top = 0
  Caption = 'SisPosto v0.1 (Demonstra'#231#227'o)'
  ClientHeight = 437
  ClientWidth = 718
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 352
    Top = 232
    object Sistema1: TMenuItem
      Caption = '&Sistema'
      object Configuraodosistema1: TMenuItem
        Caption = '&Configura'#231#227'o do sistema'
        OnClick = Configuraodosistema1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = '&Sair'
        OnClick = Sair1Click
      end
    end
    object Cadastros1: TMenuItem
      Caption = '&Cadastros'
      object iposdecombustvel1: TMenuItem
        Caption = '&Tipos de combust'#237'vel'
        OnClick = iposdecombustvel1Click
      end
      object anques1: TMenuItem
        Caption = 'Tanques'
        OnClick = anques1Click
      end
      object Bombas1: TMenuItem
        Caption = 'Bombas'
        OnClick = Bombas1Click
      end
    end
    object Venda1: TMenuItem
      Caption = '&Venda'
      object Efetuarvenda1: TMenuItem
        Caption = '&Registros de vendas'
        OnClick = Efetuarvenda1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Listagemdostiposdecombustvel1: TMenuItem
        Caption = 'Listagem dos tipos de combust'#237'vel'
        OnClick = Listagemdostiposdecombustvel1Click
      end
      object Listagemdostanques1: TMenuItem
        Caption = 'Listagem dos tanques'
        OnClick = Listagemdostanques1Click
      end
      object Listagemdasbombas1: TMenuItem
        Caption = 'Listagem das &bombas'
        OnClick = Listagemdasbombas1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Vendasporperodo1: TMenuItem
        Caption = 'Vendas por per'#237'odo'
        OnClick = Vendasporperodo1Click
      end
    end
  end
end
