unit Visitor.Interfaces.Visitor;

interface

uses
  Visitor.Classes.ConcreteElementProgramador,
  Visitor.Classes.ConcreteElementGerente;

type
  IVisitor = interface
  ['{C047903C-CEB3-4B27-A89F-EBB8EB3A7249}']
    procedure Visit(pProgramador: TProgramador); overload; // O Visitor possui um método sobrecarregado para cada Concrete Element existente
    procedure Visit(pGerente: TGerente); overload;
  end;

implementation

end.
