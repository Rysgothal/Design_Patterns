unit Façade.Classes.SubSystemHistorico;

interface

type
  TSubsystemHistorico = class
  public
    procedure RegistrarHistoricoDoCalculo(const pFidelidade: integer; const pDolar, pPreco, pValorVenda: Real);
  end;

implementation

uses
  SysUtils, Vcl.Forms;

{ TSubsystemHistorico }

procedure TSubsystemHistorico.RegistrarHistoricoDoCalculo(const pFidelidade: Integer; const pDolar: Real;
  const pPreco: Real; const pValorVenda: Real);
var
  lArquivo: TextFile;
  lCaminhoArquivo: string;
  lDesconto: string;
begin
  lCaminhoArquivo := ExtractFileDir(Application.ExeName);
  lCaminhoArquivo := ExtractFileDir(ExtractFileDir(lCaminhoArquivo));
  lCaminhoArquivo := lCaminhoArquivo + '\Auxiliar\Historico.txt';

  AssignFile(lArquivo, lCaminhoArquivo);

  case FileExists(lCaminhoArquivo) of
    True: Append(lArquivo);
    else Rewrite(lArquivo);
  end;

  case pFidelidade of
    0: lDesconto := 'Desconto de 2%';
    1: lDesconto := 'Desconto de 6%';
    2: lDesconto := 'Desconto de 10%';
    3: lDesconto := 'Desconto de 18%';
  end;

  WriteLn(lArquivo, 'Data/Hora.........: ' + FormatDateTime('dd/mm/yyyy - hh:nn:ss', Now));
  WriteLn(lArquivo, 'Cotação do Dólar..: ' + FormatFloat('###,###,##0.00', pDolar));
  WriteLn(lArquivo, 'Conversão em R$...: ' + FormatFloat('###,###,##0.00', pDolar * pPreco));
  WriteLn(lArquivo, 'Fidelidade........: ' + lDesconto);
  WriteLn(lArquivo, 'Margem de venda...: 35%');
  WriteLn(lArquivo, 'Preço final.......: ' + FormatFloat('###,###,##0.00', pValorVenda));
  WriteLn(lArquivo, EmptyStr);

  CloseFile(lArquivo);
end;

end.
