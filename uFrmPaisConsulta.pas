unit uFrmPaisConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPadrao, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, uConfiguracaoConsulta,
  uFrameConsultaPadrao;

type
  TFrmPaisConsulta = class(TFrmConsultaPadrao)
  private
  protected
    procedure ConfigurarFmeConsulta; override;
  public
  end;

var
  FrmPaisConsulta: TFrmPaisConsulta;

implementation

{$R *.dfm}

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
