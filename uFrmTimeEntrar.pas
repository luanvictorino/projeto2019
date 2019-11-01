unit uFrmTimeEntrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, Data.DB, uFrmTimeConsulta, uDMTimes,
  FireDAC.Comp.Client;

type
  TFrmTimeEntrar = class(TForm)
    pnTimeEntrar: TPanel;
    dfNmTime: TDBEdit;
    dfDtEntrada: TDBEdit;
    blDtEntrada: TLabel;
    lbNmTime: TLabel;
    btConsultarTime: TSpeedButton;
    btConfirmar: TButton;
    btCancelar: TButton;
    dsTimesHistorico: TDataSource;
    procedure btConsultarTimeClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function ValidarNmTime: boolean;
    function ValidarDtEntrada: boolean;
    function PegarConsultaTimes(const poDmTimes: TdmTimes): TfrmTimeConsulta;
    function GetQryTimesHistorico: TFDQuery;
    procedure OnSelecionarTimes(const RegistroAtual: TDataSet);
    procedure SetQryTimesHistorico(const Value: TFDQuery);
  protected
    procedure CancelarRegistro;
    function TestarRegistroValido: boolean;
  public
    property qryTimesHistorico: TFDQuery read GetQryTimesHistorico write SetQryTimesHistorico;
  end;

implementation

{$R *.dfm}

procedure TFrmTimeEntrar.FormShow(Sender: TObject);
begin
  if qryTimesHistorico.FieldByName('DTSAIDA').IsNull then
    qryTimesHistorico.Edit
  else
    qryTimesHistorico.Insert;

  qryTimesHistorico.FieldByName('DTENTRADA').AsString := DateToStr(Date);
end;

procedure TFrmTimeEntrar.btConfirmarClick(Sender: TObject);
begin
   if not TestarRegistroValido then
    Exit;

  Close;
end;

function TFrmTimeEntrar.TestarRegistroValido: boolean;
begin
  Result := False;

  if ValidarNmTime then
    Exit;

  if ValidarDtEntrada then
    Exit;

  Result := True;
end;

function TFrmTimeEntrar.ValidarDtEntrada: boolean;
var
  oField: TField;
begin
  Result := False;
  oField:= qryTimesHistorico.FieldByName('dtEntrada');
  if not oField.AsString.Trim.IsEmpty then
    Exit;

  ShowMessage('Campo obrigatório não preenchido!');
  oField.FocusControl;

  Result := True;
end;

function TFrmTimeEntrar.ValidarNmTime: boolean;
var
  oField: TField;
begin
  Result := False;
  oField := qryTimesHistorico.FieldByName('nmTimes');
  if not oField.AsString.Trim.IsEmpty then
    Exit;

  ShowMessage('Campo obrigatório não preenchido!');
  oField.FocusControl;

  Result := True;
end;

procedure TFrmTimeEntrar.btConsultarTimeClick(Sender: TObject);
var
  oFrmTimesConsulta: TfrmTimeConsulta;
  oDmTimes: TdmTimes;
begin
  oDmTimes := TdmTimes.Create(nil);
  oFrmTimesConsulta := PegarConsultaTimes(oDmTimes);
  try
    oFrmTimesConsulta.ShowModal;
  finally
    oFrmTimesConsulta.Release;
    FreeAndNil(oDmTimes);
  end;
end;

procedure TFrmTimeEntrar.btCancelarClick(Sender: TObject);
begin
  CancelarRegistro;
  Close;
end;

procedure TFrmTimeEntrar.CancelarRegistro;
begin
  QryTimesHistorico.Cancel;
end;

procedure TFrmTimeEntrar.OnSelecionarTimes(const RegistroAtual: TDataSet);
var
  oIdTimesOrigem: TField;
  oNmTimesOrigem: TField;
  oIdTimesDestino: TField;
  oNmTimesDestino: TField;
begin
  qryTimesHistorico.Edit;

  oIdTimesOrigem := RegistroAtual.FieldByName('idTimes');
  oNmTimesOrigem := RegistroAtual.FieldByName('nmTimes');
  oIdTimesDestino := QryTimesHistorico.FieldByName('idTimes');
  oNmTimesDestino := QryTimesHistorico.FieldByName('nmTimes');
  QryTimesHistorico.DisableControls;
  try
    if oIdTimesOrigem.AsInteger <> oIdTimesDestino.AsInteger then
      oIdTimesDestino.Assign(oIdTimesOrigem);

    if oNmTimesOrigem.AsString <> oNmTimesDestino.AsString then
      oNmTimesDestino.Assign(oNmTimesOrigem);
  finally
    QryTimesHistorico.EnableControls;
  end;
end;

function TFrmTimeEntrar.PegarConsultaTimes(
  const poDmTimes: TdmTimes): TfrmTimeConsulta;
begin
  Result := TfrmTimeConsulta.Create(nil);
  Result.QueryConsulta := poDmTimes.sqlConsulta;
  Result.OnSelecionarRegistro := OnSelecionarTimes;
end;

procedure TFrmTimeEntrar.SetQryTimesHistorico(const Value: TFDQuery);
begin
  dsTimesHistorico.DataSet := Value;
end;

function TFrmTimeEntrar.GetQryTimesHistorico: TFDQuery;
begin
  Result := dsTimesHistorico.DataSet as TFDQuery;
end;

end.
