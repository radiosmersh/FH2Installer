[Setup]
AppName=Forgotten Hope 2
AppVerName=Forgotten Hope 2.53
AppCopyright=FH2 Devs
AppPublisher=FH2 Devs
AppID={{2FE10CB1-887F-4AE0-AF87-34D5F4A5F6CF}
AppPublisherURL=http://fhmod.org
AppSupportURL=http://fhpubforum.warumdarum.de
AppVersion=2.53
VersionInfoVersion=2.53
VersionInfoCopyright=FH2 Devs
VersionInfoCompany=FH2 Devs
VersionInfoDescription=Forgotten Hope 2.53
VersionInfoTextVersion=2.53
SetupLogging=yes
DiskSpanning=true
DisableReadyPage=yes
DisableWelcomePage=no
UninstallDisplayName=Forgotten Hope 2
DefaultDirName={pf32}\Forgotten Hope 2
DefaultGroupName=Forgotten Hope 2
WizardImageFile=data\gfx\modern-wizard.bmp
WizardSmallImageFile=data\gfx\WizardSmallImage.bmp
SetupIconFile=data\gfx\fh2.ico
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
Name: "fh2_rus"; Description: "{cm:CompDescrRus}"; Types: full;

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}";

[Files]
Source: "files\main\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: main;
Source: "files\CommunityUpdater\*"; DestDir: "{app}\mods\fh2\CommunityUpdater"; Flags: ignoreversion recursesubdirs; Components: cmp_updater;
Source: "files\fh2_rus\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Components: fh2_rus;
Source: "files\smartctl.exe"; Flags: dontcopy

[Registry]
Root: HKLM32; Subkey: "SOFTWARE\Electronic Arts\EA Games\Battlefield 2"; ValueName: "InstallDir"; ValueType: String; ValueData: "{app}"; Flags: deletevalue uninsdeletekey;
Root: HKLM32; Subkey: "SOFTWARE\Electronic Arts\EA Games\Battlefield 2"; ValueName: "Locale"; ValueType: String; ValueData: "en_US"; Flags: deletevalue uninsdeletekey;
Root: HKLM32; Subkey: "SOFTWARE\Electronic Arts\EA Games\Battlefield 2"; ValueName: "Language"; ValueType: String; ValueData: "{language}"; Flags: deletevalue uninsdeletekey;
Root: HKLM32; Subkey: "SOFTWARE\Electronic Arts\EA Games\Battlefield 2"; ValueName: "Language"; ValueType: String; ValueData: English; Flags: deletevalue uninsdeletekey; Check: isRussian
Root: HKLM32; Subkey: "SOFTWARE\Electronic Arts\EA Games\Battlefield 2"; ValueName: "Language"; ValueType: String; ValueData: Russian; Flags: deletevalue uninsdeletekey; Check: isRussian; Components: fh2_rus
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
Name: "{group}\FH2 Community Updater"; Filename: "{app}\mods\fh2\CommunityUpdater\FH2CommunityUpdater.exe"; Comment: "{cm:LaunchProgram,FH2 Community Updater}"; Components: cmp_updater;
Name: "{group}\{cm:UninstallProgram, Forgotten Hope 2}"; Filename: "{uninstallexe}"; Comment: "{cm:UninstallProgram,Forgotten Hope 2}";
Name: "{userdesktop}\Forgotten Hope 2"; Filename: "{app}\mods\fh2\bin\FH2Launcher.exe"; Tasks: desktopicon; Comment: "{cm:LaunchProgram,Forgotten Hope 2}";
Name: "{userdesktop}\FH2 Community Updater"; Filename: "{app}\mods\fh2\CommunityUpdater\FH2CommunityUpdater.exe"; Tasks: desktopicon; Comment: "{cm:LaunchProgram,FH2 Community Updater}"; Components: cmp_updater;
Name: "{group}\Forgotten Hope Homepage"; Filename: "http://fhmod.org";

[Languages]
Name: "English"; MessagesFile: "data\lang\English.isl"; 
Name: "Russian"; MessagesFile: "data\lang\Russian.isl"; 
Name: "Chinese"; MessagesFile: "data\lang\ChineseSimplified.isl"; 
Name: "Dutch"; MessagesFile: "data\lang\Dutch.isl"; 
Name: "French"; MessagesFile: "data\lang\French.isl"; 
Name: "German"; MessagesFile: "data\lang\German.isl";
Name: "Italian"; MessagesFile: "data\lang\Italian.isl"; 
Name: "Japanese"; MessagesFile: "data\lang\Japanese.isl";
Name: "Korean"; MessagesFile: "data\lang\Korean.isl"; 
Name: "Polish"; MessagesFile: "data\lang\Polish.isl"; 
Name: "Spanish"; MessagesFile: "data\lang\Spanish.isl"; 
Name: "Swedish"; MessagesFile: "data\lang\Swedish.isl"; 
Name: "Thai"; MessagesFile: "data\lang\Thai.isl";

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

