[Code]
const
  HexDigits = '0123456789ABCDEF';
  
function CoCreateGuid(var Guid:TGuid):integer; external 'CoCreateGuid@ole32.dll stdcall';

function GetTickCount: DWORD; external 'GetTickCount@kernel32.dll stdcall';
  
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

function GetGuid: string;
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
  Key := GetGuid;
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