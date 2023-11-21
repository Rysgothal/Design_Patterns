unit Façade.Classes.SubSystemCalculoLoja;

interface

type
  TSubSystemCalculoLoja = class
  private
    function AplicarDesconto(const pFidalidade: Integer; const pPreco: Real): Real;
    function AplicarMargemVenda(const pPreco: Real): Real;
  public
    function CalcularPrecoFinal(const pFidelidade: Integer; const pPreco: Real): Real;
  end;

implementation

{ TSubSystemCalculoLoja }

function TSubSystemCalculoLoja.AplicarDesconto(const pFidalidade: Integer; const pPreco: Real): Real;
var
  lResultado: Real;
begin
  lResultado := pPreco;

  case pFidalidade of
    0: lResultado := pPreco - (pPreco * 0.02);
    1: lResultado := pPreco - (pPreco * 0.06);
    2: lResultado := pPreco - (pPreco * 0.1);
    3: lResultado := pPreco - (pPreco * 0.18);
  end;

  Result := lResultado
end;

function TSubSystemCalculoLoja.AplicarMargemVenda(const pPreco: Real): Real;
begin
  Result := pPreco + (pPreco * 0.35);
end;

function TSubSystemCalculoLoja.CalcularPrecoFinal(const pFidelidade: Integer; const pPreco: Real): Real;
var
  lResultado: Real;
begin
  lResultado := AplicarDesconto(pFidelidade, pPreco);
  lResultado := AplicarMargemVenda(lResultado);

  Result := lResultado;
end;

end.
