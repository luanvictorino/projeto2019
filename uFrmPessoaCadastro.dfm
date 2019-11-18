inherited FrmPessoaCadastro: TFrmPessoaCadastro
  Caption = 'Cadastro de Pessoa'
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
      inherited pnCadastroPadrao: TPanel
        TabOrder = 1
        inherited btSalvar: TBitBtn
          Width = 71
          ExplicitWidth = 71
        end
      end
      object pgCadastro: TPageControl
        Left = 0
        Top = 0
        Width = 657
        Height = 316
        ActivePage = tsCadastroFuncionario
        Align = alClient
        TabOrder = 0
        object tsCadastroPessoa: TTabSheet
          Caption = 'Pessoa'
          object lbCdPessoa: TLabel
            Left = 10
            Top = 2
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
            FocusControl = dfCdPessoa
          end
          object lbNmPessoa: TLabel
            Left = 10
            Top = 42
            Width = 33
            Height = 13
            Caption = 'Nome*'
            FocusControl = dfNmPessoa
          end
          object lbNuTelefone: TLabel
            Left = 10
            Top = 82
            Width = 42
            Height = 13
            Caption = 'Telefone'
            FocusControl = dfNuTelefone
          end
          object lnNuCelular: TLabel
            Left = 161
            Top = 82
            Width = 33
            Height = 13
            Caption = 'Celular'
            FocusControl = dfNuCelular
          end
          object lbDeEmail: TLabel
            Left = 10
            Top = 122
            Width = 24
            Height = 13
            Caption = 'Email'
            FocusControl = dfDeEmail
          end
          object lb: TLabel
            Left = 10
            Top = 202
            Width = 65
            Height = 13
            Caption = 'C'#243'd. Cidade*'
            FocusControl = dfCdCidade
          end
          object lbNmCidade: TLabel
            Left = 90
            Top = 202
            Width = 33
            Height = 13
            Caption = 'Cidade'
          end
          object btConsultarCidade: TSpeedButton
            Left = 61
            Top = 217
            Width = 23
            Height = 22
            Glyph.Data = {
              AA030000424DAA03000000000000360000002800000011000000110000000100
              18000000000074030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFAFAFA666666000000A1A1A100FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F24D4D4D0000000000000000
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFF4F4F454545400000000000000000066666600FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F63C3C3C000000000000
              0000004D4D4DFAFAFA00FFFFFFFFFFFFFFFFFFF1F1F17171712C2C2C2B2B2B35
              3535919191FFFFFFD5D5D5000000000000000000535353F2F2F2FFFFFF00FFFF
              FFFFFFFF9C9C9C0000000000000000000000000000000000000A0A0AEEEEEECD
              CDCD0000003C3C3CF3F3F3FFFFFFFFFFFF00FFFFFF888888000000292929C4C4
              C4FFFFFFFFFFFFFFFFFF9C9C9C151515000000EFEFEFD4D4D4F5F5F5FFFFFFFF
              FFFFFFFFFF00E2E2E2000000474747F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFDCDCDC151515090909FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00717171070707
              C5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9C0000009191
              91FFFFFFFFFFFFFFFFFFFFFFFF001414143A3A3AFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000373737FFFFFFFFFFFFFFFFFFFFFF
              FF000000004C4C4CE2E2E2BDBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF0000002B2B2BFFFFFFFFFFFFFFFFFFFFFFFF000606064C4C4CA9A9A917
              1717E5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000002C2C2CFFFFFF
              FFFFFFFFFFFFFFFFFF005353531F1F1FD9D9D94242428C8C8CE5E5E5FFFFFFFF
              FFFFFFFFFFFFFFFFC5C5C5000000727272FFFFFFFFFFFFFFFFFFFFFFFF00CECE
              CE0000006E6E6EDEDEDE424242171717BDBDBDFFFFFFFFFFFFF6F6F629292900
              0000F1F1F1FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF5959590000006E6E6ED9D9
              D9A9A9A9E2E2E2FFFFFFC5C5C54848480000009B9B9BFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF00FFFFFFF2F2F25A5A5A0000001F1F1F4B4B4B4D4D4D3939390707
              07000000898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
              FFFFFFCFCFCF545454050505000000131313717171E2E2E2FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF00}
            OnClick = btConsultarCidadeClick
          end
          object lbDtNascimento: TLabel
            Left = 10
            Top = 162
            Width = 96
            Height = 13
            Caption = 'Data de Nascimento'
          end
          object dfCdPessoa: TDBEdit
            Left = 10
            Top = 17
            Width = 50
            Height = 21
            DataField = 'IDPESSOA'
            DataSource = dsCadastro
            Enabled = False
            TabOrder = 0
          end
          object dfNmPessoa: TDBEdit
            Left = 10
            Top = 57
            Width = 616
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NMPESSOA'
            DataSource = dsCadastro
            TabOrder = 1
          end
          object dfNuTelefone: TDBEdit
            Left = 10
            Top = 97
            Width = 145
            Height = 21
            DataField = 'NUTELEFONE'
            DataSource = dsCadastro
            TabOrder = 2
          end
          object dfNuCelular: TDBEdit
            Left = 161
            Top = 97
            Width = 145
            Height = 21
            DataField = 'NUCELULAR'
            DataSource = dsCadastro
            TabOrder = 3
          end
          object dfDeEmail: TDBEdit
            Left = 10
            Top = 137
            Width = 616
            Height = 21
            DataField = 'DEEMAIL'
            DataSource = dsCadastro
            TabOrder = 4
          end
          object dfCdCidade: TDBEdit
            Left = 10
            Top = 217
            Width = 50
            Height = 21
            DataField = 'IDCIDADE'
            DataSource = dsCadastro
            TabOrder = 6
          end
          object dfNmCidade: TDBEdit
            Left = 90
            Top = 217
            Width = 536
            Height = 21
            DataField = 'NMCIDADE'
            DataSource = dsCadastro
            Enabled = False
            ReadOnly = True
            TabOrder = 7
          end
          object dfDtNascimento: TDBEdit
            Left = 10
            Top = 177
            Width = 96
            Height = 21
            DataField = 'DTNASCIMENTO'
            DataSource = dsCadastro
            TabOrder = 5
          end
        end
        object tsCadastroFuncionario: TTabSheet
          Caption = 'Funcion'#225'rio'
          ImageIndex = 1
          object lbCdFuncao: TLabel
            Left = 10
            Top = 2
            Width = 67
            Height = 13
            Caption = 'C'#243'd. Fun'#231#227'o*'
            FocusControl = dfCdFuncao
          end
          object lbDtAdmissao: TLabel
            Left = 10
            Top = 42
            Width = 77
            Height = 13
            Caption = 'Data Admiss'#227'o*'
            FocusControl = dfDtAdmissao
          end
          object lbDtDemissao: TLabel
            Left = 101
            Top = 42
            Width = 86
            Height = 13
            BiDiMode = bdLeftToRight
            Caption = 'Data de Demiss'#227'o'
            FocusControl = dfDtDemissao
            ParentBiDiMode = False
          end
          object btConsultarFuncao: TSpeedButton
            Left = 61
            Top = 17
            Width = 23
            Height = 22
            Glyph.Data = {
              AA030000424DAA03000000000000360000002800000011000000110000000100
              18000000000074030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFAFAFA666666000000A1A1A100FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F24D4D4D0000000000000000
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFF4F4F454545400000000000000000066666600FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F63C3C3C000000000000
              0000004D4D4DFAFAFA00FFFFFFFFFFFFFFFFFFF1F1F17171712C2C2C2B2B2B35
              3535919191FFFFFFD5D5D5000000000000000000535353F2F2F2FFFFFF00FFFF
              FFFFFFFF9C9C9C0000000000000000000000000000000000000A0A0AEEEEEECD
              CDCD0000003C3C3CF3F3F3FFFFFFFFFFFF00FFFFFF888888000000292929C4C4
              C4FFFFFFFFFFFFFFFFFF9C9C9C151515000000EFEFEFD4D4D4F5F5F5FFFFFFFF
              FFFFFFFFFF00E2E2E2000000474747F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFDCDCDC151515090909FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00717171070707
              C5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9C0000009191
              91FFFFFFFFFFFFFFFFFFFFFFFF001414143A3A3AFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000373737FFFFFFFFFFFFFFFFFFFFFF
              FF000000004C4C4CE2E2E2BDBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF0000002B2B2BFFFFFFFFFFFFFFFFFFFFFFFF000606064C4C4CA9A9A917
              1717E5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000002C2C2CFFFFFF
              FFFFFFFFFFFFFFFFFF005353531F1F1FD9D9D94242428C8C8CE5E5E5FFFFFFFF
              FFFFFFFFFFFFFFFFC5C5C5000000727272FFFFFFFFFFFFFFFFFFFFFFFF00CECE
              CE0000006E6E6EDEDEDE424242171717BDBDBDFFFFFFFFFFFFF6F6F629292900
              0000F1F1F1FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF5959590000006E6E6ED9D9
              D9A9A9A9E2E2E2FFFFFFC5C5C54848480000009B9B9BFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF00FFFFFFF2F2F25A5A5A0000001F1F1F4B4B4B4D4D4D3939390707
              07000000898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
              FFFFFFCFCFCF545454050505000000131313717171E2E2E2FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF00}
            OnClick = btConsultarFuncaoClick
          end
          object lbNmFuncao: TLabel
            Left = 89
            Top = 2
            Width = 35
            Height = 13
            Caption = 'Fun'#231#227'o'
          end
          object dfCdFuncao: TDBEdit
            Left = 10
            Top = 17
            Width = 50
            Height = 21
            DataField = 'IDFUNCAO'
            DataSource = dsFuncionario
            TabOrder = 0
          end
          object dfDtAdmissao: TDBEdit
            Left = 10
            Top = 61
            Width = 77
            Height = 21
            DataField = 'DTADMISSAO'
            DataSource = dsFuncionario
            TabOrder = 2
          end
          object dfDtDemissao: TDBEdit
            Left = 101
            Top = 61
            Width = 77
            Height = 21
            DataField = 'DTDEMISSAO'
            DataSource = dsFuncionario
            TabOrder = 3
          end
          object dfNmFuncao: TDBEdit
            Left = 89
            Top = 17
            Width = 531
            Height = 21
            DataField = 'NMFUNCAO'
            DataSource = dsFuncionario
            Enabled = False
            TabOrder = 1
          end
          object gbTime: TGroupBox
            Left = 3
            Top = 88
            Width = 610
            Height = 175
            Caption = 'Time'
            TabOrder = 4
            object btEntrarTime: TButton
              Left = 19
              Top = 20
              Width = 118
              Height = 25
              Caption = 'Entrar em um time'
              TabOrder = 0
              OnClick = btEntrarTimeClick
            end
            object btSairTime: TButton
              Left = 158
              Top = 20
              Width = 133
              Height = 25
              Caption = 'Sair do time atual'
              Enabled = False
              TabOrder = 1
              OnClick = btSairTimeClick
            end
            object grTimesHistorico: TDBGrid
              Left = 2
              Top = 51
              Width = 606
              Height = 122
              Align = alBottom
              DataSource = dsTimesHistorico
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ReadOnly = True
              TabOrder = 2
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
          end
        end
      end
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmPessoa.sqlPessoa
    OnDataChange = dsCadastroDataChange
    Top = 32
  end
  object dsFuncionario: TDataSource
    DataSet = dmPessoa.sqlFuncionario
    OnDataChange = dsFuncionarioDataChange
    Left = 568
    Top = 32
  end
  object dsTimesHistorico: TDataSource
    DataSet = dmPessoa.sqlTimesHistorico
    Left = 570
    Top = 98
  end
end
