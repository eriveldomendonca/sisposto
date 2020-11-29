unit uConfiguraSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  uConexao, cSistema, uEnum,uMsg,
  Vcl.ExtCtrls, Vcl.Mask;

type
  TfrmConfiguraSistema = class(TForm)
    Panel1: TPanel;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    fld_nomeposto: TLabeledEdit;
    Label1: TLabel;
    fld_percimposto: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure fld_percimpostoKeyPress(Sender: TObject; var Key: Char);
  private
    oSistema : TSistema;
    function somenteNumeros(key: Char; texto : string) : char;
  public
    { Public declarations }
  end;

var
  frmConfiguraSistema: TfrmConfiguraSistema;

implementation

{$R *.dfm}

function TfrmConfiguraSistema.somenteNumeros(key: Char; texto : string) : char;
begin
    if (Key in ['0'..'9']) or (key = ',') or (key = #8) then
    begin
      if (Key = ',') and (Pos(Key, texto) > 0) then
        result := #0
      else
        result := Key;
    end;
end;

procedure TfrmConfiguraSistema.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmConfiguraSistema.btnGravarClick(Sender: TObject);
var imposto : double;
atualiza : boolean;
begin
  try
    imposto := strtofloat(fld_percimposto.Text);
  except
    MessageERROR('Valor do imposto inválido');
    abort;
  end;
  with oSistema do
  begin
    if fld_nomeposto.Text = '' then
    begin
      MessageERROR('Nome do posto é obrigatório');
      fld_nomeposto.SetFocus;
      Abort;
    end;
    if imposto = 0 then
    begin
      MessageERROR('Imposto é obrigatório');
      fld_percimposto.SetFocus;
      Abort;
    end;
    atualiza := Selecionar;
    nomeposto := fld_nomeposto.Text;
    percimposto := imposto;

    if atualiza then
    begin
      if Atualizar = false then
        MessageERROR('Erro ao salvar!')
      else
        close;
    end else
    begin
      if Inserir = false then
        MessageERROR('Erro ao salvar!')
      else
        close;
    end;
  end;

end;

procedure TfrmConfiguraSistema.fld_percimpostoKeyPress(Sender: TObject;
  var Key: Char);
begin
  key := somenteNumeros(key, TMaskEdit(Sender).text);
end;

procedure TfrmConfiguraSistema.FormCreate(Sender: TObject);
begin
  oSistema := TSistema.Create(dtmPrincipal.conDatabase);
end;

procedure TfrmConfiguraSistema.FormShow(Sender: TObject);
begin
  with oSistema do
  begin
    if Selecionar then
    begin
       fld_nomeposto.Text := nomeposto;
       fld_percimposto.Text := formatfloat('0.00',percimposto);
    end else
    begin
      fld_nomeposto.Text := '';
      fld_percimposto.Text := '0,00';
    end;
  end;

  fld_nomeposto.SetFocus;
end;

end.
