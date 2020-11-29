unit uRelTipoCombustivel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoRelatorio, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport, Vcl.StdCtrls,
  uConexao,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmRelTipoCombustivel = class(TfrmPadraoRelatorioList)
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    edtInicial: TLabeledEdit;
    edtFinal: TLabeledEdit;
    procedure edtInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtInicialExit(Sender: TObject);
    procedure edtFinalExit(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelTipoCombustivel: TfrmRelTipoCombustivel;

implementation

{$R *.dfm}

procedure TfrmRelTipoCombustivel.btnImprimirClick(Sender: TObject);
begin
  filtro := 'WHERE ID >= '+edtInicial.Text+
            ' AND ID <= '+edtFinal.text+
            ' ORDER BY DESCRICAO';
  inherited;
end;

procedure TfrmRelTipoCombustivel.btnVisualizarClick(Sender: TObject);
begin
  filtro := 'WHERE ID >= '+edtInicial.Text+
            ' AND ID <= '+edtFinal.text+
            ' ORDER BY DESCRICAO';
  inherited;
end;

procedure TfrmRelTipoCombustivel.edtFinalExit(Sender: TObject);
begin
  with TLabeledEdit(Sender) do
  begin
    if Trim(text) = EmptyStr then
      text := '99999';
  end;
end;

procedure TfrmRelTipoCombustivel.edtInicialExit(Sender: TObject);
begin
  with TLabeledEdit(Sender) do
  begin
    if Trim(text) = EmptyStr then
      text := '1';
  end;
end;

procedure TfrmRelTipoCombustivel.edtInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
  key := somenteNumerosInt(key,TLabeledEdit(Sender).text);
end;

end.
