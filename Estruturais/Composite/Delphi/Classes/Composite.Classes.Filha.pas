unit Composite.Classes.Filha;

interface

uses
  Composite.Interfaces.Component;

type
  { Leaf }
  TViagem = class(TInterfacedObject, IViagem)
  private
    FOrigem: string;
    FDestino: string;
    FData: TDateTime;
  public
    property Origem: string read FOrigem write FOrigem;
    property Destino: string read FDestino write FDestino;
    property Data: TDateTime read FData write FData;

    procedure DefinirOrigem(const pCidade: string);
    procedure DefinirDestino(const pCidade: string);
    function CalcularValor: Double;
  end;
implementation

uses
  Composite.Classes.Singleton.Valores;

{ TViagem }

function TViagem.CalcularValor: Double;
var
  lValores: TValoresSingleton;
begin
  // Obtém a instância do Singleton para consultar o valor da viagem
  lValores := TValoresSingleton.ObterInstancia;
  result := lValores.ConsultarValorViagem(Origem, Destino);
end;

procedure TViagem.DefinirDestino(const pCidade: string);
begin
  Self.Destino := pCidade;
end;

procedure TViagem.DefinirOrigem(const pCidade: string);
begin
  Self.Origem := pCidade;
end;

end.
