unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Phys.IBBase, FireDAC.Comp.UI,
  uCadPessoa, Datasnap.DBClient, Datasnap.Provider;

type
  TDM = class(TDataModule)
    Conexao: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    qyPessoa: TFDQuery;
    qyPessoaIDPESSOA: TIntegerField;
    qyPessoaNMPESSOA: TStringField;
    qyPessoaNUTELEFONE: TStringField;
    qyPessoaNUCELULAR: TStringField;
    qyPessoaDEEMAIL: TStringField;
    qyPessoaIDCIDADE: TIntegerField;
    dsPessoa: TDataSource;
    PessoaSchemaAdapter: TFDSchemaAdapter;
    qyFuncionario: TFDQuery;
    qyFuncionarioIDPESSOA: TIntegerField;
    qyFuncionarioIDFUNCAO: TIntegerField;
    qyFuncionarioDTADMISSAO: TDateField;
    qyFuncionarioDTNASCIMENTO: TDateField;
    qyBusca: TFDQuery;
    qyCidade: TFDQuery;
    qyCidadeIDCIDADE: TIntegerField;
    qyCidadeNMCIDADE: TStringField;
    qyCidadeIDESTADO: TIntegerField;
    qyUltimo: TFDQuery;
    qyConsultaCidade: TFDQuery;
    qyConsFuncao: TFDQuery;
    qyConsFuncaoIDFUNCAO: TIntegerField;
    qyConsFuncaoNMFUNCAO: TStringField;
    qyConsPessoa: TFDQuery;
    qyConsPessoaIDPESSOA: TIntegerField;
    qyConsPessoaNMPESSOA: TStringField;
    qyConsPessoaNUTELEFONE: TStringField;
    qyConsPessoaNUCELULAR: TStringField;
    qyConsPessoaDEEMAIL: TStringField;
    qyConsPessoaIDCIDADE: TIntegerField;
    qyConsEstado: TFDQuery;
    qyConsEstadoIDESTADO: TIntegerField;
    qyConsEstadoNMESTADO: TStringField;
    qyConsEstadoUFESTADO: TStringField;
    qyConsEstadoIDPAIS: TIntegerField;
    qyPais: TFDQuery;
    qyConsultaPais: TFDQuery;
    procedure qyPessoaAfterPost(DataSet: TDataSet);
    procedure qyPessoaAfterDelete(DataSet: TDataSet);
    procedure qyFuncionariooReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure qyFuncionarioBeforeInsert(DataSet: TDataSet);
    procedure qyPessoaBeforePost(DataSet: TDataSet);
    procedure qyCidadeAfterOpen(DataSet: TDataSet);
    procedure qyConsultaCidadeAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function SalvarPessoa: boolean;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDM.qyCidadeAfterOpen(DataSet: TDataSet);
begin
  DataSet.FieldByName('nmCidade').DisplayWidth := 50;
end;

procedure TDM.qyConsultaCidadeAfterOpen(DataSet: TDataSet);
begin
  DataSet.FieldByName('nmCidade').DisplayWidth := 50;
  DataSet.FieldByName('nmCidade').DisplayLabel := 'Cidade';
end;

procedure TDM.qyFuncionarioBeforeInsert(DataSet: TDataSet);
begin
  if qyPessoa.State in dsEditModes then
    qyPessoa.Post;
end;

procedure TDM.qyFuncionariooReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
  raise Exception.Create(E.Message);
end;

procedure TDM.qyPessoaAfterDelete(DataSet: TDataSet);
begin
  if qyFuncionario.IsEmpty then
    Exit;
  qyFuncionario.Delete;
end;

procedure TDM.qyPessoaAfterPost(DataSet: TDataSet);
begin
  if DataSet.State IN dsEditModes then
    DataSet.Post;
end;

procedure TDM.qyPessoaBeforePost(DataSet: TDataSet);
begin
//  if (qyPessoaNMPESSOA.AsString = '') then
//    raise Exception.Create('Error Message');

//  if dfNmPessoa.Text = '' then
//  begin
//    ShowMessage('Campo obrigatório!');
//    dfNmPessoa.SetFocus;
//  end;
end;

function TDM.SalvarPessoa: boolean;
begin
  if qyFuncionario.State in dsEditModes then
    qyFuncionario.Post;

  if qyPessoa.State in dsEditModes then
    qyPessoa.Post;

  result := qyPessoa.ApplyUpdates(0) = 0;
  if not result then
    Exit;

  result := qyFuncionario.ApplyUpdates(0) = 0;
end;

end.
