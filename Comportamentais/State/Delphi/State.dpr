program State;

uses
  Vcl.Forms,
  State.Classes.Context in 'Classes\State.Classes.Context.pas',
  State.Classes.StateBase in 'Classes\State.Classes.StateBase.pas',
  State.Classes.StateBronze in 'Classes\State.Classes.StateBronze.pas',
  State.Classes.StateOuro in 'Classes\State.Classes.StateOuro.pas',
  State.Classes.StatePrata in 'Classes\State.Classes.StatePrata.pas',
  State.Helpers.Enumerados in 'Helpers\State.Helpers.Enumerados.pas',
  State.Interfaces.State in 'Interfaces\State.Interfaces.State.pas',
  State.Forms.Principal in 'Forms\State.Forms.Principal.pas' {fFormulario};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
