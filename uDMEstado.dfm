inherited dmEstado: TdmEstado
  OldCreateOrder = True
  inherited Conexao: TFDConnection
    Connected = True
  end
  inherited sqlConsulta: TFDQuery
    AfterOpen = sqlConsultaAfterOpen
    SQL.Strings = (
      'select *'
      'from estado'
      'where nmEstado like :nmEstado')
    Left = 272
    ParamData = <
      item
        Name = 'NMESTADO'
        DataType = ftString
        ParamType = ptInput
        Size = 150
        Value = Null
      end>
  end
  object sqlEstado: TFDQuery
    AfterOpen = sqlEstadoAfterOpen
    CachedUpdates = True
    Connection = Conexao
    UpdateOptions.AutoIncFields = 'IDESTADO'
    SQL.Strings = (
      'select ESTADO.*'
      '     , PAIS.NMPAIS'
      'from ESTADO'
      '  left join PAIS on PAIS.IDPAIS = ESTADO.IDPAIS'
      'where IDESTADO = :IDESTADO')
    Left = 96
    Top = 80
    ParamData = <
      item
        Name = 'IDESTADO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object sqlEstadoIDESTADO: TIntegerField
      FieldName = 'IDESTADO'
      Origin = 'IDESTADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlEstadoNMESTADO: TStringField
      FieldName = 'NMESTADO'
      Origin = 'NMESTADO'
      Required = True
      Size = 150
    end
    object sqlEstadoUFESTADO: TStringField
      FieldName = 'UFESTADO'
      Origin = 'UFESTADO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object sqlEstadoIDPAIS: TIntegerField
      FieldName = 'IDPAIS'
      Origin = 'IDPAIS'
      Required = True
    end
    object sqlEstadoNMPAIS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NMPAIS'
      Origin = 'NMPAIS'
      ProviderFlags = []
      Size = 150
    end
  end
end
