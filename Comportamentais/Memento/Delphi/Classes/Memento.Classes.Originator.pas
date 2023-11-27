unit Memento.Classes.Originator;

interface

uses
  Memento.Classes.Memento;

type
  TOriginator = class
  private
    FTitulo: string;
    FTexto: WideString;
  public
    property Titulo: string read FTitulo write FTitulo;
    property Texto: WideString read FTexto write FTexto;
    function SalvarEstado: TMemento;
    procedure RestaurarEstado(pMemento: TMemento);
  end;

implementation

{ TOriginator }

procedure TOriginator.RestaurarEstado(pMemento: TMemento);
begin
  FTitulo := pMemento.Titulo;
  FTexto := pMemento.Texto;
end;

function TOriginator.SalvarEstado: TMemento;
begin
  Result := TMemento.Create;

  Result.Titulo := FTitulo;
  Result.Texto := FTexto;
end;

end.
