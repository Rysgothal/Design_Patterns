program ChainOfResponsibility;

uses
  Vcl.Forms,
  ChainOfResp.Forms.Principal in 'Forms\ChainOfResp.Forms.Principal.pas' {frmPrincipal},
  ChainOfResp.Interfaces.Parser in 'Interfaces\ChainOfResp.Interfaces.Parser.pas',
  ChainOfResp.Classes.ParserCSV in 'Classes\ChainOfResp.Classes.ParserCSV.pas',
  ChainOfResp.Classes.ParserXML in 'Classes\ChainOfResp.Classes.ParserXML.pas',
  ChainOfResp.Classes.ParserJSON in 'Classes\ChainOfResp.Classes.ParserJSON.pas',
  ChainOfResp.Classes.JSON in 'Classes\ChainOfResp.Classes.JSON.pas',
  ChainOfResp.Classes.ParserTXT in 'Classes\ChainOfResp.Classes.ParserTXT.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
