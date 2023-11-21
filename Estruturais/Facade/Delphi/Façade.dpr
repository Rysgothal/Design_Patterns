program Fa�ade;

uses
  Vcl.Forms,
  Fa�ade.Forms.Principal in 'Forms\Fa�ade.Forms.Principal.pas' {Form1},
  Fa�ade.Classes.SubSystemCotacaoDolar in 'Classes\Fa�ade.Classes.SubSystemCotacaoDolar.pas',
  Fa�ade.Classes.WSDL_BCB in 'Classes\Fa�ade.Classes.WSDL_BCB.pas',
  Fa�ade.Classes.SubSystemCalculoLoja in 'Classes\Fa�ade.Classes.SubSystemCalculoLoja.pas',
  Fa�ade.Classes.SubSystemHistorico in 'Classes\Fa�ade.Classes.SubSystemHistorico.pas',
  Fa�ade.Classes.Facade in 'Classes\Fa�ade.Classes.Facade.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
