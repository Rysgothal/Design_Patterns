unit Flyweight.Classes.ConcreteFlyweight;

interface

uses
  Flyweight.Interfaces.Flyweight, pngimage, System.Classes;

type
  { Base }
  TCartao = class(TInterfacedObject, ICartao)
  protected
    FPNGArquivo: TPngImage;
    FMensagem: TStringList;
    FCaminhoImagens: string;
    FNomeLeitor: string;

    procedure SetNomeLeitor(const NomeLeitor: string);
  public
    constructor Create;
    destructor Destroy; override;

    procedure Exportar;
    property NomeLeitor: string write SetNomeLeitor;
    property PNGArquivo: TPngImage read FPNGArquivo write FPNGArquivo;
    property CaminhoImagens: string read FCaminhoImagens write FCaminhoImagens;
    property Mensagem: TStringList read FMensagem write FMensagem;
  end;

  TCartaoEspanha = class(TCartao)
  public
    constructor Create;
  end;

  TCartaoEUA = class(TCartao)
  public
    constructor Create;
  end;

  TCartaoBrasil = class(TCartao)
    constructor Create;
  end;

  TCartaoItalia = class(TCartao)
    constructor Create;
  end;

implementation

uses
  Graphics, System.SysUtils, Vcl.Forms;

{ TCartao }

constructor TCartao.Create;
var
  lCaminho: string;
begin
  lCaminho := ExtractFileDir(Application.ExeName);
  lCaminho := ExtractFileDir(ExtractFileDir(lCaminho)) + '\Auxiliar\';
  FCaminhoImagens := lCaminho;

  Mensagem := TStringList.Create;

  PNGArquivo := TPNGImage.Create;
  PNGArquivo.Canvas.Font.Name := 'Verdana';
  PNGArquivo.Canvas.Font.Size := 11;
  PNGArquivo.Canvas.Font.Style := [fsBold];
end;

destructor TCartao.Destroy;
begin
  FreeAndNil(Mensagem);
  FreeAndNil(PNGArquivo);

  inherited;
end;

procedure TCartao.Exportar;
begin
  PNGArquivo.Canvas.TextOut(5, 10, StringReplace(Mensagem[0], '%nome%', FNomeLeitor, []));
  PNGArquivo.Canvas.TextOut(5, 70, Mensagem[1]);
  PNGArquivo.Canvas.TextOut(5, 95, Mensagem[2]);
  PNGArquivo.Canvas.TextOut(5, 120, Mensagem[3]);

  // salva o arquivo
  PNGArquivo.SaveToFile(Format('%s\Cartao - %s.png', [FCaminhoImagens, FNomeLeitor]));
end;

procedure TCartao.SetNomeLeitor(const NomeLeitor: string);
begin
  FNomeLeitor := NomeLeitor;
end;

{ TCartaoEspanha }

constructor TCartaoEspanha.Create;
begin
  inherited;
  PNGArquivo.LoadFromFile(CaminhoImagens + 'Imagens\Espanha.png');

  Mensagem.Add('Hola, %nome%!');
  Mensagem.Add('Feliz Año Nuevo!');
  Mensagem.Add('Siempre visite el blog');
  Mensagem.Add('para leer los nuevos artículos! :)');
end;

{ TCartaoBrasil }

constructor TCartaoBrasil.Create;
begin
  inherited;
  PNGArquivo.LoadFromFile(CaminhoImagens + 'Imagens\Brasil.png');

  Mensagem.Add('Olá, %nome%!');
  Mensagem.Add('Feliz Ano Novo!');
  Mensagem.Add('Sempre visite o blog');
  Mensagem.Add('para ler os novos artigos! :)');
end;

{ TCartaoEUA }

constructor TCartaoEUA.Create;
begin
  inherited;
  PNGArquivo.LoadFromFile(CaminhoImagens + '\Imagens\EUA.png');

  Mensagem.Add('Hello, %nome%!');
  Mensagem.Add('Happy New Year!');
  Mensagem.Add('Remember to always visit the blog');
  Mensagem.Add('to check out the newest posts! :)');
end;

{ TCartaoItalia }

constructor TCartaoItalia.Create;
begin
  inherited;
  PNGArquivo.LoadFromFile(CaminhoImagens + 'Imagens\Italia.png');

  Mensagem.Add('Ciao, %nome%!');
  Mensagem.Add('Felice Anno Nuovo!');
  Mensagem.Add('Sempre visitare il blog');
  Mensagem.Add('per leggere i nuovi articoli! :)');
end;

end.
