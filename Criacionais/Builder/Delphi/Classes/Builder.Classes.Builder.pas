unit Builder.Classes.Builder;

interface

uses
  Builder.Classes.Produto, Builder.Interfaces.Builder;

type
  TBuilder = class(TInterfacedObject, IBuilder)
  private
    FProduto: TProduto;
    FDados: olevariant;
    FQtdeRegistros: Integer;
  public
    property Produto: TProduto read FProduto write FProduto;
    property Dados: olevariant read FDados write FDados;
    property QtdeRegistros: Integer read FQtdeRegistros write FQtdeRegistros;
    constructor Create(pDados: olevariant);
    destructor Destroy; override;
    procedure ConstruirCabecalho;
    procedure ConstruirDetalhes;
    procedure ConstruirRodape;
    function GetRelatorio: TProduto;
  end;

implementation

uses
  System.SysUtils, DataSnap.DBClient;

{ TConcreteBuilder }

procedure TBuilder.ConstruirCabecalho;
begin
  Produto.Adicionar('<html><head><meta charset="UTF-8">');
  Produto.Adicionar('<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">');
  Produto.Adicionar('<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>');
  Produto.Adicionar('</head>');
  Produto.Adicionar('<div class="container">');
  Produto.Adicionar('<div class="panel panel-default">');
  Produto.Adicionar('<div class="panel-heading">');
  Produto.Adicionar('<h4>Relatório de Fornecedores</h4>');
  Produto.Adicionar('<h4>' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + '</h4>');
  Produto.Adicionar('</div>');
end;

procedure TBuilder.ConstruirDetalhes;
var
  lDados: TClientDataSet;
begin
  Produto.Adicionar('<table class="table table-fixed">');
  Produto.Adicionar('<thead><tr>');
  Produto.Adicionar('<th class="col-xs-2">Código</th>');
  Produto.Adicionar('<th class="col-xs-8">Fornecedor</th>');
  Produto.Adicionar('<th class="col-xs-2">Cidade</th>');
  Produto.Adicionar('</tr></thead><tbody>');

  lDados := TClientDataSet.Create(nil);
  try
    lDados.Data := Dados;
    lDados.First;

    // Para cada iteração nos registros do lDados, criauma linha no HTML
    while not lDados.Eof do
    begin
      Produto.Adicionar('<tr>');
      Produto.Adicionar('<td class="col-xs-2">' + lDados.FieldByName('VendorNo').AsString + '</td>');
      Produto.Adicionar('<td class="col-xs-2">' + lDados.FieldByName('VendorName').AsString + '</td>');
      Produto.Adicionar('<td class="col-xs-2">' + lDados.FieldByName('City').AsString + '</td>');
      Produto.Adicionar('</tr>');

      Inc(FQtdeRegistros);
      lDados.Next;
    end;

    Produto.Adicionar('</tbody></table></div></div>');
  finally
    FreeAndNil(lDados);
  end;
end;

procedure TBuilder.ConstruirRodape;
begin
  Produto.Adicionar('<div id="footer">');
  Produto.Adicionar('<div class="container">');
  Produto.Adicionar('<p class="text-center">Qtde de Registros: ' + IntToStr(QtdeRegistros)+ '</p>');
  Produto.Adicionar('<p class="text-center">Gerado por: Lucas Frade</p>');
  Produto.Adicionar('</div></div></body></html>');
end;

constructor TBuilder.Create(pDados: olevariant);
begin
  QtdeRegistros := 0;
  Dados := pDados;
  Produto := Produto.Create;
end;

destructor TBuilder.Destroy;
begin
  FreeAndNil(Produto);
  inherited;
end;

function TBuilder.GetRelatorio: TProduto;
begin
  Result := Produto;
end;

end.
