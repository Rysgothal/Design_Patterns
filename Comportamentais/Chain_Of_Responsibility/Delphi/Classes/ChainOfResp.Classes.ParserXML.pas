unit ChainOfResp.Classes.ParserXML;

interface

uses
  ChainOfResp.Interfaces.Parser, Datasnap.DBClient, System.SysUtils;

type
  EFormatoDiferenteXML = class(Exception);

  {Concrete Handler}
  TParserXML = class(TInterfacedObject, IParser)
  private
    FProximoParser: IParser;
  protected
    procedure SetProximoParser(pParser: IParser);
  public
    property ProximoParser: IParser read FProximoParser write SetProximoParser;
    procedure ProcessarInclusao(const pNomeArquivo: string; pDataSet: TClientDataSet);
  end;

implementation

uses
  XMLDoc, Xml.XMLIntf;

{ TParserXML }

procedure TParserXML.ProcessarInclusao(const pNomeArquivo: string; pDataSet: TClientDataSet);
var
  lXML: IXMLDocument;
  lImportacao, lDados: IXMLNode;
begin
  if Uppercase(ExtractFileExt(pNomeArquivo)) <> '.XML' then
  begin
    if not Assigned(ProximoParser) then
    begin
      raise EFormatoDiferenteXML.Create('Formato diferente de .xml');
    end;

    ProximoParser.ProcessarInclusao(pNomeArquivo, pDataSet);
    Exit;
  end;

  lXML := LoadXMLDocument(pNomeArquivo);
  lXML.Active := True;

  lImportacao := lXML.DocumentElement;

  for var I := 0 to Pred(lImportacao.ChildNodes.Count) do
  begin
    lDados := lImportacao.ChildNodes[I];

    pDataSet.Append;
    pDataSet.FieldByName('Codigo').AsString := lDados.ChildNodes['codigo'].Text;
    pDataSet.FieldByName('Nome').AsString := lDados.ChildNodes['nome'].Text;
    pDataSet.FieldByName('Cidade').AsString := lDados.ChildNodes['cidade'].Text;
    pDataSet.Post;
  end;
end;

procedure TParserXML.SetProximoParser(pParser: IParser);
begin
  FProximoParser := pParser;
end;

end.
