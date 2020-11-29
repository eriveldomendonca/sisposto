unit uCadTipoCombustivel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, uFormPadrao,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  uConexao, cTipoCombustivel,uEnum,uMsg,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCadTipoCombustivel = class(TfrmPadrao)
    fld_descricao: TLabeledEdit;
    fld_valorlitro: TLabeledEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LabeledEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    oTipoCombustivel : TTipoCombustivel;
    function Gravar(aEstadoDoCadastro:TEstadoDoCadastro):boolean; override;
    function Apagar:Boolean; override;
    procedure ConfigurarCampos; override;

  public
    { Public declarations }
  end;

var
  frmCadTipoCombustivel: TfrmCadTipoCombustivel;

implementation

{$R *.dfm}

function TfrmCadTipoCombustivel.Gravar(aEstadoDoCadastro:TEstadoDoCadastro):boolean;
begin
  if EstadoDoCadastro=ecInserir then
    Result := oTipoCombustivel.Inserir
  else if EstadoDoCadastro=ecAlterar then
    Result:= oTipoCombustivel.Atualizar;
end;

procedure TfrmCadTipoCombustivel.LabeledEdit1KeyPress(Sender: TObject;
  var Key: Char);
var x : char;
begin
//  x :=somenteNumerosDec(key,TLabeledEdit(Sender).text);
//  key := x;
  if numeroOK(key) or (key in [',',#8]) then
  begin
    if (key = ',') and (Pos(Key, TLabeledEdit(Sender).text) > 0) then
        key := #0;
  end else
    key := #0;

end;

function TfrmCadTipoCombustivel.Apagar;
begin
  if oTipoCombustivel.Selecionar(QryListagem.FieldByName('id').AsInteger) then
    Result:=oTipoCombustivel.Apagar;

end;

procedure TfrmCadTipoCombustivel.ConfigurarCampos;
begin
  with qryListagem do
  begin
    fieldbyname('descricao').DisplayLabel := 'Combustível';
    fieldbyname('valorlitro').DisplayLabel:='Valor (R$)';
  end;
  with grdListagem do
  begin
    Columns.Clear;
    Columns.Add();
    Columns[0].FieldName:='descricao';
    Columns[0].Width:=200;

    Columns.Add();
    Columns[1].FieldName:='valorlitro';
    Columns[1].Title.Alignment := taRightJustify;
    Columns[1].Alignment := taRightJustify;
    Columns[1].Width:=90;
  end;
  inherited;
end;

procedure TfrmCadTipoCombustivel.FormCreate(Sender: TObject);
begin
  inherited;

  IndiceAtual:='descricao';
  oTipoCombustivel := TTipoCombustivel.Create(dtmPrincipal.conDataBase);
end;

procedure TfrmCadTipoCombustivel.btnAlterarClick(Sender: TObject);
begin
  if oTipoCombustivel.Selecionar(QryListagem.FieldByName('id').AsInteger) then
  begin
    {carrega campos}
    fld_descricao.Text := oTipoCombustivel.descricao;
    fld_valorlitro.Text := formatfloat('0.00',oTipoCombustivel.valorlitro);
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;
  fld_descricao.SetFocus;
end;

procedure TfrmCadTipoCombustivel.btnGravarClick(Sender: TObject);
begin
  if oTipoCombustivel.VerificaSeExiste(fld_descricao.Text) and (EstadoDoCadastro=ecInserir) then
  begin
    MessageOK('Tipo de combustível já cadastrado.', mtInformation);
    fld_descricao.SetFocus;
    abort;
  end;

  with oTipoCombustivel do
  begin
    descricao := fld_descricao.Text;
    try
      valorlitro := StrToFloat(Trim(fld_valorlitro.Text));
    except
    end;
  end;
  inherited;
end;

procedure TfrmCadTipoCombustivel.btnNovoClick(Sender: TObject);
begin
  inherited;
  fld_descricao.SetFocus;
  fld_valorlitro.Text := '0,00';
end;

end.
