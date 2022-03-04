inherited frmCadastroProduto: TfrmCadastroProduto
  Caption = 'Cadastro de Produto'
  ClientHeight = 144
  ClientWidth = 483
  ExplicitWidth = 489
  ExplicitHeight = 173
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Top = 101
    Width = 483
    TabOrder = 7
    ExplicitTop = 98
    ExplicitWidth = 485
    inherited btnGravar: TSpeedButton
      Left = 183
      ExplicitLeft = 183
    end
    inherited btnCancelar: TSpeedButton
      Left = 226
      ExplicitLeft = 226
    end
    inherited btnAjuda: TSpeedButton
      Left = 272
      ExplicitLeft = 272
    end
  end
  object cxGroupBox1: TcxGroupBox [1]
    Left = 10
    Top = 4
    Caption = 'C'#243'digo'
    TabOrder = 0
    DesignSize = (
      103
      44)
    Height = 44
    Width = 103
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'CODIGO'
      DataBinding.DataSource = dsCadastro
      TabOrder = 0
      Width = 83
    end
  end
  object cxGroupBox2: TcxGroupBox [2]
    Left = 367
    Top = 4
    Caption = 'Data de Aquisi'#231#227'o'
    TabOrder = 2
    DesignSize = (
      110
      44)
    Height = 44
    Width = 110
    object cxDBDateEdit1: TcxDBDateEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'DATAAQUISICAO'
      DataBinding.DataSource = dsCadastro
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 0
      Width = 90
    end
  end
  object cxGroupBox4: TcxGroupBox [3]
    Left = 10
    Top = 52
    Caption = 'Custo do Produto'
    TabOrder = 3
    DesignSize = (
      103
      44)
    Height = 44
    Width = 103
    object cxDBCalcEdit1: TcxDBCalcEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'VALORCUSTO'
      DataBinding.DataSource = dsCadastro
      Properties.DisplayFormat = 'R$ #0.00'
      TabOrder = 0
      Width = 83
    end
  end
  object cxGroupBox5: TcxGroupBox [4]
    Left = 123
    Top = 52
    Caption = 'Valor da Venda'
    TabOrder = 4
    DesignSize = (
      114
      44)
    Height = 44
    Width = 114
    object cxDBCalcEdit2: TcxDBCalcEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'VALORVENDA'
      DataBinding.DataSource = dsCadastro
      Properties.DisplayFormat = 'R$ #0.00'
      TabOrder = 0
      Width = 94
    end
  end
  object gpb6: TcxGroupBox [5]
    Left = 123
    Top = 4
    Caption = 'Descri'#231#227'o do Produto'
    TabOrder = 1
    DesignSize = (
      234
      44)
    Height = 44
    Width = 234
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'DESCRICAO'
      DataBinding.DataSource = dsCadastro
      TabOrder = 0
      Width = 214
    end
  end
  object cxGroupBox3: TcxGroupBox [6]
    Left = 367
    Top = 52
    Caption = 'Quantidade'
    TabOrder = 6
    DesignSize = (
      110
      44)
    Height = 44
    Width = 110
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'QUANTIDADEESTOQUE'
      DataBinding.DataSource = dsCadastro
      TabOrder = 0
      Width = 90
    end
  end
  object cxGroupBox6: TcxGroupBox [7]
    Left = 247
    Top = 52
    Caption = 'Percentual'
    TabOrder = 5
    DesignSize = (
      110
      44)
    Height = 44
    Width = 110
    object cxDBCalcEdit3: TcxDBCalcEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      DataBinding.DataField = 'PERCENTUALLUCRO'
      DataBinding.DataSource = dsCadastro
      Properties.DisplayFormat = '0.00#%'
      TabOrder = 0
      Height = 21
      Width = 90
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsProdutos
    Left = 51
    Top = 16
  end
end
