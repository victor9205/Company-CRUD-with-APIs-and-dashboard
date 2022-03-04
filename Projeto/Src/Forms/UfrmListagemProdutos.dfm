inherited frmListagemProdutos: TfrmListagemProdutos
  Caption = 'Cadastro de Produtos'
  ExplicitLeft = -111
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGrid: TPanel
    inherited grdCadastro: TcxGrid
      inherited grdCadastroDBTableView1: TcxGridDBTableView
        object grdCadastroDBTableView1CODIGO: TcxGridDBColumn
          DataBinding.FieldName = 'CODIGO'
        end
        object grdCadastroDBTableView1DESCRICAO: TcxGridDBColumn
          DataBinding.FieldName = 'DESCRICAO'
          Width = 281
        end
        object grdCadastroDBTableView1DATAAQUISICAO: TcxGridDBColumn
          DataBinding.FieldName = 'DATAAQUISICAO'
          Width = 100
        end
        object grdCadastroDBTableView1QUANTIDADEESTOQUE: TcxGridDBColumn
          DataBinding.FieldName = 'QUANTIDADEESTOQUE'
          PropertiesClassName = 'TcxCalcEditProperties'
          Properties.DisplayFormat = '0.00'
        end
        object grdCadastroDBTableView1VALORCUSTO: TcxGridDBColumn
          DataBinding.FieldName = 'VALORCUSTO'
          PropertiesClassName = 'TcxCalcEditProperties'
          Properties.DisplayFormat = 'R$ 0.00'
          Width = 139
        end
        object grdCadastroDBTableView1PERCENTUALLUCRO: TcxGridDBColumn
          DataBinding.FieldName = 'PERCENTUALLUCRO'
          PropertiesClassName = 'TcxCalcEditProperties'
          Properties.DisplayFormat = '0.00 '#39'%'#39
        end
        object grdCadastroDBTableView1VALORVENDA: TcxGridDBColumn
          DataBinding.FieldName = 'VALORVENDA'
          PropertiesClassName = 'TcxCalcEditProperties'
          Properties.DisplayFormat = 'R$ 0.00'
          Width = 81
        end
      end
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsProdutos
  end
end
