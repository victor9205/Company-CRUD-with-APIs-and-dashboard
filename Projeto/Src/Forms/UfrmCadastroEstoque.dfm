inherited frmCadastroEstoque: TfrmCadastroEstoque
  Caption = 'Cadastro de Estoque'
  ClientHeight = 155
  ClientWidth = 368
  ExplicitWidth = 374
  ExplicitHeight = 184
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Top = 112
    Width = 368
    TabOrder = 5
    ExplicitTop = 112
    ExplicitWidth = 368
    inherited btnGravar: TSpeedButton
      Left = 131
      ExplicitLeft = 131
    end
    inherited btnCancelar: TSpeedButton
      Left = 181
      ExplicitLeft = 181
    end
    inherited btnAjuda: TSpeedButton
      Left = 231
      ExplicitLeft = 231
    end
  end
  object Codigo: TcxGroupBox [1]
    Left = 10
    Top = 4
    Caption = 'C'#243'digo'
    TabOrder = 0
    DesignSize = (
      100
      44)
    Height = 44
    Width = 100
    object edtCodigo: TcxDBTextEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'CODIGOPRODUTO'
      DataBinding.DataSource = dsCadastro
      TabOrder = 0
      Width = 80
    end
  end
  object Data: TcxGroupBox [2]
    Left = 10
    Top = 52
    Caption = 'Data'
    TabOrder = 3
    DesignSize = (
      100
      44)
    Height = 44
    Width = 100
    object edtData: TcxDBDateEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'DATA'
      DataBinding.DataSource = dsCadastro
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 0
      Width = 80
    end
  end
  object ValorTotalEstoque: TcxGroupBox [3]
    Left = 120
    Top = 4
    Caption = 'Valor Total Estoque'
    TabOrder = 1
    DesignSize = (
      100
      44)
    Height = 44
    Width = 100
    object edtValorTotalEstoque: TcxDBCalcEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'VALORTOTALESTOQUE'
      DataBinding.DataSource = dsCadastro
      Properties.DisplayFormat = 'R$ #0.00'
      TabOrder = 0
      Width = 80
    end
  end
  object ValorCusto: TcxGroupBox [4]
    Left = 120
    Top = 52
    Caption = 'Valor Custo'
    TabOrder = 4
    DesignSize = (
      100
      44)
    Height = 44
    Width = 100
    object edtValorCusto: TcxDBCalcEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'VALORCUSTO'
      DataBinding.DataSource = dsCadastro
      Properties.DisplayFormat = 'R$ #0.00'
      TabOrder = 0
      Width = 80
    end
  end
  object Quantidade: TcxGroupBox [5]
    Left = 230
    Top = 4
    Caption = 'Quantidade'
    TabOrder = 2
    DesignSize = (
      110
      44)
    Height = 44
    Width = 110
    object edtQuantidade: TcxDBTextEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'QUANTIDADE'
      DataBinding.DataSource = dsCadastro
      TabOrder = 0
      Width = 90
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsEstoque
    Left = 275
    Top = 48
  end
end
