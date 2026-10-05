[Code]

// BF2 CD-key generation and encryption, implementation taken from BF2KeyMan
// https://github.com/art567/bf2keyman

function GetTickCount: DWORD; external 'GetTickCount@kernel32.dll stdcall';

const
  BF2KeySize      = 20;
  BF2KeyIdentHash = 'x9392';
  BF2KeyDescr     = 'This is the description string.';
  BF2KeyChars     = '0123456789ABCDEFGHJKLMNPQRSTUVWXYZ';
  BF2KeyHexLower  = '0123456789abcdef';
  BF2HexBufMax    = 512;

const
  CRYPTPROTECT_UI_FORBIDDEN = $1;

type
  BF2DataBlob = record
    cbData: DWORD;    // blob length in bytes
    pbData: DWORD;    // pointer to the blob bytes
  end;

  BF2KeyBuf = array[0..31] of Byte;    // 20-char key + trailing #0
  BF2HexBuf = array[0..511] of Byte;

var
  BF2RndSeed: DWORD;

function BF2GenerateKey: String;
var
  i, n: Integer;
begin
  BF2RndSeed := GetTickCount;
  Result := '';
  for i := 1 to BF2KeySize do
  begin
    BF2RndSeed := BF2RndSeed * 1664525 + 1013904223;
    n := (BF2RndSeed shr 16) mod 34;
    Result := Result + BF2KeyChars[n + 1];
  end;
end;

// RtlMoveMemory wrappers for calling through static array params
procedure BF2MoveToAddr(Destination: DWORD; var KeyData: BF2KeyBuf; Count: DWORD);
  external 'RtlMoveMemory@kernel32.dll stdcall';

procedure BF2MoveFromAddr(var BlobData: BF2HexBuf; Source: DWORD; Count: DWORD);
  external 'RtlMoveMemory@kernel32.dll stdcall';

function LocalAlloc(uFlags: UINT; dwBytes: DWORD): DWORD;
  external 'LocalAlloc@kernel32.dll stdcall';

function LocalFree(hMem: DWORD): DWORD;
  external 'LocalFree@kernel32.dll stdcall';

procedure BF2KeyFail(Msg: String);
begin
  Log('BF2 key: ' + Msg);
  RaiseException(ExpandConstant('{cm:FailedToPrepareBF2Key}') + ' ' + Msg);
end;

function CryptProtectData(var pDataIn: BF2DataBlob; szDataDescr: String;
  pOptionalEntropy: DWORD; pvReserved: DWORD; pPromptStruct: DWORD;
  dwFlags: DWORD; var pDataOut: BF2DataBlob): DWORD;
  external 'CryptProtectData@crypt32.dll stdcall';

function BF2KeyHash(AKey: String): String;
var
  DataIn: BF2DataBlob;
  DataOut: BF2DataBlob;
  KeyBuf: BF2KeyBuf;
  HexBuf: BF2HexBuf;
  KeyPtr: DWORD;
  i, cb, B: Integer;
  Hash: String;
begin
  Result := '';
  if Length(AKey) < BF2KeySize then
    BF2KeyFail('bad key length');

  { the key is passed with a trailing #0 byte, like in bf2keyman }
  for i := 1 to BF2KeySize do
    KeyBuf[i - 1] := Ord(AKey[i]);
  KeyBuf[BF2KeySize] := 0;
  cb := BF2KeySize + 1;

  KeyPtr := LocalAlloc(0, cb);
  if KeyPtr = 0 then
    BF2KeyFail('LocalAlloc failed');
  try
    BF2MoveToAddr(KeyPtr, KeyBuf, cb);
    DataIn.cbData := cb;
    DataIn.pbData := KeyPtr;
    if (CryptProtectData(DataIn, BF2KeyDescr, 0, 0, 0,
         CRYPTPROTECT_UI_FORBIDDEN, DataOut) = 0) or (DataOut.cbData = 0) then
      BF2KeyFail('CryptProtectData failed');

    cb := DataOut.cbData;
    if cb > BF2HexBufMax then
      BF2KeyFail(Format('blob too large (%d bytes)', [cb]));
    BF2MoveFromAddr(HexBuf, DataOut.pbData, cb);
    LocalFree(DataOut.pbData);
  finally
    LocalFree(KeyPtr);
  end;

  { hex-encode the blob }
  i := 0;
  while i < cb do
  begin
    B := HexBuf[i];
    Result := Result + BF2KeyHexLower[(B shr 4) + 1] +
      BF2KeyHexLower[(B and 15) + 1];
    Inc(i);
  end;

  Hash := Result;
  Result := BF2KeyIdentHash + Hash;
  Log('BF2 key hash: ' + Result);
end;
