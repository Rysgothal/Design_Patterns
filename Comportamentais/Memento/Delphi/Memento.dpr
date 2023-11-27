program Memento;

uses
  Vcl.Forms,
  Memento.Forms.Principal in 'Forms\Memento.Forms.Principal.pas' {frmPrincipal},
  Memento.Classes.Caretaker in 'Classes\Memento.Classes.Caretaker.pas',
  Memento.Classes.Memento in 'Classes\Memento.Classes.Memento.pas',
  Memento.Classes.Originator in 'Classes\Memento.Classes.Originator.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
