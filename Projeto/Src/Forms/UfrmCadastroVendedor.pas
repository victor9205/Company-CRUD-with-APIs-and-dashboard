unit UfrmCadastroVendedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UViewPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxDropDownEdit, cxDBEdit, cxGroupBox, cxRadioGroup,
  cxMaskEdit, cxCalendar, cxTextEdit, Data.DB, Vcl.Buttons, Vcl.ExtCtrls, cxCalc;

type
  TfrmCadastroVendedor = class(TfrmViewPadrao)
    cxGroupBox1: TcxGroupBox;
    edtCodigo: TcxDBTextEdit;
    cxGroupBox2: TcxGroupBox;
    edtDataNascimento: TcxDBDateEdit;
    rdgTipoPessoa: TcxDBRadioGroup;
    CPF: TcxGroupBox;
    btnBuscarDadosInscricao: TSpeedButton;
    edtInscricao: TcxDBMaskEdit;
    NOME: TcxGroupBox;
    edtNomeVendedor: TcxDBTextEdit;
    cxGroupBox3: TcxGroupBox;
    edtCidade: TcxDBTextEdit;
    cxGroupBox4: TcxGroupBox;
    edtBairro: TcxDBTextEdit;
    cxGroupBox7: TcxGroupBox;
    edtEndereco: TcxDBTextEdit;
    cxGroupBox10: TcxGroupBox;
    edtUF: TcxDBComboBox;
    cxGroupBox9: TcxGroupBox;
    edtTelefone: TcxDBMaskEdit;
    edtValorCusto: TcxGroupBox;
    edtPercentualComissao: TcxDBCalcEdit;
    CEP: TcxGroupBox;
    btnBuscarDadosCEP: TSpeedButton;
    edtCep: TcxDBMaskEdit;
    cxGroupBox5: TcxGroupBox;
    edtVolumeGeralVendas: TcxDBCalcEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroVendedor: TfrmCadastroVendedor;

implementation

{$R *.dfm}

end.
