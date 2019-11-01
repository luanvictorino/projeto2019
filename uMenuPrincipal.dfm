object fMenuPrincipal: TfMenuPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 367
  ClientWidth = 748
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMenuPrincipal
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object sbPrincipal: TStatusBar
    Left = 0
    Top = 348
    Width = 748
    Height = 19
    Panels = <
      item
        Text = 'Usu'#225'rio: Luan Victorino'
        Width = 1160
      end
      item
        Text = 'Data:'
        Width = 50
      end>
  end
  object mmMenuPrincipal: TMainMenu
    Left = 376
    Top = 64
    object imCadastro: TMenuItem
      Caption = 'Cadastro'
      object imPessoa: TMenuItem
        Caption = 'Pessoa'
        OnClick = imPessoaClick
      end
      object Funo1: TMenuItem
        Caption = 'Fun'#231#227'o'
        OnClick = Funo1Click
      end
      object imes1: TMenuItem
        Caption = 'Times'
        OnClick = imes1Click
      end
      object imCidade: TMenuItem
        Caption = 'Cidade'
        OnClick = imCidadeClick
      end
      object imEstado: TMenuItem
        Caption = 'Estado'
        OnClick = imEstadoClick
      end
      object imPais: TMenuItem
        Caption = 'Pa'#237's'
        OnClick = imPaisClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object imSair: TMenuItem
        Caption = 'Sair'
        OnClick = imSairClick
      end
    end
    object Consulta1: TMenuItem
      Caption = 'Alterar Time'
    end
    object este1: TMenuItem
      Caption = 'Teste'
    end
  end
end
