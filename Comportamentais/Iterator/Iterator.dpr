program Iterator;

uses
  Vcl.Forms,
  Iterator.Classes.Cliente in 'Classes\Iterator.Classes.Cliente.pas',
  Iterator.Interfaces.Iterator in 'Interfaces\Iterator.Interfaces.Iterator.pas',
  Iterator.Interfaces.Aggregate in 'Interfaces\Iterator.Interfaces.Aggregate.pas',
  Iterator.Classes.ConcreteIterator in 'Classes\Iterator.Classes.ConcreteIterator.pas',
  Iterator.Classes.ConcreteAggregateCSV in 'Classes\Iterator.Classes.ConcreteAggregateCSV.pas',
  Iterator.Classes.ConcreteAggregateXML in 'Classes\Iterator.Classes.ConcreteAggregateXML.pas',
  Iterator.Forms.Principal in 'Forms\Iterator.Forms.Principal.pas' {fFormulario};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
