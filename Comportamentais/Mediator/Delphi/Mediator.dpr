program Mediator;

uses
  Vcl.Forms,
  Mediator.Interfaces.Colleague in 'Interfaces\Mediator.Interfaces.Colleague.pas',
  Mediator.Interfaces.Mediator in 'Interfaces\Mediator.Interfaces.Mediator.pas',
  Mediator.Classes.ConcreteMediator in 'Classes\Mediator.Classes.ConcreteMediator.pas',
  Mediator.Classes.ConcreteColleague in 'Classes\Mediator.Classes.ConcreteColleague.pas',
  Mediator.Forms.Principal in 'Forms\Mediator.Forms.Principal.pas' {frmPrincipal},
  Mediator.Forms.CadastroMembro in 'Forms\Mediator.Forms.CadastroMembro.pas' {frmCadastroCliente},
  Mediator.Classes.ColleagueAdministrador in 'Classes\Mediator.Classes.ColleagueAdministrador.pas',
  Mediator.Classes.ColleagueUsuario in 'Classes\Mediator.Classes.ColleagueUsuario.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastroCliente, frmCadastroCliente);
  Application.Run;
end.
