unit cSistema;

interface

uses Classes,
     Controls,
     ExtCtrls,
     Dialogs,
     cBase,
     SysUtils,
     FireDAC.Stan.Error,
     FireDAC.UI.Intf,
     FireDAC.Phys.Intf,
     FireDAC.Stan.Def,
     FireDAC.Stan.Pool,
     FireDAC.Stan.Async,
     FireDAC.Phys,
     FireDAC.Phys.FB,
     FireDAC.Phys.FBDef,
     FireDAC.VCLUI.Wait,
     FireDAC.Comp.Client,
     FireDAC.Stan.Intf,
     FireDAC.Stan.Option,
     Data.DB,
     uUtils,
     uMsg,
     System.Variants;


type
  TSistema = class(TBase)
  private
	F_nomeposto:String;
	F_percimposto:Double;
  public
    constructor Create(aConexao:TFDConnection);
    destructor Destroy; override;
    function Inserir:Boolean;
    function Atualizar:Boolean;
    function Selecionar:Boolean;
  published
    property nomeposto : String read F_nomeposto write F_nomeposto ;
    property percimposto : Double read F_percimposto write F_percimposto ;
  end;

implementation


{$region 'Constructor e Destructor'}
constructor TSistema.Create(aConexao:TFDConnection);
begin
  ConexaoDB:=aConexao;
end;

destructor TSistema.Destroy;
begin

  inherited;
end;
{$endRegion}

{$region 'CRUD'}
//Atualiza o registro
//Retorna TRUE se tudo der certo ou FALSE caso não
function TSistema.Atualizar: Boolean;
var Qry:TFDQuery;
begin

  try
    Result:=true;
    Qry:=TFDQuery.Create(nil);
	with Qry do
	begin
		Connection:=ConexaoDB;
		SQL.Clear;
		SQL.Add('UPDATE SISTEMA SET'+
				{CamposUpdate}
				' NOMEPOSTO = :nomeposto, '+
				' PERCIMPOSTO = :percimposto ');
		ParamByName('nomeposto').AsString  :=Self.F_nomeposto;
		ParamByName('percimposto').AsFloat  :=Self.F_percimposto;

		Try
		  ConexaoDB.StartTransaction;
		  ExecSQL;
		  ConexaoDB.Commit;
		Except
		  ConexaoDB.Rollback;
		  Result:=false;
		End;
	end;
  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

//Insere os dados
function TSistema.Inserir: Boolean;
var Qry:TFDQuery;
begin
  try
    Qry:=TFDQuery.Create(nil);
    with Qry do
    begin
        Connection:=ConexaoDB;
        SQL.Clear;
        SQL.Add('INSERT INTO SISTEMA ('+
            ' NOMEPOSTO, '+
            ' PERCIMPOSTO '+
            ') VALUES ('+
            ' :nomeposto, '+
            ' :percimposto '+
            ')' );
        Qry.ParamByName('nomeposto').AsString  :=Self.F_nomeposto;
        Qry.ParamByName('percimposto').AsFloat  :=Self.F_percimposto;

        Try
          ConexaoDB.StartTransaction;
          ExecSQL;

          Result:=true;
          ConexaoDB.Commit;
        Except
          ConexaoDB.Rollback;
          Result:=false;
        End;
    end;
  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

//Carrega os dados
//Retorna TRUE se tudo der certo e FALSE em caso de erro
function TSistema.Selecionar: Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=true;
    Qry:=TFDQuery.Create(nil);
	with Qry do
	begin
		Connection:=ConexaoDB;
		SQL.Clear;
		SQL.Add('SELECT '+
            'NOMEPOSTO, '+
            'PERCIMPOSTO '+
            'FROM SISTEMA ');
		Try
			Open;
      if recordcount > 0 then
        result := true
      else
        result := false;
			Self.F_nomeposto := Qry.FieldByName('nomeposto').AsString;
			Self.F_percimposto := Qry.FieldByName('percimposto').AsFloat;
		Except
		  Result:=false;
		End;
	end;
  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

end.

