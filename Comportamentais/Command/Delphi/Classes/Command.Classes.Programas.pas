unit Command.Classes.Programas;

interface

uses
  Command.Interfaces.Command, Command.Classes.Reciver;

type
  { Concrete Command }
  TProgramas = class(TInterfacedObject, ICommand)
  private
    FReceiver: TReceiver;
  public
    property Receiver: TReceiver read FReceiver write FReceiver;
    constructor Create(Receiver: TReceiver);
    procedure Execute;
  end;

implementation

{ TProgramas }

constructor TProgramas.Create(Receiver: TReceiver);
begin
  FReceiver := Receiver;
end;

procedure TProgramas.Execute;
begin
  Receiver.ExtrairProgramas;
end;

end.
