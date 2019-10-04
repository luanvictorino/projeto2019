unit uFrmCadastroCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPadrao, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, uDM,
  uDMCidade, uFrmEstadoConsulta, uDMEstado;

type
  TFrmCadastroCidade = class(TFrmCadastroPadrao)
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
    procedure OnSelecionarEstado(const RegistroAtual: TDataSet);
    function PegarConsultaEstado(const poDmEstado: TdmEstado): TfrmEstadoConsulta;
  protected
    function TestarRegistroValido: boolean; override;
    function PegarCampoChave: string; override;
  end;

implementation

{$R *.dfm}

uses
  FireDAC.Stan.Param, uConfiguracaoConsulta;

{ TfCadastroCidade }

function TFrmCadastroCidade.TestarRegistroValido: boolean;
begin
  Result := false;

  if not ValidarNmCidade then
    Exit;

  if dfCdEstado.Text = '' then
  begin
    ShowMessage('Campo obrigatório não preenchido!');
    dfCdEstado.SetFocus;
    Exit;
  end;

  Result := True;
end;

function TFrmCadastroCidade.ValidarNmCidade: boolean;
var
  oField: TField;
begin
  Result := True;
  oField := QueryCadastro.FieldByName('nmCidade');
  if not oField.AsString.Trim.IsEmpty then
    Exit;

  ShowMessage('Campo obrigatório não preenchido!');
  oField.FocusControl;

  Result := false;
end;

procedure TFrmCadastroCidade.btConsultarClick(Sender: TObject);
var
  oFrmEstadoConsulta: TFrmEstadoConsulta;
  oDmEstado: TdmEstado;
begin
  oFrmEstadoConsulta := TFrmEstadoConsulta.Create(nil);
  oDmEstado := TDmEstado.Create(nil);
  try
    oFrmEstadoConsulta.QueryConsulta := oDmEstado.sqlConsulta;
    oFrmEstadoConsulta.ShowModal;
  finally
    oFrmEstadoConsulta.Release;
    FreeAndNil(oDmEstado);
  end;
end;

procedure TFrmCadastroCidade.dsCadastroDataChange(Sender: TObject;
  Field: TField);
var
  oDmEstado: TdmEstado;
  oFrmEstadoConsulta: TfrmEstadoConsulta;
begin
  inherited;
  if not Assigned(Field) then
    Exit;
  if not(Field.DataSet.State in dsEditModes) then
    Exit;

  if Field.FieldName.ToUpper.Equals('IDESTADO') then
  begin
    if Field.NewValue = Field.OldValue then
      Exit;
    oDmEstado := TdmEstado.Create(nil);
    oFrmEstadoConsulta := PegarConsultaEstado(oDmEstado);
    try
      oFrmEstadoConsulta.SelecionarID('IDESTADO', Field.AsInteger)
    finally
      oFrmEstadoConsulta.Release;
      FreeAndNil(oDmEstado);
    end;
  end;
end;

procedure TFrmCadastroCidade.OnSelecionarEstado(const RegistroAtual: TDataSet);
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

  if oIdEstadoOrigem.AsInteger <> oIdEstadoDestino.AsInteger then
    oIdEstadoDestino.Assign(oIdEstadoOrigem);

  if oNmEstadoOrigem.AsString <> oNmEstadoDestino.AsString then
    oNmEstadoDestino.Assign(oNmEstadoOrigem);
end;

function TFrmCadastroCidade.PegarCampoChave: string;
begin
  Result := 'IDCIDADE'
end;

function TFrmCadastroCidade.PegarConsultaEstado(
  const poDmEstado: TdmEstado): TfrmEstadoConsulta;
begin
  Result := TfrmEstadoConsulta.Create(nil);
  Result.QueryConsulta := poDmEstado.sqlConsulta;
  Result.OnSelecionarRegistro := OnSelecionarEstado;
end;

end.
