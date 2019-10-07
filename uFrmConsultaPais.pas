unit uFrmConsultaPais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPadrao, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, uConfiguracaoConsulta,
  uFrameConsultaPadrao;

type
  TFrmConsultaPais = class(TFrmConsultaPadrao)
  private
  protected
    procedure ConfigurarFmeConsulta; override;
  public
  end;

var
  FrmConsultaPais: TFrmConsultaPais;

implementation

{$R *.dfm}

procedure TFrmConsultaPais.ConfigurarFmeConsulta;
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
