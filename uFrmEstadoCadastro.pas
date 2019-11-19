unit uFrmEstadoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPadrao, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, uDMEstado, Vcl.Mask,
  Vcl.DBCtrls, uFrmPaisConsulta, uDMPais, uILookUp, uLookUp;

type
  TFrmEstadoCadastro = class(TFrmCadastroPadrao)
    lbCdEstado: TLabel;
    dfCdEstado: TDBEdit;
    lbNmEstado: TLabel;
    dfNmEstado: TDBEdit;
    lbUfEstado: TLabel;
    dfUfEstado: TDBEdit;
    lbCdPais: TLabel;
    dfCdPais: TDBEdit;
    lbNmPais: TLabel;
    dfNmPais: TDBEdit;
    btConsultarPais: TSpeedButton;
    procedure btConsultarPaisClick(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
  private
    FPaisLookUp: ILookUp;
    function RetornaPaisLookup(const poIdPais, poNmCampo: TField): ILookUp;
    function ValidarNmEstado: boolean;
    function ValidarUfEstado: boolean;
    function ValidarIdPais: boolean;
    procedure OnSelecionarPais(const RegistroAtual: TDataSet);
    function PegarConsultaPais(const poDmPais: TdmPais): TfrmPaisConsulta;
  protected
    function TestarRegistroValido: boolean; override;
    function PegarCampoChave: string; override;
  end;

implementation

{$R *.dfm}

uses
  FireDAC.Stan.Param, uConfiguracaoConsulta;

function TFrmEstadoCadastro.PegarCampoChave: string;
begin
  Result := 'IDESTADO'
end;

function TFrmEstadoCadastro.TestarRegistroValido: boolean;
begin
  Result := False;

  if ValidarNmEstado then
    Exit;

  if ValidarUfEstado then
    Exit;

  if ValidarIdPais then
    Exit;

  Result := True;
end;

function TFrmEstadoCadastro.ValidarNmEstado: boolean;
var
  oField: TField;
begin
  Result := False;
  oField := QueryCadastro.FieldByName('nmEstado');
  if not oField.AsString.Trim.IsEmpty then
    Exit;

  ShowMessage('Campo obrigatório não preenchido!');
  oField.FocusControl;

  Result := True;
end;

function TFrmEstadoCadastro.ValidarUfEstado: boolean;
var
  oField: TField;
begin
  Result := False;
  oField := QueryCadastro.FieldByName('ufEstado');
  if not oField.AsString.Trim.IsEmpty then
    Exit;

  ShowMessage('Campo obrigatório não preenchido!');
  oField.FocusControl;

  Result := True;
end;

function TFrmEstadoCadastro.ValidarIdPais: boolean;
var
  oField: TField;
begin
  Result := False;
  oField := QueryCadastro.FieldByName('IdPais');
  if not oField.AsString.Trim.IsEmpty then
    Exit;

  ShowMessage('Campo obrigatório não preenchido!');
  oField.FocusControl;

  Result := True;
end;

procedure TFrmEstadoCadastro.btConsultarPaisClick(Sender: TObject);
var
  oFrmPaisConsulta: TfrmPaisConsulta;
  oDmPais: TdmPais;
begin
  if not(QueryCadastro.State in dsEditModes) then
    Exit;

  oDmPais := TdmPais.Create(nil);
  oFrmPaisConsulta := PegarConsultaPais(oDmPais);
  try
    oFrmPaisConsulta.ShowModal;
  finally
    oFrmPaisConsulta.Release;
    FreeAndNil(oDmPais);
  end;
end;

function TFrmEstadoCadastro.PegarConsultaPais(const poDmPais: TdmPais): TfrmPaisConsulta;
begin
  Result := TfrmPaisConsulta.PegarPaisConsulta(poDmPais.sqlConsulta, OnSelecionarPais);
end;

procedure TFrmEstadoCadastro.dsCadastroDataChange(Sender: TObject; Field: TField);
var
  oLookUp: ILookUp;
  oNmPais: TField;
begin
  inherited;
  if not Assigned(Field) then
    Exit;

  if not(Field.DataSet.State in dsEditModes) then
    Exit;

  if Field.FieldName.ToUpper.Equals('IDPAIS') then
  begin
    oNmPais := QueryCadastro.FindField('nmPais');
    oLookUp := RetornaPaisLookup(Field, oNmPais);
    oLookUp.Executar;
  end;
end;

function TFrmEstadoCadastro.RetornaPaisLookup(const poIdPais,
  poNmCampo: TField): ILookUp;
begin
  if not Assigned(FPaisLookUp) then
  begin
    FPaisLookUp := TLookUp.Create(
      function(const poIdCampo: TField): boolean
      var
        oDmPais: TDmPais;
        oFrmPaisConsulta: TFrmPaisConsulta;
      begin
        oDmPais := TDmPais.Create(nil);
        oFrmPaisConsulta := PegarConsultaPais(oDmPais);
        try
          Result := oFrmPaisConsulta.SelecionarID('IDPAIS', poIdPais.AsInteger);
        finally
          oFrmPaisConsulta.Release;
          FreeAndNil(oDmPais);
        end;
      end);
    FPaisLookUp.IdCampo := poIdPais;
    FPaisLookUp.NmCampo := poNmCampo;
  end;
  result := FPaisLookUp;
end;

procedure TFrmEstadoCadastro.OnSelecionarPais(const RegistroAtual: TDataSet);
var
  oIdPaisOrigem: TField;
  oNmPaisOrigem: TField;
  oIdPaisDestino: TField;
  oNmPaisDestino: TField;
begin
  QueryCadastro.Edit;

  oIdPaisOrigem := RegistroAtual.FieldByName('idPais');
  oNmPaisOrigem := RegistroAtual.FieldByName('nmPais');
  oIdPaisDestino := QueryCadastro.FieldByName('idPais');
  oNmPaisDestino := QueryCadastro.FieldByName('nmPais');
  QueryCadastro.DisableControls;
  try
    if oIdPaisOrigem.AsInteger <> oIdPaisDestino.AsInteger then
      oIdPaisDestino.Assign(oIdPaisOrigem);

    if oNmPaisOrigem.AsString <> oNmPaisDestino.AsString then
      oNmPaisDestino.Assign(oNmPaisOrigem);
  finally
    QueryCadastro.EnableControls;
  end;
end;

end.
