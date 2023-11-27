unit Observer.Forms.ConcreteSubject;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Datasnap.DBClient,
  Vcl.ExtCtrls, System.Generics.Collections, Observer.Interfaces.Subject, System.Classes,
  Observer.Interfaces.Notificacao;

type
  TFrameCadastroOperacoes = class(TFrame, ISubject)
    Bevel: TBevel;
    btnGravar: TBitBtn;
    ClientDataSet: TClientDataSet;
    ClientDataSetCategoria: TStringField;
    ClientDataSetOperacao: TStringField;
    ClientDataSetValor: TFloatField;
    cbxCategoria: TComboBox;
    cbxOperacao: TComboBox;
    DataSource: TDataSource;
    DBGrid: TDBGrid;
    edtValor: TEdit;
    lblCategoria: TLabel;
    lblOperacao: TLabel;
    lblValor: TLabel;
    procedure btnGravarClick(Sender: TObject);
    procedure cbxOperacaoChange(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
  private
    FObservers: TList<IObserver>;
    procedure CarregarCategorias;
    procedure Notificar;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AdicionarObserver(pObserver: IObserver);
    procedure RemoverObserver(pObserver: IObserver);
  end;

implementation

uses
  Model.Notificacao;

{$R *.dfm}

{ TFrameCadastroOperacoes }

procedure TFrameCadastroOperacoes.btnGravarClick(Sender: TObject);
begin
  if (cbxOperacao.ItemIndex < 0) or (cbxCategoria.ItemIndex < 0) then
  begin
    Exit;
  end;

  ClientDataSet.AppendRecord([cbxOperacao.Text, cbxCategoria.Text, StrToFloatDef(edtValor.Text, 0)]);
  Notificar;

  cbxOperacao.ItemIndex := -1;
  cbxCategoria.ItemIndex := -1;
  edtValor.Clear;
  cbxOperacao.SetFocus;
end;

procedure TFrameCadastroOperacoes.CarregarCategorias;
begin
  cbxCategoria.Clear;

  if cbxOperacao.ItemIndex = 0 then
  begin
    cbxCategoria.Items.Add('Salário');
    cbxCategoria.Items.Add('13º');
    cbxCategoria.Items.Add('Restitução do IR');
    cbxCategoria.Items.Add('Freelancing');
  end else
  if cbxOperacao.ItemIndex = 1 then
 begin
    cbxCategoria.Items.Add('Aluguel');
    cbxCategoria.Items.Add('Supermercado');
    cbxCategoria.Items.Add('Farmácia');
    cbxCategoria.Items.Add('Escola');
    cbxCategoria.Items.Add('Combustível');
    cbxCategoria.Items.Add('Alimentação');
    cbxCategoria.Items.Add('Roupas');
    cbxCategoria.Items.Add('Viagens');
 end;

end;

procedure TFrameCadastroOperacoes.cbxOperacaoChange(Sender: TObject);
begin
  CarregarCategorias;
end;

constructor TFrameCadastroOperacoes.Create(AOwner: TComponent);
begin
  inherited;

  FObservers := TList<IObserver>.Create;
end;

destructor TFrameCadastroOperacoes.Destroy;
begin
  FreeAndNil(FObservers);
  inherited;
end;

procedure TFrameCadastroOperacoes.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key, ['0'..'9', #8, #44])) then
  begin
    Key := #0;
  end;
end;

procedure TFrameCadastroOperacoes.Notificar;
var
  lNotificacao: TNotificacao;
  lObserver: IObserver;
begin
  lNotificacao.Operacao := ClientDataSet.FieldByName('Operacao').AsString;
  lNotificacao.Categoria := ClientDataSet.FieldByName('Categoria').AsString;
  lNotificacao.Valor := ClientDataSet.FieldByName('Valor').AsFloat;

  for lObserver in FObservers do
  begin
    lObserver.Atualizar(lNotificacao);
  end;
end;

procedure TFrameCadastroOperacoes.AdicionarObserver(pObserver: IObserver);
begin
  FObservers.Add(pObserver);
end;

procedure TFrameCadastroOperacoes.RemoverObserver(pObserver: IObserver);
begin
  FObservers.Delete(FObservers.IndexOf(pObserver));
end;

end.
