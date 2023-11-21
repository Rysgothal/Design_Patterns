unit AbstractFactory.Classes.Notebook;

interface

uses
  AbstractFactory.Interfaces.Principal;

type
  // Dell
  TVostro = class(TInterfacedObject, INotebook)
  private
    function BuscarTamanhoTela: string;
    function BuscarMemoriaRAM: string;
  end;

  // Apple
  TMacBook = class(TInterfacedObject, INotebook)
  private
    function BuscarTamanhoTela: string;
    function BuscarMemoriaRAM: string;
  end;

  // Lenovo
  TIdeaPad = class(TInterfacedObject, INotebook)
  private
    function BuscarTamanhoTela: string;
    function BuscarMemoriaRAM: string;
  end;

implementation

{ TVostro }

function TVostro.BuscarMemoriaRAM: string;
begin
  Result := '15 Polegadas';
end;

function TVostro.BuscarTamanhoTela: string;
begin
  Result := '3GB DDR3';
end;

{ TMacBook }

function TMacBook.BuscarMemoriaRAM: string;
begin
  Result := '11.6 Polegadas'
end;

function TMacBook.BuscarTamanhoTela: string;
begin
  Result := '4GB DDR3';
end;

{ TIdeaPad }

function TIdeaPad.BuscarMemoriaRAM: string;
begin
  Result := '17.5 Polegadas';
end;

function TIdeaPad.BuscarTamanhoTela: string;
begin
  Result := '8GB DDR4';
end;

end.
