unit uFrmCadastroEstado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPadrao, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, uDMEstado, Vcl.Mask,
  Vcl.DBCtrls, uFrmPaisConsulta, uDMPais;

type
  TFrmCadastroEstado = class(TFrmCadastroPadrao)
    lbCdEstado: TLabel;
    dfCdEstado: TDBEdit;
    lbNmEstado: TLabel;
    dfNmEstado: TDBEdit;
    lbUfEstado: TLabel;
    dfUfEstado: TDBEdit;
    lbCdPais: TLabel;
    dfCdPais: TDBEdit;
    lbNmPais: TLabel;
    dfNmPais: TDBEdit;
    btConsultarPais: TSpeedButton;
    procedure dfCdPaisEnter(Sender: TObject);
    procedure dfCdPaisExit(Sender: TObject);
    procedure btConsultarPaisClick(Sender: TObject);
  private
    FValue: Variant;
    function ValidarNmEstado: boolean;
    procedure MostrarNomeEstado;
    function LimparCampoPais: boolean;
    procedure MontarConsultaPais;
    procedure PassarNomePais;
    procedure VerificaTabelaVazia;
  protected
    function TestarRegistroValido: boolean; override;
    function PegarCampoChave: string; override;
  public
    { Public declarations }
  end;

var
  FrmCadastroEstado: TFrmCadastroEstado;

implementation

{$R *.dfm}

uses
  FireDAC.Stan.Param, uConfiguracaoConsulta, uDM;

function TFrmCadastroEstado.PegarCampoChave: string;
begin
  Result := 'IDESTADO'
end;

function TFrmCadastroEstado.TestarRegistroValido: boolean;
begin
  Result := false;

  if not ValidarNmEstado then
    Exit;

  if dfCdPais.Text = '' then
  begin
    ShowMessage('Campo obrigatório não preenchido!');
    dfCdPais.SetFocus;
    Exit;
  end;

  Result := True;
end;

function TFrmCadastroEstado.ValidarNmEstado: boolean;
var
  oField: TField;
begin
  Result := True;
  oField := QueryCadastro.FieldByName('nmEstado');
  if not oField.AsString.Trim.IsEmpty then
    Exit;

  ShowMessage('Campo obrigatório não preenchido!');
  oField.FocusControl;

  Result := false;
end;

procedure TFrmCadastroEstado.dfCdPaisEnter(Sender: TObject);
begin
  inherited;
  if (Sender is TDBEdit) then
    Self.FValue := TDBEdit(Sender).Text;
end;

procedure TFrmCadastroEstado.dfCdPaisExit(Sender: TObject);
var
  bValorCampoIgual: boolean;
begin
  inherited;
  bValorCampoIgual := Self.FValue = TDBEdit(Sender).Text;
  if bValorCampoIgual then
    Exit;

  MostrarNomeEstado;
end;

procedure TFrmCadastroEstado.MostrarNomeEstado;
begin
  if not LimparCampoPais then
    Exit;

  MontarConsultaPais;
  VerificaTabelaVazia;
  PassarNomePais;
end;

function TFrmCadastroEstado.LimparCampoPais: boolean;
begin
  Result := false;

  if dfCdPais.Text = EmptyStr then
  begin
    dfNmPais.Clear;
    Exit;
  end;
  Result := True;
end;

procedure TFrmCadastroEstado.MontarConsultaPais;
var
  sCampoCdPais: string;
begin
  sCampoCdPais := dfCdPais.Text;

  DM.qyBusca.Close;
  DM.qyBusca.SQL.Clear;
  DM.qyBusca.SQL.Add('SELECT * FROM PAIS');
  DM.qyBusca.SQL.Add('WHERE IDPAIS = :IDPAIS');
  DM.qyBusca.ParamByName('IDPAIS').AsString := sCampoCdPais;
  DM.qyBusca.Open;
end;

procedure TFrmCadastroEstado.VerificaTabelaVazia;
begin
  if DM.qyBusca.IsEmpty then
  begin
    ShowMessage('País não escontrado!');
    dfNmPais.Clear;
    dfCdPais.SetFocus;
  end;
end;

procedure TFrmCadastroEstado.PassarNomePais;
var
  sCampo: String;
begin
  sCampo := DM.qyBusca.FieldByName('NMPAIS').AsString;
  dfNmPais.Text := sCampo;
end;

procedure TFrmCadastroEstado.btConsultarPaisClick(Sender: TObject);
var
  oFrmPaisConsulta: TfrmPaisConsulta;
  oDmPais: TdmPais;
begin
  oFrmPaisConsulta := TfrmPaisConsulta.Create(nil);
  oDmPais := TdmPais.Create(nil);
  try
    oFrmPaisConsulta.QueryConsulta := oDmPais.sqlConsulta;
    oFrmPaisConsulta.ShowModal;
  finally
    oFrmPaisConsulta.Release;
    FreeAndNil(oDmPais);
  end;
end;

end.
