inherited dmPais: TdmPais
  OldCreateOrder = True
  inherited sqlConsulta: TFDQuery
    AfterOpen = sqlConsultaAfterOpen
    SQL.Strings = (
      'select *'
      'from pais'
      'where nmPais like :nmPais')
    Left = 272
    ParamData = <
      item
        Name = 'NMPAIS'
        DataType = ftString
        ParamType = ptInput
        Size = 150
        Value = Null
      end>
  end
  object sqlPais: TFDQuery
    AfterOpen = sqlPaisAfterOpen
    CachedUpdates = True
    Connection = Conexao
    UpdateOptions.KeyFields = 'IDPAIS'
    UpdateOptions.AutoIncFields = 'IDPAIS'
    SQL.Strings = (
      'SELECT * FROM PAIS'
      'WHERE IDPAIS = :IDPAIS')
    Left = 120
    Top = 96
    ParamData = <
      item
        Name = 'IDPAIS'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object sqlPaisIDPAIS: TIntegerField
      FieldName = 'IDPAIS'
      Origin = 'IDPAIS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlPaisNMPAIS: TStringField
      FieldName = 'NMPAIS'
      Origin = 'NMPAIS'
      Required = True
      Size = 150
    end
  end
end
