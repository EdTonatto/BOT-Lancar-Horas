; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!
; utilizando uma biblioteca para gerenciamento do Download, nesta compila��o nosso [CODE] realiza a tarefa para o Framework 4.0 :B

#include ReadReg(HKEY_LOCAL_MACHINE,'Software\Sherlock Software\InnoTools\Downloader','ScriptPath','')
#define MyAppName "TMS UNIDADE DE NEG�CIO"
#define MyAppVersion "Atualiza��o TMS - Escravo WebSocket"
#define MyAppPublisher "Expresso S�o Miguel Ltda."
#define MyAppURL "http://www.expressosaomiguel.com.br"
#define MyAppExeName "TMS.exe"
#define MyDateTimeString

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
OutputBaseFilename=Atualizacao_TMS-Escravo-WebSocket
VersionInfoVersion=1
SetupIconFile=C:\INSTALADOR\Projeto - Compilador\ICON_TMS_EXPRESSO.ico
Compression=lzma
SolidCompression=true
WizardImageFile=C:\INSTALADOR\Projeto - Arquivos\Logos\Nova Logo.bmp
WizardSmallImageFile=C:\INSTALADOR\Projeto - Arquivos\Logos\ICONE_TMS_logo_direito.bmp
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
Source: ..\Projeto - Arquivos\OutrosBotsWebSocket\*; DestDir: {sd}\Banco\Tomcat\9.0.4\x64\webapps\; Check: MyProgCheck and IsWin64; Flags: ignoreversion; Languages:
Source: ..\Projeto - Arquivos\OutrosBotsWebSocket\*; DestDir: {sd}\Banco\Tomcat\9.0.4\x86\webapps\; Check: MyProgCheck and not IsWin64; Flags: ignoreversion; Languages:
;Source: ..\Projeto - Arquivos\OutrosBots\*; DestDir: {sd}\Banco\Servidor\; Check: MyProgCheck; Flags: ignoreversion; Languages:

;Executar Scripts
Source: ..\Projeto - Arquivos\Outros\Executor.exe; DestDir: {sd}\Banco\Servidor\; Flags: ignoreversion dontcopy; Languages:
Source: ..\Projeto - Arquivos\Script\*; DestDir: \Scripts\; Flags: ignoreversion dontcopy; Languages:

[Registry]
Root: HKLM; Subkey: SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System; ValueType: dword; ValueName: EnableLUA; ValueData: 0; Flags: noerror

[Code]
procedure InitializeWizard();
var
  ErrorCode: Integer;
begin
	if (FileExists('C:\Banco\Servidor\Servidor.exe')) and (FileExists('C:\Banco\BotSincronizacao\BotSincronizacao.exe')) then
	begin
		ShellExec('open',  'taskkill.exe', '/f /im javaw.exe','',SW_HIDE,ewWaitUntilTerminated,ErrorCode);
		ShellExec('open',  'taskkill.exe', '/f /im tomcat9.exe','',SW_HIDE,ewNoWait,ErrorCode);
		Exec(ExpandConstant('{cmd}'), '/C net stop Tomcat9','', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
	end;
	
	DeleteFile(ExpandConstant('{sd}\Banco\Servidor\Erros.txt'));
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  ErrorCode: Integer;
	dataAutal: String;
begin		
	if CurStep = ssInstall then
	begin
		if (FileExists('C:\Banco\Servidor\Servidor.exe')) and (FileExists('C:\Banco\BotSincronizacao\BotSincronizacao.exe')) then
		begin
			dataAutal := GetDateTimeString('ddmmyyyys', '-', ':');
		
			if not(DirExists('C:\Program Files (x86)\Expresso Sao Miguel\Backup\websocket')) then
				CreateDir('C:\Program Files (x86)\Expresso Sao Miguel\Backup\websocket');
				
			if FileExists('C:\Banco\Tomcat\9.0.4\x64\webapps\websocket-client.war') then 
			begin
				FileCopy('C:\Banco\Tomcat\9.0.4\x64\webapps\websocket-client.war','C:\Program Files (x86)\Expresso Sao Miguel\Backup\websocket\websocket-client'+dataAutal+'.war', True);
			end
			else if FileExists('C:\Banco\Tomcat\9.0.4\x86\webapps\websocket-client.war') then
			begin	
				FileCopy('C:\Banco\Tomcat\9.0.4\x86\webapps\websocket-client.war','C:\Program Files (x86)\Expresso Sao Miguel\Backup\websocket\websocket-client'+dataAutal+'.war', True);
			end;
			
			DelTree('C:\Banco\Tomcat\9.0.4\x86\webapps\websocket-client', True, True, True);
			DelTree('C:\Banco\Tomcat\9.0.4\x64\webapps\websocket-client', True, True, True);	
			DeleteFile(ExpandConstant('{sd}\Banco\Tomcat\9.0.4\x64\webapps\websocket-client.war'));
			DeleteFile(ExpandConstant('{sd}\Banco\Tomcat\9.0.4\x86\webapps\websocket-client.war'));
			
			ExtractTemporaryFile('Executor.exe');
			ExtractTemporaryFiles(ExpandConstant('*.sql'));	
			ShellExec('', ExpandConstant('{tmp}\Executor.exe'), ExpandConstant('"{tmp}\Scripts\Scripts.sql" "WebSocket-13-11"'), '', SW_SHOW, ewWaitUntilTerminated, ErrorCode);
			if ((FileExists('C:\Banco\Servidor\Erros.txt')) or (ErrorCode <> 0)) then
			begin
				MsgBox('Problemas para atualizar. Entre em contato com o Suporte para verifica��o do LOG!', mbInformation, MB_OK);
				Abort;
			end;
		end;		
	end; 

	if CurStep = ssPostInstall then 
	begin
		if (FileExists('C:\Banco\Servidor\Servidor.exe')) and (FileExists('C:\Banco\BotSincronizacao\BotSincronizacao.exe')) then
		begin
			Exec(ExpandConstant('{cmd}'), '/C net start Tomcat9','', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
			Sleep(5000);
		end;
	end;
end;

function MyProgCheck(): Boolean;
var
  MyProgChecked: Boolean;
begin
  if (FileExists('C:\Banco\Servidor\Servidor.exe')) and (FileExists('C:\Banco\BotSincronizacao\BotSincronizacao.exe')) then 
	begin
    MyProgChecked := True;
  end;
	Result := MyProgChecked;
end;

{
function MyProgCheckFRM(): Boolean;
var
  MyProgChecked: Boolean;
begin
  if (FileExists('C:\Program Files\NDDigital\e-Agente\data\cliente.xml')) then 
	begin
    MyProgChecked := True;
  end;
	Result := MyProgChecked;
end;
}














