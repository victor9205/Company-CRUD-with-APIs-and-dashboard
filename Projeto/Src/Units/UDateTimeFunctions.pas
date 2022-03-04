unit UDateTimeFunctions;

interface

uses Classes, Vcl.Controls;

type
  TDateTimeFunctions = class(TPersistent)
  public
    class function FormatMonthYear(const Data: TDate): String; overload;
  published
    class function CenturyDate(Data: TDateTime): string;
    class function DateBetween(const Date, InitDate, FinishDate: TDate): boolean;
    class function DateFromString(Format, Str: string): TDate;
    class function DateTimeFromString(Format, Str: string): TDateTime;
    class function DateOfApplication : TDateTime;
    class function Dtos(const data: TDateTime): string;
    class function EndOfTheMonth(const AValue: TDate): TDate;
    class function GetDate(const Month: integer; const InitDate, FinishDate: TDate): TDate;
    class function GetMonth(const MonthYear: string): integer;
    class function GetMonthName(const iMonth: integer): string;
    class function GetDayWeekName(const dData: TDateTime): string;
    class function GetWeekName(const iDiaSemana: Integer): string;
    class function GetYear(const MonthYear: string): integer;
    class function ISODateStrToDateTime(const Date: AnsiString): TDateTime;
    class function ISODateTimeStrToDateTime(const DateTime: AnsiString): TDateTime;
    class function ISOTimeStrToTime(const Time: AnsiString): TDateTime;
    class function MonthsCount(dInitial, dFinal: TDateTime): integer;
    class function SameDateTime(AValue, BValue: TDateTime; const UseSeconds: Boolean = True): Boolean;
    class function SecondsCount(sTime: string): integer;
    class function SetStationDateTime(DateTime: TDateTime): Boolean;
    class function Stod(const dataemstr: string): TDateTime;
    class function IntYear(data: TDateTime): integer;
    class function StrYear(data: TDateTime): string;
    class function StrDay(data: TDateTime): string;
    class function StrMonth(data: TDateTime): string;
    class function TimeSince(dInitial: TDateTime; dFinal: TDateTime=0): string;
    class function UTCTime(const DateTime: TDateTime): TDateTime;
    class function ValidateMonthYear(const MonthYear: string; const Accept13: Boolean = False): boolean;
    class function DextCity(const data: TDateTime; const cidade: string): string; static;
    class function NumDias(Data: TDateTime): integer; static;
    class function Dext(const data: TDateTime): string; static;
    class function Corrigir_Formato_Data(Data: string): TDate;static;
    class function RFC822DateToDateTime(RFC822DateTime: string): TDateTime; static;
    class function ComplexDateToDateTime(ComplexDateTime: String): TDateTime; static;
    class function FormatMonthYear(iMonth, iYear: Integer): String; overload;
    class function IdentifyDateSeparator(Format: String): Char;
    class function ParseDate(StrDate, Format: String): TDateTime;
    class function HasValue(const ADate: TDateTime): boolean;
    class function StartOfAMonth(const iAno, iMes: Integer): TDate;
    class function EndOfAMonth(const iAno, iMes: Integer): TDate;
    class function DateToDateDayMonthYearTime(const Date: TDateTime): String;
	class function ValMes(const MesAno: string): integer;
    class function ValAno(const MesAno: string): integer;
  end;

implementation

uses Windows, DateUtils, SysUtils, StrUtils, UStringFunctions, Math;

class function TDateTimeFunctions.DateBetween(const Date, InitDate,
  FinishDate: TDate): boolean;
begin
  Result := (Date >= InitDate) and (Date <= FinishDate);
end;

class function TDateTimeFunctions.DateFromString(Format, Str: string): TDate;
var
  sAno, sMes, sDia: string;
  iAno, iMes, iDia: integer;
begin
  Format := TStringFunctions.ExtractNotLetters(Format);
  Str    := TStringFunctions.ExtractNotNumbers(Str);
  // Obtendo string do ano
  sAno := StringReplace(Format, 'D', '', [rfReplaceAll]);
  sAno := StringReplace(sAno, 'M', '', [rfReplaceAll]);
  sAno := Copy(Str, Pos(sAno, Format), Length(sAno));
  // Obtendo string do mês
  sMes := StringReplace(Format, 'D', '', [rfReplaceAll]);
  sMes := StringReplace(sMes, 'Y', '', [rfReplaceAll]);
  sMes := Copy(Str, Pos(sMes, Format), Length(sMes));
  // Obtendo string do dia
  sDia := StringReplace(Format, 'M', '', [rfReplaceAll]);
  sDia := StringReplace(sDia, 'Y', '', [rfReplaceAll]);
  sDia := Copy(Str, Pos(sDia, Format), Length(sDia));

  // Obtendo ano, mês e dia
  iAno := StrToIntDef(sAno, 0);
  iMes := StrToIntDef(sMes, 0);
  iDia := StrToIntDef(sDia, 0);

  Result := EncodeDate(iAno, iMes, iDia);
end;

