program Composite;

uses
  Vcl.Forms,
  Composite.Forms.Principal in 'Forms\Composite.Forms.Principal.pas' {frmPrincipal},
  Composite.Interfaces.Component in 'Interfaces\Composite.Interfaces.Component.pas',
  Composite.Classes.Filha in 'Classes\Composite.Classes.Filha.pas',
  Composite.Classes.Composite in 'Classes\Composite.Classes.Composite.pas',
  Composite.Classes.Singleton.Valores in 'Classes\Composite.Classes.Singleton.Valores.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
