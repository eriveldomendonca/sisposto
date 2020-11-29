unit uMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  uConexao, cArquivoIni,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus;

type
  TfrmMenu = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Venda1: TMenuItem;
    Sistema1: TMenuItem;
    Configuraodosistema1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    iposdecombustvel1: TMenuItem;
    anques1: TMenuItem;
    Bombas1: TMenuItem;
    Efetuarvenda1: TMenuItem;
    Relatrios1: TMenuItem;
    Listagemdasbombas1: TMenuItem;
    Listagemdostanques1: TMenuItem;
    Listagemdostiposdecombustvel1: TMenuItem;
    N2: TMenuItem;
    Vendasporperodo1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Configuraodosistema1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure iposdecombustvel1Click(Sender: TObject);
    procedure anques1Click(Sender: TObject);
    procedure Bombas1Click(Sender: TObject);
    procedure Efetuarvenda1Click(Sender: TObject);
    procedure Listagemdostiposdecombustvel1Click(Sender: TObject);
    procedure Listagemdasbombas1Click(Sender: TObject);
    procedure Listagemdostanques1Click(Sender: TObject);
    procedure Vendasporperodo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

uses uConfiguraSistema, uCadTipoCombustivel, uCadTanque, uCadBomba, uCadVenda,
  uRelBomba, uRelTanque, uRelTipoCombustivel, uRelVenda;

procedure TfrmMenu.anques1Click(Sender: TObject);
begin
  with frmCadTanque do
  begin
    try
      frmCadTanque:= TfrmCadTanque.Create(self);
      ShowModal;
    finally
      if Assigned(frmCadTanque) then
         frmCadTanque.Release;
    end;
  end;

end;

procedure TfrmMenu.Bombas1Click(Sender: TObject);
begin
  with frmCadBomba do
  begin
    try
      frmCadBomba:= TfrmCadBomba.Create(self);
      ShowModal;
    finally
      if Assigned(frmCadBomba) then
         frmCadBomba.Release;
    end;
  end;
end;

procedure TfrmMenu.Configuraodosistema1Click(Sender: TObject);
begin
  with frmConfiguraSistema do
  begin
    try
      frmConfiguraSistema:= TfrmConfiguraSistema.Create(self);
      ShowModal;
    finally
      if Assigned(frmConfiguraSistema) then
         frmConfiguraSistema.Release;
    end;
  end;

end;

procedure TfrmMenu.Efetuarvenda1Click(Sender: TObject);
begin
  with frmCadVenda do
  begin
    try
      frmCadVenda:= TfrmCadVenda.Create(self);
      ShowModal;
    finally
      if Assigned(frmCadVenda) then
         frmCadVenda.Release;
    end;
  end;
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
var ini : TArquivoIni;
begin
  ini := TArquivoIni.Create;
  with ini do
  begin
    AtualizarIni('SISPosto','Database',extractfilepath(ini.ArquivoIni)+'BANCO.FDB');
  end;
  with dtmPrincipal.conDatabase do
  begin
    Params.LoadFromFile('.\bd\config.ini');
    Connected := true;
  end;
end;

procedure TfrmMenu.iposdecombustvel1Click(Sender: TObject);
begin
  with frmCadTipoCombustivel do
  begin
    try
      frmCadTipoCombustivel:= TfrmCadTipoCombustivel.Create(self);
      ShowModal;
    finally
      if Assigned(frmCadTipoCombustivel) then
         frmCadTipoCombustivel.Release;
    end;
  end;
end;

procedure TfrmMenu.Listagemdasbombas1Click(Sender: TObject);
begin
  with frmRelBomba do
  begin
    try
      frmRelBomba:= TfrmRelBomba.Create(self);
      ShowModal;
    finally
      if Assigned(frmRelBomba) then
         frmRelBomba.Release;
    end;
  end;
end;

procedure TfrmMenu.Listagemdostanques1Click(Sender: TObject);
begin
  with frmRelTanque do
  begin
    try
      frmRelTanque:= TfrmRelTanque.Create(self);
      ShowModal;
    finally
      if Assigned(frmRelTanque) then
         frmRelTanque.Release;
    end;
  end;
end;

procedure TfrmMenu.Listagemdostiposdecombustvel1Click(Sender: TObject);
begin
  with frmRelTipoCombustivel do
  begin
    try
      frmRelTipoCombustivel:= TfrmRelTipoCombustivel.Create(self);
      ShowModal;
    finally
      if Assigned(frmRelTipoCombustivel) then
         frmRelTipoCombustivel.Release;
    end;
  end;
end;

procedure TfrmMenu.Sair1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmMenu.Vendasporperodo1Click(Sender: TObject);
begin
  with frmRelVenda do
  begin
    try
      frmRelVenda:= TfrmRelVenda.Create(self);
      ShowModal;
    finally
      if Assigned(frmRelVenda) then
         frmRelVenda.Release;
    end;
  end;
end;

end.
