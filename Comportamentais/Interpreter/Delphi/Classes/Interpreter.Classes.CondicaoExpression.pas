unit Interpreter.Classes.CondicaoExpression;

interface

uses
  Interpreter.Classes.AbstractExpression, Interpreter.Classes.Context;
type
  { TerminalExpression }
  TCondicaoExpression = class(TAbstractExpression)
  public
    procedure Interpretar(pContexto: TContext); override;
  end;

implementation

uses
  System.Classes, System.SysUtils;

{ TCondicaoExpression }

procedure TCondicaoExpression.Interpretar(pContexto: TContext);
var
  lPosicao: Integer;
  lValor: string;
begin
  // Extrai as strings da entrada do pContexto
  ExtractStrings([' '], [], PWideChar(pContexto.Entrada), Partes);

  lPosicao := Pos(' de ', LowerCase(pContexto.Entrada));

  if lPosicao > 0 then
  begin
    lValor := Copy(pContexto.Entrada, lPosicao + 4, Length(pContexto.Entrada));
    pContexto.Saida := Concat(pContexto.Saida,  Format(' where cidade = "%s"', [lValor]));
    Exit;
  end;

  lPosicao := Pos('com nome', LowerCase(pContexto.Entrada));

  if lPosicao > 0 then
  begin
    lValor := Copy(pContexto.Entrada, lPosicao + 9, Length(pContexto.Entrada));
    pContexto.Saida := Concat(pContexto.Saida,  Format(' where nome = "%s"', [lValor]));
    Exit;
  end;

  lPosicao := Pos('para', LowerCase(pContexto.Entrada));

  if lPosicao > 0 then
  begin
    lValor := Copy(pContexto.Entrada, lPosicao + 5, Length(pContexto.Entrada));
    pContexto.Saida := Concat(pContexto.Saida,
      Format(' set %s = "%s" where ID = %s', [Partes[1], lValor, Partes[4]]));
    Exit;
  end;

  if Pos('Delete', pContexto.Saida) > 0 then
  begin
    case StrToIntDef(Partes[2], 0) > 0 of
      True: pContexto.Saida := Format('%s where ID = %s', [pContexto.Saida, Partes[2]]);
      else pContexto.Saida := Format('%s where nome = "%s"', [pContexto.Saida, Partes[2]]);
    end;
  end;
end;

end.
