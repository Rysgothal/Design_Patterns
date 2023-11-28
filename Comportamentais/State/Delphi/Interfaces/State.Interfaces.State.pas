unit State.Interfaces.State;

interface

uses
  State.Helpers.Enumerados;

type
  IState = interface
    procedure AdicionarItem(const ValorItem: Real);
    procedure RemoverItem(const ValorItem: Real);
    function ObterTotalPedido: Real;
    function ObterValorDesconto: Real;
    function ObterValorFrete: Real;
    function ObterCategoriaPedido: TCategoriaPedido;
  end;

implementation

end.
