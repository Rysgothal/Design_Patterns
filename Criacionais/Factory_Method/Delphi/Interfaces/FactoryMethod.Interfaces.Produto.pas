unit FactoryMethod.Interfaces.Produto;

interface

type
  TModoPrazo = (mpMensal, mpAnual, mpSemestral);

  ITipoPrazo = interface
    function ConsultarDescricao: string;
    function ConsultarJuros:string;
    function ConsultarProjecao(const pValor: Real; const pQtdeParcelas: Integer): string;
    function ConsultarTotal: string;
  end;

implementation

end.
