unit cBomba;

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
     cTanque,
     uMsg,
     System.Variants;


type
  TBomba = class(TBase)
  private
	F_id:Integer;
	F_descricao:String;
	F_tanque_id:Integer;
	F_tanque: TTanque;
  public
    constructor Create(aConexao:TFDConnection);
    destructor Destroy; override;

    function Inserir:Boolean;
    function Atualizar:Boolean;
    function Apagar:Boolean;
    function Selecionar(id:Integer):Boolean;
    function VerificaSeExiste(vDescricao : String) : boolean;

  published
    property id : Integer read F_id write F_id ;
    property descricao : String read F_descricao write F_descricao ;
    property tanque_id : Integer read F_tanque_id write F_tanque_id ;
    property tanque : TTanque read F_tanque write F_tanque;
  end;

implementation


{$region 'Constructor e Destructor'}
constructor TBomba.Create(aConexao:TFDConnection);
begin
  ConexaoDB:=aConexao;
end;

destructor TBomba.Destroy;
begin

  inherited;
end;
{$endRegion}

{$region 'CRUD'}
//Verifica se bomba existe utilizando a descricao
function TBomba.VerificaSeExiste(vDescricao : String) : boolean;
var Qry:TFDQuery;
begin
  try
  	Qry:=TFDQuery.Create(nil);
	with Qry do
	begin
		Connection:=ConexaoDB;
		SQL.Clear;
		SQL.Add('SELECT id ');
		SQL.Add('FROM BOMBA ');
		SQL.Add('WHERE DESCRICAO = :descricao');
		ParamByName('descricao').asString := vDescricao;

		Try
		  Open;

		  if RecordCount>0 then
		  begin
			 result := true
		  end else
			 result := false;

		Except
		  Result:=false;
		End;
	end;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

//Apaga registro utilizando o id
//Retorna TRUE se der certo ou FALSE caso não
function TBomba.Apagar: Boolean;
var Qry:TFDQuery;
begin
  if MessageNoYes('Apagar o Registro: '+#13+#13+
                  'Tanque: '  +F_descricao,mtConfirmation)=mrNo then
  begin
	 Result:=false;
     abort;
  end;
  try
	Qry:=TFDQuery.Create(nil);
	with Qry do
	begin
		Result:=true;

		Connection:=ConexaoDB;
		SQL.Clear;
		SQL.Add('DELETE FROM BOMBA '+
				    'WHERE ID=:id ');
		ParamByName('id').AsInteger :=F_id;
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

//Atualiza o registro com base no ID
//Retorna TRUE se tudo der certo ou FALSE caso não
function TBomba.Atualizar: Boolean;
var Qry:TFDQuery;
begin

  try
    Result:=true;
    Qry:=TFDQuery.Create(nil);
    with Qry do
    begin
        Connection:=ConexaoDB;
        SQL.Clear;
        SQL.Add('UPDATE BOMBA SET'+
                {CamposUpdate}
                ' DESCRICAO = :descricao, '+
                ' TANQUE_ID = :tanque_id '+
                ' WHERE ID=:id ');
        ParamByName('id').AsInteger     :=Self.F_id;
        ParamByName('descricao').AsString  :=Self.F_descricao;
        ParamByName('tanque_id').AsInteger  :=Self.F_tanque_id;

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
//Retorna o ID gerado ou -1 em caso de erro
function TBomba.Inserir: Boolean;
var Qry:TFDQuery;
begin
  try
    Qry:=TFDQuery.Create(nil);
    with Qry do
    begin
        Connection:=ConexaoDB;
        SQL.Clear;
        SQL.Add('INSERT INTO BOMBA ('+
				'DESCRICAO, '+
				'TANQUE_ID '+
				') VALUES ('+
				':descricao, '+
				':tanque_id '+
				')' );
        Qry.ParamByName('descricao').AsString  :=Self.F_descricao;
        Qry.ParamByName('tanque_id').AsInteger  :=Self.F_tanque_id;

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

//Carrega os dados utilizando o ID
//Retorna TRUE se tudo der certo e FALSE em caso de erro
function TBomba.Selecionar(id: Integer): Boolean;
var Qry:TFDQuery;
oTanque : TTanque;
begin
  try
    Result:=true;
    Qry:=TFDQuery.Create(nil);
    with Qry do
    begin
        Connection:=ConexaoDB;
        SQL.Clear;
        SQL.Add('SELECT '+
                'ID, '+
                'DESCRICAO, '+
                'TANQUE_ID '+
				        'FROM BOMBA '+
                'WHERE ID=:id');
        ParamByName('id').AsInteger:=id;
        Try
          Open;
          Self.F_id := Qry.FieldByName('id').AsInteger;
          Self.F_descricao := Qry.FieldByName('descricao').AsString;
          Self.F_tanque_id := Qry.FieldByName('tanque_id').AsInteger;
          oTanque := TTanque.Create(ConexaoDB);
          oTanque.Selecionar(Self.F_tanque_id);
          Self.F_tanque := oTanque;

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

