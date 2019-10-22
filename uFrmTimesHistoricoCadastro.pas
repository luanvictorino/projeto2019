unit uFrmTimesHistoricoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, uDMTimesHistorico,
  Vcl.Mask, Vcl.DBCtrls, uDMPessoa, uDMTimes, uFrmTimeConsulta,
  uFrmPessoaConsulta;

type
  TFrmTimesHistoricoCadastro = class(TFrmCadastroPadrao)
    lbCdTimesHistorico: TLabel;
    dfCdTimesHistorico: TDBEdit;
    lbCdPessoa: TLabel;
    dfCdPessoa: TDBEdit;
    lbCdTime: TLabel;
    dfCdTime: TDBEdit;
    lbDtEntrada: TLabel;
    dfDtEntrada: TDBEdit;
    lbDtSaida: TLabel;
    dfDtSaida: TDBEdit;
    lbNmPessoa: TLabel;
    dfNmPessoa: TDBEdit;
    lbNmTimes: TLabel;
    dfNmTimes: TDBEdit;
    btConsultaPessoa: TSpeedButton;
    btConsultaTime: TSpeedButton;
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
  private
    function ValidarIdPessoa: boolean;
    function ValidarIdTimes: boolean;
    procedure OnSelecionarPessoa(const RegistroAtual: TDataSet);
    procedure OnSelecionarTimes(const RegistroAtual: TDataSet);
    function PegarConsultaPessoa(const poDmPessoa: TdmPessoa): TfrmPessoaConsulta;
    function PegarConsultaTimes(const poDmTimes: TdmTimes): TfrmTimeConsulta;
    procedure LookupPessoa(const poIdPessoa, poNmPessoa: TField);
    procedure LookupTimes(const poIdTimes, poNmTimes: TField);
  protected
    function TestarRegistroValido: boolean; override;
    function PegarCampoChave: string; override;
  public
  end;

var
  FrmTimesHistoricoCadastro: TFrmTimesHistoricoCadastro;

implementation

{$R *.dfm}

procedure TFrmTimesHistoricoCadastro.dsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if not Assigned(Field) then
    Exit;

  if not(Field.DataSet.State in dsEditModes) then
    Exit;

  if Field.FieldName.ToUpper.Equals('IDPESSOA') then
    LookupPessoa(Field, QueryCadastro.FindField('nmPessoa'));

  if Field.FieldName.ToUpper.Equals('IDTIMES') then
    LookupTimes(Field, QueryCadastro.FindField('nmTimes'));
end;

procedure TFrmTimesHistoricoCadastro.LookupPessoa(const poIdPessoa,
  poNmPessoa: TField);
var
  oDmPessoa: TDmPessoa;
  oFrmPessoaConsulta: TFrmPessoaConsulta;
  bRegistroSelecionado: boolean;
begin
  if not (poIdPessoa.DataSet.State in dsEditModes) then
    Exit;

  if poIdPessoa.IsNull then
  begin
    poNmPessoa.Clear;
    Exit;
  end;

  if poIdPessoa.NewValue = poIdPessoa.OldValue then
    Exit;

  oDmPessoa := TDmPessoa.Create(nil);
  oFrmPessoaConsulta := PegarConsultaPessoa(oDmPessoa);
  try
    bRegistroSelecionado := oFrmPessoaConsulta.SelecionarID('IDPESSOA', poIdPessoa.AsInteger);
    if bRegistroSelecionado then
      Exit;
    poIdPessoa.Clear;
    poNmPessoa.Clear;
  finally
    oFrmPessoaConsulta.Release;
    FreeAndNil(oDmPessoa);
  end;
end;

procedure TFrmTimesHistoricoCadastro.LookupTimes(const poIdTimes,
  poNmTimes: TField);
var
  oDmTimes: TDmTimes;
  oFrmTimesConsulta: TFrmTimeConsulta;
  bRegistroSelecionado: boolean;
begin
  if not (poIdTimes.DataSet.State in dsEditModes) then
    Exit;

  if poIdTimes.IsNull then
  begin
    poNmTimes.Clear;
    Exit;
  end;

  if poIdTimes.NewValue = poIdTimes.OldValue then
    Exit;

  oDmTimes := TDmTimes.Create(nil);
  oFrmTimesConsulta := PegarConsultaTimes(oDmTimes);
  try
    bRegistroSelecionado := oFrmTimesConsulta.SelecionarID('IDTIMES', poIdTimes.AsInteger);
    if bRegistroSelecionado then
      Exit;
    poIdTimes.Clear;
    poNmTimes.Clear;
  finally
    oFrmTimesConsulta.Release;
    FreeAndNil(oDmTimes);
  end;
