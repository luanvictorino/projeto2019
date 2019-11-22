inherited FrmFuncaoCadastro: TFrmFuncaoCadastro
  Caption = 'Cadastro de fun'#231#227'o'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgPadrao: TPageControl
    inherited tsConsPadrao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 657
      ExplicitHeight = 357
      inherited pnConsPadrao: TPanel
        Top = 322
        Width = 657
        ExplicitTop = 322
        ExplicitWidth = 657
      end
    end
    inherited tsCadastroPadrao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 657
      ExplicitHeight = 357
      object lbCdFuncao: TLabel [0]
        Left = 12
        Top = 5
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = dfCdFuncao
      end
      object lbNmFuncao: TLabel [1]
        Left = 12
        Top = 45
        Width = 41
        Height = 13
        Caption = 'Fun'#231#227'o*'
        FocusControl = dfNmFuncao
      end
      object dfCdFuncao: TDBEdit
        Left = 12
        Top = 20
        Width = 50
        Height = 21
        DataField = 'IDFUNCAO'
        DataSource = dsCadastro
        Enabled = False
        TabOrder = 1
      end
      object dfNmFuncao: TDBEdit
        Left = 12
        Top = 60
        Width = 616
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NMFUNCAO'
        DataSource = dsCadastro
        TabOrder = 2
      end
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmFuncao.sqlFuncao
  end
end
