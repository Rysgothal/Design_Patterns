unit ChainOfResp.Interfaces.Parser;

interface

uses
  Datasnap.DBClient;

type
  { Handler}
  IParser = interface
    procedure SetProximoParser(pParser: IParser);                                           // Setter para atribuir a refer�ncia do Concrete Handler superior
    procedure ProcessarInclusao(const pNomeArquivo: string; pDataSet: TClientDataSet);      // M�todo para processar a inclus�o de dados no DataSet
  end;

implementation

end.
