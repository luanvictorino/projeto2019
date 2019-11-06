unit uMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, uDMCidade, uDMPais,
  uDMEstado, uFrmPaisConsulta, uFrmPaisCadastro,
  uFrmEstadoCadastro, uFrmEstadoConsulta, uFrmCidadeCadastro, uFrmCidadeConsulta,
  uDMPessoa, uFrmPessoaCadastro, uFrmPessoaConsulta, uFrmFuncaoCadastro,
  uFrmFuncaoConsulta, uDMFuncao, uDMTimes, uFrmTimeCadastro, uFrmTimeConsulta,
  uFrmTimeSair, uFrmTimeEntrar;

type
  TfMenuPrincipal = class(TForm)
    mmMenuPrincipal: TMainMenu;
    imCadastro: TMenuItem;
    imPessoa: TMenuItem;
    imCidade: TMenuItem;
    imEstado: TMenuItem;
    N1: TMenuItem;
    imSair: TMenuItem;
    sbPrincipal: TStatusBar;
    imPais: TMenuItem;
    Funo1: TMenuItem;
    imes1: TMenuItem;
    Agenda1: TMenuItem;
    procedure imPessoaClick(Sender: TObject);
    procedure imCidadeClick(Sender: TObject);
    procedure imPaisClick(Sender: TObject);
    procedure imEstadoClick(Sender: TObject);
    procedure imSairClick(Sender: TObject);
    procedure Funo1Click(Sender: TObject);
    procedure imes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMenuPrincipal: TfMenuPrincipal;

implementation

{$R *.dfm}

procedure TfMenuPrincipal.imPessoaClick(Sender: TObject);
var
  oDmPessoa: TdmPessoa;
  oFrmPessoaCadastro: TFrmPessoaCadastro;
  oFrmPessoaConsulta: TFrmPessoaConsulta;
begin
  oFrmPessoaCadastro := TFrmPessoaCadastro.Create(nil);
  oFrmPessoaConsulta := TFrmPessoaConsulta.Create(nil);
  oDmPessoa := TdmPessoa.Create(nil);
  try
    oFrmPessoaConsulta.QueryConsulta := oDmPessoa.sqlConsulta;
    oFrmPessoaCadastro.QueryCadastro := oDmPessoa.sqlPessoa;
    oFrmPessoaCadastro.qryFuncionario := oDmPessoa.sqlFuncionario;
    oFrmPessoaCadastro.DefinirConsulta(oFrmPessoaConsulta);
    oFrmPessoaCadastro.ShowModal;
  finally
    oFrmPessoaConsulta.Release;
    oFrmPessoaCadastro.Release;
    FreeAndNil(oDmPessoa);
  end;
end;

procedure TfMenuPrincipal.Funo1Click(Sender: TObject);
var
  oFrmFuncaoCadastro: TFrmFuncaoCadastro;
  oDmFuncao: TdmFuncao;
  oFrmFuncaoConsulta: TFrmFuncaoConsulta;
begin
  oFrmFuncaoCadastro := TFrmFuncaoCadastro.Create(nil);
  oFrmFuncaoConsulta := TFrmFuncaoConsulta.Create(nil);
  oDmFuncao := TdmFuncao.Create(nil);
  try
    oFrmFuncaoConsulta.QueryConsulta := oDmFuncao.sqlConsulta;
    oFrmFuncaoCadastro.QueryCadastro := oDmFuncao.sqlFuncao;
    oFrmFuncaoCadastro.DefinirConsulta(oFrmFuncaoConsulta);
    oFrmFuncaoCadastro.ShowModal;
  finally
    oFrmFuncaoConsulta.Release;
    oFrmFuncaoCadastro.Release;
    FreeAndNil(oDmFuncao);
  end;
end;

