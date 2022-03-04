unit UfrmListagemEmpregados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UViewGridPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Buttons, Vcl.ExtCtrls,
  UfrmCadastroEmpregado;

type
  TfrmListagemEmpregados = class(TfrmViewGrid)
    grdCadastroDBTableView1CODIGO: TcxGridDBColumn;
    grdCadastroDBTableView1NOME: TcxGridDBColumn;
    grdCadastroDBTableView1PESSOAJURIDICA: TcxGridDBColumn;
    grdCadastroDBTableView1CNPJCPF: TcxGridDBColumn;
    grdCadastroDBTableView1ENDERECO: TcxGridDBColumn;
    grdCadastroDBTableView1BAIRRO: TcxGridDBColumn;
    grdCadastroDBTableView1CIDADE: TcxGridDBColumn;
    grdCadastroDBTableView1UF: TcxGridDBColumn;
    grdCadastroDBTableView1CEP: TcxGridDBColumn;
    grdCadastroDBTableView1TELEFONE: TcxGridDBColumn;
    grdCadastroDBTableView1PERCENTUALCOMISSAO: TcxGridDBColumn;
    grdCadastroDBTableView1VOLUMEGERALVENDAS: TcxGridDBColumn;
    grdCadastroDBTableView1DATANASCIMENTO: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListagemEmpregados: TfrmListagemEmpregados;

implementation

{$R *.dfm}

procedure TfrmListagemEmpregados.FormShow(Sender: TObject);
begin
  inherited;
  ExibirComoModal := True;
  ExibirCadastroComoModal := True;
  FormularioCadastro := TfrmCadastroEmpregado.Create(Self);
end;

end.
