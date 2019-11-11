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
  end
end
