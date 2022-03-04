unit UfrmCadastroDependentes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UViewPadrao, Data.DB, Vcl.Buttons,
  Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxDropDownEdit,
  cxDBEdit, cxMaskEdit, cxCalendar, cxTextEdit, cxGroupBox;

type
  TfrmCadastroDependentes = class(TfrmViewPadrao)
    gbEndereco: TcxGroupBox;
    EdtEndereco: TcxDBTextEdit;
    dataNascimento: TcxGroupBox;
    EdtData: TcxDBDateEdit;
    codigoEmpregado: TcxGroupBox;
    EdtCodigo: TcxDBTextEdit;
    nomeDependente: TcxGroupBox;
    EdtNome: TcxDBTextEdit;
    dbBairro: TcxGroupBox;
    EdtBairro: TcxDBTextEdit;
    nomePai: TcxGroupBox;
    gbCidade: TcxGroupBox;
    EdtCidade: TcxDBTextEdit;
    gbTelefone: TcxGroupBox;
    EdtTelefone: TcxDBMaskEdit;
    uf: TcxGroupBox;
    EdtUF: TcxDBComboBox;
    cpf: TcxGroupBox;
    btnBuscarDadosInscricao: TSpeedButton;
    EditCPF: TcxDBMaskEdit;
    cxGroupBox8: TcxGroupBox;
    btnBuscarDadosCEP: TSpeedButton;
    EdtCep: TcxDBMaskEdit;
    nomeMae: TcxGroupBox;
    EditNomePai: TcxDBTextEdit;
    EditNomeMae: TcxDBTextEdit;
    procedure btnBuscarDadosCEPClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroDependentes: TfrmCadastroDependentes;

implementation

{$R *.dfm}

uses UDMDados, UIntegracaoDadosDependente, UMsgFunctions;

procedure TfrmCadastroDependentes.btnBuscarDadosCEPClick(Sender: TObject);
var
  objIntegracaoDadosDependente: TIntegracaoDadosDependente;
  FDadosDependente: TDadosDependente;
begin
  inherited;
  ActiveControl := nil;
  objIntegracaoDadosDependente := TIntegracaoDadosDependente.Create(Self);

  try
   FDadosDependente := objIntegracaoDadosDependente.ObterDadosDependenteApartirDoCep(edtCep.EditValue);

   edtEndereco.EditValue     := FDadosDependente.Endereco;
   edtBairro.EditValue       := FDadosDependente.Bairro;
   edtCidade.EditValue       := FDadosDependente.Cidade;
   edtUF.EditValue           := FDadosDependente.UF;

   TMsgFunctions.Atention('Os dados do Cep foram obtidos com sucesso!');
  finally
   objIntegracaoDadosDependente.Free;
  end;
end;

end.
