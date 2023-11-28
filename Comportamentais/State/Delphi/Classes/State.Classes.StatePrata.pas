unit State.Classes.StatePrata;

interface

uses
  State.Classes.StateBase, State.Helpers.Enumerados;

type
  TStatePrata = class(TStateBase)
  protected
    function ObterValorDesconto: Real; override;
    function ObterValorFrete: Real; override;
    function ObterCategoriaPedido: TCategoriaPedido; override;
  end;

implementation

const
  PORCENTAGEM_DESCONTO = 0.07;
  PORCENTAGEM_FRETE = 0.05;

{ TStatePrata }

function TStatePrata.ObterCategoriaPedido: TCategoriaPedido;
begin
  result := cpPrata;
end;

function TStatePrata.ObterValorDesconto: real;
begin
  Result := FTotalPedido * PORCENTAGEM_DESCONTO;

  if FTotalPedido > 700 then
  begin
    Result := Result * 0.02;
  end;
end;

function TStatePrata.ObterValorFrete: real;
begin
  Result := FTotalPedido * PORCENTAGEM_FRETE;
end;

end.
