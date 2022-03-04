unit UNetFunctions;

interface

uses Classes, IdHttp, IdSSLOpenSSL, UrlMon, REST.Client;

type
  TNetFunctions = class(TPersistent)
  public
    class procedure CheckProxySettings(AIdHttp: TIdHTTP; const ProxyServer: string;
      const ProxyPort: integer; const ProxyUser, ProxyPass: string); overload;
    class procedure CheckProxySettings(AIdHttp: TIdHTTP); overload;
    class procedure CheckProxySettings(ARESTClient: TRESTClient); overload;
    class procedure CheckProxySettings(ARESTClient: TRESTClient; const ProxyServer: string; const ProxyPort: integer; const ProxyUser, ProxyPass: string); overload;
  published
    class function IsWrongIP(const IP: string): Boolean;
    class function IsConnectedToInternet: Boolean;
    class function IsValidEmail(const Email: string): Boolean;
    class function DefineURLMsgTwitter(msgTwitter: String): String;
    class function OpenSite(const URL: string): boolean;
    class function IsValidHost(var Host: string): boolean;
    class function GetLocalIP: String;
    class function GetLocalIPs: TStringList;
    class function IsLocalIP(const Address: string): boolean;
    class procedure SetProxyUser(const User: string);
    class procedure SetProxyPass(const Pass: string);
    class function GetProxyUser: string;
    class function GetProxyPass: string;
    class function IPAddressToName(const IP: string): string;
    class function DownloadFile(const Url, FileName: string): boolean;
    class function DownloadFileIE(const Url, FileName: string): boolean;
  end;

implementation

uses AnsiStrings, SysUtils, Types, WinInet, UStringFunctions, RegExpr, ShellApi,
  Vcl.Forms, Windows, IdStack, IdIPWatch, UOSFunctions, URegFunctions, WinSock;

{ TNetFunctions }

//******************************************************************************
// Função........: CheckProxySettings
// Criação.......: 26/10/2020
// Implementação.: 26/10/2020
// Técnico.......: Flavio Ribeiro
// Tarefa........:
// URL...........:
// Descrição.....: Seta as configurações do proxy definidos no windows para o componente
//******************************************************************************
class procedure TNetFunctions.CheckProxySettings(AIdHttp: TIdHTTP);
var
  sServer: string;
  iPort: Integer;
begin
  if TOSFunctions.GetProxySettings(sServer, iPort) then
   Self.CheckProxySettings(AIdHttp, sServer, iPort, EmptyStr, EmptyStr);
end;

//******************************************************************************
// Função........: CheckProxySettings
// Criação.......: 26/10/2020
// Implementação.: 26/10/2020
// Técnico.......: Flavio Ribeiro
// Tarefa........:
// URL...........:
// Descrição.....: Seta as configurações do proxy definidos no windows para o componente
//******************************************************************************
class procedure TNetFunctions.CheckProxySettings(ARESTClient: TRESTClient);
var
  sServer: string;
  iPort: Integer;
begin
  if TOSFunctions.GetProxySettings(sServer, iPort) then
   Self.CheckProxySettings(ARESTClient, sServer, iPort, EmptyStr, EmptyStr);
end;

//******************************************************************************
// Função........: CheckProxySettings
// Criação.......: 26/10/2020
// Implementação.: 26/10/2020
// Técnico.......: Flavio Ribeiro
// Tarefa........:
// URL...........:
// Descrição.....: Seta as configurações do proxy definidos no windows para o componente
//******************************************************************************
class procedure TNetFunctions.CheckProxySettings(AIdHttp: TIdHTTP;
  const ProxyServer: string; const ProxyPort: integer; const ProxyUser, ProxyPass: string);
begin
  if TStringFunctions.IsFull(ProxyServer) and (ProxyPort > 0) then
   begin
    AIdHttp.ProxyParams.ProxyServer   := ProxyServer;
    AIdHttp.ProxyParams.ProxyPort     := ProxyPort;

    if TStringFunctions.IsFull(ProxyUser) then
     AIdHttp.ProxyParams.ProxyUsername := ProxyUser
    else AIdHttp.ProxyParams.ProxyUsername := Self.GetProxyUser;

    if TStringFunctions.IsFull(ProxyPass) then
     AIdHttp.ProxyParams.ProxyPassword := ProxyPass
    else AIdHttp.ProxyParams.ProxyPassword := Self.GetProxyPass;
   end;
end;

//******************************************************************************
// Função........: CheckProxySettings
// Criação.......: 26/10/2020
// Implementação.: 26/10/2020
// Técnico.......: Flavio Ribeiro
// Tarefa........:
// URL...........:
// Descrição.....: Seta as configurações do proxy definidos no windows para o componente
//******************************************************************************
class procedure TNetFunctions.CheckProxySettings(ARESTClient: TRESTClient;
  const ProxyServer: string; const ProxyPort: integer; const ProxyUser, ProxyPass: string);
