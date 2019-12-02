unit uFrmCidadeCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPadrao, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  uDMCidade, uFrmEstadoConsulta, uDMEstado, uILookUp, uLookUp;

type
  TFrmCidadeCadastro = class(TFrmCadastroPadrao)
    lbCdCidade: TLabel;
    dfCdCidade: TDBEdit;
    lbNmCidade: TLabel;
    dfNmCidade: TDBEdit;
    lbCdEstado: TLabel;
    dfCdEstado: TDBEdit;
    btConsultarEstado: TSpeedButton;
    lbNmEstado: TLabel;
    dfNMEstado: TDBEdit;
    procedure btConsultarEstadoClick(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
  private
    FEstadoLookup: ILookUp;
    function RetornaEstadoLookup(const poIdEstado, poNmCampo: TField): ILookUp;
    function ValidarNmCidade: boolean;
    function ValidarIdEstado: boolean;
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

procedure TFrmCidadeCadastro.btConsultarEstadoClick(Sender: TObject);
var
  oFrmEstadoConsulta: TfrmEstadoConsulta;
  oDmEstado: TdmEstado;
begin
  if QueryCadastro.IsEmpty then
    Exit;

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
var
  oNmEstado: TField;
  oLookUp: ILookUp;
begin
  inherited;
  if not Assigned(Field) then
    Exit;

  if not(Field.DataSet.State in dsEditModes) then
    Exit;

 if Field.FieldName.ToUpper.Equals('IDESTADO') then
 begin
  oNmEstado := QueryCadastro.FindField('nmEstado');
  oLookUp :=  RetornaEstadoLookup(Field, oNmEstado);
  oLookUp.Executar;
 end;
end;

function TFrmCidadeCadastro.RetornaEstadoLookup(const poIdEstado,
  poNmCampo: TField): ILookUp;
begin
  if not Assigned(FEstadoLookup) then
  begin
    FEstadoLookup := TLookUp.Create(
      function(const poIdCampo: TField): boolean
      var
        oDmEstado: TDmEstado;
        oFrmEstadoConsulta: TFrmEstadoConsulta;
      begin
        oDmEstado := TDmEstado.Create(nil);
        oFrmEstadoConsulta := PegarConsultaEstado(oDmEstado);
        try
          Result := oFrmEstadoConsulta.SelecionarID('IDESTADO', poIdEstado.AsInteger);
        finally
          oFrmEstadoConsulta.Release;
          FreeAndNil(oDmEstado);
        end;
      end);
      FEstadoLookup.IdCampo := poIdEstado;
      FEstadoLookup.NmCampo := poNmCampo;
  end;
  Result := FEstadoLookUp;
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
  Result := 'IDCIDADE';
end;

function TFrmCidadeCadastro.PegarConsultaEstado(const poDmEstado: TdmEstado): TfrmEstadoConsulta;
begin
  Result := TfrmEstadoConsulta.PegarEstadoConsulta(poDmEstado.sqlConsulta, OnSelecionarEstado);
end;

end.
