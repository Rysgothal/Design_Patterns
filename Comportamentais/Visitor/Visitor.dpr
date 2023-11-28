program Visitor;

uses
  Vcl.Forms,
  Visitor.Interfaces.Element in 'Interfaces\Visitor.Interfaces.Element.pas',
  Visitor.Interfaces.Visitor in 'Interfaces\Visitor.Interfaces.Visitor.pas',
  Visitor.Classes.ConcreteElementGerente in 'Classes\Visitor.Classes.ConcreteElementGerente.pas',
  Visitor.Classes.ConcreteElementProgramador in 'Classes\Visitor.Classes.ConcreteElementProgramador.pas',
  Visitor.Classes.ConcreteElement in 'Classes\Visitor.Classes.ConcreteElement.pas',
  Visitor.Classes.ConcreteVisitorSalario in 'Classes\Visitor.Classes.ConcreteVisitorSalario.pas',
  Visitor.Classes.ConcreteVisitorSenioridade in 'Classes\Visitor.Classes.ConcreteVisitorSenioridade.pas',
  Visitor.Forms.Principal in 'Forms\Visitor.Forms.Principal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
