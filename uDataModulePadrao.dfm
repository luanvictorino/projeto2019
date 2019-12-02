object DataModulePadrao: TDataModulePadrao
  OldCreateOrder = False
  Height = 264
  Width = 395
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=C:\Projeto2019\BD\PROJETO2019.FDB'
      'User_Name=SYSDBA'
      'Password=SYSDBA'
      'DriverID=FB')
    LoginPrompt = False
    Left = 183
    Top = 8
  end
  object sqlConsulta: TFDQuery
    Connection = Conexao
    Left = 248
    Top = 8
  end
end
