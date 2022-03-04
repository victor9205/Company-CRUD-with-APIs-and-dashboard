unit UStringFunctions;

interface

uses Classes;

type
  TStringFunctions = class
  private

  public
   class function Contains(const sText: string; const sPart: array of string;
     const bPartial: boolean = True): Boolean; overload;
   class function Contains(List: TStrings; const Item: string;
     const CaseInsensitive: boolean = True; const Partial: boolean = False;
     const CompleteWord: boolean = False): integer; overload;

   class function ItemIndex(List: TStrings; const Item: string;
     const CaseInsensitive: boolean = True; const Partial: boolean = False;
     const CompleteWord: boolean = False; const StartsWith: Boolean =  False): integer;

   class function Pos(SubStr, Str: string; const CaseInsensitive: boolean = True;
     const CompleteWord: boolean = False): Integer;
   class function Vazio(const Texto: string): Boolean; overload;
   class function Vazio: String; overload;
  published
   class function Aparse(const Text: String; Delimiter: char; const bTrim: Boolean = False; const iLimit: Integer = 0): TStringList;
   class function AStrScan(AArray: array of string; const Str: string;
     const CaseInsensitive: boolean = false): integer;
   class function ArrayToStr(const ArrayStr: array of string; const Delimiter: char = ','): string;
   class function CopyNoLast(const Text: string): string;
   class function CopyPosEnd(const Text: string; const StartChar: char): string;
   class function CopyPosStart(const Text: string; const EndChar: char): string;
   class function CopyStart(const Text: string; const FinalPos: integer): string;
   class function CountChars(const Text: string; const s: Char; CaseInsensitive: boolean = true): integer;
   class function Crypto(const Text: String): String;
   class function DeAparse(StringList: TStringList; Delimiter: char): string;
   class function Delete(var S: string; const Index, Count: Integer): string;
   class function EnsureEndsWith(const Str, EndStr: String): string;
   class function ExtractNotLetters(Text: string): string;
   class function ExtractNotNumbers(Text: string): string;
   class function ExtractDoubleNumber(Text: string): string;
   class function ExtractNumbers(Text: string): string;
   class function ExtractSymbols(Text: string): string;
   class function ExtractSymbols2(Text: string): string;
   class function ExtractSymbols3(Text: string): string;
   class function ExtractSymbols4(Text: string): string;
   class function IsAlpha(const c: Char): Boolean;
   class function IsEmpty(const Text: String; Trim: boolean = True): boolean;
   class function IsFull(const Text: String; Trim: boolean = True): boolean;
   class function IsLetter(const c: Char): Boolean;
   class function IsNumber(const c: string): Boolean;
   class function LastChar(const Text: string): char;
   class function NoMaskText(const Text: string): boolean;
   class function OnlyMask(const Text: string): boolean;
   class function OnlyChars(const Chars, Text: string): boolean;
   class function StringListToStr(const StringList: TStringList): string;
   class function StringListKeys(const StringList: TStringList): TStringList;
   class function SumDigits(const Number: string): Longint;
   class function Reverse(const Text: string): string;
   class function StrAtPositionInList(const Text: string; const Index: Integer;
     const Delimiter: Char = ','): string;
   class procedure StrToArray(StringList: TStringList; var ArrayStr: array of String);
   class function StrToChar(const Text: string): Char;
   class function UpperFirst(const Text: string): string;
   class function MD5(const Str: string): string;

   class function Right(const Text: string; const Quant: integer): string;
   class function StrZero(const Numero: Extended; const Quantidade: integer = 3; const Dec: integer = 0; Virgula : Boolean = True): string;
   class function ExtractAll(Texto: string; const Digito: Char; const CaseInsensitive: boolean = true): string;
   class function PadR(const Text: string; const Tam: integer; const Caracter: char = ' '): string;
   class function Replicate(const caracter: char; const vezes: integer): string;
   class function CopyEnd(const Texto: string; const PosicaoInicial: integer): string;
   class function PadL(const text: string; const tam: integer; const caracter: char = ' '): string;

   class function NoExtreme(Digito: char; Texto: string): string;
   class function FirstChar(const Texto: string): char;
   class function CopyNoFirst(const Texto: string): string;

   class function AllTrim(const Texto: string): string;
   class function LTrim(const Texto: string): string;
   class function RTrim(const Texto: string): string;

   class procedure SInc(var Texto: string; s: string);
   class function strCrash(Texto: string; Quant: integer): TStringList;
   class function CopyWithTrim(const Text: string; const StartPos, Length: integer): string;
   class function ReplaceDuplicateSpaces(const Text: string; const sInstance: string = ' '): string;
   class function CountWordInstances(sText: string; sWords: array of string): integer;
   class function StartsWith(const sText, sPart: string): Boolean;
   class function EndsWith(const sText, sPart: string): Boolean;
   class function SeExiste(const substring, em: string): boolean;

   class function Contains(const sText, sPart: string): Boolean; overload;

   class function OnlyNumbers(const sText: string): string;

   class function NoCharacterLeft(const sText: String; const sCaracter: String = '0'): String;

   class function Cheio(const sText: String): Boolean;

   class function NoCharacterSpecial(const sText: String; sCaracter: String = ' '): String;
   class function PutAccent(sText, WithCaracter, WithoutCaracter: String): String;
   class function ExtractAccent(sText: String): String;

   class function InList(const vValue: Variant; vList: array of Variant; blCasIns : Boolean = False ): boolean;
   class function strText(const s: string; const quantidade: integer; const esquerda: boolean = False; const TipCarc : char = ' '): string;
   class function PutMaskByType(const sTipoInscricao, sNumero: string): string;
   class function PutMask(const sNumero: string): string;
   class function PutMaskPIS(const sNumero: string): string;
   class function PutMaskProcesso(const sNumero: string): string;
   class function SpaceRight(Texto: string; quant: integer): string;
   class function SpaceLeft(Texto: string; quant: integer): string;
   class function Spaces(const Texto: string; const quantidade: integer): string;
   class function Extractor(SubString, De: string): string;
   class function InsertStrToPos(const Text, Substring: string; Pos: Integer; Sobrepoe: Boolean = True): String;

   class function DeleteEnter(const sText: string): String;
   class function StrTran(Texto: string; const Substring: string = ' '; const TrocarPor: string = ''): string;
   class function JustifyList(const AList: TStringList; const Quant: integer): TStringList;
   class function MoldaTexto(Texto: string; Quant: integer; const bJust: boolean = false): TStringList;
   class function PrepareWebString(const Text: string): string;
   class function ToPAnsiChar(const Text: string): PAnsiChar;

   class function IsVarEmpty(const Value: Variant; const RemoveMask: Boolean = False): Boolean;
   class function IsVarFull(const Value: Variant; const RemoveMask: Boolean = False): Boolean;
   class function CalculaDigitoCNPJ(NumeroDoCgc: string): String;
   class function NomeMes(mes: integer): string;

   class function LastPos(const Texto, substring: string): integer;
   class function ExtractTextFromTags(sText, sOpenTag, sCloseTag : String) : String;
   class function HTMLDecode(const AStr: String): String;
   class function WordChange(Texto, substring, trocarpor: string): string;
   class function NoRepeatChar(texto: string; caracter: char): string;
   class function StringsToStringList(const Strings: TStrings): TStringList;
   class function NoSignals(texto: string): string;
   class function NoSpaces(Texto: string): string;
   class function ContaFormatadaMascara(const sConta, sMask: String; bExbNivZer: Boolean = False): String;
  end;

const
  UFs:   array[1..28] of string  = ('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RN', 'RS', 'RJ', 'RO', 'RR', 'SC', 'SP', 'SE', 'MS', 'TO', 'DV');

