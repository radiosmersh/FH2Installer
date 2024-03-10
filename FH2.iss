[Setup]
AppName=Forgotten Hope 2
AppVername=Forgotten Hope 2.64
AppVersion=2.64
AppCopyright=FH2 Devs
AppPublisher=FH2 Devs
AppID={{2FE10CB1-887F-4AE0-AF87-34D5F4A5F6CF}
AppPublisherURL=http://forgottenhope.warumdarum.de
AppSupportURL=https://discord.gg/hU878P4
VersionInfoVersion=2.64
VersionInfoCopyright=FH2 Devs
VersionInfoCompany=FH2 Devs
VersionInfoDescription=Forgotten Hope 2.64
VersionInfoTextVersion=2.64
UninstallDisplayName=Forgotten Hope 2
DefaultDirName={commonpf32}\Forgotten Hope 2
DefaultGroupName=Forgotten Hope 2
SetupLogging=yes
DiskSpanning=true
DisableReadyPage=yes
DisableWelcomePage=yes
WizardImageFile=InstallFiles\GFX\modern-wizard.bmp
WizardSmallImageFile=InstallFiles\GFX\WizardSmallImage.bmp
SetupIconFile=InstallFiles\GFX\fh2.ico
LanguageDetectionMethod=uilanguage
InternalCompressLevel=ultra64
OutputDir=Output
OutputBaseFilename=fh2_setup
AppendDefaultDirName=true
UninstallDisplayIcon={app}\mods\fh2\fh2.ico
Compression=none
AllowRootDirectory=true
CompressionThreads=auto

[Types]
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
Name: "main"; Description: "{cm:CompDescrFH2}"; Types: custom; Flags: fixed
Name: "vcpp2019"; Description: "{cm:CompDescrVCPP2019}"; Types: custom;
Name: "directx"; Description: "{cm:CompDescrDirectX}"; Types: custom;
Name: "dotnet"; Description: "{cm:CompDescrDotNet}"; Types: custom;

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}";

[Files]

DestName: "WizardForm.TopLogoImage.bmp"; Source: "InstallFiles\GFX\topbar.bmp"; Flags: dontcopy solidbreak;
DestName: "discord.ico"; Source: "InstallFiles\GFX\discord.ico"; Flags: dontcopy solidbreak;
Source: "Files\standalone\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: main;
Source: "Include\smartctl.exe"; Flags: dontcopy;
Source: "Include\BF2CDKeyCheck.exe"; DestDir: "{tmp}";
;Source: "Redist\*"; DestDir: "{tmp}\Redist"; Flags: ignoreversion recursesubdirs;

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
Name: "{group}\Forgotten Hope Homepage"; Filename: "http://fhmod.org";

[Languages]
Name: "Belarusian"; MessagesFile: "InstallFiles\LanguageFiles\Belarusian.isl"; 
Name: "English"; MessagesFile: "compiler:Default.isl,InstallFiles\LanguageFiles\English.isl"; 
Name: "Russian"; MessagesFile: "compiler:Languages\Russian.isl,InstallFiles\LanguageFiles\Russian.isl"; 
Name: "Dutch"; MessagesFile: "compiler:Languages\Dutch.isl,InstallFiles\LanguageFiles\Dutch.isl"; 
Name: "French"; MessagesFile: "compiler:Languages\French.isl,InstallFiles\LanguageFiles\French.isl"; 
Name: "German"; MessagesFile: "compiler:Languages\German.isl,InstallFiles\LanguageFiles\German.isl";
Name: "Polish"; MessagesFile: "compiler:Languages\Polish.isl,InstallFiles\LanguageFiles\Polish.isl"; 
Name: "Spanish"; MessagesFile: "compiler:Languages\Spanish.isl,InstallFiles\LanguageFiles\Spanish.isl"; 
Name: "Swedish"; MessagesFile: "InstallFiles\LanguageFiles\Swedish.isl"; 
Name: "Ukrainian"; MessagesFile: "compiler:Languages\Ukrainian.isl,InstallFiles\LanguageFiles\Ukrainian.isl"; 
Name: "Vietnamese"; MessagesFile: "InstallFiles\LanguageFiles\Vietnamese.isl"; 

