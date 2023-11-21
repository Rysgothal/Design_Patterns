unit Decorator.Classes.DecoratorDataHora;

interface

uses
  Decorator.Classes.Decorator;

type
  TDataHoraDecorator = class(TDecorator)
  protected
    function ObterDadosExcecao: string;
  end;

implementation

uses
  System.SysUtils;

{ TDataHoraDecorator }

function TDataHoraDecorator.ObterDadosExcecao: string;
begin
  Result := inherited + ObterDadosExcecao;
  Result := Result + 'Data/Hora: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);
end;

end.
