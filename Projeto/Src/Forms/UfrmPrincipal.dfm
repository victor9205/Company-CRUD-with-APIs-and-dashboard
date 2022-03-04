object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Aplica'#231#227'o de Exemplo'
  ClientHeight = 376
  ClientWidth = 701
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 184
    Top = 96
    object Arquivo1: TMenuItem
      Caption = '&Arquivo'
      object Backup1: TMenuItem
        Caption = '&Backup'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sai&r'
        OnClick = Sair1Click
      end
    end
    object Cadastros1: TMenuItem
      Caption = '&Cadastros'
      object Produtos1: TMenuItem
        Caption = '&Produtos'
        OnClick = Produtos1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Clientes1: TMenuItem
        Caption = 'C&lientes'
        OnClick = Clientes1Click
      end
      object Fornecedores1: TMenuItem
        Caption = '&Fornecedores'
        OnClick = Fornecedores1Click
      end
      object Marcas1: TMenuItem
        Caption = '&Marcas'
      end
      object Estoque1: TMenuItem
        Caption = '&Estoque '
        OnClick = Estoque1Click
      end
      object Vendedores1: TMenuItem
        Caption = '&Vendedores'
        OnClick = Vendedores1Click
      end
      object Empregados1: TMenuItem
        Caption = '&Empregados'
        OnClick = Empregados1Click
      end
    end
    object Movimentao1: TMenuItem
      Caption = '&Movimenta'#231#227'o'
      object Vendas1: TMenuItem
        Caption = '&Vendas'
        OnClick = Vendas1Click
      end
      object DashboarddeVendas1: TMenuItem
        Caption = '&Dashboard de Vendas'
        OnClick = DashboarddeVendas1Click
      end
    end
  end
end
