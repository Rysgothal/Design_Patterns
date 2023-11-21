unit Singleton.Forms.Cadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Grids, DBGrids, DB, DBClient;

type
  TfrmCadastro = class(TForm)
    ClientDataSet: TClientDataSet;
    ClientDataSetCodigo: TIntegerField;
    ClientDataSetNome: TStringField;
    DBGrid: TDBGrid;
    SpeedButtonInserir: TSpeedButton;
    SpeedButtonRemover: TSpeedButton;
    DataSource: TDataSource;
    procedure SpeedButtonInserirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButtonRemoverClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClientDataSetAfterPost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure ClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure ClientDataSetBeforePost(DataSet: TDataSet);
  end;

var
  frmCadastro: TfrmCadastro;

implementation

uses
  Singleton.Classes.Logs;

{$R *.dfm}

procedure TfrmCadastro.SpeedButtonInserirClick(Sender: TObject);
var
  lProximoCodigo: integer;
begin
  ClientDataSet.Last;
  lProximoCodigo := ClientDataSet.FieldByName('Codigo').AsInteger + 1;

  ClientDataSet.Append;
  ClientDataSet.FieldByName('Codigo').AsInteger := lProximoCodigo;

  DBGrid.SetFocus;
  DBGrid.SelectedField := ClientDataSet.FieldByName('Nome');
end;

procedure TfrmCadastro.FormCreate(Sender: TObject);
var
  lDiretorio: string;
begin
  lDiretorio := ExtractFileDir(Application.ExeName);
  lDiretorio := ExtractFileDir(ExtractFileDir(lDiretorio));
  lDiretorio := lDiretorio + '\Auxiliar\Participantes.xml';

  if not FileExists(lDiretorio) then
  begin
    Exit;
  end;

  ClientDataSet.LoadFromFile(lDiretorio);
  ClientDataSet.LogChanges := False;
end;

procedure TfrmCadastro.SpeedButtonRemoverClick(Sender: TObject);
begin
  ClientDataSet.Delete;
end;

procedure TfrmCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
var
  lDiretorio: string;
begin
  lDiretorio := ExtractFileDir(Application.ExeName);
  lDiretorio := ExtractFileDir(ExtractFileDir(lDiretorio));
  lDiretorio := lDiretorio + '\Auxiliar\Participantes.xml';

  ClientDataSet.SaveToFile(lDiretorio);
end;

procedure TfrmCadastro.ClientDataSetAfterPost(DataSet: TDataSet);
var
  lLogger: TLoggerSingleton;
  lTexto: string;
begin
  lTexto := Format('Participante "%s" cadastrado.', [ClientDataSet.FieldByName('Nome').AsString]);

  lLogger := TLoggerSingleton.ObterInstancia;
  lLogger.RegistrarLog(lTexto);
end;

procedure TfrmCadastro.FormShow(Sender: TObject);
var
  lLogger: TLoggerSingleton;
begin
  lLogger := TLoggerSingleton.ObterInstancia;
  lLogger.RegistrarLog('Usuário abriu a tela de Cadastro de Participantes.');
end;

procedure TfrmCadastro.ClientDataSetBeforeDelete(DataSet: TDataSet);
var
  lLogger: TLoggerSingleton;
  lTexto: string;
begin
  lTexto := Format('Participante "%s" removido.', [ClientDataSet.FieldByName('Nome').AsString]);

  lLogger := TLoggerSingleton.ObterInstancia;
  lLogger.RegistrarLog(lTexto);
end;

procedure TfrmCadastro.ClientDataSetBeforePost(DataSet: TDataSet);
begin
  if Trim(ClientDataSet.FieldByName('Nome').AsString) = EmptyStr then
  begin
    ClientDataSet.Cancel;
    Abort;
  end;
end;

end.
