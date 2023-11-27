unit Memento.Classes.Memento;

interface

type
  TMemento = class
  private
    FTitulo: string;
    FTexto: WideString;
  public
    property Titulo: string read FTitulo write FTitulo;
    property Texto: WideString read FTexto write FTexto;
  end;

implementation

end.
