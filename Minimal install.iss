#include "Common.iss"

[Setup]
AppName={#AppName}
AppVername={#AppVername}
AppVersion={#AppVersion}
AppCopyright={#AppCopyright}
AppPublisher={#AppPublisher}
AppID={{#AppID}
AppPublisherURL={#AppPublisherURL}
AppSupportURL={#AppSupportURL}
VersionInfoVersion={#VersionInfoVersion}
VersionInfoCopyright={#VersionInfoCopyright}
VersionInfoCompany={#VersionInfoCompany}
VersionInfoDescription={#VersionInfoDescription}
VersionInfoTextVersion={#VersionInfoTextVersion}
UninstallDisplayName={#UninstallDisplayName}
DefaultDirName={#DefaultDirName}
DefaultGroupName={#DefaultGroupName}
SetupLogging=yes
DiskSpanning=no
DisableFinishedPage=yes
DisableReadyPage=yes
DisableWelcomePage=yes
WizardImageFile=InstallFiles\GFX\modern-wizard.bmp
WizardSmallImageFile=InstallFiles\GFX\WizardSmallImage.bmp
SetupIconFile=InstallFiles\GFX\fh2.ico
LanguageDetectionMethod=uilanguage
InternalCompressLevel=ultra64
OutputDir=Output_slim
OutputBaseFilename=FH2 Slim Installer
AppendDefaultDirName=true
UninstallDisplayIcon={app}\mods\fh2\fh2.ico
Compression=none
AllowRootDirectory=true
CompressionThreads=auto

[Files]
DestName: "WizardForm.TopLogoImage.bmp"; Source: "InstallFiles\GFX\topbar.bmp"; Flags: dontcopy solidbreak;
DestName: "discord.ico"; Source: "InstallFiles\GFX\discord.ico"; Flags: dontcopy solidbreak;
Source: "Files\slim\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: main;
Source: "Include\smartctl.exe"; Flags: dontcopy;
Source: "Include\BF2CDKeyCheck.exe"; DestDir: "{tmp}";
Source: "Redist\*"; DestDir: "{tmp}\Redist"; Flags: ignoreversion recursesubdirs;
Source: "Files\slim\mods\fh2\bin\*.*"; DestDir: "{tmp}\bin"; Flags: ignoreversion recursesubdirs; Components: main;

[Run]
Filename: "{tmp}\BF2CDKeyCheck.exe"; Flags: runascurrentuser
Filename: "{tmp}\Redist\VC++2019\VC_redist.x86.exe"; Description: "{cm:SetupTask,Visual C++ 2019}"; Parameters: "/quiet"; StatusMsg: "{cm:SetupTask,Visual C++ 2019}"; Flags: runascurrentuser; Components: vcpp2019
Filename: "{tmp}\Redist\Directx\DirectX.exe"; Description: "{cm:SetupTask,DirectX 9.0c}"; StatusMsg: "{cm:SetupTask,DirectX 9.0c}"; Flags: runascurrentuser; Components: directx
Filename: "{tmp}\Redist\DotNet\NDP472-KB4054530-x86-x64-AllOS-ENU.exe"; Description: "{cm:SetupTask,.NET Framework 4.7.2}"; Parameters: "/q /norestart"; StatusMsg: "{cm:SetupTask,.NET Framework 4.7.2}"; Check: (not IsRunningUnderWine) and IsWin81OrBelow; Flags: runascurrentuser; Components: dotnet; AfterInstall: GetFH2Files
Filename: "{app}\mods\fh2\bin\FH2Launcher.exe"; Description: "{cm:LaunchProgram,Forgotten Hope 2}"; Flags: postinstall unchecked

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
  CancelWithoutPrompt: boolean;

function GetKey(Param: String): String;
begin
  Result := Key;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  if CurPageID = wpInstalling then
  begin
    Cancel := False;
    Confirm := not CancelWithoutPrompt;
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
    CancelWithoutPrompt := false;
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

  // Uncheck redist components when installer is running under Wine
  if IsRunningUnderWine() then
  begin
    WizardSelectComponents('!vcpp2019');
    WizardSelectComponents('!directx');
    WizardSelectComponents('!dotnet');
  end;
end;

procedure GetFH2Files;
var
  WinHttpReq: Variant;
  BF2Path, DestPath, FullVersion, LauncherPath, ModDescFilePath, Params: String;
  ResultCode, UploadSpeed: Integer;
begin
  WizardForm.StatusLabel.Caption := ExpandConstant('{cm:DownloadingSomething,Forgotten Hope 2}');
  WinHttpReq := CreateOleObject('WinHttp.WinHttpRequest.5.1');
  WinHttpReq.Open('GET', 'https://forgottenhope.warumdarum.de/fh2share/latestversion.php', False);
  try
    WinHttpReq.Send('');
  except
    begin
      Log('Host timeout');
      CancelWithoutPrompt := true;
      WizardForm.Close;
    end;
  end;
  if WinHttpReq.Status <> 200 then
    begin
      Log('HTTP Error: ' + IntToStr(WinHttpReq.Status) + ' ' + WinHttpReq.StatusText);
      MsgBox(ExpandConstant('{cm:FailedToObtainModVersion}'), mbInformation, MB_OK);        
    end
  else
    begin
      FullVersion := WinHttpReq.ResponseText;
      LauncherPath := ExpandConstant('{tmp}') + '\bin\FH2Updater.exe';
      BF2Path := ExpandConstant('{app}');
      UploadSpeed := 1024 * 1024; // 1 TB/s
      Params := '--update "' + BF2Path + '" "' + FullVersion + '" ' + IntToStr(UploadSpeed);
      Log(LauncherPath)
      Log(Params)
      Exec(LauncherPath, Params, '', SW_SHOW, ewWaitUntilTerminated, ResultCode);
      ModDescFilePath := ExpandConstant('{app}') + '\mods\fh2\mod.desc';
      if not FileExists(ModDescFilePath) then
      begin
        ResultCode := MsgBox(ExpandConstant('{cm:FH2UpdateFailed}'), mbError, MB_OK);
        DestPath := ExpandConstant('app') + '\mods\fh2\bin';
        if DirExists(DestPath) or CreateDir(DestPath) then
          DirectoryCopy(ExpandConstant('tmp') + '\bin', DestPath);
          LauncherPath := ExpandConstant('{app}') + '\mods\fh2\bin\FH2Launcher.exe';
          Exec(LauncherPath, Params, '', SW_SHOW, ewWaitUntilTerminated, ResultCode);
      end;
    end;
end;