unit UIntegracaoDadosCliente;

interface

uses System.Classes, UConsultaReceitaFederal, UConsultaCep;

Type
  TDadosCliente = record
    RazaoSocial: String;
    Inscricao: String;
    Endereco: String;
    Bairro: String;
    Cidade: String;
    UF: String;
    CEP: String;
    Telefone: String;
    Data: String;

    procedure Free;
  end;

  TIntegracaoDadosCliente = class(TComponent)
   private
   public
    function ObterDadosClienteApartirDoCNPJ(const Inscricao: String): TDadosCliente;
    function ObterDadosClienteApartirDoCPF(const Inscricao: String): TDadosCliente;
    function ObterDadosClienteApartirDoCep(const Cep: String): TDadosCliente;
  end;

implementation

uses StrUtils, superobject, UStringFunctions;

{ TIntegracaoDadosCliente }

function TIntegracaoDadosCliente.ObterDadosClienteApartirDoCep(
  const Cep: String): TDadosCliente;
var
  ConsultaCep: TConsultaCep;
  JsonString: String;
  objResposta: ISuperObject;
  FCep: String;
begin
  FCep := TStringFunctions.ExtractNotNumbers(Cep);

  ConsultaCep := TConsultaCep.Create(Self, FCep);

  try
   JsonString := ConsultaCep.ObtemDadosEmpresaPortalViaCep(FCep);

   Result.Cep := Cep;

   if (JsonString <> '') then
    begin
     objResposta := SO(JsonString);

     if (objResposta.S['logradouro'] <> '') then
      Result.Endereco := objResposta.S['logradouro'];

     if (objResposta.S['bairro'] <> '') then
      Result.Bairro := objResposta.S['bairro'];

     if (objResposta.S['localidade'] <> '') then
      Result.Cidade := objResposta.S['localidade'];

     if (objResposta.S['uf'] <> '') then
      Result.UF := objResposta.S['uf'];
    end;
  finally
   ConsultaCep.Free;
  end;

end;

function TIntegracaoDadosCliente.ObterDadosClienteApartirDoCNPJ(const Inscricao: String): TDadosCliente;
var
  ConsultaReceitaFederal: TConsultaReceitaFederal;
  JsonString: String;
  objResposta: ISuperObject;
  FInscricao: String;
begin
  FInscricao := TStringFunctions.ExtractNotNumbers(Inscricao);

  ConsultaReceitaFederal := TConsultaReceitaFederal.Create(Self, FInscricao);

  try
   JsonString := ConsultaReceitaFederal.ObtemDadosEmpresaPortalReceitaFederal(FInscricao, 90);

   Result.Inscricao := Inscricao;

   if (JsonString <> '') then
    begin
     objResposta := SO(JsonString);

     if (objResposta.S['nome'] <> '') then
      Result.RazaoSocial := objResposta.S['nome'];

     if (objResposta.S['logradouro'] <> '') then
      Result.Endereco := objResposta.S['logradouro'];

     if (objResposta.S['bairro'] <> '') then
      Result.Bairro := objResposta.S['bairro'];

     if (objResposta.S['municipio'] <> '') then
      Result.Cidade := objResposta.S['municipio'];

     if (objResposta.S['uf'] <> '') then
      Result.UF := objResposta.S['uf'];

     if (objResposta.S['cep'] <> '') then
      Result.CEP := objResposta.S['cep'];

      if (objResposta.S['telefone'] <> '') then
      Result.Telefone := objResposta.S['telefone'];

      if (objResposta.S['abertura'] <> '') then
      Result.Data := objResposta.S['abertura'];
    end;
  finally
   ConsultaReceitaFederal.Free;
  end;
end;

function TIntegracaoDadosCliente.ObterDadosClienteApartirDoCPF(const Inscricao: String): TDadosCliente;
var
  ConsultaReceitaFederal: TConsultaReceitaFederal;
  JsonString: String;
  objResposta: ISuperObject;
  FInscricao: String;
begin
  FInscricao := TStringFunctions.ExtractNotNumbers(Inscricao);

  ConsultaReceitaFederal := TConsultaReceitaFederal.Create(Self, FInscricao);

  try
   JsonString := ConsultaReceitaFederal.ObtemDadosEmpresaPortalReceitaFederal(FInscricao, 90);

   Result.Inscricao := Inscricao;

   if (JsonString <> '') then
    begin
     objResposta := SO(JsonString);

     if (objResposta.S['nome'] <> '') then
      Result.RazaoSocial := objResposta.S['nome'];

     if (objResposta.S['logradouro'] <> '') then
      Result.Endereco := objResposta.S['logradouro'];

     if (objResposta.S['bairro'] <> '') then
      Result.Bairro := objResposta.S['bairro'];

     if (objResposta.S['municipio'] <> '') then
      Result.Cidade := objResposta.S['municipio'];

     if (objResposta.S['uf'] <> '') then
      Result.UF := objResposta.S['uf'];

     if (objResposta.S['cep'] <> '') then
      Result.CEP := objResposta.S['cep'];

      if (objResposta.S['telefone'] <> '') then
      Result.Telefone := objResposta.S['telefone'];

      if (objResposta.S['abertura'] <> '') then
      Result.Data := objResposta.S['abertura'];
    end;
  finally
   ConsultaReceitaFederal.Free;
  end;
end;
{ TDadosCliente }

procedure TDadosCliente.Free;
begin

end;

end.
