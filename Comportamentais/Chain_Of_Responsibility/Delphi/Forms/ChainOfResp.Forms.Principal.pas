unit ChainOfResp.Forms.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Data.DB, Datasnap.DBClient;

type
  TfrmPrincipal = class(TForm)
    LabelArquivo: TLabel;
    edtArquivo: TEdit;
    btnProcessarInclusao: TBitBtn;
    DBGrid: TDBGrid;
    OpenDialog: TOpenDialog;
    ClientDataSet: TClientDataSet;
    DataSource: TDataSource;
    ClientDataSetCodigo: TIntegerField;
    ClientDataSetNome: TStringField;
    ClientDataSetCidade: TStringField;
    procedure btnProcessarInclusaoClick(Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  ChainOfResp.Interfaces.Parser,
  ChainOfResp.Classes.ParserCSV, ChainOfResp.Classes.ParserXML,
  ChainOfResp.Classes.ParserJSON, ChainOfResp.Classes.ParserTXT;

{$R *.dfm}

procedure TfrmPrincipal.btnProcessarInclusaoClick(Sender: TObject);
var
  lParserTXT, lParserCSV, lParserXML, lParserJSON: IParser;
  lCaminho: string;
begin
  lCaminho := ExtractFileDir(Application.ExeName);
  lCaminho := ExtractFileDir(ExtractFileDir(lCaminho)) + '\Auxiliar';
  OpenDialog.InitialDir := lCaminho;

  if not OpenDialog.Execute then
  begin
    Exit;
  end;

  edtArquivo.Text := OpenDialog.FileName;

  lParserTXT := TParserTXT.Create;
  lParserCSV := TParserCSV.Create;
  lParserXML := TParserXML.Create;
  lParserJSON := TParserJSON.Create;

  lParserTXT.SetProximoParser(lParserCSV);
  lParserCSV.SetProximoParser(lParserXML);
  lParserXML.SetProximoParser(lParserJSON);
  lParserJSON.SetProximoParser(nil);

  ClientDataSet.EmptyDataSet;
  lParserTXT.ProcessarInclusao(OpenDialog.FileName, ClientDataSet);
  ClientDataSet.First;
end;

end.