class function TDateTimeFunctions.DateTimeFromString(Format, Str: string): TDateTime;
var
  sAno, sMes, sDia, sHor, sMin: string;
  iAno, iMes, iDia, iHor, iMin: integer;
begin
  Format := TStringFunctions.ExtractNotLetters(Format);
  Str    := TStringFunctions.ExtractNotNumbers(Str);
  // Obtendo string do ano
  sAno := StringReplace(Format, 'D', '', [rfReplaceAll]);
  sAno := StringReplace(sAno, 'M', '', [rfReplaceAll]);
  sAno := StringReplace(sAno, 'H', '', [rfReplaceAll]);
  sAno := StringReplace(sAno, 'm', '', [rfReplaceAll]);
  sAno := Copy(Str, Pos(sAno, Format), Length(sAno));
  // Obtendo string do mês
  sMes := StringReplace(Format, 'D', '', [rfReplaceAll]);
  sMes := StringReplace(sMes, 'Y', '', [rfReplaceAll]);
  sMes := StringReplace(sMes, 'H', '', [rfReplaceAll]);
  sMes := StringReplace(sMes, 'm', '', [rfReplaceAll]);
  sMes := Copy(Str, Pos(sMes, Format), Length(sMes));
  // Obtendo string do dia
  sDia := StringReplace(Format, 'M', '', [rfReplaceAll]);
  sDia := StringReplace(sDia, 'Y', '', [rfReplaceAll]);
  sDia := StringReplace(sDia, 'H', '', [rfReplaceAll]);
  sDia := StringReplace(sDia, 'm', '', [rfReplaceAll]);
  sDia := Copy(Str, Pos(sDia, Format), Length(sDia));
  // Obtendo string das horas
  sHor := StringReplace(Format, 'Y', '', [rfReplaceAll]);
  sHor := StringReplace(sHor, 'M', '', [rfReplaceAll]);
  sHor := StringReplace(sHor, 'D', '', [rfReplaceAll]);
  sHor := StringReplace(sHor, 'm', '', [rfReplaceAll]);
  sHor := Copy(Str, Pos(sHor, Format), Length(sHor));
  // Obtendo string dos minutos
  sMin := StringReplace(Format, 'Y', '', [rfReplaceAll]);
  sMin := StringReplace(sMin, 'M', '', [rfReplaceAll]);
  sMin := StringReplace(sMin, 'D', '', [rfReplaceAll]);
  sMin := StringReplace(sMin, 'H', '', [rfReplaceAll]);
  sMin := Copy(Str, Pos(sMin, Format), Length(sMin));

  // Obtendo ano, mês, dia, hora e minuto
  iAno := StrToIntDef(sAno, 0);
  iMes := StrToIntDef(sMes, 0);
  iDia := StrToIntDef(sDia, 0);
  iHor := StrToIntDef(sHor, 0);
  iMin := StrToIntDef(sMin, 0);

  Result := EncodeDateTime(iAno, iMes, iDia, iHor, iMin, 0, 0);
end;

class function TDateTimeFunctions.GetMonth(
  const MonthYear: string): integer;
begin
  Result := StrToInt(Copy(MonthYear, 1, 2));
end;

class function TDateTimeFunctions.GetYear(
  const MonthYear: string): integer;
var
  s: string;
begin
  s := TStringFunctions.CopyPosEnd(MonthYear, '/');
  case Length(s) of
   1: s := '0' + s;
   3: s := '1' + s;
  end;

  if Length(s) = 2 then
   s := IfThen(StrToInt(s) < 50, '20', '19') + s;

  Result := StrToInt(s);
end;

class function TDateTimeFunctions.HasValue(const ADate: TDateTime): boolean;
begin
  Result := (ADate - 1) > 0
end;

class function TDateTimeFunctions.SetStationDateTime(DateTime: TDateTime): Boolean;
var
  sys: TSystemTime;
begin
  GetLocalTime(sys);
  DateTimeToSystemTime(DateTime, sys);

  Result := SetLocalTime(sys);
end;

//******************************************************************************
// Funcao.....: StrYear
// Adaptacao..: 29/01/2007
// Tecnico....: José Mário
// Descricao..:
//******************************************************************************
class function TDateTimeFunctions.StrYear(data: TDateTime): string;
begin
  Result := IntToStr(YearOf(data));
end;

//******************************************************************************
// Funcao.....: Dtos
// Adaptacao..: 29/01/2007
// Tecnico....: José Mário
// Descricao..:
//******************************************************************************
class function TDateTimeFunctions.Dtos(const data: TDateTime): string;
begin
  Result := FormatDateTime('yyyyMMdd', data);
end;

//******************************************************************************
// Funcao.....: CenturyDate
// Adaptacao..: 29/01/2007
// Tecnico....: José Mário
// Descricao..:
//******************************************************************************
class function TDateTimeFunctions.CenturyDate(Data: TDateTime): string;
begin
  Result := FormatDateTime(Format('dd%sMM%0:syyyy', [FormatSettings.DateSeparator]), Data);
end;

