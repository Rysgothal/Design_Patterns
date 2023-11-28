unit Strategy.Classes.Context;

interface

uses
  Strategy.Interfaces.Strategy;

type
  // Tipo enumerado que corresponde a cada Concrete Strategy
  TTipoValidacao = (avDLL, avRegExLib, avMailBoxLayer);

  TContext = class
  private
    FStrategy: IStrategy;
  public
    property Strategy: IStrategy read FStrategy write FStrategy;
    function ValidarEmail(const pTipoValidacao: TTipoValidacao; const pEmail: string): Boolean;
  end;

implementation

uses
  Strategy.Classes.StrategyDLL, Strategy.Classes.ConcreteStrategyRegExLib,
  Strategy.Classes.ConcreteStrategyMailBoxLayer;

{ TContext }

function TContext.ValidarEmail(const pTipoValidacao: TTipoValidacao; const pEmail: string): Boolean;
begin
  case pTipoValidacao of
    avDLL: FStrategy := TConcreteStrategyDLL.Create;
    avRegExLib: FStrategy := TConcreteStrategyRegExLib.Create;
    avMailBoxLayer: FStrategy := TConcreteStrategyMailBoxLayer.Create;
  end;

  // Chama a função "ValidarEmail" do Concrete Strategy
  Result := FStrategy.ValidarEmail(pEmail);
end;

end.
