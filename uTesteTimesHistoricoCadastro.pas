unit uTesteTimesHistoricoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
  FireDAC.Comp.Client, uDMTimesHistorico;

type
  TFrmTimesHistorico = class(TForm)
    pnTimesHistoricoPrincipal: TPanel;
    gbFuncionarioConsulta: TGroupBox;
    dfCdFuncionario: TDBEdit;
    dfNmFuncionario: TDBEdit;
    btFuncionarioConsulta: TSpeedButton;
    dfCdTime: TDBEdit;
    dfNmTime: TDBEdit;
    btTimeConsultar: TSpeedButton;
    lbTime: TLabel;
    dfDtEntrada: TDBEdit;
    lbDtEntrada: TLabel;
    dfDtSaida: TDBEdit;
    lbDtSaida: TLabel;
    pnBotoes: TPanel;
    btNovo: TButton;
    btSalvar: TButton;
    btCancelar: TButton;
    btExcluir: TButton;
    dsCadastro: TDataSource;
    procedure btNovoClick(Sender: TObject);
  private
    FQueryCadastro: TFDQuery;
    procedure SetQueryCadastro(const Value: TFDQuery);
  protected
    property QueryCadastro: TFDQuery read FQueryCadastro write SetQueryCadastro;
  public
  end;

var
  FrmTimesHistorico: TFrmTimesHistorico;

implementation

{$R *.dfm}

{ TFrmTimesHistorico }

procedure TFrmTimesHistorico.btNovoClick(Sender: TObject);
begin
  QueryCadastro.Insert;
end;

procedure TFrmTimesHistorico.SetQueryCadastro(const Value: TFDQuery);
begin
  FQueryCadastro := Value;
  dsCadastro.DataSet := FQueryCadastro;
end;

end.
