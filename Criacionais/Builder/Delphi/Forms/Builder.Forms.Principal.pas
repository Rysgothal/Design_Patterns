unit Builder.Forms.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    Bevel: TBevel;
    btnGerarRelatorio: TBitBtn;
    dbgPrincipal: TDBGrid;
    DataSource: TDataSource;
    ClientDataSet: TClientDataSet;
    procedure btnGerarRelatorioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  Builder.Classes.Diretor, Builder.Classes.Produto, Builder.Classes.Builder,
  Builder.Interfaces.Builder;

{$R *.dfm}

procedure TfrmPrincipal.btnGerarRelatorioClick(Sender: TObject);
var
  lDiretor: TDiretor;
  lBuider: IBuilder;
  lProduto: TProduto;
begin
  lDiretor := TDiretor.Create;
  lBuider := TBuilder.Create(ClientDataSet.Data);

  try
    lDiretor.Construir(lBuider);                // Solicita a construção do objeto (relatório) ao Director
    lProduto := lBuider.GetRelatorio;           // Recebe o produto pronto (constrúido)
    lProduto.SalvarArquivo;                     // Chama o método para salvar o arquivo em disco
  finally
    FreeAndNil(lDiretor);
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  lDiretorioXML: string;
begin
  lDiretorioXML := ExtractFileDir(GetCurrentDir);
  lDiretorioXML := ExtractFileDir(lDiretorioXML);
  lDiretorioXML := lDiretorioXML + '\Auxiliar\vendors.xml';

  ClientDataSet.LoadFromFile(lDiretorioXML);
end;

end.