function CoCreateGuid(var Guid:TGuid):integer;
 external 'CoCreateGuid@ole32.dll stdcall';

function GetTickCount: DWORD;
  external 'GetTickCount@kernel32.dll stdcall';

const
  HexDigits = '0123456789ABCDEF';

var
  Serial: String;
  StartTick: DWORD;
  PercentLabel: TNewStaticText;
  ElapsedLabel: TNewStaticText;
  RemainingLabel: TNewStaticText;

function TicksToStr(Value: DWORD): string;
var
  I: DWORD;
  Hours, Minutes, Seconds: Integer;
begin
  I := Value div 1000;
  Seconds := I mod 60;
  I := I div 60;
  Minutes := I mod 60;
  I := I div 60;
  Hours := I mod 24;
  Result := Format('%.2d:%.2d:%.2d', [Hours, Minutes, Seconds]);
end;


  function IsDotNetDetected(version: string; service: cardinal): boolean;
// Indicates whether the specified version and service pack of the .NET Framework is installed.
//
// version -- Specify one of these strings for the required .NET Framework version:
//    'v1.1'          .NET Framework 1.1
//    'v2.0'          .NET Framework 2.0
//    'v3.0'          .NET Framework 3.0
//    'v3.5'          .NET Framework 3.5
//    'v4\Client'     .NET Framework 4.0 Client Profile
//    'v4\Full'       .NET Framework 4.0 Full Installation
//    'v4.5'          .NET Framework 4.5
//    'v4.5.1'        .NET Framework 4.5.1
//    'v4.5.2'        .NET Framework 4.5.2
//    'v4.6'          .NET Framework 4.6
//    'v4.6.1'        .NET Framework 4.6.1
//    'v4.6.2'        .NET Framework 4.6.2
//    'v4.7'          .NET Framework 4.7
//
// service -- Specify any non-negative integer for the required service pack level:
//    0               No service packs required
//    1, 2, etc.      Service pack 1, 2, etc. required
var
    key, versionKey: string;
    install, release, serviceCount, versionRelease: cardinal;
    success: boolean;
begin
    versionKey := version;
    versionRelease := 0;

    // .NET 1.1 and 2.0 embed release number in version key
    if version = 'v1.1' then begin
        versionKey := 'v1.1.4322';
    end else if version = 'v2.0' then begin
        versionKey := 'v2.0.50727';
    end

    // .NET 4.5 and newer install as update to .NET 4.0 Full
    else if Pos('v4.', version) = 1 then begin
        versionKey := 'v4\Full';
        case version of
          'v4.5':   versionRelease := 378389;
          'v4.5.1': versionRelease := 378675; // 378758 on Windows 8 and older
          'v4.5.2': versionRelease := 379893;
          'v4.6':   versionRelease := 393295; // 393297 on Windows 8.1 and older
          'v4.6.1': versionRelease := 394254; // 394271 before Win10 November Update
          'v4.6.2': versionRelease := 394802; // 394806 before Win10 Anniversary Update
          'v4.7':   versionRelease := 460798; // 460805 before Win10 Creators Update
        end;
    end;

    // installation key group for all .NET versions
    key := 'SOFTWARE\Microsoft\NET Framework Setup\NDP\' + versionKey;

    // .NET 3.0 uses value InstallSuccess in subkey Setup
    if Pos('v3.0', version) = 1 then begin
        success := RegQueryDWordValue(HKLM, key + '\Setup', 'InstallSuccess', install);
    end else begin
        success := RegQueryDWordValue(HKLM, key, 'Install', install);
    end;

    // .NET 4.0 and newer use value Servicing instead of SP
    if Pos('v4', version) = 1 then begin
        success := success and RegQueryDWordValue(HKLM, key, 'Servicing', serviceCount);
    end else begin
        success := success and RegQueryDWordValue(HKLM, key, 'SP', serviceCount);
    end;

    // .NET 4.5 and newer use additional value Release
    if versionRelease > 0 then begin
        success := success and RegQueryDWordValue(HKLM, key, 'Release', release);
        success := success and (release >= versionRelease);
    end;

    result := success and (install = 1) and (serviceCount >= service);
