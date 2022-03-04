unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Produtos1: TMenuItem;
    Movimentao1: TMenuItem;
    Vendas1: TMenuItem;
    N1: TMenuItem;
    Clientes1: TMenuItem;
    Fornecedores1: TMenuItem;
    Marcas1: TMenuItem;
    Backup1: TMenuItem;
    N2: TMenuItem;
    Estoque1: TMenuItem;
    Vendedores1: TMenuItem;
    Empregados1: TMenuItem;
    DashboarddeVendas1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure Estoque1Click(Sender: TObject);
    procedure Vendedores1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure Empregados1Click(Sender: TObject);
    procedure GerarDashBordClick(Sender: TObject);
    procedure DashboarddeVendas1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FSplashForm: TForm;

    procedure ReleaseSplash;
    { Private declarations }
  public
    { Public declarations }
    procedure AbrirListagemProdutos(Modal: boolean);
    procedure AbrirListagemFornecedores(Modal: boolean);
    procedure AbrirListagemEstoque(Modal: boolean);
    procedure AbrirListagemClientes(Modal: boolean);
    procedure AbrirListagemVendedores(Modal: boolean);
    procedure AbrirListagemVendas(Modal: boolean);
    procedure AbrirListagemEmpregados(Modal: boolean);
    procedure AbrirDashBord(Modal: boolean);

  published
    property SplashForm: TForm read FSplashForm write FSplashForm;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
     UfrmListagemProdutos, UfrmListagemClientes, UfrmListagemVendedores,
     UfrmListagemEstoque, UfrmListagemVendas, UfrmListagemFornecedores,
     UfrmListagemEmpregados, UfrmDashBoardTreinamento;

procedure TfrmPrincipal.AbrirListagemClientes(Modal: boolean);
var
  frmListagemClientes: TfrmListagemClientes;
begin
  frmListagemClientes := TfrmListagemClientes.Create(Self);
  frmListagemClientes.ExibirComoModal := Modal;

  if Modal then
   begin
    frmListagemClientes.ShowModal;

    if Assigned(frmListagemClientes) then
     FreeAndNil(frmListagemClientes);
   end
  else
   frmListagemClientes.Show;
end;

procedure TfrmPrincipal.AbrirListagemEstoque(Modal: boolean);
var
 frmListagemEstoque: TfrmListagemEstoque;
begin
// Cria uma instância do formulário da listagem para exibir

  frmListagemEstoque := TfrmListagemEstoque.Create(Self);
  frmListagemEstoque.ExibirComoModal := Modal;

  if Modal then
   begin
    frmListagemEstoque.ShowModal;

    if Assigned(frmListagemEstoque) then
     FreeAndNil(frmListagemEstoque);
   end
  else
   frmListagemEstoque.Show;

end;

procedure TfrmPrincipal.AbrirListagemProdutos(Modal: boolean);
var
  frmListagemProdutos: TfrmListagemProdutos;
begin
  // Cria uma instância do formulário da listagem para exibir

  frmListagemProdutos := TfrmListagemProdutos.Create(Self);
  frmListagemProdutos.ExibirComoModal := Modal;

  if Modal then
   begin
    frmListagemProdutos.ShowModal;

    if Assigned(frmListagemProdutos) then
     FreeAndNil(frmListagemProdutos);
   end
  else
   frmListagemProdutos.Show;
end;

procedure TfrmPrincipal.AbrirListagemVendas(Modal: boolean);
var
  frmListagemVendas: TfrmListagemVendas;
begin
    frmListagemVendas := TfrmListagemVendas.Create(Self);
    frmListagemVendas.ExibirComoModal := Modal;

    if Modal then
     begin
       frmListagemVendas.ShowModal;

       if Assigned(frmListagemVendas) then
        FreeAndNil(frmListagemVendas);
     end
    else
      frmListagemVendas.Show;
end;

procedure TfrmPrincipal.AbrirListagemFornecedores(Modal: boolean);
var
 frmListagemFornecedores : TfrmListagemFornecedores;
begin
 frmListagemFornecedores := TfrmListagemFornecedores.Create(Self);
 frmListagemFornecedores.ExibirComoModal := Modal;

 if Modal then
  begin
   frmListagemFornecedores.ShowModal;

    if Assigned(frmListagemFornecedores) then
     FreeAndNil(frmListagemFornecedores);
  end
 else
  frmListagemFornecedores.Show;
end;

procedure TfrmPrincipal.AbrirListagemVendedores(Modal: boolean);
var
 frmListagemVendedores: TfrmListagemVendedores;
begin
// Cria uma instância do formulário da listagem para exibir

  frmListagemVendedores := TfrmListagemVendedores.Create(Self);
  frmListagemVendedores.ExibirComoModal := Modal;

  if Modal then
   begin
    frmListagemVendedores.ShowModal;

    if Assigned(frmListagemVendedores) then
     FreeAndNil(frmListagemVendedores);
   end
  else
   frmListagemVendedores.Show;
end;

procedure TfrmPrincipal.AbrirListagemEmpregados(Modal: boolean);
var
 frmListagemEmpregados: TfrmListagemEmpregados;
begin
// Cria uma instância do formulário da listagem para exibir
//
  frmListagemEmpregados := TfrmListagemEmpregados.Create(Self);
  frmListagemEmpregados.ExibirComoModal := Modal;

  if Modal then
   begin
    frmListagemEmpregados.ShowModal;

    if Assigned(frmListagemEmpregados) then
     FreeAndNil(frmListagemEmpregados);
   end
  else
   frmListagemEmpregados.Show;
end;

procedure TfrmPrincipal.AbrirDashBord(Modal: boolean);
var
 frmDashBoardTreinamento: TfrmDashBoardTreinamento;
begin
 //Cria uma instância do formulário da listagem para exibir

  frmDashBoardTreinamento := TfrmDashBoardTreinamento.Create(Self);

  if Modal then
   begin
    frmDashBoardTreinamento.ShowModal;

    if Assigned(frmDashBoardTreinamento) then
     FreeAndNil(frmDashBoardTreinamento);
   end
  else
   frmDashBoardTreinamento.Show;
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
  AbrirListagemClientes(True);
end;

procedure TfrmPrincipal.DashboarddeVendas1Click(Sender: TObject);
begin
  AbrirDashBord(True)
end;

procedure TfrmPrincipal.Empregados1Click(Sender: TObject);
begin
   AbrirListagemEmpregados(True);
end;

procedure TfrmPrincipal.Estoque1Click(Sender: TObject);
begin
  AbrirListagemEstoque(True);
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  Self.ReleaseSplash;
end;

procedure TfrmPrincipal.Fornecedores1Click(Sender: TObject);
begin
  AbrirListagemFornecedores(True);
end;

procedure TfrmPrincipal.GerarDashBordClick(Sender: TObject);
begin

  AbrirDashBord(True);

end;

procedure TfrmPrincipal.Produtos1Click(Sender: TObject);
begin
  AbrirListagemProdutos(True);
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.Vendas1Click(Sender: TObject);
begin
  AbrirListagemVendas(True);
end;

procedure TfrmPrincipal.Vendedores1Click(Sender: TObject);
begin
  AbrirListagemVendedores(True);
end;

procedure TfrmPrincipal.ReleaseSplash;
begin
  if Assigned(Self.SplashForm) then
   begin
    Self.SplashForm.Hide;
    FreeAndNil(Self.FSplashForm);
   end;
end;

end.
