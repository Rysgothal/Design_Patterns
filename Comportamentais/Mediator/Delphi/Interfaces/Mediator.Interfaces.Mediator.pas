unit Mediator.Interfaces.Mediator;

interface

uses
  Mediator.Interfaces.Colleague;

type
  IMediator = interface
    function AdicionarMembro(pMembro: IColleague): string;
    function RemoverMembro(const pNome: string): string;
    function EnviarProposta(const pRemetente, pDestinatario, pProposta: string): string;
    function ObterMembro(const pNome: string): IColleague;
    function ObterListaMembros: TArray<string>;
    procedure LiberarObjetos;
  end;

implementation

end.
