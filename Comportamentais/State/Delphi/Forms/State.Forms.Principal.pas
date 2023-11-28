unit State.Forms.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, System.ImageList, Vcl.ImgList,
  State.Classes.Context;

type
  TfFormulario = class(TForm)
    PanelCampos: TPanel;
    lblDescricao: TLabel;
    DBGrid: TDBGrid;
    ClientDataSet: TClientDataSet;
    ClientDataSetDescricao: TStringField;
    ClientDataSetQtde: TIntegerField;
    edtDescricao: TEdit;
    lblQtde: TLabel;
    edtQtde: TEdit;
    lblValor: TLabel;
    edtValor: TEdit;
    ClientDataSetTotal: TFloatField;
    edtDesconto: TEdit;
    lblDesconto: TLabel;
    lblFrete: TLabel;
    edtFrete: TEdit;
    lblTotal: TLabel;
    edtTotal: TEdit;
    Bevel: TBevel;
    btnAdicionar: TBitBtn;
    DataSource: TDataSource;
    PanelCategoria: TPanel;
    lblCategoria: TLabel;
    ImageList: TImageList;
    ClientDataSetValor: TFloatField;
    procedure ClientDataSetCalcFields(DataSet: TDataSet);
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGridCellClick(Column: TColumn);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
  private
    FContext: TContext;

    procedure AdicionarItem;
    procedure RemoverItem;
    procedure AtualizarCategoria;
    procedure AtualizarCampos;
  end;

var
  fFormulario: TfFormulario;

implementation

uses
  State.Helpers.Enumerados;

{$R *.dfm}

procedure TfFormulario.AdicionarItem;
begin
  ClientDataSet.Append;
  ClientDataSet.FieldByName('Descricao').AsString := Trim(edtDescricao.Text);
  ClientDataSet.FieldByName('Qtde').AsFloat := StrToIntDef(edtQtde.Text, 0);
  ClientDataSet.FieldByName('Valor').AsFloat := StrToFloatDef(edtValor.Text, 0);
  ClientDataSet.Post;

  FContext.AdicionarItem(ClientDataSet.FieldByName('Total').AsFloat);
end;

procedure TfFormulario.AtualizarCampos;
begin
  edtDesconto.Text := FormatFloat('###,##0.00', FContext.ObterValorDesconto);
  edtFrete.Text := FormatFloat('###,##0.00', FContext.ObterValorFrete);
  edtTotal.Text := FormatFloat('###,##0.00', FContext.ObterTotalPedido - FContext.ObterValorDesconto + FContext.ObterValorFrete);

  edtDescricao.Clear;
  edtQtde.Clear;
  edtValor.Clear;
  edtDescricao.SetFocus;
end;

procedure TfFormulario.AtualizarCategoria;
begin
  if FContext.ObterCategoriaPedido = cpBronze then
  begin
    PanelCategoria.Caption := 'Bronze';
    PanelCategoria.Font.Color := clGreen;
  end else

  if FContext.ObterCategoriaPedido = cpPrata then
  begin
    PanelCategoria.Caption := 'Prata';
    PanelCategoria.Font.Color := clOlive;
  end else

  if FContext.ObterCategoriaPedido = cpOuro then
  begin
    PanelCategoria.Caption := 'Ouro';
    PanelCategoria.Font.Color := clBlue;
  end;
end;

procedure TfFormulario.btnAdicionarClick(Sender: TObject);
begin
  AdicionarItem;
  AtualizarCategoria;
  AtualizarCampos;
end;

procedure TfFormulario.ClientDataSetCalcFields(DataSet: TDataSet);
begin
  ClientDataSet.FieldByName('Total').AsFloat := ClientDataSet.FieldByName('Qtde').AsInteger *
    ClientDataSet.FieldByName('Valor').AsFloat;
end;

procedure TfFormulario.DBGridCellClick(Column: TColumn);
begin
  if UpperCase(Column.FieldName) = 'REMOVER' then
  begin
    RemoverItem;
    AtualizarCategoria;
    AtualizarCampos;
  end;
end;

procedure TfFormulario.DBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  if UpperCase(Column.FieldName) = 'REMOVER' then
  begin
    DBGrid.Canvas.FillRect(Rect);
    ImageList.Draw(DBGrid.Canvas, Rect.Left + 24, Rect.Top + 1, 0);
  end;
end;

procedure TfFormulario.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key, ['0'..'9', #8, #44])) then
  begin
    Key := #0;
  end;
end;

procedure TfFormulario.FormCreate(Sender: TObject);
begin
  FContext := TContext.Create;
end;

procedure TfFormulario.FormDestroy(Sender: TObject);
begin
  FContext.Destroy;
end;

procedure TfFormulario.RemoverItem;
begin
  if ClientDataSet.IsEmpty then
  begin
    Exit;
  end;

  FContext.RemoverItem(ClientDataSet.FieldByName('Total').AsFloat);
  ClientDataSet.Delete;
end;

end.
