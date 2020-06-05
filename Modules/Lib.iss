[code]
const
  HexDigits = '0123456789ABCDEF';
  
var
  StartTick: DWORD;
  PercentLabel: TNewStaticText;
  ElapsedLabel: TNewStaticText;
  RemainingLabel: TNewStaticText;
  
function CoCreateGuid(var Guid:TGuid):integer; external 'CoCreateGuid@ole32.dll stdcall';

function GetTickCount: DWORD; external 'GetTickCount@kernel32.dll stdcall';

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
		Result := true
	else
		Result := false;
end;

function SetLanguage(Param: String): string;
begin
  if isRussian then
    Result := 'English'
  else
    Result := ExpandConstant('{language}');
end;

function SetLocale(Param: String): string;
var
  language: String;
begin
  language := ExpandConstant('{language}');
  case language of
    'Chinese': Result := 'zh_Hans';
    'Dutch': Result :=  'nl';
    'English': Result := 'en_US';
    'French': Result := 'fr_FR';
    'German': Result := 'de_DE';
    'Italian': Result := 'it_IT';
    'Japanese': Result := 'ja_JP';
    'Korean': Result := 'ko_KR';
    'Polish': Result := 'pl_PL';
    'Russian': Result := 'en_US';
    'Spanish': Result := 'es_ES';
    'Swedish': Result := 'sv_SE';
    'Thai': Result := 'th_TH';
    else Result := 'en_US';
  end
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

function GenerateKey: String;
var
Key, TmpFileName: String;
ExecStdout: TArrayOfString;
ResultCode: Integer;
begin
  Key := GetGuid
  TmpFileName := ExpandConstant('{tmp}') + '\drive_serial.txt';
  ExtractTemporaryFile('smartctl.exe');
  Exec(ExpandConstant('{cmd}'), '/C ' + ExpandConstant('{tmp}') + '/smartctl.exe -i /dev/sda > "' + TmpFileName + '"', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
  if LoadStringsFromFile(TmpFileName, ExecStdout) then
    try
      TryGetValue(ExecStdout, 'Serial Number', Key);
    except
      Key := GetGuid;
    end;
  Result := Key;
end;