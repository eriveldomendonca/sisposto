unit uMsg;

interface

uses
  Classes, SysUtils, Dialogs, ExtCtrls, ExtDlgs, db, forms, winapi.windows;

function  MessageYesNo(const Msg: string; DlgType: TMsgDlgType): Integer;
function  MessageNoYes(const Msg: string; DlgType: TMsgDlgType): Integer;
Procedure MessageOK(const Msg: string; DlgType: TMsgDlgType);
Procedure MessageERROR(const Msg: string);

implementation


function MessageYesNo(const Msg: string; DlgType: TMsgDlgType): Integer;
var
  DefaultButton: TMsgDlgBtn;
begin
  DefaultButton := mbYes;
  if DlgType=mtWarning then
  begin
    result := application.MessageBox(pChar(msg),'ATENCAO',MB_YESNO+MB_ICONWARNING);
  end else if DlgType = mtError then
  begin
    result := application.MessageBox(pChar(msg),'ERRO',MB_YESNO+MB_ICONERROR);
  end else if DlgType = mtInformation then
  begin
    result := application.MessageBox(pChar(msg),'INFORMACAO',MB_YESNO+MB_ICONINFORMATION);
  end else if DlgType = mtConfirmation then
  begin
    result := application.MessageBox(pChar(msg),'CONFIRMACAO',MB_YESNO+MB_ICONQUESTION);
  end else
  begin
    result := application.MessageBox(pChar(msg),'CONFIRMACAO',MB_YESNO+MB_ICONQUESTION);
  end;

//  Result := MessageDlg(Msg,DlgType,[mbYes, mbno],0,DefaultButton);
end;

function MessageNoYes(const Msg: string; DlgType: TMsgDlgType): Integer;
var
  DefaultButton: TMsgDlgBtn;
  Caption:Pchar;
begin
  DefaultButton := mbNo;
  if DlgType=mtWarning then
  begin
    Caption:='ATENCAO';
    result := application.MessageBox(pChar(msg),Caption,MB_YESNO+MB_ICONWARNING);
  end else if DlgType = mtError then
  begin
    Caption:='ERRO';
    result := application.MessageBox(pChar(msg),Caption,MB_YESNO+MB_ICONERROR);
  end else if DlgType = mtInformation then
  begin
    Caption:='INFORMACAO';
    result := application.MessageBox(pChar(msg),Caption,MB_YESNO+MB_ICONINFORMATION);
  end else if DlgType = mtConfirmation then
  begin
    Caption:='CONFIRMACAO';
    result := application.MessageBox(pChar(msg),Caption,MB_YESNO+MB_ICONQUESTION);
  end else
  begin
    Caption:='CONFIRMACAO';
    result := application.MessageBox(pChar(msg),Caption,MB_YESNO+MB_ICONQUESTION);
  end;

//  Result := MessageDlg(Msg,DlgType,[mbYes, mbno],0,DefaultButton);
end;

Procedure MessageOK(const Msg: string; DlgType: TMsgDlgType);
begin
  if DlgType=mtWarning then
  begin
    application.MessageBox('Teste','ATENCAO',Mb_Ok+MB_ICONWARNING);
  end else if DlgType = mtError then
  begin
    application.MessageBox(pChar(msg),'ERRO',mb_Ok+mb_IconError);
  end else if DlgType = mtInformation then
  begin
    application.MessageBox(pChar(msg),'INFORMACAO',mb_Ok+MB_ICONINFORMATION);
  end else if DlgType = mtConfirmation then
  begin
    application.MessageBox(pChar(msg),'CONFIRMACAO',mb_Ok+MB_ICONQUESTION);
  end else
  begin
    application.MessageBox(pChar(msg),'CONFIRMACAO',mb_Ok+MB_ICONQUESTION);
  end;

  //MessageDlg(Msg,DlgType,[mbok],0);


end;


Procedure MessageERROR(const Msg: string);
var
charMsg, caption : PChar;
begin
  charMsg := PChar(msg);
  Caption := 'ERRO';
  application.MessageBox(pChar(msg),Caption,mb_Ok+mb_IconError);
end;



end.

