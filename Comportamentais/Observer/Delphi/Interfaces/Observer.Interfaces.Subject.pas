unit Observer.Interfaces.Subject;

interface

uses
  Observer.Interfaces.Notificacao;

type
  ISubject = interface
    procedure AdicionarObserver(pObserver: IObserver);
    procedure RemoverObserver(pObserver: IObserver);
    procedure Notificar;
  end;

implementation

end.
