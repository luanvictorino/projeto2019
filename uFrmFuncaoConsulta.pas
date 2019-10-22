unit uFrmFuncaoConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPadrao, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, uFrameConsultaPadrao, uConfiguracaoConsulta;

type
  TFrmFuncaoConsulta = class(TFrmConsultaPadrao)
  private
  protected
    procedure ConfigurarFmeConsulta; override;
  public
  end;

implementation

{$R *.dfm}

{ TFrmFuncaoConsulta }

procedure TFrmFuncaoConsulta.ConfigurarFmeConsulta;
var
  rConfiguracaoConsulta: TConfiguracaoConsulta;
begin
  inherited;
  rConfiguracaoConsulta.NomeTabela := 'FUNCAO';
  rConfiguracaoConsulta.CampoBusca := 'NMFUNCAO';
  rConfiguracaoConsulta.CampoChave := 'IDFUNCAO';
  rConfiguracaoConsulta.Caption := 'Consulta de Função por nome';
  DefinirConfiguracoesConsulta(rConfiguracaoConsulta);
end;

end.
