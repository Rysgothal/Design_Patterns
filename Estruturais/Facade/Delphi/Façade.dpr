program Façade;

uses
  Vcl.Forms,
  Façade.Forms.Principal in 'Forms\Façade.Forms.Principal.pas' {frmPrincipal},
  Façade.Classes.SubSystemCotacaoDolar in 'Classes\Façade.Classes.SubSystemCotacaoDolar.pas',
  Façade.Classes.WSDL_BCB in 'Classes\Façade.Classes.WSDL_BCB.pas',
  Façade.Classes.SubSystemCalculoLoja in 'Classes\Façade.Classes.SubSystemCalculoLoja.pas',
  Façade.Classes.SubSystemHistorico in 'Classes\Façade.Classes.SubSystemHistorico.pas',
  Façade.Classes.Facade in 'Classes\Façade.Classes.Facade.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
