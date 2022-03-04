unit UConsultaCep;

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

TConsultaCep = class(TComponent)
  private
    FCep: string;
    function ObterUrlPorCep(const Cep: string): string;
    function PrepararString(const Str: string): string;
    function EnviarMensagem(const BaseURL, EndPoint: String; jMessage: String;
      RequestType: TRESTRequestMethod; const UserAuth: Boolean): String;
    function GetRESTLib: TRESTLib;
  protected
  public
    constructor Create(AOwner: TComponent; const Cep: string);
  published
    function ObtemDadosEmpresaPortalViaCep(const Cep: string): String;
    property Cep: string read FCep;
  end;

implementation

uses
  URegFunctions, Windows, UStringFunctions, UMsgFunctions, IdCoderMIME,
  SuperObject, UTronException, StrUtils, UNumberFunctions,
  EncdDecd, IOUtils, DateUtils, UNetFunctions;

const
  URL_SERVIDOR_PORTAL = 'https://viacep.com.br/ws/%s/json/';

{ TRESTLib }

procedure TRESTLib.Free;
begin
  if Assigned(Self.Client)   then Self.Client.Free;
  if Assigned(Self.Request)  then Self.Request.Free;
  if Assigned(Self.Response) then Self.Response.Free;
end;

{ TConsultaCep }

constructor TConsultaCep.Create(AOwner: TComponent; const Cep: string);
begin
  inherited Create(AOwner);
  FCep      := Cep;
end;

function TConsultaCep.EnviarMensagem(const BaseURL, EndPoint: String;
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
       Value   := 'Bearer ';
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

function TConsultaCep.GetRESTLib: TRESTLib;
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

function TConsultaCep.ObtemDadosEmpresaPortalViaCep(const Cep: string): String;
var
  objStr: TMemoryStream;
  objStl: TStringList;
  sInfo: string;
  iNumeroTentativas: Integer;
begin
  iNumeroTentativas := 1;

  try
   while iNumeroTentativas <= 3 do
    begin
     try
      Result := EnviarMensagem(ObterUrlPorCep(Cep), '', '',
                               TRESTRequestMethod.rmGET, False);
      Break;
     except
      begin
       Inc(iNumeroTentativas);
      end;
     end;
    end;
  finally
  end;
end;

function TConsultaCep.ObterUrlPorCep(const Cep: string): string;
var
  FCep : string;
begin
  FCep := TStringFunctions.ExtractNotNumbers(Cep);

  Result := Format(URL_SERVIDOR_PORTAL, [FCep]);

end;

function TConsultaCep.PrepararString(const Str: string): string;
begin
  Result := StringReplace(Str, ' ', '+', [rfReplaceAll]);
end;

end.
