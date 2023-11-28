unit State.Classes.StateOuro;

interface

uses
  State.Classes.StateBase, State.Helpers.Enumerados;

type
  TStateOuro = class(TStateBase)
  protected
    function ObterValorDesconto: Real; override;
    function ObterValorFrete: Real; override;
    function ObterCategoriaPedido: TCategoriaPedido; override;
  end;

implementation

const
  PORCENTAGEM_FRETE = 0.02;
  DESCONTO_PADRAO = 0.08;
  DESCONTO_PREMIUM = 0.1;

{ TStateOuro }

function TStateOuro.ObterCategoriaPedido: TCategoriaPedido;
begin
  Result := cpOuro;
end;

function TStateOuro.ObterValorDesconto: real;
begin
  Result := TotalPedido * DESCONTO_PADRAO;
  Result := Result * DESCONTO_PREMIUM;
end;

function TStateOuro.ObterValorFrete: real;
begin
  Result := 0;

  if TotalPedido > 2000 then
  begin
    Exit;
  end;

  Result := TotalPedido * PORCENTAGEM_FRETE;
end;

end.
