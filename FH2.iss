[Setup]
AppName=Forgotten Hope 2
AppVerName=Forgotten Hope 2.54
AppCopyright=FH2 Devs
AppPublisher=FH2 Devs
AppID={{2FE10CB1-887F-4AE0-AF87-34D5F4A5F6CF}
AppPublisherURL=http://fhmod.org
AppSupportURL=http://fhpubforum.warumdarum.de
AppVersion=2.53
VersionInfoVersion=2.53
VersionInfoCopyright=FH2 Devs
VersionInfoCompany=FH2 Devs
VersionInfoDescription=Forgotten Hope 2.54
VersionInfoTextVersion=2.54
SetupLogging=yes
DiskSpanning=true
DisableReadyPage=yes
DisableWelcomePage=no
UninstallDisplayName=Forgotten Hope 2
DefaultDirName={pf32}\Forgotten Hope 2
DefaultGroupName=Forgotten Hope 2
WizardImageFile=InstallFiles\GFX\modern-wizard.bmp
WizardSmallImageFile=InstallFiles\GFX\WizardSmallImage.bmp
SetupIconFile=InstallFiles\GFX\fh2.ico
PrivilegesRequired=admin
LanguageDetectionMethod=uilanguageInternalCompressLevel=ultra64
OutputDir=Output
OutputBaseFilename=fh2_setup
AppendDefaultDirName=true
UninstallDisplayIcon={app}\mods\fh2\fh2.ico
Compression=none
AllowRootDirectory=true

[Components]
Name: "main"; Description: "{cm:CompDescrFH2}"; Types: full compact custom; Flags: fixed
Name: "cmp_updater"; Description: "{cm:CompDescrCommunityUpdater}"; Types: full;
Name: "directx"; Description: "{cm:CompDescrDirectX}"; Types: full;
Name: "dotnet"; Description: "{cm:CompDescrDotNet}"; Types: full;
Name: "fh2_rus"; Description: "Установить дополнительную русификацию"; Types: full;

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}";

[Files]
Source: "Files\main\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: main;
Source: "Files\CommunityUpdater\*"; DestDir: "{app}\mods\fh2\CommunityUpdater"; Flags: ignoreversion recursesubdirs; Components: cmp_updater;
Source: "Files\fh2_rus\*"; DestDir: "{app}\mods\fh2"; Flags: ignoreversion recursesubdirs; Components: fh2_rus;
Source: "Include\smartctl.exe"; Flags: dontcopy
Source: "Include\bf2crypt.exe"; Flags: dontcopy

[Registry]
Root: HKLM32; Subkey: "SOFTWARE\Electronic Arts\EA Games\Battlefield 2"; ValueName: "InstallDir"; ValueType: String; ValueData: "{app}"; Flags: deletevalue uninsdeletekey;
Root: HKLM32; Subkey: "SOFTWARE\Electronic Arts\EA Games\Battlefield 2"; ValueName: "Locale"; ValueType: String; ValueData: "en_US"; Flags: deletevalue uninsdeletekey;
Root: HKLM32; Subkey: "SOFTWARE\Electronic Arts\EA Games\Battlefield 2"; ValueName: "Language"; ValueType: String; ValueData: "{language}"; Flags: deletevalue uninsdeletekey;
Root: HKLM32; Subkey: "SOFTWARE\Electronic Arts\EA Games\Battlefield 2"; ValueName: "Version"; ValueType: String; ValueData: "1.5"; Flags: deletevalue uninsdeletekey; 
Root: HKLM32; Subkey: "SOFTWARE\Electronic Arts\EA Games\Battlefield 2\ergc"; ValueName: ; ValueType: string; ValueData: "{code:SendKey}"; Flags: deletevalue uninsdeletekey; 
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
Name: "{group}\FH2 Community Updater"; Filename: "{app}\mods\fh2\CommunityUpdater\FH2CommunityUpdater.exe"; Comment: "{cm:LaunchProgram,FH2 Community Updater}"; Components: cmp_updater;
Name: "{group}\{cm:UninstallProgram, Forgotten Hope 2}"; Filename: "{uninstallexe}"; Comment: "{cm:UninstallProgram,Forgotten Hope 2}";
Name: "{userdesktop}\Forgotten Hope 2"; Filename: "{app}\mods\fh2\bin\FH2Launcher.exe"; Tasks: desktopicon; Comment: "{cm:LaunchProgram,Forgotten Hope 2}";
Name: "{userdesktop}\FH2 Community Updater"; Filename: "{app}\mods\fh2\CommunityUpdater\FH2CommunityUpdater.exe"; Tasks: desktopicon; Comment: "{cm:LaunchProgram,FH2 Community Updater}"; Components: cmp_updater;
Name: "{group}\Forgotten Hope Homepage"; Filename: "http://fhmod.org";

