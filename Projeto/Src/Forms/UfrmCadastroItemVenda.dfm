inherited frmCadatroItemVenda: TfrmCadatroItemVenda
  Caption = 'Cadatro Item Venda'
  ClientHeight = 156
  ClientWidth = 561
  ExplicitWidth = 567
  ExplicitHeight = 185
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Top = 113
    Width = 561
    TabOrder = 6
    ExplicitTop = 124
    ExplicitWidth = 575
    inherited btnGravar: TSpeedButton
      Left = 201
      ExplicitLeft = 201
    end
    inherited btnCancelar: TSpeedButton
      Left = 251
      ExplicitLeft = 251
    end
    inherited btnAjuda: TSpeedButton
      Left = 301
      ExplicitLeft = 301
    end
  end
  object CodigoVenda: TcxGroupBox [1]
    Left = 10
    Top = 4
    Caption = 'C'#243'digo da Venda'
    TabOrder = 0
    DesignSize = (
      100
      44)
    Height = 44
    Width = 100
    object edtCodigoVenda: TcxDBTextEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'CODIGOVENDA'
      DataBinding.DataSource = dsCadastro
      TabOrder = 0
      Width = 80
    end
  end
  object DescricaoProduto: TcxGroupBox [2]
    Left = 10
    Top = 50
    Caption = 'Descri'#231#227'o do Produto '
    TabOrder = 5
    DesignSize = (
      540
      44)
    Height = 44
    Width = 540
    object edtDescricaoProduto: TcxDBTextEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'DESCRICAOPRODUTO'
      DataBinding.DataSource = dsCadastro
      TabOrder = 0
      Width = 520
    end
  end
  object cxGroupBox3: TcxGroupBox [3]
    Left = 120
    Top = 4
    Caption = 'C'#243'digo do Produto'
    TabOrder = 1
    DesignSize = (
      100
      44)
    Height = 44
    Width = 100
    object edtCodigoProduto: TcxDBTextEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'CODIGOPRODUTO'
      DataBinding.DataSource = dsCadastro
      TabOrder = 0
      Width = 80
    end
  end
  object ValorUnitario: TcxGroupBox [4]
    Left = 230
    Top = 4
    Caption = 'Valor Unitario'
    TabOrder = 2
    DesignSize = (
      100
      44)
    Height = 44
    Width = 100
    object edtValorUnitario: TcxDBCalcEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'VALORUNITARIO'
      DataBinding.DataSource = dsCadastro
      Properties.DisplayFormat = 'R$ #0.00'
      TabOrder = 0
      Width = 80
    end
  end
  object Quantidade: TcxGroupBox [5]
    Left = 340
    Top = 4
    Caption = 'Quantidade'
    TabOrder = 3
    DesignSize = (
      100
      44)
    Height = 44
    Width = 100
    object edtQuantidade: TcxDBCalcEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'QUANTIDADE'
      DataBinding.DataSource = dsCadastro
      Properties.DisplayFormat = '0.00'
      TabOrder = 0
      Width = 80
    end
  end
  object ValorTotal: TcxGroupBox [6]
    Left = 450
    Top = 4
    Caption = 'Valor Total'
    TabOrder = 4
    DesignSize = (
      100
      44)
    Height = 44
    Width = 100
    object edtValorTotal: TcxDBCalcEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'VALORTOTAL'
      DataBinding.DataSource = dsCadastro
      Properties.DisplayFormat = 'R$ #0.00'
      TabOrder = 0
      Width = 80
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsItemVenda
  end
end
