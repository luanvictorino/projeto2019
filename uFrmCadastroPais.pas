unit uFrmCadastroPais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPadrao, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, uDMPais, Vcl.Mask,
  Vcl.DBCtrls;

type
  TFrmCadastroPais = class(TFrmCadastroPadrao)
    lbCdPais: TLabel;
    dfCdPais: TDBEdit;
    lbNmPais: TLabel;
    dfNmPais: TDBEdit;
  private
    function ValidarNmPais: boolean;
  protected
    function TestarRegistroValido : Boolean; override;
    function PegarCampoChave: string; override;
  public
  end;

implementation

{$R *.dfm}

uses
  uConfiguracaoConsulta;

function TFrmCadastroPais.PegarCampoChave: string;
begin
  Result := 'IDPAIS'
end;

function TFrmCadastroPais.TestarRegistroValido: Boolean;
begin
  Result := False;

  if not validarNmPais then
    Exit;

  Result := True;
end;

function TFrmCadastroPais.ValidarNmPais: boolean;
var
  oField: TField;
begin
  Result := True;
  oField := QueryCadastro.FieldByName('nmPais');
  if not oField.AsString.Trim.IsEmpty then
    Exit;

  ShowMessage('Campo obrigatório não preenchido!');
  oField.FocusControl;

  Result := false;
end;

end.
