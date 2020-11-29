unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, uEnum,
  Vcl.CheckLst, uConexao, pngimage, uMsg, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmTelaHeranca = class(TForm)
    pnlTitulo: TPanel;
    lblTitulo: TLabel;
    pnlBotoes: TPanel;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnApagar: TBitBtn;
    btnNavigator: TDBNavigator;
    btnFechar: TBitBtn;
    pgcPrincipal: TPageControl;
    tabListagem: TTabSheet;
    pnlListagemTopo: TPanel;
    lblIndice: TLabel;
    mskPesquisa: TMaskEdit;
    btnPesquisa: TBitBtn;
    pnlListagemCentro: TPanel;
    tabManutencao: TTabSheet;
    dtsListagem: TDataSource;
    imgIcon: TImage;
    grdListagem: TDBGrid;
    sbaListagem: TStatusBar;
    Shape1: TShape;
    qryListagem: TFDQuery;
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure mskPesquisaChange(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemTitleClick(Column: TColumn);
    procedure grdListagemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdListagemDblClick(Sender: TObject);
  private
    procedure ControlarBotoes(aFlag:Boolean);
    procedure LimparEdits;
    procedure ControlaIndiceTab(aPgcPrincipal:TPageControl; i: Integer);
    function ExisteCampoObrigatorio:Boolean;
    procedure BloqueiaCTRL_DEL_DBGrid(var Key: Word; Shift: TShiftState);
    procedure ExibirLabelIndice(aCampo: string; aLabel:TLabel);
    function RetornarCampoTraduzido(Campo: string):string;
    procedure DesabilitarEditPK;
    procedure AtualizarContagemRegistros;
  public
    EstadoDoCadastro:TEstadoDoCadastro;
    filtrado : boolean;
    IndiceAtual:string;
    SelectOriginal:string;
    {function DataToSql(Data : TDateTime) :String;}
    {procedure MarcaItensCheckListBox(itensSeparadosPontoVirgula: String;  ComponenteDestino: TCheckListBox);}
    {function GeraStringCheckListBox(Componente: TCheckListBox ) : String;}
    function Gravar(aEstadoDoCadastro:TEstadoDoCadastro):boolean; virtual;
    function Apagar:Boolean; virtual;
    procedure ConfigurarCampos; virtual;
{    function RecuperarTextoCombo(combobox : TComboBox) : String;
    function RecuperarCodigoCombo(combobox : TCombobox; codigo : string) : String;}
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}
{$region 'OBSERVAÇÕES'}
//TAG: 1 - Chave Primaria
//TAG: 2 - Campos Obrigatórios
{$endregion}


uses uUtils;

{function TfrmTelaheranca.RecuperarCodigoCombo(combobox : TCombobox; codigo : string) : String;
var i : integer;
begin
  result := '';
  with combobox do
  begin
    for I := 0 to Items.Count -1 do
    begin
      if (copy(Items[i],1,1) = Codigo) then
        result := items[i];
    end;
  end;
end;}

{function TfrmTelaHeranca.RecuperarTextoCombo(combobox: TComboBox) : String;
var i : integer;
begin
  result := '';
  with combobox do
  begin
    for I := 0 to Items.Count -1 do
    begin
      if (Items[i] = Text) then
        result := items[i];
    end;
  end;
end;}
procedure TfrmTelaHeranca.ConfigurarCampos;
begin

end;

procedure TfrmTelaHeranca.AtualizarContagemRegistros ;
var descricao  : string;
begin
  with qryListagem do
  begin
    if Active then
    begin
      if RecordCount > 1 then
        descricao := ' registros '
      else
        descricao := ' registro ';
      with sbaListagem do
      begin
        Panels[0].Width := sbaListagem.Width;
        Panels[0].Text := inttostr(qryListagem.RecordCount) + descricao;
      end;

    end;

  end;
end;

procedure TfrmTelaHeranca.DesabilitarEditPK;
var i:Integer;
begin
  for I := 0 to ComponentCount -1 do begin
    if (Components[i] is TLabeledEdit) then begin
       if (TLabeledEdit(Components[i]).Tag = 1) then begin
          TLabeledEdit(Components[i]).Enabled:=false;
          Break;
       end;
    end;
  end;
end;

