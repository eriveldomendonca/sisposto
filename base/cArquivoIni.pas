unit cArquivoIni;

interface

uses Classes,
     Controls,
     ExtCtrls,
     Dialogs,
     SysUtils,
     IniFiles,
     Forms;

type
  TArquivoIni = class
  private

  public
    class function ArquivoIni:string; static;
    class function TipoDataBase:String; static;
    class function LerIni(aSecao:String; aEntrada:String):String; static;
    class procedure AtualizarIni(aSecao, aEntrada, aValor: String); static;

end;

implementation

class function TArquivoIni.ArquivoIni: string;
begin
  result := extractfilepath(application.ExeName)+'bd\config.ini';
end;

class function TArquivoIni.LerIni(aSecao:String; aEntrada:String):String;
var
  Ini: TIniFile;
begin
  try
    Ini := TIniFile.Create(ArquivoIni);
    Result := Ini.ReadString( aSecao, aEntrada, 'NAO ENCONTRADO' );
  finally
    Ini.Free;
  end;
end;

class procedure TArquivoIni.AtualizarIni(aSecao:String; aEntrada:String; aValor:String);
var
  Ini: TIniFile;
begin
  try
    Ini := TIniFile.Create(ArquivoIni);

    Ini.WriteString( aSecao, aEntrada, aValor);
  finally
    Ini.Free;
  end;
end;

class function TArquivoIni.TipoDataBase: String;
begin
  Result:= UpperCase(TArquivoIni.LerIni('SISPosto','TipoDataBase'));
end;

end.

