unit Observer.Forms.ObserverAgrupamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient,
  Vcl.ExtCtrls, Observer.Interfaces.Notificacao, Observer.Classes.Notificacao;

type
  TFrameAgrupamento = class(TFrame, IObserver)
    ClientDataSet: TClientDataSet;
    ClientDataSetCategoria: TStringField;
    ClientDataSetTotal: TFloatField;
    DataSource: TDataSource;
    DBGrid: TDBGrid;
    lblTitulo: TLabel;
  public
    procedure Atualizar(Notificacao: TNotificacao);
  end;

implementation

{$R *.dfm}

{ TFrameAgrupamento }

procedure TFrameAgrupamento.Atualizar(Notificacao: TNotificacao);
begin
  if Notificacao.Operacao = 'Crédito' then
  begin
    Exit;
  end;

  if ClientDataSet.Locate('Categoria', Notificacao.Categoria, []) then
  begin
    ClientDataSet.Edit;

    ClientDataSet.FieldByName('Total').AsFloat := ClientDataSet.FieldByName('Total').AsFloat + Notificacao.Valor;

    ClientDataSet.Post;
    ClientDataSet.First;

    Exit;
  end;

  ClientDataSet.AppendRecord([Notificacao.Categoria, Notificacao.Valor]);
end;

end.
