program Projeto2019;

uses
  Vcl.Forms,
  uMenuPrincipal in 'uMenuPrincipal.pas' {fMenuPrincipal},
  uDM in 'uDM.pas' {DM: TDataModule},
  uCadPessoa in 'uCadPessoa.pas' {fCadPessoa},
  uFrameConsultaPadrao in 'uFrameConsultaPadrao.pas' {FrameConsultaPadrao: TFrame},
  uFrmCadastroPadrao in 'uFrmCadastroPadrao.pas' {FrmCadastroPadrao},
  uFrmCadastroCidade in 'uFrmCadastroCidade.pas' {FrmCadastroCidade},
  uConfiguracaoConsulta in 'uConfiguracaoConsulta.pas',
  uDataModulePadrao in 'uDataModulePadrao.pas' {DataModulePadrao: TDataModule},
  uDMCidade in 'uDMCidade.pas' {dmCidade: TDataModule},
  uDMPessoa in 'uDMPessoa.pas' {dmPessoa: TDataModule},
  uDMPais in 'uDMPais.pas' {dmPais: TDataModule},
  uFrmCadastroEstado in 'uFrmCadastroEstado.pas' {FrmCadastroEstado},
  uDMEstado in 'uDMEstado.pas' {dmEstado: TDataModule},
  uFrmConsultaPadrao in 'uFrmConsultaPadrao.pas' {FrmConsultaPadrao},
  uFrmPaisConsulta in 'uFrmPaisConsulta.pas' {FrmPaisConsulta},
  uFrmCadastroPais in 'uFrmCadastroPais.pas' {FrmCadastroPais},
  uFrmEstadoConsulta in 'uFrmEstadoConsulta.pas' {FrmEstadoConsulta},
  uFrmCidadeConsulta in 'uFrmCidadeConsulta.pas' {FrmCidadeConsulta};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfMenuPrincipal, fMenuPrincipal);
  Application.CreateForm(TFrmCadastroPais, FrmCadastroPais);
  Application.CreateForm(TFrmEstadoConsulta, FrmEstadoConsulta);
  Application.CreateForm(TFrmCidadeConsulta, FrmCidadeConsulta);
  Application.Run;
end.
