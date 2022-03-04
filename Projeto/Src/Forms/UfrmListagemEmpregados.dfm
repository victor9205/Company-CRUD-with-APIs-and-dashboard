inherited frmListagemEmpregados: TfrmListagemEmpregados
  Caption = 'Listagem de Empregados'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGrid: TPanel
    inherited grdCadastro: TcxGrid
      inherited grdCadastroDBTableView1: TcxGridDBTableView
        object grdCadastroDBTableView1CODIGO: TcxGridDBColumn
          DataBinding.FieldName = 'CODIGO'
        end
        object grdCadastroDBTableView1NOME: TcxGridDBColumn
          DataBinding.FieldName = 'NOME'
          Width = 213
        end
        object grdCadastroDBTableView1PESSOAJURIDICA: TcxGridDBColumn
          DataBinding.FieldName = 'PESSOAJURIDICA'
          Width = 92
        end
        object grdCadastroDBTableView1CNPJCPF: TcxGridDBColumn
          DataBinding.FieldName = 'CNPJCPF'
        end
        object grdCadastroDBTableView1ENDERECO: TcxGridDBColumn
          DataBinding.FieldName = 'ENDERECO'
          Width = 264
        end
        object grdCadastroDBTableView1BAIRRO: TcxGridDBColumn
          DataBinding.FieldName = 'BAIRRO'
          Width = 226
        end
        object grdCadastroDBTableView1CIDADE: TcxGridDBColumn
          DataBinding.FieldName = 'CIDADE'
          Width = 137
        end
        object grdCadastroDBTableView1UF: TcxGridDBColumn
          DataBinding.FieldName = 'UF'
          Width = 31
        end
        object grdCadastroDBTableView1CEP: TcxGridDBColumn
          DataBinding.FieldName = 'CEP'
        end
        object grdCadastroDBTableView1TELEFONE: TcxGridDBColumn
          DataBinding.FieldName = 'TELEFONE'
          Width = 108
        end
        object grdCadastroDBTableView1PERCENTUALCOMISSAO: TcxGridDBColumn
          DataBinding.FieldName = 'PERCENTUALCOMISSAO'
          Width = 126
        end
        object grdCadastroDBTableView1VOLUMEGERALVENDAS: TcxGridDBColumn
          DataBinding.FieldName = 'VOLUMEGERALVENDAS'
        end
        object grdCadastroDBTableView1DATANASCIMENTO: TcxGridDBColumn
          DataBinding.FieldName = 'DATANASCIMENTO'
        end
      end
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsEmpregado
  end
end
