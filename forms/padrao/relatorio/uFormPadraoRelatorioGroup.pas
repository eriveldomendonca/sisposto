unit uFormPadraoRelatorioGroup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, RLReport, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  cSistema, uConexao,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPadraoRelatorioGroup = class(TForm)
    pgcPrincipal: TPageControl;
    tsRelatorio: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    btnImprimir: TBitBtn;
    btnVisualizar: TBitBtn;
    btnFechar: TBitBtn;
    rlRelatorio: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLSystemInfo3: TRLSystemInfo;
    RLDraw1: TRLDraw;
    RLDraw3: TRLDraw;
    Label1: TLabel;
    qryListagem: TFDQuery;
    dtsListagem: TDataSource;
    RLLabel2: TRLLabel;
    qrySistema: TFDQuery;
    dtsSistema: TDataSource;
    RLDBText5: TRLDBText;
    RLGroup1: TRLGroup;
    RLLabel10: TRLLabel;
    RLGroup2: TRLGroup;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLBand6: TRLBand;
    procedure btnFecharClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure rlNomePostoBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    oSistema : TSistema;
  public
    filtro : String;
    sqlpadrao, sqlfinal : String;
    function somenteNumerosInt(key: Char; texto : string) : char;
    function somenteNumerosDec(key: Char; texto : string) : char;
  end;

var
  frmPadraoRelatorioGroup: TfrmPadraoRelatorioGroup;

implementation

{$R *.dfm}

function TfrmPadraoRelatorioGroup.somenteNumerosInt(key: Char; texto : string) : char;
begin
    if (Key in ['0'..'9']) or (key = #8) then
    begin
      if (Key = ',') and (Pos(Key, texto) > 0) then
        result := #0
      else
        result := Key;
    end;
end;

function TfrmPadraoRelatorioGroup.somenteNumerosDec(key: Char; texto : string) : char;
begin
    if (Key in ['0'..'9']) or (key = ',') or (key = #8) then
    begin
      if (Key = ',') and (Pos(Key, texto) > 0) then
        result := #0
      else
        result := Key;
    end;
end;

procedure TfrmPadraoRelatorioGroup.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPadraoRelatorioGroup.btnImprimirClick(Sender: TObject);
begin
  with qrySistema do
  begin
    open;
  end;
  with qryListagem do
  begin
    open;
  end;
  with rlRelatorio do
  begin
    Print;
  end;
end;

procedure TfrmPadraoRelatorioGroup.btnVisualizarClick(Sender: TObject);
begin
  with qrySistema do
  begin
    open;
  end;
  with qryListagem do
  begin
    open;
  end;
  with rlRelatorio do
  begin
    Preview;
  end;
end;

procedure TfrmPadraoRelatorioGroup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qrySistema.Close;
  qryListagem.Close;
end;

procedure TfrmPadraoRelatorioGroup.FormCreate(Sender: TObject);
begin
  oSistema := TSistema.Create(dtmPrincipal.conDatabase);
  sqlpadrao := qryListagem.SQL.Text;
end;

procedure TfrmPadraoRelatorioGroup.rlNomePostoBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := oSistema.nomeposto;
end;

end.
