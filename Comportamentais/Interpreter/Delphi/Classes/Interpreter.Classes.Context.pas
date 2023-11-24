unit Interpreter.Classes.Context;

interface

type
  TContext = class
  private
    FEntrada: string;
    FSaida: string;
  public
    property Entrada: string read FEntrada write FEntrada;
    property Saida: string read FSaida write FSaida;
  end;

implementation

end.
