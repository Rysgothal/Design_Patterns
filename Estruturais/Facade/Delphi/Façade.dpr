program Fa�ade;

uses
  Vcl.Forms,
  Fa�ade.Forms.Principal in 'Forms\Fa�ade.Forms.Principal.pas' {Form1},
  Fa�ade.Classes.SubSystemCotacaoDolar in 'Classes\Fa�ade.Classes.SubSystemCotacaoDolar.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
