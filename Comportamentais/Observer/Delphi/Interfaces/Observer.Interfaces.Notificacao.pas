unit Observer.Interfaces.Notificacao;

interface

uses
  Model.Notificacao;

type
  IObserver = interface
    procedure Atualizar(pNotificacao: TNotificacao);
  end;

implementation

end.
