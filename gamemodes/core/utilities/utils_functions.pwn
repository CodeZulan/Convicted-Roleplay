GetPlayerNameEx(playerid)
{
    new playername[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, playername);
    return playername;
}

ShowRegisterDialog(playerid)
{
    new string[1024], string1[256];
    strcat(string, ""COL_ORANGE"Convicted Roleplay Account Registration:\n");
    format(string1, sizeof(string1),""COL_BEIGE"Welcome to "COL_YELLOW"Convicted Roleplay "COL_AQUA"%s, "COL_BEIGE"You have been prisoned for multiple accounts of murder!\n", GetPlayerNameEx(playerid));
    strcat(string, string1);
    strcat(string, "You will be serving maximum prison time which is 215 years, we are sure you will live your life there forever.\n");
    strcat(string, "But don't you worry, life there isn't that boring as you may think, you can socialized with other prisoners and maybe create your own group!\n");
    strcat(string, "Enough with the chit-chat time to enter your unique password so that you can access the prison facilities.\n\n");
    strcat(string, "Enter a strong password:");

    ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Account Registration", string, "Select", "Cancel");
    return 1;
}

ShowLoginDialog(playerid)
{
    new string[1024], string1[256];
    strcat(string, ""COL_ORANGE"Convicted Roleplay Account Registration:\n");
    format(string1, sizeof(string1),""COL_BEIGE"Welcome back to "COL_YELLOW"Convicted Roleplay "COL_AQUA"%s!", GetPlayerNameEx(playerid));
    strcat(string, string1);
    strcat(string, "Please enter your password to log in.\n");

    ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Account Login", string, "Select", "Cancel");
    return 1;
}