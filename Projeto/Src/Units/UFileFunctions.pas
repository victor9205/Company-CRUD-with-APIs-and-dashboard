unit UFileFunctions;

interface

uses Classes, Windows, SysUtils;

type
  TFileVersion = record
  private
    FMajorVersion: integer;
    FMinorVersion: integer;
    FRelease: integer;
    FBuild: integer;
  public
    function ToString: string;

    property MajorVersion: integer read FMajorVersion write FMajorVersion;
    property MinorVersion: integer read FMinorVersion write FMinorVersion;
    property Release: integer read FRelease write FRelease;
    property Build: integer read FBuild write FBuild;
  end;

  TFileInfo = class(TPersistent)
  private
    FSize: Integer;
    FInteger: Integer;
    FTime: Integer;
    FFileName: TFileName;
  public
    constructor Create; overload;
    constructor Create(SearchRec: TSearchRec); overload;
  published
    property Attr: Integer read FInteger write FInteger;
    property FileName: TFileName read FFileName write FFileName;
    property Size: Integer read FSize write FSize;
    property Time: Integer read FTime write FTime;
  end;

  TFileFunctions = class(TPersistent)
  private
    class function ContFiles(Dir, Mask: string): integer; static;
  public
    class function CompareVersions(VersionFirstFile, VersionSecondFile: TFileName): integer; overload;
    class function CountFiles(const Dir: string; const FileMask: string): integer; overload;
  published
    class function Attrib(const Files: string; const Attr: Cardinal): boolean;
    class function CountFiles(const FilePattern: string): integer; overload;
    class function Coparq(const Arquivos, CopiarPara: string): boolean;
    class function CompareFilesVersion(const FirstFile, SecondFile: string): integer; overload;
    class function DelAll(const arquivos: string; ForceNext: boolean = false): boolean;
    class function DeleteFiles(const FilePattern: string; const ForceNext: boolean = True): boolean;
    class function EmptyDir(Dir: string): boolean;
    class function GetFileSize( sFileName: string): Int64;
    class function GetFileVersion(sFileName: string): TFileVersion; overload;
    class function GetShortPath(Path: string; Count: Integer): string;
    class function IsDirectory(const Path: string): Boolean;
    class function ListFiles(const FilePattern: string; const Recursive: Boolean = False;
    const IncludeFileInfo: Boolean = False; const IncludePathInFile: Boolean = False): TStringList;
    class function MD(const Path: string): boolean;
    class function MD5(const FileName: string): string;
    class function ParamExists( sParam: string): boolean;
    class function SerialInNumbers(const Serial: string): string;
    class function UpDir(const Dir: string; LevelCount: integer = 1): string;
    class function ValidFileName(const OriginalFileName: string; const sDefault: String = '_'): string;
    class function VolumeNumber(const Path: string): string;
    class function WinDir: string;
    class function RunNormal(const sFileName: string): boolean;
    class function RunHide(const sFileName: string): boolean;
    class function VerifyDirectory(const Path: String): boolean;
    class function IsNetworkDrive(const Path: string): boolean;
    class procedure ShowDirectory(const Path: string);
    class function ByteFileContent(const FileName: String): TBytes;
    class function GetFileDate(sFileName: string): TDateTime;
    class function GetFileDateToVersion(sFileName: string): String;
  end;

