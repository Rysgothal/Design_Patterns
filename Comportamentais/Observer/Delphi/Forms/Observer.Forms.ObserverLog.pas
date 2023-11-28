unit Observer.Forms.ObserverLog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Observer.Interfaces.Notificacao, Observer.Classes.Notificacao;

type
  TFrameLog = class(TFrame, IObserver)
    lblTitulo: TLabel;
    memLog: TMemo;
  public
    procedure Atualizar(pNotificacao: TNotificacao);
  end;

implementation

{$R *.dfm}

{ TFrameLog }

procedure TFrameLog.Atualizar(pNotificacao: TNotificacao);
var
  TextoLog: string;
begin
  TextoLog := Format('Uma operação de %s de %.2f foi adicionada', [pNotificacao.Operacao, pNotificacao.Valor]);

  memLog.Lines.Add(TextoLog);
end;

end.
