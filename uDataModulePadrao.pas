unit uDataModulePadrao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase, FireDAC.Comp.UI,
  Data.DB, FireDAC.Comp.Client, Data.FMTBcd, Data.SqlExpr, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TConfiguradorCampo = reference to procedure(const poCampo: TField);

  TDataModulePadrao = class(TDataModule)
    Conexao: TFDConnection;
    sqlConsulta: TFDQuery;
  private
  protected
    procedure ConfigurarCampo(const DataSet: TDataSet; const sNomeCampo: string;
      const poConfigurarCampo: TConfiguradorCampo);
  public
    { Public declarations }
  end;

var
  DataModulePadrao: TDataModulePadrao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDataModulePadrao }

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

end.
