unit FactoryMethod.Classes.CriadorConcreto;

interface

uses
  FactoryMethod.Interfaces.Produto, FactoryMethod.Interfaces.Criador;

type
  TFabricaPrazos = class(TInterfacedObject, IFactoryMethod)
    function ConsultarPrazo(const pPrazo: TModoPrazo): ITipoPrazo;
  end;

implementation

uses
  FactoryMethod.Classes.ProdutoConcreto;

{ TFabricaPrazos }

function TFabricaPrazos.ConsultarPrazo(const pPrazo: TModoPrazo): ITipoPrazo;
begin
  case pPrazo of
    mpMensal: Result := TPrazoMensal.Create;
    mpAnual: Result := TPrazoAnual.Create;
    mpSemestral: Result := TPrazoSemestral.Create;
  end;
end;

end.
