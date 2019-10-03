unit uCadPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Mask, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfCadPessoa = class(TForm)
    pgConsPessoaEFunc: TPageControl;
    tsConsulta: TTabSheet;
    tsCadastro: TTabSheet;
    gbConsNmPessoa: TGroupBox;
    dfConsNmPessoa: TEdit;
    pnBotoes: TPanel;
    lbNumeroRegistros: TLabel;
    grConsPessoa: TDBGrid;
    btNovo: TSpeedButton;
    btConsNmPessoa: TButton;
    pgCadPessoaEFunc: TPageControl;
    tsPessoa: TTabSheet;
    tsFuncionario: TTabSheet;
    lbCdPessoa: TLabel;
    lbNmPessoa: TLabel;
    lbNuTelefone: TLabel;
    lbDeEmail: TLabel;
    lbCdCidade: TLabel;
    btPesqCidade: TSpeedButton;
    lbNmCidade: TLabel;
    lbNuCelular: TLabel;
    dfCdPessoa: TDBEdit;
    dfNmPessoa: TDBEdit;
    dfNuCelular: TDBEdit;
    dfNuTelefone: TDBEdit;
    dfDeEmail: TDBEdit;
    dfNmCidade: TDBEdit;
    dfCdCidade: TDBEdit;
    lbCdFuncionario: TLabel;
    lbCdFuncao: TLabel;
    lbDtAdmissao: TLabel;
    lbNmFuncao: TLabel;
    lbDtNasc: TLabel;
    dfNmFuncao: TDBEdit;
    btPesqFuncao: TSpeedButton;
    btExcluirFuncionario: TButton;
    dsPessoa: TDataSource;
    dsConsPessoa: TDataSource;
    dsFuncionario: TDataSource;
    pnBotoesCadastro: TPanel;
    btExcluir: TSpeedButton;
    btCancelar: TSpeedButton;
    btSalvar: TSpeedButton;
    dfCdFuncionario: TDBEdit;
    dfCdFuncao: TDBEdit;
    dfDtAdmissao: TDBEdit;
    dfDtNasc: TDBEdit;
    procedure btCancelarClick(Sender: TObject);
    procedure btConsNmPessoaClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grConsPessoaDblClick(Sender: TObject);
    procedure LigarDesligarBotoes;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btExcluirFuncionarioClick(Sender: TObject);
    procedure btPesqCidadeClick(Sender: TObject);
    procedure LimparTelaCadPessoa;
    procedure LimparTelaCadFuncionario;
    procedure dfCdCidadeChange(Sender: TObject);
    procedure dfCdFuncaoChange(Sender: TObject);
    procedure dfCdCidadeExit(Sender: TObject);
    procedure pgCadPessoaEFuncChanging(Sender: TObject;
      var AllowChange: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadPessoa: TfCadPessoa;

implementation

{$R *.dfm}

uses
  System.UITypes, FireDAC.Stan.Param, uDM;

procedure TfCadPessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.qyPessoa.Active := False;
  DM.qyFuncionario.Active := False;
end;

procedure TfCadPessoa.FormCreate(Sender: TObject);
begin
  pgConsPessoaEFunc.ActivePageIndex := 0;
  pgCadPessoaEFunc.ActivePageIndex := 0;
  DM.PessoaSchemaAdapter.Open;
  DM.qyPessoa.Active := True;
  DM.qyFuncionario.Active := True;
  LigarDesligarBotoes;
end;

procedure TfCadPessoa.FormShow(Sender: TObject);
begin
  dfConsNmPessoa.SetFocus;
end;

procedure TfCadPessoa.LigarDesligarBotoes;
begin
  btNovo.Enabled := DM.qyPessoa.State in [dsBrowse];
  btSalvar.Enabled := DM.qyPessoa.State in [dsEdit, dsInsert];
  btCancelar.Enabled := DM.qyPessoa.State in [dsEdit, dsInsert];
  btExcluir.Enabled := DM.qyPessoa.State in [dsEdit, dsBrowse];
end;

procedure TfCadPessoa.LimparTelaCadFuncionario;
begin
  dfCdFuncionario.Clear;
  dfCdFuncao.Clear;
  dfNmFuncao.Clear;
  dfDtAdmissao.Clear;
  dfDtNasc.Clear;
end;

procedure TfCadPessoa.LimparTelaCadPessoa;
begin
  dfCdPessoa.Clear;
  dfNmPessoa.Clear;
  dfNuTelefone.Clear;
  dfNuCelular.Clear;
  dfDeEmail.Clear;
  dfCdCidade.Clear;
  dfNmCidade.Clear;
end;

procedure TfCadPessoa.pgCadPessoaEFuncChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if (dfNmPessoa.Text = '') or (dfCdCidade.Text = '') then
  begin
    ShowMessage('Campos obrigatórios de Pessoa devem ser preenchidos primeiro!');
    AllowChange := False;
  end;
end;

procedure TfCadPessoa.btNovoClick(Sender: TObject);
begin
  DM.qyPessoa.Insert;
  pgConsPessoaEFunc.ActivePageIndex := 1;
  pgCadPessoaEFunc.ActivePageIndex := 0;
  dfNmPessoa.SetFocus;
  LigarDesligarBotoes;
  // dfNmPessoa.SetFocus;
end;

procedure TfCadPessoa.btPesqCidadeClick(Sender: TObject);
begin
  {fConsCidade := TfConsCidade.Create(Self);
  try

    if fConsCidade.ShowModal = mrOk then
    begin
      Self.dfCdCidade.Text := DM.qyConsCidadeIDCIDADE.AsString;
      Self.dfNmCidade.Text := DM.qyConsCidadeNMCIDADE.AsString;
    end;
  finally
    fConsCidade.Release;
    fConsCidade.Free;
  end;}

  if (DM.qyPessoa.IsEmpty) then
  begin
    ShowMessage('Nenhuma Pessoa informada.');
    if dfCdPessoa.Enabled = True then
      dfCdPessoa.SetFocus;
    exit;
  end;

end;

procedure TfCadPessoa.btConsNmPessoaClick(Sender: TObject);
begin
  DM.qyConsPessoa.Close;
  DM.qyConsPessoa.SQL.Clear;
  DM.qyConsPessoa.SQL.Add('SELECT PESSOA.*, NMCIDADE FROM PESSOA');
  DM.qyConsPessoa.SQL.Add('JOIN CIDADE ON PESSOA.IDCIDADE = CIDADE.IDCIDADE');
  DM.qyConsPessoa.SQL.Add('WHERE NMPESSOA LIKE :NMPESSOA');
  DM.qyConsPessoa.SQL.Add('ORDER BY IDPESSOA');
  DM.qyConsPessoa.ParamByName('NMPESSOA').AsString :=
    '%' + dfConsNmPessoa.Text + '%';
  DM.qyConsPessoa.Open;

  if DM.qyConsPessoa.RecordCount = 0 then
  begin
    lbNumeroRegistros.Visible := True;
    lbNumeroRegistros.Caption := 'Nenhum registro encontrado!';
  end;

  if DM.qyConsPessoa.RecordCount = 1 then
  begin
    lbNumeroRegistros.Visible := True;
    lbNumeroRegistros.Caption := 'Foi encontrado ' +
      IntToStr(DM.qyConsPessoa.RecordCount) + ' registro!';
  end;

  if DM.qyConsPessoa.RecordCount > 1 then
  begin
    lbNumeroRegistros.Visible := True;
    lbNumeroRegistros.Caption := 'Foram encontrados ' +
      IntToStr(DM.qyConsPessoa.RecordCount) + ' registros!';
  end;
end;

procedure TfCadPessoa.grConsPessoaDblClick(Sender: TObject);
var
  nPegaValor: String;
begin
  if (DM.qyConsPessoaIDPESSOA.AsInteger > 0) then
  begin
    pgConsPessoaEFunc.TabIndex := 1;
    pgCadPessoaEFunc.TabIndex := 0;
    nPegaValor := DM.qyConsPessoaIDPESSOA.AsString;

    DM.qyPessoa.Close;
    DM.qyPessoa.ParamByName('IDPESSOA').AsString := nPegaValor;
    DM.qyPessoa.Open;

    DM.qyPessoa.Edit;
    LigarDesligarBotoes;
  end;
end;

procedure TfCadPessoa.btSalvarClick(Sender: TObject);
begin
  // Estudar validações pelo banco de dados e não por linha de comando
//  if DM.qyFuncionario.State in dsEditModes then
//    DM.qyFuncionario.Post;
  if dfNmPessoa.Text = '' then
  begin
    ShowMessage('O campo Nome deve ser informado!');
    dfNmPessoa.SetFocus;
    Exit;
  end;

  if dfCdCidade.Text = '' then
  begin
    ShowMessage('O campo Cidade deve ser informado!');
    dfCdCidade.SetFocus;
    Exit;
  end;

  if DM.qyPessoa.State in dsEditModes then
    DM.qyPessoa.Post;

  DM.PessoaSchemaAdapter.ApplyUpdates(0);
  DM.PessoaSchemaAdapter.CommitUpdates;

  ShowMessage('Registro salvo!');

  LigarDesligarBotoes;
end;

procedure TfCadPessoa.dfCdCidadeChange(Sender: TObject);
begin
  if (dfCdCidade.Text <> '') then
  begin
    DM.qyBusca.Close;
    DM.qyBusca.SQL.Clear;
    DM.qyBusca.SQL.Add('SELECT NMCIDADE FROM CIDADE');
    DM.qyBusca.SQL.Add('WHERE IDCIDADE = :IDCIDADE');
    DM.qyBusca.ParamByName('IDCIDADE').AsString := dfCdCidade.Text;
    DM.qyBusca.Open;

    if (DM.qYBusca.IsEmpty) then
    begin
      ShowMessage('Cidade não encontrada');
      dfCdCidade.Clear;
      dfNmCidade.Clear;
      dfCdCidade.SetFocus;
      exit;
    end
    else
    begin
      dfNmCidade.Text := dm.qyBusca.FieldByName('NMCIDADE').AsString;
    end;
  end;
end;

procedure TfCadPessoa.dfCdCidadeExit(Sender: TObject);
begin
  if (dfCdCidade.Text = '') then
    dfNmCidade.Clear;
end;

procedure TfCadPessoa.dfCdFuncaoChange(Sender: TObject);
begin
  if (dfCdFuncao.Text <> '') then
  begin
    DM.qyBusca.Close;
    DM.qyBusca.SQL.Clear;
    DM.qyBusca.SQL.Add('SELECT NMFUNCAO FROM FUNCAO');
    DM.qyBusca.SQL.Add('WHERE IDFUNCAO = :IDFUNCAO');
    DM.qyBusca.ParamByName('IDFUNCAO').AsString := dfCdFuncao.Text;
    DM.qyBusca.Open;

    if (DM.qyBusca.IsEmpty) then
    begin
      ShowMessage('Função não encontrada');
      dfCdFuncao.Clear;
      dfNmFuncao.Clear;
      dfCdFuncao.SetFocus;
      exit;
    end
    else
    begin
      dfNmFuncao.Text := dm.qyBusca.FieldByName('NMFUNCAO').AsString;
    end;
  end;
end;

procedure TfCadPessoa.btCancelarClick(Sender: TObject);
begin
  DM.qyPessoa.Cancel;
  DM.qyPessoa.Refresh;
  DM.qyFuncionario.Refresh;
  LigarDesligarBotoes;
  pgConsPessoaEFunc.TabIndex := 0;
  dfConsNmPessoa.SetFocus;

  DM.qyPessoa.Close;
  DM.qyFuncionario.Close;
  dfNmCidade.Clear;
  dfNmFuncao.Clear;

  //LimparTelaCadPessoa;
  //LimparTelaCadFuncionario;
end;

procedure TfCadPessoa.btExcluirClick(Sender: TObject);
begin
  if DM.qyPessoaIDPESSOA.AsInteger > 0 then
  begin
    if (MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0)
      = mrYes) then
    begin
      if DM.qyPessoa.State in dsEditModes then
        DM.qyPessoa.Cancel;

      DM.qyPessoa.Delete;
      DM.PessoaSchemaAdapter.ApplyUpdates(0);
      DM.PessoaSchemaAdapter.CommitUpdates;
      dfNmCidade.Clear;
      dfNmFuncao.Clear;
      ShowMessage('O registro foi excluído com sucesso!');
      DM.qyConsPessoa.Refresh;
    end
    else
    begin
      exit;
    end;

    LigarDesligarBotoes;
    pgConsPessoaEFunc.TabIndex := 0;
    dfConsNmPessoa.SetFocus;
    dfConsNmPessoa.Clear;
    Exit;
    //DM.qyConsPessoa.Refresh;
  end;

  ShowMessage('Nenhum registro selecionado para exclusão!');
end;

procedure TfCadPessoa.btExcluirFuncionarioClick(Sender: TObject);
begin
  if DM.qyFuncionario.State in [dsInsert,dsBrowse] then
  begin
    DM.qyFuncionario.Cancel;
    LimparTelaCadFuncionario;
    Exit;
  end;

  if (MessageDlg('Deseja excluir o registro de Funcionário?', mtConfirmation, [mbYes, mbNo], 0)
    = mrYes) then
  begin
    if DM.qyFuncionario.State = dsEdit then
    DM.qyFuncionario.Cancel;
    DM.qyFuncionario.Delete;
    DM.PessoaSchemaAdapter.ApplyUpdates(0);
    DM.PessoaSchemaAdapter.CommitUpdates;
    ShowMessage('O Funcionário foi excluído com sucesso!');
    dfNmFuncao.Clear;
    pgConsPessoaEFunc.TabIndex := 0;
    dfConsNmPessoa.SetFocus;
  end
  else
  begin
    exit;
  end;
  //DM.qyFuncionario.Delete;
end;

end.