procedure TfMenuPrincipal.imCidadeClick(Sender: TObject);
var
  oFrmCidadeCadastro: TFrmCidadeCadastro;
  oDmCidade: TdmCidade;
  oFrmCidadeConsulta: TFrmCidadeConsulta;
begin
  oFrmCidadeCadastro := TFrmCidadeCadastro.Create(nil);
  oFrmCidadeConsulta := TFrmCidadeConsulta.Create(nil);
  oDmCidade := TdmCidade.Create(Nil);
  try
    oFrmCidadeConsulta.QueryConsulta := oDmCidade.sqlConsulta;
    oFrmCidadeCadastro.QueryCadastro := oDmCidade.sqlCidade;
    oFrmCidadeCadastro.DefinirConsulta(oFrmCidadeConsulta);
    oFrmCidadeCadastro.ShowModal;
  finally
    oFrmCidadeConsulta.Release;
    oFrmCidadeCadastro.Release;
    FreeAndNil(oDmCidade);
  end;
end;

procedure TfMenuPrincipal.imes1Click(Sender: TObject);
var
  oDmtime: TDmTimes;
  oFrmTimeCadastro: TFrmTimeCadastro;
  oFrmTimeConsulta: TFrmTimeConsulta;
begin
  oFrmTimeCadastro := TFrmTimeCadastro.Create(nil);
  oFrmTimeConsulta := TFrmTimeConsulta.Create(nil);
  oDmtime := TDmTimes.Create(nil);
  try
    oFrmTimeConsulta.QueryConsulta := oDmtime.sqlConsulta;
    oFrmTimeCadastro.QueryCadastro := oDmtime.sqlTimes;
    oFrmTimeCadastro.DefinirConsulta(oFrmTimeConsulta);
    oFrmTimeCadastro.ShowModal;
  finally
    oFrmTimeConsulta.Release;
    oFrmTimeCadastro.Release;
    FreeAndNil(oDmtime);
  end;
end;

procedure TfMenuPrincipal.imEstadoClick(Sender: TObject);
var
  oDmEstado: TdmEstado;
  oFrmEstadoCadastro: TFrmEstadoCadastro;
  oFrmEstadoConsulta: TFrmEstadoConsulta;
begin
  oFrmEstadoCadastro := TFrmEstadoCadastro.Create(nil);
  oFrmEstadoConsulta := TFrmEstadoConsulta.Create(self);
  oDmEstado := TdmEstado.Create(nil);
  try
    oFrmEstadoConsulta.QueryConsulta := oDmEstado.sqlConsulta;
    oFrmEstadoCadastro.QueryCadastro := oDmEstado.sqlEstado;
    oFrmEstadoCadastro.DefinirConsulta(oFrmEstadoConsulta);
    oFrmEstadoCadastro.ShowModal;
  finally
    oFrmEstadoConsulta.Release;
    oFrmEstadoCadastro.Release;
    FreeAndNil(oDmEstado);
  end;
end;

procedure TfMenuPrincipal.imPaisClick(Sender: TObject);
var
  oDmPais: TdmPais;
  oFrmPaisCadastro: TFrmPaisCadastro;
  oFrmPaisConsulta: TFrmPaisConsulta;
begin
  oFrmPaisCadastro := TFrmPaisCadastro.Create(nil);
  oFrmPaisConsulta := TFrmPaisConsulta.Create(nil);
  oDmPais := TdmPais.Create(nil);
  try
    oFrmPaisConsulta.QueryConsulta := oDmPais.sqlConsulta;
    oFrmPaisCadastro.QueryCadastro := oDmPais.sqlPais;
    oFrmPaisCadastro.DefinirConsulta(oFrmPaisConsulta);
    oFrmPaisCadastro.ShowModal;
  finally
    oFrmPaisConsulta.Release;
    oFrmPaisCadastro.Release;
    FreeAndNil(oDmPais);
  end;
end;

procedure TfMenuPrincipal.imSairClick(Sender: TObject);
begin
  Close;
end;

end.
