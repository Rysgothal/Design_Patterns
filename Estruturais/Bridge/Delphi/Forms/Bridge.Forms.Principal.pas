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
    BitBtnExportarClientesXLS: TBitBtn;
    BitBtnExportarClientesHTML: TBitBtn;
    BitBtnExportarProdutosXLS: TBitBtn;
    BitBtnExportarProdutosHTML: TBitBtn;
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
    procedure BitBtnExportarClientesXLSClick(Sender: TObject);
    procedure BitBtnExportarClientesHTMLClick(Sender: TObject);
    procedure BitBtnExportarProdutosXLSClick(Sender: TObject);
    procedure BitBtnExportarProdutosHTMLClick(Sender: TObject);
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

procedure TfFormulario.BitBtnExportarClientesXLSClick(Sender: TObject);
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

procedure TfFormulario.BitBtnExportarClientesHTMLClick(Sender: TObject);
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
  lCaminhoAplicacao: string;
begin
  lCaminhoAplicacao := ExtractFilePath(Application.ExeName);
  ClientDataSetClientes.LoadFromFile(lCaminhoAplicacao + 'Clientes.xml');
  ClientDataSetProdutos.LoadFromFile(lCaminhoAplicacao + 'Produtos.xml');
end;

procedure TfFormulario.BitBtnExportarProdutosXLSClick(Sender: TObject);
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

procedure TfFormulario.BitBtnExportarProdutosHTMLClick(Sender: TObject);
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
