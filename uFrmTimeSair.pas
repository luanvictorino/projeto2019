unit uFrmTimeSair;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, uDMPessoa, Data.DB;

type
  TFrmTimeSair = class(TForm)
    pnTimeSair: TPanel;
    lbDtsaida: TLabel;
    dfDtSaida: TDBEdit;
    btConfirmar: TButton;
    btCancelar: TButton;
    dsTimesHistorico: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTimeSair: TFrmTimeSair;

implementation

{$R *.dfm}

end.