const
  ILLEGAL_FILENAME_CHARACTERS: array [1..8] of char = ('\', '/', ':', '*', '?', '<', '>', '|');

implementation

uses Math, UStringFunctions, StrUtils, UMsgFunctions, IdHashMessageDigest;

{ TFileInfo }

constructor TFileInfo.Create;
begin
end;

constructor TFileInfo.Create(SearchRec: TSearchRec);
begin
  Self.Attr := SearchRec.Attr;
  Self.FileName := SearchRec.Name;
  Self.Size     := SearchRec.Size;
  Self.Time     := SearchRec.Time;
end;

{ TFileFunctions }

/// <summary>
/// Conta os arquivos que atendam ao FilePattern
/// </summary>
/// <param name="FilePattern">Padrão dos arquivos a serem contados. Aceita caracteres coringa</param>
/// <returns>Quantidade de arquivos</returns>
class function TFileFunctions.CountFiles(
  const FilePattern: string): integer;
var
  rec: TSearchRec;
  i: integer;
begin
  Result := 0;

  if not DirectoryExists(ExtractFileDir(FilePattern)) then Exit;

  i := FindFirst(FilePattern, faAnyFile, rec);

  while i = 0 do
   begin
    if (rec.Name <> '.') and (rec.Name <> '..') then
      Inc(Result);

    i := FindNext(rec);
   end;

  FindClose(rec);
end;

/// <summary>
/// Exclui os arquivos informados em FilePattern
/// </summary>
/// <param name="FilePattern">Padrão de arquivos a serem excluidos. Podem ser usados caracters coringa</param>
/// <param name="ForceNext">Define se ao ocorrer um erro na exclusão de um arquivo, deve-se prosseguir o processamento</param>
/// <returns>True se o procedimento foi bem sucedido e False caso contrário</returns>
class function TFileFunctions.DeleteFiles(
  const FilePattern: string; const ForceNext: boolean): boolean;
var
  rec: TSearchRec;
  sArq, s: string;
  bAux : boolean;
  i: integer;
begin
  s := IncludeTrailingPathDelimiter(ExtractFileDir(FilePattern));

  // Verificando se o diretorio está vazio
  if TFileFunctions.EmptyDir(s) then
   begin
    Result := true;
    Exit;
   end;

  i    := FindFirst(FilePattern, faAnyFile, rec);
  bAux := false;

  // Tentando apagar arquivo
  while i = 0 do
   begin
    sArq  := s + rec.Name;
    SetFileAttributes(PChar(sArq), FILE_ATTRIBUTE_NORMAL);
    bAux := DirectoryExists(sArq) or ((rec.Name = '.') or (rec.Name = '..')) or DeleteFile(PChar(sArq));
    i    := IfThen(ForceNext or bAux , FindNext(rec), 1);
   end;

  Result := bAux;
  FindClose(rec);
end;

/// <summary>
/// Retorna se determinado diretório está vazio
/// </summary>
/// <param name="Dir">Diretório a ser verificado</param>
/// <returns>True se o diretório estiver vazio e False caso contrário</returns>
class function TFileFunctions.EmptyDir(Dir: string): boolean;
begin
  Dir := IncludeTrailingPathDelimiter(Dir);

  Result := DirectoryExists(Dir) and (TFileFunctions.CountFiles(Dir + '*.*') = 0)
end;

/// <summary>
/// Verifica se Path é um diretório
/// </summary>
/// <param name="Path">Caminho a ser verificado</param>
/// <returns>True se path for um diretório existente e False caso contrário</returns>
class function TFileFunctions.IsDirectory(const Path: string): Boolean;
begin
  Result := DirectoryExists(Path);
end;

class function TFileFunctions.IsNetworkDrive(const Path: string): boolean;
var
  sDrive: string;
begin
  sDrive := ExtractFileDrive(Path);

  if TStringFunctions.IsFull(sDrive) then
   Result := GetDriveType(PChar(sDrive)) = DRIVE_REMOTE
  else Result := False;
end;

/// <summary>
/// Retorna um array de bytes
/// </summary>
/// <param name="FilePattern">Padrão a ser utilizado na pesquisa</param>
/// <param name="Recursive">Define se deve verificar subdiretórios</param>
/// <returns>Lista dos arquivos</returns>

class function TFileFunctions.ByteFileContent(const FileName: String): TBytes;
var
  Buffer: TBytes;
  mStream: TMemoryStream;
begin
  mStream := TMemoryStream.Create;
  try
   if not FileExists(FileName) then Exit;

   mStream.LoadFromFile(FileName);
   SetLength(Buffer, mStream.Size);

   mStream.Position := 0;
   if mStream.Size > 0 then
    mStream.ReadBuffer(Pointer(Buffer)^, mStream.Size);
  finally
   mStream.Free;
   Result := Buffer;
  end;
end;

/// <summary>
/// Retorna uma lista com arquivos existentes de acordo com FilePattern
/// </summary>
/// <param name="FilePattern">Padrão a ser utilizado na pesquisa</param>
/// <param name="Recursive">Define se deve verificar subdiretórios</param>
/// <returns>Lista dos arquivos</returns>
class function TFileFunctions.ListFiles(const FilePattern: string;
  const Recursive: boolean; const IncludeFileInfo: Boolean; const IncludePathInFile: Boolean): TStringList;
var
  rec: TSearchRec;
  c, i  : integer;
  objStl : TStringList;
  sFolder: String;
begin
  Result := TStringList.Create;

  // Verificando se o diretório existe
  sFolder := ExtractFileDir(FilePattern);
  if not DirectoryExists(sFolder) then
   Exit;

  c := FindFirst(FilePattern, faAnyFile, rec);

  if c = 0 then
   repeat
    // Retirando o diretório atual e o superior
    if (rec.Name <> '.') and (rec.Name <> '..') then
     if TFileFunctions.IsDirectory(Format('%s%s', [IncludeTrailingPathDelimiter(sFolder), rec.Name])) then
      begin
       // Verificando se deve navegar nos sub-diretórios
       if Recursive then
        begin
         objStl := Self.ListFiles(Format('%s%s', [IncludeTrailingPathDelimiter(Format('%s%s', [IncludeTrailingPathDelimiter(sFolder), rec.Name])), ExtractFileName(FilePattern)]),
                                  Recursive, IncludeFileInfo, IncludePathInFile);

         Result.AddStrings(objStl);
         objStl.Free;
        end;
      end
     else
      begin
       // Verificando se deve incluir informações do arquivo
       if IncludeFileInfo then
        begin
         if IncludePathInFile then
          Result.AddObject(Format('%s%s', [IncludeTrailingPathDelimiter(sFolder), rec.Name]), TFileInfo.Create(rec))
         else
          Result.AddObject(rec.Name, TFileInfo.Create(rec));
        end
       else
        begin
         if IncludePathInFile then
          Result.Add(Format('%s%s', [IncludeTrailingPathDelimiter(sFolder), rec.Name]))
         else
          Result.Add(rec.Name);
        end;
      end;

    c := FindNext(rec);
   until c <> 0;

  FindClose(rec);
end;


/// <summary>
/// Recebe um número de série com e troca letras por números (migrado da ProtLib)
/// </summary>
/// <param name="Serial">Número de série</param>
/// <returns>Número de séria com as letras trocadas por números</returns>
class function TFileFunctions.SerialInNumbers(
  const Serial: string): string;
var
  i, p, c: integer;
begin
  Result := Serial;
  c := -1;

  for i := 1 to Length(Result) do
   begin
    Inc(c);
    p := StrToIntDef(Result[i], -1);

    if p = -1 then
     Result[i] := IntToStr(c)[1];

    if c > 9 then
     c := -1;
   end;
end;

class procedure TFileFunctions.ShowDirectory(const Path: string);
var
  sDir: string;
begin
  sDir := ExtractFileDir(Path);

  if DirectoryExists(sDir) then
   WinExec(PAnsiChar(Format('explorer.exe ''%s''', [sDir])) , SW_SHOWNORMAL);
end;

class function TFileFunctions.UpDir(const Dir: string; LevelCount: integer): string;
var
  objStl: TStringList;
begin
  objStl := TStringList.Create;
  objStl.Delimiter := '\';
  objStl.DelimitedText := Dir;

  if objStl.Count >= LevelCount then
   repeat
    objStl.Delete(objStl.Count - 1);
    Dec(LevelCount)
   until (LevelCount = 0);

  Result := IncludeTrailingPathDelimiter(objStl.DelimitedText);
  objStl.Free;
end;

/// <summary>
/// Retorna um nome de arquivo sem os caracteres inválidos ( \ / : * ? <> | )
/// </summary>
/// <param name="OriginalFileName">Nome do arquivo a ser validado</param>
/// <returns>Nome do arquivo sem os caracteres inválidos</returns>
class function TFileFunctions.ValidFileName(const OriginalFileName: string; const sDefault: String = '_'): string;
var
  i: integer;
begin
  Result := OriginalFileName;

  // Varrendo lista de caratecres ilegais para efetuar a substituição de todos
  for i := Low(ILLEGAL_FILENAME_CHARACTERS) to High(ILLEGAL_FILENAME_CHARACTERS) do
   Result := StringReplace(Result, ILLEGAL_FILENAME_CHARACTERS[i], sDefault, [rfReplaceAll]);
end;

class function TFileFunctions.VerifyDirectory(const Path: String): boolean;
var
  Directory: String;
begin
  Directory := ExtractFileDir(Path);

  Result := DirectoryExists(Directory);

  if not Result then
   begin
    Result := TMsgFunctions.Question('Diretório inexistente. Gostaria de criá-lo?');

    if Result then
     begin
      try
       ForceDirectories(Directory);

      except on E: Exception do
        TMsgFunctions.Error('Não foi possível criar o diretório.' + E.Message);
      end;
     end;
   end;
end;

/// <summary>
/// Retorna o número de série do HD relativo ao Path (migrado da TronProt)
/// </summary>
/// <param name="Path">Caminho de onde deve ser verificado o serial</param>
/// <returns>Serial do volume informado</returns>
class function TFileFunctions.VolumeNumber(const Path: string): string;
var
  sLabName: array[0..199] of char;
  sFileSys: array[0..19] of char;
  iSerNumber, iCompLen, iSysFlags: DWORD;
  s: string;
begin
  Result := '';

  // Verificando se foi informado caminho
  if TStringFunctions.IsFull(Path) then
   begin
    // Obtendo drive
    s := IncludeTrailingPathDelimiter(ExtractFileDrive(Path));
    if GetVolumeInformation(PChar(s), @sLabName, 200, @iSerNumber, iCompLen, iSysFlags, @sFileSys, 20) then
     Result := TFileFunctions.SerialInNumbers(Format('%.8x', [iSerNumber]));
   end;
end;
//******************************************************************************
// Funcao.....: Attrib
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..: mover para uma classe mais adequada
//******************************************************************************
class function TFileFunctions.Attrib(const Files: string;
  const Attr: Cardinal): boolean;
var
  Arqs: TSearchRec;
  i: integer;
  sDir: string;
begin
  i := FindFirst(Files, faAnyFile - faDirectory, Arqs);
  Result := false;
  sDir := TStringFunctions.NoExtreme('\', ExtractFileDir(Files));
  while i = 0 do
  begin
    Result := SetFileAttributes(PChar(sDir + '\' + Arqs.Name), Attr);
    if not Result then Break;
    i := FindNext(Arqs);
  end;
  SysUtils.FindClose(Arqs);
end;

//******************************************************************************
// Funcao.....: DelAll
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TFileFunctions.DelAll(const arquivos: string;
  ForceNext: boolean): boolean;
var
  EncontraArq: TSearchRec;
  Resultado: integer;
  Arquivo, diretorio, s: string;
  DeuCerto: boolean;
begin
  s := ExtractFileDir(arquivos);
  if EmptyDir(s) or (not TStringFunctions.SeExiste('*.*', arquivos) and (CountFiles(s, '*.*') = 0)) then
  begin
    Result := true;
    Exit;
  end;

  diretorio := s;
  if not TStringFunctions.IsEmpty(s) then
    if (s[Length(s)]<>'\') then diretorio := (s + '\');

  //diretorio := Se(s[Length(s)] <> '\', s + '\', s);
  Resultado := FindFirst(arquivos, faAnyFile, EncontraArq);
  DeuCerto  := false;
  while Resultado = 0 do
  begin
    arquivo   := diretorio + EncontraArq.Name;
    Attrib(arquivo, FILE_ATTRIBUTE_NORMAL);
    DeuCerto  := DirectoryExists(arquivo) or ((EncontraArq.Name = '.') or (EncontraArq.Name = '..')) or DeleteFile(PChar(arquivo));
    Resultado := ifThen(ForceNext or DeuCerto, FindNext(EncontraArq), 1);
  end;
  Result := DeuCerto;
  SysUtils.FindClose(EncontraArq);
end;

/// <summary>
/// Faz a comparações entre duas versões de arquivo
/// </summary>
/// <param name="FirsFile">Caminho do primeiro arquivo</param>
/// <param name="SecondFile">Caminho do segundo arquivo</param>
/// <returns>
///  * -1 se a versão do primeiro for menor que a do segundo
///  * 0 se as versões forem igual
///  * 1 se a versão do primeiro for maior que a do segundo
/// </returns>
class function TFileFunctions.CompareFilesVersion(const FirstFile,
  SecondFile: string): integer;
var
  sVersion1stFile: string;
  sVersion2ndFile: string;
begin
  sVersion1stFile := Self.GetFileVersion(FirstFile).ToString;
  sVersion2ndFile := Self.GetFileVersion(SecondFile).ToString;

  Result := Self.CompareVersions(sVersion1stFile, sVersion2ndFile);
end;

/// <summary>
/// Faz a comparações entre duas versões de arquivo
/// </summary>
/// <param name="VersionFirsFile">Versão do primeiro arquivo</param>
/// <param name="VersionSecondFile">Versão do segundo arquivo</param>
/// <returns>
///  * -1 se a primeira versão for menor que a segunda
///  * 0 se as versões forem igual
///  * 1 se a primeira versão for maior que a segunda
/// </returns>
class function TFileFunctions.CompareVersions(VersionFirstFile,
  VersionSecondFile: TFileName): integer;
var
  iVersion1st, iVersion2nd: Int64;
  stl1st: TStringList;
  stl2nd: TStringList;
  i: Integer;
begin
  stl1st := TStringFunctions.Aparse(VersionFirstFile, '.');
  stl2nd := TStringFunctions.Aparse(VersionSecondFile, '.');

  for i := 0 to stl1st.Count - 1 do
   if Length(stl1st[i]) > Length(stl2nd[i]) then
    stl2nd[i] := TStringFunctions.PadL(stl2nd[i], Length(stl1st[i]), '0')
   else if Length(stl1st[i]) < Length(stl2nd[i]) then
    stl1st[i] := TStringFunctions.PadL(stl1st[i], Length(stl2nd[i]), '0');

  VersionFirstFile := stl1st.CommaText;
  VersionSecondFile := stl2nd.CommaText;

  // Convertendo versoes para inteiro
  iVersion1st := StrToInt64Def(StringReplace(VersionFirstFile, ',', '', [rfReplaceAll]), 0);
  iVersion2nd := StrToInt64Def(StringReplace(VersionSecondFile, ',', '', [rfReplaceAll]), 0);

  if iVersion1st < iVersion2nd then
   Result := -1
  else if iVersion1st > iVersion2nd then
   Result := 1
  else Result := 0;
end;


class function TFileFunctions.ContFiles(Dir, Mask: string): integer;
begin

end;

//******************************************************************************
// Funcao.....: Coparq
// Adaptacao..: 30/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TFileFunctions.Coparq(const Arquivos, CopiarPara: string): boolean;
var
  EncontraArq: TSearchRec;
  BuscaArq: integer;
  Arquivo, diretorio, destino: string;
  DeuCerto: boolean;
begin
  destino   := ifThen(TStringFunctions.LastChar(CopiarPara) <> '\', CopiarPara + '\', CopiarPara);
  diretorio := ExtractFileDir(arquivos);
  if TStringFunctions.isFull(diretorio) then
    diretorio := ifThen(TStringFunctions.LastChar(diretorio) <> '\', diretorio + '\', diretorio);
  BuscaArq := FindFirst(arquivos, faAnyFile, EncontraArq);
  DeuCerto  := false;

  if (BuscaArq = 0) and not MD(CopiarPara) then
  begin
    Result := false;
    Exit;
  end;

  while BuscaArq = 0 do
  begin
    if (EncontraArq.Name <> '.') and (EncontraArq.Name <> '..') then
    begin
      arquivo := diretorio + EncontraArq.Name;
      if not FileExists(arquivo) and DirectoryExists(arquivo) then
        DeuCerto := true
      else
        DeuCerto := CopyFile(Pchar(arquivo), Pchar(destino + ExtractFileName(arquivo)), false);
    end
    else
      DeuCerto := true;
    BuscaArq := ifThen(DeuCerto, FindNext(EncontraArq), 1);
  end;
  Result := DeuCerto;

  SysUtils.FindClose(EncontraArq);
end;

class function TFileFunctions.CountFiles(const Dir, FileMask: string): integer;
begin
  Result := Self.CountFiles(IncludeTrailingPathDelimiter(Dir) + FileMask);
end;

//******************************************************************************
// Funcao.....: MD
// Adaptacao..: 30/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TFileFunctions.MD(const Path: string): boolean;
var
  ListaDir: TStringList;
  i: integer;
  Dirs: string;
  Errou: boolean;
begin
  if TStringFunctions.isEmpty(Path) then
  begin
    Result := false;
    Exit;
  end;
  Dirs     := '';
  ListaDir := nil;
  ListaDir := TStringFunctions.Aparse(Path, '\');
  Errou    := false;
  for i := 0 to ListaDir.Count - 1 do
  begin
    Dirs := Dirs + ListaDir[i] + '\';
    if not DirectoryExists(TStringFunctions.CopyNoLast(Dirs)) then
      if not CreateDir(TStringFunctions.CopyNoLast(Dirs)) then
        Errou := true;
  end;
  ListaDir.Free;
  Result := not Errou;
end;

class function TFileFunctions.MD5(const FileName: string): string;
var
 idmd5 : TIdHashMessageDigest5;
 objFileStream : TFileStream;
begin
  if FileExists(FileName) then
   begin
    idmd5 := TIdHashMessageDigest5.Create;
    objFileStream := TFileStream.Create(fileName, fmOpenRead OR fmShareDenyWrite) ;
    try
     result := idmd5.HashStreamAsHex(objFileStream);
    finally
     objFileStream.Free;
     idmd5.Free;
    end;
   end
  else Result := '';
end;

//******************************************************************************
// Funcao.....: ParamExists
// Criação....: 30/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TFileFunctions.ParamExists(sParam: string): boolean;
var iPrm: integer;
begin
 result := False;

 for iPrm := 1 to ParamCount do
  if AnsiUpperCase(ParamStr(iPrm)) = AnsiUpperCase(sParam) then
   begin
    result := True;
    break;
   end;
end;

class function TFileFunctions.RunHide(const sFileName: string): boolean;
begin
  Result := WinExec(PAnsiChar(AnsiString('command.com /c ' + sFileName)), sw_Hide) > 31;
end;

class function TFileFunctions.RunNormal(const sFileName: string): boolean;
begin
  Result := WinExec(PAnsiChar(AnsiString(sFileName)),sw_ShowNormal) > 31;
end;

//******************************************************************************
// Funcao.....: WinDir
// Adaptacao..: 30/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TFileFunctions.WinDir: string;
var
  aux: array[0..MAX_PATH] of char;
begin
  GetWindowsDirectory(aux, MAX_PATH);
  Result := strPas(aux);
  if TStringFunctions.LastChar(Result) = '\' then Result := TStringFunctions.CopyNoLast(Result);
end;


//******************************************************************************
// Função......: GetFileSize
// Criação.....: 27/12/2007
// Técnico.....: José Mário
// Descrição...: Retorna o tamanho do arquivo bytes
//******************************************************************************
class function TFileFunctions.GetFileSize(sFileName: string): Int64;
begin
 with TFileStream.Create(sFileName, fmOpenRead) do
  try
   Result := Size;
  finally
   Free;
  end;
end;

//******************************************************************************
// Função......: GetFileVersion
// Criação.....: 17/09/2008
// Técnico.....: Weverton Gomes
// Descrição...: Retorna a versão de um arquivo
//******************************************************************************
class function TFileFunctions.GetFileVersion(sFileName: string): TFileVersion;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
  sVersion: string;
  MajorVersion, MinorVersion, Release, Build: integer;
begin
  MajorVersion := 0;
  MinorVersion := 0;
  Release      := 0;
  Build        := 0;

  if FileExists(sFileName) then
   begin
    try
     VerInfoSize := GetFileVersionInfoSize(PChar(sFileName), Dummy);
     GetMem(VerInfo, VerInfoSize);
     GetFileVersionInfo(PChar(sFileName), 0, VerInfoSize, VerInfo);
     VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
     with VerValue^ do
      begin
       MajorVersion := dwFileVersionMS shr 16;
       MinorVersion := dwFileVersionMS and $FFFF;
       Release      := dwFileVersionLS shr 16;
       Build        := dwFileVersionLS and $FFFF;
      end;
     FreeMem(VerInfo, VerInfoSize);
    except
    end;
   end;

  Result.MajorVersion := MajorVersion;
  Result.MinorVersion := MinorVersion;
  Result.Release      := Release;
  Result.Build        := Build;
end;

//******************************************************************************
// Função......: GetFileDate
// Criação.....: 14/08/2020
// Técnico.....: Flavio Ribeiro
// Descrição...: Retorna a data de um arquivo
//******************************************************************************
class function TFileFunctions.GetFileDate(sFileName: string): TDateTime;
var
  DataHoraFile: TDateTime;
begin
  DataHoraFile := 0;

  if FileExists(sFileName) then
   begin
    try
     FileAge(sFileName, DataHoraFile);
    except
    end;
   end;

  Result := DataHoraFile;
end;

//******************************************************************************
// Função......: GetFileDateToVersion
// Criação.....: 14/08/2020
// Técnico.....: Flavio Ribeiro
// Descrição...: Retorna a data de um arquivo em formato de versão
//******************************************************************************
class function TFileFunctions.GetFileDateToVersion(sFileName: string): String;
begin
  Result := FormatDateTime('yyyy.mm.dd.hh', GetFileDate(sFileName));
end;

//******************************************************************************
// Função......: GetShortPath
// Criação.....: 13/11/2007
// Técnico.....: José Mário
// Descrição...: Transforma caminhos longos de arquivo em curtos, colocando
// ............. reticencias no meio. Ex.: c:\diretorio\...\arquivo.txt
// Original....: http://www.greatis.com/delphicb/tips/lib/filesdirectories-getshortpath.html
//******************************************************************************
class function TFileFunctions.GetShortPath(Path: string; Count: Integer): string;

  procedure Slashes(var Str: string; var Num: Integer);
  var
    Position, Index: Integer;
  begin
    Index:=0;
    repeat
      Position:=Pos('\', Str);
      Delete(Str,1,Position);
      if Position<>0 then Inc(Index);
      if (Index=Num)and(Num<>0) then break;
    until Position=0;
    Num:=Index;
  end;

var
  Num, NewNum, P: Integer;
  Str: string;
begin
  Str:=Path;
  Num:=0;
  Slashes(Path, Num);
  while (Length(Str)>Count)and(Num>2) do
  begin
    NewNum:=Num div 2;
    Path:=Str;
    Slashes(Path, NewNum);
    P:=Pos(Path, Str);
    Delete(Str,P, Length(Path));
    NewNum:=2;
    Slashes(Path, NewNum);
    Str:=Str+'...\'+Path;
    Dec(Num);
  end;
  Result:=Str;
end;

{ TFileVersion }

function TFileVersion.ToString: string;
begin
  Result := Format('%d.%d.%d.%d', [Self.MajorVersion, Self.MinorVersion, Self.Release, Self.Build]);
end;

end.
