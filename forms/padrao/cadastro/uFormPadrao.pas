unit uFormPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  uMsg, uEnum, uConexao, Vcl.CheckLst;

type
  TfrmPadrao = class(TForm)
    pnlTitulo: TPanel;
    Shape1: TShape;
    lblTitulo: TLabel;
    imgIcon: TImage;
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
    pnlListagemCentro: TPanel;
    grdListagem: TDBGrid;
    sbaListagem: TStatusBar;
    tabManutencao: TTabSheet;
    dtsListagem: TDataSource;
    qryListagem: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mskPesquisaChange(Sender: TObject);
    procedure grdListagemDblClick(Sender: TObject);
    procedure grdListagemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdListagemTitleClick(Column: TColumn);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
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
    function Gravar(aEstadoDoCadastro:TEstadoDoCadastro):boolean; virtual;
    function Apagar:Boolean; virtual;
    procedure ConfigurarCampos; virtual;
    function numeroOk(tecla : char) : boolean;
  end;

var
  frmPadrao: TfrmPadrao;

implementation

{$R *.dfm}

function TfrmPadrao.numeroOk(tecla : char) : boolean;
begin
  result := tecla in ['0'..'9'];
end;

procedure TfrmPadrao.ConfigurarCampos;
begin

end;

function TfrmPadrao.Apagar: Boolean;
begin
  result:=true;
end;

function TfrmPadrao.Gravar(aEstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
  result:=true;
end;

procedure TfrmPadrao.grdListagemDblClick(Sender: TObject);
begin
  btnAlterar.Click;
end;

procedure TfrmPadrao.grdListagemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  BloqueiaCTRL_DEL_DBGrid(Key, Shift);
end;

procedure TfrmPadrao.grdListagemTitleClick(Column: TColumn);
begin
  IndiceAtual                :=Column.FieldName;
  QryListagem.IndexFieldNames:=IndiceAtual;
  ExibirLabelIndice(IndiceAtual, lblIndice);
  mskPesquisa.SetFocus;
end;

procedure TfrmPadrao.AtualizarContagemRegistros ;
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

procedure TfrmPadrao.DesabilitarEditPK;
var i:Integer;
begin
  for I := 0 to ComponentCount -1 do
  begin
    if (Components[i] is TLabeledEdit) then
    begin
       if (TLabeledEdit(Components[i]).Tag = 1) then
       begin
          TLabeledEdit(Components[i]).Enabled:=false;
          Break;
       end;
    end;
  end;
end;

function TfrmPadrao.RetornarCampoTraduzido(Campo: string):string;
var i:Integer;
begin
  for I := 0 to QryListagem.FieldCount-1 do
  begin
    if LowerCase(QryListagem.Fields[i].FieldName) = LowerCase(Campo) then
    begin
       Result:=QryListagem.Fields[i].DisplayLabel;
       Break;
    end;
  end;
end;

procedure TfrmPadrao.ExibirLabelIndice(aCampo: string; aLabel:TLabel);
begin
  aLabel.Caption:=RetornarCampoTraduzido(aCampo);
end;

procedure TfrmPadrao.BloqueiaCTRL_DEL_DBGrid(var Key: Word; Shift: TShiftState);
begin
   //Bloqueia o CTRL + DEL
   if (Shift = [ssCtrl]) and (Key = 46) then
      Key := 0;
end;

procedure TfrmPadrao.btnAlterarClick(Sender: TObject);
begin
   ControlarBotoes(false);
   EstadoDoCadastro:=ecAlterar;
end;

procedure TfrmPadrao.btnApagarClick(Sender: TObject);
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

procedure TfrmPadrao.btnCancelarClick(Sender: TObject);
begin
  ControlarBotoes(true);
  ControlaIndiceTab(pgcPrincipal, 0);
  EstadoDoCadastro:=ecNenhum;
  LimparEdits;
  AtualizarContagemRegistros;
end;

procedure TfrmPadrao.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPadrao.btnGravarClick(Sender: TObject);
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

procedure TfrmPadrao.btnNovoClick(Sender: TObject);
begin
  ControlarBotoes(false);
  EstadoDoCadastro:=ecInserir;
  LimparEdits;
end;

function TfrmPadrao.ExisteCampoObrigatorio:Boolean;
var i:Integer;
begin
  Result:=False;
  for I := 0 to ComponentCount -1 do
  begin
    if (Components[i] is TLabeledEdit) then
    begin
       if (TLabeledEdit(Components[i]).Tag = 2) and (TLabeledEdit(Components[i]).Text = EmptyStr) then
       begin
          MessageOK(TLabeledEdit(Components[i]).EditLabel.Caption + ' é um campo obrigatório' ,mtInformation);
          if pgcPrincipal.PageCount = 2 then
            TLabeledEdit(Components[i]).SetFocus;
          Result:=True;
          Break;
       end;
       try
         if (TLabeledEdit(Components[i]).Tag = 3) then
         begin
            if TLabeledEdit(Components[i]).Text = '' then
            begin
              MessageOK(TLabeledEdit(Components[i]).EditLabel.Caption + ' é um campo obrigatório' ,mtInformation);
              if pgcPrincipal.PageCount = 2 then
                TLabeledEdit(Components[i]).SetFocus;
              Result:=True;
              Break;
            end else if ((StrToFloat(TLabeledEdit(Components[i]).Text)) = 0) then
            begin
              MessageOK(TLabeledEdit(Components[i]).EditLabel.Caption + ' é um campo obrigatório' ,mtInformation);
              if pgcPrincipal.PageCount = 2 then
                TLabeledEdit(Components[i]).SetFocus;
              Result:=True;
              Break;
            end;
         end;
       except
          Break;
       end;
    end;
    if (Components[i] is TComboBox) then
    begin
      with TComboBox(Components[i]) do
      begin
         if (Tag = 2) and (ItemIndex < 0) then
         begin
            MessageOK(Hint + ' é um campo obrigatório' ,mtInformation);
            Result:=True;
            Break;
         end;
      end;
    end;

    if (Components[i] is TDBLookupComboBox) then
    begin
      with TDBLookupComboBox(Components[i]) do
      begin
         if (Tag = 2) and (KeyValue < 0) then
         begin
            MessageOK(Hint + ' é um campo obrigatório' ,mtInformation);
            Result:=True;
            Break;
         end;
      end;
    end;
    if (Components[i] is TMaskEdit) then
    begin
      with TMaskEdit(Components[i]) do
      begin
         if (Tag = 2) and (Text = '') then
         begin
            MessageOK(Hint + ' é um campo obrigatório' ,mtInformation);
            Result:=True;
            Break;
         end;
      end;
    end;
  end;
end;

procedure TfrmPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    QryListagem.Close;
  finally
    Action:=caFree;
    Self:=Nil;
  end;
end;

procedure TfrmPadrao.FormCreate(Sender: TObject);
var
i : integer;
begin
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
                        dgTitleHotTrack];
