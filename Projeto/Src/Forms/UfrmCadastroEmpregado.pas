unit UfrmCadastroEmpregado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UViewPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxCalc, cxDBEdit, cxDropDownEdit, cxGroupBox,
  cxRadioGroup, cxMaskEdit, cxCalendar, cxTextEdit, Data.DB, Vcl.Buttons,
  Vcl.ExtCtrls, UfrmCadastroDependentes, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid;

type
  TfrmCadastroEmpregado = class(TfrmViewPadrao)
    cxGroupBox1: TcxGroupBox;
    edtCodigo: TcxDBTextEdit;
    cxGroupBox2: TcxGroupBox;
    edtDataNascimento: TcxDBDateEdit;
    rdgTipoPessoa: TcxDBRadioGroup;
    CPF: TcxGroupBox;
    btnBuscarDadosInscricao: TSpeedButton;
    edtInscricao: TcxDBMaskEdit;
    NOME: TcxGroupBox;
    edtNomeEmpregado: TcxDBTextEdit;
    cxGroupBox3: TcxGroupBox;
    edtCidade: TcxDBTextEdit;
    cxGroupBox4: TcxGroupBox;
    edtBairro: TcxDBTextEdit;
    cxGroupBox7: TcxGroupBox;
    edtEndereco: TcxDBTextEdit;
    cxGroupBox10: TcxGroupBox;
    edtUF: TcxDBComboBox;
    edtValorCusto: TcxGroupBox;
    edtPercentualComissao: TcxDBCalcEdit;
    CEP: TcxGroupBox;
    btnBuscarDadosCEP: TSpeedButton;
    edtCep: TcxDBMaskEdit;
    cxGroupBox5: TcxGroupBox;
    edtVolumeGeralVendas: TcxDBCalcEdit;
    cxGroupBox9: TcxGroupBox;
    edtTelefone: TcxDBMaskEdit;
    dsDependente: TDataSource;
    gpbDependenteEmpregado: TcxGroupBox;
    dbgDependentes: TcxGrid;
    dbgDependentesDBTableView: TcxGridDBTableView;
    dbgDependentesLevel: TcxGridLevel;
    pnlBotoesItensVenda: TPanel;
    btnInsItemVenda: TSpeedButton;
    btnAltInformacaoSuspensao: TSpeedButton;
    btnDelItensVenda: TSpeedButton;
    dbgDependentesDBTableViewCODIGOEMPREGADO: TcxGridDBColumn;
    dbgDependentesDBTableViewCPF: TcxGridDBColumn;
    dbgDependentesDBTableViewNOME: TcxGridDBColumn;
    dbgDependentesDBTableViewENDERECO: TcxGridDBColumn;
    dbgDependentesDBTableViewBAIRRO: TcxGridDBColumn;
    dbgDependentesDBTableViewCIDADE: TcxGridDBColumn;
    dbgDependentesDBTableViewUF: TcxGridDBColumn;
    dbgDependentesDBTableViewCEP: TcxGridDBColumn;
    dbgDependentesDBTableViewTELEFONE: TcxGridDBColumn;
    dbgDependentesDBTableViewDATANASCIMENTO: TcxGridDBColumn;
    dbgDependentesDBTableViewNOMEPAI: TcxGridDBColumn;
    dbgDependentesDBTableViewNOMEMAE: TcxGridDBColumn;
    procedure btnInsItemVendaClick(Sender: TObject);
    procedure btnAltInformacaoSuspensaoClick(Sender: TObject);
    procedure btnDelItensVendaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroEmpregado: TfrmCadastroEmpregado;

implementation

{$R *.dfm}

procedure TfrmCadastroEmpregado.btnAltInformacaoSuspensaoClick(Sender: TObject);
var
  frmListagemDependentes: TfrmCadastroDependentes;
begin
  inherited;
  dsCadastro.DataSet.Post;
  dsCadastro.DataSet.Edit;
  dsDependente.dataset.edit;

  frmListagemDependentes := TfrmCadastroDependentes.Create(Self);
  frmListagemDependentes.ExibirComoModal := ExibirComoModal;

  if ExibirComoModal then
   begin
    frmListagemDependentes.ShowModal;

   if Assigned(frmListagemDependentes) then
    FreeAndNil(frmListagemDependentes);
   end
  else
   frmListagemDependentes.Show;
end;

procedure TfrmCadastroEmpregado.btnDelItensVendaClick(Sender: TObject);
begin
  inherited;
  dsDependente.dataset.delete;
end;

procedure TfrmCadastroEmpregado.btnInsItemVendaClick(Sender: TObject);
var
  frmListagemDependentes: TfrmCadastroDependentes;
begin
  inherited;
  dsCadastro.DataSet.Post;
  dsCadastro.DataSet.Edit;
  dsDependente.dataset.append;

  frmListagemDependentes := TfrmCadastroDependentes.Create(Self);
  frmListagemDependentes.ExibirComoModal := ExibirComoModal;

  if ExibirComoModal then
   begin
    frmListagemDependentes.ShowModal;

   if Assigned(frmListagemDependentes) then
    FreeAndNil(frmListagemDependentes);
   end
  else
   frmListagemDependentes.Show;

  dsDependente.DataSet.Refresh;
end;

end.
