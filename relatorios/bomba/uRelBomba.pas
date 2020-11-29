unit uRelBomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoRelatorio, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport, Vcl.StdCtrls,
  uConexao,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, RLParser;

type
  TfrmRelBomba = class(TfrmPadraoRelatorioList)
    edtInicial: TLabeledEdit;
    edtFinal: TLabeledEdit;
    RLDBText1: TRLDBText;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText2: TRLDBText;
    RLLabel5: TRLLabel;
    RLDBText3: TRLDBText;
    RLLabel6: TRLLabel;
    RLDBText4: TRLDBText;
    RLExpressionParser1: TRLExpressionParser;
    procedure btnImprimirClick(Sender: TObject);
    procedure edtInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtInicialExit(Sender: TObject);
    procedure edtFinalExit(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  frmRelBomba: TfrmRelBomba;

implementation

{$R *.dfm}

procedure TfrmRelBomba.btnImprimirClick(Sender: TObject);
begin
  filtro := 'WHERE BOMBA.ID >= '+edtInicial.Text+
            ' AND BOMBA.ID <= '+edtFinal.text+
            ' ORDER BY DESCRICAO';
  inherited;

end;

procedure TfrmRelBomba.btnVisualizarClick(Sender: TObject);
begin
  filtro := 'WHERE BOMBA.ID >= '+edtInicial.Text+
            ' AND BOMBA.ID <= '+edtFinal.text+
            ' ORDER BY DESCRICAO';
  inherited;
end;

procedure TfrmRelBomba.edtFinalExit(Sender: TObject);
begin
  with TLabeledEdit(Sender) do
  begin
    if Trim(text) = EmptyStr then
      text := '99999';
  end;
end;

procedure TfrmRelBomba.edtInicialExit(Sender: TObject);
begin
  with TLabeledEdit(Sender) do
  begin
    if Trim(text) = EmptyStr then
      text := '1';
  end;

end;

procedure TfrmRelBomba.edtInicialKeyPress(Sender: TObject; var Key: Char);
begin
  key := somenteNumerosInt(key,TLabeledEdit(Sender).text);
end;

end.
