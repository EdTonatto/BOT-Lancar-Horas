#define MyAppName "BOT Lançamento de Horas"
#define MyAppVersion "1.2"
#define MyAppPublisher "Eduardo Tonatto"
#define MyAppURL ""
#define MyAppExeName "BOT-Lancar-Horas"
#define MyAppIcoName "BOT-Lancar-Horas_Icone.ico"

[Setup]

AppId={{584A01DB-3EC0-4209-909D-9F74CD49ACBC}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
PrivilegesRequired=admin
DefaultDirName={pf}\BOT-Lancar-Horas
DisableDirPage=true
DefaultGroupName=BOTLancarHoras
DisableProgramGroupPage=true
OutputDir=.\..\Instaladores
OutputBaseFilename=Instalador_BOT-Lancar-Horas_1.2
VersionInfoVersion=1
SetupIconFile=.\..\Pasta Arquivos\BOT-Lancar-Horas_Icone.ico
Compression=lzma
SolidCompression=true
WizardImageFile=.\..\Pasta Arquivos\WizardImageFile.bmp
WizardSmallImageFile=.\..\Pasta Arquivos\WizardSmallImageFile.bmp
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

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: checkedonce

[Files]   
Source: ..\..\build\*; DestDir: {sd}\Program Files (x86)\BOT-Lancar-Horas\; Flags: ignoreversion recursesubdirs createallsubdirs
Source: ..\Pasta Arquivos\BOT-Lancar-Horas_Icone.ico; DestDir: {sd}\Program Files (x86)\BOT-Lancar-Horas\; Flags: ignoreversion
Source: ..\..\src\BOT-Horas-para-lancar.csv; DestDir: {sd}\Program Files (x86)\BOT-Lancar-Horas\; Check: checkCSVExistance; Flags: ignoreversion
Source: ..\..\src\drivers\*; DestDir: {sd}\Program Files (x86)\BOT-Lancar-Horas\drivers\; Flags: ignoreversion

[Icons]
Name: "\{#MyAppName}"; Filename: "\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userdesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\{#MyAppIcoName}"; Tasks: desktopicon

[Registry]
Root: HKLM; Subkey: SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System; ValueType: dword; ValueName: EnableLUA; ValueData: 0; Flags: noerror

[Code]
procedure InitializeWizard();
begin
	//Antes de iniciar o instalador.
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
	//Inicio da instalação.
	if CurStep = ssInstall then 
  begin

	end;
	
	//Final da instalação.
  if CurStep = ssPostInstall then 
  begin

  end;
end;

function checkCSVExistance(): Boolean;
var
  MyProgChecked: Boolean;
begin
  MyProgChecked := True
  if(FileExists('C:\Program Files (x86)\BOT-Lancar-Horas\BOT-Horas-para-lancar.csv'))then 
	begin
    MyProgChecked := False;
  end;
	Result := MyProgChecked;
end;














