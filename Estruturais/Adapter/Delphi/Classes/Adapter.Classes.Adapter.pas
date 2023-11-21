unit Adapter.Classes.Adapter;

interface

uses
  Classes, SysUtils, Adapter.Interfaces.WebService,
  Adapter.Classes.WebServiceCorreios;

type
  TAdapter = class(TInterfacedObject, IWebServiceViaCEP)
  private
    FWebServiceCorreios: TWebServiceCorreios;
  public
    property WebServiceCorreios: TWebServiceCorreios read FWebServiceCorreios write FWebServiceCorreios;
    constructor Create(pWebServiceCorreios: TWebServiceCorreios);
    procedure ConsultarEnderecoWebService(const pCEP: string);
    function ObterLogradouro: string;
    function ObterBairro: string;
    function ObterCidade: string;       
  end;

implementation

{ TAdapter }

procedure TAdapter.ConsultarEnderecoWebService(const pCEP: string);
begin
  WebServiceCorreios.DefinirParametrosConsulta(pCEP);
  WebServiceCorreios.ConsultarCEP;
end;

constructor TAdapter.Create(pWebServiceCorreios: TWebServiceCorreios);
begin
  Self.WebServiceCorreios := pWebServiceCorreios;
end;

function TAdapter.ObterBairro: string;
begin
  Result := WebServiceCorreios.ObterResposta('Bairro');
end;

function TAdapter.ObterCidade: string;
begin
  Result := WebServiceCorreios.ObterResposta('Cidade');
end;

function TAdapter.ObterLogradouro: string;
begin
  Result := WebServiceCorreios.ObterResposta('Logradouro');
end;

end.
