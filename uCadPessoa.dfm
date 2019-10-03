object fCadPessoa: TfCadPessoa
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pessoa'
  ClientHeight = 341
  ClientWidth = 664
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgConsPessoaEFunc: TPageControl
    Left = 0
    Top = 0
    Width = 664
    Height = 341
    ActivePage = tsConsulta
    Align = alClient
    TabOrder = 0
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lbNumeroRegistros: TLabel
        Left = 12
        Top = 64
        Width = 3
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object gbConsNmPessoa: TGroupBox
        Left = 3
        Top = 3
        Width = 412
        Height = 55
        Caption = 'Pesquisar Pessoa pelo nome'
        TabOrder = 0
        object dfConsNmPessoa: TEdit
          Left = 9
          Top = 21
          Width = 309
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
        end
      end
      object pnBotoes: TPanel
        Left = 0
        Top = 272
        Width = 656
        Height = 41
        Align = alBottom
        TabOrder = 1
        object btNovo: TSpeedButton
          Left = 3
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Novo'
          OnClick = btNovoClick
        end
      end
      object grConsPessoa: TDBGrid
        Left = 3
        Top = 83
        Width = 650
        Height = 189
        DataSource = dsConsPessoa
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = grConsPessoaDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'IDPESSOA'
            Title.Caption = 'C'#243'digo'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NMPESSOA'
            Title.Caption = 'Nome'
            Width = 147
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUTELEFONE'
            Title.Caption = 'Telefone'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUCELULAR'
            Title.Caption = 'Celular'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEEMAIL'
            Title.Caption = 'Email'
            Width = 126
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NMCIDADE'
            Title.Caption = 'Cidade'
            Width = 100
            Visible = True
          end>
      end
      object btConsNmPessoa: TButton
        Left = 329
        Top = 22
        Width = 75
        Height = 25
        Caption = 'Consultar'
        Default = True
        TabOrder = 3
        OnClick = btConsNmPessoaClick
      end
    end
    object tsCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pgCadPessoaEFunc: TPageControl
        Left = 0
        Top = 0
        Width = 656
        Height = 272
        ActivePage = tsPessoa
        Align = alClient
        TabOrder = 0
        OnChanging = pgCadPessoaEFuncChanging
        object tsPessoa: TTabSheet
          Caption = 'Pessoa'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object lbCdPessoa: TLabel
            Left = 3
            Top = 3
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
          end
          object lbNmPessoa: TLabel
            Left = 3
            Top = 41
            Width = 33
            Height = 13
            Caption = 'Nome*'
          end
          object lbNuTelefone: TLabel
            Left = 3
            Top = 79
            Width = 42
            Height = 13
            Caption = 'Telefone'
          end
          object lbDeEmail: TLabel
            Left = 3
            Top = 117
            Width = 24
            Height = 13
            Caption = 'Email'
          end
          object lbCdCidade: TLabel
            Left = 3
            Top = 155
            Width = 65
            Height = 13
            Caption = 'C'#243'd. Cidade*'
          end
          object btPesqCidade: TSpeedButton
            Left = 54
            Top = 167
            Width = 23
            Height = 23
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
            OnClick = btPesqCidadeClick
          end
          object lbNmCidade: TLabel
            Left = 80
            Top = 155
            Width = 33
            Height = 13
            Caption = 'Cidade'
          end
          object lbNuCelular: TLabel
            Left = 231
            Top = 79
            Width = 33
            Height = 13
            Caption = 'Celular'
          end
          object dfCdPessoa: TDBEdit
            Left = 3
            Top = 16
            Width = 50
            Height = 21
            DataField = 'IDPESSOA'
            DataSource = dsPessoa
            Enabled = False
            TabOrder = 0
          end
          object dfNmPessoa: TDBEdit
            Left = 3
            Top = 54
            Width = 450
            Height = 21
            DataField = 'NMPESSOA'
            DataSource = dsPessoa
            TabOrder = 1
          end
          object dfNuCelular: TDBEdit
            Left = 231
            Top = 92
            Width = 222
            Height = 21
            DataField = 'NUCELULAR'
            DataSource = dsPessoa
            TabOrder = 3
          end
          object dfNuTelefone: TDBEdit
            Left = 3
            Top = 92
            Width = 222
            Height = 21
            DataField = 'NUTELEFONE'
            DataSource = dsPessoa
            TabOrder = 2
          end
          object dfDeEmail: TDBEdit
            Left = 3
            Top = 130
            Width = 450
            Height = 21
            DataField = 'DEEMAIL'
            DataSource = dsPessoa
            TabOrder = 4
          end
          object dfNmCidade: TDBEdit
            Left = 80
            Top = 168
            Width = 373
            Height = 21
            Enabled = False
            TabOrder = 6
          end
          object dfCdCidade: TDBEdit
            Left = 3
            Top = 168
            Width = 50
            Height = 21
            DataField = 'IDCIDADE'
            DataSource = dsPessoa
            TabOrder = 5
            OnChange = dfCdCidadeChange
            OnExit = dfCdCidadeExit
          end
        end
        object tsFuncionario: TTabSheet
          Caption = 'Funcionario'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object lbCdFuncionario: TLabel
            Left = 3
            Top = 3
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
          end
          object lbCdFuncao: TLabel
            Left = 3
            Top = 41
            Width = 67
            Height = 13
            Caption = 'C'#243'd. Fun'#231#227'o*'
          end
          object lbDtAdmissao: TLabel
            Left = 3
            Top = 81
            Width = 77
            Height = 13
            Caption = 'Data Admiss'#227'o*'
          end
          object lbNmFuncao: TLabel
            Left = 83
            Top = 41
            Width = 35
            Height = 13
            Caption = 'Fun'#231#227'o'
          end
          object lbDtNasc: TLabel
            Left = 231
            Top = 81
            Width = 87
            Height = 13
            Caption = 'Data Nascimento*'
          end
          object btPesqFuncao: TSpeedButton
            Left = 54
            Top = 55
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
          end
          object dfNmFuncao: TDBEdit
            Left = 80
            Top = 56
            Width = 371
            Height = 21
            Enabled = False
            TabOrder = 0
          end
          object btExcluirFuncionario: TButton
            Left = 3
            Top = 131
            Width = 113
            Height = 25
            Caption = 'Excluir Funcion'#225'rio'
            TabOrder = 1
            OnClick = btExcluirFuncionarioClick
          end
          object dfCdFuncionario: TDBEdit
            Left = 3
            Top = 16
            Width = 50
            Height = 21
            DataField = 'IDPESSOA'
            DataSource = dsFuncionario
            Enabled = False
            TabOrder = 2
          end
          object dfCdFuncao: TDBEdit
            Left = 3
            Top = 56
            Width = 50
            Height = 21
            DataField = 'IDFUNCAO'
            DataSource = dsFuncionario
            TabOrder = 3
            OnChange = dfCdFuncaoChange
          end
          object dfDtAdmissao: TDBEdit
            Left = 3
            Top = 96
            Width = 220
            Height = 21
            DataField = 'DTADMISSAO'
            DataSource = dsFuncionario
            TabOrder = 4
          end
          object dfDtNasc: TDBEdit
            Left = 231
            Top = 96
            Width = 220
            Height = 21
            DataField = 'DTNASCIMENTO'
            DataSource = dsFuncionario
            TabOrder = 5
          end
        end
      end
      object pnBotoesCadastro: TPanel
        Left = 0
        Top = 272
        Width = 656
        Height = 41
        Align = alBottom
        TabOrder = 1
        object btExcluir: TSpeedButton
          Left = 165
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Excluir'
          OnClick = btExcluirClick
        end
        object btCancelar: TSpeedButton
          Left = 84
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Cancelar'
          OnClick = btCancelarClick
        end
        object btSalvar: TSpeedButton
          Left = 3
          Top = 6
          Width = 75
          Height = 25
          Caption = '&Salvar'
          OnClick = btSalvarClick
        end
      end
    end
  end
  object dsPessoa: TDataSource
    DataSet = DM.qyPessoa
    Left = 604
    Top = 16
  end
  object dsConsPessoa: TDataSource
    DataSet = DM.qyConsPessoa
    Left = 532
    Top = 16
  end
  object dsFuncionario: TDataSource
    DataSet = DM.qyFuncionario
    Left = 453
    Top = 21
  end
end