//******************************************************************************
// Funcao.....: StrDay
// Adaptacao..: 29/01/2007
// Tecnico....: José Mário
// Descricao..:
//******************************************************************************
class function TDateTimeFunctions.StrDay(data: TDateTime): string;
begin
  Result := IfThen(Length(IntToStr(DayOf(data))) = 2, IntToStr(DayOf(data)), '0' + IntToStr(DayOf(data)));
end;

//******************************************************************************
// Funcao.....: StrMonth
// Adaptacao..: 29/01/2007
// Tecnico....: José Mário
// Descricao..:
//******************************************************************************
class function TDateTimeFunctions.StrMonth(data: TDateTime): string;
var
  aux: string;
begin
  aux    := IntToStr(MonthOf(data));
  Result := ifThen(Length(aux) > 1, aux, '0' + aux);
end;

//******************************************************************************
// Funcao.....: Stod
// Adaptacao..: 29/01/2007
// Tecnico....: José Mário
// Descricao..:
//******************************************************************************
class function TDateTimeFunctions.StartOfAMonth(const iAno, iMes: Integer): TDate;
begin
  Result := EncodeDate(iAno, iMes, 1);
end;

class function TDateTimeFunctions.Stod(const dataemstr: string): TDateTime;
begin
  try
    Result := StrToDate(Copy(dataemstr, 7, 2) + FormatSettings.DateSeparator +
              Copy(dataemstr, 5, 2) + FormatSettings.DateSeparator + Copy(dataemstr, 1, 4));
  except
    Result := 0;
  end;
end;

class function TDateTimeFunctions.SameDateTime(AValue, BValue: TDateTime;
  const UseSeconds: Boolean): Boolean;
var
  iAno, iMes, iDia, iHora, iMin, iSeg, iMil: Word;
begin
  // Verificando se deve desconsiderar segundos e milisegundos
  if not UseSeconds then
   begin
    // Desconsiderando segundos e milisegundos de AValue;
    DecodeDateTime(AValue, iAno, iMes, iDia, iHora, iMin, iSeg, iMil);
    AValue := EncodeDateTime(iAno, iMes, iDia, iHora, iMin, 0, 0);
    // Desconsiderando segundos e milisegundos de BValue;
    DecodeDateTime(BValue, iAno, iMes, iDia, iHora, iMin, iSeg, iMil);
    BValue := EncodeDateTime(iAno, iMes, iDia, iHora, iMin, 0, 0);
   end;

  Result := DateUtils.SameDateTime(AValue, BValue);
end;

class function TDateTimeFunctions.UTCTime(
  const DateTime: TDateTime): TDateTime;
var
  TimeZone: TTimeZoneInformation;
begin
  case GetTimeZoneInformation(TimeZone) of
   TIME_ZONE_ID_STANDARD: Result := DateTime + (TimeZone.Bias / 60 / 24);
   TIME_ZONE_ID_DAYLIGHT: Result := DateTime + (TimeZone.Bias / 60 / 24) + TimeZone.DaylightBias;
  else
   Result := DateTime;
  end;
end;

class function TDateTimeFunctions.ValidateMonthYear(
  const MonthYear: string; const Accept13: boolean): boolean;
var
  iYear, iMonth: integer;
begin
  Result := false;

  if not (Length(MonthYear) in [5, 7]) or (Pos(' ', MonthYear) <> 0) then Exit;
  iYear := GetYear(MonthYear);
  iMonth := GetMonth(MonthYear);
  Result := (iYear > 1980) and ((iMonth in [1..12]) or (Accept13 and (iMonth in [1..13])));
end;

//******************************************************************************
// Função.....: MonthsCount
// Criação....: 06/07/2007
// Técnico....: José Mário
// Descrição..: Returns count of months compreehended between the date range
// ............ Ex.: between the dates '2007-10-05' and '2007-11-02' haves 2
// ............ months ('2007-10' and '2007-11'). So, this returns 2 as the result
//******************************************************************************
class function TDateTimeFunctions.MonthsCount(dInitial, dFinal: TDateTime): integer;
var
 sCurMonth: string;
begin
 Result := 0;
 sCurMonth := '';

 repeat
  if sCurMonth <> FormatDateTime('yyyymm', dInitial) then
   begin
    inc(Result);
    sCurMonth := FormatDateTime('yyyymm', dInitial);
   end;

  dInitial := dInitial + 1;
 until dInitial > dFinal;
end;

//******************************************************************************
// Função......: TimeSince
// Criação.....: 10/09/2007
// Técnico.....: José Mário
// Tarefa......:
// Descrição...: Calcula a diferença entre a data inicial e final e retorna em
// ............. formato textual. Se a data final for zero (0), a data atual é
// ............. assumida
//******************************************************************************
class function TDateTimeFunctions.TimeSince(dInitial,
  dFinal: TDateTime): string;
