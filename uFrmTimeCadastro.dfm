inherited FrmTimeCadastro: TFrmTimeCadastro
  Caption = 'Cadastro de Time'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgPadrao: TPageControl
    ActivePage = tsCadastroPadrao
    inherited tsConsPadrao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 647
      ExplicitHeight = 347
    end
    inherited tsCadastroPadrao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 647
      ExplicitHeight = 347
      object lbCdTimes: TLabel [0]
        Left = 12
        Top = 5
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = dfCdTimes
      end
      object lbNmTimes: TLabel [1]
        Left = 12
        Top = 45
        Width = 28
        Height = 13
        Caption = 'Time*'
        FocusControl = dfNmTimes
      end
      object dfCdTimes: TDBEdit
        Left = 12
        Top = 20
        Width = 50
        Height = 21
        DataField = 'IDTIMES'
        DataSource = dsCadastro
        TabOrder = 1
      end
      object dfNmTimes: TDBEdit
        Left = 12
        Top = 60
        Width = 616
        Height = 21
        DataField = 'NMTIMES'
        DataSource = dsCadastro
        TabOrder = 2
      end
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmTimes.sqlTimes
    Left = 604
    Top = 112
  end
end
