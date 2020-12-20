/****************************************************************************************
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
*	core/server/heartbeat.pwn - This module is for the heartbeat of the server, timers etc.
******************************************************************************************/

#include <YSI_Coding\y_timers>

task heartbeat[600000]() 
{
    new randomMessage = random(10);
    switch(randomMessage)
    {
        case 0:
            SendClientMessageToAll(COLOR_FUCHSIA, "[NOTICE]: "COL_AZURE"Don't forget to add this server to your favorites <3.");
        case 1:
            SendClientMessageToAll(COLOR_FUCHSIA, "[NOTICE]: "COL_AZURE"Did you know we have a discord server? join now at \"Discord.io/ConvictedRoleplay\".");
        case 2:
            SendClientMessageToAll(COLOR_FUCHSIA, "[NOTICE]: "COL_AZURE"Did you know you can earn incentives just by reporting bugs? Report your bugs at the forums, \"https://convictedrp.com/forums\"");
        case 3:
            SendClientMessageToAll(COLOR_FUCHSIA, "[NOTICE]: "COL_AZURE"Did you know you can get a shelter inside the bunkers? You just have to pay though.");
        default:
            SendClientMessageToAll(COLOR_FUCHSIA, "[NOTICE]: "COL_AZURE"Convicted Roleplay - Prison Themed Roleplay!");
    }
}

ptask AutoSave[10000](playerid) 
{
    SavePlayerStats(playerid);
}