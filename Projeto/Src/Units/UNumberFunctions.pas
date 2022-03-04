unit UNumberFunctions;

interface

uses Classes;

type
  TNumberFunctions = class(TPersistent)
  published
    class function Contains(const iNumber: Integer; const iPart: array of Integer): Boolean;
    class function FloatToInt(const RealNumber: real): Longint;
    class function SumDigits(const Number: string): integer;
    class function VarToCurrency(const Number: variant; const Default: currency = 0): currency;
    class function VarToInt(const Number: variant; const Default: integer = 0): integer;
    class function StrToCurrDef(AString: string; Default: Currency): Currency;
    class function StrMoney(const Value: extended; const Cifrao: string = '"R$ "'): string;
    class function NumberBetween(Number, NumberStart, NumberEnd: extended): Boolean;
    class function Percent(const Value, Percent: Currency): Currency;
    class function IsZero(const Value: Currency): boolean;
    class function FormatValue(const Mask: string; const Value: Currency): string;
    class function ExtractDecimalSeparator(const value: string): string;
    class function ConvertPadToDecimal(const Number: string): currency;
    class function TryFormatNumberAsLocal(const Number: string; const DecimalSeparator: char = '.'; const ThousandSeparator: char = ','): string;
    class function TruncDecimal(Valor: Currency; iNroCasas: Integer): Currency;
    class function MaxValue(const PrimeiroValor, SegundoValor: Currency): Currency;
  end;

implementation

uses UStringFunctions, SysUtils, Variants, System.Math, StrUtils;

{ TNumberFunctions }

//******************************************************************************
// Funcao.....: FloatToInt
// Adaptacao..: 29/01/2007
// Tecnico....: Jose Mario
// Descricao..:
//******************************************************************************
class function TNumberFunctions.Contains(const iNumber: Integer;
  const iPart: array of Integer): Boolean;
var
  i: Integer;
begin
  for i := Low(iPart) to High(iPart) do
   begin
    Result := iNumber = iPart[i];
    
    if Result then
     Break;
   end;
end;

class function TNumberFunctions.FloatToInt(const RealNumber: real): Longint;
var
  n: real;
  aux: string;
begin
  n      := Int(RealNumber);
  aux    := floattostr(n);
  Result := StrToInt(aux);
end;

class function TNumberFunctions.ConvertPadToDecimal(const Number: string): currency;
var
  i: Integer;
  DecimalSeparatorFound: Boolean;
  IntegerPart, DecimalPart, DecimalSeparator: string;
begin
  Result := 0;

  if TStringFunctions.IsFull(TStringFunctions.ExtractNotNumbers(Number)) then
   begin
    DecimalSeparatorFound := False;
    DecimalSeparator      := ',';

    for i := Length(Number) downto 0 do
     begin
      if DecimalSeparatorFound then
       begin
        DecimalPart := Copy(Number, i + 2, Length(Number));
        IntegerPart := StringReplace(StringReplace(Copy(Number, 0, i), '.', '', [rfReplaceAll]), ',', '', [rfReplaceAll]);

        Result := StrToCurrDef(IntegerPart + DecimalSeparator + DecimalPart, 0);
        break;
       end
      else DecimalSeparatorFound := (Copy(Number, i, 1) = '.') or (Copy(Number, i, 1) = ',');
     end;

    if not DecimalSeparatorFound then
     Result := StrToCurrDef(Number, 0);
   end;
end;

class function TNumberFunctions.ExtractDecimalSeparator(const value: string): string;
var
  i: Integer;
  Vlrfmt: string;
begin
  Result := '';
  if Length(value) > 0 then
   begin
    for i := Length(value) downto 1 do
     begin
      if (value[i] = ',') or (value[i] = '.') then
       begin
        Result := value[i];
        Break;
       end;
     end;
   end;
end;

class function TNumberFunctions.FormatValue(const Mask: string;
  const Value: Currency): string;
var
  Vlrfmt: string;
begin
  Vlrfmt := FormatFloat(Mask, Value);
  Result := DupeString(' ', Length(Mask) - Length(Vlrfmt)) + Vlrfmt;
end;

class function TNumberFunctions.IsZero(const Value: Currency): boolean;
begin
  Result := RoundTo(Value, -2) = 0;
end;

class function TNumberFunctions.MaxValue(const PrimeiroValor,
  SegundoValor: Currency): Currency;
begin
  if (PrimeiroValor > SegundoValor) then
   Result := PrimeiroValor
  else
   Result := SegundoValor
end;

class function TNumberFunctions.NumberBetween(Number, NumberStart,
  NumberEnd: extended): Boolean;
begin
  Result := ((Number >= NumberStart) and (Number <= NumberEnd));
end;

class function TNumberFunctions.Percent(const Value,
  Percent: Currency): Currency;
begin
  Result := Value * (Percent / 100);
end;

{ Recebe um número no formato string e soma acumulando cada um de seus caracteres }
class function TNumberFunctions.StrToCurrDef(AString: string;
  Default: Currency): Currency;
begin
  AString := StringReplace(AString, '.', FormatSettings.DecimalSeparator, [rfReplaceAll]);
  Result := SysUtils.StrToCurrDef(AString, Default);
end;

class function TNumberFunctions.SumDigits(const Number: string): integer;
var
  s: string;
  i: integer;
begin
  Result := 0;
  s := TStringFunctions.ExtractNotNumbers(Number);

  for i := 1 to Length(s) do
   Inc(Result, StrToIntDef(s[i], 0));
end;


class function TNumberFunctions.TryFormatNumberAsLocal(const Number: string;
  const DecimalSeparator, ThousandSeparator: char): string;
var
  objFormat: TFormatSettings;
  fValor: Double;
begin
  objFormat.DecimalSeparator  := '.';
  objFormat.ThousandSeparator := ',';

  Result := Number;

  if TryStrToFloat(Result, fValor, objFormat) and (Pos(objFormat.DecimalSeparator, Result) > 0) then
   Result := FormatFloat(',#0.00', fValor);
end;

class function TNumberFunctions.VarToCurrency(const Number: variant;
  const Default: currency): currency;
begin
  if (Number = null) or (VarToStr(Number) = '') then
   Result := Default
  else Result := Currency(Number);
end;

class function TNumberFunctions.VarToInt(const Number: variant;
  const Default: integer): integer;
begin
  if (Number = null) or (VarToStr(Number) = '')  then
   Result := Default
  else Result := Integer(Number);
end;

{ Retorna Value já no formato de moeda, em string }
class function TNumberFunctions.StrMoney(const Value: extended; const Cifrao: string = '"R$ "'): string;
begin
  Result := FormatFloat(Cifrao + '#,##0.00', Value);
end;

class function TNumberFunctions.TruncDecimal(Valor: Currency; iNroCasas: Integer): Currency;
begin
  Result := Trunc(Valor * Power(10,iNroCasas)) / Power(10,iNroCasas);
end;

end.
