unit ChainOfResp.Classes.JSON;

interface

uses
  System.Generics.Collections, System.JSON, REST.Json, REST.JsonReflect, REST.Json.Types;

type
  TJSONParser = class
  private
    [JSONName('codigo')]
    FCodigo: string;
    [JSONName('nome')]
    FNome: string;
    [JSONName('cidade')]
    FCidade: string;
  public
    property Codigo: string read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property Cidade: string read FCidade write FCidade;
  end;

  TJSONParsers = class
  private
    [JSONName('dados')]
    FDados: TArray<TJSONParser>;
    function GetDados: TObjectList<TJSONParser>;
  public
    constructor Create(pJSONValue: TJSONValue; pDefault: string); overload;
    property Dados: TObjectList<TJSONParser> read GetDados;
  end;

implementation

{ TJSONParsers }

constructor TJSONParsers.Create(pJSONValue: TJSONValue; pDefault: string);
var
  vJSONUnMarshal: TJSONUnMarshal;
begin
  inherited Create;

  if pJSONValue is TJSONArray then
  begin
    vJSONUnMarshal := TJSONUnMarshal.Create;

    try
      vJSONUnMarshal.SetFieldArray(Self, pDefault, (pJSONValue as TJSONArray));
    finally
      vJSONUnMarshal.Free;
    end;

    Exit;
  end;

  Self := TJson.JsonToObject<TJSONParsers>(TJSONObject(pJSONValue));
end;

function TJSONParsers.GetDados: TObjectList<TJSONParser>;
var
  vElemento: TJSONParser;
  vListaRegioes: TObjectList<TJSONParser>;
begin
  vListaRegioes := TObjectList<TJSONParser>.Create;

  for vElemento in FDados do
  begin
    vListaRegioes.Add(vElemento);
  end;

  Result := vListaRegioes;
end;

end.
