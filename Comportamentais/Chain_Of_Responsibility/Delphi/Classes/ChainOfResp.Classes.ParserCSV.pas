unit ChainOfResp.Classes.ParserCSV;

interface

uses
  ChainOfResp.Interfaces.Parser, Datasnap.DBClient, System.SysUtils;

type
  EFormatoDiferenteCSV = class(Exception);

  {Concrete Handler}
  TParserCSV = class(TInterfacedObject, IParser)
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
  System.Classes;

{ TParserCSV }

procedure TParserCSV.ProcessarInclusao(const pNomeArquivo: string; pDataSet: TClientDataSet);
var
  lValores, lLinha: TStringList;
begin
  if UpperCase(ExtractFileExt(pNomeArquivo)) <> '.CSV' then
  begin
    if not Assigned(ProximoParser) then
    begin
      raise EFormatoDiferenteCSV.Create('Formato diferente de .csv');
    end;

    ProximoParser.ProcessarInclusao(pNomeArquivo, pDataSet);
    Exit;
  end;

  lValores := TStringList.Create;
  lLinha := TStringList.Create;
  try
    lValores.LoadFromFile(pNomeArquivo);

    for var I := 0 to Pred(lValores.Count) do
    begin
      lLinha.Clear;

      ExtractStrings([','], [' '], PChar(lValores[I]), lLinha);
      pDataSet.AppendRecord([lLinha[0], lLinha[1], lLinha[2]]);
    end;
  finally
    FreeAndNil(lLinha);
    FreeAndNil(lValores);
  end;
end;

procedure TParserCSV.SetProximoParser(pParser: IParser);
begin
  FProximoParser := pParser;
end;

end.
