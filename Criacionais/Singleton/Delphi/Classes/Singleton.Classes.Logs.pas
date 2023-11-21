unit Singleton.Classes.Logs;

interface

type
  TLoggerSingleton = class
  private
    FArquivoLog: TextFile;
    constructor Create;         // Private, porque o método principal é "ObterInstancia"
  public
    property ArquivoLog: TextFile read FArquivoLog write FArquivoLog;
    class function ObterInstancia: TLoggerSingleton;
    class function NewInstance: TObject; override;
    procedure RegistrarLog(const pTexto: string);
  end;

var
  FLogger: TLoggerSingleton;

implementation

uses
  System.SysUtils, Vcl.Forms;

{ TLoggerSingleton }

constructor TLoggerSingleton.Create;
var
  lDiretorioAplicacao: string;
begin
  lDiretorioAplicacao := ExtractFileDir(Application.ExeName);
  AssignFile(ArquivoLog, lDiretorioAplicacao + 'Log.txt');

  if not FileExists(lDiretorioAplicacao + 'Log.txt') then
  begin
    Rewrite(ArquivoLog);
    CloseFile(ArquivoLog);
  end;
end;

class function TLoggerSingleton.NewInstance: TObject;
begin
  if not Assigned(FLogger) then
  begin
    FLogger := TLoggerSingleton(inherited NewInstance);
  end;

  Result := FLogger;
end;

class function TLoggerSingleton.ObterInstancia: TLoggerSingleton;
begin
  Result := TLoggerSingleton.Create;
end;

procedure TLoggerSingleton.RegistrarLog(const pTexto: string);
var
  lDataHora: string;
begin
  Append(ArquivoLog);

  lDataHora := FormatDateTime('[dd/mm/yyyy hh:nn:ss] ', Now);
  WriteLn(ArquivoLog, lDataHora + pTexto);

  CloseFile(ArquivoLog);
end;

initialization

finalization
  FreeAndNil(FLogger);

end.
