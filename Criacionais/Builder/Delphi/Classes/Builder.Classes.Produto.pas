unit Builder.Classes.Produto;

interface

uses
  System.Classes;

type
  TProduto = class
  private
    FConteudoHTML: TStringList;                     // Objeto que vai armazenar o conteúdo HTML
  public
    property ConteudoHTML: TStringList read FConteudoHTML write FConteudoHTML;
    constructor Create;
    destructor Destroy; override;
    procedure Adicionar(const pTexto: string);      // Concatena o conteúdo ao Objeto 'FConteudoHTML'
    procedure SalvarArquivo;                        // Abre um diálogo para salvar o arquivo HTML
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TProduto }

procedure TProduto.Adicionar(const pTexto: string);
begin
  ConteudoHTML.Add(pTexto);
end;

constructor TProduto.Create;
begin
  FConteudoHTML := TStringList.Create;
end;

destructor TProduto.Destroy;
begin
  FreeAndNil(FConteudoHTML);
  inherited;
end;

procedure TProduto.SalvarArquivo;
var
  lSalvar: TSaveDialog;
begin
  lSalvar := TSaveDialog.Create(nil);

  try
    lSalvar.DefaultExt := 'html';
    lSalvar.InitialDir := GetCurrentDir;

    if not lSalvar.Execute then
    begin
      Exit;
    end;

    ConteudoHTML.SaveToFile(lSalvar.FileName, TEncoding.UTF8);
  finally
    FreeAndNil(lSalvar);
  end;
end;

end.
