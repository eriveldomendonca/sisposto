program sisposto;

uses
  Vcl.Forms,
  uMenu in 'forms\menu\uMenu.pas' {frmMenu},
  uConexao in 'datamodules\uConexao.pas' {dtmPrincipal: TDataModule},
  cArquivoIni in 'base\cArquivoIni.pas',
  cBase in 'base\cBase.pas',
  uEnum in 'base\uEnum.pas',
  uMsg in 'base\uMsg.pas',
  uUtils in 'base\uUtils.pas',
  cTipoCombustivel in 'dao\cTipoCombustivel.pas',
  cTanque in 'dao\cTanque.pas',
  cBomba in 'dao\cBomba.pas',
  cVenda in 'dao\cVenda.pas',
  uCadTipoCombustivel in 'forms\tipocombustivel\uCadTipoCombustivel.pas' {frmCadTipoCombustivel},
  uCadTanque in 'forms\tanque\uCadTanque.pas' {frmCadTanque},
  uCadBomba in 'forms\bomba\uCadBomba.pas' {frmCadBomba},
  uCadVenda in 'forms\venda\uCadVenda.pas' {frmCadVenda},
  cSistema in 'dao\cSistema.pas',
  uConfiguraSistema in 'forms\sistema\uConfiguraSistema.pas' {frmConfiguraSistema},
  uFormPadrao in 'forms\padrao\cadastro\uFormPadrao.pas' {frmPadrao},
  uRelBomba in 'relatorios\bomba\uRelBomba.pas' {frmRelBomba},
  uRelTanque in 'relatorios\tanque\uRelTanque.pas' {frmRelTanque},
  uRelTipoCombustivel in 'relatorios\tipocombustivel\uRelTipoCombustivel.pas' {frmRelTipoCombustivel},
  uFormPadraoRelatorio in 'forms\padrao\relatorio\uFormPadraoRelatorio.pas' {frmPadraoRelatorioList},
  uFormPadraoRelatorioGroup in 'forms\padrao\relatorio\uFormPadraoRelatorioGroup.pas' {frmPadraoRelatorioGroup},
  uRelVenda in 'relatorios\venda\uRelVenda.pas' {frmRelVenda};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdtmPrincipal, dtmPrincipal);
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
end.
