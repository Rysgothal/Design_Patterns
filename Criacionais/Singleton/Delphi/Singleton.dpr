program Singleton;

uses
  Vcl.Forms,
  Singleton.Classes.Logs in 'Classes\Singleton.Classes.Logs.pas',
  Singleton.Forms.Cadastro in 'Forms\Singleton.Forms.Cadastro.pas' {frmCadastro},
  Singleton.Forms.Sorteio in 'Forms\Singleton.Forms.Sorteio.pas' {frmSorteio},
  Singleton.Forms.Principal in 'Forms\Singleton.Forms.Principal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
