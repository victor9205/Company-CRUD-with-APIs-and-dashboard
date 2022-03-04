unit UConsultaReceitaFederal;

interface

uses
  REST.Client, Contnrs, Classes, System.JSON, REST.Types,
  IdHTTP, SysUtils, Controls, IdSSLOpenSSL;

type
  TRESTLib = record
    Client: TRESTClient;
    Request: TRESTRequest;
    Response: TRESTResponse;

    procedure Free;
  end;

  TConsultaReceitaFederal = class(TComponent)
  private
    FInscricaoFederal: string;
    function ObterUrl(const UrlParcial: string): string;
    function ObterUrlPorTipoInscricao(const UrlParcial: string; InscricaoFederal: string; numerodiasultimaconsulta: integer): string;
    function PrepararString(const Str: string): string;
    function PrepararData(const Data: TDate): string;
    function PrepararDataHora(const DataHora: TDateTime): string;
    function EnviarMensagem(const BaseURL, EndPoint: String; jMessage: String;
      RequestType: TRESTRequestMethod; const UserAuth: Boolean): String;
    function GetRESTLib: TRESTLib;
  protected
  public
    constructor Create(AOwner: TComponent; const InscricaoFederal: string);
  published
    function ObtemDadosEmpresaPortalReceitaFederal(const InscricaoFederal: string; iDiasRenovacao: Integer = 0): String;
    property InscricaoFederal: string read FInscricaoFederal;
  end;

implementation

uses
  URegFunctions, Windows, UStringFunctions, UMsgFunctions, IdCoderMIME,
  SuperObject, UTronException, StrUtils, UNumberFunctions,
  EncdDecd, IOUtils, DateUtils, UNetFunctions;

const
  URL_SERVIDOR_PORTAL = 'https://www.receitaws.com.br/';
  TOKEN = '783daae82e910617ca2db3374b090afe3d90e803554dd7e1a59fe57a96440d1e';
  DAYS_RENEW = 30;

{ TConsultaReceitaFederal }

constructor TConsultaReceitaFederal.Create(AOwner: TComponent; const InscricaoFederal: string);
begin
  inherited Create(AOwner);
  FInscricaoFederal       := InscricaoFederal;
end;

function TConsultaReceitaFederal.GetRESTLib: TRESTLib;
begin
  Result.Client   := TRESTClient.Create (nil);
  Result.Response := TRESTResponse.Create(nil);
  Result.Request  := TRESTRequest.Create(nil);

  TNetFunctions.CheckProxySettings(Result.Client);

  Result.Client.AutoCreateParams := False;
  Result.Client.AcceptEncoding   := 'UTF-8';

  Result.Request.AcceptEncoding  := 'UTF-8';

  Result.Request.Client   := Result.Client;
  Result.Request.Response := Result.Response;
end;

function TConsultaReceitaFederal.EnviarMensagem(const BaseURL, EndPoint: String;
  jMessage: String; RequestType: TRESTRequestMethod;
  const UserAuth: Boolean): String;
var
  jResult, jObject: TJSONObject;
  RESTLib: TRESTLib;
  bTentarNovamente: Boolean;
  iTentativas: Integer;

  Params: TStringStream;

  HeaderServiceIdentify: String;
