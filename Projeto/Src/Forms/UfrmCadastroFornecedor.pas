unit UfrmCadastroFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UViewPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxCalc, cxDBEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxGroupBox, Data.DB, Vcl.Buttons, Vcl.ExtCtrls,
  cxRadioGroup;

type
  TfrmCadastroFornecedor = class(TfrmViewPadrao)
    cxGroupBox2: TcxGroupBox;
    edtDataInicio: TcxDBDateEdit;
    cxGroupBox5: TcxGroupBox;
    btnBuscarDadosCEP: TSpeedButton;
    edtCep: TcxDBMaskEdit;
    rdgTipoPessoa: TcxDBRadioGroup;
    CPF: TcxGroupBox;
    btnBuscarDadosInscricao: TSpeedButton;
    edtInscricao: TcxDBMaskEdit;
    NOME: TcxGroupBox;
    edtRazaoSocial: TcxDBTextEdit;
    cxGroupBox3: TcxGroupBox;
    edtCidade: TcxDBTextEdit;
    cxGroupBox4: TcxGroupBox;
    edtBairro: TcxDBTextEdit;
    cxGroupBox10: TcxGroupBox;
    edtUF: TcxDBComboBox;
    cxGroupBox7: TcxGroupBox;
    edtEndereco: TcxDBTextEdit;
    cxGroupBox9: TcxGroupBox;
    edtTelefone: TcxDBMaskEdit;
    cxGroupBox6: TcxGroupBox;
    edtLimiteDeCredito: TcxDBMaskEdit;
    cxGroupBox8: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    edtCodigo: TcxDBTextEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroFornecedor: TfrmCadastroFornecedor;

implementation

{$R *.dfm}

end.
