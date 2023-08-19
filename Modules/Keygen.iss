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
  if CoCreateGuid(Guid)=0 then
  begin
    Result:='{'+IntToHex(Guid.D1,8)+'-'+
            IntToHex(Guid.D2,4)+'-'+
            IntToHex(Guid.D3,4)+'-'+
            IntToHex(Guid.D4[0],2)+IntToHex(Guid.D4[1],2)+'-'+
            IntToHex(Guid.D4[2],2)+IntToHex(Guid.D4[3],2)+
            IntToHex(Guid.D4[4],2)+IntToHex(Guid.D4[5],2)+
            IntToHex(Guid.D4[6],2)+IntToHex(Guid.D4[7],2)+
            '}';
  end
  else
    Result:=GetDateTimeString('dd/mm/yyyy hh:nn:ss', '-', ':');
end;

function WbemQuery(WbemServices: Variant; Query: string): Variant;
var
  WbemObjectSet: Variant;
begin
  Result := Null;
  WbemObjectSet := WbemServices.ExecQuery(Query);
  if not VarIsNull(WbemObjectSet) and (WbemObjectSet.Count > 0) then
  begin
    Result := WbemObjectSet.ItemIndex(0);
  end;
end;

function GenerateKey: String;
var
  QueryResult, WbemLocator, WbemServices: Variant;
  Query: string;
begin
  Result := GetGuid;

  WbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
  WbemServices := WbemLocator.ConnectServer('.', 'root\CIMV2');

  Query := 'SELECT SerialNumber FROM Win32_DiskDrive WHERE DeviceID = "\\\\.\\PHYSICALDRIVE0"';
  QueryResult := WbemQuery(WbemServices, Query);
  if not VarIsNull(QueryResult) then
  begin
    Log(Format('Motherboard serial number is [%s]', [QueryResult.SerialNumber]));
    Result := QueryResult.SerialNumber;
  end
    else
  begin
    Log('Cannot get physical drive serial number');
    Result := GetGuid;
  end;
end;