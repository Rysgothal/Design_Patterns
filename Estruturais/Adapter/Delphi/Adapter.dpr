program Adapter;

uses
  Vcl.Forms,
  Adapter.Forms.Principal in 'Forms\Adapter.Forms.Principal.pas' {frmPrincipal},
  Adapter.Interfaces.WebService in 'Interfaces\Adapter.Interfaces.WebService.pas',
  Adapter.Classes.Adapter in 'Classes\Adapter.Classes.Adapter.pas',
  Adapter.Classes.Comunicador in 'Classes\Adapter.Classes.Comunicador.pas',
  Adapter.Classes.WebServiceCorreios in 'Classes\Adapter.Classes.WebServiceCorreios.pas',
  Adapter.Classes.WebServiceDL_Correios in 'Classes\Adapter.Classes.WebServiceDL_Correios.pas',
  Adapter.Classes.WebServiceViaCEP in 'Classes\Adapter.Classes.WebServiceViaCEP.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
