unit UfrmListagemProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UViewGridPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Buttons, Vcl.ExtCtrls, cxCalc;

type
  TfrmListagemProdutos = class(TfrmViewGrid)
    grdCadastroDBTableView1CODIGO: TcxGridDBColumn;
    grdCadastroDBTableView1DESCRICAO: TcxGridDBColumn;
    grdCadastroDBTableView1DATAAQUISICAO: TcxGridDBColumn;
    grdCadastroDBTableView1QUANTIDADEESTOQUE: TcxGridDBColumn;
    grdCadastroDBTableView1VALORCUSTO: TcxGridDBColumn;
    grdCadastroDBTableView1PERCENTUALLUCRO: TcxGridDBColumn;
    grdCadastroDBTableView1VALORVENDA: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListagemProdutos: TfrmListagemProdutos;

implementation

{$R *.dfm}

uses UDMDados, UfrmCadastroProduto;

procedure TfrmListagemProdutos.FormShow(Sender: TObject);
begin
  inherited;
  ExibirComoModal := True;
  ExibirCadastroComoModal := True;
  FormularioCadastro := TfrmCadastroProduto.Create(Self);
end;
end.
