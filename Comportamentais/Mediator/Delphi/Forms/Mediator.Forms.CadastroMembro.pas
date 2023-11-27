unit Mediator.Forms.CadastroMembro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TfrmCadastroCliente = class(TForm)
    Bevel: TBevel;
    btnCancelar: TBitBtn;
    btnOK: TBitBtn;
    cbxPerfil: TComboBox;
    edtNome: TEdit;
    lblNome: TLabel;
    lblPerfil: TLabel;
    procedure btnOKClick(Sender: TObject);
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

uses
  System.UITypes;

{$R *.dfm}

procedure TfrmCadastroCliente.btnOKClick(Sender: TObject);
begin
  if Trim(edtNome.Text).IsEmpty then
  begin
    Application.MessageBox('Digite o nome do membro.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    edtNome.SetFocus;
    Exit;
  end;

  ModalResult := mrOK;
end;

end.