begin
  if TStringFunctions.IsFull(ProxyServer) and (ProxyPort > 0) then
   begin
    ARESTClient.ProxyServer   := ProxyServer;
    ARESTClient.ProxyPort     := ProxyPort;

    if TStringFunctions.IsFull(ProxyUser) then
     ARESTClient.ProxyUsername := ProxyUser
    else ARESTClient.ProxyUsername := Self.GetProxyUser;

    if TStringFunctions.IsFull(ProxyPass) then
     ARESTClient.ProxyPassword := ProxyPass
    else ARESTClient.ProxyPassword := Self.GetProxyPass;
   end;
end;

//******************************************************************************
// Função........: DefineURLMsgTwitter
// Criação.......: 11/03/2005
// Implementação.: 17/09/2007
// Técnico.......: José Mário
// Tarefa........:
// URL...........:
// Descrição.....: Verifica se há conexão corrente com a internet
//******************************************************************************
class function TNetFunctions.DefineURLMsgTwitter(msgTwitter: String): String;
var
 FRegExpr: TRegExpr;
 strl: TStringList;
 i: integer;
begin

  try
   strl := TStringList.Create;
   result := msgTwitter;

   FRegExpr := TRegExpr.Create;
   FRegExpr.Expression := 'http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?';
   strl := TStringFunctions.Aparse(result, ' ');

   for i := 0 to strl.Count - 1 do
    if FRegExpr.Exec(strl[i]) then
     result := StringReplace(result, strl[i], ' <link>'+strl[i]+'</link> ', [rfReplaceAll]);

  finally
   FreeAndNil( FRegExpr );
   freeAndNil( strl );
  end;

end;


//******************************************************************************
// Função........: IsConnectedToInternet
// Criação.......: 11/03/2005
// Implementação.: 17/09/2007
// Técnico.......: José Mário
// Tarefa........:
// URL...........:
// Descrição.....: Verifica se há conexão corrente com a internet
//******************************************************************************
class function TNetFunctions.GetLocalIP: String;
var
  r : TIdIPWatch;
begin
  r := TIdIPWatch.Create(nil);
  try
   Result := r.LocalIP;
  finally
   r.free;
  end;
end;

class function TNetFunctions.GetLocalIPs: TStringList;
begin
  TIdStack.IncUsage;

  try
   Result := TStringList.Create;
   Result.AddStrings(GStack.LocalAddresses);
  finally
   TIdStack.DecUsage;
  end;
end;

