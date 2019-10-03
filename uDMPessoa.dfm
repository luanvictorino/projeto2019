inherited dmPessoa: TdmPessoa
  OldCreateOrder = True
  inherited Conexao: TFDConnection
    Left = 159
    Top = 24
  end
  inherited sqlConsulta: TFDQuery
    Left = 256
    Top = 32
  end
  object sqlPessoa: TFDQuery
    CachedUpdates = True
    Connection = Conexao
    SchemaAdapter = PessoaSchemaAdapter
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'SELECT * FROM PESSOA'
      'WHERE IDPESSOA = :IDPESSOA')
    Left = 328
    Top = 32
    ParamData = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object sqlPessoaIDPESSOA: TIntegerField
      FieldName = 'IDPESSOA'
      Origin = 'IDPESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
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
      Size = 15
    end
    object sqlPessoaNUCELULAR: TStringField
      FieldName = 'NUCELULAR'
      Origin = 'NUCELULAR'
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
    SQL.Strings = (
      'SELECT * FROM FUNCIONARIO'
      'WHERE IDPESSOA = :IDPESSOA')
    Left = 328
    Top = 104
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
    end
    object sqlFuncionarioDTNASCIMENTO: TDateField
      FieldName = 'DTNASCIMENTO'
      Origin = 'DTNASCIMENTO'
      Required = True
    end
  end
  object PessoaSchemaAdapter: TFDSchemaAdapter
    Left = 220
    Top = 102
  end
  object dsPessoa: TDataSource
    DataSet = sqlPessoa
    Left = 280
    Top = 184
  end
end
