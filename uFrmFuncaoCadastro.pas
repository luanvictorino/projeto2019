unit uFrmFuncaoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, uDMFuncao, Vcl.Mask,
  Vcl.DBCtrls;

type
  TFrmFuncaoCadastro = class(TFrmCadastroPadrao)
    lbCdFuncao: TLabel;
    dfCdFuncao: TDBEdit;
    lbNmFuncao: TLabel;
    dfNmFuncao: TDBEdit;
  private
  protected
    function TestarRegistroValido : Boolean; override;
    function PegarCampoChave: string; override;
  public
  end;

implementation

{$R *.dfm}

{ TFrmFuncaoCadastro }

function TFrmFuncaoCadastro.PegarCampoChave: string;
begin
  Result := 'IDFUNCAO';
end;

function TFrmFuncaoCadastro.TestarRegistroValido: Boolean;
var
  oField: TField;
begin
  Result := True;
  oField := QueryCadastro.FieldByName('nmFuncao');
  if not oField.AsString.Trim.IsEmpty then
    Exit;

  ShowMessage('Campo obrigatório não preenchido!');
  oField.FocusControl;

  Result := False;
end;

end.
