unit cTipoCombustivel;

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
  TTipoCombustivel = class(TBase)
  private
	F_id:Integer;

	F_descricao:String;
	F_valorlitro:Double;
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
	property valorlitro : Double read F_valorlitro write F_valorlitro ;
  end;

implementation


{$region 'Constructor e Destructor'}
constructor TTipoCombustivel.Create(aConexao:TFDConnection);
begin
  ConexaoDB:=aConexao;
end;

destructor TTipoCombustivel.Destroy;
begin

  inherited;
end;
{$endRegion}

{$region 'CRUD'}
//Verifica se tipo de combustivel existe utilizando a descricao
function TTipoCombustivel.VerificaSeExiste(vDescricao : String) : boolean;
var Qry:TFDQuery;
begin
  try
  	Qry:=TFDQuery.Create(nil);
	with Qry do
	begin
		Connection:=ConexaoDB;
		SQL.Clear;
		SQL.Add('SELECT id ');
		SQL.Add('FROM TIPOCOMBUSTIVEL  ');
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
function TTipoCombustivel.Apagar: Boolean;
var Qry:TFDQuery;
begin
	if MessageNoYes('Apagar o Registro: '+#13+#13+
                  'Tipo de combustível: '  +F_descricao,mtConfirmation)=mrNo then begin
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
		SQL.Add('DELETE FROM TIPOCOMBUSTIVEL '+
				' WHERE ID=:id ');
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
function TTipoCombustivel.Atualizar: Boolean;
var Qry:TFDQuery;
begin

  try
    Result:=true;
    Qry:=TFDQuery.Create(nil);
	with Qry do
	begin
		Connection:=ConexaoDB;
		SQL.Clear;
		SQL.Add('UPDATE TIPOCOMBUSTIVEL SET'+
				{CamposUpdate}
				' DESCRICAO = :descricao, '+
				' VALORLITRO = :valorlitro '+
				' WHERE ID=:id ');
		ParamByName('id').AsInteger     :=Self.F_id;
		ParamByName('descricao').AsString  :=Self.F_descricao;
		ParamByName('valorlitro').AsFloat  :=Self.F_valorlitro;

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
//Retorna true se tudo der certo
function TTipoCombustivel.Inserir: Boolean;
var Qry:TFDQuery;
begin
  try
    Qry:=TFDQuery.Create(nil);
    with Qry do
    begin
        Connection:=ConexaoDB;
        SQL.Clear;
        SQL.Add('INSERT INTO TIPOCOMBUSTIVEL ('+
            ' DESCRICAO, '+
            ' VALORLITRO '+
            ') VALUES ('+
            ' :descricao, '+
            ' :valorlitro '+
            ')' );
        Qry.ParamByName('descricao').AsString  :=Self.F_descricao;
        Qry.ParamByName('valorlitro').AsFloat  :=Self.F_valorlitro;

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
function TTipoCombustivel.Selecionar(id: Integer): Boolean;
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
				'ID, '+
				'DESCRICAO, '+
				'VALORLITRO '+
				'FROM TIPOCOMBUSTIVEL '+
				'WHERE ID=:id');
		ParamByName('id').AsInteger:=id;
		Try
			Open;
			Self.F_id := Qry.FieldByName('id').AsInteger;
			Self.F_descricao := Qry.FieldByName('descricao').AsString;
			Self.F_valorlitro := Qry.FieldByName('valorlitro').AsFloat;
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

