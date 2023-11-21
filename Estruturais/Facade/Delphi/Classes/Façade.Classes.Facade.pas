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
  lDolar: Real;
  lVenda: Real;
begin
  // cria as instâncias dos Subsystems
  lCotacaoDolar := TSubsystemCotacaoDolar.Create;
  lCalculoLoja := TSubsystemCalculoLoja.Create;
  lHistorico := TSubsystemHistorico.Create;

  try
    // utiliza o primeiro Subsystem para consultar a cotação do Dólar
    lDolar := lCotacaoDolar.ConsultarCotacaoDolar;

    // converte em Reais
    lVenda := pPreco * lDolar;

    // utiliza o segundo Subsytem para aplicar desconto e margem de venda
    lVenda := lCalculoLoja.CalcularPrecoFinal(pFidelidade, lVenda);

    // utiliza o terceiro Subsystem para armazenar o histórico do cálculo
    lHistorico.RegistrarHistoricoDoCalculo(pFidelidade, lDolar, pPreco, lVenda);
  finally
    // libera as instâncias da memória
    FreeAndNil(lCotacaoDolar);
    FreeAndNil(lCalculoLoja);
    FreeAndNil(lHistorico);
  end;
end;

end.
