program TemplateMethod;

uses
  Vcl.Forms,
  TemplateMethod.Classes.Base in 'Classes\TemplateMethod.Classes.Base.pas',
  TemplateMethod.Classes.Repositorios in 'Classes\TemplateMethod.Classes.Repositorios.pas',
  TemplateMethod.Classes.Usuario in 'Classes\TemplateMethod.Classes.Usuario.pas',
  TemplateMethod.Forms.Principal in 'Forms\TemplateMethod.Forms.Principal.pas' {frmPrincipal},
  TemplateMethod.Classes.GithubJSONUsuario in 'Classes\TemplateMethod.Classes.GithubJSONUsuario.pas',
  TemplateMethod.Classes.GithubJSONRepositorios in 'Classes\TemplateMethod.Classes.GithubJSONRepositorios.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
