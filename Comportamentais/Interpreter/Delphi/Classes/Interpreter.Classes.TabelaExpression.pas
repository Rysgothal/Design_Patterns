unit Interpreter.Classes.TabelaExpression;

interface

uses
  Interpreter.Classes.AbstractExpression, Interpreter.Classes.Context;

type
  TTabelaExpression = class(TAbstractExpression)
  public
    procedure Interpretar(pContexto: TContext); override;
  end;

implementation

uses
  System.Classes, System.SysUtils, System.StrUtils;

{ TTabelaExpression }

procedure TTabelaExpression.Interpretar(pContexto: TContext);
var
  lPosQuebra, lPosEspaco: Integer;
begin
  // Extrai as strings da entrada do pContexto
  ExtractStrings([' '], [], PWideChar(pContexto.Entrada), Partes);

  if Pos('Select', pContexto.Saida) > 0 then
  begin
    lPosQuebra := Pos('dos', LowerCase(pContexto.Entrada)) + Pos('das', LowerCase(pContexto.Entrada));

    if lPosQuebra = 0 then
    begin
      pContexto.Saida := Format('%s from %s', [pContexto.Saida, Partes[1]]);
      Exit;
    end;

    Inc(lPosQuebra, 4);
    lPosEspaco := PosEx(' ', pContexto.Entrada, lPosQuebra);

    if lPosEspaco = 0 then
    begin
      lPosEspaco := Length(pContexto.Entrada);
    end;

    pContexto.Saida := Concat(pContexto.Saida, Format(' from %s', [Copy(pContexto.Entrada, lPosQuebra,
      Abs(lPosQuebra - lPosEspaco))]));

    Exit;
  end;

  if Pos('Update', pContexto.Saida) > 0 then
  begin
    pContexto.Saida := Format('%s %s', [pContexto.Saida, Partes[3] + 's']);
    Exit;
  end;

  if Pos('Delete', pContexto.Saida) > 0 then
  begin
    pContexto.Saida := Format('%s from %s', [pContexto.Saida, Partes[1] + 's']);
  end;
end;

end.