begin
 // Prepara variaveis
 Result := '';

 // Assume data atual se data final for zero
 if dFinal = 0 then
  dFinal := Now();

 // Formata horas
 if StrToInt(FormatDateTime('h', dFinal - dInitial)) = 1 then
  Result := FormatDateTime(', h "hora"', dFinal - dInitial)
 else if StrToInt(FormatDateTime('h', dFinal - dInitial)) > 1 then
  Result := FormatDateTime(', h "horas"', dFinal - dInitial);

 // Formata minutos
 if StrToInt(FormatDateTime('n', dFinal - dInitial)) = 1 then
  Result := Result + FormatDateTime(', n "minuto"', dFinal - dInitial)
 else if StrToInt(FormatDateTime('n', dFinal - dInitial)) > 1 then
  Result := Result + FormatDateTime(', n "minutos"', dFinal - dInitial);

 // Formata segundos
 if StrToInt(FormatDateTime('s', dFinal - dInitial)) = 1 then
  Result := Result + FormatDateTime(', s "segundo"', dFinal - dInitial)
 else if StrToInt(FormatDateTime('s', dFinal - dInitial)) > 1 then
  Result := Result + FormatDateTime(', s "segundos"', dFinal - dInitial);

 // Remove virgula
 System.Delete(Result, 1, 2);
end;
//******************************************************************************
// Função......: DateOfApplication
// Criação.....: 13/09/2007
// Técnico.....: José Espedito
// Tarefa......:
// Descrição...:
//******************************************************************************
class function TDateTimeFunctions.DateOfApplication: TDateTime;
Var
 sr : TSearchRec;

begin
 FindFirst( ParamStr(0), 0, sr );

 Result := FileDateToDateTime( sr.Time );
end;

class function TDateTimeFunctions.DateToDateDayMonthYearTime(
  const Date: TDateTime): String;
begin
  Result := FormatDateTime('DD/MM/YYYY', Date) + ' 00:00:00';
end;

//******************************************************************************
// Função......: SecondsCount
// Criação.....: 25/09/2007
// Técnico.....: José Mário
// Tarefa......:
// URL.........:
// Descrição...: Recebe uma string com a duração em formato 'HHH:MM:SS' e retorna
// ............. a quantidade equivalente de segundos
// ............. Será melhorado futuramente para suportar outros formatos
//******************************************************************************
class function TDateTimeFunctions.SecondsCount(sTime: string): integer;
begin
 try
  Result := StrToInt(Copy(sTime, 8, 2));              // Segundos
  Inc(Result, StrToInt(Copy(sTime, 5, 2)) * 60);      // Minutos
  Inc(Result, StrToInt(Copy(sTime, 1, 3)) * 60 * 60); // Horas
 except
  Result := 0;
 end;
end;

class function TDateTimeFunctions.GetDate(const Month: integer; const InitDate,
  FinishDate: TDate): TDate;
begin
  if Self.DateBetween(EncodeDate(YearOf(InitDate), Month, 1), InitDate, FinishDate) then // Mesmo ano
   Result := EncodeDate(YearOf(InitDate), Month, 1)
  else Result := EncodeDate(YearOf(FinishDate), Month, 1);
end;

//******************************************************************************
// Função......: GetMonthName
// Criação.....: 04/10/2007
// Técnico.....: José Mário
// Tarefa......:
// URL.........:
// Descrição...: Recebe o número do mês e retorna a descrição do mes em texto
//******************************************************************************
class function TDateTimeFunctions.GetMonthName(
  const iMonth: integer): string;
const
 MONTH_NAMES : array [1..12] of string = ('Janeiro','Fevereiro','Março',
                                          'Abril','Maio','Junho',
                                          'Julho','Agosto','Setembro',
                                          'Outubro','Novembro','Dezembro');
begin
 Result := MONTH_NAMES[iMonth];
end;

//******************************************************************************
// Função......: GetDayWeekName
// Criação.....: 04/10/2007
// Técnico.....: Flavio Ribeiro
// Tarefa......:
// URL.........:
// Descrição...: Recebe uma data e retorna o nome do dia da semana
//******************************************************************************
class function TDateTimeFunctions.GetDayWeekName(const dData: TDateTime): string;
const
 DAYWEEK_NAMES : array [1..7] of string = ('Segunda-Feira','Terça-Feira','Quarta-Feira',
                                          'Quinta-Feira','Sexta-Feira','Sábado',
                                          'Domingo');
begin
 Result := DAYWEEK_NAMES[DayOfTheWeek(dData)];
end;

//******************************************************************************
// Função......: GetWeekName
// Criação.....: 29/07/2016
// Técnico.....: Flavio Ribeiro
// Tarefa......:
// URL.........:
// Descrição...: Recebe um indice do dia da semana e retorna o nome do dia da semana
//******************************************************************************
class function TDateTimeFunctions.GetWeekName(const iDiaSemana: Integer): string;
const
 DAYWEEK_NAMES : array [1..7] of string = ('Segunda-Feira','Terça-Feira','Quarta-Feira',
                                          'Quinta-Feira','Sexta-Feira','Sábado',
                                          'Domingo');
begin
  if (iDiaSemana <= 7) and (iDiaSemana >= 1) then
   Result := DAYWEEK_NAMES[iDiaSemana]
  else if iDiaSemana = 0 then
   Result := ''
  else
   Result := 'Índice inválido';
