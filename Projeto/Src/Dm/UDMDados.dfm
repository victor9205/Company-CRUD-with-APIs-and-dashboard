object dmDados: TdmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 695
  Width = 864
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=127.0.0.1'
      'Port=3051'
      'CharacterSet=WIN1252'
      
        'Database=C:\Projetos\TreinamentoEstagiarios\Estagiarios\Wictor\T' +
        'reinamentoDelphiMVC\Projeto\BD\EXEMPLO.FDB'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 40
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    DriverID = 'FB'
    VendorLib = 'fbclient.dll'
    Left = 56
    Top = 104
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 56
    Top = 168
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 54
    Top = 240
  end
  object FDQProdutos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      'P.CODIGO,'
      'P.DESCRICAO,'
      'P.DATAAQUISICAO,'
      'P.QUANTIDADEESTOQUE,'
      'P.VALORCUSTO,'
      'P.PERCENTUALLUCRO'
      'FROM PRODUTOS P'
      'ORDER BY P.CODIGO')
    Left = 227
    Top = 40
    object FDQProdutosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 80
    end
    object FDQProdutosDATAAQUISICAO: TDateField
      FieldName = 'DATAAQUISICAO'
      Origin = 'DATAAQUISICAO'
    end
    object FDQProdutosQUANTIDADEESTOQUE: TIntegerField
      FieldName = 'QUANTIDADEESTOQUE'
      Origin = 'QUANTIDADEESTOQUE'
    end
    object FDQProdutosVALORCUSTO: TFMTBCDField
      FieldName = 'VALORCUSTO'
      Origin = 'VALORCUSTO'
      Precision = 18
      Size = 2
    end
    object FDQProdutosPERCENTUALLUCRO: TFMTBCDField
      FieldName = 'PERCENTUALLUCRO'
      Origin = 'PERCENTUALLUCRO'
      Precision = 18
      Size = 2
    end
  end
  object dspProdutos: TDataSetProvider
    DataSet = FDQProdutos
    Left = 227
    Top = 104
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutos'
    AfterPost = cdsProdutosAfterPost
    AfterDelete = cdsProdutosAfterPost
    OnCalcFields = cdsProdutosCalcFields
    OnNewRecord = cdsProdutosNewRecord
    Left = 227
    Top = 168
    object cdsProdutosCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProdutosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 80
    end
    object cdsProdutosDATAAQUISICAO: TDateField
      DisplayLabel = 'Data de Aquisi'#231#227'o'
      FieldName = 'DATAAQUISICAO'
      Origin = 'DATAAQUISICAO'
    end
    object cdsProdutosQUANTIDADEESTOQUE: TIntegerField
      DisplayLabel = 'Quantidade em Estoque'
      FieldName = 'QUANTIDADEESTOQUE'
      Origin = 'QUANTIDADEESTOQUE'
    end
    object cdsProdutosVALORCUSTO: TFMTBCDField
      DisplayLabel = 'Valor do Custo do Produto'
      FieldName = 'VALORCUSTO'
      Origin = 'VALORCUSTO'
      Precision = 18
      Size = 2
    end
    object cdsProdutosPERCENTUALLUCRO: TFMTBCDField
      DisplayLabel = 'Percentual de Lucro'
      FieldName = 'PERCENTUALLUCRO'
      Origin = 'PERCENTUALLUCRO'
      Precision = 18
      Size = 2
    end
    object cdsProdutosVALORVENDA: TCurrencyField
      DisplayLabel = 'Valor de Venda'
      FieldKind = fkCalculated
      FieldName = 'VALORVENDA'
      Calculated = True
    end
  end
  object dsProdutos: TDataSource
    DataSet = cdsProdutos
    Left = 227
    Top = 240
  end
  object FDQEstoque: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      'P.CODIGOPRODUTO,'
      'P.DATA,'
      'P.QUANTIDADE,'
      'P.VALORCUSTO'
      'FROM ESTOQUE P'
      'ORDER BY P.CODIGOPRODUTO'
      '')
    Left = 688
    Top = 48
    object FDQEstoqueCODIGOPRODUTO: TIntegerField
      FieldName = 'CODIGOPRODUTO'
      Origin = 'CODIGOPRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQEstoqueDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQEstoqueQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object FDQEstoqueVALORCUSTO: TFMTBCDField
      FieldName = 'VALORCUSTO'
      Origin = 'VALORCUSTO'
      Precision = 18
      Size = 2
    end
  end
  object dspEstoque: TDataSetProvider
    DataSet = FDQEstoque
    Left = 688
    Top = 104
  end
  object cdsEstoque: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstoque'
    AfterPost = cdsProdutosAfterPost
    AfterDelete = cdsProdutosAfterPost
    OnCalcFields = cdsEstoqueCalcFields
    OnNewRecord = cdsEstoqueNewRecord
    Left = 688
    Top = 168
    object cdsEstoqueCODIGOPRODUTO: TIntegerField
      DisplayLabel = 'Produto'
      FieldName = 'CODIGOPRODUTO'
      Required = True
    end
    object cdsEstoqueDATA: TDateField
      DisplayLabel = 'Data Estoque'
      FieldName = 'DATA'
      Required = True
    end
    object cdsEstoqueQUANTIDADE: TIntegerField
      DisplayLabel = 'Quantidade Produto'
      FieldName = 'QUANTIDADE'
    end
    object cdsEstoqueVALORCUSTO: TFMTBCDField
      DisplayLabel = 'Custo do Produto'
      FieldName = 'VALORCUSTO'
      EditFormat = 'R$ #0.00'
      Precision = 18
      Size = 2
    end
    object cdsEstoqueVALORTOTALESTOQUE: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'VALORTOTALESTOQUE'
      DisplayFormat = 'R$ #0.00'
      Calculated = True
    end
  end
  object dsEstoque: TDataSource
    DataSet = cdsEstoque
    Left = 688
    Top = 232
  end
  object FDQVendedores: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      'V.CODIGO,'
      'V.NOME,'
      'V.PESSOAJURIDICA,'
      'V.CNPJCPF,'
      'V.ENDERECO,'
      'V.BAIRRO,'
      'V.CIDADE,'
      'V.UF,'
      'V.CEP,'
      'V.TELEFONE,'
      'V.PERCENTUALCOMISSAO,'
      'V.VOLUMEGERALVENDAS,'
      'V.DATANASCIMENTO'
      'FROM VENDEDORES V'
      'ORDER BY V.CODIGO')
    Left = 448
    Top = 40
    object FDQVendedoresCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQVendedoresNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 80
    end
    object FDQVendedoresPESSOAJURIDICA: TStringField
      FieldName = 'PESSOAJURIDICA'
      Origin = 'PESSOAJURIDICA'
      Size = 1
    end
    object FDQVendedoresCNPJCPF: TStringField
      FieldName = 'CNPJCPF'
      Origin = 'CNPJCPF'
      Size = 18
    end
    object FDQVendedoresENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 80
    end
    object FDQVendedoresBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 80
    end
    object FDQVendedoresCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 80
    end
    object FDQVendedoresUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object FDQVendedoresCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object FDQVendedoresTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
    end
    object FDQVendedoresPERCENTUALCOMISSAO: TFMTBCDField
      FieldName = 'PERCENTUALCOMISSAO'
      Origin = 'PERCENTUALCOMISSAO'
      Precision = 18
      Size = 2
    end
    object FDQVendedoresVOLUMEGERALVENDAS: TFMTBCDField
      FieldName = 'VOLUMEGERALVENDAS'
      Origin = 'VOLUMEGERALVENDAS'
      Precision = 18
      Size = 2
    end
    object FDQVendedoresDATANASCIMENTO: TDateField
      FieldName = 'DATANASCIMENTO'
      Origin = 'DATANASCIMENTO'
    end
  end
  object dspVendedores: TDataSetProvider
    DataSet = FDQVendedores
    Left = 448
    Top = 104
  end
  object cdsVendedores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVendedores'
    AfterPost = cdsProdutosAfterPost
    AfterDelete = cdsProdutosAfterPost
    OnCalcFields = cdsProdutosCalcFields
    OnNewRecord = cdsVendedoresNewRecord
    Left = 448
    Top = 168
    object cdsVendedoresCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsVendedoresNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 80
    end
    object cdsVendedoresPESSOAJURIDICA: TStringField
      FieldName = 'PESSOAJURIDICA'
      Size = 1
    end
    object cdsVendedoresCNPJCPF: TStringField
      FieldName = 'CNPJCPF'
      Size = 18
    end
    object cdsVendedoresENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 80
    end
    object cdsVendedoresBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 80
    end
    object cdsVendedoresCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 80
    end
    object cdsVendedoresUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsVendedoresCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsVendedoresTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object cdsVendedoresPERCENTUALCOMISSAO: TFMTBCDField
      FieldName = 'PERCENTUALCOMISSAO'
      Precision = 18
      Size = 2
    end
    object cdsVendedoresVOLUMEGERALVENDAS: TFMTBCDField
      FieldName = 'VOLUMEGERALVENDAS'
      Precision = 18
      Size = 2
    end
    object cdsVendedoresDATANASCIMENTO: TDateField
      FieldName = 'DATANASCIMENTO'
    end
  end
  object dsVendedores: TDataSource
    DataSet = cdsVendedores
    Left = 448
    Top = 240
  end
  object FDQVendas: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      'v.CODIGO,'
      'v.CODIGOCLIENTE,'
      'c.NOME AS CLIENTENOME,'
      'v.DATA,'
      'v.VALORTOTAL'
      'FROM VENDAS v'
      'INNER JOIN CLIENTES c ON v.CODIGOCLIENTE = c.CODIGO '
      '')
    Left = 48
    Top = 328
    object FDQVendasCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQVendasCODIGOCLIENTE: TIntegerField
      DisplayLabel = 'C'#243'digo do Cliente'
      FieldName = 'CODIGOCLIENTE'
      Origin = 'CODIGOCLIENTE'
    end
    object FDQVendasCLIENTENOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'CLIENTENOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object FDQVendasDATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object FDQVendasVALORTOTAL: TFMTBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALORTOTAL'
      Origin = 'VALORTOTAL'
      Precision = 18
      Size = 2
    end
  end
  object dspVendas: TDataSetProvider
    DataSet = FDQVendas
    Left = 48
    Top = 392
  end
  object cdsVendas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ICODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspVendas'
    AfterPost = cdsProdutosAfterPost
    AfterDelete = cdsProdutosAfterPost
    AfterScroll = cdsVendasAfterScroll
    OnCalcFields = cdsProdutosCalcFields
    OnNewRecord = cdsVendasNewRecord
    Left = 48
    Top = 456
    object cdsVendasCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsVendasCODIGOCLIENTE: TIntegerField
      DisplayLabel = 'C'#243'digo do Cliente'
      FieldName = 'CODIGOCLIENTE'
    end
    object cdsVendasCLIENTENOME: TStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'CLIENTENOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object cdsVendasDATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsVendasVALORTOTAL: TFMTBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALORTOTAL'
      Precision = 18
      Size = 2
    end
  end
  object dsVendas: TDataSource
    DataSet = cdsClientes
    Left = 48
    Top = 528
  end
  object FDQClientes: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      'C.CODIGO,'
      'C.NOME,'
      'C.PESSOAJURIDICA,'
      'C.CNPJCPF,'
      'C.ENDERECO,'
      'C.BAIRRO,'
      'C.CIDADE,'
      'C.UF,'
      'C.CEP,'
      'C.TELEFONE,'
      'C.DATANASCIMENTO,'
      'C.SEXO'
      'FROM CLIENTES C'
      'ORDER BY C.CODIGO')
    Left = 344
    Top = 40
    object FDQClientesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQClientesNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 80
    end
    object FDQClientesPESSOAJURIDICA: TStringField
      FieldName = 'PESSOAJURIDICA'
      Origin = 'PESSOAJURIDICA'
      Size = 1
    end
    object FDQClientesCNPJCPF: TStringField
      FieldName = 'CNPJCPF'
      Origin = 'CNPJCPF'
      Size = 18
    end
    object FDQClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 80
    end
    object FDQClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 80
    end
    object FDQClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 80
    end
    object FDQClientesUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object FDQClientesCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object FDQClientesTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
    end
    object FDQClientesDATANASCIMENTO: TDateField
      FieldName = 'DATANASCIMENTO'
      Origin = 'DATANASCIMENTO'
    end
    object FDQClientesSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'SEXO'
      Size = 1
    end
  end
  object dspClientes: TDataSetProvider
    DataSet = FDQClientes
    Left = 344
    Top = 104
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    AfterPost = cdsProdutosAfterPost
    AfterDelete = cdsProdutosAfterPost
    OnCalcFields = cdsProdutosCalcFields
    OnNewRecord = cdsClientesNewRecord
    Left = 344
    Top = 168
    object cdsClientesCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsClientesNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Required = True
      Size = 80
    end
    object cdsClientesPESSOAJURIDICA: TStringField
      DisplayLabel = #201' Pessoa Jur'#237'dica'
      FieldName = 'PESSOAJURIDICA'
      Size = 1
    end
    object cdsClientesCNPJCPF: TStringField
      DisplayLabel = 'Inscri'#231#227'o'
      FieldName = 'CNPJCPF'
      Size = 18
    end
    object cdsClientesENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Size = 80
    end
    object cdsClientesBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Size = 80
    end
    object cdsClientesCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Size = 80
    end
    object cdsClientesUF: TStringField
      DisplayLabel = 'U.F.'
      FieldName = 'UF'
      Size = 2
    end
    object cdsClientesCEP: TStringField
      DisplayLabel = 'C.E.P.'
      FieldName = 'CEP'
      Size = 10
    end
    object cdsClientesTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
    end
    object cdsClientesDATANASCIMENTO: TDateField
      DisplayLabel = 'Data de nascimento'
      FieldName = 'DATANASCIMENTO'
    end
    object cdsClientesSEXO: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'SEXO'
      Size = 1
    end
  end
  object dsClientes: TDataSource
    DataSet = cdsClientes
    Left = 344
    Top = 240
  end
  object FDQFornecedor: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      'F.CODIGO,'
      'F.RAZAOSOCIAL,'
      'F.PESSOAJURIDICA,'
      'F.CNPJCPF,'
      'F.ENDERECO,'
      'F.BAIRRO,'
      'F.CIDADE,'
      'F.UF,'
      'F.CEP,'
      'F.TELEFONE,'
      'F.LIMITEDECREDITO,'
      'F.DATAINICIO'
      'FROM FORNECEDORES F'
      'ORDER BY F.CODIGO')
    Left = 568
    Top = 40
    object FDQFornecedorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQFornecedorRAZAOSOCIAL: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'RAZAOSOCIAL'
      Origin = 'RAZAOSOCIAL'
      Size = 80
    end
    object FDQFornecedorPESSOAJURIDICA: TStringField
      FieldName = 'PESSOAJURIDICA'
      Origin = 'PESSOAJURIDICA'
      Size = 1
    end
    object FDQFornecedorCNPJCPF: TStringField
      FieldName = 'CNPJCPF'
      Origin = 'CNPJCPF'
      Size = 18
    end
    object FDQFornecedorENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 80
    end
    object FDQFornecedorBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 80
    end
    object FDQFornecedorCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 80
    end
    object FDQFornecedorUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object FDQFornecedorCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object FDQFornecedorTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
    end
    object FDQFornecedorLIMITEDECREDITO: TFMTBCDField
      FieldName = 'LIMITEDECREDITO'
      Origin = 'LIMITEDECREDITO'
      Precision = 18
      Size = 2
    end
    object FDQFornecedorDATAINICIO: TDateField
      DisplayLabel = 'Data de Nascimento ou Abertura'
      FieldName = 'DATAINICIO'
      Origin = 'DATAINICIO'
    end
  end
  object dspFornecedor: TDataSetProvider
    DataSet = FDQFornecedor
    Left = 568
    Top = 104
  end
  object dsFornecedor: TDataSource
    DataSet = cdsFornecedor
    Left = 568
    Top = 240
  end
  object cdsFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFornecedor'
    AfterPost = cdsProdutosAfterPost
    AfterDelete = cdsProdutosAfterPost
    OnCalcFields = cdsProdutosCalcFields
    OnNewRecord = cdsFornecedoresNewRecord
    Left = 568
    Top = 176
    object cdsFornecedorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object RAZAOSOCIAL: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'RAZAOSOCIAL'
      Size = 80
    end
    object cdsFornecedorPESSOAJURIDICA: TStringField
      FieldName = 'PESSOAJURIDICA'
      Size = 1
    end
    object cdsFornecedorCNPJCPF: TStringField
      FieldName = 'CNPJCPF'
      Size = 18
    end
    object cdsFornecedorENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 80
    end
    object cdsFornecedorBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 80
    end
    object cdsFornecedorCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 80
    end
    object cdsFornecedorUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsFornecedorCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsFornecedorTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object cdsFornecedorLIMITEDECREDITO: TFMTBCDField
      FieldName = 'LIMITEDECREDITO'
      DisplayFormat = 'R$ #0.00'
      Precision = 18
      Size = 2
    end
    object cdsFornecedorDATAINICIO: TDateField
      DisplayLabel = 'Data de Nascimento ou Abertura'
      FieldName = 'DATAINICIO'
    end
  end
  object FDQItemVenda: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      'I.CODIGOVENDA,'
      'I.CODIGOPRODUTO,'
      'P.DESCRICAO AS DESCRICAOPRODUTO,'
      'I.QUANTIDADE,'
      'I.VALORUNITARIO,'
      'I.VALORTOTAL'
      'FROM ITEMVENDA I'
      'INNER JOIN PRODUTOS P ON I.CODIGOPRODUTO = P.CODIGO '
      'WHERE I.CODIGOVENDA = :iCodigoVenda')
    Left = 176
    Top = 336
    ParamData = <
      item
        Position = 1
        Name = 'ICODIGOVENDA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object FDQItemVendaCODIGOVENDA: TIntegerField
      FieldName = 'CODIGOVENDA'
      Origin = 'CODIGOVENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQItemVendaCODIGOPRODUTO: TIntegerField
      FieldName = 'CODIGOPRODUTO'
      Origin = 'CODIGOPRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQItemVendaDESCRICAOPRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAOPRODUTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object FDQItemVendaQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object FDQItemVendaVALORUNITARIO: TFMTBCDField
      FieldName = 'VALORUNITARIO'
      Origin = 'VALORUNITARIO'
      Precision = 18
      Size = 2
    end
    object FDQItemVendaVALORTOTAL: TFMTBCDField
      FieldName = 'VALORTOTAL'
      Origin = 'VALORTOTAL'
      Precision = 18
      Size = 2
    end
  end
  object dspItemVenda: TDataSetProvider
    DataSet = FDQItemVenda
    Left = 176
    Top = 400
  end
  object cdsItemVenda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ICODIGOVENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspItemVenda'
    BeforeOpen = cdsItemVendaBeforeOpen
    AfterPost = cdsItemVendaAfterPost
    AfterDelete = cdsItemVendaAfterPost
    OnCalcFields = cdsProdutosCalcFields
    OnNewRecord = cdsItemVendaNewRecord
    Left = 168
    Top = 464
    object cdsItemVendaCODIGOVENDA: TIntegerField
      DisplayLabel = 'C'#243'digo da Venda'
      FieldName = 'CODIGOVENDA'
      Required = True
    end
    object cdsItemVendaCODIGOPRODUTO: TIntegerField
      DisplayLabel = 'C'#243'digo do Produto'
      FieldName = 'CODIGOPRODUTO'
      Required = True
    end
    object cdsItemVendaDESCRICAOPRODUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DESCRICAOPRODUTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object cdsItemVendaQUANTIDADE: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
    end
    object cdsItemVendaVALORUNITARIO: TFMTBCDField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VALORUNITARIO'
      Precision = 18
      Size = 2
    end
    object cdsItemVendaVALORTOTAL: TFMTBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALORTOTAL'
      Precision = 18
      Size = 2
    end
  end
  object dsItemVenda: TDataSource
    DataSet = cdsItemVenda
    Left = 176
    Top = 536
  end
  object FDQEmpregado: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      'E.CODIGO,'
      'E.NOME,'
      'E.PESSOAJURIDICA,'
      'E.CNPJCPF,'
      'E.ENDERECO,'
      'E.BAIRRO,'
      'E.CIDADE,'
      'E.UF,'
      'E.CEP,'
      'E.TELEFONE,'
      'E.PERCENTUALCOMISSAO,'
      'E.VOLUMEGERALVENDAS,'
      'E.DATANASCIMENTO'
      'FROM EMPREGADOS E')
    Left = 288
    Top = 336
    object FDQEmpregadoCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQEmpregadoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 80
    end
    object FDQEmpregadoPESSOAJURIDICA: TStringField
      DisplayLabel = 'Pessoa Jur'#237'dica'
      FieldName = 'PESSOAJURIDICA'
      Origin = 'PESSOAJURIDICA'
      Size = 1
    end
    object FDQEmpregadoCNPJCPF: TStringField
      DisplayLabel = 'CNPJ/CPF'
      FieldName = 'CNPJCPF'
      Origin = 'CNPJCPF'
      Size = 18
    end
    object FDQEmpregadoENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 80
    end
    object FDQEmpregadoBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 80
    end
    object FDQEmpregadoCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 80
    end
    object FDQEmpregadoUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object FDQEmpregadoCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object FDQEmpregadoTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
    end
    object FDQEmpregadoPERCENTUALCOMISSAO: TFMTBCDField
      DisplayLabel = 'Percentual da Comiss'#227'o'
      FieldName = 'PERCENTUALCOMISSAO'
      Origin = 'PERCENTUALCOMISSAO'
      Precision = 18
      Size = 2
    end
    object FDQEmpregadoVOLUMEGERALVENDAS: TFMTBCDField
      DisplayLabel = 'Volume Geral de Vendas'
      FieldName = 'VOLUMEGERALVENDAS'
      Origin = 'VOLUMEGERALVENDAS'
      Precision = 18
      Size = 2
    end
    object FDQEmpregadoDATANASCIMENTO: TDateField
      DisplayLabel = 'Data de Nascimento'
      FieldName = 'DATANASCIMENTO'
      Origin = 'DATANASCIMENTO'
    end
  end
  object dspEmpregado: TDataSetProvider
    DataSet = FDQEmpregado
    Left = 288
    Top = 400
  end
  object cdsEmpregado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpregado'
    AfterPost = cdsProdutosAfterPost
    AfterDelete = cdsProdutosAfterPost
    AfterScroll = cdsEmpregadoAfterScroll
    OnNewRecord = cdsEmpregadoNewRecord
    Left = 288
    Top = 464
    object cdsEmpregadoCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsEmpregadoNOME: TStringField
      DisplayLabel = 'Nome do Empregado'
      FieldName = 'NOME'
      Required = True
      Size = 80
    end
    object cdsEmpregadoPESSOAJURIDICA: TStringField
      DisplayLabel = #201' pessoa Jur'#237'dica'
      FieldName = 'PESSOAJURIDICA'
      Size = 1
    end
    object cdsEmpregadoCNPJCPF: TStringField
      DisplayLabel = 'CNPJ/CPF'
      FieldName = 'CNPJCPF'
      Size = 18
    end
    object cdsEmpregadoENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Size = 80
    end
    object cdsEmpregadoBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Size = 80
    end
    object cdsEmpregadoCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Size = 80
    end
    object cdsEmpregadoUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsEmpregadoCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsEmpregadoTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
    end
    object cdsEmpregadoPERCENTUALCOMISSAO: TFMTBCDField
      DisplayLabel = 'Percentual de Comiss'#227'o'
      FieldName = 'PERCENTUALCOMISSAO'
      Precision = 18
      Size = 2
    end
    object cdsEmpregadoVOLUMEGERALVENDAS: TFMTBCDField
      DisplayLabel = 'Volume Geral das Vendas'
      FieldName = 'VOLUMEGERALVENDAS'
      Precision = 18
      Size = 2
    end
    object cdsEmpregadoDATANASCIMENTO: TDateField
      DisplayLabel = 'Data de Nascimento'
      FieldName = 'DATANASCIMENTO'
    end
  end
  object dsEmpregado: TDataSource
    DataSet = cdsEmpregado
    Left = 288
    Top = 536
  end
  object FDQDependente: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      'D.CODIGOEMPREGADO,'
      'D.CPF,'
      'D.NOME,'
      'D.ENDERECO,'
      'D.BAIRRO,'
      'D.CIDADE,'
      'D.UF,'
      'D.CEP,'
      'D.TELEFONE,'
      'D.DATANASCIMENTO,'
      'D.NOMEPAI,'
      'D.NOMEMAE'
      'FROM DEPENDENTES D'
      'WHERE D.CODIGOEMPREGADO = :CODIGOEMPREGADO')
    Left = 392
    Top = 336
    ParamData = <
      item
        Position = 1
        Name = 'CODIGOEMPREGADO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object FDQDependenteCODIGOEMPREGADO: TIntegerField
      FieldName = 'CODIGOEMPREGADO'
      Origin = 'CODIGOEMPREGADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQDependenteCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object FDQDependenteNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 80
    end
    object FDQDependenteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 80
    end
    object FDQDependenteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 80
    end
    object FDQDependenteCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 80
    end
    object FDQDependenteUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object FDQDependenteCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object FDQDependenteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
    end
    object FDQDependenteDATANASCIMENTO: TDateField
      FieldName = 'DATANASCIMENTO'
      Origin = 'DATANASCIMENTO'
    end
    object FDQDependenteNOMEPAI: TStringField
      FieldName = 'NOMEPAI'
      Origin = 'NOMEPAI'
      Size = 80
    end
    object FDQDependenteNOMEMAE: TStringField
      FieldName = 'NOMEMAE'
      Origin = 'NOMEMAE'
      Size = 80
    end
  end
  object dspDependente: TDataSetProvider
    DataSet = FDQDependente
    Left = 392
    Top = 400
  end
  object cdsDependente: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGOEMPREGADO'
        ParamType = ptInput
      end>
    ProviderName = 'dspDependente'
    BeforeOpen = cdsDependenteBeforeOpen
    AfterPost = cdsDependenteAfterPost
    AfterDelete = cdsDependenteAfterPost
    OnNewRecord = cdsDependenteNewRecord
    Left = 392
    Top = 464
    object cdsDependenteCODIGOEMPREGADO: TIntegerField
      DisplayLabel = 'C'#243'digo do Empregado'
      FieldName = 'CODIGOEMPREGADO'
      Required = True
    end
    object cdsDependenteCPF: TStringField
      FieldName = 'CPF'
      Required = True
      Size = 18
    end
    object cdsDependenteNOME: TStringField
      DisplayLabel = 'Nome do Dependente'
      FieldName = 'NOME'
      Required = True
      Size = 80
    end
    object cdsDependenteENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Size = 80
    end
    object cdsDependenteBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Size = 80
    end
    object cdsDependenteCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Size = 80
    end
    object cdsDependenteUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsDependenteCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsDependenteTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
    end
    object cdsDependenteDATANASCIMENTO: TDateField
      DisplayLabel = 'Data de Nascimento'
      FieldName = 'DATANASCIMENTO'
    end
    object cdsDependenteNOMEPAI: TStringField
      DisplayLabel = 'Nome do Pai'
      FieldName = 'NOMEPAI'
      Size = 80
    end
    object cdsDependenteNOMEMAE: TStringField
      DisplayLabel = 'Nome da M'#227'e'
      FieldName = 'NOMEMAE'
      Size = 80
    end
  end
  object dsDependente: TDataSource
    DataSet = cdsDependente
    Left = 392
    Top = 536
  end
  object FDQCardsDashboard: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '*'
      'FROM PRC_CARDSDASHBOARD (:DATAINICIO, :DATAFIM)')
    Left = 504
    Top = 336
    ParamData = <
      item
        Position = 1
        Name = 'DATAINICIO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'DATAFIM'
        DataType = ftDate
        ParamType = ptInput
      end>
    object cdsCardsDashboardFDQCardsDashboardQTDCLIENTES: TIntegerField
      FieldName = 'QTDCLIENTES'
      Origin = 'QTDCLIENTES'
    end
    object cdsCardsDashboardFDQCardsDashboardNROEMPREGADOS: TIntegerField
      FieldName = 'NROEMPREGADOS'
      Origin = 'NROEMPREGADOS'
    end
    object cdsCardsDashboardFDQCardsDashboardQTDVENDAS: TIntegerField
      FieldName = 'QTDVENDAS'
      Origin = 'QTDVENDAS'
    end
    object FDQCardsDashboardTOTALVENDAS: TFMTBCDField
      FieldName = 'TOTALVENDAS'
      Origin = 'TOTALVENDAS'
      Precision = 18
      Size = 2
    end
  end
  object dspCardsDashboard: TDataSetProvider
    DataSet = FDQCardsDashboard
    Left = 504
    Top = 400
  end
  object cdsCardsDashboard: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspCardsDashboard'
    BeforeOpen = ParametrosDashboard
    Left = 504
    Top = 480
    object cdsCardsDashboardQTDCLIENTES: TIntegerField
      FieldName = 'QTDCLIENTES'
    end
    object cdsCardsDashboardNROEMPREGADOS: TIntegerField
      FieldName = 'NROEMPREGADOS'
    end
    object cdsCardsDashboardQTDVENDAS: TIntegerField
      FieldName = 'QTDVENDAS'
    end
    object cdsCardsDashboardTOTALVENDAS: TFMTBCDField
      FieldName = 'TOTALVENDAS'
      Precision = 18
      Size = 2
    end
  end
  object dsCardsDashboard: TDataSource
    DataSet = cdsCardsDashboard
    Left = 504
    Top = 544
  end
  object FDQEvolucaoVendas: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '*'
      'FROM PRC_EVOLUCAOVENDAS (:DATAINICIO, :DATAFIM)')
    Left = 616
    Top = 336
    ParamData = <
      item
        Position = 1
        Name = 'DATAINICIO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'DATAFIM'
        DataType = ftDate
        ParamType = ptInput
      end>
    object dsCardsDashboardFDQEvolucaoVendasMESANO: TStringField
      FieldName = 'MESANO'
      Origin = 'MESANO'
      Size = 7
    end
    object FDQEvolucaoVendasTOTALVENDAS: TFMTBCDField
      FieldName = 'TOTALVENDAS'
      Origin = 'TOTALVENDAS'
      Precision = 18
      Size = 2
    end
  end
  object dspEvolucaoVendas: TDataSetProvider
    DataSet = FDQEvolucaoVendas
    Left = 616
    Top = 400
  end
  object cdsEvolucaoVendas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspEvolucaoVendas'
    BeforeOpen = ParametrosDashboard
    Left = 616
    Top = 480
    object dsCardsDashboardEvolucaoVendasMESANO: TStringField
      FieldName = 'MESANO'
      Size = 7
    end
    object cdsEvolucaoVendasTOTALVENDAS: TFMTBCDField
      FieldName = 'TOTALVENDAS'
      Precision = 18
      Size = 2
    end
  end
  object dsEvolucaoVendas: TDataSource
    DataSet = cdsEvolucaoVendas
    Left = 616
    Top = 544
  end
  object FDQProdutoMaisVendido: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '*'
      'FROM PRC_PRODUTOMAISVENDIDO (:DATAINICIO, :DATAFIM)')
    Left = 736
    Top = 336
    ParamData = <
      item
        Position = 1
        Name = 'DATAINICIO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'DATAFIM'
        DataType = ftDate
        ParamType = ptInput
      end>
    object dsCardsDashboardFDQProdutoMaisVendidoPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Size = 80
    end
    object FDQProdutoMaisVendidoTOTALVENDA: TFMTBCDField
      FieldName = 'TOTALVENDA'
      Origin = 'TOTALVENDA'
      Precision = 18
      Size = 2
    end
  end
  object dspProdutoMaisVendido: TDataSetProvider
    DataSet = FDQProdutoMaisVendido
    Left = 736
    Top = 400
  end
  object cdsProdutoMaisVendido: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspProdutoMaisVendido'
    BeforeOpen = ParametrosDashboard
    Left = 736
    Top = 480
    object dsCardsDashboardProdutoMaisVendidoPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 80
    end
    object cdsProdutoMaisVendidoTOTALVENDA: TFMTBCDField
      FieldName = 'TOTALVENDA'
      Precision = 18
      Size = 2
    end
  end
  object dsProdutoMaisVendido: TDataSource
    DataSet = cdsProdutoMaisVendido
    Left = 736
    Top = 544
  end
end
