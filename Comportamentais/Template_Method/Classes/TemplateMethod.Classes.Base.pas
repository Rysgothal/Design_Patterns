unit TemplateMethod.Classes.Base;

interface

uses
  System.JSON, REST.Client, IPPeerClient;

type
  TBase = class
  private
    FRESTClient: TRESTClient;
    FRESTRequest: TRESTRequest;
    FRESTResponse: TRESTResponse;

    procedure InicializarObjetos;
    procedure EnviarRequisicao;
    procedure LiberarObjetos;
  protected
    FParametros: string;
    FJSON: TJSONObject;
    function ProcessarRetorno: olevariant; virtual; abstract;
  public
    function ConsultarDadosGitHub: olevariant;                // Template Method
  end;

implementation

uses
  System.SysUtils, REST.Types;

{ TBase }

procedure TBase.EnviarRequisicao;
begin
  FRESTRequest.Resource := FParametros;
  FRESTRequest.Execute;
  FJSON.Parse(TEncoding.ASCII.GetBytes(FRESTResponse.JSONValue.ToString), 0);
end;

procedure TBase.InicializarObjetos;
begin
  FRESTClient := TRESTClient.Create('https://api.github.com/search/');
  FRESTResponse := TRESTResponse.Create(nil);
  FRESTRequest := TRESTRequest.Create(nil);

  FRESTRequest.Client := FRESTClient;
  FRESTRequest.Response := FRESTResponse;
  FRESTRequest.Method := rmGET;
  FJSON := TJSONObject.Create;
end;

procedure TBase.LiberarObjetos;
begin
  FreeAndNil(FRESTRequest);
  FreeAndNil(FRESTResponse);
  FreeAndNil(FRESTClient);
end;

function TBase.ConsultarDadosGitHub: olevariant;
begin
  // Este é o Template Method
  // O comportamento do método "ProcessarRetorno" será definido em tempo de execução

  InicializarObjetos;
  EnviarRequisicao;
  Result := ProcessarRetorno;
  LiberarObjetos;
end;

end.
