unit Command.Classes.VariaveisAmbiente;

interface

uses
  Command.Classes.Reciver, Command.Interfaces.Command;

type
  { Concrete Command }
  TVariaveisAmbiente = class(TInterfacedObject, ICommand)
  private
    FReceiver: TReceiver;
  public
    property Receiver: TReceiver read FReceiver write FReceiver;
    constructor Create(Receiver: TReceiver);
    procedure Execute;
  end;

implementation

{ TVariaveisAmbiente }

constructor TVariaveisAmbiente.Create(Receiver: TReceiver);
begin
  FReceiver := Receiver;
end;

procedure TVariaveisAmbiente.Execute;
begin
  Receiver.ExtrairVariaveisAmbiente;
end;

end.
