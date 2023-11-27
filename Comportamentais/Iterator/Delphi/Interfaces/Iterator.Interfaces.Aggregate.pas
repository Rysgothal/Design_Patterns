unit Iterator.Interfaces.Aggregate;

interface

uses
  Contnrs, Iterator.Interfaces.Iterator;

type
  IAggregate = interface
    function GetLista: TObjectList;
    function GetIterator: IIterator;
  end;

implementation

end.
