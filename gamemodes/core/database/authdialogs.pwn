/**********************************************************************************************
*	Convicted Roleplay -- A Prison Themed Roleplay Gamemode brought to you by,
*
*	CodeZulan - Project Leader & Developer
*	Ole - Lead Mapper & Organizer
*	Devi - Developer
*
*	Special thanks to,
*	Y_Less - YSI Library
*	Katursis - Pawn.CMD
*	pBlueG - Mysql Plugin
*	Sreyas-Sreelal - Bcrypt Plugin
*
*	Module:
*	core/database/accounts.pwn - This module is for the login and register dialogs, inlined.
*************************************************************************************************/

/*
	---------------------
	Function Declarations
	---------------------
*/
ShowRegisterDialog(playerid)
{
    new string[1024], string1[256];
    strcat(string, ""COL_ORANGE"Convicted Roleplay Account Registration:\n");
    format(string1, sizeof(string1),""COL_BEIGE"Welcome to "COL_YELLOW"Convicted Roleplay "COL_AQUA"%s, "COL_BEIGE"You have been prisoned for multiple accounts of murder!\n", GetPlayerNameEx(playerid));
    strcat(string, string1);
    strcat(string, ""COL_BEIGE"You will be serving maximum prison time which is 215 years, we are sure you will live your life there forever.\n");
    strcat(string, ""COL_BEIGE"But don't you worry, life there isn't that boring as you may think, you can socialized with other prisoners and maybe create your own group!\n");
    strcat(string, ""COL_BEIGE"Enough with the chit-chat time to enter your unique password so that you can access the prison facilities.\n\n");
    strcat(string, ""COL_BEIGE"Enter a strong password:");

    inline const RegisterDialog(pid, dialogid, response, listitem, string:inputtext[])
    {
        #pragma unused listitem, response, dialogid, pid

        if(response)
        {
            if(strlen(inputtext) > 16 || strlen(inputtext) < 4)
            {
                SendClientMessage(playerid, COLOR_RED, "[ERROR]: "COL_AZURE"Please enter a password with a length of 4-16 characters.");
                ShowRegisterDialog(playerid);
                return 1;
            }
            inline const OnBcryptHash(string:result[])
            {
                format(PlayerInfo[playerid][pPassword], 64, result);

                inline CreatePlayerRow()
                {
                    PlayerInfo[playerid][pID] = cache_insert_id();
                    ShowLoginDialog(playerid);
                }
                MySQL_TQueryInline(mysql, using inline CreatePlayerRow, "INSERT INTO players (username, password, level, cash, XPos, YPos, ZPos) VALUES ('%e', '%e', %d, %d, %f, %f, %f)", \
                GetPlayerNameEx(playerid), PlayerInfo[playerid][pPassword], PlayerInfo[playerid][pLevel], PlayerInfo[playerid][pBanned], PlayerInfo[playerid][pCash], PlayerInfo[playerid][pXPos], PlayerInfo[playerid][pYPos], PlayerInfo[playerid][pZPos]);
            }
            BCrypt_HashInline(inputtext, 12, using inline OnBcryptHash);
        }
        else
        {
            defer DelayedKick(playerid);
            return 1;
        }
    }

    Dialog_ShowCallback(playerid, using inline RegisterDialog, DIALOG_STYLE_PASSWORD, "Account Registration", string, "Register", "Exit");
    return 1;
}

ShowLoginDialog(playerid)
{
    new string[1024], string1[256];
    strcat(string, ""COL_ORANGE"Convicted Roleplay Account Registration:\n");
    format(string1, sizeof(string1),""COL_BEIGE"Welcome back to "COL_YELLOW"Convicted Roleplay "COL_AQUA"%s!\n", GetPlayerNameEx(playerid));
    strcat(string, string1);
    strcat(string, ""COL_BEIGE"Please enter your password to log in.\n");

    if(TempVars[playerid][LoginAttempt] != 0 && TempVars[playerid][LoginAttempt] != 5)
    {
        format(string1, sizeof(string1), ""COL_BEIGE"You have %d, attempts left...\n", TempVars[playerid][LoginAttempt]);
        strcat(string, string1);
    }

    inline const LoginDialog(pid, dialogid, response, listitem, string:inputtext[])
    {
        #pragma unused listitem, response, dialogid, pid

        new RetrievedPass[64];
        inline LoadPassword()
        {
            cache_get_value_name(0, "password", RetrievedPass);
            

            inline CheckPassword(bool:success)
            {
                if(success)
                {
                    TogglePlayerSpectating(playerid, false);
                    SetSpawnInfo(playerid, 0, 2, PlayerInfo[playerid][pXPos], PlayerInfo[playerid][pYPos], PlayerInfo[playerid][pZPos], PlayerInfo[playerid][pAngle], 24, 99999, 27, 99999, 31, 999999);
                    SpawnPlayer(playerid);

                    SetPlayerInterior(playerid, PlayerInfo[playerid][pInterior]);
                    SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][pWorld]);
                    ResetPlayerMoney(playerid); GivePlayerMoney(playerid, PlayerInfo[playerid][pCash]);
                    SetPlayerScore(playerid, PlayerInfo[playerid][pLevel]);

                    TempVars[playerid][LoggedIn] = true;
                }
                else
                {
                    TempVars[playerid][LoginAttempt]--;
                    if(TempVars[playerid][LoginAttempt] != 0)
                    {
                        ShowLoginDialog(playerid);
                    }
                    else
                    {
                        TempVars[playerid][LoginAttempt] = 5;
                        defer DelayedKick(playerid);
                        SendClientMessage(playerid, COLOR_ORANGE, "[WARNING]: "COL_AZURE"You have been kicked for attempting to login more than 5 times.");
                    }
                }
            }
            BCrypt_CheckInline(inputtext, RetrievedPass, using inline CheckPassword);
        }
        MySQL_TQueryInline(mysql, using inline LoadPassword, "SELECT `password` FROM `players` WHERE `username` = '%e'", GetPlayerNameEx(playerid));
    }
    Dialog_ShowCallback(playerid, using inline LoginDialog, DIALOG_STYLE_PASSWORD, "Account Login", string, "Login", "Exit");
    return 1;
}