unit Visitor.Interfaces.Element;

interface

type
  IElement = interface
    procedure Accept(pVisitor: IInterface); // Método que chamará o Visitor para executar a operação
  end;

implementation

end.