implementation

uses
  SysUtils, Math, StrUtils, UDateTimeFunctions, Windows, Vcl.Forms,
  IdHashMessageDigest, Variants;// {$IFNDEF EXTRATORTGC} //,JvJCLUtils{$ENDIF};

{ TStringFunctions }

class function TStringFunctions.Aparse(const Text: String; Delimiter: char; const bTrim: Boolean; const iLimit: Integer): TStringList;
var
  i, limitAux: integer;
  s: String;
begin
  Result   := TStringList.Create;
  s        := '';
  limitAux := 1;

  for i := 1 to Length(Text) do
   if (Text[i] = Delimiter) and (limitAux <> iLimit) then
    begin
     Result.Add(ifThen(bTrim, Trim(s), s)); // José Mário, 21/08/2007
     s := '';
     limitAux := limitAux + 1;
    end
   else s := s + Text[i];

  if IsFull(s) then
   Result.Add(ifThen(bTrim, Trim(s), s));
end;

class function TStringFunctions.ArrayToStr(const ArrayStr: array of string;
  const Delimiter: char): string;
var
  i: integer;
begin
  Result := '';

  for i := Low(ArrayStr) to High(ArrayStr) do
   Result := Result + Delimiter + ArrayStr[i];

  Delete(Result, 1, 1);
end;

class function TStringFunctions.AStrScan(AArray: array of string;
  const Str: string; const CaseInsensitive: boolean): integer;
var
  i: integer;
  sMat, sEle : string;
begin
  sEle := IfThen(CaseInsensitive, UpperCase(Str), Str);
  Result := -1;
  for i := Low(AArray) to High(AArray) do
   begin
    sMat := IfThen(CaseInsensitive,UpperCase(AArray[i]),AArray[i]);
    if sMat = sEle then
     begin
      Result := i;
      Break;
     end;
   end;
end;

//******************************************************************************
// Funcao.....: CopyNoLast
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.CopyNoLast(const Text: string): string;
begin
  Result := IfThen(IsEmpty(Text), '', IfThen(Length(Text) > 1, CopyStart(Text, Length(Text) - 1), Text));
end;

//******************************************************************************
// Funcao.....: CopyStart
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.CopyStart(const Text: string;
  const FinalPos: integer): string;
begin
  Result := Copy(Text, 1, FinalPos);
end;

class function TStringFunctions.Crypto(const Text: String): String;
var
  i, c: integer;
  sKey, sCop: string;
begin
  Result := '';
  sKey   := Chr(3) + Chr(2) + Chr(4) + chr(7) + Chr(3);
  sCop   := sKey;

  for i := 1 to (Length(Text) mod 5) do
   begin
    sCop := Copy(sKey, 2, Length(sKey) - 1) + sKey[1];
    sKey := sCop;
   end;

  c := 1;
  for i := 1 to Length(Text) do
   begin
    Result := Result + Chr(Ord(Text[i]) xor Ord(sKey[c]));
    c := IfThen(c = 5, 1, c + 1);
   end;
end;

class function TStringFunctions.DeAparse(StringList: TStringList;
  Delimiter: char): String;
begin
  Result := '';

  if not Assigned(StringList) then
   Exit;

  StringList.Delimiter := Delimiter;
  Result               := StringList.DelimitedText;
end;

class function TStringFunctions.Delete(var S: string; const Index,
  Count: Integer): string;
begin
  Result := Copy(s, Index, Count);
  System.Delete(s, Index, Count);
end;

class function TStringFunctions.DeleteEnter(const sText: String): String;
var
 i: integer;
