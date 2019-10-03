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
    dsPessoa: TDataSource;
    sqlPessoaIDPESSOA: TIntegerField;
    sqlPessoaNMPESSOA: TStringField;
    sqlPessoaNUTELEFONE: TStringField;
    sqlPessoaNUCELULAR: TStringField;
    sqlPessoaDEEMAIL: TStringField;
    sqlPessoaIDCIDADE: TIntegerField;
    sqlFuncionarioIDPESSOA: TIntegerField;
    sqlFuncionarioIDFUNCAO: TIntegerField;
    sqlFuncionarioDTADMISSAO: TDateField;
    sqlFuncionarioDTNASCIMENTO: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPessoa: TdmPessoa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
