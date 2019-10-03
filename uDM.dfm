object DM: TDM
  OldCreateOrder = False
  Height = 305
  Width = 559
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=C:\Projeto2019\BD\PROJETO2019.FDB'
      'User_Name=SYSDBA'
      'Password=SYSDBA'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 304
    Top = 8
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 384
    Top = 8
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 488
    Top = 8
  end
  object qyPessoa: TFDQuery
    BeforePost = qyPessoaBeforePost
    AfterPost = qyPessoaAfterPost
    AfterDelete = qyPessoaAfterDelete
    CachedUpdates = True
    Connection = Conexao
    SchemaAdapter = PessoaSchemaAdapter
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'SELECT * FROM PESSOA'
      'WHERE IDPESSOA = :IDPESSOA')
    Left = 32
    Top = 24
    ParamData = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qyPessoaIDPESSOA: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'IDPESSOA'
      Origin = 'IDPESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qyPessoaNMPESSOA: TStringField
      FieldName = 'NMPESSOA'
      Origin = 'NMPESSOA'
      Required = True
      Size = 150
    end
    object qyPessoaNUTELEFONE: TStringField
      FieldName = 'NUTELEFONE'
      Origin = 'NUTELEFONE'
      EditMask = '!\(99\) 0000-0000;1;_'
      Size = 15
    end
    object qyPessoaNUCELULAR: TStringField
      FieldName = 'NUCELULAR'
      Origin = 'NUCELULAR'
      EditMask = '!\(99\) 00000-0000;1;_'
      Size = 15
    end
    object qyPessoaDEEMAIL: TStringField
      FieldName = 'DEEMAIL'
      Origin = 'DEEMAIL'
      Size = 150
    end
    object qyPessoaIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Origin = 'IDCIDADE'
      Required = True
    end
  end
  object dsPessoa: TDataSource
    DataSet = qyPessoa
    Left = 24
    Top = 88
  end
  object PessoaSchemaAdapter: TFDSchemaAdapter
    Left = 112
    Top = 88
  end
  object qyFuncionario: TFDQuery
    BeforeInsert = qyFuncionarioBeforeInsert
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
      'SELECT * FROM FUNCIONARIO'
      'WHERE IDPESSOA = :IDPESSOA')
    Left = 104
    Top = 24
    ParamData = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qyFuncionarioIDPESSOA: TIntegerField
      FieldName = 'IDPESSOA'
      Origin = 'IDPESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qyFuncionarioIDFUNCAO: TIntegerField
      FieldName = 'IDFUNCAO'
      Origin = 'IDFUNCAO'
    end
    object qyFuncionarioDTADMISSAO: TDateField
      FieldName = 'DTADMISSAO'
      Origin = 'DTADMISSAO'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object qyFuncionarioDTNASCIMENTO: TDateField
      FieldName = 'DTNASCIMENTO'
      Origin = 'DTNASCIMENTO'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
  end
  object qyBusca: TFDQuery
    Connection = Conexao
    Left = 224
    Top = 240
  end
  object qyCidade: TFDQuery
    AfterOpen = qyCidadeAfterOpen
    CachedUpdates = True
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM CIDADE '
      'WHERE IDCIDADE = :IDCIDADE')
    Left = 40
    Top = 168
    ParamData = <
      item
        Name = 'IDCIDADE'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qyCidadeIDCIDADE: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      FieldName = 'IDCIDADE'
      Origin = 'IDCIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qyCidadeNMCIDADE: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 70
      FieldName = 'NMCIDADE'
      Origin = 'NMCIDADE'
      Required = True
      Size = 150
    end
    object qyCidadeIDESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'IDESTADO'
      Origin = 'IDESTADO'
      Required = True
    end
  end
  object qyUltimo: TFDQuery
    Connection = Conexao
    Left = 400
    Top = 240
  end
  object qyConsultaCidade: TFDQuery
    AfterOpen = qyConsultaCidadeAfterOpen
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM CIDADE')
    Left = 40
    Top = 240
  end
  object qyConsFuncao: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM FUNCAO')
    Left = 400
    Top = 160
    object qyConsFuncaoIDFUNCAO: TIntegerField
      FieldName = 'IDFUNCAO'
      Origin = 'IDFUNCAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qyConsFuncaoNMFUNCAO: TStringField
      FieldName = 'NMFUNCAO'
      Origin = 'NMFUNCAO'
      Required = True
      Size = 150
    end
  end
  object qyConsPessoa: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM PESSOA')
    Left = 496
    Top = 240
    object qyConsPessoaIDPESSOA: TIntegerField
      FieldName = 'IDPESSOA'
      Origin = 'IDPESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qyConsPessoaNMPESSOA: TStringField
      FieldName = 'NMPESSOA'
      Origin = 'NMPESSOA'
      Required = True
      Size = 150
    end
    object qyConsPessoaNUTELEFONE: TStringField
      FieldName = 'NUTELEFONE'
      Origin = 'NUTELEFONE'
      Size = 15
    end
    object qyConsPessoaNUCELULAR: TStringField
      FieldName = 'NUCELULAR'
      Origin = 'NUCELULAR'
      Size = 15
    end
    object qyConsPessoaDEEMAIL: TStringField
      FieldName = 'DEEMAIL'
      Origin = 'DEEMAIL'
      Size = 150
    end
    object qyConsPessoaIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Origin = 'IDCIDADE'
      Required = True
    end
  end
  object qyConsEstado: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM ESTADO')
    Left = 496
    Top = 168
    object qyConsEstadoIDESTADO: TIntegerField
      FieldName = 'IDESTADO'
      Origin = 'IDESTADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qyConsEstadoNMESTADO: TStringField
      FieldName = 'NMESTADO'
      Origin = 'NMESTADO'
      Required = True
      Size = 150
    end
    object qyConsEstadoUFESTADO: TStringField
      FieldName = 'UFESTADO'
      Origin = 'UFESTADO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qyConsEstadoIDPAIS: TIntegerField
      FieldName = 'IDPAIS'
      Origin = 'IDPAIS'
      Required = True
    end
  end
  object qyPais: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM PAIS'
      'WHERE IDPAIS = :IDPAIS')
    Left = 136
    Top = 169
    ParamData = <
      item
        Name = 'IDPAIS'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qyConsultaPais: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM PAIS')
    Left = 136
    Top = 240
  end
end
