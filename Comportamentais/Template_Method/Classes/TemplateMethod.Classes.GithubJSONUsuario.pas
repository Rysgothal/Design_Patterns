unit TemplateMethod.Classes.GithubJSONUsuario;

interface

uses
  System.Generics.Collections, System.JSON, REST.Json, REST.JsonReflect, REST.Json.Types;

type
  TGitHubJSONUsuario = class
  private
    [JSONName('id')]
    FID: Integer;
    [JSONName('login')]
    FLogin: string;
    [JSONName('html_url')]
    FHtmlUrl: string;
    [JSONName('score')]
    FScore: Double;
  public
    property ID: Integer read FID write FID;
    property Login: string read FLogin write FLogin;
    property HtmlUrl: string read FHtmlUrl write FHtmlUrl;
    property Score: Double read FScore write FScore;
  end;

  TGitHubJSONUsuarios = class
  private
    [JSONName('items')]
    FDados: TArray<TGitHubJSONUsuario>;
    function GetItems: TObjectList<TGitHubJSONUsuario>;
  public
    constructor Create(pJSONValue: TJSONValue; pDefault: string); overload;
    property Items: TObjectList<TGitHubJSONUsuario> read GetItems;
  end;

implementation

{ TGitHubJSONUsuarios }

constructor TGitHubJSONUsuarios.Create(pJSONValue: TJSONValue; pDefault: string);
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

  Self := TJson.JsonToObject<TGitHubJSONUsuarios>(TJSONObject(pJSONValue));
end;

function TGitHubJSONUsuarios.GetItems: TObjectList<TGitHubJSONUsuario>;
var
  vElemento: TGitHubJSONUsuario;
  vListaRegioes: TObjectList<TGitHubJSONUsuario>;
begin
  vListaRegioes := TObjectList<TGitHubJSONUsuario>.Create;

  for vElemento in FDados do
  begin
    vListaRegioes.Add(vElemento);
  end;

  Result := vListaRegioes;
end;

end.
