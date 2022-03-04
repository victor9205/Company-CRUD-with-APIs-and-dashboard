unit UfrmListagemEstoque;

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
  UfrmCadastroEstoque;

type
  TfrmListagemEstoque = class(TfrmViewGrid)
    grdCadastroDBTableView1CODIGOPRODUTO: TcxGridDBColumn;
    grdCadastroDBTableView1DATA: TcxGridDBColumn;
    grdCadastroDBTableView1QUANTIDADE: TcxGridDBColumn;
    grdCadastroDBTableView1VALORCUSTO: TcxGridDBColumn;
    grdCadastroDBTableView1VALORTOTALESTOQUE: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListagemEstoque: TfrmListagemEstoque;

implementation

{$R *.dfm}

procedure TfrmListagemEstoque.FormShow(Sender: TObject);
begin
  inherited;
  ExibirComoModal := True;
  ExibirCadastroComoModal := True;
  FormularioCadastro := TfrmCadastroEstoque.Create(Self);
end;

end.