end;

//******************************************************************************
// Função......: ISODateStrToDateTime
// Data........: 06/12/2007
// Origem......: http://www.efg2.com/Lab/Library/UseNet/2002/0223.txt
// Técnico.....: José Mário
// Note you must pass these functions the date time strings in the following
// format:
//
// yyyymmddhhnnss
//
// with miliseconds from position 14 in the string. As to converting your
// date string to the above format I will need a little to work out a
// routine to convert 13 Feb 2002 to 20020213. Pleas also for sanity's
// sake I am assuming the year is 4 digits long! I will hopefully have a
// code sample for you later on today.
//
// HTH
//
// Graham Harris
//******************************************************************************
class function TDateTimeFunctions.ISODateStrToDateTime(
  const Date: AnsiString): TDateTime;
var
  D, M, Y: Word;
begin
  Result := 0;

{  if not IsNumeric(Date) then
    Exit;

  if not CheckDateFormat(Date) then
    Exit; }

  { If Time = "" then that means that we have been passed a blank dowm
    message from an HL7 message. Which CheckDateFormat considers valid. }

  if Date = '""' then
    Exit;

  Y := StrToInt(Copy(Date, 1, 4));
  M := StrToInt(Copy(Date, 5, 2));
  D := StrToInt(Copy(Date, 7, 2));

  Result := EncodeDate(Y, M, D);
end;

//******************************************************************************
// Função......: ISODateTimeStrToDateTime
// Data........: 06/12/2007
// Origem......: http://www.efg2.com/Lab/Library/UseNet/2002/0223.txt
// Técnico.....: José Mário
// Descrição...: ver função ISODateStrToDateTime
//******************************************************************************
class function TDateTimeFunctions.ISODateTimeStrToDateTime(
  const DateTime: AnsiString): TDateTime;
begin
  Result := ISODateStrToDateTime(Copy(DateTime, 1, 8)) +
            ISODateTimeStrToDateTime(Copy(DateTime, 9, Length(DateTime)));
end;

//******************************************************************************
// Função......: ISOTimeStrToTime
// Data........: 06/12/2007
// Origem......: http://www.efg2.com/Lab/Library/UseNet/2002/0223.txt
// Técnico.....: José Mário
// Descrição...: ver função ISODateStrToDateTime
//******************************************************************************
class function TDateTimeFunctions.ISOTimeStrToTime(const Time: AnsiString): TDateTime;
var
  H, M, S, Ms: Word;
begin
  Result := 0;

//  if not IsNumeric(Time) then
//    Exit;
//
//  if not CheckTimeFormat(Time) then
//    Exit;

  { If Time = "" then that means that we have been passed a blank down
    message from an HL7 message. Which CheckTimeFormat considers valid. }

  if Time = '""' then
    Exit;

  H := StrToInt(Copy(Time, 1, 2));
  M := StrToInt(Copy(Time, 3, 2));
  if Length(Time) < 6 then
    S := 0
  else
    S := StrToInt(Copy(Time, 5, 2));

  if Length(Time) <= 6 then
    Ms := 0
  else
    Ms := StrToInt(Copy(Time, 7, Length(Time)));

  Result := EncodeTime(H, M, S, Ms);
end;

//******************************************************************************
// Funcao.....: EndOfTheMonth
// Adaptacao..: 25/07/2008
// Tecnico....: Weverton
// Descricao..:
//******************************************************************************
class function TDateTimeFunctions.EndOfAMonth(const iAno, iMes: Integer): TDate;
begin
  Result := EndOfTheMonth(EncodeDate(iAno, iMes, 1));
end;

class function TDateTimeFunctions.EndOfTheMonth(const AValue: TDate): TDate;
begin
  Result := Trunc(DateUtils.EndOfTheMonth(AValue));
end;

class function TDateTimeFunctions.FormatMonthYear(const Data: TDate): String;
begin
  Result := Self.FormatMonthYear(MonthOf(Data), YearOf(Data));
end;

//******************************************************************************
// Funcao.....: FormatMonthYear
// Adaptacao..: 11/10/2013
// Tecnico....: Flavio Ribeiro
// Descricao..: Retorna o Mês e Ano formatados
//******************************************************************************
class function TDateTimeFunctions.FormatMonthYear(iMonth,
  iYear: Integer): String;
begin
  Result := Format('%.2d/%.4d', [iMonth, iYear]);
end;

{ Recebe uma data e retorna o cabeçalho com 'cidade, dd de mmmmmm de yyyy' }
class function TDateTimeFunctions.DextCity(const data: TDateTime; const cidade: string): string;
begin
  if Cidade <> '' then
    Result := UpperCase(Copy(cidade, 1, 1)) + Copy(cidade, 2, Length(cidade)-1) + ', ' + Dext(data)
  else
    Result := Dext(data);
end;

{ Retorna o número de dias do mês de data }
class function TDateTimeFunctions.NumDias(Data: TDateTime): integer;
var
  mes: integer;
  ano: integer;
