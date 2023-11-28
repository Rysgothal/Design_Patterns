unit Strategy.Classes.StrategyDLL;

interface

uses
  Strategy.Interfaces.Strategy;

type
  TConcreteStrategyDLL = class(TInterfacedObject, IStrategy)
  public
    function ValidarEmail(const pEmail: string): boolean;
  end;

  TValidarEmail = function(const pEmail: string): boolean; stdcall;

implementation

uses
  Winapi.Windows, Vcl.Dialogs, System.UITypes, Vcl.Forms, System.SysUtils;

{ TConcreteStrategyDLL }

function TConcreteStrategyDLL.ValidarEmail(const pEmail: string): boolean;
var
 lHandleDLL: THandle;
 lValidarEmail: TValidarEmail;
 lDiretorioDLL: string;
begin
  Result := False;

  lDiretorioDLL := ExtractFileDir(GetCurrentDir);
  lDiretorioDLL := ExtractFileDir(lDiretorioDLL) + '/Auxiliar/ValidadorEmail.dll';
  lHandleDLL := LoadLibrary(pChar(lDiretorioDLL));

  try
    if lHandleDLL = 0 then
    begin
      Application.MessageBox('N�o foi poss�vel carregar a DLL', 'Aten��o', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    // Obt�m o endere�o do m�todo da DLL chamado "ValidarEmail"
    @lValidarEmail := GetProcAddress(lHandleDLL, 'ValidarEmail');

    Result := lValidarEmail(pEmail);
  finally
    FreeLibrary(lHandleDLL);
  end;
end;

end.
