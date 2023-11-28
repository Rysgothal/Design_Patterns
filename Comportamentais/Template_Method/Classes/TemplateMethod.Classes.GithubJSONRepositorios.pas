unit TemplateMethod.Classes.GithubJSONRepositorios;

interface

uses
  System.Generics.Collections, System.JSON, REST.Json, REST.JsonReflect, REST.Json.Types;

type
  TGithubJSONRepositorio = class
  private
    [JSONName('id')]
    FID: Integer;
    [JSONName('full_name')]
    FNome: string;
    [JSONName('language')]
    FLinguagem: string;
    [JSONName('watchers')]
    FWatchers: Integer;
  public
    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property Linguagem: string read FLinguagem write FLinguagem;
    property Watchers: Integer read FWatchers write FWatchers;
  end;

  TGithubJSONRepositorios = class
  private
    [JSONName('items')]
    FDados: TArray<TGithubJSONRepositorio>;
    function GetItems: TObjectList<TGithubJSONRepositorio>;
  public
    constructor Create(pJSONValue: TJSONValue; pDefault: string); overload;
    property Items: TObjectList<TGithubJSONRepositorio> read GetItems;
  end;

implementation

{ TGitHubJSONUsuarios }

constructor TGithubJSONRepositorios.Create(pJSONValue: TJSONValue; pDefault: string);
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

  Self := TJson.JsonToObject<TGithubJSONRepositorios>(TJSONObject(pJSONValue));
end;

function TGithubJSONRepositorios.GetItems: TObjectList<TGithubJSONRepositorio>;
var
  vElemento: TGithubJSONRepositorio;
  vListaRegioes: TObjectList<TGithubJSONRepositorio>;
begin
  vListaRegioes := TObjectList<TGithubJSONRepositorio>.Create;

  for vElemento in FDados do
  begin
    vListaRegioes.Add(vElemento);
  end;

  Result := vListaRegioes;
end;

end.
