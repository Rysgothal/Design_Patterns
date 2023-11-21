unit Composite.Classes.Singleton.Valores;

interface

uses
  DBClient;

type
  TValoresSingleton = class
  private
    FDataSet: TClientDataSet;
    constructor Create;
  public
    property DataSet: TClientDataSet read FDataSet write FDataSet;
    destructor Destroy; override;
    class function ObterInstancia: TValoresSingleton;
    class function NewInstance: TObject; override;
    function ConsultarValorViagem(const Origem, Destino: string): double;
  end;

implementation

uses
  SysUtils, Variants, Forms;

var
  FInstancia: TValoresSingleton;

{ TValoresSingleton }

function TValoresSingleton.ConsultarValorViagem(const Origem,
  Destino: string): double;
begin
  DataSet.Locate('Origem;Destino', VarArrayOf([Origem, Destino]), []);

  Result := DataSet.FieldByName('Valor').AsFloat;
end;

constructor TValoresSingleton.Create;
begin
  DataSet := TClientDataSet.Create(nil);
  DataSet.LoadFromFile(ExtractFilePath(Application.ExeName) + 'TarifaViagens.xml');
end;

destructor TValoresSingleton.Destroy;
begin
  FreeAndNil(FDataSet);
  inherited;
end;

class function TValoresSingleton.NewInstance: TObject;
begin
  if not Assigned(FInstancia) then
  begin
    FInstancia := TValoresSingleton(inherited NewInstance);
  end;

  Result := FInstancia;
end;

class function TValoresSingleton.ObterInstancia: TValoresSingleton;
begin
  Result := TValoresSingleton.Create;
end;

end.
