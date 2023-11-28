unit View.Formulario;

{
  Exemplo de Strategy com Delphi
  Criado por André Luis Celestino: www.andrecelestino.com
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Strategy.Classes.Context;

type
  { Client }
  TfrmPrincipal = class(TForm)
    Bevel: TBevel;
    btnValidar: TBitBtn;
    cbxAlgortimo: TComboBox;
    edtEmail: TEdit;
    lblAlgoritmo: TLabel;
    lblEmail: TLabel;
    lblResultado: TLabel;
    procedure btnValidarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FContext: TContext;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation


{$R *.dfm}

procedure TfrmPrincipal.btnValidarClick(Sender: TObject);
var
  lTipoValidacao: TTipoValidacao;
  lEmailValido: Boolean;
begin
  lblResultado.Caption := EmptyStr;
  Application.ProcessMessages;

  case cbxAlgortimo.ItemIndex of
    0: lTipoValidacao := avDLL;
    1: lTipoValidacao := avRegExLib;
    2: lTipoValidacao := avMailBoxLayer;
    else Exit;
  end;

  lEmailValido := FContext.ValidarEmail(lTipoValidacao, edtEmail.Text);

  // Apresenta o resultado na tela
  lblResultado.Caption := 'O endereço de e-mail está incorreto.';
  lblResultado.Font.Color := clRed;

  if lEmailValido then
  begin
    lblResultado.Caption := 'O endereço de e-mail é válido!';
    lblResultado.Font.Color := clGreen;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FContext := TContext.Create;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FContext);
end;

end.
