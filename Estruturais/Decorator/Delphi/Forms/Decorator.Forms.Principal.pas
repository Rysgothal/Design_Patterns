unit Decorator.Forms.Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, AppEvnts, Decorator.Classes.DecoratorVersaoWin;

type
  { Client }
  TfrmPrincipal = class(TForm)
    gbxLog: TGroupBox;
    cbxDataHora: TCheckBox;
    cbxNomeUsuario: TCheckBox;
    cbxVersaoWindows: TCheckBox;
    btnGerarExcecao: TBitBtn;
    memPrincipal: TMemo;
    ApplicationEvents: TApplicationEvents;
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    procedure btnGerarExcecaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  Decorator.Interfaces.Component, Decorator.Classes.ConcreteComponent,
  Decorator.Classes.DecoratorDataHora, Decorator.Classes.DecoratorNomeUsuario;

{$R *.dfm}

procedure TfrmPrincipal.ApplicationEventsException(Sender: TObject; E: Exception);
var
  LogExcecao: ILogExcecao;
begin
  LogExcecao := TLogExcecao.Create(E);

  if cbxDataHora.Checked then
  begin
    LogExcecao := TDataHoraDecorator.Create(LogExcecao);
  end;

  if cbxNomeUsuario.Checked then
  begin
    LogExcecao := TNomeUsuarioDecorator.Create(LogExcecao);
  end;

  if cbxVersaoWindows.Checked then
  begin
    LogExcecao := TVersaoWindowsDecorator.Create(LogExcecao);
  end;

  memPrincipal.Lines.Add(LogExcecao.ObterDadosExcecao);
  memPrincipal.Lines.Add(EmptyStr);
end;

procedure TfrmPrincipal.btnGerarExcecaoClick(Sender: TObject);
begin
  // gera uma exceção para entrar no evento "OnException" do TApplicationEvents
  raise Exception.Create('Exceção de exemplo para teste!');
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  Application.MessageBox('Devido à restrições do Windows 10+, a aplicação deverá ser executada ' +
    'com privilégios de Administrador para que a extração da versão do Windows funcione.', 'Atenção' ,
    MB_OK + MB_ICONINFORMATION);
end;

end.