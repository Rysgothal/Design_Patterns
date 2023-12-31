unit Visitor.Classes.ConcreteElementGerente;

interface

uses
  Visitor.Classes.ConcreteElement;

type
  TGerente = class(TFuncionario)
  public
    procedure Accept(pVisitor: IInterface); override;
  end;

implementation

uses
  System.SysUtils, Visitor.Interfaces.Visitor;

{ TGerente }

procedure TGerente.Accept(pVisitor: IInterface);
var
  lConcreteVisitor: IVisitor;
begin
  // Aplica um typecasting do par�metro para o tipo IVisitor
  lConcreteVisitor := pVisitor as IVisitor;

  // Chama o m�todo "Visit" do Concrete Visitor, enviando a pr�pria inst�ncia como par�metro.
  // Essa inst�ncia � o que indicar� qual sobrecarga do m�todo "Visit" ser� chamado.
  lConcreteVisitor.Visit(Self);
end;

end.
