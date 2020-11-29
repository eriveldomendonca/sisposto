unit uRelTanque;

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
  TfrmRelTanque = class(TfrmPadraoRelatorioList)
    edtInicial: TLabeledEdit;
    edtFinal: TLabeledEdit;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure edtInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtInicialExit(Sender: TObject);
    procedure edtFinalExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelTanque: TfrmRelTanque;

implementation

{$R *.dfm}

procedure TfrmRelTanque.btnImprimirClick(Sender: TObject);
begin
  filtro := 'WHERE TANQUE.ID >= '+edtInicial.Text+
            ' AND TANQUE.ID <= '+edtFinal.text+
            ' ORDER BY DESCRICAO';
  inherited;
end;

procedure TfrmRelTanque.btnVisualizarClick(Sender: TObject);
begin
  filtro := 'WHERE TANQUE.ID >= '+edtInicial.Text+
            ' AND TANQUE.ID <= '+edtFinal.text+
            ' ORDER BY DESCRICAO';
  inherited;
end;

procedure TfrmRelTanque.edtFinalExit(Sender: TObject);
begin
  with TLabeledEdit(Sender) do
  begin
    if Trim(text) = EmptyStr then
      text := '99999';
  end;
end;

procedure TfrmRelTanque.edtInicialExit(Sender: TObject);
begin
  with TLabeledEdit(Sender) do
  begin
    if Trim(text) = EmptyStr then
      text := '1';
  end;
end;

procedure TfrmRelTanque.edtInicialKeyPress(Sender: TObject; var Key: Char);
begin
  key := somenteNumerosInt(key,TLabeledEdit(Sender).text);
end;

end.
