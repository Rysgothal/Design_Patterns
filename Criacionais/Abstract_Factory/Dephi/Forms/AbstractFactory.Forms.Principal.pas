unit AbstractFactory.Forms.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  AbstractFactory.Interfaces.Principal;

type
  TMarcasProdutos = (mpApple, mpLenovo, mpDell);

  TfrmPrincipal = class(TForm)
    cbxMarcas: TComboBox;
    lblMarca: TLabel;
    btnPesquisar: TButton;
    gbxNotebook: TGroupBox;
    ledTela: TLabeledEdit;
    ledMemoria: TLabeledEdit;
    gbxDesktop: TGroupBox;
    ledProcessador: TLabeledEdit;
    ledArmazenamento: TLabeledEdit;
    procedure cbxMarcasChange(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    procedure MostrarProdutos;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  AbstractFactory.Classes.Principal;

{$R *.dfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.btnPesquisarClick(Sender: TObject);
begin
  MostrarProdutos;
end;

procedure TfrmPrincipal.cbxMarcasChange(Sender: TObject);
begin
  MostrarProdutos;
end;

procedure TfrmPrincipal.MostrarProdutos;
var
  lMarca: IFactoryMarca;
  lNotebook: INotebook;
  lDesktop: IDesktop;
  lOpcao: Byte;
begin
  lOpcao := cbxMarcas.ItemIndex;

  case TMarcasProdutos(lOpcao) of
    mpApple: lMarca := TApple.Create;
    mpLenovo: lMarca := TLenovo.Create;
    mpDell: lMarca := TDell.Create;
  end;

  lNotebook := lMarca.ConsultarNotebook;
  lDesktop := lMarca.ConsultarDesktop;

  ledTela.Text := lNotebook.BuscarTamanhoTela;
  ledMemoria.Text := lNotebook.BuscarMemoriaRAM;
  ledProcessador.Text := lDesktop.BuscarNomeProcessador;
  ledArmazenamento.Text := lDesktop.BuscarTamanhoHD;
end;

end.
