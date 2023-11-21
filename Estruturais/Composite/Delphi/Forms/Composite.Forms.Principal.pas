unit Composite.Forms.Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Composite.Classes.Composite;

type
  TfrmPrincipal = class(TForm)
    BitBtnCalcular: TBitBtn;
    LabelTotal: TLabel;
    EditTotal: TEdit;
    GroupBoxAdicionarViagem: TGroupBox;
    LabelOrigem: TLabel;
    ComboBoxOrigem: TComboBox;
    LabelDestino: TLabel;
    ComboBoxDestino: TComboBox;
    BitBtnAdicionarViagem: TBitBtn;
    MemoViagens: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnAdicionarViagemClick(Sender: TObject);
    procedure BitBtnCalcularClick(Sender: TObject);
    procedure ComboBoxOrigemChange(Sender: TObject);
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

procedure TfrmPrincipal.BitBtnAdicionarViagemClick(Sender: TObject);
var
  Viagem: TViagem;
begin
  MemoViagens.Lines.Add(Format('%s -> %s',
    [ComboBoxOrigem.Text, ComboBoxDestino.Text]));

  Viagem := TViagem.Create;
  Viagem.DefinirOrigem(ComboBoxOrigem.Text);
  Viagem.DefinirDestino(ComboBoxDestino.Text);
  FPacoteViagem.AdicionarViagem(Viagem);

  ComboBoxOrigem.ItemIndex := ComboBoxOrigem.Items.IndexOf(ComboBoxDestino.Text);
  ComboBoxDestino.ItemIndex := -1;
  ComboBoxDestino.SetFocus;
end;

procedure TfrmPrincipal.BitBtnCalcularClick(Sender: TObject);
begin
  Application.MessageBox('Neste momento, o "Composite" (Pacote de Viagem) ' + sLineBreak +
    'irá ler cada Leaf/Folha/Filho (Viagem), executando o "Operation" (CalcularValor)' + sLineBreak +
    'para calcular o valor de cada viagem e, no final, obter a soma total.', 'Atenção', MB_OK + MB_ICONINFORMATION);

  EditTotal.Text :=   FormatFloat('###,##0.00', FPacoteViagem.CalcularValor);
end;

procedure TfrmPrincipal.ComboBoxOrigemChange(Sender: TObject);
begin
  ComboBoxDestino.Items := ComboBoxOrigem.Items;
  ComboBoxDestino.Items.Delete(ComboBoxDestino.Items.IndexOf(ComboBoxOrigem.Text));
end;

end.