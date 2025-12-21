[Code]

type
    TKeyboardInput = record
        Itype: DWORD;    
        wVk: WORD;
        wScan: WORD;
        dwFlags: DWORD;
        time: DWORD;
        dwExtraInfo: DWORD;
    end;

function SendInput(nInputs: UINT; pInputs: TKeyboardInput;
    cbSize: Integer): UINT; 
    external 'SendInput@user32.dll stdcall';

function SendKeyPressed(KeyCode: Word): Boolean;
var
    InputDown: TKeyboardInput;
    InputUp: TKeyboardInput;
begin
    Result := False;

    InputDown.Itype := 1;
    InputDown.wVk := KeyCode;
    InputDown.wScan := 0;
    InputDown.time := 0;
    InputDown.dwFlags := 0;

    InputUp.Itype := 1;
    InputUp.wVk := KeyCode;
    InputUp.wScan := 0;
    InputUp.time := 0;
    InputUp.dwFlags := 2;

    Result := SendInput(1, InputUp, SizeOf(InputUp)) = 1;
end;