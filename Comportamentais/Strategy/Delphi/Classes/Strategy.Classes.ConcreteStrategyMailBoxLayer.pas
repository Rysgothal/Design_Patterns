unit Strategy.Classes.ConcreteStrategyMailBoxLayer;

interface

uses
  Strategy.Interfaces.Strategy;

type
  TConcreteStrategyMailBoxLayer = class(TInterfacedObject, IStrategy)
  private
    function ObterJSONValidacao(const pEmail: string): string;
  public
    function ValidarEmail(const pEmail: string): boolean;
  end;

implementation

uses
  System.SysUtils, System.JSON, System.Classes, IdHTTP;

{ TConcreteStrategyMailBoxLayer }

function TConcreteStrategyMailBoxLayer.ObterJSONValidacao(const pEmail: string): string;
var
  lURL: string;
  lIdHTTP: TIdHTTP;
  lResposta: TMemoryStream;
begin
  lURL := 'https://apilayer.net/api/check';
  lURL := lURL + '?access_key=98d5dfa2c5213713e70c2476db5c01f0';
  lURL := lURL + '&email=%s&format=1';

  lIdHTTP := TIdHTTP.Create(nil);
  lResposta := TMemoryStream.Create;

  try
    lIdHTTP.Get(Format(lURL, [pEmail]), lResposta);
    SetString(Result, PAnsiChar(lResposta.Memory), lResposta.Size);
  finally
    FreeAndNil(lIdHTTP);
    FreeAndNil(lResposta);
  end;
end;

function TConcreteStrategyMailBoxLayer.ValidarEmail(const pEmail: string): boolean;
var
  lResposta: string;
  lJSON: TJSONObject;
begin
  lResposta := ObterJSONValidacao(pEmail);

  lJSON := TJSONObject.Create;
  try
    lJSON.Parse(TEncoding.ASCII.GetBytes(lResposta), 0);
    Result := lJSON.GetValue('format_valid') is TJSONTrue;
  finally
    FreeAndNil(lJSON);
  end;
end;

end.
