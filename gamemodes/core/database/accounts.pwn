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

#include <YSI_Coding\y_inline>
#include <YSI_Coding\y_hooks>

/*
	----------------
	Global Variables
	----------------
*/
new queryBuffer[2048];

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
    return 1;
}

/*
	---------------------
	Function Declarations
	---------------------
*/
SavePlayerStats(playerid)
{
    if(TempVars[playerid][LoggedIn] == true)
    {
        GetPlayerPos(playerid, PlayerInfo[playerid][pXPos], PlayerInfo[playerid][pYPos], PlayerInfo[playerid][pZPos]);
        GetPlayerFacingAngle(playerid, PlayerInfo[playerid][pAngle]);
        PlayerInfo[playerid][pInterior] = GetPlayerInterior(playerid);
        PlayerInfo[playerid][pWorld] = GetPlayerVirtualWorld(playerid);
        PlayerInfo[playerid][pLevel] = GetPlayerScore(playerid);
        PlayerInfo[playerid][pCash] = GetPlayerMoney(playerid);

        /*
            ------------
            PLAYER STATS
            ------------
        */
        UpdatePlayerInt(playerid, "level", PlayerInfo[playerid][pLevel]);
        UpdatePlayerInt(playerid, "cash", PlayerInfo[playerid][pCash]);
        UpdatePlayerInt(playerid, "interior", PlayerInfo[playerid][pInterior]);
        UpdatePlayerInt(playerid, "world", PlayerInfo[playerid][pWorld]);
        UpdatePlayerInt(playerid, "admin", PlayerInfo[playerid][pAdmin]);

        UpdatePlayerFloat(playerid, "XPos", PlayerInfo[playerid][pXPos]);
        UpdatePlayerFloat(playerid, "YPos", PlayerInfo[playerid][pYPos]);
        UpdatePlayerFloat(playerid, "ZPos", PlayerInfo[playerid][pZPos]);
        /*
            ----------------
            PLAYER INVENTORY
            ----------------
        */
        UpdatePlayerInt(playerid, "components", PlayerInfo[playerid][pComponents]);
        UpdatePlayerInt(playerid, "marijuana", PlayerInfo[playerid][pMarijuana]);
        UpdatePlayerInt(playerid, "meth", PlayerInfo[playerid][pMeth]);
        UpdatePlayerInt(playerid, "opium", PlayerInfo[playerid][pOpium]);
        UpdatePlayerInt(playerid, "mushroom", PlayerInfo[playerid][pMushroom]);
        UpdatePlayerInt(playerid, "crack", PlayerInfo[playerid][pCrack]);
    }
    return 1;
}

UpdatePlayerInt(playerid, const field[], value) 
{
    mysql_format(mysql, queryBuffer, sizeof(queryBuffer), "UPDATE `players` SET `%s` = '%d' WHERE `id` = %d", field, value, PlayerInfo[playerid][pID]);
    mysql_tquery(mysql, queryBuffer);
    return 1;
}
UpdatePlayerFloat(playerid, const field[], Float:value) 
{
    mysql_format(mysql, queryBuffer, sizeof(queryBuffer), "UPDATE `players` SET `%s` = '%f' WHERE `id` = %d", field, value, PlayerInfo[playerid][pID]);
    mysql_tquery(mysql, queryBuffer);
    return 1;
}
stock UpdatePlayerString(playerid, const field[], value)  // - Stocked for now
{
    mysql_format(mysql, queryBuffer, sizeof(queryBuffer), "UPDATE `players` SET `%s` = '%e' WHERE `id` = %d", field, value, PlayerInfo[playerid][pID]);
    mysql_tquery(mysql, queryBuffer);
    return 1;
}

CheckPlayerAccount(playerid)
{
    inline AccountCheck()
    {
        if(cache_num_rows())
        {
            inline LoadPlayer()
            {
                if(cache_num_rows())
                {
                    cache_get_value_name_int(0, "id", PlayerInfo[playerid][pID]);
                    cache_get_value_name_int(0, "level", PlayerInfo[playerid][pLevel]);
                    cache_get_value_name_int(0, "banned", PlayerInfo[playerid][pBanned]);
                    cache_get_value_name_int(0, "cash", PlayerInfo[playerid][pCash]);
                    cache_get_value_name_int(0, "interior", PlayerInfo[playerid][pInterior]);
                    cache_get_value_name_int(0, "world", PlayerInfo[playerid][pWorld]);
                    cache_get_value_name_float(0, "XPos", PlayerInfo[playerid][pXPos]);
                    cache_get_value_name_float(0, "YPos", PlayerInfo[playerid][pYPos]);
                    cache_get_value_name_float(0, "ZPos", PlayerInfo[playerid][pZPos]);
                    cache_get_value_name_int(0, "components", PlayerInfo[playerid][pComponents]);
                    cache_get_value_name_int(0, "marijuana", PlayerInfo[playerid][pMarijuana]);
                    cache_get_value_name_int(0, "meth", PlayerInfo[playerid][pMeth]);
                    cache_get_value_name_int(0, "opium", PlayerInfo[playerid][pOpium]);
                    cache_get_value_name_int(0, "mushroom", PlayerInfo[playerid][pMushroom]);
                    cache_get_value_name_int(0, "crack", PlayerInfo[playerid][pCrack]);
                }
            }
            MySQL_TQueryInline(mysql, using inline LoadPlayer, "SELECT * FROM `players` WHERE `username` = '%e'", GetPlayerNameEx(playerid));
            ShowLoginDialog(playerid);
        } 
        else
        {
            ShowRegisterDialog(playerid);
            return 1;
        }
    }
    MySQL_TQueryInline(mysql, using inline AccountCheck, "SELECT * FROM players WHERE username = '%e'", GetPlayerNameEx(playerid));
    return 1;
}