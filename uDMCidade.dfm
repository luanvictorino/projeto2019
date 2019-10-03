inherited dmCidade: TdmCidade
  OldCreateOrder = True
  inherited Conexao: TFDConnection
    Top = 16
  end
  inherited sqlConsulta: TFDQuery
    AfterOpen = sqlConsultaAfterOpen
    SQL.Strings = (
      'select *'
      'from cidade'
      'where nmCidade like :nmCidade')
    ParamData = <
      item
        Name = 'NMCIDADE'
        ParamType = ptInput
      end>
  end
  object sqlCidade: TFDQuery
    AfterOpen = sqlCidadeAfterOpen
    CachedUpdates = True
    Connection = Conexao
    UpdateOptions.AutoIncFields = 'IDCIDADE'
    SQL.Strings = (
      'select CIDADE.*'
      '     , ESTADO.NMESTADO'
      'from CIDADE'
      '  left join ESTADO on ESTADO.IDESTADO = CIDADE.IDESTADO'
      'where idCidade = :idCidade')
    Left = 64
    Top = 88
    ParamData = <
      item
        Name = 'IDCIDADE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object sqlCidadeIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Origin = 'IDCIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlCidadeNMCIDADE: TStringField
      FieldName = 'NMCIDADE'
      Origin = 'NMCIDADE'
      Required = True
      Size = 150
    end
    object sqlCidadeIDESTADO: TIntegerField
      FieldName = 'IDESTADO'
      Origin = 'IDESTADO'
      Required = True
    end
    object sqlCidadeNMESTADO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NMESTADO'
      Origin = 'NMESTADO'
      ProviderFlags = []
      Size = 150
    end
  end
end
