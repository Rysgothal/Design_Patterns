program AbstractFactory;

uses
  Vcl.Forms,
  AbstractFactory.Forms.Principal in 'Forms\AbstractFactory.Forms.Principal.pas' {frmPrincipal},
  AbstractFactory.Interfaces.Principal in 'Interfaces\AbstractFactory.Interfaces.Principal.pas',
  AbstractFactory.Classes.Principal in 'Classes\AbstractFactory.Classes.Principal.pas',
  AbstractFactory.Classes.Notebook in 'Classes\AbstractFactory.Classes.Notebook.pas',
  AbstractFactory.Classes.Desktop in 'Classes\AbstractFactory.Classes.Desktop.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
