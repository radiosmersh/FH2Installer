[Code]
var
ShortVersion: string;

function GetFH2Version(Param: string): string;
var
  WinHttpReq: Variant;
  ResponseText: string;
begin
  if ShortVersion = '' then
  begin
    WinHttpReq := CreateOleObject('WinHttp.WinHttpRequest.5.1');
    WinHttpReq.Open('GET', 'https://playfh2.net/version.txt', False);
    WinHttpReq.Send('');
    if WinHttpReq.Status <> 200 then
    begin
      ShortVersion := '2';
    end
      else
    begin
      ResponseText := WinHttpReq.ResponseText;
      ShortVersion := Trim(ResponseText);
      Log('Retrieved latest FH2 version: ' + ShortVersion);
    end;
  end;
  Result := ShortVersion;
end;

function GetFH2VersionLocal(Param: string): string;
begin
  Result := ShortVersion;
end;

procedure BackupBF2RegistryEntries;
var 
ResultCode: integer;
RegCommandParams, Filename: String;
begin
  if RegKeyExists(HKLM32, 'Software\Electronic Arts\EA Games\Battlefield 2') then
    if MsgBox(ExpandConstant('{cm:BackupBF2RegistryEntries}'), mbConfirmation, MB_YESNO or MB_DEFBUTTON2) = IDYES then
      begin
        Filename := '';
        if GetSaveFileName('{cm:SaveRegistryFile}', Filename, '', 'Registry Files (*.reg)', 'reg') then
          RegCommandParams := 'export "HKLM\Software\Electronic Arts\EA Games\Battlefield 2" ' + '"' + Filename + '"' +  ' /reg:32';
          if Exec('reg', RegCommandParams, '', SW_SHOW, ewWaitUntilTerminated, ResultCode) then
            MsgBox(FmtMessage(CustomMessage('FileSaved'), [Filename]), mbInformation, MB_OK)
          else
            MsgBox(ExpandConstant('{cm:FileNotSaved}'), mbError, MB_OK);  
      end;
end;
