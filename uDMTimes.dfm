inherited dmTimes: TdmTimes
  OldCreateOrder = True
  inherited sqlConsulta: TFDQuery
    AfterOpen = sqlConsultaAfterOpen
    SQL.Strings = (
      'SELECT * FROM TIMES'
      'WHERE NMTIMES LIKE :NMTIMES')
    Top = 8
    ParamData = <
      item
        Name = 'NMTIMES'
        DataType = ftString
        ParamType = ptInput
        Size = 150
        Value = Null
      end>
  end
  object sqlTimes: TFDQuery
    AfterOpen = sqlTimesAfterOpen
    CachedUpdates = True
    Connection = Conexao
    UpdateOptions.KeyFields = 'IDTIMES'
    UpdateOptions.AutoIncFields = 'IDTIMES'
    SQL.Strings = (
      'SELECT * FROM TIMES'
      'WHERE IDTIMES = :IDTIMES')
    Left = 328
    Top = 8
    ParamData = <
      item
        Name = 'IDTIMES'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object sqlTimesIDTIMES: TIntegerField
      FieldName = 'IDTIMES'
      Origin = 'IDTIMES'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlTimesNMTIMES: TStringField
      FieldName = 'NMTIMES'
      Origin = 'NMTIMES'
      Size = 150
    end
  end
end
