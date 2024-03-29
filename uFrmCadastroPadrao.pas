unit uFrmCadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Mask, Vcl.DBCtrls, FireDAC.Stan.Param,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uConfiguracaoConsulta, uFrmConsultaPadrao;

type
  TFrmCadastroPadrao = class(TForm)
    pgPadrao: TPageControl;
    tsConsPadrao: TTabSheet;
    tsCadastroPadrao: TTabSheet;
    pnCadastroPadrao: TPanel;
    pnConsPadrao: TPanel;
    btNovo: TBitBtn;
    btSalvar: TBitBtn;
    btCancelar: TBitBtn;
    btExcluir: TBitBtn;
    dsCadastro: TDataSource;
    procedure btNovoClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsCadastroStateChange(Sender: TObject);
  private
    FQueryCadastro: TFDQuery;
    procedure SetQueryCadastro(const Value: TFDQuery);
    procedure ExcluirRegistro;
    procedure HabilitarBotoes;
    function ComitarSchemaAdapter: boolean;
    function ComitarQuery: boolean;
    procedure AbrirQuerySemRegistro;
  protected
    function TestarQueryAlterada(const poDataSet: TDataSet): boolean;
    procedure SalvarRegistro; virtual;
    procedure OnSelecionarRegistro(const RegistroSelecionado: TDataSet); virtual;
    procedure InserirNovoRegistro; virtual;
    procedure CancelarRegistro; virtual;
    procedure SalvarQryDetalhes; virtual;
    procedure DadosAlterados(var pbDadosAlterados: boolean); virtual;
    function ComitarAlteracoes: boolean; virtual;
    function TestarRegistroValido: boolean; virtual; abstract;
    function PegarCampoChave: string; virtual; abstract;
    procedure TratarErroApplyUpdates; virtual;
  public
    procedure DefinirConsulta(const FrmConsultaPadrao: TFrmConsultaPadrao);
    property QueryCadastro: TFDQuery read FQueryCadastro write SetQueryCadastro;
  end;

implementation

{$R *.dfm}

uses
  System.UiTypes;

{$REGION 'Eventos de tela'}

procedure TFrmCadastroPadrao.FormCreate(Sender: TObject);
begin
  pgPadrao.ActivePage := tsConsPadrao;
end;

procedure TFrmCadastroPadrao.dsCadastroStateChange(Sender: TObject);
begin
  HabilitarBotoes;
end;

procedure TFrmCadastroPadrao.btNovoClick(Sender: TObject);
begin
  InserirNovoRegistro;
end;

procedure TFrmCadastroPadrao.btSalvarClick(Sender: TObject);
begin
  SalvarRegistro;
end;

procedure TFrmCadastroPadrao.btExcluirClick(Sender: TObject);
begin
  ExcluirRegistro;
end;

procedure TFrmCadastroPadrao.btCancelarClick(Sender: TObject);
begin
  CancelarRegistro;
end;

procedure TFrmCadastroPadrao.AbrirQuerySemRegistro;
begin
  QueryCadastro.Params.ClearValues;
  if QueryCadastro.Active then
    QueryCadastro.Close;
  QueryCadastro.Open;
end;

{$ENDREGION}
{$REGION 'Comitar Altera��es'}

function TFrmCadastroPadrao.ComitarAlteracoes: boolean;
var
  bExecutarAdapter: boolean;
begin
  bExecutarAdapter := Assigned(QueryCadastro.SchemaAdapter);

  if bExecutarAdapter then
    Result := ComitarSchemaAdapter
  else
  begin
    try
      Result := ComitarQuery;
    except
      on E: Exception do
      begin
        Result := False;
        ShowMessage('Erro: ' + E.Message);
      end;
    end;
  end;
end;

function TFrmCadastroPadrao.ComitarSchemaAdapter: boolean;
var
  bEncontrouErro: boolean;
begin
  Result := False;

  bEncontrouErro := QueryCadastro.SchemaAdapter.ApplyUpdates(0) <> 0;
  if bEncontrouErro then
    Exit;

  QueryCadastro.SchemaAdapter.CommitUpdates;
  Result := True;
end;

function TFrmCadastroPadrao.ComitarQuery: boolean;
var
  bEncontrouErro: boolean;
begin
  Result := False;

  bEncontrouErro := QueryCadastro.ApplyUpdates(0) <> 0;
  if bEncontrouErro then
  begin
    TratarErroApplyUpdates;
    Exit;
  end;
  QueryCadastro.CommitUpdates;
  Result := True;
end;

function TFrmCadastroPadrao.TestarQueryAlterada(const poDataSet: TDataSet): boolean;
begin
  Result := False;
  if not Assigned(poDataSet) then
    Exit;
  Result := (poDataSet.State in dsEditModes) or (poDataSet.UpdateStatus <> usUnModified);
