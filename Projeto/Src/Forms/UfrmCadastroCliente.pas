unit UfrmCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UViewPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxDBEdit, cxGroupBox, cxRadioGroup, cxCheckBox,
  cxCalc, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit, Data.DB,
  Vcl.Buttons, Vcl.ExtCtrls, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid;

type
  TfrmCadastroCliente = class(TfrmViewPadrao)
    cxGroupBox1: TcxGroupBox;
    edtCodigo: TcxDBTextEdit;
    cxGroupBox2: TcxGroupBox;
    edtDataNascimento: TcxDBDateEdit;
    cxGroupBox5: TcxGroupBox;
    edtCep: TcxDBMaskEdit;
    rdgTipoPessoa: TcxDBRadioGroup;
    CPF: TcxGroupBox;
    edtInscricao: TcxDBMaskEdit;
    NOME: TcxGroupBox;
    edtNomeCliente: TcxDBTextEdit;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    edtCidade: TcxDBTextEdit;
    edtBairro: TcxDBTextEdit;
    rdgSexo: TcxDBRadioGroup;
    cxGroupBox7: TcxGroupBox;
    edtEndereco: TcxDBTextEdit;
    cxGroupBox9: TcxGroupBox;
    edtTelefone: TcxDBMaskEdit;
    cxGroupBox10: TcxGroupBox;
    edtUF: TcxDBComboBox;
    btnBuscarDadosInscricao: TSpeedButton;
    btnBuscarDadosCEP: TSpeedButton;
    gpbItensVenda: TcxGroupBox;
    dbgDependentes: TcxGrid;
    dbgDependentesDBTableView: TcxGridDBTableView;
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
    dbgDependentesLevel: TcxGridLevel;
    pnlBotoesItensVenda: TPanel;
    btnInsItemVenda: TSpeedButton;
    btnAltInformacaoSuspensao: TSpeedButton;
    btnDelItensVenda: TSpeedButton;
    dsDependente: TDataSource;
    procedure PermitirApenasNumerosParaInscricao(Sender: TObject; var Key: Char);
    procedure TELEFONEKeyPress(Sender: TObject; var Key: Char);
    procedure cxDBRadioGroup2PropertiesEditValueChanged(Sender: TObject);
    procedure btnBuscarDadosInscricaoClick(Sender: TObject);
    procedure btnBuscarDadosCEPClick(Sender: TObject);
    procedure btnInsItemVendaClick(Sender: TObject);
    procedure btnAltInformacaoSuspensaoClick(Sender: TObject);
    procedure btnDelItensVendaClick(Sender: TObject);
    procedure edtNomeClientePropertiesEditValueChanged(Sender: TObject);
  private
    procedure HabilitarBotoesDependente(Flag: Boolean);
    procedure ValidarCadastroCliente;
  public
    { Public declarations }
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

uses
  UDMDados, UIntegracaoDadosCliente, UMsgFunctions, UfrmCadastroDependentes, Ustringfunctions;

{$R *.dfm}


procedure TfrmCadastroCliente.btnAltInformacaoSuspensaoClick(Sender: TObject);
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

procedure TfrmCadastroCliente.btnBuscarDadosCEPClick(Sender: TObject);
var
  objIntegracaoDadosCliente: TIntegracaoDadosCliente;
  FDadosCliente: TDadosCliente;
begin
  inherited;
  ActiveControl := nil;
  objIntegracaoDadosCliente := TIntegracaoDadosCliente.Create(Self);

  try
   FDadosCliente := objIntegracaoDadosCliente.ObterDadosClienteApartirDoCep(edtCep.EditValue);

   edtEndereco.EditValue     := FDadosCliente.Endereco;
   edtBairro.EditValue       := FDadosCliente.Bairro;
   edtCidade.EditValue       := FDadosCliente.Cidade;
   edtUF.EditValue           := FDadosCliente.UF;

   TMsgFunctions.Atention('Os dados do Cep foram obtidos com sucesso!');
  finally
   objIntegracaoDadosCliente.Free;
  end;

end;

procedure TfrmCadastroCliente.btnBuscarDadosInscricaoClick(Sender: TObject);
var
  objIntegracaoDadosCliente: TIntegracaoDadosCliente;
  FDadosCliente: TDadosCliente;
begin
  inherited;
  objIntegracaoDadosCliente := TIntegracaoDadosCliente.Create(Self);

  case rdgTipoPessoa.ItemIndex of
   0: begin
       try
        FDadosCliente := objIntegracaoDadosCliente.ObterDadosClienteApartirDoCPF(edtInscricao.EditingValue);

        edtNomeCliente.EditValue := FDadosCliente.RazaoSocial;
        edtEndereco.EditValue    := FDadosCliente.Endereco;
        edtBairro.EditValue      := FDadosCliente.Bairro;
        edtCidade.EditValue      := FDadosCliente.Cidade;
        edtUF.EditValue          := FDadosCliente.UF;
        edtCep.EditValue         := FDadosCliente.CEP;
        edtTelefone.EditValue    := FDadosCliente.Telefone;
        edtDataNascimento.EditValue := FDadosCliente.Data;

        TMsgFunctions.Atention('Os dados da pessoa física foram obtidos com sucesso!');
       finally
        objIntegracaoDadosCliente.Free;
       end;
      end;
   1: begin
       try
        FDadosCliente := objIntegracaoDadosCliente.ObterDadosClienteApartirDoCNPJ(edtInscricao.EditingValue);

        edtNomeCliente.EditValue := FDadosCliente.RazaoSocial;
        edtEndereco.EditValue    := FDadosCliente.Endereco;
        edtBairro.EditValue      := FDadosCliente.Bairro;
        edtCidade.EditValue      := FDadosCliente.Cidade;
        edtUF.EditValue          := FDadosCliente.UF;
        edtCep.EditValue         := FDadosCliente.CEP;
        edtTelefone.EditValue    := FDadosCliente.Telefone;
        edtDataNascimento.EditValue := FDadosCliente.Data;

        TMsgFunctions.Atention('Os dados da pessoa jurídica foram obtidos com sucesso!');
       finally
        objIntegracaoDadosCliente.Free;
       end;
   end;
  end;
end;

procedure TfrmCadastroCliente.btnDelItensVendaClick(Sender: TObject);
begin
  inherited;
  dsDependente.dataset.delete;
end;

procedure TfrmCadastroCliente.btnInsItemVendaClick(Sender: TObject);
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

procedure TfrmCadastroCliente.cxDBRadioGroup2PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if rdgTipoPessoa.EditingValue = 'S' then
   edtInscricao.Properties.EditMask := '00\.000\.000\/0000\-99'
  else
   edtInscricao.Properties.EditMask := '000\.000\.000\-99';

end;

procedure TfrmCadastroCliente.PermitirApenasNumerosParaInscricao(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0','1','2','3','4','5','6','7','8','9','.',',','/',#8,#47,'-']) then
   Key := #0;

end;

procedure TfrmCadastroCliente.TELEFONEKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0','1','2','3','4','5','6','7','8','9',#8,#47,'-','(',')']) then
   Key := #0;
end;

procedure TfrmCadastroCliente.edtNomeClientePropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  ValidarCadastroCliente;
end;

procedure TfrmCadastroCliente.HabilitarBotoesDependente(Flag: Boolean);
begin
  btnInsItemVenda.enabled := Flag;
  btnAltInformacaoSuspensao.enabled := Flag;
end;

procedure TfrmCadastroCliente.ValidarCadastroCliente;
begin
  HabilitarBotoesDependente(TstringFunctions.cheio(edtNomeCliente.Text));
end;

end.
