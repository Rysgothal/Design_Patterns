program Builder;

uses
  Vcl.Forms,
  Builder.Forms.Principal in 'Forms\Builder.Forms.Principal.pas' {frmPrincipal},
  Builder.Classes.Produto in 'Classes\Builder.Classes.Produto.pas',
  Builder.Interfaces.Builder in 'Interfaces\Builder.Interfaces.Builder.pas',
  Builder.Classes.Diretor in 'Classes\Builder.Classes.Diretor.pas',
  Builder.Classes.Builder in 'Classes\Builder.Classes.Builder.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
