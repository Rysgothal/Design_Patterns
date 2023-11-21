unit AbstractFactory.Classes.Desktop;

interface

uses
  AbstractFactory.Interfaces.Principal;

type
  TInspiron = class(TInterfacedObject, IDesktop)
  private
    function BuscarNomeProcessador: string;
    function BuscarTamanhoHD: string;
  end;

  TIMac = class(TInterfacedObject, IDesktop)
  private
    function BuscarNomeProcessador: string;
    function BuscarTamanhoHD: string;
  end;

  TLegion = class(TInterfacedObject, IDesktop)
  private
    function BuscarNomeProcessador: string;
    function BuscarTamanhoHD: string;
  end;

implementation

{ TLegion }

function TLegion.BuscarNomeProcessador: string;
begin
  Result := 'Intel Core i5';
end;

function TLegion.BuscarTamanhoHD: string;
begin
  Result := '1 TB';
end;

{ TIMac }

function TIMac.BuscarNomeProcessador: string;
begin
  Result := 'Intel Core i7';
end;

function TIMac.BuscarTamanhoHD: string;
begin
  Result := '500 GB';
end;

{ TInspiron }

function TInspiron.BuscarNomeProcessador: string;
begin
  Result := 'Ryzen 8';
end;

function TInspiron.BuscarTamanhoHD: string;
begin
  Result := '2 TB';
end;

end.
