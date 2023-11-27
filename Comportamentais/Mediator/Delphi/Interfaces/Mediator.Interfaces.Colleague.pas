unit Mediator.Interfaces.Colleague;

interface

type
  IColleague = interface
    function EnviarProposta(const pDestinatario, pProposta: string): string;
    function ReceberProposta(const pRemetente, pProposta: string): string;
    function ObterNome: string;
    function Entrar: string;
    function Sair: string;
  end;

implementation

end.
