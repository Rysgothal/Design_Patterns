unit Iterator.Classes.ConcreteAggregateXML;

interface

uses
  Iterator.Interfaces.Aggregate, System.Contnrs, Iterator.Interfaces.Iterator,
  System.SysUtils, Iterator.Classes.ConcreteIterator;

type
  TConcreteAggregateXML = class(TInterfacedObject, IAggregate)
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
  Xml.XMLIntf, Xml.XMLDoc, Iterator.Classes.Cliente, System.Classes;

{ TConcreteAggregateXML }

constructor TConcreteAggregateXML.Create(const pCaminhoArquivo: string);
begin
  FLista := TObjectList.Create;
  PreencherLista(pCaminhoArquivo);
end;

destructor TConcreteAggregateXML.Destroy;
begin
  FreeAndNil(FLista);
  inherited;
end;

function TConcreteAggregateXML.GetIterator: IIterator;
begin
  Result := TConcreteIterator.Create(Self);
end;

function TConcreteAggregateXML.GetLista: TObjectList;
begin
  Result := Lista;
end;

procedure TConcreteAggregateXML.PreencherLista(const pCaminhoArquivo: string);
var
  lXML: IXMLDocument;
  lImportacao, lDados: IXMLNode;
  Contador: Integer;
  lCliente: TCliente;
begin
  lXML := LoadXMLDocument(pCaminhoArquivo);
  lXML.Active := True;

  lImportacao := lXML.DocumentElement;
  for Contador := 0 to Pred(lImportacao.ChildNodes.Count) do
  begin
    lDados := lImportacao.ChildNodes[Contador];

    lCliente := TCliente.Create;
    lCliente.Codigo := StrToInt(lDados.ChildNodes['codigo'].Text);
    lCliente.Nome := lDados.ChildNodes['nome'].Text;
    lCliente.Endereco := lDados.ChildNodes['endereco'].Text;
    lCliente.Pais := lDados.ChildNodes['pais'].Text;
    lCliente.Email := lDados.ChildNodes['email'].Text;

    FLista.Add(lCliente);
  end;
end;

end.
