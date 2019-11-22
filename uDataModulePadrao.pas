unit uDataModulePadrao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase, FireDAC.Comp.UI,
  Data.DB, FireDAC.Comp.Client, Data.FMTBcd, Data.SqlExpr, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  System.Generics.Collections;

type
  TConfiguradorCampo = reference to procedure(const poCampo: TField);

  TDataModulePadrao = class(TDataModule)
    Conexao: TFDConnection;
    sqlConsulta: TFDQuery;
  private
    FoReconcileList: TDictionary<String, TFDReconcileErrorEvent>;
  protected
    procedure ConfigurarCampo(const DataSet: TDataSet; const sNomeCampo: string;
      const poConfigurarCampo: TConfiguradorCampo);
    procedure ExecutarReconcileError(DataSet: TFDDataSet; E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction); virtual;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  end;

implementation

uses
  VCL.Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDataModulePadrao }

procedure TDataModulePadrao.AfterConstruction;
var
  oComponente: TComponent;
  oQuery: TFDDataSet;
begin
  inherited;
  FoReconcileList := TDictionary<String, TFDReconcileErrorEvent>.Create();

  for oComponente in Self do
  begin
    if not oComponente.InheritsFrom(TFDDataSet) then
      Continue;
    oQuery := TFDDataSet(oComponente);
    FoReconcileList.Add(oQuery.Name, oQuery.OnReconcileError);
    oQuery.OnReconcileError := ExecutarReconcileError;
  end;
end;

procedure TDataModulePadrao.BeforeDestruction;
var
  oReconcileItem: TPair<String, TFDReconcileErrorEvent>;
  oQuery: TFDDataSet;
begin
  for oReconcileItem in FoReconcileList do
  begin
    oQuery := FindComponent(oReconcileItem.Key) as TFDDataSet;
    if not Assigned(oQuery) then
      Continue;
    oQuery.OnReconcileError := oReconcileItem.Value;
  end;
  FreeAndNil(FoReconcileList);
  inherited;
end;

procedure TDataModulePadrao.ConfigurarCampo(const DataSet: TDataSet; const sNomeCampo: string;
  const poConfigurarCampo: TConfiguradorCampo);
var
  oCampo: TField;
begin
  oCampo := DataSet.FindField(sNomeCampo);
  if not Assigned(oCampo) then
    Exit;
  if Assigned(poConfigurarCampo) then
    poConfigurarCampo(oCampo);
end;

procedure TDataModulePadrao.ExecutarReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
var
  oReconcileErrorEvent: TFDReconcileErrorEvent;
begin
  FoReconcileList.TryGetValue(DataSet.Name, oReconcileErrorEvent);
  if Assigned(oReconcileErrorEvent) then
  begin
    oReconcileErrorEvent(DataSet, E, UpdateKind, Action);
    Exit;
  end;
  ShowMessage(E.Message);
end;

end.
