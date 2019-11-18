inherited FrmTimeConsulta: TFrmTimeConsulta
  Caption = 'Consulta de Time'
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
