unit TemplateMethod.Forms.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, TemplateMethod.Classes.Base;

type
  TfrmPrincipal = class(TForm)
    ClientDataSet: TClientDataSet;
    DBGrid: TDBGrid;
    DataSource: TDataSource;
    Panel: TPanel;
    rgbTipo: TRadioGroup;
    lblConsulta: TLabel;
    edtConsulta: TEdit;
    btnConsultar: TBitBtn;
    procedure btnConsultarClick(Sender: TObject);
  private
    function ObterConcreteClass: TBase;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  System.UITypes, TemplateMethod.Classes.Repositorios,
  TemplateMethod.Classes.Usuario;

{$R *.dfm}

procedure TfrmPrincipal.btnConsultarClick(Sender: TObject);
var
  ConcreteClass: TBase;
begin
  if Trim(edtConsulta.Text) = EmptyStr then
  begin
    Application.MessageBox('Selecione um texto para a consulta.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  if rgbTipo.ItemIndex < 0 then
  begin
    Application.MessageBox('Selecione um tipo de consulta.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  ConcreteClass := ObterConcreteClass;
  try
    // Executa o Template Method
    ClientDataSet.Data := ConcreteClass.ConsultarDadosGitHub;
  finally
    ConcreteClass.Free;
  end;
end;

function TfrmPrincipal.ObterConcreteClass: TBase;
begin
  Result := nil;

  case rgbTipo.ItemIndex of
    0: Result := TRepositorios.Create(edtConsulta.Text);
    1: Result := TUsuarios.Create(edtConsulta.Text);
  end;
end;

end.
