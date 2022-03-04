unit UfrmCadastroVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UViewPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxCalc, cxDBEdit, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxGroupBox, Vcl.Buttons, Vcl.ExtCtrls,
  UfrmCadastroItemVenda;

type
  TfrmCadastroVenda = class(TfrmViewPadrao)
    cxGroupBox1: TcxGroupBox;
    edtCodigo: TcxDBTextEdit;
    Data: TcxGroupBox;
    edtData: TcxDBDateEdit;
    NOME: TcxGroupBox;
    edtNomeCliente: TcxDBTextEdit;
    cxGroupBox5: TcxGroupBox;
    edtVolumeGeralVendas: TcxDBCalcEdit;
    cxGroupBox3: TcxGroupBox;
    edtCodigoCliente: TcxDBTextEdit;
    dsItemVenda: TDataSource;
    gpbItensVenda: TcxGroupBox;
    dbgDependentes: TcxGrid;
    dbgDependentesDBTableView: TcxGridDBTableView;
    dbgDependentesLevel: TcxGridLevel;
    pnlBotoesItensVenda: TPanel;
    btnInsItemVenda: TSpeedButton;
    btnAltInformacaoSuspensao: TSpeedButton;
    btnDelItensVenda: TSpeedButton;
    dbgDependentesDBTableViewCODIGOVENDA: TcxGridDBColumn;
    dbgDependentesDBTableViewCODIGOPRODUTO: TcxGridDBColumn;
    dbgDependentesDBTableViewDESCRICAOPRODUTO: TcxGridDBColumn;
    dbgDependentesDBTableViewQUANTIDADE: TcxGridDBColumn;
    dbgDependentesDBTableViewVALORUNITARIO: TcxGridDBColumn;
    dbgDependentesDBTableViewVALORTOTAL: TcxGridDBColumn;
    procedure btnDelItensVendaClick(Sender: TObject);
    procedure btnInsItemVendaClick(Sender: TObject);
    procedure btnAltInformacaoSuspensaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroVenda: TfrmCadastroVenda;

implementation

{$R *.dfm}

procedure TfrmCadastroVenda.btnAltInformacaoSuspensaoClick(Sender: TObject);
var
  frmListagemItemVenda: TfrmCadatroItemVenda;
begin
  inherited;
  dsCadastro.DataSet.Post;
  dsCadastro.DataSet.Edit;
  dsItemVenda.dataset.edit;

  frmListagemItemVenda := TfrmCadatroItemVenda.Create(Self);
  frmListagemItemVenda.ExibirComoModal := ExibirComoModal;

  if ExibirComoModal then
   begin
    frmListagemItemVenda.ShowModal;

   if Assigned(frmListagemItemVenda) then
    FreeAndNil(frmListagemItemVenda);
   end
  else
   frmListagemItemVenda.Show;
end;

procedure TfrmCadastroVenda.btnDelItensVendaClick(Sender: TObject);
begin
  inherited;
  dsItemVenda.dataset.delete;
end;

procedure TfrmCadastroVenda.btnInsItemVendaClick(Sender: TObject);
var
  frmListagemItemVenda: TfrmCadatroItemVenda;
begin
  inherited;
  dsCadastro.DataSet.Post;
  dsCadastro.DataSet.Edit;
  dsItemVenda.dataset.append;

  frmListagemItemVenda := TfrmCadatroItemVenda.Create(Self);
  frmListagemItemVenda.ExibirComoModal := ExibirComoModal;

  if ExibirComoModal then
   begin
    frmListagemItemVenda.ShowModal;

   if Assigned(frmListagemItemVenda) then
    FreeAndNil(frmListagemItemVenda);
   end
  else
   frmListagemItemVenda.Show;

  dsItemVenda.DataSet.Refresh;

end;

end.
