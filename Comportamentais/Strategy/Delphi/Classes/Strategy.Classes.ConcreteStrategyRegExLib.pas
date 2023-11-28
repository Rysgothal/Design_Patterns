unit Strategy.Classes.ConcreteStrategyRegExLib;

interface

uses
  Strategy.Interfaces.Strategy;

type
  TConcreteStrategyRegExLib = class(TInterfacedObject, IStrategy)
  private
    function ObterExpressao: string;
  public
    function ValidarEmail(const pEmail: string): boolean;
  end;

implementation

uses
  System.RegularExpressions, WebService.RegExLib, Soap.SOAPHTTPClient,
  System.SysUtils;

{ TConcreteStrategyRegExLib }

function TConcreteStrategyRegExLib.ObterExpressao: string;
var
  lWebServiceRegExLib: WebservicesSoap;
  lHTTPRIO: THTTPRIO;
  lExpressao: RegExpDetails;
begin
  lHTTPRIO := THTTPRIO.Create(nil);
  lWebServiceRegExLib := GetWebservicesSoap(True, '', lHTTPRIO);
  lExpressao := lWebServiceRegExLib.getRegExpDetails(3122);

  Result := lExpressao.regular_expression;
  FreeAndNil(lExpressao);
end;

function TConcreteStrategyRegExLib.ValidarEmail(const pEmail: string): boolean;
var
  lRegEx: TRegEx;
begin
  lRegEx := TRegEx.Create(ObterExpressao);
  Result := lRegEx.Match(pEmail).Success;
end;

end.
