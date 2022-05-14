[Code]

function isRussian: boolean;    
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
    'Berlarusian': Result := 'be';
    'English': Result := 'en_US';
    'Dutch': Result := 'nl';
    'French': Result := 'fr_FR';
    'German': Result := 'de_DE';
    'Japanese': Result := 'ja_JP';
    'Polish': Result := 'pl_PL';
    'Spanish': Result := 'es_ES';
    'Swedish': Result := 'sv_SE';
    'Vietnamese': Result := 'vi_VN';
    else Result := 'en_US';
  end
end;