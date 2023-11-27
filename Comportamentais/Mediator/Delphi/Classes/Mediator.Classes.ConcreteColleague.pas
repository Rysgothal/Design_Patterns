unit Mediator.Classes.ConcreteColleague;

interface

implementation

uses
  Mediator.Interfaces.Colleague, Mediator.Interfaces.Mediator, System.SysUtils;

type
  TConcreteColleague = class(TInterfacedObject, IColleague)
  private
    FNome: string;
    FMediator: IMediator;
  public
    property Nome: string read FNome write FNome;
    property Mediator: IMediator read FMediator write FMediator;
    constructor Create(const pNome: string; pMediator: IMediator);
    function EnviarProposta(const pDestinatario, pProposta: string): string;
    function ReceberProposta(const pRemetente, pProposta: string): string;
    function ObterNome: string;
    function Entrar: string;
    function Sair: string;
  end;

{ TConcreteColleague }

constructor TConcreteColleague.Create(const pNome: string; pMediator: IMediator);
begin
  FNome := pNome;
  FMediator := pMediator;
end;

function TConcreteColleague.ObterNome: string;
begin
  Result := Nome;
end;

function TConcreteColleague.Entrar: string;
begin
  Result := Mediator.AdicionarMembro(Self);
end;

function TConcreteColleague.Sair: string;
begin
  Result := Mediator.RemoverMembro(Self.ObterNome);
end;

function TConcreteColleague.EnviarProposta(const pDestinatario, pProposta: string): string;
begin
  Result := Mediator.EnviarProposta(Self.ObterNome, pDestinatario, pProposta);
end;

function TConcreteColleague.ReceberProposta(const pRemetente, pProposta: string): string;
begin
  Result := Format('De [%s] para [%s]: %s', [pRemetente, Self.ObterNome, pProposta]);
end;

end.