begin
  mes := MonthOf(Data);
  ano := YearOf(Data);

  Result := 0;

  case mes of
    1, 3, 5, 7, 8, 10, 12: Result := 31;
    4, 6, 9, 11          : Result := 30;
    2                    : Result := IfThen(IsLeapYear(ano), 29, 28);
  end;
end;

class function TDateTimeFunctions.Dext(const data: TDateTime): string;
begin
  Result := strDay(data) + ' de ' + LowerCase(GetMonthName(MonthOf(data))) + ' de ' + strYear(data);
end;

//*******************************************************************************************************
// Funcao.....: ComplexDateToDateTime
// Adaptacao..: 11/05/2017
// Tecnico....: Carlos Aurélio
// Descricao..: Retorna a data a partir de uma string complexa, ex: 'Thu May 11 00:00:00 GMT-03:00 2017'
//*******************************************************************************************************
class function TDateTimeFunctions.ComplexDateToDateTime(
  ComplexDateTime: String): TDateTime;
resourcestring
  ComplexConvertDateTimeConvertError = '"%s" não é uma data complexa válida';

const
  DayArray: array[0..6] of string = ('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun');
  MonthArray: array[0..11] of string = ('Jan', 'Feb', 'Mar', 'Apr', 'May',
    'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');
  ZoneArray: array[0..14] of string = ('UT', 'GMT', 'EST', 'EDT', 'CST', 'CDT',
    'MST', 'MDT', 'PST', 'PDT', 'Z', 'A', 'M', 'N', 'Y');
var
  lString, lDayName, lMonthName: String;
  i, lDay, lMonth, lYear, lHours, lMinutes, lSeconds: Integer;
  lProceed: Boolean;
begin
  lString  := ComplexDateTime;
  lProceed := False;

  // Includes DayName
  lDayName := Copy(lString, 1, 3);

  lProceed := TStringFunctions.Contains(lDayName, DayArray);

  // MonthName
  if lProceed then
   begin
    Delete(lString, 1, 4);

    lMonthName := Copy(lString, 1, 3);
    lProceed   := False;

    for i := 0 to Length(MonthArray) - 1 do
     begin
      if lMonthName = MonthArray[i] then
       begin
        // Found
        lProceed := True;
        // Month
        lMonth := Succ(i);
        Break;
       end;
     end;
   end;

  // Day
  if lProceed then
   begin
    Delete(lString, 1, 4);

    if not TryStrToInt(Copy(lString, 1, 2), lDay) then
     lProceed := False;
   end;

  Delete(lString, 1, 3);

  if lProceed and (Pos(':', Copy(lString, 1, 8)) > 0) then
   begin
    // Hours
    if not TryStrToInt(Copy(lString, 1, 2), lHours) then
     lProceed := False;

    // Minutes
    if lProceed then
     begin
      Delete(lString, 1, 3);

      if not TryStrToInt(Copy(lString, 1, 2), lMinutes) then
       lProceed := False;
     end;

    // Seconds
    if lProceed then
     begin
      Delete(lString, 1, 3);

      if not TryStrToInt(Copy(lString, 1, 2), lSeconds) then
       lSeconds := 0;

      Delete(lString, 1, 3);
     end;
   end;

  // ZoneTime
  if lProceed and TStringFunctions.Contains(lString, ZoneArray) then
   Delete(lString, 1, 10);

  // Year
  if lProceed then
   begin
    if not TryStrToInt(lString, lYear) then
     lYear := 0;
   end;

  if lProceed then
   Result := EncodeDate(lYear, lMonth, lDay) + EncodeTime(lHours, lMinutes, lSeconds, 0)
  else
   raise EConvertError.Create(Format(ComplexConvertDateTimeConvertError, [ComplexDateTime]));
end;

class function TDateTimeFunctions.Corrigir_Formato_Data(Data: string): TDate;
var DataAux :TDate;
    textoAux,sAno,sMes,sDia:string;
    ik:Integer;
begin
  result := Now;
  Data := TStringFunctions.ExtractNotNumbers(Data);
  sDia := Copy(Data,1,2);
  sMes := Copy(Data,3,2);
  sAno := Copy(Data,5,4);
  DataAux := StrToDateDef(sDia+'/'+sMes+'/'+sAno, 0);
  if DataAux <= 0 then //se for igual a zero é porque esta em outro formato provavelmente
   begin
    sAno := Copy(Data,1,4);
    sMes := Copy(Data,5,2);
    sDia := Copy(Data,7,2);
   end;
  result := StrToDateDef(sDia+'/'+sMes+'/'+sAno, 0);
end;

class function TDateTimeFunctions.RFC822DateToDateTime(RFC822DateTime: string): TDateTime;
resourcestring
  RFC822ConvertDateTimeConvertError = '"%s" não é uma data no padrão RFC822 válida';

const
  DayArray: array[0..6] of string = ('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun');
  MonthArray: array[0..11] of string = ('Jan', 'Feb', 'Mar', 'Apr', 'May',
    'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');
  ZoneArray: array[0..14] of string = ('UT', 'GMT', 'EST', 'EDT', 'CST', 'CDT',
    'MST', 'MDT', 'PST', 'PDT', 'Z', 'A', 'M', 'N', 'Y');
