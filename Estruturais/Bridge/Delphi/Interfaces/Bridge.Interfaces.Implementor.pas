unit Bridge.Interfaces.Implementor;

interface

type
  IFormato = interface
    procedure PularLinha;
    procedure ExportarCampo(const pValor: string);
    procedure SalvarArquivo(const pNomeArquivo: string);
    procedure DesenharCabecalho(const pTitulo: string);
  end;

implementation

end.
