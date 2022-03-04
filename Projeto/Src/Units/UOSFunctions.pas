//******************************************************************************
// Unidade.....: UOSFunctions
// Criação.....: 08/10/2007
// Técnico.....: José Mário
// Descrição...: Unidade de funções úteis para interação com o Sistema Operacional
//******************************************************************************
unit UOSFunctions;

interface

uses Windows, TLHelp32;

type
  OSVERSIONINFOEX = packed record
    dwOSVersionInfoSize: DWORD;
    dwMajorVersion: DWORD;
    dwMinorVersion: DWORD;
    dwBuildNumber: DWORD;
    dwPlatformId: DWORD;
    szCSDVersion: array[0..127] of Char;
    wServicePackMajor: WORD;
    wServicePackMinor: WORD;
    wSuiteMask: WORD;
    wProductType: BYTE;
    wReserved: BYTE;
  end;
  TOSVersionInfoEx = OSVERSIONINFOEX;
  POSVersionInfoEx = ^TOSVersionInfoEx;

  DWORDLONG = UInt64;

  TSecurityCenterProduct = (AntiVirusProduct,AntiSpywareProduct,FirewallProduct);

  TWindowsVersion = (wvWin95, wvWin98, wvWin98SE , wvWinME, wvWinNT, wvWin2k, wvWinXP,
                     wvWin2k3, wvWinVista, wvWin7, wvWin8, wvWinOther);

  TProcessEntry32 = packed record
    iSize,
    iUsage,
    iProcessID,
    iDefaultHeapId,
    iModuleId,
    iThreads,
    iParentProcessId,
    iPriClassBase,
    iFlags: Integer;
    aExeFile: array[0..MAX_PATH] of Char;
  end;


  TOSFunctions = class
  private
    class function IsKeyDown(Key: Cardinal): Boolean;
  published
    class function GetComputerName: string;
    class function GetCurrentUser: string;
    class function GetSpecialFolder(const CSIDL: integer): string;
    class function GetWindowsVersion: TWindowsVersion;
    class function IsAltDown: Boolean;
    class function IsCtrlDown: Boolean;
    class function IsProcessRunning(ExeName: string): boolean;
    class function StopProcess(ExeFileName: string): Integer;
    class function IsShiftDown: Boolean;
    class function IsWinServer: Boolean;
    class function OpenSite(const URL: string): boolean;
    class function OpenFile(const FileName: string): boolean;
    class function DownloadFile(Url, FileName: String): boolean;
    class function GetDefaultEmail: string;
    class function GetCommonDocumentsFolder(const SubFolder: string = ''): string;

    class function GetSecurityProductInfo(SecurityProduct:TSecurityCenterProduct): string;
    class function GetProxySettings(out Server: string;
      out Port: integer): boolean; static;
  end;



implementation

uses SysUtils, ShlObj, ShellAPI, Vcl.Forms, ActiveX, ComObj, Variants, URegFunctions,
  UStringFunctions, IOUtils, Classes, UAppFunctions, URLMon;

const
  MAX_PATH = 260;
  TH32CS_SNAPPROCESS = 2;

  VER_MINORVERSION = $0000001;
  VER_MAJORVERSION = $0000002;
  VER_SERVICEPACKMINOR = $0000010;
  VER_SERVICEPACKMAJOR = $0000020;
  VER_PRODUCT_TYPE = $0000080;

  WMIROOT='root';
  WMICLASSSCPRODUCT     : array [TSecurityCenterProduct] of string = ('AntiVirusProduct','AntiSpywareProduct','FirewallProduct');
  WMINAMESPACESCPRODUCT : array [Boolean] of string = ('SecurityCenter','SecurityCenter2');



{ OSFunctions }

function CreateToolHelpSnapShot(lFlags, lProcessId: Longint): Longint; stdcall; external 'kernel32.dll' name 'CreateToolhelp32Snapshot';
function ProcessFirst(hSnapshot: longint; var uProcess: TProcessEntry32): Longint; stdcall; external 'kernel32.dll' name 'Process32First';
function ProcessNext(hSnapshot: Longint; var uProcess: TProcessEntry32): Longint; stdcall; external 'kernel32.dll' name 'Process32Next';
function VerSetConditionMask(dwlConditionMask: int64;dwTypeBitMask: DWORD; dwConditionMask: Byte): int64; stdcall; external 'kernel32.dll';

