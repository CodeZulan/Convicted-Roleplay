/********************************************************************************
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
*	core/admin/restart.pwn - This module is for the Restart/GMX System
********************************************************************************/

#include <YSI_Data\y_iterate>

CMD:restartserver(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 6)
    {
        foreach(new i : Player)
        {
            SavePlayerStats(i);
        }
        SendClientMessageToAll(COLOR_ORANGE, "[WARNING]: "COL_AZURE"Server is restarting, Saving Player Accounts...");
    }
    else
    {
        SendClientMessage(playerid, COLOR_RED, "[ERROR]: "COL_AZURE"You don't have admin powers to use this command!");
        return 1;
    }
    return 1;
}
alias:restartserver("gmx", "restartgm", "restart");