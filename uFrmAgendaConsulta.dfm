inherited FrmAgendaConsulta: TFrmAgendaConsulta
  Caption = 'Consulta de Compromissos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited fmeConsulta: TFrameConsultaPadrao
    inherited pnlDadosConsulta: TPanel
      inherited gbConsPadrao: TGroupBox
        Caption = 'Consulta de Compromisso por Pessoa'
        inherited btConsultar: TBitBtn
          Action = actConsultar
        end
      end
    end
    inherited dsConsulta: TDataSource
      DataSet = dmAgenda.sqlConsulta
      Left = 582
      Top = 181
    end
  end
end
