unit uDMFuncao;

interface

uses
  System.SysUtils, System.Classes, uDataModulePadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmFuncao = class(TDataModulePadrao)
    sqlFuncao: TFDQuery;
    sqlFuncaoIDFUNCAO: TIntegerField;
    sqlFuncaoNMFUNCAO: TStringField;
    procedure sqlFuncaoAfterOpen(DataSet: TDataSet);
    procedure sqlConsultaAfterOpen(DataSet: TDataSet);
  private
    procedure ConfigurarMetaData(const DataSet: TDataSet);
  public
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmFuncao }

procedure TdmFuncao.sqlConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ConfigurarMetaData(DataSet);
end;

procedure TdmFuncao.sqlFuncaoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ConfigurarMetaData(DataSet);
end;

procedure TdmFuncao.ConfigurarMetaData(const DataSet: TDataSet);
begin
  ConfigurarCampo(DataSet, 'nmFuncao',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Nome da Função';
      poCampo.DisplayWidth := 100;
    end);
  ConfigurarCampo(DataSet, 'idFuncao',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Código da Função';
      poCampo.Visible := False;
    end);
end;

end.
