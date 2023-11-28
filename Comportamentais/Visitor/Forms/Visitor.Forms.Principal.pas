unit Visitor.Forms.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.ComCtrls, Vcl.ExtCtrls, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.ObjectScope, System.Generics.Collections,
  Visitor.Classes.ConcreteElement, Visitor.Classes.ConcreteVisitorSenioridade,
  Visitor.Classes.ConcreteElementProgramador,
  Visitor.Classes.ConcreteElementGerente;

type
  TfrmPrincipal = class(TForm)
    AdapterBindSource: TAdapterBindSource;
    Bevel: TBevel;
    BindingsList: TBindingsList;
    btnAdicionar: TBitBtn;
    btnSalario: TBitBtn;
    btnSenioridade: TBitBtn;
    cbxFuncao: TComboBox;
    DateTimePickerAdmissao: TDateTimePicker;
    edtNome: TEdit;
    edtSalario: TEdit;
    lblAdmissao: TLabel;
    lblFuncao: TLabel;
    lblNome: TLabel;
    lblSalario: TLabel;
    LinkGridToDataSourceAdapterBindSource: TLinkGridToDataSource;
    Panel: TPanel;
    PanelBotoes: TPanel;
    StringGrid: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure btnSalarioClick(Sender: TObject);
    procedure btnSenioridadeClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure AdapterBindSourceCreateAdapter(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
  private
    { Object Structure }
    FObjectStructure: TObjectList<TFuncionario>;

    procedure PreencherDadosFictícios;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  Visitor.Interfaces.Visitor, Visitor.Classes.ConcreteVisitorSalario;

{$R *.dfm}

procedure TfrmPrincipal.AdapterBindSourceCreateAdapter(Sender: TObject; var ABindSourceAdapter: TBindSourceAdapter);
begin
  ABindSourceAdapter := TListBindSourceAdapter<TFuncionario>.Create(Self, FObjectStructure);
end;

procedure TfrmPrincipal.btnSalarioClick(Sender: TObject);
var
  lVisitor: IVisitor;
begin
  lVisitor := TSalario.Create;

  for var lElement in FObjectStructure do
  begin
    lElement.Accept(lVisitor);
  end;

  AdapterBindSource.Refresh;
end;

procedure TfrmPrincipal.btnSenioridadeClick(Sender: TObject);
var
  lVisitor: IVisitor;
begin
  lVisitor := TSenioridade.Create;

  for var lElement in FObjectStructure do
  begin
    lElement.Accept(lVisitor);
  end;

  AdapterBindSource.Refresh;
end;

procedure TfrmPrincipal.btnAdicionarClick(Sender: TObject);
var
  lElement: TFuncionario;
begin
  lElement := nil;

  case cbxFuncao.ItemIndex of
    0: lElement := TProgramador.Create;
    1: lElement := TGerente.Create;
  end;

  lElement.Nome := edtNome.Text;
  lElement.Funcao := cbxFuncao.Text;
  lElement.Admissao := DateTimePickerAdmissao.Date;
  lElement.Salario := StrToFloatDef(edtSalario.Text, 0);

  FObjectStructure.Add(lElement);
  AdapterBindSource.Refresh;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  lAdapter: TListBindSourceAdapter<TFuncionario>;
begin
  FObjectStructure := TObjectList<TFuncionario>.Create;

  PreencherDadosFictícios;

  lAdapter := TListBindSourceAdapter<TFuncionario>(AdapterBindSource.InternalAdapter);
  lAdapter.SetList(FObjectStructure);
  lAdapter.Active := True;
end;

procedure TfrmPrincipal.PreencherDadosFictícios;
var
  lFuncionario: Tfuncionario;
begin
  lFuncionario := TProgramador.Create;
  lFuncionario.Nome := 'Anthony Kiedis';
  lFuncionario.Funcao := 'Programador';
  lFuncionario.Admissao := StrToDate('10/11/2010');
  lFuncionario.Salario := 3180.00;
  FObjectStructure.Add(lFuncionario);

  lFuncionario := TProgramador.Create;
  lFuncionario.Nome := 'Saul Hudson';
  lFuncionario.Funcao := 'Programador';
  lFuncionario.Admissao := StrToDate('28/05/2015');
  lFuncionario.Salario := 2420.00;
  FObjectStructure.Add(lFuncionario);

  lFuncionario := TGerente.Create;
  lFuncionario.Nome := 'Kirk Hammett';
  lFuncionario.Funcao := 'Gerente';
  lFuncionario.Admissao := StrToDate('06/04/2013');
  lFuncionario.Salario := 4390.00;
  FObjectStructure.Add(lFuncionario);

  lFuncionario := TProgramador.Create;
  lFuncionario.Nome := 'Steven Tyler';
  lFuncionario.Funcao := 'Programador';
  lFuncionario.Admissao := StrToDate('08/08/2012');
  lFuncionario.Salario := 3630.00;
  FObjectStructure.Add(lFuncionario);

  lFuncionario := TGerente.Create;
  lFuncionario.Nome := 'Anette Olzon';
  lFuncionario.Funcao := 'Gerente';
  lFuncionario.Admissao := StrToDate('27/01/2014');
  lFuncionario.Salario := 4150.00;
  FObjectStructure.Add(lFuncionario);

  lFuncionario := TGerente.Create;
  lFuncionario.Nome := 'Paul Stanley';
  lFuncionario.Funcao := 'Gerente';
  lFuncionario.Admissao := StrToDate('14/04/2011');
  lFuncionario.Salario := 4660.00;
  FObjectStructure.Add(lFuncionario);

  lFuncionario := TProgramador.Create;
  lFuncionario.Nome := 'Rob Thomas';
  lFuncionario.Funcao := 'Programador';
  lFuncionario.Admissao := StrToDate('04/07/2016');
  lFuncionario.Salario := 2270.00;
  FObjectStructure.Add(lFuncionario);
end;

end.
