unit Iterator.Classes.ConcreteIterator;

interface

uses
  Iterator.Interfaces.Iterator, Iterator.Interfaces.Aggregate, System.Classes, System.Contnrs;

type
  TConcreteIterator = class(TInterfacedObject, IIterator)
  private
    FAggregate: IAggregate;
    FIndice: Integer;
  public
    property Aggregate: IAggregate read FAggregate write FAggregate;
    property Indice: Integer read FIndice write FIndice;
    constructor Create(pAggregate: IAggregate);
    procedure PrimeiroObjeto;
    procedure ProximoObjeto;
    function ObjetoAtual: TObject;
    function FimLista: Boolean;
    function Buscar(const pIndice: Integer): TObject;
  end;

implementation

{ TConcreteIterator }

function TConcreteIterator.Buscar(const pIndice: Integer): TObject;
begin
  Result := FAggregate.GetLista.Items[pIndice];
end;

constructor TConcreteIterator.Create(pAggregate: IAggregate);
begin
  FAggregate := pAggregate;
end;

function TConcreteIterator.FimLista: Boolean;
begin
  Result := Indice = Pred(Aggregate.GetLista.Count);
end;

function TConcreteIterator.ObjetoAtual: TObject;
begin
  Result := Aggregate.GetLista.Items[Indice];
end;

procedure TConcreteIterator.PrimeiroObjeto;
begin
  Indice := 0;
end;

procedure TConcreteIterator.ProximoObjeto;
begin
  Inc(FIndice);
end;

end.
