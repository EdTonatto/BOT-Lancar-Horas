; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

; utilizando uma biblioteca para gerenciamento do Download, nesta compila��o nosso [CODE] realiza a tarefa para o Framework 4.0 :B
#include ReadReg(HKEY_LOCAL_MACHINE,'Software\Sherlock Software\InnoTools\Downloader','ScriptPath','')

#define MyAppName "Altera Banco - 14 / 03 / 2016"
#define MyAppVersion "Atualiza��o Path - 14 / 03 / 2016"
#define MyAppPublisher "Expresso S�o Miguel Ltda."
#define MyAppURL "http://www.expressosaomiguel.com.br"
#define MyAppExeName "Agencia.exe"

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
OutputBaseFilename=Altera_Banco-13-02-2017
VersionInfoVersion=
SetupIconFile=C:\INSTALADOR\Projeto - Compilador\icone.ico
Compression=lzma
SolidCompression=true
WizardImageFile=C:\INSTALADOR\Projeto - Arquivos\Logos\logo_novo.bmp
WizardSmallImageFile=C:\INSTALADOR\Projeto - Arquivos\Logos\logo_direito.bmp
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

;//-----------------------------------------------------------------------------------------------------------------------------------------------//

[Files]

;Arquivos novos
Source: ..\Projeto - Arquivos\AlteraChaves\*; DestDir: {sd}\banco\servidor\; Flags: ignoreversion overwritereadonly uninsremovereadonly

;//-----------------------------------------------------------------------------------------------------------------------------------------------//




;[Registry]

;desabilitado UAC do perfil do usu�rio, para poder registrar a .dll com o arquivo .bat
;Root: HKLM; Subkey: SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System; ValueType: dword; ValueName: EnableLUA; ValueData: 0; Flags: noerror


;//-----------------------------------------------------------------------------------------------------------------------------------------------//
;//-----------------------------------------------------------------------------------------------------------------------------------------------//

[Run]
;ap�s a compila��o dos novos arquivos, s�o iniciados os executaveis novamente
;Filename: {sd}\banco\scktsrvr.exe; WorkingDir: {sd}; Flags: waituntilidle skipifdoesntexist
Filename: {sd}\banco\servidor\Altera_chaves.exe; WorkingDir: {sd}; Flags: waituntilterminated


[Code]


procedure InitializeWizard();

var
    ErrorCode: Integer;

begin
	//comandos que realiza a finaliza��o dos executaveis;

	//ShellExec('open',  'taskkill.exe', '/f /im RetornaEmailsAgencia.exe','',SW_HIDE,ewNoWait,ErrorCode);
end;






procedure CurStepChanged(CurStep: TSetupStep);
var
    ErrorCode: Integer;
begin
  if CurStep = ssPostInstall then
	begin
      Sleep(2000);
		//msgbox ('TESTE1',mbError, mb_Ok);
		if (FileExists('C:\banco\servidor\Altera_chaves.exe')) then
		begin
			//msgbox ('TESTE2',mbError, mb_Ok);
		//	Shellexec ('',ExpandConstant ('{sd}\banco\servidor\Altera_chaves.exe'),'','',SW_SHOW,ewNoWait,ErrorCode);

      Sleep(5000);
      DeleteFile(ExpandConstant('{sd}\banco\servidor\Altera_chaves.exe'));
			//msgbox ('TESTE3',mbError, mb_Ok);
		end;
		//msgbox ('TESTE4',mbError, mb_Ok);
	end;
end;



//-----------------------------------------------------------------------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------------------------------------------------------------------//
//-----------------------------------------------------------------------------------------------------------------------------------------------//

