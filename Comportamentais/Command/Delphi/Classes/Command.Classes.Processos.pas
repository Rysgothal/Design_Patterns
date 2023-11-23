unit Command.Classes.Processos;

interface

uses
  Command.Interfaces.Command, Command.Classes.Reciver;

type
  { Concrete Command }
  TProcessos = class(TInterfacedObject, ICommand)
  private
    FReceiver: TReceiver;
  public
    property Receiver: TReceiver read FReceiver write FReceiver;
    constructor Create(Receiver: TReceiver);
    procedure Execute;
  end;

implementation

{ TProcessos }

constructor TProcessos.Create(Receiver: TReceiver);
begin
  FReceiver := Receiver;
end;

procedure TProcessos.Execute;
begin
  Receiver.ExtrairProcessos;
end;

end.
