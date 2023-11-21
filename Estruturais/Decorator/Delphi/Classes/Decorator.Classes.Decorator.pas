unit Decorator.Classes.Decorator;

interface

uses
  Decorator.Interfaces.Component;

type
  TDecorator = class(TInterfacedObject, ILogExcecao)
  protected
    FLogExcecao: ILogExcecao;
  public
    property LogExcecao: ILogExcecao read FLogExcecao write FLogExcecao;
    constructor Create(pLogExcecao: ILogExcecao);
    function ObterDadosExcecao: string;
  end;

implementation

{ TDecorator }

constructor TDecorator.Create(pLogExcecao: ILogExcecao);
begin
  Self.LogExcecao := pLogExcecao;
end;

function TDecorator.ObterDadosExcecao: string;
begin
  Result := LogExcecao.ObterDadosExcecao;
  Result := Result + sLineBreak + #10;
end;

end.
