unit uDMEstado;

interface

uses
  System.SysUtils, System.Classes, uDataModulePadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmEstado = class(TDataModulePadrao)
    sqlEstado: TFDQuery;
    sqlEstadoIDESTADO: TIntegerField;
    sqlEstadoNMESTADO: TStringField;
    sqlEstadoUFESTADO: TStringField;
    sqlEstadoIDPAIS: TIntegerField;
    sqlEstadoNMPAIS: TStringField;
    procedure sqlEstadoAfterOpen(DataSet: TDataSet);
    procedure sqlConsultaAfterOpen(DataSet: TDataSet);
  private
    procedure ConfigurarMetaData(const DataSet: TDataSet);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmEstado: TdmEstado;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmEstado.sqlEstadoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ConfigurarMetaData(DataSet);
end;

procedure TdmEstado.sqlConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ConfigurarMetaData(DataSet);
end;

procedure TdmEstado.ConfigurarMetaData(const DataSet: TDataSet);
begin
  ConfigurarCampo(DataSet, 'nmEstado',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Nome Estado';
      poCampo.DisplayWidth := 100;
    end);
  ConfigurarCampo(DataSet, 'nmPais',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'País';
      poCampo.DisplayWidth := 100;
    end);
  ConfigurarCampo(DataSet, 'idEstado',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Código do Estado';
      poCampo.Visible := False;
    end);
  ConfigurarCampo(DataSet, 'idPais',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Código do País';
      poCampo.Visible := False;
    end);
end;

end.
