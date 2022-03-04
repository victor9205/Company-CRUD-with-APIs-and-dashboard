inherited frmListagemDependentes: TfrmListagemDependentes
  Caption = 'Listagem de Dependentes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGrid: TPanel
    inherited grdCadastro: TcxGrid
      inherited grdCadastroDBTableView1: TcxGridDBTableView
        object grdCadastroDBTableView1CODIGOEMPREGADO: TcxGridDBColumn
          DataBinding.FieldName = 'CODIGOEMPREGADO'
          Width = 38
        end
        object grdCadastroDBTableView1CPF: TcxGridDBColumn
          DataBinding.FieldName = 'CPF'
        end
        object grdCadastroDBTableView1NOME: TcxGridDBColumn
          DataBinding.FieldName = 'NOME'
          Width = 230
        end
        object grdCadastroDBTableView1ENDERECO: TcxGridDBColumn
          DataBinding.FieldName = 'ENDERECO'
          Width = 247
        end
        object grdCadastroDBTableView1BAIRRO: TcxGridDBColumn
          DataBinding.FieldName = 'BAIRRO'
          Width = 204
        end
        object grdCadastroDBTableView1CIDADE: TcxGridDBColumn
          DataBinding.FieldName = 'CIDADE'
          Width = 146
        end
        object grdCadastroDBTableView1UF: TcxGridDBColumn
          DataBinding.FieldName = 'UF'
          Width = 29
        end
        object grdCadastroDBTableView1CEP: TcxGridDBColumn
          DataBinding.FieldName = 'CEP'
        end
        object grdCadastroDBTableView1TELEFONE: TcxGridDBColumn
          DataBinding.FieldName = 'TELEFONE'
          Width = 111
        end
        object grdCadastroDBTableView1DATANASCIMENTO: TcxGridDBColumn
          DataBinding.FieldName = 'DATANASCIMENTO'
          Width = 102
        end
        object grdCadastroDBTableView1NOMEPAI: TcxGridDBColumn
          DataBinding.FieldName = 'NOMEPAI'
          Width = 266
        end
        object grdCadastroDBTableView1NOMEMAE: TcxGridDBColumn
          DataBinding.FieldName = 'NOMEMAE'
        end
      end
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsDependente
  end
end
