; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "AtualizaçãoModulosMatriz"
#define MyAppVersion "07/04/2015"
#define MyAppPublisher "Expresso São Miguel"
#define MyAppURL "http://www.expressosaomiguel.com.br"
#define MyAppName "Matriz"
[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{690294A7-47CE-4DE7-BB74-C1E8326EEB5A}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\Expresso sao miguel\Matriz
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir=C:\INSTALADOR\Projeto - Compilador
OutputBaseFilename=att_rpts_07-04-15
SetupIconFile=C:\INSTALADOR\Projeto - Compilador\icone.ico
Compression=lzma
SolidCompression=true
WizardImageFile=C:\INSTALADOR\Projeto - Arquivos\Logos\logo - Cópia (Mobile).bmp
WizardSmallImageFile=C:\INSTALADOR\Projeto - Arquivos\Logos\logo_direito.bmp

[Languages]
Name: brazilianportuguese; MessagesFile: compiler:Languages\BrazilianPortuguese.isl

[Files]
Source: ..\Projeto - Arquivos\Matriz\*; DestDir: {app}; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Code]

//incialização do setup, sempre chamada pelo Inno ao iniciar o setup
procedure InitializeWizard();
var
    ErrorCode: Integer;

begin
	//comandos que realiza a finalização dos executaveis;
      ShellExec('open',  'taskkill.exe', '/f /im ERP.exe','',SW_HIDE,ewNoWait,ErrorCode);
end;
