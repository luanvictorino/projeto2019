unit uFrmConsultaPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, FireDac.Comp.Client, uConfiguracaoConsulta,
  Data.DB, uFrameConsultaPadrao;

type
  TModoConsulta = (mcForm, mcFrame);

  TFrmConsultaPadrao = class abstract(TForm)
    fmeConsulta: TFrameConsultaPadrao;
    pnlControles: TPanel;
    btnSelecionar: TButton;
    btnFechar: TButton;
    actConsultaPadrao: TActionList;
    actConsultar: TAction;
    actSelecionar: TAction;
    actFechar: TAction;
    procedure actConsultarExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actSelecionarExecute(Sender: TObject);
  private
    procedure SetQueryConsulta(const Value: TFDQuery);
    function GetQueryConsulta: TFDQuery;
    function GetOnSelecionarRegistro: TOnSelecionarRegistro;
    procedure SetOnSelecionarRegistro(const Value: TOnSelecionarRegistro);
  protected
    procedure SelecionarRegistroInternal; virtual;
    procedure ConfigurarFmeConsulta; virtual; abstract;
    procedure DefinirConfiguracoesConsulta(const ConfiguracaoConsulta: TConfiguracaoConsulta);
  public
    procedure AfterConstruction; override;
    procedure DefinirModo(const ModoConsulta: TModoConsulta);
    property QueryConsulta: TFDQuery read GetQueryConsulta write SetQueryConsulta;
    property OnSelecionarRegistro: TOnSelecionarRegistro read GetOnSelecionarRegistro write SetOnSelecionarRegistro;
  end;

var
  FrmConsultaPadrao: TFrmConsultaPadrao;

implementation

{$R *.dfm}

procedure TFrmConsultaPadrao.actConsultarExecute(Sender: TObject);
begin
  fmeConsulta.ExecutarConsulta();
end;

procedure TFrmConsultaPadrao.actFecharExecute(Sender: TObject);
begin
  ModalResult := mrNone;
  Close;
end;

procedure TFrmConsultaPadrao.actSelecionarExecute(Sender: TObject);
begin
  fmeConsulta.SelecionarRegistro;
  ModalResult := mrOk;
end;

procedure TFrmConsultaPadrao.AfterConstruction;
begin
  inherited;
  ConfigurarFmeConsulta;
end;

procedure TFrmConsultaPadrao.DefinirConfiguracoesConsulta(const ConfiguracaoConsulta: TConfiguracaoConsulta);
begin
  fmeConsulta.NomeTabela := ConfiguracaoConsulta.NomeTabela;
  fmeConsulta.CampoBusca := ConfiguracaoConsulta.CampoBusca;
  fmeConsulta.CampoChave := ConfiguracaoConsulta.CampoChave;
  fmeConsulta.Caption := ConfiguracaoConsulta.Caption;
  fmeConsulta.OnSelecionarRegistro := OnSelecionarRegistro;
end;

procedure TFrmConsultaPadrao.DefinirModo(const ModoConsulta: TModoConsulta);
begin
  pnlControles.Visible := ModoConsulta = mcForm;
end;

procedure TFrmConsultaPadrao.SelecionarRegistroInternal;
begin
  if not Assigned(OnSelecionarRegistro) then
    Exit;

  OnSelecionarRegistro(QueryConsulta);
end;

function TFrmConsultaPadrao.GetOnSelecionarRegistro: TOnSelecionarRegistro;
begin
  Result := fmeConsulta.OnSelecionarRegistro;
end;

function TFrmConsultaPadrao.GetQueryConsulta: TFDQuery;
begin
  Result := fmeConsulta.QueryConsulta;
end;

procedure TFrmConsultaPadrao.SetOnSelecionarRegistro(const Value: TOnSelecionarRegistro);
begin
  fmeConsulta.OnSelecionarRegistro := Value;
end;

procedure TFrmConsultaPadrao.SetQueryConsulta(const Value: TFDQuery);
begin
  if fmeConsulta.QueryConsulta = Value then
    Exit;

  fmeConsulta.QueryConsulta := Value;
  Value.Close;
  Value.Params.ClearValues();
  Value.Open();
end;

end.
