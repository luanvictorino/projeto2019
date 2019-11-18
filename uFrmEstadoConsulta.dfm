inherited FrmEstadoConsulta: TFrmEstadoConsulta
  Caption = 'Consulta de Estado'
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited fmeConsulta: TFrameConsultaPadrao
    inherited pnlDadosConsulta: TPanel
      inherited gbConsPadrao: TGroupBox
        inherited btConsultar: TBitBtn
          Action = actConsultar
        end
      end
    end
  end
end
