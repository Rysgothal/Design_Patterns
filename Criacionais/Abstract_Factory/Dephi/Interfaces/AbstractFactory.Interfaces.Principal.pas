unit AbstractFactory.Interfaces.Principal;

interface

type
  INotebook = interface
    ['{7E4870EF-FD37-47AC-B761-E0169653458B}']
    function BuscarTamanhoTela: string;
    function BuscarMemoriaRAM: string;
  end;

  IDesktop = interface
    ['{E8EB9790-A7AA-4532-9220-B1770754A436}']
    function BuscarNomeProcessador: string;
    function BuscarTamanhoHD: string;
  end;

  IFactoryMarca = interface
    ['{38C7A72F-AA90-49F0-95DA-B7AE4168D429}']
    function ConsultarNotebook: INotebook;
    function ConsultarDesktop: IDesktop;
  end;

implementation

end.
