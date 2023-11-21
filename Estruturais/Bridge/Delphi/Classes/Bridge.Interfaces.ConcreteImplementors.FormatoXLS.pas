unit Bridge.Interfaces.ConcreteImplementors.FormatoXLS;

interface

uses
  Bridge.Interfaces.Implementor, Excel2010, System.Classes;

type
  TFormatoXLS = class(TInterfacedObject, IFormato)
  private
    FExcel: TExcelApplication;
    FLinha: Integer;
    FColuna: Integer;
    procedure CriarExcel;
  public
    property Excel: TExcelApplication read FExcel write FExcel;
    property Linha: Integer read FLinha write FLinha;
    property Coluna: Integer read FColuna write FColuna;
    constructor Create;
    destructor Destroy; override;
    procedure PularLinha;
    procedure ExportarCampo(const pValor: string);
    procedure SalvarArquivo(const pNomeArquivo: string);
    procedure DesenharCabecalho(const pTitulo: string);
  end;

implementation

uses
  System.SysUtils, Vcl.Forms, System.Variants;

{ TFormatoXLS }

constructor TFormatoXLS.Create;
begin
  CriarExcel;

  Linha := 1;
  Coluna := 1;
end;

procedure TFormatoXLS.CriarExcel;
begin
  Excel := TExcelApplication.Create(nil);
  Excel.Connect;
  Excel.Workbooks.Add(xlWBATWorksheet, 0);
  Excel.Visible[0] := True;
end;

procedure TFormatoXLS.DesenharCabecalho(const pTitulo: string);
var
  lCelula: string;
begin
  lCelula:= Chr(64 + Coluna) + IntToStr(Linha);
  Excel.Range[lCelula, lCelula].Font.Bold := True;
  Excel.Range[lCelula, lCelula].Value2 := pTitulo;
  Inc(FColuna);
end;

destructor TFormatoXLS.Destroy;
begin
  Excel.Disconnect;
  FreeAndNil(FExcel);

  inherited;
end;

procedure TFormatoXLS.ExportarCampo(const pValor: string);
var
  lCelula: string;
begin
  lCelula := Chr(64 + Coluna) + IntToStr(Linha);
  Excel.Range[lCelula, lCelula].Value2 := pValor;

  Inc(FColuna);
end;

procedure TFormatoXLS.PularLinha;
begin
  Inc(FLinha);
  Coluna := 1;

  Excel.Columns.AutoFit;
end;

procedure TFormatoXLS.SalvarArquivo(const pNomeArquivo: string);
var
  lCaminho, lNome: string;
begin
  lCaminho := ExtractFilePath(Application.ExeName);
  lNome := pNomeArquivo;
  lNome := Format('%s%s.xls', [lCaminho, lNome]);
  DeleteFile(PWideChar(lNome));

  Excel.ActiveWorkbook.SaveAs(lNome, xlNormal, EmptyStr, EmptyStr, False, False, xlNoChange, xlUserResolution,
    False, EmptyParam, EmptyParam, 0, 0);
end;

end.
