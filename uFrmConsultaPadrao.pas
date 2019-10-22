unit uFrmConsultaPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, FireDac.Comp.Client, uConfiguracaoConsulta,
  Data.DB, uFrameConsultaPadrao, FireDac.Stan.Param;

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
    procedure fmeConsultabtConsultarClick(Sender: TObject);
  private
    FModoConsulta: TModoConsulta;
    FOnSelecionarRegistro: TOnSelecionarRegistro;
    procedure SetQueryConsulta(const Value: TFDQuery);
    function GetQueryConsulta: TFDQuery;
    function GetOnSelecionarRegistro: TOnSelecionarRegistro;
    procedure SetOnSelecionarRegistro(const Value: TOnSelecionarRegistro);
    procedure OnSelecionarRegistroInternal(const RegistroSelecionado: TDataSet);
    function TestarPesquisaJaEfetuada(const psCampoPesquisa: string; const pnID: Integer): boolean;
  protected
    function PegarNomeTabelaConsulta: string; virtual;
    function PegarModoConsulta: TModoConsulta;
    procedure SelecionarRegistroInternal; virtual;
    procedure ConfigurarFmeConsulta; virtual; abstract;
    procedure DefinirConfiguracoesConsulta(const ConfiguracaoConsulta: TConfiguracaoConsulta);
  public
    procedure AfterConstruction; override;
    function SelecionarID(const psCampoPesquisa: string; const pnID: Integer): boolean;
    procedure DefinirModo(const ModoConsulta: TModoConsulta);
    property QueryConsulta: TFDQuery read GetQueryConsulta write SetQueryConsulta;
    property OnSelecionarRegistro: TOnSelecionarRegistro read GetOnSelecionarRegistro write SetOnSelecionarRegistro;
  end;

implementation

{$R *.dfm}
{$REGION 'Eventos de tela'}

procedure TFrmConsultaPadrao.AfterConstruction;
begin
  inherited;
  ConfigurarFmeConsulta;
end;

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

{$ENDREGION}

procedure TFrmConsultaPadrao.DefinirConfiguracoesConsulta(const ConfiguracaoConsulta: TConfiguracaoConsulta);
begin
  fmeConsulta.NomeTabela := ConfiguracaoConsulta.NomeTabela;
  fmeConsulta.CampoBusca := ConfiguracaoConsulta.CampoBusca;
  fmeConsulta.CampoChave := ConfiguracaoConsulta.CampoChave;
  fmeConsulta.Caption := ConfiguracaoConsulta.Caption;
  fmeConsulta.OnSelecionarRegistro := OnSelecionarRegistroInternal;
end;

procedure TFrmConsultaPadrao.DefinirModo(const ModoConsulta: TModoConsulta);
begin
  FModoConsulta := ModoConsulta;
  pnlControles.Visible := ModoConsulta = mcForm;
end;

procedure TFrmConsultaPadrao.fmeConsultabtConsultarClick(Sender: TObject);
begin
  fmeConsulta.btConsultarClick(Sender);

end;

function TFrmConsultaPadrao.SelecionarID(const psCampoPesquisa: string; const pnID: Integer): boolean;
const
  SQL_PESQUISA = 'select * from %s where %s = :ID';
var
  sSQL: string;
  sNomeTabela: string;
begin
  sNomeTabela := PegarNomeTabelaConsulta;
  if sNomeTabela.Trim.IsEmpty then
    raise EArgumentException.Create('Não foi possível determinar o nome da tabela para pesquisa.');

  if TestarPesquisaJaEfetuada(psCampoPesquisa, pnID) then
  begin
    Result := True;
    Exit;
  end;

  sSQL := QueryConsulta.SQL.Text;
  Result := False;
  try
    if QueryConsulta.Active then
      QueryConsulta.Close;
    QueryConsulta.SQL.Text := Format(SQL_PESQUISA, [sNomeTabela, psCampoPesquisa]);
    QueryConsulta.Params.ParamByName('ID').AsInteger := pnID;
    QueryConsulta.Open;
    if QueryConsulta.IsEmpty then
      Exit;
    SelecionarRegistroInternal;
    Result := True;
  finally
    QueryConsulta.Close;
    QueryConsulta.SQL.Text := sSQL;
  end;
end;

function TFrmConsultaPadrao.PegarNomeTabelaConsulta: string;
begin
  Result := QueryConsulta.UpdateOptions.UpdateTableName;
  if not Result.Trim.IsEmpty then
    Exit;
  Result := (QueryConsulta as IProviderSupportNG).PSGetTableName;
end;

function TFrmConsultaPadrao.TestarPesquisaJaEfetuada(const psCampoPesquisa: string; const pnID: Integer): boolean;
var
  oCampoPesquisa: TField;
begin
  Result := False;
  if not QueryConsulta.Active then
    Exit;

  oCampoPesquisa := QueryConsulta.FindField(psCampoPesquisa);

  if not Assigned(oCampoPesquisa) then
    Exit;

  Result := oCampoPesquisa.AsInteger = pnID;
end;

procedure TFrmConsultaPadrao.SelecionarRegistroInternal;
begin
  fmeConsulta.SelecionarRegistro;

end;

function TFrmConsultaPadrao.GetOnSelecionarRegistro: TOnSelecionarRegistro;
begin
  Result := FOnSelecionarRegistro;
end;

function TFrmConsultaPadrao.GetQueryConsulta: TFDQuery;
begin
  Result := fmeConsulta.QueryConsulta;
end;

procedure TFrmConsultaPadrao.OnSelecionarRegistroInternal(const RegistroSelecionado: TDataSet);
begin
  if Assigned(FOnSelecionarRegistro) then
    FOnSelecionarRegistro(RegistroSelecionado);
  if PegarModoConsulta = mcForm then
    ModalResult := mrOk;
end;

function TFrmConsultaPadrao.PegarModoConsulta: TModoConsulta;
begin
  Result := FModoConsulta;
end;

procedure TFrmConsultaPadrao.SetOnSelecionarRegistro(const Value: TOnSelecionarRegistro);
begin
  FOnSelecionarRegistro := Value;
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
