unit uFrmPaisConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPadrao, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, FireDac.Comp.Client,
  uConfiguracaoConsulta, uFrameConsultaPadrao;

type
  TFrmPaisConsulta = class(TFrmConsultaPadrao)
  private
  protected
    procedure ConfigurarFmeConsulta; override;
  public
    class function PegarPaisConsulta(const poQueryConsulta: TFDQuery;
      const poOnSelecionarRegistro: TOnSelecionarRegistro): TFrmPaisConsulta;
  end;

implementation

{$R *.dfm}

class function TFrmPaisConsulta.PegarPaisConsulta(const poQueryConsulta: TFDQuery;
  const poOnSelecionarRegistro: TOnSelecionarRegistro): TFrmPaisConsulta;
begin
  Result := TFrmPaisConsulta.Create(nil);
  Result.QueryConsulta := poQueryConsulta;
  Result.OnSelecionarRegistro := poOnSelecionarRegistro;
end;

procedure TFrmPaisConsulta.ConfigurarFmeConsulta;
var
  rConfiguracaoConsulta: TConfiguracaoConsulta;
begin
  inherited;
  rConfiguracaoConsulta.NomeTabela := 'PAIS';
  rConfiguracaoConsulta.CampoBusca := 'NMPAIS';
  rConfiguracaoConsulta.CampoChave := 'IDPAIS';
  rConfiguracaoConsulta.Caption := 'Consulta de País por nome';
  DefinirConfiguracoesConsulta(rConfiguracaoConsulta);
end;

end.