class function TNetFunctions.GetProxyPass: string;
begin
  Result := TRegFunctions.ReadRegisterStr(HKEY_CURRENT_USER, 'Software\Tron\', 'ProxyPass', EmptyStr);

  if TStringFunctions.IsFull(Result) then
   Result := TStringFunctions.Crypto(Result);
end;

class function TNetFunctions.GetProxyUser: string;
begin
  Result := TRegFunctions.ReadRegisterStr(HKEY_CURRENT_USER, 'Software\Tron\', 'ProxyUser', EmptyStr);
end;

class function TNetFunctions.IPAddressToName(const IP: string): string;
var
  SockAddrIn: TSockAddrIn;
  HostEnt: PHostEnt;
  WSAData: TWSAData;
  sIP: AnsiString;
begin
  sIP := IP;
  WSAStartup($101, WSAData);
  SockAddrIn.sin_addr.S_addr := inet_addr(PAnsiChar(sIP));
  HostEnt := gethostbyaddr(@SockAddrIn.sin_addr.S_addr, 4, AF_INET);

  if (HostEnt <> nil) then
   Result := AnsiStrings.StrPas(HostEnt^.h_name)
  else Result := EmptyStr;
end;

class function TNetFunctions.IsConnectedToInternet: Boolean;
var
 dwConnectionTypes: DWORD;

begin
 dwConnectionTypes := INTERNET_CONNECTION_MODEM + INTERNET_CONNECTION_LAN + INTERNET_CONNECTION_PROXY;

 Result := InternetGetConnectedState(@dwConnectionTypes, 0) and
           InternetAutodial(INTERNET_AUTODIAL_FORCE_ONLINE or INTERNET_AUTODIAL_FORCE_UNATTENDED, 0);
end;

class function TNetFunctions.IsLocalIP(const Address: string): boolean;
var
  sAddress: string;
  objIPs: TStringList;
begin
  sAddress := Address;

  objIPs := Self.GetLocalIPs;

  try
   Self.IsValidHost(sAddress);

   Result := (objIPs.IndexOf(sAddress) >= 0) or
             (Pos(sAddress, '127.0.0.1') > 0) or
             (Pos(sAddress, 'localhost') > 0);
  finally
   objIPs.Free;
  end;
end;

class function TNetFunctions.IsValidEmail(const Email: string): Boolean;
var
  LArr, LPnt: TStringList;
begin
  Result := false;

  if (TStringFunctions.CountChars(EMail, '@') <> 1) or (TStringFunctions.CountChars(EMail, '.') < 1) then Exit;

  LArr := TStringFunctions.AParse(EMail, '@');
  LPnt := TStringFunctions.Aparse(TStringFunctions.CopyPosEnd(Email, '@'), '.');

  try
   Result := (LArr.Count = 2) and (LPnt.Count >= 2) and (LArr[0] <> '') and (LArr[1] <> '') and (LPnt[0] <> '') and (LPnt[1] <> '');
  finally
   LArr.Free;
   LPnt.Free;
  end;
end;

class function TNetFunctions.IsValidHost(var Host: string): boolean;
begin
  TIdStack.IncUsage;

  try
   Host   := GStack.ResolveHost(Host);
   Result := GStack.IsIP(Host);
  finally
   TIdStack.DecUsage;
  end;
end;

class function TNetFunctions.IsWrongIP(const IP: string): Boolean;
var
  z, i: Cardinal;
  st: array[1..3] of byte;
const
  ziff = ['0'..'9'];
begin
  st[1]  := 0;
  st[2]  := 0;
  st[3]  := 0;
  z      := 0;
  Result := False;

  for i := 1 to Length(ip) do
   if ip[i] in ziff then
   else
    begin
     if ip[i] = '.' then
      begin
       Inc(z);
       if z < 4 then
        st[z] := i
       else
        begin
         Result := True;
         Exit;
        end;
      end
     else
      begin
       Result := True;
       Exit;
      end;
    end;

  if (z <> 3) or (st[1] < 2) or (st[3] = Length(ip)) or (st[1] + 2 > st[2]) or
    (st[2] + 2 > st[3]) or (st[1] > 4) or (st[2] > st[1] + 4) or (st[3] > st[2] + 4) then
   begin
    Result := True;
    Exit;
   end;

  z := StrToInt(Copy(ip, 1, st[1] - 1));
  if (z > 255) or (ip[1] = '0') then
   begin
    Result := True;
    Exit;
   end;

  z := StrToInt(Copy(ip, st[1] + 1, st[2] - st[1] - 1));
  if (z > 255) or ((z <> 0) and (ip[st[1] + 1] = '0')) then
   begin
    Result := True;
    Exit;
   end;

  z := StrToInt(Copy(ip, st[2] + 1, st[3] - st[2] - 1));
  if (z > 255) or ((z <> 0) and (ip[st[2] + 1] = '0')) then
   begin
    Result := True;
    Exit;
   end;

  z := StrToInt(Copy(ip, st[3] + 1, Length(ip) - st[3]));
  if (z > 255) or ((z <> 0) and (ip[st[3] + 1] = '0')) then
   begin
    Result := True;
    Exit;
   end;
end;

//******************************************************************************
// Função........: OpenSite
// Criação.......: 13/06/2012
// Implementação.: 13/06/2012
// Técnico.......: Flavio Ribeiro
// Tarefa........:
// URL...........:
// Descrição.....: Abre uma URL no browser padrão
//******************************************************************************
class function TNetFunctions.OpenSite(const URL: string): boolean;
begin
  try
    ShellExecute(Application.Handle, 'Open', PChar(URL), nil, nil, sw_ShowNormal);
    Result := true;
  except
    Result := false;;
  end;
end;

//******************************************************************************
// Função........: DownloadFile
// Criação.......: 22/10/2018
// Implementação.: 22/10/2018
// Técnico.......: Flavio Ribeiro
// Tarefa........:
// URL...........:
// Descrição.....: Faz Download de um Arquivo
//******************************************************************************
class function TNetFunctions.DownloadFile(const Url, FileName: string): boolean;
var
  IdHTTP1: TIdHTTP;
  Stream: TMemoryStream;
  vHandler: TIdSSLIOHandlerSocketOpenSSL;
begin
  IdHTTP1 := TIdHTTP.Create(Nil);
  vHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

  Stream := TMemoryStream.Create;
  try
   if TStringFunctions.SeExiste('https:', Url) then
    IdHTTP1.IOHandler := vHandler;

   IdHTTP1.Get(Url, Stream);
   Stream.SaveToFile(FileName);
  finally
   Stream.Free;
   IdHTTP1.Free;
  end;
end;

//******************************************************************************
// Função........: DownloadFileIE
// Criação.......: 17/09/2019
// Implementação.: 17/09/2019
// Técnico.......: Flavio Ribeiro
// Tarefa........:
// URL...........:
// Descrição.....: Faz Download de um Arquivo usando a API do Windows
//******************************************************************************
class function TNetFunctions.DownloadFileIE(const Url, FileName: string): boolean;
begin
  try
   URLDownloadToFile(Nil, PChar(Url), PChar(FileName), 0, nil);
   Result := True;
  except
   On E:Exception do
    begin
     Result := False;
    end;
  end;
end;

class procedure TNetFunctions.SetProxyPass(const Pass: string);
begin
  TRegFunctions.WriteRegisterStr(HKEY_CURRENT_USER, 'Software\Tron\','ProxyPass', TStringFunctions.Crypto(Pass));
end;

class procedure TNetFunctions.SetProxyUser(const User: string);
begin
  TRegFunctions.WriteRegisterStr(HKEY_CURRENT_USER, 'Software\Tron\','ProxyUser', User);
end;

end.
