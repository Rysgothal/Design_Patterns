unit Adapter.Interfaces.WebService;

interface

type
  IWebServiceViaCep = interface
    procedure ConsultarEnderecoWebService(const pCep: string);
    function ObterLogradouro: string;
    function ObterBairro: string;
    function ObterCidade: string;
  end;

implementation

end.
