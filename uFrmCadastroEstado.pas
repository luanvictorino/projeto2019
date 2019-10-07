unit uFrmCadastroEstado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPadrao, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, uDMEstado, Vcl.Mask,
  Vcl.DBCtrls, uFrmConsultaPais, uDMPais;

type
  TFrmCadastroEstado = class(TFrmCadastroPadrao)
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
    function ValidarNmEstado: boolean;
    procedure OnSelecionarPais(const RegistroAtual: TDataSet);
    function PegarConsultaPais(const poDmPais: TdmPais): TfrmConsultaPais;
  protected
    function TestarRegistroValido: boolean; override;
    function PegarCampoChave: string; override;
  end;

implementation

{$R *.dfm}

uses
  FireDAC.Stan.Param, uConfiguracaoConsulta, uDM;

function TFrmCadastroEstado.PegarCampoChave: string;
begin
  Result := 'IDESTADO'
end;

function TFrmCadastroEstado.ValidarNmEstado: boolean;
var
  oField: TField;
begin
  Result := True;
  oField := QueryCadastro.FieldByName('nmEstado');
  if not oField.AsString.Trim.IsEmpty then
    Exit;

  ShowMessage('Campo obrigatório não preenchido!');
  oField.FocusControl;

  Result := false;
end;

function TFrmCadastroEstado.TestarRegistroValido: boolean;
var
  oField: TField;
begin
  Result := True;
  oField := QueryCadastro.FieldByName('idPais');
  if not oField.AsString.Trim.IsEmpty then
    Exit;

  ShowMessage('Campo obrigatório não preenchido!');
  oField.FocusControl;

  Result := false;

  {if not ValidarNmEstado then
    Exit;

  if dfCdPais.Text = '' then
  begin
    ShowMessage('Campo obrigatório não preenchido!');
    dfCdPais.SetFocus;
    Exit;
  end;

  Result := True;}
end;

procedure TFrmCadastroEstado.btConsultarPaisClick(Sender: TObject);
var
  oFrmPaisConsulta: TfrmConsultaPais;
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

function TFrmCadastroEstado.PegarConsultaPais(const poDmPais: TdmPais): TfrmConsultaPais;
begin
  Result := TfrmConsultaPais.Create(nil);
  Result.QueryConsulta := poDmPais.sqlConsulta;
  Result.OnSelecionarRegistro := OnSelecionarPais;
end;

procedure TFrmCadastroEstado.dsCadastroDataChange(Sender: TObject;
  Field: TField);
var
  oDmPais: TdmPais;
  oFrmPaisConsulta: TfrmConsultaPais;
begin
  inherited;
  if not Assigned(Field) then
    Exit;

  if not(Field.DataSet.State in dsEditModes) then
    Exit;

  if Field.FieldName.ToUpper.Equals('IDPAIS') then
  begin
    if Field.NewValue = Field.OldValue then
      Exit;
    oDmPais := TdmPais.Create(nil);
    oFrmPaisConsulta := PegarConsultaPais(oDmPais);
    try
      oFrmPaisConsulta.SelecionarID('IDPAIS', Field.AsInteger)
    finally
      oFrmPaisConsulta.Release;
      FreeAndNil(oDmPais);
    end;
  end;
end;

procedure TFrmCadastroEstado.OnSelecionarPais(const RegistroAtual: TDataSet);
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

  if oIdPaisOrigem.AsInteger <> oIdPaisDestino.AsInteger then
    oIdPaisDestino.Assign(oIdPaisOrigem);

  if oNmPaisOrigem.AsString <> oNmPaisDestino.AsString then
    oNmPaisDestino.Assign(oNmPaisOrigem);
end;

end.
