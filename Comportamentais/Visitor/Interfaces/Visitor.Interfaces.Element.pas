unit Visitor.Interfaces.Element;

interface

type
  IElement = interface
    procedure Accept(pVisitor: IInterface); // M�todo que chamar� o Visitor para executar a opera��o
  end;

implementation

end.
