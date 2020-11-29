unit uUtils;

interface

uses
  Classes, SysUtils, Dialogs, ExtCtrls, graphics, ExtDlgs, db, forms;

function GuidCreate: string;
procedure CarregarImagem(aImage:TImage);
procedure LimparImagem(var aImage:TImage);
Procedure LoadBitmapFromBlob(Bitmap: TBitmap; Blob: TBlobField);
function DataOk(Dt:String):Boolean;
function Quebra (input: String; separador: Char) : TStringList;
function IIf(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;

implementation

//uses winapi.windows;
function IIf(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;
 begin
   if Expressao then
      Result := ParteTRUE
   else
      Result := ParteFALSE;
 end;

function Quebra (input: String; separador: Char) : TStringList;
var resultado: TStringList;
begin
    resultado := TStringList.Create;
    resultado.Delimiter := separador;
    resultado.DelimitedText := input;
    result:= resultado;
end;


function DataOk(Dt:String):Boolean;
var Dia,Mes:Byte;
    Ano:Integer;
function AnoBissesto(Year :Integer): boolean ;
begin
  AnoBissesto:=(ano mod 4=0) and ( ano mod 100 <> 0) or (ano Mod 400 =0);
end;
begin
  Result:=False;
  if length(Trim(Dt)) = 10 then
    begin
      Dia:=StrToIntDef(Copy(Dt,1,2),0);
      Mes:=StrToIntDef(Copy(Dt,4,2),0);
      Ano:=StrToInt(Copy(Dt,7,4));
      if ( (Mes in [1,3,5,7,8,10,12]) and (Dia in [1..31]) ) or
        ( (Mes in [4,6,9,11]) and (Dia in [1..30]) ) or
        ( (Mes = 2) and ( AnoBissesto(Ano)) and (Dia in [1..29]) ) or
        ( (Mes = 2) and (not AnoBissesto(Ano)) and (Dia in [1..28]) ) then
        Result:=True;
    end;
end;


Procedure LoadBitmapFromBlob(Bitmap: TBitmap; Blob: TBlobField);
var
  ms: TMemoryStream;
begin
  ms := TMemoryStream.Create;
  try
    Blob.SaveToStream(ms);
    ms.Position := 0;
    //Bitmap.LoadFromStream(ms);
  finally
    ms.Free;
  end;
end;

procedure LimparImagem(var aImage:TImage);
begin
  aImage.Picture.Assign(nil);
end;

procedure CarregarImagem(aImage:TImage);
var
  Bmp, BmpTrans: TBitmap;
  Pic: TPicture;
  opdSelecionar:TOpenPictureDialog;
  iWidth:Integer;
  iHeight:Integer;
begin
  Try
    iWidth:=160;
    iHeight:=130;
    opdSelecionar:=TOpenPictureDialog.Create(nil);
    opdSelecionar.Filter:='All (*.bmp;*.jpg; *.jpeg;*.png)|*.jpg; *.jpeg; *.bmp;*.png|Bitmaps '+
                          '(*.bmp)|*.bmp|JPEG Image File (*.jpg;*.jpeg)|*.jpg; *.jpeg| '+
                          'PNG(*.png)|*.png';
    opdSelecionar.Title:='Selecione a Imagem';
    opdSelecionar.Execute;

    if opdSelecionar.FileName<>EmptyStr then begin
      try
        Bmp := TBitmap.Create;
        BmpTrans:= TBitmap.Create;
        Pic := TPicture.Create;

        Pic.LoadFromFile(opdSelecionar.FileName);
        BmpTrans.Assign(Pic.Bitmap);
        Bmp.Width :=iWidth;
        Bmp.Height:=iHeight;
        Bmp.Canvas.StretchDraw(Rect(0, 0, Bmp.width, Bmp.Height), BmpTrans);
        aImage.Picture.Bitmap:=Bmp;
      finally
        Pic.Free;
        BmpTrans.Free;
        Bmp.Free;
      end;
    end;

  Finally
     FreeAndNil(opdSelecionar);
  End;

end;

function GuidCreate: string;
var
  ID: TGUID;
begin
  ID.NewGuid;
  Result :=StringReplace(StringReplace(GUIDToString(ID),'}','',[rfReplaceAll]),'{','',[rfReplaceAll]);
end;




end.

