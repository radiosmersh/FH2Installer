{$mode objfpc}
{$h+}

program main;

uses CustApp,
     Classes,
     Crypt;

const
  ShortOpts = 'e:d:';
  LongOpts : Array[1..2] of String = ('encrypt:','decrypt:');

type
  TMyApplication = Class(TCustomApplication)
    procedure DoRun ; override;
  end;

procedure TMyApplication.DoRun;

var
  i : Integer;
  OptStr : String;
  Opts, FN, Args : TStrings;

begin
  if (ParamCount > 0) then
    begin
      Opts := TStringList.Create;
      Args := TStringList.Create;
      FN := TStringList.Create;
      try
        For i:=1 to 2 do
          Opts.Add(LongOpts[i]);
            
        OptStr := CheckOptions(ShortOpts, Opts, Args, FN);
        
        if (HasOption('e','encrypt')) then begin
          Writeln(GetOptionValue('e', 'encrypt'));
          Writeln(EncryptDataBF2(GetOptionValue('e', 'encrypt')))
        end
        else
          if (HasOption('d','decrypt')) then
            Writeln(DecryptDataBF2(GetOptionValue('d', 'decrypt')));
              
        Opts.Clear;
      finally
          Opts.Free;
          Args.Free;
          FN.Free;
      end;
    end;
  Terminate;
end;

var
  BF2Crypt : TMyApplication;

begin
  BF2Crypt := TMyApplication.Create(nil);
  BF2Crypt.Initialize;
  BF2Crypt.Title:='BF2 key encryptor/decryptor';
  BF2Crypt.Run;
  BF2Crypt.Free;
end.