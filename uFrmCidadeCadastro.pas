unit uFrmCidadeCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPadrao, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  uDMCidade, uFrmEstadoConsulta, uDMEstado;

type
  TFrmCidadeCadastro = class(TFrmCadastroPadrao)
    lbCdCidade: TLabel;
    dfCdCidade: TDBEdit;
    lbNmCidade: TLabel;
    dfNmCidade: TDBEdit;
    lbCdEstado: TLabel;
    dfCdEstado: TDBEdit;
    btConsultar: TSpeedButton;
    lbNmEstado: TLabel;
    dfNMEstado: TDBEdit;
    procedure btConsultarClick(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
  private
    function ValidarNmCidade: boolean;
    function ValidarIdEstado: boolean;
    procedure OnSelecionarEstado(const RegistroAtual: TDataSet);
    function PegarConsultaEstado(const poDmEstado: TdmEstado): TfrmEstadoConsulta;
    procedure LookupEstado(const poIdEstado, poNmEstado: TField);
  protected
    function TestarRegistroValido: boolean; override;
    function PegarCampoChave: string; override;
  end;

implementation

{$R *.dfm}

uses
  FireDAC.Stan.Param, uConfiguracaoConsulta;

function TFrmCidadeCadastro.TestarRegistroValido: boolean;
begin
  Result := False;

  if ValidarNmCidade then
    Exit;

  if ValidarIdEstado then
    Exit;

  Result := True;
end;

function TFrmCidadeCadastro.ValidarNmCidade: boolean;
var
  oField: TField;
begin
  Result := False;
  oField := QueryCadastro.FieldByName('nmCidade');
  if not oField.AsString.Trim.IsEmpty then
    Exit;

  ShowMessage('Campo obrigatório não preenchido!');
  oField.FocusControl;

  Result := True;
end;

function TFrmCidadeCadastro.ValidarIdEstado: boolean;
var
  oField: TField;
begin
  Result := False;
  oField := QueryCadastro.FieldByName('IdEstado');
  if not oField.AsString.Trim.IsEmpty then
    Exit;

  ShowMessage('Campo obrigatório não preenchido!');
  oField.FocusControl;

  Result := True;
end;

procedure TFrmCidadeCadastro.btConsultarClick(Sender: TObject);
var
  oFrmEstadoConsulta: TfrmEstadoConsulta;
  oDmEstado: TdmEstado;
begin
  oDmEstado := TdmEstado.Create(self);
  oFrmEstadoConsulta := PegarConsultaEstado(oDmEstado);
  try
    oFrmEstadoConsulta.ShowModal;
  finally
    oFrmEstadoConsulta.Release;
    FreeAndNil(oDmEstado);
  end;
end;

procedure TFrmCidadeCadastro.dsCadastroDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if not Assigned(Field) then
    Exit;

  if not(Field.DataSet.State in dsEditModes) then
    Exit;

 if Field.FieldName.ToUpper.Equals('IDESTADO') then
    LookupEstado(Field, QueryCadastro.FindField('nmEstado'));
end;

procedure TFrmCidadeCadastro.LookupEstado(const poIdEstado, poNmEstado: TField);
var
  oDmEstado: TdmEstado;
  oFrmEstadoConsulta: TfrmEstadoConsulta;
  bRegistroSelecionado: boolean;
begin
  if not(poIdEstado.DataSet.State in dsEditModes) then
    Exit;

  if poIdEstado.IsNull then
  begin
    poNmEstado.Clear;
    Exit;
  end;

  oDmEstado := TdmEstado.Create(nil);
  oFrmEstadoConsulta := PegarConsultaEstado(oDmEstado);
  try
    bRegistroSelecionado := oFrmEstadoConsulta.SelecionarID('IDESTADO', poIdEstado.AsInteger);
    if bRegistroSelecionado then
      Exit;
    poIdEstado.Clear;
    poNmEstado.Clear;
  finally
    oFrmEstadoConsulta.Release;
    FreeAndNil(oDmEstado);
  end;
end;

procedure TFrmCidadeCadastro.OnSelecionarEstado(const RegistroAtual: TDataSet);
var
  oIdEstadoOrigem: TField;
  oNmEstadoOrigem: TField;
  oIdEstadoDestino: TField;
  oNmEstadoDestino: TField;
begin
  QueryCadastro.Edit;

  oIdEstadoOrigem := RegistroAtual.FieldByName('idEstado');
  oNmEstadoOrigem := RegistroAtual.FieldByName('nmEstado');
  oIdEstadoDestino := QueryCadastro.FieldByName('idEstado');
  oNmEstadoDestino := QueryCadastro.FieldByName('nmEstado');
  QueryCadastro.DisableControls;
  try
    if oIdEstadoOrigem.AsInteger <> oIdEstadoDestino.AsInteger then
      oIdEstadoDestino.Assign(oIdEstadoOrigem);

    if oNmEstadoOrigem.AsString <> oNmEstadoDestino.AsString then
      oNmEstadoDestino.Assign(oNmEstadoOrigem);
  finally
    QueryCadastro.EnableControls;
  end;
end;

function TFrmCidadeCadastro.PegarCampoChave: string;
begin
  Result := 'IDCIDADE'
end;

function TFrmCidadeCadastro.PegarConsultaEstado(const poDmEstado: TdmEstado): TfrmEstadoConsulta;
begin
  Result := TfrmEstadoConsulta.PegarEstadoConsulta(poDmEstado.sqlConsulta, OnSelecionarEstado);
end;

end.
