program Flyweight;

uses
  Vcl.Forms,
  Flyweight.Interfaces.Flyweight in 'Interfaces\Flyweight.Interfaces.Flyweight.pas',
  Flyweight.Classes.ConcreteFlyweight in 'Classes\Flyweight.Classes.ConcreteFlyweight.pas',
  Flyweight.Classes.FlyweightFactory in 'Classes\Flyweight.Classes.FlyweightFactory.pas',
  Flyweigth.Forms.Principal in 'Forms\Flyweigth.Forms.Principal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
