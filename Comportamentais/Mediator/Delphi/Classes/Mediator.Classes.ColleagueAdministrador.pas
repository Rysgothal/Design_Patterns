unit Mediator.Classes.ColleagueAdministrador;

interface

uses
  Mediator.Interfaces.Colleague, Mediator.Interfaces.Mediator;

type
  TColleagueAdministrador = class(TInterfacedObject, IColleague)
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

{ TColleagueAdministrador }

constructor TColleagueAdministrador.Create(const pNome: string; pMediator: IMediator);
begin
  FNome := pNome;
  FMediator := pMediator;
end;

function TColleagueAdministrador.ObterNome: string;
begin
  Result := Nome;
end;

function TColleagueAdministrador.Entrar: string;
begin
  Result := Mediator.AdicionarMembro(Self);
end;

function TColleagueAdministrador.Sair: string;
begin
  Result := 'Administradores não podem ser removidos.';
end;

function TColleagueAdministrador.EnviarProposta(const pDestinatario, pProposta: string): string;
begin
  Result := '[ADM] ' + Mediator.EnviarProposta(Self.ObterNome, pDestinatario, pProposta);
end;

function TColleagueAdministrador.ReceberProposta(const pRemetente, pProposta: string): string;
begin
  Result := Format('De [%s] para [%s]: Erro: Não é possível enviar mensagens aos administradores. ',
    [pRemetente, Self.ObterNome]);
end;

end.
