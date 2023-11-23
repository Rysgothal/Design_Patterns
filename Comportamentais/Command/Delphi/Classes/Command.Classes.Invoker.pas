unit Command.Classes.Invoker;

interface

uses
  System.Classes, Command.Interfaces.Command;

type
  { Invoker }
  TInvoker = class
  private
    FComandos: TInterfaceList;
  public
    property Comandos: TInterfaceList read FComandos write FComandos;
    constructor Create;
    procedure Add(Comando: ICommand);
    procedure ExtrairInformacoes;
  end;

implementation

{ TInvoker }

procedure TInvoker.Add(Comando: ICommand);
begin
  Comandos.Add(Comando);
end;

constructor TInvoker.Create;
begin
  FComandos := TInterfaceList.Create;
end;

procedure TInvoker.ExtrairInformacoes;
begin
  for var lComando in Comandos do
  begin
    ICommand(lComando).Execute;
  end;
end;

end.
