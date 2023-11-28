unit TemplateMethod.Classes.Repositorios;

interface

uses
  TemplateMethod.Classes.Base;

type
  TRepositorios = class(TBase)
  protected
    function ProcessarRetorno: olevariant; override;
  public
    constructor Create(const Parametro: string);
  end;

implementation

uses
  System.SysUtils, System.JSON, Data.DB, Datasnap.DBClient,
  TemplateMethod.Classes.GithubJSONRepositorios;

{ TRepositorios }

constructor TRepositorios.Create(const Parametro: string);
begin
  FParametros := Format('repositories?q=%s&page=1&per_page=100', [Parametro]);
end;

function TRepositorios.ProcessarRetorno: olevariant;
var
  lDataSetRetorno: TClientDataSet;
  lJSON: TGithubJSONRepositorios;
begin
  // Cria um DataSet para tabular os dados consultados
  lDataSetRetorno := TClientDataSet.Create(nil);
  try
    // Define as colunas
    lDataSetRetorno.FieldDefs.Add('ID', ftInteger);
    lDataSetRetorno.FieldDefs.Add('Nome', ftString, 40);
    lDataSetRetorno.FieldDefs.Add('Linguagem', ftString, 18);
    lDataSetRetorno.FieldDefs.Add('Observadores', ftInteger);
    lDataSetRetorno.CreateDataSet;

    lJSON := TGithubJSONRepositorios.Create(FJSON.GetValue('items'), 'items');
    for var lRepositorio in lJSON.Items do
    begin
      lDataSetRetorno.AppendRecord([lRepositorio.ID, lRepositorio.Nome, lRepositorio.Linguagem, lRepositorio.Watchers]);
    end;

    Result := lDataSetRetorno.Data;
  finally
    lDataSetRetorno.Free;
  end;
end;

end.
