unit uFrmPessoaConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPadrao, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, uFrameConsultaPadrao;

type
  TFrmPessoaConsulta = class(TFrmConsultaPadrao)
  private
  protected
    procedure ConfigurarFmeConsulta; override;
  public
  end;

implementation

uses
  uConfiguracaoConsulta;

{$R *.dfm}

procedure TFrmPessoaConsulta.ConfigurarFmeConsulta;
var
  rConfiguracaoConsulta: TConfiguracaoConsulta;
begin
  inherited;
  rConfiguracaoConsulta.NomeTabela := 'PESSOA';
  rConfiguracaoConsulta.CampoBusca := 'NMPESSOA';
  rConfiguracaoConsulta.CampoChave := 'IDPESSOA';
  rConfiguracaoConsulta.Caption := 'Consulta de Pessoa por nome';
  DefinirConfiguracoesConsulta(rConfiguracaoConsulta);
end;

end.
