unit uDMCidade;

interface

uses
  System.SysUtils, System.Classes, uDataModulePadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.FMTBcd, Data.DB,
  Data.SqlExpr, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type

  TdmCidade = class(TDataModulePadrao)
    sqlCidade: TFDQuery;
    sqlCidadeIDCIDADE: TIntegerField;
    sqlCidadeNMCIDADE: TStringField;
    sqlCidadeIDESTADO: TIntegerField;
    sqlCidadeNMESTADO: TStringField;
    procedure sqlConsultaAfterOpen(DataSet: TDataSet);
    procedure sqlCidadeAfterOpen(DataSet: TDataSet);
  private
    procedure ConfigurarMetaData(const DataSet: TDataSet);
  public
    { Public declarations }
  end;

var
  dmCidade: TdmCidade;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TdmCidade.sqlCidadeAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ConfigurarMetaData(DataSet);
end;

procedure TdmCidade.sqlConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ConfigurarMetaData(DataSet);
end;

procedure TdmCidade.ConfigurarMetaData(const DataSet: TDataSet);
begin
  ConfigurarCampo(DataSet, 'nmCidade',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Nome Cidade';
      poCampo.DisplayWidth := 100;
    end);
  ConfigurarCampo(DataSet, 'nmEstado',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Estado';
      poCampo.DisplayWidth := 100;
    end);
  ConfigurarCampo(DataSet, 'idCidade',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Código da Cidade';
      poCampo.Visible := False;
    end);
  ConfigurarCampo(DataSet, 'idEstado',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Código do Estado';
      poCampo.Visible := False;
    end);
end;

end.
