unit uFrmAgendaConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPadrao, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, uFrameConsultaPadrao,
  FireDAC.Comp.Client, uConfiguracaoConsulta, uDMAgenda;

type
  TFrmAgendaConsulta = class(TFrmConsultaPadrao)
  private
  protected
    procedure ConfigurarFmeConsulta; override;
  public
    class function PegarAgendaConsulta(const poQueryConsulta: TFDQuery;
      const poOnSelecionarRegistro: TOnSelecionarRegistro): TFrmAgendaConsulta;
  end;

var
  FrmAgendaConsulta: TFrmAgendaConsulta;

implementation

{$R *.dfm}

{ TFrmAgendaConsulta }

procedure TFrmAgendaConsulta.ConfigurarFmeConsulta;
var
  rConfiguracaoConsulta: TConfiguracaoConsulta;
begin
  inherited;
  rConfiguracaoConsulta.NomeTabela := 'AGENDA';
  rConfiguracaoConsulta.CampoBusca := 'NMPESSOA';
  rConfiguracaoConsulta.CampoChave := 'IDAGENDA';
  rConfiguracaoConsulta.Caption := 'Consulta de Compromissos por Pessoa';
  DefinirConfiguracoesConsulta(rConfiguracaoConsulta);
end;

class function TFrmAgendaConsulta.PegarAgendaConsulta(
  const poQueryConsulta: TFDQuery;
  const poOnSelecionarRegistro: TOnSelecionarRegistro): TFrmAgendaConsulta;
begin
  Result := TFrmAgendaConsulta.Create(nil);
  Result.QueryConsulta := poQueryConsulta;
  Result.OnSelecionarRegistro := poOnSelecionarRegistro;
end;

end.
