unit Interpreter.Classes.ColunasExpression;

interface

uses
  Interpreter.Classes.AbstractExpression, Interpreter.Classes.Context;

type
  { TerminalExpression }
  TColunasExpression = class(TAbstractExpression)
  public
    procedure Interpretar(pContexto: TContext); override;
  end;

implementation

uses
  System.Classes, System.SysUtils;

{ TColunasExpression }

procedure TColunasExpression.Interpretar(pContexto: TContext);
var
  lPosQuebra, lPosEspaco: Integer;
begin
  inherited;

  ExtractStrings([' '], [], PWideChar(pContexto.Entrada), Partes);

  if Pos('Select', pContexto.Saida) > 0 then
  begin
    lPosQuebra := Pos('dos', LowerCase(pContexto.Entrada)) + Pos('das', LowerCase(pContexto.Entrada));

    if lPosQuebra = 0 then
    begin
      pContexto.Saida := Format('%s *', [pContexto.Saida, Partes[1]]);
      Exit;
    end;

    lPosEspaco := Pos(' ', pContexto.Entrada);
    pContexto.Saida := Format('%s %s', [pContexto.Saida, Copy(pContexto.Entrada, lPosEspaco, lPosQuebra - lPosEspaco)]);
  end;
end;

end.
