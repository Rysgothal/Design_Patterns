unit Mediator.Classes.ConcreteMediator;

interface

uses
  Mediator.Interfaces.Mediator, System.Generics.Collections,
  Mediator.Interfaces.Colleague;

type
  TConcreteMediator = class(TInterfacedObject, IMediator)
  private
    FListaMembros: TDictionary<string, IColleague>;
  public
    property ListaMembros: TDictionary<string, IColleague> read FListaMembros write FListaMembros;
    constructor Create;
    function AdicionarMembro(pMembro: IColleague): string;
    function RemoverMembro(const pNome: string): string;
    function EnviarProposta(const pRemetente, pDestinatario, pProposta: string): string;
    function ObterListaMembros: TArray<string>;
    function ObterMembro(const pNome: string): IColleague;
    procedure LiberarObjetos;
  end;

implementation

uses
  SysUtils;

{ TConcreteMediator }

constructor TConcreteMediator.Create;
begin
  FListaMembros := TDictionary<string, IColleague>.Create;
end;

function TConcreteMediator.EnviarProposta(const pRemetente, pDestinatario, pProposta: string): string;
var
  lRemetente, lDestinatario: IColleague;
begin
  lRemetente := ListaMembros.Items[pRemetente];
  lDestinatario := ListaMembros.Items[pDestinatario];
  Result := lDestinatario.ReceberProposta(lRemetente.ObterNome, pProposta);
end;

procedure TConcreteMediator.LiberarObjetos;
begin
  FListaMembros.Free;
end;

function TConcreteMediator.ObterListaMembros: TArray<string>;
begin
  Result := ListaMembros.Keys.ToArray;
end;

function TConcreteMediator.ObterMembro(const pNome: string): IColleague;
begin
  Result := ListaMembros.Items[pNome];
end;

function TConcreteMediator.AdicionarMembro(pMembro: IColleague): string;
begin
  ListaMembros.Add(pMembro.ObterNome, pMembro);
  Result := Format('Membro "%s" entrou.', [pMembro.ObterNome]);
end;

function TConcreteMediator.RemoverMembro(const pNome: string): string;
begin
  FListaMembros.Remove(pNome);
  Result := Format('Membro "%s" saiu.', [pNome]);
end;

end.

