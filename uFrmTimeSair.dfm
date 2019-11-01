object FrmTimeSair: TFrmTimeSair
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Sair do Time'
  ClientHeight = 105
  ClientWidth = 189
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnTimeSair: TPanel
    Left = 0
    Top = 0
    Width = 189
    Height = 105
    Align = alClient
    TabOrder = 0
    object lbDtsaida: TLabel
      Left = 16
      Top = 13
      Width = 67
      Height = 13
      Caption = 'Data de Sa'#237'da'
    end
    object dfDtSaida: TDBEdit
      Left = 16
      Top = 28
      Width = 156
      Height = 21
      DataField = 'DTSAIDA'
      DataSource = dsTimesHistorico
      TabOrder = 0
    end
    object btConfirmar: TButton
      Left = 16
      Top = 66
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 1
      OnClick = btConfirmarClick
    end
    object btCancelar: TButton
      Left = 97
      Top = 66
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btCancelarClick
    end
  end
  object dsTimesHistorico: TDataSource
    DataSet = dmPessoa.sqlTimesHistorico
    Left = 144
    Top = 56
  end
end
