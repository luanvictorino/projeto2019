object FrmConsultaPadrao: TFrmConsultaPadrao
  Left = 0
  Top = 0
  Caption = 'Consulta Padr'#227'o'
  ClientHeight = 432
  ClientWidth = 766
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inline fmeConsulta: TFrameConsultaPadrao
    Left = 0
    Top = 0
    Width = 766
    Height = 392
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 766
    ExplicitHeight = 392
    inherited pnlDadosConsulta: TPanel
      Width = 766
      ParentColor = True
      ExplicitWidth = 766
      inherited gbConsPadrao: TGroupBox
        Width = 744
        ExplicitWidth = 744
        inherited dfConsPadrao: TEdit
          Width = 632
          ExplicitWidth = 632
        end
        inherited btConsultar: TBitBtn
          Left = 651
          Action = actConsultar
          ExplicitLeft = 651
        end
      end
    end
    inherited pnlResultadoConsulta: TPanel
      Width = 766
      Height = 319
      ParentColor = True
      ExplicitWidth = 766
      ExplicitHeight = 319
      inherited gbResultadoConsulta: TGroupBox
        Width = 746
        Height = 307
        ExplicitWidth = 746
        ExplicitHeight = 307
        inherited grConsPadrao: TDBGrid
          Width = 742
          Height = 290
        end
      end
    end
    inherited dsConsulta: TDataSource
      Left = 630
      Top = 141
    end
  end
  object pnlControles: TPanel
    Left = 0
    Top = 392
    Width = 766
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlControles'
    ParentColor = True
    ShowCaption = False
    TabOrder = 1
    DesignSize = (
      766
      40)
    object btnSelecionar: TButton
      Left = 11
      Top = 6
      Width = 75
      Height = 25
      Action = actSelecionar
      TabOrder = 0
    end
    object btnFechar: TButton
      Left = 680
      Top = 6
      Width = 75
      Height = 25
      Action = actFechar
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
  end
  object actConsultaPadrao: TActionList
    Left = 208
    Top = 208
    object actConsultar: TAction
      Caption = '&Consultar'
      ShortCut = 114
      OnExecute = actConsultarExecute
    end
    object actSelecionar: TAction
      Caption = '&Selecionar'
      ShortCut = 16397
      OnExecute = actSelecionarExecute
    end
    object actFechar: TAction
      Caption = '&Fechar'
      ShortCut = 27
      OnExecute = actFecharExecute
    end
  end
end
