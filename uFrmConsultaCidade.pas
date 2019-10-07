unit uFrmConsultaCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPadrao, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, uConfiguracaoConsulta,
  uFrameConsultaPadrao;

type
  TFrmConsultaCidade = class(TFrmConsultaPadrao)
  private
  protected
    procedure ConfigurarFmeConsulta; override;
  public
  end;

var
  FrmConsultaCidade: TFrmConsultaCidade;

implementation

{$R *.dfm}

{ TFrmCidadeConsulta }

procedure TFrmConsultaCidade.ConfigurarFmeConsulta;
var
  rConfiguracaoConsulta: TConfiguracaoConsulta;
begin
  inherited;
  rConfiguracaoConsulta.NomeTabela := 'CIDADE';
  rConfiguracaoConsulta.CampoBusca := 'NMCIDADE';
  rConfiguracaoConsulta.CampoChave := 'IDCIDADE';
  rConfiguracaoConsulta.Caption := 'Consulta de Cidade por nome';
  DefinirConfiguracoesConsulta(rConfiguracaoConsulta);
end;

end.
