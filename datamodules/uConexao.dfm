object dtmPrincipal: TdtmPrincipal
  OldCreateOrder = False
  Height = 268
  Width = 567
  object conDatabase: TFDConnection
    ConnectionName = 'sisposto'
    Params.Strings = (
      'Database=G:\DEV\SISPOSTO\bd\BANCO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'CharacterSet=UTF8'
      'DriverID=FB')
    LoginPrompt = False
    Transaction = FDTransaction1
    Left = 64
    Top = 24
  end
  object FDTransaction1: TFDTransaction
    Connection = conDatabase
    Left = 64
    Top = 80
  end
  object FDQuery1: TFDQuery
    Connection = conDatabase
    SQL.Strings = (
      'select 0')
    Left = 344
    Top = 80
    object FDQuery1teste: TStringField
      FieldKind = fkCalculated
      FieldName = 'teste'
      Size = 10
      Calculated = True
    end
  end
end
