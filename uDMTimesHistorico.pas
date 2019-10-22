unit uDMTimesHistorico;

interface

uses
  System.SysUtils, System.Classes, uDataModulePadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmTimesHistorico = class(TDataModulePadrao)
    sqlTimesHistorico: TFDQuery;
    sqlTimesHistoricoIDTIMESHISTORICO: TIntegerField;
    sqlTimesHistoricoIDPESSOA: TIntegerField;
    sqlTimesHistoricoIDTIMES: TIntegerField;
    sqlTimesHistoricoDTENTRADA: TDateField;
    sqlTimesHistoricoDTSAIDA: TDateField;
    sqlTimesHistoricoNMPESSOA: TStringField;
    sqlTimesHistoricoNMTIMES: TStringField;
    procedure sqlConsultaAfterOpen(DataSet: TDataSet);
    procedure sqlTimesHistoricoAfterOpen(DataSet: TDataSet);
  private
    procedure ConfigurarMetaData(const DataSet: TDataSet);
  public
  end;

var
  dmTimesHistorico: TdmTimesHistorico;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmTimesHistorico }

procedure TdmTimesHistorico.sqlTimesHistoricoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ConfigurarMetaData(DataSet);
end;

procedure TdmTimesHistorico.sqlConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ConfigurarMetaData(DataSet);
end;

procedure TdmTimesHistorico.ConfigurarMetaData(const DataSet: TDataSet);
begin
  ConfigurarCampo(DataSet, 'nmTimes',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Time';
      poCampo.DisplayWidth := 100;
    end);
  ConfigurarCampo(DataSet, 'nmPessoa',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Funcionário';
      poCampo.DisplayWidth := 55;
    end);
  ConfigurarCampo(DataSet, 'idTimesHistorico',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Código';
      poCampo.Visible := False;
    end);
  ConfigurarCampo(DataSet, 'idPessoa',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Código da Pessoa';
      poCampo.Visible := False;
    end);
  ConfigurarCampo(DataSet, 'idTimes',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Código do Time';
      poCampo.Visible := False;
    end);
  ConfigurarCampo(DataSet, 'dtEntrada',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Data de Entrada';
      poCampo.DisplayWidth := 20;
    end);
  ConfigurarCampo(DataSet, 'dtSaida',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Data de Saída';
      poCampo.DisplayWidth := 20;
    end);
end;

end.
