unit Memento.Classes.Caretaker;

interface

uses
  System.SysUtils, System.Generics.Collections, Memento.Classes.Memento;

type
  TCaretaker = class
  private
    FHistoricoAlteracoes: TObjectDictionary<string, TMemento>;
  public
    property HistoricoAlteracoes: TObjectDictionary<string, TMemento> read FHistoricoAlteracoes write FHistoricoAlteracoes;
    constructor Create;
    destructor Destroy; override;
    procedure Adicionar(const pDataHora: string; pMemento: TMemento);
    function Obter(const pDataHora: string): TMemento;
  end;

implementation

{ TCaretaker }

constructor TCaretaker.Create;
begin
  FHistoricoAlteracoes := TObjectDictionary<string, TMemento>.Create([doOwnsValues]);
end;

destructor TCaretaker.Destroy;
begin
  FreeAndNil(FHistoricoAlteracoes);
  inherited;
end;

procedure TCaretaker.Adicionar(const pDataHora: string; pMemento: TMemento);
begin
  HistoricoAlteracoes.Add(pDataHora, pMemento);
end;

function TCaretaker.Obter(const pDataHora: string): TMemento;
begin
  Result := HistoricoAlteracoes.Items[pDataHora];
end;

end.
