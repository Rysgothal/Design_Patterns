unit Builder.Classes.Diretor;

interface

uses
  Builder.Interfaces.Builder;

type
  TDiretor = class
  public
    procedure Construir(pBuilder: IBuilder);
  end;

implementation

{ TDiretor }

procedure TDiretor.Construir(pBuilder: IBuilder);
begin
  pBuilder.ConstruirCabecalho;
  pBuilder.ConstruirDetalhes;
  pBuilder.ConstruirRodape;
end;

end.
