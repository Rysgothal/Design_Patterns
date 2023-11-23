unit Command.Forms.Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmPrincipal = class(TForm)
    GroupBox: TGroupBox;
    MemoProgramas: TMemo;
    LabelProgramas: TLabel;
    LabelProcessos: TLabel;
    MemoProcessos: TMemo;
    BitBtnExecutarComandos: TBitBtn;
    CheckBoxProgramas: TCheckBox;
    CheckBoxProcessos: TCheckBox;
    CheckBoxVariaveisAmbiente: TCheckBox;
    LabelVariaveisAmbiente: TLabel;
    MemoVariaveis: TMemo;
    procedure BitBtnExecutarComandosClick(Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  Command.Classes.Reciver, Command.Classes.Invoker, Command.Classes.Programas,
  Command.Classes.Processos, Command.Classes.VariaveisAmbiente;

{$R *.dfm}

procedure TfrmPrincipal.BitBtnExecutarComandosClick(Sender: TObject);
var
  lReceiver: TReceiver;
  lInvoker: TInvoker;
  lCaminho: string;
begin
  lCaminho := ExtractFileDir(Application.ExeName);
  lCaminho := ExtractFileDir(ExtractFileDir(lCaminho)) + '\Auxiliar';

  DeleteFile(lCaminho + '\Programas.txt');
  DeleteFile(lCaminho + '\Processos.txt');
  DeleteFile(lCaminho + '\Variaveis.txt');

  lReceiver := TReceiver.Create;
  lInvoker := TInvoker.Create;

  try
    if CheckBoxProgramas.Checked then
    begin
      lInvoker.Add(TProgramas.Create(lReceiver));
    end;

    if CheckBoxProcessos.Checked then
    begin
      lInvoker.Add(TProcessos.Create(lReceiver));
    end;

    if CheckBoxVariaveisAmbiente.Checked then
    begin
      lInvoker.Add(TVariaveisAmbiente.Create(lReceiver));
    end;

    lInvoker.ExtrairInformacoes;
  finally
    FreeAndNil(lInvoker);
    FreeAndNil(lReceiver);
  end;

  MemoProgramas.Clear;
  MemoProcessos.Clear;
  MemoVariaveis.Clear;  

  if FileExists(lCaminho + '\Programas.txt') then
  begin
    MemoProgramas.Lines.LoadFromFile(lCaminho + '\Programas.txt');
  end;

  if FileExists(lCaminho + '\Processos.txt') then
  begin
    MemoProcessos.Lines.LoadFromFile(lCaminho + '\Processos.txt');
  end;

  if FileExists(lCaminho + '\Variaveis.txt') then
  begin
    MemoVariaveis.Lines.LoadFromFile(GetCurrentDir + '\Variaveis.txt');
  end;
end;

end.
