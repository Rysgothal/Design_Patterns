unit Builder.Interfaces.Builder;

interface

uses
  Builder.Classes.Produto;

type
  IBuilder = interface
    procedure ConstruirCabecalho;
    procedure ConstruirDetalhes;
    procedure ConstruirRodape;
    function GetRelatorio: TProduto;        // Retornar 'produto' pronto
  end;

implementation

end.
