unit Singleton.Forms.Sorteio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBClient;

type
  TfrmSorteio = class(TForm)
    LabelParticipantes: TLabel;
    BitBtnSortear: TBitBtn;
    LabelSorteado: TLabel;
    EditSorteado: TEdit;
    ClientDataSet: TClientDataSet;
    ListBox: TListBox;
    procedure FormShow(Sender: TObject);
    procedure BitBtnSortearClick(Sender: TObject);
  private
    procedure PreencherParticipantes;
  end;

var
  frmSorteio: TfrmSorteio;

implementation

uses
  Singleton.Classes.Logs;

{$R *.dfm}

procedure TfrmSorteio.FormShow(Sender: TObject);
var
  lLogger: TLoggerSingleton;
begin
  lLogger := TLoggerSingleton.ObterInstancia;
  lLogger.RegistrarLog('Usuário abriu a tela de Sorteio.');

  PreencherParticipantes;
end;

procedure TfrmSorteio.PreencherParticipantes;
var
  lDiretorioAplicacao: string;
begin
  lDiretorioAplicacao := ExtractFilePath(Application.ExeName);

  if not FileExists(lDiretorioAplicacao + 'Participantes.xml') then
  begin
    Exit;
  end;

  ClientDataSet.LoadFromFile(lDiretorioAplicacao + 'Participantes.xml');
  ClientDataSet.First;

  while not ClientDataSet.Eof do
  begin
    ListBox.Items.Add(ClientDataSet.FieldByName('Nome').AsString);
    ClientDataSet.Next;
  end;
end;

procedure TfrmSorteio.BitBtnSortearClick(Sender: TObject);
var
  lSorteado: SmallInt;
  lLogger: TLoggerSingleton;
begin
  // "embaralha" os números
  Randomize;

  lSorteado := Random(Pred(ListBox.Items.Count));
  ListBox.ItemIndex := lSorteado;
  EditSorteado.Text := ListBox.Items[lSorteado];

  lLogger := TLoggerSingleton.ObterInstancia;
  lLogger.RegistrarLog('Participante sorteado: ' + ListBox.Items[lSorteado]);
end;

end.