end;

procedure TfrmPadrao.FormShow(Sender: TObject);
begin
  Self.Position:=poScreenCenter;
  ControlaIndiceTab(pgcPrincipal, 0);
  DesabilitarEditPK;
  LimparEdits;
  if QryListagem.SQL.Text<>EmptyStr then
  begin
     SelectOriginal:=QryListagem.SQL.Text;
     QryListagem.Open;
     ConfigurarCampos;
     QryListagem.IndexFieldNames:=IndiceAtual;
     ExibirLabelIndice(IndiceAtual, lblIndice);
     AtualizarContagemRegistros;
     filtrado := false;
  end;
end;

procedure TfrmPadrao.ControlaIndiceTab(aPgcPrincipal:TPageControl; i: Integer);
begin
  if (pgcPrincipal.Pages[i].TabVisible) then
      pgcPrincipal.TabIndex:=0;
end;

procedure TfrmPadrao.LimparEdits;
Var i:Integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if (Components[i] is TLabeledEdit) then
      TLabeledEdit(Components[i]).Text:=EmptyStr
    else if (Components[i] is TEdit) then
      TEdit(Components[i]).Text:=''
    else if (Components[i] is TDBLookupComboBox) then
      TDBLookupComboBox(Components[i]).KeyValue:= -1
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
    else if (Components[i] is TImage) then
    begin
      if TImage(Components[i]).Tag=1 then
      begin
         TImage(Components[i]).Picture.Assign(nil);
      end;
    end;
  end;
end;

procedure TfrmPadrao.mskPesquisaChange(Sender: TObject);
begin
  QryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text,[loPartialKey, loCaseInsensitive]);
end;

procedure TfrmPadrao.ControlarBotoes(aFlag:Boolean);
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


end.
