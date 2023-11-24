program Interpreter;

uses
  Vcl.Forms,
  Interpreter.Classes.Context in 'Classes\Interpreter.Classes.Context.pas',
  Interpreter.Classes.AbstractExpression in 'Classes\Interpreter.Classes.AbstractExpression.pas',
  Interpreter.Classes.ComandoExpression in 'Classes\Interpreter.Classes.ComandoExpression.pas',
  Interpreter.Classes.ColunasExpression in 'Classes\Interpreter.Classes.ColunasExpression.pas',
  Interpreter.Classes.TabelaExpression in 'Classes\Interpreter.Classes.TabelaExpression.pas',
  Interpreter.Classes.CondicaoExpression in 'Classes\Interpreter.Classes.CondicaoExpression.pas',
  Interpreter.Forms.Principal in 'Forms\Interpreter.Forms.Principal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
