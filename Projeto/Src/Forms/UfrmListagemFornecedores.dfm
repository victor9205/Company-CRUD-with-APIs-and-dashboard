inherited frmListagemFornecedores: TfrmListagemFornecedores
  Caption = 'Listagem de Fornecedores'
  ClientWidth = 793
  ExplicitWidth = 809
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Width = 793
    ExplicitWidth = 793
    inherited btnDica: TSpeedButton
      Left = 587
      ExplicitLeft = 587
    end
    inherited btnAjuda: TSpeedButton
      Left = 688
      ExplicitLeft = 688
    end
    inherited btnFechar: TSpeedButton
      Left = 739
      ExplicitLeft = 739
    end
    inherited btnExtras: TSpeedButton
      Left = 638
      ExplicitLeft = 638
    end
  end
  inherited pnlGrid: TPanel
    Width = 793
    ExplicitWidth = 793
    inherited grdCadastro: TcxGrid
      Width = 791
      ExplicitWidth = 791
      inherited grdCadastroDBTableView1: TcxGridDBTableView
        object grdCadastroDBTableView1CODIGO: TcxGridDBColumn
          DataBinding.FieldName = 'CODIGO'
        end
        object grdCadastroDBTableView1RAZAOSOCIAL: TcxGridDBColumn
          DataBinding.FieldName = 'RAZAOSOCIAL'
          Width = 192
        end
        object grdCadastroDBTableView1PESSOAJURIDICA: TcxGridDBColumn
          DataBinding.FieldName = 'PESSOAJURIDICA'
          Width = 102
        end
        object grdCadastroDBTableView1CNPJCPF: TcxGridDBColumn
          DataBinding.FieldName = 'CNPJCPF'
        end
        object grdCadastroDBTableView1ENDERECO: TcxGridDBColumn
          DataBinding.FieldName = 'ENDERECO'
          Width = 205
        end
        object grdCadastroDBTableView1BAIRRO: TcxGridDBColumn
          DataBinding.FieldName = 'BAIRRO'
          Width = 223
        end
        object grdCadastroDBTableView1CIDADE: TcxGridDBColumn
          DataBinding.FieldName = 'CIDADE'
          Width = 172
        end
        object grdCadastroDBTableView1UF: TcxGridDBColumn
          DataBinding.FieldName = 'UF'
          Width = 27
        end
        object grdCadastroDBTableView1CEP: TcxGridDBColumn
          DataBinding.FieldName = 'CEP'
        end
        object grdCadastroDBTableView1TELEFONE: TcxGridDBColumn
          DataBinding.FieldName = 'TELEFONE'
        end
        object grdCadastroDBTableView1LIMITEDECREDITO: TcxGridDBColumn
          DataBinding.FieldName = 'LIMITEDECREDITO'
        end
        object grdCadastroDBTableView1DATAINICIO: TcxGridDBColumn
          DataBinding.FieldName = 'DATAINICIO'
        end
      end
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsFornecedor
  end
end
