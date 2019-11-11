unit uFrmPessoaConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPadrao, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, uFrameConsultaPadrao,
  FireDAC.Comp.Client;

type
  TFrmPessoaConsulta = class(TFrmConsultaPadrao)
  private
  protected
    procedure ConfigurarFmeConsulta; override;
  public
    class function PegarPessoaConsulta(const poQueryConsulta: TFDQuery;
      const poOnSelecionarRegistro: TOnSelecionarRegistro): TFrmPessoaConsulta;
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

class function TFrmPessoaConsulta.PegarPessoaConsulta(
  const poQueryConsulta: TFDQuery;
  const poOnSelecionarRegistro: TOnSelecionarRegistro): TFrmPessoaConsulta;
begin
  Result := TFrmPessoaConsulta.Create(nil);
  Result.QueryConsulta := poQueryConsulta;
  Result.OnSelecionarRegistro := poOnSelecionarRegistro;
end;

end.
