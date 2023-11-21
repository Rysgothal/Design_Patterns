unit Decorator.Classes.DecoratorNomeUsuario;

interface

uses
  Decorator.Classes.Decorator;

type
  TNomeUsuarioDecorator = class(TDecorator)
  private
    function ObterNomeUsuario: string;
  protected
    function ObterDadosExcecao: string; override;
  end;

implementation

uses
  System.SysUtils, System.Types, Winapi.Windows;

{ TNomeUsuarioDecorator }

function TNomeUsuarioDecorator.ObterNomeUsuario: string;
var
  lTamanho: DWORD;
begin
  lTamanho := 1024;
  SetLength(Result, lTamanho);
  GetUserName(PChar(Result), lTamanho);
  SetLength(Result, Pred(lTamanho));
end;

function TNomeUsuarioDecorator.ObterDadosExcecao: string;
begin
  Result := inherited ObterDadosExcecao;
  Result := Result + 'Usuário: ' + ObterNomeUsuario;
end;

end.
