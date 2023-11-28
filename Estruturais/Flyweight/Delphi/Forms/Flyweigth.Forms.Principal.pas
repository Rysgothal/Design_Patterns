unit Flyweigth.Forms.Principal;

{
  Exemplo de Flyweight com Delphi
  Criado por André Luis Celestino: www.andrecelestino.com
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, Buttons, Grids, DBGrids;

type
  TfrmPrincipal = class(TForm)
    ClientDataSet: TClientDataSet;
    ClientDataSetCodigo: TIntegerField;
    ClientDataSetNome: TStringField;
    ClientDataSetPais: TStringField;
    DataSource: TDataSource;
    DBGrid: TDBGrid;
    btnExportarComFlyweight: TBitBtn;
    btnExportarSemFlyweight: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnExportarComFlyweightClick(Sender: TObject);
    procedure btnExportarSemFlyweightClick(Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  ShellAPI, DateUtils, Flyweight.Classes.FlyweightFactory,
  Flyweight.Classes.ConcreteFlyweight;

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  lCaminho: string;
begin
  lCaminho := ExtractFileDir(Application.ExeName);
  lCaminho := ExtractFileDir(ExtractFileDir(lCaminho)) + '\Auxiliar\';

  ClientDataSet.LoadFromFile(lCaminho + 'Dados.xml');
end;

procedure TfrmPrincipal.btnExportarComFlyweightClick(Sender: TObject);
var
  lFlyweightFactory: TFlyweightFactory;
  lCartao: TCartao;
  lFieldPais, lFieldNome: TField;
  lTempoInicio, lTempoFim: TDateTime;
  lTempoGasto: SmallInt;
  lCaminho: string;
begin
  lCaminho := ExtractFileDir(Application.ExeName);
  lCaminho := ExtractFileDir(ExtractFileDir(lCaminho)) + '\Auxiliar\';
  lFlyweightFactory := TFlyweightFactory.Create;

  try
    lFieldPais := ClientDataSet.FindField('Pais');
    lFieldNome := ClientDataSet.FindField('Nome');
    lTempoInicio := Now;

    ClientDataSet.First;
    while not ClientDataSet.EOF do
    begin
      lCartao := lFlyweightFactory.GetCartao(lFieldPais.AsString);
      lCartao.NomeLeitor := lFieldNome.AsString;
      lCartao.Exportar;
      ClientDataSet.Next;
    end;

    lTempoFim := Now;
    lTempoGasto := SecondsBetween(lTempoFim, lTempoInicio);
    ShowMessage(Format('Tempo gasto com Flyweight: %d segundos', [lTempoGasto]));
  finally
    FreeAndNil(lFlyweightFactory);
  end;

  ShellExecute(Application.Handle, PChar('explore'), PChar(lCaminho + 'Cartoes'), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmPrincipal.btnExportarSemFlyweightClick(Sender: TObject);
var
  lCartao: TCartao;
  lFieldPais, lFieldNome: TField;
  lTempoInicio, lTempoFim: TDateTime;
  lTempoGasto: SmallInt;
  lCaminho: string;
begin
  lCaminho := ExtractFileDir(Application.ExeName);
  lCaminho := ExtractFileDir(ExtractFileDir(lCaminho)) + '\Auxiliar\';

  lFieldPais := ClientDataSet.FindField('Pais');
  lFieldNome := ClientDataSet.FindField('Nome');
  lTempoInicio := Now;

  ClientDataSet.First;
  while not ClientDataSet.EOF do
  begin
    try
      if lFieldPais.AsString = 'Espanha' then
      begin
        lCartao := TCartaoEspanha.Create
      end else
      if lFieldPais.AsString = 'EUA' then
      begin
        lCartao := TCartaoEUA.Create
      end else
      if lFieldPais.AsString = 'Brasil' then
      begin
        lCartao := TCartaoBrasil.Create
      end else
      if lFieldPais.AsString = 'Itália' then
      begin
        lCartao := TCartaoItalia.Create;
      end;

      lCartao.NomeLeitor := lFieldNome.AsString;
      lCartao.Exportar;
    finally
      FreeAndNil(lCartao);
    end;

    ClientDataSet.Next;
  end;
  lTempoFim := Now;
  lTempoGasto := SecondsBetween(lTempoFim, lTempoInicio);
  ShowMessage(Format('Tempo gasto sem Flyweight: %d segundos', [lTempoGasto]));

  ShellExecute(Application.Handle, PChar('explore'),
    PChar(lCaminho + 'Cartoes'), nil, nil, SW_SHOWNORMAL);
end;

end.