{$IFDEF UNICODE}
function VerifyVersionInfo(var LPOSVERSIONINFOEX : OSVERSIONINFOEX;dwTypeMask: DWORD;dwlConditionMask: int64): BOOL; stdcall; external 'kernel32.dll' name 'VerifyVersionInfoW';
{$ELSE}
function VerifyVersionInfo(var LPOSVERSIONINFOEX : OSVERSIONINFOEX;dwTypeMask: DWORD;dwlConditionMask: int64): BOOL; stdcall; external 'kernel32.dll' name 'VerifyVersionInfoA';
{$ENDIF}

//******************************************************************************
// Função......: DownloadFile
// Criação.....: 03/07/2019
// Técnico.....: Flavio Ribeiro
// Descrição...: Realiza o Download de Arquivos utilizando a API do Windows
//******************************************************************************
class function TOSFunctions.DownloadFile(Url, FileName: String): boolean;
begin
  try
   Result := URLDownloadToFile(Nil, PChar(Url), PChar(FileName), 0, nil) = 0;
  except
   Result := False;
  end;
end;

class function TOSFunctions.GetCommonDocumentsFolder(const SubFolder: string): string;
begin
  if TAppFunctions.IsCloud  then
   Result := TPath.Combine(TDirectory.GetParent(TAppFunctions.AppDir), 'Documentos')
  else Result := Self.GetSpecialFolder(CSIDL_COMMON_DOCUMENTS);

  if TStringFunctions.IsFull(SubFolder) then
   Result := TPath.Combine(Result, SubFolder);
end;

//******************************************************************************
// Função......: GetComputerName
// Criação.....: 24/12/2008
// Técnico.....: Weverton
// Descrição...: Retorna o nome do computador
//******************************************************************************
class function TOSFunctions.GetComputerName: string;
var
  buffer: array[0..255] of char;
  size: dword;
begin
  size := SizeOf(Buffer);
  Windows.GetComputerName(buffer, size);

  Result := buffer;
end;


//******************************************************************************
// Função......: GetCurrentUser
// Criação.....: 26/02/2008
// Técnico.....: Weverton
// Descrição...: Retorna o nome do usuário logado
//******************************************************************************
class function TOSFunctions.GetCurrentUser: string;
var
  sUser: array[0..127] of char;
  iSize: DWord;
begin
  iSize := SizeOf(sUser);
  GetUserName(sUser, iSize);

  Result := sUser;
end;

class function TOSFunctions.GetSecurityProductInfo(
  SecurityProduct: TSecurityCenterProduct): string;
var
  FSWbemLocator : OLEVariant;
  FWMIService   : OLEVariant;
  FWbemObjectSet: OLEVariant;
  FWbemObject   : OLEVariant;
  oEnum         : IEnumvariant;
  iValue        : LongWord;
  osVerInfo     : TOSVersionInfo;
begin
  osVerInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  GetVersionEx(osVerInfo);

  if (SecurityProduct = AntiSpywareProduct) and (osVerInfo.dwMajorVersion < 6)  then Exit;

  FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
  FWMIService   := FSWbemLocator.ConnectServer('localhost', Format('%s\%s',[WMIROOT, WMINAMESPACESCPRODUCT[osVerInfo.dwMajorVersion>=6]]), '', '');

  FWbemObjectSet:= FWMIService.ExecQuery(Format('SELECT * FROM %s',[WMICLASSSCPRODUCT[SecurityProduct]]),'WQL',0);
  oEnum         := IUnknown(FWbemObjectSet._NewEnum) as IEnumVariant;

  while oEnum.Next(1, FWbemObject, iValue) = 0 do
   begin
    Result      := FWbemObject.displayName;
    FWbemObject := Unassigned;
   end;
end;


class function TOSFunctions.GetDefaultEmail: string;
var
  s, acc: string;
