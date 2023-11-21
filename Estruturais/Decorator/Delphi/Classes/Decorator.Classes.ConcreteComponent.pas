unit Decorator.Classes.ConcreteComponent;

interface

uses
  Decorator.Interfaces.Component, System.SysUtils;

type
  TLogExcecao = class(TInterfacedObject, ILogExcecao)
  private
    FExcecao: Exception;
  public
    property Excecao: Exception read FExcecao write FExcecao;
    constructor Create(pExcecao: Exception);
    function ObterDadosExcecao: string;
  end;

implementation

{ TLogExcecao }

constructor TLogExcecao.Create(pExcecao: Exception);
begin
  Self.Excecao := pExcecao;
end;

function TLogExcecao.ObterDadosExcecao: string;
begin
  Result := 'Mesnagem: ' + Excecao.Message;
end;

end.
