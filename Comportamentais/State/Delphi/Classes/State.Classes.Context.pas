unit State.Classes.Context;

interface

uses
  State.Interfaces.State, State.Helpers.Enumerados;

type
  TContext = class
  private
    FState: IState;
    procedure AlterarEstado;
  public
    property State: IState read FState write FState;
    constructor Create;
    procedure AdicionarItem(const ValorItem: real);
    procedure RemoverItem(const ValorItem: real);
    function ObterTotalPedido: real;
    function ObterValorDesconto: real;
    function ObterValorFrete: real;
    function ObterCategoriaPedido: TCategoriaPedido;
  end;

implementation

uses
  State.Classes.StateBronze, State.Classes.StatePrata, State.Classes.StateOuro;

{ TContext }

constructor TContext.Create;
begin
  FState := TStateBronze.Create(0);
end;

procedure TContext.AdicionarItem(const ValorItem: real);
begin
  FState.AdicionarItem(ValorItem);
  AlterarEstado;
end;

procedure TContext.RemoverItem(const ValorItem: real);
begin
  FState.RemoverItem(ValorItem);
  AlterarEstado;
end;

procedure TContext.AlterarEstado;
var
  lTotalPedido: real;
begin
  lTotalPedido := FState.ObterTotalPedido;

  if (lTotalPedido <= 500) then
  begin
    FState := TStateBronze.Create(lTotalPedido);
    Exit;
  end;

  if (lTotalPedido <= 1000) then
  begin
    FState := TStatePrata.Create(lTotalPedido);
    Exit;
  end;

  FState := TStateOuro.Create(lTotalPedido);
end;

function TContext.ObterCategoriaPedido: TCategoriaPedido;
begin
  Result := FState.ObterCategoriaPedido;
end;

function TContext.ObterTotalPedido: real;
begin
  Result := FState.ObterTotalPedido;
end;

function TContext.ObterValorDesconto: real;
begin
  Result := FState.ObterValorDesconto;
end;

function TContext.ObterValorFrete: real;
begin
  Result := FState.ObterValorFrete;
end;

end.
