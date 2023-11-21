unit FactoryMethod.Forms.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, 
  FactoryMethod.Interfaces.Produto;

type
  TForm1 = class(TForm)
    LabelValor: TLabel;
    LabelPrazoPagamento: TLabel;
    LabelQtdeParcelas: TLabel;
    ComboBoxPrazoPagamento: TComboBox;
    EditValor: TEdit;
    BitBtnGerarProjecao: TBitBtn;
    Memo: TMemo;
    EditQtdeParcelas: TEdit;
    procedure BitBtnGerarProjecaoClick(Sender: TObject);
  private
    procedure GerarProjecao;
    procedure MostrarProjecoes(lTipoPrazo: ITipoPrazo; lValor: Real; lQtdeParcelas: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  FactoryMethod.Interfaces.Criador, 
  FactoryMethod.Classes.CriadorConcreto;

{$R *.dfm}

procedure TForm1.BitBtnGerarProjecaoClick(Sender: TObject);
begin
  GerarProjecao;
end;

procedure TForm1.GerarProjecao;
var
  lFabricaPrazos: TFabricaPrazos;
  lTipoPrazo: ITipoPrazo;
  lValor: Real;
  lQtdeParcelas: Integer;
begin
  if ComboBoxPrazoPagamento.ItemIndex < 0 then
  begin
    Application.MessageBox('Selecione o prazo de pagamento.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    ComboBoxPrazoPagamento.DroppedDown := True;
    Exit;
  end;
  
  lFabricaPrazos := TFabricaPrazos.Create;
  lTipoPrazo := lFabricaPrazos.ConsultarPrazo(TModoPrazo(ComboBoxPrazoPagamento.ItemIndex));
  lValor := StrToFloatDef(EditValor.Text, 0);
  lQtdeParcelas := StrToIntDef(EditQtdeParcelas.Text, 0);
  
  MostrarProjecoes(lTipoPrazo, lValor, lQtdeParcelas);
end;

procedure TForm1.MostrarProjecoes(lTipoPrazo: ITipoPrazo; lValor: Real; lQtdeParcelas: Integer);
begin
  Memo.Lines.Clear;
  Memo.Lines.Add(lTipoPrazo.ConsultarDescricao);
  Memo.Lines.Add(lTipoPrazo.ConsultarJuros);
  Memo.Lines.Add(lTipoPrazo.ConsultarProjecao(lValor, lQtdeParcelas));
  Memo.Lines.Add(lTipoPrazo.ConsultarTotal);
end;

end.
