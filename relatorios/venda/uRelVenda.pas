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
    RLDBText2: TRLDBText;
    RLBand5: TRLBand;
    RLLabel5: TRLLabel;
    RLDBText3: TRLDBText;
    RLLabel6: TRLLabel;
    RLDBText4: TRLDBText;
    RLLabel7: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel8: TRLLabel;
    RLDBText7: TRLDBText;
    RLLabel9: TRLLabel;
    RLDBText8: TRLDBText;
    RLLabel11: TRLLabel;
    RLDBText10: TRLDBText;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLDBResult5: TRLDBResult;
    edtDataInicial: TMaskEdit;
    Label2: TLabel;
    edtDataFinal: TMaskEdit;
    Label3: TLabel;
    RLLabel12: TRLLabel;
    RLDBResult1: TRLDBResult;
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
              'ORDER BY BOMBA.DESCRICAO, DATAVENDA, VENDA.ID';
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
              'ORDER BY BOMBA.DESCRICAO, DATAVENDA, VENDA.ID';
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
