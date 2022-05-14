[Code]

procedure BannerClick(Sender: TObject);
var
  ErrorCode:integer;
begin
  ShellExecAsOriginalUser('open', 'https://discord.gg/hU878P4', '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode);
end;

procedure DiscordLogoOnClick(Sender: TObject);
var
  ErrorCode: Integer;
begin
  ShellExecAsOriginalUser('open', 'https://discord.gg/hU878P4', '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode);
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

procedure DiscordLogoInitializeWizard;
var
  DiscordLogoFileName: String;
  DiscordLogo: TBitmapImage;
  BevelTop: Integer;
begin
  DiscordLogoFileName := ExpandConstant('{tmp}\Discord-Logo-Color.bmp');
  ExtractTemporaryFile(ExtractFileName(DiscordLogoFileName));
  DiscordLogo := TBitmapImage.Create(WizardForm);
  DiscordLogo.AutoSize := True;
  DiscordLogo.Bitmap.LoadFromFile(DiscordLogoFileName);
  BevelTop := WizardForm.Bevel.Top;
  DiscordLogo.Top := BevelTop + (WizardForm.ClientHeight - BevelTop - DiscordLogo.Bitmap.Height) div 2;
  DiscordLogo.Left := DiscordLogo.Top - BevelTop;
  DiscordLogo.Cursor := crHand;
  DiscordLogo.OnClick := @DiscordLogoOnClick;
  DiscordLogo.Parent := WizardForm;
end;