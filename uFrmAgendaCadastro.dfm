inherited FrmAgendaCadastro: TFrmAgendaCadastro
  Caption = 'Agendamento'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgPadrao: TPageControl
    ActivePage = tsConsPadrao
    ExplicitWidth = 665
    ExplicitHeight = 385
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
      object Label1: TLabel [0]
        Left = 12
        Top = 5
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel [1]
        Left = 12
        Top = 45
        Width = 62
        Height = 13
        Caption = 'C'#243'd Pessoa*'
        FocusControl = DBEdit2
      end
      object Label3: TLabel [2]
        Left = 12
        Top = 89
        Width = 52
        Height = 13
        Caption = 'Descri'#231#227'o*'
        FocusControl = DBEdit3
      end
      object Label4: TLabel [3]
        Left = 12
        Top = 129
        Width = 29
        Height = 13
        Caption = 'Data*'
        FocusControl = DBEdit4
      end
      object Label5: TLabel [4]
        Left = 95
        Top = 129
        Width = 23
        Height = 13
        Caption = 'Hora'
        FocusControl = DBEdit5
      end
      object Label6: TLabel [5]
        Left = 92
        Top = 45
        Width = 34
        Height = 13
        Caption = 'Pessoa'
        FocusControl = DBEdit6
      end
      object SpeedButton1: TSpeedButton [6]
        Left = 64
        Top = 63
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
        OnClick = SpeedButton1Click
      end
      inherited pnCadastroPadrao: TPanel
        ExplicitTop = 316
        ExplicitWidth = 657
      end
      object DBEdit1: TDBEdit
        Left = 12
        Top = 20
        Width = 50
        Height = 21
        DataField = 'IDAGENDA'
        DataSource = dsCadastro
        Enabled = False
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 12
        Top = 63
        Width = 50
        Height = 21
        DataField = 'IDPESSOA'
        DataSource = dsCadastro
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 12
        Top = 104
        Width = 616
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NMDESCRICAO'
        DataSource = dsCadastro
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 12
        Top = 144
        Width = 77
        Height = 21
        DataField = 'DTDATA'
        DataSource = dsCadastro
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 95
        Top = 144
        Width = 77
        Height = 21
        DataField = 'HORA'
        DataSource = dsCadastro
        TabOrder = 5
      end
      object DBEdit6: TDBEdit
        Left = 92
        Top = 64
        Width = 536
        Height = 21
        DataField = 'NMPESSOA'
        DataSource = dsCadastro
        Enabled = False
        TabOrder = 6
      end
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmAgenda.sqlAgenda
    OnDataChange = dsCadastroDataChange
    Left = 540
    Top = 120
  end
end
