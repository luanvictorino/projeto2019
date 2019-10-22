unit uFrmTimeEntrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, Data.DB, uDMPessoa, uFrmTimeConsulta, uDMTimes,
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
  private
    procedure SetQueryCadastro(const Value: TFDQuery);
    function PegarConsultaTimes(const poDmTimes: TdmTimes): TfrmTimeConsulta;
    function GetQryTimesHistorico: TFDQuery;
    procedure OnSelecionarTimes(const RegistroAtual: TDataSet);
    procedure SetQryTimesHistorico(const Value: TFDQuery);
  protected
    procedure CancelarRegistro;
  public
    property qryTimesHistorico: TFDQuery read GetQryTimesHistorico write SetQryTimesHistorico;
  end;

implementation

{$R *.dfm}

procedure TFrmTimeEntrar.btCancelarClick(Sender: TObject);
begin
  CancelarRegistro;
end;

procedure TFrmTimeEntrar.btConfirmarClick(Sender: TObject);
begin
  qryTimesHistorico.FieldByName('idPessoa').AsInteger := 14;
  qryTimesHistorico.Post;
  qryTimesHistorico.CommitUpdates;
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

procedure TFrmTimeEntrar.CancelarRegistro;
begin
  QryTimesHistorico.Cancel;
end;

function TFrmTimeEntrar.GetQryTimesHistorico: TFDQuery;
begin
  Result := dsTimesHistorico.DataSet as TFDQuery;
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

procedure TFrmTimeEntrar.SetQueryCadastro(const Value: TFDQuery);
begin

end;

end.
