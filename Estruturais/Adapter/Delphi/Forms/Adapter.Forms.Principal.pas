unit Adapter.Forms.Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TfrmPrincipal = class(TForm)
    lbCEP: TLabel;
    lbCidade: TLabel;
    EditCidade: TEdit;
    lbBairro: TLabel;
    EditBairro: TEdit;
    btnViaCEP: TBitBtn;
    btnCorreios: TBitBtn;
    EditCEP: TMaskEdit;
    lbLogradouro: TLabel;
    EditLogradouro: TEdit;
    procedure btnViaCEPClick(Sender: TObject);
    procedure btnCorreiosClick(Sender: TObject);
  private
    function ValidarCEP: boolean;
    procedure IndicarStatusDeProcessamento;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  Adapter.Classes.Comunicador, Adapter.Classes.Adapter,
  Adapter.Classes.WebServiceCorreios, Adapter.Classes.WebServiceViaCEP;

{$R *.dfm}

procedure TfrmPrincipal.btnViaCEPClick(Sender: TObject);
var
  lWebServiceViaCEP: TWebServiceViaCEP;
  lComunicador: TComunicador;
  lRetorno: TStringList;
begin
  if not ValidarCEP then
  begin
    Exit;
  end;

  IndicarStatusDeProcessamento;
  lWebServiceViaCEP := TWebServiceViaCEP.Create;

  lComunicador := TComunicador.Create(lWebServiceViaCEP);
  lRetorno := TStringList.Create;

  try
    lRetorno := lComunicador.ConsultarEndereco(EditCEP.Text);

    EditLogradouro.Text := lRetorno.Values['Logradouro'];
    EditBairro.Text := lRetorno.Values['Bairro'];
    EditCidade.Text := lRetorno.Values['Cidade'];
  finally
    FreeAndNil(lRetorno);
    FreeAndNil(lComunicador);
  end;
end;

procedure TfrmPrincipal.btnCorreiosClick(Sender: TObject);
var
  WebServiceCorreios: TWebServiceCorreios;
  Adapter: TAdapter;
  Comunicador: TComunicador;
  Retorno: TStringList;
begin
  if not ValidarCEP then
  begin
    Exit;
  end;

  IndicarStatusDeProcessamento;
  WebServiceCorreios := TWebServiceCorreios.Create;
  Adapter := TAdapter.Create(WebServiceCorreios);
  Comunicador := TComunicador.Create(Adapter);

  Retorno := TStringList.Create;
  try
    try
      Retorno := Comunicador.ConsultarEndereco(EditCEP.Text);

      EditLogradouro.Text := Retorno.Values['Logradouro'];
      EditBairro.Text := Retorno.Values['Bairro'];
      EditCidade.Text := Retorno.Values['Cidade'];
    except
      EditLogradouro.Clear;
      EditBairro.Clear;
      EditCidade.Clear;
    end;
  finally
    FreeAndNil(Retorno);
    FreeAndNil(Comunicador);
  end;
end;

function TfrmPrincipal.ValidarCEP: boolean;
begin
  Result := True;

  if Length(EditCEP.Text) < 8 then
  begin
    Application.MessageBox('Digite o CEP corretamente.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    EditCEP.SetFocus;
    Result := False;
  end;
end;

procedure TfrmPrincipal.IndicarStatusDeProcessamento;
begin
  EditLogradouro.Text := 'Aguarde...';
  EditBairro.Text := 'Aguarde...';
  EditCidade.Text := 'Aguarde...';

  Application.ProcessMessages;
end;

end.
