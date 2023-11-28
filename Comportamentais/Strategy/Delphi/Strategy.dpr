program Strategy;

uses
  Vcl.Forms,
  Strategy.Interfaces.Strategy in 'Interfaces\Strategy.Interfaces.Strategy.pas',
  Strategy.Classes.StrategyDLL in 'Classes\Strategy.Classes.StrategyDLL.pas',
  Strategy.Classes.ConcreteStrategyMailBoxLayer in 'Classes\Strategy.Classes.ConcreteStrategyMailBoxLayer.pas',
  Strategy.Classes.ConcreteStrategyRegExLib in 'Classes\Strategy.Classes.ConcreteStrategyRegExLib.pas',
  Strategy.Classes.Context in 'Classes\Strategy.Classes.Context.pas',
  WebService.RegExLib in 'Classes\WebService.RegExLib.pas',
  View.Formulario in 'Forms\View.Formulario.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
