unit ChainOfResp.Interfaces.Parser;

interface

uses
  Datasnap.DBClient;

type
  { Handler}
  IParser = interface
    procedure SetProximoParser(pParser: IParser);                                           // Setter para atribuir a referência do Concrete Handler superior
    procedure ProcessarInclusao(const pNomeArquivo: string; pDataSet: TClientDataSet);      // Método para processar a inclusão de dados no DataSet
  end;

implementation

end.