{procedure TfrmTelaHeranca.MarcaItensCheckListBox(itensSeparadosPontoVirgula: String;
  ComponenteDestino: TCheckListBox);
var
    listaItens: TStringList;
    iCont, iItemLista: integer;
begin
  try
    listaItens:= Quebra(itensSeparadosPontoVirgula, ';');

    //reseta componente
    for iCont:=0 to ComponenteDestino.Count-1 do
        ComponenteDestino.Checked[iCont]:= false;

    for iCont:=0 to listaItens.Count -1 do
    begin
       iItemLista:= ComponenteDestino.Items.IndexOf(listaItens[iCont]);
       if iItemLista > -1 then ComponenteDestino.Checked[iItemLista]:= true;
    end;

  finally
     FreeAndNil(listaItens);
  end;

end;}

{function TfrmTelaHeranca.GeraStringCheckListBox(Componente: TCheckListBox): String;
var i : integer;
begin
  for i := 0 to Componente.Items.Count -1 do
  begin
    if Componente.Checked[i] then
      result := result + componente.Items.Strings[i]+';';
  end;
end;}

function TfrmTelaHeranca.RetornarCampoTraduzido(Campo: string):string;
var i:Integer;
begin
  for I := 0 to QryListagem.FieldCount-1 do begin
    if LowerCase(QryListagem.Fields[i].FieldName) = LowerCase(Campo) then begin
       Result:=QryListagem.Fields[i].DisplayLabel;
       Break;
    end;
  end;
end;

procedure TfrmTelaHeranca.ExibirLabelIndice(aCampo: string; aLabel:TLabel);
begin
  aLabel.Caption:=RetornarCampoTraduzido(aCampo);
end;

procedure TfrmTelaHeranca.BloqueiaCTRL_DEL_DBGrid(var Key: Word; Shift: TShiftState);
begin
   //Bloqueia o CTRL + DEL
   if (Shift = [ssCtrl]) and (Key = 46) then
      Key := 0;
end;

function TfrmTelaHeranca.Apagar: Boolean;
begin
  result:=true;
end;

