unit uFrmTimeCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, uDMTimes, Vcl.Mask,
  Vcl.DBCtrls;

type
  TFrmTimeCadastro = class(TFrmCadastroPadrao)
    lbCdTimes: TLabel;
    dfCdTimes: TDBEdit;
    lbNmTimes: TLabel;
    dfNmTimes: TDBEdit;
  private
  protected
    function TestarRegistroValido : Boolean; override;
    function PegarCampoChave: string; override;
  public
  end;

implementation

{$R *.dfm}

{ TFrmTimeCadastro }

function TFrmTimeCadastro.PegarCampoChave: string;
begin
  Result := 'IDTIMES';
end;

function TFrmTimeCadastro.TestarRegistroValido: Boolean;
var
  oField: TField;
begin
  Result := True;
  oField := QueryCadastro.FieldByName('NMTIMES');
  if not oField.AsString.Trim.IsEmpty then
    Exit;

  ShowMessage('Campo obrigatório não preenchido!');
  oField.FocusControl;

  Result := False;
end;

end.
