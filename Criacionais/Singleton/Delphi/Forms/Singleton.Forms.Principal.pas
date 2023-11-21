unit Singleton.Forms.Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TfrmPrincipal = class(TForm)
    BitBtnCadastrarParticipantes: TBitBtn;
    BitBtnRealizarSorteio: TBitBtn;
    Bevel: TBevel;
    BitBtnAbrirLog: TBitBtn;
    procedure BitBtnAbrirLogClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnCadastrarParticipantesClick(Sender: TObject);
    procedure BitBtnRealizarSorteioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  ShellAPI, Singleton.Classes.Logs, Singleton.Forms.Cadastro,
  Singleton.Forms.Sorteio;

{$R *.dfm}

procedure TfrmPrincipal.BitBtnAbrirLogClick(Sender: TObject);
var
  lDiretorioAplicacao: string;
begin
  lDiretorioAplicacao := ExtractFileDir(Application.ExeName);
  lDiretorioAplicacao := ExtractFileDir(ExtractFileDir(lDiretorioAplicacao));
  lDiretorioAplicacao := lDiretorioAplicacao + '\Auxiliar\Log.txt';
  ShellExecute(Handle, 'open', PWideChar(lDiretorioAplicacao), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
var
  lLogger: TLoggerSingleton;
begin
  lLogger := TLoggerSingleton.ObterInstancia;
  lLogger.RegistrarLog('Usuário fechou a aplicação.');
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
  lLogger: TLoggerSingleton;
begin
  lLogger := TLoggerSingleton.ObterInstancia;
  lLogger.RegistrarLog('Usuário iniciou a aplicação.');
end;

procedure TfrmPrincipal.BitBtnCadastrarParticipantesClick(Sender: TObject);
begin
  if not Assigned(frmCadastro) then
  begin
    frmCadastro := TfrmCadastro.Create(Self);
  end;

  frmCadastro.ShowModal;
  FreeAndNil(frmCadastro);
end;

procedure TfrmPrincipal.BitBtnRealizarSorteioClick(Sender: TObject);
begin
  if not Assigned(frmSorteio) then
  begin
    frmSorteio := TfrmSorteio.Create(Self);
  end;

  frmSorteio.ShowModal;
  FreeAndNil(frmSorteio);
end;

end.

