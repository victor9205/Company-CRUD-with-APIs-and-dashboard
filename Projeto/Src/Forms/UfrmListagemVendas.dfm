inherited frmListagemVendas: TfrmListagemVendas
  Caption = 'Listagem de Vendas'
  ClientHeight = 402
  ClientWidth = 680
  ExplicitWidth = 696
  ExplicitHeight = 441
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Top = 359
    Width = 680
    inherited btnDica: TSpeedButton
      Left = 474
    end
    inherited btnAjuda: TSpeedButton
      Left = 575
    end
    inherited btnFechar: TSpeedButton
      Left = 626
    end
    inherited btnExtras: TSpeedButton
      Left = 525
    end
  end
  inherited pnlGrid: TPanel
    Width = 680
    Height = 359
    inherited grdCadastro: TcxGrid
      Width = 678
      Height = 357
      inherited grdCadastroDBTableView1: TcxGridDBTableView
        object grdCadastroDBTableView1CODIGO: TcxGridDBColumn
          DataBinding.FieldName = 'CODIGO'
        end
        object grdCadastroDBTableView1CODIGOCLIENTE: TcxGridDBColumn
          DataBinding.FieldName = 'CODIGOCLIENTE'
          Width = 100
        end
        object grdCadastroDBTableView1CLIENTENOME: TcxGridDBColumn
          DataBinding.FieldName = 'CLIENTENOME'
          Width = 320
        end
        object grdCadastroDBTableView1DATA: TcxGridDBColumn
          DataBinding.FieldName = 'DATA'
        end
        object grdCadastroDBTableView1VALORTOTAL: TcxGridDBColumn
          DataBinding.FieldName = 'VALORTOTAL'
        end
      end
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsVendas
  end
end
