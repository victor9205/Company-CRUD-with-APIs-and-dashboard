unit Dashboard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, JvSpeedButton, Buttons, ExtCtrls, StdCtrls, DB, ppReport, ppProd,
  ppDBPipe, ImgList, JvDockTree,
  JvDockControlForm, JvDockVIDStyle, JvDockVSNetStyle, JvComponentBase,
  DBClient, cxControls, cxContainer, cxEdit, cxGraphics,
  cxGridDBTableView, cxDBTL, cxTL, cxGrid, cxGridCustomTableView, cxPC,
  VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.DBChart;

type
  TfrmDashboard = class(TForm)
    pnl: TPanel;
    pnlBotoes: TPanel;
    btnAjuda: TSpeedButton;
    btnFechar: TSpeedButton;
    btnExtras: TSpeedButton;
    JvDockServer: TJvDockServer;
    JvDockVSNetStyle: TJvDockVSNetStyle;
    pnlDashboard: TPanel;
    shpCardAzul: TShape;
    lblTituloCardAzul: TLabel;
    lblValorCardAzul: TLabel;
    lblTituloDashBoard: TLabel;
    shpCardVerde: TShape;
    shpCardAmarelo: TShape;
    shpCardVermelho: TShape;
    lblTituloCardVerde: TLabel;
    lblValorCardVerde: TLabel;
    lblTituloCardAmarelo: TLabel;
    lblValorCardAmarelo: TLabel;
    lblTituloCardVermelho: TLabel;
    lblValorCardVermelho: TLabel;
    DBChartDashBoard: TDBChart;
    TmrDashDashBoard: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnExtrasClick(Sender: TObject);
    procedure TmrDashDashBoardTimer(Sender: TObject);
    procedure AcaoClickCard(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure ReloadDashboard; virtual;
    procedure AtualizarDashBoard; virtual;
    procedure DrewDrawCard(Acao: Integer); virtual;
  public
   { Public declarations }
   procedure AfterConstruction; override;

  published
  protected
   procedure Initialize; virtual;
   procedure DeInitialize; virtual;
  end;

var
  frmDashboard: TfrmDashboard;

implementation

uses Printers, Math;

{$R *.dfm}

procedure TfrmDashboard.TmrDashDashBoardTimer(Sender: TObject);
begin
  Self.AtualizarDashBoard;
end;

procedure TfrmDashboard.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Enviando mensagem de notificação sobre o fechamento do form somente se form MDI
  Application.OnHint := nil;

  Release;
end;

procedure TfrmDashboard.btnExtrasClick(Sender: TObject);
begin
  if btnExtras.PopupMenu <> nil then
   btnExtras.PopupMenu.Popup(btnExtras.ClientOrigin.X, btnExtras.ClientOrigin.Y - btnExtras.Height);
end;

procedure TfrmDashboard.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDashboard.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
   VK_ESCAPE: if btnFechar.Enabled then btnFechar.Click;
   VK_F1    : if btnAjuda.Enabled then btnAjuda.Click;
   VK_F5    : ReloadDashboard;
   VK_F10   : if btnExtras.Enabled then btnExtras.Click
  end;
end;

procedure TfrmDashboard.FormShow(Sender: TObject);
begin
  AtualizarDashBoard;
end;

procedure TfrmDashboard.Initialize;
begin
//
end;

procedure TfrmDashboard.DeInitialize;
begin
//
end;

procedure TfrmDashboard.DrewDrawCard(Acao: Integer);
begin

end;

procedure TfrmDashboard.FormCreate(Sender: TObject);
begin
  Initialize;
end;

procedure TfrmDashboard.FormDestroy(Sender: TObject);
begin
  DeInitialize;
end;

procedure TfrmDashboard.AcaoClickCard(Sender: TObject);
begin
  DrewDrawCard(TComponent(Sender).Tag);
end;

procedure TfrmDashboard.AfterConstruction;
begin
  if Self.FormStyle = fsMDIChild then
   Exclude(FFormState, fsVisible);

  inherited;
end;

procedure TfrmDashboard.AtualizarDashBoard;
begin

end;

procedure TfrmDashboard.ReloadDashboard;
begin

end;

end.
