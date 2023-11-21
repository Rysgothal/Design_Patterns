program Prototype;

uses
  Vcl.Forms,
  Prototype.Forms.Principal in 'Forms\Prototype.Forms.Principal.pas' {Form1},
  Prototype.Classes.Principal in 'Classes\Prototype.Classes.Principal.pas',
  Prototype.Interfaces.Prototype in 'Interfaces\Prototype.Interfaces.Prototype.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
