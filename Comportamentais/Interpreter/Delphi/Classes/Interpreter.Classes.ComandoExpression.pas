unit Interpreter.Classes.ComandoExpression;

interface

uses
  Interpreter.Classes.AbstractExpression, Interpreter.Classes.Context;

type
  { Terminal Expression }
  TComandoExpression = class(TAbstractExpression)
  public
    procedure Interpretar(pContexto: TContext); override;
  end;
implementation

uses
  System.SysUtils;

{ TComandoExpression }

procedure TComandoExpression.Interpretar(pContexto: TContext);
begin
  inherited;

  if Pos('selecionar', LowerCase(pContexto.Entrada)) > 0 then
  begin
    pContexto.Saida := 'Select';
  end else
  if Pos('atualizar', LowerCase(pContexto.Entrada)) > 0 then
  begin
    pContexto.Saida := 'Update';
  end else
  if Pos('excluir', LowerCase(pContexto.Entrada)) > 0 then
  begin
    pContexto.Saida := 'Delete';
  end;
end;

end.