begin
  Result := '';
  acc := TRegFunctions.ReadRegisterStr(HKEY_CURRENT_USER, 'Software\Microsoft\Internet Account Manager', 'Default Mail Account', '');
  if TStringFunctions.IsFull(acc) then
   begin
    s := TRegFunctions.ReadRegisterStr(HKEY_CURRENT_USER, 'Software\Microsoft\Internet Account Manager\Accounts\' + acc, 'SMTP Email Address', '');
    if TStringFunctions.IsFull(s) then
     begin
      Result := s;
      s := TRegFunctions.ReadRegisterStr(HKEY_CURRENT_USER, 'Software\Microsoft\Internet Account Manager\Accounts\' + acc, 'SMTP Server', '');
      if TStringFunctions.IsFull(s) then
        Result := Result + ';' + s;
     end;
   end;
end;

class function TOSFunctions.GetProxySettings(out Server: string;
  out Port: integer): boolean;
var
  sServer: string;
  objStl: TStringList;
begin
  Result := False;

  if TRegFunctions.ReadRegisterBool(HKEY_CURRENT_USER, 'Software\Microsoft\Windows\CurrentVersion\Internet Settings', 'ProxyEnable') then
   begin
    objStl := TStringList.Create;

    try
     sServer := TRegFunctions.ReadRegisterStr(HKEY_CURRENT_USER, 'Software\Microsoft\Windows\CurrentVersion\Internet Settings', 'ProxyServer');

     if TStringFunctions.IsFull(sServer) then
      begin
       objStl.Delimiter     := ';';
       objStl.DelimitedText := sServer;

       if objStl.Count > 1 then
        sServer := objStl.Values['http'];

       objStl.Clear;
       objStl.Delimiter     := ':';
       objStl.DelimitedText := sServer;

       if objStl.Count > 0 then
        begin
         Server := objStl[0];
         Port   := StrToInt(objStl[1]);
        end;

       Result := True;
      end;
    finally
     objStl.Free;
    end;
   end;
end;


//******************************************************************************
// Função......: GetSpecialFolder
// Criação.....: 05/11/2008
// Técnico.....: Weverton
// Descrição...: Retorna a localização da pasta passada como parâmetro
//******************************************************************************
class function TOSFunctions.GetSpecialFolder(const CSIDL: integer): string;
var
  RecPath : PWideChar;
begin
  RecPath := StrAlloc(MAX_PATH);
  try
    FillChar(RecPath^, MAX_PATH, 0);

    if SHGetSpecialFolderPath(0, RecPath, CSIDL, false) then
     Result := RecPath
    else Result := '';
  finally
    StrDispose(RecPath);
  end;
end;

//******************************************************************************
// Função......: GetWindowsVersion
// Criação.....: 08/10/2007
// Técnico.....: José Mário
// Descrição...: Retorna a versão do windows
//******************************************************************************
class function TOSFunctions.GetWindowsVersion: TWindowsVersion;
var
 lVersionInfo: TOSVersionInfo;
  iMinorVersion: Cardinal;
  iMajorVersion: Cardinal;
begin
 // Windows another version - wvWinOther
 Result := wvWinOther;

 lVersionInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);

 // Obtém informações de versão do Windows
 GetVersionEx(lVersionInfo);

 if GetVersionEx(lVersionInfo) then
  begin
    iMinorVersion := lVersionInfo.dwMinorVersion;
    iMajorVersion := lVersionInfo.dwMajorVersion;

    case lVersionInfo.dwPlatformId of
     VER_PLATFORM_WIN32_NT:
      begin
        if iMajorVersion <= 4 then
          Result := wvWinNT
        else if (iMajorVersion = 5) and (iMinorVersion = 0) then
          Result := wvWin2K
        else if (iMajorVersion = 5) and (iMinorVersion = 1) then
          Result := wvWinXP
         else if (iMajorVersion = 5) and (iMinorVersion = 2) then
          Result := wvWin2K3
        else if (iMajorVersion = 6) and (iMinorVersion = 0) then
          Result := wvWinVista
        else if (iMajorVersion = 6) and (iMinorVersion = 1) then
          Result := wvWin7
        else if (iMajorVersion = 6) and (iMinorVersion = 2) then
          Result := wvWin8;
      end;
     VER_PLATFORM_WIN32_WINDOWS:
      begin
        if (iMajorVersion = 4) and (iMinorVersion = 0) then
          Result := wvWin95
        else if (iMajorVersion = 4) and (iMinorVersion = 10) then
        begin
          if lVersionInfo.szCSDVersion[1] = 'A' then
            Result := wvWin98SE
          else
            Result := wvWin98;
        end
        else if (iMajorVersion = 4) and (iMinorVersion = 90) then
          Result := wvWinME
        else
          Result := wvWinOther;
      end;
    end;
  end;
end;

class function TOSFunctions.IsAltDown : Boolean;
begin
  Result := IsKeyDown(VK_MENU);
end;

class function TOSFunctions.IsCtrlDown : Boolean;
begin
  Result := IsKeyDown(VK_CONTROL);
end;

class function TOSFunctions.IsKeyDown(Key: Cardinal): Boolean;
var
  State: TKeyboardState;
begin
  GetKeyboardState(State);
  Result := ((State[Key] and 128)<>0);
end;


//******************************************************************************
// Função......: IsProcessRunning
// Criação.....: 29/12/2008
// Técnico.....: Weverton
// Descrição...: Verifica se um exe está rodando
// Fonte.......: http://www.delphifaq.net/how-to-find-out-if-a-program-is-running/
//******************************************************************************
class function TOSFunctions.IsProcessRunning(ExeName: string): boolean;
var
  liI, lSnapShot: Longint;
  rProcess: TProcessEntry32;
begin
  Result  := False;
  ExeName := UpperCase(ExtractFileName(ExeName));
  lSnapShot := CreateToolHelpSnapShot(TH32CS_SNAPPROCESS, 0);

  if lSnapShot <> 0 then
   begin
    rProcess.iSize := SizeOf(rProcess);
    liI := ProcessFirst(lSnapShot, rProcess);
    while liI <> 0 do
     begin
      if Pos(ExeName, UpperCase(rProcess.aExeFile)) <> 0 then
       begin
        Result := True;
        Break;
       end;

      liI := ProcessNext(lSnapShot, rProcess);
     end;
    CloseHandle(lSnapShot);
   end;
end;

//******************************************************************************
// Função......: StopProcess
// Criação.....: 30/01/2015
// Técnico.....: Flavio Ribeiro
// Descrição...: Finaliza a execução de um processo
// Fonte.......: http://delphiquotes.blogspot.com.br/2013/02/kill-process-directly-in-delphi.html
//               http://stackoverflow.com/questions/2616279/how-can-i-get-other-processes-information-with-delphi
//******************************************************************************
class function TOSFunctions.StopProcess(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32w;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(
                        OpenProcess(PROCESS_TERMINATE,
                                    BOOL(0),
                                    FProcessEntry32.th32ProcessID),
                                    0));
     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

class function TOSFunctions.IsShiftDown : Boolean;
begin
  Result := IsKeyDown(VK_SHIFT);
end;


class function TOSFunctions.IsWinServer: Boolean;
const
   VER_NT_SERVER      = $0000003;
   VER_EQUAL          = 1;
   VER_GREATER_EQUAL  = 3;
var
   osvi             : OSVERSIONINFOEX;
   dwlConditionMask : DWORDLONG;
   op               : Integer;
begin
   dwlConditionMask := 0;
   op:=VER_GREATER_EQUAL;

   ZeroMemory(@osvi, sizeof(OSVERSIONINFOEX));
   osvi.dwOSVersionInfoSize := sizeof(OSVERSIONINFOEX);
   osvi.dwMajorVersion := 5;
   osvi.dwMinorVersion := 0;
   osvi.wServicePackMajor := 0;
   osvi.wServicePackMinor := 0;
   osvi.wProductType := VER_NT_SERVER;

   dwlConditionMask:=VerSetConditionMask( dwlConditionMask, VER_MAJORVERSION, op );
   dwlConditionMask:=VerSetConditionMask( dwlConditionMask, VER_MINORVERSION, op );
   dwlConditionMask:=VerSetConditionMask( dwlConditionMask, VER_SERVICEPACKMAJOR, op );
   dwlConditionMask:=VerSetConditionMask( dwlConditionMask, VER_SERVICEPACKMINOR, op );
   dwlConditionMask:=VerSetConditionMask( dwlConditionMask, VER_PRODUCT_TYPE, VER_EQUAL );

   Result:=VerifyVersionInfo(osvi,VER_MAJORVERSION OR VER_MINORVERSION OR
      VER_SERVICEPACKMAJOR OR VER_SERVICEPACKMINOR OR VER_PRODUCT_TYPE, dwlConditionMask);
end;

{ Abre o site 'URL'. Retorna 'true' se deu certo }
class function TOSFunctions.OpenFile(const FileName: string): boolean;
begin
  try
   ShellExecute(Application.Handle, 'Open', PChar(FileName), nil, nil, sw_ShowNormal);
   Result := true;
  except
   Result := false;
  end;
end;

class function TOSFunctions.OpenSite(const URL: string): boolean;
begin
  if not TAppFunctions.IsCloud then
   try
    ShellExecute(Application.Handle, 'Open', PChar(URL), nil, nil, sw_ShowNormal);
    Result := true;
   except
    Result := false;
   end;
end;

end.
