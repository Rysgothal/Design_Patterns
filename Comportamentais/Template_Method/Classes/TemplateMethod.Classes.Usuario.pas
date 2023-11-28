unit TemplateMethod.Classes.Usuario;

interface

uses
  TemplateMethod.Classes.Base;

type
  TUsuarios = class(TBase)
  protected
    function ProcessarRetorno: olevariant; override;
  public
    constructor Create(const Parametro: string);
  end;

implementation

uses
  System.SysUtils, System.JSON, Data.DB, Datasnap.DBClient,
  TemplateMethod.Classes.GithubJSONUsuario;

{ TUsuarios }

constructor TUsuarios.Create(const Parametro: string);
begin
  FParametros := Format('users?q=%s&page=1&per_page=100', [Parametro]);
end;

function TUsuarios.ProcessarRetorno: olevariant;
var
  lDataSetRetorno: TClientDataSet;
  lJSON: TGitHubJSONUsuarios;
begin
  // Cria um DataSet para tabular os dados consultados
  lDataSetRetorno := TClientDataSet.Create(nil);
  try
    // Define as colunas
    lDataSetRetorno.FieldDefs.Add('ID', ftInteger);
    lDataSetRetorno.FieldDefs.Add('Login', ftString, 20);
    lDataSetRetorno.FieldDefs.Add('URL', ftString, 40);
    lDataSetRetorno.FieldDefs.Add('Score', ftFloat);
    lDataSetRetorno.CreateDataSet;

    lJSON := TGitHubJSONUsuarios.Create(FJSON.GetValue('items'), 'items');

    for var lUsuario in lJSON.Items do
    begin
      lDataSetRetorno.AppendRecord([lUsuario.ID, lUsuario.Login, lUsuario.HtmlUrl, lUsuario.Score]);
    end;

    Result := lDataSetRetorno.Data;
  finally
    lDataSetRetorno.Free;
  end;
end;

end.
