unit uFrmConsultaEstado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPadrao, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, uConfiguracaoConsulta,
  uFrameConsultaPadrao;

type
  TFrmConsultaEstado = class(TFrmConsultaPadrao)
  private
  protected
    procedure ConfigurarFmeConsulta; override;
  public
  end;

var
  FrmConsultaEstado: TFrmConsultaEstado;

implementation

{$R *.dfm}

procedure TFrmConsultaEstado.ConfigurarFmeConsulta;
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

end.