var
  lString: string;
  lDayName: string;
  lMonthName: string;
  I: Integer;
  lProceed: Boolean;
  lDay: Integer;
  lMonth: Integer;
  lYear: Integer;
  lTmp: Integer;
  lHours: Integer;
  lMinutes: Integer;
  lSeconds: Integer;
  lTimeZone: TTimeZoneInformation;
  lLocalStringTime: TDateTime;
  lTimeZoneName: string;
  lTimeZoneIndex: Integer;
  lLocalDiffHours: Integer;
  lLocalDiffMinutes: Integer;
  lAddLocalDiff: Boolean;
begin
  lTimeZoneIndex := -1;
  lAddLocalDiff := False;
  lMonth := -1;
  lTmp := 0;
  lString := RFC822DateTime;
  lProceed := False;

  if Pos(',', lString) > 0 then
   begin
    // Includes DayName
    lDayName := Copy(lString, 1, 3);

    for I := 0 to Length(DayArray) - 1 do
     begin
      if SameText(lDayName, DayArray[I]) then
       begin
        // Found
        lProceed := True;
        Break;
       end;
     end;
    Delete(lString, 1, 5);
   end;

  if lProceed then
   begin
    // Day
    if not TryStrToInt(Copy(lString, 1, 2), lDay) then
     lProceed := False;
   end;

  // MonthName
  if lProceed then
   begin
    lMonthName := Copy(lString, 4, 3);
    lProceed   := False;

    for I := 0 to Length(MonthArray) - 1 do
     begin
      if lMonthName = MonthArray[I] then
       begin
        // Found
        lProceed := True;
        // Month
        lMonth := Succ(I);
        Break;
       end;
     end;
   end;

  // Year
  if lProceed then
   begin
    if not TryStrToInt(Copy(lString, 8, 4), lYear) then
     begin
      // might be only 2 characters long
      if not TryStrToInt(Copy(lString, 8, 2), lYear) then
       lProceed := False
      else
       lTmp := 2;
     end
    else
     lTmp := 4;
   end;

  // Hours
  if lProceed then
   begin
    lTmp := 8 + Succ(lTmp);
    if not TryStrToInt(Copy(lString, lTmp, 2), lHours) then
     lProceed := False;
   end;

  // Minutes
  if lProceed then
   begin
    Inc(lTmp, 3);
    if not TryStrToInt(Copy(lString, lTmp, 2), lMinutes) then
     lProceed := False;
   end;

  // Seconds
  if lProceed then
   begin
    Inc(lTmp, 3);
    if not TryStrToInt(Copy(lString, lTmp, 2), lSeconds) then
     // Just proceed, seconds are optional.
     lSeconds := 0;
   end;

  if lProceed then
   begin
    // Get TimeZone
    Inc(lTmp, 3); // Start of TimeZone
    lTimeZoneName := Copy(lString, lTmp, 3); // e.g. "GMT"
    if (Copy(lTimeZoneName, 1, 1) = '-') or (Copy(lTimeZoneName, 1, 1) = '+') or
      (Length(lTimeZoneName) = 0) then
     // Assume UTC
     lTimeZoneIndex := 0
    else
     begin
      lProceed := False;
      if Length(lTimeZoneName) = 3 then
       begin
        for I := 0 to Length(ZoneArray) - 1 do
         begin
          if ZoneArray[I] = lTimeZoneName then
           begin
            // Found
            lTimeZoneIndex := I;
            lProceed := True;
            Break;
           end;
         end;
       end;

      if not lProceed then
       begin
        // Try the ones with only 2 letters
        for I := 0 to Length(ZoneArray) - 1 do
         begin
          if ZoneArray[I] = Copy(lTimeZoneName, 1, 2) then
           begin
            // Found
            lTimeZoneIndex := I;
            lProceed := True;
            Break;
           end;
         end;
       end;

      if not lProceed then
       begin
        // Try the ones with only 1 letter
        for I := 0 to Length(ZoneArray) - 1 do
         begin
          if ZoneArray[I] = lTimeZoneName[1] then
           begin
            // Found
            lTimeZoneIndex := I;
            lProceed := True;
            Break;
           end;
         end;
       end;

      Inc(lTmp, Length(ZoneArray[lTimeZoneIndex])); // Begin of + / -
     end;
   end;

  if lProceed then
   begin
    // Get local differential hours
    lAddLocalDiff := Copy(lString, lTmp, 1) = '+';
    Inc(lTmp, 1); // Begin of local diff hours
    if lTmp < Length(lString) then
     begin
      // Has local differential hours
      if not TryStrToInt(Copy(lString, lTmp, 2), lLocalDiffHours) then
       lProceed := False;
     end
    else
     begin
      // No local diff time
      lLocalDiffHours := -1;
      lLocalDiffMinutes := -1;
     end;
   end;

  if (lProceed) and (lLocalDiffHours <> -1) then
   begin
     // Get local differential minutes
    Inc(lTmp, 2); // Begin of local diff minutes
    if not TryStrToInt(Copy(lString, lTmp, 2), lLocalDiffMinutes) then
     lProceed := False;
   end;

  if lProceed then
   begin
    // Create current local time of string as TDateTime
    lLocalStringTime := EncodeDate(lYear, lMonth, lDay) + EncodeTime(lHours, lMinutes, lSeconds, 0);
    case lTimeZoneIndex of
      0, 1, 10: lTmp := 0; // UT, GMT, Z
      2: lTmp := 5; // EST, - 5
      3: lTmp := 4; // EDT, - 4
      4: lTmp := 6; // CST, - 6
      5: lTmp := 5; // CDT, - 5
      6: lTmp := 7; // MST, - 7
      7: lTmp := 6; // MDT, - 6
      8: lTmp := 8; // PST, - 8
      9: lTmp := 7; // PDT, - 7
      11: lTmp := 1; // A, - 1
      12: lTmp := 12; // M, - 12
      13: lTmp := -1; // N, + 1
      14: lTmp := -12; // Y, + 12
    end;

    // Calculate the UTC-Time of the given string
    lLocalStringTime := lLocalStringTime + (lTmp * OneHour);
    if lLocalDiffHours <> -1 then
     begin
      if lAddLocalDiff then
       lLocalStringTime := lLocalStringTime - (lLocalDiffHours * OneHour) - (lLocalDiffMinutes * OneMinute)
      else
       lLocalStringTime := lLocalStringTime + (lLocalDiffHours * OneHour) + (lLocalDiffMinutes * OneMinute);
     end;

    // Now calculate the time in local format
    if GetTimeZoneInformation(lTimeZone) = TIME_ZONE_ID_DAYLIGHT then
     Result := lLocalStringTime - ((lTimeZone.Bias + lTimeZone.DaylightBias) * OneMinute)
    else
     Result := lLocalStringTime - ((lTimeZone.Bias + lTimeZone.StandardBias) * OneMinute);
   end
  else
   raise EConvertError.Create(Format(RFC822ConvertDateTimeConvertError, [RFC822DateTime]));
