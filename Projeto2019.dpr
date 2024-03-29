program Projeto2019;

uses
  Vcl.Forms,
  uMenuPrincipal in 'uMenuPrincipal.pas' {fMenuPrincipal},
  uFrameConsultaPadrao in 'uFrameConsultaPadrao.pas' {FrameConsultaPadrao: TFrame},
  uFrmCadastroPadrao in 'uFrmCadastroPadrao.pas' {FrmCadastroPadrao},
  uFrmCidadeCadastro in 'uFrmCidadeCadastro.pas' {FrmCidadeCadastro},
  uConfiguracaoConsulta in 'uConfiguracaoConsulta.pas',
  uDataModulePadrao in 'uDataModulePadrao.pas' {DataModulePadrao: TDataModule},
  uDMCidade in 'uDMCidade.pas' {dmCidade: TDataModule},
  uDMPessoa in 'uDMPessoa.pas' {dmPessoa: TDataModule},
  uDMPais in 'uDMPais.pas' {dmPais: TDataModule},
  uFrmEstadoCadastro in 'uFrmEstadoCadastro.pas' {FrmEstadoCadastro},
  uDMEstado in 'uDMEstado.pas' {dmEstado: TDataModule},
  uFrmConsultaPadrao in 'uFrmConsultaPadrao.pas' {FrmConsultaPadrao},
  uFrmPaisConsulta in 'uFrmPaisConsulta.pas' {FrmPaisConsulta},
  uFrmPaisCadastro in 'uFrmPaisCadastro.pas' {FrmPaisCadastro},
  uFrmEstadoConsulta in 'uFrmEstadoConsulta.pas' {FrmEstadoConsulta},
  uFrmCidadeConsulta in 'uFrmCidadeConsulta.pas' {FrmCidadeConsulta},
  uFrmPessoaCadastro in 'uFrmPessoaCadastro.pas' {FrmPessoaCadastro},
  uFrmPessoaConsulta in 'uFrmPessoaConsulta.pas' {FrmPessoaConsulta},
  uFrmFuncaoConsulta in 'uFrmFuncaoConsulta.pas' {FrmFuncaoConsulta},
  uFrmFuncaoCadastro in 'uFrmFuncaoCadastro.pas' {FrmFuncaoCadastro},
  uDMFuncao in 'uDMFuncao.pas' {dmFuncao: TDataModule},
  uFrmTimeConsulta in 'uFrmTimeConsulta.pas' {FrmTimeConsulta},
  uFrmTimeCadastro in 'uFrmTimeCadastro.pas' {FrmTimeCadastro},
  uDMTimes in 'uDMTimes.pas' {dmTimes: TDataModule},
  uFrmTimeEntrar in 'uFrmTimeEntrar.pas' {FrmTimeEntrar},
  uFrmTimeSair in 'uFrmTimeSair.pas' {FrmTimeSair},
  uFrmAgendaConsulta in 'uFrmAgendaConsulta.pas' {FrmAgendaConsulta},
  uDMAgenda in 'uDMAgenda.pas' {dmAgenda: TDataModule},
  uFrmAgendaCadastro in 'uFrmAgendaCadastro.pas' {FrmAgendaCadastro},
  uLookUp in 'uLookUp.pas',
  uILookUp in 'uILookUp.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMenuPrincipal, fMenuPrincipal);
  Application.Run;
end.
