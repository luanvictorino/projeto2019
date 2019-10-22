unit uFrmCidadeConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPadrao, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, uConfiguracaoConsulta,
  uFrameConsultaPadrao;

type
  TFrmCidadeConsulta = class(TFrmConsultaPadrao)
  private
  protected
    procedure ConfigurarFmeConsulta; override;
  public
  end;

var
  FrmCidadeConsulta: TFrmCidadeConsulta;

implementation

{$R *.dfm}

{ TFrmCidadeConsulta }

procedure TFrmCidadeConsulta.ConfigurarFmeConsulta;
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
