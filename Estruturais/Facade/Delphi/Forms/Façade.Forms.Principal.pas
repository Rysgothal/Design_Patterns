unit Façade.Forms.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TForm1 = class(TForm)
    LabelCliente: TLabel;
    LabelProduto: TLabel;
    LabelHistorico: TLabel;
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
  private
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
  lFidelidade: smallint;
  lPreco: real;
  lFacade: TFacade;
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

    memHistorico.Lines.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Historico.txt');
    memHistorico.Lines.Add(EmptyStr);
    Perform(EM_SCROLL, SB_LINEDOWN, 0);
  finally
    // libera o objeto da memória
    FreeAndNil(lFacade);
  end;
end;

end.
