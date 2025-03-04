[Code]

function IsRunningUnderWine: Boolean;
begin
  if RegKeyExists(HKLM, 'SOFTWARE\Wine') then
    Result := True
  else
    Result := False;
end;

function IsWin81OrBelow: Boolean;
var
  Version: TWindowsVersion;
begin
  GetWindowsVersionEx(Version);
  Result := (Version.Major < 10); // Windows 10 is 10.0, so everything below 10 is 8.1 or lower
end;

procedure DirectoryCopy(SourcePath, DestPath: string);
var
  FindRec: TFindRec;
  SourceFilePath: string;
  DestFilePath: string;
begin
  if FindFirst(SourcePath + '\*', FindRec) then
  begin
    try
      repeat
        if (FindRec.Name <> '.') and (FindRec.Name <> '..') then
        begin
          SourceFilePath := SourcePath + '\' + FindRec.Name;
          DestFilePath := DestPath + '\' + FindRec.Name;
          if FindRec.Attributes and FILE_ATTRIBUTE_DIRECTORY = 0 then
          begin
            if CopyFile(SourceFilePath, DestFilePath, False) then
            begin
              Log(Format('Copied %s to %s', [SourceFilePath, DestFilePath]));
            end
              else
            begin
              Log(Format('Failed to copy %s to %s', [
                SourceFilePath, DestFilePath]));
            end;
          end
            else
          begin
            if DirExists(DestFilePath) or CreateDir(DestFilePath) then
            begin
              Log(Format('Created %s', [DestFilePath]));
              DirectoryCopy(SourceFilePath, DestFilePath);
            end
              else
            begin
              Log(Format('Failed to create %s', [DestFilePath]));
            end;
          end;
        end;
      until not FindNext(FindRec);
    finally
      FindClose(FindRec);
    end;
  end
    else
  begin
    Log(Format('Failed to list %s', [SourcePath]));
  end;
end;