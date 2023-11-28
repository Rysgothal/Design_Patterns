unit Visitor.Classes.ConcreteVisitorSalario;

interface

uses
  Visitor.Interfaces.Visitor, Visitor.Classes.ConcreteElementProgramador,
  Visitor.Classes.ConcreteElementGerente;

type
  TSalario = class(TInterfacedObject, IVisitor)

    // M�todo que ser� invocado quando o objeto do par�metro for da classe TProgramador
    procedure Visit(pProgramador: TProgramador); overload;

    // M�todo que ser� invocado quando o objeto do par�metro for da classe TGerente
    procedure Visit(pGerente: TGerente); overload;
  end;

implementation

uses
  System.SysUtils, DateUtils;

{ TSalario }

procedure TSalario.Visit(pProgramador: TProgramador);
var
  lPorcentagemPorDiaTrabalhado: Real;
begin
  // Aplica um aumento de 6% no sal�rio
  pProgramador.Salario := pProgramador.Salario * 1.06;

  // Aplica um aumento adicional de 0,002% por cada dia trabalhado
  lPorcentagemPorDiaTrabalhado := DaysBetween(Date, pProgramador.Admissao) * 0.002;
  pProgramador.Salario := pProgramador.Salario * (1 + lPorcentagemPorDiaTrabalhado / 100);
end;

procedure TSalario.Visit(pGerente: TGerente);
var
  lQtdeAnosNaEmpresa: byte;
begin
  // Aplica um aumento de 8% no sal�rio
  pGerente.Salario := pGerente.Salario * 1.08;

  lQtdeAnosNaEmpresa := YearsBetween(Date, pGerente.Admissao);

  case lQtdeAnosNaEmpresa of
    2..3:  pGerente.Salario := pGerente.Salario * 1.03; // at� 3 anos: 3%
    4..5:  pGerente.Salario := pGerente.Salario * 1.04; // at� 5 anos: 4%
    6..10: pGerente.Salario := pGerente.Salario * 1.05; // at� 10 anos: 5%
  end;
end;

end.
