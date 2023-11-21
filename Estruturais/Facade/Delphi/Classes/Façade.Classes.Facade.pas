unit Fa�ade.Classes.Facade;

interface

type
  { Fa�ade }
  TFacade = class
  public
    procedure CalcularValorDeVenda(const pFidelidade: Integer; const pPreco: Real);
  end;

implementation

uses
  Fa�ade.Classes.SubSystemCotacaoDolar, Fa�ade.Classes.SubSystemCalculoLoja,
  Fa�ade.Classes.SubSystemHistorico, System.SysUtils;

{ TFacade }

procedure TFacade.CalcularValorDeVenda(const pFidelidade: Integer; const pPreco: Real);
var
  lCotacaoDolar: TSubsystemCotacaoDolar;
  lCalculoLoja: TSubsystemCalculoLoja;
  lHistorico: TSubsystemHistorico;
  lDolar: Real;
  lVenda: Real;
begin
  // cria as inst�ncias dos Subsystems
  lCotacaoDolar := TSubsystemCotacaoDolar.Create;
  lCalculoLoja := TSubsystemCalculoLoja.Create;
  lHistorico := TSubsystemHistorico.Create;

  try
    // utiliza o primeiro Subsystem para consultar a cota��o do D�lar
    lDolar := lCotacaoDolar.ConsultarCotacaoDolar;

    // converte em Reais
    lVenda := pPreco * lDolar;

    // utiliza o segundo Subsytem para aplicar desconto e margem de venda
    lVenda := lCalculoLoja.CalcularPrecoFinal(pFidelidade, lVenda);

    // utiliza o terceiro Subsystem para armazenar o hist�rico do c�lculo
    lHistorico.RegistrarHistoricoDoCalculo(pFidelidade, lDolar, pPreco, lVenda);
  finally
    // libera as inst�ncias da mem�ria
    FreeAndNil(lCotacaoDolar);
    FreeAndNil(lCalculoLoja);
    FreeAndNil(lHistorico);
  end;
end;

end.
