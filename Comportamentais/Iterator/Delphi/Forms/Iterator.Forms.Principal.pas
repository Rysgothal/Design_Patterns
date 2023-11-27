unit Iterator.Forms.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Iterator.Interfaces.Aggregate;

type
  TfFormulario = class(TForm)
    ListBoxClientes: TListBox;
    LabelClientes: TLabel;
    PanelCampos: TPanel;
    LabelNome: TLabel;
    LabelSobrenome: TLabel;
    LabelCodigo: TLabel;
    LabelPais: TLabel;
    LabelEmail: TLabel;
    edtCodigo: TEdit;
    edtNome: TEdit;
    edtEndereco: TEdit;
    edtPais: TEdit;
    edtEmail: TEdit;
    LabelDados: TLabel;
    Bevel: TBevel;
    btnAbrirCSV: TBitBtn;
    btnAbrirXML: TBitBtn;
    OpenDialog: TOpenDialog;
    procedure btnAbrirCSVClick(Sender: TObject);
    procedure btnAbrirXMLClick(Sender: TObject);
    procedure ListBoxClientesClick(Sender: TObject);
  private
    FAggregate: IAggregate;
    procedure CarregarCSV;
    procedure CarregarXML;
    procedure CarregarDadosCliente;
  end;

var
  fFormulario: TfFormulario;

implementation

uses
  Iterator.Interfaces.Iterator, Iterator.Classes.ConcreteAggregateCSV,
  Iterator.Classes.Cliente, Iterator.Classes.ConcreteAggregateXML;

{$R *.dfm}

procedure TfFormulario.btnAbrirCSVClick(Sender: TObject);
begin
  CarregarCSV;
end;

procedure TfFormulario.btnAbrirXMLClick(Sender: TObject);
begin
  CarregarXML;
end;

procedure TfFormulario.CarregarCSV;
var
  lIterator: IIterator;
begin
  if Assigned(FAggregate) then
  begin
    FAggregate := nil;
  end;

  OpenDialog.InitialDir := GetCurrentDir + '\Dados';
  if not OpenDialog.Execute then
  begin
    Exit;
  end;

  FAggregate := TConcreteAggregateCSV.Create(OpenDialog.FileName);
  lIterator := FAggregate.GetIterator;
  ListBoxClientes.Clear;

  lIterator.PrimeiroObjeto;
  while not lIterator.FimLista do
  begin
    lIterator.ProximoObjeto;
    ListBoxClientes.Items.Add((lIterator.ObjetoAtual as TCliente).Nome);
  end;
end;

procedure TfFormulario.CarregarXML;
var
  lIterator: IIterator;
begin
  if Assigned(FAggregate) then
  begin
    FAggregate := nil;
  end;

  OpenDialog.InitialDir := GetCurrentDir + '\Dados';
  if not OpenDialog.Execute then
  begin
    Exit;
  end;

  FAggregate := TConcreteAggregateXML.Create(OpenDialog.FileName);
  lIterator := FAggregate.GetIterator;
  ListBoxClientes.Clear;

  lIterator.PrimeiroObjeto;
  while not lIterator.FimLista do
  begin
    lIterator.ProximoObjeto;
    ListBoxClientes.Items.Add((lIterator.ObjetoAtual as TCliente).Nome);
  end;
end;

procedure TfFormulario.CarregarDadosCliente;
var
  lIterator: IIterator;
  lCliente: TCliente;
begin
  lIterator := FAggregate.GetIterator;
  lCliente := lIterator.Buscar(ListBoxClientes.ItemIndex + 1) as TCliente;

  edtCodigo.Text := IntToStr(lCliente.Codigo);
  edtNome.Text := lCliente.Nome;
  edtEndereco.Text := lCliente.Endereco;
  edtPais.Text := lCliente.Pais;
  edtEmail.Text := lCliente.Email;
end;

procedure TfFormulario.ListBoxClientesClick(Sender: TObject);
begin
  if ListBoxClientes.Items.Count = 0 then
  begin
    Exit;
  end;

  CarregarDadosCliente;
end;

end.
