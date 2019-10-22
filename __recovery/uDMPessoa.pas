unit uDMPessoa;

interface

uses
  System.SysUtils, System.Classes, uDataModulePadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type


  TdmPessoa = class(TDataModulePadrao)
    sqlPessoa: TFDQuery;
    sqlFuncionario: TFDQuery;
    PessoaSchemaAdapter: TFDSchemaAdapter;
    sqlPessoaIDPESSOA: TIntegerField;
    sqlPessoaNMPESSOA: TStringField;
    sqlPessoaNUTELEFONE: TStringField;
    sqlPessoaNUCELULAR: TStringField;
    sqlPessoaDEEMAIL: TStringField;
    sqlPessoaIDCIDADE: TIntegerField;
    sqlFuncionarioIDPESSOA: TIntegerField;
    sqlFuncionarioIDFUNCAO: TIntegerField;
    sqlFuncionarioDTADMISSAO: TDateField;
    sqlPessoaNMCIDADE: TStringField;
    sqlFuncionarioNMFUNCAO: TStringField;
    dsPessoa: TDataSource;
    sqlPessoaDTNASCIMENTO: TDateField;
    sqlFuncionarioDTDEMISSAO: TDateField;
    sqltimesHistorico: TFDQuery;
    sqltimesHistoricoIDTIMESHISTORICO: TIntegerField;
    sqltimesHistoricoIDPESSOA: TIntegerField;
    sqltimesHistoricoIDTIMES: TIntegerField;
    sqltimesHistoricoDTENTRADA: TDateField;
    sqltimesHistoricoDTSAIDA: TDateField;
    sqltimesHistoricoNMTIMES: TStringField;
    procedure sqlPessoaAfterOpen(DataSet: TDataSet);
    procedure sqlConsultaAfterOpen(DataSet: TDataSet);
  private
    procedure ConfigurarMetaData(const DataSet: TDataSet);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmPessoa }

procedure TdmPessoa.sqlConsultaAfterOpen(DataSet: TDataSet);
begin
  ConfigurarMetaData(DataSet);
end;

procedure TdmPessoa.sqlPessoaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ConfigurarMetaData(DataSet);
end;

procedure TdmPessoa.ConfigurarMetaData(const DataSet: TDataSet);
begin
  ConfigurarCampo(DataSet, 'nmPessoa',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Nome da Pessoa';
      poCampo.DisplayWidth := 30;
    end);
  ConfigurarCampo(DataSet, 'idPessoa',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Código da Pessoa';
      poCampo.Visible := False;
    end);
  ConfigurarCampo(DataSet, 'nuCelular',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Celular';
      poCampo.DisplayWidth := 15;
    end);
  ConfigurarCampo(DataSet, 'nuTelefone',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Telefone';
      poCampo.Visible := False;
    end);
  ConfigurarCampo(DataSet, 'deEmail',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Email';
      poCampo.DisplayWidth := 15;
    end);
  ConfigurarCampo(DataSet, 'idCidade',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Cód. da Cidade';
      poCampo.DisplayWidth := 5;
    end);
  ConfigurarCampo(DataSet, 'DtNascimento',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Data de Nascimento';
      poCampo.DisplayWidth := 5;
    end);
end;

end.
