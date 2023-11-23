unit ChainOfResp.Classes.ParserTXT;

interface

uses
  ChainOfResp.Interfaces.Parser, Datasnap.DBClient, System.SysUtils;

type
  EFormatoDiferenteTXT = class(Exception);

  { Concrete Handler }
  TParserTXT = class(TInterfacedObject, IParser)
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
  Vcl.Dialogs;

  { TParserTXT }

procedure TParserTXT.ProcessarInclusao(const pNomeArquivo: string; pDataSet: TClientDataSet);
var
  lArquivo: TextFile;
  lLinha: string;
begin
  if UpperCase(ExtractFileExt(pNomeArquivo)) <> '.TXT' then
  begin
    if not Assigned(ProximoParser) then
    begin
      raise Exception.Create('Formato diferente de .TXT');
    end;

    ProximoParser.ProcessarInclusao(pNomeArquivo, pDataSet);
    Exit;
  end;

  AssignFile(lArquivo, pNomeArquivo);
  Reset(lArquivo);

  while not Eof(lArquivo) do
  begin
    pDataSet.Append;

    ReadLn(lArquivo, lLinha);
    pDataSet.FieldByName('Codigo').AsString := lLinha;
    ReadLn(lArquivo, lLinha);
    pDataSet.FieldByName('Nome').AsString := lLinha;
    ReadLn(lArquivo, lLinha);
    pDataSet.FieldByName('Cidade').AsString := lLinha;
    ReadLn(lArquivo, lLinha);

    pDataSet.Post;
  end;
end;

procedure TParserTXT.SetProximoParser(pParser: IParser);
begin
  FProximoParser := pParser;
end;

end.
