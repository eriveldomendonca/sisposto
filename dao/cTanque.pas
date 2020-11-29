unit cTanque;

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
     cTipoCombustivel,
     uMsg,
     System.Variants;


type
  TTanque = class(TBase)
  private
	F_id:Integer;
	F_descricao:String;
	F_tipocombustivel_id:Integer;
	F_tipocombustivel: TTipoCombustivel;
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
    property tipocombustivel_id : Integer read F_tipocombustivel_id write F_tipocombustivel_id ;
    property tipocombustivel : TTipoCombustivel read F_tipocombustivel write F_tipocombustivel;
  end;

implementation


{$region 'Constructor e Destructor'}
constructor TTanque.Create(aConexao:TFDConnection);
begin
  ConexaoDB:=aConexao;
end;

destructor TTanque.Destroy;
begin

  inherited;
end;
{$endRegion}

{$region 'CRUD'}
//Verifica se tanque existe utilizando a descricao
function TTanque.VerificaSeExiste(vDescricao : String) : boolean;
var Qry:TFDQuery;
begin
  try
  	Qry:=TFDQuery.Create(nil);
	with Qry do
	begin
		Connection:=ConexaoDB;
		SQL.Clear;
		SQL.Add('SELECT id ');
		SQL.Add('FROM TANQUE  ');
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
function TTanque.Apagar: Boolean;
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
		SQL.Add('DELETE FROM TANQUE '+
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
function TTanque.Atualizar: Boolean;
var Qry:TFDQuery;
begin

  try
    Result:=true;
    Qry:=TFDQuery.Create(nil);
    with Qry do
    begin
        Connection:=ConexaoDB;
        SQL.Clear;
        SQL.Add('UPDATE TANQUE SET'+
                {CamposUpdate}
                ' DESCRICAO = :descricao, '+
                ' TIPOCOMBUSTIVEL_ID = :tipocombustivel_id '+
                ' WHERE ID=:id ');
        ParamByName('id').AsInteger     :=Self.F_id;
        ParamByName('descricao').AsString  :=Self.F_descricao;
        ParamByName('tipocombustivel_id').AsInteger  :=Self.F_tipocombustivel_id;

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
function TTanque.Inserir: Boolean;
var Qry:TFDQuery;
begin
  try
    Qry:=TFDQuery.Create(nil);
    with Qry do
    begin
        Connection:=ConexaoDB;
        SQL.Clear;
        SQL.Add('INSERT INTO TANQUE ('+
				'DESCRICAO, '+
				'TIPOCOMBUSTIVEL_ID '+
				') VALUES ('+
				':descricao, '+
				':tipocombustivel_id '+
				')' );
        Qry.ParamByName('descricao').AsString  :=Self.F_descricao;
        Qry.ParamByName('tipocombustivel_id').AsInteger  :=Self.F_tipocombustivel_id;

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
function TTanque.Selecionar(id: Integer): Boolean;
var Qry:TFDQuery;
oTipoCombustivel : TTipoCombustivel;
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
                'TIPOCOMBUSTIVEL_ID '+
				        'FROM TANQUE '+
                'WHERE ID=:id');
        ParamByName('id').AsInteger:=id;
        Try
          Open;
          Self.F_id := Qry.FieldByName('id').AsInteger;
          Self.F_descricao := Qry.FieldByName('descricao').AsString;
          Self.F_tipocombustivel_id := Qry.FieldByName('tipocombustivel_id').AsInteger;
          oTipoCombustivel := TTipoCombustivel.Create(ConexaoDB);
          oTipoCombustivel.Selecionar(Self.F_tipocombustivel_id);
          Self.F_tipocombustivel := oTipoCombustivel;

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

