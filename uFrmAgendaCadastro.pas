unit uFrmAgendaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, uDMAgenda, uDMPessoa,
  uFrmPessoaConsulta, Vcl.Mask, Vcl.DBCtrls;

type
  TFrmAgendaCadastro = class(TFrmCadastroPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    SpeedButton1: TSpeedButton;
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dsCadastroStateChange(Sender: TObject);
  private
    function ValidarNmDescricao: boolean;
    function ValidarDtData: boolean;
    function ValidarIdPessoa: boolean;
    procedure OnSelecionarPessoa(const RegistroAtual: TDataSet);
    function PegarConsultaPessoa(const poDmPessoa: TdmPessoa): TfrmPessoaConsulta;
    procedure LookupPessoa(const poIdPessoa, poNmpessoa: TField);
  protected
    function TestarRegistroValido: boolean; override;
    function PegarCampoChave: string; override;
    procedure MostrarNomePessoa;
  public
  end;

var
  FrmAgendaCadastro: TFrmAgendaCadastro;

implementation

uses
  FireDAC.Comp.Client;

{$R *.dfm}

{ TFrmAgendaCadastro }

function TFrmAgendaCadastro.PegarCampoChave: string;
begin
  Result := 'IDAGENDA';
end;

procedure TFrmAgendaCadastro.dsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if not Assigned(Field) then
    Exit;

  if not(Field.DataSet.State in dsEditModes) then
    Exit;

  if Field.FieldName.ToUpper.Equals('IDPESSOA') then
    LookupPessoa(Field, QueryCadastro.FindField('nmPessoa'));
end;

procedure TFrmAgendaCadastro.dsCadastroStateChange(Sender: TObject);
begin
  inherited;
  MostrarNomePessoa;
end;

procedure TFrmAgendaCadastro.LookupPessoa(const poIdPessoa, poNmpessoa: TField);
var
  oDmPessoa: TdmPessoa;
  oFrmPessoaConsulta: TfrmPessoaConsulta;
  bRegistroSelecionado: boolean;
begin
  if not(poIdPessoa.DataSet.State in dsEditModes) then
    Exit;

  if poIdPessoa.IsNull then
  begin
    poNmPessoa.Clear;
    Exit;
  end;

  oDmPessoa := TdmPessoa.Create(nil);
  oFrmPessoaConsulta := PegarConsultaPessoa(oDmPessoa);
  try
    bRegistroSelecionado := oFrmPessoaConsulta.SelecionarID('IDPESSOA', poIdPessoa.AsInteger);
    if bRegistroSelecionado then
      Exit;
    poIdPessoa.Clear;
    poNmPessoa.Clear;
  finally
    oFrmPessoaConsulta.Release;
    FreeAndNil(oDmPessoa);
  end;
end;

procedure TFrmAgendaCadastro.MostrarNomePessoa;
const
  sIDX_NMPESSOA = 'IDX_NMPESSOA';
var
  oNomePessoa: TFDMemTable;
  nIdPessoa: integer;
begin
  if not QueryCadastro.Active then
    Exit;

  nIdPessoa := QueryCadastro.FieldByName('idPessoa').AsInteger;

  oNomePessoa := TFDMemTable.Create(Nil);
  try
    oNomePessoa.CloneCursor(QueryCadastro);
    oNomePessoa.FindKey([nIdPessoa, Null]);
  finally
    FreeAndNil(oNomePessoa);
  end;
end;

procedure TFrmAgendaCadastro.OnSelecionarPessoa(const RegistroAtual: TDataSet);
var
  oIdPessoaOrigem: TField;
  oNmPessoaOrigem: TField;
  oIdPessoaDestino: TField;
  oNmPessoaDestino: TField;
begin
  QueryCadastro.Edit;

  oIdPessoaOrigem := RegistroAtual.FieldByName('idPessoa');
  oNmPessoaOrigem := RegistroAtual.FieldByName('nmPessoa');
  oIdPessoaDestino := QueryCadastro.FieldByName('idPessoa');
  oNmPessoaDestino := QueryCadastro.FieldByName('nmPessoa');
  QueryCadastro.DisableControls;
  try
    if oIdPessoaOrigem.AsInteger <> oIdPessoaDestino.AsInteger then
      oIdPessoaDestino.Assign(oIdPessoaOrigem);

    if oNmPessoaOrigem.AsString <> oNmPessoaDestino.AsString then
      oNmPessoaDestino.Assign(oNmPessoaOrigem);
  finally
    QueryCadastro.EnableControls;
  end;
end;

function TFrmAgendaCadastro.PegarConsultaPessoa(
  const poDmPessoa: TdmPessoa): TfrmPessoaConsulta;
begin
  Result := TfrmPessoaConsulta.PegarPessoaConsulta(poDmPessoa.sqlConsulta, OnSelecionarPessoa);
end;

procedure TFrmAgendaCadastro.SpeedButton1Click(Sender: TObject);
var
  oFrmPessoaConsulta: TfrmPessoaConsulta;
  oDmPessoa: TdmPessoa;
begin
  if not(QueryCadastro.State in dsEditModes) then
    Exit;

  oDmPessoa := TdmPessoa.Create(nil);
  oFrmPessoaConsulta := PegarConsultaPessoa(oDmPessoa);
  try
    oFrmPessoaConsulta.ShowModal;
  finally
    oFrmPessoaConsulta.Release;
    FreeAndNil(oDmPessoa);
  end;
end;

function TFrmAgendaCadastro.TestarRegistroValido: boolean;
begin
  Result := False;

  if ValidarIdPessoa then
    Exit;

  if ValidarNmDescricao then
    Exit;

  if ValidarDtData then
    Exit;

  Result := True;
end;

function TFrmAgendaCadastro.ValidarIdPessoa: boolean;
var
  oField: TField;
begin
  Result := False;
  oField := QueryCadastro.FieldByName('IdPessoa');
  if not oField.AsString.Trim.IsEmpty then
    Exit;

  ShowMessage('Campo obrigatório não preenchido!');
  oField.FocusControl;

  Result := True;
end;

function TFrmAgendaCadastro.ValidarNmDescricao: boolean;
var
  oField: TField;
begin
  Result := False;
  oField := QueryCadastro.FieldByName('nmDescricao');
  if not oField.AsString.Trim.IsEmpty then
    Exit;

  ShowMessage('Campo obrigatório não preenchido!');
  oField.FocusControl;

  Result := True;
end;

function TFrmAgendaCadastro.ValidarDtData: boolean;
var
  oField: TField;
begin
  Result := False;
  oField := QueryCadastro.FieldByName('dtData');
  if not oField.AsString.Trim.IsEmpty then
    Exit;

  ShowMessage('Campo obrigatório não preenchido!');
  oField.FocusControl;

  Result := True;
end;

end.
