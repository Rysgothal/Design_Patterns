unit Interpreter.Forms.Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, Grids, DBGrids, Buttons, Contnrs,
  Interpreter.Classes.AbstractExpression;

type
  { Client }
  TfrmPrincipal = class(TForm)
    LabelInstrucao: TLabel;
    LabelSQL: TLabel;
    edtInstrucao: TEdit;
    GroupBox1: TGroupBox;
    btnInterpretar: TBitBtn;
    edtExemplo1: TEdit;
    edtExemplo3: TEdit;
    edtExemplo2: TEdit;
    edtExemplo4: TEdit;
    edtSaida: TEdit;
    procedure btnInterpretarClick(Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  Interpreter.Classes.Context, Interpreter.Classes.ColunasExpression,
  Interpreter.Classes.ComandoExpression, Interpreter.Classes.TabelaExpression,
  Interpreter.Classes.CondicaoExpression;

{$R *.dfm}

procedure TfrmPrincipal.btnInterpretarClick(Sender: TObject);
var
  lContexto: TContext;
  lArvoreSintatica: TObjectList;
begin
  lContexto := TContext.Create;
  lArvoreSintatica := TObjectList.Create;

  try
    lContexto.Entrada := edtInstrucao.Text;

    lArvoreSintatica.Add(TComandoExpression.Create);
    lArvoreSintatica.Add(TColunasExpression.Create);
    lArvoreSintatica.Add(TTabelaExpression.Create);
    lArvoreSintatica.Add(TCondicaoExpression.Create);

    for var lFolha in lArvoreSintatica do
    begin
      TAbstractExpression(lFolha).Interpretar(lContexto);
    end;

    edtSaida.Text := lContexto.Saida;
  finally
    FreeAndNil(lArvoreSintatica);
    FreeAndNil(lContexto);
  end;
end;

end.