begin
  Result := sText;
  for i := 0 to length(Result)-1 do
   if (Result[i] = #10) or (Result[i] =  #13) then
    begin
     Delete(Result, i, 1);
     Delete(Result, i, 1);
    end;
end;

class function TStringFunctions.ExtractAccent(sText: String): String;
const
  WithAccent = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ¹²³ªº';
  WithoutAccent = 'aaeouaoaeioucuAAEOUAOAEIOUCU123AO';
var
  x: Integer;
begin;
  for x := 1 to Length(sText) do
   if System.Pos(sText[x], WithAccent) <> 0 then
    sText[x] := WithoutAccent[System.Pos(sText[x], WithAccent)];

  Result := sText;
end;

//******************************************************************************
// Funcao.....: ExtractAll
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.ExtractAll(Texto: string;
  const Digito: Char; const CaseInsensitive: boolean): string;
var
  i: integer;
begin
  for i := 1 to Length(Texto) do
    if caseinsensitive then
    begin
      if UpCase(Texto[i]) = UpCase(digito) then
        Delete(Texto, i, 1);
    end
    else
      if Texto[i] = digito then
        Delete(Texto, i, 1);
  Result := Texto;
end;

class function TStringFunctions.ExtractDoubleNumber(Text: string): string;
var
  i : Integer;
begin
  Result := '';

  // Retirando símbolos e letras, menos pontos e virgulas
  for i := 1 to Length(Text) do
   if IsNumber(Text[i]) or Contains(Text[i], [',', '.']) then
    Result := Result + Text[i];
end;

class function TStringFunctions.InList(const vValue: Variant;
  vList: array of Variant; blCasIns : Boolean): boolean;
var
 I : Integer;

begin
 Result := False;

 for I := Low( vList ) to High( vList ) do
  if blCasIns then
   Result := Result or ( AnsiUpperCase( vValue ) = AnsiUpperCase( vList[I] ) )
  else
   Result := Result or ( vValue = vList[I] );
end;

class function TStringFunctions.InsertStrToPos(const Text, Substring: string;
  Pos: Integer; Sobrepoe: Boolean = True): String;
begin
  if Sobrepoe then
   Result := Self.CopyStart(Text, Pos-1) + Substring + Self.CopyEnd(Text, Pos + Length(Substring))
  else
   Result := Self.CopyStart(Text, Pos-1) + Substring + Self.CopyEnd(Text, Pos);
end;

class function TStringFunctions.IsAlpha(const c: Char): Boolean;
begin
  Result := Self.IsLetter(c) or Self.IsNumber(c);
end;

class function TStringFunctions.IsEmpty(const Text: String;
  Trim: boolean): boolean;
begin
  if Trim then
   Result := SysUtils.Trim(Text) = ''
  else Result := Text = '';
end;

class function TStringFunctions.IsFull(const Text: String;
  Trim: boolean): boolean;
begin
  Result := not IsEmpty(Text, Trim);
end;
{
//******************************************************************************
// Funcao.....: Posit
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..: mover para uma classe mais adequada
//******************************************************************************
class function TStringFunctions.Posit(const Number: real): boolean;
begin
  Result := Number > 0;
end;
}
//******************************************************************************
// Funcao.....: PadR
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.PadR(const Text: string;
  const Tam: integer; const Caracter: char): string;
var
  t : integer;
begin
  t := Length(text);
  result := ifThen(t > tam, text, text + Replicate(caracter, tam - t));
end;

//******************************************************************************
// Funcao.....: Pos
// Adaptacao..: 22/08/2008
// Tecnico....: Weverton
// Descricao..:
//******************************************************************************
class function TStringFunctions.Pos(SubStr, Str: string; const CaseInsensitive,
  CompleteWord: boolean): Integer;
var
  iPosLeft: Integer;
  iPosRight: Integer;
  iSize: Integer;
  bComplete: boolean;
begin
  iSize := 0;

  if CaseInsensitive then
   begin
    SubStr := AnsiUpperCase(SubStr);
    Str    := AnsiUpperCase(Str);
   end;

  repeat
   iPosLeft := System.Pos(SubStr, Str);

   if CompleteWord then
    begin
     iPosRight := iPosLeft + Length(SubStr);

     bComplete  := ((iPosLeft = 1) or not Self.IsAlpha(Str[iPosLeft - 1]) and
                   ((iPosRight = Length(SubStr)) or not Self.IsAlpha(Str[iPosRight])));

     if bComplete then
      Break
     else
      begin
       System.Delete(Str, iPosLeft, Length(SubStr));
       // Armazenando tamanho do texto deletado para somar no resulta final
       // para obter a real posição da palavra
       iSize := iSize + Length(SubStr);
      end;
    end;
  until iPosLeft = 0;

  if iPosLeft > 0 then
   Result := iPosLeft + iSize
  else Result := 0;
end;

class function TStringFunctions.PrepareWebString(const Text: string): string;
begin
  Result := StringReplace(Text, ' ', '+', [rfReplaceAll])
end;

//******************************************************************************
// Funcao.....: Right
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.Right(const Text: string;
  const Quant: integer): string;
var
  i, tamanho, q: integer;
begin
  tamanho := Length(Text);
  q       := ifThen(Quant > tamanho, tamanho, Quant);
  Result  := '';

  for i := (tamanho - q) + 1 to tamanho do
    Result := Result + Text[i];
end;

//******************************************************************************
// Funcao.....: StrZero
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.StrZero(const Numero: Extended;
  const Quantidade, Dec: integer; Virgula: Boolean): string;
var
  numstr: string;
  r: real;
begin
  numstr := floattostr(numero);
  r      := numero - Int(numero);

  if (dec > 0) or (r <> 0) then
    numstr := floattostr(int(abs(numero))) + ifThen(Virgula, FormatSettings.DecimalSeparator, '') +
              ExtractAll(PadR(CopyEnd(FloatToStr(RoundTo(r,dec*-1)), 3), dec, '0'), FormatSettings.DecimalSeparator, true);

  Result := ifThen(Length(numstr) >= quantidade        ,
               numstr                              ,
            ifThen(numero < 0                          ,
               '-' + PadL(numstr, quantidade-1,'0'),
               PadL(numstr, quantidade, '0')     ));
end;

//******************************************************************************
// Funcao.....: Replicate
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.Replicate(const caracter: char;
  const vezes: integer): string;
var
  i: integer;
begin
  Result := '';
  for i := 1 to vezes do
    Result := Result + caracter;
end;

//******************************************************************************
// Funcao.....: CopyEnd
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.CopyEnd(const Texto: string;
  const PosicaoInicial: integer): string;
begin
  Result := '';
  if PosicaoInicial <= Length(Texto) then
    Result := Copy(Texto, PosicaoInicial, Length(Texto));
end;

//******************************************************************************
// Funcao.....: PadL
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.PadL(const text: string;
  const tam: integer; const caracter: char): string;
var
  t : integer;
begin
  t := Length(text);
  result := ifThen(t > tam, text, Replicate(caracter, tam - t) + text);
end;

//******************************************************************************
// Funcao.....: LastChar
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.LastChar(const Text: string): char;
begin
  if Text = '' then
   Result := ' '
  else Result := Text[Length(Text)];
end;

class function TStringFunctions.LastPos(const Texto,
  substring: string): integer;
var
  i: integer;
begin
  Result := 0;
  for i := 1 to Length(Texto) do
    if UpperCase(Copy(Texto, i, Length(substring))) = UpperCase(substring) then
      Result := i;
end;

//******************************************************************************
// Funcao.....: NoExtreme
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.NoExtreme(Digito: char;
  Texto: string): string;
begin
  if FirstChar(Texto) = Digito then Texto := CopyNoFirst(Texto);
  if LastChar(Texto) = Digito then Texto := CopyNoLast(Texto);
  Result := Texto;
end;

class function TStringFunctions.NoMaskText(const Text: string): boolean;
begin
  Result := (Text <> '  /  /    '   ) and (Text <> '  :  ') and (Text <> '' ) and
            (Trim(Text) <> ''    )    and (Text <> '  .   .   /    -  '     ) and
            (Text <> '           - ') and (Text <> '   .   .   -  '         ) and
            (Text <> '  /  /  '     ) and (Text <> '    /  /  '             ) and
            (Text <> '  -  -  '     ) and (Text <> '  -  -    '             ) and
            (Text <> '    -  -  '   ) and (Text <> '  :  :  '               ) and
            (Text <> '  .   -   '   ) and (Text <> '    -    '              ) and
            (Text <> '   .     .  . ')and
            (Trim(Text) <> '.'      ) and (Trim(Text) <> ','                ) and
            (Text <> '  /    '      ) and (Text <> '  /  '                  ) and
            (Trim(Text) <> '/'      ) and (Trim(Text) <> '-'                ) and
            (Text <> '  ' + FormatSettings.DateSeparator + '  ' + FormatSettings.DateSeparator + '    '    ) and
            (Text <> '  ::  '       ) and (Text <> '(  )    -    ')           and
            (Text <> '   .   .   /   -  ');
end;

class function TStringFunctions.NomeMes(mes: integer): string;
begin
 Case mes Of
  01 : result:= 'janeiro';
  02 : result:= 'fevereiro';
  03 : result:= 'março';
  04 : result:= 'abril';
  05 : result:= 'maio';
  06 : result:= 'junho';
  07 : result:= 'julho';
  08 : result:= 'agosto';
  09 : result:= 'setembro';
  10 : result:= 'outubro';
  11 : result:= 'novembro';
  12 : result:= 'dezembro';
  end;
end;

//******************************************************************************
// Funcao.....: FirstChar
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.FirstChar(const Texto: string): char;
begin
  Result := ifThen(Texto = '', ' ', Texto[1])[1];
end;

//******************************************************************************
// Funcao.....: CopyNoFirst
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.CopyNoFirst(const Texto: string): string;
begin
  Result := ifThen(isEmpty(Texto), '', ifThen(Length(Texto) > 1, CopyEnd(Texto, 2), Texto));
end;

//******************************************************************************
// Funcao.....: SumDigits
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..: mover para uma classe mais adequada
//******************************************************************************
class function TStringFunctions.SumDigits(const Number: string): Longint;
var
  s: string;
  i: integer;
begin
  Result := 0;
  s      := ExtractNotNumbers(Trim(Number));

  for i := 1 to Length(s) do
   if IsNumber(s[i]) then
    Inc(Result, StrToInt(s[i]));
end;

class function TStringFunctions.ToPAnsiChar(const Text: string): PAnsiChar;
var
  cResult : array[0..255] of AnsiChar;
begin
  StrPCopy(cResult, Text);
  Result := cResult;
end;

class function TStringFunctions.UpperFirst(const Text: string): string;
begin
  // Verificando se a string não está vazia
  if Self.IsFull(Text) then
   begin
    // Obtendo o texto
    Result := Text;
    // Apagando a primeira letra
    Delete(Result, 1, 1);
    // Colocando a primeira letra como maiúscula
    Result := UpperCase(Text[1]) + Result;
   end
  else Result := '';
end;

class function TStringFunctions.Vazio: String;
begin
  Result := '';
end;

class function TStringFunctions.Vazio(const Texto: string): Boolean;
begin
  Result := Texto = '';
end;

//******************************************************************************
// Funcao.....: ExtractNotNumbers
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.ExtractNotNumbers(Text: string): string;
var
  i: integer;
begin
  i := 1;

  while i <= Length(Text) do
   begin
    if not Self.IsNumber(Text[i]) then
     begin
      Delete(Text, i, 1);
      i := 0;
     end;
    Inc(i);
   end;

  Result := IfThen(TStringFunctions.IsFull(Text), Text);
end;

//******************************************************************************
// Funcao.....: ExtractNumbers
// Adaptacao..: 07/07/2010
// Tecnico....: Marcos Skowronski
// Descricao..: extrair o que for numerico deixando somente alta-numerico
//******************************************************************************
class function TStringFunctions.ExtractNumbers(Text: string): string;
var
  i: integer;
begin
  i := 1;

  while i <= Length(Text) do
   begin
    if Self.IsNumber(Text[i]) then
     begin
      Delete(Text, i, 1);
      i := 0;
     end;
    Inc(i);
   end;

  Result := IfThen(TStringFunctions.IsFull(Text), Text);
end;

class function TStringFunctions.Extractor(SubString, De: string): string;
var
  i: integer;
  Texto: string;
begin
  Texto := '';

  if (not SeExiste(SubString, De)) or Vazio(SubString) then
   Result := De
  else
   begin
    for i := 1 to Length(De) do
     while UpperCase(Copy(De, i, Length(SubString))) = UpperCase(SubString) do
      Delete(De, i, Length(SubString));
    Result := De;
   end;
end;

//******************************************************************************
// Funcao.....: AllTrim
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.AllTrim(const Texto: string): string;
begin
  Result := Ltrim(Rtrim(Texto));
end;

//******************************************************************************
// Funcao.....: IsNumber
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.IsNumber(const c: string): boolean;
var
 iChr: integer;
begin
 Result := True;

 for iChr := 1 to length(c) do
  if not (c[iChr] in ['0'..'9']) then
   begin
    Result := False;
    Break;
   end;
end;

class function TStringFunctions.IsVarEmpty(const Value: Variant; const RemoveMask: Boolean): Boolean;
begin
  if RemoveMask then
   Result := IsEmpty(ExtractNotNumbers(VarToStr(Value)))
  else Result := IsEmpty(VarToStr(Value));
end;

class function TStringFunctions.IsVarFull(const Value: Variant; const RemoveMask: Boolean): Boolean;
begin
  if RemoveMask then
   Result := IsFull(ExtractNotNumbers(VarToStr(Value)))
  else Result := IsFull(VarToStr(Value));
end;

class function TStringFunctions.ItemIndex(List: TStrings; const Item: string;
  const CaseInsensitive, Partial, CompleteWord, StartsWith: boolean): integer;
var
  i: Integer;
  Str1, Str2, StrBkp: string;
  bSame, bPartial: Boolean;
  iPosLeft: Integer;
  iPosRight: Integer;
begin
  Result   := -1;
  bPartial := False;
  Str2     := IfThen(CaseInsensitive, LowerCase(Item), Item);

  // Fazendo backup do texto
  StrBkp := Str2;
  for i := 0 to List.Count - 1 do
   begin
    Str1 := IfThen(CaseInsensitive, LowerCase(List[i]), List[i]);

    bSame := SameText(Str1, Str2);

    if not bSame then
     begin
      repeat
       iPosLeft := System.Pos(Str2, Str1);

       if StartsWith and (iPosLeft <> 1) then Break;
       
       bPartial := Partial and (iPosLeft > 0);

       if bPartial and CompleteWord then
        begin
         iPosRight := iPosLeft + Length(Str1);

         bPartial  := bPartial and ((iPosLeft = 1) or not Self.IsAlpha(Str2[iPosLeft - 1]) and
                                    ((iPosRight = Length(Str1)) or not Self.IsAlpha(Str2[iPosRight])));

         if bPartial then
          Break
         else System.Delete(Str2, iPosLeft, Length(Str1));
        end
       else Break;
      until iPosLeft = 0;
     end;

    if bSame or bPartial then
     begin
      Result := i;
      Break;
     end;

    // Restaurando backup por causa da deleção que pode ter ocorrido
    Str2 := StrBkp;
   end;
end;

class function TStringFunctions.JustifyList(const AList: TStringList;
  const Quant: integer): TStringList;
var
  i, p: integer;
  s: string;
begin
  Result := AList;
  try
   for i := 0 to Result.Count - 1 do
    begin
     Result[i] := AllTrim(Result[i]);
     p := Pos(' ', Result[i]);
     while (Length(Result[i]) < Quant) and (p > 0) do
      begin
       s := Result[i];
       Insert(' ', s, p);
       Result[i] := s;
       // varre string até achar primeiro caracter
       while (p in [1..Length(Result[i])]) and (Result[i][p] = ' ') do
        p := p + 1;
       // varre string até achar primeiro espaço
       while (p in [1..Length(Result[i])]) and (Result[i][p] <> ' ') do
        p := p + 1;
       // se chegou no final preenchendo um espaço por vez, volta ao início da string
       if (p >= Length(Result[i])) and (Length(Result[i]) < Quant) then
        p := 1;
       // Ao terminar, verifica se há espaços em branco no início ou no fim da string
       if (Length(Result[i]) >= Quant) and ((FirstChar(Result[i]) = ' ') or (LastChar(Result[i]) = ' ')) then
        begin
         Result[i] := AllTrim(Result[i]);
         p := Pos(' ', Result[i]);
        end;
      end;
    end;

   Result[Result.Count - 1] := StringReplace(Result[Result.Count - 1], '  ', ' ', [rfReplaceAll]);
  except
  end;
end;

{
//******************************************************************************
// Funcao.....: PosNumber
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.PosNumber(const Texto: string;
  const posicao: integer): boolean;
begin
  Result := false;
    if posicao > Length(Texto) then Exit;
  Result := Texto[posicao] in ['0'..'9'];
end;
}
//******************************************************************************
// Funcao.....: LTrim
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.LTrim(const Texto: string): string;
var
  i: integer;
begin
  Result := Texto;
  for i := 1 to Length(Texto) do
  begin
    if Texto[i] <> ' ' then Break;
    Delete(Result, 1, 1);
  end;
end;

class function TStringFunctions.MD5(const Str: string): string;
var
  objHash : TIdHashMessageDigest5;
begin
  objHash := TIdHashMessageDigest5.Create;
  try
   Result := objHash.HashStringAsHex(Str);
  finally
   objHash.Free;
  end;
end;

class function TStringFunctions.MoldaTexto(Texto: string; Quant: integer;
  const bJust: boolean): TStringList;
var
  ponteiro, posicao, tamanho, elemento: integer;
  pedaco: string;
begin
  Result := TStringList.Create;

  tamanho := Length(Texto);
  ponteiro := 1;
  posicao := Quant;

  while ponteiro <= tamanho do
   begin
    if (ponteiro = posicao) or (tamanho < posicao) then
     begin
      if ((tamanho > posicao) and (Copy(Texto, ponteiro, 1) <> ' ') and (Copy(Texto, ponteiro + 1, 1) <> ' ')) then
       for elemento := posicao downto 1 do
         if Copy(Texto, elemento, 1) = ' ' then
          begin
           posicao := (elemento - 1);
           Break;
          end;

      pedaco := Copy(Texto, 1, posicao);

      Result.Add(pedaco);

      if Copy(Texto, posicao + 1, 1) = ' ' then
       posicao := posicao + 1;

      Delete(Texto, 1, posicao);

      tamanho  := Length(Texto);
      ponteiro := 0;
      posicao  := Quant;
     end;

    Inc(ponteiro);
   end;

  if bJust then
   Result := JustifyList(Result, Quant);
end;

//******************************************************************************
// Funcao.....: RTrim
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.RTrim(const Texto: string): string;
var
  i: integer;
begin
  Result := Texto;
  for i := Length(Texto) downto 1 do
  begin
    if Texto[i] <> ' ' then Break;
    Delete(Result, i, 1);
  end;
end;

class function TStringFunctions.Reverse(const Text: string): string;
var
  i, j: integer;
begin
  Result := Text;
  j      := 1;

  for i := Length(Text) downto 1 do
   begin
    Result[j] := Text[i];
    Inc(j);
   end;
end;
{

//******************************************************************************
// Funcao.....: EmptyDir
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.EmptyDir(const Dir: string): boolean;
var
  s: string;
begin
  s := ifThen(LastChar(Dir) = '\', Dir, Dir + '\');
  Result := IsDir(Dir) and (ContFiles(Dir, '*.*') = 0);
end;
}
//******************************************************************************
// Funcao.....: SeExiste
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.SeExiste(const substring, em: string): boolean;
var
  i: integer;
  s1, s2: string;
begin
  Result := false;
  s1 := UpperCase(substring);
  s2 := UpperCase(em);
  for i := 1 to Length(s2) do
    if Copy(s2, i, Length(s1)) = s1 then
    begin
      Result := true;
      Break;
    end;
end;
{

//******************************************************************************
// Funcao.....: IsDir
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.IsDir(const Dir: string): boolean;
begin
  Result := DirectoryExists(Dir);
end;
}
//******************************************************************************
// Funcao.....: SInc
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class procedure TStringFunctions.SInc(var Texto: string; s: string);
begin
  Texto := Texto + s;
end;

//******************************************************************************
// Funcao.....: CopyPosStart
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.CopyPosStart(const Text: string;
  const EndChar: char): string;
begin
  Result := Copy(Text, 1, System.Pos(EndChar, Text) - 1);
end;

//******************************************************************************
// Funcao.....: CopyPosEnd
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.CopyPosEnd(const Text: string;
  const StartChar: char): string;
begin
  Result := Copy(Text, System.Pos(StartChar, Text) + 1, Length(Text));;
end;

//******************************************************************************
// Funcao.....: strCrash
// Adaptacao..: 30/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TStringFunctions.strCrash(Texto: string;
  Quant: integer): TStringList;
var
  i, tamanho: integer;
  pedaco: string;
begin
  Result := TStringList.Create;

  tamanho := Length(Texto);
  i := 1;
  while i <= tamanho do
  begin
    if (i = Quant) or (tamanho < Quant) then
    begin
      pedaco := Copy(Texto, 1, Quant);
      Result.Add(pedaco);
      Delete(Texto, 1, Quant);
      tamanho := Length(Texto);
      i := 0;
    end;
    Inc(i);
  end;
end;

//{$IFNDEF EXTRATORTGC}
//class function TStringFunctions.strCrashDelimitador(Texto,
//  delimitador: String): TStringList;
//
//var
// pedaco: string;
// sAux: String;
//begin
//  Result := TStringList.Create;
//
//  sAux := Copy(Texto,  1, Length(Texto));
//  Result := TStringList.Create;
//  if AnsiContainsStr(sAux, delimitador) then
//   begin
//    while (sAux <> '') do
//     begin
//       pedaco := ExtractDelimited(1, sAux, [delimitador[1]]);
//       Result.Add(pedaco);
//       sAux := Copy(sAux, Length(pedaco) + 2, Length(sAux));
//     end;
//   end
//   else
//    Result.Add(Texto);
//end;
//{$ENDIF}

class function TStringFunctions.StrAtPositionInList(const Text: string;
  const Index: Integer; const Delimiter: Char): string;
var
  c: integer;
begin
  Result := Text;
  c      := 0;

  while (c < Index) and (System.Pos(Delimiter, Result) > 0) do
   begin
    Delete(Result, 1, System.Pos(Delimiter, Result));
    Inc(c);
   end;

  c := System.Pos(Delimiter, Result);
  c := IfThen(c = 0, Length(Result), c - 1);

  Result := Copy(Result, 1, c);
end;

class function TStringFunctions.StringListKeys(
  const StringList: TStringList): TStringList;
var
  i: Integer;
  sKey: string;
begin
  Result := TStringList.Create;

  for i := 0 to StringList.Count - 1 do
   begin
    sKey := StringList[i];

    if System.Pos('=', sKey) > 0 then
     sKey := System.Copy(sKey, 1, System.Pos('=', sKey) - 1);

    if Self.IsFull(sKey) then
     Result.Add(sKey);
   end;
end;

class function TStringFunctions.StringListToStr(
  const StringList: TStringList): string;
var
  i: Integer;
begin
  Result := '';

  for i := 0 to StringList.Count - 1 do
   if i = 0 then
    Result := StringList[i]
   else Result := Format('%s %s', [Result, StringList[i]]);
end;

class procedure TStringFunctions.StrToArray(StringList: TStringList;
  var ArrayStr: array of String);
var
  i: Integer;
begin
  for i := 0 to StringList.Count - 1 do
   ArrayStr[i] := StringList[i];
end;

class function TStringFunctions.StrToChar(const Text: string): Char;
begin
  if Self.IsEmpty(Text) then
   Result := ' '
  else Result := Text[1];
end;

class function TStringFunctions.StrTran(Texto: string; const Substring,
  TrocarPor: string): string;
begin
  if Substring = TrocarPor then
   begin
    Result := Texto;
    Exit;
   end;

  Result := StringReplace(Texto, Substring, TrocarPor, [rfReplaceAll, rfIgnoreCase]);
end;

class function TStringFunctions.ExtractNotLetters(Text: string): string;
var
  i : Integer;
begin
  Result := '';

  for i := 1 to Length(Text) do
   if IsLetter(Text[i]) then
    Result := Result + Text[i];
end;

class function TStringFunctions.IsLetter(const c: Char): Boolean;
begin
  Result := c in ['a'..'z', 'A'..'Z'];
end;

class function TStringFunctions.ExtractSymbols(Text: string): string;
var
  i : Integer;
begin
  Result := '';

  // Retirando símbolos
  for i := 1 to Length(Text) do
   if IsLetter(Text[i]) or IsNumber(Text[i]) then
    Result := Result + Text[i];
end;

class function TStringFunctions.ExtractSymbols2(Text: string): string;
var
  i : Integer;
begin
  Result := '';

  // Retirando símbolos, menos espaco em branco
  for i := 1 to Length(Text) do
   if IsLetter(Text[i]) or IsNumber(Text[i]) or (Text[i] = ' ') then
    Result := Result + Text[i];
end;

class function TStringFunctions.ExtractSymbols3(Text: string): string;
var
  i : Integer;
begin
  Result := '';

  // Retirando símbolos, menos espaco em branco, pontos e virgulas
  for i := 1 to Length(Text) do
   if IsLetter(Text[i]) or IsNumber(Text[i]) or (Text[i] = ' ') or (Text[i] = ',') or (Text[i] = '.') then
    Result := Result + Text[i];
end;

class function TStringFunctions.ExtractSymbols4(Text: string): string;
var
  i : Integer;
begin
  Result := '';

  // Retirando símbolos, menos espaco em branco, pontos, virgulas, hifen, dois pontos, barra, asterisco e cerquilha
  for i := 1 to Length(Text) do
   if IsLetter(Text[i]) or IsNumber(Text[i]) or (Text[i] = ' ') or (Text[i] = ',') or (Text[i] = '.') or
      (Text[i] = '-') or (Text[i] = ':') or (Text[i] = '/') or (Text[i] = '*') or (Text[i] = '%') or (Text[i] = '#') then

    Result := Result + Text[i];
end;

class function TStringFunctions.CopyWithTrim(const Text: string; const StartPos, Length: integer): string;
begin
 Result := ReplaceDuplicateSpaces(Trim(Copy(Text, StartPos, Length)));
end;

class function TStringFunctions.ReplaceDuplicateSpaces(const Text, sInstance: string): string;
begin
 Result := Text;

 while System.Pos(sInstance+sInstance, Result) > 0 do
  Result := StringReplace(Result, sInstance+sInstance, sInstance, [rfReplaceAll]);
end;

class function TStringFunctions.CountChars(const Text: string; const s: Char;
  CaseInsensitive: boolean): integer;
var
  i: integer;
  a, c: string;
begin
  Result := 0;
  c := IfThen(CaseInsensitive, UpperCase(s), s);
  a := IfThen(CaseInsensitive, UpperCase(Text), Text);

  for i := 1 to Length(a) do
   if a[i] = c then Inc(Result);
end;

class function TStringFunctions.CountWordInstances(sText: string;
  sWords: array of string): integer;
var
 sTextTemp: string;
 iWords: integer;
begin
 result := 0;

 for iWords := low(sWords) to high(sWords) do
  begin
   sTextTemp := sText;

   while System.Pos(sWords[iWords], sTextTemp) >= 1 do
    begin
     inc(result);
     delete(sTextTemp, 1, System.Pos(sWords[iWords], sTextTemp) + length(sWords[iWords]) - 1);
    end;
  end;
end;

//******************************************************************************
// Função.....: EndsWith
// Criação....: 09/08/2007
// Técnico....: José Mário
// Descrição..: Retorna valor booleano respectivo a se a string passada termina
// ............ com o conteúdo da string do segundo parâmetro
//******************************************************************************
class function TStringFunctions.EndsWith(const sText,
  sPart: string): Boolean;
begin
 Result := Self.IsFull(sText) and (System.Pos(sPart, sText) = Length(sText) - Length(sPart) + 1);
end;

class function TStringFunctions.EnsureEndsWith(const Str,
  EndStr: String): string;
begin
  Result := Str;

  if not EndsWith(Result, EndStr) then
   Result := Result + EndStr;
end;

//******************************************************************************
// Função.....: StartsWith
// Criação....: 09/08/2007
// Técnico....: José Mário
// Descrição..: Retorna valor booleano respectivo a se a string passada inicia
// ............ com o conteúdo da string do segundo parâmetro
//******************************************************************************
class function TStringFunctions.StartsWith(const sText,
  sPart: string): Boolean;
begin
 Result := System.Pos(sPart, sText) = 1;
end;

//******************************************************************************
// Função......: Contains
// Criação.....: 20/09/2007
// Técnico.....: José Mário
// Tarefa......:
// URL.........:
// Descrição...: Verifica se a primeira string contém a segunda
//******************************************************************************
class function TStringFunctions.Contains(const sText,
  sPart: string): Boolean;
begin
 Result := System.Pos(sPart, sText) > 0;
end;

// Esta função não deve ser alterada de forma alguma. Ela é específica para o calculo da folha de pagamento.
// Qualquer alteração deverá ser comunicada ao Luiz ou Weverton.
class function TStringFunctions.Contains(List: TStrings; const Item: string;
  const CaseInsensitive, Partial, CompleteWord: boolean): integer;
var
  i: Integer;
  Str1, Str2, StrBkp: string;
  bSame, bPartial: Boolean;
  iPosLeft: Integer;
  iPosRight: Integer;
begin
  Result := -1;
  Str2   := IfThen(CaseInsensitive, LowerCase(Item), Item);
  // Fazendo backup do texto
  StrBkp := Str2;
  for i := 0 to List.Count - 1 do
   begin
    Str1 := IfThen(CaseInsensitive, LowerCase(List[i]), List[i]);

    bSame := SameText(Str1, Str2);

    if not bSame then
     begin
      repeat
       iPosLeft := System.Pos(Str1, Str2);

       bPartial := Partial and (iPosLeft > 0);

       if bPartial and CompleteWord then
        begin
         iPosRight := iPosLeft + Length(Str1);

         bPartial  := bPartial and ((iPosLeft = 1) or not Self.IsAlpha(Str2[iPosLeft - 1]) and
                                    ((iPosRight = Length(Str1)) or not Self.IsAlpha(Str2[iPosRight])));

         if bPartial then
          Break
         else System.Delete(Str2, iPosLeft, Length(Str1));
        end
       else Break;
      until iPosLeft = 0;
     end;

    if bSame or bPartial then
     begin
      Result := i;
      Break;
     end;

    // Restaurando backup por causa da deleção que pode ter ocorrido
    Str2 := StrBkp;
   end;
end;

//******************************************************************************
// Função......: Contains
// Criação.....: 28/09/2007
// Técnico.....: José Espedito
// Tarefa......:
// URL.........:
// Descrição...: Verifica se a primeira string contém a segunda dentro de um
// ............. array
//******************************************************************************

class function TStringFunctions.Contains(const sText: string;
  const sPart: array of string; const bPartial: boolean): Boolean;
var
  i: Integer;
begin
  for i := Low(sPart) to High(sPart) do
   begin
    if bPartial then
     Result := Contains(sText, sPart[i])
    else Result := SameText(sText, sPart[i]);
    
    if Result then
     Break;
   end;
end;

//******************************************************************************
// Função......: OnlyNumbers
// Criação.....: 08/10/2007
// Técnico.....: José Mário
// Descrição...: Retorna somente os números da string passada
//******************************************************************************
class function TStringFunctions.OnlyChars(const Chars, Text: string): boolean;
var
  i: integer;
begin
  Result := false;
  if IsFull(Chars) and IsEmpty(Text) then Exit;
  for i := 1 to Length(Text) do
    if System.Pos(Text[i], Chars) = 0 then Exit;
  Result := true;
end;

class function TStringFunctions.OnlyMask(const Text: string): boolean;
begin
  Result := not Self.NoMaskText(Text);
end;

class function TStringFunctions.OnlyNumbers(const sText: string): string;
var iChr: integer;
begin
 Result := '';

 for iChr := 1 to length(sText) do
  if IsNumber(sText[iChr]) then
   Result := Result + sText[iChr];
end;

class function TStringFunctions.NoCharacterLeft(const sText: String;
  const sCaracter: String = '0'): String;
begin
 Result := sText;

 while ( copy(Result, 1,1) = sCaracter) do
  Delete(Result, 1, 1);
end;

//******************************************************************************
// Função......: cheio
// Criação.....: 17/10/2007
// Técnico.....: José Espedito
// Descrição...: Verifica se determinada String é cheia
//******************************************************************************
class function TStringFunctions.Cheio(const sText: String): Boolean;
begin
 Result := (Length(sText) > 0);
end;

//******************************************************************************
// Função......: NoCaracterSpecial
// Criação.....: 06/11/2007
// Técnico.....: José Espedito
// Descrição...: Retira todo caractere especial que for encontrado no parâmetro
// ............. passando em lugar, sCaracter
//******************************************************************************
class function TStringFunctions.NoCharacterSpecial(
  const sText: String; sCaracter: String = ' '): String;
var
 i: integer;
begin
  Result := sText;
  for i := 0 to length(Result)-1 do
   if (Ord(Result[i]) > 126) and not (Result[i] in ['0', 'o', 'O', '9', 'R', 'a', 'S',
                                                    'x', 'i', 'á', 'é', 'í', 'ó', 'ú',
                                                    'â', 'ê', 'ô', 'ã', 'õ', 'ç']) then
    begin
     Delete(Result, i, 1);
     Insert(sCaracter, Result, i);
    end;
end;

{ Preenche a string 's' com espaços em branco à direita, até completar o tamanho quantidade }
class function TStringFunctions.Spaces(const Texto: string;
  const quantidade: integer): string;
var
  i: integer;
begin
  if Length(Texto) >= quantidade then
    Result := Copy(Texto, 1, quantidade)
  else
  begin
    Result := '';
    for i := 1 to quantidade - Length(Texto) do
      Result := Result + ' ';
    Result := Texto + Result;
  end;
end;

class function TStringFunctions.strText(const s: string; const quantidade: integer; const esquerda: boolean = False; const TipCarc : char = ' '): string;
var
  i: integer;
begin
 if Length(s) = quantidade then
  Result := s
 else
  if Length(s) > quantidade then
   Result := Copy(s, 1, quantidade)
  else
   begin
    Result := '';
    for i := 1 to quantidade - Length(s) do
     if esquerda then Result := TipCarc + Result
     else Result := Result + TipCarc;

    if esquerda then Result := Result + s
    else Result := s + Result;
   end;
end;

class function TStringFunctions.PutAccent(sText, WithCaracter, WithoutCaracter: String): String;
var
  x: Integer;
begin;
  for x := 1 to Length(sText) do
   if System.Pos(sText[x], WithoutCaracter) <> 0 then
    sText[x] := WithCaracter[System.Pos(sText[x], WithoutCaracter)];

  Result := sText;
end;

{ Coloca máscara em CPF, CEI ou CGC, ao recebê-los sem a máscara }
class function TStringFunctions.PutMask(const sNumero: string): string;
var
  Numero: string;
begin
  Result := sNumero;
  Numero := ExtractNotNumbers(sNumero);

  case Length(Numero) of
    14: Result := Copy(Numero,  1, 2) + '.' + Copy(Numero, 3, 3) + '.' +
                  Copy(Numero,  6, 3) + '/' + Copy(Numero, 9, 4) + '-' +
                  Copy(Numero, 13, 2); // CGC

    11:  Result := Copy(Numero, 1, 3) + '.' + Copy(Numero,  4, 3) + '.' +
                   Copy(Numero, 7, 3) + '-' + Copy(Numero, 10, 2); // CPF

    12:  Result := Copy(Numero, 1, 11) + '-' + LastChar(Numero); // CEI
  end;
end;

class function TStringFunctions.PutMaskByType(const sTipoInscricao,
  sNumero: string): string;
var
  Numero: string;
begin
  Result := sNumero;
  Numero := ExtractNotNumbers(sNumero);

  if SameText(sTipoInscricao, '3') and (Length(Numero) = 14) then
   begin
    Result := Copy(Numero,  1, 3) + '.' + Copy(Numero, 4, 3) + '.' +
              Copy(Numero,  7, 3) + '/' + Copy(Numero, 10, 3) + '-' +
              Copy(Numero, 13, 2);
   end
  else Result := Self.PutMask(sNumero);
end;

{ Coloca máscara em PIS }
class function TStringFunctions.PutMaskPIS(const sNumero: string): string;
var
  Numero: string;
begin
  Result := sNumero;
  Numero := ExtractNotNumbers(sNumero);

  if Length(Numero) = 11 then
   begin
    Result := Copy(Numero, 1, 3) + '.' + Copy(Numero,  4, 5) + '.' +
              Copy(Numero, 9, 2) + '.' + Copy(Numero, 11, 1);
   end
  else
   Result := sNumero;
end;

{ Coloca máscara em Processo, ao recebê-los sem a máscara }
class function TStringFunctions.PutMaskProcesso(const sNumero: string): string;
var
  Numero: string;
begin
  Result := sNumero;
  Numero := ExtractNotNumbers(sNumero);

  Result := Copy(Numero,  1, 7) + '-' +
            Copy(Numero, 8, 2) + '.' +
            Copy(Numero,  11, 4) + '.'+
            Copy(Numero, 15, 3) + '-' +
            Copy(Numero, 18, 4);
end;

{ Retorna Texto + espaços em branco à direita }
class function TStringFunctions.SpaceRight(Texto: string; quant: integer): string;
begin
  Result := Texto + Replicate(' ', quant - Length(Texto));
end;

{ Retorna espaços em branco + Texto }
class function TStringFunctions.SpaceLeft(Texto: string; quant: integer): string;
begin
  Result := Replicate(' ', quant - Length(Texto)) + Texto;
end;

class function TStringFunctions.CalculaDigitoCNPJ(NumeroDoCgc: string): String;
var
  localCGC, Resultado : string;
  localResult    : boolean;
  digit1, digit2 : integer;
  ii,soma        : integer;
begin
  if Vazio(NumeroDoCgc) then
  begin
   Result := '';
   Exit;
  end;

  localCGC := '';
  Resultado := '';
  localResult := False;

  {analisa CGC no formato 99.999.999/9999-00}
  if Length(NumeroDoCgc) = 18 then
   begin
    if (Copy(NumeroDoCgc,3,1)+Copy(NumeroDoCgc,7,1)+Copy(NumeroDoCgc,11,1)+Copy(NumeroDoCgc,16,1) = '../-') then
     begin
      localCGC := Copy(NumeroDoCgc,1,2) + Copy(NumeroDoCgc,4,3) + Copy(NumeroDoCgc,8,3) +
                  Copy(NumeroDoCgc,12,4) + Copy(NumeroDoCgc,17,2);
      localResult := True;
     end
   end
  else if Length(TStringFunctions.ExtractNotNumbers(NumeroDoCgc)) = 14 then      {analisa CGC no formato 99999999999900}
   begin                                               {Adicionado a função da string function para casos onde a string tem exatamente 14 caracteres porém não é um CGC}
    localCGC    := NumeroDoCgc;
    localResult := True;
   end;

  {começa a verificação do dígito}
  if localResult then
   begin
    try
     {1° digito}
     soma := 0;
     for ii := 1 to 12 do
     begin
       if ii < 5 then
         Inc(soma, StrToInt(Copy(localCGC, ii, 1))*(6-ii))
       else
         Inc(soma, StrToInt(Copy(localCGC, ii, 1))*(14-ii))
     end;
     digit1 := 11 - (soma mod 11);
     if digit1 > 9 then digit1 := 0;
     localCGC := Copy(localCGC, 1, 12) + IntToStr(digit1) + '0';

     {2° digito}
     soma := 0;

     for ii := 1 to 13 do
       if ii < 6 then
         Inc(soma, StrToInt(Copy(localCGC, ii, 1))*(7-ii))
       else
         Inc(soma, StrToInt(Copy(localCGC, ii, 1))*(15-ii));

     digit2 := 11 - (soma mod 11);
     if digit2 > 9 then digit2 := 0;

     {Checa os dois dígitos}
     Resultado := PutMask(Copy(localCGC, 1, 12) + IntToStr(digit1) + IntToStr(digit2));
    except
     Resultado := '';
    end;
   end;

  Result := Resultado;
end;

//******************************************************************************
// Funcao.....: WordChange
// Adaptacao..: 05/05/2021
// Tecnico....: Flavio Ribeiro
// Descricao..: Troca 'substring' por 'trocarpor' dentro de 'Texto'
//******************************************************************************
class function TStringFunctions.WordChange(Texto, substring, trocarpor: string): string;
var
  i: integer;
  s: String;
begin
  if SeExiste(substring, Texto) then
   begin
    i := 1;
    while i <= Length(Texto) do
     begin
      if UpperCase(Copy(Texto, i, Length(substring))) = UpperCase(substring) then
       begin
        Delete(Texto, i, Length(substring));
        Insert(trocarpor, Texto, i);
        s := Texto;
       end;
      Inc(i);
     end;
    Result := s;
   end
  else Result := Texto;

end;

//******************************************************************************
// Funcao.....: NoRepeatChar
// Adaptacao..: 05/05/2021
// Tecnico....: Flavio Ribeiro
// Descricao..: Retorna 'texto' sem 'char' repetidos, um depois do outro
//******************************************************************************
class function TStringFunctions.NoRepeatChar(texto: string; caracter: char): string;
var
  i: integer;
begin
  if Length(texto) <= 1 then
  begin
    Result := texto;
    Exit;
  end;

  i := 1;
  while i <= Length(texto) - 1 do
  begin
    if (texto[i] = texto[i + 1]) and (texto[i] = caracter) then
    begin
      Delete(texto, i, 1);
      i := 1;
    end;
    Inc(i);
  end;

  Result := texto;
end;

//******************************************************************************
// Funcao.....: ExtractTextFromTags
// Adaptacao..: 26/02/2018
// Tecnico....: Flavio Ribeiro
// Descricao..: Retorna o texto dentro de duas tags (open e close tag's)
//******************************************************************************
class function TStringFunctions.ExtractTextFromTags(sText, sOpenTag, sCloseTag : String) : String;
var
  iAux, kAux : Integer;
begin
  Result := '';

  if (Pos(sCloseTag, sText) <> 0) and (Pos(sOpenTag, sText) <> 0) then
  begin
    iAux := Pos(sOpenTag, sText) + Length(sOpenTag);
    kAux := Pos(sCloseTag, sText);
    Result := Copy(sText, iAux, kAux-iAux);
  end;
end;

//******************************************************************************
// Funcao.....: StringsToStringList
// Adaptacao..: 05/05/2021
// Tecnico....: Flavio Ribeiro
// Descricao..: Converte TStrings para TStringList
//******************************************************************************
class function TStringFunctions.StringsToStringList(const Strings: TStrings): TStringList;
var
  i: integer;
begin
  Result := TStringList.Create;
  for i := 0 to Strings.Count - 1 do
    Result.Add(Strings[i]);
end;

//******************************************************************************
// Funcao.....: NoSignals
// Adaptacao..: 05/05/2021
// Tecnico....: Flavio Ribeiro
// Descricao..: Tira quaisquer símbolos gráficos dos dígitos
//******************************************************************************
class function TStringFunctions.NoSignals(texto: string): string;
var
  i: integer;
begin
  Result := '';
  if Vazio(texto) then Exit;

  for i := 1 to Length(texto) do
  begin
    case texto[i] of
      'ª', 'º', '‡', '•', 'ƒ' :texto[i] := ' ';
      'ã', 'á', 'â', 'à', 'ä':texto[i] := 'a';
      'Ã', 'Á', 'Â', 'À', 'Ä':texto[i] := 'A';
      'ê', 'è', 'é', 'ë'     :texto[i] := 'e';
      'É', 'Ê', 'È', 'Ë'     :texto[i] := 'E';
      'í', 'î', 'ì', 'ï'     :texto[i] := 'i';
      'Í', 'Î', 'Ï'          :texto[i] := 'I';
      'ó', 'ô', 'õ', 'ò', 'ö':texto[i] := 'o';
      'Õ', 'Ó', 'Ô', 'Ò', 'Ö':texto[i] := 'O';
      'û', 'ú', 'ü'          :texto[i] := 'u';
      'Ú', 'Û', 'Ü'          :texto[i] := 'U';
      'ç'                    :texto[i] := 'c';
      'Ç'                    :texto[i] := 'C';
      'ñ'                    :texto[i] := 'n';
      'Ñ'                    :texto[i] := 'N';
    else
      case Ord(texto[i]) of
        73, 205: texto[i] := 'I';
        128: texto[i] := 'C';
        129, 150, 151, 163: texto[i] := 'u';
        131..134, 160: texto[i] := 'a';
        135: texto[i] := 'c';
        142, 143: texto[i] := 'A';
        130, 136..138: texto[i] := 'e';
        139..141, 161: texto[i] := 'i';
        144: texto[i] := 'E';
        147..149, 162: texto[i] := 'o';
        153: texto[i] := 'O';
        154: texto[i] := 'U';
        164: texto[i] := 'n';
        165: texto[i] := 'N';
      end;
    end;
  end;
  Result := texto;
end;

//******************************************************************************
// Funcao.....: NoSpaces
// Adaptacao..: 07/05/2021
// Tecnico....: Flavio Ribeiro
// Descricao..: Tira quaisquer espaços do texto
//******************************************************************************
class function TStringFunctions.NoSpaces(Texto: string): string;
var
  i: integer;
begin
  Texto := AllTrim(Texto);

  i := 1;
  while i <= Length(Texto) do
  begin
    if (Texto[i] = ' ') and (Texto[i + 1] = ' ') then
    begin
      Delete(Texto, i, 1);
      i := 0;
    end;
    Inc(i);
  end;

  Result := Texto;
end;

class function TStringFunctions.HTMLDecode(const AStr: String): String;
var
  Sp, Rp, Cp, Tp: PChar;
  S: String;
  I, Code: Integer;
begin
  SetLength(Result, Length(AStr));
  Sp := PChar(AStr);
  Rp := PChar(Result);
  Cp := Sp;
  try
    while Sp^ <> #0 do
    begin
      case Sp^ of
        '&': begin
               Cp := Sp;
               Inc(Sp);
               case Sp^ of
                 'a': if AnsiStrPos(Sp, 'amp;') = Sp then  { do not localize }
                      begin
                        Inc(Sp, 3);
                        Rp^ := '&';
                      end;
                 'l',
                 'g': if (AnsiStrPos(Sp, 'lt;') = Sp) or (AnsiStrPos(Sp, 'gt;') = Sp) then { do not localize }
                      begin
                        Cp := Sp;
                        Inc(Sp, 2);
                        while (Sp^ <> ';') and (Sp^ <> #0) do
                          Inc(Sp);
                        if Cp^ = 'l' then
                          Rp^ := '<'
                        else
                          Rp^ := '>';
                      end;
                 'n': if AnsiStrPos(Sp, 'nbsp;') = Sp then  { do not localize }
                      begin
                        Inc(Sp, 4);
                        Rp^ := ' ';
                      end;
                 'q': if AnsiStrPos(Sp, 'quot;') = Sp then  { do not localize }
                      begin
                        Inc(Sp,4);
                        Rp^ := '"';
                      end;
                 '#': begin
                        Tp := Sp;
                        Inc(Tp);
                        while (Sp^ <> ';') and (Sp^ <> #0) do
                          Inc(Sp);
                        SetString(S, Tp, Sp - Tp);
                        Val(S, I, Code);
                        Rp^ := Chr((I));
                      end;
                 else
                   Exit;
               end;
           end
      else
        Rp^ := Sp^;
      end;
      Inc(Rp);
      Inc(Sp);
    end;
  except
  end;
  SetLength(Result, Rp - PChar(Result));
end;

class function TStringFunctions.ContaFormatadaMascara(const sConta, sMask: String; bExbNivZer: Boolean): String;
var
  i: Integer;
  stl: TStringList;
begin
  Result := Trim(sConta);

  for i := 1 to Length(sMask) do
   if (sMask[i] <> '9') and (i <= Length(Result)) then Insert(sMask[i], Result, i);

  stl := nil;

  stl := TStringFunctions.Aparse(Result, '.');

  i := 0;

  while (i < stl.Count) and (not bExbNivZer) do
   begin
    if StrToIntDef(stl[i], 0) = 0 then stl.Delete(i)
    else Inc(i);
   end;

  stl.Delimiter := '.';
  Result        := stl.DelimitedText;

  FreeAndNil(stl);
end;

end.
