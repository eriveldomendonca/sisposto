unit uCadBomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  uConexao, cBomba,uEnum,uMsg,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCadBomba = class(TfrmPadrao)
    dtsTanque: TDataSource;
    qryTanque: TFDQuery;
    fld_descricao: TLabeledEdit;
    Label1: TLabel;
    fld_tanque: TDBLookupComboBox;
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    oBomba : TBomba;
    function Gravar(aEstadoDoCadastro:TEstadoDoCadastro):boolean; override;
    function Apagar:Boolean; override;
    procedure ConfigurarCampos; override;
  public
    { Public declarations }
  end;

var
  frmCadBomba: TfrmCadBomba;

implementation

{$R *.dfm}

function TfrmCadBomba.Gravar(aEstadoDoCadastro:TEstadoDoCadastro):boolean;
begin
  if EstadoDoCadastro=ecInserir then
    Result := oBomba.Inserir
  else if EstadoDoCadastro=ecAlterar then
    Result:= oBomba.Atualizar;
end;

function TfrmCadBomba.Apagar;
begin
  if oBomba.Selecionar(QryListagem.FieldByName('id').AsInteger) then
    Result:=oBomba.Apagar;
end;

procedure TfrmCadBomba.ConfigurarCampos;
begin
  inherited;

  with qryListagem do
  begin
    fieldbyname('descricao').DisplayLabel := 'Descrição';
    fieldbyname('TipoCombustivel').DisplayLabel:='Combustível';
    fieldbyname('valorlitro').DisplayLabel:='Valor (R$)';
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

    Columns.Add();
    Columns[2].FieldName:='valorlitro';
    Columns[2].Width:=90;
  end;
end;

procedure TfrmCadBomba.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryTanque.Close;
  inherited;
end;

procedure TfrmCadBomba.FormCreate(Sender: TObject);
begin
  inherited;

  IndiceAtual:='descricao';
  oBomba := TBomba.Create(dtmPrincipal.conDataBase);
end;

procedure TfrmCadBomba.FormShow(Sender: TObject);
begin
  inherited;
  qryTanque.Open;
  //fld_tanque.KeyValue := -1;
end;

procedure TfrmCadBomba.btnAlterarClick(Sender: TObject);
begin
  if oBomba.Selecionar(QryListagem.FieldByName('id').AsInteger) then
  begin
    {carrega campos}
    fld_descricao.Text := oBomba.descricao;
    fld_tanque.KeyValue := oBomba.tanque_id;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;

  inherited;

  fld_descricao.SetFocus;
end;

procedure TfrmCadBomba.btnGravarClick(Sender: TObject);
begin
  if oBomba.VerificaSeExiste(fld_descricao.Text) and (EstadoDoCadastro=ecInserir) then
  begin
    MessageOK('Bomba já cadastrada.', mtInformation);
    fld_descricao.SetFocus;
    abort;
  end;

  with oBomba do
  begin
    descricao := fld_descricao.Text;
    if not (fld_tanque.KeyValue = Null) then
      tanque_id := fld_tanque.KeyValue;
  end;
  inherited;
end;

procedure TfrmCadBomba.btnNovoClick(Sender: TObject);
begin
  inherited;
  fld_descricao.SetFocus;
end;

end.
