unit Visitor.Classes.ConcreteElementProgramador;

interface

uses
  Visitor.Classes.ConcreteElement;

type
  TProgramador = class(TFuncionario)
  public
    procedure Accept(pVisitor: IInterface); override;
  end;

implementation

uses
  System.SysUtils, Visitor.Interfaces.Visitor;

{ TProgramador }

procedure TProgramador.Accept(pVisitor: IInterface);
var
  lConcreteVisitor: IVisitor;
begin
  // Aplica um typecasting do parâmetro para o tipo IVisitor
  lConcreteVisitor := (pVisitor) as IVisitor;

  // Chama o método "Visit" do Concrete Visitor, enviando a própria instância como parâmetro.
  // Essa instância é o que indicará qual sobrecarga do método "Visit" será chamado.
  lConcreteVisitor.Visit(Self);
end;

end.
