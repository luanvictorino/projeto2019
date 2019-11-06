unit uFrameConsultaPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Datasnap.DBClient,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TOnSelecionarRegistro = procedure(const RegistroSelecionado: TDataSet) of Object;

  TFrameConsultaPadrao = class(TFrame)
    dsConsulta: TDataSource;
    gbConsPadrao: TGroupBox;
    dfConsPadrao: TEdit;
    btConsultar: TBitBtn;
    grConsPadrao: TDBGrid;
    pnlDadosConsulta: TPanel;
    pnlResultadoConsulta: TPanel;
    procedure grConsPadraoDblClick(Sender: TObject);
  private
    { Private declarations }
    FNomeTabela: string;
    FCampoChave: string;
    FCampoBusca: string;
    FOnSelecionarRegistro: TOnSelecionarRegistro;
    FQueryConsulta: TFDQuery;
    procedure SelecionarRegistroInternal;
    procedure SetNomeTabela(const Value: string);
    procedure SetQueryConsulta(const Value: TFDQuery);
    procedure SetCampoChave(const Value: string);
    procedure SetCaption(const Value: string);
    procedure SetCampoBusca(const Value: string);
    procedure MontarSQLBasico;
    function GetCaption: string;
    procedure MontarSQLWhere(const sConteudoConsulta: string);
    procedure Consultar(const sConteudoConsulta: string);
  public
    procedure ExecutarConsulta(const TextoConsulta: string = '');
    procedure SelecionarRegistro;
    property CampoChave: string read FCampoChave write SetCampoChave;
    property CampoBusca: string read FCampoBusca write SetCampoBusca;
    property NomeTabela: string read FNomeTabela write SetNomeTabela;
    property QueryConsulta: TFDQuery read FQueryConsulta write SetQueryConsulta;
    property Caption: string read GetCaption write SetCaption;
  published
    property OnSelecionarRegistro: TOnSelecionarRegistro read FOnSelecionarRegistro write FOnSelecionarRegistro;
  end;

implementation

{$R *.dfm}

procedure TFrameConsultaPadrao.ExecutarConsulta(const TextoConsulta: string = '');
var
  _consulta: string;
begin
  _consulta := TextoConsulta;
  if _consulta.Trim.IsEmpty then
    _consulta := dfConsPadrao.Text;
  Consultar(_consulta);
end;

procedure TFrameConsultaPadrao.Consultar(const sConteudoConsulta: string);
begin
  MontarSQLBasico;
  MontarSQLWhere(sConteudoConsulta);
  QueryConsulta.Open;
end;

procedure TFrameConsultaPadrao.MontarSQLBasico;
var
  sSQL: string;
begin
  QueryConsulta.Close;
  QueryConsulta.SQL.Clear;
  sSQL := Format('SELECT * FROM %s ', [NomeTabela]);
  QueryConsulta.SQL.Add(sSQL);
end;

procedure TFrameConsultaPadrao.MontarSQLWhere(const sConteudoConsulta: string);
var
  sWhere: string;
begin
  if sConteudoConsulta = EmptyStr then
    Exit;

  sWhere := Format(' WHERE %s LIKE :PARAMETRO', [CampoBusca]);
  QueryConsulta.SQL.Add(sWhere);
  QueryConsulta.Params.ParamByName('PARAMETRO').Value := Format('%%%s%%', [sConteudoConsulta]);
end;

function TFrameConsultaPadrao.GetCaption: string;
begin
  Result := gbConsPadrao.Caption;
end;

procedure TFrameConsultaPadrao.grConsPadraoDblClick(Sender: TObject);
begin
  SelecionarRegistroInternal;
end;

procedure TFrameConsultaPadrao.SelecionarRegistro;
begin
  if (not QueryConsulta.Active) or QueryConsulta.IsEmpty then
    ShowMessage('Não há registros para selecionar');
  SelecionarRegistroInternal;
end;

procedure TFrameConsultaPadrao.SelecionarRegistroInternal;
begin
  if Assigned(FOnSelecionarRegistro) then
    FOnSelecionarRegistro(QueryConsulta);
end;

procedure TFrameConsultaPadrao.SetCampoBusca(const Value: string);
begin
  FCampoBusca := Value;
end;

procedure TFrameConsultaPadrao.SetCampoChave(const Value: string);
begin
  FCampoChave := Value;
end;

procedure TFrameConsultaPadrao.SetCaption(const Value: string);
begin
  gbConsPadrao.Caption := Value;
end;

procedure TFrameConsultaPadrao.SetNomeTabela(const Value: string);
begin
  FNomeTabela := Value;
end;

procedure TFrameConsultaPadrao.SetQueryConsulta(const Value: TFDQuery);
begin
  FQueryConsulta := Value;
  dsConsulta.DataSet := FQueryConsulta;
end;

end.
