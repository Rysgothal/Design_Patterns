unit Adapter.Classes.WebServiceViaCEP;

interface

uses
  XMLDoc, XMLIntf, Adapter.Interfaces.WebService;

type
  TWebServiceViaCEP = class(TInterfacedObject, IWebServiceViaCEP)
  private
    FXMLDocument: IXMLDocument;
  public
    property XMLDocument: IXMLDocument read FXMLDocument write FXMLDocument;
    constructor Create;
    destructor Destroy; override;
    procedure ConsultarEnderecoWebService(const CEP: string);
    function ObterLogradouro: string;
    function ObterBairro: string;
    function ObterCidade: string;    
  end;

implementation

uses
  SysUtils, Variants;

{ TWebServiceViaCEP }

procedure TWebServiceViaCEP.ConsultarEnderecoWebService(const CEP: string);
begin
  XMLDocument.FileName := Format('https://viacep.com.br/ws/%s/xml/', [CEP]);
  XMLDocument.Active := True;
end;

constructor TWebServiceViaCEP.Create;
begin
  XMLDocument := TXMLDocument.Create(nil);
end;

function TWebServiceViaCEP.ObterBairro: string;
begin
  Result := VarToStr(XMLDocument.DocumentElement.ChildValues['bairro']);
end;

function TWebServiceViaCEP.ObterCidade: string;
begin
  Result := VarToStr(XMLDocument.DocumentElement.ChildValues['localidade']);
end;

function TWebServiceViaCEP.ObterLogradouro: string;
begin
  Result := VarToStr(XMLDocument.DocumentElement.ChildValues['logradouro']);
end;

destructor TWebServiceViaCEP.Destroy;
begin
  XMLDocument := nil;
  inherited;
end;

end.
