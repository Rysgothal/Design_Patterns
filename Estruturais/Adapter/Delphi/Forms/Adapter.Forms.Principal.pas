﻿unit Adapter.Forms.Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TfrmPrincipal = class(TForm)
    lbCEP: TLabel;
    lbCidade: TLabel;
    edtCidade: TEdit;
    lbBairro: TLabel;
    edtBairro: TEdit;
    btnViaCEP: TBitBtn;
    btnCorreios: TBitBtn;
    edtCEP: TMaskEdit;
    lbLogradouro: TLabel;
    edtLogradouro: TEdit;
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
    lRetorno := lComunicador.ConsultarEndereco(edtCEP.Text);

    edtLogradouro.Text := lRetorno.Values['Logradouro'];
    edtBairro.Text := lRetorno.Values['Bairro'];
    edtCidade.Text := lRetorno.Values['Cidade'];
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
      Retorno := Comunicador.ConsultarEndereco(edtCEP.Text);

      edtLogradouro.Text := Retorno.Values['Logradouro'];
      edtBairro.Text := Retorno.Values['Bairro'];
      edtCidade.Text := Retorno.Values['Cidade'];
    except
      edtLogradouro.Clear;
      edtBairro.Clear;
      edtCidade.Clear;
    end;
  finally
    FreeAndNil(Retorno);
    FreeAndNil(Comunicador);
  end;
end;

function TfrmPrincipal.ValidarCEP: boolean;
begin
  Result := True;

  if Length(edtCEP.Text) < 8 then
  begin
    Application.MessageBox('Digite o CEP corretamente.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    edtCEP.SetFocus;
    Result := False;
  end;
end;

procedure TfrmPrincipal.IndicarStatusDeProcessamento;
begin
  edtLogradouro.Text := 'Aguarde...';
  edtBairro.Text := 'Aguarde...';
  edtCidade.Text := 'Aguarde...';

  Application.ProcessMessages;
end;

end.
