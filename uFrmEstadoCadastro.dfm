inherited FrmEstadoCadastro: TFrmEstadoCadastro
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Estado'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgPadrao: TPageControl
    inherited tsCadastroPadrao: TTabSheet
      ParentShowHint = False
      ShowHint = True
      object lbCdEstado: TLabel [0]
        Left = 12
        Top = 5
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = dfCdEstado
      end
      object lbNmEstado: TLabel [1]
        Left = 12
        Top = 45
        Width = 39
        Height = 13
        Caption = 'Estado*'
        FocusControl = dfNmEstado
      end
      object lbUfEstado: TLabel [2]
        Left = 12
        Top = 85
        Width = 19
        Height = 13
        Caption = 'UF*'
        FocusControl = dfUfEstado
      end
      object lbCdPais: TLabel [3]
        Left = 12
        Top = 125
        Width = 47
        Height = 13
        Caption = 'C'#243'd Pa'#237's*'
        FocusControl = dfCdPais
      end
      object lbNmPais: TLabel [4]
        Left = 92
        Top = 125
        Width = 19
        Height = 13
        Caption = 'Pa'#237's'
        FocusControl = dfNmPais
      end
      object btConsultarPais: TSpeedButton [5]
        Left = 63
        Top = 140
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
        OnClick = btConsultarPaisClick
      end
      object dfCdEstado: TDBEdit
        Left = 12
        Top = 20
        Width = 50
        Height = 21
        DataField = 'IDESTADO'
        DataSource = dsCadastro
        Enabled = False
        TabOrder = 1
      end
      object dfNmEstado: TDBEdit
        Left = 12
        Top = 60
        Width = 616
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NMESTADO'
        DataSource = dsCadastro
        TabOrder = 2
      end
      object dfUfEstado: TDBEdit
        Left = 12
        Top = 100
        Width = 50
        Height = 21
        CharCase = ecUpperCase
        DataField = 'UFESTADO'
        DataSource = dsCadastro
        TabOrder = 3
      end
      object dfCdPais: TDBEdit
        Left = 12
        Top = 140
        Width = 50
        Height = 21
        Hint = 'Pressione CTRL+ENTER para pesquisar pelo ID'
        DataField = 'IDPAIS'
        DataSource = dsCadastro
        TabOrder = 4
      end
      object dfNmPais: TDBEdit
        Left = 92
        Top = 140
        Width = 536
        Height = 21
        DataField = 'NMPAIS'
        DataSource = dsCadastro
        Enabled = False
        ReadOnly = True
        TabOrder = 5
      end
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmEstado.sqlEstado
    OnDataChange = dsCadastroDataChange
  end
end
