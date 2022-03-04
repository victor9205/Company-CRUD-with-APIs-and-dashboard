unit UViewGridPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Datasnap.DBClient, UViewPadrao,
  dxSkinsCore, dxSkinsDefaultPainters;

type
  TfrmViewGrid = class(TForm)
    pnlBotoes: TPanel;
    btnDica: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnIncluir: TSpeedButton;
    btnEditar: TSpeedButton;
    btnAjuda: TSpeedButton;
    btnFechar: TSpeedButton;
    btnFirst: TSpeedButton;
    btnPrevious: TSpeedButton;
    btnNext: TSpeedButton;
    btnLast: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnPesquisar: TSpeedButton;
    btnStatus: TSpeedButton;
    btnExtras: TSpeedButton;
    pnlGrid: TPanel;
    grdCadastroDBTableView1: TcxGridDBTableView;
    grdCadastroLevel1: TcxGridLevel;
    grdCadastro: TcxGrid;
    dsCadastro: TDataSource;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FExibirComoModal: boolean;
    FFormularioCadastro: TfrmViewPadrao;
    FExibirCadastroComoModal: boolean;
    FActiveR: Boolean;
    procedure AbrirJanelaCadastro;
    { Private declarations }
  public
    { Public declarations }
  published
    property ExibirComoModal: boolean read FExibirComoModal write FExibirComoModal;
    property ExibirCadastroComoModal: boolean read FExibirCadastroComoModal write FExibirCadastroComoModal;
    property FormularioCadastro: TfrmViewPadrao read FFormularioCadastro write FFormularioCadastro;
  end;

var
  frmViewGrid: TfrmViewGrid;

implementation

{$R *.dfm}

procedure TfrmViewGrid.btnEditarClick(Sender: TObject);
begin
  TClientDataSet(dsCadastro.Dataset).Edit;
  AbrirJanelaCadastro;
end;

procedure TfrmViewGrid.btnExcluirClick(Sender: TObject);
begin
  TClientDataSet(dsCadastro.Dataset).Delete;
end;

procedure TfrmViewGrid.AbrirJanelaCadastro;
begin
  if Assigned(FormularioCadastro) then
  begin
    FormularioCadastro.DataSet := dsCadastro.DataSet;
    FormularioCadastro.ExibirComoModal := ExibirCadastroComoModal;
    if ExibirCadastroComoModal then
      FormularioCadastro.ShowModal
    else
      FormularioCadastro.Show;
  end;
end;

procedure TfrmViewGrid.btnFecharClick(Sender: TObject);
begin
  // Fecha a Janela
  Close;
end;

procedure TfrmViewGrid.btnFirstClick(Sender: TObject);
begin
  TClientDataSet(dsCadastro.Dataset).First;
end;

procedure TfrmViewGrid.btnIncluirClick(Sender: TObject);
begin
  TClientDataSet(dsCadastro.Dataset).Append;
  AbrirJanelaCadastro;
end;

procedure TfrmViewGrid.btnLastClick(Sender: TObject);
begin
  TClientDataSet(dsCadastro.Dataset).Last;
end;

procedure TfrmViewGrid.btnNextClick(Sender: TObject);
begin
  TClientDataSet(dsCadastro.Dataset).Next;
end;

procedure TfrmViewGrid.btnPreviousClick(Sender: TObject);
begin
  TClientDataSet(dsCadastro.Dataset).Prior;
end;

procedure TfrmViewGrid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FFormularioCadastro) then
   FreeAndNil(FFormularioCadastro);

  if ExibirComoModal then
   frmViewGrid := Nil;
end;

procedure TfrmViewGrid.FormShow(Sender: TObject);
begin
  if Assigned(dsCadastro.DataSet) then
   begin
    if not TClientDataSet(dsCadastro.DataSet).Active then
     TClientDataSet(dsCadastro.DataSet).Open;
   end;
end;

end.
