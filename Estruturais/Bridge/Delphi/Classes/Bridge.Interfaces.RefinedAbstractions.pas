unit Bridge.Interfaces.RefinedAbstractions;

interface

uses
  Bridge.Interfaces.Abstraction, Bridge.Interfaces.Implementor,
  System.SysUtils;

type
  TExportadorClientes = class(TInterfacedObject, IExportador)
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

{ TExportadorClientes }

constructor TExportadorClientes.Create(pFormato: IFormato);
begin
  Self.FFormato := pFormato;
end;

procedure TExportadorClientes.EscreverCabecalho;
begin
  Formato.DesenharCabecalho('Código');
  Formato.DesenharCabecalho('Nome');
  Formato.DesenharCabecalho('Cidade');
end;

procedure TExportadorClientes.ExportarDados(const pDados: olevariant);
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

    Formato.SalvarArquivo('Clientes');
  finally
    FreeAndNil(lDados);
  end;
end;

end.
