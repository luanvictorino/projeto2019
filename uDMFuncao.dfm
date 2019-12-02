inherited dmFuncao: TdmFuncao
  OldCreateOrder = True
  inherited sqlConsulta: TFDQuery
    AfterOpen = sqlConsultaAfterOpen
    SQL.Strings = (
      'SELECT * FROM FUNCAO'
      'WHERE NMFUNCAO LIKE :NMFUNCAO')
    Left = 256
    ParamData = <
      item
        Name = 'NMFUNCAO'
        DataType = ftString
        ParamType = ptInput
        Size = 150
        Value = Null
      end>
  end
  object sqlFuncao: TFDQuery
    AfterOpen = sqlFuncaoAfterOpen
    CachedUpdates = True
    Connection = Conexao
    UpdateOptions.KeyFields = 'IDFUNCAO'
    UpdateOptions.AutoIncFields = 'IDFUNCAO'
    SQL.Strings = (
      'SELECT * FROM FUNCAO'
      'WHERE IDFUNCAO = :IDFUNCAO')
    Left = 320
    Top = 8
    ParamData = <
      item
        Name = 'IDFUNCAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object sqlFuncaoIDFUNCAO: TIntegerField
      FieldName = 'IDFUNCAO'
      Origin = 'IDFUNCAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlFuncaoNMFUNCAO: TStringField
      FieldName = 'NMFUNCAO'
      Origin = 'NMFUNCAO'
      Required = True
      Size = 150
    end
  end
end
