unit Observer.Interfaces.Notificacao;

interface

uses
  Observer.Classes.Notificacao;

type
  IObserver = interface
    procedure Atualizar(pNotificacao: TNotificacao);
  end;

implementation

end.
