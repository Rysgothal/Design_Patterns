unit Observer.Forms.ObserverSaldo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Model.Notificacao,
  Observer.Interfaces.Notificacao;

type
  TFrameSaldo = class(TFrame, IObserver)
    lblTitulo: TLabel;
    lblCreditos: TLabel;
    lblDebitos: TLabel;
    lblSaldo: TLabel;
    lblValorDebitos: TLabel;
    lblValorCreditos: TLabel;
    lblValorSaldo: TLabel;
  private
    FCreditos: Real;
    FDebitos: Real;
  public
    procedure Atualizar(Notificacao: TNotificacao);
  end;

implementation

{$R *.dfm}

{ TFrameSaldo }

procedure TFrameSaldo.Atualizar(Notificacao: TNotificacao);
var
  lSaldo: real;
begin
  if Notificacao.Operacao = 'Crédito' then
  begin
    FCreditos := FCreditos + Notificacao.Valor
  end else
  if Notificacao.Operacao = 'Débito' then
  begin
    FDebitos := FDebitos + Notificacao.Valor;
  end;

  lSaldo := FCreditos - FDebitos;

  lblValorCreditos.Caption := FormatFloat('###,##0.00', FCreditos);
  lblValorDebitos.Caption := FormatFloat('###,##0.00', FDebitos);
  lblValorSaldo.Caption := FormatFloat('###,##0.00', lSaldo);
end;

end.