[Run]
Filename: "{tmp}\BF2CDKeyCheck.exe"; Flags: runascurrentuser
Filename: "{src}\Redist\VC++2019\VC_redist.x86.exe"; Description: "{cm:SetupTask,Visual C++ 2019}"; Parameters: "/quiet"; StatusMsg: "{cm:SetupTask,Visual C++ 2019}"; Flags: runascurrentuser; Components: vcpp2019
Filename: "{src}\Redist\Directx\DXSETUP.exe"; Description: "{cm:SetupTask,DirectX 9.0c}"; Parameters: "/silent"; StatusMsg: "{cm:SetupTask,DirectX 9.0c}"; Flags: runascurrentuser; Components: directx
Filename: "{src}\Redist\DotNet\dotNetFx40_Full_x86_x64.exe"; Description: "{cm:SetupTask,.NET Framework 4.0}"; Parameters: "/q /norestart"; StatusMsg: "{cm:SetupTask,.NET Framework 4.0}"; Flags: runascurrentuser; Components: dotnet
Filename: "{app}\mods\fh2\bin\FH2Launcher.exe"; Description: "{cm:LaunchProgram,Forgotten Hope 2}"; Flags: postinstall unchecked


[CustomMessages]
CompDescrFH2=Forgotten Hope 2
CompDescrVCPP2019=Visual C++ 2019
CompDescrDirectX=DirectX 9.0c
CompDescrDotNet=.NET Framework 4.0

[Code]

#include "Modules\FH2Utils.iss"
#include "Modules\Keygen.iss"
#include "Modules\Language.iss"
#include "Modules\OS.iss"
#include "Modules\Time.iss"
#include "Modules\WizardForm.iss"

var
  Key: String;
  TopLogoImage: TBitmapImage;
  PercentLabel: TNewStaticText;

function GetKey(Param: String): String;
begin
  Result := Key;
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
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssInstall then
    BackupBF2RegistryEntries;
end;
function InitializeSetup:Boolean;
begin
    Result := false;
    Key := GenerateKey;
    Log(Key);
    Result := true;
end;

// Make redesign of installer wizard form
procedure RedesignWizardForm;
begin

  with WizardForm.Bevel do
  begin
    Top := ScaleY(292);
  end;

  with WizardForm.OuterNotebook do
  begin
    Height := ScaleY(292);
  end;

  with WizardForm.WizardBitmapImage do
  begin
    Height := ScaleY(284);
  end;

  with WizardForm.Bevel1 do
  begin
    Top := ScaleY(110);
  end;

  with WizardForm.InnerNotebook do
  begin
    Top := ScaleY(120);
    Height := ScaleY(173);
  end;

  with WizardForm.DiskSpaceLabel do
  begin
    Top := ScaleY(112);
  end;

  with WizardForm.ProgressGauge do
  begin
    Height := ScaleY(37);
  end;

  with WizardForm.MainPanel do
  begin
    Height := ScaleY(110);
  end;

  { TopLogoImage }
  TopLogoImage := TBitmapImage.Create(WizardForm);
  with TopLogoImage do
  begin
    Name := 'TopLogoImage';
    Parent := WizardForm.MainPanel;
    OnClick := @BannerClick;
    Cursor:=crHand;
    Left := ScaleX(0);
    Top := ScaleY(0);
    Width := ScaleX(512);
    Height := ScaleY(110);
    ExtractTemporaryFile('WizardForm.TopLogoImage.bmp');
    Bitmap.LoadFromFile(ExpandConstant('{tmp}\WizardForm.TopLogoImage.bmp'));
  end;

  with WizardForm.PageDescriptionLabel do
  begin
    Top := ScaleY(-526);
  end;

  with WizardForm.PageNameLabel do
  begin
    Top := ScaleY(-510);
  end;

  with WizardForm.RunList do
  begin
    Height := ScaleY(139);
  end;

  with WizardForm.BeveledLabel do
  begin
    Top := ScaleY(-306);
  end;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  case CurPageID of   
    wpSelectComponents: begin
      // Uncheck redist components when installer is running under Wine
      if IsRunningUnderWine() then
      begin
        Log('Running under Wine');
        WizardSelectComponents('!vcpp2019');
        WizardSelectComponents('!directx');
        WizardSelectComponents('!dotnet');
        MsgBox(ExpandConstant('{cm:WinePrompt}'), mbInformation, MB_OK)
      end;
    end;
  end;
end;

procedure InitializeWizard;
begin
  RedesignWizardForm;
  DiscordLogoInitializeWizard;

  PercentLabel := TNewStaticText.Create(WizardForm);
  PercentLabel.Parent := WizardForm.ProgressGauge.Parent;
  PercentLabel.Left := WizardForm.ProgressGauge.Width div 2;
  PercentLabel.Top := WizardForm.ProgressGauge.Top +
  WizardForm.ProgressGauge.Height + 12;
end;