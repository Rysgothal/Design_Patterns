unit Bridge.Interfaces.ConcreteImplementors.FormatoHTML;

interface

uses
  Bridge.Interfaces.Implementor, System.Classes;

type
  { Concrete Implementor }
  TFormatoHTML = class(TInterfacedObject, IFormato)
  private
    FHTML: TStringList;
    procedure CriarCabecalhoHTML;
  public
    property HTML: TStringList read FHTML write FHTML;
    constructor Create;
    destructor Destroy; override;

    procedure PularLinha;
    procedure DesenharCabecalho(const pTitulo: string);
    procedure ExportarCampo(const pValor: string);
    procedure SalvarArquivo(const pNomeArquivo: string);
  end;

implementation

uses
  SysUtils, Forms, Windows, ShellAPI;

{ TFormatoHTML }

constructor TFormatoHTML.Create;
begin
  HTML := TStringList.Create;
  CriarCabecalhoHTML;
end;

procedure TFormatoHTML.CriarCabecalhoHTML;
begin
  HTML.Add('<html>');
  HTML.Add('<head>');
  HTML.Add('<style>');
  HTML.Add('body { font-family: Tahoma; }');
  HTML.Add('table, td, th { border: 1px solid #ddd; text-align: left; }');
  HTML.Add('table { border-collapse: collapse; width: 100%; }');
  HTML.Add('</style>');
  HTML.Add('<head>');
  HTML.Add('</head>');
  HTML.Add('<body>');
  HTML.Add('<table>');
  HTML.Add('<tr>');
end;

procedure TFormatoHTML.DesenharCabecalho(const pTitulo: string);
begin
  HTML.Add(Format('<th>%s</th>', [pTitulo]));
end;

destructor TFormatoHTML.Destroy;
begin
  FreeAndNil(FHTML);
  inherited;
end;

procedure TFormatoHTML.ExportarCampo(const pValor: string);
begin
  HTML.Add(Format('<td>%s</td>', [pValor]));
end;

procedure TFormatoHTML.PularLinha;
begin
  HTML.Add('</tr><tr>');
end;

procedure TFormatoHTML.SalvarArquivo(const pNomeArquivo: string);
var
  CaminhoAplicacao: string;
  NomeCompleto: string;
begin
  HTML.Add('</tr>');
  HTML.Add('</table>');
  HTML.Add('</body>');
  HTML.Add('</html>');

  CaminhoAplicacao := ExtractFilePath(Application.ExeName);
  NomeCompleto := Format('%s%s.html', [CaminhoAplicacao, pNomeArquivo]);
  DeleteFile(PWideChar(NomeCompleto));
  HTML.SaveToFile(NomeCompleto);
  ShellExecute(0, nil, PChar(NomeCompleto), nil,  nil, SW_SHOWNORMAL);
end;

end.
