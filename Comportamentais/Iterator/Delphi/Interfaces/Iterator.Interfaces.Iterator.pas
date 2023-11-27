unit Iterator.Interfaces.Iterator;

interface

type
  IIterator = interface
    procedure PrimeiroObjeto;
    procedure ProximoObjeto;
    function ObjetoAtual: TObject;
    function FimLista: Boolean;
    function Buscar(const pIndice: Integer): TObject;
  end;

implementation

end.
