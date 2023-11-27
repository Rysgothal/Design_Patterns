unit Iterator.Classes.ConcreteAggregateCSV;

interface

uses
  Iterator.Interfaces.Aggregate, System.Contnrs, Iterator.Interfaces.Iterator,
  System.SysUtils;

type
  TConcreteAggregateCSV = class(TInterfacedObject, IAggregate)
  private
    FLista: TObjectList;
    procedure PreencherLista(const pCaminhoArquivo: string);
  public
    property Lista: TObjectList read FLista write FLista;
    constructor Create(const pCaminhoArquivo: string);
    destructor Destroy; override;
    function GetLista: TObjectList;
    function GetIterator: IIterator;
  end;

implementation

uses
  Iterator.Classes.ConcreteIterator, System.Classes, Iterator.Classes.Cliente;

{ TConcreteAggregateCSV }

constructor TConcreteAggregateCSV.Create(const pCaminhoArquivo: string);
begin
  FLista := TObjectList.Create;
  PreencherLista(pCaminhoArquivo);
end;

destructor TConcreteAggregateCSV.Destroy;
begin
  FreeAndNil(FLista);
  inherited;
end;

function TConcreteAggregateCSV.GetIterator: IIterator;
begin
  Result := TConcreteIterator.Create(Self);
end;

function TConcreteAggregateCSV.GetLista: TObjectList;
begin
  Result := Lista;
end;

procedure TConcreteAggregateCSV.PreencherLista(const pCaminhoArquivo: string);
var
  lArquivoCSV: TextFile;
  lListaValores: TStringList;
  lLinha: string;
  lCliente: TCliente;
begin
  AssignFile(lArquivoCSV, pCaminhoArquivo);
  Reset(lArquivoCSV);

  lListaValores := TstringList.Create;

  try
    while not Eof(lArquivoCSV) do
    begin
      Readln(lArquivoCSV, lLinha);

      lListaValores.StrictDelimiter := True;
      lListaValores.CommaText := lLinha;

      lCLiente := TCliente.Create;
      lCliente.Codigo := StrToIntDef(lListaValores[0], 0);
      lCliente.Nome := lListaValores[1];
      lCliente.Endereco := lListaValores[2];
      lCliente.Pais := lListaValores[3];
      lCLiente.Email := lListaValores[4];

      Lista.Add(lCliente);
    end;
  finally
    lListaValores.Free;
    CloseFile(lArquivoCSV);
  end;
end;

end.
