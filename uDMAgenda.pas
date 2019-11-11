unit uDMAgenda;

interface

uses
  System.SysUtils, System.Classes, uDataModulePadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmAgenda = class(TDataModulePadrao)
    sqlAgenda: TFDQuery;
    sqlAgendaIDAGENDA: TIntegerField;
    sqlAgendaIDPESSOA: TIntegerField;
    sqlAgendaNMDESCRICAO: TStringField;
    sqlAgendaDTDATA: TDateField;
    sqlAgendaHORA: TTimeField;
    sqlAgendaNMPESSOA: TStringField;
    procedure sqlConsultaAfterOpen(DataSet: TDataSet);
    procedure sqlAgendaAfterOpen(DataSet: TDataSet);
  private
    procedure ConfigurarMetaData(const DataSet: TDataSet);
  public
  end;

var
  dmAgenda: TdmAgenda;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModulePadrao2 }

procedure TdmAgenda.sqlAgendaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ConfigurarMetaData(DataSet);
end;

procedure TdmAgenda.sqlConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ConfigurarMetaData(DataSet);
end;

procedure TdmAgenda.ConfigurarMetaData(const DataSet: TDataSet);
begin
  ConfigurarCampo(DataSet, 'nmPessoa',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Nome Pessoa';
      poCampo.DisplayWidth := 20;
    end);
  ConfigurarCampo(DataSet, 'nmDescricao',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Descrição';
      poCampo.DisplayWidth := 40;
    end);
  ConfigurarCampo(DataSet, 'idAgenda',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Código da Agenda';
      poCampo.Visible := False;
    end);
  ConfigurarCampo(DataSet, 'idPessoa',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Código da Pessoa';
      poCampo.Visible := False;
    end);
  ConfigurarCampo(DataSet, 'dtData',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Data';
      poCampo.DisplayWidth := 10;
    end);
  ConfigurarCampo(DataSet, 'Hora',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Hora';
      poCampo.DisplayWidth := 10;
    end);
end;

end.
