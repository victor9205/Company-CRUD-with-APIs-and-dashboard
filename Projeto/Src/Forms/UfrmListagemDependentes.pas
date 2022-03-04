unit UfrmListagemDependentes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UViewGridPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmListagemDependentes = class(TfrmViewGrid)
    grdCadastroDBTableView1CODIGOEMPREGADO: TcxGridDBColumn;
    grdCadastroDBTableView1CPF: TcxGridDBColumn;
    grdCadastroDBTableView1NOME: TcxGridDBColumn;
    grdCadastroDBTableView1ENDERECO: TcxGridDBColumn;
    grdCadastroDBTableView1BAIRRO: TcxGridDBColumn;
    grdCadastroDBTableView1CIDADE: TcxGridDBColumn;
    grdCadastroDBTableView1UF: TcxGridDBColumn;
    grdCadastroDBTableView1CEP: TcxGridDBColumn;
    grdCadastroDBTableView1TELEFONE: TcxGridDBColumn;
    grdCadastroDBTableView1DATANASCIMENTO: TcxGridDBColumn;
    grdCadastroDBTableView1NOMEPAI: TcxGridDBColumn;
    grdCadastroDBTableView1NOMEMAE: TcxGridDBColumn;
  private
    procedure FormShow(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListagemDependentes: TfrmListagemDependentes;

implementation

{$R *.dfm}

uses UDMDados, UfrmCadastroDependentes;

procedure TfrmListagemDependentes.FormShow(Sender: TObject);
begin
  inherited;
  ExibirComoModal := True;
  ExibirCadastroComoModal := True;
  FormularioCadastro := TfrmCadastroDependentes.Create(Self);
end;

end.
