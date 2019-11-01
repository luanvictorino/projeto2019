unit uFrmTimeSair;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, uDMPessoa, Data.DB, FireDAC.Comp.Client;

type
  TFrmTimeSair = class(TForm)
    pnTimeSair: TPanel;
    lbDtsaida: TLabel;
    dfDtSaida: TDBEdit;
    btConfirmar: TButton;
    btCancelar: TButton;
    dsTimesHistorico: TDataSource;
    procedure btConfirmarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function ValidarDtSaida: boolean;
    function GetQryTimesHistorico: TFDQuery;
    procedure SetQryTimesHistorico(const Value: TFDQuery);
  protected
    function TestarRegistroValido: boolean;
    procedure CancelarRegistro;
  public
    property qryTimesHistorico: TFDQuery read GetQryTimesHistorico write SetQryTimesHistorico;
  end;

var
  FrmTimeSair: TFrmTimeSair;

implementation

{$R *.dfm}

procedure TFrmTimeSair.FormShow(Sender: TObject);
begin
  if qryTimesHistorico.FieldByName('DTSAIDA').IsNull then
    qryTimesHistorico.Edit;

  qryTimesHistorico.FieldByName('DTSAIDA').AsString := DateToStr(Date);
end;

procedure TFrmTimeSair.btConfirmarClick(Sender: TObject);
begin
  if not TestarRegistroValido then
    Exit;

  Close;
end;

function TFrmTimeSair.TestarRegistroValido: boolean;
begin
  Result := False;

  if ValidarDtSaida then
    Exit;

  Result := True;
end;

function TFrmTimeSair.ValidarDtSaida: boolean;
var
  oField: TField;
begin
  Result := False;

  oField := qryTimesHistorico.FieldByName('dtSaida');
  if not oField.AsString.Trim.IsEmpty then
    Exit;

  ShowMessage('Campo obrigatório não preenchido!');
  oField.FocusControl;

  Result := True;
end;

procedure TFrmTimeSair.btCancelarClick(Sender: TObject);
begin
  CancelarRegistro;
  Close;
end;

procedure TFrmTimeSair.CancelarRegistro;
begin
  QryTimesHistorico.Cancel;
end;

function TFrmTimeSair.GetQryTimesHistorico: TFDQuery;
begin
  Result := dsTimesHistorico.DataSet as TFDQuery;
end;

procedure TFrmTimeSair.SetQryTimesHistorico(const Value: TFDQuery);
begin
  dsTimesHistorico.DataSet := Value;
end;

end.
