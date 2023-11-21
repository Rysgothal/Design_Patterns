unit FactoryMethod.Forms.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, 
  FactoryMethod.Interfaces.Produto;

type
  TfrmPrincipal = class(TForm)
    lblValor: TLabel;
    lblPrazoPagamento: TLabel;
    lblQtdeParcelas: TLabel;
    cbxPrazoPagamento: TComboBox;
    edtValor: TEdit;
    BtnGerarProjecao: TBitBtn;
    memPrincipal: TMemo;
    edtQtdeParcelas: TEdit;
    procedure BtnGerarProjecaoClick(Sender: TObject);
  private
    procedure GerarProjecao;
    procedure MostrarProjecoes(lTipoPrazo: ITipoPrazo; lValor: Real; lQtdeParcelas: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  FactoryMethod.Interfaces.Criador, 
  FactoryMethod.Classes.CriadorConcreto;

{$R *.dfm}

procedure TfrmPrincipal.BtnGerarProjecaoClick(Sender: TObject);
begin
  GerarProjecao;
end;

procedure TfrmPrincipal.GerarProjecao;
var
  lFabricaPrazos: TFabricaPrazos;
  lTipoPrazo: ITipoPrazo;
  lValor: Real;
  lQtdeParcelas: Integer;
begin
  if cbxPrazoPagamento.ItemIndex < 0 then
  begin
    Application.MessageBox('Selecione o prazo de pagamento.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    cbxPrazoPagamento.DroppedDown := True;
    Exit;
  end;
  
  lFabricaPrazos := TFabricaPrazos.Create;
  lTipoPrazo := lFabricaPrazos.ConsultarPrazo(TModoPrazo(cbxPrazoPagamento.ItemIndex));
  lValor := StrToFloatDef(edtValor.Text, 0);
  lQtdeParcelas := StrToIntDef(edtQtdeParcelas.Text, 0);
  
  MostrarProjecoes(lTipoPrazo, lValor, lQtdeParcelas);
end;

procedure TfrmPrincipal.MostrarProjecoes(lTipoPrazo: ITipoPrazo; lValor: Real; lQtdeParcelas: Integer);
begin
  memPrincipal.Lines.Clear;
  memPrincipal.Lines.Add(lTipoPrazo.ConsultarDescricao);
  memPrincipal.Lines.Add(lTipoPrazo.ConsultarJuros);
  memPrincipal.Lines.Add(lTipoPrazo.ConsultarProjecao(lValor, lQtdeParcelas));
  memPrincipal.Lines.Add(lTipoPrazo.ConsultarTotal);
end;

end.
