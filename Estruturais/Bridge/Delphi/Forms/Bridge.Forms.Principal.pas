unit Bridge.Forms.Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons;

type
  TfFormulario = class(TForm)
    ClientDataSetClientes: TClientDataSet;
    ClientDataSetProdutos: TClientDataSet;
    DBGridClientes: TDBGrid;
    DBGridProdutos: TDBGrid;
    btnExportarClientesXLS: TBitBtn;
    btnExportarClientesHTML: TBitBtn;
    btnExportarProdutosXLS: TBitBtn;
    btnExportarProdutosHTML: TBitBtn;
    DataSourceClientes: TDataSource;
    DataSourceProdutos: TDataSource;
    ClientDataSetClientesCodigo: TIntegerField;
    ClientDataSetClientesNome: TStringField;
    ClientDataSetClientesCidade: TStringField;
    ClientDataSetProdutosCodigo: TIntegerField;
    ClientDataSetProdutosDescricao: TStringField;
    ClientDataSetProdutosEstoque: TIntegerField;
    Bevel: TBevel;
    LabelClientes: TLabel;
    LabelProdutos: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnExportarClientesXLSClick(Sender: TObject);
    procedure btnExportarClientesHTMLClick(Sender: TObject);
    procedure btnExportarProdutosXLSClick(Sender: TObject);
    procedure btnExportarProdutosHTMLClick(Sender: TObject);
  end;

var
  fFormulario: TfFormulario;

implementation

uses
  Bridge.Interfaces.Abstraction, Bridge.Interfaces.RefinedAbstractions,
  Bridge.Interfaces.ConcreteImplementors.FormatoXLS,
  Bridge.Interfaces.ConcreteImplementors.FormatoHTML,
  Bridge.Interfaces.RefinedAbstractions.ExportadorProdutos;

{$R *.dfm}

procedure TfFormulario.btnExportarClientesXLSClick(Sender: TObject);
var
  lExportador: IExportador;
begin
  lExportador := TExportadorClientes.Create(TFormatoXLS.Create);

  try
    lExportador.ExportarDados(ClientDataSetClientes.Data);
  finally
    lExportador := nil;
  end;
end;

procedure TfFormulario.btnExportarClientesHTMLClick(Sender: TObject);
var
  lExportador: IExportador;
begin
  lExportador := TExportadorClientes.Create(TFormatoHTML.Create);

  try
    lExportador.ExportarDados(ClientDataSetClientes.Data);
  finally
    lExportador := nil;
  end;
end;

procedure TfFormulario.FormCreate(Sender: TObject);
var
  lCaminho: string;
begin
  lCaminho := ExtractFileDir(Application.ExeName);
  lCaminho := ExtractFileDir(ExtractFileDir(lCaminho));
  lCaminho := lCaminho + '\Auxiliar\';

  ClientDataSetClientes.LoadFromFile(lCaminho + 'Clientes.xml');
  ClientDataSetProdutos.LoadFromFile(lCaminho + 'Produtos.xml');
end;

procedure TfFormulario.btnExportarProdutosXLSClick(Sender: TObject);
var
  lExportador: IExportador;
begin
  lExportador := TExportadorProdutos.Create(TFormatoXLS.Create);

  try
    lExportador.ExportarDados(ClientDataSetProdutos.Data);
  finally
    lExportador := nil;
  end;
end;

procedure TfFormulario.btnExportarProdutosHTMLClick(Sender: TObject);
var
  lExportador: IExportador;
begin
  lExportador := TExportadorProdutos.Create(TFormatoHTML.Create);

  try
    lExportador.ExportarDados(ClientDataSetProdutos.Data);
  finally
    lExportador := nil;
  end;
end;

end.
