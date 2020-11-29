unit uCadVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  uConexao, cVenda, cBomba, cSistema, uEnum,uMsg,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCadVenda = class(TfrmPadrao)
    fld_datavenda: TMaskEdit;
    Label1: TLabel;
    qryBomba: TFDQuery;
    dtsBomba: TDataSource;
    fld_bomba: TDBLookupComboBox;
    Label2: TLabel;
    fld_valorlitro: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    fld_percimposto: TMaskEdit;
    fld_valortotal: TMaskEdit;
    Label6: TLabel;
    qryListagemDATAVENDA: TDateField;
    qryListagembomba: TWideStringField;
    qryListagemcombustivel: TWideStringField;
    qryListagemQTDLITRO: TSingleField;
    qryListagemVALORLITRO: TSingleField;
    qryListagemPERCIMPOSTO: TSingleField;
    qryListagemtotalvenda: TFloatField;
    qryListagemtotalimposto: TFloatField;
    qryListagemID: TIntegerField;
    fld_qtdlitro: TLabeledEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure fld_bombaExit(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fld_qtdlitroKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure fld_qtdlitroExit(Sender: TObject);
  private
    oBomba : TBomba;
    oVenda : TVenda;
    oSistema : TSistema;
    procedure calculatotal;
    function Gravar(aEstadoDoCadastro:TEstadoDoCadastro):boolean; override;
    function Apagar:Boolean; override;
    procedure ConfigurarCampos; override;
  public
    { Public declarations }
  end;

var
  frmCadVenda: TfrmCadVenda;

implementation

{$R *.dfm}
procedure TfrmCadVenda.calculatotal;
begin
  try
    fld_valortotal.Text := formatfloat('0.00',strtoFloat(Trim(fld_qtdlitro.Text))*strtoFloat(Trim(fld_valorlitro.Text)));
  except
    fld_valortotal.Text := '0,00';
  end;
end;

function TfrmCadVenda.Gravar(aEstadoDoCadastro:TEstadoDoCadastro):boolean;
begin
  if EstadoDoCadastro=ecInserir then
    Result := oVenda.Inserir
  else if EstadoDoCadastro=ecAlterar then
     Result:= oVenda.Atualizar;
end;

function TfrmCadVenda.Apagar;
begin
  if oVenda.Selecionar(QryListagem.FieldByName('id').AsInteger) then
    Result:=oVenda.Apagar;
end;

procedure TfrmCadVenda.ConfigurarCampos;
begin
  inherited;

  with qryListagem do
  begin
    fieldbyname('datavenda').DisplayLabel := 'Data Venda';
    fieldbyname('bomba').DisplayLabel:='Bomba';
    fieldbyname('combustivel').DisplayLabel:='Combustível';
    fieldbyname('qtdlitro').DisplayLabel:='Quantidade';
    fieldbyname('valorlitro').DisplayLabel:='Litro (R$)';
    fieldbyname('percimposto').DisplayLabel:='Imposto (%)';
    fieldbyname('totalimposto').DisplayLabel:='Imposto (R$)';
    fieldbyname('totalvenda').DisplayLabel:='Total (R$)';
  end;
end;

procedure TfrmCadVenda.btnAlterarClick(Sender: TObject);
begin
  with oVenda do
  begin
    if Selecionar(QryListagem.FieldByName('id').AsInteger) then
    begin
      {carrega campos}
      fld_datavenda.Text := FormatDateTime('dd/mm/yyyy',datavenda);
      fld_qtdlitro.Text := formatfloat('0.00',qtdlitro);
      fld_bomba.KeyValue := bomba_id;
      fld_valorlitro.Text := formatfloat('0.00',valorlitro);
      fld_percimposto.Text := formatfloat('0.00',percimposto);
      calculatotal;
    end
    else begin
      btnCancelar.Click;
      Abort;
    end;
  end;

  inherited;
end;

procedure TfrmCadVenda.btnGravarClick(Sender: TObject);
var vDataVenda : TDate;
vQtdLitro : double;
begin
  try
    vDataVenda := StrtoDate(fld_datavenda.Text);
  except
    MessageERROR('Data inválida');
    abort;
  end;
  try
    if StrToFloat(fld_qtdlitro.Text) = 0 then
      fld_qtdlitro.Text := '';
    vQtdLitro := StrToFloat(fld_qtdlitro.Text);
  except
    MessageERROR('Quantidade de litros é obrigatória');
    fld_qtdlitro.Text := '0,00';
    Abort;
  end;
  with oVenda do
  begin
    datavenda := vDataVenda;
    qtdlitro := vQtdLitro;
    if fld_bomba.KeyValue >= 0 then
      bomba_id := fld_bomba.KeyValue;
    valorlitro := StrToFloat(fld_valorlitro.Text);
    percimposto := StrToFloat(fld_percimposto.Text);
  end;
  inherited;
end;

procedure TfrmCadVenda.btnNovoClick(Sender: TObject);
begin
  if not (oSistema.Selecionar) then
  begin
    MessageERROR('Sistema ainda não configurado');
    close;
  end;
  inherited;
  fld_datavenda.SetFocus;
  fld_qtdlitro.Text := '0,00';
  fld_valorlitro.Text := '0,00';
  fld_percimposto.Text := formatfloat('0.00',oSistema.percimposto);
  fld_valortotal.Text := '0,00';
end;

procedure TfrmCadVenda.fld_bombaExit(Sender: TObject);

begin
  inherited;
  if (fld_bomba.KeyValue >= 0) then
  begin
    if oBomba.Selecionar(fld_bomba.KeyValue) then
    begin
      fld_valorlitro.Text := formatfloat('0.00',oBomba.tanque.tipocombustivel.valorlitro);
      try
        fld_valortotal.Text := formatfloat('0.00',oBomba.tanque.tipocombustivel.valorlitro*StrToFloat(fld_qtdlitro.Text));
      except

      end;
    end;
  end;
end;

procedure TfrmCadVenda.fld_qtdlitroExit(Sender: TObject);
begin
  try
    fld_valortotal.Text := formatfloat('0.00',oBomba.tanque.tipocombustivel.valorlitro*StrToFloat(fld_qtdlitro.Text));
  except

  end;

end;

procedure TfrmCadVenda.fld_qtdlitroKeyPress(Sender: TObject; var Key: Char);
begin
    if numeroOK(key) or (key in [',',#8]) then
  begin
    if (key = ',') and (Pos(Key, TLabeledEdit(Sender).text) > 0) then
        key := #0;
  end else
    key := #0;
end;

procedure TfrmCadVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryBomba.Close;
  inherited;
end;

procedure TfrmCadVenda.FormCreate(Sender: TObject);
begin
  inherited;
  oVenda := TVenda.Create(dtmPrincipal.conDatabase);
  oBomba := TBomba.Create(dtmPrincipal.conDatabase);
  oSistema := TSistema.Create(dtmPrincipal.conDatabase);
end;

procedure TfrmCadVenda.FormShow(Sender: TObject);
begin
  inherited;
  qryBomba.Open;
end;

end.
