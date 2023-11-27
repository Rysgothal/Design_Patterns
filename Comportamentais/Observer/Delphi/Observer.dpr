program Observer;

uses
  Vcl.Forms,
  Observer.Interfaces.Notificacao in 'Interfaces\Observer.Interfaces.Notificacao.pas',
  Observer.Interfaces.Subject in 'Interfaces\Observer.Interfaces.Subject.pas',
  Model.Notificacao in 'Classes\Model.Notificacao.pas',
  Observer.Forms.ConcreteSubject in 'Forms\Observer.Forms.ConcreteSubject.pas' {FrameCadastroOperacoes: TFrame},
  Observer.Forms.ObserverAgrupamento in 'Forms\Observer.Forms.ObserverAgrupamento.pas' {FrameAgrupamento: TFrame},
  Observer.Forms.ObserverLog in 'Forms\Observer.Forms.ObserverLog.pas' {FrameLog: TFrame},
  Observer.Forms.ObserverSaldo in 'Forms\Observer.Forms.ObserverSaldo.pas' {FrameSaldo: TFrame},
  Observer.Forms.Principal in 'Forms\Observer.Forms.Principal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
