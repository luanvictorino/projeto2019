object FrmConsultaPadrao: TFrmConsultaPadrao
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Consulta Padr'#227'o'
  ClientHeight = 442
  ClientWidth = 776
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
    Width = 776
    Height = 402
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 776
    ExplicitHeight = 402
    inherited pnlDadosConsulta: TPanel
      Width = 776
      ParentColor = True
      ExplicitWidth = 776
      inherited gbConsPadrao: TGroupBox
        Width = 754
        ExplicitWidth = 754
        inherited dfConsPadrao: TEdit
          Width = 642
          ExplicitWidth = 642
        end
        inherited btConsultar: TBitBtn
          Left = 661
          Action = actConsultar
          ExplicitLeft = 661
        end
      end
    end
    inherited pnlResultadoConsulta: TPanel
      Width = 776
      Height = 329
      ParentColor = True
      ExplicitWidth = 776
      ExplicitHeight = 329
      inherited gbResultadoConsulta: TGroupBox
        Width = 756
        Height = 317
        ExplicitWidth = 756
        ExplicitHeight = 317
        inherited grConsPadrao: TDBGrid
          Width = 752
          Height = 300
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
    Top = 402
    Width = 776
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlControles'
    ParentColor = True
    ShowCaption = False
    TabOrder = 1
    DesignSize = (
      776
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
      Left = 690
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
