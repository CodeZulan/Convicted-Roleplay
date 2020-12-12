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
*	core/database/accounts.pwn - This module is for handling the MySQL Authentication for players
*************************************************************************************************/

/*
	-------------------
	Dependency includes
	-------------------
*/
#include <samp_bcrypt>
#include <YSI_Coding\y_hooks>
#include <YSI_Coding\y_inline>

/*
	----------------
	Global Variables
	----------------
*/
new queryBuffer[1024];

new PlayerInfo[MAX_PLAYER_NAME][pInfo];

/*
	--------------
	Callback Hooks
	--------------
*/
hook OnPlayerConnect(playerid)    // - OnPlayerConnect callback hook
{
    TogglePlayerSpectating(playerid, true);
    CheckPlayerAccount(playerid);
    return 1;
}

hook OnPlayerDisconnect(playerid, reason)    // - OnPlayerDisconnect callback hook
{
    SavePlayerStats(playerid);
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])    // - OnDialogResponse callback hook
{
    switch(dialogid)
    {
        case DIALOG_REGISTER:
        {
            if(response)
            {
                if(strlen(inputtext) > 16 || strlen(inputtext) < 4)
                {
                    SendClientMessage(playerid, COLOR_CRIMSON, "[ERROR]: "COL_AZURE"Please enter a password with a length of 4-16 characters.");
                    ShowRegisterDialog(playerid);
                    return 1;
                }
                inline const OnBcryptHash(string:result[])
                {
                    format(PlayerInfo[playerid][pPassword], 64, result);

                    inline CreatePlayerRow()
                    {
                        PlayerInfo[playerid][pID] = cache_insert_id();
                        SetSpawnInfo(playerid, 0, 2, 162.0284, 1930.5018, 33.8984, 180.0, 24, 99999, 27, 99999, 31, 999999);
                        SpawnPlayer(playerid);
                        TogglePlayerSpectating(playerid, false);
                    }
                    MySQL_TQueryInline(mysql, using inline CreatePlayerRow, "INSERT INTO players (username, password, level, cash, XPos, YPos, ZPos) VALUES ('%e', '%e', %d, %d, %f, %f, %f)", GetPlayerNameEx(playerid), PlayerInfo[playerid][pPassword], GetPlayerScore(playerid), GetPlayerMoney(playerid), PlayerInfo[playerid][pXPos], PlayerInfo[playerid][pYPos], PlayerInfo[playerid][pZPos]);
                    
                }
                BCrypt_HashInline(inputtext, 12, using inline OnBcryptHash);
            }
            else
            {
                Kick(playerid);
                return 1;
            }
        }
        case DIALOG_LOGIN:
        {
            if(response)
            {
                LoadPlayerStats(playerid);

                inline CheckPassword(bool:success)
                {
                    if(success)
                    {
                        SetSpawnInfo(playerid, 0, 2, 162.0284, 1930.5018, 33.8984, 180.0, 24, 99999, 27, 99999, 31, 999999);
                        SpawnPlayer(playerid);
                        TogglePlayerSpectating(playerid, false);
                    }
                    else
                    {
                        Kick(playerid);
                    }
                }
                BCrypt_CheckInline(inputtext, PlayerInfo[playerid][pPassword], using inline CheckPassword);
            }
        }
    }
    return 1;
}

/*
	---------------------
	Function Declarations
	---------------------
*/
SavePlayerStats(playerid)
{
    GetPlayerPos(playerid, PlayerInfo[playerid][pXPos], PlayerInfo[playerid][pYPos], PlayerInfo[playerid][pZPos]);
    GetPlayerFacingAngle(playerid, PlayerInfo[playerid][pAngle]);
    PlayerInfo[playerid][pInterior] = GetPlayerInterior(playerid);
    PlayerInfo[playerid][pWorld] = GetPlayerVirtualWorld(playerid);
    PlayerInfo[playerid][pLevel] = GetPlayerScore(playerid);
    PlayerInfo[playerid][pCash] = GetPlayerMoney(playerid);

    mysql_format(mysql, queryBuffer, sizeof(queryBuffer), "UPDATE `players` SET `id`= %d,`username`= '%e', `password` = '%e',`level`= %d,`cash`= %d,`XPos`= %f,`YPos`= %f,`ZPos`= %f WHERE 1", PlayerInfo[playerid][pID], PlayerInfo[playerid][pPassword], GetPlayerNameEx(playerid), PlayerInfo[playerid][pLevel], PlayerInfo[playerid][pCash], PlayerInfo[playerid][pXPos], PlayerInfo[playerid][pYPos], PlayerInfo[playerid][pZPos]);
	mysql_tquery(mysql, queryBuffer);
    return 1;
}

LoadPlayerStats(playerid)
{
    inline LoadPlayer()
    {
        if(cache_num_rows())
        {
            cache_get_value_name(0, "password", PlayerInfo[playerid][pPassword]);
            cache_get_value_name_int(0, "level", PlayerInfo[playerid][pLevel]);
            cache_get_value_name_int(0, "cash", PlayerInfo[playerid][pCash]);
            cache_get_value_name_float(0, "XPos", PlayerInfo[playerid][pXPos]);
            cache_get_value_name_float(0, "YPos", PlayerInfo[playerid][pYPos]);
            cache_get_value_name_float(0, "ZPos", PlayerInfo[playerid][pZPos]);
        }
    }

    MySQL_TQueryInline(mysql, using inline LoadPlayer, "SELECT * FROM `players` WHERE `username` = '%e'", GetPlayerNameEx(playerid));
    return 1;
}

CheckPlayerAccount(playerid)
{
    inline AccountCheck()
    {
        if (cache_num_rows())
        {
            ShowLoginDialog(playerid);
        } 
        else
        {
            ShowRegisterDialog(playerid);
            return 1;
        }
    }
    MySQL_TQueryInline(mysql, using inline AccountCheck, "SELECT * FROM players WHERE id = '%i'", PlayerInfo[playerid][pID]);
    return 1;
}