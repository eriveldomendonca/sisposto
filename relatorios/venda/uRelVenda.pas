unit uRelVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoRelatorioGroup,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, RLReport, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  uConexao, uMsg,
  Vcl.ComCtrls, Vcl.Mask;

type
  TfrmRelVenda = class(TfrmPadraoRelatorioGroup)
    RLDBText1: TRLDBText;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel11: TRLLabel;
    edtDataInicial: TMaskEdit;
    Label2: TLabel;
    edtDataFinal: TMaskEdit;
    Label3: TLabel;
    RLBand7: TRLBand;
    RLLabel12: TRLLabel;
    RLDBText9: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLDBResult5: TRLDBResult;
    RLLabel13: TRLLabel;
    RLDraw2: TRLDraw;
    RLDraw4: TRLDraw;
    RLDBResult7: TRLDBResult;
    RLDBResult11: TRLDBResult;
    RLDBResult12: TRLDBResult;
    RLDBResult13: TRLDBResult;
    RLDBResult14: TRLDBResult;
    RLLabel15: TRLLabel;
    procedure edtDataInicialExit(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVenda: TfrmRelVenda;

implementation

{$R *.dfm}

procedure TfrmRelVenda.btnImprimirClick(Sender: TObject);
var datainicial, datafinal : TDate;
begin
  try
    datainicial := StrtoDate(edtDatainicial.EditText);
    datafinal := StrtoDate(edtDatafinal.EditText);
    filtro := ' WHERE DATAVENDA >= :datainicial '+
              'AND DATAVENDA <= :datafinal '+
              'ORDER BY DATAVENDA, BOMBA.DESCRICAO, VENDA.ID';
  except
    MessageERROR('Período inválido');
    abort;
  end;
  with qryListagem do
  begin
    sql.Clear;
    sql.Add(sqlpadrao);
    sql.Add(filtro);
    ParamByName('datainicial').AsDate := datainicial;
    ParamByName('datafinal').AsDate := datafinal;
  end;
  inherited;
end;

procedure TfrmRelVenda.btnVisualizarClick(Sender: TObject);
var datainicial, datafinal : TDate;
begin
  try
    datainicial := StrtoDate(edtDatainicial.EditText);
    datafinal := StrtoDate(edtDatafinal.EditText);
    filtro := ' WHERE DATAVENDA >= :datainicial '+
              'AND DATAVENDA <= :datafinal '+
              'ORDER BY DATAVENDA, BOMBA.DESCRICAO, VENDA.ID';
  except
    MessageERROR('Período inválido');
    abort;
  end;
  with qryListagem do
  begin
    sql.Clear;
    sql.Add(sqlpadrao);
    sql.Add(filtro);
    ParamByName('datainicial').AsDate := datainicial;
    ParamByName('datafinal').AsDate := datafinal;
  end;
  inherited;

end;

procedure TfrmRelVenda.edtDataInicialExit(Sender: TObject);
var dataOk : TDate;
begin
  try
    dataOk := StrToDate(TMaskEdit(Sender).EditText);
  except
    MessageERROR('Data inválida');
    TMaskEdit(Sender).Text := '';
  end;
end;

end.