end;

class function TDateTimeFunctions.IdentifyDateSeparator(Format: String): Char;
var
  i: Integer;
begin
  Result := '/';
  for i := 1 to Length(Format) do
   begin
    if not TStringFunctions.IsLetter(Format[i]) and not TStringFunctions.IsNumber(Format[i]) then
     begin
      Result := Format[i];
      Break;
     end;
   end;
end;

class function TDateTimeFunctions.IntYear(data: TDateTime): integer;
begin
  Result := YearOf(data);
end;

class function TDateTimeFunctions.ParseDate(StrDate, Format: String): TDateTime;
var
  stlFormat, stlDate: TStringList;
  DateSeparator: Char;
  i, iDia, iMes, iAno: Integer;
begin
  iDia := DayOf(Now);
  iMes := MonthOf(Now);
  iAno := YearOf(Now);

  if TStringFunctions.Vazio(Format) then
   Format := FormatSettings.ShortDateFormat;

  DateSeparator := TDateTimeFunctions.IdentifyDateSeparator(Format);

  stlFormat := TStringFunctions.Aparse(Format, DateSeparator, True);
  stlDate   := TStringFunctions.Aparse(StrDate, DateSeparator, True);

  try
   for i := 0 to stlFormat.Count-1 do
    begin
     if TStringFunctions.SeExiste('d', LowerCase(stlFormat[i])) then
      iDia := StrToIntDef(stlDate[i], 1)
     else if TStringFunctions.SeExiste('m', LowerCase(stlFormat[i])) then
      iMes := StrToIntDef(stlDate[i], 1)
     else if TStringFunctions.SeExiste('y', LowerCase(stlFormat[i])) then
      iAno := StrToIntDef(stlDate[i], 1989);
    end;

    Result := EncodeDate(iAno, iMes, iDia);
  finally
   stlFormat.Free;
   stlDate.Free;
  end;
end;

{------------------------------------------------------------------------------------------}
{ Retorna o mes de uma string MM/AAAA ou MM/AA (MesAno) - com máscara }
class function TDateTimeFunctions.ValMes(const MesAno: string): integer;
begin
  Result := StrToInt(Copy(MesAno, 1, 2));
end;
{------------------------------------------------------------------------------------------}


{------------------------------------------------------------------------------------------}
{ Retorna o ano de uma string MM/AAAA ou MM/AA (MesAno) - com máscara }
class function TDateTimeFunctions.ValAno(const MesAno: string): integer;
var
  s: string;
begin
  s := TStringFunctions.CopyEnd(TStringFunctions.ExtractNotNumbers(MesAno), 3);
  case Length(s) of
    1: s := '0' + s;
    3: s := '1' + s;
  end;
  if Length(s) = 2 then
    s := IfThen(StrToInt(s) < 50, '20', '19') + s;
  Result := StrToInt(s);
end;

end.
