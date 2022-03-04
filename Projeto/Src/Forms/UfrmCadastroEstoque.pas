unit UfrmCadastroEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UViewPadrao, Data.DB, Vcl.Buttons,
  Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxCalc, cxDBEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxGroupBox;

type
  TfrmCadastroEstoque = class(TfrmViewPadrao)
    Codigo: TcxGroupBox;
    edtCodigo: TcxDBTextEdit;
    Data: TcxGroupBox;
    edtData: TcxDBDateEdit;
    ValorTotalEstoque: TcxGroupBox;
    edtValorTotalEstoque: TcxDBCalcEdit;
    ValorCusto: TcxGroupBox;
    edtValorCusto: TcxDBCalcEdit;
    Quantidade: TcxGroupBox;
    edtQuantidade: TcxDBTextEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroEstoque: TfrmCadastroEstoque;

implementation

{$R *.dfm}

end.