begin
  bTentarNovamente := True;
  iTentativas := 0;

  Result := '';

  RESTLib := GetRESTLib;

  RESTLib.Client.BaseURL   := BaseUrl;
  RESTLib.Request.Resource := EndPoint;
  RESTLib.Request.Method   := RequestType;
  RESTLib.Request.Timeout  := 120000; //Ajustando tempo de espera dos dados para um minuto.

  try
   if UserAuth then
    begin
     with RESTLib.Request.Params.AddItem do
      begin
       Name    := 'Authorization';
       Value   := 'Bearer ' + TOKEN;
       Kind    := pkHTTPHEADER;
       Options := [poDoNotEncode];
      end;
    end;

   if TStringFunctions.IsVarFull(jMessage) then
    begin
     with RESTLib.Request.Params.AddItem do
      begin
       ContentType := ctAPPLICATION_JSON;
       name        := 'param';
       Value       := jMessage;
       Kind        := pkREQUESTBODY;
      end;
    end;

   while bTentarNovamente do
    begin
     Inc(iTentativas);
     RESTLib.Request.Execute;

     jResult := TJSONObject.Create;

     try
      case RESTLib.Response.StatusCode of
       400:
        begin
         try
          if (iTentativas <= 1) then
           begin
            Sleep(1000);
            Continue;
           end
          else bTentarNovamente := False;

          jObject := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(RESTLib.Response.Content), 0) as TJSONObject;

          Result := RESTLib.Response.Content;
         except
          on E:Exception do
          begin
           jResult.AddPair('erro', RESTLib.Response.Content);

           Result := jResult.ToString;
          end;
         end;
        end;
       404:
        begin
         bTentarNovamente := False;
         if TStringFunctions.IsEmpty(RESTLib.Response.Content) then
          jResult.AddPair('erro', Format('O servidor não pôde encontrar o que foi pedido. %s', [EndPoint]))
         else jResult.AddPair('erro', RESTLib.Response.Content);

         Result := jResult.ToString;
        end;
      else
       begin
        Result := RESTLib.Response.Content;
        if ((Result = '') and (RESTLib.Response.StatusCode = 200)) then
          Result := '{ "sucesso": true, "mensagem": "Operação realizada com sucesso."}';
        bTentarNovamente := False;
       end;
      end;
     finally
      jResult.Free;
     end;
    end;
  except
   on E:Exception do
   begin
    jResult := TJSONObject.Create;
    jResult.AddPair('erro', E.Message);

    Result := jResult.ToString;
   end;
  end;
end;

function TConsultaReceitaFederal.ObterUrlPorTipoInscricao(const UrlParcial: string; InscricaoFederal: string; numerodiasultimaconsulta: integer): string;
var
  sTipoInscricao: String;
begin
  InscricaoFederal := TStringFunctions.ExtractNotNumbers(InscricaoFederal);

  if Length(InscricaoFederal) > 11 then
   sTipoInscricao := 'cnpj'
  else
   sTipoInscricao := 'cpf';

  Result := Format('%s%s', [ObterUrl(UrlParcial), Format('%s/%s/days/%d', [sTipoInscricao, InscricaoFederal, numerodiasultimaconsulta])]);
end;

function TConsultaReceitaFederal.ObterUrl(const UrlParcial: string): string;
var
  sServidor: string;
begin
  sServidor := TRegFunctions.ReadRegisterStr(HKEY_LOCAL_MACHINE, 'Software\Tron', 'UrlConsultaCNPJ', URL_SERVIDOR_PORTAL);

  if SameText(Copy(sServidor, 1, 5), 'http:') then
   if TRegFunctions.WriteRegisterStr(HKEY_LOCAL_MACHINE, 'Software\Tron', 'UrlConsultaCNPJ', URL_SERVIDOR_PORTAL) then
    sServidor := URL_SERVIDOR_PORTAL;

  sServidor := Format('%s%s', [sServidor, UrlParcial]);
  Result := TStringFunctions.EnsureEndsWith(sServidor, '/');
end;

function TConsultaReceitaFederal.PrepararData(const Data: TDate): string;
begin
  Result := FormatDateTime('yyyyMMdd', Data);
end;

function TConsultaReceitaFederal.PrepararDataHora(const DataHora: TDateTime): string;
begin
  Result := FormatDateTime('yyyyMMddhhnnss', DataHora);
end;

function TConsultaReceitaFederal.PrepararString(const Str: string): string;
begin
  Result := StringReplace(Str, ' ', '+', [rfReplaceAll]);
end;

function TConsultaReceitaFederal.ObtemDadosEmpresaPortalReceitaFederal(const InscricaoFederal: string; iDiasRenovacao: Integer): String;
var
  objStr: TMemoryStream;
  objStl: TStringList;
  sInfo: string;
  iNumeroTentativas: Integer;
begin
  iNumeroTentativas := 1;
  if iDiasRenovacao = 0 then
   iDiasRenovacao := DAYS_RENEW;

  try
   while iNumeroTentativas <= 3 do
    begin
     try
      Result := EnviarMensagem(ObterUrlPorTipoInscricao('v1', InscricaoFederal, iDiasRenovacao), '', '',
                               TRESTRequestMethod.rmGET, True);
      Break;
     except
      begin
       Inc(iNumeroTentativas);
       iDiasRenovacao := 0;
      end;
     end;
    end;
  finally
  end;
end;

{ TRESTLib }

procedure TRESTLib.Free;
begin
  if Assigned(Self.Client)   then Self.Client.Free;
  if Assigned(Self.Request)  then Self.Request.Free;
  if Assigned(Self.Response) then Self.Response.Free;
end;

end.


