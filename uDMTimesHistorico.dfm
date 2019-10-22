inherited dmTimesHistorico: TdmTimesHistorico
  OldCreateOrder = True
  inherited Conexao: TFDConnection
    Left = 173
    Top = 19
  end
  inherited sqlConsulta: TFDQuery
    AfterOpen = sqlConsultaAfterOpen
    SQL.Strings = (
      'SELECT PESSOA.NMPESSOA, TIMESHISTORICO.* '
      'FROM TIMESHISTORICO '
      'JOIN FUNCIONARIO '
      'ON TIMESHISTORICO.IDPESSOA = FUNCIONARIO.IDPESSOA'
      'JOIN PESSOA '
      'ON PESSOA.IDPESSOA = FUNCIONARIO.IDPESSOA'
      'JOIN TIMES'
      'ON TIMES.IDTIMES = TIMESHISTORICO.IDTIMES'
      'WHERE PESSOA.NMPESSOA LIKE :NMPESSOA;')
    Left = 243
    Top = 20
    ParamData = <
      item
        Name = 'NMPESSOA'
        DataType = ftString
        ParamType = ptInput
        Size = 150
        Value = Null
      end>
  end
  object sqlTimesHistorico: TFDQuery
    Active = True
    AfterOpen = sqlTimesHistoricoAfterOpen
    CachedUpdates = True
    Connection = Conexao
    UpdateOptions.AutoIncFields = 'IDTIMESHISTORICO'
    SQL.Strings = (
      'SELECT PESSOA.NMPESSOA, TIMES.NMTIMES, '
      'TIMESHISTORICO.*'
      'FROM TIMESHISTORICO'
      'JOIN FUNCIONARIO '
      'ON FUNCIONARIO.IDPESSOA = TIMESHISTORICO.IDPESSOA'
      'JOIN PESSOA'
      'ON PESSOA.IDPESSOA = FUNCIONARIO.IDPESSOA'
      'JOIN TIMES'
      'ON TIMES.IDTIMES = TIMESHISTORICO.IDTIMES'
      'WHERE IDTIMESHISTORICO = :IDTIMESHISTORICO')
    Left = 324
    Top = 19
    ParamData = <
      item
        Name = 'IDTIMESHISTORICO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object sqlTimesHistoricoIDTIMESHISTORICO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'IDTIMESHISTORICO'
      Origin = 'IDTIMESHISTORICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlTimesHistoricoIDPESSOA: TIntegerField
      FieldName = 'IDPESSOA'
      Origin = 'IDPESSOA'
      Required = True
    end
    object sqlTimesHistoricoIDTIMES: TIntegerField
      FieldName = 'IDTIMES'
      Origin = 'IDTIMES'
      Required = True
    end
    object sqlTimesHistoricoDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
      Origin = 'DTENTRADA'
    end
    object sqlTimesHistoricoDTSAIDA: TDateField
      FieldName = 'DTSAIDA'
      Origin = 'DTSAIDA'
    end
    object sqlTimesHistoricoNMPESSOA: TStringField
      FieldName = 'NMPESSOA'
      Origin = 'NMPESSOA'
      ProviderFlags = []
      Size = 150
    end
    object sqlTimesHistoricoNMTIMES: TStringField
      FieldName = 'NMTIMES'
      Origin = 'NMTIMES'
      ProviderFlags = []
      Size = 150
    end
  end
end
