unit State.Classes.StateBronze;

interface

uses
  State.Classes.StateBase, State.Helpers.Enumerados;

type
  TStateBronze = class(TStateBase)
  protected
    function ObterValorDesconto: Real; override;
    function ObterValorFrete: Real; override;
    function ObterCategoriaPedido: TCategoriaPedido; override;
  end;
implementation

const
  PORCENTAGEM_DESCONTO = 0.05;
  PORCENTAGEM_FRETE = 0.06;

{ TStateBronze }

function TStateBronze.ObterCategoriaPedido: TCategoriaPedido;
begin
  Result := cpBronze;
end;

function TStateBronze.ObterValorDesconto: real;
begin
  Result := 0;

  if TotalPedido <= 200 then
  begin
    Exit;
  end;

  Result := TotalPedido * PORCENTAGEM_DESCONTO;
end;

function TStateBronze.ObterValorFrete: real;
begin
  Result := TotalPedido * PORCENTAGEM_FRETE;
end;

end.
