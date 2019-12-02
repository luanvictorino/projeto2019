unit uDMPais;

interface

uses
  System.SysUtils, System.Classes, uDataModulePadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmPais = class(TDataModulePadrao)
    sqlPais: TFDQuery;
    sqlPaisIDPAIS: TIntegerField;
    sqlPaisNMPAIS: TStringField;
    procedure sqlPaisAfterOpen(DataSet: TDataSet);
    procedure sqlConsultaAfterOpen(DataSet: TDataSet);
  private
    procedure ConfigurarMetaData(const DataSet: TDataSet);
  public
    { Public declarations }
  end;

var
  dmPais: TdmPais;

implementation

uses
  Vcl.Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModulePadrao2 }

procedure TdmPais.sqlPaisAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ConfigurarMetaData(DataSet);
end;

procedure TdmPais.sqlConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ConfigurarMetaData(DataSet);
end;

procedure TdmPais.ConfigurarMetaData(const DataSet: TDataSet);
begin
  ConfigurarCampo(DataSet, 'nmPais',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Nome do País';
      poCampo.DisplayWidth := 100;
      TFDDataSet(poCampo.DataSet).IndexFieldNames := 'nmPais';
    end);
  ConfigurarCampo(DataSet, 'idPais',
    procedure(const poCampo: TField)
    begin
      poCampo.DisplayLabel := 'Código do País';
      poCampo.Visible := False;
    end);
end;

end.
