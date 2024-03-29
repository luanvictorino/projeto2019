inherited dmPessoa: TdmPessoa
  OldCreateOrder = True
  Width = 522
  inherited Conexao: TFDConnection
    Left = 159
    Top = 24
  end
  inherited sqlConsulta: TFDQuery
    AfterOpen = sqlConsultaAfterOpen
    SQL.Strings = (
      'select *'
      'from pessoa'
      'where nmPessoa like :nmPessoa')
    Left = 96
    Top = 24
    ParamData = <
      item
        Name = 'NMPESSOA'
        DataType = ftString
        ParamType = ptInput
        Size = 150
        Value = Null
      end>
  end
  object sqlPessoa: TFDQuery
    AfterOpen = sqlPessoaAfterOpen
    CachedUpdates = True
    Connection = Conexao
    SchemaAdapter = PessoaSchemaAdapter
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    UpdateOptions.AutoIncFields = 'IDPESSOA'
    SQL.Strings = (
      'select PESSOA.*'
      '     , CIDADE.NMCIDADE'
      'from PESSOA'
      '  left join CIDADE on CIDADE.IDCIDADE = PESSOA.IDCIDADE'
      'where IDPESSOA = :IDPESSOA')
    Left = 224
    Top = 24
    ParamData = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object sqlPessoaIDPESSOA: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'IDPESSOA'
      Origin = 'IDPESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object sqlPessoaNMPESSOA: TStringField
      FieldName = 'NMPESSOA'
      Origin = 'NMPESSOA'
      Required = True
      Size = 150
    end
    object sqlPessoaNUTELEFONE: TStringField
      FieldName = 'NUTELEFONE'
      Origin = 'NUTELEFONE'
      EditMask = '!\(99\)0000-0000;1;_'
      Size = 15
    end
    object sqlPessoaNUCELULAR: TStringField
      FieldName = 'NUCELULAR'
      Origin = 'NUCELULAR'
      EditMask = '!\(99\) 00000-0000;1;_'
      Size = 15
    end
    object sqlPessoaDEEMAIL: TStringField
      FieldName = 'DEEMAIL'
      Origin = 'DEEMAIL'
      Size = 150
    end
    object sqlPessoaIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Origin = 'IDCIDADE'
      Required = True
    end
    object sqlPessoaNMCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NMCIDADE'
      Origin = 'NMCIDADE'
      ProviderFlags = []
      Size = 150
    end
    object sqlPessoaDTNASCIMENTO: TDateField
      FieldName = 'DTNASCIMENTO'
      Origin = 'DTNASCIMENTO'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object sqlFuncionario: TFDQuery
    CachedUpdates = True
    IndexFieldNames = 'IDPESSOA'
    MasterSource = dsPessoa
    MasterFields = 'IDPESSOA'
    DetailFields = 'IDPESSOA'
    Connection = Conexao
    SchemaAdapter = PessoaSchemaAdapter
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'select FUNCIONARIO.*'
      '     , FUNCAO.NMFUNCAO'
      'from FUNCIONARIO'
      '  left join FUNCAO on FUNCIONARIO.IDFUNCAO = FUNCAO.IDFUNCAO'
      'where IDPESSOA = :IDPESSOA')
    Left = 312
    Top = 24
    ParamData = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object sqlFuncionarioIDPESSOA: TIntegerField
      FieldName = 'IDPESSOA'
      Origin = 'IDPESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlFuncionarioIDFUNCAO: TIntegerField
      FieldName = 'IDFUNCAO'
      Origin = 'IDFUNCAO'
    end
    object sqlFuncionarioDTADMISSAO: TDateField
      FieldName = 'DTADMISSAO'
      Origin = 'DTADMISSAO'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object sqlFuncionarioNMFUNCAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NMFUNCAO'
      Origin = 'NMFUNCAO'
      ProviderFlags = []
      Size = 150
    end
    object sqlFuncionarioDTDEMISSAO: TDateField
      FieldName = 'DTDEMISSAO'
      Origin = 'DTDEMISSAO'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object PessoaSchemaAdapter: TFDSchemaAdapter
    Left = 220
    Top = 142
  end
  object dsPessoa: TDataSource
    DataSet = sqlPessoa
    Left = 224
    Top = 80
  end
  object sqlTimesHistorico: TFDQuery
    AfterOpen = sqlTimesHistoricoAfterOpen
    CachedUpdates = True
    Indexes = <
      item
        Active = True
        Selected = True
        Name = 'IDX_PESSOA_SAIDA'
        Fields = 'IDPESSOA;DTSAIDA'
        DescFields = 'DTSAIDA'
      end>
    IndexName = 'IDX_PESSOA_SAIDA'
    MasterSource = dsFuncionario
    MasterFields = 'IDPESSOA'
    DetailFields = 'IDPESSOA'
    Connection = Conexao
    SchemaAdapter = PessoaSchemaAdapter
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    UpdateOptions.AutoIncFields = 'IDTIMESHISTORICO'
    SQL.Strings = (
      'select TIMESHISTORICO.*'
      '     , TIMES.NMTIMES'
      'from TIMESHISTORICO'
      '  left join TIMES on TIMESHISTORICO.IDTIMES = TIMES.IDTIMES'
      'where IDPESSOA = :IDPESSOA')
    Left = 400
    Top = 23
    ParamData = <
      item
        Name = 'IDPESSOA'
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
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object sqlTimesHistoricoDTSAIDA: TDateField
      FieldName = 'DTSAIDA'
      Origin = 'DTSAIDA'
    end
    object sqlTimesHistoricoNMTIMES: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NMTIMES'
      Origin = 'NMTIMES'
      ProviderFlags = []
      Size = 150
    end
  end
  object dsFuncionario: TDataSource
    DataSet = sqlFuncionario
    Left = 312
    Top = 80
  end
end
