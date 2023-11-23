unit Command.Classes.Reciver;

interface

uses
  Vcl.Forms;

type
  { Receiver }
  TReceiver = class
  public
    procedure ExtrairProcessos;
    procedure ExtrairProgramas;
    procedure ExtrairVariaveisAmbiente;
  end;

implementation

uses
  Windows, TlHelp32, System.SysUtils, Registry, System.Classes;

{ TReceiver }

procedure TReceiver.ExtrairProcessos;
var
  lHandle: THandle;
  lProcessEntry: TProcessEntry32;
  lListaProcessos: TStringList;
  lDiretorio: string;
begin
  lHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  lListaProcessos := TStringList.Create;

  try
    lProcessEntry.dwSize := SizeOf(TProcessEntry32);
    Process32Next(lHandle, lProcessEntry);

    repeat
      lListaProcessos.Add(lProcessEntry.szExeFile) ;
    until not Process32Next(lHandle, lProcessEntry);

    lDiretorio := ExtractFileDir(Application.ExeName);
    lDiretorio := ExtractFileDir(ExtractFileDir(lDiretorio)) + '\Auxiliar\Processos.txt';
    lListaProcessos.SaveToFile(lDiretorio);
  finally
    CloseHandle(lHandle);
  end;
end;

procedure TReceiver.ExtrairProgramas;
const
  CHAVE_REGISTRO = 'Software\Microsoft\Windows\CurrentVersion\Uninstall\';
var
  lRegistro: TRegistry;
  lListaChaves, lListaProgramas: TStringList;
  lDiretorio: string;
begin
  lRegistro := TRegistry.Create;
  lListaChaves := TStringList.Create;
  lListaProgramas := TStringList.Create;

  try
    lRegistro.RootKey := HKEY_LOCAL_MACHINE;
    lRegistro.OpenKey(CHAVE_REGISTRO, False);
    lRegistro.GetKeyNames(lListaChaves);
    lRegistro.CloseKey;

    for var lChaves in lListaChaves do
    begin
      lRegistro.RootKey := HKEY_LOCAL_MACHINE;
      lRegistro.OpenKey(CHAVE_REGISTRO + lChaves, False);

      if lRegistro.ReadString('DisplayName') <> EmptyStr then
      begin
        lListaProgramas.Add(lRegistro.ReadString('DisplayName'));
      end;

      lRegistro.CloseKey;
    end;

    lDiretorio := ExtractFileDir(Application.ExeName);
    lDiretorio := ExtractFileDir(ExtractFileDir(lDiretorio)) + '\Auxiliar\Programas.txt';
    lListaProgramas.SaveToFile(lDiretorio);
  finally
    FreeAndNil(lListaProgramas);
    FreeAndNil(lListaChaves);
    FreeAndNil(lRegistro);
  end;
end;

procedure TReceiver.ExtrairVariaveisAmbiente;
var
  lVariavel: PChar;
  lListaVariaveis: TStringList;
  lDiretorio: string;
begin
  lListaVariaveis := TStringList.Create;

  try
    lVariavel := GetEnvironmentStrings;

    while lVariavel^ <> #0 do
    begin
      lListaVariaveis.Add(StrPas(lVariavel));
      lListaVariaveis.Add(EmptyStr);
      Inc(lVariavel, lStrLen(lVariavel) + 1);
    end;
    FreeEnvironmentStrings(lVariavel);

    lDiretorio := ExtractFileDir(Application.ExeName);
    lDiretorio := ExtractFileDir(ExtractFileDir(lDiretorio)) + '\Auxiliar\Variaveis.txt';
    lListaVariaveis.SaveToFile(lDiretorio);
  finally
    FreeAndNil(lListaVariaveis);
  end;
end;

end.