[Languages]
Name: "English"; MessagesFile: "InstallFiles\LanguageFiles\English.isl"; 
Name: "Russian"; MessagesFile: "InstallFiles\LanguageFiles\Russian.isl"; 
Name: "Chinese"; MessagesFile: "InstallFiles\LanguageFiles\ChineseSimplified.isl"; 
Name: "Dutch"; MessagesFile: "InstallFiles\LanguageFiles\Dutch.isl"; 
Name: "French"; MessagesFile: "InstallFiles\LanguageFiles\French.isl"; 
Name: "German"; MessagesFile: "InstallFiles\LanguageFiles\German.isl";
Name: "Italian"; MessagesFile: "InstallFiles\LanguageFiles\Italian.isl"; 
Name: "Japanese"; MessagesFile: "InstallFiles\LanguageFiles\Japanese.isl";
Name: "Korean"; MessagesFile: "InstallFiles\LanguageFiles\Korean.isl"; 
Name: "Polish"; MessagesFile: "InstallFiles\LanguageFiles\Polish.isl"; 
Name: "Spanish"; MessagesFile: "InstallFiles\LanguageFiles\Spanish.isl"; 
Name: "Swedish"; MessagesFile: "InstallFiles\LanguageFiles\Swedish.isl"; 
Name: "Thai"; MessagesFile: "InstallFiles\LanguageFiles\Thai.isl";

[Run]
Filename: "{src}\Redist\DirectX\dxwebsetup.exe"; Parameters: /q; Description: "{cm:SetupTask, DirectX 9.0c}"; StatusMsg: "{cm:SetupTask,DirectX 9.0c}"; Components: directx; Flags: runascurrentuser;
Filename: "{src}\Redist\DotNet\dotnetfx35setup.exe"; Description: "{cm:SetupTask, .NET Framework 3.5}"; StatusMsg: "{cm:SetupTask,.NET Framework 3.5}"; Check: not IsRequiredDotNetDetected; Components: dotnet; OnlyBelowVersion: 6.1; Flags: runascurrentuser
Filename: "dism"; Parameters: /online /enable-feature /featurename:NetFx3 /NoRestart; Description: "{cm:SetupTask,.NET Framework 3.5}"; StatusMsg: "{cm:SetupTask, .NET Framework 3.5}"; Check: not IsRequiredDotNetDetected; Components: dotnet; MinVersion: 6.1; Flags: runascurrentuser
Filename: "{app}\mods\fh2\bin\FH2Launcher.exe"; Description: "{cm:LaunchProgram,Forgotten Hope 2}"; Flags: postinstall unchecked;


[CustomMessages]
CompDescrFH2=Forgotten Hope 2
CompDescrDirectX=DirectX 9.0c
CompDescrDotNet=.NET Framework 3.5
CompDescrRus=Русификатор
CompDescrCommunityUpdater=Community Updater

[Code]

var
  Key: String;
  EncryptedKey: String;
  
#include "Modules\Lib.iss"

function SendKey(Param: String): String;
var
  WinHttpReq: Variant;
begin
  WinHttpReq := CreateOleObject('WinHttp.WinHttpRequest.5.1');
  WinHttpReq.Open('POST', 'https://fhsw-stats.xyz/flask/', false);
  WinHttpReq.SetRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	try
		WinHttpReq.Send(GetMD5OfString(Key));
	except
		try 
			WinHttpReq.Send(GetMD5OfString(Key));
		except
			end;
	end;
  Result := 'x9392' + EncryptedKey;
end;


procedure InitializeWizard;
var
  List: TStringList;
begin
  PercentLabel := TNewStaticText.Create(WizardForm);
  PercentLabel.Parent := WizardForm.ProgressGauge.Parent;
  PercentLabel.Left := WizardForm.ProgressGauge.Width div 2;
  PercentLabel.Top := WizardForm.ProgressGauge.Top +
    WizardForm.ProgressGauge.Height + 12;

  ElapsedLabel := TNewStaticText.Create(WizardForm);
  ElapsedLabel.Parent := WizardForm.ProgressGauge.Parent;
  ElapsedLabel.Left := 0;
  ElapsedLabel.Top := PercentLabel.Top + PercentLabel.Height + 4;

  RemainingLabel := TNewStaticText.Create(WizardForm);
  RemainingLabel.Parent := WizardForm.ProgressGauge.Parent;
  RemainingLabel.Left := 0;
  RemainingLabel.Top := ElapsedLabel.Top + ElapsedLabel.Height + 4;

  if not isRussian then
  begin
    List := TStringList.Create;
    try
      List.Add(ExpandConstant('{cm:CompDescrRus}'));
      DeleteComponents(List);
    finally
      List.Free;
    end;
  end;
end; 

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpInstalling then
    StartTick := GetTickCount;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  if CurPageID = wpInstalling then
  begin
    Cancel := False;
    if ExitSetupMsgBox then
    begin
      Cancel := True;
      Confirm := False;
      PercentLabel.Visible := False;
      ElapsedLabel.Visible := False;
      RemainingLabel.Visible := False;
    end;
  end;
end;

procedure CurInstallProgressChanged(CurProgress, MaxProgress: Integer);
var
  CurTick: DWORD;
begin
  CurTick := GetTickCount;
  PercentLabel.Caption :=
    Format('%.1f %%', [(CurProgress * 100.0) / MaxProgress]);
  ElapsedLabel.Caption := 
    Format(ExpandConstant('{cm:ElapsedTime}') + ' %s', [TicksToStr(CurTick - StartTick)]);
  if CurProgress > 0 then
  begin
    RemainingLabel.Caption :=
      Format(ExpandConstant('{cm:RemainingTime}') + ' %s', [TicksToStr(
        ((CurTick - StartTick) / CurProgress) * (MaxProgress - CurProgress))]);
  end;
end;
  
function InitializeSetup:Boolean;
begin
    Result := false;
    Key := GetKey;
    EncryptedKey := EncryptKey(Key);
    Log(Key);
    Log(EncryptedKey);
    Result := true;
end;
