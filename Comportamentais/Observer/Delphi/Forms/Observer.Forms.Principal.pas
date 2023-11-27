unit Observer.Forms.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Observer.Forms.ObserverAgrupamento, Observer.Forms.ObserverLog,
  Observer.Forms.ObserverSaldo, Observer.Forms.ConcreteSubject, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    FrameCadastroOperacoes: TFrameCadastroOperacoes;
    FrameSaldo: TFrameSaldo;
    FrameLog: TFrameLog;
    FrameAgrupamento: TFrameAgrupamento;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FrameCadastroOperacoes.AdicionarObserver(FrameSaldo);
  FrameCadastroOperacoes.AdicionarObserver(FrameAgrupamento);
  FrameCadastroOperacoes.AdicionarObserver(FrameLog);
end;

end.
