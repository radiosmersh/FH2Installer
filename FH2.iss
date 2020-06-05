[Setup]
AppName=Forgotten Hope 2
AppVerName=Forgotten Hope 2.56
AppCopyright=FH2 Devs
AppPublisher=FH2 Devs
AppID={{2FE10CB1-887F-4AE0-AF87-34D5F4A5F6CF}
AppPublisherURL=http://fhmod.org
AppSupportURL=http://fhpubforum.warumdarum.de
AppVersion=2.56
VersionInfoVersion=2.56
VersionInfoCopyright=FH2 Devs
VersionInfoCompany=FH2 Devs
VersionInfoDescription=Forgotten Hope 2.56
VersionInfoTextVersion=2.56
SetupLogging=yes
DiskSpanning=true
DisableReadyPage=yes
DisableWelcomePage=yes
UninstallDisplayName=Forgotten Hope 2
DefaultDirName={pf32}\Forgotten Hope 2
DefaultGroupName=Forgotten Hope 2
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
WizardImageAlphaFormat=premultiplied 

[Types]
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
Name: "main"; Description: "{cm:CompDescrFH2}"; Types: custom; Flags: fixed
Name: "directx"; Description: "{cm:CompDescrDirectX}"; Types: custom;
Name: "dotnet"; Description: "{cm:CompDescrDotNet}"; Types: custom;

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}";

[Files]
Source: "Files\main\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: main;
Source: "Include\smartctl.exe"; Flags: dontcopy
Source: "Include\BF2CDKeyCheck.exe"; DestDir: "{tmp}"
DestName: "WizardForm.TopLogoImage.bmp"; Source: "InstallFiles\GFX\topbar_alt.bmp"; Flags: dontcopy solidbreak
DestName: "Discord-Logo-Color.bmp"; Source: "InstallFiles\GFX\Discord-Logo-Color.bmp"; Flags: dontcopy solidbreak

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
Name: "{userdesktop}\Forgotten Hope 2"; Filename: "{app}\mods\fh2\bin\FH2Launcher.exe"; Tasks: desktopicon; Comment: "{cm:LaunchProgram,Forgotten Hope 2}";
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
Filename: "{tmp}\BF2CDKeyCheck.exe";
Filename: "{src}\Redist\DirectX\DXSETUP.exe"; Parameters: "/silent"; Description: "{cm:SetupTask, DirectX 9.0c}"; StatusMsg: "{cm:SetupTask,DirectX 9.0c}"; Components: directx; Flags: runascurrentuser;
Filename: "{src}\Redist\DotNet\dotnetfx35setup.exe"; Description: "{cm:SetupTask, .NET Framework 3.5}"; StatusMsg: "{cm:SetupTask,.NET Framework 3.5}"; Check: not IsRequiredDotNetDetected; OnlyBelowVersion: 6.1; Flags: runascurrentuser
Filename: "dism"; Parameters: /online /enable-feature /featurename:NetFx3 /NoRestart; Description: "{cm:SetupTask,.NET Framework 3.5}"; StatusMsg: "{cm:SetupTask, .NET Framework 3.5}"; Check: not IsRequiredDotNetDetected; MinVersion: 6.1; Flags: runascurrentuser
Filename: "{app}\mods\fh2\bin\FH2Launcher.exe"; Description: "{cm:LaunchProgram,Forgotten Hope 2}"; Flags: postinstall unchecked;


[CustomMessages]
CompDescrFH2=Forgotten Hope 2
CompDescrDirectX=DirectX 9.0c
CompDescrDotNet=.NET Framework 3.5

[Code]

var
  Key: String;
  TopLogoImage: TBitmapImage;
  
#include "Modules\Lib.iss"

function GetKey(Param: String): String;
begin
  Result := Key;
end;

procedure BannerClick(Sender: TObject);
var
  ErrorCode:integer;
begin
  ShellExecAsOriginalUser('open','https://discord.gg/hU878P4','','',SW_SHOWNORMAL, ewNoWait, ErrorCode);
end;


procedure DiscordLogoOnClick(Sender: TObject);
var
  ErrorCode: Integer;
begin
  ShellExecAsOriginalUser('open', 'https://discord.gg/hU878P4', '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode);
end;

procedure DiscordLogoInitializeWizard;
var
  DiscordLogoFileName: String;
  DiscordLogo: TBitmapImage;
  BevelTop: Integer;
begin
  DiscordLogoFileName := ExpandConstant('{tmp}\Discord-Logo-Color.bmp');
  ExtractTemporaryFile(ExtractFileName(DiscordLogoFileName));
  DiscordLogo := TBitmapImage.Create(WizardForm);
  DiscordLogo.AutoSize := True;
  DiscordLogo.Bitmap.LoadFromFile(DiscordLogoFileName);
  BevelTop := WizardForm.Bevel.Top;
  DiscordLogo.Top := BevelTop + (WizardForm.ClientHeight - BevelTop - DiscordLogo.Bitmap.Height) div 2;
  DiscordLogo.Left := DiscordLogo.Top - BevelTop;
  DiscordLogo.Cursor := crHand;
  DiscordLogo.OnClick := @DiscordLogoOnClick;
  DiscordLogo.Parent := WizardForm;
end;


// Make redesign of installer wizard form
procedure RedesignWizardForm();
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


procedure InitializeWizard;
var
  List: TStringList;
begin

  RedesignWizardForm();
  DiscordLogoInitializeWizard();

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
    Key := GenerateKey;
    Log(Key);
    Result := true;
end;