end;

procedure TFrmTimesHistoricoCadastro.OnSelecionarPessoa(
  const RegistroAtual: TDataSet);
var
  oIdPessoaOrigem: TField;
  oNmPessoaOrigem: TField;
  oIdPessoaDestino: TField;
  oNmPessoaDestino: TField;
begin
  QueryCadastro.Edit;

  oIdPessoaOrigem := RegistroAtual.FieldByName('idPessoa');
  oNmPessoaOrigem := RegistroAtual.FieldByName('nmPessoa');
  oIdPessoaDestino := QueryCadastro.FieldByName('idPessoa');
  oNmPessoaDestino := QueryCadastro.FieldByName('nmPessoa');
  QueryCadastro.DisableControls;
  try
    if oIdPessoaOrigem.AsInteger <> oIdPessoaDestino.AsInteger then
      oIdPessoaDestino.Assign(oIdPessoaOrigem);

    if oNmPessoaOrigem.AsString <> oNmPessoaDestino.AsString then
      oNmPessoaDestino.Assign(oNmPessoaOrigem);
  finally
    QueryCadastro.EnableControls;
  end;
end;

procedure TFrmTimesHistoricoCadastro.OnSelecionarTimes(
  const RegistroAtual: TDataSet);
var
  oIdTimesOrigem: TField;
  oNmTimesOrigem: TField;
  oIdTimesDestino: TField;
  oNmTimesDestino: TField;
begin
  QueryCadastro.Edit;

  oIdTimesOrigem := RegistroAtual.FieldByName('idTimes');
  oNmTimesOrigem := RegistroAtual.FieldByName('nmTimes');
  oIdTimesDestino := QueryCadastro.FieldByName('idTimes');
  oNmTimesDestino := QueryCadastro.FieldByName('nmTimes');
  QueryCadastro.DisableControls;
  try
    if oIdTimesOrigem.AsInteger <> oIdTimesDestino.AsInteger then
      oIdTimesDestino.Assign(oIdTimesOrigem);

    if oNmTimesOrigem.AsString <> oNmTimesDestino.AsString then
      oNmTimesDestino.Assign(oNmTimesOrigem);
  finally
    QueryCadastro.EnableControls;
  end;
end;

function TFrmTimesHistoricoCadastro.PegarCampoChave: string;
begin
  Result := 'IDTIMESHISTORICO';
end;

function TFrmTimesHistoricoCadastro.PegarConsultaPessoa(
  const poDmPessoa: TdmPessoa): TfrmPessoaConsulta;
begin
  Result := TfrmPessoaConsulta.Create(nil);
  Result.QueryConsulta := poDmPessoa.sqlConsulta;
  Result.OnSelecionarRegistro := OnSelecionarPessoa;
end;

function TFrmTimesHistoricoCadastro.PegarConsultaTimes(
  const poDmTimes: TdmTimes): TfrmTimeConsulta;
begin
  Result := TfrmTimeConsulta.Create(nil);
  Result.QueryConsulta := poDmTimes.sqlConsulta;
  Result.OnSelecionarRegistro := OnSelecionarTimes;
end;

function TFrmTimesHistoricoCadastro.TestarRegistroValido: boolean;
begin
  Result := False;

  if ValidarIdPessoa then
    Exit;

  if ValidarIdTimes then
    Exit;

  Result := True;
end;

function TFrmTimesHistoricoCadastro.ValidarIdPessoa: boolean;
var
  oField: TField;
begin
  Result := False;
  oField := QueryCadastro.FieldByName('idPessoa');
  if not oField.AsString.Trim.IsEmpty then
    Exit;

  ShowMessage('Campo obrigatório não preenchido!');
  oField.FocusControl;

  Result := True;
end;

function TFrmTimesHistoricoCadastro.ValidarIdTimes: boolean;
var
  oField: TField;
begin
  Result := False;
  oField := QueryCadastro.FieldByName('IdTimes');
  if not oField.AsString.Trim.IsEmpty then
    Exit;

  ShowMessage('Campo obrigatório não preenchido!');
  oField.FocusControl;

  Result := True;
end;

end.
