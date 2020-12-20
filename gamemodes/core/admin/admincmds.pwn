/******************************************************************************
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
*
*	Module:
*	core/admin/admincmds.pwn - This module is for admin commands.
*******************************************************************************/

#include <YSI_Coding/y_hooks>
#include <YSI_Coding/y_timers>

CMD:jetpack(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 1)
    {
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USEJETPACK);
        SendClientMessage(playerid, COLOR_ORANGERED, "[ADMIN]: "COL_AZURE"You have conjured a jetpack and equipped it to your back.");
    }
    else
    {
        SendClientMessage(playerid, COLOR_RED, "[ERROR]: "COL_AZURE"You don't have admin powers to use this command!");
        return 1;
    }
    return 1;
}
alias:jetpack("jp", "jpack", "jetp", "jetpacc");

CMD:mypos(playerid, params[])
{
    new Float:Position[3], Float:Angle;
    if(PlayerInfo[playerid][pAdmin] >= 1)
    {
        GetPlayerPos(playerid, Position[0], Position[1], Position[2]);
        GetPlayerFacingAngle(playerid, Angle);

        SendClientMessageEx(playerid, COLOR_ORANGERED, "[ADMIN]: "COL_WHITE"Your Position: [X: %f Y: %f Z: %f A: %f | Interior: %d World: %d]", Position[0], Position[1], Position[2], Angle, GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid));
    }
    else
    {
        SendClientMessage(playerid, COLOR_RED, "[ERROR]: "COL_AZURE"You don't have admin powers to use this command!");
        return 1;
    }
    return 1;
}
alias:mypos("myangle", "whereami", "pos", "position");

CMD:kick(playerid, params[])
{
    new targetid, reason[64];
    if(PlayerInfo[playerid][pAdmin] >= 1)
    {
        if(sscanf(params, "us[64]", targetid, reason))
        {
            SendClientMessage(playerid, COLOR_GOLD, "[USAGE]: "COL_AZURE"/kick [targetid] [reason].");
            SendClientMessage(playerid, COLOR_AQUAMARINE, "[TIP]: "COL_AZURE"This command can be used to kick people out of the server, but kicked players can still join back in.");
            return 1;
        }
        SendClientMessageToAllEx(COLOR_ORANGERED, "[ADMIN]: "COL_AZURE"%s has been kicked from the server for %s.", GetPlayerNameEx(targetid), reason);
        defer DelayedKick(playerid);
    }
    else
    {
        SendClientMessage(playerid, COLOR_RED, "[ERROR]: "COL_AZURE"You don't have admin powers to use this command!");
        return 1;
    }
    return 1;
}

CMD:ban(playerid, params[])
{
    new targetid, reason[64];
    if(PlayerInfo[playerid][pAdmin] >= 1)
    {
        if(sscanf(params, "us[64]", targetid, reason))
        {
            SendClientMessage(playerid, COLOR_GOLD, "[USAGE]: "COL_AZURE"/kick [targetid] [reason].");
            SendClientMessage(playerid, COLOR_AQUAMARINE, "[TIP]: "COL_AZURE"This command can be used to kick people out of the server, but kicked players can still join back in.");
            return 1;
        }
        SendClientMessageToAllEx(COLOR_ORANGERED, "[ADMIN]: "COL_AZURE"%s has been banned from the server for %s.", GetPlayerNameEx(targetid), reason);
        PlayerInfo[playerid][pBanned] = 1;
        defer DelayedKick(playerid);
    }
    else
    {
        SendClientMessage(playerid, COLOR_RED, "[ERROR]: "COL_AZURE"You don't have admin powers to use this command!");
        return 1;
    }
    return 1;
}
alias:ban("banish");

timer DelayedKick[500](playerid)
{
	Kick(playerid);
}

CMD:givemoney(playerid, params[])
{
    GivePlayerMoney(playerid, 5000);
    return 1;
}

CMD:setadmin(playerid, params[])
{
    PlayerInfo[playerid][pAdmin] = 7;
    return 1;
}

