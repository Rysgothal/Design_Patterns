unit Flyweight.Interfaces.Flyweight;

interface

type
  ICartao = interface
    procedure SetNomeLeitor(const pValor: string);
    procedure Exportar;
    property NomeLeitor: string write SetNomeLeitor;
  end;

implementation

end.
