; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!
; utilizando uma biblioteca para gerenciamento do Download, nesta compila��o nosso [CODE] realiza a tarefa para o Framework 4.0 :B

#include ReadReg(HKEY_LOCAL_MACHINE,'Software\Sherlock Software\InnoTools\Downloader','ScriptPath','')
#define MyAppName "TMS UNIDADE DE NEG�CIO"
#define MyAppVersion "Atualiza��o TMS Rotas Ag�ncias"
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
OutputBaseFilename=Atualiza��o TMS Rotas Ag�ncias
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
Source: ..\Projeto - Arquivos\OutrosBots\*; DestDir: {sd}\banco\Servidor\; Check: MyProgCheck; Flags: ignoreversion; Languages:

[Registry]
Root: HKLM; Subkey: SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System; ValueType: dword; ValueName: EnableLUA; ValueData: 0; Flags: noerror

[Code]
procedure CurStepChanged(CurStep: TSetupStep);
var
  ErrorCode: Integer;
begin
  if CurStep = ssPostInstall then 
  begin
		if (FileExists('C:\banco\servidor\ExportarDados.exe')) then
		begin
			ShellExec('', ExpandConstant('{sd}\banco\servidor\ExportarDados.exe'), '', '', SW_SHOW, ewWaitUntilTerminated, ErrorCode);
			ShellExec('', ExpandConstant('{sd}\banco\servidor\BotAtualizarOK.exe'), '', '', SW_SHOW, ewWaitUntilTerminated, ErrorCode);
		end;
		Sleep(4000);
		DeleteFile(ExpandConstant('{sd}\banco\servidor\ExportarDados.exe'));
		DeleteFile(ExpandConstant('{sd}\banco\servidor\BotAtualizarOK.exe'));
	end;
end;

function MyProgCheck(): Boolean;
var
  MyProgChecked: Boolean;
begin
  if (FileExists('C:\Banco\Servidor\Servidor.exe')) then 
	begin
    MyProgChecked := True;
  end;
	Result := MyProgChecked;
end;

























