; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "ZScreen"     

#define SimpleVersion(str S);; \
	Local[0] = Pos (".0.0.", S),;; \
	/* (4) and (5) */;; \
	(Local[0] > 0) ? Copy (S, 1, 3) :;; \
	(;; \
		Local[0] = Pos (".0.0", S),;; \
		/* (3) */;; \
		(Local[0] > 0) ? Copy (S, 1, 3) :;; \
		(;; \
			Local[0] = Pos (".0", S),;; \
			/* (2) */;; \
			(Local[0] > 5) ? Copy (S, 1, Local[0] - 1) :;; \
			(;; \
				Local[0] = Pos (".0.", S),;; \
				/* (6) */;; \
				(Local[0] > 0) ? Copy (S, 1, 3) :;; \
				(;; \
					Copy (S, 1, 5);; \
				);; \
			);; \
		);; \
	);

#define ExePath "..\bin\Release\ZScreen.exe"
#define MyAppVersion GetFileVersion(ExePath)
#define MyAppPublisher "ZScreen Developers"
#define MyAppURL "http://code.google.com/p/zscreen"
#define MyAppMyAppName "ZScreen.exe"


[Setup]
AllowNoIcons=true
AppMutex=Global\0167D1A0-6054-42f5-BA2A-243648899A6B
AppId={#MyAppName}
AppName={#MyAppName}
AppPublisher={#MyAppName}
AppPublisherURL=http://code.google.com/p/zscreen
AppSupportURL=http://code.google.com/p/zscreen/issues/list
AppUpdatesURL=http://code.google.com/p/zscreen/downloads/list
AppVerName={#MyAppName} {#MyAppVersion}
AppVersion={#MyAppVersion}
ArchitecturesAllowed=x86 x64 ia64
ArchitecturesInstallIn64BitMode=x64 ia64
Compression=lzma/ultra64
CreateAppDir=true
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DirExistsWarning=no
InfoAfterFile=..\..\ZScreenLib\Documents\license.txt
InfoBeforeFile=..\..\ZScreenLib\Documents\VersionHistory.txt
InternalCompressLevel=ultra64
LanguageDetectionMethod=uilanguage
MinVersion=4.90.3000,5.0.2195sp3
OutputBaseFilename={#MyAppName}-{#MyAppVersion}-setup
OutputDir=..\..\..\Output\
PrivilegesRequired=none
;SetupIconFile=..\Resources\zss-main.ico
ShowLanguageDialog=auto
ShowUndisplayableLanguages=false
SignedUninstaller=false
SolidCompression=true
Uninstallable=true
UninstallDisplayIcon={app}\{#MyAppName}.exe
UsePreviousAppDir=yes
UsePreviousGroup=yes
VersionInfoCompany={#MyAppName}
VersionInfoTextVersion={#MyAppVersion}
VersionInfoVersion={#MyAppVersion}

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: ..\bin\Release\*.exe; Excludes: *.vshost.exe; DestDir: {app}; Flags: ignoreversion
Source: ..\bin\Release\*.dll; DestDir: {app}; Flags: ignoreversion recursesubdirs

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppMyAppName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppMyAppName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppMyAppName}"; Tasks: quicklaunchicon

[Run]
Filename: {app}\{#MyAppName}.exe.; Description: {cm:LaunchProgram,ZScreen}; Flags: nowait postinstall skipifsilent

