inherited frmListagemClientes: TfrmListagemClientes
  Caption = 'Listagem de Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGrid: TPanel
    inherited grdCadastro: TcxGrid
      ExplicitLeft = 4
      ExplicitTop = 2
      inherited grdCadastroDBTableView1: TcxGridDBTableView
        object grdCadastroDBTableView1CODIGO: TcxGridDBColumn
          DataBinding.FieldName = 'CODIGO'
        end
        object grdCadastroDBTableView1NOME: TcxGridDBColumn
          DataBinding.FieldName = 'NOME'
          Width = 241
        end
        object grdCadastroDBTableView1PESSOAJURIDICA: TcxGridDBColumn
          DataBinding.FieldName = 'PESSOAJURIDICA'
          Width = 97
        end
        object grdCadastroDBTableView1CNPJCPF: TcxGridDBColumn
          DataBinding.FieldName = 'CNPJCPF'
          Width = 108
        end
        object grdCadastroDBTableView1ENDERECO: TcxGridDBColumn
          DataBinding.FieldName = 'ENDERECO'
          Width = 283
        end
        object grdCadastroDBTableView1BAIRRO: TcxGridDBColumn
          DataBinding.FieldName = 'BAIRRO'
          Width = 248
        end
        object grdCadastroDBTableView1CIDADE: TcxGridDBColumn
          DataBinding.FieldName = 'CIDADE'
          Width = 123
        end
        object grdCadastroDBTableView1UF: TcxGridDBColumn
          DataBinding.FieldName = 'UF'
          Width = 33
        end
        object grdCadastroDBTableView1CEP: TcxGridDBColumn
          DataBinding.FieldName = 'CEP'
        end
        object grdCadastroDBTableView1TELEFONE: TcxGridDBColumn
          DataBinding.FieldName = 'TELEFONE'
        end
        object grdCadastroDBTableView1DATANASCIMENTO: TcxGridDBColumn
          DataBinding.FieldName = 'DATANASCIMENTO'
        end
        object grdCadastroDBTableView1SEXO: TcxGridDBColumn
          DataBinding.FieldName = 'SEXO'
        end
      end
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsClientes
  end
end
