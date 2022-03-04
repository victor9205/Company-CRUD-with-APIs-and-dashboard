unit UDMDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Datasnap.Provider, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  Datasnap.DBClient, Vcl.Dialogs;

type
  TdmDados = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDTransaction1: TFDTransaction;
    FDQProdutos: TFDQuery;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    dsProdutos: TDataSource;
    FDQProdutosCODIGO: TIntegerField;
    FDQProdutosDESCRICAO: TStringField;
    FDQProdutosDATAAQUISICAO: TDateField;
    FDQProdutosQUANTIDADEESTOQUE: TIntegerField;
    FDQProdutosVALORCUSTO: TFMTBCDField;
    FDQProdutosPERCENTUALLUCRO: TFMTBCDField;
    cdsProdutosCODIGO: TIntegerField;
    cdsProdutosDESCRICAO: TStringField;
    cdsProdutosDATAAQUISICAO: TDateField;
    cdsProdutosQUANTIDADEESTOQUE: TIntegerField;
    cdsProdutosVALORCUSTO: TFMTBCDField;
    cdsProdutosPERCENTUALLUCRO: TFMTBCDField;
    cdsProdutosVALORVENDA: TCurrencyField;
    FDQVendas: TFDQuery;
    dspVendas: TDataSetProvider;
    cdsVendas: TClientDataSet;
    dsVendas: TDataSource;
    FDQVendasCODIGO: TIntegerField;
    FDQVendasCODIGOCLIENTE: TIntegerField;
    FDQVendasDATA: TDateField;
    FDQVendasVALORTOTAL: TFMTBCDField;
    FDQFornecedor: TFDQuery;
    dspFornecedor: TDataSetProvider;
    dsFornecedor: TDataSource;
    cdsFornecedor: TClientDataSet;
    FDQEstoque: TFDQuery;
    dspEstoque: TDataSetProvider;
    cdsEstoque: TClientDataSet;
    dsEstoque: TDataSource;
    FDQEstoqueCODIGOPRODUTO: TIntegerField;
    FDQEstoqueDATA: TDateField;
    FDQEstoqueQUANTIDADE: TIntegerField;
    FDQEstoqueVALORCUSTO: TFMTBCDField;
    cdsEstoqueCODIGOPRODUTO: TIntegerField;
    cdsEstoqueDATA: TDateField;
    cdsEstoqueQUANTIDADE: TIntegerField;
    cdsEstoqueVALORCUSTO: TFMTBCDField;
    FDQVendedores: TFDQuery;
    dspVendedores: TDataSetProvider;
    cdsVendedores: TClientDataSet;
    dsVendedores: TDataSource;
    FDQClientes: TFDQuery;
    dspClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    dsClientes: TDataSource;
    FDQItemVenda: TFDQuery;
    dspItemVenda: TDataSetProvider;
    cdsItemVenda: TClientDataSet;
    dsItemVenda: TDataSource;
    FDQItemVendaCODIGOVENDA: TIntegerField;
    FDQItemVendaCODIGOPRODUTO: TIntegerField;
    FDQItemVendaQUANTIDADE: TIntegerField;
    FDQItemVendaVALORTOTAL: TFMTBCDField;
    FDQEmpregado: TFDQuery;
    dspEmpregado: TDataSetProvider;
    cdsEmpregado: TClientDataSet;
    dsEmpregado: TDataSource;
    FDQDependente: TFDQuery;
    dspDependente: TDataSetProvider;
    cdsDependente: TClientDataSet;
    dsDependente: TDataSource;
    FDQEmpregadoCODIGO: TIntegerField;
    FDQEmpregadoNOME: TStringField;
    FDQEmpregadoPESSOAJURIDICA: TStringField;
    FDQEmpregadoCNPJCPF: TStringField;
    FDQEmpregadoENDERECO: TStringField;
    FDQEmpregadoBAIRRO: TStringField;
    FDQEmpregadoCIDADE: TStringField;
    FDQEmpregadoUF: TStringField;
    FDQEmpregadoCEP: TStringField;
    FDQEmpregadoTELEFONE: TStringField;
    FDQEmpregadoPERCENTUALCOMISSAO: TFMTBCDField;
    FDQEmpregadoVOLUMEGERALVENDAS: TFMTBCDField;
    FDQEmpregadoDATANASCIMENTO: TDateField;
    cdsEmpregadoCODIGO: TIntegerField;
    cdsEmpregadoNOME: TStringField;
    cdsEmpregadoPESSOAJURIDICA: TStringField;
    cdsEmpregadoCNPJCPF: TStringField;
    cdsEmpregadoENDERECO: TStringField;
    cdsEmpregadoBAIRRO: TStringField;
    cdsEmpregadoCIDADE: TStringField;
    cdsEmpregadoUF: TStringField;
    cdsEmpregadoCEP: TStringField;
    cdsEmpregadoTELEFONE: TStringField;
    cdsEmpregadoPERCENTUALCOMISSAO: TFMTBCDField;
    cdsEmpregadoVOLUMEGERALVENDAS: TFMTBCDField;
    cdsEmpregadoDATANASCIMENTO: TDateField;
    FDQDependenteCODIGOEMPREGADO: TIntegerField;
    FDQDependenteCPF: TStringField;
    FDQDependenteNOME: TStringField;
    FDQDependenteENDERECO: TStringField;
    FDQDependenteBAIRRO: TStringField;
    FDQDependenteCIDADE: TStringField;
    FDQDependenteUF: TStringField;
    FDQDependenteCEP: TStringField;
    FDQDependenteTELEFONE: TStringField;
    FDQDependenteDATANASCIMENTO: TDateField;
    FDQDependenteNOMEPAI: TStringField;
    FDQDependenteNOMEMAE: TStringField;
    FDQClientesCODIGO: TIntegerField;
    FDQClientesNOME: TStringField;
    FDQClientesPESSOAJURIDICA: TStringField;
    FDQClientesCNPJCPF: TStringField;
    FDQClientesENDERECO: TStringField;
    FDQClientesBAIRRO: TStringField;
    FDQClientesCIDADE: TStringField;
    FDQClientesUF: TStringField;
    FDQClientesCEP: TStringField;
    FDQClientesTELEFONE: TStringField;
    FDQClientesDATANASCIMENTO: TDateField;
    FDQClientesSEXO: TStringField;
    cdsClientesCODIGO: TIntegerField;
    cdsClientesNOME: TStringField;
    cdsClientesPESSOAJURIDICA: TStringField;
    cdsClientesCNPJCPF: TStringField;
    cdsClientesENDERECO: TStringField;
    cdsClientesBAIRRO: TStringField;
    cdsClientesCIDADE: TStringField;
    cdsClientesUF: TStringField;
    cdsClientesCEP: TStringField;
    cdsClientesTELEFONE: TStringField;
    cdsClientesDATANASCIMENTO: TDateField;
    cdsClientesSEXO: TStringField;
    FDQVendedoresCODIGO: TIntegerField;
    FDQVendedoresNOME: TStringField;
    FDQVendedoresPESSOAJURIDICA: TStringField;
    FDQVendedoresCNPJCPF: TStringField;
    FDQVendedoresENDERECO: TStringField;
    FDQVendedoresBAIRRO: TStringField;
    FDQVendedoresCIDADE: TStringField;
    FDQVendedoresUF: TStringField;
    FDQVendedoresCEP: TStringField;
    FDQVendedoresTELEFONE: TStringField;
    FDQVendedoresPERCENTUALCOMISSAO: TFMTBCDField;
    FDQVendedoresVOLUMEGERALVENDAS: TFMTBCDField;
    FDQVendedoresDATANASCIMENTO: TDateField;
    cdsVendedoresCODIGO: TIntegerField;
    cdsVendedoresNOME: TStringField;
    cdsVendedoresPESSOAJURIDICA: TStringField;
    cdsVendedoresCNPJCPF: TStringField;
    cdsVendedoresENDERECO: TStringField;
    cdsVendedoresBAIRRO: TStringField;
    cdsVendedoresCIDADE: TStringField;
    cdsVendedoresUF: TStringField;
    cdsVendedoresCEP: TStringField;
    cdsVendedoresTELEFONE: TStringField;
    cdsVendedoresPERCENTUALCOMISSAO: TFMTBCDField;
    cdsVendedoresVOLUMEGERALVENDAS: TFMTBCDField;
    cdsVendedoresDATANASCIMENTO: TDateField;
    FDQFornecedorCODIGO: TIntegerField;
    FDQFornecedorRAZAOSOCIAL: TStringField;
    FDQFornecedorPESSOAJURIDICA: TStringField;
    FDQFornecedorCNPJCPF: TStringField;
    FDQFornecedorENDERECO: TStringField;
    FDQFornecedorBAIRRO: TStringField;
    FDQFornecedorCIDADE: TStringField;
    FDQFornecedorUF: TStringField;
    FDQFornecedorCEP: TStringField;
    FDQFornecedorTELEFONE: TStringField;
    FDQFornecedorLIMITEDECREDITO: TFMTBCDField;
    FDQFornecedorDATAINICIO: TDateField;
    cdsFornecedorCODIGO: TIntegerField;
    RAZAOSOCIAL: TStringField;
    cdsFornecedorPESSOAJURIDICA: TStringField;
    cdsFornecedorCNPJCPF: TStringField;
    cdsFornecedorENDERECO: TStringField;
    cdsFornecedorBAIRRO: TStringField;
    cdsFornecedorCIDADE: TStringField;
    cdsFornecedorUF: TStringField;
    cdsFornecedorCEP: TStringField;
    cdsFornecedorTELEFONE: TStringField;
    cdsFornecedorLIMITEDECREDITO: TFMTBCDField;
    cdsFornecedorDATAINICIO: TDateField;
    cdsItemVendaCODIGOVENDA: TIntegerField;
    cdsItemVendaCODIGOPRODUTO: TIntegerField;
    cdsItemVendaQUANTIDADE: TIntegerField;
    cdsItemVendaVALORTOTAL: TFMTBCDField;
    FDQItemVendaDESCRICAOPRODUTO: TStringField;
    FDQItemVendaVALORUNITARIO: TFMTBCDField;
    cdsItemVendaDESCRICAOPRODUTO: TStringField;
    cdsItemVendaVALORUNITARIO: TFMTBCDField;
    cdsEstoqueVALORTOTALESTOQUE: TCurrencyField;
    FDQVendasCLIENTENOME: TStringField;
    cdsVendasCODIGO: TIntegerField;
    cdsVendasCODIGOCLIENTE: TIntegerField;
    cdsVendasCLIENTENOME: TStringField;
    cdsVendasDATA: TDateField;
    cdsVendasVALORTOTAL: TFMTBCDField;
    cdsDependenteCODIGOEMPREGADO: TIntegerField;
    cdsDependenteCPF: TStringField;
    cdsDependenteNOME: TStringField;
    cdsDependenteENDERECO: TStringField;
    cdsDependenteBAIRRO: TStringField;
    cdsDependenteCIDADE: TStringField;
    cdsDependenteUF: TStringField;
    cdsDependenteCEP: TStringField;
    cdsDependenteTELEFONE: TStringField;
    cdsDependenteDATANASCIMENTO: TDateField;
    cdsDependenteNOMEPAI: TStringField;
    cdsDependenteNOMEMAE: TStringField;
    FDQCardsDashboard: TFDQuery;
    dspCardsDashboard: TDataSetProvider;
    cdsCardsDashboard: TClientDataSet;
    dsCardsDashboard: TDataSource;
    cdsCardsDashboardQTDCLIENTES: TIntegerField;
    cdsCardsDashboardNROEMPREGADOS: TIntegerField;
    cdsCardsDashboardQTDVENDAS: TIntegerField;
    cdsCardsDashboardTOTALVENDAS: TFMTBCDField;
    cdsCardsDashboardFDQCardsDashboardQTDCLIENTES: TIntegerField;
    cdsCardsDashboardFDQCardsDashboardNROEMPREGADOS: TIntegerField;
    cdsCardsDashboardFDQCardsDashboardQTDVENDAS: TIntegerField;
    FDQCardsDashboardTOTALVENDAS: TFMTBCDField;
    FDQEvolucaoVendas: TFDQuery;
    dspEvolucaoVendas: TDataSetProvider;
    cdsEvolucaoVendas: TClientDataSet;
    dsEvolucaoVendas: TDataSource;
    FDQProdutoMaisVendido: TFDQuery;
    dspProdutoMaisVendido: TDataSetProvider;
    cdsProdutoMaisVendido: TClientDataSet;
    dsProdutoMaisVendido: TDataSource;
    dsCardsDashboardFDQEvolucaoVendasMESANO: TStringField;
    FDQEvolucaoVendasTOTALVENDAS: TFMTBCDField;
    dsCardsDashboardEvolucaoVendasMESANO: TStringField;
    cdsEvolucaoVendasTOTALVENDAS: TFMTBCDField;
    dsCardsDashboardFDQProdutoMaisVendidoPRODUTO: TStringField;
    FDQProdutoMaisVendidoTOTALVENDA: TFMTBCDField;
    dsCardsDashboardProdutoMaisVendidoPRODUTO: TStringField;
    cdsProdutoMaisVendidoTOTALVENDA: TFMTBCDField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsProdutosCalcFields(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsProdutosAfterPost(DataSet: TDataSet);
    procedure cdsItemVendaBeforeOpen(DataSet: TDataSet);
    procedure cdsVendasAfterScroll(DataSet: TDataSet);
    procedure cdsVendasNewRecord(DataSet: TDataSet);
    procedure cdsItemVendaNewRecord(DataSet: TDataSet);
    procedure cdsItemVendaAfterPost(DataSet: TDataSet);
    procedure cdsVendedoresNewRecord(DataSet: TDataSet);
    procedure cdsClientesNewRecord(DataSet: TDataSet);
    procedure cdsProdutosNewRecord(DataSet: TDataSet);
    procedure cdsFornecedoresNewRecord(DataSet: TDataSet);
    procedure cdsEstoqueNewRecord(DataSet: TDataSet);
    procedure cdsEstoqueCalcFields(DataSet: TDataSet);
    procedure cdsDependenteAfterPost(DataSet: TDataSet);
    procedure cdsDependenteBeforeOpen(DataSet: TDataSet);
    procedure cdsDependenteNewRecord(DataSet: TDataSet);
    procedure cdsEmpregadoAfterScroll(DataSet: TDataSet);
    procedure cdsEmpregadoNewRecord(DataSet: TDataSet);
    procedure ParametrosDashboard(DataSet: TDataSet);

  private

    function ProximoCodigoFornecedor: Integer;
    function ProximoCodigoEstoque: Integer;
    function ProximoCodigoProduto: Integer;
    { Private declarations }
  public
    { Public declarations }
    function ProximoCodigo(NomeDaTabela, Campo: String; Incremento: Integer = 1): Integer;
    function ProximoCodigoDeVenda: Integer;
    function ProximoCodigoVendedor: Integer;
    function ProximoCodigoCliente: Integer;
    function TotalReceitaDeVendas: Currency;
    function ProximoCodigoEmpregado: Integer;
    function ProximoCodigoDependentes: Integer;
  end;

var
  dmDados: TdmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  System.DateUtils;

procedure TdmDados.cdsItemVendaAfterPost(DataSet: TDataSet);
begin
  cdsItemVenda.ApplyUpdates(0);
end;

procedure TdmDados.ParametrosDashboard(DataSet: TDataSet);
begin
  TClientDataSet(DataSet).ParamByName('DATAINICIO').AsDate := EncodeDate(YearOF(NOW), 1, 1);
  TClientDataSet(DataSet).ParamByName('DATAFIM').AsDate := EncodeDate(YearOF(NOW), 12, 31);
end;

function TdmDados.ProximoCodigo(NomeDaTabela, Campo: String; Incremento: Integer = 1): Integer;
var
  qry: TFDQuery;
begin
  Result := 0;
  qry := TFDQuery.Create(Self);
  qry.Connection := FDConnection1;

  try
   try
    qry.SQL.Add(Format('SELECT MAX(%s) AS QTD FROM %s;', [Campo, NomeDaTabela]));
    qry.Open;

    Result := qry.FieldByName('QTD').AsInteger + Incremento;
   except
    On E:Exception do
     begin
      ShowMessage(Format('Erro ao executar a consulta! Mensagem de erro interna: %s . Consulta SQL: %s', [E.Message, qry.SQL.Text]));
      Exit;
     end;
   end;
  finally
   qry.Free;
  end;
end;

procedure TdmDados.cdsFornecedoresNewRecord(DataSet: TDataSet);
begin
  cdsFornecedor.FieldByName('CODIGO').AsInteger := ProximoCodigoFornecedor;
end;

procedure TdmDados.cdsDependenteAfterPost(DataSet: TDataSet);
begin
  cdsDependente.ApplyUpdates(0);
end;

procedure TdmDados.cdsDependenteBeforeOpen(DataSet: TDataSet);
begin
  cdsDependente.ParamByName('CODIGOEMPREGADO').AsInteger := cdsEmpregado.FieldByName('CODIGO').AsInteger;
end;

procedure TdmDados.cdsDependenteNewRecord(DataSet: TDataSet);
begin
  cdsDependente.FieldByName('CODIGOEMPREGADO').AsInteger := cdsEmpregado.FieldByName('CODIGO').AsInteger;
end;

procedure TdmDados.cdsEmpregadoAfterScroll(DataSet: TDataSet);
begin

  cdsDependente.Close;
  cdsDependente.Open;

end;

procedure TdmDados.cdsEmpregadoNewRecord(DataSet: TDataSet);
begin
  cdsEmpregado.FieldByName('CODIGO').AsInteger := ProximoCodigoEmpregado;
end;

procedure TdmDados.cdsEstoqueCalcFields(DataSet: TDataSet);
begin

  cdsEstoqueVALORTOTALESTOQUE.AsCurrency := cdsEstoqueQUANTIDADE.AsCurrency * cdsEstoqueVALORCUSTO.AsCurrency;

end;

procedure TdmDados.cdsEstoqueNewRecord(DataSet: TDataSet);
begin
  cdsEstoque.FieldByName('CODIGOPRODUTO').AsInteger := ProximoCodigoEstoque;
end;

procedure TdmDados.cdsClientesNewRecord(DataSet: TDataSet);
begin
  cdsClientes.FieldByName('CODIGO').AsInteger := ProximoCodigoCliente;
end;

procedure TdmDados.cdsItemVendaBeforeOpen(DataSet: TDataSet);
begin
  cdsItemVenda.ParamByName('ICODIGOVENDA').AsInteger := cdsVendas.FieldByName('CODIGO').AsInteger;
end;

procedure TdmDados.cdsItemVendaNewRecord(DataSet: TDataSet);
begin
  cdsItemVenda.FieldByName('CODIGOVENDA').AsInteger := cdsVendas.FieldByName('CODIGO').AsInteger;
  cdsItemVenda.FieldByName('QUANTIDADE').AsInteger := 0;
  cdsItemVenda.FieldByName('VALORUNITARIO').AsInteger := 0;
end;

procedure TdmDados.cdsProdutosAfterPost(DataSet: TDataSet);
begin
  // Envia as alterações do ClientDataSet para o banco de dados
   TClientDataSet(DataSet).ApplyUpdates(0);
   TClientDataSet(DataSet).Refresh;
end;

procedure TdmDados.cdsProdutosCalcFields(DataSet: TDataSet);
begin
  // Campos calculados
  cdsProdutos.FieldByName('VALORVENDA').AsCurrency := (cdsProdutos.FieldByName('VALORCUSTO').AsCurrency * cdsProdutos.FieldByName('PERCENTUALLUCRO').AsCurrency / 100) +
                                                      cdsProdutos.FieldByName('VALORCUSTO').AsCurrency;
end;

procedure TdmDados.cdsProdutosNewRecord(DataSet: TDataSet);
begin
  cdsProdutos.FieldByName('CODIGO').AsInteger := ProximoCodigoProduto;
end;

procedure TdmDados.cdsVendasAfterScroll(DataSet: TDataSet);
begin
  cdsItemVenda.Close;
  cdsItemVenda.Open;
  cdsProdutos.Close;
  cdsProdutos.Open;
  cdsClientes.Close;
  cdsClientes.Open;
end;

procedure TdmDados.cdsVendasNewRecord(DataSet: TDataSet);
begin
  cdsVendas.FieldByName('CODIGO').AsInteger := ProximoCodigoDeVenda;
end;

procedure TdmDados.cdsVendedoresNewRecord(DataSet: TDataSet);
begin
  cdsVendedores.FieldByName('CODIGO').AsInteger := ProximoCodigoVendedor;
end;

procedure TdmDados.DataModuleCreate(Sender: TObject);
begin
  // Abre a conexão ao criar o datamodule
  FDConnection1.Connected := True;
  cdsProdutos.Open;
  cdsFornecedor.Open;
  cdsEstoque.Open;
  cdsClientes.Open;
  cdsVendedores.Open;
  cdsVendas.Open;
end;

procedure TdmDados.DataModuleDestroy(Sender: TObject);
begin
  // Fecha as conexões ao fechar a aplicação
  cdsProdutos.Close;
  cdsEstoque.Close;
  cdsClientes.Close;
  cdsVendedores.Close;
  cdsFornecedor.Close;
  cdsVendas.Close;
  FDConnection1.Connected := False;
end;

function TdmDados.ProximoCodigoDeVenda: Integer;
var
  Fquery: TFDQuery;
begin
  Fquery := TFDQuery.Create(Self);
  try
    Fquery.Connection := FDConnection1;
    Fquery.SQL.Add('SELECT max(CODIGO) FROM vendas;');
    Fquery.Open;
    Result := Fquery.Fields[0].AsInteger +1;
  finally
    Fquery.Free;
  end;
end;

function TdmDados.ProximoCodigoVendedor: Integer;
var
  Fquery: TFDQuery;
begin
  Fquery := TFDQuery.Create(Self);
  try
    Fquery.Connection := FDConnection1;
    Fquery.SQL.Add('SELECT max(CODIGO) FROM vendedores;');
    Fquery.Open;
    Result := Fquery.Fields[0].AsInteger +1;
  finally
    Fquery.Free;
  end;
end;

function TdmDados.ProximoCodigoCliente: Integer;
var
  Fquery: TFDQuery;
begin
  Fquery := TFDQuery.Create(Self);
  try
    Fquery.Connection := FDConnection1;
    Fquery.SQL.Add('SELECT max(CODIGO) FROM clientes;');
    Fquery.Open;
    Result := Fquery.Fields[0].AsInteger +1;
  finally
    Fquery.Free;
  end;
end;

function TdmDados.ProximoCodigoProduto: Integer;
var
  Fquery: TFDQuery;
begin
  Fquery := TFDQuery.Create(Self);
  try
    Fquery.Connection := FDConnection1;
    Fquery.SQL.Add('SELECT max(CODIGO) FROM produtos;');
    Fquery.Open;
    Result := Fquery.Fields[0].AsInteger +1;
  finally
    Fquery.Free;
  end;
end;

function TdmDados.ProximoCodigoFornecedor: Integer;
var
  Fquery: TFDQuery;
begin
  Fquery := TFDQuery.Create(Self);
  try
    Fquery.Connection := FDConnection1;
    Fquery.SQL.Add('SELECT max(CODIGO) FROM fornecedores;');
    Fquery.Open;
    Result := Fquery.Fields[0].AsInteger +1;
  finally
    Fquery.Free;
  end;
end;

function TdmDados.ProximoCodigoEstoque: Integer;
var
  Fquery: TFDQuery;
begin
  Fquery := TFDQuery.Create(Self);
  try
    Fquery.Connection := FDConnection1;
    Fquery.SQL.Add('SELECT max(CODIGOPRODUTO) FROM estoque;');
    Fquery.Open;
    Result := Fquery.Fields[0].AsInteger +1;
  finally
    Fquery.Free;
  end;
end;

function TdmDados.TotalReceitaDeVendas: Currency;
var
  Fquery: TFDQuery;
begin
  Fquery := TFDQuery.Create(Self);
  try
    Fquery.Connection := FDConnection1;
    Fquery.SQL.Add('SELECT sum(VALORTOTAL) FROM vendas;');
    Fquery.Open;
    Result := Fquery.Fields[0].AsCurrency;
  finally
    Fquery.Free;
  end;
end;

function TdmDados.ProximoCodigoEmpregado: Integer;
var
  Fquery: TFDQuery;
begin
  Fquery := TFDQuery.Create(Self);
  try
    Fquery.Connection := FDConnection1;
    Fquery.SQL.Add('SELECT max(CODIGO) FROM empregados;');
    Fquery.Open;
    Result := Fquery.Fields[0].AsInteger +1;
  finally
    Fquery.Free;
  end;
end;

 function TdmDados.ProximoCodigoDependentes: Integer;
var
  Fquery: TFDQuery;
begin
  Fquery := TFDQuery.Create(Self);
  try
    Fquery.Connection := FDConnection1;
    Fquery.SQL.Add('SELECT max(CODIGOEMPREGADO) FROM dependente;');
    Fquery.Open;
    Result := Fquery.Fields[0].AsInteger +1;
  finally
    Fquery.Free;
  end;
end;

end.
