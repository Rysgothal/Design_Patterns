program Command;

uses
  Vcl.Forms,
  Command.Classes.Reciver in 'Classes\Command.Classes.Reciver.pas',
  Command.Classes.Invoker in 'Classes\Command.Classes.Invoker.pas',
  Command.Interfaces.Command in 'Interfaces\Command.Interfaces.Command.pas',
  Command.Classes.Processos in 'Classes\Command.Classes.Processos.pas',
  Command.Classes.Programas in 'Classes\Command.Classes.Programas.pas',
  Command.Classes.VariaveisAmbiente in 'Classes\Command.Classes.VariaveisAmbiente.pas',
  Command.Forms.Principal in 'Forms\Command.Forms.Principal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
