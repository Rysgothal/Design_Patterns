program FactoryMethod;

uses
  Vcl.Forms,
  FactoryMethod.Forms.Principal in 'Forms\FactoryMethod.Forms.Principal.pas' {frmPrincipal},
  FactoryMethod.Interfaces.Produto in 'Interfaces\FactoryMethod.Interfaces.Produto.pas',
  FactoryMethod.Classes.ProdutoConcreto in 'Classes\FactoryMethod.Classes.ProdutoConcreto.pas',
  FactoryMethod.Classes.CriadorConcreto in 'Classes\FactoryMethod.Classes.CriadorConcreto.pas',
  FactoryMethod.Interfaces.Criador in 'Interfaces\FactoryMethod.Interfaces.Criador.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
