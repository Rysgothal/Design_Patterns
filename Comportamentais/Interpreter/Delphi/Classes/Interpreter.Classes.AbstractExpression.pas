unit Interpreter.Classes.AbstractExpression;

interface

uses
  System.Classes, Interpreter.Classes.Context, System.SysUtils;

type
  TAbstractExpression = class
  protected
    FPartes: TStringList;
  public
    property Partes: TStringList read FPartes write FPartes;
    constructor Create;
    destructor Destroy; override;
    procedure Interpretar(pContexto: TContext); virtual; abstract;
  end;

implementation

{ TAbstractExpression }

constructor TAbstractExpression.Create;
begin
  FPartes := TStringList.Create;
end;

destructor TAbstractExpression.Destroy;
begin
  FreeAndNil(FPartes);
  inherited;
end;

end.
