unit Façade.Forms.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TForm1 = class(TForm)
    lblCliente: TLabel;
    lblProduto: TLabel;
    lblHistorico: TLabel;
    btnCalcularValorDaVenda: TBitBtn;
    DBGridClientes: TDBGrid;
    DBGridProdutos: TDBGrid;
    memHistorico: TMemo;
    ClientDataSetClientes: TClientDataSet;
    ClientDataSetClientesCodigo: TIntegerField;
    ClientDataSetClientesCliente: TStringField;
    ClientDataSetClientesFidelidade: TSmallintField;
    ClientDataSetProdutos: TClientDataSet;
    ClientDataSetProdutosCodigo: TIntegerField;
    ClientDataSetProdutosProduto: TStringField;
    ClientDataSetProdutosPreco: TFloatField;
    DataSourceClientes: TDataSource;
    DataSourceProdutos: TDataSource;
    procedure btnCalcularValorDaVendaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure ClientDataSetClientesFidelidadeGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Façade.Classes.Facade;

{$R *.dfm}

procedure TForm1.btnCalcularValorDaVendaClick(Sender: TObject);
var
  lFidelidade: SmallInt;
  lPreco: Real;
  lFacade: TFacade;
  lCaminho: string;
begin
  Application.MessageBox('Neste momento, o Façade será instanciado para:' + sLineBreak +
             ' - Consultar a cotação do dólar no WebService;' + sLineBreak +
             ' - Calcular o preço em Reais (R$);' + sLineBreak +
             ' - Aplicar desconto conforme Fidelidade e margem de venda;' + sLineBreak +
             ' - Registrar a operação no arquivo "Histórico.txt".', 'Atenção', MB_OK + MB_ICONINFORMATION);

  lFidelidade := ClientDataSetClientes.FieldByName('Fidelidade').AsInteger;
  lPreco := ClientDataSetProdutos.FieldByName('Preco').AsFloat;
  lFacade := TFacade.Create;

  try
    lFacade.CalcularValorDeVenda(lFidelidade, lPreco);

    lCaminho := ExtractFileDir(Application.ExeName);
    lCaminho := ExtractFileDir(ExtractFileDir(lCaminho)) + '\Auxiliar\';
    memHistorico.Lines.LoadFromFile(lCaminho + 'Historico.txt');
    memHistorico.Lines.Add(EmptyStr);
    Perform(EM_SCROLL, SB_LINEDOWN, 0);
  finally
    FreeAndNil(lFacade);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  lCaminho: string;
begin
  lCaminho := ExtractFileDir(Application.ExeName);
  lCaminho := ExtractFileDir(ExtractFileDir(lCaminho)) + '\Auxiliar';
  DeleteFile(lCaminho + '\Historico.txt');

  ClientDataSetClientes.LoadFromFile(lCaminho + '\Clientes.xml');
  ClientDataSetProdutos.LoadFromFile(lCaminho + '\Produtos.xml');
end;

procedure TForm1.ClientDataSetClientesFidelidadeGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  case Sender.AsInteger of
    0: Text := 'Nenhum';
    1: Text := 'Bronze';
    2: Text := 'Prata';
    3: Text := 'Ouro';
  end;
end;

end.
