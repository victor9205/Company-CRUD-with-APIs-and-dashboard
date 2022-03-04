unit UViewPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Data.DB,
  Datasnap.DBClient;

type
  TfrmViewPadrao = class(TForm)
    pnlBotoes: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnAjuda: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnDica: TSpeedButton;
    dsCadastro: TDataSource;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FExibirComoModal: boolean;
    FTitulo: String;
    function GetExibirComoModal: boolean;
    procedure SetExibirComoModal(const Value: boolean);
    function GetDataSet: TDataSet;
    procedure SetDataSet(const Value: TDataSet);
    { Private declarations }
  public
    { Public declarations }
  published
    property ExibirComoModal: boolean read GetExibirComoModal write SetExibirComoModal;
    property DataSet: TDataSet read GetDataSet write SetDataSet;
  end;

var
  frmViewPadrao: TfrmViewPadrao;

implementation

{$R *.dfm}

procedure TfrmViewPadrao.btnCancelarClick(Sender: TObject);
begin
  if Assigned(DataSet) then
   TClientDataSet(DataSet).Cancel;

  ModalResult := mrCancel;
  Close;
end;

procedure TfrmViewPadrao.btnGravarClick(Sender: TObject);
begin
  if Assigned(DataSet) then
   TClientDataSet(DataSet).Post;

  ModalResult := mrOk;
  Close;
end;

procedure TfrmViewPadrao.FormShow(Sender: TObject);
begin
  if Assigned(dsCadastro.DataSet) then
   begin
    if not TClientDataSet(dsCadastro.DataSet).Active then
     TClientDataSet(dsCadastro.DataSet).Open;
   end;
end;

function TfrmViewPadrao.GetExibirComoModal: boolean;
begin
  Result := FExibirComoModal;
end;

function TfrmViewPadrao.GetDataSet: TDataSet;
begin
  Result := dsCadastro.DataSet;
end;

procedure TfrmViewPadrao.SetDataSet(const Value: TDataSet);
begin
  dsCadastro.DataSet := Value;
end;

procedure TfrmViewPadrao.SetExibirComoModal(const Value: boolean);
begin
  FExibirComoModal := Value;
end;

end.
