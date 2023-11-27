unit Mediator.Classes.ColleagueUsuario;

interface

uses
  Mediator.Interfaces.Colleague, Mediator.Interfaces.Mediator;

type
  TColleagueUsuario = class(TInterfacedObject, IColleague)
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

implementation

uses
  SysUtils;

{ TConcreteColleague }

constructor TColleagueUsuario.Create(const pNome: string; pMediator: IMediator);
begin
  FNome := pNome;
  FMediator := pMediator;
end;

function TColleagueUsuario.ObterNome: string;
begin
  Result := Nome;
end;

function TColleagueUsuario.Entrar: string;
begin
  Result := Mediator.AdicionarMembro(Self);
end;

function TColleagueUsuario.Sair: string;
begin
  Result := Mediator.RemoverMembro(Self.ObterNome);
end;

function TColleagueUsuario.EnviarProposta(const pDestinatario, pProposta: string): string;
begin
  Result := FMediator.EnviarProposta(Self.ObterNome, pDestinatario, pProposta);
end;

function TColleagueUsuario.ReceberProposta(const pRemetente, pProposta: string): string;
begin
  Result := Format('De [%s] para [%s]: %s', [pRemetente, Self.ObterNome, pProposta]);
end;

end.
