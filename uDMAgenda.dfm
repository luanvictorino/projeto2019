inherited dmAgenda: TdmAgenda
  OldCreateOrder = True
  inherited sqlConsulta: TFDQuery
    Active = True
    AfterOpen = sqlConsultaAfterOpen
    SQL.Strings = (
      'select agenda.*, pessoa.nmPessoa from agenda'
      'inner join pessoa on agenda.idPessoa = pessoa.idPessoa'
      'where nmPessoa like :nmPessoa')
    Left = 328
    Top = 8
    ParamData = <
      item
        Name = 'NMPESSOA'
        DataType = ftString
        ParamType = ptInput
        Size = 150
        Value = Null
      end>
  end
  object sqlAgenda: TFDQuery
    AfterOpen = sqlAgendaAfterOpen
    CachedUpdates = True
    Indexes = <
      item
        Active = True
        Selected = True
        Name = 'IDX_NMPESSOA'
        Fields = 'IDPESSOA;NMPESSOA'
        DescFields = 'NMPESSOA'
      end>
    IndexName = 'IDX_NMPESSOA'
    Connection = Conexao
    UpdateOptions.AutoIncFields = 'IDAGENDA'
    SQL.Strings = (
      'select agenda.*'
      '     , pessoa.nmPessoa'
      'from agenda'
      '  left join pessoa on pessoa.idPessoa = agenda.idPessoa'
      'where idAgenda = :idAgenda')
    Left = 248
    Top = 8
    ParamData = <
      item
        Name = 'IDAGENDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object sqlAgendaIDAGENDA: TIntegerField
      FieldName = 'IDAGENDA'
      Origin = 'IDAGENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlAgendaIDPESSOA: TIntegerField
      FieldName = 'IDPESSOA'
      Origin = 'IDPESSOA'
      Required = True
    end
    object sqlAgendaNMDESCRICAO: TStringField
      FieldName = 'NMDESCRICAO'
      Origin = 'NMDESCRICAO'
      Required = True
      Size = 250
    end
    object sqlAgendaDTDATA: TDateField
      FieldName = 'DTDATA'
      Origin = 'DTDATA'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object sqlAgendaHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'HORA'
      EditMask = '!90:00;1;_'
    end
    object sqlAgendaNMPESSOA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NMPESSOA'
      Origin = 'NMPESSOA'
      ProviderFlags = []
      Size = 150
    end
  end
end
