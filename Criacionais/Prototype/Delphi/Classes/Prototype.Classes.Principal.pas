unit Prototype.Classes.Principal;

interface

uses
  Vcl.Graphics, System.SysUtils, Prototype.Interfaces.Prototype;

type
  TReuniao = class(TInterfacedObject, IPrototype)
  private
    FNome: string;
    FData: TDate;
    FHora: TTIme;
    FCategoria: TColor;
    FParticipantes: string;
  public
    constructor Create;
    function Clonar: IPrototype;
    property Nome: string read FNome write FNome;
    property Data: TDate read FData write FData;
    property Hora: TTIme read FHora write FHora;
    property Categoria: TColor read FCategoria write FCategoria;
    property Participantes: string read FParticipantes write FParticipantes;
  end;

implementation

{ TReuniao }

function TReuniao.Clonar: IPrototype;
var
  lNovaReuniao: TReuniao;
begin
  lNovaReuniao := TReuniao.Create;

  lNovaReuniao.FNome := FNome;
  lNovaReuniao.FData := FData;
  lNovaReuniao.FHora := FHora;
  lNovaReuniao.FCategoria := FCategoria;
  lNovaReuniao.FParticipantes := FParticipantes;

  Result := lNovaReuniao;
end;

constructor TReuniao.Create;
begin
  FNome := EmptyStr;
  FData := Date;
  FHora := Time;
  FCategoria := clBlack;
end;

end.
