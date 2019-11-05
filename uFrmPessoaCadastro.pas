unit uFrmPessoaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask,
  Vcl.DBCtrls, uFrmCidadeConsulta, uDMCidade, FireDac.Comp.Client,
  uFrmFuncaoConsulta, uDMFuncao, Vcl.Grids, Vcl.DBGrids, uFrmTimeEntrar,
  uFrmTimeSair, Datasnap.DBClient, FireDac.Stan.Intf, FireDac.Stan.Option,
  FireDac.Stan.Param, FireDac.Stan.Error, FireDac.DatS, FireDac.Phys.Intf,
  FireDac.DApt.Intf, FireDac.Stan.Async, FireDac.DApt, FireDac.Comp.DataSet;

type
  TLigarBotoes = reference to procedure(const poCampo: TField);

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
    btEntrarTime: TButton;
    btSairTime: TButton;
    grTimesHistorico: TDBGrid;
    dsTimesHistorico: TDataSource;
    ClientDataSet1: TClientDataSet;
    procedure btConsultarCidadeClick(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure btConsultarFuncaoClick(Sender: TObject);
    procedure dsFuncionarioDataChange(Sender: TObject; Field: TField);
    procedure btEntrarTimeClick(Sender: TObject);
    procedure btSairTimeClick(Sender: TObject);
    procedure dsCadastroStateChange(Sender: TObject);
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
    function TestarPodeHabilitarEntradaTime: boolean;
    function TestarPodeHabilitarSaidaTime: boolean;
    procedure ControlarBotoesEntradaSaidaTime;
  protected
    function TestarRegistroValido: boolean; override;
    function PegarCampoChave: string; override;
    procedure SalvarQryDetalhes; override;
    function TestarFuncionarTemTime: boolean;
    procedure ChamarConsultaCidade;
  public
    property qryFuncionario: TFDQuery read GetQryFuncionario write SetQryFuncionario;
    property qryTimesHistorico: TFDQuery read GetQryTimesHistorico write SetQryTimesHistorico;
  end;

implementation

{$R *.dfm}

procedure TFrmPessoaCadastro.btConsultarCidadeClick(Sender: TObject);
begin
  ChamarConsultaCidade;
end;

procedure TFrmPessoaCadastro.ChamarConsultaCidade;
var
  oFrmCidadeConsulta: TfrmCidadeConsulta;
  oDmCidade: TdmCidade;
begin
  oDmCidade := TdmCidade.Create(self);
  oFrmCidadeConsulta := PegarConsultaCidade(oDmCidade);
  try
    oFrmCidadeConsulta.ShowModal;
  finally
    oFrmCidadeConsulta.Release;
    FreeAndNil(oDmCidade);
  end;
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

procedure TFrmPessoaCadastro.btConsultarFuncaoClick(Sender: TObject);
var
  oFrmFuncaoConsulta: TfrmFuncaoConsulta;
  oDmFuncao: TdmFuncao;
begin
  oDmFuncao := TdmFuncao.Create(self);
  oFrmFuncaoConsulta := PegarConsultaFuncao(oDmFuncao);
  try
    oFrmFuncaoConsulta.ShowModal;
  finally
    oFrmFuncaoConsulta.Release;
    FreeAndNil(oDmFuncao);
  end;
end;

function TFrmPessoaCadastro.PegarConsultaFuncao(const poDmFuncao: TdmFuncao): TfrmFuncaoConsulta;
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

procedure TFrmPessoaCadastro.dsFuncionarioDataChange(Sender: TObject; Field: TField);
var
  sNomeCampo: string;
begin
  inherited;
  if not Assigned(Field) then
   Exit;

  sNomeCampo := Field.FieldName.ToUpper;

  if sNomeCampo.Equals('DTADMISSAO') or sNomeCampo.Equals('DTDEMISSAO') then
    ControlarBotoesEntradaSaidaTime;

  if not(Field.DataSet.State in dsEditModes) then
    Exit;

  if sNomeCampo.Equals('IDFUNCAO') then
    LookupFuncao(Field, QueryCadastro.FindField('nmFuncao'));
end;

procedure TFrmPessoaCadastro.LookupFuncao(const poIdFuncao, poNmFuncao: TField);
var
  oDmFuncao: TdmFuncao;
  oFrmFuncaoConsulta: TfrmFuncaoConsulta;
  bRegistroSelecionado: boolean;
begin
  if not(poIdFuncao.DataSet.State in dsEditModes) then
    Exit;

  if poIdFuncao.IsNull then
  begin
    poNmFuncao.Clear;
    Exit;
  end;

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

procedure TFrmPessoaCadastro.dsCadastroDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if not Assigned(Field) then
    Exit;

  if not(Field.DataSet.State in dsEditModes) then
    Exit;

  if Field.FieldName.ToUpper.Equals('IDCIDADE') then
    LookupCidade(Field, QueryCadastro.FindField('NMCIDADE'));
end;

procedure TFrmPessoaCadastro.dsCadastroStateChange(Sender: TObject);
begin
  inherited;
  ControlarBotoesEntradaSaidaTime;
end;

procedure TFrmPessoaCadastro.LookupCidade(const poIdCidade, poNmCidade: TField);
var
  oDmCidade: TdmCidade;
  oFrmCidadeConsulta: TfrmCidadeConsulta;
  bRegistroSelecionado: boolean;
begin
  if not(poIdCidade.DataSet.State in dsEditModes) then
    Exit;

  if poIdCidade.IsNull then
  begin
    poNmCidade.Clear;
    Exit;
  end;

  oDmCidade := TdmCidade.Create(nil);
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

procedure TFrmPessoaCadastro.btEntrarTimeClick(Sender: TObject);
var
  oFrmTimeEntrar: TFrmTimeEntrar;
begin
  inherited;
  oFrmTimeEntrar := TFrmTimeEntrar.Create(self);
  try
    oFrmTimeEntrar.ShowModal;

    qryTimesHistorico.Params.ClearValues;
    if not qryTimesHistorico.Active then
      qryTimesHistorico.Open;
  finally
    oFrmTimeEntrar.Release;
  end;
end;

procedure TFrmPessoaCadastro.btSairTimeClick(Sender: TObject);
var
  oFrmTimeSair: TFrmTimeSair;
begin
  inherited;
  oFrmTimeSair := TFrmTimeSair.Create(self);
  try
    oFrmTimeSair.ShowModal;

    qryTimesHistorico.Params.ClearValues;
    if not qryTimesHistorico.Active then
      qryTimesHistorico.Open;
  finally
    oFrmTimeSair.Release;
  end;
end;

procedure TFrmPessoaCadastro.ControlarBotoesEntradaSaidaTime;
var
  bFuncionarioNuncaFoiGravadoNoBanco: boolean;
begin
  btEntrarTime.Enabled := False;
  btSairTime.Enabled := False;

  if not qryFuncionario.Active then
    Exit;

  if qryFuncionario.IsEmpty then
    Exit;

  if not(qryFuncionario.FieldByName('dtDemissao').IsNull) then
    Exit;

  bFuncionarioNuncaFoiGravadoNoBanco := qryFuncionario.UpdateStatus = usInserted;
  if bFuncionarioNuncaFoiGravadoNoBanco then
    Exit;

  btEntrarTime.Enabled := TestarPodeHabilitarEntradaTime;
  btSairTime.Enabled := TestarPodeHabilitarSaidaTime;
end;

function TFrmPessoaCadastro.TestarPodeHabilitarEntradaTime: boolean;
var
  bFuncionarioTemTime: boolean;
  bFuncionarioAdmitido: boolean;
begin
  Result := False;

  bFuncionarioAdmitido := (not qryTimesHistorico.IsEmpty) or (not qryFuncionario.FieldByName('dtAdmissao').IsNull);

  if not bFuncionarioAdmitido then
    Exit;

  bFuncionarioTemTime := TestarFuncionarTemTime;
  if bFuncionarioTemTime then
    Exit;

  Result := True;
end;

function TFrmPessoaCadastro.TestarFuncionarTemTime: boolean;
const
  sIDX_DTSAIDA = 'IDX_DTSAIDA';
var
  oTimesHistorico: TFDMemTable;
  nIdPessoa: integer;
begin
  Result := False;

  if not qryTimesHistorico.Active then
    Exit;

  nIdPessoa := qryTimesHistorico.FieldByName('idPessoa').AsInteger;

  oTimesHistorico := TFDMemTable.Create(Nil);
  try
    oTimesHistorico.CloneCursor(qryTimesHistorico);
    Result := oTimesHistorico.FindKey([nIdPessoa, Null]);
  finally
    FreeAndNil(oTimesHistorico);
  end;
end;

function TFrmPessoaCadastro.TestarPodeHabilitarSaidaTime: boolean;
begin
  Result := TestarFuncionarTemTime;
end;

function TFrmPessoaCadastro.GetQryFuncionario: TFDQuery;
begin
  Result := dsFuncionario.DataSet as TFDQuery;
end;

function TFrmPessoaCadastro.GetQryTimesHistorico: TFDQuery;
begin
  Result := dsTimesHistorico.DataSet as TFDQuery;
end;

function TFrmPessoaCadastro.PegarCampoChave: string;
begin
  Result := 'IDPESSOA';
end;

procedure TFrmPessoaCadastro.SalvarQryDetalhes;
begin
  inherited;
  if qryFuncionario.State in dsEditModes then
    qryFuncionario.Post;

  if qryTimesHistorico.State in dsEditModes then
    qryTimesHistorico.Post;
end;

procedure TFrmPessoaCadastro.SetQryFuncionario(const Value: TFDQuery);
begin
  dsFuncionario.DataSet := Value;
end;

procedure TFrmPessoaCadastro.SetQryTimesHistorico(const Value: TFDQuery);
begin
  if dsTimesHistorico.DataSet = Value then
    Exit;

  dsTimesHistorico.DataSet := Value;
end;

end.
