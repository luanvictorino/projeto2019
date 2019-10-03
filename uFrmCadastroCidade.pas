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
    procedure dfCdEstadoEnter(Sender: TObject);
    procedure dfCdEstadoExit(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
  private
    FValue: Variant;
    function ValidarNmCidade: boolean;
    procedure MontarConsultaEstado;
    function LimparCampoEstado : boolean;
    procedure VerificaTabelaVazia;
    procedure PassarNomeEstado;
    procedure MostrarNomeEstado;
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

procedure TFrmCadastroCidade.dfCdEstadoEnter(Sender: TObject);
begin
  if (Sender is TDBEdit) then
    Self.FValue := TDBEdit(Sender).Text;
end;

procedure TFrmCadastroCidade.dfCdEstadoExit(Sender: TObject);
var
  bValorCampoIgual : boolean;
begin
  inherited;
  bValorCampoIgual := Self.FValue = TDBEdit(Sender).Text;
  if bValorCampoIgual then
    Exit;

  MostrarNomeEstado;
end;

procedure TFrmCadastroCidade.MostrarNomeEstado;
begin
  if not LimparCampoEstado then
    Exit;

  MontarConsultaEstado;
  VerificaTabelaVazia;
  PassarNomeEstado;
end;

function TFrmCadastroCidade.LimparCampoEstado : boolean;
begin
  Result := False;

  if dfCdEstado.Text = EmptyStr then
  begin
    dfNmEstado.Clear;
    Exit;
  end;
  Result := True;
end;

procedure TFrmCadastroCidade.MontarConsultaEstado;
var
  sCampoCdEstado: string;
begin
  sCampoCdEstado := dfCdEstado.Text;

  DM.qyBusca.Close;
  DM.qyBusca.SQL.Clear;
  DM.qyBusca.SQL.Add('SELECT * FROM ESTADO');
  DM.qyBusca.SQL.Add('WHERE IDESTADO = :IDESTADO');
  DM.qyBusca.ParamByName('IDESTADO').AsString := sCampoCdEstado;
  DM.qyBusca.Open;
end;

procedure TFrmCadastroCidade.VerificaTabelaVazia;
begin
  if DM.qyBusca.IsEmpty then
  begin
    ShowMessage('Estado não escontrado!');
    dfNmEstado.Clear;
    dfNmEstado.SetFocus;
  end;
end;

procedure TFrmCadastroCidade.PassarNomeEstado;
var
  sCampo : String;
begin
  sCampo := DM.qyBusca.FieldByName('NMESTADO').AsString;
  dfNmEstado.Text := sCampo;
end;

function TFrmCadastroCidade.PegarCampoChave: string;
begin
  Result := 'IDCIDADE'
end;

end.
