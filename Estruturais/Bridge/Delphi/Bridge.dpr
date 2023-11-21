program Bridge;

uses
  Vcl.Forms,
  Bridge.Interfaces.Implementor in 'Interfaces\Bridge.Interfaces.Implementor.pas',
  Bridge.Interfaces.ConcreteImplementors.FormatoXLS in 'Classes\Bridge.Interfaces.ConcreteImplementors.FormatoXLS.pas',
  Bridge.Interfaces.Abstraction in 'Interfaces\Bridge.Interfaces.Abstraction.pas',
  Bridge.Interfaces.RefinedAbstractions in 'Classes\Bridge.Interfaces.RefinedAbstractions.pas',
  Bridge.Interfaces.ConcreteImplementors.FormatoHTML in 'Classes\Bridge.Interfaces.ConcreteImplementors.FormatoHTML.pas',
  Bridge.Interfaces.RefinedAbstractions.ExportadorProdutos in 'Classes\Bridge.Interfaces.RefinedAbstractions.ExportadorProdutos.pas',
  Bridge.Forms.Principal in 'Forms\Bridge.Forms.Principal.pas' {fFormulario};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