end;

function IsRequiredDotNetDetected(): boolean;
begin
    result := IsDotNetDetected('v3.5', 0);
end;


function isRussian(): boolean;    
begin
	if ExpandConstant('{language}') = 'Russian' then
		result := true
	else
		result := false;
end;

function IntToHex(Value: Integer; Digits: Integer): string;
var
  I: Integer;
begin
  SetLength(Result, Digits);
  for I := 0 to Digits - 1 do
  begin
    Result[Digits - I] := HexDigits[(Value and 15) + 1];
    Value := Value shr 4;
  end;
  while Value <> 0 do
  begin
    Result := HexDigits[(Value and 15) + 1] + Result;
    Value := Value shr 4;
  end;
end;

function GetGuid:string;
var Guid:TGuid;
begin
  if CoCreateGuid(Guid)=0 then begin
  result:='{'+IntToHex(Guid.D1,8)+'-'+
           IntToHex(Guid.D2,4)+'-'+
           IntToHex(Guid.D3,4)+'-'+
           IntToHex(Guid.D4[0],2)+IntToHex(Guid.D4[1],2)+'-'+
           IntToHex(Guid.D4[2],2)+IntToHex(Guid.D4[3],2)+
           IntToHex(Guid.D4[4],2)+IntToHex(Guid.D4[5],2)+
           IntToHex(Guid.D4[6],2)+IntToHex(Guid.D4[7],2)+
           '}';
  end else
    result:=GetDateTimeString('dd/mm/yyyy hh:nn:ss', '-', ':');
end;

function GetKey(Param: string): String;
Var
WinHttpReq: Variant;
begin
  WinHttpReq := CreateOleObject('WinHttp.WinHttpRequest.5.1');
  WinHttpReq.Open('POST', 'https://fhsw-stats.xyz/flask/', false);
  WinHttpReq.SetRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	try
		WinHttpReq.Send(Serial);
	except
		try 
			WinHttpReq.Send(Serial);
		except
			end;
	end;
  Result := Serial;
end;

procedure DeleteComponents(List: TStrings);
var
  I: Integer;
begin
  for I := WizardForm.ComponentsList.Items.Count - 1 downto 0 do
  begin
    if List.IndexOf(WizardForm.ComponentsList.Items[I]) <> -1 then
      WizardForm.ComponentsList.Items.Delete(I);
  end;
end;

function LoWord(dw: DWORD): WORD;
begin
  Result := WORD(dw);
end;

function HiWord(dw: DWORD): WORD;
begin
  Result := WORD((dw shr 16) and $FFFF);
end;

function WordToHex(w: WORD): string;
begin
  Result := Format('%.4x', [w]);
end;

function TryGetValue(const Strings: TArrayOfString; const Name: string;
  out Value: string): Boolean;
var
  S: string;
  P: Integer;
  I: Integer;
begin
  Result := False;
  for I := 0 to GetArrayLength(Strings) - 1 do
  begin
    S := Strings[I];	  
    P := Pos(':', S);
    if (P <> 0) and (CompareText(Copy(S, 1, P - 1), Name) = 0) then
    begin
      StringChangeEx(S, ' ', '', True);
      Value := Copy(S, P, MaxInt);
      Result := True;
      Exit;
    end;
  end;
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
    Format('%.2f %%', [(CurProgress * 100.0) / MaxProgress]);
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
var
TmpFileName, tmp: String; 
ExecStdout: TArrayOfString;
ResultCode, StrLength: Integer;
begin
    tmp := '';
    TmpFileName := ExpandConstant('{tmp}') + '\drive_serial.txt';
    ExtractTemporaryFile('smartctl.exe');
    Exec(ExpandConstant('{cmd}'), '/C ' + ExpandConstant('{tmp}') + '/smartctl.exe -i /dev/sda > "' + TmpFileName + '"', '', SW_HIDE,
      ewWaitUntilTerminated, ResultCode);
    if LoadStringsFromFile(TmpFileName, ExecStdout) then begin
      TryGetValue(ExecStdout, 'Serial Number', tmp);
    end;
    DeleteFile(TmpFileName);
    if tmp = '' then
      tmp := GetGuid;
    Serial := 'x9392'+GetMD5OfString(tmp);
    Result := true;
end;

