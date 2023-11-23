unit ChainOfResp.Classes.ParserJSON;

interface

uses
  ChainOfResp.Interfaces.Parser, Datasnap.DBClient, System.JSON;

type
  { Concrete Handler }
  TParserJSON = class(TInterfacedObject, IParser)
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
  System.Classes, System.SysUtils, ChainOfResp.Classes.JSON, System.IOUtils;

{ TParserJSON }

procedure TParserJSON.ProcessarInclusao(const pNomeArquivo: string; pDataSet: TClientDataSet);
var
  lValores: TJSONValue;
  lJSON: TJSONParsers;
  lJsonBytes: TArray<System.Byte>;
begin
  if UpperCase(ExtractFileExt(pNomeArquivo)) <> '.JSON' then
  begin
    if not Assigned(ProximoParser) then
    begin
      raise Exception.Create('Formato diferente de .json');
    end;

    ProximoParser.ProcessarInclusao(pNomeArquivo, pDataSet);
    Exit;
  end;

  try
    lJsonBytes := TEncoding.UTF8.GetBytes(TFile.ReadAllText(pNomeArquivo, TEncoding.UTF8));
    lValores := TJSONValue.ParseJSONValue(lJsonBytes, 0) as TJSONValue;
    lJSON := TJSONParsers.Create(lValores, 'dados');

    for var lDado in lJSON.Dados do
    begin
      pDataSet.Append;
      pDataSet.FieldByName('Codigo').AsString := lDado.Codigo;
      pDataSet.FieldByName('Nome').AsString := lDado.Nome;
      pDataSet.FieldByName('Cidade').AsString := lDado.Cidade;
      pDataSet.Post;
    end;
  finally
    FreeAndNil(lValores);
    FreeAndNil(lJSON);
  end;
end;

procedure TParserJSON.SetProximoParser(pParser: IParser);
begin
  FProximoParser := pParser;
end;

end.
