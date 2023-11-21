unit Decorator.Classes.DecoratorVersaoWin;

interface

uses
  Decorator.Classes.Decorator;

type
  TVersaoWindowsDecorator = class(TDecorator)
  private
    function ObterVersaoWindows: string;
  protected
    function ObterDadosExcecao: string; override;
  end;

implementation

uses
  SysUtils, Windows, Registry;

function TVersaoWindowsDecorator.ObterDadosExcecao: string;
begin
  Result := inherited ObterDadosExcecao;
  Result := Result + 'Versão do Sistema Operacional: ' + ObterVersaoWindows;
end;

function TVersaoWindowsDecorator.ObterVersaoWindows: string;
var
  lRegistro: TRegistry;
  lMajorVersion, lMinorVersion: byte;
begin
  lRegistro := TRegistry.Create;

  try
    lRegistro.RootKey := HKEY_LOCAL_MACHINE;
    lRegistro.OpenKey('Software\Microsoft\Windows NT\CurrentVersion', False);
    lMajorVersion := lRegistro.ReadInteger('CurrentMajorVersionNumber');
    lMinorVersion := lRegistro.ReadInteger('CurrentMinorVersionNumber');

    case lMajorVersion of
      5:
      begin
        case lMinorVersion of
            1: Result := 'Windows XP';
        end;
      end;

      6:
      begin
         case lMinorVersion of
            0: Result := 'Windows Vista';
            1: Result := 'Windows 7';
            2: Result := 'Windows 8';
            3: Result := 'Windows 8.1';
         end;
      end;

      10:
      begin
        case lMinorVersion of
          0: Result := 'Windows 10';
        end;
      end;
    end;
  finally
    FreeAndNil(lRegistro);
  end;
end;

end.
