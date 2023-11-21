unit Adapter.Classes.WebServiceCorreios;

interface

uses
  Classes, Adapter.Classes.WebServiceDL_Correios;

type
  { Adaptee }
  TWebServiceCorreios = class
  private
    FParametros: consultaCEP;
    FResposta: enderecoERP;
    procedure BeforeExecute(const pMethodName: string; pSOAPRequest: TStream);
  public
    property Parametros: consultaCEP read FParametros write FParametros;
    property Resposta: enderecoERP read FResposta write FResposta;
    destructor Destroy; override;
    procedure DefinirParametrosConsulta(const pCEP: string);
    procedure ConsultarCEP;
    function ObterResposta(const pInformacao: string): string;
  end;

implementation

uses
  SysUtils, SOAPHTTPClient;

{ TWebServiceCorreios }

procedure TWebServiceCorreios.BeforeExecute(const pMethodName: string; pSOAPRequest: TStream);
var
  lRequest: TStringList;
begin
  lRequest := TStringList.Create;

  try
    lRequest.Text :=
      '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cli="http://cliente.bean.master.sigep.bsb.correios.com.br/">' +
      '  <soapenv:Header/>' +
      '    <soapenv:Body>' +
      '      <cli:consultaCEP>' +
      '        <cep>' + Parametros.cep + '</cep>' +
      '      </cli:consultaCEP>' +
      '    </soapenv:Body>' +
      '</soapenv:Envelope>';

    pSOAPRequest.Position := 0;
    pSOAPRequest.Size := Length(lRequest.Text);
    lRequest.SaveToStream(pSOAPRequest);
  finally
    FreeAndNil(lRequest);
  end;
end;

procedure TWebServiceCorreios.ConsultarCEP;
var
  lCorreios: AtendeCliente;
  lHTTPRIO: THTTPRIO;
begin
  lHTTPRIO := THTTPRIO.Create(nil);
  lHTTPRIO.OnBeforeExecute := BeforeExecute;
  lCorreios := GetAtendeCliente(True, '', lHTTPRIO);
  Resposta := lCorreios.consultaCEP(Parametros).return;
end;

procedure TWebServiceCorreios.DefinirParametrosConsulta(const pCEP: string);
begin
  Parametros := consultaCEP.Create;
  Parametros.CEP := pCEP;
end;

destructor TWebServiceCorreios.Destroy;
begin
  FreeAndNil(FParametros);
  inherited;
end;

function TWebServiceCorreios.ObterResposta(const pInformacao: string): string;
begin
  Result := EmptyStr;

  if pInformacao = 'Logradouro' then
    Result := Resposta.end_
  else if pInformacao = 'Bairro' then
    Result := Resposta.bairro
  else if pInformacao = 'Cidade' then
    Result := Resposta.cidade;
end;

end.
