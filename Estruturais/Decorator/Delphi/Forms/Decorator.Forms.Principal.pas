unit Decorator.Forms.Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, AppEvnts, Decorator.Classes.DecoratorVersaoWin;

type
  { Client }
  TfrmPrincipal = class(TForm)
    GroupBox: TGroupBox;
    CheckBoxDataHora: TCheckBox;
    CheckBoxNomeUsuario: TCheckBox;
    CheckBoxVersaoWindows: TCheckBox;
    BitBtnGerarExcecao: TBitBtn;
    Memo: TMemo;
    ApplicationEvents: TApplicationEvents;
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    procedure BitBtnGerarExcecaoClick(Sender: TObject);
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

  if CheckBoxDataHora.Checked then
  begin
    LogExcecao := TDataHoraDecorator.Create(LogExcecao);
  end;

  if CheckBoxNomeUsuario.Checked then
  begin
    LogExcecao := TNomeUsuarioDecorator.Create(LogExcecao);
  end;
  
  if CheckBoxVersaoWindows.Checked then
  begin
    LogExcecao := TVersaoWindowsDecorator.Create(LogExcecao);
  end;

  Memo.Lines.Add(LogExcecao.ObterDadosExcecao);
  Memo.Lines.Add(EmptyStr);
end;

procedure TfrmPrincipal.BitBtnGerarExcecaoClick(Sender: TObject);
begin
  // gera uma exceção para entrar no evento "OnException" do TApplicationEvents
  raise Exception.Create('Exceção de exemplo para teste!');
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  MessageDlg('Devido à restrições do Windows 10, a aplicação deverá ser executada ' +
    'com privilégios de Administrador para que a extração da versão do Windows funcione.',
    mtWarning, [mbOK], 0);
end;

end.