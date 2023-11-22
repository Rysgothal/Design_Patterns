unit Flyweight.Classes.FlyweightFactory;

interface

uses
  System.Classes, Flyweight.Classes.ConcreteFlyweight;

type
  TFlyweightFactory = class
  private
    FListaCartoes: TStringList;
  public
    constructor Create;
    destructor Destroy; override;

    property ListaCartoes: TstringList read FListaCartoes write FListaCartoes;

    // Encontrar e retornar o objeto já criado ou criá-lo caso não exista, adicionando na lista de objetos compartilhados
    function GetCartao(const pPais: string): TCartao;
  end;

implementation

uses
  SysUtils;

{ TFlyweightFactory }

constructor TFlyweightFactory.Create;
begin
  FListaCartoes := TStringList.Create;
  ListaCartoes.Sorted := True;
end;

destructor TFlyweightFactory.Destroy;
begin
  for var I := 0 to Pred(ListaCartoes.Count) do
  begin
    ListaCartoes.Objects[I].Free;
  end;

  FreeAndNil(ListaCartoes);
  inherited;
end;

function TFlyweightFactory.GetCartao(const pPais: string): TCartao;
var
  lIndice: integer;
begin
  Result := nil;

  if ListaCartoes.Find(pPais, lIndice) then
  begin
    Result := (ListaCartoes.Objects[lIndice]) as TCartao;
    Exit;
  end;

  if pPais = 'Espanha' then
  begin
    Result := TCartaoEspanha.Create;
  end else
  if pPais = 'EUA' then
  begin
    Result := TCartaoEUA.Create;
  end else
  if pPais = 'Brasil' then
  begin
    Result := TCartaoBrasil.Create;
  end else
  if pPais = 'Itália' then
  begin
    Result := TCartaoItalia.Create;
  end;

  ListaCartoes.AddObject(pPais, Result);
end;

end.
