unit UfrmDashBoardTreinamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DashBoard, VclTee.TeeGDIPlus, Data.DB,
  Vcl.ExtCtrls, JvDockTree, JvDockControlForm, JvDockVIDStyle, JvDockVSNetStyle,
  JvComponentBase, VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.DBChart, Vcl.StdCtrls, Vcl.Buttons, VCLTee.Series;

type
  TfrmDashboardTreinamento = class(TfrmDashboard)
    DBChart2: TDBChart;
    Series1: TFastLineSeries;
    Series2: TPieSeries;
    procedure lblValorCardAzulClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure ReloadDashboard; override;
    procedure AtualizarDashBoard; override;
    procedure DrewDrawCard(Acao: Integer); override;
  public
    { Public declarations }
  end;

var
  frmDashboardTreinamento: TfrmDashboardTreinamento;

implementation

uses
  UDMDados, UfrmPrincipal;

{$R *.dfm}

{ TfrmDashboardTreinamento }

procedure TfrmDashboardTreinamento.AtualizarDashBoard;
begin
  inherited;
  {$REGION 'Cards'}
  dmDados.cdsCardsDashboard.Close;
  dmDados.cdsCardsDashboard.Open;

  lblValorCardAzul.Caption := dmDados.cdsCardsDashboardQTDCLIENTES.AsString;
  lblValorCardVerde.Caption := dmDados.cdsCardsDashboardNROEMPREGADOS.AsString;
  lblValorCardAmarelo.Caption := dmDados.cdsCardsDashboardQTDVENDAS.AsString;
  lblValorCardVermelho.Caption := dmDados.cdsCardsDashboardTOTALVENDAS.AsString;
  {$REGION}

  {$REGION 'Evolucao Vendas'}
  dmDados.cdsProdutoMaisVendido.Close;
  dmDados.cdsProdutoMaisVendido.Open;
  {$REGION}

  {$REGION 'Produto Mais Vendido'}
  dmDados.cdsEvolucaoVendas.Close;
  dmDados.cdsEvolucaoVendas.Open;
  {$REGION}

end;

procedure TfrmDashboardTreinamento.DrewDrawCard(Acao: Integer);
begin
  inherited;
  case Acao of
    1: begin
        frmPrincipal.AbrirListagemClientes(True);
       end;
    2: begin
        frmPrincipal.AbrirListagemEmpregados(True);
       end;
    3: begin
        frmPrincipal.AbrirListagemVendas(True);
       end;
  end;
end;

procedure TfrmDashboardTreinamento.lblValorCardAzulClick(Sender: TObject);
begin
  inherited;
  DrewDrawCard(1);
end;

procedure TfrmDashboardTreinamento.ReloadDashboard;
begin
  inherited;
  Self.AtualizarDashBoard;
end;

end.
