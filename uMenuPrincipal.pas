unit uMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, uCadPessoa, uDMCidade, uDMPais,
  uDMEstado, uFrmPaisConsulta, uFrmCadastroPais,
  uFrmCadastroEstado, uFrmEstadoConsulta, uFrmCadastroCidade, uFrmCidadeConsulta;

type
  TfMenuPrincipal = class(TForm)
    mmMenuPrincipal: TMainMenu;
    imCadastro: TMenuItem;
    imPessoa: TMenuItem;
    imCidade: TMenuItem;
    imEstado: TMenuItem;
    N1: TMenuItem;
    imSair: TMenuItem;
    Consulta1: TMenuItem;
    sbPrincipal: TStatusBar;
    imPais: TMenuItem;
    procedure imPessoaClick(Sender: TObject);
    procedure imCidadeClick(Sender: TObject);
    procedure imPaisClick(Sender: TObject);
    procedure imEstadoClick(Sender: TObject);
    procedure imSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMenuPrincipal: TfMenuPrincipal;

implementation

{$R *.dfm}

uses
  uDM;

procedure TfMenuPrincipal.imCidadeClick(Sender: TObject);
var
  oFrmCadastroCidade: TFrmCadastroCidade;
  oDmCidade: TdmCidade;
  oFrmCidadeConsulta: TFrmCidadeConsulta;
begin
  oFrmCadastroCidade := TFrmCadastroCidade.Create(nil);
  oFrmCidadeConsulta := TFrmCidadeConsulta.Create(nil);
  oDmCidade := TdmCidade.Create(Nil);
  try
    oFrmCidadeConsulta.QueryConsulta := oDmCidade.sqlConsulta;
    oFrmCadastroCidade.QueryCadastro := oDmCidade.sqlCidade;
    oFrmCadastroCidade.DefinirConsulta(oFrmCidadeConsulta);
    oFrmCadastroCidade.ShowModal;
  finally
    oFrmCadastroCidade.Release;
    FreeAndNil(oDmCidade);
  end;
end;

procedure TfMenuPrincipal.imEstadoClick(Sender: TObject);
var
  oFrmCadastroEstado: TFrmCadastroEstado;
  oDmEstado: TdmEstado;
  oFrmEstadoConsulta: TFrmEstadoConsulta;
begin
  oFrmCadastroEstado := TFrmCadastroEstado.Create(nil);
  oFrmEstadoConsulta := TFrmEstadoConsulta.Create(nil);
  oDmEstado := TDmEstado.Create(nil);
  try
    oFrmEstadoConsulta.QueryConsulta := oDmEstado.sqlConsulta;
    oFrmCadastroEstado.QueryCadastro := oDmEstado.sqlEstado;
    oFrmCadastroEstado.DefinirConsulta(oFrmEstadoConsulta);
    oFrmCadastroEstado.ShowModal;
  finally
    oFrmEstadoConsulta.Release;
    oFrmCadastroEstado.Release;
    FreeAndNil(oDmEstado);
  end;
end;

procedure TfMenuPrincipal.imPaisClick(Sender: TObject);
var
  oFrmCadastroPais: TFrmCadastroPais;
  oDmPais: TdmPais;
  oFrmPaisConsulta: TFrmPaisConsulta;
begin
  oFrmCadastroPais := TFrmCadastroPais.Create(nil);
  oFrmPaisConsulta := TFrmPaisConsulta.Create(nil);
  oDmPais := TdmPais.Create(nil);
  try
    oFrmPaisConsulta.QueryConsulta := oDmPais.sqlConsulta;
    oFrmCadastroPais.QueryCadastro := oDmPais.sqlPais;
    oFrmCadastroPais.DefinirConsulta(oFrmPaisConsulta);
    oFrmCadastroPais.ShowModal;
  finally
    oFrmPaisConsulta.Release;
    oFrmCadastroPais.Release;
    FreeAndNil(oDmPais);
  end;
end;

procedure TfMenuPrincipal.imPessoaClick(Sender: TObject);
begin
  fCadPessoa := TfCadPessoa.Create(Self);
  try
    fCadPessoa.ShowModal;
  finally
    fCadPessoa.Free;
  end;
end;

procedure TfMenuPrincipal.imSairClick(Sender: TObject);
begin
  Close;
end;

end.
