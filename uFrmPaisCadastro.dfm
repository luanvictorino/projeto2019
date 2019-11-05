inherited FrmPaisCadastro: TFrmPaisCadastro
  Caption = 'Cadastro de Pa'#237's'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgPadrao: TPageControl
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
      object lbCdPais: TLabel [0]
        Left = 12
        Top = 5
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = dfCdPais
      end
      object lbNmPais: TLabel [1]
        Left = 12
        Top = 45
        Width = 25
        Height = 13
        Caption = 'Pa'#237's*'
        FocusControl = dfNmPais
      end
      object dfCdPais: TDBEdit
        Left = 12
        Top = 20
        Width = 50
        Height = 21
        DataField = 'IDPAIS'
        DataSource = dsCadastro
        Enabled = False
        TabOrder = 1
      end
      object dfNmPais: TDBEdit
        Left = 12
        Top = 60
        Width = 616
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NMPAIS'
        DataSource = dsCadastro
        TabOrder = 2
      end
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmPais.sqlPais
  end
end
