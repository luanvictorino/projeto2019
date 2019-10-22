unit uFrmTimeConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPadrao, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, uFrameConsultaPadrao,
  uConfiguracaoConsulta, FireDAC.Comp.Client;

type
  TFrmTimeConsulta = class(TFrmConsultaPadrao)
  private
  protected
    procedure ConfigurarFmeConsulta; override;
  public
    class function PegarTimesConsulta(const poQueryConsulta: TFDQuery;
      const poOnSelecionarRegistro: TOnSelecionarRegistro): TFrmTimeConsulta;
  end;

var
  FrmTimeConsulta: TFrmTimeConsulta;

implementation

{$R *.dfm}

{ TFrmTimeConsulta }

procedure TFrmTimeConsulta.ConfigurarFmeConsulta;
var
  rConfiguracaoConsulta: TConfiguracaoConsulta;
begin
  inherited;
  rConfiguracaoConsulta.NomeTabela := 'TIMES';
  rConfiguracaoConsulta.CampoBusca := 'NMTIMES';
  rConfiguracaoConsulta.CampoChave := 'IDTIMES';
  rConfiguracaoConsulta.Caption := 'Consulta de Times por nome';
  DefinirConfiguracoesConsulta(rConfiguracaoConsulta);
end;

class function TFrmTimeConsulta.PegarTimesConsulta(
  const poQueryConsulta: TFDQuery;
  const poOnSelecionarRegistro: TOnSelecionarRegistro): TFrmTimeConsulta;
begin
  Result := TFrmTimeConsulta.Create(nil);
  Result.QueryConsulta := poQueryConsulta;
  Result.OnSelecionarRegistro := poOnSelecionarRegistro;
end;

end.
