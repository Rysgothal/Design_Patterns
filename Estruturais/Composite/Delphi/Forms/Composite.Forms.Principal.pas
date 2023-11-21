unit Composite.Forms.Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Composite.Classes.Composite;

type
  TfrmPrincipal = class(TForm)
    btnCalcular: TBitBtn;
    lblTotal: TLabel;
    edtTotal: TEdit;
    gbxAdicionarViagem: TGroupBox;
    lblOrigem: TLabel;
    cbxOrigem: TComboBox;
    lblDestino: TLabel;
    cbxDestino: TComboBox;
    btnAdicionarViagem: TBitBtn;
    memViagens: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionarViagemClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure cbxOrigemChange(Sender: TObject);
  private
    FPacoteViagem: TPacoteViagem;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  System.UITypes, Composite.Classes.Filha;

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FPacoteViagem := TPacoteViagem.Create;
end;

procedure TfrmPrincipal.btnAdicionarViagemClick(Sender: TObject);
var
  lViagem: TViagem;
begin
  memViagens.Lines.Add(Format('%s -> %s', [cbxOrigem.Text, cbxDestino.Text]));

  lViagem := TViagem.Create;
  lViagem.DefinirOrigem(cbxOrigem.Text);
  lViagem.DefinirDestino(cbxDestino.Text);
  FPacoteViagem.AdicionarViagem(lViagem);

  cbxOrigem.ItemIndex := cbxOrigem.Items.IndexOf(cbxDestino.Text);
  cbxDestino.ItemIndex := -1;
  cbxDestino.SetFocus;
end;

procedure TfrmPrincipal.btnCalcularClick(Sender: TObject);
begin
  Application.MessageBox('Neste momento, o "Composite" (Pacote de Viagem) ' + sLineBreak +
    'irá ler cada Leaf/Folha/Filho (Viagem), executando o "Operation" (CalcularValor)' + sLineBreak +
    'para calcular o valor de cada viagem e, no final, obter a soma total.', 'Atenção', MB_OK + MB_ICONINFORMATION);

  edtTotal.Text :=   FormatFloat('###,##0.00', FPacoteViagem.CalcularValor);
end;

procedure TfrmPrincipal.cbxOrigemChange(Sender: TObject);
begin
  cbxDestino.Items := cbxOrigem.Items;
  cbxDestino.Items.Delete(cbxDestino.Items.IndexOf(cbxOrigem.Text));
end;

end.