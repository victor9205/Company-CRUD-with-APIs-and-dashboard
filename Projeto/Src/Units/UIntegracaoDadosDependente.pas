unit UIntegracaoDadosDependente;

interface

uses System.Classes, UConsultaCep;

Type
  TDadosDependente = record
    Endereco: String;
    Bairro: String;
    Cidade: String;
    UF: String;
    CEP: String;

  end;

  TIntegracaoDadosDependente = class(TComponent)
   private
   public
    function ObterDadosDependenteApartirDoCep(const Cep: String): TDadosDependente;
  end;

implementation

uses StrUtils, superobject, UStringFunctions;

{ TIntegracaoDadosCliente }

function TIntegracaoDadosDependente.ObterDadosDependenteApartirDoCep(
  const Cep: String): TDadosDependente;
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


{ TDadosCliente }


end.
