unit Visitor.Classes.ConcreteElement;

interface

uses
  Visitor.Interfaces.Element;

type
  TFuncionario = class(TInterfacedObject, IElement)
  private
    FNome: string;
    FFuncao: string;
    FAdmissao: TDateTime;
    FSalario: real;
    FSenioridade: string;
  public
    property Nome: string read FNome write FNome;
    property Funcao: string read FFuncao write FFuncao;
    property Admissao: TDateTime read FAdmissao write FAdmissao;
    property Salario: real read FSalario write FSalario;
    property Senioridade: string read FSenioridade write FSenioridade;

    // Método que será sobrescrito pelas subclasses (Concrete Elements)
    procedure Accept(pVisitor: IInterface); virtual;
  end;

implementation

{ TFuncionario }

procedure TFuncionario.Accept(pVisitor: IInterface);
begin
  Exit;
end;

end.
