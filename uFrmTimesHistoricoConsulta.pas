unit uFrmTimesHistoricoConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPadrao, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, uFrameConsultaPadrao,
  uConfiguracaoConsulta;

type
  TFrmTimesHistoricoConsulta = class(TFrmConsultaPadrao)
  private
  protected
    procedure ConfigurarFmeConsulta; override;
  public
    { Public declarations }
  end;

var
  FrmTimesHistoricoConsulta: TFrmTimesHistoricoConsulta;

implementation

{$R *.dfm}

{ TFrmTimesHistoricoConsulta }

procedure TFrmTimesHistoricoConsulta.ConfigurarFmeConsulta;
var
  rConfiguracaoConsulta: TConfiguracaoConsulta;
begin
  inherited;
  rConfiguracaoConsulta.NomeTabela := 'TIMESHISTORICO';
  rConfiguracaoConsulta.CampoBusca := 'NMPESSOA';
  rConfiguracaoConsulta.CampoChave := 'IDTIMESHISTORICO';
  rConfiguracaoConsulta.Caption := 'Consulta de Funcionário por nome';
  DefinirConfiguracoesConsulta(rConfiguracaoConsulta);
end;

end.
