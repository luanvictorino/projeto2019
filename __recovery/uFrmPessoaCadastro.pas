unit uFrmPessoaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, uDMPessoa, Vcl.Mask,
  Vcl.DBCtrls, uFrmCidadeConsulta, uDMCidade, FireDac.Comp.Client,
  uFrmFuncaoConsulta, uDMFuncao, Vcl.Grids, Vcl.DBGrids, uFrmTimeEntrar,
  uFrmTimeSair;

type
  TFrmPessoaCadastro = class(TFrmCadastroPadrao)
    pgCadastro: TPageControl;
    tsCadastroPessoa: TTabSheet;
    tsCadastroFuncionario: TTabSheet;
    lbCdPessoa: TLabel;
    dfCdPessoa: TDBEdit;
    lbNmPessoa: TLabel;
    dfNmPessoa: TDBEdit;
    lbNuTelefone: TLabel;
    dfNuTelefone: TDBEdit;
    lnNuCelular: TLabel;
    dfNuCelular: TDBEdit;
    dfDeEmail: TDBEdit;
    lbDeEmail: TLabel;
    dfCdCidade: TDBEdit;
    lb: TLabel;
    lbNmCidade: TLabel;
    dfNmCidade: TDBEdit;
    btConsultarCidade: TSpeedButton;
    dsFuncionario: TDataSource;
    lbCdFuncao: TLabel;
    dfCdFuncao: TDBEdit;
    lbDtAdmissao: TLabel;
    dfDtAdmissao: TDBEdit;
    lbDtDemissao: TLabel;
    dfDtDemissao: TDBEdit;
    dfNmFuncao: TDBEdit;
    btConsultarFuncao: TSpeedButton;
    lbNmFuncao: TLabel;
    lbDtNascimento: TLabel;
    dfDtNascimento: TDBEdit;
    gbTime: TGroupBox;
    lbTimeAtual: TLabel;
    dfNmTime: TDBEdit;
    btEntrarTime: TButton;
    btSairTime: TButton;
    grTimesHistorico: TDBGrid;
    dsTimesHistorico: TDataSource;
    procedure btConsultarCidadeClick(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure btConsultarFuncaoClick(Sender: TObject);
    procedure dsFuncionarioDataChange(Sender: TObject; Field: TField);
    procedure btEntrarTimeClick(Sender: TObject);
    procedure btSairTimeClick(Sender: TObject);
  private
    function ValidarNmPessoa: boolean;
    function ValidarIdCidade: boolean;
    procedure OnSelecionarCidade(const RegistroAtual: TDataSet);
    procedure OnSelecionarFuncao(const RegistroAtual: TDataSet);
    function PegarConsultaCidade(const poDmCidade: TdmCidade): TfrmCidadeConsulta;
    function PegarConsultaFuncao(const poDmFuncao: TdmFuncao): TfrmFuncaoConsulta;
    function GetQryFuncionario: TFDQuery;
    function GetQryTimesHistorico: TFDQuery;
    procedure SetQryFuncionario(const Value: TFDQuery);
    procedure SetQryTimesHistorico(const Value: TFDQuery);
    procedure LookupCidade(const poIdCidade, poNmCidade: TField);
    procedure LookupFuncao(const poIdFuncao, poNmFuncao: TField);
  protected
    function TestarRegistroValido: boolean; override;
    function PegarCampoChave: string; override;
    procedure SalvarQryDetalhes; override;
  public
    property qryFuncionario: TFDQuery read GetQryFuncionario write SetQryFuncionario;
    property qryTimesHistorico: TFDQuery read GetQryTimesHistorico write SetQryTimesHistorico;
  end;

implementation

{$R *.dfm}

procedure TFrmPessoaCadastro.btConsultarCidadeClick(Sender: TObject);
var
  oFrmCidadeConsulta: TfrmCidadeConsulta;
  oDmCidade: TdmCidade;
begin
  oDmCidade := TdmCidade.Create(nil);
  oFrmCidadeConsulta := PegarConsultaCidade(oDmCidade);
  try
    oFrmCidadeConsulta.ShowModal;
  finally
    oFrmCidadeConsulta.Release;
    FreeAndNil(oDmCidade);
  end;
end;

procedure TFrmPessoaCadastro.dsCadastroDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if not Assigned(Field) then
    Exit;

  if not(Field.DataSet.State in dsEditModes) then
    Exit;

  if Field.FieldName.ToUpper.Equals('IDCIDADE') then
    LookupCidade(Field, QueryCadastro.FindField('nmCidade'));
end;

procedure TFrmPessoaCadastro.dsFuncionarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  if not Assigned(Field) then
    Exit;

  if not(Field.DataSet.State in dsEditModes) then
    Exit;

  if Field.FieldName.ToUpper.Equals('IDFUNCAO') then
    LookupFuncao(Field, QueryCadastro.FindField('nmFuncao'));
end;

function TFrmPessoaCadastro.GetQryFuncionario: TFDQuery;
begin
  Result := dsFuncionario.DataSet as TFDQuery;
end;

function TFrmPessoaCadastro.GetQryTimesHistorico: TFDQuery;
begin
  Result := dsTimesHistorico.DataSet as TFDQuery;
end;

procedure TFrmPessoaCadastro.LookupCidade(const poIdCidade, poNmCidade: TField);
var
  oDmCidade: TDmCidade;
  oFrmCidadeConsulta: TFrmCidadeConsulta;
  bRegistroSelecionado: boolean;
begin
  if not (poIdCidade.DataSet.State in dsEditModes) then
    Exit;

  if poIdCidade.IsNull then
  begin
    poNmCidade.Clear;
    Exit;
  end;

  if poIdCidade.NewValue = poIdCidade.OldValue then
    Exit;

  oDmCidade := TDmCidade.Create(nil);
  oFrmCidadeConsulta := PegarConsultaCidade(oDmCidade);
  try
    bRegistroSelecionado := oFrmCidadeConsulta.SelecionarID('IDCIDADE', poIdCidade.AsInteger);
    if bRegistroSelecionado then
      Exit;
    poIdCidade.Clear;
    poNmCidade.Clear;
  finally
    oFrmCidadeConsulta.Release;
    FreeAndNil(oDmCidade);
  end;
end;

procedure TFrmPessoaCadastro.LookupFuncao(const poIdFuncao, poNmFuncao: TField);
var
  oDmFuncao: TDmFuncao;
  oFrmFuncaoConsulta: TFrmFuncaoConsulta;
  bRegistroSelecionado: boolean;
begin
  if not (poIdFuncao.DataSet.State in dsEditModes) then
    Exit;

  if poIdFuncao.IsNull then
  begin
    poNmFuncao.Clear;
    Exit;
  end;

  if poIdFuncao.NewValue = poIdFuncao.OldValue then
    Exit;

  oDmFuncao := TDmFuncao.Create(nil);
  oFrmFuncaoConsulta := PegarConsultaFuncao(oDmFuncao);
  try
    bRegistroSelecionado := oFrmFuncaoConsulta.SelecionarID('IDFUNCAO', poIdFuncao.AsInteger);
    if bRegistroSelecionado then
      Exit;

    poIdFuncao.Clear;
    poNmFuncao.Clear;
  finally
    oFrmFuncaoConsulta.Release;
    FreeAndNil(oDmFuncao);
  end;
end;

function TFrmPessoaCadastro.PegarCampoChave: string;
begin
  Result := 'IDPESSOA'
end;

function TFrmPessoaCadastro.PegarConsultaCidade(const poDmCidade: TdmCidade): TfrmCidadeConsulta;
begin
  Result := TfrmCidadeConsulta.Create(nil);
  Result.QueryConsulta := poDmCidade.sqlConsulta;
  Result.OnSelecionarRegistro := OnSelecionarCidade;
end;

procedure TFrmPessoaCadastro.OnSelecionarCidade(const RegistroAtual: TDataSet);
var
  oIdCidadeOrigem: TField;
  oNmCidadeOrigem: TField;
  oIdCidadeDestino: TField;
  oNmCidadeDestino: TField;
begin
  QueryCadastro.Edit;

  oIdCidadeOrigem := RegistroAtual.FieldByName('idCidade');
  oNmCidadeOrigem := RegistroAtual.FieldByName('nmCidade');
  oIdCidadeDestino := QueryCadastro.FieldByName('idCidade');
  oNmCidadeDestino := QueryCadastro.FieldByName('nmCidade');
  QueryCadastro.DisableControls;
  try
    if oIdCidadeOrigem.AsInteger <> oIdCidadeDestino.AsInteger then
      oIdCidadeDestino.Assign(oIdCidadeOrigem);

    if oNmCidadeOrigem.AsString <> oNmCidadeDestino.AsString then
      oNmCidadeDestino.Assign(oNmCidadeOrigem);
  finally
    QueryCadastro.EnableControls;
  end;
end;

function TFrmPessoaCadastro.PegarConsultaFuncao(
  const poDmFuncao: TdmFuncao): TfrmFuncaoConsulta;
begin
  Result := TfrmFuncaoConsulta.Create(nil);
  Result.QueryConsulta := poDmFuncao.sqlConsulta;
  Result.OnSelecionarRegistro := OnSelecionarFuncao;
end;

procedure TFrmPessoaCadastro.OnSelecionarFuncao(const RegistroAtual: TDataSet);
var
  oIdFuncaoOrigem: TField;
  oNmFuncaoOrigem: TField;
  oIdFuncaoDestino: TField;
  oNmFuncaoDestino: TField;
begin
  qryFuncionario.Edit;

  oIdFuncaoOrigem := RegistroAtual.FieldByName('idFuncao');
  oNmFuncaoOrigem := RegistroAtual.FieldByName('nmFuncao');
  oIdFuncaoDestino := qryFuncionario.FieldByName('idFuncao');
  oNmFuncaoDestino := qryFuncionario.FieldByName('nmFuncao');
  qryFuncionario.DisableControls;
  try
    if oIdFuncaoOrigem.AsInteger <> oIdFuncaoDestino.AsInteger then
      oIdFuncaoDestino.Assign(oIdFuncaoOrigem);

    if oNmFuncaoOrigem.AsString <> oNmFuncaoDestino.AsString then
      oNmFuncaoDestino.Assign(oNmFuncaoOrigem);
  finally
    qryFuncionario.EnableControls;
  end;
end;

procedure TFrmPessoaCadastro.SalvarQryDetalhes;
begin
  inherited;
  if qryFuncionario.State in dsEditModes then
    qryFuncionario.Post;
end;

procedure TFrmPessoaCadastro.SetQryFuncionario(const Value: TFDQuery);
begin
  dsFuncionario.DataSet := Value;
end;

procedure TFrmPessoaCadastro.SetQryTimesHistorico(const Value: TFDQuery);
begin
  dsTimesHistorico.DataSet := Value;
end;

procedure TFrmPessoaCadastro.btConsultarFuncaoClick(Sender: TObject);
var
  oFrmFuncaoConsulta: TfrmFuncaoConsulta;
  oDmFuncao: TdmFuncao;
begin
  oDmFuncao := TdmFuncao.Create(nil);
  oFrmFuncaoConsulta := PegarConsultaFuncao(oDmFuncao);
  try
    oFrmFuncaoConsulta.ShowModal;
  finally
    oFrmFuncaoConsulta.Release;
    FreeAndNil(oDmFuncao);
  end;
end;

procedure TFrmPessoaCadastro.btEntrarTimeClick(Sender: TObject);
var
  oFrmTimeEntrar: TFrmTimeEntrar;
  oDmPessoa: TDmPessoa;
begin
  inherited;
  oFrmTimeEntrar := TFrmTimeEntrar.Create(nil);
  oDmPessoa := TdmPessoa.Create(nil);

  if oDmPessoa.sqltimesHistorico.Active = False then
    oDmPessoa.sqlTimesHistorico.Active := True;

  try
    oFrmTimeEntrar.ShowModal;
    oFrmTimeEntrar.QryTimesHistorico := oDmPessoa.sqlTimesHistorico;
  finally
    oFrmTimeEntrar.Release;
    FreeAndNil(oDmPessoa);
  end;
end;

procedure TFrmPessoaCadastro.btSairTimeClick(Sender: TObject);
var
  oFrmTimeSair: TFrmTimeSair;
begin
  inherited;
  oFrmTimeSair := TFrmTimeSair.Create(nil);
  try
    oFrmTimeSair.ShowModal;
  finally
    oFrmTimeSair.Release;
  end;
end;

function TFrmPessoaCadastro.TestarRegistroValido: boolean;
begin
  Result := False;

  if ValidarNmPessoa then
    Exit;

  if ValidarIdCidade then
    Exit;

  Result := True;
end;

function TFrmPessoaCadastro.ValidarNmPessoa: boolean;
var
  oField: TField;
begin
  Result := False;
  oField := QueryCadastro.FieldByName('nmPessoa');
  if not oField.AsString.Trim.IsEmpty then
    Exit;

  ShowMessage('Campo obrigatório não preenchido!');
  oField.FocusControl;

  Result := True;
end;

function TFrmPessoaCadastro.ValidarIdCidade: boolean;
var
  oField: TField;
begin
  Result := False;
  oField := QueryCadastro.FieldByName('idCidade');
  if not oField.AsString.Trim.IsEmpty then
    Exit;

  ShowMessage('Campo obrigatório não preenchido!');
  oField.FocusControl;

  Result := True;
end;

end.
