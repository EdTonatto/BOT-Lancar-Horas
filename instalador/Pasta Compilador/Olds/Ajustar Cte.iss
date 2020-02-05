; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!
; utilizando uma biblioteca para gerenciamento do Download, nesta compila��o nosso [CODE] realiza a tarefa para o Framework 4.0 :B

#include ReadReg(HKEY_LOCAL_MACHINE,'Software\Sherlock Software\InnoTools\Downloader','ScriptPath','')
#define MyAppName "TMS UNIDADE DE NEG�CIO"
#define MyAppVersion "Atualiza��o TMS Ajustar CTe"
#define MyAppPublisher "Expresso S�o Miguel Ltda."
#define MyAppURL "http://www.expressosaomiguel.com.br"
#define MyAppExeName "TMS.exe"

[Setup]

AppId={{2920414C-4166-434A-896A-3A6BF223B876}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
PrivilegesRequired=admin
DefaultDirName={pf}\Expresso Sao Miguel\Agencia
DisableDirPage=true
DefaultGroupName=Agencia
DisableProgramGroupPage=true
OutputDir=C:\INSTALADOR\Projeto - Compilador
OutputBaseFilename=Atualiza��o TMS Ajustar CTe
VersionInfoVersion=1
SetupIconFile=C:\INSTALADOR\Projeto - Compilador\ICON_TMS_EXPRESSO.ico
Compression=lzma
SolidCompression=true
WizardImageFile=C:\INSTALADOR\Projeto - Arquivos\Logos\Nova Logo.bmp
WizardSmallImageFile=C:\INSTALADOR\Projeto - Arquivos\Logos\EX 2CM novo.bmp
Password=
DisableStartupPrompt=true
UsePreviousSetupType=false
DisableFinishedPage=false
UsePreviousUserInfo=false
UserInfoPage=false
AllowCancelDuringInstall=false
ShowLanguageDialog=no
TerminalServicesAware=false
UsePreviousTasks=false
ShowComponentSizes=false
RestartIfNeededByRun=false
ChangesAssociations=true
WizardImageStretch=false
WizardImageBackColor=clWhite
   
[Languages]
Name: brazilianportuguese; MessagesFile: compiler:Languages\BrazilianPortuguese.isl
 
[Files]			
;Arquivos novos 
Source: ..\Projeto - Arquivos\Outros\AjustarCTe.exe; DestDir: {sd}\Banco\Servidor\; Flags: ignoreversion; Languages:

[Registry]
Root: HKLM; Subkey: SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System; ValueType: dword; ValueName: EnableLUA; ValueData: 0; Flags: noerror

[Code]
procedure InitializeWizard();
var
  ErrorCode: Integer;
begin
  if not (FileExists('C:\banco\servidor\servidor.exe')) then
	begin
    MsgBox('EXECUTAR APENAS NO SERVIDOR!!! Processo Cancelado!'#13#13, mbInformation, MB_OK);
    Abort;
	end;
  Sleep(1000);
  ShellExec('open',  'taskkill.exe', '/f /im scktsrvr.exe','',SW_HIDE,ewNoWait,ErrorCode);
  ShellExec('open',  'taskkill.exe', '/f /im agencia.exe','',SW_HIDE,ewNoWait,ErrorCode);
  ShellExec('open',  'taskkill.exe', '/f /im servidor.exe','',SW_HIDE,ewNoWait,ErrorCode);
  ShellExec('open',  'taskkill.exe', '/f /im BotSincronizacao.exe','',SW_HIDE,ewNoWait,ErrorCode);
  ShellExec('open',  'taskkill.exe', '/f /im TMS.exe','',SW_HIDE,ewNoWait,ErrorCode);
	ShellExec('open',  'taskkill.exe', '/f /im ConsultarAverbacao.exe','',SW_HIDE,ewNoWait,ErrorCode);
  ShellExec('open',  'taskkill.exe', '/f /im javaw.exe','',SW_HIDE,ewNoWait,ErrorCode);
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  ErrorCode: Integer;
begin
  if CurStep = ssPostInstall then 
  begin
		if (FileExists('C:\banco\servidor\AjustarCTe.exe')) then
		begin
			ShellExec('', ExpandConstant('{sd}\banco\servidor\AjustarCTe.exe'), '', '', SW_SHOW, ewWaitUntilTerminated, ErrorCode);
			DeleteFile(ExpandConstant('{sd}\banco\servidor\AjustarCTe.exe'));
			ShellExec('', ExpandConstant('C:\Banco\scktsrvr.exe'),'','', SW_SHOW, ewNoWait, ErrorCode);
		end;
	end;
end;

























