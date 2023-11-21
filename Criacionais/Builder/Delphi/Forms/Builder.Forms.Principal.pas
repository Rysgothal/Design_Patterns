unit Builder.Forms.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    Bevel: TBevel;
    BitBtn1: TBitBtn;
    DBGrid: TDBGrid;
    DataSource: TDataSource;
    ClientDataSet: TClientDataSet;
    procedure BitBtn1Click(Sender: TObject);
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
  Builder.Classes.Diretor, Builder.Classes.Produto, Builder.Classes.Builder;

{$R *.dfm}

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
var
  lDiretor: TDiretor;
  lBuider: TBuilder;
  lProduto: TProduto;
begin
  lDiretor := TDiretor.Create;
  lBuider := TBuilder.Create(ClientDataSet.Data);

  try
    lDiretor.Construir(lBuider);                // Solicita a constru��o do objeto (relat�rio) ao Director
    lProduto := lBuider.GetRelatorio;           // Recebe o produto pronto (constr�ido)
    lProduto.SalvarArquivo;                     // Chama o m�todo para salvar o arquivo em disco
  finally
    FreeAndNil(lDiretor);
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ClientDataSet.LoadFromFile(GetCurrentDir + '\vendors.xml');
end;

end.
