unit uCadTanque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  uConexao, cTanque,uEnum,uMsg,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCadTanque = class(TfrmPadrao)
    fld_descricao: TLabeledEdit;
    Label1: TLabel;
    fld_tipocombustivel: TDBLookupComboBox;
    qryTipoCombustivel: TFDQuery;
    dtsTipoCombustivel: TDataSource;
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    oTanque : TTanque;
    function Gravar(aEstadoDoCadastro:TEstadoDoCadastro):boolean; override;
    function Apagar:Boolean; override;
    procedure ConfigurarCampos; override;
  public
    { Public declarations }
  end;

var
  frmCadTanque: TfrmCadTanque;

implementation

{$R *.dfm}

function TfrmCadTanque.Gravar(aEstadoDoCadastro:TEstadoDoCadastro):boolean;
begin
  if EstadoDoCadastro=ecInserir then
    Result := oTanque.Inserir
  else if EstadoDoCadastro=ecAlterar then
    Result:= oTanque.Atualizar;
end;

function TfrmCadTanque.Apagar;
begin
  if oTanque.Selecionar(QryListagem.FieldByName('id').AsInteger) then
    Result:=oTanque.Apagar;
end;

procedure TfrmCadTanque.ConfigurarCampos;
begin
  inherited;

  with qryListagem do
  begin
    fieldbyname('descricao').DisplayLabel := 'Descrição';
    fieldbyname('TipoCombustivel').DisplayLabel:='Combustível';
  end;
  with grdListagem do
  begin
    Columns.Clear;
    Columns.Add();
    Columns[0].FieldName:='descricao';
    Columns[0].Width:=200;

    Columns.Add();
    Columns[1].FieldName:='tipocombustivel';
    Columns[1].Width:=120;
  end;
end;

procedure TfrmCadTanque.btnAlterarClick(Sender: TObject);
begin
  if oTanque.Selecionar(QryListagem.FieldByName('id').AsInteger) then
  begin
    {carrega campos}
    fld_descricao.Text := oTanque.descricao;
    fld_tipocombustivel.KeyValue := oTanque.tipocombustivel_id;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;
  fld_descricao.SetFocus;
end;

procedure TfrmCadTanque.btnGravarClick(Sender: TObject);
begin
  if oTanque.VerificaSeExiste(fld_descricao.Text) and (EstadoDoCadastro=ecInserir) then
  begin
    MessageOK('Tanque já cadastrado.', mtInformation);
    fld_descricao.SetFocus;
    abort;
  end;

  with oTanque do
  begin
    descricao := fld_descricao.Text;
    if not (fld_tipocombustivel.KeyValue = Null) then
      tipocombustivel_id := fld_tipocombustivel.KeyValue;
  end;
  inherited;
end;

procedure TfrmCadTanque.btnNovoClick(Sender: TObject);
begin
  inherited;
  fld_descricao.SetFocus;
end;

procedure TfrmCadTanque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryTipoCombustivel.Close;
  inherited;
end;

procedure TfrmCadTanque.FormCreate(Sender: TObject);
begin
  inherited;

  IndiceAtual:='descricao';
  oTanque := TTanque.Create(dtmPrincipal.conDataBase);
end;

procedure TfrmCadTanque.FormShow(Sender: TObject);
begin
  inherited;
  qryTipoCombustivel.Open;
end;

end.
