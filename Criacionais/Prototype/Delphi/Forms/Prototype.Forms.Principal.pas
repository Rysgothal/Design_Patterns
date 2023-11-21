unit Prototype.Forms.Principal;

interface

uses
  System.UITypes, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Contnrs, ExtCtrls, System.Generics.Collections,
  Prototype.Classes.Principal, Prototype.Interfaces.Prototype;

type
  TfrmPrincipal = class(TForm)
    BitBtnDuplicar: TBitBtn;
    BitBtnNova: TBitBtn;
    ColorBoxCategoria: TColorBox;
    DateTimePickerData: TDateTimePicker;
    DateTimePickerHora: TDateTimePicker;
    EditNome: TEdit;
    LabelCategoria: TLabel;
    LabelData: TLabel;
    LabelHora: TLabel;
    LabelListaReunioes: TLabel;
    LabelNomeReuniao: TLabel;
    LabelParticipantes: TLabel;
    ListBox: TListBox;
    MemoParticipantes: TMemo;
    Panel: TPanel;
    procedure EditNomeExit(Sender: TObject);
    procedure DateTimePickerDataExit(Sender: TObject);
    procedure BitBtnDuplicarClick(Sender: TObject);
    procedure BitBtnNovaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBoxClick(Sender: TObject);
    procedure DateTimePickerHoraExit(Sender: TObject);
    procedure ColorBoxCategoriaExit(Sender: TObject);
    procedure MemoParticipantesExit(Sender: TObject);
  private
    FListaReunioes: TList<IPrototype>;       // lista das reuniões
    FReuniaoSelecionada: TReuniao;           // armazenar a reunião atualmente selecionada
    procedure AdicionarNovaReuniaoNaListBox;
    procedure PreencherDados;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.EditNomeExit(Sender: TObject);
begin
  FReuniaoSelecionada.Nome := Trim(EditNome.Text);
end;

procedure TfrmPrincipal.DateTimePickerDataExit(Sender: TObject);
begin
  FReuniaoSelecionada.Data := DateTimePickerData.Date;
end;

procedure TfrmPrincipal.BitBtnDuplicarClick(Sender: TObject);
var
  lReuniaoClone: IPrototype;
begin
  if ListBox.Count = 0 then
  begin
    Application.MessageBox('Não existem reuniões na lista! Clique em "Nova" para adicionar.', 'Atenção', mb_OK +
      MB_ICONINFORMATION);
    BitBtnNova.SetFocus;
    Exit;
  end;

  lReuniaoClone := FReuniaoSelecionada.Clonar;
  FListaReunioes.Add(lReuniaoClone);
  AdicionarNovaReuniaoNaListBox;
  PreencherDados;
  EditNome.SetFocus;
end;

procedure TfrmPrincipal.BitBtnNovaClick(Sender: TObject);
var
  lNovaReuniao: IPrototype;
begin
  Panel.Visible := True;

  lNovaReuniao := TReuniao.Create;
  FListaReunioes.Add(lNovaReuniao);
  AdicionarNovaReuniaoNaListBox;
  PreencherDados;
  EditNome.SetFocus;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FListaReunioes := TList<IPrototype>.Create;
end;

procedure TfrmPrincipal.ListBoxClick(Sender: TObject);
begin
  PreencherDados;
end;

procedure TfrmPrincipal.DateTimePickerHoraExit(Sender: TObject);
begin
  FReuniaoSelecionada.Hora := DateTimePickerHora.Time;
end;

procedure TfrmPrincipal.ColorBoxCategoriaExit(Sender: TObject);
begin
  FReuniaoSelecionada.Categoria := ColorBoxCategoria.Selected;
end;

procedure TfrmPrincipal.MemoParticipantesExit(Sender: TObject);
begin
  FReuniaoSelecionada.Participantes := MemoParticipantes.Text;
end;

procedure TfrmPrincipal.AdicionarNovaReuniaoNaListBox;
begin
  ListBox.Items.Add('Reunião #' + IntToStr(ListBox.Items.Count + 1));
  ListBox.ItemIndex := ListBox.Items.Count - 1;
end;

procedure TfrmPrincipal.PreencherDados;
begin
  FReuniaoSelecionada := FListaReunioes[ListBox.ItemIndex] as TReuniao;

  EditNome.Text := FReuniaoSelecionada.Nome;
  DateTimePickerData.Date := FReuniaoSelecionada.Data;
  DateTimePickerHora.Time := FReuniaoSelecionada.Hora;
  ColorBoxCategoria.Selected := FReuniaoSelecionada.Categoria;
  MemoParticipantes.Text := FReuniaoSelecionada.Participantes;
end;

end.