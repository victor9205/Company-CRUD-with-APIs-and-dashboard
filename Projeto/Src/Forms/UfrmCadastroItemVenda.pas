unit UfrmCadastroItemVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UViewPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxMaskEdit, cxDropDownEdit, cxCalc, cxDBEdit,
  cxTextEdit, cxGroupBox, Data.DB, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCadatroItemVenda = class(TfrmViewPadrao)
    CodigoVenda: TcxGroupBox;
    edtCodigoVenda: TcxDBTextEdit;
    DescricaoProduto: TcxGroupBox;
    edtDescricaoProduto: TcxDBTextEdit;
    cxGroupBox3: TcxGroupBox;
    edtCodigoProduto: TcxDBTextEdit;
    ValorUnitario: TcxGroupBox;
    edtValorUnitario: TcxDBCalcEdit;
    Quantidade: TcxGroupBox;
    edtQuantidade: TcxDBCalcEdit;
    ValorTotal: TcxGroupBox;
    edtValorTotal: TcxDBCalcEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadatroItemVenda: TfrmCadatroItemVenda;

implementation

{$R *.dfm}

end.
