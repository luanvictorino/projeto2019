unit uFrmEstadoConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPadrao, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, uConfiguracaoConsulta,
  uFrameConsultaPadrao, FireDac.Comp.Client;

type
  TFrmEstadoConsulta = class(TFrmConsultaPadrao)
  private
  protected
    procedure ConfigurarFmeConsulta; override;
  public
    class function PegarEstadoConsulta(const poQueryConsulta: TFDQuery;
      const poOnSelecionarRegistro: TOnSelecionarRegistro): TFrmEstadoConsulta;
  end;

implementation

{$R *.dfm}

procedure TFrmEstadoConsulta.ConfigurarFmeConsulta;
var
  rConfiguracaoConsulta: TConfiguracaoConsulta;
begin
  inherited;
  rConfiguracaoConsulta.NomeTabela := 'ESTADO';
  rConfiguracaoConsulta.CampoBusca := 'NMESTADO';
  rConfiguracaoConsulta.CampoChave := 'IDESTADO';
  rConfiguracaoConsulta.Caption := 'Consulta de Estado por nome';
  DefinirConfiguracoesConsulta(rConfiguracaoConsulta);
end;

class function TFrmEstadoConsulta.PegarEstadoConsulta(
  const poQueryConsulta: TFDQuery;
  const poOnSelecionarRegistro: TOnSelecionarRegistro): TFrmEstadoConsulta;
begin
  Result := TFrmEstadoConsulta.Create(nil);
  Result.QueryConsulta := poQueryConsulta;
  Result.OnSelecionarRegistro := poOnSelecionarRegistro;
end;

end.
