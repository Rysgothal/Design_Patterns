unit FactoryMethod.Classes.ProdutoConcreto;

interface

uses
  FactoryMethod.Interfaces.Produto;

type
  TTipoPrazo = class(TInterfacedObject, ITipoPrazo)
  protected
    // Classe que implementa a Interface ITipoPrazo e vai servir como classe base para os tipos de prazos
    FValorTotal: Real;
    function GerarProjecao(const pValor, pJuros: Real; const pQtdeParcelas, pIntervalo: SmallInt): string;
    function ConsultarTotal: string;
  public
    property ValorTotal: Real read FValorTotal write FValorTotal;
    function ConsultarDescricao: string; virtual; abstract;
    function ConsultarJuros: string; virtual; abstract;
    function ConsultarProjecao(const pValor: Real; const pQtdeParcelas: Integer): string; virtual; abstract;
  end;

  TPrazoMensal = class(TTipoPrazo)
  public
    function ConsultarDescricao: string; override;
    function ConsultarJuros: string; override;
    function ConsultarProjecao(const pValor: Real; const pQtdeParcelas: Integer): string; override;
  end;

  TPrazoSemestral = class(TTipoPrazo)
  public
    function ConsultarDescricao: string; override;
    function ConsultarJuros: string; override;
    function ConsultarProjecao(const pValor: Real; const pQtdeParcelas: Integer): string; override;
  end;

  TPrazoAnual = class(TTipoPrazo)
  public
    function ConsultarDescricao: string; override;
    function ConsultarJuros: string; override;
    function ConsultarProjecao(const pValor: Real; const pQtdeParcelas: Integer): string; override;
  end;

implementation

uses
  SysUtils, Classes;

{ TPrazo }

function TTipoPrazo.GerarProjecao(const pValor: Real; const pJuros: Real; const pQtdeParcelas: SmallInt; const pIntervalo: SmallInt): string;
var
  lProjecao: TStringList;
  lContador: Smallint;
  lValorAjustado: Real;
  lValorFormatado, lDataParcela: string;
begin
  lProjecao := TStringList.Create;

  try
    lProjecao.Clear;
    ValorTotal := 0;
    lValorAjustado := pValor;
    lDataParcela := DateToStr(Date);

    for lContador := 1 to pQtdeParcelas do
    begin
      lValorAjustado := lValorAjustado + (pValor * pJuros);
      ValorTotal := ValorTotal + lValorAjustado;

      lValorFormatado := FormatFloat('###,##0.00', lValorAjustado);
      lDataParcela := FormatDateTime('dd/mm/yyyy', IncMonth(StrToDate(lDataParcela), pIntervalo));
      lProjecao.Add(Format('Parcela %.2d (%s): %s', [lContador, lDataParcela, lValorFormatado]));
    end;

    Result := lProjecao.Text;
  finally
    FreeAndNil(lProjecao);
  end;
end;

function TTipoPrazo.ConsultarTotal: string;
begin
  Result := 'Total: ' + FormatFloat('###,##0.00', ValorTotal);
end;

{ TPrazoMensal }

function TPrazoMensal.ConsultarDescricao: string;
begin
  Result := 'Prazo Mensal para Pagamento';
end;

function TPrazoMensal.ConsultarJuros: string;
begin
  Result := 'Juros de 3,1% simples ao mês' + sLineBreak;
end;

function TPrazoMensal.ConsultarProjecao(const pValor: Real; const pQtdeParcelas: Integer): string;
begin
  Result := GerarProjecao(pValor, 0.031, pQtdeParcelas, 1);
end;

{ TPrazoSemestral }

function TPrazoSemestral.ConsultarDescricao: string;
begin
    Result := 'Prazo Semestral para Pagamento';
end;

function TPrazoSemestral.ConsultarJuros: string;
begin
  Result := 'Juros de 5,8% simples ao semestre' + sLineBreak;
end;

function TPrazoSemestral.ConsultarProjecao(const pValor: Real; const pQtdeParcelas: Integer): string;
begin
  Result := GerarProjecao(pValor, 0.058, pQtdeParcelas, 6);
end;

{ TPrazoAnual }

function TPrazoAnual.ConsultarDescricao: string;
begin
  Result := 'Prazo Anual para Pagamento';
end;

function TPrazoAnual.ConsultarJuros: string;
begin
  Result := 'Juros de 10,5% simples ao ano' + sLineBreak;
end;

function TPrazoAnual.ConsultarProjecao(const pValor: Real; const pQtdeParcelas: Integer): string;
begin
  Result := GerarProjecao(pValor, 0.105, pQtdeParcelas, 12);
end;

end.
