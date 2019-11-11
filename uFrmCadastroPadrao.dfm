object FrmCadastroPadrao: TFrmCadastroPadrao
  Left = 0
  Top = 0
  Caption = 'Formul'#225'rio de Consulta e Cadastro padr'#227'o'
  ClientHeight = 375
  ClientWidth = 655
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgPadrao: TPageControl
    Left = 0
    Top = 0
    Width = 655
    Height = 375
    ActivePage = tsCadastroPadrao
    Align = alClient
    TabOrder = 0
    object tsConsPadrao: TTabSheet
      Caption = 'Consulta'
      object pnConsPadrao: TPanel
        Left = 0
        Top = 312
        Width = 647
        Height = 35
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object btNovo: TBitBtn
          Left = 4
          Top = 4
          Width = 75
          Height = 25
          Caption = '&Novo'
          TabOrder = 0
          OnClick = btNovoClick
        end
      end
    end
    object tsCadastroPadrao: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object pnCadastroPadrao: TPanel
        Left = 0
        Top = 306
        Width = 647
        Height = 41
        Align = alBottom
        TabOrder = 0
        object btSalvar: TBitBtn
          Left = 3
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Salvar'
          TabOrder = 0
          OnClick = btSalvarClick
        end
        object btCancelar: TBitBtn
          Left = 84
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Cancelar'
          TabOrder = 1
          OnClick = btCancelarClick
        end
        object btExcluir: TBitBtn
          Left = 165
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Excluir'
          TabOrder = 2
          OnClick = btExcluirClick
        end
      end
    end
  end
  object dsCadastro: TDataSource
    OnStateChange = dsCadastroStateChange
    Left = 492
    Top = 96
  end
end
