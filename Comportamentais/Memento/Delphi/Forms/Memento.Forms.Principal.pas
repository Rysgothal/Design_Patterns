unit Memento.Forms.Principal;

{
  Exemplo de Memento com Delphi
  Criado por Andr� Luis Celestino: www.andrecelestino.com
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Memento.Classes.Caretaker,
  Memento.Classes.Originator;

type
  TfrmPrincipal = class(TForm)
    lblHistoricoAlteracoes: TLabel;
    lbxHistoricoAlteracoes: TListBox;
    RichEditTexto: TRichEdit;
    lblTitulo: TLabel;
    edtTitulo: TEdit;
    PanelBarraFerramentas: TPanel; 
    btnSalvar: TBitBtn;
    btnNegrito: TSpeedButton;
    btnItalico: TSpeedButton;
    btnSublinhado: TSpeedButton;
    ColorBoxCor: TColorBox;
    procedure btnSublinhadoClick(Sender: TObject);
    procedure btnItalicoClick(Sender: TObject);
    procedure ColorBoxCorSelect(Sender: TObject);
    procedure btnNegritoClick(Sender: TObject);
    procedure RichEditTextoClick(Sender: TObject);
    procedure RichEditTextoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure lbxHistoricoAlteracoesClick(Sender: TObject);
  private
    FCaretaker: TCaretaker;
    FOriginator: TOriginator;

    procedure AplicarEstilo(const Formatacao: TFontStyle);
    procedure AtualizarBarraFerramentas;
    procedure AtualizarCaixaCores;
    procedure AtualizarBotoesEstiloFonte;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FCaretaker := TCaretaker.Create;
  FOriginator := TOriginator.Create;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FOriginator);
  FreeAndNil(FCaretaker);
end;

procedure TfrmPrincipal.btnSalvarClick(Sender: TObject);
var
  lDataHoraAtual: string;
  lTexto: TStringStream;
begin
  FOriginator.Titulo := edtTitulo.Text;
  lTexto := TStringStream.Create;

  try
    RichEditTexto.Lines.SaveToStream(lTexto);

    FOriginator.Texto := lTexto.DataString;
  finally
    FreeAndNil(lTexto);
  end;

  lDataHoraAtual := FormatDateTime('dd/mm/yyyy hh:nn:ss:zzz', Now);
  FCaretaker.Adicionar(lDataHoraAtual, FOriginator.SalvarEstado);

  lbxHistoricoAlteracoes.Items.Add(lDataHoraAtual);
  lbxHistoricoAlteracoes.ItemIndex := Pred(lbxHistoricoAlteracoes.Count);
end;

procedure TfrmPrincipal.lbxHistoricoAlteracoesClick(Sender: TObject);
var
  lDataHora: string;
  lTexto: TStringStream;
begin
  lDataHora := lbxHistoricoAlteracoes.Items[lbxHistoricoAlteracoes.ItemIndex];
  FOriginator.RestaurarEstado(FCaretaker.Obter(lDataHora));

  edtTitulo.Text := FOriginator.Titulo;
  lTexto := TStringStream.Create(FOriginator.Texto);

  try
    RichEditTexto.Lines.LoadFromStream(lTexto);
  finally
    FreeAndNil(lTexto);
  end;
end;

procedure TfrmPrincipal.ColorBoxCorSelect(Sender: TObject);
begin
  RichEditTexto.SelAttributes.Color := ColorBoxCor.Selected;
end;

procedure TfrmPrincipal.AtualizarCaixaCores;
begin
  ColorBoxCor.Selected := RichEditTexto.SelAttributes.Color;
end;

procedure TfrmPrincipal.AtualizarBotoesEstiloFonte;
begin
  btnNegrito.Down := fsBold in RichEditTexto.SelAttributes.Style;
  btnItalico.Down := fsItalic in RichEditTexto.SelAttributes.Style;
  btnSublinhado.Down := fsUnderline in RichEditTexto.SelAttributes.Style;
end;

procedure TfrmPrincipal.AtualizarBarraFerramentas;
begin
  AtualizarCaixaCores;
  AtualizarBotoesEstiloFonte;
end;

procedure TfrmPrincipal.RichEditTextoClick(Sender: TObject);
begin
  AtualizarBarraFerramentas;
end;

procedure TfrmPrincipal.RichEditTextoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  AtualizarBarraFerramentas;
end;

procedure TfrmPrincipal.AplicarEstilo(const Formatacao: TFontStyle);
begin
  case Formatacao in RichEditTexto.SelAttributes.Style of
    True: RichEditTexto.SelAttributes.Style := RichEditTexto.SelAttributes.Style - [Formatacao];
    else RichEditTexto.SelAttributes.Style := RichEditTexto.SelAttributes.Style + [Formatacao];
  end;

  RichEditTexto.SetFocus;
end;

procedure TfrmPrincipal.btnItalicoClick(Sender: TObject);
begin
  AplicarEstilo(fsItalic);
end;

procedure TfrmPrincipal.btnNegritoClick(Sender: TObject);
begin
  AplicarEstilo(fsBold);
end;

procedure TfrmPrincipal.btnSublinhadoClick(Sender: TObject);
begin
  AplicarEstilo(fsUnderline);
end;

end.
