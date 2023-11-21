unit AbstractFactory.Classes.Principal;

interface

uses
  AbstractFactory.Interfaces.Principal, AbstractFactory.Classes.Notebook, AbstractFactory.Classes.Desktop;

type
  TDell = class(TInterfacedObject, IFactoryMarca)
    function ConsultarNotebook: INotebook;
    function ConsultarDesktop: IDesktop;
  end;

  TApple = class(TInterfacedObject, IFactoryMarca)
    function ConsultarNotebook: INotebook;
    function ConsultarDesktop: IDesktop;
  end;

  TLenovo = class(TInterfacedObject, IFactoryMarca)
    function ConsultarNotebook: INotebook;
    function ConsultarDesktop: IDesktop;
  end;

implementation

{ TDell }

function TDell.ConsultarDesktop: IDesktop;
begin
  Result := TInspiron.Create;
end;

function TDell.ConsultarNotebook: INotebook;
begin
  Result := TVostro.Create;
end;

{ TLenovo }

function TLenovo.ConsultarDesktop: IDesktop;
begin
  Result := TLegion.Create;
end;

function TLenovo.ConsultarNotebook: INotebook;
begin
  Result := TIdeaPad.Create;
end;

{ TApple }

function TApple.ConsultarDesktop: IDesktop;
begin
  Result := TIMac.Create;
end;

function TApple.ConsultarNotebook: INotebook;
begin
  Result := TMacBook.Create;
end;

end.
