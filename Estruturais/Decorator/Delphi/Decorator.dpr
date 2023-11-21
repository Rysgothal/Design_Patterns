program Decorator;

uses
  Vcl.Forms,
  Decorator.Forms.Principal in 'Forms\Decorator.Forms.Principal.pas' {frmPrincipal},
  Decorator.Interfaces.Component in 'Interfaces\Decorator.Interfaces.Component.pas',
  Decorator.Classes.ConcreteComponent in 'Classes\Decorator.Classes.ConcreteComponent.pas',
  Decorator.Classes.Decorator in 'Classes\Decorator.Classes.Decorator.pas',
  Decorator.Classes.DecoratorNomeUsuario in 'Classes\Decorator.Classes.DecoratorNomeUsuario.pas',
  Decorator.Classes.DecoratorDataHora in 'Classes\Decorator.Classes.DecoratorDataHora.pas',
  Decorator.Classes.DecoratorVersaoWin in 'Classes\Decorator.Classes.DecoratorVersaoWin.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
