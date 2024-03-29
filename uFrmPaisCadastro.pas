unit uFrmPaisCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPadrao, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, uDMPais, Vcl.Mask,
  Vcl.DBCtrls;

type
  TFrmPaisCadastro = class(TFrmCadastroPadrao)
    lbCdPais: TLabel;
    dfCdPais: TDBEdit;
    lbNmPais: TLabel;
    dfNmPais: TDBEdit;
  private
  protected
    function TestarRegistroValido : Boolean; override;
    function PegarCampoChave: string; override;
  public
  end;

implementation

{$R *.dfm}

uses
  uConfiguracaoConsulta;

function TFrmPaisCadastro.PegarCampoChave: string;
begin
  Result := 'IDPAIS'
end;

function TFrmPaisCadastro.TestarRegistroValido: Boolean;
var
  oField: TField;
begin
  Result := True;
  oField := QueryCadastro.FieldByName('nmPais');
  if not oField.AsString.Trim.IsEmpty then
    Exit;

  ShowMessage('Campo obrigat�rio n�o preenchido!');
  oField.FocusControl;

  Result := False;
end;

end.
