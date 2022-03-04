unit UfrmCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UViewPadrao, Data.DB, Vcl.Buttons,
  Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxDBEdit,
  cxGroupBox, cxRadioGroup, cxCheckBox, cxCalc, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmCadastroProduto = class(TfrmViewPadrao)
    cxGroupBox1: TcxGroupBox;
    cxDBTextEdit1: TcxDBTextEdit;
    cxGroupBox2: TcxGroupBox;
    cxDBDateEdit1: TcxDBDateEdit;
    cxGroupBox4: TcxGroupBox;
    cxDBCalcEdit1: TcxDBCalcEdit;
    cxGroupBox5: TcxGroupBox;
    cxDBCalcEdit2: TcxDBCalcEdit;
    gpb6: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    cxDBTextEdit2: TcxDBTextEdit;
    cxGroupBox6: TcxGroupBox;
    cxDBCalcEdit3: TcxDBCalcEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroProduto: TfrmCadastroProduto;

implementation

{$R *.dfm}

uses UDMDados;

procedure TfrmCadastroProduto.FormShow(Sender: TObject);
begin
  inherited;
  dmdados.cdsProdutos.Open;
end;

end.
