unit FactoryMethod.Interfaces.Criador;

interface

uses
  FactoryMethod.Interfaces.Produto;

type
  IFactoryMethod = interface
    function ConsultarPrazo(const pPrazo: TModoPrazo): ITipoPrazo;
  end;

implementation

end.
