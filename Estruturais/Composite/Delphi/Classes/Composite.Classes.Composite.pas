unit Composite.Classes.Composite;

interface

uses
  Composite.Interfaces.Component, System.Generics.Collections, Composite.Classes.Filha;

type
  TPacoteViagem = class(TInterfacedObject, IViagem)
  private
    FViagens: TObjectList<TViagem>;
  public
    property Viagens: TObjectList<TViagem> read FViagens write FViagens;
    constructor Create;

    { Operation }
    function CalcularValor: Double;

    procedure AdicionarViagem(pViagem: TViagem);
  end;
implementation


{ TPacoteViagem }

procedure TPacoteViagem.AdicionarViagem(pViagem: TViagem);
begin
  Viagens.Add(pViagem);
end;

function TPacoteViagem.CalcularValor: Double;
var
  lViagem: TViagem;
begin
  Result := 0;

  for lViagem in Viagens do
  begin
    Result := Result + lViagem.CalcularValor;
  end;
end;

constructor TPacoteViagem.Create;
begin
  FViagens := TObjectList<TViagem>.Create;
end;

end.
