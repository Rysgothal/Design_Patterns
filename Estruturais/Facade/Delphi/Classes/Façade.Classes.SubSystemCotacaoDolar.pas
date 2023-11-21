unit Façade.Classes.SubSystemCotacaoDolar;

interface

type
  TSubsystemCotacaoDolar = class
  public
    function ConsultarCotacaoDolar: Real;
  end;

implementation

uses
  SysUtils, SOAPHTTPClient, Windows, Façade.Classes.WSDL_BCB;

{ TSubsystemCotacaoDolar }

function TSubsystemCotacaoDolar.ConsultarCotacaoDolar: Real;
var
  lWebServiceCotacao: FachadaWSSGS;
  lHTTPRIO: THTTPRIO;
  lConfig: TFormatSettings;
begin
  lHTTPRIO := THTTPRIO.Create(nil);
  lWebServiceCotacao := GetFachadaWSSGS(True, EmptyStr, lHTTPRIO);
  lConfig.DecimalSeparator := '.';

  Result := StrToFloat(lWebServiceCotacao.getUltimoValorVO(1).ultimoValor.sValor, lConfig);
end;

end.
