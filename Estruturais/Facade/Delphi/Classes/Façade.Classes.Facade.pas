unit Façade.Classes.Facade;

interface

type
  { Façade }
  TFacade = class
  public
    procedure CalcularValorDeVenda(const pFidelidade: Integer; const pPreco: Real);
  end;

implementation

uses
  Façade.Classes.SubSystemCotacaoDolar, Façade.Classes.SubSystemCalculoLoja,
  Façade.Classes.SubSystemHistorico, System.SysUtils;

{ TFacade }

procedure TFacade.CalcularValorDeVenda(const pFidelidade: Integer; const pPreco: Real);
var
  lCotacaoDolar: TSubsystemCotacaoDolar;
  lCalculoLoja: TSubsystemCalculoLoja;
  lHistorico: TSubsystemHistorico;
  lDolar, lVenda: Real;
begin
  lCotacaoDolar := TSubsystemCotacaoDolar.Create;
  lCalculoLoja := TSubsystemCalculoLoja.Create;
  lHistorico := TSubsystemHistorico.Create;

  try
    lDolar := lCotacaoDolar.ConsultarCotacaoDolar;
    lVenda := pPreco * lDolar;
    lVenda := lCalculoLoja.CalcularPrecoFinal(pFidelidade, lVenda);

    lHistorico.RegistrarHistoricoDoCalculo(pFidelidade, lDolar, pPreco, lVenda);
  finally
    FreeAndNil(lCotacaoDolar);
    FreeAndNil(lCalculoLoja);
    FreeAndNil(lHistorico);
  end;
end;

end.
