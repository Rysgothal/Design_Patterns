unit Adapter.Classes.Comunicador;

interface

uses
  Classes, Adapter.Interfaces.WebService;

type
  { Target }
  TComunicador = class
  private
    FWebServiceViaCEP: IWebServiceViaCEP;
  public
     property WebServiceViaCep: IWebServiceViaCep read FWebServiceViaCep write FWebServiceViaCep;
    constructor Create(pWebServiceViaCEP: IWebServiceViaCEP);
    destructor Destroy; override;
    function ConsultarEndereco(const pCEP: string): TStringList;
  end;

implementation

uses
  SysUtils;

{ TComunicador }

function TComunicador.ConsultarEndereco(const pCEP: string): TStringList;
var
  Dados: TStringList;
begin
  WebServiceViaCEP.ConsultarEnderecoWebService(pCEP);

  Dados := TStringList.Create;
  Dados.Values['Logradouro'] := WebServiceViaCEP.ObterLogradouro;
  Dados.Values['Bairro'] := WebServiceViaCEP.ObterBairro;
  Dados.Values['Cidade'] := WebServiceViaCEP.ObterCidade;

  Result := Dados;
end;

constructor TComunicador.Create(pWebServiceViaCEP: IWebServiceViaCEP);
begin
  Self.WebServiceViaCEP := pWebServiceViaCEP;
end;

destructor TComunicador.Destroy;
begin
  WebServiceViaCEP := nil;
  inherited;
end;

end.