function TfrmTelaHeranca.Gravar(aEstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
  result:=true;
end;

procedure TfrmTelaHeranca.grdListagemDblClick(Sender: TObject);
begin
  btnAlterar.Click;
end;

procedure TfrmTelaHeranca.grdListagemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  BloqueiaCTRL_DEL_DBGrid(Key, Shift);
end;

procedure TfrmTelaHeranca.grdListagemTitleClick(Column: TColumn);
begin
  IndiceAtual                :=Column.FieldName;
  QryListagem.IndexFieldNames:=IndiceAtual;
  ExibirLabelIndice(IndiceAtual, lblIndice);
  mskPesquisa.SetFocus;
end;

function TfrmTelaHeranca.ExisteCampoObrigatorio:Boolean;
var i:Integer;
begin
  Result:=False;
  for I := 0 to ComponentCount -1 do begin
    if (Components[i] is TLabeledEdit) then begin
       if (TLabeledEdit(Components[i]).Tag = 2) and (TLabeledEdit(Components[i]).Text = EmptyStr) then begin
          MessageOK(TLabeledEdit(Components[i]).EditLabel.Caption + ' é um campo obrigatório' ,mtInformation);
          if pgcPrincipal.PageCount = 2 then
            TLabeledEdit(Components[i]).SetFocus;
          Result:=True;
          Break;
       end;
    end;
    if (Components[i] is TComboBox) then begin
      with TDBLookupComboBox(Components[i]) do
      begin
         if (Tag = 2) and (Text = EmptyStr) then begin
            MessageOK(Hint + ' é um campo obrigatório' ,mtInformation);
            Result:=True;
            Break;
         end;
      end;
    end;

    if (Components[i] is TDBLookupComboBox) then begin
      with TDBLookupComboBox(Components[i]) do
      begin
         if (Tag = 2) and (Text = EmptyStr) then begin
            MessageOK(Hint + ' é um campo obrigatório' ,mtInformation);
            Result:=True;
            Break;
         end;
      end;
    end;
    if (Components[i] is TMaskEdit) then begin
      with TMaskEdit(Components[i]) do
      begin
         if (Tag = 2) and (Text = EmptyStr) then begin
            MessageOK(Hint + ' é um campo obrigatório' ,mtInformation);
            Result:=True;
            Break;
         end;
      end;
    end;
  end;
end;

procedure TfrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
{    if Assigned(oEnter) then
       FreeAndNil(oEnter);

    if Assigned(oValidador) then
       FreeAndNil(oValidador);
}
    QryListagem.Close;
  finally
    Action:=caFree;
    Self:=Nil;
  end;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
var
i : integer;
begin
{  oEnter:=TACBrEnterTab.Create(self);
  oEnter.EnterAsTab:=true;

  oValidador:=TACBrValidador.Create(self);
  oValidador.IgnorarChar:='./-';
}
  QryListagem.Connection:=DtmPrincipal.ConDataBase;
  ControlarBotoes(true);
  grdListagem.Options:=[dgTitles,
                        dgIndicator,
                        dgColumnResize,
                        dgColLines,
                        dgRowLines,
                        dgTabs,
                        dgRowSelect,
                        dgAlwaysShowSelection,
                        dgConfirmDelete,
                        dgCancelOnExit,
                        dgTitleClick,
                        dgTitleHotTrack]
end;

procedure TfrmTelaHeranca.FormShow(Sender: TObject);
begin
  Self.Position:=poScreenCenter;
  ControlaIndiceTab(pgcPrincipal, 0);
  DesabilitarEditPK;
  LimparEdits;
  if QryListagem.SQL.Text<>EmptyStr then begin
     SelectOriginal:=QryListagem.SQL.Text;
     QryListagem.Open;
     ConfigurarCampos;
     QryListagem.IndexFieldNames:=IndiceAtual;
     ExibirLabelIndice(IndiceAtual, lblIndice);
     AtualizarContagemRegistros;
     filtrado := false;
  end;
end;

procedure TfrmTelaHeranca.ControlaIndiceTab(aPgcPrincipal:TPageControl; i: Integer);
begin
  if (pgcPrincipal.Pages[i].TabVisible) then
      pgcPrincipal.TabIndex:=0;
end;

procedure TfrmTelaHeranca.LimparEdits;
Var i:Integer;
begin
  for i := 0 to ComponentCount -1 do begin
    if (Components[i] is TLabeledEdit) then
      TLabeledEdit(Components[i]).Text:=EmptyStr
    else if (Components[i] is TEdit) then
      TEdit(Components[i]).Text:=''
    else if (Components[i] is TDBLookupComboBox) then
      TDBLookupComboBox(Components[i]).KeyValue:= null
    else if (Components[i] is TComboBox) then
    begin
      TComboBox(Components[i]).ItemIndex := -1;
      TComboBox(Components[i]).Text := '';
    end else if (Components[i] is TCheckBox) then
      TCheckBox(Components[i]).Checked := false
    else if (Components[i] is TStaticText) then
      TStaticText(Components[i]).caption := ''
    else if (Components[i] is TCheckListBox) then
      TCheckListBox(Components[i]).CheckAll(cbUnchecked,false,false)
    else if (Components[i] is TMemo) then
      TMemo(Components[i]).Text:=''
    else if (Components[i] is TMaskEdit) then
      TMaskEdit(Components[i]).Text:=''
    else if (Components[i] is TImage) then begin
      if TImage(Components[i]).Tag=1 then begin
         TImage(Components[i]).Picture.Assign(nil);
      end;
    end;

  end;
end;
procedure TfrmTelaHeranca.mskPesquisaChange(Sender: TObject);
begin
  QryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text,[loPartialKey, loCaseInsensitive]);
end;

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
   ControlarBotoes(false);
   EstadoDoCadastro:=ecAlterar;
end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin
     try
       if (Apagar) then begin
          ControlarBotoes(true);
          ControlaIndiceTab(pgcPrincipal, 0);
          LimparEdits;
          QryListagem.Refresh;
       end
       else begin
         MessageERROR('Erro ao Apagar');
       end;
     finally
       EstadoDoCadastro:=ecNenhum;
     end;
     AtualizarContagemRegistros;
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
  ControlarBotoes(true);
  ControlaIndiceTab(pgcPrincipal, 0);
  EstadoDoCadastro:=ecNenhum;
  LimparEdits;
  AtualizarContagemRegistros;
