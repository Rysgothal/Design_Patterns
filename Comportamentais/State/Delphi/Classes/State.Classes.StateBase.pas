unit State.Classes.StateBase;

interface

uses
  State.Interfaces.State, State.Helpers.Enumerados;

type
  TStateBase = class(TInterfacedObject, IState)
  protected
    FTotalPedido: Real;
    function ObterValorDesconto: Real; virtual;
    function ObterValorFrete: Real; virtual;
    function ObterCategoriaPedido: TCategoriaPedido; virtual;
  public
    property TotalPedido: Real read FTotalPedido write FTotalPedido;
    constructor Create(const pTotalPedido: Real);
    procedure AdicionarItem(const pValorItem: Real);
    procedure RemoverItem(const pValorItem: Real);
    function ObterTotalPedido: Real;
  end;

implementation

{ TStateBase }

constructor TStateBase.Create(const pTotalPedido: real);
begin
  FTotalPedido := TotalPedido;
end;

function TStateBase.ObterTotalPedido: Real;
begin
  Result := TotalPedido;
end;

procedure TStateBase.AdicionarItem(const pValorItem: Real);
begin
  TotalPedido := TotalPedido + pValorItem;
end;

procedure TStateBase.RemoverItem(const pValorItem: Real);
begin
  TotalPedido := TotalPedido - pValorItem;
end;

function TStateBase.ObterValorDesconto: Real;
begin
  Result := 0;
end;

function TStateBase.ObterValorFrete: Real;
begin
  Result := 0;
end;

function TStateBase.ObterCategoriaPedido: TCategoriaPedido;
begin
  Result := cpBronze;
end;

end.
