inherited frmListagemEstoque: TfrmListagemEstoque
  Caption = 'Listagem de Estoque'
  ClientHeight = 423
  ClientWidth = 656
  ExplicitWidth = 672
  ExplicitHeight = 462
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Top = 380
    Width = 656
    inherited btnDica: TSpeedButton
      Left = 450
    end
    inherited btnAjuda: TSpeedButton
      Left = 551
    end
    inherited btnFechar: TSpeedButton
      Left = 602
    end
    inherited btnExtras: TSpeedButton
      Left = 501
    end
  end
  inherited pnlGrid: TPanel
    Width = 656
    Height = 380
    inherited grdCadastro: TcxGrid
      Width = 654
      Height = 378
      inherited grdCadastroDBTableView1: TcxGridDBTableView
        object grdCadastroDBTableView1CODIGOPRODUTO: TcxGridDBColumn
          DataBinding.FieldName = 'CODIGOPRODUTO'
        end
        object grdCadastroDBTableView1DATA: TcxGridDBColumn
          DataBinding.FieldName = 'DATA'
          Width = 73
        end
        object grdCadastroDBTableView1QUANTIDADE: TcxGridDBColumn
          DataBinding.FieldName = 'QUANTIDADE'
          Width = 108
        end
        object grdCadastroDBTableView1VALORCUSTO: TcxGridDBColumn
          DataBinding.FieldName = 'VALORCUSTO'
        end
        object grdCadastroDBTableView1VALORTOTALESTOQUE: TcxGridDBColumn
          Caption = 'Valor Total do Estoque'
          DataBinding.FieldName = 'VALORTOTALESTOQUE'
          Width = 123
        end
      end
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsEstoque
  end
end
