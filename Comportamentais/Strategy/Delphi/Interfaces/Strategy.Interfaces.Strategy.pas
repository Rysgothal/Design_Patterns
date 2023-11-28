unit Strategy.Interfaces.Strategy;

interface

type
  IStrategy = interface
    function ValidarEmail(const pEmail: string): boolean;
  end;

implementation

end.
