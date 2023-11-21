program Façade;

uses
  Vcl.Forms,
  Façade.Forms.Principal in 'Forms\Façade.Forms.Principal.pas' {Form1},
  Façade.Classes.SubSystemCotacaoDolar in 'Classes\Façade.Classes.SubSystemCotacaoDolar.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
