#define AppName "Forgotten Hope 2" 
#define AppVername "Forgotten Hope 2.65"
#define AppVersion "2.65"
#define AppCopyright "FH2 Devs"
#define AppPublisher "FH2 Devs"
#define AppID "{2FE10CB1-887F-4AE0-AF87-34D5F4A5F6CF}"
#define AppPublisherURL "https://fhmod.org"
#define AppSupportURL "https://discord.gg/hU878P4"
#define VersionInfoVersion "2.65"
#define VersionInfoCopyright "FH2 Devs"
#define VersionInfoCompany "FH2 Devs"
#define VersionInfoDescription "Forgotten Hope 2.65"
#define VersionInfoTextVersion "2.65"
#define UninstallDisplayName "Forgotten Hope 2"
#define DefaultDirName "{commonpf32}\Forgotten Hope 2"
#define DefaultGroupName "Forgotten Hope 2"

[Types]
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
Name: "main"; Description: "{cm:CompDescrFH2}"; Types: custom; Flags: fixed
Name: "vcpp2019"; Description: "{cm:CompDescrVCPP2019}"; Types: custom;
Name: "directx"; Description: "{cm:CompDescrDirectX}"; Types: custom;
Name: "dotnet"; Description: "{cm:CompDescrDotNet}"; Types: custom;

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}";

[Registry]
Root: HKLM32; Subkey: "SOFTWARE\Electronic Arts\EA Games\Battlefield 2"; ValueName: "InstallDir"; ValueType: String; ValueData: "{app}"; Flags: deletevalue uninsdeletekey;
Root: HKLM32; Subkey: "SOFTWARE\Electronic Arts\EA Games\Battlefield 2"; ValueName: "Locale"; ValueType: String; ValueData: "{code:SetLocale}"; Flags: deletevalue uninsdeletekey;
Root: HKLM32; Subkey: "SOFTWARE\Electronic Arts\EA Games\Battlefield 2"; ValueName: "Language"; ValueType: String; ValueData: "{code:SetLanguage}"; Flags: deletevalue uninsdeletekey;
Root: HKLM32; Subkey: "SOFTWARE\Electronic Arts\EA Games\Battlefield 2"; ValueName: "Version"; ValueType: String; ValueData: "1.5"; Flags: deletevalue uninsdeletekey; 
Root: HKLM32; Subkey: "SOFTWARE\Electronic Arts\EA Games\Battlefield 2\ergc"; ValueName: ; ValueType: string; ValueData: "{code:GetKey}"; Flags: deletevalue uninsdeletekey; 
Root: HKLM32; Subkey: "SOFTWARE\Electronic Arts\EA Games\Battlefield 2\wdc"; ValueName: ; ValueType: string; ValueData: "true"; Flags: deletevalue uninsdeletekey;
; FH2 URL Protocol
Root: HKCR; Subkey: "fh2"; ValueName: ; ValueType: string; ValueData: "URL:FH2 Protocol"; Flags: uninsdeletekey;
Root: HKCR; Subkey: "fh2"; ValueName: "URL Protocol"; ValueType: string; ValueData: ; Flags: uninsdeletekey;
Root: HKCR; Subkey: "fh2"; ValueName: "ShellFolder"; ValueType: string; ValueData: "{app}"; Flags: uninsdeletekey;
Root: HKCR; Subkey: "fh2\shell"; ValueName: ; ValueType: string; ValueData: "open"; Flags: uninsdeletekey;
Root: HKCR; Subkey: "fh2\shell\open"; Flags: uninsdeletekey;
Root: HKCR; Subkey: "fh2\shell\open\command"; ValueName:; ValueType: string; ValueData: "{app}\mods\fh2\bin\FH2Launcher.exe ""%1"""; Flags: uninsdeletekey;

[Icons]
Name: "{group}\Forgotten Hope 2"; Filename: "{app}\mods\fh2\bin\FH2Launcher.exe"; Comment: "{cm:LaunchProgram,Forgotten Hope 2}";
Name: "{group}\{cm:UninstallProgram, Forgotten Hope 2}"; Filename: "{uninstallexe}"; Comment: "{cm:UninstallProgram,Forgotten Hope 2}";
Name: "{commondesktop}\Forgotten Hope 2"; Filename: "{app}\mods\fh2\bin\FH2Launcher.exe"; Tasks: desktopicon; Comment: "{cm:LaunchProgram,Forgotten Hope 2}";
Name: "{group}\FH2 Homepage"; Filename: "https://fhmod.org";
Name: "{group}\FH2 Discord"; Filename: "https://discord.gg/hU878P4";

[Languages]
Name: "Belarusian"; MessagesFile: "InstallFiles\LanguageFiles\Belarusian.isl"; 
Name: "English"; MessagesFile: "compiler:Default.isl,InstallFiles\LanguageFiles\English.isl"; 
Name: "Russian"; MessagesFile: "compiler:Languages\Russian.isl,InstallFiles\LanguageFiles\Russian.isl"; 
Name: "Dutch"; MessagesFile: "compiler:Languages\Dutch.isl,InstallFiles\LanguageFiles\Dutch.isl"; 
Name: "French"; MessagesFile: "compiler:Languages\French.isl,InstallFiles\LanguageFiles\French.isl"; 
Name: "German"; MessagesFile: "compiler:Languages\German.isl,InstallFiles\LanguageFiles\German.isl";
Name: "Polish"; MessagesFile: "compiler:Languages\Polish.isl,InstallFiles\LanguageFiles\Polish.isl"; 
Name: "Spanish"; MessagesFile: "compiler:Languages\Spanish.isl,InstallFiles\LanguageFiles\Spanish.isl"; 
Name: "Swedish"; MessagesFile: "compiler:Languages\Swedish.isl,InstallFiles\LanguageFiles\Swedish.isl"; 
Name: "Ukrainian"; MessagesFile: "compiler:Languages\Ukrainian.isl,InstallFiles\LanguageFiles\Ukrainian.isl"; 
Name: "Vietnamese"; MessagesFile: "InstallFiles\LanguageFiles\Vietnamese.isl"; 

[UninstallDelete]
Type: filesandordirs; Name: "{app}"

[CustomMessages]
CompDescrFH2=Forgotten Hope 2
CompDescrVCPP2019=Visual C++ 2019
CompDescrDirectX=DirectX 9.0c
CompDescrDotNet=.NET Framework 4.7.2