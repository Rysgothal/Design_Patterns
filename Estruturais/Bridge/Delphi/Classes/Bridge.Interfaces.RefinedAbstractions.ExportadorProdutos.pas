unit Bridge.Interfaces.RefinedAbstractions.ExportadorProdutos;

interface

uses
  Bridge.Interfaces.Implementor, Bridge.Interfaces.Abstraction,
  System.SysUtils;

type
  TExportadorProdutos = class(TInterfacedObject, IExportador)
  private
    FFormato: IFormato;
    procedure EscreverCabecalho;
  public
    property Formato: IFormato read FFormato write FFormato;
    constructor Create(pFormato: IFormato);
    procedure ExportarDados(const pDados: olevariant);
  end;

implementation

uses
  Datasnap.DBClient;

{ TExportadorProdutos }

constructor TExportadorProdutos.Create(pFormato: IFormato);
begin
  Self.FFormato := pFormato;
end;

procedure TExportadorProdutos.EscreverCabecalho;
begin
  Formato.DesenharCabecalho('Código');
  Formato.DesenharCabecalho('Descrição');
  Formato.DesenharCabecalho('Estoque');
end;

procedure TExportadorProdutos.ExportarDados(const pDados: olevariant);
var
  lDados: TClientDataSet;
begin
  EscreverCabecalho;

  lDados := TClientDataSet.Create(nil);
  try
    lDados.Data := pDados;
    lDados.First;

    while not lDados.Eof do
    begin
      Formato.PularLinha;

      for var I := 0 to Pred(lDados.Fields.Count) do
      begin
        Formato.ExportarCampo(lDados.Fields[I].AsString);
      end;

      lDados.Next;
    end;
    Formato.SalvarArquivo('Produtos');
  finally
    FreeAndNil(lDados);
  end;
end;

end.