end;

procedure TFrmCadastroPadrao.TratarErroApplyUpdates;
begin
  if QueryCadastro.UpdateStatus = usDeleted then
    QueryCadastro.CancelUpdates;
  QueryCadastro.Edit;
end;

{$ENDREGION}
{$REGION 'M�todos CRUD'}

procedure TFrmCadastroPadrao.InserirNovoRegistro;
begin
  AbrirQuerySemRegistro;
  QueryCadastro.Insert;
  pgPadrao.ActivePage := tsCadastroPadrao;
end;

procedure TFrmCadastroPadrao.SalvarQryDetalhes;
begin
  Exit;
end;

procedure TFrmCadastroPadrao.SalvarRegistro;
begin
  if not TestarRegistroValido then
    Exit;

  SalvarQryDetalhes;

  if QueryCadastro.State in dsEditModes then
    QueryCadastro.Post;

  if not ComitarAlteracoes then
    Exit;

  ShowMessage('Registro salvo!');
end;

procedure TFrmCadastroPadrao.ExcluirRegistro;
var
  bConfirmarExcluir: boolean;
begin
  if (QueryCadastro.FieldByName(PegarCampoChave).AsInteger <= 0) then
    Exit;

  bConfirmarExcluir := MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes;
  if bConfirmarExcluir then
    Exit;

  if QueryCadastro.State in dsEditModes then
    QueryCadastro.Cancel;

  QueryCadastro.Delete;
  if not ComitarAlteracoes then
    Exit;

  ShowMessage('O registro foi exclu�do com sucesso!');
  pgPadrao.ActivePage := tsConsPadrao;
end;

procedure TFrmCadastroPadrao.CancelarRegistro;
begin
  if QueryCadastro.State in dsEditModes then
    QueryCadastro.Cancel;

  if Assigned(QueryCadastro.SchemaAdapter) then
    QueryCadastro.SchemaAdapter.CancelUpdates
  else if QueryCadastro.ChangeCount > 0 then
    QueryCadastro.CancelUpdates;

  AbrirQuerySemRegistro;
  pgPadrao.ActivePage := tsConsPadrao;
end;

{$ENDREGION}

procedure TFrmCadastroPadrao.DadosAlterados(var pbDadosAlterados: boolean);
begin
  if not Assigned(QueryCadastro) then
    Exit;

  pbDadosAlterados := (QueryCadastro.State in dsEditModes) or (QueryCadastro.UpdateStatus <> usUnModified);
end;

procedure TFrmCadastroPadrao.DefinirConsulta(const FrmConsultaPadrao: TFrmConsultaPadrao);
begin
  FrmConsultaPadrao.Parent := tsConsPadrao;
  FrmConsultaPadrao.BorderStyle := bsNone;
  FrmConsultaPadrao.Align := alClient;
  FrmConsultaPadrao.Color := clWhite;
  FrmConsultaPadrao.OnSelecionarRegistro := OnSelecionarRegistro;
  FrmConsultaPadrao.DefinirModo(mcFrame);
  FrmConsultaPadrao.Visible := True;
end;

procedure TFrmCadastroPadrao.HabilitarBotoes;
var
  bDadosAlterados: boolean;
begin
  if not Assigned(QueryCadastro) then
    Exit;
  DadosAlterados(bDadosAlterados);

  btSalvar.Enabled := bDadosAlterados;
  btCancelar.Enabled := bDadosAlterados;
  btExcluir.Enabled := not QueryCadastro.IsEmpty;
end;

procedure TFrmCadastroPadrao.OnSelecionarRegistro(const RegistroSelecionado: TDataSet);
var
  oCampoChave: TField;
  sCampoChave: string;
begin

  if RegistroSelecionado.IsEmpty then
    Exit;

  sCampoChave := PegarCampoChave;

  oCampoChave := RegistroSelecionado.FindField(sCampoChave);
  if not Assigned(oCampoChave) then
    raise EArgumentException.CreateFmt('O campo %s n�o existe na pesquisa!', [sCampoChave]);

  if oCampoChave.IsNull then
    Exit;

  if Assigned(QueryCadastro.SchemaAdapter) then
    QueryCadastro.SchemaAdapter.Close;

  QueryCadastro.Close;
  QueryCadastro.ParamByName(sCampoChave).Value := oCampoChave.Value;
  QueryCadastro.Open;
  QueryCadastro.Edit;
  pgPadrao.ActivePage := tsCadastroPadrao;
end;

procedure TFrmCadastroPadrao.SetQueryCadastro(const Value: TFDQuery);
begin
  FQueryCadastro := Value;
  dsCadastro.DataSet := FQueryCadastro;
end;

end.
