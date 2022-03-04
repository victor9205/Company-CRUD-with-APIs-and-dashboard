unit UfrmListagemVendas;

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
  UfrmCadastroVenda;

type
  TfrmListagemVendas = class(TfrmViewGrid)
    grdCadastroDBTableView1CODIGO: TcxGridDBColumn;
    grdCadastroDBTableView1CODIGOCLIENTE: TcxGridDBColumn;
    grdCadastroDBTableView1CLIENTENOME: TcxGridDBColumn;
    grdCadastroDBTableView1DATA: TcxGridDBColumn;
    grdCadastroDBTableView1VALORTOTAL: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListagemVendas: TfrmListagemVendas;

implementation

{$R *.dfm}

procedure TfrmListagemVendas.FormShow(Sender: TObject);
begin
  inherited;
  ExibirComoModal := True;
  ExibirCadastroComoModal := True;
  FormularioCadastro := TfrmCadastroVenda.Create(Self);
end;

end.
