program ExemploMVC;

uses
  SysUtils,
  Vcl.Forms,
  UfrmPrincipal in '..\Src\Forms\UfrmPrincipal.pas' {frmPrincipal},
  UViewGridPadrao in '..\Src\Forms\UViewGridPadrao.pas' {frmViewGrid},
  UDMDados in '..\Src\Dm\UDMDados.pas' {dmDados: TDataModule},
  UViewPadrao in '..\Src\Forms\UViewPadrao.pas' {frmViewPadrao},
  UConsultaReceitaFederal in '..\Src\Units\UConsultaReceitaFederal.pas',
  UDateTimeFunctions in '..\Src\Units\UDateTimeFunctions.pas',
  UStringFunctions in '..\Src\Units\UStringFunctions.pas',
  UIntegracaoDadosCliente in '..\Src\Units\UIntegracaoDadosCliente.pas',
  UNetFunctions in '..\Src\Units\UNetFunctions.pas',
  UOSFunctions in '..\Src\Units\UOSFunctions.pas',
  URegFunctions in '..\Src\Units\URegFunctions.pas',
  UMsgFunctions in '..\Src\Units\UMsgFunctions.pas',
  UNumberFunctions in '..\Src\Units\UNumberFunctions.pas',
  UTronException in '..\Src\Units\UTronException.pas',
  RegExpr in '..\Src\Units\RegExpr.pas',
  UAppFunctions in '..\Src\Units\UAppFunctions.pas',
  UFileFunctions in '..\Src\Units\UFileFunctions.pas',
  UIntegracaoDadosFornecedores in '..\Src\Units\UIntegracaoDadosFornecedores.pas',
  UIntegracaoDadosVendedor in '..\Src\Units\UIntegracaoDadosVendedor.pas',
  UConsultaCep in '..\Src\Units\UConsultaCep.pas',
  DashBoard in '..\Src\Forms\DashBoard.pas' {frmDashboard},
  UIntegracaoDadosEmpregados in '..\Src\Units\UIntegracaoDadosEmpregados.pas',
  UIntegracaoDadosDependente in '..\Src\Units\UIntegracaoDadosDependente.pas',
  UfrmSplash in '..\Src\Forms\UfrmSplash.pas' {frmSplash},
  UfrmCadastroDependentes in '..\Src\Forms\UfrmCadastroDependentes.pas' {frmCadastroDependentes},
  UfrmCadastroEmpregado in '..\Src\Forms\UfrmCadastroEmpregado.pas' {frmCadastroEmpregado},
  UfrmCadastroEstoque in '..\Src\Forms\UfrmCadastroEstoque.pas' {frmCadastroEstoque},
  UfrmCadastroFornecedor in '..\Src\Forms\UfrmCadastroFornecedor.pas' {frmCadastroFornecedor},
  UfrmCadastroProduto in '..\Src\Forms\UfrmCadastroProduto.pas' {frmCadastroProduto},
  UfrmCadastroVenda in '..\Src\Forms\UfrmCadastroVenda.pas' {frmCadastroVenda},
  UfrmCadastroVendedor in '..\Src\Forms\UfrmCadastroVendedor.pas' {frmCadastroVendedor},
  UfrmListagemDependentes in '..\Src\Forms\UfrmListagemDependentes.pas' {frmListagemDependentes},
  UfrmListagemEmpregados in '..\Src\Forms\UfrmListagemEmpregados.pas' {frmListagemEmpregados},
  UfrmListagemEstoque in '..\Src\Forms\UfrmListagemEstoque.pas' {frmListagemEstoque},
  UfrmListagemFornecedores in '..\Src\Forms\UfrmListagemFornecedores.pas' {frmListagemFornecedores},
  UfrmListagemProdutos in '..\Src\Forms\UfrmListagemProdutos.pas' {frmListagemProdutos},
  UfrmListagemVendas in '..\Src\Forms\UfrmListagemVendas.pas' {frmListagemVendas},
  UfrmListagemVendedores in '..\Src\Forms\UfrmListagemVendedores.pas' {frmListagemVendedores},
  UfrmCadastroCliente in '..\Src\Forms\UfrmCadastroCliente.pas' {frmCadastroCliente},
  UfrmListagemClientes in '..\Src\Forms\UfrmListagemClientes.pas' {frmListagemClientes},
  UfrmCadastroItemVenda in '..\Src\Forms\UfrmCadastroItemVenda.pas' {frmCadatroItemVenda},
  UfrmDashBoardTreinamento in '..\Src\Forms\UfrmDashBoardTreinamento.pas' {frmDashboardTreinamento};

{$R *.res}

begin
  Application.Initialize;

  frmSplash := TfrmSplash.Create(Application);
  frmSplash.Show;
  frmSplash.Update;
  frmSplash.Refresh;
  frmSplash.FormStyle := fsNormal;
  Sleep(5000);

  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastroCliente, frmCadastroCliente);
  Application.CreateForm(TfrmCadastroDependentes, frmCadastroDependentes);
  Application.CreateForm(TfrmCadastroEmpregado, frmCadastroEmpregado);
  Application.CreateForm(TfrmCadastroEstoque, frmCadastroEstoque);
  Application.CreateForm(TfrmCadastroFornecedor, frmCadastroFornecedor);
  Application.CreateForm(TfrmCadastroProduto, frmCadastroProduto);
  Application.CreateForm(TfrmCadastroVenda, frmCadastroVenda);
  Application.CreateForm(TfrmCadastroVendedor, frmCadastroVendedor);
  Application.CreateForm(TfrmListagemClientes, frmListagemClientes);
  Application.CreateForm(TfrmListagemDependentes, frmListagemDependentes);
  Application.CreateForm(TfrmListagemEmpregados, frmListagemEmpregados);
  Application.CreateForm(TfrmListagemEstoque, frmListagemEstoque);
  Application.CreateForm(TfrmListagemFornecedores, frmListagemFornecedores);
  Application.CreateForm(TfrmListagemProdutos, frmListagemProdutos);
  Application.CreateForm(TfrmListagemVendas, frmListagemVendas);
  Application.CreateForm(TfrmListagemVendedores, frmListagemVendedores);
  Application.CreateForm(TfrmCadastroCliente, frmCadastroCliente);
  Application.CreateForm(TfrmListagemClientes, frmListagemClientes);
  Application.CreateForm(TfrmCadatroItemVenda, frmCadatroItemVenda);
  Application.CreateForm(TfrmDashboardTreinamento, frmDashboardTreinamento);
  frmPrincipal.SplashForm := frmSplash;
  Application.Run;
end.
