unit Mediator.Forms.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Mediator.Interfaces.Mediator, Mediator.Interfaces.Colleague, Mediator.Classes.ConcreteMediator,
  Mediator.Forms.CadastroMembro, Mediator.Classes.ColleagueUsuario,
  Mediator.Classes.ColleagueAdministrador;

type
  TfrmPrincipal = class(TForm)
    cbxDestinatario: TComboBox;
    cbxRemetente: TComboBox;
    edtProposta: TEdit;
    gbxPropostas: TGroupBox;
    LabelDe: TLabel;
    LabelMembros: TLabel;
    LabelPara: TLabel;
    lbxMembros: TListBox;
    memLog: TMemo;
    btnAdicionar: TSpeedButton;
    btnEnviar: TSpeedButton;
    btnRemover: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure edtPropostaKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
  private
    FMediator: IMediator;
    procedure AtualizarComboboxes;
    procedure EnviarProposta;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  System.UITypes;

{$R *.dfm}

procedure TfrmPrincipal.AtualizarComboboxes;
var
  lMembros: TArray<string>;
begin
  cbxRemetente.Clear;
  cbxDestinatario.Clear;

  lMembros := FMediator.ObterListaMembros;
  for var lMembro in lMembros do
  begin
    cbxRemetente.Items.Add(lMembro);
    cbxDestinatario.Items.Add(lMembro);
  end;
end;

procedure TfrmPrincipal.edtPropostaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    EnviarProposta;
  end;
end;

procedure TfrmPrincipal.EnviarProposta;
var
  lRemetente: IColleague;
begin
  if (cbxRemetente.ItemIndex < 0) or (cbxDestinatario.ItemIndex < 0) then
  begin
    Application.MessageBox('Informe corretamente o remetente e destinatário.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  lRemetente := FMediator.ObterMembro(cbxRemetente.Text);

  memLog.Lines.Add(lRemetente.EnviarProposta(cbxDestinatario.Text, edtProposta.Text));
  memLog.Lines.Add(EmptyStr);
  edtProposta.Clear;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FMediator := TConcreteMediator.Create;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FMediator.LiberarObjetos;
  FMediator := nil;
end;

procedure TfrmPrincipal.btnEnviarClick(Sender: TObject);
begin
  EnviarProposta;
end;

procedure TfrmPrincipal.btnAdicionarClick(Sender: TObject);
var
  lMembro: IColleague;
  lNome: string;
  lPerfil: Integer;
begin
  if not Assigned(frmCadastroCliente) then
  begin
    frmCadastroCliente := TfrmCadastroCliente.Create(Self);
  end;

  try
    frmCadastroCliente.ShowModal;

    if frmCadastroCliente.ModalResult = mrCancel then
    begin
      Exit;
    end;

    lNome := frmCadastroCliente.edtNome.Text;
    lPerfil := frmCadastroCliente.cbxPerfil.ItemIndex;
  finally
    FreeAndNil(frmCadastroCliente);
  end;

  case lPerfil of
    0: lMembro := TColleagueUsuario.Create(lNome, FMediator);
    1: lMembro := TColleagueAdministrador.Create(lNome, FMediator);
  end;

  MemLog.Lines.Add(lMembro.Entrar);

  MemLog.Lines.Add(EmptyStr);
  lbxMembros.Items.Add(lNome);
  AtualizarComboboxes;
end;

procedure TfrmPrincipal.btnRemoverClick(Sender: TObject);
var
  lNome: string;
  lMembro: IColleague;
begin
  if lbxMembros.ItemIndex < 0 then
  begin
    Exit;
  end;

  lNome := lbxMembros.Items[lbxMembros.ItemIndex];
  lMembro := FMediator.ObterMembro(lNome);
  MemLog.Lines.Add(lMembro.Sair);
  MemLog.Lines.Add(EmptyStr);
  AtualizarComboboxes;
  lbxMembros.DeleteSelected;
end;

end.
