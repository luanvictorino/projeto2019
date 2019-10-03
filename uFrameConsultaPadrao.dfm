object FrameConsultaPadrao: TFrameConsultaPadrao
  Left = 0
  Top = 0
  Width = 633
  Height = 281
  TabOrder = 0
  object pnlDadosConsulta: TPanel
    Left = 0
    Top = 0
    Width = 633
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pnlDadosConsulta'
    ShowCaption = False
    TabOrder = 0
    DesignSize = (
      633
      73)
    object gbConsPadrao: TGroupBox
      Left = 9
      Top = 8
      Width = 611
      Height = 58
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Consulta de Padrao por Nome'
      TabOrder = 0
      DesignSize = (
        611
        58)
      object dfConsPadrao: TEdit
        Left = 13
        Top = 24
        Width = 499
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 0
      end
      object btConsultar: TBitBtn
        Left = 520
        Top = 22
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&Consultar'
        Default = True
        TabOrder = 1
        OnClick = btConsultarClick
      end
    end
  end
  object pnlResultadoConsulta: TPanel
    Left = 0
    Top = 73
    Width = 633
    Height = 208
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 1
    DesignSize = (
      633
      208)
    object gbResultadoConsulta: TGroupBox
      Left = 9
      Top = 1
      Width = 613
      Height = 196
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Resultado da Consulta'
      TabOrder = 0
      object grConsPadrao: TDBGrid
        Left = 2
        Top = 15
        Width = 609
        Height = 179
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        DataSource = dsConsulta
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = grConsPadraoDblClick
      end
    end
  end
  object dsConsulta: TDataSource
    Left = 558
    Top = 69
  end
end
