unit uDMTimes;

interface

uses
  System.SysUtils, System.Classes, uDataModulePadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmTimes = class(TDataModulePadrao)
    sqlTimes: TFDQuery;
    sqlTimesIDTIMES: TIntegerField;
    sqlTimesNMTIMES: TStringField;
    procedure sqlConsultaAfterOpen(DataSet: TDataSet);
    procedure sqlTimesAfterOpen(DataSet: TDataSet);
  private
    procedure ConfigurarMetaData(const DataSet: TDataSet);
  public
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmTimes }

procedure TdmTimes.sqlTimesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ConfigurarMetaData(DataSet);
end;

procedure TdmTimes.sqlConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ConfigurarMetaData(DataSet);
end;

procedure TdmTimes.ConfigurarMetaData(const DataSet: TDataSet);
begin
  ConfigurarCampo(DataSet, 'nmTimes',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Nome do Time';
      poCampo.DisplayWidth := 100;
    end);
  ConfigurarCampo(DataSet, 'idTimes',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Código do time';
      poCampo.Visible := False;
    end);
end;

end.