end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin

   if (ExisteCampoObrigatorio) then
      Abort;

   Try
     if Gravar(EstadoDoCadastro) then
     begin
        ControlarBotoes(true);
        ControlaIndiceTab(pgcPrincipal, 0);
        EstadoDoCadastro:=ecNenhum;
        LimparEdits;
        QryListagem.Refresh;
     end
     else
     begin
       MessageERROR('Erro ao Gravar');
     end;
   Finally
   End;
   AtualizarContagemRegistros;

end;

procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
  ControlarBotoes(false);
  EstadoDoCadastro:=ecInserir;
  LimparEdits;
end;

procedure TfrmTelaHeranca.btnPesquisaClick(Sender: TObject);
var i:Integer;
    TipoCampo:TFieldType;
    NomeCampo:String;
    WhereOrAnd:String;
    CondicaoSQL:String;
begin

  if mskPesquisa.Text='' then begin
    btnPesquisa.Caption := 'Aplicar &Filtro';
    QryListagem.Close;
    QryListagem.SQL.Clear;
    QryListagem.SQL.Add(SelectOriginal);
    QryListagem.Open;
    AtualizarContagemRegistros;
    Abort;
  end;

  //Localiza o Tipo do Campo
  for I := 0 to QryListagem.FieldCount-1 do  begin
    if QryListagem.Fields[i].FieldName=IndiceAtual then begin
      TipoCampo := QryListagem.Fields[i].DataType;
      if QryListagem.Fields[i].Origin<>'' then  begin
        if Pos('.', QryListagem.Fields[i].Origin) > 0 then
          NomeCampo := QryListagem.Fields[i].Origin
        else
          NomeCampo := QryListagem.Fields[i].Origin+'.'+QryListagem.Fields[i].FieldName
      end
      else
        NomeCampo := QryListagem.Fields[i].FieldName;

      Break;
    end;
  end;

  //Verifica se irá utilizar o Where ou And
  if Pos('where',LowerCase(SelectOriginal)) > 1 then begin
    WhereOrAnd := ' and '
  end
  else begin
    WhereOrAnd := ' where ';
  end;

  if (TipoCampo=ftString) or (TipoCampo=ftWideString) then begin
     CondicaoSQL := WhereOrAnd+' '+ NomeCampo + ' LIKE '+QuotedStr('%'+mskPesquisa.Text+'%');
  end
  else if (TipoCampo = ftInteger) or (TipoCampo = ftSmallint) or (TipoCampo = ftLargeint) then begin
     CondicaoSQL := WhereOrAnd+' '+NomeCampo + '='+mskPesquisa.Text
  end
  else if (TipoCampo = ftFloat) or (TipoCampo=ftCurrency) then begin
     CondicaoSQL := WhereOrAnd+' '+NomeCampo + '='+StringReplace(mskPesquisa.Text,',','.',[rfReplaceAll]);
  end
  else if (TipoCampo = ftDate) or (TipoCampo = ftDateTime) then begin
     CondicaoSQL := WhereOrAnd+' '+NomeCampo + '='+QuotedStr(mskPesquisa.Text)
  end;

  btnPesquisa.Caption := 'Remover &Filtro';
  with qryListagem do
  begin
    Close;
    SQL.Clear;
    SQL.Add(SelectOriginal);
    SQL.Add(CondicaoSQL);
    Open;
  end;
  AtualizarContagemRegistros;
  mskPesquisa.Text := '';

end;

procedure TfrmTelaHeranca.ControlarBotoes(aFlag:Boolean);
var i : integer;
begin
  btnNovo.Enabled      :=aFlag;
  btnApagar.Enabled    :=aFlag;
  btnAlterar.Enabled   :=aFlag;
  btnNavigator.Enabled :=aFlag;

  with pgcPrincipal do
  begin
    ActivePageIndex:=integer(aFlag);
    Pages[0].TabVisible:=aFlag;
    for I := 1 to PageCount -1 do
    begin
      Pages[i].TabVisible := not (aFlag);
    end;
  end;
  btnCancelar.Enabled  :=not(aFlag);
  btnGravar.Enabled    :=not(aFlag);
end;

{function TfrmTelaHeranca.DataToSql(Data : TDateTime) :String;
begin
  result := QuotedStr(formatDateTime('yyyy/mm/dd',data));
end;}

end.
