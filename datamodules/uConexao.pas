unit uConexao;

interface

uses
  Classes, SysUtils,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, Data.DB, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type


  TdtmPrincipal = class(TDataModule)
    conDatabase: TFDConnection;
    FDTransaction1: TFDTransaction;
    FDQuery1: TFDQuery;
    FDQuery1teste: TStringField;
  private

  public

  end;

var
  dtmPrincipal: TdtmPrincipal;

implementation

{$R *.dfm}



end.

