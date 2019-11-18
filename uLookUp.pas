unit uLookUp;

interface

uses
  Data.DB, uILookUp;

type

  TExecutadorLookup = reference to function(const poIdCampo: TField): boolean;

  TLookUp = class(TInterfacedObject, ILookUp)
  private
    FIdCampo: TField;
    FNmCampo: TField;
    FExecutadorLookup: TExecutadorLookup;
  protected
    procedure SetIdCampo(const Value: TField);
    procedure SetNmCampo(const Value: TField);
    function GetIdCampo: TField;
    function GetNmCampo: TField;
  public
    constructor Create(const ExecutadorLookup: TExecutadorLookup);
    procedure Executar;
  end;

implementation

{ TLookUp }

constructor TLookUp.Create(const ExecutadorLookup: TExecutadorLookup);
begin
  FExecutadorLookup := ExecutadorLookup;
end;

procedure TLookUp.Executar;
var
  bLocalizouRegistro: boolean;
begin
  if not(FIdCampo.DataSet.State in dsEditModes) then
    Exit;

  if FIdCampo.IsNull then
  begin
    FNmCampo.Clear;
    Exit;
  end;

  if FIdCampo.NewValue = FIdCampo.OldValue then
  begin
    FNmCampo.Value := FNmCampo.OldValue;
    Exit;
  end;

  bLocalizouRegistro := FExecutadorLookup(FIdCampo);

  if bLocalizouRegistro then
    Exit;

  FIdCampo.Clear;
  FNmCampo.Clear;
end;

function TLookUp.GetIdCampo: TField;
begin
  Result := FIdCampo;
end;

function TLookUp.GetNmCampo: TField;
begin
  Result := FNmCampo;
end;

procedure TLookUp.SetIdCampo(const Value: TField);
begin
  FIdCampo := Value;
end;

procedure TLookUp.SetNmCampo(const Value: TField);
begin
  FNmCampo := Value;
end;

end.
